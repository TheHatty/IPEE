programa
{
	inclua biblioteca Matematica --> mt
	funcao inicio()
	{	
		enquanto (verdadeiro) {
			//vars
			real precoDaGasolina, tamanhoDoTanque, ganhoTotal = 0.0, porcentagemDeReducao
			real gasolinaVendida = 0.0, gasolinaNaoVendida = 0.0, abastecimento, ganhoSemFraude = 0.0

			//input
			escreva("entre com a porcentagem de redução: ")
			leia(porcentagemDeReducao)

			escreva("entre com o tamanho do tanque: ")
			leia(tamanhoDoTanque)

			escreva("entre com o preço da gasolina: ")
			leia(precoDaGasolina)

			//process
			porcentagemDeReducao /= 100
			enquanto (tamanhoDoTanque >= 50) {
				escreva("entre com o abastecimento: ")
				leia(abastecimento)
				
				tamanhoDoTanque -= (abastecimento)
				gasolinaVendida += (abastecimento - (abastecimento * porcentagemDeReducao))
				gasolinaNaoVendida += (abastecimento * porcentagemDeReducao)
				ganhoTotal += abastecimento * precoDaGasolina	
			}
			enquanto (tamanhoDoTanque < 50 e tamanhoDoTanque > 0) {
				escreva("entre com o abastecimento: ")
				leia(abastecimento)
				enquanto (tamanhoDoTanque - abastecimento < 0) {
					escreva("Gasolina restante: ",tamanhoDoTanque,"\n\n")
					escreva("entre com o abastecimento: ")
					leia(abastecimento)
				}
				tamanhoDoTanque -= (abastecimento)
				gasolinaVendida += (abastecimento)
				ganhoTotal += abastecimento * precoDaGasolina
				ganhoSemFraude += abastecimento * precoDaGasolina
			}
			
			
			//output
			escreva("o ganho total foi: ",mt.arredondar(ganhoTotal, 3),"\n")
			
			se (ganhoSemFraude < (gasolinaNaoVendida * precoDaGasolina)) {
				escreva("o ganho sem fraude de ",ganhoSemFraude," foi menor do que o possivel ganho da gasolina economizada com a fraude(",gasolinaNaoVendida,"l e ",gasolinaNaoVendida * precoDaGasolina,"R$)","\n")
			} senao {
				escreva("o ganho sem fraude de ",ganhoSemFraude," foi maior do que o possivel ganho da gasolina economizada com a fraude(",gasolinaNaoVendida,"l e ",gasolinaNaoVendida * precoDaGasolina,"R$)","\n ")
			}

			escreva("gasolina vendida: ",gasolinaVendida,"\n","gasolina não vendida: ",gasolinaNaoVendida)
			pare
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1054; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {precoDaGasolina, 8, 8, 15}-{tamanhoDoTanque, 8, 25, 15}-{ganhoTotal, 8, 42, 10}-{porcentagemDeReducao, 8, 60, 20}-{gasolinaVendida, 9, 8, 15}-{gasolinaNaoVendida, 9, 31, 18}-{abastecimento, 9, 57, 13};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */