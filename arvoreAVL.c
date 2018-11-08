#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int contador=0;

typedef struct no{

    int chave;
    struct no *esquerda, *direita;
    int bal;
} No;

typedef struct arvorebi{

    No* raiz;
    int qtd;

    int naoInicializada;
} ArvoreBi;

int inicializaArvoreBi(ArvoreBi *a){

    if(!a->naoInicializada){
        return 1;
    }
    a->naoInicializada=0;
    a->raiz=NULL;
    a->qtd=0;
    return 0;
}

int ArvoreBiVazia(ArvoreBi *a){

    if(a->raiz==NULL){
        return 1;
    }
    return 0;
}

int alturaNo(No *raiz){

    if(raiz==NULL){
        return -1;
    }

    if(alturaNo(raiz->esquerda)>alturaNo(raiz->direita)){
        return alturaNo(raiz->esquerda)+1;
    } else {
        return alturaNo(raiz->direita)+1;
    }
}

int calculaFB(No *raiz){
    return alturaNo(raiz->direita)-alturaNo(raiz->esquerda);
}


No* rotDireita(No* raiz){
    No *aux=raiz->esquerda;
    raiz->esquerda=aux->direita;
    aux->direita=raiz;
    return aux;
}

No* rotEsquerda(No* raiz){
    No* aux=raiz->direita;
    raiz->direita=aux->esquerda;
    aux->esquerda= raiz;
    return aux;
}

int balanceamento(No *raiz){
    if(raiz->bal==2){
        if(raiz->direita->bal==-1){
            raiz->direita=rotDireita(raiz->direita);
        }
        raiz=rotEsquerda(raiz);
    }
    if(raiz->bal==-2){
        if(raiz->esquerda->bal==1){
            raiz->esquerda=rotEsquerda(raiz->esquerda);
        }
        raiz=rotDireita(raiz);
    }
}

int insereRaiz(ArvoreBi *a, int valor){

    if(a->naoInicializada){
        printf("Arvore não inicializada\n");
        return -1;
    }
    if(!ArvoreBiVazia(a)){
        return -2;
    }
    No *novo=malloc(sizeof(No));
    novo->chave=valor;
    novo->esquerda=NULL;
    novo->direita=NULL;
    a->raiz=novo;
    a->qtd++;
    return 0;
}

No* inserir(No *raiz, int valor){
    if(valor > raiz->chave){
        if(raiz->direita==NULL){
            No* novo=malloc(sizeof(No));
            novo->chave=valor;
            novo->esquerda=NULL;
            novo->direita=NULL;
            raiz->bal=0;
            raiz->direita=novo;
            raiz->bal=calculaFB(raiz);
            return novo;
        } else{
            No *aux = inserir(raiz->direita, valor);
            if(aux!=NULL){
                raiz->bal=calculaFB(raiz);
            }
            return aux;
        }
    }
    if(valor < raiz->chave){
        if(raiz->esquerda==NULL){
            No *novo= malloc(sizeof(No));
            novo->chave=valor;
            novo->esquerda=NULL;
            novo->direita=NULL;
            raiz->bal=0;
            raiz->esquerda=novo;
            raiz->bal=calculaFB(raiz);
            return novo;
        } else{
            No *aux = inserir(raiz->esquerda, valor);
            if(aux!=NULL){
                raiz->bal=calculaFB(raiz);
            }
            return aux;
        }
    }
    return NULL;
}

int inserirArvore(ArvoreBi *a, int valor){
    if(a->naoInicializada){
        printf("Arvore não inicializada\n");
        return -1;
    }
    if(ArvoreBiVazia(a)){
        insereRaiz(a, valor);
        return 0;
    }
    if(inserir(a->raiz, valor)){
     return -1;
    }
    a->qtd++;
    return 0;
}

int busca(No *raiz, int valor){
    if(raiz==NULL){
        return 1;
    }
    if(raiz->chave==valor){
        return 0;
    }
    if(valor > raiz->chave){
        return busca(raiz->direita, valor);
    }
    if(valor < raiz->chave){
        return busca(raiz->esquerda, valor);
    }
}

No* removerNo(No *raiz, int valor){
    if(raiz->chave==valor){
        if(raiz->esquerda==NULL && raiz->direita==NULL){
            free(raiz);
            raiz=NULL;
            return raiz;
        }
    } else {
        No *aux=raiz;
        if(raiz->esquerda==NULL){
            raiz=raiz->direita;
        } else{
            if(raiz->esquerda=NULL){
                raiz=raiz->esquerda;
            } else{
                No *nav=raiz->esquerda;
                while(nav->direita!=NULL){
                    nav=nav->direita;
                }
                raiz->chave=nav->chave;
                return removerNo(nav, nav->chave);
                return raiz;
            }
        }
            free(aux);
            aux=NULL;
            return raiz;
    }
    if(valor>raiz->chave){
        return removerNo(raiz->direita,valor);
    } else {
        return removerNo(raiz->esquerda,valor);
    }
    return NULL;
}

int remover(ArvoreBi *a, int valor){
    if(a->naoInicializada){
        printf("Arvore não inicializada\n");
        return -1;
    }
    if(ArvoreBiVazia(a)){
        printf("Arvore vazia");
        return -2;
    }
    if(busca(a->raiz, valor)){
        printf("Numero inexistente na arvore");
        return -3;
    }
    if(a->raiz->chave==valor){
    a->raiz=removerNo(a->raiz,valor);
    }
    removerNo(a->raiz,valor);
    a->qtd--;
    return 0;
}

void imprimirPreOrdem(No *raiz){
    if(raiz==NULL){
        return;
    }
    printf("%d ", raiz->chave);
    imprimirPreOrdem(raiz->esquerda);
    imprimirPreOrdem(raiz->direita);
}

void imprimirEmOrdem(No *raiz){
    if(raiz==NULL){
        return;
    }
    imprimirEmOrdem(raiz->esquerda);
    printf("%d ", raiz->chave);
    imprimirEmOrdem(raiz->direita);
}

void imprimirPosOrdem(No *raiz){
    if(raiz==NULL){
        return;
    }
    imprimirPosOrdem(raiz->esquerda);
    imprimirPosOrdem(raiz->direita);
    printf("%d ", raiz->chave);

}

void contaNo(No *raiz){
    if(raiz==NULL){
        return;
    }
    contador++;
    contaNo(raiz->esquerda);
    contaNo(raiz->direita);
}

void main(){
    ArvoreBi *arvore=malloc(sizeof(ArvoreBi));
    inicializaArvoreBi(arvore);
    int i;
    srand(time(NULL));
    for(i=0;i<200;i++){
        inserirArvore(arvore, rand()%10000);
    }
    contaNo(arvore->raiz);
    printf("Nos %d\n", contador);
    printf("Raiz %d\n", arvore->raiz->chave);
    printf("Altura %d\n", alturaNo(arvore->raiz));
    printf("\n\nPre Ordem\n");
    imprimirPreOrdem(arvore->raiz);
    printf("\n\nEm Ordem\n");
    imprimirEmOrdem(arvore->raiz);
    printf("\n\nPos Ordem\n");
    imprimirPosOrdem(arvore->raiz);
}


