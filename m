Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3D15D664
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 12:15:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFD461679;
	Fri, 14 Feb 2020 12:14:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFD461679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581678949;
	bh=PMv95LwhzETbTCPUuoybNLn5H0mgtakC+DqiyRWrjjo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e6m7EXy/FCdHpy48s+HuHFNnhKNNfGtIN2rnM0YvQBWeMMRPmzjGIc9+ut6k8hien
	 /sVPBDDSLg6DeOXIX9P0KwI40icuIHg/xDYkou7TdFUh0jUu/E9anuNZrpIYiYnuOq
	 DlTaCPLWns5L4faxFfs2NVDsJ0TwRqyBxYFw70u4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCB68F80228;
	Fri, 14 Feb 2020 12:13:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D717F8014F; Fri, 14 Feb 2020 12:13:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5534BF80138
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 12:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5534BF80138
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 470DCB1CD
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 11:13:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 14 Feb 2020 12:13:15 +0100
Message-Id: <20200214111316.26939-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200214111316.26939-1-tiwai@suse.de>
References: <20200214111316.26939-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/3] ALSA: seq: Fix concurrent access to queue
	current tick/time
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

snd_seq_check_queue() passes the current tick and time of the given
queue as a pointer to snd_seq_prioq_cell_out(), but those might be
updated concurrently by the seq timer update.

Fix it by retrieving the current tick and time via the proper helper
functions at first, and pass those values to snd_seq_prioq_cell_out()
later in the loops.

snd_seq_timer_get_cur_time() takes a new argument and adjusts with the
current system time only when it's requested so; this update isn't
needed for snd_seq_check_queue(), as it's called either from the
interrupt handler or right after queuing.

Also, snd_seq_timer_get_cur_tick() is changed to read the value in the
spinlock for the concurrency, too.

Reported-by: syzbot+fd5e0eaa1a32999173b2@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c |  4 ++--
 sound/core/seq/seq_queue.c     |  9 ++++++---
 sound/core/seq/seq_timer.c     | 13 ++++++++++---
 sound/core/seq/seq_timer.h     |  3 ++-
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 6d9592f0ae1d..cc93157fa950 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -580,7 +580,7 @@ static int update_timestamp_of_queue(struct snd_seq_event *event,
 	event->queue = queue;
 	event->flags &= ~SNDRV_SEQ_TIME_STAMP_MASK;
 	if (real_time) {
-		event->time.time = snd_seq_timer_get_cur_time(q->timer);
+		event->time.time = snd_seq_timer_get_cur_time(q->timer, true);
 		event->flags |= SNDRV_SEQ_TIME_STAMP_REAL;
 	} else {
 		event->time.tick = snd_seq_timer_get_cur_tick(q->timer);
@@ -1659,7 +1659,7 @@ static int snd_seq_ioctl_get_queue_status(struct snd_seq_client *client,
 	tmr = queue->timer;
 	status->events = queue->tickq->cells + queue->timeq->cells;
 
-	status->time = snd_seq_timer_get_cur_time(tmr);
+	status->time = snd_seq_timer_get_cur_time(tmr, true);
 	status->tick = snd_seq_timer_get_cur_tick(tmr);
 
 	status->running = tmr->running;
diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index 20c552cf8398..71a6ea62c3be 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -238,6 +238,8 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 {
 	unsigned long flags;
 	struct snd_seq_event_cell *cell;
+	snd_seq_tick_time_t cur_tick;
+	snd_seq_real_time_t cur_time;
 
 	if (q == NULL)
 		return;
@@ -254,17 +256,18 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 
       __again:
 	/* Process tick queue... */
+	cur_tick = snd_seq_timer_get_cur_tick(q->timer);
 	for (;;) {
-		cell = snd_seq_prioq_cell_out(q->tickq,
-					      &q->timer->tick.cur_tick);
+		cell = snd_seq_prioq_cell_out(q->tickq, &cur_tick);
 		if (!cell)
 			break;
 		snd_seq_dispatch_event(cell, atomic, hop);
 	}
 
 	/* Process time queue... */
+	cur_time = snd_seq_timer_get_cur_time(q->timer, false);
 	for (;;) {
-		cell = snd_seq_prioq_cell_out(q->timeq, &q->timer->cur_time);
+		cell = snd_seq_prioq_cell_out(q->timeq, &cur_time);
 		if (!cell)
 			break;
 		snd_seq_dispatch_event(cell, atomic, hop);
diff --git a/sound/core/seq/seq_timer.c b/sound/core/seq/seq_timer.c
index be59b59c9be4..1645e4142e30 100644
--- a/sound/core/seq/seq_timer.c
+++ b/sound/core/seq/seq_timer.c
@@ -428,14 +428,15 @@ int snd_seq_timer_continue(struct snd_seq_timer *tmr)
 }
 
 /* return current 'real' time. use timeofday() to get better granularity. */
-snd_seq_real_time_t snd_seq_timer_get_cur_time(struct snd_seq_timer *tmr)
+snd_seq_real_time_t snd_seq_timer_get_cur_time(struct snd_seq_timer *tmr,
+					       bool adjust_ktime)
 {
 	snd_seq_real_time_t cur_time;
 	unsigned long flags;
 
 	spin_lock_irqsave(&tmr->lock, flags);
 	cur_time = tmr->cur_time;
-	if (tmr->running) { 
+	if (adjust_ktime && tmr->running) {
 		struct timespec64 tm;
 
 		ktime_get_ts64(&tm);
@@ -452,7 +453,13 @@ snd_seq_real_time_t snd_seq_timer_get_cur_time(struct snd_seq_timer *tmr)
  high PPQ values) */
 snd_seq_tick_time_t snd_seq_timer_get_cur_tick(struct snd_seq_timer *tmr)
 {
-	return tmr->tick.cur_tick;
+	snd_seq_tick_time_t cur_tick;
+	unsigned long flags;
+
+	spin_lock_irqsave(&tmr->lock, flags);
+	cur_tick = tmr->tick.cur_tick;
+	spin_unlock_irqrestore(&tmr->lock, flags);
+	return cur_tick;
 }
 
 
diff --git a/sound/core/seq/seq_timer.h b/sound/core/seq/seq_timer.h
index 66c3e344eae3..4bec57df8158 100644
--- a/sound/core/seq/seq_timer.h
+++ b/sound/core/seq/seq_timer.h
@@ -120,7 +120,8 @@ int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq);
 int snd_seq_timer_set_position_tick(struct snd_seq_timer *tmr, snd_seq_tick_time_t position);
 int snd_seq_timer_set_position_time(struct snd_seq_timer *tmr, snd_seq_real_time_t position);
 int snd_seq_timer_set_skew(struct snd_seq_timer *tmr, unsigned int skew, unsigned int base);
-snd_seq_real_time_t snd_seq_timer_get_cur_time(struct snd_seq_timer *tmr);
+snd_seq_real_time_t snd_seq_timer_get_cur_time(struct snd_seq_timer *tmr,
+					       bool adjust_ktime);
 snd_seq_tick_time_t snd_seq_timer_get_cur_tick(struct snd_seq_timer *tmr);
 
 extern int seq_default_timer_class;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
