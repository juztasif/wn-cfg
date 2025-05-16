# Conda Management
function ca ($name) { conda activate $name }
function cd { conda deactivate }
function cl { conda list }
function cel { conda env list }
function ci ($name) { conda install $name -y }
function cu ($name) { conda update $name -y }
function cua { conda update --all -y }
function cr ($name) { conda remove $name -y }
function cs ($name) { conda search $name }
function cc { conda clean --all -y }

# Pip Management
function pi ($name) { pip install $name }
function pu ($name) { pip uninstall $name -y }
function pl { pip list }
function ps ($name) { pip search $name }
function pfr { pip freeze > requirements.txt }
function pir { pip install -r requirements.txt }

# Python Commands
function py-v { python --version }
function py-V { python -V }
function py-c-env ($name) { python -m venv $name }

# Jupyter Notebook & Lab
function nb { jupyter notebook }
function lb { jupyter lab }

im man