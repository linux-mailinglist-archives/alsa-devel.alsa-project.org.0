Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 297FB4D4429
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 11:03:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6ED1188A;
	Thu, 10 Mar 2022 11:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6ED1188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646906594;
	bh=kCzNPSwBFUuFadK9QRN3ClPIwgropEinjgLt3i9UEWI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nVGK1uPIhKhodclPNan+hulQDZFAETA7kPnhlaLfg3E9Hp/xF7sDnsexHvt8x+V+l
	 2HpLA6ixNA24jTbs7OMK/VIE3E/+gE8EMkRh7L58aVtyAA3mEZ+ObcVNziwupn2Gqa
	 zeaCeU5vMSPpuHTjpGqd6iS1rOmBPhFYuh13kF+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4972EF8013C;
	Thu, 10 Mar 2022 11:02:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D39DEF80137; Thu, 10 Mar 2022 11:02:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE94FF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 11:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE94FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="vPIQiSAG"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Uf6rwFlx"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4867F1F442
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646906420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+BVXA2J1VQNo7/arswMX9Tfy8uNymZwrQnW7iDEiUOk=;
 b=vPIQiSAGVQzLh3XMQFAtZzbCXSjJSKS4N2jzAxCU4OPxBpwNju4nfIDyqixVPC6/r+Grhj
 EgY8NapmONQG7oiWhW8K8MPIugIze9kQIQjhX4fpqSu+FIF03Ij1x75U9Ys5wx5x4Jh8Zq
 RYV6idwIMps4CUsM6PkZOlch/yjIQt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646906420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+BVXA2J1VQNo7/arswMX9Tfy8uNymZwrQnW7iDEiUOk=;
 b=Uf6rwFlxVfEZqyauexBBhLxQHyWP+GuPRF+Y52WSSgMQvZb13uX8dfjcXaApCNyhwN9FF4
 +xcag8S8834S8kDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 37A2AA3B96;
 Thu, 10 Mar 2022 10:00:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 1/3] pcm: direct: Improved suspend/resume support
Date: Thu, 10 Mar 2022 11:00:16 +0100
Message-Id: <20220310100018.10038-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The current resume handling in PCM direct plugins don't treat multiple
clients properly: once after the slave PCM gets resumed by one
client, the access from others at a later point is seen as already
running although the internal state isn't updated and becomes
inconsistent.  This may end up a negative size, which eventually hangs
up.

This patch is an attempt to improve the handling for resume.  Now the
suspended state is treated similarly like XRUN; namely, we keep the
slave PCM "recoveries" count that is modified at each time the slave
PCM XRUN happens, so that we can check the inconsistency against the
client's state.  As a differentiation to XRUN, we set the highest bit
of recoveries count when the slave stream hits SUSPENDED state.  This
bit is referred at comparing with clients, and the client's state is
updated to either XRUN or SUSPENDED depending on this bit.

Along with this change, the actual resume is done in
snd_pcm_direct_slave_recover(), and snd_pcm_direct_resume() rather
calls this internally.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_direct.c | 72 ++++++++++++++++++++++++++------------------
 src/pcm/pcm_dmix.c   |  6 ++--
 src/pcm/pcm_dshare.c |  6 ++--
 src/pcm/pcm_dsnoop.c |  6 ++--
 4 files changed, 52 insertions(+), 38 deletions(-)

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 193dc3e76d49..1ca3b76306b1 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -560,8 +560,11 @@ int snd_pcm_direct_timer_stop(snd_pcm_direct_t *dmix)
 	return 0;
 }
 
+#define RECOVERIES_FLAG_SUSPENDED	(1U << 31)
+#define RECOVERIES_MASK			((1U << 31) - 1)
+
 /*
- * Recover slave on XRUN.
+ * Recover slave on XRUN or SUSPENDED.
  * Even if direct plugins disable xrun detection, there might be an xrun
  * raised directly by some drivers.
  * The first client recovers slave pcm.
@@ -569,6 +572,8 @@ int snd_pcm_direct_timer_stop(snd_pcm_direct_t *dmix)
  */
 int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct)
 {
+	unsigned int recoveries;
+	int state;
 	int ret;
 	int semerr;
 
@@ -579,7 +584,8 @@ int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct)
 		return semerr;
 	}
 
-	if (snd_pcm_state(direct->spcm) != SND_PCM_STATE_XRUN) {
+	state = snd_pcm_state(direct->spcm);
+	if (state != SND_PCM_STATE_XRUN && state != SND_PCM_STATE_SUSPENDED) {
 		/* ignore... someone else already did recovery */
 		semerr = snd_pcm_direct_semaphore_up(direct,
 						     DIRECT_IPC_SEM_CLIENT);
@@ -590,6 +596,24 @@ int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct)
 		return 0;
 	}
 
+	recoveries = direct->shmptr->s.recoveries;
+	recoveries = (recoveries + 1) & RECOVERIES_MASK;
+	if (state == SND_PCM_STATE_SUSPENDED)
+		recoveries |= RECOVERIES_FLAG_SUSPENDED;
+	direct->shmptr->s.recoveries = recoveries;
+
+	/* some buggy drivers require the device resumed before prepared;
+	 * when a device has RESUME flag and is in SUSPENDED state, resume
+	 * here but immediately drop to bring it to a sane active state.
+	 */
+	if (state == SND_PCM_STATE_SUSPENDED &&
+	    (direct->spcm->info & SND_PCM_INFO_RESUME)) {
+		snd_pcm_resume(direct->spcm);
+		snd_pcm_drop(direct->spcm);
+		snd_pcm_direct_timer_stop(direct);
+		snd_pcm_direct_clear_timer_queue(direct);
+	}
+
 	ret = snd_pcm_prepare(direct->spcm);
 	if (ret < 0) {
 		SNDERR("recover: unable to prepare slave");
@@ -621,7 +645,6 @@ int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct)
 		}
 		return ret;
 	}
-	direct->shmptr->s.recoveries++;
 	semerr = snd_pcm_direct_semaphore_up(direct,
 						 DIRECT_IPC_SEM_CLIENT);
 	if (semerr < 0) {
@@ -632,11 +655,15 @@ int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct)
 }
 
 /*
- * enter xrun state, if slave xrun occurred
- * @return: 0 for no xrun or a negative error code for xrun
+ * enter xrun or suspended state, if slave xrun occurred or suspended
+ * @return: 0 for no xrun/suspend or a negative error code for xrun/suspend
  */
 int snd_pcm_direct_client_chk_xrun(snd_pcm_direct_t *direct, snd_pcm_t *pcm)
 {
+	if (direct->state == SND_PCM_STATE_XRUN)
+		return -EPIPE;
+	else if (direct->state == SND_PCM_STATE_SUSPENDED)
+		return -ESTRPIPE;
 	if (direct->shmptr->s.recoveries != direct->recoveries) {
 		/* no matter how many xruns we missed -
 		 * so don't increment but just update to actual counter
@@ -649,10 +676,14 @@ int snd_pcm_direct_client_chk_xrun(snd_pcm_direct_t *direct, snd_pcm_t *pcm)
 		 * if slave already entered xrun again the event is lost.
 		 * snd_pcm_direct_clear_timer_queue(direct);
 		 */
-		direct->state = SND_PCM_STATE_XRUN;
+		if (direct->recoveries & RECOVERIES_FLAG_SUSPENDED) {
+			direct->state = SND_PCM_STATE_SUSPENDED;
+			return -ESTRPIPE;
+		} else {
+			direct->state = SND_PCM_STATE_XRUN;
+			return -EPIPE;
+		}
 	}
-	if (direct->state == SND_PCM_STATE_XRUN)
-		return -EPIPE;
 	return 0;
 }
 
@@ -721,13 +752,13 @@ timer_changed:
 	}
 	switch (snd_pcm_state(dmix->spcm)) {
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		/* recover slave and update client state to xrun
 		 * before returning POLLERR
 		 */
 		snd_pcm_direct_slave_recover(dmix);
 		snd_pcm_direct_client_chk_xrun(dmix, pcm);
 		/* fallthrough */
-	case SND_PCM_STATE_SUSPENDED:
 	case SND_PCM_STATE_SETUP:
 		events |= POLLERR;
 		break;
@@ -1074,27 +1105,10 @@ int snd_pcm_direct_prepare(snd_pcm_t *pcm)
 int snd_pcm_direct_resume(snd_pcm_t *pcm)
 {
 	snd_pcm_direct_t *dmix = pcm->private_data;
-	snd_pcm_t *spcm = dmix->spcm;
+	int err;
 
-	snd_pcm_direct_semaphore_down(dmix, DIRECT_IPC_SEM_CLIENT);
-	/* some buggy drivers require the device resumed before prepared;
-	 * when a device has RESUME flag and is in SUSPENDED state, resume
-	 * here but immediately drop to bring it to a sane active state.
-	 */
-	if ((spcm->info & SND_PCM_INFO_RESUME) &&
-	    snd_pcm_state(spcm) == SND_PCM_STATE_SUSPENDED) {
-		snd_pcm_resume(spcm);
-		snd_pcm_drop(spcm);
-		snd_pcm_direct_timer_stop(dmix);
-		snd_pcm_direct_clear_timer_queue(dmix);
-		snd_pcm_areas_silence(snd_pcm_mmap_areas(spcm), 0,
-				      spcm->channels, spcm->buffer_size,
-				      spcm->format);
-		snd_pcm_prepare(spcm);
-		snd_pcm_start(spcm);
-	}
-	snd_pcm_direct_semaphore_up(dmix, DIRECT_IPC_SEM_CLIENT);
-	return -ENOSYS;
+	err = snd_pcm_direct_slave_recover(dmix);
+	return err < 0 ? err : -ENOSYS;
 }
 
 #define COPY_SLAVE(field) (dmix->shmptr->s.field = spcm->field)
diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index dfff18b992c5..e3bf49269f0c 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -431,6 +431,7 @@ static int snd_pcm_dmix_sync_ptr(snd_pcm_t *pcm)
 		dmix->state = SND_PCM_STATE_DISCONNECTED;
 		return -ENODEV;
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		if ((err = snd_pcm_direct_slave_recover(dmix)) < 0)
 			return err;
 		break;
@@ -457,11 +458,11 @@ static snd_pcm_state_t snd_pcm_dmix_state(snd_pcm_t *pcm)
 	snd_pcm_state_t state;
 	state = snd_pcm_state(dmix->spcm);
 	switch (state) {
-	case SND_PCM_STATE_SUSPENDED:
 	case SND_PCM_STATE_DISCONNECTED:
 		dmix->state = state;
 		return state;
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		if ((err = snd_pcm_direct_slave_recover(dmix)) < 0)
 			return err;
 		break;
@@ -833,11 +834,10 @@ static snd_pcm_sframes_t snd_pcm_dmix_mmap_commit(snd_pcm_t *pcm,
 
 	switch (snd_pcm_state(dmix->spcm)) {
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		if ((err = snd_pcm_direct_slave_recover(dmix)) < 0)
 			return err;
 		break;
-	case SND_PCM_STATE_SUSPENDED:
-		return -ESTRPIPE;
 	default:
 		break;
 	}
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index d63c86bd4044..5a52ae9173be 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -206,6 +206,7 @@ static int snd_pcm_dshare_sync_ptr(snd_pcm_t *pcm)
 		dshare->state = SNDRV_PCM_STATE_DISCONNECTED;
 		return -ENODEV;
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		if ((err = snd_pcm_direct_slave_recover(dshare)) < 0)
 			return err;
 		break;
@@ -260,11 +261,11 @@ static snd_pcm_state_t snd_pcm_dshare_state(snd_pcm_t *pcm)
 	snd_pcm_state_t state;
 	state = snd_pcm_state(dshare->spcm);
 	switch (state) {
-	case SND_PCM_STATE_SUSPENDED:
 	case SND_PCM_STATE_DISCONNECTED:
 		dshare->state = state;
 		return state;
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		if ((err = snd_pcm_direct_slave_recover(dshare)) < 0)
 			return err;
 		break;
@@ -532,11 +533,10 @@ static snd_pcm_sframes_t snd_pcm_dshare_mmap_commit(snd_pcm_t *pcm,
 
 	switch (snd_pcm_state(dshare->spcm)) {
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		if ((err = snd_pcm_direct_slave_recover(dshare)) < 0)
 			return err;
 		break;
-	case SND_PCM_STATE_SUSPENDED:
-		return -ESTRPIPE;
 	default:
 		break;
 	}
diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index 77ffbada931f..1653f6fba86c 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -139,6 +139,7 @@ static int snd_pcm_dsnoop_sync_ptr(snd_pcm_t *pcm)
 		dsnoop->state = SNDRV_PCM_STATE_DISCONNECTED;
 		return -ENODEV;
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		if ((err = snd_pcm_direct_slave_recover(dsnoop)) < 0)
 			return err;
 		break;
@@ -211,11 +212,11 @@ static snd_pcm_state_t snd_pcm_dsnoop_state(snd_pcm_t *pcm)
 	snd_pcm_state_t state;
 	state = snd_pcm_state(dsnoop->spcm);
 	switch (state) {
-	case SND_PCM_STATE_SUSPENDED:
 	case SND_PCM_STATE_DISCONNECTED:
 		dsnoop->state = state;
 		return state;
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		if ((err = snd_pcm_direct_slave_recover(dsnoop)) < 0)
 			return err;
 		break;
@@ -423,11 +424,10 @@ static snd_pcm_sframes_t snd_pcm_dsnoop_mmap_commit(snd_pcm_t *pcm,
 
 	switch (snd_pcm_state(dsnoop->spcm)) {
 	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
 		if ((err = snd_pcm_direct_slave_recover(dsnoop)) < 0)
 			return err;
 		break;
-	case SND_PCM_STATE_SUSPENDED:
-		return -ESTRPIPE;
 	default:
 		break;
 	}
-- 
2.34.1

