Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0045239F8C9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:17:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94FBD179B;
	Tue,  8 Jun 2021 16:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94FBD179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161865;
	bh=ORjVJb5skpt9uImgGcnFTIYdZxzMSbHn9+X8D44WFho=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FYcounnu86hCYs9c01WkRRAVo4ZWRlXOdlT6Cea9b9k2o7epnvD/m+SU/Dau/sc/Z
	 CVYke4dWnVo75nAkVvDu9rNAZLXdcrxIIQ88iinLu6TJqpN38i8ImcmDCLMwin1FQG
	 uj41rz6ufYoS5BvO5ILPtsQwwEYmHT+YoIgxggwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73528F805FC;
	Tue,  8 Jun 2021 16:06:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D58F2F805DA; Tue,  8 Jun 2021 16:06:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FFF4F804DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FFF4F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="q3rfkVga"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="wdoMspDZ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8B4681FDEA
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pyB09o/IF8f200Wut2OgkP6yGdR5dmzOyxbwo5Zam6Y=;
 b=q3rfkVgabO9QB6h1GL2mC08tyXXTotrS50wZyd7xlNoCJxVGE6b/5bGM2qoGwdiqGFpNFP
 Nl/ZwCgy5Bf1KEgKP5gmEl4wxBs/QALH/4j2OkbaK5GgYSiGmccmirvM0PVJEhducB2a3J
 NZ3sCF4QXrLEfsoQvPxfXbWu5DOjako=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pyB09o/IF8f200Wut2OgkP6yGdR5dmzOyxbwo5Zam6Y=;
 b=wdoMspDZQVtyIIUwBuK0n24is9pTLUddVJgpkRWQvFCDT14YbNtn/6MXjZmmQvKlj3qSIh
 cLgi0RcWWDDkQGBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 858ECA3B84;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 37/66] ALSA: cs46xx: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:11 +0200
Message-Id: <20210608140540.17885-38-tiwai@suse.de>
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

PCI CS46xx driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx.c     | 31 +++++++++++++--------
 sound/pci/cs46xx/cs46xx_lib.c | 51 ++++++++++++++++++++++-------------
 sound/pci/cs46xx/dsp_spos.c   |  3 ++-
 3 files changed, 55 insertions(+), 30 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx.c b/sound/pci/cs46xx/cs46xx.c
index 1db7b4112840..358ca84cbdea 100644
--- a/sound/pci/cs46xx/cs46xx.c
+++ b/sound/pci/cs46xx/cs46xx.c
@@ -70,45 +70,53 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
 			   0, &card);
 	if (err < 0)
 		return err;
-	if ((err = snd_cs46xx_create(card, pci,
-				     external_amp[dev], thinkpad[dev],
-				     &chip)) < 0) {
+	err = snd_cs46xx_create(card, pci,
+				external_amp[dev], thinkpad[dev],
+				&chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	card->private_data = chip;
 	chip->accept_valid = mmap_valid[dev];
-	if ((err = snd_cs46xx_pcm(chip, 0)) < 0) {
+	err = snd_cs46xx_pcm(chip, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
-	if ((err = snd_cs46xx_pcm_rear(chip, 1)) < 0) {
+	err = snd_cs46xx_pcm_rear(chip, 1);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_cs46xx_pcm_iec958(chip, 2)) < 0) {
+	err = snd_cs46xx_pcm_iec958(chip, 2);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 #endif
-	if ((err = snd_cs46xx_mixer(chip, 2)) < 0) {
+	err = snd_cs46xx_mixer(chip, 2);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	if (chip->nr_ac97_codecs ==2) {
-		if ((err = snd_cs46xx_pcm_center_lfe(chip, 3)) < 0) {
+		err = snd_cs46xx_pcm_center_lfe(chip, 3);
+		if (err < 0) {
 			snd_card_free(card);
 			return err;
 		}
 	}
 #endif
-	if ((err = snd_cs46xx_midi(chip, 0)) < 0) {
+	err = snd_cs46xx_midi(chip, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_cs46xx_start_dsp(chip)) < 0) {
+	err = snd_cs46xx_start_dsp(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -124,7 +132,8 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
 		chip->ba1_addr,
 		chip->irq);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 37f516e6a5c2..1e1eb17f8e07 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -1058,9 +1058,10 @@ static int _cs46xx_adjust_sample_rate (struct snd_cs46xx *chip, struct snd_cs46x
 		int unlinked = cpcm->pcm_channel->unlinked;
 		cs46xx_dsp_destroy_pcm_channel (chip,cpcm->pcm_channel);
 
-		if ( (cpcm->pcm_channel = cs46xx_dsp_create_pcm_channel (chip, sample_rate, cpcm, 
-									 cpcm->hw_buf.addr,
-									 cpcm->pcm_channel_id)) == NULL) {
+		cpcm->pcm_channel = cs46xx_dsp_create_pcm_channel(chip, sample_rate, cpcm,
+								  cpcm->hw_buf.addr,
+								  cpcm->pcm_channel_id);
+		if (!cpcm->pcm_channel) {
 			dev_err(chip->card->dev,
 				"failed to re-create virtual PCM channel\n");
 			return -ENOMEM;
@@ -1147,7 +1148,8 @@ static int snd_cs46xx_playback_hw_params(struct snd_pcm_substream *substream,
 			runtime->dma_addr = 0;
 			runtime->dma_bytes = 0;
 		}
-		if ((err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params))) < 0) {
+		err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
+		if (err < 0) {
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 			mutex_unlock(&chip->spos_mutex);
 #endif
@@ -1295,7 +1297,8 @@ static int snd_cs46xx_capture_hw_params(struct snd_pcm_substream *substream,
 			runtime->dma_addr = 0;
 			runtime->dma_bytes = 0;
 		}
-		if ((err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params))) < 0)
+		err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
+		if (err < 0)
 			return err;
 		substream->ops = &snd_cs46xx_capture_indirect_ops;
 	}
@@ -1760,7 +1763,8 @@ int snd_cs46xx_pcm(struct snd_cs46xx *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "CS46xx", device, MAX_PLAYBACK_CHANNELS, 1, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "CS46xx", device, MAX_PLAYBACK_CHANNELS, 1, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = chip;
@@ -1787,7 +1791,8 @@ int snd_cs46xx_pcm_rear(struct snd_cs46xx *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "CS46xx - Rear", device, MAX_PLAYBACK_CHANNELS, 0, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "CS46xx - Rear", device, MAX_PLAYBACK_CHANNELS, 0, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = chip;
@@ -1811,7 +1816,8 @@ int snd_cs46xx_pcm_center_lfe(struct snd_cs46xx *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "CS46xx - Center LFE", device, MAX_PLAYBACK_CHANNELS, 0, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "CS46xx - Center LFE", device, MAX_PLAYBACK_CHANNELS, 0, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = chip;
@@ -1835,7 +1841,8 @@ int snd_cs46xx_pcm_iec958(struct snd_cs46xx *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "CS46xx - IEC958", device, 1, 0, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "CS46xx - IEC958", device, 1, 0, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = chip;
@@ -2414,7 +2421,8 @@ static void snd_cs46xx_codec_reset (struct snd_ac97 * ac97)
 
 		/* test if we can write to the record gain volume register */
 		snd_ac97_write(ac97, AC97_REC_GAIN, 0x8a05);
-		if ((err = snd_ac97_read(ac97, AC97_REC_GAIN)) == 0x8a05)
+		err = snd_ac97_read(ac97, AC97_REC_GAIN);
+		if (err == 0x8a05)
 			return;
 
 		msleep(10);
@@ -2476,7 +2484,8 @@ int snd_cs46xx_mixer(struct snd_cs46xx *chip, int spdif_device)
 	/* detect primary codec */
 	chip->nr_ac97_codecs = 0;
 	dev_dbg(chip->card->dev, "detecting primary codec\n");
-	if ((err = snd_ac97_bus(card, 0, &ops, chip, &chip->ac97_bus)) < 0)
+	err = snd_ac97_bus(card, 0, &ops, chip, &chip->ac97_bus);
+	if (err < 0)
 		return err;
 	chip->ac97_bus->private_free = snd_cs46xx_mixer_free_ac97_bus;
 
@@ -2497,7 +2506,8 @@ int snd_cs46xx_mixer(struct snd_cs46xx *chip, int spdif_device)
 		kctl = snd_ctl_new1(&snd_cs46xx_controls[idx], chip);
 		if (kctl && kctl->id.iface == SNDRV_CTL_ELEM_IFACE_PCM)
 			kctl->id.device = spdif_device;
-		if ((err = snd_ctl_add(card, kctl)) < 0)
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 	}
 
@@ -2684,7 +2694,8 @@ int snd_cs46xx_midi(struct snd_cs46xx *chip, int device)
 	struct snd_rawmidi *rmidi;
 	int err;
 
-	if ((err = snd_rawmidi_new(chip->card, "CS46XX", device, 1, 1, &rmidi)) < 0)
+	err = snd_rawmidi_new(chip->card, "CS46XX", device, 1, 1, &rmidi);
+	if (err < 0)
 		return err;
 	strcpy(rmidi->name, "CS46XX");
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_cs46xx_midi_output);
@@ -3526,7 +3537,8 @@ static void hercules_mixer_init (struct snd_cs46xx *chip)
 		struct snd_kcontrol *kctl;
 
 		kctl = snd_ctl_new1(&snd_hercules_controls[idx], chip);
-		if ((err = snd_ctl_add(card, kctl)) < 0) {
+		err = snd_ctl_add(card, kctl);
+		if (err < 0) {
 			dev_err(card->dev,
 				"failed to initialize Hercules mixer (%d)\n",
 				err);
@@ -3871,7 +3883,8 @@ int snd_cs46xx_create(struct snd_card *card,
 	*rchip = NULL;
 
 	/* enable PCI device */
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
@@ -3965,8 +3978,9 @@ int snd_cs46xx_create(struct snd_card *card,
 
 	for (idx = 0; idx < 5; idx++) {
 		region = &chip->region.idx[idx];
-		if ((region->resource = request_mem_region(region->base, region->size,
-							   region->name)) == NULL) {
+		region->resource = request_mem_region(region->base, region->size,
+						      region->name);
+		if (!region->resource) {
 			dev_err(chip->card->dev,
 				"unable to request memory region 0x%lx-0x%lx\n",
 				   region->base, region->base + region->size - 1);
@@ -4005,7 +4019,8 @@ int snd_cs46xx_create(struct snd_card *card,
 		return err;
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_cs46xx_free(chip);
 		return err;
 	}
diff --git a/sound/pci/cs46xx/dsp_spos.c b/sound/pci/cs46xx/dsp_spos.c
index 05f3f6dc918d..1db6bc58d6a6 100644
--- a/sound/pci/cs46xx/dsp_spos.c
+++ b/sound/pci/cs46xx/dsp_spos.c
@@ -617,7 +617,8 @@ static void cs46xx_dsp_proc_parameter_dump_read (struct snd_info_entry *entry,
 			col = 0;
 		}
 
-		if ( (symbol = cs46xx_dsp_lookup_symbol_addr (chip,i / sizeof(u32), SYMBOL_PARAMETER)) != NULL) {
+		symbol = cs46xx_dsp_lookup_symbol_addr(chip, i / sizeof(u32), SYMBOL_PARAMETER);
+		if (symbol) {
 			col = 0;
 			snd_iprintf (buffer,"\n%s:\n",symbol->symbol_name);
 		}
-- 
2.26.2

