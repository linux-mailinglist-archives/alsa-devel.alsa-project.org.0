Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D52A5A26
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 23:35:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31AA816A4;
	Tue,  3 Nov 2020 23:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31AA816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604442922;
	bh=DlUvCCn63GVCDgHqHBEFxIPJfNn/K71qmi82mPPzo0M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PUuy+5lwg4FZ0GsUm1CBr2yAORimoxQKwi0PYQj/E+AsRx3sYpG8/K8kMXgqlJ2Il
	 LGuMJQjQbZdqXKSAGvWLWudLiBh7JE0OZGOtibj3DRoLJZU99CXpOm0ipuRBWxDNlt
	 Vvrb4gMTYo84VeoZSPR7l5IKEM15Jb5vAU6/rilI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95A07F80272;
	Tue,  3 Nov 2020 23:33:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF8F3F80171; Tue,  3 Nov 2020 23:33:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL
 autolearn=disabled version=3.4.0
Received: from zerg.cs.ucr.edu (zerg.cs.ucr.edu [169.235.26.103])
 by alsa1.perex.cz (Postfix) with ESMTP id 42589F80108
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 23:33:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42589F80108
Received: by zerg.cs.ucr.edu (Postfix, from userid 69049)
 id A8C121C20852; Tue,  3 Nov 2020 14:33:37 -0800 (PST)
From: Yu Hao <yuhaobehappy@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] sound/core/seq: remove useless function
Date: Tue,  3 Nov 2020 14:33:35 -0800
Message-Id: <20201103223335.21831-1-yuhaobehappy@gmail.com>
X-Mailer: git-send-email 2.17.1
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
the function seq_free_client1(). The function seq_free_client1() calls
the function snd_seq_queue_client_leave() and the function
snd_seq_queue_client_termination() together. Because the function
snd_seq_queue_client_leave() does all things, so the function
snd_seq_queue_client_termination() is a useless function.

Signed-off-by: Yu Hao <yuhaobehappy@gmail.com>
---
 sound/core/seq/seq_clientmgr.c |  1 -
 sound/core/seq/seq_queue.c     | 27 ---------------------------
 sound/core/seq/seq_queue.h     |  3 ---
 3 files changed, 31 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index cc93157fa950..f9f2fea58b32 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -279,7 +279,6 @@ static int seq_free_client1(struct snd_seq_client *client)
 	snd_seq_delete_all_ports(client);
 	snd_seq_queue_client_leave(client->number);
 	snd_use_lock_sync(&client->use_lock);
-	snd_seq_queue_client_termination(client->number);
 	if (client->pool)
 		snd_seq_pool_delete(&client->pool);
 	spin_lock_irq(&clients_lock);
diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index 71a6ea62c3be..13cfc2d47fa7 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -537,33 +537,6 @@ int snd_seq_queue_is_used(int queueid, int client)
 
 /*----------------------------------------------------------------*/
 
-/* notification that client has left the system -
- * stop the timer on all queues owned by this client
- */
-void snd_seq_queue_client_termination(int client)
-{
-	unsigned long flags;
-	int i;
-	struct snd_seq_queue *q;
-	bool matched;
-
-	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		if ((q = queueptr(i)) == NULL)
-			continue;
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
-		queuefree(q);
-	}
-}
-
 /* final stage notification -
  * remove cells for no longer exist client (for non-owned queue)
  * or delete this queue (for owned queue)
diff --git a/sound/core/seq/seq_queue.h b/sound/core/seq/seq_queue.h
index 9254c8dbe5e3..1c3a8d3254d9 100644
--- a/sound/core/seq/seq_queue.h
+++ b/sound/core/seq/seq_queue.h
@@ -59,9 +59,6 @@ struct snd_seq_queue *snd_seq_queue_alloc(int client, int locked, unsigned int f
 /* delete queue (destructor) */
 int snd_seq_queue_delete(int client, int queueid);
 
-/* notification that client has left the system */
-void snd_seq_queue_client_termination(int client);
-
 /* final stage */
 void snd_seq_queue_client_leave(int client);
 
-- 
2.17.1

