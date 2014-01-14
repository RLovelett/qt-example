#include <QObject>

namespace QtExample
{
  class Add : public QObject
  {
    Q_OBJECT
    int a, b;
    public:
      Add(int first, int second);
      int execute();
  };
}
