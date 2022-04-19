Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B77AF50681A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 11:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 492911750;
	Tue, 19 Apr 2022 11:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 492911750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650362044;
	bh=j88iBvVSx4X23ZP9U7UejPJMDjegbwm6DIv5qdR7JFs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WG6Z9qwDkIvifwoMv3mvrE2RCbeGNCYOdH1FXouzKkjOv1Od8ATtalPOJg5jMB9Mw
	 KtWd7jZUnatbRu9JKdCdwvdXXn7k6PQgWt35zY6TVlTYStKe7EjFKdiI1j45UMa6gs
	 MgViDRqd+4tB64QfWoFy47IMEq2izDtQmwSBedco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8EF1F80121;
	Tue, 19 Apr 2022 11:53:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2402EF8025D; Tue, 19 Apr 2022 11:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D11AAF800C1
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 11:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D11AAF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1650361978177615881-webhooks-bot@alsa-project.org>
References: <1650361978177615881-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/55] optimization to gi-docgen
Message-Id: <20220419095305.2402EF8025D@alsa1.perex.cz>
Date: Tue, 19 Apr 2022 11:53:05 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #69 was opened from takaswie:

The gi-docgen supports enhancement of inter-document link:

  *  https://gnome.pages.gitlab.gnome.org/gi-docgen/linking.html

This patchset is optimization to it.

```
Takashi Sakamoto (55):
  rawmidi: fix wrong handling of open flag
  fix installation path for documents in README
  Split dependency section with requirements section in README
  markup URI correctly in README
  hwdep/rawmidi: enums: rename enumerators with enumerations
  ctl: enums: link optimization to gi-docgen
  ctl: query: link optimization to gi-docgen
  ctl: card: link optimization to gi-docgen
  ctl: card_info: link optimization to gi-docgen
  ctl: elem_id: link optimization to gi-docgen
  ctl: elem_info: link optimization to gi-docgen
  ctl: elem_value: link optimization to gi-docgen
  hwdep: query: link optimization to gi-docgen
  hwdep: device_info: link optimization to gi-docgen
  rawmidi: enums: link optimization to gi-docgen
  rawmidi: query: link optimization to gi-docgen
  rawmidi; stream_pair: link optimization to gi-docgen
  rawmidi: substream_info: link optimization to gi-docgen
  rawmidi: substream_params: link optimization to gi-docgen
  rawmidi: substream_status: link optimization to gi-docgen
  timer: enums: link optimization to gi-docgen
  timer: query: link optimization to gi-docgen
  timer: device_id: link optimization to gi-docgen
  timer: device_info: link optimization to gi-docgen
  timer: device_params: link optimization to gi-docgen
  timer: device_status: link optimization to gi-docgen
  timer: user_instance: link optimization to gi-docgen
  timer: instance_info: link optimization to gi-docgen
  timer: instance_params: link optimization to gi-docgen
  timer: instance_status: link optimization to gi-docgen
  timer: event: link optimization to gi-docgen
  timer: event_data_tick: link optimization to gi-docgen
  timer: event_data_tstamp: link optimization to gi-docgen
  seq: enum: link optimization to gi-docgen
  seq: query: link optimization to gi-docgen
  seq: addr: link optimization to gi-docgen
  seq: system_info: link optimization to gi-docgen
  seq: client_info: link optimization to gi-docgen
  seq: port_info: link optimization to gi-docgen
  seq: client_pool: link optimization to gi-docgen
  seq: subscribe_data: link optimization to gi-docgen
  seq: queue_info: link optimization to gi-docgen
  seq: queue_status: link optimization to gi-docgen
  seq: user_client: link optimization to gi-docgen
  seq: tstamp: link optimization to gi-docgen
  seq: remove_filter: link optimization to gi-docgen
  seq: queue_tempo: link optimization to gi-docgen
  seq: queue_timer_data_alsa: link optimization to gi-docgen
  seq: queue_timer_data_alsa: link optimization to gi-docgen
  seq: event_cntr: link optimization to gi-docgen
  seq: event_data_connect: link optimization to gi-docgen
  seq: event_data_ctl: link optimization to gi-docgen
  seq: event_data_note: link optimization to gi-docgen
  seq: event_data_queue: link optimization to gi-docgen
  seq: event_data_result: link optimization to gi-docgen

 README.rst                           |  30 +--
 src/ctl/alsactl-enum-types.h         |   2 +-
 src/ctl/card-info.c                  |  13 +-
 src/ctl/card.c                       | 276 ++++++++++++-------------
 src/ctl/card.h                       |  15 +-
 src/ctl/elem-id.c                    |  60 +++---
 src/ctl/elem-info.c                  | 127 +++++-------
 src/ctl/elem-info.h                  |  22 +-
 src/ctl/elem-value.c                 | 137 ++++++------
 src/ctl/query.c                      |  30 +--
 src/hwdep/alsahwdep-enum-types.h     |   2 +-
 src/hwdep/device-info.c              |  13 +-
 src/hwdep/query.c                    |  36 ++--
 src/rawmidi/alsarawmidi-enum-types.h |   4 +-
 src/rawmidi/query.c                  |  65 +++---
 src/rawmidi/stream-pair.c            | 207 +++++++++----------
 src/rawmidi/stream-pair.h            |  11 +-
 src/rawmidi/substream-info.c         |  23 +--
 src/rawmidi/substream-params.c       |  19 +-
 src/rawmidi/substream-params.h       |   1 +
 src/rawmidi/substream-status.c       |  18 +-
 src/seq/addr.c                       |  35 ++--
 src/seq/alsaseq-enum-types.h         |   2 +-
 src/seq/client-info.c                |  35 ++--
 src/seq/client-pool.c                |  17 +-
 src/seq/event-cntr.c                 | 232 ++++++++++-----------
 src/seq/event-data-connect.c         |  23 +--
 src/seq/event-data-ctl.c             |  23 +--
 src/seq/event-data-note.c            |  31 ++-
 src/seq/event-data-queue.c           |  79 ++++---
 src/seq/event-data-result.c          |  19 +-
 src/seq/port-info.c                  |  18 +-
 src/seq/query.c                      | 154 ++++++--------
 src/seq/queue-info.c                 |  21 +-
 src/seq/queue-status.c               |  26 ++-
 src/seq/queue-tempo.c                |  26 ++-
 src/seq/queue-timer-data-alsa.c      |  27 ++-
 src/seq/queue-timer.c                |  29 ++-
 src/seq/remove-filter.c              | 124 +++++------
 src/seq/subscribe-data.c             |  20 +-
 src/seq/system-info.c                |  13 +-
 src/seq/tstamp.c                     |  29 ++-
 src/seq/user-client.c                | 299 +++++++++++++--------------
 src/seq/user-client.h                |   4 +-
 src/timer/alsatimer-enum-types.h     |   2 +-
 src/timer/device-id.c                |  49 +++--
 src/timer/device-info.c              |  14 +-
 src/timer/device-params.c            |  17 +-
 src/timer/device-status.c            |  15 +-
 src/timer/event-data-tick.c          |  15 +-
 src/timer/event-data-tstamp.c        |  24 +--
 src/timer/event.c                    |  30 ++-
 src/timer/instance-info.c            |  14 +-
 src/timer/instance-params.c          |  41 ++--
 src/timer/instance-status.c          |  26 +--
 src/timer/query.c                    |  63 +++---
 src/timer/user-instance.c            | 199 +++++++++---------
 src/timer/user-instance.h            |  13 +-
 58 files changed, 1353 insertions(+), 1566 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/69
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/69.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
