Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF8DF0011
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 15:41:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72B3716DC;
	Tue,  5 Nov 2019 15:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72B3716DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572964875;
	bh=k8HFCY5Gmc8CfuR1PqySX7ejzJsV5WQ8587SMPC3MoE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s62/n1wo7irivfD51hKXAPv35hY8nFgumQlHTAJt5+A397gsxYL0JkKEUCZHuT/mz
	 DWqu3Ur5Ta5WfaVSITohrnHXamteVyO5cBPbxAe1OKCXGRtP1bOLhsI6yNU3KjX4TV
	 Fwtpp7sRFmtheZ3+01TyK7DSv/rb37rK5I/aGKeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2369F806E8;
	Tue,  5 Nov 2019 15:34:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AC10F8065E; Tue,  5 Nov 2019 15:34:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3C62F8063C
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3C62F8063C
IronPort-SDR: rgC8yoKK9XRp5sgXov/Uvy02NagEg8/WMwHU6J3LB3MSkEzkJPEr1ZBVPyZO1iwTXPf8aLA5u4
 jq7zYHKQdzF1eSzp/UFWrusMM7NKdpLVGBpoW164ziP7FmJtss3F2MYRVzGSU09g3fGZE878as
 navvytH3tQNazVtPFIM/2zkMqENl6TddrDIwEYU6W9c1aaU8nwvudnD/+Eql7ObwJKKu0Wcsm2
 +Jln7SinHA6C+b6cgG0KvpSbmw/L4p+o/JGyfeW/MJP9mr4ZHPFuso/05JybG6TKPKOGrM8G0H
 kRg=
X-IronPort-AV: E=Sophos;i="5.68,271,1569312000"; d="scan'208";a="44730653"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 05 Nov 2019 06:34:40 -0800
IronPort-SDR: CbPe0mca+udKp534fzrSpiq2pssf2ioI5A1Ar7syclAC7rNqR5I8cANBRoG2vJNOEybLzTLOn6
 Ia6UkbatgEOvmEV/imfFaN/JXgTGHhMFJZ+uGxvo5IY8WLm2oVfTPRFQTvvc/r04f3sKTrtbfd
 y5koEiLAQytC4tUaYrzHilX4LyDnirdJ8555eIV5gHiXhEjympXa3cIsLuNLiUewlV6C63Yg81
 +Ze8EP4xF68peKwPYPIpDtN8PVBJzc4/UDhqh2L05zVqNYpuBy83yUL4GGZjRqL4DrApbvhLeh
 NeA=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Tue, 5 Nov 2019 08:32:17 -0600
Message-ID: <20191105143218.5948-8-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105143218.5948-7-andrew_gabbasov@mentor.com>
References: <20191105143218.5948-1-andrew_gabbasov@mentor.com>
 <20191105143218.5948-2-andrew_gabbasov@mentor.com>
 <20191105143218.5948-3-andrew_gabbasov@mentor.com>
 <20191105143218.5948-4-andrew_gabbasov@mentor.com>
 <20191105143218.5948-5-andrew_gabbasov@mentor.com>
 <20191105143218.5948-6-andrew_gabbasov@mentor.com>
 <20191105143218.5948-7-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v2 7/8] ALSA: aloop: Support selection of
	snd_timer instead of jiffies
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

to do synchronous audio forwarding between hardware sound card and aloop
devices. Such an audio route could look like the following:
Sound card -> Loopback application -> ALSA loop device -> arecord

In this case the loopback device should use the sound timer of the sound
card. Without this patch the loopback application has to implement an
adaptive sample rate converter to align the different clocks of the
different ALSA devices.

The used timer can be selected by referring to a sound card, its device
and subdevice, when loading the module:
  $ modprobe snd_aloop enable=1 timer_source=[<card>[.<dev>[.<subdev>]]]
<card> is the name (id) of the sound card or a card number.
<dev> and <subdev> are device and subdevice numbers (defaults are 0).
Empty string as a value of timer_source= parameter enables previous
functionality (using jiffies timer).

Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 466 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 465 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 313d7ffe6c91..6db70ebd46f6 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -28,6 +28,7 @@
 #include <sound/pcm_params.h>
 #include <sound/info.h>
 #include <sound/initval.h>
+#include <sound/timer.h>
 
 MODULE_AUTHOR("Jaroslav Kysela <perex@perex.cz>");
 MODULE_DESCRIPTION("A loopback soundcard");
@@ -41,6 +42,7 @@ static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
 static bool enable[SNDRV_CARDS] = {1, [1 ... (SNDRV_CARDS - 1)] = 0};
 static int pcm_substreams[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 8};
 static int pcm_notify[SNDRV_CARDS];
+static char *timer_source[SNDRV_CARDS];
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for loopback soundcard.");
@@ -52,6 +54,8 @@ module_param_array(pcm_substreams, int, NULL, 0444);
 MODULE_PARM_DESC(pcm_substreams, "PCM substreams # (1-8) for loopback driver.");
 module_param_array(pcm_notify, int, NULL, 0444);
 MODULE_PARM_DESC(pcm_notify, "Break capture when PCM format/rate/channels changes.");
+module_param_array(timer_source, charp, NULL, 0444);
+MODULE_PARM_DESC(timer_source, "Sound card name or number and device/subdevice number of timer to be used. Empty string for jiffies timer [default].");
 
 #define NO_PITCH 100000
 
@@ -102,6 +106,13 @@ struct loopback_cable {
 	unsigned int pause;
 	/* timer specific */
 	struct loopback_ops *ops;
+	/* If sound timer is used */
+	struct {
+		int owner;
+		struct snd_timer_id id;
+		struct tasklet_struct event_tasklet;
+		struct snd_timer_instance *instance;
+	} snd_timer;
 };
 
 struct loopback_setup {
@@ -122,6 +133,7 @@ struct loopback {
 	struct loopback_cable *cables[MAX_PCM_SUBSTREAMS][2];
 	struct snd_pcm *pcm[2];
 	struct loopback_setup setup[MAX_PCM_SUBSTREAMS][2];
+	char *timer_source;
 };
 
 struct loopback_pcm {
@@ -145,6 +157,7 @@ struct loopback_pcm {
 	unsigned int period_size_frac;	/* period size in jiffies ticks */
 	unsigned int last_drift;
 	unsigned long last_jiffies;
+	/* If jiffies timer is used */
 	struct timer_list timer;
 };
 
@@ -212,6 +225,34 @@ static int loopback_jiffies_timer_start(struct loopback_pcm *dpcm)
 	return 0;
 }
 
+/* call in cable->lock */
+static int loopback_snd_timer_start(struct loopback_pcm *dpcm)
+{
+	int err;
+
+	/* Loopback device has to use same period as timer card. Therefore
+	 * wake up for each snd_pcm_period_elapsed() call of timer card.
+	 */
+	err = snd_timer_start(dpcm->cable->snd_timer.instance, 1);
+	if (err < 0) {
+		/* do not report error if trying to start but already
+		 * running. For example called by opposite substream
+		 * of the same cable
+		 */
+		if (err == -EBUSY)
+			return 0;
+
+		pcm_err(dpcm->substream->pcm,
+			"snd_timer_start(%d,%d,%d) failed with %d",
+			dpcm->cable->snd_timer.id.card,
+			dpcm->cable->snd_timer.id.device,
+			dpcm->cable->snd_timer.id.subdevice,
+			err);
+	}
+
+	return err;
+}
+
 /* call in cable->lock */
 static inline int loopback_jiffies_timer_stop(struct loopback_pcm *dpcm)
 {
@@ -221,6 +262,28 @@ static inline int loopback_jiffies_timer_stop(struct loopback_pcm *dpcm)
 	return 0;
 }
 
+/* call in cable->lock */
+static int loopback_snd_timer_stop(struct loopback_pcm *dpcm)
+{
+	int err;
+
+	/* only stop if both devices (playback and capture) are not running */
+	if (dpcm->cable->running)
+		return 0;
+
+	err = snd_timer_stop(dpcm->cable->snd_timer.instance);
+	if (err < 0) {
+		pcm_err(dpcm->substream->pcm,
+			"snd_timer_stop(%d,%d,%d) failed with %d",
+			dpcm->cable->snd_timer.id.card,
+			dpcm->cable->snd_timer.id.device,
+			dpcm->cable->snd_timer.id.subdevice,
+			err);
+	}
+
+	return err;
+}
+
 static inline int loopback_jiffies_timer_stop_sync(struct loopback_pcm *dpcm)
 {
 	del_timer_sync(&dpcm->timer);
@@ -228,6 +291,37 @@ static inline int loopback_jiffies_timer_stop_sync(struct loopback_pcm *dpcm)
 	return 0;
 }
 
+/* call in loopback->cable_lock */
+static int loopback_snd_timer_close_cable(struct loopback_pcm *dpcm)
+{
+	int err;
+
+	/* snd_timer was not opened */
+	if (!dpcm->cable->snd_timer.instance)
+		return 0;
+
+	/* wait till drain tasklet has finished if requested */
+	tasklet_kill(&dpcm->cable->snd_timer.event_tasklet);
+
+	/* will only be called from free_cable() when other stream was
+	 * already closed. Other stream cannot be reopened as long as
+	 * loopback->cable_lock is locked. Therefore no need to lock
+	 * cable->lock;
+	 */
+	err = snd_timer_close(dpcm->cable->snd_timer.instance);
+	if (err < 0) {
+		pcm_err(dpcm->substream->pcm,
+			"snd_timer_close(%d,%d,%d) failed with %d",
+			dpcm->cable->snd_timer.id.card,
+			dpcm->cable->snd_timer.id.device,
+			dpcm->cable->snd_timer.id.subdevice,
+			err);
+	}
+	memset(&dpcm->cable->snd_timer, 0, sizeof(dpcm->cable->snd_timer));
+
+	return err;
+}
+
 static int loopback_check_format(struct loopback_cable *cable, int stream)
 {
 	struct snd_pcm_runtime *runtime, *cruntime;
@@ -353,6 +447,13 @@ static void params_change(struct snd_pcm_substream *substream)
 	cable->hw.rate_max = runtime->rate;
 	cable->hw.channels_min = runtime->channels;
 	cable->hw.channels_max = runtime->channels;
+
+	if (cable->snd_timer.instance) {
+		cable->hw.period_bytes_min =
+				frames_to_bytes(runtime, runtime->period_size);
+		cable->hw.period_bytes_max = cable->hw.period_bytes_min;
+	}
+
 }
 
 static int loopback_prepare(struct snd_pcm_substream *substream)
@@ -576,6 +677,164 @@ static void loopback_jiffies_timer_function(struct timer_list *t)
 	spin_unlock_irqrestore(&dpcm->cable->lock, flags);
 }
 
+/* call in cable->lock */
+static int loopback_snd_timer_check_resolution(struct snd_pcm_runtime *runtime,
+					       unsigned long resolution)
+{
+	if (resolution != runtime->timer_resolution) {
+		struct loopback_pcm *dpcm = runtime->private_data;
+		struct loopback_cable *cable = dpcm->cable;
+		/* Worst case estimation of possible values for resolution
+		 * resolution <= (512 * 1024) frames / 8kHz in nsec
+		 * resolution <= 65.536.000.000 nsec
+		 *
+		 * period_size <= 65.536.000.000 nsec / 1000nsec/usec * 192kHz +
+		 *  500.000
+		 * period_size <= 12.582.912.000.000  <64bit
+		 *  / 1.000.000 usec/sec
+		 */
+		const snd_pcm_uframes_t period_size_usec = resolution / 1000 *
+				runtime->rate;
+		/* round to nearest sample rate */
+		const snd_pcm_uframes_t period_size = (period_size_usec + 500 *
+						       1000) / (1000 * 1000);
+
+		pcm_err(dpcm->substream->pcm,
+			"Period size (%lu frames) of loopback device is not corresponding to timer resolution (%lu nsec = %lu frames) of card timer %d,%d,%d. Use period size of %lu frames for loopback device.",
+			runtime->period_size, resolution, period_size,
+			cable->snd_timer.id.card,
+			cable->snd_timer.id.device,
+			cable->snd_timer.id.subdevice,
+			period_size);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static void loopback_snd_timer_period_elapsed(
+		struct loopback_cable * const cable,
+		const int event, const unsigned long resolution)
+{
+	struct loopback_pcm *dpcm_play =
+			cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
+	struct loopback_pcm *dpcm_capt =
+			cable->streams[SNDRV_PCM_STREAM_CAPTURE];
+	struct snd_pcm_runtime *valid_runtime;
+	unsigned int running, elapsed_bytes;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cable->lock, flags);
+	running = cable->running ^ cable->pause;
+	/* no need to do anything if no stream is running */
+	if (!running) {
+		spin_unlock_irqrestore(&cable->lock, flags);
+		return;
+	}
+
+	if (event == SNDRV_TIMER_EVENT_MSTOP) {
+		if (!dpcm_play || !dpcm_play->substream ||
+		    !dpcm_play->substream->runtime ||
+		    !dpcm_play->substream->runtime->status ||
+		    dpcm_play->substream->runtime->status->state !=
+		    SNDRV_PCM_STATE_DRAINING) {
+			spin_unlock_irqrestore(&cable->lock, flags);
+			return;
+		}
+	}
+
+	valid_runtime = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
+				dpcm_play->substream->runtime :
+				dpcm_capt->substream->runtime;
+
+	/* resolution is only valid for SNDRV_TIMER_EVENT_TICK events */
+	if (event == SNDRV_TIMER_EVENT_TICK) {
+		/* The hardware rules guarantee that playback and capture period
+		 * are the same. Therefore only one device has to be checked
+		 * here.
+		 */
+		if (loopback_snd_timer_check_resolution(valid_runtime,
+							resolution) < 0) {
+			spin_unlock_irqrestore(&cable->lock, flags);
+			if (cable->running & (1 << SNDRV_PCM_STREAM_PLAYBACK))
+				snd_pcm_stop_xrun(dpcm_play->substream);
+			if (cable->running & (1 << SNDRV_PCM_STREAM_CAPTURE))
+				snd_pcm_stop_xrun(dpcm_capt->substream);
+			return;
+		}
+	}
+
+	elapsed_bytes = frames_to_bytes(valid_runtime,
+					valid_runtime->period_size);
+	/* The same timer interrupt is used for playback and capture device */
+	if ((running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) &&
+	    (running & (1 << SNDRV_PCM_STREAM_CAPTURE))) {
+		copy_play_buf(dpcm_play, dpcm_capt, elapsed_bytes);
+		bytepos_finish(dpcm_play, elapsed_bytes);
+		bytepos_finish(dpcm_capt, elapsed_bytes);
+	} else if (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) {
+		bytepos_finish(dpcm_play, elapsed_bytes);
+	} else if (running & (1 << SNDRV_PCM_STREAM_CAPTURE)) {
+		clear_capture_buf(dpcm_capt, elapsed_bytes);
+		bytepos_finish(dpcm_capt, elapsed_bytes);
+	}
+	spin_unlock_irqrestore(&cable->lock, flags);
+
+	if (running & (1 << SNDRV_PCM_STREAM_PLAYBACK))
+		snd_pcm_period_elapsed(dpcm_play->substream);
+	if (running & (1 << SNDRV_PCM_STREAM_CAPTURE))
+		snd_pcm_period_elapsed(dpcm_capt->substream);
+}
+
+static void loopback_snd_timer_function(struct snd_timer_instance *timeri,
+					unsigned long resolution,
+					unsigned long ticks)
+{
+	struct loopback_cable *cable = timeri->callback_data;
+
+	loopback_snd_timer_period_elapsed(cable, SNDRV_TIMER_EVENT_TICK,
+					  resolution);
+}
+
+static void loopback_snd_timer_tasklet(unsigned long arg)
+{
+	struct snd_timer_instance *timeri = (struct snd_timer_instance *)arg;
+	struct loopback_cable *cable = timeri->callback_data;
+
+	loopback_snd_timer_period_elapsed(cable, SNDRV_TIMER_EVENT_MSTOP, 0);
+}
+
+static void loopback_snd_timer_event(struct snd_timer_instance * const timeri,
+				     const int event,
+				     struct timespec * const tstamp,
+				     const unsigned long resolution)
+{
+	/* Do not lock cable->lock here because timer->lock is already hold.
+	 * There are other functions which first lock cable->lock and than
+	 * timer->lock e.g.
+	 * loopback_trigger()
+	 * spin_lock(&cable->lock)
+	 * loopback_snd_timer_start()
+	 * snd_timer_start()
+	 * spin_lock(&timer->lock)
+	 * Therefore when using the oposit order of locks here it could result
+	 * in a deadlock.
+	 */
+
+	if (event == SNDRV_TIMER_EVENT_MSTOP) {
+		struct loopback_cable *cable = timeri->callback_data;
+
+		/* sound card of the timer was stopped. Therefore there will not
+		 * be any further timer callbacks. Due to this forward audio
+		 * data from here if in draining state. When still in running
+		 * state the streaming will be aborted by the usual timeout. It
+		 * should not be aborted here because may be the timer sound
+		 * card does only a recovery and the timer is back soon.
+		 * This tasklet triggers loopback_snd_timer_tasklet()
+		 */
+		tasklet_schedule(&cable->snd_timer.event_tasklet);
+	}
+}
+
 static void loopback_jiffies_timer_dpcm_info(struct loopback_pcm *dpcm,
 					     struct snd_info_buffer *buffer)
 {
@@ -588,6 +847,18 @@ static void loopback_jiffies_timer_dpcm_info(struct loopback_pcm *dpcm,
 	snd_iprintf(buffer, "    timer_expires:\t%lu\n", dpcm->timer.expires);
 }
 
+static void loopback_snd_timer_dpcm_info(struct loopback_pcm *dpcm,
+					 struct snd_info_buffer *buffer)
+{
+	snd_iprintf(buffer, "    sound timer:\thw:%d,%d,%d\n",
+		    dpcm->cable->snd_timer.id.card,
+		    dpcm->cable->snd_timer.id.device,
+		    dpcm->cable->snd_timer.id.subdevice);
+	snd_iprintf(buffer, "    owner:\t\t%s\n",
+		    (dpcm->cable->snd_timer.owner == SNDRV_PCM_STREAM_CAPTURE) ?
+			    "capture" : "playback");
+}
+
 static snd_pcm_uframes_t loopback_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -707,6 +978,23 @@ static int rule_channels(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
 
+static int rule_period_bytes(struct snd_pcm_hw_params *params,
+			     struct snd_pcm_hw_rule *rule)
+{
+	struct loopback_pcm *dpcm = rule->private;
+	struct loopback_cable *cable = dpcm->cable;
+	struct snd_interval t;
+
+	mutex_lock(&dpcm->loopback->cable_lock);
+	t.min = cable->hw.period_bytes_min;
+	t.max = cable->hw.period_bytes_max;
+	mutex_unlock(&dpcm->loopback->cable_lock);
+	t.openmin = 0;
+	t.openmax = 0;
+	t.integer = 0;
+	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
+}
+
 static void free_cable(struct snd_pcm_substream *substream)
 {
 	struct loopback *loopback = substream->private_data;
@@ -749,6 +1037,152 @@ static struct loopback_ops loopback_jiffies_timer_ops = {
 	.dpcm_info = loopback_jiffies_timer_dpcm_info,
 };
 
+static int loopback_parse_timer_id(const char * const str,
+				   struct snd_timer_id *tid)
+{
+	/* [<pref>:](<card name>|<card idx>)[{.,}<dev idx>[{.,}<subdev idx>]] */
+	const char * const sep_dev = ".,";
+	const char * const sep_pref = ":";
+	const char *name = str;
+	char save, *sep;
+	int card = 0, device = 0, subdevice = 0;
+	int err;
+
+	sep = strpbrk(str, sep_pref);
+	if (sep)
+		name = sep + 1;
+	sep = strpbrk(name, sep_dev);
+	if (sep) {
+		save = *sep;
+		*sep = '\0';
+	}
+	err = kstrtoint(name, 0, &card);
+	if (err == -EINVAL) {
+		/* Must be the name, not number */
+		for (card = 0; card < snd_ecards_limit; card++) {
+			if (snd_cards[card] &&
+			    !strcmp(snd_cards[card]->id, name)) {
+				err = 0;
+				break;
+			}
+		}
+	}
+	if (!err && sep) {
+		char save2, *sep2;
+		sep2 = strpbrk(sep + 1, sep_dev);
+		if (sep2) {
+			save2 = *sep2;
+			*sep2 = '\0';
+		}
+		err = kstrtoint(sep + 1, 0, &device);
+		if (!err && sep2) {
+			err = kstrtoint(sep2 + 1, 0, &subdevice);
+		}
+		if (sep2)
+			*sep2 = save2;
+	}
+	if (!err && tid) {
+		tid->card = card;
+		tid->device = device;
+		tid->subdevice = subdevice;
+	}
+	if (sep)
+		*sep = save;
+	return err;
+}
+
+/* call in loopback->cable_lock */
+static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
+{
+	int err = 0;
+	unsigned long flags;
+	struct snd_timer_id tid = {
+		.dev_class = SNDRV_TIMER_CLASS_PCM,
+		.dev_sclass = SNDRV_TIMER_SCLASS_APPLICATION,
+	};
+	struct snd_timer_instance *timer = NULL;
+
+	spin_lock_irqsave(&dpcm->cable->lock, flags);
+
+	/* check if timer was already opened. It is only opened once
+	 * per playback and capture subdevice (aka cable).
+	 */
+	if (dpcm->cable->snd_timer.instance)
+		goto unlock;
+
+	err = loopback_parse_timer_id(dpcm->loopback->timer_source, &tid);
+	if (err < 0) {
+		pcm_err(dpcm->substream->pcm,
+			"Parsing timer source \'%s\' failed with %d",
+			dpcm->loopback->timer_source, err);
+		goto unlock;
+	}
+
+	dpcm->cable->snd_timer.owner = dpcm->substream->stream;
+	dpcm->cable->snd_timer.id = tid;
+
+	/* snd_timer_close() and snd_timer_open() should not be called with
+	 * locked spinlock because both functions can block on a mutex. The
+	 * mutex loopback->cable_lock is kept locked. Therefore snd_timer_open()
+	 * cannot be called a second time by the other device of the same cable.
+	 * Therefore the following issue cannot happen:
+	 * [proc1] Call loopback_timer_open() ->
+	 *	   Unlock cable->lock for snd_timer_close/open() call
+	 * [proc2] Call loopback_timer_open() -> snd_timer_open(),
+	 *	   snd_timer_start()
+	 * [proc1] Call snd_timer_open() and overwrite running timer
+	 *	   instance
+	 */
+	spin_unlock_irqrestore(&dpcm->cable->lock, flags);
+	err = snd_timer_open(&timer, dpcm->loopback->card->id,
+			     &dpcm->cable->snd_timer.id,
+			     current->pid);
+	if (err < 0) {
+		pcm_err(dpcm->substream->pcm,
+			"snd_timer_open (%d,%d,%d) failed with %d",
+			dpcm->cable->snd_timer.id.card,
+			dpcm->cable->snd_timer.id.device,
+			dpcm->cable->snd_timer.id.subdevice,
+			err);
+		return err;
+	}
+	spin_lock_irqsave(&dpcm->cable->lock, flags);
+
+	/* The callback has to be called from another tasklet. If
+	 * SNDRV_TIMER_IFLG_FAST is specified it will be called from the
+	 * snd_pcm_period_elapsed() call of the selected sound card.
+	 * snd_pcm_period_elapsed() helds snd_pcm_stream_lock_irqsave().
+	 * Due to our callback loopback_snd_timer_function() also calls
+	 * snd_pcm_period_elapsed() which calls snd_pcm_stream_lock_irqsave().
+	 * This would end up in a dead lock.
+	 */
+	timer->flags |= SNDRV_TIMER_IFLG_AUTO;
+	timer->callback = loopback_snd_timer_function;
+	timer->callback_data = (void *)dpcm->cable;
+	timer->ccallback = loopback_snd_timer_event;
+	dpcm->cable->snd_timer.instance = timer;
+
+	/* initialise a tasklet used for draining */
+	tasklet_init(&dpcm->cable->snd_timer.event_tasklet,
+		     loopback_snd_timer_tasklet, (unsigned long)timer);
+
+unlock:
+	spin_unlock_irqrestore(&dpcm->cable->lock, flags);
+
+	return err;
+}
+
+/* stop_sync() is not required for sound timer because it does not need to be
+ * restarted in loopback_prepare() on Xrun recovery
+ */
+static struct loopback_ops loopback_snd_timer_ops = {
+	.open = loopback_snd_timer_open,
+	.start = loopback_snd_timer_start,
+	.stop = loopback_snd_timer_stop,
+	.close_cable = loopback_snd_timer_close_cable,
+	.dpcm_info = loopback_snd_timer_dpcm_info,
+};
+
 static int loopback_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -776,7 +1210,10 @@ static int loopback_open(struct snd_pcm_substream *substream)
 		}
 		spin_lock_init(&cable->lock);
 		cable->hw = loopback_pcm_hardware;
-		cable->ops = &loopback_jiffies_timer_ops;
+		if (loopback->timer_source)
+			cable->ops = &loopback_snd_timer_ops;
+		else
+			cable->ops = &loopback_jiffies_timer_ops;
 		loopback->cables[substream->number][dev] = cable;
 	}
 	dpcm->cable = cable;
@@ -812,6 +1249,19 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto unlock;
 
+	/* In case of sound timer the period time of both devices of the same
+	 * loop has to be the same.
+	 * This rule only takes effect if a sound timer was chosen
+	 */
+	if (cable->snd_timer.instance) {
+		err = snd_pcm_hw_rule_add(runtime, 0,
+					  SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					  rule_period_bytes, dpcm,
+					  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, -1);
+		if (err < 0)
+			goto unlock;
+	}
+
 	/* loopback_runtime_free() has not to be called if kfree(dpcm) was
 	 * already called here. Otherwise it will end up with a double free.
 	 */
@@ -1214,6 +1664,18 @@ static int loopback_proc_new(struct loopback *loopback, int cidx)
 				    print_cable_info);
 }
 
+static void loopback_set_timer_source(struct loopback *loopback,
+				      const char *value)
+{
+	if (loopback->timer_source) {
+		devm_kfree(loopback->card->dev, loopback->timer_source);
+		loopback->timer_source = NULL;
+	}
+	if (value && *value)
+		loopback->timer_source = devm_kstrdup(loopback->card->dev,
+						      value, GFP_KERNEL);
+}
+
 static int loopback_probe(struct platform_device *devptr)
 {
 	struct snd_card *card;
@@ -1233,6 +1695,8 @@ static int loopback_probe(struct platform_device *devptr)
 		pcm_substreams[dev] = MAX_PCM_SUBSTREAMS;
 	
 	loopback->card = card;
+	loopback_set_timer_source(loopback, timer_source[dev]);
+
 	mutex_init(&loopback->cable_lock);
 
 	err = loopback_pcm_new(loopback, 0, pcm_substreams[dev]);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
