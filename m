Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFE397295
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 13:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E9D816D0;
	Tue,  1 Jun 2021 13:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E9D816D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622547559;
	bh=mjgaejCGcqT12vvNUQi8sl8OrretRjrJAjIgpQ8NJuY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VVSzrvu3iYausR5ahAynYrvkeegvya8Er6WsUpU1k7V+375ALC8pxHolG9FVqLMbk
	 WlhXt+olBnKc45wl58enqO1/+lY1lZTWjGx7ZQLlSbM+An715fLENWnea/IkU/Hu2w
	 mUyASaER51na8/zZYZUR7dqzlYZBu/HQL3h6Uhgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5F3AF804FF;
	Tue,  1 Jun 2021 13:35:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC431F804B0; Tue,  1 Jun 2021 13:35:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB1C9F804B0
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 13:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB1C9F804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uzsyHZOc"
Received: by mail-ej1-x62a.google.com with SMTP id qq22so12901541ejb.9
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 04:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PGhcoEJpswlMB0zcQktyifWcWdTLx347RYE8w65r+SY=;
 b=uzsyHZOcOCXI1bv4eHWRLNkpNXTSZ8c9wiaE5LzHCMJEjJz4D3CUFHM1HVusYMj1vn
 d15drcohoyYBk1ndiHGBXjkV1jCPK87ZLgfh0W3SLq/VVWKL+TjV385Uk4sEeEkcFyr2
 qrQUUbN7B5YhbyKJ9TirFM14LW4eeF5KbbiOkL6PRO/oMCpX2GDolZ+7ajD91ObdxGrw
 UCwEfG+tkoQyB/088r0a9zOalRNYDT4EOguiP6RHuyXovL4D14rbPUQbAvPhqiHFqy90
 2aKjHDAq28DLarcNw8+yHqOLOLpU5/to3Mvx/UCEsCweH8d0MaQaw+Cjge3+LAEVkZQS
 fF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PGhcoEJpswlMB0zcQktyifWcWdTLx347RYE8w65r+SY=;
 b=TPlUlXCsdrJJAEPY+w/c062WETICScqLiDV+GPeRg85f5n/1yMD4jmnq78T8b2r8ll
 UB2m4HPb+Mxx4VSHqX1l6IWDbHhHATaeSaWPgx+swOlld2Olfh/k6scUiPlj2J2fyo6G
 Ws8296LgwIX3w3vipV+keFpDDX+HhPr7Z6mac3Zn7dnmQwjIP1aIKwa3r1IrS5oJMXuk
 /56sHQ4n0KGhNrG3+4qjhVQy/aM99WKh7X2YAj/mMn5+hN35bzaOBZtTpy0DrHoWh5yb
 B1LZJty5MJTL+wqUQgbpicXK1gkBYZSRP4eRbYGa/q2DQktRnRhwNditBuDXe4Cz+n42
 UVAQ==
X-Gm-Message-State: AOAM533PBckr39GjIL7y1gVoFbpXwOiIezckNlw1IdndpQcN10ggHLic
 u0HGfzektKthshfc3ti+Jqh85g==
X-Google-Smtp-Source: ABdhPJx0uTtbv5r8xcqaLQfVzIHqix/Ylbnzw0+Sd6Qr239g7hZRWC+SVlm/2xdKgjyhD4iNx1YcsA==
X-Received: by 2002:a17:906:b10e:: with SMTP id
 u14mr28254710ejy.546.1622547285142; 
 Tue, 01 Jun 2021 04:34:45 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f10sm4729487edx.60.2021.06.01.04.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 04:34:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v8 8/9] ASoC: codecs: wcd938x: add capture dapm widgets
Date: Tue,  1 Jun 2021 12:31:57 +0100
Message-Id: <20210601113158.16085-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
References: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

This patch adds required dapm widgets for capture path.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 776 +++++++++++++++++++++++++++++++++++++
 1 file changed, 776 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index b33a12d788ca..d251ae35bd81 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -157,6 +157,16 @@ enum {
 	NUM_CODEC_DAIS,
 };
 
+static u8 tx_mode_bit[] = {
+	[ADC_MODE_INVALID] = 0x00,
+	[ADC_MODE_HIFI] = 0x01,
+	[ADC_MODE_LO_HIF] = 0x02,
+	[ADC_MODE_NORMAL] = 0x04,
+	[ADC_MODE_LP] = 0x08,
+	[ADC_MODE_ULP1] = 0x10,
+	[ADC_MODE_ULP2] = 0x20,
+};
+
 struct wcd938x_priv {
 	struct sdw_slave *tx_sdw_dev;
 	struct wcd938x_sdw_priv *sdw_priv[NUM_CODEC_DAIS];
@@ -1240,6 +1250,61 @@ static struct regmap_irq_chip wcd938x_regmap_irq_chip = {
 	.irq_drv_data = NULL,
 };
 
+static int wcd938x_get_clk_rate(int mode)
+{
+	int rate;
+
+	switch (mode) {
+	case ADC_MODE_ULP2:
+		rate = SWR_CLK_RATE_0P6MHZ;
+		break;
+	case ADC_MODE_ULP1:
+		rate = SWR_CLK_RATE_1P2MHZ;
+		break;
+	case ADC_MODE_LP:
+		rate = SWR_CLK_RATE_4P8MHZ;
+		break;
+	case ADC_MODE_NORMAL:
+	case ADC_MODE_LO_HIF:
+	case ADC_MODE_HIFI:
+	case ADC_MODE_INVALID:
+	default:
+		rate = SWR_CLK_RATE_9P6MHZ;
+		break;
+	}
+
+	return rate;
+}
+
+static int wcd938x_set_swr_clk_rate(struct snd_soc_component *component, int rate, int bank)
+{
+	u8 mask = (bank ? 0xF0 : 0x0F);
+	u8 val = 0;
+
+	switch (rate) {
+	case SWR_CLK_RATE_0P6MHZ:
+		val = (bank ? 0x60 : 0x06);
+		break;
+	case SWR_CLK_RATE_1P2MHZ:
+		val = (bank ? 0x50 : 0x05);
+		break;
+	case SWR_CLK_RATE_2P4MHZ:
+		val = (bank ? 0x30 : 0x03);
+		break;
+	case SWR_CLK_RATE_4P8MHZ:
+		val = (bank ? 0x10 : 0x01);
+		break;
+	case SWR_CLK_RATE_9P6MHZ:
+	default:
+		val = 0x00;
+		break;
+	}
+	snd_soc_component_update_bits(component, WCD938X_DIGITAL_SWR_TX_CLK_RATE,
+				      mask, val);
+
+	return 0;
+}
+
 static int wcd938x_io_init(struct wcd938x_priv *wcd938x)
 {
 	struct regmap *rm = wcd938x->regmap;
@@ -1915,6 +1980,455 @@ static int wcd938x_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int wcd938x_codec_enable_dmic(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kcontrol,
+				     int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 dmic_clk_reg, dmic_clk_en_reg;
+	u8 dmic_sel_mask, dmic_clk_mask;
+
+	switch (w->shift) {
+	case 0:
+	case 1:
+		dmic_clk_reg = WCD938X_DIGITAL_CDC_DMIC_RATE_1_2;
+		dmic_clk_en_reg = WCD938X_DIGITAL_CDC_DMIC1_CTL;
+		dmic_clk_mask = WCD938X_DMIC1_RATE_MASK;
+		dmic_sel_mask = WCD938X_AMIC1_IN_SEL_MASK;
+		break;
+	case 2:
+	case 3:
+		dmic_clk_reg = WCD938X_DIGITAL_CDC_DMIC_RATE_1_2;
+		dmic_clk_en_reg = WCD938X_DIGITAL_CDC_DMIC2_CTL;
+		dmic_clk_mask = WCD938X_DMIC2_RATE_MASK;
+		dmic_sel_mask = WCD938X_AMIC3_IN_SEL_MASK;
+		break;
+	case 4:
+	case 5:
+		dmic_clk_reg = WCD938X_DIGITAL_CDC_DMIC_RATE_3_4;
+		dmic_clk_en_reg = WCD938X_DIGITAL_CDC_DMIC3_CTL;
+		dmic_clk_mask = WCD938X_DMIC3_RATE_MASK;
+		dmic_sel_mask = WCD938X_AMIC4_IN_SEL_MASK;
+		break;
+	case 6:
+	case 7:
+		dmic_clk_reg = WCD938X_DIGITAL_CDC_DMIC_RATE_3_4;
+		dmic_clk_en_reg = WCD938X_DIGITAL_CDC_DMIC4_CTL;
+		dmic_clk_mask = WCD938X_DMIC4_RATE_MASK;
+		dmic_sel_mask = WCD938X_AMIC5_IN_SEL_MASK;
+		break;
+	default:
+		dev_err(component->dev, "%s: Invalid DMIC Selection\n",
+			__func__);
+		return -EINVAL;
+	};
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_AMIC_CTL,
+				dmic_sel_mask,
+				WCD938X_AMIC1_IN_SEL_DMIC);
+		/* 250us sleep as per HW requirement */
+		usleep_range(250, 260);
+		/* Setting DMIC clock rate to 2.4MHz */
+		snd_soc_component_write_field(component, dmic_clk_reg,
+					      dmic_clk_mask,
+					      WCD938X_DMIC4_RATE_2P4MHZ);
+		snd_soc_component_write_field(component, dmic_clk_en_reg,
+					      WCD938X_DMIC_CLK_EN_MASK, 1);
+		/* enable clock scaling */
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_CDC_DMIC_CTL,
+					      WCD938X_DMIC_CLK_SCALING_EN_MASK, 0x3);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_AMIC_CTL,
+				dmic_sel_mask, WCD938X_AMIC1_IN_SEL_AMIC);
+		snd_soc_component_write_field(component, dmic_clk_en_reg,
+					      WCD938X_DMIC_CLK_EN_MASK, 0);
+		break;
+	};
+	return 0;
+}
+
+static int wcd938x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int bank;
+	int rate;
+
+	bank = (wcd938x_swr_get_current_bank(wcd938x->sdw_priv[AIF1_CAP]->sdev)) ? 0 : 1;
+	bank = bank ? 0 : 1;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (strnstr(w->name, "ADC", sizeof("ADC"))) {
+			int i = 0, mode = 0;
+
+			if (test_bit(WCD_ADC1, &wcd938x->status_mask))
+				mode |= tx_mode_bit[wcd938x->tx_mode[WCD_ADC1]];
+			if (test_bit(WCD_ADC2, &wcd938x->status_mask))
+				mode |= tx_mode_bit[wcd938x->tx_mode[WCD_ADC2]];
+			if (test_bit(WCD_ADC3, &wcd938x->status_mask))
+				mode |= tx_mode_bit[wcd938x->tx_mode[WCD_ADC3]];
+			if (test_bit(WCD_ADC4, &wcd938x->status_mask))
+				mode |= tx_mode_bit[wcd938x->tx_mode[WCD_ADC4]];
+
+			if (mode != 0) {
+				for (i = 0; i < ADC_MODE_ULP2; i++) {
+					if (mode & (1 << i)) {
+						i++;
+						break;
+					}
+				}
+			}
+			rate = wcd938x_get_clk_rate(i);
+			wcd938x_set_swr_clk_rate(component, rate, bank);
+		}
+
+		if (strnstr(w->name, "ADC", sizeof("ADC")))
+			/* Copy clk settings to active bank */
+			wcd938x_set_swr_clk_rate(component, rate, !bank);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (strnstr(w->name, "ADC", sizeof("ADC"))) {
+			rate = wcd938x_get_clk_rate(ADC_MODE_INVALID);
+			wcd938x_set_swr_clk_rate(component, rate, !bank);
+			wcd938x_set_swr_clk_rate(component, rate, bank);
+		}
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd938x_get_adc_mode(int val)
+{
+	int ret = 0;
+
+	switch (val) {
+	case ADC_MODE_INVALID:
+		ret = ADC_MODE_VAL_NORMAL;
+		break;
+	case ADC_MODE_HIFI:
+		ret = ADC_MODE_VAL_HIFI;
+		break;
+	case ADC_MODE_LO_HIF:
+		ret = ADC_MODE_VAL_LO_HIF;
+		break;
+	case ADC_MODE_NORMAL:
+		ret = ADC_MODE_VAL_NORMAL;
+		break;
+	case ADC_MODE_LP:
+		ret = ADC_MODE_VAL_LP;
+		break;
+	case ADC_MODE_ULP1:
+		ret = ADC_MODE_VAL_ULP1;
+		break;
+	case ADC_MODE_ULP2:
+		ret = ADC_MODE_VAL_ULP2;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static int wcd938x_codec_enable_adc(struct snd_soc_dapm_widget *w,
+				    struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component,
+					      WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD938X_ANA_TX_CLK_EN_MASK, 1);
+		snd_soc_component_write_field(component,
+					      WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD938X_ANA_TX_DIV2_CLK_EN_MASK, 1);
+		set_bit(w->shift, &wcd938x->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD938X_ANA_TX_CLK_EN_MASK, 0);
+		clear_bit(w->shift, &wcd938x->status_mask);
+		break;
+	};
+
+	return 0;
+}
+
+static void wcd938x_tx_channel_config(struct snd_soc_component *component,
+				     int channel, int mode)
+{
+	int reg, mask;
+
+	switch (channel) {
+	case 0:
+		reg = WCD938X_ANA_TX_CH2;
+		mask = WCD938X_HPF1_INIT_MASK;
+		break;
+	case 1:
+		reg = WCD938X_ANA_TX_CH2;
+		mask = WCD938X_HPF2_INIT_MASK;
+		break;
+	case 2:
+		reg = WCD938X_ANA_TX_CH4;
+		mask = WCD938X_HPF3_INIT_MASK;
+		break;
+	case 3:
+		reg = WCD938X_ANA_TX_CH4;
+		mask = WCD938X_HPF4_INIT_MASK;
+		break;
+	}
+
+	snd_soc_component_write_field(component, reg, mask, mode);
+}
+
+static int wcd938x_adc_enable_req(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_REQ_CTL,
+				WCD938X_FS_RATE_4P8_MASK, 1);
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_REQ_CTL,
+				WCD938X_NO_NOTCH_MASK, 0);
+		wcd938x_tx_channel_config(component, w->shift, 1);
+		mode = wcd938x_get_adc_mode(wcd938x->tx_mode[w->shift]);
+		if (mode < 0) {
+			dev_info(component->dev, "Invalid ADC mode\n");
+			return -EINVAL;
+		}
+		switch (w->shift) {
+		case 0:
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_TX_ANA_MODE_0_1,
+				WCD938X_TXD0_MODE_MASK, mode);
+			snd_soc_component_write_field(component,
+						WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+						WCD938X_TXD0_CLK_EN_MASK, 1);
+			break;
+		case 1:
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_TX_ANA_MODE_0_1,
+				WCD938X_TXD1_MODE_MASK, mode);
+			snd_soc_component_write_field(component,
+					      WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+					      WCD938X_TXD1_CLK_EN_MASK, 1);
+			break;
+		case 2:
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_TX_ANA_MODE_2_3,
+				WCD938X_TXD2_MODE_MASK, mode);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_TXD2_CLK_EN_MASK, 1);
+			break;
+		case 3:
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_TX_ANA_MODE_2_3,
+				WCD938X_TXD3_MODE_MASK, mode);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_TXD3_CLK_EN_MASK, 1);
+			break;
+		default:
+			break;
+		}
+
+		wcd938x_tx_channel_config(component, w->shift, 0);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		switch (w->shift) {
+		case 0:
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_TX_ANA_MODE_0_1,
+				WCD938X_TXD0_MODE_MASK, 0);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_TXD0_CLK_EN_MASK, 0);
+			break;
+		case 1:
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_TX_ANA_MODE_0_1,
+				WCD938X_TXD1_MODE_MASK, 0);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_TXD1_CLK_EN_MASK, 0);
+			break;
+		case 2:
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_TX_ANA_MODE_2_3,
+				WCD938X_TXD2_MODE_MASK, 0);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_TXD2_CLK_EN_MASK, 0);
+			break;
+		case 3:
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_TX_ANA_MODE_2_3,
+				WCD938X_TXD3_MODE_MASK, 0);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_TXD3_CLK_EN_MASK, 0);
+			break;
+		default:
+			break;
+		}
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+				WCD938X_ANA_TX_DIV2_CLK_EN_MASK, 0);
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd938x_micbias_control(struct snd_soc_component *component,
+				   int micb_num, int req, bool is_dapm)
+{
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int micb_index = micb_num - 1;
+	u16 micb_reg;
+
+	switch (micb_num) {
+	case MIC_BIAS_1:
+		micb_reg = WCD938X_ANA_MICB1;
+		break;
+	case MIC_BIAS_2:
+		micb_reg = WCD938X_ANA_MICB2;
+		break;
+	case MIC_BIAS_3:
+		micb_reg = WCD938X_ANA_MICB3;
+		break;
+	case MIC_BIAS_4:
+		micb_reg = WCD938X_ANA_MICB4;
+		break;
+	default:
+		dev_err(component->dev, "%s: Invalid micbias number: %d\n",
+			__func__, micb_num);
+		return -EINVAL;
+	};
+
+	switch (req) {
+	case MICB_PULLUP_ENABLE:
+		wcd938x->pullup_ref[micb_index]++;
+		if ((wcd938x->pullup_ref[micb_index] == 1) &&
+		    (wcd938x->micb_ref[micb_index] == 0))
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD938X_MICB_EN_MASK,
+						      WCD938X_MICB_PULL_UP);
+		break;
+	case MICB_PULLUP_DISABLE:
+		if (wcd938x->pullup_ref[micb_index] > 0)
+			wcd938x->pullup_ref[micb_index]--;
+
+		if ((wcd938x->pullup_ref[micb_index] == 0) &&
+		    (wcd938x->micb_ref[micb_index] == 0))
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD938X_MICB_EN_MASK, 0);
+		break;
+	case MICB_ENABLE:
+		wcd938x->micb_ref[micb_index]++;
+		if (wcd938x->micb_ref[micb_index] == 1) {
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_TX_CLK_EN_MASK, 0xF);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+				WCD938X_ANA_TX_DIV2_CLK_EN_MASK, 1);
+			snd_soc_component_write_field(component,
+			       WCD938X_DIGITAL_CDC_ANA_TX_CLK_CTL,
+			       WCD938X_TX_SC_CLK_EN_MASK, 1);
+
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD938X_MICB_EN_MASK,
+						      WCD938X_MICB_ENABLE);
+		}
+
+		break;
+	case MICB_DISABLE:
+		if (wcd938x->micb_ref[micb_index] > 0)
+			wcd938x->micb_ref[micb_index]--;
+
+		if ((wcd938x->micb_ref[micb_index] == 0) &&
+		    (wcd938x->pullup_ref[micb_index] > 0))
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD938X_MICB_EN_MASK,
+						      WCD938X_MICB_PULL_UP);
+		else if ((wcd938x->micb_ref[micb_index] == 0) &&
+			 (wcd938x->pullup_ref[micb_index] == 0)) {
+
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD938X_MICB_EN_MASK, 0);
+		}
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd938x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	int micb_num = w->shift;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd938x_micbias_control(component, micb_num, MICB_ENABLE, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* 1 msec delay as per HW requirement */
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd938x_micbias_control(component, micb_num, MICB_DISABLE, true);
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd938x_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
+					       struct snd_kcontrol *kcontrol,
+					       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	int micb_num = w->shift;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd938x_micbias_control(component, micb_num,
+					MICB_PULLUP_ENABLE, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* 1 msec delay as per HW requirement */
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd938x_micbias_control(component, micb_num,
+					MICB_PULLUP_DISABLE, true);
+		break;
+	};
+
+	return 0;
+}
+
 static int wcd938x_tx_mode_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
@@ -2093,10 +2607,30 @@ static const char * const rx_hph_mode_mux_text[] = {
 	"CLS_H_ULP", "CLS_AB_HIFI", "CLS_AB_LP", "CLS_AB_LOHIFI",
 };
 
+static const char * const adc2_mux_text[] = {
+	"INP2", "INP3"
+};
+
+static const char * const adc3_mux_text[] = {
+	"INP4", "INP6"
+};
+
+static const char * const adc4_mux_text[] = {
+	"INP5", "INP7"
+};
+
 static const char * const rdac3_mux_text[] = {
 	"RX1", "RX3"
 };
 
+static const char * const hdr12_mux_text[] = {
+	"NO_HDR12", "HDR12"
+};
+
+static const char * const hdr34_mux_text[] = {
+	"NO_HDR34", "HDR34"
+};
+
 static const struct soc_enum tx_mode_mux_enum_wcd9380[] = {
 	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tx_mode_mux_text_wcd9380),
 			tx_mode_mux_text_wcd9380),
@@ -2127,10 +2661,78 @@ static const struct soc_enum rx_hph_mode_mux_enum =
 		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text),
 				    rx_hph_mode_mux_text);
 
+static const struct soc_enum adc2_enum =
+		SOC_ENUM_SINGLE(WCD938X_TX_NEW_AMIC_MUX_CFG, 7,
+				ARRAY_SIZE(adc2_mux_text), adc2_mux_text);
+
+static const struct soc_enum adc3_enum =
+		SOC_ENUM_SINGLE(WCD938X_TX_NEW_AMIC_MUX_CFG, 6,
+				ARRAY_SIZE(adc3_mux_text), adc3_mux_text);
+
+static const struct soc_enum adc4_enum =
+		SOC_ENUM_SINGLE(WCD938X_TX_NEW_AMIC_MUX_CFG, 5,
+				ARRAY_SIZE(adc4_mux_text), adc4_mux_text);
+
+static const struct soc_enum hdr12_enum =
+		SOC_ENUM_SINGLE(WCD938X_TX_NEW_AMIC_MUX_CFG, 4,
+				ARRAY_SIZE(hdr12_mux_text), hdr12_mux_text);
+
+static const struct soc_enum hdr34_enum =
+		SOC_ENUM_SINGLE(WCD938X_TX_NEW_AMIC_MUX_CFG, 3,
+				ARRAY_SIZE(hdr34_mux_text), hdr34_mux_text);
+
 static const struct soc_enum rdac3_enum =
 		SOC_ENUM_SINGLE(WCD938X_DIGITAL_CDC_EAR_PATH_CTL, 0,
 				ARRAY_SIZE(rdac3_mux_text), rdac3_mux_text);
 
+static const struct snd_kcontrol_new adc1_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new adc2_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new adc3_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new adc4_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic1_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic2_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic3_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic4_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic5_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic6_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic7_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic8_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
 static const struct snd_kcontrol_new ear_rdac_switch[] = {
 	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
 };
@@ -2147,6 +2749,21 @@ static const struct snd_kcontrol_new hphr_rdac_switch[] = {
 	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
 };
 
+static const struct snd_kcontrol_new tx_adc2_mux =
+	SOC_DAPM_ENUM("ADC2 MUX Mux", adc2_enum);
+
+static const struct snd_kcontrol_new tx_adc3_mux =
+	SOC_DAPM_ENUM("ADC3 MUX Mux", adc3_enum);
+
+static const struct snd_kcontrol_new tx_adc4_mux =
+	SOC_DAPM_ENUM("ADC4 MUX Mux", adc4_enum);
+
+static const struct snd_kcontrol_new tx_hdr12_mux =
+	SOC_DAPM_ENUM("HDR12 MUX Mux", hdr12_enum);
+
+static const struct snd_kcontrol_new tx_hdr34_mux =
+	SOC_DAPM_ENUM("HDR34 MUX Mux", hdr34_enum);
+
 static const struct snd_kcontrol_new rx_rdac3_mux =
 	SOC_DAPM_ENUM("RDAC3_MUX Mux", rdac3_enum);
 
@@ -2279,6 +2896,165 @@ static const struct snd_kcontrol_new wcd938x_snd_controls[] = {
 };
 
 static const struct snd_soc_dapm_widget wcd938x_dapm_widgets[] = {
+
+	/*input widgets*/
+	SND_SOC_DAPM_INPUT("AMIC1"),
+	SND_SOC_DAPM_INPUT("AMIC2"),
+	SND_SOC_DAPM_INPUT("AMIC3"),
+	SND_SOC_DAPM_INPUT("AMIC4"),
+	SND_SOC_DAPM_INPUT("AMIC5"),
+	SND_SOC_DAPM_INPUT("AMIC6"),
+	SND_SOC_DAPM_INPUT("AMIC7"),
+	SND_SOC_DAPM_MIC("Analog Mic1", NULL),
+	SND_SOC_DAPM_MIC("Analog Mic2", NULL),
+	SND_SOC_DAPM_MIC("Analog Mic3", NULL),
+	SND_SOC_DAPM_MIC("Analog Mic4", NULL),
+	SND_SOC_DAPM_MIC("Analog Mic5", NULL),
+
+	/*tx widgets*/
+	SND_SOC_DAPM_ADC_E("ADC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd938x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADC2", NULL, SND_SOC_NOPM, 1, 0,
+			   wcd938x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADC3", NULL, SND_SOC_NOPM, 2, 0,
+			   wcd938x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADC4", NULL, SND_SOC_NOPM, 3, 0,
+			   wcd938x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd938x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC2", NULL, SND_SOC_NOPM, 1, 0,
+			   wcd938x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC3", NULL, SND_SOC_NOPM, 2, 0,
+			   wcd938x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC4", NULL, SND_SOC_NOPM, 3, 0,
+			   wcd938x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC5", NULL, SND_SOC_NOPM, 4, 0,
+			   wcd938x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC6", NULL, SND_SOC_NOPM, 5, 0,
+			   wcd938x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC7", NULL, SND_SOC_NOPM, 6, 0,
+			   wcd938x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC8", NULL, SND_SOC_NOPM, 7, 0,
+			   wcd938x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER_E("ADC1 REQ", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, wcd938x_adc_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC2 REQ", SND_SOC_NOPM, 1, 0,
+			     NULL, 0, wcd938x_adc_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC3 REQ", SND_SOC_NOPM, 2, 0,
+			     NULL, 0, wcd938x_adc_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC4 REQ", SND_SOC_NOPM, 3, 0, NULL, 0,
+			     wcd938x_adc_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("ADC2 MUX", SND_SOC_NOPM, 0, 0, &tx_adc2_mux),
+	SND_SOC_DAPM_MUX("ADC3 MUX", SND_SOC_NOPM, 0, 0, &tx_adc3_mux),
+	SND_SOC_DAPM_MUX("ADC4 MUX", SND_SOC_NOPM, 0, 0, &tx_adc4_mux),
+	SND_SOC_DAPM_MUX("HDR12 MUX", SND_SOC_NOPM, 0, 0, &tx_hdr12_mux),
+	SND_SOC_DAPM_MUX("HDR34 MUX", SND_SOC_NOPM, 0, 0, &tx_hdr34_mux),
+
+	/*tx mixers*/
+	SND_SOC_DAPM_MIXER_E("ADC1_MIXER", SND_SOC_NOPM, 0, 0, adc1_switch,
+			     ARRAY_SIZE(adc1_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC2_MIXER", SND_SOC_NOPM, 0, 0, adc2_switch,
+			     ARRAY_SIZE(adc2_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC3_MIXER", SND_SOC_NOPM, 0, 0, adc3_switch,
+			     ARRAY_SIZE(adc3_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC4_MIXER", SND_SOC_NOPM, 0, 0, adc4_switch,
+			     ARRAY_SIZE(adc4_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC1_MIXER", SND_SOC_NOPM, 0, 0, dmic1_switch,
+			     ARRAY_SIZE(dmic1_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC2_MIXER", SND_SOC_NOPM, 0, 0, dmic2_switch,
+			     ARRAY_SIZE(dmic2_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC3_MIXER", SND_SOC_NOPM, 0, 0, dmic3_switch,
+			     ARRAY_SIZE(dmic3_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC4_MIXER", SND_SOC_NOPM, 0, 0, dmic4_switch,
+			     ARRAY_SIZE(dmic4_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC5_MIXER", SND_SOC_NOPM, 0, 0, dmic5_switch,
+			     ARRAY_SIZE(dmic5_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC6_MIXER", SND_SOC_NOPM, 0, 0, dmic6_switch,
+			     ARRAY_SIZE(dmic6_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC7_MIXER", SND_SOC_NOPM, 0, 0, dmic7_switch,
+			     ARRAY_SIZE(dmic7_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC8_MIXER", SND_SOC_NOPM, 0, 0, dmic8_switch,
+			     ARRAY_SIZE(dmic8_switch), wcd938x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	/* micbias widgets*/
+	SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
+			    wcd938x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
+			    wcd938x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
+			    wcd938x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS4", SND_SOC_NOPM, MIC_BIAS_4, 0,
+			    wcd938x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+
+	/* micbias pull up widgets*/
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
+				wcd938x_codec_enable_micbias_pullup,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+				SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
+				wcd938x_codec_enable_micbias_pullup,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+				SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
+				wcd938x_codec_enable_micbias_pullup,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+				SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS4", SND_SOC_NOPM, MIC_BIAS_4, 0,
+				wcd938x_codec_enable_micbias_pullup,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+				SND_SOC_DAPM_POST_PMD),
+
+	/*output widgets tx*/
+	SND_SOC_DAPM_OUTPUT("ADC1_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC2_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC3_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC4_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC1_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC2_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC3_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC4_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC5_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC6_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC7_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC8_OUTPUT"),
+
 	SND_SOC_DAPM_INPUT("IN1_HPHL"),
 	SND_SOC_DAPM_INPUT("IN2_HPHR"),
 	SND_SOC_DAPM_INPUT("IN3_AUX"),
-- 
2.21.0

