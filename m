Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E439F872
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:07:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E2641707;
	Tue,  8 Jun 2021 16:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E2641707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161259;
	bh=WRnu6g38dCY+7Ih3WEO5Xi6lECbUzr+L3YoJuTVhn8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lITyLuJbaBDyQiUl9y3KWC5b5g0BXoiTkQDZspnWxiD9Cycx0Xvp+7HJ0FmG37GjT
	 fDLxK/Wd3h/0Vw/3QNWLHBLBUOC3l3vK6xWficYWeeuN2kHQtzBoBMf6GQkfJ8wBrD
	 wVkw18mh9GvbcUwX1H3LPiJ7p496v0rBNMihMkMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53788F80533;
	Tue,  8 Jun 2021 16:05:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC796F800FD; Tue,  8 Jun 2021 16:05:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 668B6F80218
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 668B6F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="zn6OXKZB"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="v9z0UnGH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8BB6F1FD46
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gxq0e3xUz5zY4k+XVIMj6L2KwO5Fi+p/Z4Efuyyx/RY=;
 b=zn6OXKZBrxojYTJedtNZF8aTlsCXBc+CI43uIdlkfEo3OJQkaxZbjqcmP0OAd/itBRlt7W
 aCyKmkz2scMJ0xyjb4QsJNB1vGclEPCEzDRVjiSbkoo3TiGJ2B1olcBPOqRJQvTj3Byc6S
 jZpRrx5mY//9bUsuSBHzXPpaQl0B/fI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gxq0e3xUz5zY4k+XVIMj6L2KwO5Fi+p/Z4Efuyyx/RY=;
 b=v9z0UnGHG3FbvqCK9MVdoyQq/mFS27jS2T7mATYZVFmkikFbmgiDOhG5BBlMQWJSMJko3T
 WTIB/6CCy4yIz3AQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 78961A3B84;
 Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/66] ALSA: sb: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:35 +0200
Message-Id: <20210608140540.17885-2-tiwai@suse.de>
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

A lot of code for SB drivers is in a legacy style with assignment in
if condition.  This also made harder to catch some bugs (e.g. the
commit 1c98f574403d "ALSA: emu8000: Fix a use after free in
snd_emu8000_create_mixer").

This patch fixes the coding style.  All are rather simple conversions
and there should be no functional changes.
(The changes in snd_emu8000_new() for hw->res_port1, 2 and 3 are
 slightly different from the older ones, but this shouldn't matter
 much in practice.)

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000.c       | 17 ++++++----
 sound/isa/sb/emu8000_patch.c |  3 +-
 sound/isa/sb/emu8000_pcm.c   |  6 ++--
 sound/isa/sb/sb16.c          | 65 +++++++++++++++++++++---------------
 sound/isa/sb/sb16_csp.c      | 14 +++++---
 sound/isa/sb/sb16_main.c     |  6 ++--
 sound/isa/sb/sb8.c           | 38 +++++++++++----------
 sound/isa/sb/sb8_main.c      |  3 +-
 sound/isa/sb/sb8_midi.c      |  3 +-
 sound/isa/sb/sb_common.c     |  9 +++--
 sound/isa/sb/sb_mixer.c      | 55 ++++++++++++++++--------------
 11 files changed, 130 insertions(+), 89 deletions(-)

diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index 1c90421a88dc..896a862a9f9c 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -1029,7 +1029,9 @@ snd_emu8000_create_mixer(struct snd_card *card, struct snd_emu8000 *emu)
 
 	memset(emu->controls, 0, sizeof(emu->controls));
 	for (i = 0; i < EMU8000_NUM_CONTROLS; i++) {
-		if ((err = snd_ctl_add(card, emu->controls[i] = snd_ctl_new1(mixer_defs[i], emu))) < 0) {
+		emu->controls[i] = snd_ctl_new1(mixer_defs[i], emu);
+		err = snd_ctl_add(card, emu->controls[i]);
+		if (err < 0) {
 			emu->controls[i] = NULL;
 			goto __error;
 		}
@@ -1095,9 +1097,10 @@ snd_emu8000_new(struct snd_card *card, int index, long port, int seq_ports,
 	hw->port1 = port;
 	hw->port2 = port + 0x400;
 	hw->port3 = port + 0x800;
-	if (!(hw->res_port1 = request_region(hw->port1, 4, "Emu8000-1")) ||
-	    !(hw->res_port2 = request_region(hw->port2, 4, "Emu8000-2")) ||
-	    !(hw->res_port3 = request_region(hw->port3, 4, "Emu8000-3"))) {
+	hw->res_port1 = request_region(hw->port1, 4, "Emu8000-1");
+	hw->res_port2 = request_region(hw->port2, 4, "Emu8000-2");
+	hw->res_port3 = request_region(hw->port3, 4, "Emu8000-3");
+	if (!hw->res_port1 || !hw->res_port2 || !hw->res_port3) {
 		snd_printk(KERN_ERR "sbawe: can't grab ports 0x%lx, 0x%lx, 0x%lx\n", hw->port1, hw->port2, hw->port3);
 		snd_emu8000_free(hw);
 		return -EBUSY;
@@ -1118,12 +1121,14 @@ snd_emu8000_new(struct snd_card *card, int index, long port, int seq_ports,
 	}
 
 	snd_emu8000_init_hw(hw);
-	if ((err = snd_emu8000_create_mixer(card, hw)) < 0) {
+	err = snd_emu8000_create_mixer(card, hw);
+	if (err < 0) {
 		snd_emu8000_free(hw);
 		return err;
 	}
 	
-	if ((err = snd_device_new(card, SNDRV_DEV_CODEC, hw, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_CODEC, hw, &ops);
+	if (err < 0) {
 		snd_emu8000_free(hw);
 		return err;
 	}
diff --git a/sound/isa/sb/emu8000_patch.c b/sound/isa/sb/emu8000_patch.c
index 0cb94cafb4c9..8c1e7f2bfc34 100644
--- a/sound/isa/sb/emu8000_patch.c
+++ b/sound/isa/sb/emu8000_patch.c
@@ -191,7 +191,8 @@ snd_emu8000_sample_new(struct snd_emux *rec, struct snd_sf_sample *sp,
 	sp->v.truesize = truesize * 2; /* in bytes */
 
 	snd_emux_terminate_all(emu->emu);
-	if ((rc = snd_emu8000_open_dma(emu, EMU8000_RAM_WRITE)) != 0)
+	rc = snd_emu8000_open_dma(emu, EMU8000_RAM_WRITE);
+	if (rc)
 		return rc;
 
 	/* Set the address to start writing at */
diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
index 8e8257c574b0..f8d90a1e989b 100644
--- a/sound/isa/sb/emu8000_pcm.c
+++ b/sound/isa/sb/emu8000_pcm.c
@@ -626,7 +626,8 @@ static int emu8k_pcm_prepare(struct snd_pcm_substream *subs)
 		int err, i, ch;
 
 		snd_emux_terminate_all(rec->emu->emu);
-		if ((err = emu8k_open_dram_for_pcm(rec->emu, rec->voices)) != 0)
+		err = emu8k_open_dram_for_pcm(rec->emu, rec->voices);
+		if (err)
 			return err;
 		rec->dram_opened = 1;
 
@@ -682,7 +683,8 @@ int snd_emu8000_pcm_new(struct snd_card *card, struct snd_emu8000 *emu, int inde
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(card, "Emu8000 PCM", index, 1, 0, &pcm)) < 0)
+	err = snd_pcm_new(card, "Emu8000 PCM", index, 1, 0, &pcm);
+	if (err < 0)
 		return err;
 	pcm->private_data = emu;
 	pcm->private_free = snd_emu8000_pcm_free;
diff --git a/sound/isa/sb/sb16.c b/sound/isa/sb/sb16.c
index 63ef960abd25..d0f797c02841 100644
--- a/sound/isa/sb/sb16.c
+++ b/sound/isa/sb/sb16.c
@@ -332,14 +332,9 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 	xdma8 = dma8[dev];
 	xdma16 = dma16[dev];
 
-	if ((err = snd_sbdsp_create(card,
-				    port[dev],
-				    xirq,
-				    snd_sb16dsp_interrupt,
-				    xdma8,
-				    xdma16,
-				    SB_HW_AUTO,
-				    &chip)) < 0)
+	err = snd_sbdsp_create(card, port[dev], xirq, snd_sb16dsp_interrupt,
+			       xdma8, xdma16, SB_HW_AUTO, &chip);
+	if (err < 0)
 		return err;
 
 	acard->chip = chip;
@@ -348,10 +343,14 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 		return -ENODEV;
 	}
 	chip->mpu_port = mpu_port[dev];
-	if (! is_isapnp_selected(dev) && (err = snd_sb16dsp_configure(chip)) < 0)
-		return err;
+	if (!is_isapnp_selected(dev)) {
+		err = snd_sb16dsp_configure(chip);
+		if (err < 0)
+			return err;
+	}
 
-	if ((err = snd_sb16dsp_pcm(chip, 0)) < 0)
+	err = snd_sb16dsp_pcm(chip, 0);
+	if (err < 0)
 		return err;
 
 	strcpy(card->driver,
@@ -371,10 +370,11 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 			xdma8 >= 0 ? "&" : "", xdma16);
 
 	if (chip->mpu_port > 0 && chip->mpu_port != SNDRV_AUTO_PORT) {
-		if ((err = snd_mpu401_uart_new(card, 0, MPU401_HW_SB,
-					       chip->mpu_port,
-					       MPU401_INFO_IRQ_HOOK, -1,
-					       &chip->rmidi)) < 0)
+		err = snd_mpu401_uart_new(card, 0, MPU401_HW_SB,
+					  chip->mpu_port,
+					  MPU401_INFO_IRQ_HOOK, -1,
+					  &chip->rmidi);
+		if (err < 0)
 			return err;
 		chip->rmidi_callback = snd_mpu401_uart_interrupt;
 	}
@@ -397,12 +397,14 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 #else
 			int seqdev = 1;
 #endif
-			if ((err = snd_opl3_hwdep_new(opl3, 0, seqdev, &synth)) < 0)
+			err = snd_opl3_hwdep_new(opl3, 0, seqdev, &synth);
+			if (err < 0)
 				return err;
 		}
 	}
 
-	if ((err = snd_sbmixer_new(chip)) < 0)
+	err = snd_sbmixer_new(chip);
+	if (err < 0)
 		return err;
 
 #ifdef CONFIG_SND_SB16_CSP
@@ -419,8 +421,9 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 #endif
 #ifdef SNDRV_SBAWE_EMU8000
 	if (awe_port[dev] > 0) {
-		if ((err = snd_emu8000_new(card, 1, awe_port[dev],
-					   seq_ports[dev], NULL)) < 0) {
+		err = snd_emu8000_new(card, 1, awe_port[dev],
+				      seq_ports[dev], NULL);
+		if (err < 0) {
 			snd_printk(KERN_ERR PFX "fatal error - EMU-8000 synthesizer not detected at 0x%lx\n", awe_port[dev]);
 
 			return err;
@@ -435,7 +438,8 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 		(mic_agc[dev] ? 0x00 : 0x01));
 	spin_unlock_irqrestore(&chip->mixer_lock, flags);
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		return err;
 
 	return 0;
@@ -484,7 +488,8 @@ static int snd_sb16_isa_probe1(int dev, struct device *pdev)
 	awe_port[dev] = port[dev] + 0x400;
 #endif
 
-	if ((err = snd_sb16_probe(card, dev)) < 0) {
+	err = snd_sb16_probe(card, dev);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -506,19 +511,22 @@ static int snd_sb16_isa_probe(struct device *pdev, unsigned int dev)
 	static const int possible_dmas16[] = {5, 6, 7, -1};
 
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
-		if ((irq[dev] = snd_legacy_find_free_irq(possible_irqs)) < 0) {
+		irq[dev] = snd_legacy_find_free_irq(possible_irqs);
+		if (irq[dev] < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma8[dev] == SNDRV_AUTO_DMA) {
-		if ((dma8[dev] = snd_legacy_find_free_dma(possible_dmas8)) < 0) {
+		dma8[dev] = snd_legacy_find_free_dma(possible_dmas8);
+		if (dma8[dev] < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free 8-bit DMA\n");
 			return -EBUSY;
 		}
 	}
 	if (dma16[dev] == SNDRV_AUTO_DMA) {
-		if ((dma16[dev] = snd_legacy_find_free_dma(possible_dmas16)) < 0) {
+		dma16[dev] = snd_legacy_find_free_dma(possible_dmas16);
+		if (dma16[dev] < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free 16-bit DMA\n");
 			return -EBUSY;
 		}
@@ -591,8 +599,13 @@ static int snd_sb16_pnp_detect(struct pnp_card_link *pcard,
 		res = snd_sb16_card_new(&pcard->card->dev, dev, &card);
 		if (res < 0)
 			return res;
-		if ((res = snd_card_sb16_pnp(dev, card->private_data, pcard, pid)) < 0 ||
-		    (res = snd_sb16_probe(card, dev)) < 0) {
+		res = snd_card_sb16_pnp(dev, card->private_data, pcard, pid);
+		if (res < 0) {
+			snd_card_free(card);
+			return res;
+		}
+		res = snd_sb16_probe(card, dev);
+		if (res < 0) {
 			snd_card_free(card);
 			return res;
 		}
diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index 4789345a8fdd..d6ce6b16421c 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -112,10 +112,12 @@ int snd_sb_csp_new(struct snd_sb *chip, int device, struct snd_hwdep ** rhwdep)
 	if (csp_detect(chip, &version))
 		return -ENODEV;
 
-	if ((err = snd_hwdep_new(chip->card, "SB16-CSP", device, &hw)) < 0)
+	err = snd_hwdep_new(chip->card, "SB16-CSP", device, &hw);
+	if (err < 0)
 		return err;
 
-	if ((p = kzalloc(sizeof(*p), GFP_KERNEL)) == NULL) {
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p) {
 		snd_device_free(chip->card, hw);
 		return -ENOMEM;
 	}
@@ -1045,11 +1047,15 @@ static int snd_sb_qsound_build(struct snd_sb_csp * p)
 
 	spin_lock_init(&p->q_lock);
 
-	if ((err = snd_ctl_add(card, p->qsound_switch = snd_ctl_new1(&snd_sb_qsound_switch, p))) < 0) {
+	p->qsound_switch = snd_ctl_new1(&snd_sb_qsound_switch, p);
+	err = snd_ctl_add(card, p->qsound_switch);
+	if (err < 0) {
 		p->qsound_switch = NULL;
 		goto __error;
 	}
-	if ((err = snd_ctl_add(card, p->qsound_space = snd_ctl_new1(&snd_sb_qsound_space, p))) < 0) {
+	p->qsound_space = snd_ctl_new1(&snd_sb_qsound_space, p);
+	err = snd_ctl_add(card, p->qsound_space);
+	if (err < 0) {
 		p->qsound_space = NULL;
 		goto __error;
 	}
diff --git a/sound/isa/sb/sb16_main.c b/sound/isa/sb/sb16_main.c
index 38dc1fde25f3..8945ee194ab6 100644
--- a/sound/isa/sb/sb16_main.c
+++ b/sound/isa/sb/sb16_main.c
@@ -703,7 +703,8 @@ static int snd_sb16_dma_control_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	unsigned char nval, oval;
 	int change;
 	
-	if ((nval = ucontrol->value.enumerated.item[0]) > 2)
+	nval = ucontrol->value.enumerated.item[0];
+	if (nval > 2)
 		return -EINVAL;
 	spin_lock_irqsave(&chip->reg_lock, flags);
 	oval = snd_sb16_get_dma_mode(chip);
@@ -836,7 +837,8 @@ int snd_sb16dsp_pcm(struct snd_sb *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(card, "SB16 DSP", device, 1, 1, &pcm)) < 0)
+	err = snd_pcm_new(card, "SB16 DSP", device, 1, 1, &pcm);
+	if (err < 0)
 		return err;
 	sprintf(pcm->name, "DSP v%i.%i", chip->version >> 8, chip->version & 0xff);
 	pcm->info_flags = SNDRV_PCM_INFO_JOINT_DUPLEX;
diff --git a/sound/isa/sb/sb8.c b/sound/isa/sb/sb8.c
index 6c9d534ce8b6..de68ac5df35b 100644
--- a/sound/isa/sb/sb8.c
+++ b/sound/isa/sb/sb8.c
@@ -101,12 +101,10 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 	}
 
 	if (port[dev] != SNDRV_AUTO_PORT) {
-		if ((err = snd_sbdsp_create(card, port[dev], irq[dev],
-					    snd_sb8_interrupt,
-					    dma8[dev],
-					    -1,
-					    SB_HW_AUTO,
-					    &chip)) < 0)
+		err = snd_sbdsp_create(card, port[dev], irq[dev],
+				       snd_sb8_interrupt, dma8[dev],
+				       -1, SB_HW_AUTO, &chip);
+		if (err < 0)
 			goto _err;
 	} else {
 		/* auto-probe legacy ports */
@@ -145,32 +143,35 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 		goto _err;
 	}
 
-	if ((err = snd_sb8dsp_pcm(chip, 0)) < 0)
+	err = snd_sb8dsp_pcm(chip, 0);
+	if (err < 0)
 		goto _err;
 
-	if ((err = snd_sbmixer_new(chip)) < 0)
+	err = snd_sbmixer_new(chip);
+	if (err < 0)
 		goto _err;
 
 	if (chip->hardware == SB_HW_10 || chip->hardware == SB_HW_20) {
-		if ((err = snd_opl3_create(card, chip->port + 8, 0,
-					   OPL3_HW_AUTO, 1,
-					   &opl3)) < 0) {
+		err = snd_opl3_create(card, chip->port + 8, 0,
+				      OPL3_HW_AUTO, 1, &opl3);
+		if (err < 0)
 			snd_printk(KERN_WARNING "sb8: no OPL device at 0x%lx\n", chip->port + 8);
-		}
 	} else {
-		if ((err = snd_opl3_create(card, chip->port, chip->port + 2,
-					   OPL3_HW_AUTO, 1,
-					   &opl3)) < 0) {
+		err = snd_opl3_create(card, chip->port, chip->port + 2,
+				      OPL3_HW_AUTO, 1, &opl3);
+		if (err < 0) {
 			snd_printk(KERN_WARNING "sb8: no OPL device at 0x%lx-0x%lx\n",
 				   chip->port, chip->port + 2);
 		}
 	}
 	if (err >= 0) {
-		if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0)
+		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+		if (err < 0)
 			goto _err;
 	}
 
-	if ((err = snd_sb8dsp_midi(chip, 0)) < 0)
+	err = snd_sb8dsp_midi(chip, 0);
+	if (err < 0)
 		goto _err;
 
 	strcpy(card->driver, chip->hardware == SB_HW_PRO ? "SB Pro" : "SB8");
@@ -180,7 +181,8 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 		chip->port,
 		irq[dev], dma8[dev]);
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		goto _err;
 
 	dev_set_drvdata(pdev, card);
diff --git a/sound/isa/sb/sb8_main.c b/sound/isa/sb/sb8_main.c
index 8d01692c4f2a..2ed176a5a574 100644
--- a/sound/isa/sb/sb8_main.c
+++ b/sound/isa/sb/sb8_main.c
@@ -567,7 +567,8 @@ int snd_sb8dsp_pcm(struct snd_sb *chip, int device)
 	int err;
 	size_t max_prealloc = 64 * 1024;
 
-	if ((err = snd_pcm_new(card, "SB8 DSP", device, 1, 1, &pcm)) < 0)
+	err = snd_pcm_new(card, "SB8 DSP", device, 1, 1, &pcm);
+	if (err < 0)
 		return err;
 	sprintf(pcm->name, "DSP v%i.%i", chip->version >> 8, chip->version & 0xff);
 	pcm->info_flags = SNDRV_PCM_INFO_HALF_DUPLEX;
diff --git a/sound/isa/sb/sb8_midi.c b/sound/isa/sb/sb8_midi.c
index 8c01460539ed..618366d5d984 100644
--- a/sound/isa/sb/sb8_midi.c
+++ b/sound/isa/sb/sb8_midi.c
@@ -251,7 +251,8 @@ int snd_sb8dsp_midi(struct snd_sb *chip, int device)
 	struct snd_rawmidi *rmidi;
 	int err;
 
-	if ((err = snd_rawmidi_new(chip->card, "SB8 MIDI", device, 1, 1, &rmidi)) < 0)
+	err = snd_rawmidi_new(chip->card, "SB8 MIDI", device, 1, 1, &rmidi);
+	if (err < 0)
 		return err;
 	strcpy(rmidi->name, "SB8 MIDI");
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_sb8dsp_midi_output);
diff --git a/sound/isa/sb/sb_common.c b/sound/isa/sb/sb_common.c
index 61ea4078aa95..57121218ed24 100644
--- a/sound/isa/sb/sb_common.c
+++ b/sound/isa/sb/sb_common.c
@@ -238,7 +238,8 @@ int snd_sbdsp_create(struct snd_card *card,
 	if (hardware == SB_HW_ALS4000)
 		goto __skip_allocation;
 	
-	if ((chip->res_port = request_region(port, 16, "SoundBlaster")) == NULL) {
+	chip->res_port = request_region(port, 16, "SoundBlaster");
+	if (!chip->res_port) {
 		snd_printk(KERN_ERR "sb: can't grab port 0x%lx\n", port);
 		snd_sbdsp_free(chip);
 		return -EBUSY;
@@ -267,11 +268,13 @@ int snd_sbdsp_create(struct snd_card *card,
       __skip_allocation:
 	chip->card = card;
 	chip->hardware = hardware;
-	if ((err = snd_sbdsp_probe(chip)) < 0) {
+	err = snd_sbdsp_probe(chip);
+	if (err < 0) {
 		snd_sbdsp_free(chip);
 		return err;
 	}
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_sbdsp_free(chip);
 		return err;
 	}
diff --git a/sound/isa/sb/sb_mixer.c b/sound/isa/sb/sb_mixer.c
index 5de5506e7e60..fffd681e5bf7 100644
--- a/sound/isa/sb/sb_mixer.c
+++ b/sound/isa/sb/sb_mixer.c
@@ -485,7 +485,8 @@ int snd_sbmixer_add_ctl(struct snd_sb *chip, const char *name, int index, int ty
 	strscpy(ctl->id.name, name, sizeof(ctl->id.name));
 	ctl->id.index = index;
 	ctl->private_value = value;
-	if ((err = snd_ctl_add(chip->card, ctl)) < 0)
+	err = snd_ctl_add(chip->card, ctl);
+	if (err < 0)
 		return err;
 	return 0;
 }
@@ -736,33 +737,36 @@ int snd_sbmixer_new(struct snd_sb *chip)
 		return 0; /* no mixer chip on SB1.x */
 	case SB_HW_20:
 	case SB_HW_201:
-		if ((err = snd_sbmixer_init(chip,
-					    snd_sb20_controls,
-					    ARRAY_SIZE(snd_sb20_controls),
-					    snd_sb20_init_values,
-					    ARRAY_SIZE(snd_sb20_init_values),
-					    "CTL1335")) < 0)
+		err = snd_sbmixer_init(chip,
+				       snd_sb20_controls,
+				       ARRAY_SIZE(snd_sb20_controls),
+				       snd_sb20_init_values,
+				       ARRAY_SIZE(snd_sb20_init_values),
+				       "CTL1335");
+		if (err < 0)
 			return err;
 		break;
 	case SB_HW_PRO:
 	case SB_HW_JAZZ16:
-		if ((err = snd_sbmixer_init(chip,
-					    snd_sbpro_controls,
-					    ARRAY_SIZE(snd_sbpro_controls),
-					    snd_sbpro_init_values,
-					    ARRAY_SIZE(snd_sbpro_init_values),
-					    "CTL1345")) < 0)
+		err = snd_sbmixer_init(chip,
+				       snd_sbpro_controls,
+				       ARRAY_SIZE(snd_sbpro_controls),
+				       snd_sbpro_init_values,
+				       ARRAY_SIZE(snd_sbpro_init_values),
+				       "CTL1345");
+		if (err < 0)
 			return err;
 		break;
 	case SB_HW_16:
 	case SB_HW_ALS100:
 	case SB_HW_CS5530:
-		if ((err = snd_sbmixer_init(chip,
-					    snd_sb16_controls,
-					    ARRAY_SIZE(snd_sb16_controls),
-					    snd_sb16_init_values,
-					    ARRAY_SIZE(snd_sb16_init_values),
-					    "CTL1745")) < 0)
+		err = snd_sbmixer_init(chip,
+				       snd_sb16_controls,
+				       ARRAY_SIZE(snd_sb16_controls),
+				       snd_sb16_init_values,
+				       ARRAY_SIZE(snd_sb16_init_values),
+				       "CTL1745");
+		if (err < 0)
 			return err;
 		break;
 	case SB_HW_ALS4000:
@@ -775,12 +779,13 @@ int snd_sbmixer_new(struct snd_sb *chip)
 					"ALS4000");
 		if (err < 0)
 			return err;
-		if ((err = snd_sbmixer_init(chip,
-					    snd_als4000_controls,
-					    ARRAY_SIZE(snd_als4000_controls),
-					    snd_als4000_init_values,
-					    ARRAY_SIZE(snd_als4000_init_values),
-					    "ALS4000")) < 0)
+		err = snd_sbmixer_init(chip,
+				       snd_als4000_controls,
+				       ARRAY_SIZE(snd_als4000_controls),
+				       snd_als4000_init_values,
+				       ARRAY_SIZE(snd_als4000_init_values),
+				       "ALS4000");
+		if (err < 0)
 			return err;
 		break;
 	case SB_HW_DT019X:
-- 
2.26.2

