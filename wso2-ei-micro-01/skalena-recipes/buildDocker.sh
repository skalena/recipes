clear
echo '....... Building EI Projet'
mvn install
echo '....... Building Docker Image'
docker build -t skalena:recipe-ei-01 .
