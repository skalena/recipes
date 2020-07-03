echo '....... Running Docker image now ....'
docker run -d -p 8290:8290 -p 9164:9164 -e JAVA_OPTS="-DenableManagementApi=true" skalena:recipe-ei-01
