Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B32DFF897
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 09:58:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A06DB1693;
	Sun, 17 Nov 2019 09:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A06DB1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573981109;
	bh=FYLyKGgCC1XjSaRMrQ+IDGPtJhI07WJhX5/reBWTqPE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VZkJ0tni8YByJlltJIA5KlgNNBz2BtZblNRWdFARpEwPf1QWdU5O3Jn26KZ7AjRJn
	 GrT3HhRsqxoMXRozwea67pYlAkF2rjljLxmW5gvf2qaT7/AF5zDVbWNf3c0m5xNVzw
	 aS7zyohTTsnfZEGJCGcSktDUTMHCfejj1M7x3lPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4F24F80159;
	Sun, 17 Nov 2019 09:53:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB150F8013A; Sun, 17 Nov 2019 09:53:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3E33F800F1
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 09:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3E33F800F1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1EC44B234
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 08:53:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 17 Nov 2019 09:53:06 +0100
Message-Id: <20191117085308.23915-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191117085308.23915-1-tiwai@suse.de>
References: <20191117085308.23915-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 6/8] ALSA: pcm: Add the support for sync-stop
	operation
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

The standard programming model of a PCM sound driver is to process
snd_pcm_period_elapsed() from an interrupt handler.  When a running
stream is stopped, PCM core calls the trigger-STOP PCM ops, sets the
stream state to SETUP, and moves on to the next step.  This is
performed in an atomic manner -- this could be called from the interrupt
context, after all.

The problem is that, if the stream goes further and reaches to the
CLOSE state immediately, the stream might be still being processed in
snd_pcm_period_elapsed() in the interrupt context, and hits a NULL
dereference.  Such a crash happens because of the atomic operation,
and we can't wait until the stream-stop finishes.

For addressing such a problem, this commit adds a new PCM ops,
sync_stop.  This gets called at the appropriate places that need a
sync with the stream-stop, i.e. at hw_params, prepare and hw_free.

Some drivers already have a similar mechanism implemented locally, and
we'll refactor the code later.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     |  2 ++
 sound/core/pcm_native.c | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 25563317782c..8a89fa6fdd5e 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -59,6 +59,7 @@ struct snd_pcm_ops {
 	int (*hw_free)(struct snd_pcm_substream *substream);
 	int (*prepare)(struct snd_pcm_substream *substream);
 	int (*trigger)(struct snd_pcm_substream *substream, int cmd);
+	int (*sync_stop)(struct snd_pcm_substream *substream);
 	snd_pcm_uframes_t (*pointer)(struct snd_pcm_substream *substream);
 	int (*get_time_info)(struct snd_pcm_substream *substream,
 			struct timespec *system_ts, struct timespec *audio_ts,
@@ -395,6 +396,7 @@ struct snd_pcm_runtime {
 	wait_queue_head_t sleep;	/* poll sleep */
 	wait_queue_head_t tsleep;	/* transfer sleep */
 	struct fasync_struct *fasync;
+	bool stop_operating;		/* sync_stop will be called */
 
 	/* -- private section -- */
 	void *private_data;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 704ea75199e4..163d621ff238 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -568,6 +568,15 @@ static inline void snd_pcm_timer_notify(struct snd_pcm_substream *substream,
 #endif
 }
 
+static void snd_pcm_sync_stop(struct snd_pcm_substream *substream)
+{
+	if (substream->runtime->stop_operating) {
+		substream->runtime->stop_operating = false;
+		if (substream->ops->sync_stop)
+			substream->ops->sync_stop(substream);
+	}
+}
+
 /**
  * snd_pcm_hw_param_choose - choose a configuration defined by @params
  * @pcm: PCM instance
@@ -660,6 +669,8 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 		if (atomic_read(&substream->mmap_count))
 			return -EBADFD;
 
+	snd_pcm_sync_stop(substream);
+
 	params->rmask = ~0U;
 	err = snd_pcm_hw_refine(substream, params);
 	if (err < 0)
@@ -788,6 +799,7 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 	snd_pcm_stream_unlock_irq(substream);
 	if (atomic_read(&substream->mmap_count))
 		return -EBADFD;
+	snd_pcm_sync_stop(substream);
 	if (substream->ops->hw_free)
 		result = substream->ops->hw_free(substream);
 	if (substream->managed_buffer_alloc)
@@ -1313,6 +1325,7 @@ static void snd_pcm_post_stop(struct snd_pcm_substream *substream, int state)
 		runtime->status->state = state;
 		snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTOP);
 	}
+	runtime->stop_operating = true;
 	wake_up(&runtime->sleep);
 	wake_up(&runtime->tsleep);
 }
@@ -1589,6 +1602,7 @@ static void snd_pcm_post_resume(struct snd_pcm_substream *substream, int state)
 	snd_pcm_trigger_tstamp(substream);
 	runtime->status->state = runtime->status->suspended_state;
 	snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MRESUME);
+	snd_pcm_sync_stop(substream);
 }
 
 static const struct action_ops snd_pcm_action_resume = {
@@ -1709,6 +1723,7 @@ static int snd_pcm_pre_prepare(struct snd_pcm_substream *substream,
 static int snd_pcm_do_prepare(struct snd_pcm_substream *substream, int state)
 {
 	int err;
+	snd_pcm_sync_stop(substream);
 	err = substream->ops->prepare(substream);
 	if (err < 0)
 		return err;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
