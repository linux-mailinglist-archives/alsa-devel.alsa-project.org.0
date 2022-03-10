Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3A4D433A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 10:15:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEAAF17EA;
	Thu, 10 Mar 2022 10:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEAAF17EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646903737;
	bh=oRaMzcOh9rJ4WgQEyP7jCP/sWr9gsy7yrax4Ew44fYY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcZ04WpCROwrrpB5/BcutmlvyMvJ/MBSEu4SFcKzlZiIy20cTGoh9C7leaf4jFwUb
	 5yhCk3wz+qFK6fJlHdmVPk+38yGeF0MK1PQ39hnao+RvZG3S6meSDg1DoLnzkwA1hP
	 kI2Pje4QNWTPBBhIPj3e7gVY7ZfDY27jEMJAys3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F3BAF80137;
	Thu, 10 Mar 2022 10:14:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29D98F8015B; Thu, 10 Mar 2022 10:14:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DF1DF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 10:14:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DF1DF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0wA7XufR"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="03xRZO5U"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id F35B61F442
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646903661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IILEMp/lj25UrsVwunNUjmzD09rDI/aZR1suYMneNk0=;
 b=0wA7XufR78iJ+pWgSiWSaC2TPgJD2eAdXEKWzWbJLv3i7qQmK0Uboq0el8IkjH7+rBei2e
 qkzxBuuAwQ26+yIHADlop1HVhwPcNOb6VZyvYupPtkj26oPQGirq4uPK3HtvWgaad3/wKz
 oyvgMdkBV80fTkvTWZbyeZuh46UPRSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646903661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IILEMp/lj25UrsVwunNUjmzD09rDI/aZR1suYMneNk0=;
 b=03xRZO5Uu3x5x5fJFig7R+00W+Z7gbfHmRBl2YuPow0LxIPqDiklUc8UGEM2NJDrwPG1ho
 Ik+triHrKUcj0ZDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E2A41A3B83;
 Thu, 10 Mar 2022 09:14:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 2/3] pcm: direct: Move slave PCM state checks into
 XRUN check helper
Date: Thu, 10 Mar 2022 10:14:17 +0100
Message-Id: <20220310091418.1150-2-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220310091418.1150-1-tiwai@suse.de>
References: <20220310091418.1150-1-tiwai@suse.de>
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

The check of slave PCM state is always done before the client's
recoveries count check, so let's merge them to the common helper.
Also rename the helper function to snd_pcm_direct_check_xrun() as it's
checking both slave and client states now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_direct.c | 34 ++++++++++++++++++++--------------
 src/pcm/pcm_direct.h |  2 +-
 src/pcm/pcm_dmix.c   | 43 ++++---------------------------------------
 src/pcm/pcm_dshare.c | 43 ++++---------------------------------------
 src/pcm/pcm_dsnoop.c | 43 ++++---------------------------------------
 5 files changed, 33 insertions(+), 132 deletions(-)

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 1ca3b76306b1..060bcd5a0f7b 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -658,8 +658,23 @@ int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct)
  * enter xrun or suspended state, if slave xrun occurred or suspended
  * @return: 0 for no xrun/suspend or a negative error code for xrun/suspend
  */
-int snd_pcm_direct_client_chk_xrun(snd_pcm_direct_t *direct, snd_pcm_t *pcm)
+int snd_pcm_direct_check_xrun(snd_pcm_direct_t *direct, snd_pcm_t *pcm)
 {
+	int err;
+
+	switch (snd_pcm_state(direct->spcm)) {
+	case SND_PCM_STATE_DISCONNECTED:
+		direct->state = SNDRV_PCM_STATE_DISCONNECTED;
+		return -ENODEV;
+	case SND_PCM_STATE_XRUN:
+	case SND_PCM_STATE_SUSPENDED:
+		if ((err = snd_pcm_direct_slave_recover(direct)) < 0)
+			return err;
+		break;
+	default:
+		break;
+	}
+
 	if (direct->state == SND_PCM_STATE_XRUN)
 		return -EPIPE;
 	else if (direct->state == SND_PCM_STATE_SUSPENDED)
@@ -750,19 +765,11 @@ timer_changed:
 		}
 		empty = avail < pcm->avail_min;
 	}
-	switch (snd_pcm_state(dmix->spcm)) {
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		/* recover slave and update client state to xrun
-		 * before returning POLLERR
-		 */
-		snd_pcm_direct_slave_recover(dmix);
-		snd_pcm_direct_client_chk_xrun(dmix, pcm);
-		/* fallthrough */
-	case SND_PCM_STATE_SETUP:
+
+	if (snd_pcm_direct_check_xrun(dmix, pcm) < 0 ||
+	    snd_pcm_state(dmix->spcm) == SND_PCM_STATE_SETUP) {
 		events |= POLLERR;
-		break;
-	default:
+	} else {
 		if (empty) {
 			/* here we have a race condition:
 			 * if period event arrived after the avail_update call
@@ -786,7 +793,6 @@ timer_changed:
 				break;
 			}
 		}
-		break;
 	}
 	*revents = events;
 	return 0;
diff --git a/src/pcm/pcm_direct.h b/src/pcm/pcm_direct.h
index fb013a6666c2..3e0c8bfcc9bc 100644
--- a/src/pcm/pcm_direct.h
+++ b/src/pcm/pcm_direct.h
@@ -345,7 +345,7 @@ snd_pcm_chmap_query_t **snd_pcm_direct_query_chmaps(snd_pcm_t *pcm);
 snd_pcm_chmap_t *snd_pcm_direct_get_chmap(snd_pcm_t *pcm);
 int snd_pcm_direct_set_chmap(snd_pcm_t *pcm, const snd_pcm_chmap_t *map);
 int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct);
-int snd_pcm_direct_client_chk_xrun(snd_pcm_direct_t *direct, snd_pcm_t *pcm);
+int snd_pcm_direct_check_xrun(snd_pcm_direct_t *direct, snd_pcm_t *pcm);
 int snd_timer_async(snd_timer_t *timer, int sig, pid_t pid);
 struct timespec snd_pcm_hw_fast_tstamp(snd_pcm_t *pcm);
 void snd_pcm_direct_reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t *dmix);
diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index e3bf49269f0c..d00d53bef604 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -426,19 +426,7 @@ static int snd_pcm_dmix_sync_ptr(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dmix = pcm->private_data;
 	int err;
 
-	switch (snd_pcm_state(dmix->spcm)) {
-	case SND_PCM_STATE_DISCONNECTED:
-		dmix->state = SND_PCM_STATE_DISCONNECTED;
-		return -ENODEV;
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		if ((err = snd_pcm_direct_slave_recover(dmix)) < 0)
-			return err;
-		break;
-	default:
-		break;
-	}
-	err = snd_pcm_direct_client_chk_xrun(dmix, pcm);
+	err = snd_pcm_direct_check_xrun(dmix, pcm);
 	if (err < 0)
 		return err;
 	if (dmix->slowptr)
@@ -454,22 +442,8 @@ static int snd_pcm_dmix_sync_ptr(snd_pcm_t *pcm)
 static snd_pcm_state_t snd_pcm_dmix_state(snd_pcm_t *pcm)
 {
 	snd_pcm_direct_t *dmix = pcm->private_data;
-	int err;
-	snd_pcm_state_t state;
-	state = snd_pcm_state(dmix->spcm);
-	switch (state) {
-	case SND_PCM_STATE_DISCONNECTED:
-		dmix->state = state;
-		return state;
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		if ((err = snd_pcm_direct_slave_recover(dmix)) < 0)
-			return err;
-		break;
-	default:
-		break;
-	}
-	snd_pcm_direct_client_chk_xrun(dmix, pcm);
+
+	snd_pcm_direct_check_xrun(dmix, pcm);
 	if (dmix->state == STATE_RUN_PENDING)
 		return SNDRV_PCM_STATE_RUNNING;
 	return dmix->state;
@@ -832,16 +806,7 @@ static snd_pcm_sframes_t snd_pcm_dmix_mmap_commit(snd_pcm_t *pcm,
 	snd_pcm_direct_t *dmix = pcm->private_data;
 	int err;
 
-	switch (snd_pcm_state(dmix->spcm)) {
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		if ((err = snd_pcm_direct_slave_recover(dmix)) < 0)
-			return err;
-		break;
-	default:
-		break;
-	}
-	err = snd_pcm_direct_client_chk_xrun(dmix, pcm);
+	err = snd_pcm_direct_check_xrun(dmix, pcm);
 	if (err < 0)
 		return err;
 	if (! size)
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index 5a52ae9173be..0ff43a90d270 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -201,19 +201,7 @@ static int snd_pcm_dshare_sync_ptr(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dshare = pcm->private_data;
 	int err;
 
-	switch (snd_pcm_state(dshare->spcm)) {
-	case SND_PCM_STATE_DISCONNECTED:
-		dshare->state = SNDRV_PCM_STATE_DISCONNECTED;
-		return -ENODEV;
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		if ((err = snd_pcm_direct_slave_recover(dshare)) < 0)
-			return err;
-		break;
-	default:
-		break;
-	}
-	err = snd_pcm_direct_client_chk_xrun(dshare, pcm);
+	err = snd_pcm_direct_check_xrun(dshare, pcm);
 	if (err < 0)
 		return err;
 	if (dshare->slowptr)
@@ -257,22 +245,8 @@ static int snd_pcm_dshare_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 static snd_pcm_state_t snd_pcm_dshare_state(snd_pcm_t *pcm)
 {
 	snd_pcm_direct_t *dshare = pcm->private_data;
-	int err;
-	snd_pcm_state_t state;
-	state = snd_pcm_state(dshare->spcm);
-	switch (state) {
-	case SND_PCM_STATE_DISCONNECTED:
-		dshare->state = state;
-		return state;
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		if ((err = snd_pcm_direct_slave_recover(dshare)) < 0)
-			return err;
-		break;
-	default:
-		break;
-	}
-	snd_pcm_direct_client_chk_xrun(dshare, pcm);
+
+	snd_pcm_direct_check_xrun(dshare, pcm);
 	if (dshare->state == STATE_RUN_PENDING)
 		return SNDRV_PCM_STATE_RUNNING;
 	return dshare->state;
@@ -531,16 +505,7 @@ static snd_pcm_sframes_t snd_pcm_dshare_mmap_commit(snd_pcm_t *pcm,
 	snd_pcm_direct_t *dshare = pcm->private_data;
 	int err;
 
-	switch (snd_pcm_state(dshare->spcm)) {
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		if ((err = snd_pcm_direct_slave_recover(dshare)) < 0)
-			return err;
-		break;
-	default:
-		break;
-	}
-	err = snd_pcm_direct_client_chk_xrun(dshare, pcm);
+	err = snd_pcm_direct_check_xrun(dshare, pcm);
 	if (err < 0)
 		return err;
 	if (! size)
diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index 1653f6fba86c..729ff447b41f 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -134,19 +134,7 @@ static int snd_pcm_dsnoop_sync_ptr(snd_pcm_t *pcm)
 	snd_pcm_sframes_t diff;
 	int err;
 
-	switch (snd_pcm_state(dsnoop->spcm)) {
-	case SND_PCM_STATE_DISCONNECTED:
-		dsnoop->state = SNDRV_PCM_STATE_DISCONNECTED;
-		return -ENODEV;
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		if ((err = snd_pcm_direct_slave_recover(dsnoop)) < 0)
-			return err;
-		break;
-	default:
-		break;
-	}
-	err = snd_pcm_direct_client_chk_xrun(dsnoop, pcm);
+	err = snd_pcm_direct_check_xrun(dsnoop, pcm);
 	if (err < 0)
 		return err;
 	if (dsnoop->slowptr)
@@ -208,22 +196,8 @@ static int snd_pcm_dsnoop_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 static snd_pcm_state_t snd_pcm_dsnoop_state(snd_pcm_t *pcm)
 {
 	snd_pcm_direct_t *dsnoop = pcm->private_data;
-	int err;
-	snd_pcm_state_t state;
-	state = snd_pcm_state(dsnoop->spcm);
-	switch (state) {
-	case SND_PCM_STATE_DISCONNECTED:
-		dsnoop->state = state;
-		return state;
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		if ((err = snd_pcm_direct_slave_recover(dsnoop)) < 0)
-			return err;
-		break;
-	default:
-		break;
-	}
-	snd_pcm_direct_client_chk_xrun(dsnoop, pcm);
+
+	snd_pcm_direct_check_xrun(dsnoop, pcm);
 	return dsnoop->state;
 }
 
@@ -422,16 +396,7 @@ static snd_pcm_sframes_t snd_pcm_dsnoop_mmap_commit(snd_pcm_t *pcm,
 	snd_pcm_direct_t *dsnoop = pcm->private_data;
 	int err;
 
-	switch (snd_pcm_state(dsnoop->spcm)) {
-	case SND_PCM_STATE_XRUN:
-	case SND_PCM_STATE_SUSPENDED:
-		if ((err = snd_pcm_direct_slave_recover(dsnoop)) < 0)
-			return err;
-		break;
-	default:
-		break;
-	}
-	err = snd_pcm_direct_client_chk_xrun(dsnoop, pcm);
+	err = snd_pcm_direct_check_xrun(dsnoop, pcm);
 	if (err < 0)
 		return err;
 	if (dsnoop->state == SND_PCM_STATE_RUNNING) {
-- 
2.34.1

