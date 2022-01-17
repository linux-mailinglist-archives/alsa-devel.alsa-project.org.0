Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21B490D20
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 18:01:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C931877;
	Mon, 17 Jan 2022 18:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C931877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642438866;
	bh=vCWM391mahdHAJjL6H0oEHOo3B7sCwqL6vruq8eQ2u4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=APRUDWUighfUGnm6yK4upvjrf439xQVjh8/CsQdXu6DGrrXiLeUF9JvmLFzjb6Wgz
	 1XGNe3KnHJ+OXejJ7704Exjn43MHR1Vs3en3wDMTl/41X6WY2AV/6Fu5HO4Iz+YzFk
	 zxySjDbK3a1ewP8TBjLmf90OjzwGywfBVc+pHQ0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2DB5F8025D;
	Mon, 17 Jan 2022 18:00:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED1C6F8025D; Mon, 17 Jan 2022 18:00:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 786C9F8025D
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 17:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 786C9F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sXff+/pw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADF81611C0;
 Mon, 17 Jan 2022 16:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E74C36AEC;
 Mon, 17 Jan 2022 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438796;
 bh=vCWM391mahdHAJjL6H0oEHOo3B7sCwqL6vruq8eQ2u4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sXff+/pw8VO7IZrrkg27mR8fXIqxDuzZ3jNlUetMKS8fvf8x8ECGBEhH4nYuNsxeO
 lUL9HRDrdTXVex9yj/nT7VQcruXBS2AgMWLj46Hw/G+V3Acpgl8SbgIkWY6U1bC9Kq
 5I7ujLEsE5oejZ4qkpTiIBL4gCJRnClyHHKmwlpc/z24dhykVtdPXCK6tDjC1rkt9i
 cPVbJpSKKwZM+TC/FUBkeJSYGGBRAiYTiZV1SN5liqk9xipWR+ay26coTXZ3c2V3vY
 fD82q2B6sdr6m6E+fdinIzJPJrNJVrzEI91gJ3YZOq/FOqzgwRS6PwP2NwdZB9+g4I
 K/IYlOd6+LdNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 25/52] ALSA: seq: Set upper limit of processed
 events
Date: Mon, 17 Jan 2022 11:58:26 -0500
Message-Id: <20220117165853.1470420-25-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 Zqiang <qiang.zhang1211@gmail.com>,
 syzbot+bb950e68b400ab4f65f8@syzkaller.appspotmail.com
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 6fadb494a638d8b8a55864ecc6ac58194f03f327 ]

Currently ALSA sequencer core tries to process the queued events as
much as possible when they become dispatchable.  If applications try
to queue too massive events to be processed at the very same timing,
the sequencer core would still try to process such all events, either
in the interrupt context or via some notifier; in either away, it
might be a cause of RCU stall or such problems.

As a potential workaround for those problems, this patch adds the
upper limit of the amount of events to be processed.  The remaining
events are processed in the next batch, so they won't be lost.

For the time being, it's limited up to 1000 events per queue, which
should be high enough for any normal usages.

Reported-by: Zqiang <qiang.zhang1211@gmail.com>
Reported-by: syzbot+bb950e68b400ab4f65f8@syzkaller.appspotmail.com
Link: https://lore.kernel.org/r/20211102033222.3849-1-qiang.zhang1211@gmail.com
Link: https://lore.kernel.org/r/20211207165146.2888-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/seq/seq_queue.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index d6c02dea976c8..bc933104c3eea 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -235,12 +235,15 @@ struct snd_seq_queue *snd_seq_queue_find_name(char *name)
 
 /* -------------------------------------------------------- */
 
+#define MAX_CELL_PROCESSES_IN_QUEUE	1000
+
 void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 {
 	unsigned long flags;
 	struct snd_seq_event_cell *cell;
 	snd_seq_tick_time_t cur_tick;
 	snd_seq_real_time_t cur_time;
+	int processed = 0;
 
 	if (q == NULL)
 		return;
@@ -263,6 +266,8 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 		if (!cell)
 			break;
 		snd_seq_dispatch_event(cell, atomic, hop);
+		if (++processed >= MAX_CELL_PROCESSES_IN_QUEUE)
+			goto out; /* the rest processed at the next batch */
 	}
 
 	/* Process time queue... */
@@ -272,14 +277,19 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 		if (!cell)
 			break;
 		snd_seq_dispatch_event(cell, atomic, hop);
+		if (++processed >= MAX_CELL_PROCESSES_IN_QUEUE)
+			goto out; /* the rest processed at the next batch */
 	}
 
+ out:
 	/* free lock */
 	spin_lock_irqsave(&q->check_lock, flags);
 	if (q->check_again) {
 		q->check_again = 0;
-		spin_unlock_irqrestore(&q->check_lock, flags);
-		goto __again;
+		if (processed < MAX_CELL_PROCESSES_IN_QUEUE) {
+			spin_unlock_irqrestore(&q->check_lock, flags);
+			goto __again;
+		}
 	}
 	q->check_blocked = 0;
 	spin_unlock_irqrestore(&q->check_lock, flags);
-- 
2.34.1

