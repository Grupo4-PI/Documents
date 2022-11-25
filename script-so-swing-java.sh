#!/bin/bash

echo "Seja Bem-Vindo!"
echo "Você está prestes a obter o NoCrash Application."
sleep 2
echo "Você deseja instalar a nossa aplicação? S/n"
read resp1
if [ $resp1 = "S" ]
        then echo "Você ACEITOU instalar o NoCrash Application"
        sleep 1
        echo "."
        sleep 1
        echo "."
        sleep 1
        echo "Analisaremos sua máquina e instalaremos nossos resursos"
        sleep 1
        clear

        docker --version
                if [ $? -eq 0 ]
                        then echo "Docker instalado!"
                        sleep 1
                else
                        echo "Docker Não Instalado!"
                        echo "Instalando o Docker..."

                        sudo apt install docker.io -y -q

                        sudo systemctl enable docker

                        sudo systemctl start docker
                fi

        java -version

                if [ $? -eq 0 ]
                        then echo "Java Instalado!"
                        sleep 1
                else
                        echo "Java Não Instalado!"
                        echo "Instalando o Java..."

                        sudo apt install openjdk-11-jdk -y
                fi

                echo "-  Iniciando a criação do docker -"

                git clone https://github.com/Grupo4-PI/no-crash-java-aplication-rep.git -q

                sleep 2
                sleep 2

                cd no-crash-java-aplication-rep

                sudo docker build . -t nocrash-db

                sudo docker run -d -p 3306:3306 --name mysql -e "MYSQL_ROOT_PASSWORD=urubu100" nocrash-db

                cd jframe-screens/Monitoramento/target

                sudo docker start mysql
                clear

                java -jar monitoramento-1.0-SNAPSHOT-jar-with-dependencies.jar

                else
                        echo "Você NÃO ACEITOU instalar o NoCrash Application"
                        echo "Que pena"
                        sleep 1
                        echo "."
                        sleep 1
                        echo "."
                        sleep 1
                        echo "."
                        sleep 1
                        echo "Caso mude de ideia, execute o script novamente e siga os passos!"
                        echo "Até mais! :D"
fi
