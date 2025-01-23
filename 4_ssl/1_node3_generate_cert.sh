openssl genrsa -out /app/ssl/mongodb.key 2048
cp 4_ssl/1_node3_mongodb.cnf /app/ssl/mongodb.cnf
openssl req -new -key /app/ssl/mongodb.key -out /app/ssl/mongodb.csr -config /app/ssl/mongodb.cnf
openssl x509 -req -in /app/ssl/mongodb.csr -CA /app/ssl/rootCA.pem -CAkey /app/ssl/rootCA.key -CAcreateserial -out /app/ssl/mongodb.crt -days 500 -sha256 -extfile /app/ssl/mongodb.cnf -extensions req_ext
cat /app/ssl/mongodb.key /app/ssl/mongodb.crt > /app/ssl/mongodb.pem
