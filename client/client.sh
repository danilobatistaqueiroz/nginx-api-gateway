#!/bin/bash

# Com as ocnfigurações atuais, o client faz uma requisição por segundo,
# Para aumentar o número de requisições por segundo, descomente as linhas 
# 14 e 32 e comente a linha 33, você terá que remover tanto a imagem como
# o container client-forum-api e subir a stack novamente para o rebuild.

HOST='proxy-forum-api'

while true
    do
	ENDP=`expr $RANDOM % 3 + 1`
	NUMB=`expr $RANDOM % 100 + 1`
	#TEMP=`expr 1 + $(awk -v seed="$RANDOM" 'BEGIN { srand(seed); printf("%.4f\n", rand()) }')`
        
	if [ $NUMB -le 55 ]; then
	    curl --silent --output /dev/null http://${HOST}/topicos
			echo 'http://${HOST}/topicos' >> /tmp/out.txt
  elif [ $NUMB -ge 56 ] && [ $NUMB -le 85 ] ; then
	    curl --silent --output /dev/null http://${HOST}/topicos/$ENDP
			echo 'http://${HOST}/topicos/$ENDP' >> /tmp/out.txt
  elif [ $NUMB -ge 86 ] && [ $NUMB -le 95 ] ; then
	    curl --silent --output /dev/null --data '{"email":"moderador@email.com","senha":"123456"}' \
		 --header "Content-Type:application/json" \
		 --request POST http://${HOST}/auth
		 echo '{123456} http://${HOST}/auth' >> /tmp/out.txt
  elif [ $NUMB -ge 96 ] && [ $NUMB -le 98 ] ; then
	    curl --silent --output /dev/null --data '{"email":"moderador@email.com","senha":"1234567"}' \
	         --header "Content-Type:application/json" \
	         --request POST http://${HOST}/auth
  		echo '{1234567} http://${HOST}/auth' >> /tmp/out.txt
	else
	    curl --silent --output /dev/null http://${HOST}/topicos/0
			echo 'http://${HOST}/topicos/0' > /tmp/out.txt
  fi

	#sleep $TEMP
	sleep 0.75
done

