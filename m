Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF939F8DF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7F017C9;
	Tue,  8 Jun 2021 16:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7F017C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162029;
	bh=xwamtDgWHLjuKg4uDh02KwOXnfzNc85P8p0/TBRDTjQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wh4AC/hmnfN41r/IvLUYoarYVDchxrYSGemsTXslFgBWiYOo3YDMbnejbQkxvZdUz
	 YTj0vY07C7igz4/3ZLSnteMIVEXkU40JDCaHZCt+H/E5hJ6rTMxpE0NaRPKN9mInxO
	 0oHWEEeit+R8rLL+9C6O0fbA+mlVrcsFCJ5fj/kA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB2A8F80616;
	Tue,  8 Jun 2021 16:07:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D81FF805FC; Tue,  8 Jun 2021 16:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81597F804E7
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81597F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="S1d/GZQy"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="P/GOD8FF"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4A0841FDF0
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZzBjsrMIs0UWLQXOkBF65WxJiDHr8snrQszh9BFULc=;
 b=S1d/GZQy1zJJmTrorJWyb/DioIlSMjDu5Jj72thOY5QWWjLiYvrJ7tnClmMamR1n3VwTP7
 eY6Sv0O2zkeXCtifCpOZqYZs/jW9P9VBHwFmZMhxTIjFT383dATOQGwA1HUR005k55VJh1
 9IuOts2lPQgHDUC+mNl2AYsqE8/OqTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZzBjsrMIs0UWLQXOkBF65WxJiDHr8snrQszh9BFULc=;
 b=P/GOD8FFf7L7EjZsksweVY3xBXTRTqypt5HZ0r3YKQQVVwlwc1Ll6uIxV++5utC7zBR6GB
 8VqlB+c7D9VHlBDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 39BD7A3B84;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 50/66] ALSA: trident: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:24 +0200
Message-Id: <20210608140540.17885-51-tiwai@suse.de>
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

PCI Trident driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/trident/trident.c      | 41 +++++++++-------
 sound/pci/trident/trident_main.c | 84 ++++++++++++++++++++++----------
 2 files changed, 81 insertions(+), 44 deletions(-)

diff --git a/sound/pci/trident/trident.c b/sound/pci/trident/trident.c
index a51041205f7c..60e4dca28c2b 100644
--- a/sound/pci/trident/trident.c
+++ b/sound/pci/trident/trident.c
@@ -67,11 +67,12 @@ static int snd_trident_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	if ((err = snd_trident_create(card, pci,
-				      pcm_channels[dev],
-				      ((pci->vendor << 16) | pci->device) == TRIDENT_DEVICE_ID_SI7018 ? 1 : 2,
-				      wavetable_size[dev],
-				      &trident)) < 0) {
+	err = snd_trident_create(card, pci,
+				 pcm_channels[dev],
+				 ((pci->vendor << 16) | pci->device) == TRIDENT_DEVICE_ID_SI7018 ? 1 : 2,
+				 wavetable_size[dev],
+				 &trident);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -100,38 +101,44 @@ static int snd_trident_probe(struct pci_dev *pci,
 	sprintf(card->longname, "%s PCI Audio at 0x%lx, irq %d",
 		card->shortname, trident->port, trident->irq);
 
-	if ((err = snd_trident_pcm(trident, pcm_dev++)) < 0) {
+	err = snd_trident_pcm(trident, pcm_dev++);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	switch (trident->device) {
 	case TRIDENT_DEVICE_ID_DX:
 	case TRIDENT_DEVICE_ID_NX:
-		if ((err = snd_trident_foldback_pcm(trident, pcm_dev++)) < 0) {
+		err = snd_trident_foldback_pcm(trident, pcm_dev++);
+		if (err < 0) {
 			snd_card_free(card);
 			return err;
 		}
 		break;
 	}
 	if (trident->device == TRIDENT_DEVICE_ID_NX || trident->device == TRIDENT_DEVICE_ID_SI7018) {
-		if ((err = snd_trident_spdif_pcm(trident, pcm_dev++)) < 0) {
+		err = snd_trident_spdif_pcm(trident, pcm_dev++);
+		if (err < 0) {
 			snd_card_free(card);
 			return err;
 		}
 	}
-	if (trident->device != TRIDENT_DEVICE_ID_SI7018 &&
-	    (err = snd_mpu401_uart_new(card, 0, MPU401_HW_TRID4DWAVE,
-				       trident->midi_port,
-				       MPU401_INFO_INTEGRATED |
-				       MPU401_INFO_IRQ_HOOK,
-				       -1, &trident->rmidi)) < 0) {
-		snd_card_free(card);
-		return err;
+	if (trident->device != TRIDENT_DEVICE_ID_SI7018) {
+		err = snd_mpu401_uart_new(card, 0, MPU401_HW_TRID4DWAVE,
+					  trident->midi_port,
+					  MPU401_INFO_INTEGRATED |
+					  MPU401_INFO_IRQ_HOOK,
+					  -1, &trident->rmidi);
+		if (err < 0) {
+			snd_card_free(card);
+			return err;
+		}
 	}
 
 	snd_trident_create_gameport(trident);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 20145143f6a6..281ea7143b1c 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -2119,7 +2119,8 @@ int snd_trident_pcm(struct snd_trident *trident, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(trident->card, "trident_dx_nx", device, trident->ChanPCM, 1, &pcm)) < 0)
+	err = snd_pcm_new(trident->card, "trident_dx_nx", device, trident->ChanPCM, 1, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = trident;
@@ -2178,7 +2179,8 @@ int snd_trident_foldback_pcm(struct snd_trident *trident, int device)
 
 	if (trident->device == TRIDENT_DEVICE_ID_NX)
 		num_chan = 4;
-	if ((err = snd_pcm_new(trident->card, "trident_dx_nx", device, 0, num_chan, &foldback)) < 0)
+	err = snd_pcm_new(trident->card, "trident_dx_nx", device, 0, num_chan, &foldback);
+	if (err < 0)
 		return err;
 
 	foldback->private_data = trident;
@@ -2228,7 +2230,8 @@ int snd_trident_spdif_pcm(struct snd_trident *trident, int device)
 	struct snd_pcm *spdif;
 	int err;
 
-	if ((err = snd_pcm_new(trident->card, "trident_dx_nx IEC958", device, 1, 0, &spdif)) < 0)
+	err = snd_pcm_new(trident->card, "trident_dx_nx IEC958", device, 1, 0, &spdif);
+	if (err < 0)
 		return err;
 
 	spdif->private_data = trident;
@@ -2921,7 +2924,8 @@ static int snd_trident_mixer(struct snd_trident *trident, int pcm_spdif_device)
 	if (!uctl)
 		return -ENOMEM;
 
-	if ((err = snd_ac97_bus(trident->card, 0, &ops, NULL, &trident->ac97_bus)) < 0)
+	err = snd_ac97_bus(trident->card, 0, &ops, NULL, &trident->ac97_bus);
+	if (err < 0)
 		goto __out;
 
 	memset(&_ac97, 0, sizeof(_ac97));
@@ -2929,9 +2933,11 @@ static int snd_trident_mixer(struct snd_trident *trident, int pcm_spdif_device)
 	trident->ac97_detect = 1;
 
       __again:
-	if ((err = snd_ac97_mixer(trident->ac97_bus, &_ac97, &trident->ac97)) < 0) {
+	err = snd_ac97_mixer(trident->ac97_bus, &_ac97, &trident->ac97);
+	if (err < 0) {
 		if (trident->device == TRIDENT_DEVICE_ID_SI7018) {
-			if ((err = snd_trident_sis_reset(trident)) < 0)
+			err = snd_trident_sis_reset(trident);
+			if (err < 0)
 				goto __out;
 			if (retries-- > 0)
 				goto __again;
@@ -2962,10 +2968,14 @@ static int snd_trident_mixer(struct snd_trident *trident, int pcm_spdif_device)
 	trident->ac97_detect = 0;
 
 	if (trident->device != TRIDENT_DEVICE_ID_SI7018) {
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_trident_vol_wave_control, trident))) < 0)
+		kctl = snd_ctl_new1(&snd_trident_vol_wave_control, trident);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			goto __out;
 		kctl->put(kctl, uctl);
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_trident_vol_music_control, trident))) < 0)
+		kctl = snd_ctl_new1(&snd_trident_vol_music_control, trident);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			goto __out;
 		kctl->put(kctl, uctl);
 		outl(trident->musicvol_wavevol = 0x00000000, TRID_REG(trident, T4D_MUSICVOL_WAVEVOL));
@@ -2979,28 +2989,38 @@ static int snd_trident_mixer(struct snd_trident *trident, int pcm_spdif_device)
 		tmix = &trident->pcm_mixer[idx];
 		tmix->voice = NULL;
 	}
-	if ((trident->ctl_vol = snd_ctl_new1(&snd_trident_pcm_vol_control, trident)) == NULL)
+	trident->ctl_vol = snd_ctl_new1(&snd_trident_pcm_vol_control, trident);
+	if (!trident->ctl_vol)
 		goto __nomem;
-	if ((err = snd_ctl_add(card, trident->ctl_vol)))
+	err = snd_ctl_add(card, trident->ctl_vol);
+	if (err)
 		goto __out;
 		
-	if ((trident->ctl_pan = snd_ctl_new1(&snd_trident_pcm_pan_control, trident)) == NULL)
+	trident->ctl_pan = snd_ctl_new1(&snd_trident_pcm_pan_control, trident);
+	if (!trident->ctl_pan)
 		goto __nomem;
-	if ((err = snd_ctl_add(card, trident->ctl_pan)))
+	err = snd_ctl_add(card, trident->ctl_pan);
+	if (err)
 		goto __out;
 
-	if ((trident->ctl_rvol = snd_ctl_new1(&snd_trident_pcm_rvol_control, trident)) == NULL)
+	trident->ctl_rvol = snd_ctl_new1(&snd_trident_pcm_rvol_control, trident);
+	if (!trident->ctl_rvol)
 		goto __nomem;
-	if ((err = snd_ctl_add(card, trident->ctl_rvol)))
+	err = snd_ctl_add(card, trident->ctl_rvol);
+	if (err)
 		goto __out;
 
-	if ((trident->ctl_cvol = snd_ctl_new1(&snd_trident_pcm_cvol_control, trident)) == NULL)
+	trident->ctl_cvol = snd_ctl_new1(&snd_trident_pcm_cvol_control, trident);
+	if (!trident->ctl_cvol)
 		goto __nomem;
-	if ((err = snd_ctl_add(card, trident->ctl_cvol)))
+	err = snd_ctl_add(card, trident->ctl_cvol);
+	if (err)
 		goto __out;
 
 	if (trident->device == TRIDENT_DEVICE_ID_NX) {
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_trident_ac97_rear_control, trident))) < 0)
+		kctl = snd_ctl_new1(&snd_trident_ac97_rear_control, trident);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			goto __out;
 		kctl->put(kctl, uctl);
 	}
@@ -3016,7 +3036,8 @@ static int snd_trident_mixer(struct snd_trident *trident, int pcm_spdif_device)
 		if (trident->ac97_sec && (trident->ac97_sec->ext_id & AC97_EI_SPDIF))
 			kctl->id.index++;
 		idx = kctl->id.index;
-		if ((err = snd_ctl_add(card, kctl)) < 0)
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			goto __out;
 		kctl->put(kctl, uctl);
 
@@ -3027,7 +3048,8 @@ static int snd_trident_mixer(struct snd_trident *trident, int pcm_spdif_device)
 		}
 		kctl->id.index = idx;
 		kctl->id.device = pcm_spdif_device;
-		if ((err = snd_ctl_add(card, kctl)) < 0)
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			goto __out;
 
 		kctl = snd_ctl_new1(&snd_trident_spdif_mask, trident);
@@ -3037,7 +3059,8 @@ static int snd_trident_mixer(struct snd_trident *trident, int pcm_spdif_device)
 		}
 		kctl->id.index = idx;
 		kctl->id.device = pcm_spdif_device;
-		if ((err = snd_ctl_add(card, kctl)) < 0)
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			goto __out;
 
 		kctl = snd_ctl_new1(&snd_trident_spdif_stream, trident);
@@ -3047,7 +3070,8 @@ static int snd_trident_mixer(struct snd_trident *trident, int pcm_spdif_device)
 		}
 		kctl->id.index = idx;
 		kctl->id.device = pcm_spdif_device;
-		if ((err = snd_ctl_add(card, kctl)) < 0)
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			goto __out;
 		trident->spdif_pcm_ctl = kctl;
 	}
@@ -3449,7 +3473,8 @@ static int snd_trident_sis_init(struct snd_trident *trident)
 {
 	int err;
 
-	if ((err = snd_trident_sis_reset(trident)) < 0)
+	err = snd_trident_sis_reset(trident);
+	if (err < 0)
 		return err;
 
 	snd_trident_stop_all_voices(trident);
@@ -3494,7 +3519,8 @@ int snd_trident_create(struct snd_card *card,
 	*rtrident = NULL;
 
 	/* enable PCI device */
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 30 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(30))) {
@@ -3528,7 +3554,8 @@ int snd_trident_create(struct snd_card *card,
 	trident->midi_port = TRID_REG(trident, T4D_MPU401_BASE);
 	pci_set_master(pci);
 
-	if ((err = pci_request_regions(pci, "Trident Audio")) < 0) {
+	err = pci_request_regions(pci, "Trident Audio");
+	if (err < 0) {
 		kfree(trident);
 		pci_disable_device(pci);
 		return err;
@@ -3548,7 +3575,8 @@ int snd_trident_create(struct snd_card *card,
 	trident->tlb.entries = NULL;
 	trident->tlb.buffer.area = NULL;
 	if (trident->device == TRIDENT_DEVICE_ID_NX) {
-		if ((err = snd_trident_tlb_alloc(trident)) < 0) {
+		err = snd_trident_tlb_alloc(trident);
+		if (err < 0) {
 			snd_trident_free(trident);
 			return err;
 		}
@@ -3576,12 +3604,14 @@ int snd_trident_create(struct snd_card *card,
 		return err;
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, trident, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, trident, &ops);
+	if (err < 0) {
 		snd_trident_free(trident);
 		return err;
 	}
 
-	if ((err = snd_trident_mixer(trident, pcm_spdif_device)) < 0)
+	err = snd_trident_mixer(trident, pcm_spdif_device);
+	if (err < 0)
 		return err;
 	
 	/* initialise synth voices */
-- 
2.26.2

