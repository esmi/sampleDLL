
## 在LINUX/WINE環境下以 MINGW 建置 WINDOWS程式, 以及DLL, 並且於"WINE"環境下執行測試


在 mingw 網站文件：
<a href="http://www.mingw.org/wiki/sampleDLL">
HOWTO Create and Deploy a Sample DLL using MinGW</a>使用mingw, 建置 DLL. 在Linux環境下, 測試需要使用"WINE"執行.


```
  $ ./build.sh

  # before run example_exe2,
  # copy libgcc_s_dw2-1.dll  libstdc++-6.dll  libwinpthread-1.dll to wine's "PATH" environment.

  $ wine cmd

  Z：your_path> example_exe2

```

執行時如果出現
```
    err:module:import_dll Library libgcc_s_sjlj-1.dll (which is needed by L"Z:\\home\\evan\\www\\www2\\sampleDLL\\example_exe2.exe") not found

```
則編譯連結需以-static-libgcc 參數將 libgcc以靜態連結的方式編譯至"執行檔"中, 請參考<a href="https://www.qtcentre.org/threads/39639-MinGW-w64-dependency-on-LIBGCC_S_SJLJ-1-DLL">此處說明</a>

### 使用 mingw.sh 簡化 mingw linux版本的命令名稱長度

mingw linux版本的gcc,g++ 通常為了與原有系統的gcc, g++ 命令檔名不一樣, 通常會命名為：
```
  /usr/bin/i686-w64-mingw32-gcc
  /usr/bin/i686-w64-mingw32-g++
```
  下面的 mingw.sh 可簡化命令長度
```
  ./mingw.sh gcc --help
```  
