#ifndef LONGPOLL_P_H
#define LONGPOLL_P_H

#include "longpoll.h"
#include "client.h"
#include "reply.h"

#include <QVariant>
#include <QTimer>
#include <QUrl>
#include <QNetworkReply>

#include <QDebug>

namespace vk {

class LongPoll;
class LongPollPrivate
{
    Q_DECLARE_PUBLIC(LongPoll)
public:
    LongPollPrivate(LongPoll *q) : q_ptr(q), client(0),
		mode(LongPoll::RecieveAttachments), pollInterval(1000), waitInterval(25), isRunning(false) {}
    LongPoll *q_ptr;
    Client *client;

    LongPoll::Mode mode;
    int pollInterval;
    int waitInterval;
    QUrl dataUrl;
	bool isRunning;

	void _q_request_server_finished(const QVariant &response);
	void _q_on_data_recieved(const QVariant &response);
};


} //namespace vk

#endif // LONGPOLL_P_H
