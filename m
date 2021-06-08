Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA0C39F8D0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:18:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B327B17A4;
	Tue,  8 Jun 2021 16:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B327B17A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161910;
	bh=reNNxptDXDlVW8mU4pNdY0zevzM8YS38sAP2rEQmLZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mEwtqjEdLDGSzdiYf4xI8VezHgnMw7JSF/vpHpuaKTBKQbCUfV2RiDPCwTV6YYwQm
	 nayBqzkHmN/nsiOfdRcM5Y0qEz4xg8WCOldQiyk6Hz3R9YdSi62ZzhHP6dTW1AC3FT
	 bq7HZUjH7b0kcwdn4nnZq674kvCGZAsJS5BJDZII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C06BF80601;
	Tue,  8 Jun 2021 16:06:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC857F805E4; Tue,  8 Jun 2021 16:06:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F075F804E3
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F075F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="buXFu3H3"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="99ru0a/T"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B33821FDEC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNDT0tcbUPSR1W36/Pg8mtVEfsPRem1XIqnhj/LvOIk=;
 b=buXFu3H3FuBWJzU2ndSKbdVAmDEBkWWMcjiinc4EKZUdkh6TrttSvBMbKkillqTuMb43nn
 BDslyaFB4tqnO8w0lrwn1MdeQaKeC3mx4SYPpl9kv0c1F9W6red7dDCWTIKT+VjlDq5Wrt
 /BkPNBEFeSBn/hql8GOrIZL6I8mGCSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNDT0tcbUPSR1W36/Pg8mtVEfsPRem1XIqnhj/LvOIk=;
 b=99ru0a/TcRp7f+YPF5rIlC4fFekf9hzaQBaZZiiv/TaRy9IMscJdN/Ipyy0cOooZ/RQ0Nl
 tWYNqrcBmmLjocCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A1A30A3B88;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 40/66] ALSA: emu10k1: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:14 +0200
Message-Id: <20210608140540.17885-41-tiwai@suse.de>
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

PCI EMU10k1 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emu10k1.c          | 42 +++++++++------
 sound/pci/emu10k1/emu10k1_callback.c |  3 +-
 sound/pci/emu10k1/emufx.c            | 13 +++--
 sound/pci/emu10k1/emumixer.c         | 78 ++++++++++++++++++----------
 sound/pci/emu10k1/emumpu401.c        | 12 +++--
 sound/pci/emu10k1/emupcm.c           | 24 ++++++---
 sound/pci/emu10k1/memory.c           | 21 +++++---
 sound/pci/emu10k1/p16v.c             | 13 +++--
 sound/pci/emu10k1/timer.c            |  3 +-
 9 files changed, 138 insertions(+), 71 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index 45833bc2a7e7..887bfb3c1e17 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -107,18 +107,22 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 		max_buffer_size[dev] = 32;
 	else if (max_buffer_size[dev] > 1024)
 		max_buffer_size[dev] = 1024;
-	if ((err = snd_emu10k1_create(card, pci, extin[dev], extout[dev],
-				      (long)max_buffer_size[dev] * 1024 * 1024,
-				      enable_ir[dev], subsystem[dev],
-				      &emu)) < 0)
+	err = snd_emu10k1_create(card, pci, extin[dev], extout[dev],
+				 (long)max_buffer_size[dev] * 1024 * 1024,
+				 enable_ir[dev], subsystem[dev],
+				 &emu);
+	if (err < 0)
 		goto error;
 	card->private_data = emu;
 	emu->delay_pcm_irq = delay_pcm_irq[dev] & 0x1f;
-	if ((err = snd_emu10k1_pcm(emu, 0)) < 0)
+	err = snd_emu10k1_pcm(emu, 0);
+	if (err < 0)
 		goto error;
-	if ((err = snd_emu10k1_pcm_mic(emu, 1)) < 0)
+	err = snd_emu10k1_pcm_mic(emu, 1);
+	if (err < 0)
 		goto error;
-	if ((err = snd_emu10k1_pcm_efx(emu, 2)) < 0)
+	err = snd_emu10k1_pcm_efx(emu, 2);
+	if (err < 0)
 		goto error;
 	/* This stores the periods table. */
 	if (emu->card_capabilities->ca0151_chip) { /* P16V */	
@@ -128,26 +132,33 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 			goto error;
 	}
 
-	if ((err = snd_emu10k1_mixer(emu, 0, 3)) < 0)
+	err = snd_emu10k1_mixer(emu, 0, 3);
+	if (err < 0)
 		goto error;
 	
-	if ((err = snd_emu10k1_timer(emu, 0)) < 0)
+	err = snd_emu10k1_timer(emu, 0);
+	if (err < 0)
 		goto error;
 
-	if ((err = snd_emu10k1_pcm_multi(emu, 3)) < 0)
+	err = snd_emu10k1_pcm_multi(emu, 3);
+	if (err < 0)
 		goto error;
 	if (emu->card_capabilities->ca0151_chip) { /* P16V */
-		if ((err = snd_p16v_pcm(emu, 4)) < 0)
+		err = snd_p16v_pcm(emu, 4);
+		if (err < 0)
 			goto error;
 	}
 	if (emu->audigy) {
-		if ((err = snd_emu10k1_audigy_midi(emu)) < 0)
+		err = snd_emu10k1_audigy_midi(emu);
+		if (err < 0)
 			goto error;
 	} else {
-		if ((err = snd_emu10k1_midi(emu)) < 0)
+		err = snd_emu10k1_midi(emu);
+		if (err < 0)
 			goto error;
 	}
-	if ((err = snd_emu10k1_fx8010_new(emu, 0)) < 0)
+	err = snd_emu10k1_fx8010_new(emu, 0);
+	if (err < 0)
 		goto error;
 #ifdef ENABLE_SYNTH
 	if (snd_seq_device_new(card, 1, SNDRV_SEQ_DEV_ID_EMU10K1_SYNTH,
@@ -174,7 +185,8 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 		 "%s (rev.%d, serial:0x%x) at 0x%lx, irq %i",
 		 card->shortname, emu->revision, emu->serial, emu->port, emu->irq);
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		goto error;
 
 	if (emu->card_capabilities->emu_model)
diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index 07471c3dcbed..dba1e9fc2eec 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -90,7 +90,8 @@ snd_emu10k1_synth_get_voice(struct snd_emu10k1 *hw)
 		if (best[i].voice >= 0) {
 			int ch;
 			vp = &emu->voices[best[i].voice];
-			if ((ch = vp->ch) < 0) {
+			ch = vp->ch;
+			if (ch < 0) {
 				/*
 				dev_warn(emu->card->dev,
 				       "synth_get_voice: ch < 0 (%d) ??", i);
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 80ef62a4a7c0..6cf7c8b1de47 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -436,7 +436,8 @@ int snd_emu10k1_fx8010_unregister_irq_handler(struct snd_emu10k1 *emu,
 	unsigned long flags;
 	
 	spin_lock_irqsave(&emu->fx8010.irq_lock, flags);
-	if ((tmp = emu->fx8010.irq_handlers) == irq) {
+	tmp = emu->fx8010.irq_handlers;
+	if (tmp == irq) {
 		emu->fx8010.irq_handlers = tmp->next;
 		if (emu->fx8010.irq_handlers == NULL) {
 			snd_emu10k1_intr_disable(emu, INTE_FXDSPENABLE);
@@ -871,7 +872,9 @@ static int snd_emu10k1_add_controls(struct snd_emu10k1 *emu,
 			}
 			knew.private_value = (unsigned long)ctl;
 			*ctl = *nctl;
-			if ((err = snd_ctl_add(emu->card, kctl = snd_ctl_new1(&knew, emu))) < 0) {
+			kctl = snd_ctl_new1(&knew, emu);
+			err = snd_ctl_add(emu->card, kctl);
+			if (err < 0) {
 				kfree(ctl);
 				kfree(knew.tlv.p);
 				goto __error;
@@ -2403,7 +2406,8 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	while (ptr < 0x200)
 		OP(icode, &ptr, iACC3, C_00000000, C_00000000, C_00000000, C_00000000);
 
-	if ((err = snd_emu10k1_fx8010_tram_setup(emu, ipcm->buffer_size)) < 0)
+	err = snd_emu10k1_fx8010_tram_setup(emu, ipcm->buffer_size);
+	if (err < 0)
 		goto __err;
 	icode->gpr_add_control_count = i;
 	icode->gpr_add_controls = controls;
@@ -2681,7 +2685,8 @@ int snd_emu10k1_fx8010_new(struct snd_emu10k1 *emu, int device)
 	struct snd_hwdep *hw;
 	int err;
 	
-	if ((err = snd_hwdep_new(emu->card, "FX8010", device, &hw)) < 0)
+	err = snd_hwdep_new(emu->card, "FX8010", device, &hw);
+	if (err < 0)
 		return err;
 	strcpy(hw->name, "EMU10K1 (FX8010)");
 	hw->iface = SNDRV_HWDEP_IFACE_EMU10K1;
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 8a6cbe67e29d..e9c0fe3b8446 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1119,7 +1119,8 @@ static int snd_audigy_spdif_output_rate_put(struct snd_kcontrol *kcontrol,
 	reg = snd_emu10k1_ptr_read(emu, A_SPDIF_SAMPLERATE, 0);
 	tmp = reg & ~A_SPDIF_RATE_MASK;
 	tmp |= val;
-	if ((change = (tmp != reg)))
+	change = (tmp != reg);
+	if (change)
 		snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, 0, tmp);
 	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return change;
@@ -1903,7 +1904,8 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 			.read = snd_emu10k1_ac97_read,
 		};
 
-		if ((err = snd_ac97_bus(emu->card, 0, &ops, NULL, &pbus)) < 0)
+		err = snd_ac97_bus(emu->card, 0, &ops, NULL, &pbus);
+		if (err < 0)
 			return err;
 		pbus->no_vra = 1; /* we don't need VRA */
 		
@@ -1911,7 +1913,8 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		ac97.private_data = emu;
 		ac97.private_free = snd_emu10k1_mixer_free_ac97;
 		ac97.scaps = AC97_SCAP_NO_SPDIF;
-		if ((err = snd_ac97_mixer(pbus, &ac97, &emu->ac97)) < 0) {
+		err = snd_ac97_mixer(pbus, &ac97, &emu->ac97);
+		if (err < 0) {
 			if (emu->card_capabilities->ac97_chip == 1)
 				return err;
 			dev_info(emu->card->dev,
@@ -1991,38 +1994,50 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		rename_ctl(card, "Aux2 Capture Volume", "Line3 Capture Volume");
 		rename_ctl(card, "Mic Capture Volume", "Unknown1 Capture Volume");
 	}
-	if ((kctl = emu->ctl_send_routing = snd_ctl_new1(&snd_emu10k1_send_routing_control, emu)) == NULL)
+	kctl = emu->ctl_send_routing = snd_ctl_new1(&snd_emu10k1_send_routing_control, emu);
+	if (!kctl)
 		return -ENOMEM;
 	kctl->id.device = pcm_device;
-	if ((err = snd_ctl_add(card, kctl)))
+	err = snd_ctl_add(card, kctl);
+	if (err)
 		return err;
-	if ((kctl = emu->ctl_send_volume = snd_ctl_new1(&snd_emu10k1_send_volume_control, emu)) == NULL)
+	kctl = emu->ctl_send_volume = snd_ctl_new1(&snd_emu10k1_send_volume_control, emu);
+	if (!kctl)
 		return -ENOMEM;
 	kctl->id.device = pcm_device;
-	if ((err = snd_ctl_add(card, kctl)))
+	err = snd_ctl_add(card, kctl);
+	if (err)
 		return err;
-	if ((kctl = emu->ctl_attn = snd_ctl_new1(&snd_emu10k1_attn_control, emu)) == NULL)
+	kctl = emu->ctl_attn = snd_ctl_new1(&snd_emu10k1_attn_control, emu);
+	if (!kctl)
 		return -ENOMEM;
 	kctl->id.device = pcm_device;
-	if ((err = snd_ctl_add(card, kctl)))
+	err = snd_ctl_add(card, kctl);
+	if (err)
 		return err;
 
-	if ((kctl = emu->ctl_efx_send_routing = snd_ctl_new1(&snd_emu10k1_efx_send_routing_control, emu)) == NULL)
+	kctl = emu->ctl_efx_send_routing = snd_ctl_new1(&snd_emu10k1_efx_send_routing_control, emu);
+	if (!kctl)
 		return -ENOMEM;
 	kctl->id.device = multi_device;
-	if ((err = snd_ctl_add(card, kctl)))
+	err = snd_ctl_add(card, kctl);
+	if (err)
 		return err;
 	
-	if ((kctl = emu->ctl_efx_send_volume = snd_ctl_new1(&snd_emu10k1_efx_send_volume_control, emu)) == NULL)
+	kctl = emu->ctl_efx_send_volume = snd_ctl_new1(&snd_emu10k1_efx_send_volume_control, emu);
+	if (!kctl)
 		return -ENOMEM;
 	kctl->id.device = multi_device;
-	if ((err = snd_ctl_add(card, kctl)))
+	err = snd_ctl_add(card, kctl);
+	if (err)
 		return err;
 	
-	if ((kctl = emu->ctl_efx_attn = snd_ctl_new1(&snd_emu10k1_efx_attn_control, emu)) == NULL)
+	kctl = emu->ctl_efx_attn = snd_ctl_new1(&snd_emu10k1_efx_attn_control, emu);
+	if (!kctl)
 		return -ENOMEM;
 	kctl->id.device = multi_device;
-	if ((err = snd_ctl_add(card, kctl)))
+	err = snd_ctl_add(card, kctl);
+	if (err)
 		return err;
 
 	/* initialize the routing and volume table for each pcm playback stream */
@@ -2069,42 +2084,53 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 	
 	if (! emu->card_capabilities->ecard) { /* FIXME: APS has these controls? */
 		/* sb live! and audigy */
-		if ((kctl = snd_ctl_new1(&snd_emu10k1_spdif_mask_control, emu)) == NULL)
+		kctl = snd_ctl_new1(&snd_emu10k1_spdif_mask_control, emu);
+		if (!kctl)
 			return -ENOMEM;
 		if (!emu->audigy)
 			kctl->id.device = emu->pcm_efx->device;
-		if ((err = snd_ctl_add(card, kctl)))
+		err = snd_ctl_add(card, kctl);
+		if (err)
 			return err;
-		if ((kctl = snd_ctl_new1(&snd_emu10k1_spdif_control, emu)) == NULL)
+		kctl = snd_ctl_new1(&snd_emu10k1_spdif_control, emu);
+		if (!kctl)
 			return -ENOMEM;
 		if (!emu->audigy)
 			kctl->id.device = emu->pcm_efx->device;
-		if ((err = snd_ctl_add(card, kctl)))
+		err = snd_ctl_add(card, kctl);
+		if (err)
 			return err;
 	}
 
 	if (emu->card_capabilities->emu_model) {
 		;  /* Disable the snd_audigy_spdif_shared_spdif */
 	} else if (emu->audigy) {
-		if ((kctl = snd_ctl_new1(&snd_audigy_shared_spdif, emu)) == NULL)
+		kctl = snd_ctl_new1(&snd_audigy_shared_spdif, emu);
+		if (!kctl)
 			return -ENOMEM;
-		if ((err = snd_ctl_add(card, kctl)))
+		err = snd_ctl_add(card, kctl);
+		if (err)
 			return err;
 #if 0
-		if ((kctl = snd_ctl_new1(&snd_audigy_spdif_output_rate, emu)) == NULL)
+		kctl = snd_ctl_new1(&snd_audigy_spdif_output_rate, emu);
+		if (!kctl)
 			return -ENOMEM;
-		if ((err = snd_ctl_add(card, kctl)))
+		err = snd_ctl_add(card, kctl);
+		if (err)
 			return err;
 #endif
 	} else if (! emu->card_capabilities->ecard) {
 		/* sb live! */
-		if ((kctl = snd_ctl_new1(&snd_emu10k1_shared_spdif, emu)) == NULL)
+		kctl = snd_ctl_new1(&snd_emu10k1_shared_spdif, emu);
+		if (!kctl)
 			return -ENOMEM;
-		if ((err = snd_ctl_add(card, kctl)))
+		err = snd_ctl_add(card, kctl);
+		if (err)
 			return err;
 	}
 	if (emu->card_capabilities->ca0151_chip) { /* P16V */
-		if ((err = snd_p16v_mixer(emu)))
+		err = snd_p16v_mixer(emu);
+		if (err)
 			return err;
 	}
 
diff --git a/sound/pci/emu10k1/emumpu401.c b/sound/pci/emu10k1/emumpu401.c
index b62c95150702..3ce9b2129ce6 100644
--- a/sound/pci/emu10k1/emumpu401.c
+++ b/sound/pci/emu10k1/emumpu401.c
@@ -319,7 +319,8 @@ static int emu10k1_midi_init(struct snd_emu10k1 *emu, struct snd_emu10k1_midi *m
 	struct snd_rawmidi *rmidi;
 	int err;
 
-	if ((err = snd_rawmidi_new(emu->card, name, device, 1, 1, &rmidi)) < 0)
+	err = snd_rawmidi_new(emu->card, name, device, 1, 1, &rmidi);
+	if (err < 0)
 		return err;
 	midi->emu = emu;
 	spin_lock_init(&midi->open_lock);
@@ -342,7 +343,8 @@ int snd_emu10k1_midi(struct snd_emu10k1 *emu)
 	struct snd_emu10k1_midi *midi = &emu->midi;
 	int err;
 
-	if ((err = emu10k1_midi_init(emu, midi, 0, "EMU10K1 MPU-401 (UART)")) < 0)
+	err = emu10k1_midi_init(emu, midi, 0, "EMU10K1 MPU-401 (UART)");
+	if (err < 0)
 		return err;
 
 	midi->tx_enable = INTE_MIDITXENABLE;
@@ -360,7 +362,8 @@ int snd_emu10k1_audigy_midi(struct snd_emu10k1 *emu)
 	int err;
 
 	midi = &emu->midi;
-	if ((err = emu10k1_midi_init(emu, midi, 0, "Audigy MPU-401 (UART)")) < 0)
+	err = emu10k1_midi_init(emu, midi, 0, "Audigy MPU-401 (UART)");
+	if (err < 0)
 		return err;
 
 	midi->tx_enable = INTE_MIDITXENABLE;
@@ -371,7 +374,8 @@ int snd_emu10k1_audigy_midi(struct snd_emu10k1 *emu)
 	midi->interrupt = snd_emu10k1_midi_interrupt;
 
 	midi = &emu->midi2;
-	if ((err = emu10k1_midi_init(emu, midi, 1, "Audigy MPU-401 #2")) < 0)
+	err = emu10k1_midi_init(emu, midi, 1, "Audigy MPU-401 #2");
+	if (err < 0)
 		return err;
 
 	midi->tx_enable = INTE_A_MIDITXENABLE2;
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index b2ddabb99438..b2701a4452d8 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -25,7 +25,8 @@ static void snd_emu10k1_pcm_interrupt(struct snd_emu10k1 *emu,
 {
 	struct snd_emu10k1_pcm *epcm;
 
-	if ((epcm = voice->epcm) == NULL)
+	epcm = voice->epcm;
+	if (!epcm)
 		return;
 	if (epcm->substream == NULL)
 		return;
@@ -399,7 +400,8 @@ static int snd_emu10k1_playback_hw_params(struct snd_pcm_substream *substream,
 	size_t alloc_size;
 	int err;
 
-	if ((err = snd_emu10k1_pcm_channel_alloc(epcm, params_channels(hw_params))) < 0)
+	err = snd_emu10k1_pcm_channel_alloc(epcm, params_channels(hw_params));
+	if (err < 0)
 		return err;
 
 	alloc_size = params_buffer_bytes(hw_params);
@@ -1124,11 +1126,13 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_playback;
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0) {
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0) {
 		kfree(epcm);
 		return err;
 	}
-	if ((err = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 256, UINT_MAX)) < 0) {
+	err = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 256, UINT_MAX);
+	if (err < 0) {
 		kfree(epcm);
 		return err;
 	}
@@ -1380,7 +1384,8 @@ int snd_emu10k1_pcm(struct snd_emu10k1 *emu, int device)
 	struct snd_pcm_substream *substream;
 	int err;
 
-	if ((err = snd_pcm_new(emu->card, "emu10k1", device, 32, 1, &pcm)) < 0)
+	err = snd_pcm_new(emu->card, "emu10k1", device, 32, 1, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = emu;
@@ -1412,7 +1417,8 @@ int snd_emu10k1_pcm_multi(struct snd_emu10k1 *emu, int device)
 	struct snd_pcm_substream *substream;
 	int err;
 
-	if ((err = snd_pcm_new(emu->card, "emu10k1", device, 1, 0, &pcm)) < 0)
+	err = snd_pcm_new(emu->card, "emu10k1", device, 1, 0, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = emu;
@@ -1446,7 +1452,8 @@ int snd_emu10k1_pcm_mic(struct snd_emu10k1 *emu, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(emu->card, "emu10k1 mic", device, 0, 1, &pcm)) < 0)
+	err = snd_pcm_new(emu->card, "emu10k1 mic", device, 0, 1, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = emu;
@@ -1774,7 +1781,8 @@ int snd_emu10k1_pcm_efx(struct snd_emu10k1 *emu, int device)
 	struct snd_kcontrol *kctl;
 	int err;
 
-	if ((err = snd_pcm_new(emu->card, "emu10k1 efx", device, 8, 1, &pcm)) < 0)
+	err = snd_pcm_new(emu->card, "emu10k1 efx", device, 8, 1, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = emu;
diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index 288e0fd2e47d..9d26535f3fa3 100644
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -169,16 +169,20 @@ static int unmap_memblk(struct snd_emu10k1 *emu, struct snd_emu10k1_memblk *blk)
 	struct snd_emu10k1_memblk *q;
 
 	/* calculate the expected size of empty region */
-	if ((p = blk->mapped_link.prev) != &emu->mapped_link_head) {
+	p = blk->mapped_link.prev;
+	if (p != &emu->mapped_link_head) {
 		q = get_emu10k1_memblk(p, mapped_link);
 		start_page = q->mapped_page + q->pages;
-	} else
+	} else {
 		start_page = 1;
-	if ((p = blk->mapped_link.next) != &emu->mapped_link_head) {
+	}
+	p = blk->mapped_link.next;
+	if (p != &emu->mapped_link_head) {
 		q = get_emu10k1_memblk(p, mapped_link);
 		end_page = q->mapped_page;
-	} else
+	} else {
 		end_page = (emu->address_mode ? MAX_ALIGN_PAGES1 : MAX_ALIGN_PAGES0);
+	}
 
 	/* remove links */
 	list_del(&blk->mapped_link);
@@ -267,7 +271,8 @@ int snd_emu10k1_memblk_map(struct snd_emu10k1 *emu, struct snd_emu10k1_memblk *b
 		spin_unlock_irqrestore(&emu->memblk_lock, flags);
 		return 0;
 	}
-	if ((err = map_memblk(emu, blk)) < 0) {
+	err = map_memblk(emu, blk);
+	if (err < 0) {
 		/* no enough page - try to unmap some blocks */
 		/* starting from the oldest block */
 		p = emu->mapped_order_link_head.next;
@@ -454,13 +459,15 @@ static void get_single_page_range(struct snd_util_memhdr *hdr,
 	struct snd_emu10k1_memblk *q;
 	int first_page, last_page;
 	first_page = blk->first_page;
-	if ((p = blk->mem.list.prev) != &hdr->block) {
+	p = blk->mem.list.prev;
+	if (p != &hdr->block) {
 		q = get_emu10k1_memblk(p, mem.list);
 		if (q->last_page == first_page)
 			first_page++;  /* first page was already allocated */
 	}
 	last_page = blk->last_page;
-	if ((p = blk->mem.list.next) != &hdr->block) {
+	p = blk->mem.list.next;
+	if (p != &hdr->block) {
 		q = get_emu10k1_memblk(p, mem.list);
 		if (q->first_page == last_page)
 			last_page--; /* last page was already allocated */
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index 1099f102b365..ff2a3974c824 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -194,7 +194,8 @@ static int snd_p16v_pcm_open_playback_channel(struct snd_pcm_substream *substrea
 #endif /* debug */
 	/* channel->interrupt = snd_p16v_pcm_channel_interrupt; */
 	channel->epcm = epcm;
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
                 return err;
 
 	runtime->sync.id32[0] = substream->pcm->card->number;
@@ -242,7 +243,8 @@ static int snd_p16v_pcm_open_capture_channel(struct snd_pcm_substream *substream
 #endif /* debug */
 	/* channel->interrupt = snd_p16v_pcm_channel_interrupt; */
 	channel->epcm = epcm;
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 
 	return 0;
@@ -589,7 +591,8 @@ int snd_p16v_pcm(struct snd_emu10k1 *emu, int device)
 	/* dev_dbg(emu->card->dev, "snd_p16v_pcm called. device=%d\n", device); */
 	emu->p16v_device_offset = device;
 
-	if ((err = snd_pcm_new(emu->card, "p16v", device, 1, capture, &pcm)) < 0)
+	err = snd_pcm_new(emu->card, "p16v", device, 1, capture, &pcm);
+	if (err < 0)
 		return err;
   
 	pcm->private_data = emu;
@@ -808,8 +811,8 @@ int snd_p16v_mixer(struct snd_emu10k1 *emu)
         struct snd_card *card = emu->card;
 
 	for (i = 0; i < ARRAY_SIZE(p16v_mixer_controls); i++) {
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&p16v_mixer_controls[i],
-							  emu))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&p16v_mixer_controls[i], emu));
+		if (err < 0)
 			return err;
 	}
         return 0;
diff --git a/sound/pci/emu10k1/timer.c b/sound/pci/emu10k1/timer.c
index c2803000aace..2435d3ba68f7 100644
--- a/sound/pci/emu10k1/timer.c
+++ b/sound/pci/emu10k1/timer.c
@@ -72,7 +72,8 @@ int snd_emu10k1_timer(struct snd_emu10k1 *emu, int device)
 	tid.card = emu->card->number;
 	tid.device = device;
 	tid.subdevice = 0;
-	if ((err = snd_timer_new(emu->card, "EMU10K1", &tid, &timer)) >= 0) {
+	err = snd_timer_new(emu->card, "EMU10K1", &tid, &timer);
+	if (err >= 0) {
 		strcpy(timer->name, "EMU10K1 timer");
 		timer->private_data = emu;
 		timer->hw = snd_emu10k1_timer_hw;
-- 
2.26.2

