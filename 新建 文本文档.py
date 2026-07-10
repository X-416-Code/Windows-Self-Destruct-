import random
import subprocess
import os

print('Windows 自毁程序--危险代码已经加上注释，不会运行')

def confirm_destruction():
    for i in range(3):
        code = random.randint(1, 9)
        if i == 2:
            prompt = f'你要销毁你的电脑吗？这是最后一次确认。是，请键入{code}。否，请键入0或退出程序。> '
        else:
            prompt = f'你要销毁你的电脑吗？是，请键入{code}。否，请键入0或退出程序。> '
        
        answer = input(prompt)
        if answer != str(code):
            print("程序终止！")
            return False
    return True

if __name__ == "__main__":
    if confirm_destruction():
        bat_path = os.path.abspath("test.bat")
        # 带空格路径专用调用方式
        subprocess.run([bat_path], shell=True)
    else:
        print("已安全退出")