#include "Example.h"

#include "QColorButton.h"

Example::Example(QWidget *parent) : QWidget(parent) {

    setFixedSize(256, 64);

    QColorButton* button = new QColorButton(this);
    button->setGeometry(16, 16, 64, 32);
    button->setColor(QColor("red"));
    button->setFrameStyle(QFrame::Box|QFrame::Plain);
    button->setLineWidth(1);
}

Example::~Example() {
}

