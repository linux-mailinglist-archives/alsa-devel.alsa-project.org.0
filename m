Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B203CB680
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 13:01:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 566C41680;
	Fri, 16 Jul 2021 13:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 566C41680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626433266;
	bh=VuwuGNNF5GTdHP8WwFzeX200pmjeic2G4G08l+A/pNk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WDYnZTyetp+Ie9+UdVuHe2QLnXUG4KbIiObrtE3KvG/Lm3QMD2pN0HiSGwV/z4ujQ
	 ZnQ750XWrqqSBZav0uce+pIxwzw3Cw68EZpAJC+cXfmqN8Y1FOi5aKfljmbMWjkROU
	 vif6Z6R/ZV1NEkwJwdTOpzrC+p151cH3UrVaDrOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF103F800FE;
	Fri, 16 Jul 2021 12:59:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11CDEF80269; Fri, 16 Jul 2021 12:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7816F80254
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 12:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7816F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iauWSNpU"
Received: by mail-wm1-x330.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so7936656wms.1
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 03:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+b9ga00JUE7+OvhP6djRJYNNztfBK9JQRQIIpiD3QI=;
 b=iauWSNpUcNpG41J4WtKeioFViTF0Wv9Sk20uuCxN4yQlI/0Tjf8ZxRAuSZDPDRy2gm
 qLsL055zLi9GQAwESezviI8wXBGsspU9T2KqqtTgb3l/1H4chLIDQdGV5OqFPSl2nHtB
 LkyMB6PDnMKs20kzoZwYAAJ2jg2/MP5+ccDiBNFmZe3gDdSay7uq7HLgtT13V6om1jMY
 fa2ZTMDt9sfDVmd4z2m3QMh9NKWisMpOi6uTECE22q/0q6qFgglr7YuiSzWONSnE440y
 9qqZ3CPcVK2Ke0B7W74g8XiWaVTOf2wOLhaMY1PbcdbhNl1308sUWFwdpprnumVr/dxw
 zFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+b9ga00JUE7+OvhP6djRJYNNztfBK9JQRQIIpiD3QI=;
 b=UpqL+Z3CrGa9Eh5pmiZ7PvptH9O1x8kTZBjQL1V1BSRkvuxfiDgAeNzBgPk9rlWpJS
 lvBYoOkF4r8pwYgl+t0At0yCgfrmUvWhigvkeGf8eTT4CSby5EEEqfD36yKEf2WF1vB/
 c3FofgNck2kJFvRLQmlq4COFOlpfN2Nq0QkhSyQF2/cD6QrBGq0XnOD5Y+eDRUiqoEF0
 esuPMUOA4Fgpm4FdP5eqCMF6SbfBEADlTpekC/0FW0LVpaUqxVWujv4N+YQjfTTLBtKP
 sMhwya58adR88rQfFPY2p4QduuZsiHNZVG2eRtFKFnmofeCf1dn3tMMpJtJLfSKb+FRW
 rN6w==
X-Gm-Message-State: AOAM533Pwx/yTnPTb8piOVwluuloItLTTGwBijqfdTmg+5AaDqKm4lwy
 PmrikfXUUIj+utAUA8HwrgkhqQ==
X-Google-Smtp-Source: ABdhPJztj9hC0P9GZHFpdPyjbB4NKosVtzlUiPwJ++GV2VTcOJkvAGjNjRuI747OIGHYdK2Pz1+zlg==
X-Received: by 2002:a05:600c:358d:: with SMTP id
 p13mr16367013wmq.12.1626433170595; 
 Fri, 16 Jul 2021 03:59:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 19sm7863003wmu.17.2021.07.16.03.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:59:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: wcd938x: add Multi Button Headset Control
 support
Date: Fri, 16 Jul 2021 11:59:18 +0100
Message-Id: <20210716105918.7301-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
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

WCD938x has Multi Button Headset Control hardware to support Headset
insertion, type detection, 8 headset buttons detection, Over Current
detection and Impedence measurements.
This patch adds support for this using wcd-mbhc apis.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig   |   1 +
 sound/soc/codecs/wcd938x.c | 841 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 819 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6d4c65d6fadd..57437eef1125 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1563,6 +1563,7 @@ config SND_SOC_WCD938X
 config SND_SOC_WCD938X_SDW
 	tristate "WCD9380/WCD9385 Codec - SDW"
 	select SND_SOC_WCD938X
+	select SND_SOC_WCD_MBHC
 	depends on SOUNDWIRE
 	select REGMAP_SOUNDWIRE
 	help
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e5795cd964f7..90e072a78ebf 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -21,6 +21,7 @@
 #include <linux/regulator/consumer.h>
 
 #include "wcd-clsh-v2.h"
+#include "wcd-mbhc-v2.h"
 #include "wcd938x.h"
 
 #define WCD938X_MAX_MICBIAS		(4)
@@ -173,6 +174,11 @@ struct wcd938x_priv {
 	struct device *rxdev;
 	struct device_node *rxnode, *txnode;
 	struct regmap *regmap;
+	struct mutex micb_lock;
+	/* mbhc module */
+	struct wcd_mbhc *wcd_mbhc;
+	struct wcd_mbhc_config mbhc_cfg;
+	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
 	struct irq_domain *virq;
 	struct regmap_irq_chip *wcd_regmap_irq_chip;
@@ -201,24 +207,70 @@ struct wcd938x_priv {
 	bool bcs_dis;
 };
 
-enum {
-	MIC_BIAS_1 = 1,
-	MIC_BIAS_2,
-	MIC_BIAS_3,
-	MIC_BIAS_4
-};
-
-enum {
-	MICB_PULLUP_ENABLE,
-	MICB_PULLUP_DISABLE,
-	MICB_ENABLE,
-	MICB_DISABLE,
-};
-
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(line_gain, 600, -3000);
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(analog_gain, 0, 3000);
 
+struct wcd938x_mbhc_zdet_param {
+	u16 ldo_ctl;
+	u16 noff;
+	u16 nshift;
+	u16 btn5;
+	u16 btn6;
+	u16 btn7;
+};
+
+static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD938X_ANA_MBHC_MECH, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD938X_ANA_MBHC_MECH, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD938X_ANA_MBHC_MECH, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_MIC_CLAMP_CTL, WCD938X_MBHC_NEW_PLUG_DETECT_CTL, 0x30),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_DETECTION_TYPE, WCD938X_ANA_MBHC_ELECT, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_CTRL, WCD938X_MBHC_NEW_INT_MECH_DET_CURRENT, 0x1F),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, WCD938X_ANA_MBHC_MECH, 0x04),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PLUG_TYPE, WCD938X_ANA_MBHC_MECH, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_GND_PLUG_TYPE, WCD938X_ANA_MBHC_MECH, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_SW_HPH_LP_100K_TO_GND, WCD938X_ANA_MBHC_MECH, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_SCHMT_ISRC, WCD938X_ANA_MBHC_ELECT, 0x06),
+	WCD_MBHC_FIELD(WCD_MBHC_FSM_EN, WCD938X_ANA_MBHC_ELECT, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_INSREM_DBNC, WCD938X_MBHC_NEW_PLUG_DETECT_CTL, 0x0F),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_DBNC, WCD938X_MBHC_NEW_CTL_1, 0x03),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_VREF, WCD938X_MBHC_NEW_CTL_2, 0x03),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_COMP_RESULT, WCD938X_ANA_MBHC_RESULT_3, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_IN2P_CLAMP_STATE, WCD938X_ANA_MBHC_RESULT_3, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_MIC_SCHMT_RESULT, WCD938X_ANA_MBHC_RESULT_3, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_SCHMT_RESULT, WCD938X_ANA_MBHC_RESULT_3, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_SCHMT_RESULT, WCD938X_ANA_MBHC_RESULT_3, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_OCP_FSM_EN, WCD938X_HPH_OCP_CTL, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_RESULT, WCD938X_ANA_MBHC_RESULT_3, 0x07),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_ISRC_CTL, WCD938X_ANA_MBHC_ELECT, 0x70),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_RESULT, WCD938X_ANA_MBHC_RESULT_3, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_MICB_CTRL, WCD938X_ANA_MICB2, 0xC0),
+	WCD_MBHC_FIELD(WCD_MBHC_HPH_CNP_WG_TIME, WCD938X_HPH_CNP_WG_TIME, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_PA_EN, WCD938X_ANA_HPH, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PA_EN, WCD938X_ANA_HPH, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPH_PA_EN, WCD938X_ANA_HPH, 0xC0),
+	WCD_MBHC_FIELD(WCD_MBHC_SWCH_LEVEL_REMOVE, WCD938X_ANA_MBHC_RESULT_3, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_ANC_DET_EN, WCD938X_MBHC_CTL_BCS, 0x02),
+	WCD_MBHC_FIELD(WCD_MBHC_FSM_STATUS, WCD938X_MBHC_NEW_FSM_STATUS, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_MUX_CTL, WCD938X_MBHC_NEW_CTL_2, 0x70),
+	WCD_MBHC_FIELD(WCD_MBHC_MOISTURE_STATUS, WCD938X_MBHC_NEW_FSM_STATUS, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_GND, WCD938X_HPH_PA_CTL2, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_GND, WCD938X_HPH_PA_CTL2, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_DET_EN, WCD938X_HPH_L_TEST, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_DET_EN, WCD938X_HPH_R_TEST, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_STATUS, WCD938X_DIGITAL_INTR_STATUS_0, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_STATUS, WCD938X_DIGITAL_INTR_STATUS_0, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_EN, WCD938X_MBHC_NEW_CTL_1, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_COMPLETE, WCD938X_MBHC_NEW_FSM_STATUS, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_TIMEOUT, WCD938X_MBHC_NEW_FSM_STATUS, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_RESULT, WCD938X_MBHC_NEW_ADC_RESULT, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_MICB2_VOUT, WCD938X_ANA_MICB2, 0x3F),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_MODE, WCD938X_MBHC_NEW_CTL_1, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_DETECTION_DONE, WCD938X_MBHC_NEW_CTL_1, 0x04),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_ISRC_EN, WCD938X_ANA_MBHC_ZDET, 0x02),
+};
+
 static const struct reg_default wcd938x_defaults[] = {
 	{WCD938X_ANA_PAGE_REGISTER,                            0x00},
 	{WCD938X_ANA_BIAS,                                     0x00},
@@ -1725,6 +1777,8 @@ static int wcd938x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 			usleep_range(7000, 7100);
 		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
 					      WCD938X_HPHR_EN_MASK, 0);
+		wcd_mbhc_event_notify(wcd938x->wcd_mbhc,
+					     WCD_EVENT_PRE_HPHR_PA_OFF);
 		set_bit(HPH_PA_DELAY, &wcd938x->status_mask);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
@@ -1740,6 +1794,8 @@ static int wcd938x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 				usleep_range(7000, 7100);
 			clear_bit(HPH_PA_DELAY, &wcd938x->status_mask);
 		}
+		wcd_mbhc_event_notify(wcd938x->wcd_mbhc,
+					     WCD_EVENT_POST_HPHR_PA_OFF);
 		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
 					      WCD938X_HPHR_REF_EN_MASK, 0);
 		snd_soc_component_write_field(component, WCD938X_DIGITAL_PDM_WD_CTL1,
@@ -1827,6 +1883,7 @@ static int wcd938x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 			usleep_range(7000, 7100);
 		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
 					      WCD938X_HPHL_EN_MASK, 0);
+		wcd_mbhc_event_notify(wcd938x->wcd_mbhc, WCD_EVENT_PRE_HPHL_PA_OFF);
 		set_bit(HPH_PA_DELAY, &wcd938x->status_mask);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
@@ -1842,6 +1899,8 @@ static int wcd938x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 				usleep_range(7000, 7100);
 			clear_bit(HPH_PA_DELAY, &wcd938x->status_mask);
 		}
+		wcd_mbhc_event_notify(wcd938x->wcd_mbhc,
+					     WCD_EVENT_POST_HPHL_PA_OFF);
 		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
 					      WCD938X_HPHL_REF_EN_MASK, 0);
 		snd_soc_component_write_field(component, WCD938X_DIGITAL_PDM_WD_CTL0,
@@ -2352,7 +2411,14 @@ static int wcd938x_micbias_control(struct snd_soc_component *component,
 			snd_soc_component_write_field(component, micb_reg,
 						      WCD938X_MICB_EN_MASK,
 						      WCD938X_MICB_ENABLE);
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd938x->wcd_mbhc,
+						      WCD_EVENT_POST_MICBIAS_2_ON);
 		}
+		if (micb_num  == MIC_BIAS_2 && is_dapm)
+			wcd_mbhc_event_notify(wcd938x->wcd_mbhc,
+					      WCD_EVENT_POST_DAPM_MICBIAS_2_ON);
+
 
 		break;
 	case MICB_DISABLE:
@@ -2366,10 +2432,19 @@ static int wcd938x_micbias_control(struct snd_soc_component *component,
 						      WCD938X_MICB_PULL_UP);
 		else if ((wcd938x->micb_ref[micb_index] == 0) &&
 			 (wcd938x->pullup_ref[micb_index] == 0)) {
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd938x->wcd_mbhc,
+						      WCD_EVENT_PRE_MICBIAS_2_OFF);
 
 			snd_soc_component_write_field(component, micb_reg,
 						      WCD938X_MICB_EN_MASK, 0);
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd938x->wcd_mbhc,
+						      WCD_EVENT_POST_MICBIAS_2_OFF);
 		}
+		if (is_dapm && micb_num  == MIC_BIAS_2)
+			wcd_mbhc_event_notify(wcd938x->wcd_mbhc,
+					      WCD_EVENT_POST_DAPM_MICBIAS_2_OFF);
 		break;
 	}
 
@@ -2842,6 +2917,704 @@ static int wcd938x_set_swr_port(struct snd_kcontrol *kcontrol,
 
 }
 
+/* MBHC related */
+static void wcd938x_mbhc_clk_setup(struct snd_soc_component *component,
+				   bool enable)
+{
+	snd_soc_component_write_field(component, WCD938X_MBHC_NEW_CTL_1,
+				      WCD938X_MBHC_CTL_RCO_EN_MASK, enable);
+}
+
+static void wcd938x_mbhc_mbhc_bias_control(struct snd_soc_component *component,
+					   bool enable)
+{
+	snd_soc_component_write_field(component, WCD938X_ANA_MBHC_ELECT,
+				      WCD938X_ANA_MBHC_BIAS_EN, enable);
+}
+
+static void wcd938x_mbhc_program_btn_thr(struct snd_soc_component *component,
+					 int *btn_low, int *btn_high,
+					 int num_btn, bool is_micbias)
+{
+	int i, vth;
+
+	if (num_btn > WCD_MBHC_DEF_BUTTONS) {
+		dev_err(component->dev, "%s: invalid number of buttons: %d\n",
+			__func__, num_btn);
+		return;
+	}
+
+	for (i = 0; i < num_btn; i++) {
+		vth = ((btn_high[i] * 2) / 25) & 0x3F;
+		snd_soc_component_write_field(component, WCD938X_ANA_MBHC_BTN0 + i,
+					   WCD938X_MBHC_BTN_VTH_MASK, vth);
+		dev_dbg(component->dev, "%s: btn_high[%d]: %d, vth: %d\n",
+			__func__, i, btn_high[i], vth);
+	}
+}
+
+static bool wcd938x_mbhc_micb_en_status(struct snd_soc_component *component, int micb_num)
+{
+	u8 val;
+
+	if (micb_num == MIC_BIAS_2) {
+		val = snd_soc_component_read_field(component,
+						   WCD938X_ANA_MICB2,
+						   WCD938X_ANA_MICB2_ENABLE_MASK);
+		if (val == WCD938X_MICB_ENABLE)
+			return true;
+	}
+	return false;
+}
+
+static void wcd938x_mbhc_hph_l_pull_up_control(struct snd_soc_component *component,
+							int pull_up_cur)
+{
+	/* Default pull up current to 2uA */
+	if (pull_up_cur > HS_PULLUP_I_OFF || pull_up_cur < HS_PULLUP_I_3P0_UA)
+		pull_up_cur = HS_PULLUP_I_2P0_UA;
+
+	snd_soc_component_write_field(component,
+				      WCD938X_MBHC_NEW_INT_MECH_DET_CURRENT,
+				      WCD938X_HSDET_PULLUP_C_MASK, pull_up_cur);
+}
+
+static int wcd938x_mbhc_request_micbias(struct snd_soc_component *component,
+					int micb_num, int req)
+{
+	return wcd938x_micbias_control(component, micb_num, req, false);
+}
+
+static void wcd938x_mbhc_micb_ramp_control(struct snd_soc_component *component,
+					   bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, WCD938X_ANA_MICB2_RAMP,
+				    WCD938X_RAMP_SHIFT_CTRL_MASK, 0x0C);
+		snd_soc_component_write_field(component, WCD938X_ANA_MICB2_RAMP,
+				    WCD938X_RAMP_EN_MASK, 1);
+	} else {
+		snd_soc_component_write_field(component, WCD938X_ANA_MICB2_RAMP,
+				    WCD938X_RAMP_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_ANA_MICB2_RAMP,
+				    WCD938X_RAMP_SHIFT_CTRL_MASK, 0);
+	}
+}
+
+static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
+{
+	/* min micbias voltage is 1V and maximum is 2.85V */
+	if (micb_mv < 1000 || micb_mv > 2850)
+		return -EINVAL;
+
+	return (micb_mv - 1000) / 50;
+}
+
+static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
+					    int req_volt, int micb_num)
+{
+	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
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
+		return -EINVAL;
+	}
+	mutex_lock(&wcd938x->micb_lock);
+	/*
+	 * If requested micbias voltage is same as current micbias
+	 * voltage, then just return. Otherwise, adjust voltage as
+	 * per requested value. If micbias is already enabled, then
+	 * to avoid slow micbias ramp-up or down enable pull-up
+	 * momentarily, change the micbias value and then re-enable
+	 * micbias.
+	 */
+	micb_en = snd_soc_component_read_field(component, micb_reg,
+						WCD938X_MICB_EN_MASK);
+	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
+						    WCD938X_MICB_VOUT_MASK);
+
+	req_vout_ctl = wcd938x_get_micb_vout_ctl_val(req_volt);
+	if (req_vout_ctl < 0) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (cur_vout_ctl == req_vout_ctl) {
+		ret = 0;
+		goto exit;
+	}
+
+	if (micb_en == WCD938X_MICB_ENABLE)
+		snd_soc_component_write_field(component, micb_reg,
+					      WCD938X_MICB_EN_MASK,
+					      WCD938X_MICB_PULL_UP);
+
+	snd_soc_component_write_field(component, micb_reg,
+				      WCD938X_MICB_VOUT_MASK,
+				      req_vout_ctl);
+
+	if (micb_en == WCD938X_MICB_ENABLE) {
+		snd_soc_component_write_field(component, micb_reg,
+					      WCD938X_MICB_EN_MASK,
+					      WCD938X_MICB_ENABLE);
+		/*
+		 * Add 2ms delay as per HW requirement after enabling
+		 * micbias
+		 */
+		usleep_range(2000, 2100);
+	}
+exit:
+	mutex_unlock(&wcd938x->micb_lock);
+	return ret;
+}
+
+static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
+						int micb_num, bool req_en)
+{
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int rc, micb_mv;
+
+	if (micb_num != MIC_BIAS_2)
+		return -EINVAL;
+	/*
+	 * If device tree micbias level is already above the minimum
+	 * voltage needed to detect threshold microphone, then do
+	 * not change the micbias, just return.
+	 */
+	if (wcd938x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
+		return 0;
+
+	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd938x->micb2_mv;
+
+	rc = wcd938x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
+
+	return rc;
+}
+
+static inline void wcd938x_mbhc_get_result_params(struct wcd938x_priv *wcd938x,
+						s16 *d1_a, u16 noff,
+						int32_t *zdet)
+{
+	int i;
+	int val, val1;
+	s16 c1;
+	s32 x1, d1;
+	int32_t denom;
+	int minCode_param[] = {
+			3277, 1639, 820, 410, 205, 103, 52, 26
+	};
+
+	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MBHC_ZDET, 0x20, 0x20);
+	for (i = 0; i < WCD938X_ZDET_NUM_MEASUREMENTS; i++) {
+		regmap_read(wcd938x->regmap, WCD938X_ANA_MBHC_RESULT_2, &val);
+		if (val & 0x80)
+			break;
+	}
+	val = val << 0x8;
+	regmap_read(wcd938x->regmap, WCD938X_ANA_MBHC_RESULT_1, &val1);
+	val |= val1;
+	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MBHC_ZDET, 0x20, 0x00);
+	x1 = WCD938X_MBHC_GET_X1(val);
+	c1 = WCD938X_MBHC_GET_C1(val);
+	/* If ramp is not complete, give additional 5ms */
+	if ((c1 < 2) && x1)
+		usleep_range(5000, 5050);
+
+	if (!c1 || !x1) {
+		pr_err("%s: Impedance detect ramp error, c1=%d, x1=0x%x\n",
+			__func__, c1, x1);
+		goto ramp_down;
+	}
+	d1 = d1_a[c1];
+	denom = (x1 * d1) - (1 << (14 - noff));
+	if (denom > 0)
+		*zdet = (WCD938X_MBHC_ZDET_CONST * 1000) / denom;
+	else if (x1 < minCode_param[noff])
+		*zdet = WCD938X_ZDET_FLOATING_IMPEDANCE;
+
+	pr_err("%s: d1=%d, c1=%d, x1=0x%x, z_val=%d(milliOhm)\n",
+		__func__, d1, c1, x1, *zdet);
+ramp_down:
+	i = 0;
+	while (x1) {
+		regmap_read(wcd938x->regmap,
+				 WCD938X_ANA_MBHC_RESULT_1, &val);
+		regmap_read(wcd938x->regmap,
+				 WCD938X_ANA_MBHC_RESULT_2, &val1);
+		val = val << 0x08;
+		val |= val1;
+		x1 = WCD938X_MBHC_GET_X1(val);
+		i++;
+		if (i == WCD938X_ZDET_NUM_MEASUREMENTS)
+			break;
+	}
+}
+
+static void wcd938x_mbhc_zdet_ramp(struct snd_soc_component *component,
+				 struct wcd938x_mbhc_zdet_param *zdet_param,
+				 int32_t *zl, int32_t *zr, s16 *d1_a)
+{
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int32_t zdet = 0;
+
+	snd_soc_component_write_field(component, WCD938X_MBHC_NEW_ZDET_ANA_CTL,
+				WCD938X_ZDET_MAXV_CTL_MASK, zdet_param->ldo_ctl);
+	snd_soc_component_update_bits(component, WCD938X_ANA_MBHC_BTN5,
+				    WCD938X_VTH_MASK, zdet_param->btn5);
+	snd_soc_component_update_bits(component, WCD938X_ANA_MBHC_BTN6,
+				      WCD938X_VTH_MASK, zdet_param->btn6);
+	snd_soc_component_update_bits(component, WCD938X_ANA_MBHC_BTN7,
+				     WCD938X_VTH_MASK, zdet_param->btn7);
+	snd_soc_component_write_field(component, WCD938X_MBHC_NEW_ZDET_ANA_CTL,
+				WCD938X_ZDET_RANGE_CTL_MASK, zdet_param->noff);
+	snd_soc_component_update_bits(component, WCD938X_MBHC_NEW_ZDET_RAMP_CTL,
+				0x0F, zdet_param->nshift);
+
+	if (!zl)
+		goto z_right;
+	/* Start impedance measurement for HPH_L */
+	regmap_update_bits(wcd938x->regmap,
+			   WCD938X_ANA_MBHC_ZDET, 0x80, 0x80);
+	dev_dbg(component->dev, "%s: ramp for HPH_L, noff = %d\n",
+		__func__, zdet_param->noff);
+	wcd938x_mbhc_get_result_params(wcd938x, d1_a, zdet_param->noff, &zdet);
+	regmap_update_bits(wcd938x->regmap,
+			   WCD938X_ANA_MBHC_ZDET, 0x80, 0x00);
+
+	*zl = zdet;
+
+z_right:
+	if (!zr)
+		return;
+	/* Start impedance measurement for HPH_R */
+	regmap_update_bits(wcd938x->regmap,
+			   WCD938X_ANA_MBHC_ZDET, 0x40, 0x40);
+	dev_dbg(component->dev, "%s: ramp for HPH_R, noff = %d\n",
+		__func__, zdet_param->noff);
+	wcd938x_mbhc_get_result_params(wcd938x, d1_a, zdet_param->noff, &zdet);
+	regmap_update_bits(wcd938x->regmap,
+			   WCD938X_ANA_MBHC_ZDET, 0x40, 0x00);
+
+	*zr = zdet;
+}
+
+static inline void wcd938x_wcd_mbhc_qfuse_cal(struct snd_soc_component *component,
+					      int32_t *z_val, int flag_l_r)
+{
+	s16 q1;
+	int q1_cal;
+
+	if (*z_val < (WCD938X_ZDET_VAL_400/1000))
+		q1 = snd_soc_component_read(component,
+			WCD938X_DIGITAL_EFUSE_REG_23 + (2 * flag_l_r));
+	else
+		q1 = snd_soc_component_read(component,
+			WCD938X_DIGITAL_EFUSE_REG_24 + (2 * flag_l_r));
+	if (q1 & 0x80)
+		q1_cal = (10000 - ((q1 & 0x7F) * 25));
+	else
+		q1_cal = (10000 + (q1 * 25));
+	if (q1_cal > 0)
+		*z_val = ((*z_val) * 10000) / q1_cal;
+}
+
+static void wcd938x_wcd_mbhc_calc_impedance(struct snd_soc_component *component,
+					    uint32_t *zl, uint32_t *zr)
+{
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	s16 reg0, reg1, reg2, reg3, reg4;
+	int32_t z1L, z1R, z1Ls;
+	int zMono, z_diff1, z_diff2;
+	bool is_fsm_disable = false;
+	struct wcd938x_mbhc_zdet_param zdet_param[] = {
+		{4, 0, 4, 0x08, 0x14, 0x18}, /* < 32ohm */
+		{2, 0, 3, 0x18, 0x7C, 0x90}, /* 32ohm < Z < 400ohm */
+		{1, 4, 5, 0x18, 0x7C, 0x90}, /* 400ohm < Z < 1200ohm */
+		{1, 6, 7, 0x18, 0x7C, 0x90}, /* >1200ohm */
+	};
+	struct wcd938x_mbhc_zdet_param *zdet_param_ptr = NULL;
+	s16 d1_a[][4] = {
+		{0, 30, 90, 30},
+		{0, 30, 30, 5},
+		{0, 30, 30, 5},
+		{0, 30, 30, 5},
+	};
+	s16 *d1 = NULL;
+
+	reg0 = snd_soc_component_read(component, WCD938X_ANA_MBHC_BTN5);
+	reg1 = snd_soc_component_read(component, WCD938X_ANA_MBHC_BTN6);
+	reg2 = snd_soc_component_read(component, WCD938X_ANA_MBHC_BTN7);
+	reg3 = snd_soc_component_read(component, WCD938X_MBHC_CTL_CLK);
+	reg4 = snd_soc_component_read(component, WCD938X_MBHC_NEW_ZDET_ANA_CTL);
+
+	if (snd_soc_component_read(component, WCD938X_ANA_MBHC_ELECT) & 0x80) {
+		is_fsm_disable = true;
+		regmap_update_bits(wcd938x->regmap,
+				   WCD938X_ANA_MBHC_ELECT, 0x80, 0x00);
+	}
+
+	/* For NO-jack, disable L_DET_EN before Z-det measurements */
+	if (wcd938x->mbhc_cfg.hphl_swh)
+		regmap_update_bits(wcd938x->regmap,
+				   WCD938X_ANA_MBHC_MECH, 0x80, 0x00);
+
+	/* Turn off 100k pull down on HPHL */
+	regmap_update_bits(wcd938x->regmap,
+			   WCD938X_ANA_MBHC_MECH, 0x01, 0x00);
+
+	/* Disable surge protection before impedance detection.
+	 * This is done to give correct value for high impedance.
+	 */
+	regmap_update_bits(wcd938x->regmap,
+			   WCD938X_HPH_SURGE_HPHLR_SURGE_EN, 0xC0, 0x00);
+	/* 1ms delay needed after disable surge protection */
+	usleep_range(1000, 1010);
+
+	/* First get impedance on Left */
+	d1 = d1_a[1];
+	zdet_param_ptr = &zdet_param[1];
+	wcd938x_mbhc_zdet_ramp(component, zdet_param_ptr, &z1L, NULL, d1);
+
+	if (!WCD938X_MBHC_IS_SECOND_RAMP_REQUIRED(z1L))
+		goto left_ch_impedance;
+
+	/* Second ramp for left ch */
+	if (z1L < WCD938X_ZDET_VAL_32) {
+		zdet_param_ptr = &zdet_param[0];
+		d1 = d1_a[0];
+	} else if ((z1L > WCD938X_ZDET_VAL_400) &&
+		  (z1L <= WCD938X_ZDET_VAL_1200)) {
+		zdet_param_ptr = &zdet_param[2];
+		d1 = d1_a[2];
+	} else if (z1L > WCD938X_ZDET_VAL_1200) {
+		zdet_param_ptr = &zdet_param[3];
+		d1 = d1_a[3];
+	}
+	wcd938x_mbhc_zdet_ramp(component, zdet_param_ptr, &z1L, NULL, d1);
+
+left_ch_impedance:
+	if ((z1L == WCD938X_ZDET_FLOATING_IMPEDANCE) ||
+		(z1L > WCD938X_ZDET_VAL_100K)) {
+		*zl = WCD938X_ZDET_FLOATING_IMPEDANCE;
+		zdet_param_ptr = &zdet_param[1];
+		d1 = d1_a[1];
+	} else {
+		*zl = z1L/1000;
+		wcd938x_wcd_mbhc_qfuse_cal(component, zl, 0);
+	}
+	dev_dbg(component->dev, "%s: impedance on HPH_L = %d(ohms)\n",
+		__func__, *zl);
+
+	/* Start of right impedance ramp and calculation */
+	wcd938x_mbhc_zdet_ramp(component, zdet_param_ptr, NULL, &z1R, d1);
+	if (WCD938X_MBHC_IS_SECOND_RAMP_REQUIRED(z1R)) {
+		if (((z1R > WCD938X_ZDET_VAL_1200) &&
+			(zdet_param_ptr->noff == 0x6)) ||
+			((*zl) != WCD938X_ZDET_FLOATING_IMPEDANCE))
+			goto right_ch_impedance;
+		/* Second ramp for right ch */
+		if (z1R < WCD938X_ZDET_VAL_32) {
+			zdet_param_ptr = &zdet_param[0];
+			d1 = d1_a[0];
+		} else if ((z1R > WCD938X_ZDET_VAL_400) &&
+			(z1R <= WCD938X_ZDET_VAL_1200)) {
+			zdet_param_ptr = &zdet_param[2];
+			d1 = d1_a[2];
+		} else if (z1R > WCD938X_ZDET_VAL_1200) {
+			zdet_param_ptr = &zdet_param[3];
+			d1 = d1_a[3];
+		}
+		wcd938x_mbhc_zdet_ramp(component, zdet_param_ptr, NULL, &z1R, d1);
+	}
+right_ch_impedance:
+	if ((z1R == WCD938X_ZDET_FLOATING_IMPEDANCE) ||
+		(z1R > WCD938X_ZDET_VAL_100K)) {
+		*zr = WCD938X_ZDET_FLOATING_IMPEDANCE;
+	} else {
+		*zr = z1R/1000;
+		wcd938x_wcd_mbhc_qfuse_cal(component, zr, 1);
+	}
+	dev_dbg(component->dev, "%s: impedance on HPH_R = %d(ohms)\n",
+		__func__, *zr);
+
+	/* Mono/stereo detection */
+	if ((*zl == WCD938X_ZDET_FLOATING_IMPEDANCE) &&
+		(*zr == WCD938X_ZDET_FLOATING_IMPEDANCE)) {
+		dev_dbg(component->dev,
+			"%s: plug type is invalid or extension cable\n",
+			__func__);
+		goto zdet_complete;
+	}
+	if ((*zl == WCD938X_ZDET_FLOATING_IMPEDANCE) ||
+	    (*zr == WCD938X_ZDET_FLOATING_IMPEDANCE) ||
+	    ((*zl < WCD_MONO_HS_MIN_THR) && (*zr > WCD_MONO_HS_MIN_THR)) ||
+	    ((*zl > WCD_MONO_HS_MIN_THR) && (*zr < WCD_MONO_HS_MIN_THR))) {
+		dev_dbg(component->dev,
+			"%s: Mono plug type with one ch floating or shorted to GND\n",
+			__func__);
+		wcd_mbhc_set_hph_type(wcd938x->wcd_mbhc, WCD_MBHC_HPH_MONO);
+		goto zdet_complete;
+	}
+	snd_soc_component_write_field(component, WCD938X_HPH_R_ATEST,
+				      WCD938X_HPHPA_GND_OVR_MASK, 1);
+	snd_soc_component_write_field(component, WCD938X_HPH_PA_CTL2,
+				      WCD938X_HPHPA_GND_R_MASK, 1);
+	if (*zl < (WCD938X_ZDET_VAL_32/1000))
+		wcd938x_mbhc_zdet_ramp(component, &zdet_param[0], &z1Ls, NULL, d1);
+	else
+		wcd938x_mbhc_zdet_ramp(component, &zdet_param[1], &z1Ls, NULL, d1);
+	snd_soc_component_write_field(component, WCD938X_HPH_PA_CTL2,
+				      WCD938X_HPHPA_GND_R_MASK, 0);
+	snd_soc_component_write_field(component, WCD938X_HPH_R_ATEST,
+				      WCD938X_HPHPA_GND_OVR_MASK, 0);
+	z1Ls /= 1000;
+	wcd938x_wcd_mbhc_qfuse_cal(component, &z1Ls, 0);
+	/* Parallel of left Z and 9 ohm pull down resistor */
+	zMono = ((*zl) * 9) / ((*zl) + 9);
+	z_diff1 = (z1Ls > zMono) ? (z1Ls - zMono) : (zMono - z1Ls);
+	z_diff2 = ((*zl) > z1Ls) ? ((*zl) - z1Ls) : (z1Ls - (*zl));
+	if ((z_diff1 * (*zl + z1Ls)) > (z_diff2 * (z1Ls + zMono))) {
+		dev_dbg(component->dev, "%s: stereo plug type detected\n",
+			__func__);
+		wcd_mbhc_set_hph_type(wcd938x->wcd_mbhc, WCD_MBHC_HPH_STEREO);
+	} else {
+		dev_dbg(component->dev, "%s: MONO plug type detected\n",
+			__func__);
+		wcd_mbhc_set_hph_type(wcd938x->wcd_mbhc, WCD_MBHC_HPH_MONO);
+	}
+
+	/* Enable surge protection again after impedance detection */
+	regmap_update_bits(wcd938x->regmap,
+			   WCD938X_HPH_SURGE_HPHLR_SURGE_EN, 0xC0, 0xC0);
+zdet_complete:
+	snd_soc_component_write(component, WCD938X_ANA_MBHC_BTN5, reg0);
+	snd_soc_component_write(component, WCD938X_ANA_MBHC_BTN6, reg1);
+	snd_soc_component_write(component, WCD938X_ANA_MBHC_BTN7, reg2);
+	/* Turn on 100k pull down on HPHL */
+	regmap_update_bits(wcd938x->regmap,
+			   WCD938X_ANA_MBHC_MECH, 0x01, 0x01);
+
+	/* For NO-jack, re-enable L_DET_EN after Z-det measurements */
+	if (wcd938x->mbhc_cfg.hphl_swh)
+		regmap_update_bits(wcd938x->regmap,
+				   WCD938X_ANA_MBHC_MECH, 0x80, 0x80);
+
+	snd_soc_component_write(component, WCD938X_MBHC_NEW_ZDET_ANA_CTL, reg4);
+	snd_soc_component_write(component, WCD938X_MBHC_CTL_CLK, reg3);
+	if (is_fsm_disable)
+		regmap_update_bits(wcd938x->regmap,
+				   WCD938X_ANA_MBHC_ELECT, 0x80, 0x80);
+}
+
+static void wcd938x_mbhc_gnd_det_ctrl(struct snd_soc_component *component,
+			bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, WCD938X_ANA_MBHC_MECH,
+					      WCD938X_MBHC_HSG_PULLUP_COMP_EN, 1);
+		snd_soc_component_write_field(component, WCD938X_ANA_MBHC_MECH,
+					      WCD938X_MBHC_GND_DET_EN_MASK, 1);
+	} else {
+		snd_soc_component_write_field(component, WCD938X_ANA_MBHC_MECH,
+					      WCD938X_MBHC_GND_DET_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD938X_ANA_MBHC_MECH,
+					      WCD938X_MBHC_HSG_PULLUP_COMP_EN, 0);
+	}
+}
+
+static void wcd938x_mbhc_hph_pull_down_ctrl(struct snd_soc_component *component,
+					  bool enable)
+{
+	snd_soc_component_write_field(component, WCD938X_HPH_PA_CTL2,
+				      WCD938X_HPHPA_GND_R_MASK, enable);
+	snd_soc_component_write_field(component, WCD938X_HPH_PA_CTL2,
+				      WCD938X_HPHPA_GND_L_MASK, enable);
+}
+
+static void wcd938x_mbhc_moisture_config(struct snd_soc_component *component)
+{
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+
+	if (wcd938x->mbhc_cfg.moist_rref == R_OFF) {
+		snd_soc_component_write_field(component, WCD938X_MBHC_NEW_CTL_2,
+				    WCD938X_M_RTH_CTL_MASK, R_OFF);
+		return;
+	}
+
+	/* Do not enable moisture detection if jack type is NC */
+	if (!wcd938x->mbhc_cfg.hphl_swh) {
+		dev_dbg(component->dev, "%s: disable moisture detection for NC\n",
+			__func__);
+		snd_soc_component_write_field(component, WCD938X_MBHC_NEW_CTL_2,
+				    WCD938X_M_RTH_CTL_MASK, R_OFF);
+		return;
+	}
+
+	snd_soc_component_write_field(component, WCD938X_MBHC_NEW_CTL_2,
+			    WCD938X_M_RTH_CTL_MASK, wcd938x->mbhc_cfg.moist_rref);
+}
+
+static void wcd938x_mbhc_moisture_detect_en(struct snd_soc_component *component, bool enable)
+{
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+
+	if (enable)
+		snd_soc_component_write_field(component, WCD938X_MBHC_NEW_CTL_2,
+					WCD938X_M_RTH_CTL_MASK, wcd938x->mbhc_cfg.moist_rref);
+	else
+		snd_soc_component_write_field(component, WCD938X_MBHC_NEW_CTL_2,
+				    WCD938X_M_RTH_CTL_MASK, R_OFF);
+}
+
+static bool wcd938x_mbhc_get_moisture_status(struct snd_soc_component *component)
+{
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	bool ret = false;
+
+	if (wcd938x->mbhc_cfg.moist_rref == R_OFF) {
+		snd_soc_component_write_field(component, WCD938X_MBHC_NEW_CTL_2,
+				    WCD938X_M_RTH_CTL_MASK, R_OFF);
+		goto done;
+	}
+
+	/* Do not enable moisture detection if jack type is NC */
+	if (!wcd938x->mbhc_cfg.hphl_swh) {
+		dev_dbg(component->dev, "%s: disable moisture detection for NC\n",
+			__func__);
+		snd_soc_component_write_field(component, WCD938X_MBHC_NEW_CTL_2,
+				    WCD938X_M_RTH_CTL_MASK, R_OFF);
+		goto done;
+	}
+
+	/*
+	 * If moisture_en is already enabled, then skip to plug type
+	 * detection.
+	 */
+	if (snd_soc_component_read_field(component, WCD938X_MBHC_NEW_CTL_2, WCD938X_M_RTH_CTL_MASK))
+		goto done;
+
+	wcd938x_mbhc_moisture_detect_en(component, true);
+	/* Read moisture comparator status */
+	ret = ((snd_soc_component_read(component, WCD938X_MBHC_NEW_FSM_STATUS)
+				& 0x20) ? 0 : 1);
+
+done:
+	return ret;
+
+}
+
+static void wcd938x_mbhc_moisture_polling_ctrl(struct snd_soc_component *component,
+						bool enable)
+{
+	snd_soc_component_write_field(component,
+			      WCD938X_MBHC_NEW_INT_MOISTURE_DET_POLLING_CTRL,
+			      WCD938X_MOISTURE_EN_POLLING_MASK, enable);
+}
+
+static const struct wcd_mbhc_cb mbhc_cb = {
+	.clk_setup = wcd938x_mbhc_clk_setup,
+	.mbhc_bias = wcd938x_mbhc_mbhc_bias_control,
+	.set_btn_thr = wcd938x_mbhc_program_btn_thr,
+	.micbias_enable_status = wcd938x_mbhc_micb_en_status,
+	.hph_pull_up_control_v2 = wcd938x_mbhc_hph_l_pull_up_control,
+	.mbhc_micbias_control = wcd938x_mbhc_request_micbias,
+	.mbhc_micb_ramp_control = wcd938x_mbhc_micb_ramp_control,
+	.mbhc_micb_ctrl_thr_mic = wcd938x_mbhc_micb_ctrl_threshold_mic,
+	.compute_impedance = wcd938x_wcd_mbhc_calc_impedance,
+	.mbhc_gnd_det_ctrl = wcd938x_mbhc_gnd_det_ctrl,
+	.hph_pull_down_ctrl = wcd938x_mbhc_hph_pull_down_ctrl,
+	.mbhc_moisture_config = wcd938x_mbhc_moisture_config,
+	.mbhc_get_moisture_status = wcd938x_mbhc_get_moisture_status,
+	.mbhc_moisture_polling_ctrl = wcd938x_mbhc_moisture_polling_ctrl,
+	.mbhc_moisture_detect_en = wcd938x_mbhc_moisture_detect_en,
+};
+
+static int wcd938x_get_hph_type(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wcd_mbhc_get_hph_type(wcd938x->wcd_mbhc);
+
+	return 0;
+}
+
+static int wcd938x_hph_impedance_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	uint32_t zl, zr;
+	bool hphr;
+	struct soc_mixer_control *mc;
+	struct snd_soc_component *component =
+					snd_soc_kcontrol_component(kcontrol);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+	wcd_mbhc_get_impedance(wcd938x->wcd_mbhc, &zl, &zr);
+	dev_dbg(component->dev, "%s: zl=%u(ohms), zr=%u(ohms)\n", __func__, zl, zr);
+	ucontrol->value.integer.value[0] = hphr ? zr : zl;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new hph_type_detect_controls[] = {
+	SOC_SINGLE_EXT("HPH Type", 0, 0, UINT_MAX, 0,
+		       wcd938x_get_hph_type, NULL),
+};
+
+static const struct snd_kcontrol_new impedance_detect_controls[] = {
+	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, UINT_MAX, 0,
+		       wcd938x_hph_impedance_get, NULL),
+	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, UINT_MAX, 0,
+		       wcd938x_hph_impedance_get, NULL),
+};
+
+static int wcd938x_mbhc_init(struct snd_soc_component *component)
+{
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	struct wcd_mbhc_intr *intr_ids = &wcd938x->intr_ids;
+
+	intr_ids->mbhc_sw_intr = regmap_irq_get_virq(wcd938x->irq_chip,
+						    WCD938X_IRQ_MBHC_SW_DET);
+	intr_ids->mbhc_btn_press_intr = regmap_irq_get_virq(wcd938x->irq_chip,
+							   WCD938X_IRQ_MBHC_BUTTON_PRESS_DET);
+	intr_ids->mbhc_btn_release_intr = regmap_irq_get_virq(wcd938x->irq_chip,
+							     WCD938X_IRQ_MBHC_BUTTON_RELEASE_DET);
+	intr_ids->mbhc_hs_ins_intr = regmap_irq_get_virq(wcd938x->irq_chip,
+							WCD938X_IRQ_MBHC_ELECT_INS_REM_LEG_DET);
+	intr_ids->mbhc_hs_rem_intr = regmap_irq_get_virq(wcd938x->irq_chip,
+							WCD938X_IRQ_MBHC_ELECT_INS_REM_DET);
+	intr_ids->hph_left_ocp = regmap_irq_get_virq(wcd938x->irq_chip,
+						    WCD938X_IRQ_HPHL_OCP_INT);
+	intr_ids->hph_right_ocp = regmap_irq_get_virq(wcd938x->irq_chip,
+						     WCD938X_IRQ_HPHR_OCP_INT);
+
+	wcd938x->wcd_mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
+
+	snd_soc_add_component_controls(component, impedance_detect_controls,
+				       ARRAY_SIZE(impedance_detect_controls));
+	snd_soc_add_component_controls(component, hph_type_detect_controls,
+				       ARRAY_SIZE(hph_type_detect_controls));
+
+	return 0;
+}
+/* END MBHC */
+
 static const struct snd_kcontrol_new wcd938x_snd_controls[] = {
 	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD938X_COMP_L, 0, 1, 0,
 		       wcd938x_get_compander, wcd938x_set_compander),
@@ -3222,15 +3995,6 @@ static const struct snd_soc_dapm_route wcd938x_audio_map[] = {
 	{"EAR", NULL, "EAR PGA"},
 };
 
-static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
-{
-	/* min micbias voltage is 1V and maximum is 2.85V */
-	if (micb_mv < 1000 || micb_mv > 2850)
-		return -EINVAL;
-
-	return (micb_mv - 1000) / 50;
-}
-
 static int wcd938x_set_micbias_data(struct wcd938x_priv *wcd938x)
 {
 	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
@@ -3369,10 +4133,27 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 	default:
 		break;
 	}
+
+	ret = wcd938x_mbhc_init(component);
+	if (ret)
+		dev_err(component->dev,  "mbhc initialization failed\n");
 err:
 	return ret;
 }
 
+static int wcd938x_codec_set_jack(struct snd_soc_component *comp,
+				  struct snd_soc_jack *jack, void *data)
+{
+	struct wcd938x_priv *wcd = dev_get_drvdata(comp->dev);
+
+	if (!jack)
+		return wcd_mbhc_start(wcd->wcd_mbhc, &wcd->mbhc_cfg, jack);
+
+	wcd_mbhc_stop(wcd->wcd_mbhc);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_codec_dev_wcd938x = {
 	.name = "wcd938x_codec",
 	.probe = wcd938x_soc_codec_probe,
@@ -3382,6 +4163,7 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x = {
 	.num_dapm_widgets = ARRAY_SIZE(wcd938x_dapm_widgets),
 	.dapm_routes = wcd938x_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(wcd938x_audio_map),
+	.set_jack = wcd938x_codec_set_jack,
 };
 
 static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
@@ -3417,6 +4199,7 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
 
 static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device *dev)
 {
+	struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
 	int ret;
 
 	wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
@@ -3445,6 +4228,17 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 
 	wcd938x_dt_parse_micbias_info(dev, wcd938x);
 
+	cfg->mbhc_micbias = MIC_BIAS_2;
+	cfg->anc_micbias = MIC_BIAS_2;
+	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
+	cfg->num_btn = WCD938X_MBHC_MAX_BUTTONS;
+	cfg->micb_mv = wcd938x->micb2_mv;
+	cfg->linein_th = 5000;
+	cfg->hs_thr = 1700;
+	cfg->hph_thr = 50;
+
+	wcd_dt_parse_mbhc_data(dev, cfg);
+
 	return 0;
 }
 
@@ -3676,6 +4470,7 @@ static int wcd938x_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, wcd938x);
+	mutex_init(&wcd938x->micb_lock);
 
 	ret = wcd938x_populate_dt_data(wcd938x, dev);
 	if (ret) {
-- 
2.21.0

