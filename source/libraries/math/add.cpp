#include "add.h"

QtExample::Add::Add(int first, int second)
  : QObject()
{
  a = first;
  b = second;
}

int QtExample::Add::execute()
{
  return a + b;
}
