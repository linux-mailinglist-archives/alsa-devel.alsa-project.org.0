Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBF65514CA
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 11:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78C80174B;
	Mon, 20 Jun 2022 11:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78C80174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655718619;
	bh=LzoYT/BaS36K8StZ0jDEN9cYqvtvSu9OH7NX5WCSS3w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqRZ7RSPT7Tc9/IoHlXFMXMdx2Jv0HuxsVRpEO1BF4j/fGrDa3HwbUvGS6aWQzDBl
	 NNWBnl3+ECYykRucWYHue6ctDHOLrZJMY3lzN1waJ3hx/mGBt6qk/xRxejJI9Qj7Q+
	 QjPccR3oEhmf9ozZBzEzjg1hJQK69qBX/wQVLG8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD726F800E3;
	Mon, 20 Jun 2022 11:49:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 669EEF800FB; Mon, 20 Jun 2022 11:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D558DF800FB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 11:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D558DF800FB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655718555233776093-webhooks-bot@alsa-project.org>
References: <1655718555233776093-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/23] add annotation to object properties
Message-Id: <20220620094918.669EEF800FB@alsa1.perex.cz>
Date: Mon, 20 Jun 2022 11:49:18 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #77 was opened from takaswie:

The gi-docgen tool requires explicit annotation for object properties to generate
pages. This patchset adds missing properties for the purpose.

```
Takashi Sakamoto (23):
  ctl: card: add annotation to object properties
  ctl: card-info: add annotation to object properties
  card: elem-value: add annotation to object properties
  rawmidi: stream-pair: add annotation to object properties
  rawmidi: substream-info: add annotation to object properties
  rawmidi: substream-params: add annotation to object properties
  rawmidi: substream-status: add annotation to object properties
  hwdep: device-info: add annotation to object properties
  timer: device-info: add annotation to object properties
  timer: device-params: add annotation to object properties
  timer: device-status: add annotation to object properties
  timer: instance-info: add annotation to object properties
  timer: instance-params: add annotation to object properties
  timer: instance-status: add annotation to object properties
  seq: fix description of object properties in which enumerations are available
  seq: client-info: add annotation to object properties
  seq: client-pool: add annotation to object properties
  seq: port-info: fix tag indentation
  seq: queue-info: add annotation to object properties
  seq: queue-status: add annotation to object properties
  seq: queue-tempo: add annotation to object properties
  seq: system-info: add annotation to object properties
  seq: user-client: add annotation to object properties

 src/ctl/card-info.c            | 37 ++++++++++++++++++-
 src/ctl/card.c                 | 12 ++++++-
 src/ctl/elem-value.c           |  5 +++
 src/hwdep/device-info.c        | 34 +++++++++++++++---
 src/rawmidi/stream-pair.c      |  7 +++-
 src/rawmidi/substream-info.c   | 66 +++++++++++++++++++++++++++++-----
 src/rawmidi/substream-params.c | 22 +++++++++---
 src/rawmidi/substream-status.c | 10 ++++++
 src/seq/client-info.c          | 59 ++++++++++++++++++++++++++----
 src/seq/client-pool.c          | 52 ++++++++++++++++++++-------
 src/seq/port-info.c            |  2 +-
 src/seq/query.c                |  4 +--
 src/seq/queue-info.c           | 28 ++++++++++++---
 src/seq/queue-status.c         | 19 ++++++++--
 src/seq/queue-tempo.c          | 19 ++++++++--
 src/seq/queue-timer-common.c   |  2 +-
 src/seq/remove-filter.c        | 19 +++++-----
 src/seq/system-info.c          | 30 ++++++++++++++++
 src/seq/user-client.c          | 19 ++++++----
 src/timer/device-info.c        | 46 ++++++++++++++++++++++--
 src/timer/device-params.c      | 10 ++++++
 src/timer/device-status.c      | 15 ++++++++
 src/timer/instance-info.c      | 27 +++++++++++++-
 src/timer/instance-params.c    | 18 ++++++++--
 src/timer/instance-status.c    | 20 +++++++++++
 25 files changed, 506 insertions(+), 76 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/77
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/77.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
