Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2C1175A5
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:26:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC83F16EF;
	Mon,  9 Dec 2019 20:25:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC83F16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575919577;
	bh=LZHgRvV2l3tObdOLYFvgggAICzTzYQlzT8vaYAoXmF8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mw2bdfr0uYbF50It1wTgemRB8uaMOblpiUGFjJ7WOvJpMydnfJYqOgVvWAIYkdnSO
	 W49mI+CDe2SY8YoBgDjM1HqFts9CRhJyGV3Z0ZNtrh47UpDxNWygprx0dU6XpRRnX4
	 jXVhdJdcIpMDulwUK0yrdrzOz8GHxO5MtLGIpab8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA1AF80234;
	Mon,  9 Dec 2019 20:24:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9931F800C4; Mon,  9 Dec 2019 20:24:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D27CF800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 20:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D27CF800C4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A307ACC4;
 Mon,  9 Dec 2019 19:24:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 20:24:22 +0100
Message-Id: <20191209192422.23902-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <s5hy2vl9v1f.wl-tiwai@suse.de>
References: <s5hy2vl9v1f.wl-tiwai@suse.de>
Subject: [alsa-devel] [PATCH v2] ALSA: firewire: Use managed buffer
	allocation
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

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: corrected the return value to propate the error
        initialize err variable for covering uninitialized compiler errors

 sound/firewire/bebob/bebob_pcm.c         | 11 +++--------
 sound/firewire/dice/dice-pcm.c           | 13 ++++---------
 sound/firewire/digi00x/digi00x-pcm.c     | 11 +++--------
 sound/firewire/fireface/ff-pcm.c         | 11 +++--------
 sound/firewire/fireworks/fireworks_pcm.c | 11 +++--------
 sound/firewire/isight.c                  | 10 ++--------
 sound/firewire/motu/motu-pcm.c           | 11 +++--------
 sound/firewire/oxfw/oxfw-pcm.c           | 19 +++++--------------
 sound/firewire/tascam/tascam-pcm.c       | 11 +++--------
 9 files changed, 29 insertions(+), 79 deletions(-)

diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index d4edd06d32cf..5fbf1d74c544 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -212,11 +212,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_bebob *bebob = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
+	int err = 0;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
@@ -247,7 +243,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&bebob->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int
@@ -377,8 +373,7 @@ int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
 		 "%s PCM", bebob->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 end:
 	return err;
 }
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index be79d659eedf..2700f7f6f754 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -264,11 +264,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_dice *dice = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
+	int err = 0;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
@@ -304,7 +300,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&dice->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int capture_prepare(struct snd_pcm_substream *substream)
@@ -457,9 +453,8 @@ int snd_dice_create_pcm(struct snd_dice *dice)
 			snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 					&playback_ops);
 
-		snd_pcm_lib_preallocate_pages_for_all(pcm,
-						      SNDRV_DMA_TYPE_VMALLOC,
-						      NULL, 0, 0);
+		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					       NULL, 0, 0);
 	}
 
 	return 0;
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 57cbce4fd836..bacf9b860f3f 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -188,11 +188,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_dg00x *dg00x = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
+	int err = 0;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
@@ -223,7 +219,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&dg00x->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -360,8 +356,7 @@ int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
 		 "%s PCM", dg00x->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index bd91c6ecb112..a52a4344ec6f 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -228,11 +228,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_ff *ff = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
+	int err = 0;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
@@ -263,7 +259,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&ff->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -400,8 +396,7 @@ int snd_ff_create_pcm_devices(struct snd_ff *ff)
 		 "%s PCM", ff->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pcm_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pcm_capture_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index e69896d748df..8e60d22acbcc 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -248,11 +248,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_efw *efw = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
+	int err = 0;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
@@ -283,7 +279,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&efw->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -406,8 +402,7 @@ int snd_efw_create_pcm_devices(struct snd_efw *efw)
 	snprintf(pcm->name, sizeof(pcm->name), "%s PCM", efw->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 end:
 	return err;
 }
diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index d9f1b962bfef..214f77b0e8b7 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -286,11 +286,6 @@ static int isight_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *hw_params)
 {
 	struct isight *isight = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
 
 	WRITE_ONCE(isight->pcm_active, true);
 
@@ -336,7 +331,7 @@ static int isight_hw_free(struct snd_pcm_substream *substream)
 	isight_stop_streaming(isight);
 	mutex_unlock(&isight->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int isight_start_streaming(struct isight *isight)
@@ -463,8 +458,7 @@ static int isight_create_pcm(struct isight *isight)
 	strcpy(pcm->name, "iSight");
 	isight->pcm = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 	isight->pcm->ops = &ops;
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 005970931030..931978eb30c9 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -212,11 +212,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_motu *motu = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
+	int err = 0;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
@@ -247,7 +243,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&motu->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int capture_prepare(struct snd_pcm_substream *substream)
@@ -374,8 +370,7 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 67fd3e844dd6..974e53bbae10 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -237,11 +237,7 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
+	int err = 0;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
@@ -264,11 +260,7 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
+	int err = 0;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
@@ -301,7 +293,7 @@ static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&oxfw->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 {
@@ -316,7 +308,7 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&oxfw->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -454,8 +446,7 @@ int snd_oxfw_create_pcm(struct snd_oxfw *oxfw)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	if (cap > 0)
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index 8e9b444c8bff..92551ca3460c 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -117,11 +117,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_tscm *tscm = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
+	int err = 0;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
@@ -152,7 +148,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&tscm->mutex);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -289,8 +285,7 @@ int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
 		 "%s PCM", tscm->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
