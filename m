Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E492561A6E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 14:37:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8499C950;
	Thu, 30 Jun 2022 14:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8499C950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656592668;
	bh=JOklFoDs8CQOJMLbtEFUHrmwX4xmH6Qc67v1fwIBoSc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MumB9yP0JSFYAfMfXAfj/1MTTqvRaDg2csvHOaYvRQnNTrfWTwENFECV0gNdCc2T7
	 AlZXxgrb9CdhHmH1TrDLCUldrr/PucH4NKx72aNKenQtPoxeQCTfmbyW76hl383vAH
	 WUFGuQvuFzjXlvg6dt3IjkvSdMTFGuoXKcHZwrDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE09F804DA;
	Thu, 30 Jun 2022 14:36:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1016F800F5; Thu, 30 Jun 2022 14:36:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23933F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23933F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MtYVdhYe"
Received: by mail-wm1-x32b.google.com with SMTP id
 o16-20020a05600c379000b003a02eaea815so2576984wmr.0
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 05:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nCSOjH1PuVz7ePXYoaMNJhxlzN8X+wOXCrrgiX6Y81E=;
 b=MtYVdhYetN7Bd35GsZbA5nac6CSxeMCF5wY5tOcm+FKgAcrWM8HUeoYSPDNgC9jWOG
 sLQkCl3wq8zXGkCIrlkeMTVAcRONm699mIRHlgnxyhdfezZKoKEdE7pNxtHWSL3VfbxP
 6ujrCzvHO7OQzEDHGXPd+43AD39cScbJtLftOCk6ATNjZnKIKefRhz3faWtD2Wyri544
 OuHoJJC08ZZnHtcHuRaNxrCzluvGQQ4HULdAPs/PR9wiFlQf2oh/UET4bwHsbjtyqIkf
 ulZouAgJvJ9XMCLkSZAJ8Jr/FcQBukc/CXiI8tTwu3BQEcFydgOiFLcb2AaxALjXW7zc
 huiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nCSOjH1PuVz7ePXYoaMNJhxlzN8X+wOXCrrgiX6Y81E=;
 b=SLACChfzx4TJdznFQWALzdK5pTV5XS2orV+cSerqsRdRJy9Vo7wWWeiIkeu7mdVDTJ
 2w9N2bEy5/QGQAEGM47siNTS8+bTIzJfkiS5dskqfMt1HPUHQ5kVrkQuaMKQHWORWYfN
 yteMR2pAEjiOn+roYcVHZ/0uywAb+aCZyH24ExFMfG1fek7NzuqhhYDuok8GagKvyJT2
 Bp8t8MJZ3Zcpzk/BJzd1qNfGLGXOfYtZ3BIpnzCTAnpfBXS3W3O5O91xI33bWZQN8uvc
 Obk0rCdIgOElbMcy98CVwwEjPLq3yivKmL/PSIFG0SfRlm++enquJ6MTPwlIUQArclNh
 bEhw==
X-Gm-Message-State: AJIora/AFfFMflXb4PmFITMWosHy7hPnZP4zgAa3+NMWflsPxm7Ku7xA
 WZZaaYGevghhyFATwAV/VsZsDA==
X-Google-Smtp-Source: AGRyM1vnV+qyq94vbIlHHTuN9r1agP/6Tx4U8p9Gh8Ce0+IUEaZtDJH/LazctjXg9922LcB67IFT6Q==
X-Received: by 2002:a7b:c155:0:b0:3a0:43a2:e1e1 with SMTP id
 z21-20020a7bc155000000b003a043a2e1e1mr12207682wmi.160.1656592599505; 
 Thu, 30 Jun 2022 05:36:39 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b0039ee391a024sm2477290wms.14.2022.06.30.05.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:36:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3] ASoC: codecs: wsa883x: add control, dapm widgets and map
Date: Thu, 30 Jun 2022 13:36:33 +0100
Message-Id: <20220630123633.8047-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
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

Add controls, dapm widgets along with route.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v2:
	- updated dev mode text entries to start with Capital letter

 sound/soc/codecs/wsa883x.c | 200 +++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 856709ec017e..e8f519e89213 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -473,6 +473,19 @@ enum wsa_port_ids {
 	WSA883X_PORT_VISENSE,
 };
 
+static const char * const wsa_dev_mode_text[] = {
+	"Speaker", "Receiver", "Ultrasound"
+};
+
+enum {
+	SPEAKER,
+	RECEIVER,
+	ULTRASOUND,
+};
+
+static const struct soc_enum wsa_dev_mode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa_dev_mode_text), wsa_dev_mode_text);
+
 /* 4 ports */
 static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 	{
@@ -1066,6 +1079,94 @@ static struct sdw_slave_ops wsa883x_slave_ops = {
 	.port_prep = wsa883x_port_prep,
 };
 
+static int wsa_dev_mode_get(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.enumerated.item[0] = wsa883x->dev_mode;
+
+	return 0;
+}
+
+static int wsa_dev_mode_put(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
+
+	if (wsa883x->dev_mode == ucontrol->value.enumerated.item[0])
+		return 0;
+
+	wsa883x->dev_mode = ucontrol->value.enumerated.item[0];
+
+	return 1;
+}
+
+static const DECLARE_TLV_DB_SCALE(pa_gain, -300, 150, -300);
+
+static int wsa883x_get_swr_port(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct wsa883x_priv *data = snd_soc_component_get_drvdata(comp);
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	int portidx = mixer->reg;
+
+	ucontrol->value.integer.value[0] = data->port_enable[portidx];
+
+	return 0;
+}
+
+static int wsa883x_set_swr_port(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct wsa883x_priv *data = snd_soc_component_get_drvdata(comp);
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	int portidx = mixer->reg;
+
+	if (ucontrol->value.integer.value[0]) {
+		if (data->port_enable[portidx])
+			return 0;
+
+		data->port_enable[portidx] = true;
+	} else {
+		if (!data->port_enable[portidx])
+			return 0;
+
+		data->port_enable[portidx] = false;
+	}
+
+	return 1;
+}
+
+static int wsa883x_get_comp_offset(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wsa883x->comp_offset;
+
+	return 0;
+}
+
+static int wsa883x_set_comp_offset(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
+
+	if (wsa883x->comp_offset == ucontrol->value.integer.value[0])
+		return 0;
+
+	wsa883x->comp_offset = ucontrol->value.integer.value[0];
+
+	return 1;
+}
+
 static int wsa883x_codec_probe(struct snd_soc_component *comp)
 {
 	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(comp);
@@ -1075,9 +1176,108 @@ static int wsa883x_codec_probe(struct snd_soc_component *comp)
 	return 0;
 }
 
+static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		switch (wsa883x->dev_mode) {
+		case RECEIVER:
+			snd_soc_component_write_field(component, WSA883X_CDC_PATH_MODE,
+						      WSA883X_RXD_MODE_MASK,
+						      WSA883X_RXD_MODE_HIFI);
+			snd_soc_component_write_field(component, WSA883X_SPKR_PWM_CLK_CTL,
+						      WSA883X_SPKR_PWM_FREQ_SEL_MASK,
+						      WSA883X_SPKR_PWM_FREQ_F600KHZ);
+			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
+						       WSA883X_DRE_PROG_DELAY_MASK, 0x0);
+			break;
+		case SPEAKER:
+			snd_soc_component_write_field(component, WSA883X_CDC_PATH_MODE,
+						      WSA883X_RXD_MODE_MASK,
+						      WSA883X_RXD_MODE_NORMAL);
+			snd_soc_component_write_field(component, WSA883X_SPKR_PWM_CLK_CTL,
+						      WSA883X_SPKR_PWM_FREQ_SEL_MASK,
+						      WSA883X_SPKR_PWM_FREQ_F300KHZ);
+			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
+						       WSA883X_DRE_PROG_DELAY_MASK, 0x9);
+		default:
+			break;
+		}
+
+		snd_soc_component_write_field(component, WSA883X_DRE_CTL_1,
+					      WSA883X_DRE_GAIN_EN_MASK,
+					      WSA883X_DRE_GAIN_FROM_CSR);
+		if (wsa883x->port_enable[WSA883X_PORT_COMP])
+			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
+						      WSA883X_DRE_OFFSET_MASK,
+						      wsa883x->comp_offset);
+		snd_soc_component_write_field(component, WSA883X_VBAT_ADC_FLT_CTL,
+					      WSA883X_VBAT_ADC_COEF_SEL_MASK,
+					      WSA883X_VBAT_ADC_COEF_F_1DIV16);
+		snd_soc_component_write_field(component, WSA883X_VBAT_ADC_FLT_CTL,
+					      WSA883X_VBAT_ADC_FLT_EN_MASK, 0x1);
+		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
+					      WSA883X_PDM_EN_MASK,
+					      WSA883X_PDM_ENABLE);
+		snd_soc_component_write_field(component, WSA883X_PA_FSM_CTL,
+					      WSA883X_GLOBAL_PA_EN_MASK,
+					      WSA883X_GLOBAL_PA_ENABLE);
+
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		snd_soc_component_write_field(component, WSA883X_VBAT_ADC_FLT_CTL,
+					      WSA883X_VBAT_ADC_FLT_EN_MASK, 0x0);
+		snd_soc_component_write_field(component, WSA883X_VBAT_ADC_FLT_CTL,
+					      WSA883X_VBAT_ADC_COEF_SEL_MASK,
+					      WSA883X_VBAT_ADC_COEF_F_1DIV2);
+		snd_soc_component_write_field(component, WSA883X_PA_FSM_CTL,
+					      WSA883X_GLOBAL_PA_EN_MASK, 0);
+		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
+					      WSA883X_PDM_EN_MASK, 0);
+		break;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget wsa883x_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("IN"),
+	SND_SOC_DAPM_SPK("SPKR", wsa883x_spkr_event),
+};
+
+static const struct snd_kcontrol_new wsa883x_snd_controls[] = {
+	SOC_SINGLE_RANGE_TLV("PA Volume", WSA883X_DRE_CTL_1, 1,
+			     0x0, 0x1f, 1, pa_gain),
+	SOC_ENUM_EXT("WSA MODE", wsa_dev_mode_enum,
+		     wsa_dev_mode_get, wsa_dev_mode_put),
+	SOC_SINGLE_EXT("COMP Offset", SND_SOC_NOPM, 0, 4, 0,
+		       wsa883x_get_comp_offset, wsa883x_set_comp_offset),
+	SOC_SINGLE_EXT("DAC Switch", WSA883X_PORT_DAC, 0, 1, 0,
+		       wsa883x_get_swr_port, wsa883x_set_swr_port),
+	SOC_SINGLE_EXT("COMP Switch", WSA883X_PORT_COMP, 0, 1, 0,
+		       wsa883x_get_swr_port, wsa883x_set_swr_port),
+	SOC_SINGLE_EXT("BOOST Switch", WSA883X_PORT_BOOST, 0, 1, 0,
+		       wsa883x_get_swr_port, wsa883x_set_swr_port),
+	SOC_SINGLE_EXT("VISENSE Switch", WSA883X_PORT_VISENSE, 0, 1, 0,
+		       wsa883x_get_swr_port, wsa883x_set_swr_port),
+};
+
+static const struct snd_soc_dapm_route wsa883x_audio_map[] = {
+	{"SPKR", NULL, "IN"},
+};
+
 static const struct snd_soc_component_driver wsa883x_component_drv = {
 	.name = "WSA883x",
 	.probe = wsa883x_codec_probe,
+	.controls = wsa883x_snd_controls,
+	.num_controls = ARRAY_SIZE(wsa883x_snd_controls),
+	.dapm_widgets = wsa883x_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wsa883x_dapm_widgets),
+	.dapm_routes = wsa883x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wsa883x_audio_map),
 };
 
 static int wsa883x_hw_params(struct snd_pcm_substream *substream,
-- 
2.25.1

