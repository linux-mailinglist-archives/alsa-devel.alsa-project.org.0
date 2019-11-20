Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4275103975
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 13:03:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 450E21700;
	Wed, 20 Nov 2019 13:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 450E21700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574251409;
	bh=8A0lFkCITVAh0RyEv2vwWWQ8qptP3tiJzzEOfGMP8YI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oiny4WAIJscac9hTYxO5Qw4HlfVlo85Qic9FAHLIe2UX7iw+qzDzKmRZKWrhZPwix
	 gzI4wiEt1ygwTprnoHXqsBE4qAI4KGABfDXJzATbYpVeGLVJNJT8fir//SkFD5MxAn
	 wVdPM1aMNOobT+8jX0ltXvyHc8131O0BD1B+CagE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E762AF8019B;
	Wed, 20 Nov 2019 13:00:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38AE5F80159; Wed, 20 Nov 2019 12:59:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C59EF8013F
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 12:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C59EF8013F
IronPort-SDR: 67Qgs6MdMmP37IhF2EfLd/AdECAn5TfUNdy0kjakd80DNYHlWYfawVP/9YAQOzlLlFLbwT7ZWA
 WF0prOBAIE6sXzFlZCjt8BOT9jZYRWA+dHbwi8HoWjnLvFZxw6WHjEm3WqFpWj4li5ZUYgQOkB
 mVQvUOV0zJkPKDnY2uk4qDbMlQj6YRd+hQ1XE3meAwtMm1jw1KMrCccuVIAV+SNU8rQeXEzMwu
 wkeM0Wy869QPTzmfpyGQMKTQlwBfq58T7jY6frJ0AZYXHLOx6AXB9beTjNk1IUAfDPa39yXiYy
 9Y4=
X-IronPort-AV: E=Sophos;i="5.69,221,1571731200"; d="scan'208";a="45210013"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 20 Nov 2019 03:59:39 -0800
IronPort-SDR: Mdf9IwEDzPNNXIuWnuo+++pif6FGgNPUQEVs7wPamekTX6vEgh8BZlQ3jzj/dFqDvvzas0Yym6
 tVubTn/vmowF6JcDL1iz9nvpEvAKkncvjYTjBNy2lZ4IEPM5ESoekFHTPJpZTJrA6zXMiIPPHq
 3r8DsDf4gQQuRu7h8otgVRisPV3JNXHVbuG2v4dGZLnmq1+lPSYGIxtNIFNLPt+AYSgkb/0FEW
 9QYDNU7miFY8gqeZBnAqPEW2ZP5cRcPMyVXWSdMtbJJeW7OKwcXgeNd89hs0aoeAgWHeIwFny3
 QGE=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Wed, 20 Nov 2019 05:58:52 -0600
Message-ID: <20191120115856.4125-4-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120115856.4125-3-andrew_gabbasov@mentor.com>
References: <20191120115856.4125-1-andrew_gabbasov@mentor.com>
 <20191120115856.4125-2-andrew_gabbasov@mentor.com>
 <20191120115856.4125-3-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v4 3/7] ALSA: aloop: Use callback functions for
	timer specific implementations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Timo Wischer <twischer@de.adit-jv.com>

This commit only refactors the implementation. It does not change the
behaviour.
It is required to support other timers (e.g sound timer).

Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 113 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 94 insertions(+), 19 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 7919006f70a5..3bfd7c32803c 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -55,8 +55,39 @@ MODULE_PARM_DESC(pcm_notify, "Break capture when PCM format/rate/channels change
 
 #define NO_PITCH 100000
 
+struct loopback_cable;
 struct loopback_pcm;
 
+struct loopback_ops {
+	/* optional
+	 * call in loopback->cable_lock
+	 */
+	int (*open)(struct loopback_pcm *dpcm);
+	/* required
+	 * call in cable->lock
+	 */
+	int (*start)(struct loopback_pcm *dpcm);
+	/* required
+	 * call in cable->lock
+	 */
+	int (*stop)(struct loopback_pcm *dpcm);
+	/* optional */
+	int (*stop_sync)(struct loopback_pcm *dpcm);
+	/* optional */
+	int (*close_substream)(struct loopback_pcm *dpcm);
+	/* optional
+	 * call in loopback->cable_lock
+	 */
+	int (*close_cable)(struct loopback_pcm *dpcm);
+	/* optional
+	 * call in cable->lock
+	 */
+	unsigned int (*pos_update)(struct loopback_cable *cable);
+	/* optional */
+	void (*dpcm_info)(struct loopback_pcm *dpcm,
+			  struct snd_info_buffer *buffer);
+};
+
 struct loopback_cable {
 	spinlock_t lock;
 	struct loopback_pcm *streams[2];
@@ -65,6 +96,8 @@ struct loopback_cable {
 	unsigned int valid;
 	unsigned int running;
 	unsigned int pause;
+	/* timer specific */
+	struct loopback_ops *ops;
 };
 
 struct loopback_setup {
@@ -270,7 +303,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		spin_lock(&cable->lock);	
 		cable->running |= stream;
 		cable->pause &= ~stream;
-		err = loopback_timer_start(dpcm);
+		err = cable->ops->start(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -279,7 +312,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		spin_lock(&cable->lock);	
 		cable->running &= ~stream;
 		cable->pause &= ~stream;
-		err = loopback_timer_stop(dpcm);
+		err = cable->ops->stop(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -288,7 +321,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		spin_lock(&cable->lock);	
 		cable->pause |= stream;
-		err = loopback_timer_stop(dpcm);
+		err = cable->ops->stop(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -298,7 +331,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		spin_lock(&cable->lock);
 		dpcm->last_jiffies = jiffies;
 		cable->pause &= ~stream;
-		err = loopback_timer_start(dpcm);
+		err = cable->ops->start(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -329,9 +362,11 @@ static int loopback_prepare(struct snd_pcm_substream *substream)
 	struct loopback_cable *cable = dpcm->cable;
 	int err, bps, salign;
 
-	err = loopback_timer_stop_sync(dpcm);
-	if (err < 0)
-		return err;
+	if (cable->ops->stop_sync) {
+		err = cable->ops->stop_sync(dpcm);
+		if (err < 0)
+			return err;
+	}
 
 	salign = (snd_pcm_format_physical_width(runtime->format) *
 						runtime->channels) / 8;
@@ -539,6 +574,18 @@ static void loopback_timer_function(struct timer_list *t)
 	spin_unlock_irqrestore(&dpcm->cable->lock, flags);
 }
 
+static void loopback_jiffies_timer_dpcm_info(struct loopback_pcm *dpcm,
+					     struct snd_info_buffer *buffer)
+{
+	snd_iprintf(buffer, "    update_pending:\t%u\n",
+		    dpcm->period_update_pending);
+	snd_iprintf(buffer, "    irq_pos:\t\t%u\n", dpcm->irq_pos);
+	snd_iprintf(buffer, "    period_frac:\t%u\n", dpcm->period_size_frac);
+	snd_iprintf(buffer, "    last_jiffies:\t%lu (%lu)\n",
+		    dpcm->last_jiffies, jiffies);
+	snd_iprintf(buffer, "    timer_expires:\t%lu\n", dpcm->timer.expires);
+}
+
 static snd_pcm_uframes_t loopback_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -546,7 +593,8 @@ static snd_pcm_uframes_t loopback_pointer(struct snd_pcm_substream *substream)
 	snd_pcm_uframes_t pos;
 
 	spin_lock(&dpcm->cable->lock);
-	loopback_pos_update(dpcm->cable);
+	if (dpcm->cable->ops->pos_update)
+		dpcm->cable->ops->pos_update(dpcm->cable);
 	pos = dpcm->buf_pos;
 	spin_unlock(&dpcm->cable->lock);
 	return bytes_to_frames(runtime, pos);
@@ -671,12 +719,33 @@ static void free_cable(struct snd_pcm_substream *substream)
 		cable->streams[substream->stream] = NULL;
 		spin_unlock_irq(&cable->lock);
 	} else {
+		struct loopback_pcm *dpcm = substream->runtime->private_data;
+
+		if (cable->ops && cable->ops->close_cable && dpcm)
+			cable->ops->close_cable(dpcm);
 		/* free the cable */
 		loopback->cables[substream->number][dev] = NULL;
 		kfree(cable);
 	}
 }
 
+static int loopback_jiffies_timer_open(struct loopback_pcm *dpcm)
+{
+	timer_setup(&dpcm->timer, loopback_timer_function, 0);
+
+	return 0;
+}
+
+static struct loopback_ops loopback_jiffies_timer_ops = {
+	.open = loopback_jiffies_timer_open,
+	.start = loopback_timer_start,
+	.stop = loopback_timer_stop,
+	.stop_sync = loopback_timer_stop_sync,
+	.close_substream = loopback_timer_stop_sync,
+	.pos_update = loopback_pos_update,
+	.dpcm_info = loopback_jiffies_timer_dpcm_info,
+};
+
 static int loopback_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -694,7 +763,6 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	}
 	dpcm->loopback = loopback;
 	dpcm->substream = substream;
-	timer_setup(&dpcm->timer, loopback_timer_function, 0);
 
 	cable = loopback->cables[substream->number][dev];
 	if (!cable) {
@@ -705,9 +773,17 @@ static int loopback_open(struct snd_pcm_substream *substream)
 		}
 		spin_lock_init(&cable->lock);
 		cable->hw = loopback_pcm_hardware;
+		cable->ops = &loopback_jiffies_timer_ops;
 		loopback->cables[substream->number][dev] = cable;
 	}
 	dpcm->cable = cable;
+	runtime->private_data = dpcm;
+
+	if (cable->ops->open) {
+		err = cable->ops->open(dpcm);
+		if (err < 0)
+			goto unlock;
+	}
 
 	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 
@@ -733,7 +809,9 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto unlock;
 
-	runtime->private_data = dpcm;
+	/* loopback_runtime_free() has not to be called if kfree(dpcm) was
+	 * already called here. Otherwise it will end up with a double free.
+	 */
 	runtime->private_free = loopback_runtime_free;
 	if (get_notify(dpcm))
 		runtime->hw = loopback_pcm_hardware;
@@ -757,12 +835,14 @@ static int loopback_close(struct snd_pcm_substream *substream)
 {
 	struct loopback *loopback = substream->private_data;
 	struct loopback_pcm *dpcm = substream->runtime->private_data;
+	int err = 0;
 
-	loopback_timer_stop_sync(dpcm);
+	if (dpcm->cable->ops->close_substream)
+		err = dpcm->cable->ops->close_substream(dpcm);
 	mutex_lock(&loopback->cable_lock);
 	free_cable(substream);
 	mutex_unlock(&loopback->cable_lock);
-	return 0;
+	return err;
 }
 
 static const struct snd_pcm_ops loopback_pcm_ops = {
@@ -1086,13 +1166,8 @@ static void print_dpcm_info(struct snd_info_buffer *buffer,
 	snd_iprintf(buffer, "    bytes_per_sec:\t%u\n", dpcm->pcm_bps);
 	snd_iprintf(buffer, "    sample_align:\t%u\n", dpcm->pcm_salign);
 	snd_iprintf(buffer, "    rate_shift:\t\t%u\n", dpcm->pcm_rate_shift);
-	snd_iprintf(buffer, "    update_pending:\t%u\n",
-						dpcm->period_update_pending);
-	snd_iprintf(buffer, "    irq_pos:\t\t%u\n", dpcm->irq_pos);
-	snd_iprintf(buffer, "    period_frac:\t%u\n", dpcm->period_size_frac);
-	snd_iprintf(buffer, "    last_jiffies:\t%lu (%lu)\n",
-					dpcm->last_jiffies, jiffies);
-	snd_iprintf(buffer, "    timer_expires:\t%lu\n", dpcm->timer.expires);
+	if (dpcm->cable->ops->dpcm_info)
+		dpcm->cable->ops->dpcm_info(dpcm, buffer);
 }
 
 static void print_substream_info(struct snd_info_buffer *buffer,
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
