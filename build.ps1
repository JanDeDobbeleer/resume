# Remove background color to create a white page
# Create a pdf from the html page
docker run --rm -v ${PWD}:/converted/ arachnysdocker/athenapdf athenapdf index.html resume.pdf
# Reset the background color using git :-)
# git checkout -- ./assets/css/style.css
