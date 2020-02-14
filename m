Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC59715D668
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 12:16:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855701614;
	Fri, 14 Feb 2020 12:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855701614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581678976;
	bh=s4p7oqrNvGhu/tcNiHAYUDs3uzx24UDqtgVmk7VQqqI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyrKkR/26wukqwDmRzpaQUhqVdKgQCBscFj0WCWOyivGjQdLoihJsUYXFWnBia9im
	 ILj69bAjkk6g9OadBLrjejjAZqJqOws6rPBV4P+73MTRzEmQPnuAM052qu6eCi/xB6
	 hTQM696khhJh5j4sj7E3un0jxNByANSVC2BODldA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3BE0F80276;
	Fri, 14 Feb 2020 12:13:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4629F80277; Fri, 14 Feb 2020 12:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F9A5F8014F
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 12:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F9A5F8014F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 43B51B1CB
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 11:13:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 14 Feb 2020 12:13:14 +0100
Message-Id: <20200214111316.26939-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200214111316.26939-1-tiwai@suse.de>
References: <20200214111316.26939-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 1/3] ALSA: seq: Avoid concurrent access to
	queue flags
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The queue flags are represented in bit fields and the concurrent
access may result in unexpected results.  Although the current code
should be mostly OK as it's only reading a field while writing other
fields as KCSAN reported, it's safer to cover both with a proper
spinlock protection.

This patch fixes the possible concurrent read by protecting with
q->owner_lock.  Also the queue owner field is protected as well since
it's the field to be protected by the lock itself.

Reported-by: syzbot+65c6c92d04304d0a8efc@syzkaller.appspotmail.com
Reported-by: syzbot+e60ddfa48717579799dd@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_queue.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index caf68bf42f13..20c552cf8398 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -392,6 +392,7 @@ int snd_seq_queue_check_access(int queueid, int client)
 int snd_seq_queue_set_owner(int queueid, int client, int locked)
 {
 	struct snd_seq_queue *q = queueptr(queueid);
+	unsigned long flags;
 
 	if (q == NULL)
 		return -EINVAL;
@@ -401,8 +402,10 @@ int snd_seq_queue_set_owner(int queueid, int client, int locked)
 		return -EPERM;
 	}
 
+	spin_lock_irqsave(&q->owner_lock, flags);
 	q->locked = locked ? 1 : 0;
 	q->owner = client;
+	spin_unlock_irqrestore(&q->owner_lock, flags);
 	queue_access_unlock(q);
 	queuefree(q);
 
@@ -539,15 +542,17 @@ void snd_seq_queue_client_termination(int client)
 	unsigned long flags;
 	int i;
 	struct snd_seq_queue *q;
+	bool matched;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
 		if ((q = queueptr(i)) == NULL)
 			continue;
 		spin_lock_irqsave(&q->owner_lock, flags);
-		if (q->owner == client)
+		matched = (q->owner == client);
+		if (matched)
 			q->klocked = 1;
 		spin_unlock_irqrestore(&q->owner_lock, flags);
-		if (q->owner == client) {
+		if (matched) {
 			if (q->timer->running)
 				snd_seq_timer_stop(q->timer);
 			snd_seq_timer_reset(q->timer);
@@ -739,6 +744,8 @@ void snd_seq_info_queues_read(struct snd_info_entry *entry,
 	int i, bpm;
 	struct snd_seq_queue *q;
 	struct snd_seq_timer *tmr;
+	bool locked;
+	int owner;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
 		if ((q = queueptr(i)) == NULL)
@@ -750,9 +757,14 @@ void snd_seq_info_queues_read(struct snd_info_entry *entry,
 		else
 			bpm = 0;
 
+		spin_lock_irq(&q->owner_lock);
+		locked = q->locked;
+		owner = q->owner;
+		spin_unlock_irq(&q->owner_lock);
+
 		snd_iprintf(buffer, "queue %d: [%s]\n", q->queue, q->name);
-		snd_iprintf(buffer, "owned by client    : %d\n", q->owner);
-		snd_iprintf(buffer, "lock status        : %s\n", q->locked ? "Locked" : "Free");
+		snd_iprintf(buffer, "owned by client    : %d\n", owner);
+		snd_iprintf(buffer, "lock status        : %s\n", locked ? "Locked" : "Free");
 		snd_iprintf(buffer, "queued time events : %d\n", snd_seq_prioq_avail(q->timeq));
 		snd_iprintf(buffer, "queued tick events : %d\n", snd_seq_prioq_avail(q->tickq));
 		snd_iprintf(buffer, "timer state        : %s\n", tmr->running ? "Running" : "Stopped");
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
