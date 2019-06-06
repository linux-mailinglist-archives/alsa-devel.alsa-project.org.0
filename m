Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40137322
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 13:42:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 000921654;
	Thu,  6 Jun 2019 13:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 000921654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559821326;
	bh=hkKlBiLDx+vGGMwhHZ7sr4WGEfVCSLBu+/38rxV4tmQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BlZLRp9X9mLNR+XNFpxSqvrmaUy2Mlf+OyOL0nEF6jPK2uUuoIs2j5H8iIhRGkREH
	 Tb8iASKCzRsOPxrgaQdg8errRZQO7Rz90Qx0JZHOwf/HSQdjgsAZ+wZhbbj1ycr/xk
	 J1cQbkTJBBbTqFF9oT2vxVwZgwkrN3+IksrYeIkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5260F80768;
	Thu,  6 Jun 2019 13:40:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94909F896EF; Thu,  6 Jun 2019 13:40:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDB24F80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 13:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB24F80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BnUKsuMM"
Received: by mail-wm1-x341.google.com with SMTP id z23so2071318wma.4
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e0R8k9uuYiHNf++gBM8GyQ5qs2s614duInFddvobUmc=;
 b=BnUKsuMMHO/D9QLdQaLeF1PFMHf+XImtJQHcaYOFM2WkfdjjxZkokc5xc2rUaOeTyP
 oNs/FKLVx1LvGvVN/oHCcaTzO5qyANM7TUvBQ7ZGYKp0DtH4b+mYpDyfaG3+0UZNW8J/
 4lQBuD6v1BXWJ+fjxUKz7L3wSw4Nharci3WeIDoIzhDJV3zJbilIF3wrIjJYqK3HCF6J
 B55Wk2OdKCss1lGRKwztJOO2XCCn4vGPo8KEqI5TzY5CMN5xTJaWoW5w3ujwkyKc1TiW
 bzA++/eHtsTZ/OolUrgLJloPSbt9ry5yo1g16CqbLoXoM/kBTqK27WncUk0renQBpZ7F
 pREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e0R8k9uuYiHNf++gBM8GyQ5qs2s614duInFddvobUmc=;
 b=q1id/dDsaCAkeZUfDR3GgO4B77g0+6rXAqZeRDZuEdbB6fK2THwwfyfyP9Yxd34gey
 aVT2I7mIKlPQMPEA/rwci/yJZQOrxX0syeJ1WmPbM65aw919rQAvKWczRcJgvwPzRfYO
 nQlmOz7YNqkqYyhKByYvlEp59QMW7ySW8uQSpmcirR7fvYSNCeQ7Ru0mKUJlhOtUHY4M
 k8L3NZExTF7F90hn5G0i6tbZl75MXTuo7hSR2givj63pkjiJ1MUKg0FjX4Q5ZKjfSFcB
 BjnqrecxUk3vWgcG2oiFaGp4phGQpVTvVrHDdapOcvBOZpNQFHHSfFGocCtU4dIqSCXj
 CIaQ==
X-Gm-Message-State: APjAAAXqaC5QSdMSxwgdjjjvY8mWHm19xODmsqMyP5B/wXJssUWaVvBa
 wkRnrTvQR1yND+EmcEquKEs+WA==
X-Google-Smtp-Source: APXvYqzuBpwPG6Z2CMYLnXfC9jp1lNGSWq01t/trN7hK7UJqIRkXDX1om/nUYPY0gi1KYwvBvSCAYQ==
X-Received: by 2002:a1c:6154:: with SMTP id v81mr25510351wmb.92.1559821213660; 
 Thu, 06 Jun 2019 04:40:13 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id 67sm1474611wmd.38.2019.06.06.04.40.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 04:40:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Thu,  6 Jun 2019 12:40:02 +0100
Message-Id: <20190606114002.17251-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: Add sidetone support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds sidetone support via one of the 3 RX Mix paths
using IIR1 and IIR2.
IIR1 can be feed by any Decimators or RX paths, and IIRx can also be
looped back to RX mixers to provide sidetone functionality.
Two IIR filters are used for Side tone equalization and each filter
is 5 stage.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/msm8916-wcd-digital.c | 353 +++++++++++++++++++++++++
 1 file changed, 353 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index a63961861e55..ec00893ca92a 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -187,6 +187,43 @@
 #define MSM8916_WCD_DIGITAL_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
 				     SNDRV_PCM_FMTBIT_S32_LE)
 
+/* Codec supports 2 IIR filters */
+enum {
+	IIR1 = 0,
+	IIR2,
+	IIR_MAX,
+};
+
+/* Codec supports 5 bands */
+enum {
+	BAND1 = 0,
+	BAND2,
+	BAND3,
+	BAND4,
+	BAND5,
+	BAND_MAX,
+};
+
+#define WCD_IIR_FILTER_SIZE	(sizeof(u32)*BAND_MAX)
+
+#define WCD_IIR_FILTER_CTL(xname, iidx, bidx) \
+{       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = wcd_iir_filter_info, \
+	.get = msm8x16_wcd_get_iir_band_audio_mixer, \
+	.put = msm8x16_wcd_put_iir_band_audio_mixer, \
+	.private_value = (unsigned long)&(struct wcd_iir_filter_ctl) { \
+		.iir_idx = iidx, \
+		.band_idx = bidx, \
+		.bytes_ext = {.max = WCD_IIR_FILTER_SIZE, }, \
+	} \
+}
+
+struct wcd_iir_filter_ctl {
+	unsigned int iir_idx;
+	unsigned int band_idx;
+	struct soc_bytes_ext bytes_ext;
+};
+
 struct msm8916_wcd_digital_priv {
 	struct clk *ahbclk, *mclk;
 };
@@ -298,6 +335,200 @@ static SOC_ENUM_SINGLE_DECL(rx2_dcb_cutoff_enum, LPASS_CDC_RX2_B4_CTL, 0,
 static SOC_ENUM_SINGLE_DECL(rx3_dcb_cutoff_enum, LPASS_CDC_RX3_B4_CTL, 0,
 			    dc_blocker_cutoff_text);
 
+static int msm8x16_wcd_codec_set_iir_gain(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+			snd_soc_dapm_to_component(w->dapm);
+	int value = 0, reg = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		if (w->shift == 0)
+			reg = LPASS_CDC_IIR1_GAIN_B1_CTL;
+		else if (w->shift == 1)
+			reg = LPASS_CDC_IIR2_GAIN_B1_CTL;
+		value = snd_soc_component_read32(component, reg);
+		snd_soc_component_write(component, reg, value);
+		break;
+	default:
+		pr_err("%s: event = %d not expected\n", __func__, event);
+	}
+	return 0;
+}
+
+static int msm8x16_wcd_get_iir_enable_audio_mixer(
+					struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct soc_mixer_control *mixer =
+			(struct soc_mixer_control *)kcontrol->private_value;
+	int iir_idx = mixer->reg;
+	int band_idx = mixer->shift;
+
+	ucontrol->value.integer.value[0] =
+		(snd_soc_component_read32(component,
+			    (LPASS_CDC_IIR1_CTL + 64 * iir_idx)) &
+		(1 << band_idx)) != 0;
+
+	return 0;
+}
+
+static int msm8x16_wcd_put_iir_enable_audio_mixer(
+					struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct soc_mixer_control *mixer =
+			(struct soc_mixer_control *)kcontrol->private_value;
+	int iir_idx = mixer->reg;
+	int band_idx = mixer->shift;
+	int value = ucontrol->value.integer.value[0];
+
+	/* Mask first 5 bits, 6-8 are reserved */
+	snd_soc_component_update_bits(component,
+		(LPASS_CDC_IIR1_CTL + 64 * iir_idx),
+			    (1 << band_idx), (value << band_idx));
+
+	return 0;
+}
+
+static uint32_t get_iir_band_coeff(struct snd_soc_component *component,
+				   int iir_idx, int band_idx,
+				   int coeff_idx)
+{
+	uint32_t value = 0;
+
+	/* Address does not automatically update if reading */
+	snd_soc_component_write(component,
+		(LPASS_CDC_IIR1_COEF_B1_CTL + 64 * iir_idx),
+		((band_idx * BAND_MAX + coeff_idx)
+		* sizeof(uint32_t)) & 0x7F);
+
+	value |= snd_soc_component_read32(component,
+		(LPASS_CDC_IIR1_COEF_B2_CTL + 64 * iir_idx));
+
+	snd_soc_component_write(component,
+		(LPASS_CDC_IIR1_COEF_B1_CTL + 64 * iir_idx),
+		((band_idx * BAND_MAX + coeff_idx)
+		* sizeof(uint32_t) + 1) & 0x7F);
+
+	value |= (snd_soc_component_read32(component,
+		(LPASS_CDC_IIR1_COEF_B2_CTL + 64 * iir_idx)) << 8);
+
+	snd_soc_component_write(component,
+		(LPASS_CDC_IIR1_COEF_B1_CTL + 64 * iir_idx),
+		((band_idx * BAND_MAX + coeff_idx)
+		* sizeof(uint32_t) + 2) & 0x7F);
+
+	value |= (snd_soc_component_read32(component,
+		(LPASS_CDC_IIR1_COEF_B2_CTL + 64 * iir_idx)) << 16);
+
+	snd_soc_component_write(component,
+		(LPASS_CDC_IIR1_COEF_B1_CTL + 64 * iir_idx),
+		((band_idx * BAND_MAX + coeff_idx)
+		* sizeof(uint32_t) + 3) & 0x7F);
+
+	/* Mask bits top 2 bits since they are reserved */
+	value |= ((snd_soc_component_read32(component,
+		 (LPASS_CDC_IIR1_COEF_B2_CTL + 64 * iir_idx)) & 0x3f) << 24);
+	return value;
+
+}
+
+static int msm8x16_wcd_get_iir_band_audio_mixer(
+					struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct wcd_iir_filter_ctl *ctl =
+			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
+	struct soc_bytes_ext *params = &ctl->bytes_ext;
+	int iir_idx = ctl->iir_idx;
+	int band_idx = ctl->band_idx;
+	u32 coeff[BAND_MAX];
+
+	coeff[0] = get_iir_band_coeff(component, iir_idx, band_idx, 0);
+	coeff[1] = get_iir_band_coeff(component, iir_idx, band_idx, 1);
+	coeff[2] = get_iir_band_coeff(component, iir_idx, band_idx, 2);
+	coeff[3] = get_iir_band_coeff(component, iir_idx, band_idx, 3);
+	coeff[4] = get_iir_band_coeff(component, iir_idx, band_idx, 4);
+
+	memcpy(ucontrol->value.bytes.data, &coeff[0], params->max);
+
+	return 0;
+}
+
+static void set_iir_band_coeff(struct snd_soc_component *component,
+				int iir_idx, int band_idx,
+				uint32_t value)
+{
+	snd_soc_component_write(component,
+		(LPASS_CDC_IIR1_COEF_B2_CTL + 64 * iir_idx),
+		(value & 0xFF));
+
+	snd_soc_component_write(component,
+		(LPASS_CDC_IIR1_COEF_B2_CTL + 64 * iir_idx),
+		(value >> 8) & 0xFF);
+
+	snd_soc_component_write(component,
+		(LPASS_CDC_IIR1_COEF_B2_CTL + 64 * iir_idx),
+		(value >> 16) & 0xFF);
+
+	/* Mask top 2 bits, 7-8 are reserved */
+	snd_soc_component_write(component,
+		(LPASS_CDC_IIR1_COEF_B2_CTL + 64 * iir_idx),
+		(value >> 24) & 0x3F);
+}
+
+static int msm8x16_wcd_put_iir_band_audio_mixer(
+					struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct wcd_iir_filter_ctl *ctl =
+			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
+	struct soc_bytes_ext *params = &ctl->bytes_ext;
+	int iir_idx = ctl->iir_idx;
+	int band_idx = ctl->band_idx;
+	u32 coeff[BAND_MAX];
+
+	memcpy(&coeff[0], ucontrol->value.bytes.data, params->max);
+
+	/* Mask top bit it is reserved */
+	/* Updates addr automatically for each B2 write */
+	snd_soc_component_write(component,
+		(LPASS_CDC_IIR1_COEF_B1_CTL + 64 * iir_idx),
+		(band_idx * BAND_MAX * sizeof(uint32_t)) & 0x7F);
+
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[0]);
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[1]);
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[2]);
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[3]);
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[4]);
+
+	return 0;
+}
+
+static int wcd_iir_filter_info(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_info *ucontrol)
+{
+	struct wcd_iir_filter_ctl *ctl =
+		(struct wcd_iir_filter_ctl *)kcontrol->private_value;
+	struct soc_bytes_ext *params = &ctl->bytes_ext;
+
+	ucontrol->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	ucontrol->count = params->max;
+
+	return 0;
+}
+
 static const struct snd_kcontrol_new msm8916_wcd_digital_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("RX1 Digital Volume", LPASS_CDC_RX1_VOL_CTL_B2_CTL,
 			  -128, 127, digital_gain),
@@ -322,6 +553,73 @@ static const struct snd_kcontrol_new msm8916_wcd_digital_snd_controls[] = {
 	SOC_SINGLE("RX1 Mute Switch", LPASS_CDC_RX1_B6_CTL, 0, 1, 0),
 	SOC_SINGLE("RX2 Mute Switch", LPASS_CDC_RX2_B6_CTL, 0, 1, 0),
 	SOC_SINGLE("RX3 Mute Switch", LPASS_CDC_RX3_B6_CTL, 0, 1, 0),
+
+	SOC_SINGLE_EXT("IIR1 Enable Band1", IIR1, BAND1, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	SOC_SINGLE_EXT("IIR1 Enable Band2", IIR1, BAND2, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	SOC_SINGLE_EXT("IIR1 Enable Band3", IIR1, BAND3, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	SOC_SINGLE_EXT("IIR1 Enable Band4", IIR1, BAND4, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	SOC_SINGLE_EXT("IIR1 Enable Band5", IIR1, BAND5, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	SOC_SINGLE_EXT("IIR2 Enable Band1", IIR2, BAND1, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	SOC_SINGLE_EXT("IIR2 Enable Band2", IIR2, BAND2, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	SOC_SINGLE_EXT("IIR2 Enable Band3", IIR2, BAND3, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	SOC_SINGLE_EXT("IIR2 Enable Band4", IIR2, BAND4, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	SOC_SINGLE_EXT("IIR2 Enable Band5", IIR2, BAND5, 1, 0,
+	msm8x16_wcd_get_iir_enable_audio_mixer,
+	msm8x16_wcd_put_iir_enable_audio_mixer),
+	WCD_IIR_FILTER_CTL("IIR1 Band1", IIR1, BAND1),
+	WCD_IIR_FILTER_CTL("IIR1 Band2", IIR1, BAND2),
+	WCD_IIR_FILTER_CTL("IIR1 Band3", IIR1, BAND3),
+	WCD_IIR_FILTER_CTL("IIR1 Band4", IIR1, BAND4),
+	WCD_IIR_FILTER_CTL("IIR1 Band5", IIR1, BAND5),
+	WCD_IIR_FILTER_CTL("IIR2 Band1", IIR2, BAND1),
+	WCD_IIR_FILTER_CTL("IIR2 Band2", IIR2, BAND2),
+	WCD_IIR_FILTER_CTL("IIR2 Band3", IIR2, BAND3),
+	WCD_IIR_FILTER_CTL("IIR2 Band4", IIR2, BAND4),
+	WCD_IIR_FILTER_CTL("IIR2 Band5", IIR2, BAND5),
+
+	SOC_SINGLE_SX_TLV("IIR1 INP1 Volume",
+			  LPASS_CDC_IIR1_GAIN_B1_CTL,
+			0,  -84, 40, digital_gain),
+	SOC_SINGLE_SX_TLV("IIR1 INP2 Volume",
+			  LPASS_CDC_IIR1_GAIN_B2_CTL,
+			0,  -84, 40, digital_gain),
+	SOC_SINGLE_SX_TLV("IIR1 INP3 Volume",
+			  LPASS_CDC_IIR1_GAIN_B3_CTL,
+			0,  -84, 40, digital_gain),
+	SOC_SINGLE_SX_TLV("IIR1 INP4 Volume",
+			  LPASS_CDC_IIR1_GAIN_B4_CTL,
+			0,  -84,	40, digital_gain),
+	SOC_SINGLE_SX_TLV("IIR2 INP1 Volume",
+			  LPASS_CDC_IIR2_GAIN_B1_CTL,
+			0,  -84, 40, digital_gain),
+	SOC_SINGLE_SX_TLV("IIR2 INP2 Volume",
+			  LPASS_CDC_IIR2_GAIN_B2_CTL,
+			0,  -84, 40, digital_gain),
+	SOC_SINGLE_SX_TLV("IIR2 INP3 Volume",
+			  LPASS_CDC_IIR2_GAIN_B3_CTL,
+			0,  -84, 40, digital_gain),
+	SOC_SINGLE_SX_TLV("IIR2 INP4 Volume",
+			  LPASS_CDC_IIR2_GAIN_B4_CTL,
+			0,  -84, 40, digital_gain),
+
 };
 
 static int msm8916_wcd_digital_enable_interpolator(
@@ -448,6 +746,24 @@ static int msm8916_wcd_digital_enable_dmic(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static const char * const iir_inp1_text[] = {
+	"ZERO", "DEC1", "DEC2", "RX1", "RX2", "RX3"
+};
+
+static const struct soc_enum iir1_inp1_mux_enum =
+	SOC_ENUM_SINGLE(LPASS_CDC_CONN_EQ1_B1_CTL,
+		0, 6, iir_inp1_text);
+
+static const struct soc_enum iir2_inp1_mux_enum =
+	SOC_ENUM_SINGLE(LPASS_CDC_CONN_EQ2_B1_CTL,
+		0, 6, iir_inp1_text);
+
+static const struct snd_kcontrol_new iir1_inp1_mux =
+	SOC_DAPM_ENUM("IIR1 INP1 Mux", iir1_inp1_mux_enum);
+
+static const struct snd_kcontrol_new iir2_inp1_mux =
+	SOC_DAPM_ENUM("IIR2 INP1 Mux", iir2_inp1_mux_enum);
+
 static const struct snd_soc_dapm_widget msm8916_wcd_digital_dapm_widgets[] = {
 	/*RX stuff */
 	SND_SOC_DAPM_AIF_IN("I2S RX1", NULL, 0, SND_SOC_NOPM, 0, 0),
@@ -534,6 +850,17 @@ static const struct snd_soc_dapm_widget msm8916_wcd_digital_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Digital Mic1", NULL),
 	SND_SOC_DAPM_MIC("Digital Mic2", NULL),
 
+
+
+	/* Sidetone */
+	SND_SOC_DAPM_MUX("IIR1 INP1 MUX", SND_SOC_NOPM, 0, 0, &iir1_inp1_mux),
+	SND_SOC_DAPM_PGA_E("IIR1", LPASS_CDC_CLK_SD_CTL, 0, 0, NULL, 0,
+		msm8x16_wcd_codec_set_iir_gain, SND_SOC_DAPM_POST_PMU),
+
+	SND_SOC_DAPM_MUX("IIR2 INP1 MUX", SND_SOC_NOPM, 0, 0, &iir2_inp1_mux),
+	SND_SOC_DAPM_PGA_E("IIR2", LPASS_CDC_CLK_SD_CTL, 1, 0, NULL, 0,
+		msm8x16_wcd_codec_set_iir_gain, SND_SOC_DAPM_POST_PMU),
+
 };
 
 static int msm8916_wcd_digital_get_clks(struct platform_device *pdev,
@@ -708,10 +1035,14 @@ static const struct snd_soc_dapm_route msm8916_wcd_digital_audio_map[] = {
 	{"RX1 MIX1 INP1", "RX1", "I2S RX1"},
 	{"RX1 MIX1 INP1", "RX2", "I2S RX2"},
 	{"RX1 MIX1 INP1", "RX3", "I2S RX3"},
+	{"RX1 MIX1 INP1", "IIR1", "IIR1"},
+	{"RX1 MIX1 INP1", "IIR2", "IIR2"},
 
 	{"RX1 MIX1 INP2", "RX1", "I2S RX1"},
 	{"RX1 MIX1 INP2", "RX2", "I2S RX2"},
 	{"RX1 MIX1 INP2", "RX3", "I2S RX3"},
+	{"RX1 MIX1 INP2", "IIR1", "IIR1"},
+	{"RX1 MIX1 INP2", "IIR2", "IIR2"},
 
 	{"RX1 MIX1 INP3", "RX1", "I2S RX1"},
 	{"RX1 MIX1 INP3", "RX2", "I2S RX2"},
@@ -725,13 +1056,18 @@ static const struct snd_soc_dapm_route msm8916_wcd_digital_audio_map[] = {
 	{"RX2 MIX1", NULL, "RX2 MIX1 INP2"},
 	{"RX2 MIX1", NULL, "RX2 MIX1 INP3"},
 
+
 	{"RX2 MIX1 INP1", "RX1", "I2S RX1"},
 	{"RX2 MIX1 INP1", "RX2", "I2S RX2"},
 	{"RX2 MIX1 INP1", "RX3", "I2S RX3"},
+	{"RX2 MIX1 INP1", "IIR1", "IIR1"},
+	{"RX2 MIX1 INP1", "IIR2", "IIR2"},
 
 	{"RX2 MIX1 INP2", "RX1", "I2S RX1"},
 	{"RX2 MIX1 INP2", "RX2", "I2S RX2"},
 	{"RX2 MIX1 INP2", "RX3", "I2S RX3"},
+	{"RX2 MIX1 INP1", "IIR1", "IIR1"},
+	{"RX2 MIX1 INP1", "IIR2", "IIR2"},
 
 	{"RX2 MIX1 INP3", "RX1", "I2S RX1"},
 	{"RX2 MIX1 INP3", "RX2", "I2S RX2"},
@@ -748,10 +1084,27 @@ static const struct snd_soc_dapm_route msm8916_wcd_digital_audio_map[] = {
 	{"RX3 MIX1 INP1", "RX1", "I2S RX1"},
 	{"RX3 MIX1 INP1", "RX2", "I2S RX2"},
 	{"RX3 MIX1 INP1", "RX3", "I2S RX3"},
+	{"RX3 MIX1 INP1", "IIR1", "IIR1"},
+	{"RX3 MIX1 INP1", "IIR2", "IIR2"},
 
 	{"RX3 MIX1 INP2", "RX1", "I2S RX1"},
 	{"RX3 MIX1 INP2", "RX2", "I2S RX2"},
 	{"RX3 MIX1 INP2", "RX3", "I2S RX3"},
+	{"RX3 MIX1 INP2", "IIR1", "IIR1"},
+	{"RX3 MIX1 INP2", "IIR2", "IIR2"},
+
+	{"RX1 MIX2 INP1", "IIR1", "IIR1"},
+	{"RX2 MIX2 INP1", "IIR1", "IIR1"},
+	{"RX1 MIX2 INP1", "IIR2", "IIR2"},
+	{"RX2 MIX2 INP1", "IIR2", "IIR2"},
+
+	{"IIR1", NULL, "IIR1 INP1 MUX"},
+	{"IIR1 INP1 MUX", "DEC1", "DEC1 MUX"},
+	{"IIR1 INP1 MUX", "DEC2", "DEC2 MUX"},
+
+	{"IIR2", NULL, "IIR2 INP1 MUX"},
+	{"IIR2 INP1 MUX", "DEC1", "DEC1 MUX"},
+	{"IIR2 INP1 MUX", "DEC2", "DEC2 MUX"},
 
 	{"RX3 MIX1 INP3", "RX1", "I2S RX1"},
 	{"RX3 MIX1 INP3", "RX2", "I2S RX2"},
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
