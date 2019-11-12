Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CAAF9413
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 16:23:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45A6D886;
	Tue, 12 Nov 2019 16:22:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45A6D886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573572224;
	bh=bMXD+wsEdC7/trUWqDzxPSX/n1sfV5GKnknsXehUZmw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRR/l2gCPCu/SD8PPELGmG/cFfDt5u73WDUSyvDVKPIY68BQiyMJTd+g0NI50RnMn
	 VAHFF0qkXeJVlFiYPjPzqvsEb+USBGnn14GXhtY935ogU9NNLcndCq5G+HGr0VXjC2
	 SxO4MXXFWOTsu3Xfq/sFc51rxVvhDjDseyyj01fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94495F806E5;
	Tue, 12 Nov 2019 16:18:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DCE5F8065B; Tue, 12 Nov 2019 16:18:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E65E3F80637
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 16:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E65E3F80637
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MJV9S-1iAfZo27Y0-00JoSP; Tue, 12 Nov 2019 16:16:56 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Tue, 12 Nov 2019 16:16:35 +0100
Message-Id: <20191112151642.680072-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191112151642.680072-1-arnd@arndb.de>
References: <20191112151642.680072-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WutTGrm8YjipYtkNStZpr84C73pW7VkBlcuOuxEj8qmXgAOvDXH
 96RXaseh4MFIQSsF5cDWxpmxrclg55XfV6EHgyTjz+z9ITMnzQs6MbSQp6FS2moIIS7vMA7
 MOpB25WfHG5Y170lAko7LkUnOZLZNx2PkEp2S81Sp/ffNI1ryUrccg23WWQLIpYXb5a+d/A
 KdqEzE1V4royyRdnNbg6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wojcc0ZhKTk=:Cij90ck/B4X8fJmAXczFrN
 zEUfNxbyCBhcndv6oBIJzjf+NtGEnCX+simnWEQuVQMtJTvx5AXFrglNc4ix7PgSehlkKBLwu
 pzyi0G0eCq7MYz581qvNvLTMBwMaOVSZDXdpsiJGpR4Wy2zPyaNxTEDMs5fwu6qcsKk4/kVu5
 kEGQ9u1av8bmfZOPV3w3OJk4cpQF3CZQQqoltu7krhwZ/IZpzS+QfW/lWUM9hkSFnoHXpaUuu
 AU+mYlFuosylVj7vMEMKYvl7NA5emNlhyBeq8faRu94l69vUIMdXMhdFCiXLYhnRz1zgG33Kn
 pCfpO2VprIrTZua6P/g8HUgAfP3eW7wzZACm85aOfuqGeJ+uewc8jSEgvT/ciLUI7E2yMEZSG
 fH4he29FsX3wcCrPsamxDLguG97ERqUJaxyBbyTmRxKcg/1Uc8pCCFUn8uKbUCn02teDdmQF9
 fK84PLYnom4uXqFa95ImEw12AFpmE+RmOSxu/Qm5PS7+YHRHDF5GcySNUV53gqiNRMfvnq8SO
 H8Ctq80iJ2NhTO0xusA/NCDwdCtyBC/W7hQY9Kjo9xKvvlXhjLcqQrWYdAA+mvxwmgxhTwV3C
 FxTgeQt4IrUoLYLBQL0eg8EEi/nO8bzgx5Pg+Vnaj1PhfgRrytWdfDaViEPtkTYLa2hOXLFfs
 IXMvfEU8xfg4nZ5hCfVOlNfz+MQjKplQjFrALcAzUEIKSdEDv+ub87QJpcqVTmVcnLC2yPlOZ
 4IGnB0GYpx76QbFtVeWNo0N4NMMaNBPT/6lY4Ggs47YXNnaiVqv8rIl/GOZl3EUJx1uRftFx4
 25DiZZ2E5BZLjZ1223BH2vt98Aum1rCu+AVVv/3gjepBZ48YUt1/Gn17Rs32qpR6WkxbkouRK
 NI4ETZKe05JR8yIhfdPQ==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v6 1/8] ALSA: Replace timespec with timespec64
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

From: Baolin Wang <baolin.wang@linaro.org>

Since timespec is not year 2038 safe on 32bit system, and we need to
convert all timespec variables to timespec64 type for sound subsystem.

This patch is used to do preparation for following patches, that will
convert all structures defined in uapi/sound/asound.h to use 64-bit
time_t.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/pcm.h               | 18 ++++++++--------
 include/sound/timer.h             |  4 ++--
 sound/core/pcm_lib.c              | 36 +++++++++++++++++++------------
 sound/core/pcm_native.c           | 12 +++++++----
 sound/core/timer.c                | 28 ++++++++++++------------
 sound/pci/hda/hda_controller.c    | 10 ++++-----
 sound/soc/intel/skylake/skl-pcm.c |  4 ++--
 7 files changed, 62 insertions(+), 50 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index bbe6eb1ff5d2..2665b3dc15e8 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -61,7 +61,7 @@ struct snd_pcm_ops {
 	int (*trigger)(struct snd_pcm_substream *substream, int cmd);
 	snd_pcm_uframes_t (*pointer)(struct snd_pcm_substream *substream);
 	int (*get_time_info)(struct snd_pcm_substream *substream,
-			struct timespec *system_ts, struct timespec *audio_ts,
+			struct timespec64 *system_ts, struct timespec64 *audio_ts,
 			struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
 			struct snd_pcm_audio_tstamp_report *audio_tstamp_report);
 	int (*fill_silence)(struct snd_pcm_substream *substream, int channel,
@@ -342,7 +342,7 @@ static inline void snd_pcm_pack_audio_tstamp_report(__u32 *data, __u32 *accuracy
 struct snd_pcm_runtime {
 	/* -- Status -- */
 	struct snd_pcm_substream *trigger_master;
-	struct timespec trigger_tstamp;	/* trigger timestamp */
+	struct timespec64 trigger_tstamp;	/* trigger timestamp */
 	bool trigger_tstamp_latched;     /* trigger timestamp latched in low-level driver/hardware */
 	int overrange;
 	snd_pcm_uframes_t avail_max;
@@ -418,7 +418,7 @@ struct snd_pcm_runtime {
 	/* -- audio timestamp config -- */
 	struct snd_pcm_audio_tstamp_config audio_tstamp_config;
 	struct snd_pcm_audio_tstamp_report audio_tstamp_report;
-	struct timespec driver_tstamp;
+	struct timespec64 driver_tstamp;
 
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	/* -- OSS things -- */
@@ -1151,22 +1151,22 @@ static inline void snd_pcm_set_runtime_buffer(struct snd_pcm_substream *substrea
 }
 
 /**
- * snd_pcm_gettime - Fill the timespec depending on the timestamp mode
+ * snd_pcm_gettime - Fill the timespec64 depending on the timestamp mode
  * @runtime: PCM runtime instance
- * @tv: timespec to fill
+ * @tv: timespec64 to fill
  */
 static inline void snd_pcm_gettime(struct snd_pcm_runtime *runtime,
-				   struct timespec *tv)
+				   struct timespec64 *tv)
 {
 	switch (runtime->tstamp_type) {
 	case SNDRV_PCM_TSTAMP_TYPE_MONOTONIC:
-		ktime_get_ts(tv);
+		ktime_get_ts64(tv);
 		break;
 	case SNDRV_PCM_TSTAMP_TYPE_MONOTONIC_RAW:
-		getrawmonotonic(tv);
+		ktime_get_raw_ts64(tv);
 		break;
 	default:
-		getnstimeofday(tv);
+		ktime_get_real_ts64(tv);
 		break;
 	}
 }
diff --git a/include/sound/timer.h b/include/sound/timer.h
index 199c36295a0d..357e30983284 100644
--- a/include/sound/timer.h
+++ b/include/sound/timer.h
@@ -89,7 +89,7 @@ struct snd_timer_instance {
 			  unsigned long ticks, unsigned long resolution);
 	void (*ccallback) (struct snd_timer_instance * timeri,
 			   int event,
-			   struct timespec * tstamp,
+			   struct timespec64 * tstamp,
 			   unsigned long resolution);
 	void (*disconnect)(struct snd_timer_instance *timeri);
 	void *callback_data;
@@ -113,7 +113,7 @@ struct snd_timer_instance {
  */
 
 int snd_timer_new(struct snd_card *card, char *id, struct snd_timer_id *tid, struct snd_timer **rtimer);
-void snd_timer_notify(struct snd_timer *timer, int event, struct timespec *tstamp);
+void snd_timer_notify(struct snd_timer *timer, int event, struct timespec64 *tstamp);
 int snd_timer_global_new(char *id, int device, struct snd_timer **rtimer);
 int snd_timer_global_free(struct snd_timer *timer);
 int snd_timer_global_register(struct snd_timer *timer);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index d80041ea4e01..42cc1b71d1e3 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -144,8 +144,12 @@ void __snd_pcm_xrun(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	trace_xrun(substream);
-	if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE)
-		snd_pcm_gettime(runtime, (struct timespec *)&runtime->status->tstamp);
+	if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE) {
+		struct timespec64 tstamp;
+
+		snd_pcm_gettime(runtime, &tstamp);
+		runtime->status->tstamp = timespec64_to_timespec(tstamp);
+	}
 	snd_pcm_stop(substream, SNDRV_PCM_STATE_XRUN);
 	if (xrun_debug(substream, XRUN_DEBUG_BASIC)) {
 		char name[16];
@@ -200,12 +204,12 @@ int snd_pcm_update_state(struct snd_pcm_substream *substream,
 }
 
 static void update_audio_tstamp(struct snd_pcm_substream *substream,
-				struct timespec *curr_tstamp,
-				struct timespec *audio_tstamp)
+				struct timespec64 *curr_tstamp,
+				struct timespec64 *audio_tstamp)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	u64 audio_frames, audio_nsecs;
-	struct timespec driver_tstamp;
+	struct timespec64 driver_tstamp;
 
 	if (runtime->tstamp_mode != SNDRV_PCM_TSTAMP_ENABLE)
 		return;
@@ -229,18 +233,22 @@ static void update_audio_tstamp(struct snd_pcm_substream *substream,
 		}
 		audio_nsecs = div_u64(audio_frames * 1000000000LL,
 				runtime->rate);
-		*audio_tstamp = ns_to_timespec(audio_nsecs);
+		*audio_tstamp = ns_to_timespec64(audio_nsecs);
 	}
-	if (!timespec_equal(&runtime->status->audio_tstamp, audio_tstamp)) {
-		runtime->status->audio_tstamp = *audio_tstamp;
-		runtime->status->tstamp = *curr_tstamp;
+
+	if (runtime->status->audio_tstamp.tv_sec != audio_tstamp->tv_sec ||
+	    runtime->status->audio_tstamp.tv_nsec != audio_tstamp->tv_nsec) {
+		runtime->status->audio_tstamp =
+			timespec64_to_timespec(*audio_tstamp);
+		runtime->status->tstamp = timespec64_to_timespec(*curr_tstamp);
 	}
 
+
 	/*
 	 * re-take a driver timestamp to let apps detect if the reference tstamp
 	 * read by low-level hardware was provided with a delay
 	 */
-	snd_pcm_gettime(substream->runtime, (struct timespec *)&driver_tstamp);
+	snd_pcm_gettime(substream->runtime, &driver_tstamp);
 	runtime->driver_tstamp = driver_tstamp;
 }
 
@@ -253,8 +261,8 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 	snd_pcm_sframes_t hdelta, delta;
 	unsigned long jdelta;
 	unsigned long curr_jiffies;
-	struct timespec curr_tstamp;
-	struct timespec audio_tstamp;
+	struct timespec64 curr_tstamp;
+	struct timespec64 audio_tstamp;
 	int crossed_boundary = 0;
 
 	old_hw_ptr = runtime->status->hw_ptr;
@@ -277,9 +285,9 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 
 			/* re-test in case tstamp type is not supported in hardware and was demoted to DEFAULT */
 			if (runtime->audio_tstamp_report.actual_type == SNDRV_PCM_AUDIO_TSTAMP_TYPE_DEFAULT)
-				snd_pcm_gettime(runtime, (struct timespec *)&curr_tstamp);
+				snd_pcm_gettime(runtime, &curr_tstamp);
 		} else
-			snd_pcm_gettime(runtime, (struct timespec *)&curr_tstamp);
+			snd_pcm_gettime(runtime, &curr_tstamp);
 	}
 
 	if (pos == SNDRV_PCM_POS_XRUN) {
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 91c6ad58729f..7d0fe30f1658 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -879,12 +879,12 @@ int snd_pcm_status(struct snd_pcm_substream *substream,
 	status->suspended_state = runtime->status->suspended_state;
 	if (status->state == SNDRV_PCM_STATE_OPEN)
 		goto _end;
-	status->trigger_tstamp = runtime->trigger_tstamp;
+	status->trigger_tstamp = timespec64_to_timespec(runtime->trigger_tstamp);
 	if (snd_pcm_running(substream)) {
 		snd_pcm_update_hw_ptr(substream);
 		if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE) {
 			status->tstamp = runtime->status->tstamp;
-			status->driver_tstamp = runtime->driver_tstamp;
+			status->driver_tstamp = timespec64_to_timespec(runtime->driver_tstamp);
 			status->audio_tstamp =
 				runtime->status->audio_tstamp;
 			if (runtime->audio_tstamp_report.valid == 1)
@@ -897,8 +897,12 @@ int snd_pcm_status(struct snd_pcm_substream *substream,
 		}
 	} else {
 		/* get tstamp only in fallback mode and only if enabled */
-		if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE)
-			snd_pcm_gettime(runtime, &status->tstamp);
+		if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE) {
+			struct timespec64 tstamp;
+
+			snd_pcm_gettime(runtime, &tstamp);
+			status->tstamp = timespec64_to_timespec(tstamp);
+		}
 	}
  _tstamp_end:
 	status->appl_ptr = runtime->control->appl_ptr;
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 5c9fbf3f4340..29b99cfb5215 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -59,7 +59,7 @@ struct snd_timer_user {
 	spinlock_t qlock;
 	unsigned long last_resolution;
 	unsigned int filter;
-	struct timespec tstamp;		/* trigger tstamp */
+	struct timespec64 tstamp;		/* trigger tstamp */
 	wait_queue_head_t qchange_sleep;
 	struct fasync_struct *fasync;
 	struct mutex ioctl_lock;
@@ -450,12 +450,12 @@ static void snd_timer_notify1(struct snd_timer_instance *ti, int event)
 	struct snd_timer *timer = ti->timer;
 	unsigned long resolution = 0;
 	struct snd_timer_instance *ts;
-	struct timespec tstamp;
+	struct timespec64 tstamp;
 
 	if (timer_tstamp_monotonic)
-		ktime_get_ts(&tstamp);
+		ktime_get_ts64(&tstamp);
 	else
-		getnstimeofday(&tstamp);
+		ktime_get_real_ts64(&tstamp);
 	if (snd_BUG_ON(event < SNDRV_TIMER_EVENT_START ||
 		       event > SNDRV_TIMER_EVENT_PAUSE))
 		return;
@@ -1022,7 +1022,7 @@ static int snd_timer_dev_disconnect(struct snd_device *device)
 	return 0;
 }
 
-void snd_timer_notify(struct snd_timer *timer, int event, struct timespec *tstamp)
+void snd_timer_notify(struct snd_timer *timer, int event, struct timespec64 *tstamp)
 {
 	unsigned long flags;
 	unsigned long resolution = 0;
@@ -1315,7 +1315,7 @@ static void snd_timer_user_append_to_tqueue(struct snd_timer_user *tu,
 
 static void snd_timer_user_ccallback(struct snd_timer_instance *timeri,
 				     int event,
-				     struct timespec *tstamp,
+				     struct timespec64 *tstamp,
 				     unsigned long resolution)
 {
 	struct snd_timer_user *tu = timeri->callback_data;
@@ -1329,7 +1329,7 @@ static void snd_timer_user_ccallback(struct snd_timer_instance *timeri,
 		return;
 	memset(&r1, 0, sizeof(r1));
 	r1.event = event;
-	r1.tstamp = *tstamp;
+	r1.tstamp = timespec64_to_timespec(*tstamp);
 	r1.val = resolution;
 	spin_lock_irqsave(&tu->qlock, flags);
 	snd_timer_user_append_to_tqueue(tu, &r1);
@@ -1352,7 +1352,7 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
 {
 	struct snd_timer_user *tu = timeri->callback_data;
 	struct snd_timer_tread *r, r1;
-	struct timespec tstamp;
+	struct timespec64 tstamp;
 	int prev, append = 0;
 
 	memset(&r1, 0, sizeof(r1));
@@ -1365,14 +1365,14 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
 	}
 	if (tu->last_resolution != resolution || ticks > 0) {
 		if (timer_tstamp_monotonic)
-			ktime_get_ts(&tstamp);
+			ktime_get_ts64(&tstamp);
 		else
-			getnstimeofday(&tstamp);
+			ktime_get_real_ts64(&tstamp);
 	}
 	if ((tu->filter & (1 << SNDRV_TIMER_EVENT_RESOLUTION)) &&
 	    tu->last_resolution != resolution) {
 		r1.event = SNDRV_TIMER_EVENT_RESOLUTION;
-		r1.tstamp = tstamp;
+		r1.tstamp = timespec64_to_timespec(tstamp);
 		r1.val = resolution;
 		snd_timer_user_append_to_tqueue(tu, &r1);
 		tu->last_resolution = resolution;
@@ -1386,14 +1386,14 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
 		prev = tu->qtail == 0 ? tu->queue_size - 1 : tu->qtail - 1;
 		r = &tu->tqueue[prev];
 		if (r->event == SNDRV_TIMER_EVENT_TICK) {
-			r->tstamp = tstamp;
+			r->tstamp = timespec64_to_timespec(tstamp);
 			r->val += ticks;
 			append++;
 			goto __wake;
 		}
 	}
 	r1.event = SNDRV_TIMER_EVENT_TICK;
-	r1.tstamp = tstamp;
+	r1.tstamp = timespec64_to_timespec(tstamp);
 	r1.val = ticks;
 	snd_timer_user_append_to_tqueue(tu, &r1);
 	append++;
@@ -1871,7 +1871,7 @@ static int snd_timer_user_status(struct file *file,
 	if (!tu->timeri)
 		return -EBADFD;
 	memset(&status, 0, sizeof(status));
-	status.tstamp = tu->tstamp;
+	status.tstamp = timespec64_to_timespec(tu->tstamp);
 	status.resolution = snd_timer_resolution(tu->timeri);
 	status.lost = tu->timeri->lost;
 	status.overrun = tu->overrun;
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 6387c7e90918..d4620b0561e9 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -491,7 +491,7 @@ static inline bool is_link_time_supported(struct snd_pcm_runtime *runtime,
 }
 
 static int azx_get_time_info(struct snd_pcm_substream *substream,
-			struct timespec *system_ts, struct timespec *audio_ts,
+			struct timespec64 *system_ts, struct timespec64 *audio_ts,
 			struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
 			struct snd_pcm_audio_tstamp_report *audio_tstamp_report)
 {
@@ -511,7 +511,7 @@ static int azx_get_time_info(struct snd_pcm_substream *substream,
 		if (audio_tstamp_config->report_delay)
 			nsec = azx_adjust_codec_delay(substream, nsec);
 
-		*audio_ts = ns_to_timespec(nsec);
+		*audio_ts = ns_to_timespec64(nsec);
 
 		audio_tstamp_report->actual_type = SNDRV_PCM_AUDIO_TSTAMP_TYPE_LINK;
 		audio_tstamp_report->accuracy_report = 1; /* rest of structure is valid */
@@ -528,16 +528,16 @@ static int azx_get_time_info(struct snd_pcm_substream *substream,
 			return -EINVAL;
 
 		case SNDRV_PCM_TSTAMP_TYPE_MONOTONIC_RAW:
-			*system_ts = ktime_to_timespec(xtstamp.sys_monoraw);
+			*system_ts = ktime_to_timespec64(xtstamp.sys_monoraw);
 			break;
 
 		default:
-			*system_ts = ktime_to_timespec(xtstamp.sys_realtime);
+			*system_ts = ktime_to_timespec64(xtstamp.sys_realtime);
 			break;
 
 		}
 
-		*audio_ts = ktime_to_timespec(xtstamp.device);
+		*audio_ts = ktime_to_timespec64(xtstamp.device);
 
 		audio_tstamp_report->actual_type =
 			SNDRV_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED;
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 7f287424af9b..17b7bacf1e2c 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1246,7 +1246,7 @@ static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 }
 
 static int skl_get_time_info(struct snd_pcm_substream *substream,
-			struct timespec *system_ts, struct timespec *audio_ts,
+			struct timespec64 *system_ts, struct timespec64 *audio_ts,
 			struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
 			struct snd_pcm_audio_tstamp_report *audio_tstamp_report)
 {
@@ -1264,7 +1264,7 @@ static int skl_get_time_info(struct snd_pcm_substream *substream,
 		if (audio_tstamp_config->report_delay)
 			nsec = skl_adjust_codec_delay(substream, nsec);
 
-		*audio_ts = ns_to_timespec(nsec);
+		*audio_ts = ns_to_timespec64(nsec);
 
 		audio_tstamp_report->actual_type = SNDRV_PCM_AUDIO_TSTAMP_TYPE_LINK;
 		audio_tstamp_report->accuracy_report = 1; /* rest of struct is valid */
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
