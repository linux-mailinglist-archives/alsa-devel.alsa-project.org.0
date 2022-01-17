Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D790490DDF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 18:06:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFFF118CF;
	Mon, 17 Jan 2022 18:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFFF118CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642439185;
	bh=khj1TPKAGtqZ8SRnFW3L1kpEHrsWYchWuXRxLdSbLMw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vRcbt1lVjWJVrWld5XI+5X7HKcPHXtPcwMrcXsqa+iYsrOrW6O5ZehlUSKxnxTxqC
	 7Hp5xBffSA51KKwq4DY4QF7OlGEHp+oTiDVhAu+WGpu1qUEFg4x7cQtlWGfl8vAGGB
	 iL8HPC2MP4L98sbH9aadExSJPsFbDOgvK7vuiGOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE2FF8047B;
	Mon, 17 Jan 2022 18:05:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59CEAF8025D; Mon, 17 Jan 2022 18:05:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE061F8014B
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 18:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE061F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HI7i0jrs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59C72B8114B;
 Mon, 17 Jan 2022 17:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C02C36AE3;
 Mon, 17 Jan 2022 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642439130;
 bh=khj1TPKAGtqZ8SRnFW3L1kpEHrsWYchWuXRxLdSbLMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HI7i0jrsbn+8yZ4VHxpAbzVRpoeym/wdSh0JDY5JdPApn50f5qmUI+FlDOdcJ0Mk1
 O7U9A1BiTbDkDfu3YGxAkX+aGTXYRYpBBILndDSv3fqyt/9hrCcKLjho6EQ3j1XhSR
 Al99zYthqQmpRE6clXa2isTIOik2cYD0pHAl+DM0g5dKSQfGgXzA4dc6XzCw6UQyf4
 zX8RTA8ho+g/hcIlWZg3eLLnoD2emTW7G9pezNz8M0k9lz5YmV9wagRQvWTPC+ZGU9
 8J/mqUDmF6ooTlJz7gNYcgSy92Q2KMlT+piFJVsXJeddbCErbu1IQyk+7G61WNQmtF
 hskLtOaERZXCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 15/21] ALSA: seq: Set upper limit of processed
 events
Date: Mon, 17 Jan 2022 12:04:47 -0500
Message-Id: <20220117170454.1472347-15-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170454.1472347-1-sashal@kernel.org>
References: <20220117170454.1472347-1-sashal@kernel.org>
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
index 71a6ea62c3be7..4ff0b927230c2 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -234,12 +234,15 @@ struct snd_seq_queue *snd_seq_queue_find_name(char *name)
 
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
@@ -262,6 +265,8 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 		if (!cell)
 			break;
 		snd_seq_dispatch_event(cell, atomic, hop);
+		if (++processed >= MAX_CELL_PROCESSES_IN_QUEUE)
+			goto out; /* the rest processed at the next batch */
 	}
 
 	/* Process time queue... */
@@ -271,14 +276,19 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
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

