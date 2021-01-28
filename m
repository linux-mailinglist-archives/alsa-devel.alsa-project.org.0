Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 377CC3077CE
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 15:22:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBD5D1674;
	Thu, 28 Jan 2021 15:21:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBD5D1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611843740;
	bh=RXstwiRd4E/N7n1zcKO7YbWLpnLNxk8AkDaETvtln98=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKsy1s7/Lf8hxOhszW4WKBd5MtcmQ9J1T9PW++1JKcn8UXpWUSbOywHjLN5Uf6y0l
	 YOH8Kk4+6inANQbhf3pXzqx2lfCXGw6s5mpoqjDcafg3HuWd+DTjsuvMRPUoVf+b0X
	 BdEm/OTdvIAOFaJxlfZhUDSQdO6T2JYG4Qvn1VSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AA30F801ED;
	Thu, 28 Jan 2021 15:20:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08C8AF804CC; Thu, 28 Jan 2021 15:20:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 055E4F80158
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 15:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 055E4F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pi/TSuiZ"
Received: by mail-wr1-x42c.google.com with SMTP id z6so5523001wrq.10
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 06:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yOIp9QtjeyWXIAt+jtQ8VX7A/Az7txNIlXuQGUmt+5s=;
 b=pi/TSuiZReugFt8U4lIlNELRG42MYFzCorpC2efG7Y2oJrlUl3UpKci8mEbFye4vFx
 z6YYdfiX9BSKGRGTw0BiQmbb7LS32cjiD+uDYi3bXfp8F0SgTbxujZaQFWcJoIwzlfZL
 95QCA52CQ7ySrd4OOEk0x+juUIQQRhSvAy1/p7cmtcBpGY1hayXsBSsYXMnRJq9hTku9
 fa5MVw3J8zEwF6RuUeUboGkmvTFW5SrHYVpo8IoSnfiRr3+DPC9ocFM3MYxgenMUYzRI
 yTyf0BZwOuPUg11YHHOcqfTohkrjKf2FFnd0qMSn0HWWRBSEdrS1t1JXS45qKAsI1ABF
 4PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yOIp9QtjeyWXIAt+jtQ8VX7A/Az7txNIlXuQGUmt+5s=;
 b=CPgl0iF/gJbcjF4GNsCD1G02wlKsnuGKmz448761Vm231oLWhQqQIN/hbx0kMcW/Ah
 vDk+y6K6KOUsiTj+PGbr/OohijKkpMF59UG7Z1KBoEVwb8ih0aUJIyZIO87FF6J04r1X
 PaS0ADHz1r2tR/TST1+SekTmNI6sXB+K7pkPSyPmGD2lbZCH0z/jAS7KYk1rmDS2YNs6
 H7GgVzx/ioi0cI5GN0poWTLqNwBJzB5JGMIhWAr2cfU+lDM+8chpdnmHOkD30eAkGdAl
 kAuX/jjNwGMzw+h6sB8Usj1H051NMo4XVAslS86RPEpX8PBypbjYKDK0WFBvk9LPQa0W
 v8lg==
X-Gm-Message-State: AOAM532vU34UfVA9Wakuq0Tc4PR4QeOerQ/SMPs7eXTnjUtR1didmafo
 hW0A75mSx08ZEFKuDO+7kgmiew==
X-Google-Smtp-Source: ABdhPJxoMV5EK8PVwI/3b9do/YRCsA3rSLU9CwuTDLuTM/C/g+oSCOSr+rcc3xAN2qQ5ptDcLZeaYA==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr16736038wru.364.1611843600014; 
 Thu, 28 Jan 2021 06:20:00 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id d9sm7257096wrq.74.2021.01.28.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:19:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/7] ASoC: codec: lpass-rx-macro: add iir widgets
Date: Thu, 28 Jan 2021 14:19:26 +0000
Message-Id: <20210128141929.26573-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210128141929.26573-1-srinivas.kandagatla@linaro.org>
References: <20210128141929.26573-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This patch adds irr widgets and mixers on this codec

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 264 ++++++++++++++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 5ceb81e8f1d4..439af551e3a9 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -528,6 +528,38 @@ enum {
 	INTERP_MIX_PATH,
 };
 
+/* Codec supports 2 IIR filters */
+enum {
+	IIR0 = 0,
+	IIR1,
+	IIR_MAX,
+};
+
+/* Each IIR has 5 Filter Stages */
+enum {
+	BAND1 = 0,
+	BAND2,
+	BAND3,
+	BAND4,
+	BAND5,
+	BAND_MAX,
+};
+
+#define RX_MACRO_IIR_FILTER_SIZE	(sizeof(u32) * BAND_MAX)
+
+#define RX_MACRO_IIR_FILTER_CTL(xname, iidx, bidx) \
+{ \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = rx_macro_iir_filter_info, \
+	.get = rx_macro_get_iir_band_audio_mixer, \
+	.put = rx_macro_put_iir_band_audio_mixer, \
+	.private_value = (unsigned long)&(struct wcd_iir_filter_ctl) { \
+		.iir_idx = iidx, \
+		.band_idx = bidx, \
+		.bytes_ext = {.max = RX_MACRO_IIR_FILTER_SIZE, }, \
+	} \
+}
+
 struct interp_sample_rate {
 	int sample_rate;
 	int rate_val;
@@ -586,6 +618,12 @@ struct rx_macro {
 };
 #define to_rx_macro(_hw) container_of(_hw, struct rx_macro, hw)
 
+struct wcd_iir_filter_ctl {
+	unsigned int iir_idx;
+	unsigned int band_idx;
+	struct soc_bytes_ext bytes_ext;
+};
+
 static struct snd_soc_dai_driver rx_macro_dai[];
 static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 
@@ -2605,6 +2643,166 @@ static int rx_macro_enable_rx_path_clk(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int rx_macro_set_iir_gain(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU: /* fall through */
+	case SND_SOC_DAPM_PRE_PMD:
+		if (strnstr(w->name, "IIR0", sizeof("IIR0"))) {
+			snd_soc_component_write(component,
+				CDC_RX_SIDETONE_IIR0_IIR_GAIN_B1_CTL,
+			snd_soc_component_read(component,
+				CDC_RX_SIDETONE_IIR0_IIR_GAIN_B1_CTL));
+			snd_soc_component_write(component,
+				CDC_RX_SIDETONE_IIR0_IIR_GAIN_B2_CTL,
+			snd_soc_component_read(component,
+				CDC_RX_SIDETONE_IIR0_IIR_GAIN_B2_CTL));
+			snd_soc_component_write(component,
+				CDC_RX_SIDETONE_IIR0_IIR_GAIN_B3_CTL,
+			snd_soc_component_read(component,
+				CDC_RX_SIDETONE_IIR0_IIR_GAIN_B3_CTL));
+			snd_soc_component_write(component,
+				CDC_RX_SIDETONE_IIR0_IIR_GAIN_B4_CTL,
+			snd_soc_component_read(component,
+				CDC_RX_SIDETONE_IIR0_IIR_GAIN_B4_CTL));
+		} else {
+			snd_soc_component_write(component,
+				CDC_RX_SIDETONE_IIR1_IIR_GAIN_B1_CTL,
+			snd_soc_component_read(component,
+				CDC_RX_SIDETONE_IIR1_IIR_GAIN_B1_CTL));
+			snd_soc_component_write(component,
+				CDC_RX_SIDETONE_IIR1_IIR_GAIN_B2_CTL,
+			snd_soc_component_read(component,
+				CDC_RX_SIDETONE_IIR1_IIR_GAIN_B2_CTL));
+			snd_soc_component_write(component,
+				CDC_RX_SIDETONE_IIR1_IIR_GAIN_B3_CTL,
+			snd_soc_component_read(component,
+				CDC_RX_SIDETONE_IIR1_IIR_GAIN_B3_CTL));
+			snd_soc_component_write(component,
+				CDC_RX_SIDETONE_IIR1_IIR_GAIN_B4_CTL,
+			snd_soc_component_read(component,
+				CDC_RX_SIDETONE_IIR1_IIR_GAIN_B4_CTL));
+		}
+		break;
+	}
+	return 0;
+}
+
+static uint32_t get_iir_band_coeff(struct snd_soc_component *component,
+				   int iir_idx, int band_idx, int coeff_idx)
+{
+	u32 value;
+	int reg, b2_reg;
+
+	/* Address does not automatically update if reading */
+	reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B1_CTL + 16 * iir_idx;
+	b2_reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B2_CTL + 16 * iir_idx;
+
+	snd_soc_component_write(component, reg,
+				((band_idx * BAND_MAX + coeff_idx) *
+				 sizeof(uint32_t)) & 0x7F);
+
+	value = snd_soc_component_read(component, b2_reg);
+	snd_soc_component_write(component, reg,
+				((band_idx * BAND_MAX + coeff_idx)
+				 * sizeof(uint32_t) + 1) & 0x7F);
+
+	value |= (snd_soc_component_read(component, b2_reg) << 8);
+	snd_soc_component_write(component, reg,
+				((band_idx * BAND_MAX + coeff_idx)
+				 * sizeof(uint32_t) + 2) & 0x7F);
+
+	value |= (snd_soc_component_read(component, b2_reg) << 16);
+	snd_soc_component_write(component, reg,
+		((band_idx * BAND_MAX + coeff_idx)
+		* sizeof(uint32_t) + 3) & 0x7F);
+
+	/* Mask bits top 2 bits since they are reserved */
+	value |= (snd_soc_component_read(component, b2_reg) << 24);
+	return value;
+}
+
+static void set_iir_band_coeff(struct snd_soc_component *component,
+			       int iir_idx, int band_idx, uint32_t value)
+{
+	int reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B2_CTL + 16 * iir_idx;
+
+	snd_soc_component_write(component, reg, (value & 0xFF));
+	snd_soc_component_write(component, reg, (value >> 8) & 0xFF);
+	snd_soc_component_write(component, reg, (value >> 16) & 0xFF);
+	/* Mask top 2 bits, 7-8 are reserved */
+	snd_soc_component_write(component, reg, (value >> 24) & 0x3F);
+}
+
+static int rx_macro_put_iir_band_audio_mixer(
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
+	int reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B1_CTL + 16 * iir_idx;
+
+	memcpy(&coeff[0], ucontrol->value.bytes.data, params->max);
+
+	/* Mask top bit it is reserved */
+	/* Updates addr automatically for each B2 write */
+	snd_soc_component_write(component, reg, (band_idx * BAND_MAX *
+						 sizeof(uint32_t)) & 0x7F);
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
+static int rx_macro_get_iir_band_audio_mixer(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
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
+static int rx_macro_iir_filter_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *ucontrol)
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
 static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume",
 			  CDC_RX_RX0_RX_VOL_CTL,
@@ -2642,6 +2840,65 @@ static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
 	SOC_SINGLE_EXT("AUX_HPF Enable", SND_SOC_NOPM, 0, 1, 0,
 			rx_macro_aux_hpf_mode_get,
 			rx_macro_aux_hpf_mode_put),
+
+	SOC_SINGLE_S8_TLV("IIR0 INP0 Volume",
+		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B1_CTL, -84, 40,
+		digital_gain),
+	SOC_SINGLE_S8_TLV("IIR0 INP1 Volume",
+		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B2_CTL, -84, 40,
+		digital_gain),
+	SOC_SINGLE_S8_TLV("IIR0 INP2 Volume",
+		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B3_CTL, -84, 40,
+		digital_gain),
+	SOC_SINGLE_S8_TLV("IIR0 INP3 Volume",
+		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B4_CTL, -84, 40,
+		digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP0 Volume",
+		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B1_CTL, -84, 40,
+		digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP1 Volume",
+		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B2_CTL, -84, 40,
+		digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP2 Volume",
+		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B3_CTL, -84, 40,
+		digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP3 Volume",
+		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B4_CTL, -84, 40,
+		digital_gain),
+
+	SOC_SINGLE("IIR1 Band1 Switch", CDC_RX_SIDETONE_IIR0_IIR_CTL,
+		   0, 1, 0),
+	SOC_SINGLE("IIR1 Band2 Switch", CDC_RX_SIDETONE_IIR0_IIR_CTL,
+		   1, 1, 0),
+	SOC_SINGLE("IIR1 Band3 Switch", CDC_RX_SIDETONE_IIR0_IIR_CTL,
+		   2, 1, 0),
+	SOC_SINGLE("IIR1 Band4 Switch", CDC_RX_SIDETONE_IIR0_IIR_CTL,
+		   3, 1, 0),
+	SOC_SINGLE("IIR1 Band5 Switch", CDC_RX_SIDETONE_IIR0_IIR_CTL,
+		   4, 1, 0),
+	SOC_SINGLE("IIR2 Band1 Switch", CDC_RX_SIDETONE_IIR1_IIR_CTL,
+		   0, 1, 0),
+	SOC_SINGLE("IIR2 Band2 Switch", CDC_RX_SIDETONE_IIR1_IIR_CTL,
+		   1, 1, 0),
+	SOC_SINGLE("IIR2 Band3 Switch", CDC_RX_SIDETONE_IIR1_IIR_CTL,
+		   2, 1, 0),
+	SOC_SINGLE("IIR2 Band4 Switch", CDC_RX_SIDETONE_IIR1_IIR_CTL,
+		   3, 1, 0),
+	SOC_SINGLE("IIR2 Band5 Switch", CDC_RX_SIDETONE_IIR1_IIR_CTL,
+		   4, 1, 0),
+
+	RX_MACRO_IIR_FILTER_CTL("IIR0 Band1", IIR0, BAND1),
+	RX_MACRO_IIR_FILTER_CTL("IIR0 Band2", IIR0, BAND2),
+	RX_MACRO_IIR_FILTER_CTL("IIR0 Band3", IIR0, BAND3),
+	RX_MACRO_IIR_FILTER_CTL("IIR0 Band4", IIR0, BAND4),
+	RX_MACRO_IIR_FILTER_CTL("IIR0 Band5", IIR0, BAND5),
+
+	RX_MACRO_IIR_FILTER_CTL("IIR1 Band1", IIR1, BAND1),
+	RX_MACRO_IIR_FILTER_CTL("IIR1 Band2", IIR1, BAND2),
+	RX_MACRO_IIR_FILTER_CTL("IIR1 Band3", IIR1, BAND3),
+	RX_MACRO_IIR_FILTER_CTL("IIR1 Band4", IIR1, BAND4),
+	RX_MACRO_IIR_FILTER_CTL("IIR1 Band5", IIR1, BAND5),
+
 };
 
 static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
@@ -2737,6 +2994,13 @@ static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
 			   RX_MACRO_EC2_MUX, 0,
 			   &rx_mix_tx2_mux, rx_macro_enable_echo,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER_E("IIR0", CDC_RX_SIDETONE_IIR0_IIR_PATH_CTL,
+		4, 0, NULL, 0, rx_macro_set_iir_gain,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_MIXER_E("IIR1", CDC_RX_SIDETONE_IIR1_IIR_PATH_CTL,
+		4, 0, NULL, 0, rx_macro_set_iir_gain,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_MIXER("SRC0", CDC_RX_SIDETONE_SRC0_ST_SRC_PATH_CTL,
 		4, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER("SRC1", CDC_RX_SIDETONE_SRC1_ST_SRC_PATH_CTL,
-- 
2.21.0

