Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2255B8C5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 10:53:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA509163C;
	Mon, 27 Jun 2022 10:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA509163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656320003;
	bh=+I84mqRfu8utyAkOO5NMkDVw/CodPodzq7gTgnSDRwY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLGraxfxO6eJBzO8+0g7dEiqU/hSwZaUvoHpskZ1aMxfiHQfN5s/fF+D3opZhEQpS
	 vb8T9wDEj+XjanMz6qqyvYhB/YHa3spEjQuHEz9FlDvPu4ULeWbs0uhdgXjmMggQvi
	 DCQFR6GojLMoyfRtN9gxKycj78kFwoZyw24SDpo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 610CDF800E9;
	Mon, 27 Jun 2022 10:52:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A69FF8028B; Mon, 27 Jun 2022 10:52:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 10C69F80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 10:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10C69F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656319936199795008-webhooks-bot@alsa-project.org>
References: <1656319936199795008-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/5] seq: code change for cell helper functionalities
Message-Id: <20220627085223.2A69FF8028B@alsa1.perex.cz>
Date: Mon, 27 Jun 2022 10:52:23 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #80 was opened from takaswie:

In design of ALSA Sequencer, cell is a unit to deliver events.

This patchset adds code change for helper functionalities.

```
Takashi Sakamoto (5):
  event: add public API to compute pool consumption when scheduling event
  client-pool: change signedness for size properties
  user-client/client-pool: update function comments about event scheduling
  all: replace 'represent' with 'express' in comments
  ci: separate libudev-dev installation from the other

 .github/workflows/build.yml    |  3 +-
 doc/ctl/overview.md            |  2 +-
 doc/rawmidi/overview.md        |  2 +-
 doc/seq/overview.md            |  6 +--
 doc/timer/overview.md          |  2 +-
 src/ctl/card-info.c            |  2 +-
 src/ctl/card.c                 |  6 +--
 src/ctl/elem-id.c              |  4 +-
 src/hwdep/device-info.c        |  4 +-
 src/rawmidi/stream-pair.c      |  6 +--
 src/rawmidi/substream-info.c   |  4 +-
 src/rawmidi/substream-params.c |  4 +-
 src/rawmidi/substream-status.c |  4 +-
 src/seq/addr.c                 |  4 +-
 src/seq/alsaseq.map            |  1 +
 src/seq/client-info.c          |  4 +-
 src/seq/client-pool.c          | 91 ++++++++++++++++++----------------
 src/seq/event-data-connect.c   |  4 +-
 src/seq/event-data-ctl.c       |  4 +-
 src/seq/event-data-note.c      |  4 +-
 src/seq/event-data-queue.c     |  4 +-
 src/seq/event-data-result.c    |  4 +-
 src/seq/event.c                | 16 ++++++
 src/seq/event.h                |  2 +
 src/seq/port-info.c            |  4 +-
 src/seq/queue-info.c           |  4 +-
 src/seq/queue-status.c         |  4 +-
 src/seq/queue-tempo.c          |  4 +-
 src/seq/remove-filter.c        |  4 +-
 src/seq/subscribe-data.c       |  4 +-
 src/seq/system-info.c          |  4 +-
 src/seq/user-client.c          | 16 ++++--
 src/timer/device-id.c          |  4 +-
 src/timer/device-info.c        |  4 +-
 src/timer/device-params.c      |  4 +-
 src/timer/device-status.c      |  4 +-
 src/timer/instance-info.c      |  4 +-
 src/timer/instance-params.c    |  4 +-
 src/timer/instance-status.c    |  2 +-
 src/timer/user-instance.c      |  6 +--
 tests/alsaseq-event            |  1 +
 41 files changed, 148 insertions(+), 116 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/80
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/80.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
