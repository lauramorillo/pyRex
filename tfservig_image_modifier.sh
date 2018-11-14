docker pull tensorflow/serving
docker pull tensorflow/serving
docker run -d --name serving_base tensorflow/serving
docker cp $(pwd)/models/trex serving_base:/models/trex
## docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
# --change , -c Apply Dockerfile instruction to the created image
# --message , -m		Commit message
# --author , -a		Author (e.g., “John Hannibal Smith hannibal@a-team.com”)
docker commit --change "ENV MODEL_NAME simple_model" serving_base $(whoami)/trex_serving
docker kill serving_base
docker rm serving_base
