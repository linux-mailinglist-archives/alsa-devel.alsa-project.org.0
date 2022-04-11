Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E654FB648
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 10:46:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9284116F9;
	Mon, 11 Apr 2022 10:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9284116F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649666774;
	bh=rBcE5lrdxV5N8c+I8Jk2fgdTBBYLkxPIiX25iCqMptk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HBZZ+6SnSAlBao+Zu8OfpgzlAAR2ytqwtrqZaqoVQeLhSSRoGSdkxq4MQNH2iOHOJ
	 /nlypTTF7XrzFJrPj09tFIpuM+sFLsIyoX+yTKTvQ4GxXLne8YowCET9d+KC/6ITgu
	 JWGnUmllDGzU7TPGTLF1nf88X+rKPilUWL7ECUvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB40F8047D;
	Mon, 11 Apr 2022 10:45:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98F13F80279; Mon, 11 Apr 2022 10:45:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D5342F8020D
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 10:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5342F8020D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1649666709025209904-webhooks-bot@alsa-project.org>
References: <1649666709025209904-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/30] use utility macro to declare GObject-derived objects
Message-Id: <20220411084512.98F13F80279@alsa1.perex.cz>
Date: Mon, 11 Apr 2022 10:45:12 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-gobject pull request #68 was opened from takaswie:

GObject v2.44 got new macro to declare GObject-derived objects. This enables us to reduce
boireplate for the declaration.

This patchset is to replace current boireplates with it.

```
Takashi Sakamoto (30):
  all: minor code refactoring for inclusion guard
  seq: enum: fix tab indentation
  timer: device_params: fix type decration with private data
  ctl: card: use an utility macro to declare GObject-derived object
  ctl: card_info: use an utility macro to declare GObject-derived object
  ctl: elem_info: use an utility macro to declare GObject-derived object
  ctl: elem_value: use an utility macro to declare GObject-derived object
  hwdep: device_info: use an utility macro to declare GObject-derived object
  rawmidi: stream_pair: use an utility macro to declare GObject-derived object
  rawmidi: substream_info: use an utility macro to declare GObject-derived object
  rawmidi; substream_params: use an utility macro to declare GObject-derived object
  rawmidi: substream_status: use an utility macro to declare GObject-derived object
  timer: user_instance: use an utility macro to declare GObject-derived object
  timer: device_info: use an utility macro to declare GObject-derived object
  timer: device_status: use an utility macro to declare GObject-derived object
  timer: device_params: use an utility macro to declare GObject-derived object
  timer: instance_info: use an utility macro to declare GObject-derived object
  timer: instance_status: use an utility macro to declare GObject-derived object
  timer: instance_params: use an utility macro to declare GObject-derived object
  seq: user_client: use an utility macro to declare GObject-derived object
  seq: client_info: use an utility macro to declare GObject-derived object
  seq: client_pool: use an utility macro to declare GObject-derived object
  seq: system_info: use an utility macro to declare GObject-derived object
  seq: port_info: use an utility macro to declare GObject-derived object
  seq: subscribe_data: use an utility macro to declare GObject-derived object
  seq: event_cntr: use an utility macro to declare GObject-derived object
  seq: queue_info: use an utility macro to declare GObject-derived object
  seq: queue_status: use an utility macro to declare GObject-derived object
  seq: queue_tempo: use an utility macro to declare GObject-derived object
  seq: queue_timer: use an utility macro to declare GObject-derived object

 src/ctl/alsactl-enum-types.h         |  4 +--
 src/ctl/card-info.c                  |  4 +--
 src/ctl/card-info.h                  | 36 +++----------------------
 src/ctl/card.c                       |  6 ++---
 src/ctl/card.h                       | 40 ++++------------------------
 src/ctl/elem-id.h                    |  4 +--
 src/ctl/elem-info.c                  |  4 +--
 src/ctl/elem-info.h                  | 36 +++----------------------
 src/ctl/elem-value.c                 |  8 +++---
 src/ctl/elem-value.h                 | 36 +++----------------------
 src/ctl/privates.h                   |  4 +--
 src/ctl/query.h                      |  4 +--
 src/hwdep/alsahwdep-enum-types.h     |  4 +--
 src/hwdep/device-info.c              |  4 +--
 src/hwdep/device-info.h              | 36 +++----------------------
 src/hwdep/privates.h                 |  4 +--
 src/hwdep/query.h                    |  4 +--
 src/meson.build                      |  2 +-
 src/rawmidi/alsarawmidi-enum-types.h |  4 +--
 src/rawmidi/privates.h               |  4 +--
 src/rawmidi/query.h                  |  4 +--
 src/rawmidi/stream-pair.c            |  4 +--
 src/rawmidi/stream-pair.h            | 36 +++----------------------
 src/rawmidi/substream-info.c         |  4 +--
 src/rawmidi/substream-info.h         | 38 +++-----------------------
 src/rawmidi/substream-params.c       |  4 +--
 src/rawmidi/substream-params.h       | 38 +++-----------------------
 src/rawmidi/substream-status.c       |  4 +--
 src/rawmidi/substream-status.h       | 37 +++----------------------
 src/seq/addr.h                       |  4 +--
 src/seq/alsaseq-enum-types.h         |  6 ++---
 src/seq/alsaseq.h                    |  4 +--
 src/seq/client-info.c                |  4 +--
 src/seq/client-info.h                | 36 +++----------------------
 src/seq/client-pool.c                |  4 +--
 src/seq/client-pool.h                | 36 +++----------------------
 src/seq/event-cntr.h                 | 36 +++----------------------
 src/seq/event-data-connect.h         |  4 +--
 src/seq/event-data-ctl.h             |  4 +--
 src/seq/event-data-note.h            |  4 +--
 src/seq/event-data-result.h          |  4 +--
 src/seq/port-info.c                  |  4 +--
 src/seq/port-info.h                  | 36 +++----------------------
 src/seq/privates.h                   |  4 +--
 src/seq/query.h                      |  4 +--
 src/seq/queue-info.c                 |  4 +--
 src/seq/queue-info.h                 | 37 +++----------------------
 src/seq/queue-status.c               |  4 +--
 src/seq/queue-status.h               | 36 +++----------------------
 src/seq/queue-tempo.c                |  4 +--
 src/seq/queue-tempo.h                | 36 +++----------------------
 src/seq/queue-timer-data-alsa.h      |  4 +--
 src/seq/queue-timer.c                |  4 +--
 src/seq/queue-timer.h                | 36 +++----------------------
 src/seq/remove-filter.h              |  4 +--
 src/seq/subscribe-data.c             |  4 +--
 src/seq/subscribe-data.h             | 36 +++----------------------
 src/seq/system-info.c                |  4 +--
 src/seq/system-info.h                | 36 +++----------------------
 src/seq/tstamp.h                     |  4 +--
 src/seq/user-client.c                |  4 +--
 src/seq/user-client.h                | 36 +++----------------------
 src/timer/alsatimer-enum-types.h     |  5 ++--
 src/timer/alsatimer.h                |  1 +
 src/timer/device-id.h                |  4 +--
 src/timer/device-info.c              |  4 +--
 src/timer/device-info.h              | 37 +++----------------------
 src/timer/device-params.c            |  6 ++---
 src/timer/device-params.h            | 37 +++----------------------
 src/timer/device-status.c            |  4 +--
 src/timer/device-status.h            | 37 +++----------------------
 src/timer/event-data-tick.h          |  4 +--
 src/timer/event-data-tstamp.h        |  4 +--
 src/timer/event.h                    |  4 +--
 src/timer/instance-info.c            |  4 +--
 src/timer/instance-info.h            | 37 +++----------------------
 src/timer/instance-params.c          |  4 +--
 src/timer/instance-params.h          | 37 +++----------------------
 src/timer/instance-status.c          |  4 +--
 src/timer/instance-status.h          | 37 +++----------------------
 src/timer/privates.h                 |  4 +--
 src/timer/query.h                    |  4 +--
 src/timer/user-instance.c            |  4 +--
 src/timer/user-instance.h            | 37 +++----------------------
 84 files changed, 211 insertions(+), 1012 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/68
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/68.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
