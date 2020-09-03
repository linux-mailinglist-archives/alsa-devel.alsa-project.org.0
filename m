Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC3F25BF3B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A9A18E9;
	Thu,  3 Sep 2020 12:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A9A18E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599129814;
	bh=Ru5RKXwZrmgzkKcRWpZxQ4dDQHg60gcAL9JvXNvTLTo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oTMH5BgxsDkBbDrHWJUNdgIknTR4IBesnmIFTj6xA4JnU6QQLU5+J6Ijuk+pU0EJN
	 ppLabf770xFNoQ6ZWRps7YkI1vZQJ8bKNNUW476nzwhioMEH4XGNk6a/1ix9iUTERe
	 1MffNCiFXovvPfCSgZzz/NMdNbARtDUUxwAEWvVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68871F802DB;
	Thu,  3 Sep 2020 12:41:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F14BDF802DC; Thu,  3 Sep 2020 12:41:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6766CF8020D
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6766CF8020D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC989B145;
 Thu,  3 Sep 2020 10:41:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/11] ALSA: timer: Replace tasklet with work
Date: Thu,  3 Sep 2020 12:41:22 +0200
Message-Id: <20200903104131.21097-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200903104131.21097-1-tiwai@suse.de>
References: <20200903104131.21097-1-tiwai@suse.de>
Cc: Clemens Ladisch <clemens@ladisch.de>
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

The tasklet is an old API that should be deprecated, usually can be
converted to another decent API.  In ALSA core timer API, the
callbacks can be offlined to a tasklet when a flag is set in the timer
backend.  It can be achieved gracefully with a work queued in the
high-prio system workqueue.

This patch replaces the usage of tasklet in ALSA timer API with a
simple work.  Currently the tasklet feature is used only in the system
timer and hrtimer backends, so both are patched to use the new flag
name SNDRV_TIMER_HW_WORK, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/timer.h |  8 ++++----
 sound/core/hrtimer.c  |  2 +-
 sound/core/timer.c    | 20 ++++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/sound/timer.h b/include/sound/timer.h
index 23e885d31525..760e132cc0cd 100644
--- a/include/sound/timer.h
+++ b/include/sound/timer.h
@@ -21,13 +21,13 @@
 #define SNDRV_TIMER_HW_STOP	0x00000002	/* call stop before start */
 #define SNDRV_TIMER_HW_SLAVE	0x00000004	/* only slave timer (variable resolution) */
 #define SNDRV_TIMER_HW_FIRST	0x00000008	/* first tick can be incomplete */
-#define SNDRV_TIMER_HW_TASKLET	0x00000010	/* timer is called from tasklet */
+#define SNDRV_TIMER_HW_WORK	0x00000010	/* timer is called from work */
 
 #define SNDRV_TIMER_IFLG_SLAVE	  0x00000001
 #define SNDRV_TIMER_IFLG_RUNNING  0x00000002
 #define SNDRV_TIMER_IFLG_START	  0x00000004
 #define SNDRV_TIMER_IFLG_AUTO	  0x00000008	/* auto restart */
-#define SNDRV_TIMER_IFLG_FAST	  0x00000010	/* fast callback (do not use tasklet) */
+#define SNDRV_TIMER_IFLG_FAST	  0x00000010	/* fast callback (do not use work) */
 #define SNDRV_TIMER_IFLG_CALLBACK 0x00000020	/* timer callback is active */
 #define SNDRV_TIMER_IFLG_EXCLUSIVE 0x00000040	/* exclusive owner - no more instances */
 #define SNDRV_TIMER_IFLG_EARLY_EVENT 0x00000080	/* write early event to the poll queue */
@@ -74,7 +74,7 @@ struct snd_timer {
 	struct list_head active_list_head;
 	struct list_head ack_list_head;
 	struct list_head sack_list_head; /* slow ack list head */
-	struct tasklet_struct task_queue;
+	struct work_struct task_work;
 	int max_instances;	/* upper limit of timer instances */
 	int num_instances;	/* current number of timer instances */
 };
@@ -96,7 +96,7 @@ struct snd_timer_instance {
 	unsigned long ticks;		/* auto-load ticks when expired */
 	unsigned long cticks;		/* current ticks */
 	unsigned long pticks;		/* accumulated ticks for callback */
-	unsigned long resolution;	/* current resolution for tasklet */
+	unsigned long resolution;	/* current resolution for work */
 	unsigned long lost;		/* lost ticks */
 	int slave_class;
 	unsigned int slave_id;
diff --git a/sound/core/hrtimer.c b/sound/core/hrtimer.c
index c61ba52a530a..e97ff8cccb64 100644
--- a/sound/core/hrtimer.c
+++ b/sound/core/hrtimer.c
@@ -114,7 +114,7 @@ static int snd_hrtimer_stop(struct snd_timer *t)
 }
 
 static const struct snd_timer_hardware hrtimer_hw __initconst = {
-	.flags =	SNDRV_TIMER_HW_AUTO | SNDRV_TIMER_HW_TASKLET,
+	.flags =	SNDRV_TIMER_HW_AUTO | SNDRV_TIMER_HW_WORK,
 	.open =		snd_hrtimer_open,
 	.close =	snd_hrtimer_close,
 	.start =	snd_hrtimer_start,
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 6e27d87b18ed..4e74aa3d9e1f 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -813,12 +813,12 @@ static void snd_timer_clear_callbacks(struct snd_timer *timer,
 }
 
 /*
- * timer tasklet
+ * timer work
  *
  */
-static void snd_timer_tasklet(struct tasklet_struct *t)
+static void snd_timer_work(struct work_struct *work)
 {
-	struct snd_timer *timer = from_tasklet(timer, t, task_queue);
+	struct snd_timer *timer = container_of(work, struct snd_timer, task_work);
 	unsigned long flags;
 
 	if (timer->card && timer->card->shutdown) {
@@ -843,7 +843,7 @@ void snd_timer_interrupt(struct snd_timer * timer, unsigned long ticks_left)
 	unsigned long resolution;
 	struct list_head *ack_list_head;
 	unsigned long flags;
-	int use_tasklet = 0;
+	bool use_work = false;
 
 	if (timer == NULL)
 		return;
@@ -884,7 +884,7 @@ void snd_timer_interrupt(struct snd_timer * timer, unsigned long ticks_left)
 			--timer->running;
 			list_del_init(&ti->active_list);
 		}
-		if ((timer->hw.flags & SNDRV_TIMER_HW_TASKLET) ||
+		if ((timer->hw.flags & SNDRV_TIMER_HW_WORK) ||
 		    (ti->flags & SNDRV_TIMER_IFLG_FAST))
 			ack_list_head = &timer->ack_list_head;
 		else
@@ -919,11 +919,11 @@ void snd_timer_interrupt(struct snd_timer * timer, unsigned long ticks_left)
 	snd_timer_process_callbacks(timer, &timer->ack_list_head);
 
 	/* do we have any slow callbacks? */
-	use_tasklet = !list_empty(&timer->sack_list_head);
+	use_work = !list_empty(&timer->sack_list_head);
 	spin_unlock_irqrestore(&timer->lock, flags);
 
-	if (use_tasklet)
-		tasklet_schedule(&timer->task_queue);
+	if (use_work)
+		queue_work(system_highpri_wq, &timer->task_work);
 }
 EXPORT_SYMBOL(snd_timer_interrupt);
 
@@ -967,7 +967,7 @@ int snd_timer_new(struct snd_card *card, char *id, struct snd_timer_id *tid,
 	INIT_LIST_HEAD(&timer->ack_list_head);
 	INIT_LIST_HEAD(&timer->sack_list_head);
 	spin_lock_init(&timer->lock);
-	tasklet_setup(&timer->task_queue, snd_timer_tasklet);
+	INIT_WORK(&timer->task_work, snd_timer_work);
 	timer->max_instances = 1000; /* default limit per timer */
 	if (card != NULL) {
 		timer->module = card->module;
@@ -1200,7 +1200,7 @@ static int snd_timer_s_close(struct snd_timer *timer)
 
 static const struct snd_timer_hardware snd_timer_system =
 {
-	.flags =	SNDRV_TIMER_HW_FIRST | SNDRV_TIMER_HW_TASKLET,
+	.flags =	SNDRV_TIMER_HW_FIRST | SNDRV_TIMER_HW_WORK,
 	.resolution =	1000000000L / HZ,
 	.ticks =	10000000L,
 	.close =	snd_timer_s_close,
-- 
2.16.4

