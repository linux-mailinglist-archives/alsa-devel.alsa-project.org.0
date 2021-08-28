Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E23FA348
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Aug 2021 05:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3FE01716;
	Sat, 28 Aug 2021 04:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3FE01716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630119622;
	bh=iOa1MyDrhA9ekCwydrhBy4pFC9/WGwCeDUkKCVmW/SA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T5ZM0FG1IJz45GTEWSVFMUrJbpLv7W5Uw1C4GnbAId9xK7qcsQjAkBG5aW2jeMS06
	 VR4qWsz15HkawgE4KIc07dKDn2GCQ46HUr5R9B0hIw2a40jxnIqDXPn8TPyWyclYQc
	 C1OHwAqlHZ8wRV1SmVFNezP//agF7Y7jtjLaeF+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B5BCF8025C;
	Sat, 28 Aug 2021 04:59:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95F2FF80240; Sat, 28 Aug 2021 04:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 817DFF800EE
 for <alsa-devel@alsa-project.org>; Sat, 28 Aug 2021 04:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817DFF800EE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1630119532786392927-webhooks-bot@alsa-project.org>
References: <1630119532786392927-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/2] ctl/rawmidi/hwdep: fix trivial bugs
Message-Id: <20210828025900.95F2FF80240@alsa1.perex.cz>
Date: Sat, 28 Aug 2021 04:59:00 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #62 was opened from takaswie:

Current implementation of libalsactl0, libalsarawmidi0, and libalsahwdep0 includes trivial bugs such as usage of uninitialized local variable. This patchset fixes the bugs.

```
Takashi Sakamoto (2):
  ctl/rawmidi/hwdep: fix compiler warning due to uninitialized variables
  seq: use safer way to copy strings

 src/ctl/query.c       | 4 ++--
 src/hwdep/query.c     | 4 ++--
 src/rawmidi/query.c   | 4 ++--
 src/seq/client-info.c | 2 +-
 src/seq/port-info.c   | 2 +-
 src/seq/query.c       | 2 +-
 src/seq/queue-info.c  | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/62
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/62.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
