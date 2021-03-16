Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B840A33D255
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 12:01:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F66E18C0;
	Tue, 16 Mar 2021 12:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F66E18C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615892487;
	bh=+ruCIqGbls762BrhO7N4weVj2cY406r2ZMZJ2oWXOPQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=agpfuPdnmYST3C9B6mVR6XsF9WZrKsgMjyxRvpKdJ7293BI0GwPmqth0bj5ytsace
	 HgKCDXHkrHzrbAmyRzcv6BHg6ZFwLxYd5l9ZGd5I+B1a0jSPFIsdYxHdSzbYVFiNnK
	 2Otsry+JnSN7ipNZxN48nvrySMjwcm638EgYr9gQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF06F80425;
	Tue, 16 Mar 2021 11:59:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D96D8F8032D; Tue, 16 Mar 2021 11:58:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19029F80163
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 11:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19029F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OBUyz1Ad"
Received: by mail-wr1-x42c.google.com with SMTP id l12so10212141wry.2
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 03:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqI3h7bL5GxJbr7rqQ7z7EzfqDP73iW8gqEA97t5wxg=;
 b=OBUyz1AdY3W9Lu+RKYzp4H2PKSYubnwqOSw54By1fD6dx7jWqrXHI1qwYQOOgnHVMP
 ZXNIYAVXmW81dEl7WN9yh8MYDrS8cIpk4+Z7wh2oauZhl4nu/IaIfUs5onasHyfUge89
 ieswnjF+u55dlPFP00SsIXrMw2O3M99SIVW/g58tflMUvb6AGHu3CuhL+c2+5oyIdPoV
 h+KrRpbpAj/899tu3d8P1ZoKukCXsKVqD37Ga60G6vvHkxUYZFBH2GreuB8SGmwmOhrI
 l3zbILxyuvsrmnPbC2LQso1KD/xDGEoMK73pKqwgiH95FZjK9k8kuMaLivqpqvnQiY/s
 +Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqI3h7bL5GxJbr7rqQ7z7EzfqDP73iW8gqEA97t5wxg=;
 b=Xdm35RifyXUw0JlrK+vepvXxEwte+p085eUaAmcxEcOat+ByWfBhpHqmE1Yov8Ug76
 6uhj9Zcr9ceGEShR4tvhOhV9z7jhSm4KfWV1Xzr74w9H6UcRf5F4sCWt4flMOtfPND3R
 KKD1Nj9JQtvJYkBg3SS37k1M0hwSH6RWcEvNaUDuo+3i2nKpjj9d6PF42VySFnY+Xmv/
 pDjojGh8HJtvH7mqEmvXq1+7g4Gg+ojWd7pnc9M+/OaCWpKBGH6WyrYvlEYPCjDGUDlK
 HguRkig1x3rm1QmbEDimC3iInzJm0AoICv4NyXRUSJQFI9eRWP+i3z65jZqJHPHktswW
 WPxg==
X-Gm-Message-State: AOAM531WpT5CGXGa8QO596XEcIjt4pLTXOUmZ9via0Ao1W+TlYk/D+/9
 ApFeoy9j6PlCy3Q0tg4GAmuSsg==
X-Google-Smtp-Source: ABdhPJyXZrV0jh9iMIJSk2AP5GV95YccOqRAplj5pnLyImMfWZFGVRzjZYiGHqIIZLw3C8sQ+oF04A==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr4052551wru.327.1615892321205; 
 Tue, 16 Mar 2021 03:58:41 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t8sm21465956wrr.10.2021.03.16.03.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:58:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 4/7] ASoC: codecs: wcd938x: add basic controls
Date: Tue, 16 Mar 2021 10:58:25 +0000
Message-Id: <20210316105828.16436-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210316105828.16436-1-srinivas.kandagatla@linaro.org>
References: <20210316105828.16436-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
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

This patch adds basic controls found in wcd938x codec.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 415 +++++++++++++++++++++++++++++++++++++
 1 file changed, 415 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 9e8d588e2235..9b5dda775a17 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -66,6 +66,15 @@
 #define WCD938X_MBHC_MOISTURE_RREF      R_24_KOHM
 #define WCD_MBHC_HS_V_MAX           1600
 
+#define WCD938X_EAR_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
+		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
+	.tlv.p = (tlv_array), \
+	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
+	.put = wcd938x_ear_pa_put_gain, \
+	.private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
+
 enum {
 	WCD9380 = 0,
 	WCD9385 = 5,
@@ -187,6 +196,9 @@ enum {
 };
 
 static struct wcd938x_priv *g_wcd938x;
+static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
+static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(line_gain, 600, -3000);
+static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(analog_gain, 0, 3000);
 
 static const struct reg_default wcd938x_defaults[] = {
 	{WCD938X_ANA_PAGE_REGISTER,                            0x00},
@@ -1275,6 +1287,380 @@ int wcd938x_io_init(struct wcd938x_sdw_priv *wcd)
 
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
+
+	wcd938x->hph_mode = ucontrol->value.enumerated.item[0];
+
+	return 0;
+}
+
+static int wcd938x_ear_pa_put_gain(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	if (wcd938x->comp1_enable) {
+		dev_err(component->dev, "Can not set EAR PA Gain, compander1 is enabled\n");
+		return -EINVAL;
+	}
+
+	snd_soc_component_write_field(component, WCD938X_ANA_EAR_COMPANDER_CTL,
+				      WCD938X_EAR_GAIN_MASK,
+				      ucontrol->value.integer.value[0]);
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
+static const struct snd_kcontrol_new wcd9380_snd_controls[] = {
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
+	SOC_SINGLE_TLV("HPHL Volume", WCD938X_HPH_L_EN, 0, 0x18, 0, line_gain),
+	SOC_SINGLE_TLV("HPHR Volume", WCD938X_HPH_R_EN, 0, 0x18, 0, line_gain),
+	WCD938X_EAR_PA_GAIN_TLV("EAR_PA Volume", WCD938X_ANA_EAR_COMPANDER_CTL,
+				2, 0x10, 0, ear_pa_gain),
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
@@ -1419,17 +1805,46 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 	disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
 	disable_irq_nosync(wcd938x->aux_pdm_wd_int);
 
+	switch (wcd938x->variant) {
+	case WCD9380:
+		ret = snd_soc_add_component_controls(component, wcd9380_snd_controls,
+					ARRAY_SIZE(wcd9380_snd_controls));
+		if (ret < 0) {
+			dev_err(component->dev,
+				"%s: Failed to add snd ctrls for variant: %d\n",
+				__func__, wcd938x->variant);
+			goto err;
+		}
+		break;
+	case WCD9385:
+		ret = snd_soc_add_component_controls(component, wcd9385_snd_controls,
+					ARRAY_SIZE(wcd9385_snd_controls));
+		if (ret < 0) {
+			dev_err(component->dev,
+				"%s: Failed to add snd ctrls for variant: %d\n",
+				__func__, wcd938x->variant);
+			goto err;
+		}
+		break;
+	default:
+		break;
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

