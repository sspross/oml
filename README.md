OpenMediaLibrary
================
Latest `master` running at [http://oml.orwell.ch/](http://oml.orwell.ch)

Documentation
-------------
All files are written in LaTeX and german. Check out the `doc` directory for
sources and the download section for pdfs.

*   Aufgabenstellung
*   Kickoff Protokoll
*   Bewertungskriterien
*   Design Review Protokoll
*   Dokumentation

Get your local copy
-------------------
Dependencies:

*   Ruby >= 1.8.7
*   RubyGems >= 1.3.7  
*   Git >= 1.7.1.1

Checkout and install:

    git clone git@github.com:sspross/oml.git
    cd oml/
    bundle install --without=production
    cp config/database.yml.sqlite3 config/database.yml
    rake db:migrate

Run the unit tests:

    rake test

Start local rails server:

    rails server

Browse to [http://localhost:3000/](http://localhost:3000/)