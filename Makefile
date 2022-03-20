# ----------------------------------
#          INSTALL & TEST
# ----------------------------------
install_requirements:
	@pip install -r requirements.txt

check_code:
	@flake8 tftemplates/**.py

black:
	@black tftemplates/**.py

test:
	@coverage run -m pytest tests
	@coverage report -m --omit="${VIRTUAL_ENV}/lib/python*"

ftest:
	@Write me

clean:
	@rm -f */version.txt
	@rm -f .coverage
	@rm -fr */__pycache__ */*.pyc __pycache__
	@rm -fr build dist
	@rm -fr tftemplates-*.dist-info
	@rm -fr tftemplates.egg-info

install:
	@pip install . -U

all: clean install test black check_code