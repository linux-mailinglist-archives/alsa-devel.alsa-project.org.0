Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04261756058
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 12:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E2C8E74;
	Mon, 17 Jul 2023 12:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E2C8E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689589438;
	bh=7eMMC7xAtKV0euw1Fz+MnRdEP2sLTEiaNhX4QzFAlno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tN+x0Wdp1FwOtvJk/zd0PtiESx25ccVw7kxTPkoi8C2UOjlCz8dUqQ+kTZ3O6Eodo
	 MsL3Q8AYkv1CYtDucTi7TRnd87gQcrufW/HAhAfr1z0S2yqtITnfQnpMng5GH9fpVH
	 ONrDzGsjryfNxMzxeaepgZD5yLkcTjm7svaM9JK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24409F80544; Mon, 17 Jul 2023 12:22:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3741F8055B;
	Mon, 17 Jul 2023 12:22:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC0DF80549; Mon, 17 Jul 2023 12:22:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7782CF80548
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 12:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7782CF80548
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 11E78240E6;
	Mon, 17 Jul 2023 06:20:37 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qLLLI-hAf-00; Mon, 17 Jul 2023 12:20:36 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 1/6] ALSA: emu10k1: introduce alternative E-MU D.A.S. mode
Date: Mon, 17 Jul 2023 12:20:31 +0200
Message-Id: <20230717102036.404260-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230717102036.404260-1-oswald.buddenhagen@gmx.de>
References: <20230717102036.404260-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7PDUD2AUENMQMNZWK5SVWYDGPM7UQJXJ
X-Message-ID-Hash: 7PDUD2AUENMQMNZWK5SVWYDGPM7UQJXJ
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PDUD2AUENMQMNZWK5SVWYDGPM7UQJXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As noted in a previous commit, the E-MU Digital Audio System cards
don't try very hard to be Sound Blasters. This commit takes it further
and introduces a module option to switch to a completely separate mode.

In that mode:
- The regular PCM playback/capture devices are removed
- The multi-channel playback/capture devices get index 0
- Consequently, the regular mixer controls are also completely removed,
  as the multi-channel devices already bypassed them.
  This is no real loss, given the expected use with a sound server.
- The voice send routing+amount & attenuation controls are also removed,
  as they are just another mixer. The routing is redundant with the FPGA
  channel routing, and amounts/att'n can be done in software. The
  hardware implementation of the latter is also incompatible with 32-bit
  playback, which we'll add support for later.
- A_EXTOUT is now also free for multi-channel capture, so we use that
  instead of A_FXBUS2 - this will later simplify using both at once.
- For the same reason, the FX outputs are not listed in /proc anymore
- The device name is changed, so mixer settings don't get mixed up

This continues the pre-existing design with a single multi-channel
device where the channels are routed by manual mixer controls from/to
the physical ports. De-/multiplexing must be done by the sound server
if independent streams are to be used.

An alternative design would be exposing each physical port as a separate
device and automatically setting up the routes. This would be a somewhat
radical departure from the status quo, and I don't know whether it would
be a net benefit. It certainly would be harder to implement, as it would
require sync start of streams and a channel allocator (the latter would
have the added benefit of properly reporting EMU32 & EDI bus over-
allocation, which the mixer does not). And there is only one big multi-
channel capture engine, so streams would have to be de-multiplexed by
the driver in software - which seems a bit counter-productive if the
sound server would re-multiplex them again.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---
v3:
- commit message wording improvements
---
 include/sound/emu10k1.h          |   4 ++
 sound/pci/emu10k1/emu10k1.c      |  29 ++++++---
 sound/pci/emu10k1/emu10k1_main.c |  14 +++-
 sound/pci/emu10k1/emufx.c        |  94 ++++++++++++++++++++++++++-
 sound/pci/emu10k1/emumixer.c     |  93 ++++++++++++++-------------
 sound/pci/emu10k1/emupcm.c       | 107 +++++++++++++++++++++++++++----
 sound/pci/emu10k1/emuproc.c      |   5 ++
 7 files changed, 280 insertions(+), 66 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 1af9e6819392..29cdae401e12 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1706,6 +1706,7 @@ struct snd_emu10k1 {
 	unsigned int address_mode;		/* address mode */
 	unsigned long dma_mask;			/* PCI DMA mask */
 	bool iommu_workaround;			/* IOMMU workaround needed */
+	bool das_mode;				/* Alternative E-MU Digital Audio System mode */
 	int max_cache_pages;			/* max memory size / PAGE_SIZE */
 	struct snd_dma_buffer silent_page;	/* silent page */
 	struct snd_dma_buffer ptb_pages;	/* page table pages */
@@ -1735,6 +1736,7 @@ struct snd_emu10k1 {
 	struct snd_pcm *pcm_mic;
 	struct snd_pcm *pcm_efx;
 	struct snd_pcm *pcm_multi;
+	struct snd_pcm *pcm_das;
 	struct snd_pcm *pcm_p16v;
 
 	spinlock_t synth_lock;
@@ -1801,17 +1803,19 @@ struct snd_emu10k1 {
 
 int snd_emu10k1_create(struct snd_card *card,
 		       struct pci_dev *pci,
+		       bool emu_das,
 		       unsigned short extin_mask,
 		       unsigned short extout_mask,
 		       long max_cache_bytes,
 		       int enable_ir,
 		       uint subsystem);
 
 int snd_emu10k1_pcm(struct snd_emu10k1 *emu, int device);
 int snd_emu10k1_pcm_mic(struct snd_emu10k1 *emu, int device);
 int snd_emu10k1_pcm_efx(struct snd_emu10k1 *emu, int device);
 int snd_p16v_pcm(struct snd_emu10k1 *emu, int device);
 int snd_p16v_mixer(struct snd_emu10k1 * emu);
+int snd_emu10k1_pcm_das(struct snd_emu10k1 *emu, int device);
 int snd_emu10k1_pcm_multi(struct snd_emu10k1 *emu, int device);
 int snd_emu10k1_fx8010_pcm(struct snd_emu10k1 *emu, int device);
 int snd_emu10k1_mixer(struct snd_emu10k1 * emu, int pcm_device, int multi_device);
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index fe72e7d77241..249f8d6843a3 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -25,6 +25,7 @@ MODULE_LICENSE("GPL");
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 0-MAX */
 static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
 static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;	/* Enable this card */
+static bool emu_das[SNDRV_CARDS];
 static int extin[SNDRV_CARDS];
 static int extout[SNDRV_CARDS];
 static int seq_ports[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 4};
@@ -39,6 +40,8 @@ module_param_array(id, charp, NULL, 0444);
 MODULE_PARM_DESC(id, "ID string for the EMU10K1 soundcard.");
 module_param_array(enable, bool, NULL, 0444);
 MODULE_PARM_DESC(enable, "Enable the EMU10K1 soundcard.");
+module_param_array(emu_das, bool, NULL, 0444);
+MODULE_PARM_DESC(emu_das, "Use alternative E-MU Digital Audio System mode.");
 module_param_array(extin, int, NULL, 0444);
 MODULE_PARM_DESC(extin, "Available external inputs for FX8010. Zero=default.");
 module_param_array(extout, int, NULL, 0444);
@@ -93,22 +96,27 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 		max_buffer_size[dev] = 32;
 	else if (max_buffer_size[dev] > 1024)
 		max_buffer_size[dev] = 1024;
-	err = snd_emu10k1_create(card, pci, extin[dev], extout[dev],
+	err = snd_emu10k1_create(card, pci, emu_das[dev], extin[dev], extout[dev],
 				 (long)max_buffer_size[dev] * 1024 * 1024,
 				 enable_ir[dev], subsystem[dev]);
 	if (err < 0)
 		return err;
-	err = snd_emu10k1_pcm(emu, 0);
+	if (emu->das_mode)
+		err = snd_emu10k1_pcm_das(emu, 0);
+	else
+		err = snd_emu10k1_pcm(emu, 0);
 	if (err < 0)
 		return err;
 	if (emu->card_capabilities->ac97_chip) {
 		err = snd_emu10k1_pcm_mic(emu, 1);
 		if (err < 0)
 			return err;
 	}
-	err = snd_emu10k1_pcm_efx(emu, 2);
-	if (err < 0)
-		return err;
+	if (!emu->das_mode) {
+		err = snd_emu10k1_pcm_efx(emu, 2);
+		if (err < 0)
+			return err;
+	}
 	/* This stores the periods table. */
 	if (emu->card_capabilities->ca0151_chip) { /* P16V */	
 		emu->p16v_buffer =
@@ -125,9 +133,11 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	err = snd_emu10k1_pcm_multi(emu, 3);
-	if (err < 0)
-		return err;
+	if (!emu->das_mode) {
+		err = snd_emu10k1_pcm_multi(emu, 3);
+		if (err < 0)
+			return err;
+	}
 	if (emu->card_capabilities->ca0151_chip) { /* P16V */
 		err = snd_p16v_pcm(emu, 4);
 		if (err < 0)
@@ -146,7 +156,8 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 #ifdef ENABLE_SYNTH
-	if (snd_seq_device_new(card, 1, SNDRV_SEQ_DEV_ID_EMU10K1_SYNTH,
+	if (emu->das_mode) {
+	} else if (snd_seq_device_new(card, 1, SNDRV_SEQ_DEV_ID_EMU10K1_SYNTH,
 			       sizeof(struct snd_emu10k1_synth_arg), &wave) < 0 ||
 	    wave == NULL) {
 		dev_warn(emu->card->dev,
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index de5c41e578e1..b50bb6a55a6d 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1505,6 +1505,7 @@ static void snd_emu10k1_detect_iommu(struct snd_emu10k1 *emu)
 
 int snd_emu10k1_create(struct snd_card *card,
 		       struct pci_dev *pci,
+		       bool emu_das,
 		       unsigned short extin_mask,
 		       unsigned short extout_mask,
 		       long max_cache_bytes,
@@ -1584,8 +1585,19 @@ int snd_emu10k1_create(struct snd_card *card,
 			c->name, pci->vendor, pci->device,
 			emu->serial);
 
-	if (!*card->id && c->id)
+	if (c->emu_model) {
+		if (emu_das)
+			emu->das_mode = 1;
+		else
+			dev_notice(card->dev,
+				"You may want to use emu_das=1 with your %s\n", c->name);
+	}
+
+	if (!*card->id && c->id) {
 		strscpy(card->id, c->id, sizeof(card->id));
+		if (emu->das_mode)
+			strlcat(card->id, "das", sizeof(card->id));
+	}
 
 	is_audigy = emu->audigy = c->emu10k2_chip;
 
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 347141635604..7dae69d7a70f 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1276,6 +1276,96 @@ static void snd_emu10k1_audigy_dsp_convert_32_to_2x16(
 
 #define ENUM_GPR(name, size) name, name ## _dummy = name + (size) - 1
 
+/*
+ * initial DSP configuration for E-MU Digital Audio System
+ */
+
+static int _snd_emu10k1_das_init_efx(struct snd_emu10k1 *emu)
+{
+	enum {
+		ENUM_GPR(bit_shifter16, 1),
+		ENUM_GPR(tmp, 1),
+		num_static_gprs
+	};
+	int gpr = num_static_gprs;
+	u32 *gpr_map;
+	u32 ptr = 0;
+
+	int err = -ENOMEM;
+	struct snd_emu10k1_fx8010_code *icode = kzalloc(sizeof(*icode), GFP_KERNEL);
+	if (!icode)
+		return err;
+
+	icode->gpr_map = kcalloc(512 + 256 + 256 + 2 * 1024,
+				 sizeof(u_int32_t), GFP_KERNEL);
+	if (!icode->gpr_map)
+		goto __err_gpr;
+
+	icode->tram_data_map = icode->gpr_map + 512;
+	icode->tram_addr_map = icode->tram_data_map + 256;
+	icode->code = icode->tram_addr_map + 256;
+
+	/* clear free GPRs */
+	memset(icode->gpr_valid, 0xff, sizeof(icode->gpr_valid));
+
+	/* clear TRAM data & address lines */
+	memset(icode->tram_valid, 0xff, sizeof(icode->tram_valid));
+
+	strcpy(icode->name, "E-MU DSP code for ALSA");
+
+	gpr_map = icode->gpr_map;
+	gpr_map[bit_shifter16] = 0x00008000;
+
+	if (emu->card_capabilities->ca0108_chip) {
+		for (int z = 0; z < 16; z++)
+			A_OP(icode, &ptr, iMACINT0, A3_EMU32OUT(z), A_C_00000000, A_FXBUS(z), A_C_00000002);
+
+		snd_emu10k1_audigy_dsp_convert_32_to_2x16(
+			icode, &ptr, tmp, bit_shifter16, A3_EMU32IN(0), A_EXTOUT(0));
+		// A3_EMU32IN(0) is delayed by one sample, so all other A3_EMU32IN channels
+		// need to be delayed as well; we use an auxiliary register for that.
+		for (int z = 1; z < 16; z++) {
+			snd_emu10k1_audigy_dsp_convert_32_to_2x16(
+				icode, &ptr, tmp, bit_shifter16, A_GPR(gpr), A_EXTOUT(z * 2));
+			A_OP(icode, &ptr, iACC3, A_GPR(gpr), A3_EMU32IN(z), A_C_00000000, A_C_00000000);
+			gpr_map[gpr++] = 0x00000000;
+		}
+	} else {
+		for (int z = 0; z < 16; z++)
+			A_OP(icode, &ptr, iMACINT0, A_EMU32OUTL(z), A_C_00000000, A_FXBUS(z), A_C_00000002);
+
+		/* Note that the Alice2 DSPs have 6 I2S inputs which we don't use. */
+		snd_emu10k1_audigy_dsp_convert_32_to_2x16(
+			icode, &ptr, tmp, bit_shifter16, A_P16VIN(0), A_EXTOUT(0));
+		// A_P16VIN(0) is delayed by one sample, so all other A_P16VIN channels
+		// need to be delayed as well; we use an auxiliary register for that.
+		for (int z = 1; z < 16; z++) {
+			snd_emu10k1_audigy_dsp_convert_32_to_2x16(
+				icode, &ptr, tmp, bit_shifter16, A_GPR(gpr), A_EXTOUT(z * 2));
+			A_OP(icode, &ptr, iACC3, A_GPR(gpr), A_P16VIN(z), A_C_00000000, A_C_00000000);
+			gpr_map[gpr++] = 0x00000000;
+		}
+	}
+
+	if (gpr > 512) {
+		snd_BUG();
+		err = -EIO;
+		goto __err;
+	}
+
+	/* clear remaining instruction memory */
+	while (ptr < 0x400)
+		A_OP(icode, &ptr, 0x0f, 0xc0, 0xc0, 0xcf, 0xc0);
+
+	err = snd_emu10k1_icode_poke(emu, icode, true);
+
+__err:
+	kfree(icode->gpr_map);
+__err_gpr:
+	kfree(icode);
+	return err;
+}
+
 /*
  * initial DSP configuration for Audigy
  */
@@ -2370,7 +2460,9 @@ int snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 {
 	spin_lock_init(&emu->fx8010.irq_lock);
 	INIT_LIST_HEAD(&emu->fx8010.gpr_ctl);
-	if (emu->audigy)
+	if (emu->das_mode)
+		return _snd_emu10k1_das_init_efx(emu);
+	else if (emu->audigy)
 		return _snd_emu10k1_audigy_init_efx(emu);
 	else
 		return _snd_emu10k1_init_efx(emu);
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index f72a01f8f8f2..278aecb3fd94 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -2222,51 +2222,56 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		rename_ctl(card, "Aux2 Capture Volume", "Line3 Capture Volume");
 		rename_ctl(card, "Mic Capture Volume", "Unknown1 Capture Volume");
 	}
-	kctl = emu->ctl_send_routing = snd_ctl_new1(&snd_emu10k1_send_routing_control, emu);
-	if (!kctl)
-		return -ENOMEM;
-	kctl->id.device = pcm_device;
-	err = snd_ctl_add(card, kctl);
-	if (err)
-		return err;
-	kctl = emu->ctl_send_volume = snd_ctl_new1(&snd_emu10k1_send_volume_control, emu);
-	if (!kctl)
-		return -ENOMEM;
-	kctl->id.device = pcm_device;
-	err = snd_ctl_add(card, kctl);
-	if (err)
-		return err;
-	kctl = emu->ctl_attn = snd_ctl_new1(&snd_emu10k1_attn_control, emu);
-	if (!kctl)
-		return -ENOMEM;
-	kctl->id.device = pcm_device;
-	err = snd_ctl_add(card, kctl);
-	if (err)
-		return err;
 
-	kctl = emu->ctl_efx_send_routing = snd_ctl_new1(&snd_emu10k1_efx_send_routing_control, emu);
-	if (!kctl)
-		return -ENOMEM;
-	kctl->id.device = multi_device;
-	err = snd_ctl_add(card, kctl);
-	if (err)
-		return err;
-	
-	kctl = emu->ctl_efx_send_volume = snd_ctl_new1(&snd_emu10k1_efx_send_volume_control, emu);
-	if (!kctl)
-		return -ENOMEM;
-	kctl->id.device = multi_device;
-	err = snd_ctl_add(card, kctl);
-	if (err)
-		return err;
-	
-	kctl = emu->ctl_efx_attn = snd_ctl_new1(&snd_emu10k1_efx_attn_control, emu);
-	if (!kctl)
-		return -ENOMEM;
-	kctl->id.device = multi_device;
-	err = snd_ctl_add(card, kctl);
-	if (err)
-		return err;
+	if (!emu->das_mode) {
+		kctl = emu->ctl_send_routing = snd_ctl_new1(&snd_emu10k1_send_routing_control, emu);
+		if (!kctl)
+			return -ENOMEM;
+		kctl->id.device = pcm_device;
+		err = snd_ctl_add(card, kctl);
+		if (err)
+			return err;
+
+		kctl = emu->ctl_send_volume = snd_ctl_new1(&snd_emu10k1_send_volume_control, emu);
+		if (!kctl)
+			return -ENOMEM;
+		kctl->id.device = pcm_device;
+		err = snd_ctl_add(card, kctl);
+		if (err)
+			return err;
+
+		kctl = emu->ctl_attn = snd_ctl_new1(&snd_emu10k1_attn_control, emu);
+		if (!kctl)
+			return -ENOMEM;
+		kctl->id.device = pcm_device;
+		err = snd_ctl_add(card, kctl);
+		if (err)
+			return err;
+
+		kctl = emu->ctl_efx_send_routing = snd_ctl_new1(&snd_emu10k1_efx_send_routing_control, emu);
+		if (!kctl)
+			return -ENOMEM;
+		kctl->id.device = multi_device;
+		err = snd_ctl_add(card, kctl);
+		if (err)
+			return err;
+
+		kctl = emu->ctl_efx_send_volume = snd_ctl_new1(&snd_emu10k1_efx_send_volume_control, emu);
+		if (!kctl)
+			return -ENOMEM;
+		kctl->id.device = multi_device;
+		err = snd_ctl_add(card, kctl);
+		if (err)
+			return err;
+
+		kctl = emu->ctl_efx_attn = snd_ctl_new1(&snd_emu10k1_efx_attn_control, emu);
+		if (!kctl)
+			return -ENOMEM;
+		kctl->id.device = multi_device;
+		err = snd_ctl_add(card, kctl);
+		if (err)
+			return err;
+	}
 
 	if (!emu->card_capabilities->ecard && !emu->card_capabilities->emu_model) {
 		/* sb live! and audigy */
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 7f4c1b38d6ec..9a0efa6e5ba9 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -353,6 +353,22 @@ static void snd_emu10k1_pcm_init_voices(struct snd_emu10k1 *emu,
 	spin_unlock_irq(&emu->reg_lock);
 }
 
+static void snd_emu10k1_pcm_init_das_voices(struct snd_emu10k1 *emu,
+					    struct snd_emu10k1_voice *evoice,
+					    unsigned int start_addr,
+					    unsigned int end_addr,
+					    unsigned char channel)
+{
+	static const unsigned char send_amount[8] = { 255, 0, 0, 0, 0, 0, 0, 0 };
+	unsigned char send_routing[8];
+
+	for (int i = 0; i < ARRAY_SIZE(send_routing); i++)
+		send_routing[i] = (channel + i) % NUM_G;
+	snd_emu10k1_pcm_init_voice(emu, evoice, true, false,
+				   start_addr, end_addr,
+				   send_routing, send_amount);
+}
+
 static void snd_emu10k1_pcm_init_extra_voice(struct snd_emu10k1 *emu,
 					     struct snd_emu10k1_voice *evoice,
 					     bool w_16,
@@ -472,6 +488,7 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
+	bool das_mode = emu->das_mode;
 	unsigned int start_addr;
 	unsigned int extra_size, channel_size;
 	unsigned int i;
@@ -487,11 +504,20 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 					 start_addr, start_addr + extra_size);
 
 	epcm->ccca_start_addr = start_addr;
-	for (i = 0; i < runtime->channels; i++) {
-		snd_emu10k1_pcm_init_voices(emu, epcm->voices[i], true, false,
-					    start_addr, start_addr + channel_size,
-					    &emu->efx_pcm_mixer[i]);
-		start_addr += channel_size;
+	if (das_mode) {
+		for (i = 0; i < runtime->channels; i++) {
+			snd_emu10k1_pcm_init_das_voices(emu, epcm->voices[i],
+							start_addr, start_addr + channel_size,
+							i);
+			start_addr += channel_size;
+		}
+	} else {
+		for (i = 0; i < runtime->channels; i++) {
+			snd_emu10k1_pcm_init_voices(emu, epcm->voices[i], true, false,
+						    start_addr, start_addr + channel_size,
+						    &emu->efx_pcm_mixer[i]);
+			start_addr += channel_size;
+		}
 	}
 
 	return 0;
@@ -531,10 +557,16 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 		break;
 	case CAPTURE_EFX:
 		if (emu->card_capabilities->emu_model) {
-			// The upper 32 16-bit capture voices, two for each of the 16 32-bit channels.
-			// The lower voices are occupied by A_EXTOUT_*_CAP*.
-			epcm->capture_cr_val = 0;
-			epcm->capture_cr_val2 = 0xffffffff >> (32 - runtime->channels * 2);
+			unsigned mask = 0xffffffff >> (32 - runtime->channels * 2);
+			if (emu->das_mode) {
+				epcm->capture_cr_val = mask;
+				epcm->capture_cr_val2 = 0;
+			} else {
+				// The upper 32 16-bit capture voices, two for each of the 16 32-bit channels.
+				// The lower voices are occupied by A_EXTOUT_*_CAP*.
+				epcm->capture_cr_val = 0;
+				epcm->capture_cr_val2 = mask;
+			}
 		}
 		if (emu->audigy) {
 			snd_emu10k1_ptr_write_multiple(emu, 0,
@@ -680,6 +712,12 @@ static void snd_emu10k1_playback_unmute_voices(struct snd_emu10k1 *emu,
 		snd_emu10k1_playback_unmute_voice(emu, evoice + 1, true, false, mix);
 }
 
+static void snd_emu10k1_playback_unmute_das_voices(struct snd_emu10k1 *emu,
+						   struct snd_emu10k1_voice *evoice)
+{
+	snd_emu10k1_playback_commit_volume(emu, evoice, 0x8000 << 16);
+}
+
 static void snd_emu10k1_playback_mute_voice(struct snd_emu10k1 *emu,
 					    struct snd_emu10k1_voice *evoice)
 {
@@ -923,6 +961,14 @@ static void snd_emu10k1_efx_playback_unmute_voices(struct snd_emu10k1 *emu,
 						  &emu->efx_pcm_mixer[i]);
 }
 
+static void snd_emu10k1_efx_playback_unmute_das_voices(struct snd_emu10k1 *emu,
+						       struct snd_emu10k1_pcm *epcm,
+						       int channels)
+{
+	for (int i = 0; i < channels; i++)
+		snd_emu10k1_playback_unmute_das_voices(emu, epcm->voices[i]);
+}
+
 static void snd_emu10k1_efx_playback_stop_voices(struct snd_emu10k1 *emu,
 						 struct snd_emu10k1_pcm *epcm,
 						 int channels)
@@ -941,6 +987,7 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
+	bool das_mode = emu->das_mode;
 	u64 mask;
 	int result = 0;
 
@@ -964,7 +1011,12 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 			// they have been started, to potentially avoid torturing the speakers
 			// if something goes wrong. However, we cannot unmute atomically,
 			// which means that we'd get some mild artifacts in the regular case.
-			snd_emu10k1_efx_playback_unmute_voices(emu, epcm, runtime->channels);
+			if (das_mode)
+				snd_emu10k1_efx_playback_unmute_das_voices(
+						emu, epcm, runtime->channels);
+			else
+				snd_emu10k1_efx_playback_unmute_voices(
+						emu, epcm, runtime->channels);
 
 			snd_emu10k1_playback_set_running(emu, epcm);
 			result = snd_emu10k1_voice_clear_loop_stop_multiple_atomic(emu, mask);
@@ -1130,6 +1182,8 @@ static int snd_emu10k1_efx_playback_close(struct snd_pcm_substream *substream)
 	struct snd_emu10k1_pcm_mixer *mix;
 	int i;
 
+	if (emu->das_mode)
+		return 0;
 	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
 		mix = &emu->efx_pcm_mixer[i];
 		mix->epcm = NULL;
@@ -1180,6 +1234,8 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 		return err;
 	}
 
+	if (emu->das_mode)
+		return 0;
 	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
 		mix = &emu->efx_pcm_mixer[i];
 		for (j = 0; j < 8; j++)
@@ -1864,12 +1920,41 @@ int snd_emu10k1_pcm_efx(struct snd_emu10k1 *emu, int device)
 			return err;
 	} else {
 		// On E-MU cards, the DSP code copies the P16VINs/EMU32INs to
-		// FXBUS2. These are already selected & routed by the FPGA,
+		// EXTOUT/FXBUS2. These are already selected & routed by the FPGA,
 		// so there is no need to apply additional masking.
 	}
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &emu->pci->dev,
 				       64*1024, 64*1024);
 
 	return 0;
 }
+
+int snd_emu10k1_pcm_das(struct snd_emu10k1 *emu, int device)
+{
+	struct snd_pcm *pcm;
+	struct snd_pcm_substream *substream;
+
+	int err = snd_pcm_new(emu->card, "emu10k1 efx", device, 1, 1, &pcm);
+	if (err < 0)
+		return err;
+
+	pcm->private_data = emu;
+
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_emu10k1_efx_playback_ops);
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_emu10k1_capture_efx_ops);
+
+	strcpy(pcm->name, "Multichannel Playback/Capture");
+	emu->pcm_das = pcm;
+
+	// Playback substream can't use managed buffers due to IOMMU workaround
+	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+	snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV_SG,
+				      &emu->pci->dev, 64*1024, 64*1024);
+
+	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+	snd_pcm_set_managed_buffer(substream, SNDRV_DMA_TYPE_DEV,
+				   &emu->pci->dev, 64*1024, 64*1024);
+
+	return 0;
+}
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 2f80fd91017c..24a085a953f7 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -80,6 +80,11 @@ static void snd_emu10k1_proc_read(struct snd_info_entry *entry,
 	snd_iprintf(buffer, "Internal TRAM (words) : 0x%x\n", emu->fx8010.itram_size);
 	snd_iprintf(buffer, "External TRAM (words) : 0x%x\n", (int)emu->fx8010.etram_pages.bytes / 2);
 
+	// The following are internal details in D.A.S. mode,
+	// so there is no use in displaying them to the user.
+	if (emu->das_mode)
+		return;
+
 	snd_iprintf(buffer, "\nEffect Send Routing & Amounts:\n");
 	for (idx = 0; idx < NUM_G; idx++) {
 		ptrx = snd_emu10k1_ptr_read(emu, PTRX, idx);
-- 
2.40.0.152.g15d061e6df

