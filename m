Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E030439F8A4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 706901746;
	Tue,  8 Jun 2021 16:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 706901746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161586;
	bh=laEbkPFPYqGO6VM7qX7LcMu22cBXGPKwYRDwK4rnYes=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLgBs1V9ply7A7gSnBp8lhWInWom0LeELCC0oboXB3yBlJTaj7dXoVSIHJVfRuZ6D
	 5X1H6tbkRY18ob/DeN8s2hUmv/T4UsWqLyFvzpsfuvfwJfiwYBH93v+MtObAr7cREm
	 oBjWTh8lKVjjgfPeQElnPlPkZWL3qwEaPh4BOSY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E366F805B1;
	Tue,  8 Jun 2021 16:06:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64420F8059F; Tue,  8 Jun 2021 16:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10FC0F804BD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10FC0F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="m3BtcsEK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Nq0mTtT5"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B8E35219DB
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDF2sBNWUYC12MOHbm7tU0/aT8lXOQZE6vT1pu0DXbU=;
 b=m3BtcsEKpYboTM8wxFhsM76UovWTjSC0yr4KrrHHwF78HcWtFFDj6Q9/QVM5YMd+0lOOGc
 fpr4YDP0LP8jjyr6GQxA+1kF5dYu9D/FEqLhb1y30nfU414ZO0wqUBGR5TI016eUDnxGlQ
 qORVJK0+2TWrfFJtiJolVElyRzFDu6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDF2sBNWUYC12MOHbm7tU0/aT8lXOQZE6vT1pu0DXbU=;
 b=Nq0mTtT5o6HoPoI/BEfuSez0FvgJ5HoXkJZZ/KNxe92Kb/MjhP98NDrGcqdvFfP6nRFCEE
 8ItEJG2m4VAG2PDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A5881A3B85;
 Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/66] ALSA: gus: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:38 +0200
Message-Id: <20210608140540.17885-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

ISA GUS driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_main.c   | 18 +++++---
 sound/isa/gus/gus_mem.c    |  3 +-
 sound/isa/gus/gus_mixer.c  |  6 ++-
 sound/isa/gus/gus_pcm.c    | 23 ++++++----
 sound/isa/gus/gus_uart.c   |  3 +-
 sound/isa/gus/gusclassic.c |  6 ++-
 sound/isa/gus/gusextreme.c |  6 ++-
 sound/isa/gus/gusmax.c     | 36 ++++++++++-----
 sound/isa/gus/interwave.c  | 90 ++++++++++++++++++++++++--------------
 9 files changed, 124 insertions(+), 67 deletions(-)

diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index 46bfc5ae17c0..e7abbba9f377 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -165,12 +165,14 @@ int snd_gus_create(struct snd_card *card,
 	gus->gf1.reg_timerctrl = GUSP(gus, TIMERCNTRL);
 	gus->gf1.reg_timerdata = GUSP(gus, TIMERDATA);
 	/* allocate resources */
-	if ((gus->gf1.res_port1 = request_region(port, 16, "GUS GF1 (Adlib/SB)")) == NULL) {
+	gus->gf1.res_port1 = request_region(port, 16, "GUS GF1 (Adlib/SB)");
+	if (!gus->gf1.res_port1) {
 		snd_printk(KERN_ERR "gus: can't grab SB port 0x%lx\n", port);
 		snd_gus_free(gus);
 		return -EBUSY;
 	}
-	if ((gus->gf1.res_port2 = request_region(port + 0x100, 12, "GUS GF1 (Synth)")) == NULL) {
+	gus->gf1.res_port2 = request_region(port + 0x100, 12, "GUS GF1 (Synth)");
+	if (!gus->gf1.res_port2) {
 		snd_printk(KERN_ERR "gus: can't grab synth port 0x%lx\n", port + 0x100);
 		snd_gus_free(gus);
 		return -EBUSY;
@@ -215,7 +217,8 @@ int snd_gus_create(struct snd_card *card,
 	gus->gf1.pcm_channels = pcm_channels;
 	gus->gf1.volume_ramp = 25;
 	gus->gf1.smooth_pan = 1;
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, gus, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, gus, &ops);
+	if (err < 0) {
 		snd_gus_free(gus);
 		return err;
 	}
@@ -404,14 +407,17 @@ int snd_gus_initialize(struct snd_gus_card *gus)
 	int err;
 
 	if (!gus->interwave) {
-		if ((err = snd_gus_check_version(gus)) < 0) {
+		err = snd_gus_check_version(gus);
+		if (err < 0) {
 			snd_printk(KERN_ERR "version check failed\n");
 			return err;
 		}
-		if ((err = snd_gus_detect_memory(gus)) < 0)
+		err = snd_gus_detect_memory(gus);
+		if (err < 0)
 			return err;
 	}
-	if ((err = snd_gus_init_dma_irq(gus, 1)) < 0)
+	err = snd_gus_init_dma_irq(gus, 1);
+	if (err < 0)
 		return err;
 	snd_gf1_start(gus);
 	gus->initialized = 1;
diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index cb02d18dde60..ff9480f249fe 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -210,7 +210,8 @@ int snd_gf1_mem_free(struct snd_gf1_mem * alloc, unsigned int address)
 	struct snd_gf1_mem_block *block;
 
 	snd_gf1_mem_lock(alloc, 0);
-	if ((block = snd_gf1_mem_look(alloc, address)) != NULL) {
+	block = snd_gf1_mem_look(alloc, address);
+	if (block) {
 		result = snd_gf1_mem_xfree(alloc, block);
 		snd_gf1_mem_lock(alloc, 1);
 		return result;
diff --git a/sound/isa/gus/gus_mixer.c b/sound/isa/gus/gus_mixer.c
index 201d0c40d0d9..03f9cfcbf601 100644
--- a/sound/isa/gus/gus_mixer.c
+++ b/sound/isa/gus/gus_mixer.c
@@ -162,12 +162,14 @@ int snd_gf1_new_mixer(struct snd_gus_card * gus)
 	if (!gus->ics_flag) {
 		max = gus->ess_flag ? 1 : ARRAY_SIZE(snd_gf1_controls);
 		for (idx = 0; idx < max; idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_gf1_controls[idx], gus))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_gf1_controls[idx], gus));
+			if (err < 0)
 				return err;
 		}
 	} else {
 		for (idx = 0; idx < ARRAY_SIZE(snd_ics_controls); idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_ics_controls[idx], gus))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_ics_controls[idx], gus));
+			if (err < 0)
 				return err;
 		}
 	}
diff --git a/sound/isa/gus/gus_pcm.c b/sound/isa/gus/gus_pcm.c
index aca4ab90e5bc..230f65a0e4b0 100644
--- a/sound/isa/gus/gus_pcm.c
+++ b/sound/isa/gus/gus_pcm.c
@@ -430,17 +430,19 @@ static int snd_gf1_pcm_playback_hw_params(struct snd_pcm_substream *substream,
 			snd_gf1_mem_free(&gus->gf1.mem_alloc, pcmp->memory);
 			pcmp->memory = 0;
 		}
-		if ((block = snd_gf1_mem_alloc(&gus->gf1.mem_alloc,
-		                               SNDRV_GF1_MEM_OWNER_DRIVER,
-					       "GF1 PCM",
-		                               runtime->dma_bytes, 1, 32,
-		                               NULL)) == NULL)
+		block = snd_gf1_mem_alloc(&gus->gf1.mem_alloc,
+					  SNDRV_GF1_MEM_OWNER_DRIVER,
+					  "GF1 PCM",
+					  runtime->dma_bytes, 1, 32,
+					  NULL);
+		if (!block)
 			return -ENOMEM;
 		pcmp->memory = block->ptr;
 	}
 	pcmp->voices = params_channels(hw_params);
 	if (pcmp->pvoices[0] == NULL) {
-		if ((pcmp->pvoices[0] = snd_gf1_alloc_voice(pcmp->gus, SNDRV_GF1_VOICE_TYPE_PCM, 0, 0)) == NULL)
+		pcmp->pvoices[0] = snd_gf1_alloc_voice(pcmp->gus, SNDRV_GF1_VOICE_TYPE_PCM, 0, 0);
+		if (!pcmp->pvoices[0])
 			return -ENOMEM;
 		pcmp->pvoices[0]->handler_wave = snd_gf1_pcm_interrupt_wave;
 		pcmp->pvoices[0]->handler_volume = snd_gf1_pcm_interrupt_volume;
@@ -448,7 +450,8 @@ static int snd_gf1_pcm_playback_hw_params(struct snd_pcm_substream *substream,
 		pcmp->pvoices[0]->private_data = pcmp;
 	}
 	if (pcmp->voices > 1 && pcmp->pvoices[1] == NULL) {
-		if ((pcmp->pvoices[1] = snd_gf1_alloc_voice(pcmp->gus, SNDRV_GF1_VOICE_TYPE_PCM, 0, 0)) == NULL)
+		pcmp->pvoices[1] = snd_gf1_alloc_voice(pcmp->gus, SNDRV_GF1_VOICE_TYPE_PCM, 0, 0);
+		if (!pcmp->pvoices[1])
 			return -ENOMEM;
 		pcmp->pvoices[1]->handler_wave = snd_gf1_pcm_interrupt_wave;
 		pcmp->pvoices[1]->handler_volume = snd_gf1_pcm_interrupt_volume;
@@ -689,7 +692,8 @@ static int snd_gf1_pcm_playback_open(struct snd_pcm_substream *substream)
 	printk(KERN_DEBUG "playback.buffer = 0x%lx, gf1.pcm_buffer = 0x%lx\n",
 	       (long) pcm->playback.buffer, (long) gus->gf1.pcm_buffer);
 #endif
-	if ((err = snd_gf1_dma_init(gus)) < 0)
+	err = snd_gf1_dma_init(gus);
+	if (err < 0)
 		return err;
 	pcmp->flags = SNDRV_GF1_PCM_PFLG_NONE;
 	pcmp->substream = substream;
@@ -888,7 +892,8 @@ int snd_gf1_pcm_new(struct snd_gus_card *gus, int pcm_dev, int control_index)
 		kctl = snd_ctl_new1(&snd_gf1_pcm_volume_control1, gus);
 	else
 		kctl = snd_ctl_new1(&snd_gf1_pcm_volume_control, gus);
-	if ((err = snd_ctl_add(card, kctl)) < 0)
+	err = snd_ctl_add(card, kctl);
+	if (err < 0)
 		return err;
 	kctl->id.index = control_index;
 
diff --git a/sound/isa/gus/gus_uart.c b/sound/isa/gus/gus_uart.c
index 4fb4ed79e262..3975848160e7 100644
--- a/sound/isa/gus/gus_uart.c
+++ b/sound/isa/gus/gus_uart.c
@@ -232,7 +232,8 @@ int snd_gf1_rawmidi_new(struct snd_gus_card *gus, int device)
 	struct snd_rawmidi *rmidi;
 	int err;
 
-	if ((err = snd_rawmidi_new(gus->card, "GF1", device, 1, 1, &rmidi)) < 0)
+	err = snd_rawmidi_new(gus->card, "GF1", device, 1, 1, &rmidi);
+	if (err < 0)
 		return err;
 	strcpy(rmidi->name, gus->interwave ? "AMD InterWave" : "GF1");
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_gf1_uart_output);
diff --git a/sound/isa/gus/gusclassic.c b/sound/isa/gus/gusclassic.c
index 0fba5d8fe84f..bca1caa4968c 100644
--- a/sound/isa/gus/gusclassic.c
+++ b/sound/isa/gus/gusclassic.c
@@ -113,14 +113,16 @@ static int snd_gusclassic_detect(struct snd_gus_card *gus)
 	unsigned char d;
 
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
-	if (((d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET)) & 0x07) != 0) {
+	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
+	if ((d & 0x07) != 0) {
 		snd_printdd("[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
 	udelay(160);
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 1);	/* release reset */
 	udelay(160);
-	if (((d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET)) & 0x07) != 1) {
+	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
+	if ((d & 0x07) != 1) {
 		snd_printdd("[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
diff --git a/sound/isa/gus/gusextreme.c b/sound/isa/gus/gusextreme.c
index da2b2ca6b721..a409a4a29afc 100644
--- a/sound/isa/gus/gusextreme.c
+++ b/sound/isa/gus/gusextreme.c
@@ -177,14 +177,16 @@ static int snd_gusextreme_detect(struct snd_gus_card *gus,
 	udelay(100);
 
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
-	if (((d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET)) & 0x07) != 0) {
+	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
+	if ((d & 0x07) != 0) {
 		snd_printdd("[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
 		return -EIO;
 	}
 	udelay(160);
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 1);	/* release reset */
 	udelay(160);
-	if (((d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET)) & 0x07) != 1) {
+	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
+	if ((d & 0x07) != 1) {
 		snd_printdd("[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
 		return -EIO;
 	}
diff --git a/sound/isa/gus/gusmax.c b/sound/isa/gus/gusmax.c
index 24b945f1768d..ad118d462142 100644
--- a/sound/isa/gus/gusmax.c
+++ b/sound/isa/gus/gusmax.c
@@ -71,14 +71,16 @@ static int snd_gusmax_detect(struct snd_gus_card *gus)
 	unsigned char d;
 
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
-	if (((d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET)) & 0x07) != 0) {
+	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
+	if ((d & 0x07) != 0) {
 		snd_printdd("[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
 	udelay(160);
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 1);	/* release reset */
 	udelay(160);
-	if (((d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET)) & 0x07) != 1) {
+	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
+	if ((d & 0x07) != 1) {
 		snd_printdd("[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
@@ -136,20 +138,24 @@ static int snd_gusmax_mixer(struct snd_wss *chip)
 	/* reassign AUXA to SYNTHESIZER */
 	strcpy(id1.name, "Aux Playback Switch");
 	strcpy(id2.name, "Synth Playback Switch");
-	if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+	err = snd_ctl_rename_id(card, &id1, &id2);
+	if (err < 0)
 		return err;
 	strcpy(id1.name, "Aux Playback Volume");
 	strcpy(id2.name, "Synth Playback Volume");
-	if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+	err = snd_ctl_rename_id(card, &id1, &id2);
+	if (err < 0)
 		return err;
 	/* reassign AUXB to CD */
 	strcpy(id1.name, "Aux Playback Switch"); id1.index = 1;
 	strcpy(id2.name, "CD Playback Switch");
-	if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+	err = snd_ctl_rename_id(card, &id1, &id2);
+	if (err < 0)
 		return err;
 	strcpy(id1.name, "Aux Playback Volume");
 	strcpy(id2.name, "CD Playback Volume");
-	if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+	err = snd_ctl_rename_id(card, &id1, &id2);
+	if (err < 0)
 		return err;
 #if 0
 	/* reassign Mono Input to MIC */
@@ -209,7 +215,8 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 	
 	xirq = irq[dev];
 	if (xirq == SNDRV_AUTO_IRQ) {
-		if ((xirq = snd_legacy_find_free_irq(possible_irqs)) < 0) {
+		xirq = snd_legacy_find_free_irq(possible_irqs);
+		if (xirq < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
 			err = -EBUSY;
 			goto _err;
@@ -217,7 +224,8 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 	}
 	xdma1 = dma1[dev];
 	if (xdma1 == SNDRV_AUTO_DMA) {
-		if ((xdma1 = snd_legacy_find_free_dma(possible_dmas)) < 0) {
+		xdma1 = snd_legacy_find_free_dma(possible_dmas);
+		if (xdma1 < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free DMA1\n");
 			err = -EBUSY;
 			goto _err;
@@ -225,7 +233,8 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 	}
 	xdma2 = dma2[dev];
 	if (xdma2 == SNDRV_AUTO_DMA) {
-		if ((xdma2 = snd_legacy_find_free_dma(possible_dmas)) < 0) {
+		xdma2 = snd_legacy_find_free_dma(possible_dmas);
+		if (xdma2 < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free DMA2\n");
 			err = -EBUSY;
 			goto _err;
@@ -260,13 +269,15 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 	if (err < 0)
 		goto _err;
 
-	if ((err = snd_gusmax_detect(gus)) < 0)
+	err = snd_gusmax_detect(gus);
+	if (err < 0)
 		goto _err;
 
 	maxcard->gus_status_reg = gus->gf1.reg_irqstat;
 	maxcard->pcm_status_reg = gus->gf1.port + 0x10c + 2;
 	snd_gusmax_init(dev, card, gus);
-	if ((err = snd_gus_initialize(gus)) < 0)
+	err = snd_gus_initialize(gus);
+	if (err < 0)
 		goto _err;
 
 	if (!gus->max_flag) {
@@ -307,7 +318,8 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 		goto _err;
 
 	if (pcm_channels[dev] > 0) {
-		if ((err = snd_gf1_pcm_new(gus, 1, 1)) < 0)
+		err = snd_gf1_pcm_new(gus, 1, 1);
+		if (err < 0)
 			goto _err;
 	}
 	err = snd_gusmax_mixer(wss);
diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index 99581fba4ca8..755de47d0bb6 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -204,7 +204,8 @@ static int snd_interwave_detect_stb(struct snd_interwave *iwcard,
 			port = 0x360;
 		}
 		while (port <= 0x380) {
-			if ((iwcard->i2c_res = request_region(port, 1, "InterWave (I2C bus)")) != NULL)
+			iwcard->i2c_res = request_region(port, 1, "InterWave (I2C bus)");
+			if (iwcard->i2c_res)
 				break;
 			port += 0x10;
 		}
@@ -217,11 +218,13 @@ static int snd_interwave_detect_stb(struct snd_interwave *iwcard,
 	}
 
 	sprintf(name, "InterWave-%i", card->number);
-	if ((err = snd_i2c_bus_create(card, name, NULL, &bus)) < 0)
+	err = snd_i2c_bus_create(card, name, NULL, &bus);
+	if (err < 0)
 		return err;
 	bus->private_value = port;
 	bus->hw_ops.bit = &snd_interwave_i2c_bit_ops;
-	if ((err = snd_tea6330t_detect(bus, 0)) < 0)
+	err = snd_tea6330t_detect(bus, 0);
+	if (err < 0)
 		return err;
 	*rbus = bus;
 	return 0;
@@ -241,14 +244,16 @@ static int snd_interwave_detect(struct snd_interwave *iwcard,
 	int d;
 
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
-	if (((d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET)) & 0x07) != 0) {
+	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
+	if ((d & 0x07) != 0) {
 		snd_printdd("[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
 	udelay(160);
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 1);	/* release reset */
 	udelay(160);
-	if (((d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET)) & 0x07) != 1) {
+	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
+	if ((d & 0x07) != 1) {
 		snd_printdd("[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
@@ -493,16 +498,20 @@ static int snd_interwave_mixer(struct snd_wss *chip)
 #if 0
 	/* remove mono microphone controls */
 	strcpy(id1.name, "Mic Playback Switch");
-	if ((err = snd_ctl_remove_id(card, &id1)) < 0)
+	err = snd_ctl_remove_id(card, &id1);
+	if (err < 0)
 		return err;
 	strcpy(id1.name, "Mic Playback Volume");
-	if ((err = snd_ctl_remove_id(card, &id1)) < 0)
+	err = snd_ctl_remove_id(card, &id1);
+	if (err < 0)
 		return err;
 #endif
 	/* add new master and mic controls */
-	for (idx = 0; idx < ARRAY_SIZE(snd_interwave_controls); idx++)
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_interwave_controls[idx], chip))) < 0)
+	for (idx = 0; idx < ARRAY_SIZE(snd_interwave_controls); idx++) {
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_interwave_controls[idx], chip));
+		if (err < 0)
 			return err;
+	}
 	snd_wss_out(chip, CS4231_LINE_LEFT_OUTPUT, 0x9f);
 	snd_wss_out(chip, CS4231_LINE_RIGHT_OUTPUT, 0x9f);
 	snd_wss_out(chip, CS4231_LEFT_MIC_INPUT, 0x9f);
@@ -510,20 +519,24 @@ static int snd_interwave_mixer(struct snd_wss *chip)
 	/* reassign AUXA to SYNTHESIZER */
 	strcpy(id1.name, "Aux Playback Switch");
 	strcpy(id2.name, "Synth Playback Switch");
-	if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+	err = snd_ctl_rename_id(card, &id1, &id2);
+	if (err < 0)
 		return err;
 	strcpy(id1.name, "Aux Playback Volume");
 	strcpy(id2.name, "Synth Playback Volume");
-	if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+	err = snd_ctl_rename_id(card, &id1, &id2);
+	if (err < 0)
 		return err;
 	/* reassign AUXB to CD */
 	strcpy(id1.name, "Aux Playback Switch"); id1.index = 1;
 	strcpy(id2.name, "CD Playback Switch");
-	if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+	err = snd_ctl_rename_id(card, &id1, &id2);
+	if (err < 0)
 		return err;
 	strcpy(id1.name, "Aux Playback Volume");
 	strcpy(id2.name, "CD Playback Volume");
-	if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+	err = snd_ctl_rename_id(card, &id1, &id2);
+	if (err < 0)
 		return err;
 	return 0;
 }
@@ -633,18 +646,20 @@ static int snd_interwave_probe(struct snd_card *card, int dev)
 	xdma1 = dma1[dev];
 	xdma2 = dma2[dev];
 
-	if ((err = snd_gus_create(card,
-				  port[dev],
-				  -xirq, xdma1, xdma2,
-				  0, 32,
-				  pcm_channels[dev], effect[dev], &gus)) < 0)
+	err = snd_gus_create(card,
+			     port[dev],
+			     -xirq, xdma1, xdma2,
+			     0, 32,
+			     pcm_channels[dev], effect[dev], &gus);
+	if (err < 0)
 		return err;
 
-	if ((err = snd_interwave_detect(iwcard, gus, dev
+	err = snd_interwave_detect(iwcard, gus, dev
 #ifdef SNDRV_STB
-            , &i2c_bus
+				   , &i2c_bus
 #endif
-	    )) < 0)
+				   );
+	if (err < 0)
 		return err;
 
 	iwcard->gus_status_reg = gus->gf1.reg_irqstat;
@@ -652,7 +667,8 @@ static int snd_interwave_probe(struct snd_card *card, int dev)
 
 	snd_interwave_init(dev, gus);
 	snd_interwave_detect_memory(gus);
-	if ((err = snd_gus_initialize(gus)) < 0)
+	err = snd_gus_initialize(gus);
+	if (err < 0)
 		return err;
 
 	if (request_irq(xirq, snd_interwave_interrupt, 0,
@@ -708,19 +724,23 @@ static int snd_interwave_probe(struct snd_card *card, int dev)
 		strcpy(id1.name, "Master Playback Switch");
 		strcpy(id2.name, id1.name);
 		id2.index = 1;
-		if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+		err = snd_ctl_rename_id(card, &id1, &id2);
+		if (err < 0)
 			return err;
 		strcpy(id1.name, "Master Playback Volume");
 		strcpy(id2.name, id1.name);
-		if ((err = snd_ctl_rename_id(card, &id1, &id2)) < 0)
+		err = snd_ctl_rename_id(card, &id1, &id2);
+		if (err < 0)
 			return err;
-		if ((err = snd_tea6330t_update_mixer(card, i2c_bus, 0, 1)) < 0)
+		err = snd_tea6330t_update_mixer(card, i2c_bus, 0, 1);
+		if (err < 0)
 			return err;
 	}
 #endif
 
 	gus->uart_enable = midi[dev];
-	if ((err = snd_gf1_rawmidi_new(gus, 0)) < 0)
+	err = snd_gf1_rawmidi_new(gus, 0);
+	if (err < 0)
 		return err;
 
 #ifndef SNDRV_STB
@@ -758,7 +778,8 @@ static int snd_interwave_isa_probe1(int dev, struct device *devptr)
 	if (err < 0)
 		return err;
 
-	if ((err = snd_interwave_probe(card, dev)) < 0) {
+	err = snd_interwave_probe(card, dev);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -786,19 +807,22 @@ static int snd_interwave_isa_probe(struct device *pdev,
 	static const int possible_dmas[] = {0, 1, 3, 5, 6, 7, -1};
 
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
-		if ((irq[dev] = snd_legacy_find_free_irq(possible_irqs)) < 0) {
+		irq[dev] = snd_legacy_find_free_irq(possible_irqs);
+		if (irq[dev] < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma1[dev] == SNDRV_AUTO_DMA) {
-		if ((dma1[dev] = snd_legacy_find_free_dma(possible_dmas)) < 0) {
+		dma1[dev] = snd_legacy_find_free_dma(possible_dmas);
+		if (dma1[dev] < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
 	}
 	if (dma2[dev] == SNDRV_AUTO_DMA) {
-		if ((dma2[dev] = snd_legacy_find_free_dma(possible_dmas)) < 0) {
+		dma2[dev] = snd_legacy_find_free_dma(possible_dmas);
+		if (dma2[dev] < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free DMA2\n");
 			return -EBUSY;
 		}
@@ -853,11 +877,13 @@ static int snd_interwave_pnp_detect(struct pnp_card_link *pcard,
 	if (res < 0)
 		return res;
 
-	if ((res = snd_interwave_pnp(dev, card->private_data, pcard, pid)) < 0) {
+	res = snd_interwave_pnp(dev, card->private_data, pcard, pid);
+	if (res < 0) {
 		snd_card_free(card);
 		return res;
 	}
-	if ((res = snd_interwave_probe(card, dev)) < 0) {
+	res = snd_interwave_probe(card, dev);
+	if (res < 0) {
 		snd_card_free(card);
 		return res;
 	}
-- 
2.26.2

