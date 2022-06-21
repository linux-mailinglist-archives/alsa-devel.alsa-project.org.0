Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AFB5529AD
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 05:14:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94209282F;
	Tue, 21 Jun 2022 05:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94209282F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655781269;
	bh=3zp+36iggPTC4tx3++baZRkkfOz8UCZuKtwmsk2NhLU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQT6oqOiSY0ohTSklNSPBJRvNzU8HODYkDMg+nVRYHM45xi/bSMY+uJsQ95Nd4Psr
	 o22J2KlmPL+ErAnc/X+OxKHAcZtZfG/mC9O7IayqvILmaj8D8QbdHR1G5XDhp691/s
	 RR6ZQp/Uo7+O2OcxQMWqOYHGdQjbkIAUIOgdMXXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15E5FF800E3;
	Tue, 21 Jun 2022 05:13:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8042F80155; Tue, 21 Jun 2022 05:13:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 265A7F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 05:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 265A7F800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655781203997383118-webhooks-bot@alsa-project.org>
References: <1655781203997383118-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/10] timer: rename tstamp methods with the word real_time
Message-Id: <20220621031328.D8042F80155@alsa1.perex.cz>
Date: Tue, 21 Jun 2022 05:13:28 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #78 was opened from takaswie:

In ALSATimer library some methods are named with the word `tstamp`. On the
other hand, in ALSASeq  library the similar methods are named with the word `real_time`.
For consistency, this patchset renames methods in ALSATimer library. As a result,
the word `tstamp` is not used at all.

```
Takashi Sakamoto (10):
  utils: successfully parse the string teminated by '\n'
  timer: move ALSATimer.TickEvent files for future rename
  timer: move ALSATimer.TstampEvent files for future rename
  timer: tick-time-event: rename boxed structure
  timer: real-time-event: rename boxed structure
  timer: enums: rename to ALSATimer.EventType.TICK_TIME and REAL_TIME
  timer: enums: rename to ALSATimer.RealTimeEventType
  timer: instance-status: rename method with real time
  timer: query: rename to ALSATimer.get_real_time_clock_id()
  seq: event: fix description about methods relevant to time stamp

 samples/timer                                 | 26 +++----
 src/seq/event.c                               | 16 ++--
 src/timer/alsatimer-enum-types.h              | 74 +++++++++----------
 src/timer/alsatimer.h                         |  4 +-
 src/timer/alsatimer.map                       | 20 ++---
 src/timer/instance-params.c                   | 20 ++---
 src/timer/instance-params.h                   |  4 +-
 src/timer/instance-status.c                   | 22 +++---
 src/timer/instance-status.h                   |  3 +-
 src/timer/meson.build                         |  8 +-
 src/timer/query.c                             | 16 ++--
 src/timer/query.h                             |  2 +-
 src/timer/real-time-event.c                   | 65 ++++++++++++++++
 src/timer/real-time-event.h                   | 25 +++++++
 src/timer/tick-event.c                        | 51 -------------
 src/timer/tick-event.h                        | 23 ------
 src/timer/tick-time-event.c                   | 50 +++++++++++++
 src/timer/tick-time-event.h                   | 22 ++++++
 src/timer/tstamp-event.c                      | 64 ----------------
 src/timer/tstamp-event.h                      | 24 ------
 src/timer/user-instance.c                     | 56 +++++++-------
 src/timer/user-instance.h                     | 17 +++--
 src/utils/string.c                            |  2 +-
 tests/alsatimer-enums                         |  8 +-
 tests/alsatimer-functions                     |  2 +-
 tests/alsatimer-instance-status               |  2 +-
 ...tstamp-event => alsatimer-real-time-event} |  4 +-
 ...r-tick-event => alsatimer-tick-time-event} |  4 +-
 tests/alsatimer-user-instance                 |  8 +-
 tests/meson.build                             |  4 +-
 30 files changed, 324 insertions(+), 322 deletions(-)
 create mode 100644 src/timer/real-time-event.c
 create mode 100644 src/timer/real-time-event.h
 delete mode 100644 src/timer/tick-event.c
 delete mode 100644 src/timer/tick-event.h
 create mode 100644 src/timer/tick-time-event.c
 create mode 100644 src/timer/tick-time-event.h
 delete mode 100644 src/timer/tstamp-event.c
 delete mode 100644 src/timer/tstamp-event.h
 rename tests/{alsatimer-tstamp-event => alsatimer-real-time-event} (84%)
 rename tests/{alsatimer-tick-event => alsatimer-tick-time-event} (83%)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/78
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/78.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
