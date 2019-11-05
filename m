Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031BF0166
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:28:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA14216EE;
	Tue,  5 Nov 2019 16:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA14216EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967737;
	bh=LcC6PWHM+aWLjwGDuSZAzjvg0XGm8nU8cpnTTGMJJoE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJCokh+3YMH8jjrGSdg1EKBGwUurahIRUAw1iBDWHfDMEgW6ReQFalrx5Rllde7Cm
	 IoGRvhws1t9O+zLvTtHUFTBG/2K/NA/SnD1ncUtD+ORCb7xR5MEOdkouG5lj97Tk93
	 PD5jrIHwB0ez3/zBmEOLgVd/AOYOFylQ1fHIOG+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15841F8071F;
	Tue,  5 Nov 2019 16:19:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E148CF80638; Tue,  5 Nov 2019 16:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C10A3F8053B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C10A3F8053B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 473EAB29A
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:42 +0100
Message-Id: <20191105151856.10785-11-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 10/24] ALSA: firewire: Convert to the common
	vmalloc memalloc
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

The recent change (*) in the ALSA memalloc core allows us to drop the
special vmalloc-specific allocation and page handling.  This patch
coverts to the common code.
(*) df3fd6509421: ALSA: memalloc: Add vmalloc buffer allocation
                  support
    6ef6be988f98: ALSA: pcm: Handle special page mapping in the
                  default mmap handler

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/bebob/bebob_pcm.c         |  9 ++++-----
 sound/firewire/dice/dice-pcm.c           | 11 ++++++-----
 sound/firewire/digi00x/digi00x-pcm.c     |  9 ++++-----
 sound/firewire/fireface/ff-pcm.c         |  9 ++++-----
 sound/firewire/fireworks/fireworks_pcm.c |  9 ++++-----
 sound/firewire/isight.c                  |  8 ++++----
 sound/firewire/motu/motu-pcm.c           |  9 ++++-----
 sound/firewire/oxfw/oxfw-pcm.c           | 14 ++++++--------
 sound/firewire/tascam/tascam-pcm.c       |  9 ++++-----
 9 files changed, 40 insertions(+), 47 deletions(-)

diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index 1b100159f4c5..d4edd06d32cf 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -214,8 +214,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_bebob *bebob = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -248,7 +247,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&bebob->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int
@@ -354,7 +353,6 @@ int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
 		.trigger	= pcm_capture_trigger,
 		.pointer	= pcm_capture_pointer,
 		.ack		= pcm_capture_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	static const struct snd_pcm_ops playback_ops = {
 		.open		= pcm_open,
@@ -366,7 +364,6 @@ int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
 		.trigger	= pcm_playback_trigger,
 		.pointer	= pcm_playback_pointer,
 		.ack		= pcm_playback_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	struct snd_pcm *pcm;
 	int err;
@@ -380,6 +377,8 @@ int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
 		 "%s PCM", bebob->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 end:
 	return err;
 }
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index f1848fb39bd0..be79d659eedf 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -266,8 +266,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_dice *dice = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -305,7 +304,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&dice->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int capture_prepare(struct snd_pcm_substream *substream)
@@ -417,7 +416,6 @@ int snd_dice_create_pcm(struct snd_dice *dice)
 		.trigger   = capture_trigger,
 		.pointer   = capture_pointer,
 		.ack       = capture_ack,
-		.page      = snd_pcm_lib_get_vmalloc_page,
 	};
 	static const struct snd_pcm_ops playback_ops = {
 		.open      = pcm_open,
@@ -429,7 +427,6 @@ int snd_dice_create_pcm(struct snd_dice *dice)
 		.trigger   = playback_trigger,
 		.pointer   = playback_pointer,
 		.ack       = playback_ack,
-		.page      = snd_pcm_lib_get_vmalloc_page,
 	};
 	struct snd_pcm *pcm;
 	unsigned int capture, playback;
@@ -459,6 +456,10 @@ int snd_dice_create_pcm(struct snd_dice *dice)
 		if (playback > 0)
 			snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 					&playback_ops);
+
+		snd_pcm_lib_preallocate_pages_for_all(pcm,
+						      SNDRV_DMA_TYPE_VMALLOC,
+						      NULL, 0, 0);
 	}
 
 	return 0;
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 8befc5d2ef22..57cbce4fd836 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -190,8 +190,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_dg00x *dg00x = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -224,7 +223,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&dg00x->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -337,7 +336,6 @@ int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
 		.trigger	= pcm_capture_trigger,
 		.pointer	= pcm_capture_pointer,
 		.ack		= pcm_capture_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	static const struct snd_pcm_ops playback_ops = {
 		.open		= pcm_open,
@@ -349,7 +347,6 @@ int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
 		.trigger	= pcm_playback_trigger,
 		.pointer	= pcm_playback_pointer,
 		.ack		= pcm_playback_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	struct snd_pcm *pcm;
 	int err;
@@ -363,6 +360,8 @@ int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
 		 "%s PCM", dg00x->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index c29f87a65c0f..4e3bd9a2bec0 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -230,8 +230,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_ff *ff = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -264,7 +263,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&ff->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -377,7 +376,6 @@ int snd_ff_create_pcm_devices(struct snd_ff *ff)
 		.trigger	= pcm_capture_trigger,
 		.pointer	= pcm_capture_pointer,
 		.ack		= pcm_capture_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	static const struct snd_pcm_ops pcm_playback_ops = {
 		.open		= pcm_open,
@@ -389,7 +387,6 @@ int snd_ff_create_pcm_devices(struct snd_ff *ff)
 		.trigger	= pcm_playback_trigger,
 		.pointer	= pcm_playback_pointer,
 		.ack		= pcm_playback_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	struct snd_pcm *pcm;
 	int err;
@@ -403,6 +400,8 @@ int snd_ff_create_pcm_devices(struct snd_ff *ff)
 		 "%s PCM", ff->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pcm_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pcm_capture_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index 64c1bcf28dfa..e69896d748df 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -250,8 +250,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_efw *efw = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -284,7 +283,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&efw->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -384,7 +383,6 @@ int snd_efw_create_pcm_devices(struct snd_efw *efw)
 		.trigger	= pcm_capture_trigger,
 		.pointer	= pcm_capture_pointer,
 		.ack		= pcm_capture_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	static const struct snd_pcm_ops playback_ops = {
 		.open		= pcm_open,
@@ -396,7 +394,6 @@ int snd_efw_create_pcm_devices(struct snd_efw *efw)
 		.trigger	= pcm_playback_trigger,
 		.pointer	= pcm_playback_pointer,
 		.ack		= pcm_playback_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	struct snd_pcm *pcm;
 	int err;
@@ -409,6 +406,8 @@ int snd_efw_create_pcm_devices(struct snd_efw *efw)
 	snprintf(pcm->name, sizeof(pcm->name), "%s PCM", efw->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 end:
 	return err;
 }
diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index a16beda7c530..d9f1b962bfef 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -288,8 +288,7 @@ static int isight_hw_params(struct snd_pcm_substream *substream,
 	struct isight *isight = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -337,7 +336,7 @@ static int isight_hw_free(struct snd_pcm_substream *substream)
 	isight_stop_streaming(isight);
 	mutex_unlock(&isight->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int isight_start_streaming(struct isight *isight)
@@ -453,7 +452,6 @@ static int isight_create_pcm(struct isight *isight)
 		.prepare   = isight_prepare,
 		.trigger   = isight_trigger,
 		.pointer   = isight_pointer,
-		.page      = snd_pcm_lib_get_vmalloc_page,
 	};
 	struct snd_pcm *pcm;
 	int err;
@@ -465,6 +463,8 @@ static int isight_create_pcm(struct isight *isight)
 	strcpy(pcm->name, "iSight");
 	isight->pcm = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 	isight->pcm->ops = &ops;
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 490408b49157..349b4d09e84f 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -218,8 +218,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_motu *motu = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -252,7 +251,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&motu->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int capture_prepare(struct snd_pcm_substream *substream)
@@ -356,7 +355,6 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 		.trigger   = capture_trigger,
 		.pointer   = capture_pointer,
 		.ack       = capture_ack,
-		.page      = snd_pcm_lib_get_vmalloc_page,
 	};
 	static const struct snd_pcm_ops playback_ops = {
 		.open      = pcm_open,
@@ -368,7 +366,6 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 		.trigger   = playback_trigger,
 		.pointer   = playback_pointer,
 		.ack       = playback_ack,
-		.page      = snd_pcm_lib_get_vmalloc_page,
 	};
 	struct snd_pcm *pcm;
 	int err;
@@ -381,6 +378,8 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 74bd1811cec2..9124603edabe 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -239,8 +239,7 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 	struct snd_oxfw *oxfw = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -267,8 +266,7 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 	struct snd_oxfw *oxfw = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -303,7 +301,7 @@ static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&oxfw->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 {
@@ -318,7 +316,7 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&oxfw->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -428,7 +426,6 @@ int snd_oxfw_create_pcm(struct snd_oxfw *oxfw)
 		.trigger   = pcm_capture_trigger,
 		.pointer   = pcm_capture_pointer,
 		.ack       = pcm_capture_ack,
-		.page      = snd_pcm_lib_get_vmalloc_page,
 	};
 	static const struct snd_pcm_ops playback_ops = {
 		.open      = pcm_open,
@@ -440,7 +437,6 @@ int snd_oxfw_create_pcm(struct snd_oxfw *oxfw)
 		.trigger   = pcm_playback_trigger,
 		.pointer   = pcm_playback_pointer,
 		.ack       = pcm_playback_ack,
-		.page      = snd_pcm_lib_get_vmalloc_page,
 	};
 	struct snd_pcm *pcm;
 	unsigned int cap = 0;
@@ -458,6 +454,8 @@ int snd_oxfw_create_pcm(struct snd_oxfw *oxfw)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	if (cap > 0)
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	return 0;
 }
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index cd45f20ba515..8e9b444c8bff 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -119,8 +119,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_tscm *tscm = substream->private_data;
 	int err;
 
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
+	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	if (err < 0)
 		return err;
 
@@ -153,7 +152,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&tscm->mutex);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
@@ -266,7 +265,6 @@ int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
 		.trigger	= pcm_capture_trigger,
 		.pointer	= pcm_capture_pointer,
 		.ack		= pcm_capture_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	static const struct snd_pcm_ops playback_ops = {
 		.open		= pcm_open,
@@ -278,7 +276,6 @@ int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
 		.trigger	= pcm_playback_trigger,
 		.pointer	= pcm_playback_pointer,
 		.ack		= pcm_playback_ack,
-		.page		= snd_pcm_lib_get_vmalloc_page,
 	};
 	struct snd_pcm *pcm;
 	int err;
@@ -292,6 +289,8 @@ int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
 		 "%s PCM", tscm->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
