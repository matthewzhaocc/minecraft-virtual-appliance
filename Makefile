all:
	packer build . 2>&1 | tee output.txt
	./prepdata.sh

clean:
	rm -rf ami.txt output.txt

copy2ssm:
	aws s3 cp s3://minecraft-vapp-artifacts/ami.txt .
	aws ssm put-parameter --name "mcvappami" --value ${cat ami.txt} --type String