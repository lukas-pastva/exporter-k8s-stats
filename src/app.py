from flask import Flask,Response,request
import subprocess,os
app=Flask(__name__)

@app.route('/metrics',methods=['GET'])
def metrics():
    env=os.environ.copy()
    env.update({
        'REQUEST_METHOD': request.method,
        'REQUEST_URI': request.full_path,
        'PATH_INFO': request.path,
        'QUERY_STRING': request.query_string.decode()
    })
    p=subprocess.run(['/bin/sh','/app/metrics.sh'],capture_output=True,env=env,timeout=15)
    out=p.stdout or b''
    if p.returncode:
        out+=b'\n\n--- stderr ---\n'+(p.stderr or b'')
        return Response(out,mimetype='text/plain',status=500)
    return Response(out,mimetype='text/plain')

if __name__=='__main__':
    app.run(host='0.0.0.0',port=8080)
