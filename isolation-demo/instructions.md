1. Open 3 terminals

- Base OS
- Container 1
- Container 2

2. `docker pull python:3.11`

We don't strictly need this specific container, but I use it later in the presentation, so we might as well keep it updated.  

3. In Container 1 and Container 2:

```bash
docker run -it python3.11 bash
```

This will create two new containers running a bash shell

4. In all 3 terminals, `ls /tmp`

5. On the base OS, `touch /tmp/foo.txt`

6. In all 3, `ls /tmp` again

Notice that only the base OS has this file

7. In Container 1, `echo some words > /tmp/foo.txt`

8. On the root OS and Container 1, `cat /tmp/foo.txt`

Notice that Container 2 still doesn't have this file and Container 1 and the root OS have different contents in this file.  

9. The downside of isolation

type `exit` on container 1, then re-run `docker run -it python3.11 bash`, then `ls /tmp` again once the new container has restarted.  

Notice that your foo.txt doesn't exist anymore.  

10. Volumes fix this.  

Open another container using `docker run -v /:/tmp -it python:3.11  bash`

In that container and the base OS, `ls /tmp/*.txt` 

Play with this a bit and make some changes to files in both folders on both sides.  

Do it again with `docker run -v .:/app -it python:3.11  bash` which will mount your current directory as /app.
