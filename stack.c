/** 
* Implementación del módulo de gestión del stack.
* @file
**/

#include "stack.h"


//! Número máximo de caracteres
#define max 10

//! Índice del último elemento
int top=-1;

//! Pila de datos
int stack[max];

void push(int m)
{   
	top++;   
	stack[top]=m;
}

int pop()
{   
	if(top==-1)
		return(top);   
	else   
	{      
		int j;

		j=stack[top];      
		top--;      
		return(j);   
	}
}
