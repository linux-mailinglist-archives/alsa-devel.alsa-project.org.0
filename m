Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7350C11BF28
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 22:25:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5D5166F;
	Wed, 11 Dec 2019 22:24:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5D5166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576099549;
	bh=PJULGqDDqNu9peWSDYFwd3IjaXmc2qH/Dgia1E8SS7A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ed2A10qLu/nmkSmxYW8UNR39XEqEd1o9J5GuMFnAwZtsPxJr1XbHIezr1njfXUhlF
	 2vOSZGxiOP8UUUIZq7BGhEIVKvslaIXMilFjzw7rMKs0gvIJcpgKh/atzO/5BqhvD1
	 JEP9gNQW5/4NJqWfNt/3JEGv0Ai96txuk9ithWL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5EB8F8027C;
	Wed, 11 Dec 2019 22:20:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5304FF80266; Wed, 11 Dec 2019 22:20:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F045F800F3
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 22:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F045F800F3
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M42X0-1if9PL1aMa-0005mW; Wed, 11 Dec 2019 22:20:31 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Wed, 11 Dec 2019 22:20:17 +0100
Message-Id: <20191211212025.1981822-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191211212025.1981822-1-arnd@arndb.de>
References: <20191211212025.1981822-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:58FV9+m61ayjq6RPI+NUODh/2K6Qzq5XlEaeShTqRonDjbQOGCJ
 O8Bn0rFfEvToX2Aex9oT6uSa6sqXcx3kW9PESZTCMy+Zev1GJ5cxhS9yhvgKKwcIEnVKdKJ
 3ONN6RJXp7vtfZvy8XM3qC1rIt6UEx6aKD56FXhDBXc0v59y+hrWEMD1DfciP64Dswt67Rh
 /iMAJzq5pWvfAoAGa5x8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x3m67C+zFy8=:qiABu10VnQvitp35OSbcYB
 +3ywbJietP1VTn+Gvu+yApX+lDFWhcRd+sqOXHu9TcMCKLcmS3HxAf7zk8WxN3K/0FrkoYfkd
 MeU983ZlMJTnMdfLsJtQPakBTQ7sWfDSO8mU4Kxn4zPEQzSj6tWmRAFv/DHW6v0X/nJKeNdIO
 leb5fgpIXz8b1RVp7/i3ClllSGxL9aob0G4oUgbkd8crXl7blMPIOXiQV61t6769+2uSux09L
 xCw8bHZ1XIPoAzU/3pOS89E33zOt1/n6IOIZ86jeWN9W8dnlgzy9CSFVI0jkdVR8Yt2UqrLMe
 /2R32Kpe7x5xuQ/uR/PBmGdFrOUIxGehcRp501WTgi2p9FKe43I7ILY9Ttqn39ViSYyKbbiFm
 kByW4US1+stEFnVWieH+yr99nPuW9SQsfmaMPd++cgYYnIt3iHuMmDEPZi/n2G2/aDewWHTnS
 jj0JUSm8cy7sdDFlNMJPeN4vi/jPAuwmBeOOeVvAOFIOYY84EZwfQ84zajvaDsYnTCW7TCSRb
 Gaw0YVqNcjtD0RmnOZRNQZ8nd6n86HbK++1fWyjI2BTcIJfMAYhUE/W/n+3tusjscrDu6Z9qf
 95LVIEoS5PhsO06rckd6wuG/OttpCRTZXKQ2g6gbVGw1Ja2XvLeqVDMMRoq0fn3+/e+V1tVDG
 N9MG0ZVlFDbCPxnv6x/78iwX3SyRUKH8w0BUR0vv3X7yA/nlmdhzIgtmxwOBeZaTPp2zDvlCx
 dhrlcZi1lF14pJzQReCUjA9XE4MpmhQgGExhL/fvUqWq4qYbYqfB8TvCf/Zobr5bI3rfxrKTV
 4xUqaRFvOrY7k3mAs6UXnIvSAp2B4hW5pRr0dvN75THqzkTzaOXb0s1RoAmCobNf+ECFl5ugP
 9KvXiM4pj93Kmsz2a1wQ==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v7 1/9] ALSA: Replace timespec with timespec64
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
 include/sound/soc-component.h     |  4 ++--
 include/sound/timer.h             |  4 ++--
 sound/core/pcm_lib.c              | 36 +++++++++++++++++++------------
 sound/core/pcm_native.c           | 12 +++++++----
 sound/core/timer.c                | 28 ++++++++++++------------
 sound/drivers/aloop.c             |  2 +-
 sound/pci/hda/hda_controller.c    | 10 ++++-----
 sound/soc/intel/skylake/skl-pcm.c |  4 ++--
 9 files changed, 65 insertions(+), 53 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 8a89fa6fdd5e..cb407fade933 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -62,7 +62,7 @@ struct snd_pcm_ops {
 	int (*sync_stop)(struct snd_pcm_substream *substream);
 	snd_pcm_uframes_t (*pointer)(struct snd_pcm_substream *substream);
 	int (*get_time_info)(struct snd_pcm_substream *substream,
-			struct timespec *system_ts, struct timespec *audio_ts,
+			struct timespec64 *system_ts, struct timespec64 *audio_ts,
 			struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
 			struct snd_pcm_audio_tstamp_report *audio_tstamp_report);
 	int (*fill_silence)(struct snd_pcm_substream *substream, int channel,
@@ -343,7 +343,7 @@ static inline void snd_pcm_pack_audio_tstamp_report(__u32 *data, __u32 *accuracy
 struct snd_pcm_runtime {
 	/* -- Status -- */
 	struct snd_pcm_substream *trigger_master;
-	struct timespec trigger_tstamp;	/* trigger timestamp */
+	struct timespec64 trigger_tstamp;	/* trigger timestamp */
 	bool trigger_tstamp_latched;     /* trigger timestamp latched in low-level driver/hardware */
 	int overrange;
 	snd_pcm_uframes_t avail_max;
@@ -421,7 +421,7 @@ struct snd_pcm_runtime {
 	/* -- audio timestamp config -- */
 	struct snd_pcm_audio_tstamp_config audio_tstamp_config;
 	struct snd_pcm_audio_tstamp_report audio_tstamp_report;
-	struct timespec driver_tstamp;
+	struct timespec64 driver_tstamp;
 
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	/* -- OSS things -- */
@@ -1155,22 +1155,22 @@ static inline void snd_pcm_set_runtime_buffer(struct snd_pcm_substream *substrea
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
diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 506f72a6b2c2..154d02fbbfed 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -93,8 +93,8 @@ struct snd_soc_component_driver {
 	snd_pcm_uframes_t (*pointer)(struct snd_soc_component *component,
 				     struct snd_pcm_substream *substream);
 	int (*get_time_info)(struct snd_soc_component *component,
-		struct snd_pcm_substream *substream, struct timespec *system_ts,
-		struct timespec *audio_ts,
+		struct snd_pcm_substream *substream, struct timespec64 *system_ts,
+		struct timespec64 *audio_ts,
 		struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
 		struct snd_pcm_audio_tstamp_report *audio_tstamp_report);
 	int (*copy_user)(struct snd_soc_component *component,
diff --git a/include/sound/timer.h b/include/sound/timer.h
index a53e37bcd746..23e885d31525 100644
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
index 2236b5e0c1f2..ea5518d44e66 100644
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
index 1fe581167b7b..67fe14bad7cb 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -918,12 +918,12 @@ int snd_pcm_status(struct snd_pcm_substream *substream,
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
@@ -936,8 +936,12 @@ int snd_pcm_status(struct snd_pcm_substream *substream,
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
index 24fed5c78273..d808d5554c7a 100644
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
@@ -453,12 +453,12 @@ static void snd_timer_notify1(struct snd_timer_instance *ti, int event)
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
@@ -1025,7 +1025,7 @@ static int snd_timer_dev_disconnect(struct snd_device *device)
 	return 0;
 }
 
-void snd_timer_notify(struct snd_timer *timer, int event, struct timespec *tstamp)
+void snd_timer_notify(struct snd_timer *timer, int event, struct timespec64 *tstamp)
 {
 	unsigned long flags;
 	unsigned long resolution = 0;
@@ -1318,7 +1318,7 @@ static void snd_timer_user_append_to_tqueue(struct snd_timer_user *tu,
 
 static void snd_timer_user_ccallback(struct snd_timer_instance *timeri,
 				     int event,
-				     struct timespec *tstamp,
+				     struct timespec64 *tstamp,
 				     unsigned long resolution)
 {
 	struct snd_timer_user *tu = timeri->callback_data;
@@ -1332,7 +1332,7 @@ static void snd_timer_user_ccallback(struct snd_timer_instance *timeri,
 		return;
 	memset(&r1, 0, sizeof(r1));
 	r1.event = event;
-	r1.tstamp = *tstamp;
+	r1.tstamp = timespec64_to_timespec(*tstamp);
 	r1.val = resolution;
 	spin_lock_irqsave(&tu->qlock, flags);
 	snd_timer_user_append_to_tqueue(tu, &r1);
@@ -1355,7 +1355,7 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
 {
 	struct snd_timer_user *tu = timeri->callback_data;
 	struct snd_timer_tread *r, r1;
-	struct timespec tstamp;
+	struct timespec64 tstamp;
 	int prev, append = 0;
 
 	memset(&r1, 0, sizeof(r1));
@@ -1368,14 +1368,14 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
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
@@ -1389,14 +1389,14 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
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
@@ -1885,7 +1885,7 @@ static int snd_timer_user_status(struct file *file,
 	if (!tu->timeri)
 		return -EBADFD;
 	memset(&status, 0, sizeof(status));
-	status.tstamp = tu->tstamp;
+	status.tstamp = timespec64_to_timespec(tu->tstamp);
 	status.resolution = snd_timer_resolution(tu->timeri);
 	status.lost = tu->timeri->lost;
 	status.overrun = tu->overrun;
diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 6bb46423f5ae..bc83b1731541 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -804,7 +804,7 @@ static void loopback_snd_timer_tasklet(unsigned long arg)
 
 static void loopback_snd_timer_event(struct snd_timer_instance *timeri,
 				     int event,
-				     struct timespec *tstamp,
+				     struct timespec64 *tstamp,
 				     unsigned long resolution)
 {
 	/* Do not lock cable->lock here because timer->lock is already hold.
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 2f3b7a35f2d9..e95c3ae7aa93 100644
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
index 8b9abb79a69e..900746c30bff 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1258,7 +1258,7 @@ static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 static int skl_platform_soc_get_time_info(
 			struct snd_soc_component *component,
 			struct snd_pcm_substream *substream,
-			struct timespec *system_ts, struct timespec *audio_ts,
+			struct timespec64 *system_ts, struct timespec64 *audio_ts,
 			struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
 			struct snd_pcm_audio_tstamp_report *audio_tstamp_report)
 {
@@ -1276,7 +1276,7 @@ static int skl_platform_soc_get_time_info(
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
