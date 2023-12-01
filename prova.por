programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Matematica --> mt
	
	funcao cadeia input(cadeia a)
	{
		cadeia var
		escreva(a)
		leia(var)
		retorne var
	}

	funcao inteiro int(cadeia a)
	{
		inteiro var
		var = tp.cadeia_para_inteiro(a, 10)
		retorne var
	}

	funcao real rel(cadeia a)
	{
		real var
		var = tp.cadeia_para_real(a)
		retorne var
	}

	funcao vazio escreva_vetor(cadeia vetor[], inteiro tamanho)
 	{
 		para(inteiro i = 0;i<tamanho;i++){
 			escreva(vetor[i])
 		}
 	}
	
	funcao inicio()
	{
		//constantes,matrizes e variaveis
		const inteiro PRESCISAO = 2, INTERACOES = 3
		cadeia eletrodos[][] = {
				{"Sn4+(aq)","Sn2+(aq)"},
				{"Cu²⁺(aq)","Cu(s)"},
				{"Cu¹⁺(aq)","Cu(s)"},
				{"I₂(s)","2I⁻(aq)"},
				{"Fe3+(aq)","Fe2+(s)"},
				{"Ag⁺(aq)","Ag(s)"},
				{"Hg²⁺(aq)","Hg(l)"},
				{"Br₂(l)","2Br⁻(aq)"},
				{"Cl₂(g)"," 2Cl⁻(aq)"},
				{"Au³⁺(aq)","Au(s)"},
				{"F₂(g)","2F⁻(aq)"}
			}
		real potencialPadrao[] = {0.15,0.34,0.52,0.54,0.77,0.80,0.85,1.07,1.36,1.50,2.87}
		inteiro numeroDeEletrons[] = {2,2,1,2,1,1,2,2,2,3,2}
		real  potencialFinal[INTERACOES][2]
		cadeia result[INTERACOES]
		real concentracao = 0.0
		inteiro entradaMenu,eEmNotacao = 0, i, j
		inteiro numeroMenu[INTERACOES]

		faca{
			eEmNotacao = int(input("deseja representar os valores em notação cientifica?\n [0]não [1]sim\n input: "))
		}enquanto(eEmNotacao < 0 ou eEmNotacao > 1)
		limpa()
		
		//rodar codigo para o numero de eletrodos n
		para(i=0;i<INTERACOES;i++){
			faca{
				escreva(
					".___________________________________________________.\n",
					"|   Semi-Reação Potencial    | Padrão de Redução (V)|\n",
					"|[0]Sn4+(aq) + 2e⁻ → Sn2+(aq)|       +0,15          |\n",
					"|[1]Cu²⁺(aq) + 2e⁻ → Cu(s)   |       +0,34          |\n",
					"|[2]Cu¹⁺(aq) + e⁻ → Cu(s)    |       +0,52          |\n",
					"|[3]I₂(s) + 2e⁻ → 2I⁻(aq)    |       +0,54          |\n",
					"|[4]Fe3+(aq) + e⁻ → Fe2(s)   |       +0,77          |\n",
					"|[5]Ag⁺(aq) + e⁻ → Ag(s)     |       +0,80          |\n",
					"|[6]Hg²⁺(aq) + 2e⁻ → Hg(l)   |       +0,85          |\n",
					"|[7]Br₂(l) + 2e⁻ → 2Br⁻(aq)  |       +1,07          |\n",
					"|[8]Au³⁺(aq) + 3e⁻ → Au(s)   |       +1,50          |\n",
					"|[9]F₂(g) + 2e⁻ → 2F⁻(aq)    |       +2,87          |\n",
					".___________________________________________________.\n\n",
					"input: "
					)
				leia(entradaMenu)
			}enquanto(entradaMenu < 0 ou entradaMenu > 9)
			
				
			//input
			faca{
				concentracao = rel(input("entre com a contração do elemento: "))
				se (concentracao <= 0){
					escreva("Concentração invalida. menor ou igual a 0") 
					}
			}enquanto(concentracao <= 0)
			
			//processo: CALCULO E ARMAZENAMENTO
			numeroMenu[i] = entradaMenu
			potencialFinal[i][0] = potencialPadrao[entradaMenu] + (0.06/numeroDeEletrons[entradaMenu]) * mt.logaritmo(1.0/concentracao, 10.0)
			
			se (eEmNotacao == 1) {
				faca{
					se (potencialFinal[i][0] >= 10) {
						potencialFinal[i][0] /= 10
						potencialFinal[i][1] += 1	
					
					} senao se (potencialFinal[i][0] < 1) {
						potencialFinal[i][0] *= 10
						potencialFinal[i][1] -= 1
					}
				} enquanto (potencialFinal[i][0] < 1 ou potencialFinal[i][0] >= 10)
				result[i] = ("o eletrodo de " + eletrodos[entradaMenu][1] + " tem potencial("+concentracao+" mol/L) = "+mt.arredondar(potencialFinal[i][0], PRESCISAO)+". 10^" + tp.real_para_inteiro(potencialFinal[i][1]) + "V\n")
			} senao {
				result[i] = ("o eletrodo de " + eletrodos[entradaMenu][1] + " tem potencial("+concentracao+" mol/L) = "+mt.arredondar(potencialFinal[i][0], PRESCISAO)+" V\n")
			}

			
			limpa()
		}
			
		//primeiro output
		escreva_vetor(result, INTERACOES)

		//processamento: ORDENAR
		para(j=0;j<INTERACOES;j++){
			para(i=0;i<INTERACOES-1;i++){
				se(potencialFinal[i][0] < potencialFinal[i+1][0]){
					//alternar potencia final
					real copiaR0 = potencialFinal[i][0]
					real copiaR1 = potencialFinal[i][1]
					potencialFinal[i][0] = potencialFinal[i+1][0]
					potencialFinal[i][1] = potencialFinal[i+1][1]
					potencialFinal[i+1][0] = copiaR0
					potencialFinal[i+1][1] = copiaR1

					//alternar linha
					inteiro copiaI = numeroMenu[i]
					numeroMenu[i] = numeroMenu[i+1]
					numeroMenu[i+1] = copiaI
				}
			}	
		}
		escreva("\n")
		//segundo output: ordenados
		se (eEmNotacao == 1) {
			para(i=0;i<INTERACOES;i++){
				se (i == INTERACOES - 1) {
					escreva(eletrodos[numeroMenu[i]][1],"(",mt.arredondar(potencialFinal[i][0], PRESCISAO),". 10^",tp.real_para_inteiro(potencialFinal[i][1]),"V)")
				} senao {
					escreva(eletrodos[numeroMenu[i]][1],"(",mt.arredondar(potencialFinal[i][0], PRESCISAO),". 10^",tp.real_para_inteiro(potencialFinal[i][1]),"V) >> ")
				}
			}
		} senao {
			para(i=0;i<INTERACOES;i++){
	 			se (i == INTERACOES - 1) {
					escreva(eletrodos[numeroMenu[i]][1],"(",mt.arredondar(potencialFinal[i][0], PRESCISAO),"V)")
				} senao {
					escreva(eletrodos[numeroMenu[i]][1],"(",mt.arredondar(potencialFinal[i][0], PRESCISAO),"V) >> ")
				}
			}
		}
	}
}		
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4700; 
 * @DOBRAMENTO-CODIGO = [5, 13, 20, 27];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */