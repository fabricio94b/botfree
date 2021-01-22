clear

if [ ! -d "bot" ]; then
	mkdir bot
fi

cd bot

if [ -e "dadosBot.ini" ] ; then

	screen -X -S bot quit > /dev/null
	screen -dmS bot php bot.php
	echo "Bot foi reiniciado e está executano em segundo plano"

else

echo "Instalando dependencias, aguarde..."

#add-apt-repository ppa:ondrej/php > /dev/null 2>&1
echo " ═ 00%"
apt-get update > /dev/null 2>&1
echo " ══ 05%"
apt-get upgrade -y > /dev/null 2>&1
echo " ═══ 10%"
apt-get install php -y > /dev/null 2>&1
echo " ════ 15%"
apt-get install php-redis -y > /dev/null 2>&1
echo " ═════ 20%"
apt-get install php-curl -y > /dev/null 2>&1
echo " ══════ 30%"
apt-get install php5 -y > /dev/null 2>&1
echo " ═══════ 40%"
apt-get install php5-redis -y > /dev/null 2>&1
echo " ════════ 50%"
apt-get install php5-curl -y > /dev/null 2>&1
echo " ═════════ 60%"
apt-get install redis-server -y > /dev/null 2>&1
echo " ══════════ 70%"
apt-get install redis -y > /dev/null 2>&1
echo " ═══════════ 80%"
apt-get install screen -y > /dev/null 2>&1
echo " ════════════ 90%"
apt-get install zip -y > /dev/null 2>&1
echo " ══════════════ 100%"
sleep 2
echo " Baixando arquivos do BOT"
sleep 3
wget https://www.dropbox.com/s/6rcn9ak7ec8nrh9/gerarusuario-sshplus.sh?dl=0 -O gerarusuario.sh; chmod +x gerarusuario.sh > /dev/null
sleep 2
wget https://github.com/fabricio94b/botfree/raw/main/%40admysshbot.zip -O bot.zip && unzip bot.zip > /dev/null
sleep 
rm dadosBot.ini > /dev/null
sleep 1
clear
sleep 1
ip=$(wget -qO- ipv4.icanhazip.com/)
sleep 1
echo " Digite o limite Conta SSH por dia:"
sleep 1
read limite
read token
sleep 1
clear
echo " Digite o TOKEN do seu BOT:"
echo "ip=$ip
token=$token
limite=$limite"
sleep 1
screen -dmS bot php bot.php
sleep 1
rm bot.zip
sleep 1
echo "BOT ativado, para reiniciar o BOT use o comando ./iniciar.sh"

fi
