programa
{
	inclua biblioteca Matematica -->mt
	
	funcao inicio()
	{
		const inteiro NUMERO_DE_ELEMENTOS = 5
		real frequeciaCardiaca[NUMERO_DE_ELEMENTOS], tempAmb[NUMERO_DE_ELEMENTOS], potencia[NUMERO_DE_ELEMENTOS]
		real dados[NUMERO_DE_ELEMENTOS][2]
		inteiro contagem

		para(contagem = 0;contagem < NUMERO_DE_ELEMENTOS; contagem++){
			escreva("entre com o valor ",contagem + 1," da frequencia cardiaca: ")
			leia(frequeciaCardiaca[contagem])
		}

		para(contagem = 0;contagem < NUMERO_DE_ELEMENTOS; contagem++){
			tempAmb[contagem] = (0.58 * frequeciaCardiaca[contagem] - 5.47)
		}
		
		para(contagem = 0;contagem < NUMERO_DE_ELEMENTOS; contagem++){
			se (tempAmb[contagem] < 16) {
				potencia[contagem] = 0
			} senao se (tempAmb[contagem] >= 16 e tempAmb[contagem] < 24) {
				potencia[contagem] = (0.0046 * mt.potencia(tempAmb[contagem], 2) - 0.1497 * tempAmb[contagem] + 1.412)
			} senao se (tempAmb[contagem] >= 24 e tempAmb[contagem] <= 42) {
				potencia[contagem] = (0.5 + (0.026 * (tempAmb[contagem] - 24)))
			} senao {
				escreva("error")
				pare
			}
		}

		para(contagem = 0;contagem < NUMERO_DE_ELEMENTOS; contagem++){
			dados[contagem][0] = tempAmb[contagem]
			dados[contagem][1] = potencia[contagem]
		}

		//output
		para(contagem = 0;contagem < NUMERO_DE_ELEMENTOS; contagem++){
			escreva("| ",mt.arredondar(dados[contagem][0], 3),' ', mt.arredondar(dados[contagem][1], 3)," |\n")
		}
	}	
			
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1250; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */