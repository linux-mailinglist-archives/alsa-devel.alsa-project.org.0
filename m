Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E332C25BF4E
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:45:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83666190A;
	Thu,  3 Sep 2020 12:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83666190A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599129953;
	bh=lCb8JkKdIWeCghW6Jsft0oy8or2Y8aOoXpCDuF1OFjQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uemNPechK36oEYUAVyT3b84ljToGwK+uhfNH6cQT+AI6JqKAO8Qg8Vm9F3NQDc2Ua
	 ogzyxbZ4TPdI2Tnb7YkTEfjHkvMC+3f24Pxwirikq6rz23dLxqducPVKqRXnzQ+Akb
	 XGLaHi/0BiXZ06LYpDG7GBHdKMFFlKoUBw1EDrBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E48EDF802E7;
	Thu,  3 Sep 2020 12:42:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95BC4F802DF; Thu,  3 Sep 2020 12:41:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DDD2F8021D
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DDD2F8021D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7D91B01D;
 Thu,  3 Sep 2020 10:41:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/11] ALSA: pcsp: Replace tasklet with work
Date: Thu,  3 Sep 2020 12:41:21 +0200
Message-Id: <20200903104131.21097-2-tiwai@suse.de>
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
converted to another decent API.  This patch replaces the usage of
tasklet in pcsp driver with a simple work.  In pcsp driver, a global
tasklet is used for offloading the period-elapse handling in the
hrtimer callback (introduced in commit 96c7d478efad "ALSA: pcsp - Fix
locking messes in snd-pcsp").  It can be achieved gracefully with a
work queued in the high-prio system workqueue.

This also changes tasklet_kill() with cancel_work_sync() in the
sync_stop callback, which is anyway better to assure canceling the
pending tasks.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcsp/pcsp_lib.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/drivers/pcsp/pcsp_lib.c b/sound/drivers/pcsp/pcsp_lib.c
index 4e79293d7f11..ed40d0f7432c 100644
--- a/sound/drivers/pcsp/pcsp_lib.c
+++ b/sound/drivers/pcsp/pcsp_lib.c
@@ -23,10 +23,10 @@ MODULE_PARM_DESC(nforce_wa, "Apply NForce chipset workaround "
 #define DMIX_WANTS_S16	1
 
 /*
- * Call snd_pcm_period_elapsed in a tasklet
+ * Call snd_pcm_period_elapsed in a work
  * This avoids spinlock messes and long-running irq contexts
  */
-static void pcsp_call_pcm_elapsed(unsigned long priv)
+static void pcsp_call_pcm_elapsed(struct work_struct *work)
 {
 	if (atomic_read(&pcsp_chip.timer_active)) {
 		struct snd_pcm_substream *substream;
@@ -36,7 +36,7 @@ static void pcsp_call_pcm_elapsed(unsigned long priv)
 	}
 }
 
-static DECLARE_TASKLET_OLD(pcsp_pcm_tasklet, pcsp_call_pcm_elapsed);
+static DECLARE_WORK(pcsp_pcm_work, pcsp_call_pcm_elapsed);
 
 /* write the port and returns the next expire time in ns;
  * called at the trigger-start and in hrtimer callback
@@ -119,11 +119,9 @@ static void pcsp_pointer_update(struct snd_pcsp *chip)
 	if (periods_elapsed) {
 		chip->period_ptr += periods_elapsed * period_bytes;
 		chip->period_ptr %= buffer_bytes;
+		queue_work(system_highpri_wq, &pcsp_pcm_work);
 	}
 	spin_unlock_irqrestore(&chip->substream_lock, flags);
-
-	if (periods_elapsed)
-		tasklet_schedule(&pcsp_pcm_tasklet);
 }
 
 enum hrtimer_restart pcsp_do_timer(struct hrtimer *handle)
@@ -196,7 +194,7 @@ void pcsp_sync_stop(struct snd_pcsp *chip)
 	pcsp_stop_playing(chip);
 	local_irq_enable();
 	hrtimer_cancel(&chip->timer);
-	tasklet_kill(&pcsp_pcm_tasklet);
+	cancel_work_sync(&pcsp_pcm_work);
 }
 
 static int snd_pcsp_playback_close(struct snd_pcm_substream *substream)
-- 
2.16.4

