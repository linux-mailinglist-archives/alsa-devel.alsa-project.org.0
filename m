Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB85603AE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 16:59:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7375204;
	Wed, 29 Jun 2022 16:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7375204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656514794;
	bh=nVmGfHy1TCaw160nIx4cMAI8e9o55aZ9TkHeWTJnNN4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vUrmnf6Pg5gZqHc4sd5X5+P0lDq32jFzdxUieH5+TsNfAt0mIAcR6UsCkr9lwYPyP
	 IZNere0Zoq/LMDD0hNJd3A1pR5IqHdw9rQ/Lt7V27oa2vWz+JSoKuxIPVQsI5D4veT
	 OVIdqz1KKwHZbCaox3J7Qgki9KxjxDvbQDjKjzCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64D39F80245;
	Wed, 29 Jun 2022 16:58:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB4C1F8020D; Wed, 29 Jun 2022 16:58:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84B79F800F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 16:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B79F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="a3J+b4nA"
Received: by mail-wr1-x435.google.com with SMTP id n1so22862622wrg.12
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5UyvLuBvgrYEzCE9YSkLomBK7x/PPi/ptEpvqRlviQU=;
 b=a3J+b4nA61X/TSaYqLLAm5KvOVX8mQzc0qIqt0pUBruJUBBw/AkwOrWIOUilUTUS4D
 Nkm//tJEA4kZRIRlCJkcAJkldluyW76EiVcWyaqaBEipVjjn5JBN49TFVyySXx7BjZP9
 YBpPEs16hlwAQ/DBQ+E0fgs7PAF/NWgUilhafWcOBKRX+MwdAOq/U1qNH5DG1JnLXY2k
 8OeW1gX1jciTf4rBXnSHzEhOar93KAT4q3ahXyiv+ujdEOEdGx5cSYcz2pHPsS4JFhwS
 +IboV7C0StffjWAgBwWb9JtUQFgfC0dqqREwhUz5tgs2kQePWqXi7fJ7mAWV+5rqr2x7
 ZUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5UyvLuBvgrYEzCE9YSkLomBK7x/PPi/ptEpvqRlviQU=;
 b=PeB/vjtBFeEohQFyjzHE+kXk3X7VU0iwcCD8jhak9BN64NsGmhVLhAVErat4HZ6ph5
 y45IICyKM0uWeXeYaiXO1PNKpq2I4i+dloD7PEfDd9TY/rnWzYZ5xTNm2zKPvZzlrn8A
 hRvgkfpsJJ9SZYAUMifstX3FRHSjnP0XNdwr4GxIO6OustSxOsqHuO9c32Kk/Z7byRux
 EM5ujRxgjjRAzeLeOz1uD+V41cT34IZgBCrhdB8D29acpO0e9n3g8L/hbuoMNgJDrkoc
 msD9uRdbPt82z7s41RExOCUBpoYY9Mr5VY41L6I2M+lMdPgs4UF1jMzIeJparO/4NzaE
 G9hQ==
X-Gm-Message-State: AJIora+llhJuD3iCy6o1pysxLGiFYY38ldKQWyQitStbd0SITBvmDYma
 YC3BUNlh8rkTx2dyeHD45zN+0A==
X-Google-Smtp-Source: AGRyM1vDJgW2WRbZJfjbyEyTAd9xUMYJjZumGYB7PYyzSPy6wD9UCuGxt6LVJmcTcwK/n7Gtd8Jjwg==
X-Received: by 2002:adf:decc:0:b0:21b:8915:36da with SMTP id
 i12-20020adfdecc000000b0021b891536damr3566230wrn.261.1656514724378; 
 Wed, 29 Jun 2022 07:58:44 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 h3-20020adfe983000000b0021b97ffa2a9sm17503615wrm.46.2022.06.29.07.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 07:58:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2] ASoC: codecs: wsa883x: add control, dapm widgets and map
Date: Wed, 29 Jun 2022 15:58:31 +0100
Message-Id: <20220629145831.77868-1-srinivas.kandagatla@linaro.org>
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

Changes since v1:
	- update volume control suffix from Gain to Volume
	- use switch case to check dev mode
	- return 1 from dev_mode_put function if value is changed

 sound/soc/codecs/wsa883x.c | 200 +++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 856709ec017e..6c92fed1f03a 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -473,6 +473,19 @@ enum wsa_port_ids {
 	WSA883X_PORT_VISENSE,
 };
 
+static const char * const wsa_dev_mode_text[] = {
+	"speaker", "receiver", "ultrasound"
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

