#include "CUtils.hpp"
#include <QOpenGLFunctions_3_3_Core>
//#include

CUtils::CUtils(QObject *parent) : QObject(parent)
{

}

CUtils::~CUtils()
{

}

#include <QDebug>
void CUtils::glUnProject(qreal x0, qreal y0)
{
    //QOpenGLContext context = new QOpenGLContext(this);
    QOpenGLContext* context = QOpenGLContext::currentContext();

    if(context) {
        QOpenGLFunctions_3_3_Core* funcs = 0;
        funcs = context->versionFunctions< QOpenGLFunctions_3_3_Core >();
        if (!funcs) {
            qWarning() << "Could not obtain required OpenGL context version";
            exit(1);
        }
        funcs->initializeOpenGLFunctions();
        qDebug() << "всё отлично!";


    //                    Допустим, имеется некое пространство сцены, в которое объекты приводятся матрицей MODELVIEW.
    //                    В дальнейшем объекты преобразовываются в экранное пространство матрицей Projection.
    //                    Даны координаты курсора в окне с шириной/высотой w/h пикселей: (x, y), которые отсчитываются от верхнего левого угла.
    //                    Найти координаты соответствующей точки в пространстве сцены.
    //                    Решение.
    //                    Переведём координаты курсора в экранное пространство.
    //                    Оно ограничено координатами от -1 до 1 по всем 3 осям, с точкой (0, 0, 0) в центре экрана,
    //                    ось x идёт слева направо, ось y снизу вверх. Отсюда формулы: xS = (2*x - w)/w, yS = (h - 2*y)/h, zS = 0.
    //                    Следующий шаг - перевод из экранных координат в пространство сцены.
    //                    Для этого надо либо вычислить матрицу проекции (её размерность - 4*4) по данным в MSDN формулам,
    //                    либо просто прочитать её с помощью glGetDoublev. Затем найти обратную матрицу методом Гаусса.
    //                    Дополнить координаты xS, yS, zS компонентой w, чтобы получить однородные координаты (задать w = 1).
    //                    Умножить полученный вектор длиной 4 на обратную матрицу, получим новый вектор длиной 4: (xM, yM, zM, wM).
    //                    Поделим координаты xM, yM, zM на компонент wM и получим координаты мышиного курсора в пространстве сцены.
    //                    с координатами от -1 до 1! Т.е. чтобы получить реальные координаты сцены необходимо
    //                    -1 принять за Xmin а +1 за Xmax и применяя данную пропорцию вычислить реальное значение x,y

    //                            @
//    GLint viewport[4];
//    GLdouble modelview[16];
//    GLdouble projection[16];
//    GLfloat winX, winY, winZ;
//    glGetDoublev( GL_MODELVIEW_MATRIX, modelview );
//    glGetDoublev( GL_PROJECTION_MATRIX, projection );
//    glGetIntegerv( GL_VIEWPORT, viewport );
//    double posX, posY, posZ;
//    gluUnProject( pme->x(), Height - pme->y(), z, modelview, projection, viewport, &posX, &posY, &posZ);
//    error = glGetError();
//    if(GL_NO_ERROR != error) throw;
//    qDebug() << "3D point with POS: " << QString::number( posX, 'd', 6 ) << QString::number( posY, 'd', 6 ) << QString::number( posZ, 'd', 6 );
//    qDebug( "\tERROR: %s (Code: %u)\n", gluErrorString(error), error );
    //                            @
        // 2 variant
//        case WM_LBUTTONUP
//        {
//        dMousex = LOWORD(lParam);
//        dMousey = HIWORD(lParam);
        GLint viewport[4];
        GLdouble modelMatrix[16];
        GLdouble projMatrix[16];

        glGetDoublev(GL_MODELVIEW_MATRIX,modelMatrix);
        glGetDoublev(GL_PROJECTION_MATRIX,projMatrix);
        glGetIntegerv(GL_VIEWPORT,viewport);

        qreal dWinx = x0;
        qreal dWiny = (float)viewport[3] - (float)y0;
        qreal dWinz = 1;
      //  funcs->glReadPixels( dWinx, int(dWiny), 1, 1, GL_DEPTH_COMPONENT, GL_DOUBLE, dWinz );

        funcs->glUnProject(dWinx, dWiny, dWinz,
                            modelMatrix,projMatrix,viewport,
                            dRealx,dRealy,dRealz);
        sprintf(szBuf, "X:%.2f Y:%.2f H:%.2f",dRealx,dRealz,dRealy );
        SendMessage(hwStatus, SB_SETTEXT, 0, (LPARAM)(LPSTR)szBuf);

//        }
    }
}

void CUtils::setX(qreal newX)
{
    if (m_x == newX)
        return;

    m_x = newX;
    emit xChanged(newX);
}

void CUtils::setY(qreal newY)
{
    if (m_y == newY)
        return;

    m_y = newY;
    emit yChanged(newY);
}



