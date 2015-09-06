# MyTestApp_QPKG
MyTestApp qpkg for QNAP

Steps required to build the package on a QNAP TVS:

    git clone https://github.com/eXodus1440/MyTestApp_QPKG.git MyTestApp
    cd MyTestApp
    wget https://pypi.python.org/packages/source/C/CherryPy/CherryPy-3.8.0.tar.gz

    tar -zxvf CherryPy-3.8.0.tar.gz -C ./shared --strip-components=1
    qbuild --exclude solaris --exclude *.cmd
