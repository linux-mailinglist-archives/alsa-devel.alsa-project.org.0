Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CB853D973
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jun 2022 05:44:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3656718C8;
	Sun,  5 Jun 2022 05:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3656718C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654400675;
	bh=LOT1o44nFRVtI+Kdmc/c2Jd9Y9CCpJ6H9tiPxfBxZ9c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wo0vB1XjTi1qWJuCgxQB3jyEENpyJsaTW2SlK0vehtOnBEi8OEI/6qgwA/rGJ+Zzo
	 EooTlQYwyqx3VZowWMROY/NM4WcvuaLmBsIfn+TkPrs4Cor5VVGYnLAp76RPNpgXPT
	 WlVdlL6FpiiH9F5IUrV3B231az8CqidZMMKnXSw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F89F8016C;
	Sun,  5 Jun 2022 05:43:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0161F80162; Sun,  5 Jun 2022 05:43:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B5955F80116
 for <alsa-devel@alsa-project.org>; Sun,  5 Jun 2022 05:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5955F80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654400612284004927-webhooks-bot@alsa-project.org>
References: <1654400612284004927-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/6] timer: use explicit two types of signals to dispatch
 events
Message-Id: <20220605034335.B0161F80162@alsa1.perex.cz>
Date: Sun,  5 Jun 2022 05:43:35 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #74 was opened from takaswie:

In current implementation, ALSATimer.UserInstance dispatches one type of
event for both tick and timestamp events. However, the type of event is
decided before starting timer instance, therefore user application
never processes both types of event.

In this patchset, two types of signals are added to ALSATimer.UserInstance
to dispatch the two types of event separately, then ALSATImer.Event is
going to be removed. Additionally, some boxed objects and enumerations
are renamed so that they have straight-forward names.


```
Takashi Sakamoto (6):
  timer: user_instance: use two signals to dispatch events explicitly
  timer: event: remove unused structure
  timer: enums: rename TstampEventType from EventType
  timer: enum: rename EventType from EventDataType
  timer: tick-event: rename from event-data-tick
  timer: tstamp-event: rename from event-data-tstamp

 samples/timer                    |  29 ++++----
 src/timer/alsatimer-enum-types.h |  80 +++++++++++-----------
 src/timer/alsatimer.h            |   5 +-
 src/timer/alsatimer.map          |  30 ++++----
 src/timer/event-data-tick.c      |  51 --------------
 src/timer/event-data-tick.h      |  23 -------
 src/timer/event-data-tstamp.c    |  66 ------------------
 src/timer/event-data-tstamp.h    |  26 -------
 src/timer/event.c                |  64 -----------------
 src/timer/event.h                |  28 --------
 src/timer/instance-params.c      |  22 +++---
 src/timer/instance-params.h      |   4 +-
 src/timer/meson.build            |  10 ++-
 src/timer/tick-event.c           |  51 ++++++++++++++
 src/timer/tick-event.h           |  23 +++++++
 src/timer/tstamp-event.c         |  64 +++++++++++++++++
 src/timer/tstamp-event.h         |  24 +++++++
 src/timer/user-instance.c        | 114 ++++++++++++++++++++-----------
 src/timer/user-instance.h        |  22 ++++--
 tests/alsatimer-enums            |   6 +-
 tests/alsatimer-user-instance    |   8 ++-
 21 files changed, 346 insertions(+), 404 deletions(-)
 delete mode 100644 src/timer/event-data-tick.c
 delete mode 100644 src/timer/event-data-tick.h
 delete mode 100644 src/timer/event-data-tstamp.c
 delete mode 100644 src/timer/event-data-tstamp.h
 delete mode 100644 src/timer/event.c
 delete mode 100644 src/timer/event.h
 create mode 100644 src/timer/tick-event.c
 create mode 100644 src/timer/tick-event.h
 create mode 100644 src/timer/tstamp-event.c
 create mode 100644 src/timer/tstamp-event.h
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/74
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/74.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
