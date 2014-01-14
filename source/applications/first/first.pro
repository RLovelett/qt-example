include(../../application.pri)

INCLUDEPATH += $$PRJROOT \
               $$PRJROOT/libraries/math

LIBS += -L$$PRJROOT/libraries/math \
        -lmath

SOURCES += first.cpp
