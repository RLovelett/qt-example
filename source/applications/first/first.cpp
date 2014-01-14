#include <QDebug>
#include "add.h"

int main()
{
  QtExample::Add temp(1, 1);
  qDebug() << "[first] Hello, World!";
  qDebug() << "Added 1 + 1 and got: " << temp.execute();
  return 0;
}
