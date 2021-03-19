Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886A341357
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 04:05:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D32231695;
	Fri, 19 Mar 2021 04:04:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D32231695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616123133;
	bh=+K+jgpcKtdIVO+bTZO1o/tHEo5VdIqMmXb1jKGzDt60=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TI4iNqi9LDb3KygsmLxWMxQtrOJMYxtiwlUg81qjH12zmBkPAxReC1v+3HcAuAFJU
	 xFK293x3iaNB1RIXuF6gBIakXzcbGg8JdQzWaFVZvia5cII5SZs1M22RSeryls1uU/
	 wJEOAXzoLeyLudmmtmirln6kOKRkFDH9y/BjOSo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 550EAF8023C;
	Fri, 19 Mar 2021 04:04:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 486ADF801F7; Fri, 19 Mar 2021 04:04:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5230FF801F7
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 04:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5230FF801F7
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12J33hnF6013721,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 12J33hnF6013721
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 19 Mar 2021 11:03:43 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 19 Mar 2021 11:03:43 +0800
From: Jack Yu <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: rt715: add main capture switch and main capture
 volume
Date: Fri, 19 Mar 2021 11:03:36 +0800
Message-ID: <20210319030337.16213-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

Add main capture switch and main capture volume control.
Main capture control has its own channel value respectivelly.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt715.c | 392 ++++++++++++++++++++++++++++++++-------
 1 file changed, 323 insertions(+), 69 deletions(-)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index f419d001a3fb..c461a4c23fd3 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -80,85 +80,102 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	unsigned int capture_reg_H[] = {RT715_SET_GAIN_MIC_ADC_H,
+		RT715_SET_GAIN_LINE_ADC_H, RT715_SET_GAIN_MIX_ADC_H,
+		RT715_SET_GAIN_MIX_ADC2_H};
+	unsigned int capture_reg_L[] = {RT715_SET_GAIN_MIC_ADC_L,
+		RT715_SET_GAIN_LINE_ADC_L, RT715_SET_GAIN_MIX_ADC_L,
+		RT715_SET_GAIN_MIX_ADC2_L};
 	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
-	unsigned int read_ll, read_rl;
-	int i;
-
-	/* Can't use update bit function, so read the original value first */
-	addr_h = mc->reg;
-	addr_l = mc->rreg;
-	if (mc->shift == RT715_DIR_OUT_SFT) /* output */
-		val_h = 0x80;
-	else /* input */
-		val_h = 0x0;
-
-	rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
-
-	/* L Channel */
-	if (mc->invert) {
-		/* for mute */
-		val_ll = (mc->max - ucontrol->value.integer.value[0]) << 7;
-		/* keep gain */
-		read_ll = read_ll & 0x7f;
-		val_ll |= read_ll;
-	} else {
-		/* for gain */
-		val_ll = ((ucontrol->value.integer.value[0]) & 0x7f);
-		if (val_ll > mc->max)
-			val_ll = mc->max;
-		/* keep mute status */
-		read_ll = read_ll & 0x80;
-		val_ll |= read_ll;
-	}
-
-	/* R Channel */
-	if (mc->invert) {
-		regmap_write(rt715->regmap,
-			     RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
-		/* for mute */
-		val_lr = (mc->max - ucontrol->value.integer.value[1]) << 7;
-		/* keep gain */
-		read_rl = read_rl & 0x7f;
-		val_lr |= read_rl;
-	} else {
-		/* for gain */
-		val_lr = ((ucontrol->value.integer.value[1]) & 0x7f);
-		if (val_lr > mc->max)
-			val_lr = mc->max;
-		/* keep mute status */
-		read_rl = read_rl & 0x80;
-		val_lr |= read_rl;
-	}
+	unsigned int read_ll, read_rl, i, j, loop_cnt;
 
-	for (i = 0; i < 3; i++) { /* retry 3 times at most */
+	if (strstr(ucontrol->id.name, "Main Capture Switch") ||
+		strstr(ucontrol->id.name, "Main Capture Volume"))
+		loop_cnt = 4;
+	else
+		loop_cnt = 1;
 
-		if (val_ll == val_lr) {
-			/* Set both L/R channels at the same time */
-			val_h = (1 << mc->shift) | (3 << 4);
-			regmap_write(rt715->regmap, addr_h,
-				(val_h << 8 | val_ll));
-			regmap_write(rt715->regmap, addr_l,
-				(val_h << 8 | val_ll));
+	for (j = 0; j < loop_cnt; j++) {
+		/* Can't use update bit function, so read the original value first */
+		if (loop_cnt == 1) {
+			addr_h = mc->reg;
+			addr_l = mc->rreg;
 		} else {
-			/* Lch*/
-			val_h = (1 << mc->shift) | (1 << 5);
-			regmap_write(rt715->regmap, addr_h,
-				(val_h << 8 | val_ll));
-			/* Rch */
-			val_h = (1 << mc->shift) | (1 << 4);
-			regmap_write(rt715->regmap, addr_l,
-				(val_h << 8 | val_lr));
+			addr_h = capture_reg_H[j];
+			addr_l = capture_reg_L[j];
 		}
-		/* check result */
+
 		if (mc->shift == RT715_DIR_OUT_SFT) /* output */
 			val_h = 0x80;
 		else /* input */
 			val_h = 0x0;
 
-		rt715_get_gain(rt715, addr_h, addr_l, val_h,
-			       &read_rl, &read_ll);
-		if (read_rl == val_lr && read_ll == val_ll)
-			break;
+		rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
+
+		if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+			regmap_write(rt715->regmap,
+					RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+
+		/* L Channel */
+		if (mc->invert) {
+			/* for mute */
+			val_ll = (mc->max - ucontrol->value.integer.value[0]) << 7;
+			/* keep gain */
+			val_ll |= read_ll & 0x7f;
+		} else {
+			/* for gain */
+			val_ll = ((ucontrol->value.integer.value[0]) & 0x7f);
+			if (val_ll > mc->max)
+				val_ll = mc->max;
+			/* keep mute status */
+			val_ll |= read_ll & 0x80;
+		}
+
+		/* R Channel */
+		if (mc->invert) {
+			/* for mute */
+			val_lr = (mc->max - ucontrol->value.integer.value[1]) << 7;
+			/* keep gain */
+			val_lr |= read_rl & 0x7f;
+		} else {
+			/* for gain */
+			val_lr = ((ucontrol->value.integer.value[1]) & 0x7f);
+			if (val_lr > mc->max)
+				val_lr = mc->max;
+			/* keep mute status */
+			val_lr |= read_rl & 0x80;
+		}
+
+		for (i = 0; i < 3; i++) { /* retry 3 times at most */
+
+			if (val_ll == val_lr) {
+				/* Set both L/R channels at the same time */
+				val_h = (1 << mc->shift) | (3 << 4);
+				regmap_write(rt715->regmap, addr_h,
+					(val_h << 8) | val_ll);
+				regmap_write(rt715->regmap, addr_l,
+					(val_h << 8) | val_ll);
+			} else {
+				/* Lch*/
+				val_h = (1 << mc->shift) | (1 << 5);
+				regmap_write(rt715->regmap, addr_h,
+					(val_h << 8) | val_ll);
+				/* Rch */
+				val_h = (1 << mc->shift) | (1 << 4);
+				regmap_write(rt715->regmap, addr_l,
+					(val_h << 8) | val_lr);
+			}
+			/* check result */
+			if (mc->shift == RT715_DIR_OUT_SFT) /* output */
+				val_h = 0x80;
+			else /* input */
+				val_h = 0x0;
+
+			rt715_get_gain(rt715, addr_h, addr_l, val_h,
+					&read_rl, &read_ll);
+			if (read_rl == val_lr && read_ll == val_ll)
+				break;
+		}
 	}
 	/* D0:power on state, D3: power saving mode */
 	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
@@ -201,9 +218,227 @@ static int rt715_set_amp_gain_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int rt715_set_main_switch_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	unsigned int capture_reg_H[] = {RT715_SET_GAIN_MIC_ADC_H,
+		RT715_SET_GAIN_LINE_ADC_H, RT715_SET_GAIN_MIX_ADC_H,
+		RT715_SET_GAIN_MIX_ADC2_H};
+	unsigned int capture_reg_L[] = {RT715_SET_GAIN_MIC_ADC_L,
+		RT715_SET_GAIN_LINE_ADC_L, RT715_SET_GAIN_MIX_ADC_L,
+		RT715_SET_GAIN_MIX_ADC2_L};
+	unsigned int addr_h, addr_l, val_h = 0x0, val_ll, val_lr;
+	unsigned int read_ll, read_rl, i, j, loop_cnt = 4;
+	unsigned int k_shift = RT715_DIR_IN_SFT;
+
+	for (j = 0; j < loop_cnt; j++) {
+		/* Can't use update bit function, so read the original value first */
+		addr_h = capture_reg_H[j];
+		addr_l = capture_reg_L[j];
+		rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
+
+		if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+			regmap_write(rt715->regmap,
+					RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+
+		/* L Channel */
+		/* for mute */
+		val_ll = (!ucontrol->value.integer.value[j * 2]) << 7;
+		/* keep gain */
+		val_ll |= read_ll & 0x7f;
+
+		/* R Channel */
+		/* for mute */
+		val_lr = (!ucontrol->value.integer.value[j * 2 + 1]) << 7;
+		/* keep gain */
+		val_lr |= read_rl & 0x7f;
+
+		for (i = 0; i < 3; i++) { /* retry 3 times at most */
+
+			if (val_ll == val_lr) {
+				/* Set both L/R channels at the same time */
+				val_h = (1 << k_shift) | (3 << 4);
+				regmap_write(rt715->regmap, addr_h,
+					(val_h << 8) | val_ll);
+				regmap_write(rt715->regmap, addr_l,
+					(val_h << 8) | val_ll);
+			} else {
+				/* Lch*/
+				val_h = (1 << k_shift) | (1 << 5);
+				regmap_write(rt715->regmap, addr_h,
+					(val_h << 8) | val_ll);
+				/* Rch */
+				val_h = (1 << k_shift) | (1 << 4);
+				regmap_write(rt715->regmap, addr_l,
+					(val_h << 8) | val_lr);
+			}
+			val_h = 0x0;
+			rt715_get_gain(rt715, addr_h, addr_l, val_h,
+					&read_rl, &read_ll);
+			if (read_rl == val_lr && read_ll == val_ll)
+				break;
+		}
+	}
+	/* D0:power on state, D3: power saving mode */
+	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+		regmap_write(rt715->regmap,
+				RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
+	return 0;
+}
+
+static int rt715_set_main_switch_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	unsigned int capture_reg_H[] = {RT715_SET_GAIN_MIC_ADC_H,
+		RT715_SET_GAIN_LINE_ADC_H, RT715_SET_GAIN_MIX_ADC_H,
+		RT715_SET_GAIN_MIX_ADC2_H};
+	unsigned int capture_reg_L[] = {RT715_SET_GAIN_MIC_ADC_L,
+		RT715_SET_GAIN_LINE_ADC_L, RT715_SET_GAIN_MIX_ADC_L,
+		RT715_SET_GAIN_MIX_ADC2_L};
+	unsigned int addr_h, addr_l, val_h = 0x0, i, loop_cnt = 4;
+	unsigned int read_ll, read_rl;
+
+	for (i = 0; i < loop_cnt; i++) {
+		addr_h = capture_reg_H[i];
+		addr_l = capture_reg_L[i];
+		rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
+
+		ucontrol->value.integer.value[i * 2] = !(read_ll & 0x80);
+		ucontrol->value.integer.value[i * 2 + 1] = !(read_rl & 0x80);
+	}
+
+	return 0;
+}
+
+static int rt715_set_main_vol_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	unsigned int capture_reg_H[] = {RT715_SET_GAIN_MIC_ADC_H,
+		RT715_SET_GAIN_LINE_ADC_H, RT715_SET_GAIN_MIX_ADC_H,
+		RT715_SET_GAIN_MIX_ADC2_H};
+	unsigned int capture_reg_L[] = {RT715_SET_GAIN_MIC_ADC_L,
+		RT715_SET_GAIN_LINE_ADC_L, RT715_SET_GAIN_MIX_ADC_L,
+		RT715_SET_GAIN_MIX_ADC2_L};
+	unsigned int addr_h, addr_l, val_h = 0x0, val_ll, val_lr;
+	unsigned int read_ll, read_rl, i, j, loop_cnt = 4;
+	unsigned int k_shift = RT715_DIR_IN_SFT, k_max = 0x3f;
+
+	for (j = 0; j < loop_cnt; j++) {
+		addr_h = capture_reg_H[j];
+		addr_l = capture_reg_L[j];
+		rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
+
+		if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+			regmap_write(rt715->regmap,
+					RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+
+		/* L Channel */
+		/* for gain */
+		val_ll = ((ucontrol->value.integer.value[j * 2]) & 0x7f);
+		if (val_ll > k_max)
+			val_ll = k_max;
+		/* keep mute status */
+		val_ll |= read_ll & 0x80;
+
+		/* R Channel */
+		/* for gain */
+		val_lr = ((ucontrol->value.integer.value[j * 2 + 1]) & 0x7f);
+		if (val_lr > k_max)
+			val_lr = k_max;
+		/* keep mute status */
+		val_lr |= read_rl & 0x80;
+
+		for (i = 0; i < 3; i++) { /* retry 3 times at most */
+			if (val_ll == val_lr) {
+				/* Set both L/R channels at the same time */
+				val_h = (1 << k_shift) | (3 << 4);
+				regmap_write(rt715->regmap, addr_h,
+					(val_h << 8) | val_ll);
+				regmap_write(rt715->regmap, addr_l,
+					(val_h << 8) | val_ll);
+			} else {
+				/* Lch*/
+				val_h = (1 << k_shift) | (1 << 5);
+				regmap_write(rt715->regmap, addr_h,
+					(val_h << 8) | val_ll);
+				/* Rch */
+				val_h = (1 << k_shift) | (1 << 4);
+				regmap_write(rt715->regmap, addr_l,
+					(val_h << 8) | val_lr);
+			}
+			val_h = 0x0;
+			rt715_get_gain(rt715, addr_h, addr_l, val_h,
+					&read_rl, &read_ll);
+			if (read_rl == val_lr && read_ll == val_ll)
+				break;
+		}
+	}
+	/* D0:power on state, D3: power saving mode */
+	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+		regmap_write(rt715->regmap,
+				RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
+	return 0;
+}
+
+static int rt715_set_main_vol_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	unsigned int capture_reg_H[] = {RT715_SET_GAIN_MIC_ADC_H,
+		RT715_SET_GAIN_LINE_ADC_H, RT715_SET_GAIN_MIX_ADC_H,
+		RT715_SET_GAIN_MIX_ADC2_H};
+	unsigned int capture_reg_L[] = {RT715_SET_GAIN_MIC_ADC_L,
+		RT715_SET_GAIN_LINE_ADC_L, RT715_SET_GAIN_MIX_ADC_L,
+		RT715_SET_GAIN_MIX_ADC2_L};
+	unsigned int addr_h, addr_l, val_h = 0x0, i, loop_cnt = 4;
+	unsigned int read_ll, read_rl;
+
+	for (i = 0; i < loop_cnt; i++) {
+		addr_h = capture_reg_H[i];
+		addr_l = capture_reg_L[i];
+		rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
+
+		ucontrol->value.integer.value[i * 2] = read_ll & 0x7f;
+		ucontrol->value.integer.value[i * 2 + 1] = read_rl & 0x7f;
+	}
+
+	return 0;
+}
+
 static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
 static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
 
+static int rt715_switch_info(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 8;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+	return 0;
+}
+
+static int rt715_vol_info(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 8;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 0x3f;
+	return 0;
+}
+
 #define SOC_DOUBLE_R_EXT(xname, reg_left, reg_right, xshift, xmax, xinvert,\
 	 xhandler_get, xhandler_put) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
@@ -212,6 +447,21 @@ static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
 	.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
 					    xmax, xinvert) }
 
+#define RT715_MAIN_SWITCH_EXT(xname, xhandler_get, xhandler_put) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.info = rt715_switch_info, \
+	.get = xhandler_get, .put = xhandler_put, \
+}
+
+#define RT715_MAIN_VOL_EXT_TLV(xname, xhandler_get, xhandler_put, tlv_array) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
+		 SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = rt715_vol_info, \
+	.get = xhandler_get, .put = xhandler_put, \
+}
+
 static const struct snd_kcontrol_new rt715_snd_controls[] = {
 	/* Capture switch */
 	SOC_DOUBLE_R_EXT("ADC 07 Capture Switch", RT715_SET_GAIN_MIC_ADC_H,
@@ -226,6 +476,8 @@ static const struct snd_kcontrol_new rt715_snd_controls[] = {
 	SOC_DOUBLE_R_EXT("ADC 27 Capture Switch", RT715_SET_GAIN_MIX_ADC2_H,
 			RT715_SET_GAIN_MIX_ADC2_L, RT715_DIR_IN_SFT, 1, 1,
 			rt715_set_amp_gain_get, rt715_set_amp_gain_put),
+	RT715_MAIN_SWITCH_EXT("Main Capture Switch",
+			rt715_set_main_switch_get, rt715_set_main_switch_put),
 	/* Volume Control */
 	SOC_DOUBLE_R_EXT_TLV("ADC 07 Capture Volume", RT715_SET_GAIN_MIC_ADC_H,
 			RT715_SET_GAIN_MIC_ADC_L, RT715_DIR_IN_SFT, 0x3f, 0,
@@ -243,6 +495,8 @@ static const struct snd_kcontrol_new rt715_snd_controls[] = {
 			RT715_SET_GAIN_MIX_ADC2_L, RT715_DIR_IN_SFT, 0x3f, 0,
 			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
 			in_vol_tlv),
+	RT715_MAIN_VOL_EXT_TLV("Main Capture Volume",
+			rt715_set_main_vol_get, rt715_set_main_vol_put, in_vol_tlv),
 	/* MIC Boost Control */
 	SOC_DOUBLE_R_EXT_TLV("DMIC1 Boost", RT715_SET_GAIN_DMIC1_H,
 			RT715_SET_GAIN_DMIC1_L, RT715_DIR_IN_SFT, 3, 0,
-- 
2.29.0

