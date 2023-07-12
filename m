Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5A750B98
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 16:59:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFD6784C;
	Wed, 12 Jul 2023 16:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFD6784C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689173986;
	bh=NVqNQEhChHvNUwPrvyKoFM1lYOwgwh1aJ1ENlGNzQEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dmEgGPDD94NH4+t4RQjyOUIIoWXKrvWiu7/en83EH0ZWRO8fv4IS9rs08fqDKAvX2
	 8LY1h+/MZFJzrY74QkWv38Tu3AxYc+zdpOhAwGeABgkoxlma7P4ruxlkVddSCQcY4z
	 LTa8wVnlCO+xJGBjj33u76rY27474eq9m9kXlzZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FB49F8057D; Wed, 12 Jul 2023 16:58:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32385F80564;
	Wed, 12 Jul 2023 16:58:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA9EFF80568; Wed, 12 Jul 2023 16:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2210F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 16:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2210F80093
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 6048D2413B;
	Wed, 12 Jul 2023 10:57:50 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qJbHq-WXt-00; Wed, 12 Jul 2023 16:57:50 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/3] ALSA: emu10k1: (re-)add mixer locking
Date: Wed, 12 Jul 2023 16:57:50 +0200
Message-Id: <20230712145750.125086-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XMNBFWTCDX34FN4VGIDXXXFW5G4J6WKQ
X-Message-ID-Hash: XMNBFWTCDX34FN4VGIDXXXFW5G4J6WKQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMNBFWTCDX34FN4VGIDXXXFW5G4J6WKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Takashi now "prefers" that the drivers do not rely on the core's locking
of card->controls_rwsem, so we undo 06405d8ee8 ("ALSA: emu10k1: remove
now superfluous mixer locking") and add more locks that were already
missing.

This adds some rather significant critical sections with IRQs disabled,
as emu->reg_lock is also accessed by the PCM trigger callbacks, which
are called with the hardirq-safe (self-)group lock held.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---
the long irq-disabled sections could be avoided by introducing a
separate control mutex. i surveyed a few drivers, and the precedents
are very mixed, so i'm not sure this would be considered worth it.

---
of the few drivers i checked, pcsp, ak4xxx-adda, pt2258, hal2,
sgio2audio, au88x0_eq, and ca0106_mixer appear to be missing locking
upon superficial inspection, a percentage well into the double digits.

given that there are ~3700 hits for snd_kcontrol_new (and many more
_put() methods to check, due to initializer arrays), the whole endeavor
seems just as utterly hopeless to me as i expected.

so i recommend that you reconsider, and consequently reject this patch.
---
 sound/pci/emu10k1/emufx.c    |  5 +++++
 sound/pci/emu10k1/emumixer.c | 42 ++++++++++++++++++++++++++++++++++--
 sound/pci/emu10k1/emupcm.c   |  2 ++
 sound/pci/emu10k1/p16v.c     |  7 ++++++
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 9904bcfee106..cda5311cee46 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -353,12 +353,15 @@ static int snd_emu10k1_gpr_ctl_info(struct snd_kcontrol *kcontrol, struct snd_ct
 
 static int snd_emu10k1_gpr_ctl_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
+	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_fx8010_ctl *ctl =
 		(struct snd_emu10k1_fx8010_ctl *) kcontrol->private_value;
 	unsigned int i;
 	
+	spin_lock_irq(&emu->reg_lock);
 	for (i = 0; i < ctl->vcount; i++)
 		ucontrol->value.integer.value[i] = ctl->value[i];
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
@@ -371,6 +374,7 @@ static int snd_emu10k1_gpr_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 	unsigned int i, j;
 	int change = 0;
 	
+	spin_lock_irq(&emu->reg_lock);
 	for (i = 0; i < ctl->vcount; i++) {
 		nval = ucontrol->value.integer.value[i];
 		if (nval < ctl->min)
@@ -416,6 +420,7 @@ static int snd_emu10k1_gpr_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 		}
 	}
       __error:
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 9a94f08f2463..c52ab410b632 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -63,10 +63,12 @@ static int snd_emu10k1_spdif_get(struct snd_kcontrol *kcontrol,
 	/* Limit: emu->spdif_bits */
 	if (idx >= 3)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	ucontrol->value.iec958.status[0] = (emu->spdif_bits[idx] >> 0) & 0xff;
 	ucontrol->value.iec958.status[1] = (emu->spdif_bits[idx] >> 8) & 0xff;
 	ucontrol->value.iec958.status[2] = (emu->spdif_bits[idx] >> 16) & 0xff;
 	ucontrol->value.iec958.status[3] = (emu->spdif_bits[idx] >> 24) & 0xff;
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
@@ -664,11 +666,13 @@ static int snd_emu1010_output_source_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	if (channel >= emu_ri->n_outs)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->emu1010.output_source[channel] != val);
 	if (change) {
 		emu->emu1010.output_source[channel] = val;
 		snd_emu1010_output_source_apply(emu, channel, val);
 	}
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -708,11 +712,13 @@ static int snd_emu1010_input_source_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	if (channel >= emu_ri->n_ins)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->emu1010.input_source[channel] != val);
 	if (change) {
 		emu->emu1010.input_source[channel] = val;
 		snd_emu1010_input_source_apply(emu, channel, val);
 	}
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -773,16 +779,18 @@ static int snd_emu1010_adc_pads_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	int change;
 
 	val = ucontrol->value.integer.value[0];
+	spin_lock_irq(&emu->reg_lock);
 	cache = emu->emu1010.adc_pads;
 	if (val == 1) 
 		cache = cache | mask;
 	else
 		cache = cache & ~mask;
 	change = (cache != emu->emu1010.adc_pads);
 	if (change) {
 		snd_emu1010_fpga_write(emu, EMU_HANA_ADC_PADS, cache );
 	        emu->emu1010.adc_pads = cache;
 	}
+	spin_unlock_irq(&emu->reg_lock);
 
 	return change;
 }
@@ -831,16 +839,18 @@ static int snd_emu1010_dac_pads_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	int change;
 
 	val = ucontrol->value.integer.value[0];
+	spin_lock_irq(&emu->reg_lock);
 	cache = emu->emu1010.dac_pads;
 	if (val == 1) 
 		cache = cache | mask;
 	else
 		cache = cache & ~mask;
 	change = (cache != emu->emu1010.dac_pads);
 	if (change) {
 		snd_emu1010_fpga_write(emu, EMU_HANA_DAC_PADS, cache );
 	        emu->emu1010.dac_pads = cache;
 	}
+	spin_unlock_irq(&emu->reg_lock);
 
 	return change;
 }
@@ -986,18 +996,22 @@ static int snd_emu1010_clock_source_put(struct snd_kcontrol *kcontrol,
 	val = ucontrol->value.enumerated.item[0] ;
 	if (val >= emu_ci->num)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->emu1010.clock_source != val);
 	if (change) {
 		emu->emu1010.clock_source = val;
 		emu->emu1010.wclock = emu_ci->vals[val];
 
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE);
 		snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, emu->emu1010.wclock);
+		spin_unlock_irq(&emu->reg_lock);
 		msleep(10);  // Allow DLL to settle
+		spin_lock_irq(&emu->reg_lock);
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
 
 		snd_emu1010_update_clock(emu);
 	}
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1040,11 +1054,13 @@ static int snd_emu1010_clock_fallback_put(struct snd_kcontrol *kcontrol,
 
 	if (val >= 2)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->emu1010.clock_fallback != val);
 	if (change) {
 		emu->emu1010.clock_fallback = val;
 		snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, 1 - val);
 	}
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1090,13 +1106,15 @@ static int snd_emu1010_optical_out_put(struct snd_kcontrol *kcontrol,
 	/* Limit: uinfo->value.enumerated.items = 2; */
 	if (val >= 2)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->emu1010.optical_out != val);
 	if (change) {
 		emu->emu1010.optical_out = val;
 		tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : EMU_HANA_OPTICAL_IN_SPDIF) |
 			(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : EMU_HANA_OPTICAL_OUT_SPDIF);
 		snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
 	}
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1141,13 +1159,15 @@ static int snd_emu1010_optical_in_put(struct snd_kcontrol *kcontrol,
 	/* Limit: uinfo->value.enumerated.items = 2; */
 	if (val >= 2)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->emu1010.optical_in != val);
 	if (change) {
 		emu->emu1010.optical_in = val;
 		tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : EMU_HANA_OPTICAL_IN_SPDIF) |
 			(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : EMU_HANA_OPTICAL_OUT_SPDIF);
 		snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
 	}
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1203,16 +1223,17 @@ static int snd_audigy_i2c_capture_source_put(struct snd_kcontrol *kcontrol,
 	/*        emu->i2c_capture_volume */
 	if (source_id >= 2)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->i2c_capture_source != source_id);
 	if (change) {
 		snd_emu10k1_i2c_write(emu, ADC_MUX, 0); /* Mute input */
-		spin_lock_irq(&emu->emu_lock);
+		spin_lock(&emu->emu_lock);
 		gpio = inw(emu->port + A_IOCFG);
 		if (source_id==0)
 			outw(gpio | 0x4, emu->port + A_IOCFG);
 		else
 			outw(gpio & ~0x4, emu->port + A_IOCFG);
-		spin_unlock_irq(&emu->emu_lock);
+		spin_unlock(&emu->emu_lock);
 
 		ngain = emu->i2c_capture_volume[source_id][0]; /* Left */
 		ogain = emu->i2c_capture_volume[emu->i2c_capture_source][0]; /* Left */
@@ -1227,6 +1248,7 @@ static int snd_audigy_i2c_capture_source_put(struct snd_kcontrol *kcontrol,
 		snd_emu10k1_i2c_write(emu, ADC_MUX, source); /* Set source */
 		emu->i2c_capture_source = source_id;
 	}
+	spin_unlock_irq(&emu->reg_lock);
         return change;
 }
 
@@ -1261,8 +1283,10 @@ static int snd_audigy_i2c_volume_get(struct snd_kcontrol *kcontrol,
 	if (source_id >= 2)
 		return -EINVAL;
 
+	spin_lock_irq(&emu->reg_lock);
 	ucontrol->value.integer.value[0] = emu->i2c_capture_volume[source_id][0];
 	ucontrol->value.integer.value[1] = emu->i2c_capture_volume[source_id][1];
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
@@ -1286,6 +1310,7 @@ static int snd_audigy_i2c_volume_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	if (ngain1 > 0xff)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	ogain = emu->i2c_capture_volume[source_id][0]; /* Left */
 	if (ogain != ngain0) {
 		if (emu->i2c_capture_source == source_id)
@@ -1300,6 +1325,7 @@ static int snd_audigy_i2c_volume_put(struct snd_kcontrol *kcontrol,
 		emu->i2c_capture_volume[source_id][1] = ngain1;
 		change = 1;
 	}
+	spin_unlock_irq(&emu->reg_lock);
 
 	return change;
 }
@@ -1411,11 +1437,13 @@ static int snd_emu10k1_spdif_put(struct snd_kcontrol *kcontrol,
 	      (ucontrol->value.iec958.status[1] << 8) |
 	      (ucontrol->value.iec958.status[2] << 16) |
 	      (ucontrol->value.iec958.status[3] << 24);
+	spin_lock_irq(&emu->reg_lock);
 	change = val != emu->spdif_bits[idx];
 	if (change) {
 		snd_emu10k1_ptr_write(emu, SPCS0 + idx, 0, val);
 		emu->spdif_bits[idx] = val;
 	}
+	spin_unlock_irq(&emu->reg_lock);
 	return change;
 }
 
@@ -1487,10 +1515,12 @@ static int snd_emu10k1_send_routing_get(struct snd_kcontrol *kcontrol,
 	int num_efx = emu->audigy ? 8 : 4;
 	int mask = emu->audigy ? 0x3f : 0x0f;
 
+	spin_lock_irq(&emu->reg_lock);
 	for (voice = 0; voice < 3; voice++)
 		for (idx = 0; idx < num_efx; idx++)
 			ucontrol->value.integer.value[(voice * num_efx) + idx] = 
 				mix->send_routing[voice][idx] & mask;
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
@@ -1558,8 +1588,10 @@ static int snd_emu10k1_send_volume_get(struct snd_kcontrol *kcontrol,
 	int idx;
 	int num_efx = emu->audigy ? 8 : 4;
 
+	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < 3*num_efx; idx++)
 		ucontrol->value.integer.value[idx] = mix->send_volume[idx/num_efx][idx%num_efx];
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
@@ -1623,8 +1655,10 @@ static int snd_emu10k1_attn_get(struct snd_kcontrol *kcontrol,
 		&emu->pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
 	int idx;
 
+	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < 3; idx++)
 		ucontrol->value.integer.value[idx] = mix->attn[idx] * 0xffffU / 0x8000U;
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
@@ -1690,9 +1724,11 @@ static int snd_emu10k1_efx_send_routing_get(struct snd_kcontrol *kcontrol,
 	int num_efx = emu->audigy ? 8 : 4;
 	int mask = emu->audigy ? 0x3f : 0x0f;
 
+	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < num_efx; idx++)
 		ucontrol->value.integer.value[idx] = 
 			mix->send_routing[0][idx] & mask;
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
@@ -1755,8 +1791,10 @@ static int snd_emu10k1_efx_send_volume_get(struct snd_kcontrol *kcontrol,
 	int idx;
 	int num_efx = emu->audigy ? 8 : 4;
 
+	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < num_efx; idx++)
 		ucontrol->value.integer.value[idx] = mix->send_volume[0][idx];
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 8b3d1b35d6e7..994aa386d074 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1541,8 +1541,10 @@ static int snd_emu10k1_pcm_efx_voices_mask_get(struct snd_kcontrol *kcontrol, st
 	int nefx = emu->audigy ? 64 : 32;
 	int idx;
 	
+	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < nefx; idx++)
 		ucontrol->value.integer.value[idx] = (emu->efx_voices_mask[idx / 32] & (1 << (idx % 32))) ? 1 : 0;
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index e7f097cae574..1dec937b7d21 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -635,6 +635,7 @@ static int snd_p16v_volume_put(struct snd_kcontrol *kcontrol,
 	int reg = kcontrol->private_value & 0xff;
         u32 value, oval;
 
+	spin_lock_irq(&emu->reg_lock);
 	oval = value = snd_emu10k1_ptr20_read(emu, reg, 0);
 	if (high_low == 1) {
 		value &= 0xffff;
@@ -647,8 +648,10 @@ static int snd_p16v_volume_put(struct snd_kcontrol *kcontrol,
 	}
 	if (value != oval) {
 		snd_emu10k1_ptr20_write(emu, reg, 0, value);
+		spin_unlock_irq(&emu->reg_lock);
 		return 1;
 	}
+	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
@@ -684,13 +687,15 @@ static int snd_p16v_capture_source_put(struct snd_kcontrol *kcontrol,
 	val = ucontrol->value.enumerated.item[0] ;
 	if (val > 7)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->p16v_capture_source != val);
 	if (change) {
 		emu->p16v_capture_source = val;
 		source = (val << 28) | (val << 24) | (val << 20) | (val << 16);
 		mask = snd_emu10k1_ptr20_read(emu, BASIC_INTERRUPT, 0) & 0xffff;
 		snd_emu10k1_ptr20_write(emu, BASIC_INTERRUPT, 0, source | mask);
 	}
+	spin_unlock_irq(&emu->reg_lock);
         return change;
 }
 
@@ -722,12 +727,14 @@ static int snd_p16v_capture_channel_put(struct snd_kcontrol *kcontrol,
 	val = ucontrol->value.enumerated.item[0] ;
 	if (val > 3)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->p16v_capture_channel != val);
 	if (change) {
 		emu->p16v_capture_channel = val;
 		tmp = snd_emu10k1_ptr20_read(emu, CAPTURE_P16V_SOURCE, 0) & 0xfffc;
 		snd_emu10k1_ptr20_write(emu, CAPTURE_P16V_SOURCE, 0, tmp | val);
 	}
+	spin_unlock_irq(&emu->reg_lock);
         return change;
 }
 static const DECLARE_TLV_DB_SCALE(snd_p16v_db_scale1, -5175, 25, 1);
-- 
2.40.0.152.g15d061e6df

