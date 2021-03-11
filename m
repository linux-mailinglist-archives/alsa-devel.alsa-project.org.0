Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73604337AFD
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 18:37:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1383D171E;
	Thu, 11 Mar 2021 18:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1383D171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615484263;
	bh=Meg1KtLjCxLfF1YxYflOJiLSR2x+R5yRkqeO9aY+r+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HTjhLaLSI60i/dhe5ipPCynAJJOzHy4WecQIdC72rVEc5E+BviLgd8invLRF3YS88
	 yWh9mm8Ggfbo5oQzIi3frxo+VBPDiayA/AHLQkyNKJmPtd0BrbxAKD8dHNU+r+6oR0
	 Y8lfwU6yQkMtr44nLf84ipIuqHmQzTDfff8U9KSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23730F8028B;
	Thu, 11 Mar 2021 18:35:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93E45F804AA; Thu, 11 Mar 2021 18:35:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C9D9F8028B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 18:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C9D9F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kruTzDcJ"
Received: by mail-wm1-x336.google.com with SMTP id o26so1891664wmc.5
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 09:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c56wh+XYzgrwizywPX2f670IYOe1tGWXrqAxe80Mqjg=;
 b=kruTzDcJBSgGk9kbQUqKUhongUY4qCQi3HuVcKKQH8663Dj5cthMFzZswR74qucMnA
 a+rGf4JEAYACGUvXBVIZ15Z2n0FRi5cDj0vFBnjeoMrpSTMx1Hsr2Edhs8Y6dwWKATuX
 9ZtwuemnIA5RXqdBn9LNKhS24jsVs2vha2hjhDz5pH/LUfzUGOazOelj0kgE5bEL0wUB
 MK/cfnyNHGYEmLbxTvyW/q3qih5Y81PjNMuuKzkNmiKXtcaNHYL6sZryes+rds/tYbmS
 1MaCKbUN6u1eUnO+60dJK2AMnGnO0aYL6INI1Lr697yS0IB/XupNOs0KaQ9PhUsTPSfK
 ZcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c56wh+XYzgrwizywPX2f670IYOe1tGWXrqAxe80Mqjg=;
 b=RgUcN68B6abahEvErMCtq1qq9GgpARiQqmld6AlirjoA5tfeqdMjznY85t0HsI8NSy
 v1XBLmxEfgcRv0L6VeAHmLsXguEOpoYQ5iB7OdFMrPruPRqPjYySqEWTQNFlgtguaiai
 VFOk7VyjHTxinsfioScWvqlCNRfs6FGGiukl3QebyCx+NU7JU+svmAq4EYvGGkkZRvGa
 6TX9/avttx5UvZm0ZL2BMw2eu7WzZNelonE9nQRLbxvvobCqrgvtNDU3vhwrZS6pMJnb
 vBZY+OaOU6xopGX1Em0NQPkv9y2X919eRdpS2G1RvupItMyJcSU6/z8om5GZuY/m2Lgs
 mCHw==
X-Gm-Message-State: AOAM532ZLKkL9mWjcK0xo5drVXAADvz3TzORjT2tGrG7GshHQIWY1cYx
 EaS1D0PRpGnr2vtSdhe0VIC5lw==
X-Google-Smtp-Source: ABdhPJxdI12HVFs1yLAB+pqB7k3PYy2OpUfhaxm3Q6KONMhN15EkuD0YcRvDttpQlyFXZc3y9AvTzQ==
X-Received: by 2002:a05:600c:4305:: with SMTP id
 p5mr9225178wme.58.1615484104548; 
 Thu, 11 Mar 2021 09:35:04 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 36sm5221152wrh.94.2021.03.11.09.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:35:04 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/7] ASoC: codecs: wcd938x: add basic controls
Date: Thu, 11 Mar 2021 17:34:13 +0000
Message-Id: <20210311173416.25219-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
References: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

This patch adds basic controls found in wcd938x codec.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 439 +++++++++++++++++++++++++++++++++++++
 1 file changed, 439 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index b82dd0dc15e8..92b2a8e6bb6c 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -188,6 +188,8 @@ enum {
 };
 
 static struct wcd938x_priv *g_wcd938x;
+static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
+static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
 
 static const struct reg_default wcd938x_defaults[] = {
 	{WCD938X_ANA_PAGE_REGISTER,                            0x00},
@@ -1273,6 +1275,418 @@ static int wcd938x_io_init(struct wcd938x_sdw_priv *wcd)
 
 }
 
+static int wcd938x_sdw_connect_port(struct wcd938x_sdw_ch_info *ch_info,
+				    struct sdw_port_config *port_config,
+				    u32 mstr_port_num,
+				    u8 enable)
+{
+	u8 ch_mask, port_num;
+
+	port_num = ch_info->port_num;
+	ch_mask = ch_info->ch_mask;
+
+	port_config->num = port_num;
+
+	if (enable)
+		port_config->ch_mask |= ch_mask;
+	else
+		port_config->ch_mask &= ~ch_mask;
+
+	return 0;
+}
+
+static int wcd938x_connect_port(struct snd_soc_component *component, u8 ch_id, u8 enable)
+{
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	u8 port_num, mstr_port_num;
+
+	port_num = wcd->ch_info[ch_id].port_num;
+	mstr_port_num = wcd->port_map[port_num - 1];
+
+	return wcd938x_sdw_connect_port(&wcd->ch_info[ch_id],
+					&wcd->port_config[port_num],
+					mstr_port_num,
+					enable);
+}
+
+static int wcd938x_tx_mode_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int path = e->shift_l;
+
+	ucontrol->value.integer.value[0] = wcd938x->tx_mode[path];
+
+	return 0;
+}
+
+static int wcd938x_tx_mode_put(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int path = e->shift_l;
+
+	wcd938x->tx_mode[path] = ucontrol->value.enumerated.item[0];
+
+	return 0;
+}
+
+static int wcd938x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	ucontrol->value.integer.value[0] = wcd938x->hph_mode;
+
+	return 0;
+}
+
+static int wcd938x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+	u32 mode_val;
+
+	mode_val = ucontrol->value.enumerated.item[0];
+
+	if (wcd938x->variant == WCD9380) {
+		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
+			dev_info(component->dev,
+				"%s:Invalid HPH Mode, default to CLS_H_ULP\n",
+				__func__);
+			mode_val = CLS_H_ULP;
+		}
+	}
+
+	if (mode_val == CLS_H_NORMAL) {
+		dev_info(component->dev,
+			"%s:Invalid HPH Mode, default to class_AB\n",
+			__func__);
+		mode_val = CLS_H_ULP;
+	}
+	wcd938x->hph_mode = mode_val;
+
+	return 0;
+}
+
+static int wcd938x_ear_pa_gain_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+
+	ucontrol->value.integer.value[0] = snd_soc_component_read_field(component,
+						WCD938X_ANA_EAR_COMPANDER_CTL,
+						WCD938X_EAR_GAIN_MASK);
+
+	return 0;
+}
+
+static int wcd938x_ear_pa_gain_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	if (!wcd938x->comp1_enable) {
+		snd_soc_component_write_field(component,
+				WCD938X_ANA_EAR_COMPANDER_CTL,
+				WCD938X_EAR_GAIN_MASK,
+				ucontrol->value.integer.value[0]);
+	}
+
+	return 0;
+}
+
+static int wcd938x_get_compander(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+	struct soc_mixer_control *mc;
+	bool hphr;
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+
+	if (hphr)
+		ucontrol->value.integer.value[0] = wcd938x->comp2_enable;
+	else
+		ucontrol->value.integer.value[0] = wcd938x->comp1_enable;
+
+	return 0;
+}
+
+static int wcd938x_set_compander(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+	int value = ucontrol->value.integer.value[0];
+	struct soc_mixer_control *mc;
+	bool hphr;
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+
+	if (hphr)
+		wcd938x->comp2_enable = value;
+	else
+		wcd938x->comp1_enable = value;
+
+	if (value)
+		wcd938x_connect_port(component, mc->reg, true);
+	else
+		wcd938x_connect_port(component, mc->reg, false);
+
+	return 0;
+}
+
+static int wcd938x_ldoh_get(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	ucontrol->value.integer.value[0] = wcd938x->ldoh;
+
+	return 0;
+}
+
+static int wcd938x_ldoh_put(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	wcd938x->ldoh = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static int wcd938x_bcs_get(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	ucontrol->value.integer.value[0] = wcd938x->bcs_dis;
+
+	return 0;
+}
+
+static int wcd938x_bcs_put(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	wcd938x->bcs_dis = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static const char * const tx_mode_mux_text_wcd9380[] = {
+	"ADC_INVALID", "ADC_HIFI", "ADC_LO_HIF", "ADC_NORMAL", "ADC_LP",
+};
+
+static const char * const tx_mode_mux_text[] = {
+	"ADC_INVALID", "ADC_HIFI", "ADC_LO_HIF", "ADC_NORMAL", "ADC_LP",
+	"ADC_ULP1", "ADC_ULP2",
+};
+
+static const char * const rx_hph_mode_mux_text_wcd9380[] = {
+	"CLS_H_INVALID", "CLS_H_INVALID_1", "CLS_H_LP", "CLS_AB",
+	"CLS_H_LOHIFI", "CLS_H_ULP", "CLS_H_INVALID_2", "CLS_AB_LP",
+	"CLS_AB_LOHIFI",
+};
+
+static const char * const wcd938x_ear_pa_gain_text[] = {
+	"G_6_DB", "G_4P5_DB", "G_3_DB", "G_1P5_DB", "G_0_DB",
+	"G_M1P5_DB", "G_M3_DB", "G_M4P5_DB",
+	"G_M6_DB", "G_7P5_DB", "G_M9_DB",
+	"G_M10P5_DB", "G_M12_DB", "G_M13P5_DB",
+	"G_M15_DB", "G_M16P5_DB", "G_M18_DB",
+};
+
+static const char * const rx_hph_mode_mux_text[] = {
+	"CLS_H_INVALID", "CLS_H_HIFI", "CLS_H_LP", "CLS_AB", "CLS_H_LOHIFI",
+	"CLS_H_ULP", "CLS_AB_HIFI", "CLS_AB_LP", "CLS_AB_LOHIFI",
+};
+
+static const struct soc_enum tx_mode_mux_enum_wcd9380[] = {
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tx_mode_mux_text_wcd9380),
+			tx_mode_mux_text_wcd9380),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 1, ARRAY_SIZE(tx_mode_mux_text_wcd9380),
+			tx_mode_mux_text_wcd9380),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 2, ARRAY_SIZE(tx_mode_mux_text_wcd9380),
+			tx_mode_mux_text_wcd9380),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 3, ARRAY_SIZE(tx_mode_mux_text_wcd9380),
+			tx_mode_mux_text_wcd9380),
+};
+
+static const struct soc_enum tx_mode_mux_enum[] = {
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 1, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 2, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 3, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text),
+};
+
+static const struct soc_enum rx_hph_mode_mux_enum_wcd9380 =
+		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text_wcd9380),
+				    rx_hph_mode_mux_text_wcd9380);
+
+static const struct soc_enum rx_hph_mode_mux_enum =
+		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text),
+				    rx_hph_mode_mux_text);
+
+static SOC_ENUM_SINGLE_EXT_DECL(wcd938x_ear_pa_gain_enum, wcd938x_ear_pa_gain_text);
+
+static const struct snd_kcontrol_new wcd9380_snd_controls[] = {
+	SOC_ENUM_EXT("EAR PA GAIN", wcd938x_ear_pa_gain_enum,
+		     wcd938x_ear_pa_gain_get, wcd938x_ear_pa_gain_put),
+	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum_wcd9380,
+		     wcd938x_rx_hph_mode_get, wcd938x_rx_hph_mode_put),
+	SOC_ENUM_EXT("TX0 MODE", tx_mode_mux_enum_wcd9380[0],
+		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
+	SOC_ENUM_EXT("TX1 MODE", tx_mode_mux_enum_wcd9380[1],
+		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
+	SOC_ENUM_EXT("TX2 MODE", tx_mode_mux_enum_wcd9380[2],
+		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
+	SOC_ENUM_EXT("TX3 MODE", tx_mode_mux_enum_wcd9380[3],
+		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
+};
+
+static const struct snd_kcontrol_new wcd9385_snd_controls[] = {
+	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
+		     wcd938x_rx_hph_mode_get, wcd938x_rx_hph_mode_put),
+	SOC_ENUM_EXT("TX0 MODE", tx_mode_mux_enum[0],
+		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
+	SOC_ENUM_EXT("TX1 MODE", tx_mode_mux_enum[1],
+		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
+	SOC_ENUM_EXT("TX2 MODE", tx_mode_mux_enum[2],
+		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
+	SOC_ENUM_EXT("TX3 MODE", tx_mode_mux_enum[3],
+		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
+};
+
+static int wcd938x_get_swr_port(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(comp);
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	int portidx = mixer->reg;
+
+	ucontrol->value.integer.value[0] = wcd->port_enable[portidx];
+
+	return 0;
+}
+
+static int wcd938x_set_swr_port(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(comp);
+	struct soc_mixer_control *mixer =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	int portidx = mixer->reg;
+	bool enable;
+
+	if (ucontrol->value.integer.value[0])
+		enable = true;
+	else
+		enable = false;
+
+	wcd->port_enable[portidx] = enable;
+
+	wcd938x_connect_port(comp, portidx, enable);
+
+	return 0;
+
+}
+
+static const struct snd_kcontrol_new wcd938x_rx_snd_controls[] = {
+	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD938X_COMP_L, 0, 1, 0,
+		       wcd938x_get_compander, wcd938x_set_compander),
+	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD938X_COMP_R, 1, 1, 0,
+		       wcd938x_get_compander, wcd938x_set_compander),
+	SOC_SINGLE_EXT("HPHL Switch", WCD938X_HPH_L, 0, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("HPHR Switch", WCD938X_HPH_R, 0, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("CLSH Switch", WCD938X_CLSH, 0, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("LO Switch", WCD938X_LO, 0, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_L Switch", WCD938X_DSD_L, 0, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_R Switch", WCD938X_DSD_R, 0, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_TLV("HPHL Volume", WCD938X_HPH_L_EN, 0, 20, 1, line_gain),
+	SOC_SINGLE_TLV("HPHR Volume", WCD938X_HPH_R_EN, 0, 20, 1, line_gain),
+};
+
+static const struct snd_kcontrol_new wcd938x_snd_controls[] = {
+
+	SOC_SINGLE_EXT("ADC1 Switch", WCD938X_ADC1, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("ADC2 Switch", WCD938X_ADC2, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("ADC3 Switch", WCD938X_ADC3, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("ADC4 Switch", WCD938X_ADC4, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC0 Switch", WCD938X_DMIC0, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC1 Switch", WCD938X_DMIC1, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("MBHC Switch", WCD938X_MBHC, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC2 Switch", WCD938X_DMIC2, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC3 Switch", WCD938X_DMIC3, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC4 Switch", WCD938X_DMIC4, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC5 Switch", WCD938X_DMIC5, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC6 Switch", WCD938X_DMIC6, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC7 Switch", WCD938X_DMIC7, 1, 1, 0,
+		       wcd938x_get_swr_port, wcd938x_set_swr_port),
+	SOC_SINGLE_EXT("LDOH Enable Switch", SND_SOC_NOPM, 0, 1, 0,
+		       wcd938x_ldoh_get, wcd938x_ldoh_put),
+	SOC_SINGLE_EXT("ADC2_BCS Disable Switch", SND_SOC_NOPM, 0, 1, 0,
+		       wcd938x_bcs_get, wcd938x_bcs_put),
+
+	SOC_SINGLE_TLV("ADC1 Volume", WCD938X_ANA_TX_CH1, 0, 20, 0, analog_gain),
+	SOC_SINGLE_TLV("ADC2 Volume", WCD938X_ANA_TX_CH2, 0, 20, 0, analog_gain),
+	SOC_SINGLE_TLV("ADC3 Volume", WCD938X_ANA_TX_CH3, 0, 20, 0, analog_gain),
+	SOC_SINGLE_TLV("ADC4 Volume", WCD938X_ANA_TX_CH4, 0, 20, 0, analog_gain),
+};
+
 static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
 {
 	/* min micbias voltage is 1V and maximum is 2.85V */
@@ -1418,17 +1832,42 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 
 	wcd938x_io_init(wcd);
 
+	if (wcd938x->variant == WCD9380) {
+		ret = snd_soc_add_component_controls(component, wcd9380_snd_controls,
+					ARRAY_SIZE(wcd9380_snd_controls));
+		if (ret < 0) {
+			dev_err(component->dev,
+				"%s: Failed to add snd ctrls for variant: %d\n",
+				__func__, wcd938x->variant);
+			goto err;
+		}
+	}
+	if (wcd938x->variant == WCD9385) {
+		ret = snd_soc_add_component_controls(component, wcd9385_snd_controls,
+					ARRAY_SIZE(wcd9385_snd_controls));
+		if (ret < 0) {
+			dev_err(component->dev,
+				"%s: Failed to add snd ctrls for variant: %d\n",
+				__func__, wcd938x->variant);
+			goto err;
+		}
+	}
+err:
 	return ret;
 }
 
 static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_rx = {
 	.name = "wcd938x_codec_rx",
 	.probe = wcd938x_soc_codec_rx_probe,
+	.controls = wcd938x_rx_snd_controls,
+	.num_controls = ARRAY_SIZE(wcd938x_rx_snd_controls),
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_tx = {
 	.name = "wcd938x_codec_tx",
 	.probe = wcd938x_soc_codec_probe,
+	.controls = wcd938x_snd_controls,
+	.num_controls = ARRAY_SIZE(wcd938x_snd_controls),
 };
 
 static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
-- 
2.21.0

