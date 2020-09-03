Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA225BF56
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:47:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE3F617E9;
	Thu,  3 Sep 2020 12:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE3F617E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130073;
	bh=TnskInyiGqOJJIRbqeAFs1rqGJOavEZgKDdTec1gf/E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U344ulWocOukoVXnPZ8OHRH76pOh/9NATjzZssdSYMcov5vywManD6Cn5iGNUMcF1
	 N8fcNbwRhtasV+7MDKvPsr5vJmhLzGg1hIhjb5k2r3olSsXczWKNGsaRWNiluotp/n
	 51ww/6Xbt3jvSjOU9oLOF483eiNPTauk8unlIDy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B0CF80316;
	Thu,  3 Sep 2020 12:42:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6B0BF802F7; Thu,  3 Sep 2020 12:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B47F0F802A1
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B47F0F802A1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C884EB14D;
 Thu,  3 Sep 2020 10:41:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/11] ALSA: aloop: Replace tasklet with work
Date: Thu,  3 Sep 2020 12:41:25 +0200
Message-Id: <20200903104131.21097-6-tiwai@suse.de>
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
converted to another decent API.  In aloop driver, a tasklet is still
used for offloading the timer event task.  It can be achieved
gracefully with a work queued, too.

This patch replaces the tasklet usage in aloop driver with a simple
work.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 251eaf1152e2..c91356326699 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -110,7 +110,7 @@ struct loopback_cable {
 	struct {
 		int stream;
 		struct snd_timer_id id;
-		struct tasklet_struct event_tasklet;
+		struct work_struct event_work;
 		struct snd_timer_instance *instance;
 	} snd_timer;
 };
@@ -309,8 +309,8 @@ static int loopback_snd_timer_close_cable(struct loopback_pcm *dpcm)
 	 */
 	snd_timer_close(cable->snd_timer.instance);
 
-	/* wait till drain tasklet has finished if requested */
-	tasklet_kill(&cable->snd_timer.event_tasklet);
+	/* wait till drain work has finished if requested */
+	cancel_work_sync(&cable->snd_timer.event_work);
 
 	snd_timer_instance_free(cable->snd_timer.instance);
 	memset(&cable->snd_timer, 0, sizeof(cable->snd_timer));
@@ -794,11 +794,11 @@ static void loopback_snd_timer_function(struct snd_timer_instance *timeri,
 					  resolution);
 }
 
-static void loopback_snd_timer_tasklet(unsigned long arg)
+static void loopback_snd_timer_work(struct work_struct *work)
 {
-	struct snd_timer_instance *timeri = (struct snd_timer_instance *)arg;
-	struct loopback_cable *cable = timeri->callback_data;
+	struct loopback_cable *cable;
 
+	cable = container_of(work, struct loopback_cable, snd_timer.event_work);
 	loopback_snd_timer_period_elapsed(cable, SNDRV_TIMER_EVENT_MSTOP, 0);
 }
 
@@ -828,9 +828,9 @@ static void loopback_snd_timer_event(struct snd_timer_instance *timeri,
 		 * state the streaming will be aborted by the usual timeout. It
 		 * should not be aborted here because may be the timer sound
 		 * card does only a recovery and the timer is back soon.
-		 * This tasklet triggers loopback_snd_timer_tasklet()
+		 * This work triggers loopback_snd_timer_work()
 		 */
-		tasklet_schedule(&cable->snd_timer.event_tasklet);
+		schedule_work(&cable->snd_timer.event_work);
 	}
 }
 
@@ -1124,7 +1124,7 @@ static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
 		err = -ENOMEM;
 		goto exit;
 	}
-	/* The callback has to be called from another tasklet. If
+	/* The callback has to be called from another work. If
 	 * SNDRV_TIMER_IFLG_FAST is specified it will be called from the
 	 * snd_pcm_period_elapsed() call of the selected sound card.
 	 * snd_pcm_period_elapsed() helds snd_pcm_stream_lock_irqsave().
@@ -1137,9 +1137,8 @@ static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
 	timeri->callback_data = (void *)cable;
 	timeri->ccallback = loopback_snd_timer_event;
 
-	/* initialise a tasklet used for draining */
-	tasklet_init(&cable->snd_timer.event_tasklet,
-		     loopback_snd_timer_tasklet, (unsigned long)timeri);
+	/* initialise a work used for draining */
+	INIT_WORK(&cable->snd_timer.event_work, loopback_snd_timer_work);
 
 	/* The mutex loopback->cable_lock is kept locked.
 	 * Therefore snd_timer_open() cannot be called a second time
-- 
2.16.4

