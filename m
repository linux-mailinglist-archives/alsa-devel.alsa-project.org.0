Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C838C55FB59
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 11:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D2F61640;
	Wed, 29 Jun 2022 11:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D2F61640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656493749;
	bh=8bSK41QnSeSfY2mNoFyTLJjaOsrXSyQg0PWgdLAvxCE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MKFFFH5Qmx97zykUiQDY0QCHdznBGqqMEq/xeTFRod/94QgmOB04W/VvchcqHpgWX
	 G3OU3sGmLwI/qju3VH+wN3OmwDqX+Q9UZHXOw+vCEleM6WfPuLZVIfdUYgrfGLp0vw
	 u9OzTQ9yaAqZ6B3CO06unZ7uyazA2TSUgbF/fA2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D6DF80542;
	Wed, 29 Jun 2022 11:07:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2275FF8053C; Wed, 29 Jun 2022 11:07:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49163F804D9
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 11:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49163F804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eIulRGfs"
Received: by mail-wm1-x335.google.com with SMTP id l68so3893777wml.3
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvRHpEuM0xL4Ig3rSMG67s5DNIqr9l5dziqEAdf8e6A=;
 b=eIulRGfsJ6WI4mlYvMyeshFZzNh5ZkRuw8+FjtEGvSZqCfeuFikmx6zqVCBqDuhQuL
 D4yTPfb5E8K1ZgKjLzh3cWURUI678wg3l8IBeS3fNte3PNmjZdggJHOT0yP2KMCUTJef
 fMJazeRRHA7/Y017u5jwLZvL12BrqT0b9JsBCdo9ZfDkxXRowOPG0z++mKex9cJZvBC0
 LeVhuYtJxX1s1bg2vaTqZ0rtm3Z8kzMz+0c9SNVnV+p6i/khpKQnwia0x25xTLLqi8Be
 bINQq8MoEcdS0MTj86f+Q2xZucwbpy6qN57ry5Iy94bJUc198r8yHebjVbOS9IX7oSpH
 Nw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvRHpEuM0xL4Ig3rSMG67s5DNIqr9l5dziqEAdf8e6A=;
 b=An2oW+dUBu8cWF4ZDBDQid7NSkmVwb/fHjXymzRNhfj/NxBh4XThilM3gNdKJ6cTvq
 afM/fZskJn8Ai+RvCVGFFl8qagbq5/4OZfFypkMto1SYpq+NQG8H0voRkWpYSMZnwcpm
 H1iaev+Hs6C3qoZN1o8U3rAQ4Tuho1s4bbrN/15RzaVTFi6n/Df8QKeMJeJ/T/0KUeOB
 MgJgCC0A1YcAGYuQD8rRRlZttB9abmn1Z5e5EfZTcViOfLY0DcORm/dpdI7a3eu69cV4
 h4+fEywVjoh4L2R7J1U/iSTmvNiyOiWkafUwjYRbRbQqWR+dbwSkxYL0M7ojBIFSnkQg
 Ozug==
X-Gm-Message-State: AJIora95a/JaZFexc96jAuVuCTqmmGC44562cJGB354/Y6RjzWOsFdDY
 W5Ogyp1jWg39B5PZyapdB7mSMw==
X-Google-Smtp-Source: AGRyM1sqdcOO67Q4GH6190vNi8+fv2G1XQaln8hbux9UYguV5hoCwnddhrqxegcr9JjW9VuxxYfJbQ==
X-Received: by 2002:a7b:cf33:0:b0:3a0:5731:1055 with SMTP id
 m19-20020a7bcf33000000b003a057311055mr2425123wmg.140.1656493628061; 
 Wed, 29 Jun 2022 02:07:08 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a5d530c000000b002185d79dc7fsm15993341wrv.75.2022.06.29.02.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 02:07:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/4] ASoC: codecs: wsa883x: add control, dapm widgets and map
Date: Wed, 29 Jun 2022 10:06:43 +0100
Message-Id: <20220629090644.67982-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
References: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/wsa883x.c | 197 +++++++++++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 856709ec017e..800a4dd56b9e 100644
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
@@ -1066,6 +1079,95 @@ static struct sdw_slave_ops wsa883x_slave_ops = {
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
+	return 0;
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
@@ -1075,9 +1177,104 @@ static int wsa883x_codec_probe(struct snd_soc_component *comp)
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
+		if (wsa883x->dev_mode == RECEIVER) {
+			snd_soc_component_write_field(component, WSA883X_CDC_PATH_MODE,
+						      WSA883X_RXD_MODE_MASK,
+						      WSA883X_RXD_MODE_HIFI);
+			snd_soc_component_write_field(component, WSA883X_SPKR_PWM_CLK_CTL,
+						      WSA883X_SPKR_PWM_FREQ_SEL_MASK,
+						      WSA883X_SPKR_PWM_FREQ_F600KHZ);
+			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
+						       WSA883X_DRE_PROG_DELAY_MASK, 0x0);
+		} else if (wsa883x->dev_mode == SPEAKER) {
+			snd_soc_component_write_field(component, WSA883X_CDC_PATH_MODE,
+						      WSA883X_RXD_MODE_MASK,
+						      WSA883X_RXD_MODE_NORMAL);
+			snd_soc_component_write_field(component, WSA883X_SPKR_PWM_CLK_CTL,
+						      WSA883X_SPKR_PWM_FREQ_SEL_MASK,
+						      WSA883X_SPKR_PWM_FREQ_F300KHZ);
+			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
+						       WSA883X_DRE_PROG_DELAY_MASK, 0x9);
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
+	SOC_SINGLE_RANGE_TLV("PA Gain", WSA883X_DRE_CTL_1, 1,
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

