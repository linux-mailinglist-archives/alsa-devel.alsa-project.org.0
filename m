Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98234750B97
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 16:59:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 031C483A;
	Wed, 12 Jul 2023 16:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 031C483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689173985;
	bh=gWXK9Bckc3k0l3cfTOh09gfsgI+/kjREFUF/ZhD+XPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G/KLGSN8RDxEFRZPZv74uVy7OKJT75KaixT+zM3cJLmwifAMcnEvnbQPumhP+SAkP
	 /qSQc+79DNG8N815HuTCqKZYaoOmIL6Jldz8PLKv+3HyCOlRKMtsekpv75oS9HMg2Q
	 AmK5LRvgAdSQzgMn6D6rQ1/2NVb2iLWsu3xbfEqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1395F8055B; Wed, 12 Jul 2023 16:58:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DB1DF80549;
	Wed, 12 Jul 2023 16:58:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A765F80551; Wed, 12 Jul 2023 16:58:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D21EF800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 16:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D21EF800D2
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 6233324151;
	Wed, 12 Jul 2023 10:57:50 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qJbHq-WXn-00; Wed, 12 Jul 2023 16:57:50 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/3] ALSA: emu10k1: remove superfluous IRQ enable state saving
Date: Wed, 12 Jul 2023 16:57:49 +0200
Message-Id: <20230712145750.125086-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IMUBREY5XAQI7XJAU6BCWFKZ5QHZWO5R
X-Message-ID-Hash: IMUBREY5XAQI7XJAU6BCWFKZ5QHZWO5R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMUBREY5XAQI7XJAU6BCWFKZ5QHZWO5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The mixer, PCM prepare, MIDI, synth driver, and procfs callbacks are all
always invoked with IRQs enabled, so there is no point in saving the
state.

snd_emu1010_load_firmware_entry() is called from emu1010_firmware_work()
and snd_emu10k1_emu1010_init(); the latter from snd_emu10k1_create() and
snd_emu10k1_resume(), all of which have IRQs enabled.

The voice and memory functions are called from mixed contexts, so they
keep the state saving.

The low-level functions all keep the state saving, because it's not
feasible to keep track of what is called where.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c  |  5 ++--
 sound/pci/emu10k1/emu10k1_synth.c | 10 +++----
 sound/pci/emu10k1/emumixer.c      | 45 +++++++++++++------------------
 sound/pci/emu10k1/emumpu401.c     | 40 ++++++++++++---------------
 sound/pci/emu10k1/emupcm.c        |  6 ++---
 sound/pci/emu10k1/emuproc.c       | 10 +++----
 6 files changed, 47 insertions(+), 69 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 58ed72de6403..f9418c4a9a6f 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -664,19 +664,18 @@ static int snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
 	u16 reg;
 	u8 value;
 	__always_unused u16 write_post;
-	unsigned long flags;
 
 	if (!fw_entry)
 		return -EIO;
 
 	/* The FPGA is a Xilinx Spartan IIE XC2S50E */
 	/* On E-MU 0404b it is a Xilinx Spartan III XC3S50 */
 	/* GPIO7 -> FPGA PGMN
 	 * GPIO6 -> FPGA CCLK
 	 * GPIO5 -> FPGA DIN
 	 * FPGA CONFIG OFF -> FPGA PGMN
 	 */
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	spin_lock_irq(&emu->emu_lock);
 	outw(0x00, emu->port + A_GPIO); /* Set PGMN low for 100uS. */
 	write_post = inw(emu->port + A_GPIO);
 	udelay(100);
@@ -699,7 +698,7 @@ static int snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
 	/* After programming, set GPIO bit 4 high again. */
 	outw(0x10, emu->port + A_GPIO);
 	write_post = inw(emu->port + A_GPIO);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	spin_unlock_irq(&emu->emu_lock);
 
 	return 0;
 }
diff --git a/sound/pci/emu10k1/emu10k1_synth.c b/sound/pci/emu10k1/emu10k1_synth.c
index 759e66e1105a..68dfcb24b889 100644
--- a/sound/pci/emu10k1/emu10k1_synth.c
+++ b/sound/pci/emu10k1/emu10k1_synth.c
@@ -22,7 +22,6 @@ static int snd_emu10k1_synth_probe(struct device *_dev)
 	struct snd_emux *emux;
 	struct snd_emu10k1 *hw;
 	struct snd_emu10k1_synth_arg *arg;
-	unsigned long flags;
 
 	arg = SNDRV_SEQ_DEVICE_ARGPTR(dev);
 	if (arg == NULL)
@@ -56,33 +55,32 @@ static int snd_emu10k1_synth_probe(struct device *_dev)
 		return -ENOMEM;
 	}
 
-	spin_lock_irqsave(&hw->voice_lock, flags);
+	spin_lock_irq(&hw->voice_lock);
 	hw->synth = emux;
 	hw->get_synth_voice = snd_emu10k1_synth_get_voice;
-	spin_unlock_irqrestore(&hw->voice_lock, flags);
+	spin_unlock_irq(&hw->voice_lock);
 
 	dev->driver_data = emux;
 
 	return 0;
 }
 
 static int snd_emu10k1_synth_remove(struct device *_dev)
 {
 	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_emux *emux;
 	struct snd_emu10k1 *hw;
-	unsigned long flags;
 
 	if (dev->driver_data == NULL)
 		return 0; /* not registered actually */
 
 	emux = dev->driver_data;
 
 	hw = emux->hw;
-	spin_lock_irqsave(&hw->voice_lock, flags);
+	spin_lock_irq(&hw->voice_lock);
 	hw->synth = NULL;
 	hw->get_synth_voice = NULL;
-	spin_unlock_irqrestore(&hw->voice_lock, flags);
+	spin_unlock_irq(&hw->voice_lock);
 
 	snd_emux_free(emux);
 	return 0;
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 573e1c7c5e50..9a94f08f2463 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1193,7 +1193,6 @@ static int snd_audigy_i2c_capture_source_put(struct snd_kcontrol *kcontrol,
 	unsigned int ngain, ogain;
 	u16 gpio;
 	int change = 0;
-	unsigned long flags;
 	u32 source;
 	/* If the capture source has changed,
 	 * update the capture volume from the cached value
@@ -1207,13 +1206,13 @@ static int snd_audigy_i2c_capture_source_put(struct snd_kcontrol *kcontrol,
 	change = (emu->i2c_capture_source != source_id);
 	if (change) {
 		snd_emu10k1_i2c_write(emu, ADC_MUX, 0); /* Mute input */
-		spin_lock_irqsave(&emu->emu_lock, flags);
+		spin_lock_irq(&emu->emu_lock);
 		gpio = inw(emu->port + A_IOCFG);
 		if (source_id==0)
 			outw(gpio | 0x4, emu->port + A_IOCFG);
 		else
 			outw(gpio & ~0x4, emu->port + A_IOCFG);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
+		spin_unlock_irq(&emu->emu_lock);
 
 		ngain = emu->i2c_capture_volume[source_id][0]; /* Left */
 		ogain = emu->i2c_capture_volume[emu->i2c_capture_source][0]; /* Left */
@@ -1357,7 +1356,6 @@ static int snd_audigy_spdif_output_rate_put(struct snd_kcontrol *kcontrol,
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	int change;
 	unsigned int reg, val, tmp;
-	unsigned long flags;
 
 	switch(ucontrol->value.enumerated.item[0]) {
 	case 0:
@@ -1375,14 +1373,14 @@ static int snd_audigy_spdif_output_rate_put(struct snd_kcontrol *kcontrol,
 	}
 
 	
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	spin_lock_irq(&emu->reg_lock);
 	reg = snd_emu10k1_ptr_read(emu, A_SPDIF_SAMPLERATE, 0);
 	tmp = reg & ~A_SPDIF_RATE_MASK;
 	tmp |= val;
 	change = (tmp != reg);
 	if (change)
 		snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, 0, tmp);
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1499,15 +1497,14 @@ static int snd_emu10k1_send_routing_get(struct snd_kcontrol *kcontrol,
 static int snd_emu10k1_send_routing_put(struct snd_kcontrol *kcontrol,
                                         struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
 	int change = 0, voice, idx, val;
 	int num_efx = emu->audigy ? 8 : 4;
 	int mask = emu->audigy ? 0x3f : 0x0f;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	spin_lock_irq(&emu->reg_lock);
 	for (voice = 0; voice < 3; voice++)
 		for (idx = 0; idx < num_efx; idx++) {
 			val = ucontrol->value.integer.value[(voice * num_efx) + idx] & mask;
@@ -1527,7 +1524,7 @@ static int snd_emu10k1_send_routing_put(struct snd_kcontrol *kcontrol,
 					    &mix->send_routing[0][0]);
 		}
 	}
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1569,14 +1566,13 @@ static int snd_emu10k1_send_volume_get(struct snd_kcontrol *kcontrol,
 static int snd_emu10k1_send_volume_put(struct snd_kcontrol *kcontrol,
                                        struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
 	int change = 0, idx, val;
 	int num_efx = emu->audigy ? 8 : 4;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < 3*num_efx; idx++) {
 		val = ucontrol->value.integer.value[idx] & 255;
 		if (mix->send_volume[idx/num_efx][idx%num_efx] != val) {
@@ -1595,7 +1591,7 @@ static int snd_emu10k1_send_volume_put(struct snd_kcontrol *kcontrol,
 						   &mix->send_volume[0][0]);
 		}
 	}
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1635,13 +1631,12 @@ static int snd_emu10k1_attn_get(struct snd_kcontrol *kcontrol,
 static int snd_emu10k1_attn_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
 	int change = 0, idx, val;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < 3; idx++) {
 		unsigned uval = ucontrol->value.integer.value[idx] & 0x1ffff;
 		val = uval * 0x8000U / 0xffffU;
@@ -1658,7 +1653,7 @@ static int snd_emu10k1_attn_put(struct snd_kcontrol *kcontrol,
 			snd_emu10k1_ptr_write(emu, VTFT_VOLUMETARGET, mix->epcm->voices[0]->number, mix->attn[0]);
 		}
 	}
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1704,15 +1699,14 @@ static int snd_emu10k1_efx_send_routing_get(struct snd_kcontrol *kcontrol,
 static int snd_emu10k1_efx_send_routing_put(struct snd_kcontrol *kcontrol,
                                         struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	int ch = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
 	struct snd_emu10k1_pcm_mixer *mix = &emu->efx_pcm_mixer[ch];
 	int change = 0, idx, val;
 	int num_efx = emu->audigy ? 8 : 4;
 	int mask = emu->audigy ? 0x3f : 0x0f;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < num_efx; idx++) {
 		val = ucontrol->value.integer.value[idx] & mask;
 		if (mix->send_routing[0][idx] != val) {
@@ -1727,7 +1721,7 @@ static int snd_emu10k1_efx_send_routing_put(struct snd_kcontrol *kcontrol,
 					&mix->send_routing[0][0]);
 		}
 	}
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1769,14 +1763,13 @@ static int snd_emu10k1_efx_send_volume_get(struct snd_kcontrol *kcontrol,
 static int snd_emu10k1_efx_send_volume_put(struct snd_kcontrol *kcontrol,
                                        struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	int ch = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
 	struct snd_emu10k1_pcm_mixer *mix = &emu->efx_pcm_mixer[ch];
 	int change = 0, idx, val;
 	int num_efx = emu->audigy ? 8 : 4;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < num_efx; idx++) {
 		val = ucontrol->value.integer.value[idx] & 255;
 		if (mix->send_volume[0][idx] != val) {
@@ -1790,7 +1783,7 @@ static int snd_emu10k1_efx_send_volume_put(struct snd_kcontrol *kcontrol,
 						   &mix->send_volume[0][0]);
 		}
 	}
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1829,26 +1822,25 @@ static int snd_emu10k1_efx_attn_get(struct snd_kcontrol *kcontrol,
 static int snd_emu10k1_efx_attn_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	int ch = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
 	struct snd_emu10k1_pcm_mixer *mix = &emu->efx_pcm_mixer[ch];
 	int change = 0, val;
 	unsigned uval;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	spin_lock_irq(&emu->reg_lock);
 	uval = ucontrol->value.integer.value[0] & 0x1ffff;
 	val = uval * 0x8000U / 0xffffU;
 	if (mix->attn[0] != val) {
 		mix->attn[0] = val;
 		change = 1;
 	}
 	if (change && mix->epcm) {
 		if (mix->epcm->voices[ch]) {
 			snd_emu10k1_ptr_write(emu, VTFT_VOLUMETARGET, mix->epcm->voices[ch]->number, mix->attn[0]);
 		}
 	}
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1884,15 +1876,14 @@ static int snd_emu10k1_shared_spdif_get(struct snd_kcontrol *kcontrol,
 static int snd_emu10k1_shared_spdif_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	unsigned int reg, val, sw;
 	int change = 0;
 
 	sw = ucontrol->value.integer.value[0];
 	if (emu->card_capabilities->invert_shared_spdif)
 		sw = !sw;
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	spin_lock_irq(&emu->emu_lock);
 	if ( emu->card_capabilities->i2c_adc) {
 		/* Do nothing for Audigy 2 ZS Notebook */
 	} else if (emu->audigy) {
@@ -1913,7 +1904,7 @@ static int snd_emu10k1_shared_spdif_put(struct snd_kcontrol *kcontrol,
 		reg |= val;
 		outl(reg | val, emu->port + HCFG);
 	}
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	spin_unlock_irq(&emu->emu_lock);
 	return change;
 }
 
diff --git a/sound/pci/emu10k1/emumpu401.c b/sound/pci/emu10k1/emumpu401.c
index 3ce9b2129ce6..747c34b3d566 100644
--- a/sound/pci/emu10k1/emumpu401.c
+++ b/sound/pci/emu10k1/emumpu401.c
@@ -104,10 +104,9 @@ static void snd_emu10k1_midi_interrupt2(struct snd_emu10k1 *emu, unsigned int st
 
 static int snd_emu10k1_midi_cmd(struct snd_emu10k1 * emu, struct snd_emu10k1_midi *midi, unsigned char cmd, int ack)
 {
-	unsigned long flags;
 	int timeout, ok;
 
-	spin_lock_irqsave(&midi->input_lock, flags);
+	spin_lock_irq(&midi->input_lock);
 	mpu401_write_data(emu, midi, 0x00);
 	/* mpu401_clear_rx(emu, midi); */
 
@@ -126,7 +125,7 @@ static int snd_emu10k1_midi_cmd(struct snd_emu10k1 * emu, struct snd_emu10k1_mid
 	} else {
 		ok = 1;
 	}
-	spin_unlock_irqrestore(&midi->input_lock, flags);
+	spin_unlock_irq(&midi->input_lock);
 	if (!ok) {
 		dev_err(emu->card->dev,
 			"midi_cmd: 0x%x failed at 0x%lx (status = 0x%x, data = 0x%x)!!!\n",
@@ -142,98 +141,94 @@ static int snd_emu10k1_midi_input_open(struct snd_rawmidi_substream *substream)
 {
 	struct snd_emu10k1 *emu;
 	struct snd_emu10k1_midi *midi = (struct snd_emu10k1_midi *)substream->rmidi->private_data;
-	unsigned long flags;
 
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
 		return -ENXIO;
-	spin_lock_irqsave(&midi->open_lock, flags);
+	spin_lock_irq(&midi->open_lock);
 	midi->midi_mode |= EMU10K1_MIDI_MODE_INPUT;
 	midi->substream_input = substream;
 	if (!(midi->midi_mode & EMU10K1_MIDI_MODE_OUTPUT)) {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+		spin_unlock_irq(&midi->open_lock);
 		if (snd_emu10k1_midi_cmd(emu, midi, MPU401_RESET, 1))
 			goto error_out;
 		if (snd_emu10k1_midi_cmd(emu, midi, MPU401_ENTER_UART, 1))
 			goto error_out;
 	} else {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+		spin_unlock_irq(&midi->open_lock);
 	}
 	return 0;
 
 error_out:
 	return -EIO;
 }
 
 static int snd_emu10k1_midi_output_open(struct snd_rawmidi_substream *substream)
 {
 	struct snd_emu10k1 *emu;
 	struct snd_emu10k1_midi *midi = (struct snd_emu10k1_midi *)substream->rmidi->private_data;
-	unsigned long flags;
 
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
 		return -ENXIO;
-	spin_lock_irqsave(&midi->open_lock, flags);
+	spin_lock_irq(&midi->open_lock);
 	midi->midi_mode |= EMU10K1_MIDI_MODE_OUTPUT;
 	midi->substream_output = substream;
 	if (!(midi->midi_mode & EMU10K1_MIDI_MODE_INPUT)) {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+		spin_unlock_irq(&midi->open_lock);
 		if (snd_emu10k1_midi_cmd(emu, midi, MPU401_RESET, 1))
 			goto error_out;
 		if (snd_emu10k1_midi_cmd(emu, midi, MPU401_ENTER_UART, 1))
 			goto error_out;
 	} else {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+		spin_unlock_irq(&midi->open_lock);
 	}
 	return 0;
 
 error_out:
 	return -EIO;
 }
 
 static int snd_emu10k1_midi_input_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_emu10k1 *emu;
 	struct snd_emu10k1_midi *midi = (struct snd_emu10k1_midi *)substream->rmidi->private_data;
-	unsigned long flags;
 	int err = 0;
 
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
 		return -ENXIO;
-	spin_lock_irqsave(&midi->open_lock, flags);
+	spin_lock_irq(&midi->open_lock);
 	snd_emu10k1_intr_disable(emu, midi->rx_enable);
 	midi->midi_mode &= ~EMU10K1_MIDI_MODE_INPUT;
 	midi->substream_input = NULL;
 	if (!(midi->midi_mode & EMU10K1_MIDI_MODE_OUTPUT)) {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+		spin_unlock_irq(&midi->open_lock);
 		err = snd_emu10k1_midi_cmd(emu, midi, MPU401_RESET, 0);
 	} else {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+		spin_unlock_irq(&midi->open_lock);
 	}
 	return err;
 }
 
 static int snd_emu10k1_midi_output_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_emu10k1 *emu;
 	struct snd_emu10k1_midi *midi = (struct snd_emu10k1_midi *)substream->rmidi->private_data;
-	unsigned long flags;
 	int err = 0;
 
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
 		return -ENXIO;
-	spin_lock_irqsave(&midi->open_lock, flags);
+	spin_lock_irq(&midi->open_lock);
 	snd_emu10k1_intr_disable(emu, midi->tx_enable);
 	midi->midi_mode &= ~EMU10K1_MIDI_MODE_OUTPUT;
 	midi->substream_output = NULL;
 	if (!(midi->midi_mode & EMU10K1_MIDI_MODE_INPUT)) {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+		spin_unlock_irq(&midi->open_lock);
 		err = snd_emu10k1_midi_cmd(emu, midi, MPU401_RESET, 0);
 	} else {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+		spin_unlock_irq(&midi->open_lock);
 	}
 	return err;
 }
@@ -256,33 +251,32 @@ static void snd_emu10k1_midi_output_trigger(struct snd_rawmidi_substream *substr
 {
 	struct snd_emu10k1 *emu;
 	struct snd_emu10k1_midi *midi = (struct snd_emu10k1_midi *)substream->rmidi->private_data;
-	unsigned long flags;
 
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
 		return;
 
 	if (up) {
 		int max = 4;
 		unsigned char byte;
 	
 		/* try to send some amount of bytes here before interrupts */
-		spin_lock_irqsave(&midi->output_lock, flags);
+		spin_lock_irq(&midi->output_lock);
 		while (max > 0) {
 			if (mpu401_output_ready(emu, midi)) {
 				if (!(midi->midi_mode & EMU10K1_MIDI_MODE_OUTPUT) ||
 				    snd_rawmidi_transmit(substream, &byte, 1) != 1) {
 					/* no more data */
-					spin_unlock_irqrestore(&midi->output_lock, flags);
+					spin_unlock_irq(&midi->output_lock);
 					return;
 				}
 				mpu401_write_data(emu, midi, byte);
 				max--;
 			} else {
 				break;
 			}
 		}
-		spin_unlock_irqrestore(&midi->output_lock, flags);
+		spin_unlock_irq(&midi->output_lock);
 		snd_emu10k1_intr_enable(emu, midi->tx_enable);
 	} else {
 		snd_emu10k1_intr_disable(emu, midi->tx_enable);
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 387288d623d7..8b3d1b35d6e7 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -343,19 +343,17 @@ static void snd_emu10k1_pcm_init_voices(struct snd_emu10k1 *emu,
 					unsigned int end_addr,
 					struct snd_emu10k1_pcm_mixer *mix)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	spin_lock_irq(&emu->reg_lock);
 	snd_emu10k1_pcm_init_voice(emu, evoice, w_16, stereo,
 				   start_addr, end_addr,
 				   &mix->send_routing[stereo][0],
 				   &mix->send_volume[stereo][0]);
 	if (stereo)
 		snd_emu10k1_pcm_init_voice(emu, evoice + 1, w_16, true,
 					   start_addr, end_addr,
 					   &mix->send_routing[2][0],
 					   &mix->send_volume[2][0]);
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	spin_unlock_irq(&emu->reg_lock);
 }
 
 static void snd_emu10k1_pcm_init_extra_voice(struct snd_emu10k1 *emu,
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 7e2cc532471f..5533277e4d47 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -536,33 +536,31 @@ static unsigned int snd_ptr_read(struct snd_emu10k1 * emu,
 				 unsigned int reg,
 				 unsigned int chn)
 {
-	unsigned long flags;
 	unsigned int regptr, val;
 
 	regptr = (reg << 16) | chn;
 
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	spin_lock_irq(&emu->emu_lock);
 	outl(regptr, emu->port + iobase + PTR);
 	val = inl(emu->port + iobase + DATA);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	spin_unlock_irq(&emu->emu_lock);
 	return val;
 }
 
 static void snd_ptr_write(struct snd_emu10k1 *emu,
 			  unsigned int iobase,
 			  unsigned int reg,
 			  unsigned int chn,
 			  unsigned int data)
 {
 	unsigned int regptr;
-	unsigned long flags;
 
 	regptr = (reg << 16) | chn;
 
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	spin_lock_irq(&emu->emu_lock);
 	outl(regptr, emu->port + iobase + PTR);
 	outl(data, emu->port + iobase + DATA);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	spin_unlock_irq(&emu->emu_lock);
 }
 
 
-- 
2.40.0.152.g15d061e6df

