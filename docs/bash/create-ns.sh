for index in {1..1000}
do
	curl '<rancher-url>/k8s/clusters/<cluster-name>/v1/namespaces' \
	  -H 'authority: <rancher-url>' \
	  -H 'accept: application/json' \
	  -H 'accept-language: en-US,en;q=0.9' \
	  -H 'content-type: application/json' \
	  -H 'cookie: R_SESS=<token>' \
	  --data-raw '{"type":"namespace","metadata":{"annotations":{"field.cattle.io/containerDefaultResourceLimit":"{}","field.cattle.io/projectId":"<cluster-id>:<project-id>"},"labels":{"field.cattle.io/projectId":"<project-id>"},"name":"'"test$index"'"},"disableOpenApiValidation":false}' \
	  --compressed \
	  --insecure
done