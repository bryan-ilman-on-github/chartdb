#!/bin/sh
envsubst '${OPENAI_API_KEY} ${OPENAI_API_ENDPOINT} ${LLM_MODEL_NAME} ${HIDE_CHARTDB_CLOUD} ${DISABLE_ANALYTICS}' \      
  < /etc/nginx/conf.d/default.conf.template \
  > /etc/nginx/conf.d/default.conf

# Replace port 80 with $PORT for Render compatibility
sed -i "s/listen       80;/listen       ${PORT};/" /etc/nginx/conf.d/default.conf
sed -i "s/listen  \[::\]:80;/listen  [::]:${PORT};/" /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
