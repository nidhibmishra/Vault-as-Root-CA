# Some common actions in make

.PHONY: all
all: start


# `start` starts Jupyter
.PHONY: start
start:
	jupyter notebook --no-mathjax --browser='open %s'

.PHONY: lab
lab:
	jupyter-lab --browser='open %s'



# `clean` removes notebook output. Run this before you commit to git.
# TODO: convert to pre-commit hook?
.PHONY: clean
clean:
	find terraform vault -name '*.ipynb' | xargs -P 6 -n 1 jupyter nbconvert --clear-output --inplace
