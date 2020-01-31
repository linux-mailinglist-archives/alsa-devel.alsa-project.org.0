Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0D514EF7C
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 16:24:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9FDF1677;
	Fri, 31 Jan 2020 16:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9FDF1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580484243;
	bh=M+6uVZ59tWHn972qqJJBy9NhNXNupOoUzNhGAGzrHTc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FfcBkggBAbFHENYk9i2mFrSs62C8GZ3zc+nmfi6c1tr3IcZ7yJAtUwcOZnXpadxrV
	 vEXzOZmRApL+HGSvR7UombQ8C31Rh0C18qDpR29Hf6b6Cuyz1I1kBmhQb86ORLH3ed
	 EB5x9ks9r88ELbrx/D28aLr+LcnlNe7Hg0XBUG0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB33F80082;
	Fri, 31 Jan 2020 16:22:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ED93F8021E; Fri, 31 Jan 2020 16:22:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=PRX_BODY_138,PRX_BODY_30,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D0FEF80143
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 16:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D0FEF80143
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C616AD6F
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 15:22:16 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 31 Jan 2020 16:22:14 +0100
Message-Id: <20200131152214.11698-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: pcm: Fix sparse warnings wrt
	snd_pcm_state_t
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

Since we have a bitwise definition of snd_pcm_state_t and use it for
certain struct fields, a few new (and years old) sparse warnings came
up.  This patch is an attempt to cover them.

- The state fields in snd_pcm_mmap_status* and co are all defined as
  snd_pcm_state_t type now

- The PCM action callbacks take snd_pcm_state_t argument as well;
  some actions taking special values got the explicit cast and
  comments

- For the PCM action that doesn't need an extra argument receives
  ACTION_ARG_IGNORE instead of ambiguous 0

While we're at it, the boolean argument is also properly changed to
bool and true/false, as well as a slight refactoring of PCM pause
helper function to make easier to read.

No functional changes, just shutting up chatty sparse.

Fixes: 46b770f720bd ("ALSA: uapi: Fix sparse warning")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     |   4 +-
 sound/core/pcm_compat.c |   8 +--
 sound/core/pcm_native.c | 187 +++++++++++++++++++++++++++++++-----------------
 3 files changed, 127 insertions(+), 72 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 5a31525e2df6..f657ff08f317 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1450,7 +1450,7 @@ struct snd_pcm_status64 {
 #define SNDRV_PCM_IOCTL_STATUS_EXT64	_IOWR('A', 0x24, struct snd_pcm_status64)
 
 struct snd_pcm_status32 {
-	s32 state;		/* stream state */
+	snd_pcm_state_t state;		/* stream state */
 	s32 trigger_tstamp_sec;	/* time when stream was started/stopped/paused */
 	s32 trigger_tstamp_nsec;
 	s32 tstamp_sec;		/* reference timestamp */
@@ -1461,7 +1461,7 @@ struct snd_pcm_status32 {
 	u32 avail;		/* number of frames available */
 	u32 avail_max;		/* max frames available on hw since last status */
 	u32 overrange;		/* count of ADC (capture) overrange detections from last status */
-	s32 suspended_state;	/* suspended stream state */
+	snd_pcm_state_t suspended_state;	/* suspended stream state */
 	u32 audio_tstamp_data;	/* needed for 64-bit alignment, used for configs/report to/from userspace */
 	s32 audio_tstamp_sec;	/* sample counter, wall clock, PHC or on-demand sync'ed */
 	s32 audio_tstamp_nsec;
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 967c689fb8da..590a46a9e78d 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -156,7 +156,7 @@ static int snd_pcm_channel_info_user(struct snd_pcm_substream *substream,
 #endif /* CONFIG_X86_X32 */
 
 struct compat_snd_pcm_status64 {
-	s32 state;
+	snd_pcm_state_t state;
 	u8 rsvd[4]; /* alignment */
 	s64 trigger_tstamp_sec;
 	s64 trigger_tstamp_nsec;
@@ -168,7 +168,7 @@ struct compat_snd_pcm_status64 {
 	u32 avail;
 	u32 avail_max;
 	u32 overrange;
-	s32 suspended_state;
+	snd_pcm_state_t suspended_state;
 	u32 audio_tstamp_data;
 	s64 audio_tstamp_sec;
 	s64 audio_tstamp_nsec;
@@ -376,13 +376,13 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 #ifdef CONFIG_X86_X32
 /* X32 ABI has 64bit timespec and 64bit alignment */
 struct snd_pcm_mmap_status_x32 {
-	s32 state;
+	snd_pcm_state_t state;
 	s32 pad1;
 	u32 hw_ptr;
 	u32 pad2; /* alignment */
 	s64 tstamp_sec;
 	s64 tstamp_nsec;
-	s32 suspended_state;
+	snd_pcm_state_t suspended_state;
 	s32 pad3;
 	s64 audio_tstamp_sec;
 	s64 audio_tstamp_nsec;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 4ac42ee1238c..336406bcb59e 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -551,7 +551,8 @@ static int period_to_usecs(struct snd_pcm_runtime *runtime)
 	return usecs;
 }
 
-static void snd_pcm_set_state(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_set_state(struct snd_pcm_substream *substream,
+			      snd_pcm_state_t state)
 {
 	snd_pcm_stream_lock_irq(substream);
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_DISCONNECTED)
@@ -1105,11 +1106,17 @@ static void snd_pcm_trigger_tstamp(struct snd_pcm_substream *substream)
 	runtime->trigger_master = NULL;
 }
 
+#define ACTION_ARG_IGNORE	(__force snd_pcm_state_t)0
+
 struct action_ops {
-	int (*pre_action)(struct snd_pcm_substream *substream, int state);
-	int (*do_action)(struct snd_pcm_substream *substream, int state);
-	void (*undo_action)(struct snd_pcm_substream *substream, int state);
-	void (*post_action)(struct snd_pcm_substream *substream, int state);
+	int (*pre_action)(struct snd_pcm_substream *substream,
+			  snd_pcm_state_t state);
+	int (*do_action)(struct snd_pcm_substream *substream,
+			 snd_pcm_state_t state);
+	void (*undo_action)(struct snd_pcm_substream *substream,
+			    snd_pcm_state_t state);
+	void (*post_action)(struct snd_pcm_substream *substream,
+			    snd_pcm_state_t state);
 };
 
 /*
@@ -1119,7 +1126,8 @@ struct action_ops {
  */
 static int snd_pcm_action_group(const struct action_ops *ops,
 				struct snd_pcm_substream *substream,
-				int state, int do_lock)
+				snd_pcm_state_t state,
+				bool do_lock)
 {
 	struct snd_pcm_substream *s = NULL;
 	struct snd_pcm_substream *s1;
@@ -1176,7 +1184,7 @@ static int snd_pcm_action_group(const struct action_ops *ops,
  */
 static int snd_pcm_action_single(const struct action_ops *ops,
 				 struct snd_pcm_substream *substream,
-				 int state)
+				 snd_pcm_state_t state)
 {
 	int res;
 	
@@ -1257,14 +1265,14 @@ snd_pcm_stream_group_ref(struct snd_pcm_substream *substream)
  */
 static int snd_pcm_action(const struct action_ops *ops,
 			  struct snd_pcm_substream *substream,
-			  int state)
+			  snd_pcm_state_t state)
 {
 	struct snd_pcm_group *group;
 	int res;
 
 	group = snd_pcm_stream_group_ref(substream);
 	if (group)
-		res = snd_pcm_action_group(ops, substream, state, 1);
+		res = snd_pcm_action_group(ops, substream, state, true);
 	else
 		res = snd_pcm_action_single(ops, substream, state);
 	snd_pcm_group_unref(group, substream);
@@ -1276,7 +1284,7 @@ static int snd_pcm_action(const struct action_ops *ops,
  */
 static int snd_pcm_action_lock_irq(const struct action_ops *ops,
 				   struct snd_pcm_substream *substream,
-				   int state)
+				   snd_pcm_state_t state)
 {
 	int res;
 
@@ -1290,14 +1298,14 @@ static int snd_pcm_action_lock_irq(const struct action_ops *ops,
  */
 static int snd_pcm_action_nonatomic(const struct action_ops *ops,
 				    struct snd_pcm_substream *substream,
-				    int state)
+				    snd_pcm_state_t state)
 {
 	int res;
 
 	/* Guarantee the group members won't change during non-atomic action */
 	down_read(&snd_pcm_link_rwsem);
 	if (snd_pcm_stream_linked(substream))
-		res = snd_pcm_action_group(ops, substream, state, 0);
+		res = snd_pcm_action_group(ops, substream, state, false);
 	else
 		res = snd_pcm_action_single(ops, substream, state);
 	up_read(&snd_pcm_link_rwsem);
@@ -1307,7 +1315,8 @@ static int snd_pcm_action_nonatomic(const struct action_ops *ops,
 /*
  * start callbacks
  */
-static int snd_pcm_pre_start(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_pre_start(struct snd_pcm_substream *substream,
+			     snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (runtime->status->state != SNDRV_PCM_STATE_PREPARED)
@@ -1320,20 +1329,23 @@ static int snd_pcm_pre_start(struct snd_pcm_substream *substream, int state)
 	return 0;
 }
 
-static int snd_pcm_do_start(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_do_start(struct snd_pcm_substream *substream,
+			    snd_pcm_state_t state)
 {
 	if (substream->runtime->trigger_master != substream)
 		return 0;
 	return substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_START);
 }
 
-static void snd_pcm_undo_start(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_undo_start(struct snd_pcm_substream *substream,
+			       snd_pcm_state_t state)
 {
 	if (substream->runtime->trigger_master == substream)
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
 }
 
-static void snd_pcm_post_start(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_post_start(struct snd_pcm_substream *substream,
+			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_trigger_tstamp(substream);
@@ -1377,7 +1389,8 @@ static int snd_pcm_start_lock_irq(struct snd_pcm_substream *substream)
 /*
  * stop callbacks
  */
-static int snd_pcm_pre_stop(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_pre_stop(struct snd_pcm_substream *substream,
+			    snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
@@ -1386,7 +1399,8 @@ static int snd_pcm_pre_stop(struct snd_pcm_substream *substream, int state)
 	return 0;
 }
 
-static int snd_pcm_do_stop(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_do_stop(struct snd_pcm_substream *substream,
+			   snd_pcm_state_t state)
 {
 	if (substream->runtime->trigger_master == substream &&
 	    snd_pcm_running(substream))
@@ -1394,7 +1408,8 @@ static int snd_pcm_do_stop(struct snd_pcm_substream *substream, int state)
 	return 0; /* unconditonally stop all substreams */
 }
 
-static void snd_pcm_post_stop(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_post_stop(struct snd_pcm_substream *substream,
+			      snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (runtime->status->state != state) {
@@ -1465,14 +1480,17 @@ int snd_pcm_stop_xrun(struct snd_pcm_substream *substream)
 EXPORT_SYMBOL_GPL(snd_pcm_stop_xrun);
 
 /*
- * pause callbacks
+ * pause callbacks: pass boolean (to start pause or resume) as state argument
  */
-static int snd_pcm_pre_pause(struct snd_pcm_substream *substream, int push)
+#define pause_pushed(state)	(__force bool)(state)
+
+static int snd_pcm_pre_pause(struct snd_pcm_substream *substream,
+			     snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (!(runtime->info & SNDRV_PCM_INFO_PAUSE))
 		return -ENOSYS;
-	if (push) {
+	if (pause_pushed(state)) {
 		if (runtime->status->state != SNDRV_PCM_STATE_RUNNING)
 			return -EBADFD;
 	} else if (runtime->status->state != SNDRV_PCM_STATE_PAUSED)
@@ -1481,13 +1499,14 @@ static int snd_pcm_pre_pause(struct snd_pcm_substream *substream, int push)
 	return 0;
 }
 
-static int snd_pcm_do_pause(struct snd_pcm_substream *substream, int push)
+static int snd_pcm_do_pause(struct snd_pcm_substream *substream,
+			    snd_pcm_state_t state)
 {
 	if (substream->runtime->trigger_master != substream)
 		return 0;
 	/* some drivers might use hw_ptr to recover from the pause -
 	   update the hw_ptr now */
-	if (push)
+	if (pause_pushed(state))
 		snd_pcm_update_hw_ptr(substream);
 	/* The jiffies check in snd_pcm_update_hw_ptr*() is done by
 	 * a delta between the current jiffies, this gives a large enough
@@ -1495,23 +1514,27 @@ static int snd_pcm_do_pause(struct snd_pcm_substream *substream, int push)
 	 */
 	substream->runtime->hw_ptr_jiffies = jiffies - HZ * 1000;
 	return substream->ops->trigger(substream,
-				       push ? SNDRV_PCM_TRIGGER_PAUSE_PUSH :
-					      SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
+				       pause_pushed(state) ?
+				       SNDRV_PCM_TRIGGER_PAUSE_PUSH :
+				       SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
 }
 
-static void snd_pcm_undo_pause(struct snd_pcm_substream *substream, int push)
+static void snd_pcm_undo_pause(struct snd_pcm_substream *substream,
+			       snd_pcm_state_t state)
 {
 	if (substream->runtime->trigger_master == substream)
 		substream->ops->trigger(substream,
-					push ? SNDRV_PCM_TRIGGER_PAUSE_RELEASE :
+					pause_pushed(state) ?
+					SNDRV_PCM_TRIGGER_PAUSE_RELEASE :
 					SNDRV_PCM_TRIGGER_PAUSE_PUSH);
 }
 
-static void snd_pcm_post_pause(struct snd_pcm_substream *substream, int push)
+static void snd_pcm_post_pause(struct snd_pcm_substream *substream,
+			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_trigger_tstamp(substream);
-	if (push) {
+	if (pause_pushed(state)) {
 		runtime->status->state = SNDRV_PCM_STATE_PAUSED;
 		snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MPAUSE);
 		wake_up(&runtime->sleep);
@@ -1532,15 +1555,24 @@ static const struct action_ops snd_pcm_action_pause = {
 /*
  * Push/release the pause for all linked streams.
  */
-static int snd_pcm_pause(struct snd_pcm_substream *substream, int push)
+static int snd_pcm_pause(struct snd_pcm_substream *substream, bool push)
 {
-	return snd_pcm_action(&snd_pcm_action_pause, substream, push);
+	return snd_pcm_action(&snd_pcm_action_pause, substream,
+			      (__force snd_pcm_state_t)push);
+}
+
+static int snd_pcm_pause_lock_irq(struct snd_pcm_substream *substream,
+				  bool push)
+{
+	return snd_pcm_action_lock_irq(&snd_pcm_action_pause, substream,
+				       (__force snd_pcm_state_t)push);
 }
 
 #ifdef CONFIG_PM
-/* suspend */
+/* suspend callback: state argument ignored */
 
-static int snd_pcm_pre_suspend(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_pre_suspend(struct snd_pcm_substream *substream,
+			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	switch (runtime->status->state) {
@@ -1556,7 +1588,8 @@ static int snd_pcm_pre_suspend(struct snd_pcm_substream *substream, int state)
 	return 0;
 }
 
-static int snd_pcm_do_suspend(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_do_suspend(struct snd_pcm_substream *substream,
+			      snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (runtime->trigger_master != substream)
@@ -1567,7 +1600,8 @@ static int snd_pcm_do_suspend(struct snd_pcm_substream *substream, int state)
 	return 0; /* suspend unconditionally */
 }
 
-static void snd_pcm_post_suspend(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_post_suspend(struct snd_pcm_substream *substream,
+				 snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_trigger_tstamp(substream);
@@ -1598,7 +1632,8 @@ static int snd_pcm_suspend(struct snd_pcm_substream *substream)
 	unsigned long flags;
 
 	snd_pcm_stream_lock_irqsave(substream, flags);
-	err = snd_pcm_action(&snd_pcm_action_suspend, substream, 0);
+	err = snd_pcm_action(&snd_pcm_action_suspend, substream,
+			     ACTION_ARG_IGNORE);
 	snd_pcm_stream_unlock_irqrestore(substream, flags);
 	return err;
 }
@@ -1642,9 +1677,10 @@ int snd_pcm_suspend_all(struct snd_pcm *pcm)
 }
 EXPORT_SYMBOL(snd_pcm_suspend_all);
 
-/* resume */
+/* resume callbacks: state argument ignored */
 
-static int snd_pcm_pre_resume(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_pre_resume(struct snd_pcm_substream *substream,
+			      snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (!(runtime->info & SNDRV_PCM_INFO_RESUME))
@@ -1653,7 +1689,8 @@ static int snd_pcm_pre_resume(struct snd_pcm_substream *substream, int state)
 	return 0;
 }
 
-static int snd_pcm_do_resume(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_do_resume(struct snd_pcm_substream *substream,
+			     snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (runtime->trigger_master != substream)
@@ -1666,14 +1703,16 @@ static int snd_pcm_do_resume(struct snd_pcm_substream *substream, int state)
 	return substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_RESUME);
 }
 
-static void snd_pcm_undo_resume(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_undo_resume(struct snd_pcm_substream *substream,
+				snd_pcm_state_t state)
 {
 	if (substream->runtime->trigger_master == substream &&
 	    snd_pcm_running(substream))
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
 }
 
-static void snd_pcm_post_resume(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_post_resume(struct snd_pcm_substream *substream,
+				snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_trigger_tstamp(substream);
@@ -1691,7 +1730,8 @@ static const struct action_ops snd_pcm_action_resume = {
 
 static int snd_pcm_resume(struct snd_pcm_substream *substream)
 {
-	return snd_pcm_action_lock_irq(&snd_pcm_action_resume, substream, 0);
+	return snd_pcm_action_lock_irq(&snd_pcm_action_resume, substream,
+				       ACTION_ARG_IGNORE);
 }
 
 #else
@@ -1732,7 +1772,9 @@ static int snd_pcm_xrun(struct snd_pcm_substream *substream)
 /*
  * reset ioctl
  */
-static int snd_pcm_pre_reset(struct snd_pcm_substream *substream, int state)
+/* reset callbacks:  state argument ignored */
+static int snd_pcm_pre_reset(struct snd_pcm_substream *substream,
+			     snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	switch (runtime->status->state) {
@@ -1746,7 +1788,8 @@ static int snd_pcm_pre_reset(struct snd_pcm_substream *substream, int state)
 	}
 }
 
-static int snd_pcm_do_reset(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_do_reset(struct snd_pcm_substream *substream,
+			    snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
@@ -1760,7 +1803,8 @@ static int snd_pcm_do_reset(struct snd_pcm_substream *substream, int state)
 	return 0;
 }
 
-static void snd_pcm_post_reset(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_post_reset(struct snd_pcm_substream *substream,
+			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
@@ -1777,17 +1821,20 @@ static const struct action_ops snd_pcm_action_reset = {
 
 static int snd_pcm_reset(struct snd_pcm_substream *substream)
 {
-	return snd_pcm_action_nonatomic(&snd_pcm_action_reset, substream, 0);
+	return snd_pcm_action_nonatomic(&snd_pcm_action_reset, substream,
+					ACTION_ARG_IGNORE);
 }
 
 /*
  * prepare ioctl
  */
-/* we use the second argument for updating f_flags */
+/* pass f_flags as state argument */
 static int snd_pcm_pre_prepare(struct snd_pcm_substream *substream,
-			       int f_flags)
+			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	int f_flags = (__force int)state;
+
 	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
 	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
@@ -1797,17 +1844,19 @@ static int snd_pcm_pre_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int snd_pcm_do_prepare(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_do_prepare(struct snd_pcm_substream *substream,
+			      snd_pcm_state_t state)
 {
 	int err;
 	snd_pcm_sync_stop(substream);
 	err = substream->ops->prepare(substream);
 	if (err < 0)
 		return err;
-	return snd_pcm_do_reset(substream, 0);
+	return snd_pcm_do_reset(substream, state);
 }
 
-static void snd_pcm_post_prepare(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_post_prepare(struct snd_pcm_substream *substream,
+				 snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
@@ -1840,7 +1889,7 @@ static int snd_pcm_prepare(struct snd_pcm_substream *substream,
 	snd_pcm_stream_lock_irq(substream);
 	switch (substream->runtime->status->state) {
 	case SNDRV_PCM_STATE_PAUSED:
-		snd_pcm_pause(substream, 0);
+		snd_pcm_pause(substream, false);
 		/* fallthru */
 	case SNDRV_PCM_STATE_SUSPENDED:
 		snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
@@ -1849,14 +1898,17 @@ static int snd_pcm_prepare(struct snd_pcm_substream *substream,
 	snd_pcm_stream_unlock_irq(substream);
 
 	return snd_pcm_action_nonatomic(&snd_pcm_action_prepare,
-					substream, f_flags);
+					substream,
+					(__force snd_pcm_state_t)f_flags);
 }
 
 /*
  * drain ioctl
  */
 
-static int snd_pcm_pre_drain_init(struct snd_pcm_substream *substream, int state)
+/* drain init callbacks: state argument ignored */
+static int snd_pcm_pre_drain_init(struct snd_pcm_substream *substream,
+				  snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	switch (runtime->status->state) {
@@ -1869,7 +1921,8 @@ static int snd_pcm_pre_drain_init(struct snd_pcm_substream *substream, int state
 	return 0;
 }
 
-static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream, int state)
+static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream,
+				 snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -1895,7 +1948,9 @@ static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream, int state)
 	} else {
 		/* stop running stream */
 		if (runtime->status->state == SNDRV_PCM_STATE_RUNNING) {
-			int new_state = snd_pcm_capture_avail(runtime) > 0 ?
+			snd_pcm_state_t new_state;
+
+			new_state = snd_pcm_capture_avail(runtime) > 0 ?
 				SNDRV_PCM_STATE_DRAINING : SNDRV_PCM_STATE_SETUP;
 			snd_pcm_do_stop(substream, new_state);
 			snd_pcm_post_stop(substream, new_state);
@@ -1911,7 +1966,8 @@ static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream, int state)
 	return 0;
 }
 
-static void snd_pcm_post_drain_init(struct snd_pcm_substream *substream, int state)
+static void snd_pcm_post_drain_init(struct snd_pcm_substream *substream,
+				    snd_pcm_state_t state)
 {
 }
 
@@ -1954,10 +2010,11 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	snd_pcm_stream_lock_irq(substream);
 	/* resume pause */
 	if (runtime->status->state == SNDRV_PCM_STATE_PAUSED)
-		snd_pcm_pause(substream, 0);
+		snd_pcm_pause(substream, false);
 
 	/* pre-start/stop - all running streams are changed to DRAINING state */
-	result = snd_pcm_action(&snd_pcm_action_drain_init, substream, 0);
+	result = snd_pcm_action(&snd_pcm_action_drain_init, substream,
+				ACTION_ARG_IGNORE);
 	if (result < 0)
 		goto unlock;
 	/* in non-blocking, we don't wait in ioctl but let caller poll */
@@ -2058,7 +2115,7 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
 	snd_pcm_stream_lock_irq(substream);
 	/* resume pause */
 	if (runtime->status->state == SNDRV_PCM_STATE_PAUSED)
-		snd_pcm_pause(substream, 0);
+		snd_pcm_pause(substream, false);
 
 	snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
 	/* runtime->control->appl_ptr = runtime->status->hw_ptr; */
@@ -2900,12 +2957,12 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 }
 
 struct snd_pcm_mmap_status32 {
-	s32 state;
+	snd_pcm_state_t state;
 	s32 pad1;
 	u32 hw_ptr;
 	s32 tstamp_sec;
 	s32 tstamp_nsec;
-	s32 suspended_state;
+	snd_pcm_state_t suspended_state;
 	s32 audio_tstamp_sec;
 	s32 audio_tstamp_nsec;
 } __attribute__((packed));
@@ -3183,9 +3240,7 @@ static int snd_pcm_common_ioctl(struct file *file,
 	case SNDRV_PCM_IOCTL_DROP:
 		return snd_pcm_drop(substream);
 	case SNDRV_PCM_IOCTL_PAUSE:
-		return snd_pcm_action_lock_irq(&snd_pcm_action_pause,
-					       substream,
-					       (int)(unsigned long)arg);
+		return snd_pcm_pause_lock_irq(substream, (unsigned long)arg);
 	case SNDRV_PCM_IOCTL_WRITEI_FRAMES:
 	case SNDRV_PCM_IOCTL_READI_FRAMES:
 		return snd_pcm_xferi_frames_ioctl(substream, arg);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
