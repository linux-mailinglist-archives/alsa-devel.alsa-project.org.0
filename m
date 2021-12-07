Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEC846C10D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 17:53:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4413D19FF;
	Tue,  7 Dec 2021 17:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4413D19FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638895993;
	bh=J7eT9EH4XHANDYpFdOchgkNDvN0EOGHpKSqoz1sWy8A=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ymxozra/wjsazXT/qVd5JiDmZSALPqD0utyVal+AhJ3361WV3nes7idTxLi0eSNOq
	 9vXaQbMnWiwBHS09Qkha9zewV5cZ35st4Dw3RVnJQT4LfNYiTqsy7MorP4uauW6LSo
	 tkiNCQCTJNJJP0JLXQJdqkURLiNDO502kgALyW98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD90F8032B;
	Tue,  7 Dec 2021 17:52:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93DA8F8028D; Tue,  7 Dec 2021 17:51:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B96B8F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 17:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B96B8F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Y4uVfYw8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="eQWgWsYV"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 021A3212BC
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638895907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lZ52rL/ux6CDJBbJifR4dpOb0msaW8zGvrivuxaSkTQ=;
 b=Y4uVfYw8XEYyeImqAaizE0K64UHX9RrX0ATByhjhNi5eis84jR8A7jI3qVWMNjuD2jkyTS
 SG5zmOX/dGS3mxddzNKI2el5f2akhlwWcmcW3Pr8Q6zhRqp17PHorQuquIESdexkrX5xhc
 741StZK0t3o+mUU7XfQ+8KD2OSqxzHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638895907;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lZ52rL/ux6CDJBbJifR4dpOb0msaW8zGvrivuxaSkTQ=;
 b=eQWgWsYVN/5rAY1Qw4+HeM6uya93WB1ige05+3PNAonm3n70ZSBc6jerEMqSmb2+U7hQNr
 CtBZJ3CgLWZLA7AQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E60FFA3B83;
 Tue,  7 Dec 2021 16:51:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: seq: Set upper limit of processed events
Date: Tue,  7 Dec 2021 17:51:46 +0100
Message-Id: <20211207165146.2888-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_queue.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index d6c02dea976c..bc933104c3ee 100644
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
2.31.1

