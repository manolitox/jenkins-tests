/** 
* Definiciones del módulo de gestión del stack.
* @file
**/

#ifndef STACK_INC
#define STACK_INC

extern int top;

/**
* Añade un elemento al stack
**/
void push(int);

/**
* Saca el último elemento del stack
**/
int pop();

#endif //STACK_INC
