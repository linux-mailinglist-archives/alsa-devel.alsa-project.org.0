Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F92A3DF8
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:48:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE0DA1761;
	Tue,  3 Nov 2020 08:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE0DA1761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389712;
	bh=lhw9FnjD6Wwwvzfpr9PEb9Dfr5qwa1WPnFbHC8N3SYQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OR9bPwgdVkkUpVQJ0Uj9Q8tRB+CHHyv+XqJWlxgPmmq4K862CNYdYiV+6SeYQG5zC
	 WNkTcawJg2mT5ovjkeTkhnF/x1qNWJ8xh57724va+VPzBc2+FL3+mRdUy+8W1oL0O4
	 cbeH/+g29NyVv3g5ZIoDuWppK89y4Lg9jy8fXauA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE5CF804C3;
	Tue,  3 Nov 2020 08:45:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2598EF80232; Mon,  2 Nov 2020 08:12:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL
 autolearn=disabled version=3.4.0
Received: from zerg.cs.ucr.edu (zerg.cs.ucr.edu [169.235.26.103])
 by alsa1.perex.cz (Postfix) with ESMTP id 1AD12F8015A
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 08:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AD12F8015A
Received: by zerg.cs.ucr.edu (Postfix, from userid 69049)
 id 9ADE41C20851; Sun,  1 Nov 2020 23:11:57 -0800 (PST)
From: Yu Hao <yuhaobehappy@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] sound/core/seq: remove dead code
Date: Sun,  1 Nov 2020 23:11:54 -0800
Message-Id: <20201102071154.23563-1-yuhaobehappy@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:21 +0100
Cc: yuhaobehappy@gmail.com, linux-kernel@vger.kernel.org
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

The function snd_seq_queue_client_termination() is only called from
function seq_free_client1(). The seq_free_client1() calls function
snd_seq_queue_client_leave(), which deletes all objects whose owner
equals to client->number in global array queue_list, before the function
snd_seq_queue_client_termination(), which checks whether there are
any objects in global array queue_list whose owner equals to
client->number, with the same argument client->number. So
the checking code in function snd_seq_queue_client_termination() is
dead code. Remove those dead code.

Signed-off-by: Yu Hao <yuhaobehappy@gmail.com>
---
 sound/core/seq/seq_queue.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index 71a6ea62c3be..91b3f3295d0b 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -545,21 +545,10 @@ void snd_seq_queue_client_termination(int client)
 	unsigned long flags;
 	int i;
 	struct snd_seq_queue *q;
-	bool matched;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
 		if ((q = queueptr(i)) == NULL)
 			continue;
-		spin_lock_irqsave(&q->owner_lock, flags);
-		matched = (q->owner == client);
-		if (matched)
-			q->klocked = 1;
-		spin_unlock_irqrestore(&q->owner_lock, flags);
-		if (matched) {
-			if (q->timer->running)
-				snd_seq_timer_stop(q->timer);
-			snd_seq_timer_reset(q->timer);
-		}
 		queuefree(q);
 	}
 }
-- 
2.17.1

