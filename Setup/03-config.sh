# Run ansible Manual
ansible-playbook ubuntu.yml --ask-become-pass

# Upgrade OS
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade && sudo apt autoremove -y && sudo apt autoclean -y

# Create Dir
mkdir ~/download && cd ~/download

# Docker-CE

# curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

# Scala sdkman

# curl -s "https://get.sdkman.io" | bash

# ADD User caso não exista
sudo adduser agriness

sudo su agriness

sudo vim /etc/sudoers

spark   ALL=(ALL) NOPASSWD: ALL
agriness   ALL=(ALL) NOPASSWD: ALL

# SSH CONFIG

sudo service ssh status

# sudo ufw allow ssh

# sudo service ssh start

# Config sshd_config
sudo vi /etc/ssh/sshd_config

#Port: 22
#ListenAddress 0.0.0.0
#PasswordAuthentication no

Port: 22
ListenAddress 0.0.0.0
PasswordAuthentication yes

sudo service ssh restart

# Generate ssh key

ssh-keygen -t rsa

# SSH Hadoop sem senha

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

chmod 0600 ~/.ssh/authorized_keys

ls -la ~/.ssh/

# VARIAVEIS DE AMBIENTE

vi ~/.bashrc

# JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

# SPARK_HOME
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# PYSPARK
# export PYSPARK_DRIVER_PYTHON="jupyter"
# export PYSPARK_DRIVER_PYTHON_OPTS="lab"
export PYSPARK_PYTHON=python3
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH

# DRILL_HOME
export DRILL_HOME=/opt/drill
export PATH=$DRILL_HOME/bin:$PATH

# HADOOP_HOME
export HADOOP_HOME=/opt/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
export PDSH_RCMD_TYPE=ssh

# JULIA_HOME
#export PATH="$PATH:/path/to/<Julia directory>/bin"

# SCALA_HOME
#export SCALA_HOME=/home/spark/.sdkman/candidates/scala/3.1.2
#export PATH=$PATH:$SCALA_HOME/bin

source ~/.bashrc

# Config Hadoop

sudo vi /opt/hadoop/etc/hadoop/hadoop-env.sh

# JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# HADOOP_HOME
export HADOOP_HOME=/opt/hadoop

sudo vi /opt/hadoop/etc/hadoop/core-site.xml

<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://192.168.103.239:9000</value>
    </property>
</configuration>

sudo vi /opt/hadoop/etc/hadoop/hdfs-site.xml

<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>

# SSH Hadoop sem senha

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# Format the filesystem:

sudo chown spark:spark -R /opt/hadoop

hdfs namenode -format

# Start NameNode daemon and DataNode daemon:

start-dfs.sh

jps	

jps

start-yarn.sh

# Antes de desligar tudo desligue os serviços

stop-dfs.sh

stop-yarn.sh

# VSCode 

# SPARK_HOME

"SPARK_HOME":"/opt/spark"


-- ------------------------------------------------------------------------------------------------
-- Kernel Spark Scala
-- ------------------------------------------------------------------------------------------------

jupyter kernelspec list

sudo su

sudo python3 -m spylon_kernel install

pip install spylon-kernel

-- ------------------------------------------------------------------------------------------------
-- Kernel Julia - JILL python script install Julia Lang
-- ------------------------------------------------------------------------------------------------

jupyter kernelspec list

jill install latest

julia-latest

using Pkg

Pkg.add("IJulia")

Pkg.update()

Pkg.build("IJulia")

jupyter kernelspec list

-- ------------------------------------------------------------------------------------------------
-- Kernel R
-- ------------------------------------------------------------------------------------------------

sudo su

R

install.packages('IRkernel')

IRkernel::installspec(user = FALSE)

IRkernel::installspec()  # to register the kernel in the current R installation

# jupyter labextension install @techrah/text-shortcuts  # for RStudio’s shortcuts

jupyter kernelspec list

# Referencias
https://github.com/IRkernel/IRkernel
https://developers.refinitiv.com/en/article-catalog/article/setup-jupyter-notebook-r

-- ------------------------------------------------------------------------------------------------
-- MiniConda
-- ------------------------------------------------------------------------------------------------

mkdir ~/download && cd ~/download && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda3.sh && chmod +x miniconda3.sh && ./miniconda3.sh

-- ------------------------------------------------------------------------------------------------
-- Conda Core Envs: Python
-- ------------------------------------------------------------------------------------------------
-- SIGA ESTE PASSO-A-PASSO PARA WATERMARK 
-- ------------------------------------------------------------------------------------------------

conda config --add channels conda-forge

conda update -n base -c defaults conda

conda update --all

conda create -n aws python pip jupyterlab numpy pandas pandasql matplotlib seaborn

conda create -n coreml python pip unidecode jupyterlab watermark numpy pandas pandasql pandas-profiling seaborn scikit-learn scikit-learn-intelex pandoc nltk statsmodels keras plotly matplotlib tensorflow bokeh 

conda create -n rpa-core python pip unidecode jupyterlab jinja2 selenium

conda create -n mongodb python pip unidecode jupyterlab numpy pandas pandasql pymongo dnspython

# Ultimo Caso
# conda install -c conda-forge watermark

-- ------------------------------------------------------------------------------------------------
-- Gerar de PDF Dados
-- ------------------------------------------------------------------------------------------------

sudo apt-get install pandoc texlive-xetex texlive-fonts-recommended texlive-plain-generic

-- ------------------------------------------------------------------------------------------------
-- Conda Core Envs: dbt-core
-- ------------------------------------------------------------------------------------------------

conda config --add channels conda-forge

conda update -n base -c defaults conda

conda update --all

conda create -n dbt-core python pip unidecode jupyterlab dbt-core

dbt init

conda remove --name dbt-core --all

-- ------------------------------------------------------------------------------------------------
-- Conda Core Envs: Web Scraping selenium
-- ------------------------------------------------------------------------------------------------

conda config --add channels conda-forge

conda update -n base -c defaults conda

conda update --all

conda create -n scrapng_selenium pip python pandas numpy selenium unidecode jupyterlab

conda remove --name scrapng_selenium --all

-- ------------------------------------------------------------------------------------------------
-- Installed package of scikit-learn can be accelerated using scikit-learn-intelex.
-- ------------------------------------------------------------------------------------------------

More details are available here: https://intel.github.io/scikit-learn-intelex

For example:

	$ conda install scikit-learn-intelex
	$ python -m sklearnex my_application.py




















-- ------------------------------------------------------------------------------------------------
-- Scala - almond - Deprecated
-- ------------------------------------------------------------------------------------------------

jupyter kernelspec list

# https://almond.sh/docs/quick-start-install

# Install the almond kernel

curl -Lo coursier https://git.io/coursier-cli && chmod +x coursier

# Install/Update almond kernel
./coursier launch --fork almond:0.13.0 -- --install

# Getting help about the launcher

./coursier launch --fork almond -- --help

# Install scala
./coursier launch --fork almond:0.13.0 --scala 3.0.0 -- --install

# List kernels
jupyter kernelspec list

# Uninstall the almond kernel

jupyter kernelspec remove scala




/home/spark/.local/bin