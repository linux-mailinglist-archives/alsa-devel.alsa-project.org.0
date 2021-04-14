Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B0C35F840
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 17:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1A61683;
	Wed, 14 Apr 2021 17:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1A61683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618415654;
	bh=PwW1FWbLFkSG/AmpTjCqMAF2L7K3dKAmB7vwW2K4Ad4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PjDuvpv52KKA/g2VkCkXbEME1wrvXtn0qZM+ULBSR1yj2+OoKOP3zdEJlMR7BcsDk
	 kufkt/UsFM+M6fAfgxVbb6xJ4s4wwY1uSiTG9mThA0wIBQkofAKaml1/S6G+wti6Cf
	 9CTJcxFXMap6yxHoXS1Z7SAInpn11AW8LswuijV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5165DF804F3;
	Wed, 14 Apr 2021 17:49:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B7B1F804AE; Wed, 14 Apr 2021 17:49:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32245F8025B
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 17:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32245F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c+R5CQnd"
Received: by mail-ed1-x535.google.com with SMTP id w23so24297173edx.7
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YoFSwyL1eyaOXmVjrhee43GVnbRMGvObTGQ4aFuBDWg=;
 b=c+R5CQndzYtqlcNFTaZTN+j1SxbBixP5FhwQ73VWSoVE9NPKS/zxvDlkOVp6b60U/0
 ezDmr0Zd5V6mEH3mQE8FguYIxWiYWsBwZ6smjgClUIq2c0EMGuF73g5YYwS/YXnwIfX7
 ZX0EJt8+mgzT/7G1+1VKgOcHZOrdqhXLb2IIXV8BVC3U9hWstEwVhjBPonNrEddmrGdt
 pVmNBBtM4YkQCf6UkQSOIiRxEuMooO1RkOYoV+AIyrkQq4w3spqXwwJqGb4GBm2m+Cd5
 xSTnMyFIv+BbmOTLuOIDGWDAnTbEsbwbHMlA3sWaDH0JuOjLUt3rG8U3guOMvFlcL1uV
 C21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YoFSwyL1eyaOXmVjrhee43GVnbRMGvObTGQ4aFuBDWg=;
 b=mOdJP8rt9YTtdSTVXc8S+qcZdSbIgnZV1uHvv3hX9VkBZU2H1hj56379KOpm6+cQ9U
 N+bnVgZRyXppre95RWf5jU/vAqnwRUeLOG1graASCFDVWToZ5PJYxqyEkgC8lOVNOy2V
 /j28YKOIdjmPwPejqRhCGOvV4AmK71vMkKGexlCqg/xTtdUoiJXwzgVpUVboBbxdgS1Y
 x747gquJI6Yimw4lt3Cw+4WTJ5EkFlyKYQdbuavqWZ2J8MzmurhBaRV6n+qL9tWGYeMY
 qNNMYDBRYKO2wP3oNoJ4tPH8vGFkuhNuC2r9IYxey4dBm8nBuz+Bp6YyqbxfhFgnVhUh
 qgSg==
X-Gm-Message-State: AOAM531S5xZyFoUmxVBxZ6IMfjfvZY5sjG/brr3buLIj7yNRPZMicoIC
 H3FnGj72TJWZJVKrOfHbGvCOJw==
X-Google-Smtp-Source: ABdhPJxf6m6VTp5aYMLzbdRDZrxySbET6jnWKpSFybxoG6suUzEt0pMKLNDbxl3ZLwVfrvWSXDsmsg==
X-Received: by 2002:a50:ed08:: with SMTP id j8mr42848583eds.351.1618415371857; 
 Wed, 14 Apr 2021 08:49:31 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q12sm10495540ejy.91.2021.04.14.08.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 08:49:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 7/9] ASoC: codecs: wcd938x: add playback dapm widgets
Date: Wed, 14 Apr 2021 16:48:43 +0100
Message-Id: <20210414154845.21964-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
References: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
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

This patch adds required dapm widgets for playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 687 +++++++++++++++++++++++++++++++++++++
 1 file changed, 687 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index ae503d1d6379..bfd8d8ea6f04 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1328,6 +1328,593 @@ static int wcd938x_connect_port(struct wcd938x_sdw_priv *wcd, u8 ch_id, u8 enabl
 					enable);
 }
 
+static int wcd938x_codec_enable_rxclk(struct snd_soc_dapm_widget *w,
+				      struct snd_kcontrol *kcontrol,
+				      int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+				WCD938X_ANA_RX_CLK_EN_MASK, 1);
+		snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
+				WCD938X_RX_BIAS_EN_MASK, 1);
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_CDC_RX0_CTL,
+				WCD938X_DEM_DITHER_ENABLE_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_CDC_RX1_CTL,
+				WCD938X_DEM_DITHER_ENABLE_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_CDC_RX2_CTL,
+				WCD938X_DEM_DITHER_ENABLE_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+				WCD938X_ANA_RX_DIV2_CLK_EN_MASK, 1);
+		snd_soc_component_write_field(component, WCD938X_AUX_AUXPA,
+					      WCD938X_AUXPA_CLK_EN_MASK, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
+				WCD938X_VNEG_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
+				WCD938X_VPOS_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
+				WCD938X_RX_BIAS_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+				WCD938X_ANA_RX_DIV2_CLK_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+				WCD938X_ANA_RX_CLK_EN_MASK, 0);
+		break;
+	}
+	return 0;
+}
+
+static int wcd938x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_RXD0_CLK_EN_MASK, 0x01);
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_HPH_GAIN_CTL,
+				WCD938X_HPHL_RX_EN_MASK, 1);
+		snd_soc_component_write_field(component,
+				WCD938X_HPH_RDAC_CLK_CTL1,
+				WCD938X_CHOP_CLK_EN_MASK, 0);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_write_field(component,
+				WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+				WCD938X_HPH_RES_DIV_MASK, 0x02);
+		if (wcd938x->comp1_enable) {
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_COMP_CTL_0,
+				WCD938X_HPHL_COMP_EN_MASK, 1);
+			/* 5msec compander delay as per HW requirement */
+			if (!wcd938x->comp2_enable || (snd_soc_component_read(component,
+							 WCD938X_DIGITAL_CDC_COMP_CTL_0) & 0x01))
+				usleep_range(5000, 5010);
+			snd_soc_component_write_field(component, WCD938X_HPH_NEW_INT_HPH_TIMER1,
+					      WCD938X_AUTOCHOP_TIMER_EN, 0);
+		} else {
+			snd_soc_component_write_field(component,
+					WCD938X_DIGITAL_CDC_COMP_CTL_0,
+					WCD938X_HPHL_COMP_EN_MASK, 0);
+			snd_soc_component_write_field(component,
+					WCD938X_HPH_L_EN,
+					WCD938X_GAIN_SRC_SEL_MASK,
+					WCD938X_GAIN_SRC_SEL_REGISTER);
+
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component,
+			WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R,
+			WCD938X_HPH_RES_DIV_MASK, 0x1);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd938x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_RXD1_CLK_EN_MASK, 1);
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_HPH_GAIN_CTL,
+				WCD938X_HPHR_RX_EN_MASK, 1);
+		snd_soc_component_write_field(component,
+				WCD938X_HPH_RDAC_CLK_CTL1,
+				WCD938X_CHOP_CLK_EN_MASK, 0);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_write_field(component,
+				WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R,
+				WCD938X_HPH_RES_DIV_MASK, 0x02);
+		if (wcd938x->comp2_enable) {
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_COMP_CTL_0,
+				WCD938X_HPHR_COMP_EN_MASK, 1);
+			/* 5msec compander delay as per HW requirement */
+			if (!wcd938x->comp1_enable ||
+				(snd_soc_component_read(component,
+					WCD938X_DIGITAL_CDC_COMP_CTL_0) & 0x02))
+				usleep_range(5000, 5010);
+			snd_soc_component_write_field(component, WCD938X_HPH_NEW_INT_HPH_TIMER1,
+					      WCD938X_AUTOCHOP_TIMER_EN, 0);
+		} else {
+			snd_soc_component_write_field(component,
+					WCD938X_DIGITAL_CDC_COMP_CTL_0,
+					WCD938X_HPHR_COMP_EN_MASK, 0);
+			snd_soc_component_write_field(component,
+					WCD938X_HPH_R_EN,
+					WCD938X_GAIN_SRC_SEL_MASK,
+					WCD938X_GAIN_SRC_SEL_REGISTER);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component,
+			WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R,
+			WCD938X_HPH_RES_DIV_MASK, 0x01);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd938x_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol,
+				       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd938x->ear_rx_path =
+			snd_soc_component_read(
+				component, WCD938X_DIGITAL_CDC_EAR_PATH_CTL);
+		if (wcd938x->ear_rx_path & EAR_RX_PATH_AUX) {
+			snd_soc_component_write_field(component,
+				WCD938X_EAR_EAR_DAC_CON,
+				WCD938X_DAC_SAMPLE_EDGE_SEL_MASK, 0);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_AUX_GAIN_CTL,
+				WCD938X_AUX_EN_MASK, 1);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_RXD2_CLK_EN_MASK, 1);
+			snd_soc_component_write_field(component,
+				WCD938X_ANA_EAR_COMPANDER_CTL,
+				WCD938X_GAIN_OVRD_REG_MASK, 1);
+		} else {
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_HPH_GAIN_CTL,
+				WCD938X_HPHL_RX_EN_MASK, 1);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_RXD0_CLK_EN_MASK, 1);
+			if (wcd938x->comp1_enable)
+				snd_soc_component_write_field(component,
+					WCD938X_DIGITAL_CDC_COMP_CTL_0,
+					WCD938X_HPHL_COMP_EN_MASK, 1);
+		}
+		/* 5 msec delay as per HW requirement */
+		usleep_range(5000, 5010);
+		if (wcd938x->flyback_cur_det_disable == 0)
+			snd_soc_component_write_field(component, WCD938X_FLYBACK_EN,
+						      WCD938X_EN_CUR_DET_MASK, 0);
+		wcd938x->flyback_cur_det_disable++;
+		wcd_clsh_ctrl_set_state(wcd938x->clsh_info,
+			     WCD_CLSH_EVENT_PRE_DAC,
+			     WCD_CLSH_STATE_EAR,
+			     wcd938x->hph_mode);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (wcd938x->ear_rx_path & EAR_RX_PATH_AUX) {
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_AUX_GAIN_CTL,
+				WCD938X_AUX_EN_MASK, 0);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_RXD2_CLK_EN_MASK, 0);
+		} else {
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_HPH_GAIN_CTL,
+				WCD938X_HPHL_RX_EN_MASK, 0);
+			snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_RXD0_CLK_EN_MASK, 0);
+			if (wcd938x->comp1_enable)
+				snd_soc_component_write_field(component,
+					WCD938X_DIGITAL_CDC_COMP_CTL_0,
+					WCD938X_HPHL_COMP_EN_MASK, 0);
+		}
+		snd_soc_component_write_field(component, WCD938X_ANA_EAR_COMPANDER_CTL,
+					      WCD938X_GAIN_OVRD_REG_MASK, 0);
+		snd_soc_component_write_field(component,
+				WCD938X_EAR_EAR_DAC_CON,
+				WCD938X_DAC_SAMPLE_EDGE_SEL_MASK, 1);
+		break;
+	};
+	return 0;
+
+}
+
+static int wcd938x_codec_aux_dac_event(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol,
+				       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+				WCD938X_ANA_RX_DIV4_CLK_EN_MASK, 1);
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
+				WCD938X_RXD2_CLK_EN_MASK, 1);
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_AUX_GAIN_CTL,
+				WCD938X_AUX_EN_MASK, 1);
+		if (wcd938x->flyback_cur_det_disable == 0)
+			snd_soc_component_write_field(component, WCD938X_FLYBACK_EN,
+						      WCD938X_EN_CUR_DET_MASK, 0);
+		wcd938x->flyback_cur_det_disable++;
+		wcd_clsh_ctrl_set_state(wcd938x->clsh_info,
+			     WCD_CLSH_EVENT_PRE_DAC,
+			     WCD_CLSH_STATE_AUX,
+			     wcd938x->hph_mode);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component,
+				WCD938X_DIGITAL_CDC_ANA_CLK_CTL,
+				WCD938X_ANA_RX_DIV4_CLK_EN_MASK, 0);
+		break;
+	};
+	return ret;
+
+}
+
+static int wcd938x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd938x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (wcd938x->ldoh)
+			snd_soc_component_write_field(component, WCD938X_LDOH_MODE,
+						      WCD938X_LDOH_EN_MASK, 1);
+		wcd_clsh_ctrl_set_state(wcd938x->clsh_info, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHR, hph_mode);
+		wcd_clsh_set_hph_mode(wcd938x->clsh_info, CLS_H_HIFI);
+
+		if (hph_mode == CLS_H_LP || hph_mode == CLS_H_LOHIFI ||
+		    hph_mode == CLS_H_ULP) {
+			snd_soc_component_write_field(component,
+				WCD938X_HPH_REFBUFF_LP_CTL,
+				WCD938X_PREREF_FLIT_BYPASS_MASK, 1);
+		}
+		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
+					      WCD938X_HPHR_REF_EN_MASK, 1);
+		wcd_clsh_set_hph_mode(wcd938x->clsh_info, hph_mode);
+		/* 100 usec delay as per HW requirement */
+		usleep_range(100, 110);
+		set_bit(HPH_PA_DELAY, &wcd938x->status_mask);
+		snd_soc_component_write_field(component,
+					      WCD938X_DIGITAL_PDM_WD_CTL1,
+					      WCD938X_PDM_WD_EN_MASK, 0x3);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (test_bit(HPH_PA_DELAY, &wcd938x->status_mask)) {
+			if (!wcd938x->comp2_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+
+			if (hph_mode == CLS_H_LP || hph_mode == CLS_H_LOHIFI ||
+			    hph_mode == CLS_H_ULP)
+				snd_soc_component_write_field(component,
+						WCD938X_HPH_REFBUFF_LP_CTL,
+						WCD938X_PREREF_FLIT_BYPASS_MASK, 0);
+			clear_bit(HPH_PA_DELAY, &wcd938x->status_mask);
+		}
+		snd_soc_component_write_field(component, WCD938X_HPH_NEW_INT_HPH_TIMER1,
+					      WCD938X_AUTOCHOP_TIMER_EN, 1);
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI ||
+			hph_mode == CLS_AB_LP || hph_mode == CLS_AB_LOHIFI)
+			snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
+					WCD938X_REGULATOR_MODE_MASK,
+					WCD938X_REGULATOR_MODE_CLASS_AB);
+		enable_irq(wcd938x->hphr_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd938x->hphr_pdm_wd_int);
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (!wcd938x->comp2_enable)
+			usleep_range(20000, 20100);
+		else
+			usleep_range(7000, 7100);
+		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
+					      WCD938X_HPHR_EN_MASK, 0);
+		set_bit(HPH_PA_DELAY, &wcd938x->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (test_bit(HPH_PA_DELAY, &wcd938x->status_mask)) {
+			if (!wcd938x->comp2_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+			clear_bit(HPH_PA_DELAY, &wcd938x->status_mask);
+		}
+		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
+					      WCD938X_HPHR_REF_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_PDM_WD_CTL1,
+					      WCD938X_PDM_WD_EN_MASK, 0);
+		wcd_clsh_ctrl_set_state(wcd938x->clsh_info, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHR, hph_mode);
+		if (wcd938x->ldoh)
+			snd_soc_component_write_field(component, WCD938X_LDOH_MODE,
+						      WCD938X_LDOH_EN_MASK, 0);
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd938x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd938x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (wcd938x->ldoh)
+			snd_soc_component_write_field(component, WCD938X_LDOH_MODE,
+						      WCD938X_LDOH_EN_MASK, 1);
+		wcd_clsh_ctrl_set_state(wcd938x->clsh_info, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHL, hph_mode);
+		wcd_clsh_set_hph_mode(wcd938x->clsh_info, CLS_H_HIFI);
+		if (hph_mode == CLS_H_LP || hph_mode == CLS_H_LOHIFI ||
+		    hph_mode == CLS_H_ULP) {
+			snd_soc_component_write_field(component,
+					WCD938X_HPH_REFBUFF_LP_CTL,
+					WCD938X_PREREF_FLIT_BYPASS_MASK, 1);
+		}
+		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
+					      WCD938X_HPHL_REF_EN_MASK, 1);
+		wcd_clsh_set_hph_mode(wcd938x->clsh_info, hph_mode);
+		/* 100 usec delay as per HW requirement */
+		usleep_range(100, 110);
+		set_bit(HPH_PA_DELAY, &wcd938x->status_mask);
+		snd_soc_component_write_field(component,
+					WCD938X_DIGITAL_PDM_WD_CTL0,
+					WCD938X_PDM_WD_EN_MASK, 0x3);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (test_bit(HPH_PA_DELAY, &wcd938x->status_mask)) {
+			if (!wcd938x->comp1_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+			if (hph_mode == CLS_H_LP || hph_mode == CLS_H_LOHIFI ||
+			    hph_mode == CLS_H_ULP)
+				snd_soc_component_write_field(component,
+					WCD938X_HPH_REFBUFF_LP_CTL,
+					WCD938X_PREREF_FLIT_BYPASS_MASK, 0);
+			clear_bit(HPH_PA_DELAY, &wcd938x->status_mask);
+		}
+
+		snd_soc_component_write_field(component, WCD938X_HPH_NEW_INT_HPH_TIMER1,
+					      WCD938X_AUTOCHOP_TIMER_EN, 1);
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI ||
+			hph_mode == CLS_AB_LP || hph_mode == CLS_AB_LOHIFI)
+			snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
+					WCD938X_REGULATOR_MODE_MASK,
+					WCD938X_REGULATOR_MODE_CLASS_AB);
+		enable_irq(wcd938x->hphl_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (!wcd938x->comp1_enable)
+			usleep_range(20000, 20100);
+		else
+			usleep_range(7000, 7100);
+		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
+					      WCD938X_HPHL_EN_MASK, 0);
+		set_bit(HPH_PA_DELAY, &wcd938x->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (test_bit(HPH_PA_DELAY, &wcd938x->status_mask)) {
+			if (!wcd938x->comp1_enable)
+				usleep_range(21000, 21100);
+			else
+				usleep_range(7000, 7100);
+			clear_bit(HPH_PA_DELAY, &wcd938x->status_mask);
+		}
+		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
+					      WCD938X_HPHL_REF_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_PDM_WD_CTL0,
+					      WCD938X_PDM_WD_EN_MASK, 0);
+		wcd_clsh_ctrl_set_state(wcd938x->clsh_info, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHL, hph_mode);
+		if (wcd938x->ldoh)
+			snd_soc_component_write_field(component, WCD938X_LDOH_MODE,
+						      WCD938X_LDOH_EN_MASK, 0);
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd938x_codec_enable_aux_pa(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd938x->hph_mode;
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_PDM_WD_CTL2,
+					      WCD938X_AUX_PDM_WD_EN_MASK, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* 1 msec delay as per HW requirement */
+		usleep_range(1000, 1010);
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI ||
+			hph_mode == CLS_AB_LP || hph_mode == CLS_AB_LOHIFI)
+			snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
+					WCD938X_REGULATOR_MODE_MASK,
+					WCD938X_REGULATOR_MODE_CLASS_AB);
+		enable_irq(wcd938x->aux_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd938x->aux_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* 1 msec delay as per HW requirement */
+		usleep_range(1000, 1010);
+		snd_soc_component_write_field(component, WCD938X_DIGITAL_PDM_WD_CTL2,
+					      WCD938X_AUX_PDM_WD_EN_MASK, 0);
+		wcd_clsh_ctrl_set_state(wcd938x->clsh_info,
+			     WCD_CLSH_EVENT_POST_PA,
+			     WCD_CLSH_STATE_AUX,
+			     hph_mode);
+
+		wcd938x->flyback_cur_det_disable--;
+		if (wcd938x->flyback_cur_det_disable == 0)
+			snd_soc_component_write_field(component, WCD938X_FLYBACK_EN,
+						      WCD938X_EN_CUR_DET_MASK, 1);
+		break;
+	};
+	return ret;
+}
+
+static int wcd938x_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd938x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/*
+		 * Enable watchdog interrupt for HPHL or AUX
+		 * depending on mux value
+		 */
+		wcd938x->ear_rx_path = snd_soc_component_read(component,
+							      WCD938X_DIGITAL_CDC_EAR_PATH_CTL);
+		if (wcd938x->ear_rx_path & EAR_RX_PATH_AUX)
+			snd_soc_component_write_field(component, WCD938X_DIGITAL_PDM_WD_CTL2,
+					      WCD938X_AUX_PDM_WD_EN_MASK, 1);
+		else
+			snd_soc_component_write_field(component,
+						      WCD938X_DIGITAL_PDM_WD_CTL0,
+						      WCD938X_PDM_WD_EN_MASK, 0x3);
+		if (!wcd938x->comp1_enable)
+			snd_soc_component_write_field(component,
+						      WCD938X_ANA_EAR_COMPANDER_CTL,
+						      WCD938X_GAIN_OVRD_REG_MASK, 1);
+
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* 6 msec delay as per HW requirement */
+		usleep_range(6000, 6010);
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI ||
+			hph_mode == CLS_AB_LP || hph_mode == CLS_AB_LOHIFI)
+			snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
+					WCD938X_REGULATOR_MODE_MASK,
+					WCD938X_REGULATOR_MODE_CLASS_AB);
+		if (wcd938x->ear_rx_path & EAR_RX_PATH_AUX)
+			enable_irq(wcd938x->aux_pdm_wd_int);
+		else
+			enable_irq(wcd938x->hphl_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		if (wcd938x->ear_rx_path & EAR_RX_PATH_AUX)
+			disable_irq_nosync(wcd938x->aux_pdm_wd_int);
+		else
+			disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (!wcd938x->comp1_enable)
+			snd_soc_component_write_field(component, WCD938X_ANA_EAR_COMPANDER_CTL,
+						      WCD938X_GAIN_OVRD_REG_MASK, 0);
+		/* 7 msec delay as per HW requirement */
+		usleep_range(7000, 7010);
+		if (wcd938x->ear_rx_path & EAR_RX_PATH_AUX)
+			snd_soc_component_write_field(component, WCD938X_DIGITAL_PDM_WD_CTL2,
+					      WCD938X_AUX_PDM_WD_EN_MASK, 0);
+		else
+			snd_soc_component_write_field(component, WCD938X_DIGITAL_PDM_WD_CTL0,
+					WCD938X_PDM_WD_EN_MASK, 0);
+
+		wcd_clsh_ctrl_set_state(wcd938x->clsh_info, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_EAR, hph_mode);
+
+		wcd938x->flyback_cur_det_disable--;
+		if (wcd938x->flyback_cur_det_disable == 0)
+			snd_soc_component_write_field(component, WCD938X_FLYBACK_EN,
+						      WCD938X_EN_CUR_DET_MASK, 1);
+		break;
+	};
+
+	return 0;
+}
+
 static int wcd938x_tx_mode_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
@@ -1506,6 +2093,10 @@ static const char * const rx_hph_mode_mux_text[] = {
 	"CLS_H_ULP", "CLS_AB_HIFI", "CLS_AB_LP", "CLS_AB_LOHIFI",
 };
 
+static const char * const rdac3_mux_text[] = {
+	"RX1", "RX3"
+};
+
 static const struct soc_enum tx_mode_mux_enum_wcd9380[] = {
 	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tx_mode_mux_text_wcd9380),
 			tx_mode_mux_text_wcd9380),
@@ -1536,6 +2127,29 @@ static const struct soc_enum rx_hph_mode_mux_enum =
 		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text),
 				    rx_hph_mode_mux_text);
 
+static const struct soc_enum rdac3_enum =
+		SOC_ENUM_SINGLE(WCD938X_DIGITAL_CDC_EAR_PATH_CTL, 0,
+				ARRAY_SIZE(rdac3_mux_text), rdac3_mux_text);
+
+static const struct snd_kcontrol_new ear_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new aux_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new hphl_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new hphr_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new rx_rdac3_mux =
+	SOC_DAPM_ENUM("RDAC3_MUX Mux", rdac3_enum);
+
 static const struct snd_kcontrol_new wcd9380_snd_controls[] = {
 	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum_wcd9380,
 		     wcd938x_rx_hph_mode_get, wcd938x_rx_hph_mode_put),
@@ -1664,6 +2278,77 @@ static const struct snd_kcontrol_new wcd938x_snd_controls[] = {
 	SOC_SINGLE_TLV("ADC4 Volume", WCD938X_ANA_TX_CH4, 0, 20, 0, analog_gain),
 };
 
+static const struct snd_soc_dapm_widget wcd938x_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("IN1_HPHL"),
+	SND_SOC_DAPM_INPUT("IN2_HPHR"),
+	SND_SOC_DAPM_INPUT("IN3_AUX"),
+
+	/*rx widgets*/
+	SND_SOC_DAPM_PGA_E("EAR PGA", WCD938X_ANA_EAR, 7, 0, NULL, 0,
+			   wcd938x_codec_enable_ear_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("AUX PGA", WCD938X_AUX_AUXPA, 7, 0, NULL, 0,
+			   wcd938x_codec_enable_aux_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHL PGA", WCD938X_ANA_HPH, 7, 0, NULL, 0,
+			   wcd938x_codec_enable_hphl_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHR PGA", WCD938X_ANA_HPH, 6, 0, NULL, 0,
+			   wcd938x_codec_enable_hphr_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_DAC_E("RDAC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd938x_codec_hphl_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RDAC2", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd938x_codec_hphr_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RDAC3", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd938x_codec_ear_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RDAC4", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd938x_codec_aux_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("RDAC3_MUX", SND_SOC_NOPM, 0, 0, &rx_rdac3_mux),
+
+	SND_SOC_DAPM_SUPPLY("VDD_BUCK", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RXCLK", SND_SOC_NOPM, 0, 0,
+			    wcd938x_codec_enable_rxclk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("CLS_H_PORT", 1, SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MIXER_E("RX1", SND_SOC_NOPM, 0, 0, NULL, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER_E("RX2", SND_SOC_NOPM, 0, 0, NULL, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER_E("RX3", SND_SOC_NOPM, 0, 0, NULL, 0, NULL, 0),
+
+	/* rx mixer widgets*/
+	SND_SOC_DAPM_MIXER("EAR_RDAC", SND_SOC_NOPM, 0, 0,
+			   ear_rdac_switch, ARRAY_SIZE(ear_rdac_switch)),
+	SND_SOC_DAPM_MIXER("AUX_RDAC", SND_SOC_NOPM, 0, 0,
+			   aux_rdac_switch, ARRAY_SIZE(aux_rdac_switch)),
+	SND_SOC_DAPM_MIXER("HPHL_RDAC", SND_SOC_NOPM, 0, 0,
+			   hphl_rdac_switch, ARRAY_SIZE(hphl_rdac_switch)),
+	SND_SOC_DAPM_MIXER("HPHR_RDAC", SND_SOC_NOPM, 0, 0,
+			   hphr_rdac_switch, ARRAY_SIZE(hphr_rdac_switch)),
+
+	/*output widgets rx*/
+	SND_SOC_DAPM_OUTPUT("EAR"),
+	SND_SOC_DAPM_OUTPUT("AUX"),
+	SND_SOC_DAPM_OUTPUT("HPHL"),
+	SND_SOC_DAPM_OUTPUT("HPHR"),
+};
+
 static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
 {
 	/* min micbias voltage is 1V and maximum is 2.85V */
@@ -1827,6 +2512,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x = {
 	.probe = wcd938x_soc_codec_probe,
 	.controls = wcd938x_snd_controls,
 	.num_controls = ARRAY_SIZE(wcd938x_snd_controls),
+	.dapm_widgets = wcd938x_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wcd938x_dapm_widgets),
 };
 
 static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
-- 
2.21.0

