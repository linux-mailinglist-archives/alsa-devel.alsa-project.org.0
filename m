Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652F38E503
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 13:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AACB0169B;
	Mon, 24 May 2021 13:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AACB0169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621854593;
	bh=Yo0CPUV5BIWrWosUR/IpRdfTy+MLfaz4A1x3pgeYA3E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJSuoNk9STIpavzpoZeCjv1h7UCIQIKuwlgPfooX/1fhKQsRNIOOBxgP5Wzv0Imyk
	 LErE23yEJpEpC7Zt5vBzy3f/MVOeuqBMcFL95oEmf05JAee/kC11/noW4uZb6tRIvT
	 wzxnKuPds90RXnOBzNpiDsMcudFhPwpM0TkjpHRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F2F4F8025C;
	Mon, 24 May 2021 13:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 832B6F804AC; Mon, 24 May 2021 13:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28CEDF8025C
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 13:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28CEDF8025C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="X20xHI79"
Received: by mail-wr1-x42f.google.com with SMTP id z17so28094439wrq.7
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 04:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y3Wf3Yr34KalecuxusCdAk+OCMfSTFVzyJ8BCYb0f/4=;
 b=X20xHI79dGfzK3/pBRNYduUcHWIcO9av3AzSvSWqOBRvADcokxgWQrkIQuk8DSE9qR
 425MDgzML6w5vlKOquK3guLMlZ8/W46rRhmDsDRVg0gSnp2JdnbcN0jNkpXQOVGFRtKy
 e836rc6TRseR2AVaDSEmAPnDcMIm+lcf7aKb02osJExALFZcw41nDKidv4qSvvAU3oBX
 DCaDHDDrEueCWbAcVllI5VOokGm75UDN1BmiS7SwlhIxB29TeK/15gFeERL67pNV7Eva
 dyQq38c6VAXzktIi4fMudSiR0pyZrKkOdXQ4VAITOu+WVLWY/LNXCrRQ5oFCvEsPwtB4
 8PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y3Wf3Yr34KalecuxusCdAk+OCMfSTFVzyJ8BCYb0f/4=;
 b=Ob4l8GTRJ0McTHePWCRQOaLvQGxe40XX9EgACYDckEaeuY/+SF2pmxVZXIHMgE9dRK
 +SwHHfjl9BQ10zfAeoOaoc/NNv2DfE1yvFnD1I6r3HeyigZsyNN0g6gNjo+orJFPGXno
 zCLsu9mgQwH9282UWgMGLim5aPZtGPk/+Law3Wxt+quf2otzbkQTSOUxPRWygRKWeAYb
 MJtS5VKZ8c47q/D/0vsAwPc3gzG+pPCTw3SAuj+7PqcEISDYVPg4mm4uU1crogB0llZF
 3gPAssyzmM9RnEFItXE7f7O2hhgTCI0WKFfPol5y46sCXM5LAtUikIvIdRTin1FmFHyb
 CMGA==
X-Gm-Message-State: AOAM530xsev4UunK4gl+bH9Xaaz2n0s+fdKej/7Urqpq7px3AvaFYxM7
 evpniE3kDaId0eltoTmYKLsnyA==
X-Google-Smtp-Source: ABdhPJxztEDqW2xFoE19luwZOHuRlmibAxoq95T58viNyqsIz+qj2i83XhRzrNEX0OtbH/ociJB1Fw==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr21224272wru.273.1621854436417; 
 Mon, 24 May 2021 04:07:16 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x4sm7590978wmj.17.2021.05.24.04.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 04:07:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 3/4] ASoC: codecs: wcd934x: add mbhc support
Date: Mon, 24 May 2021 12:06:59 +0100
Message-Id: <20210524110700.27077-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210524110700.27077-1-srinivas.kandagatla@linaro.org>
References: <20210524110700.27077-1-srinivas.kandagatla@linaro.org>
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

WCD934x has Multi Button Headset Control hardware to support Headset insertion,
type detection, 8 headset buttons detection, Over Current detection and Impedence
measurements.

This patch adds support for this feature via common mbhc layer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/linux/mfd/wcd934x/registers.h |  57 ++
 sound/soc/codecs/Kconfig              |   1 +
 sound/soc/codecs/wcd934x.c            | 884 +++++++++++++++++++++++++-
 3 files changed, 927 insertions(+), 15 deletions(-)

diff --git a/include/linux/mfd/wcd934x/registers.h b/include/linux/mfd/wcd934x/registers.h
index bb8d2e276668..76a943c83c63 100644
--- a/include/linux/mfd/wcd934x/registers.h
+++ b/include/linux/mfd/wcd934x/registers.h
@@ -18,6 +18,8 @@
 #define WCD934X_EFUSE_SENSE_STATE_DEF				0x10
 #define WCD934X_EFUSE_SENSE_EN_MASK				BIT(0)
 #define WCD934X_EFUSE_SENSE_ENABLE				BIT(0)
+#define WCD934X_CHIP_TIER_CTRL_EFUSE_VAL_OUT1			0x002a
+#define WCD934X_CHIP_TIER_CTRL_EFUSE_VAL_OUT2			0x002b
 #define WCD934X_CHIP_TIER_CTRL_EFUSE_VAL_OUT14			0x0037
 #define WCD934X_CHIP_TIER_CTRL_EFUSE_VAL_OUT15			0x0038
 #define WCD934X_CHIP_TIER_CTRL_EFUSE_STATUS			0x0039
@@ -103,21 +105,58 @@
 #define WCD934X_ANA_AMIC3					0x0610
 #define WCD934X_ANA_AMIC4					0x0611
 #define WCD934X_ANA_MBHC_MECH					0x0614
+#define WCD934X_MBHC_L_DET_EN_MASK				BIT(7)
+#define WCD934X_MBHC_L_DET_EN					BIT(7)
+#define WCD934X_MBHC_GND_DET_EN_MASK				BIT(6)
+#define WCD934X_MBHC_MECH_DETECT_TYPE_MASK			BIT(5)
+#define WCD934X_MBHC_MECH_DETECT_TYPE_INS			1
+#define WCD934X_MBHC_HPHL_PLUG_TYPE_MASK			BIT(4)
+#define WCD934X_MBHC_HPHL_PLUG_TYPE_NO				1
+#define WCD934X_MBHC_GND_PLUG_TYPE_MASK				BIT(3)
+#define WCD934X_MBHC_GND_PLUG_TYPE_NO				1
+#define WCD934X_MBHC_HSL_PULLUP_COMP_EN				BIT(2)
+#define WCD934X_MBHC_HSG_PULLUP_COMP_EN				BIT(1)
+#define WCD934X_MBHC_HPHL_100K_TO_GND_EN			BIT(0)
 #define WCD934X_ANA_MBHC_ELECT					0x0615
+#define WCD934X_ANA_MBHC_BIAS_EN_MASK				BIT(0)
+#define WCD934X_ANA_MBHC_BIAS_EN				BIT(0)
 #define WCD934X_ANA_MBHC_ZDET					0x0616
 #define WCD934X_ANA_MBHC_RESULT_1				0x0617
 #define WCD934X_ANA_MBHC_RESULT_2				0x0618
 #define WCD934X_ANA_MBHC_RESULT_3				0x0619
+#define WCD934X_ANA_MBHC_BTN0					0x061a
+#define WCD934X_VTH_MASK					GENMASK(7, 2)
+#define WCD934X_ANA_MBHC_BTN1					0x061b
+#define WCD934X_ANA_MBHC_BTN2					0x061c
+#define WCD934X_ANA_MBHC_BTN3					0x061d
+#define WCD934X_ANA_MBHC_BTN4					0x061e
+#define WCD934X_ANA_MBHC_BTN5					0x061f
+#define WCD934X_ANA_MBHC_BTN6					0x0620
+#define WCD934X_ANA_MBHC_BTN7					0x0621
+#define WCD934X_MBHC_BTN_VTH_MASK				GENMASK(7, 2)
 #define WCD934X_ANA_MICB1					0x0622
 #define WCD934X_MICB_VAL_MASK					GENMASK(5, 0)
 #define WCD934X_ANA_MICB_EN_MASK				GENMASK(7, 6)
+#define WCD934X_MICB_DISABLE					0
+#define WCD934X_MICB_ENABLE					1
+#define WCD934X_MICB_PULL_UP					2
+#define WCD934X_MICB_PULL_DOWN					3
 #define WCD934X_ANA_MICB_PULL_UP				0x80
 #define WCD934X_ANA_MICB_ENABLE					0x40
 #define WCD934X_ANA_MICB_DISABLE				0x0
 #define WCD934X_ANA_MICB2					0x0623
+#define WCD934X_ANA_MICB2_ENABLE				BIT(6)
+#define WCD934X_ANA_MICB2_ENABLE_MASK				GENMASK(7, 6)
+#define WCD934X_ANA_MICB2_VOUT_MASK				GENMASK(5, 0)
+#define WCD934X_ANA_MICB2_RAMP					0x0624
+#define WCD934X_RAMP_EN_MASK					BIT(7)
+#define WCD934X_RAMP_SHIFT_CTRL_MASK				GENMASK(4, 2)
 #define WCD934X_ANA_MICB3					0x0625
 #define WCD934X_ANA_MICB4					0x0626
 #define WCD934X_BIAS_VBG_FINE_ADJ				0x0629
+#define WCD934X_MBHC_CTL_CLK					0x0656
+#define WCD934X_MBHC_CTL_BCS					0x065a
+#define WCD934X_MBHC_STATUS_SPARE_1				0x065b
 #define WCD934X_MICB1_TEST_CTL_1				0x066b
 #define WCD934X_MICB1_TEST_CTL_2				0x066c
 #define WCD934X_MICB2_TEST_CTL_1				0x066e
@@ -141,7 +180,11 @@
 #define WCD934X_HPH_CNP_WG_CTL					0x06cc
 #define WCD934X_HPH_GM3_BOOST_EN_MASK				BIT(7)
 #define WCD934X_HPH_GM3_BOOST_ENABLE				BIT(7)
+#define WCD934X_HPH_CNP_WG_TIME					0x06cd
 #define WCD934X_HPH_OCP_CTL					0x06ce
+#define WCD934X_HPH_PA_CTL2					0x06d2
+#define WCD934X_HPHPA_GND_R_MASK				BIT(6)
+#define WCD934X_HPHPA_GND_L_MASK				BIT(4)
 #define WCD934X_HPH_L_EN					0x06d3
 #define WCD934X_HPH_GAIN_SRC_SEL_MASK				BIT(5)
 #define WCD934X_HPH_GAIN_SRC_SEL_COMPANDER			0
@@ -152,6 +195,8 @@
 #define WCD934X_HPH_OCP_DET_MASK				BIT(0)
 #define WCD934X_HPH_OCP_DET_ENABLE				BIT(0)
 #define WCD934X_HPH_OCP_DET_DISABLE				0
+#define WCD934X_HPH_R_ATEST					0x06d8
+#define WCD934X_HPHPA_GND_OVR_MASK				BIT(1)
 #define WCD934X_DIFF_LO_LO2_COMPANDER				0x06ea
 #define WCD934X_DIFF_LO_LO1_COMPANDER				0x06eb
 #define WCD934X_CLK_SYS_MCLK_PRG				0x0711
@@ -172,7 +217,19 @@
 #define WCD934X_SIDO_NEW_VOUT_D_FREQ2				0x071e
 #define WCD934X_SIDO_RIPPLE_FREQ_EN_MASK			BIT(0)
 #define WCD934X_SIDO_RIPPLE_FREQ_ENABLE				BIT(0)
+#define WCD934X_MBHC_NEW_CTL_1					0x0720
+#define WCD934X_MBHC_CTL_RCO_EN_MASK				BIT(7)
+#define WCD935X_MBHC_CTL_RCO_EN					BIT(7)
 #define WCD934X_MBHC_NEW_CTL_2					0x0721
+#define WCD934X_M_RTH_CTL_MASK					GENMASK(3, 2)
+#define WCD934X_MBHC_NEW_PLUG_DETECT_CTL			0x0722
+#define WCD934X_HSDET_PULLUP_C_MASK				GENMASK(7, 6)
+#define WCD934X_MBHC_NEW_ZDET_ANA_CTL				0x0723
+#define WCD934X_ZDET_RANGE_CTL_MASK				GENMASK(3, 0)
+#define WCD934X_ZDET_MAXV_CTL_MASK				GENMASK(6, 4)
+#define WCD934X_MBHC_NEW_ZDET_RAMP_CTL				0x0724
+#define WCD934X_MBHC_NEW_FSM_STATUS				0x0725
+#define WCD934X_MBHC_NEW_ADC_RESULT				0x0726
 #define WCD934X_TX_NEW_AMIC_4_5_SEL				0x0727
 #define WCD934X_HPH_NEW_INT_RDAC_HD2_CTL_L			0x0733
 #define WCD934X_HPH_NEW_INT_RDAC_OVERRIDE_CTL			0x0735
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 448ba0980e09..7f48b9095b6b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1532,6 +1532,7 @@ config SND_SOC_WCD_MBHC
 config SND_SOC_WCD934X
 	tristate "WCD9340/WCD9341 Codec"
 	depends on COMMON_CLK
+	select SND_SOC_WCD_MBHC
 	depends on MFD_WCD934X
 	help
 	  The WCD9340/9341 is a audio codec IC Integrated in
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 046874ef490e..16fd1ab62609 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -21,6 +21,7 @@
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
 #include "wcd-clsh-v2.h"
+#include "wcd-mbhc-v2.h"
 
 #define WCD934X_RATES_MASK (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			    SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
@@ -131,6 +132,24 @@
 	} \
 }
 
+/* Z value defined in milliohm */
+#define WCD934X_ZDET_VAL_32             32000
+#define WCD934X_ZDET_VAL_400            400000
+#define WCD934X_ZDET_VAL_1200           1200000
+#define WCD934X_ZDET_VAL_100K           100000000
+/* Z floating defined in ohms */
+#define WCD934X_ZDET_FLOATING_IMPEDANCE 0x0FFFFFFE
+
+#define WCD934X_ZDET_NUM_MEASUREMENTS   900
+#define WCD934X_MBHC_GET_C1(c)          ((c & 0xC000) >> 14)
+#define WCD934X_MBHC_GET_X1(x)          (x & 0x3FFF)
+/* Z value compared in milliOhm */
+#define WCD934X_MBHC_IS_SECOND_RAMP_REQUIRED(z) ((z > 400000) || (z < 32000))
+#define WCD934X_MBHC_ZDET_CONST         (86 * 16384)
+#define WCD934X_MBHC_MOISTURE_RREF      R_24_KOHM
+#define WCD934X_MBHC_MAX_BUTTONS	(8)
+#define WCD_MBHC_HS_V_MAX           1600
+
 #define WCD934X_INTERPOLATOR_PATH(id)			\
 	{"RX INT" #id "_1 MIX1 INP0", "RX0", "SLIM RX0"},	\
 	{"RX INT" #id "_1 MIX1 INP0", "RX1", "SLIM RX1"},	\
@@ -287,12 +306,7 @@
 	{"AIF3_CAP Mixer", "SLIM TX" #id, "SLIM TX" #id },	\
 	{"SLIM TX" #id, NULL, "CDC_IF TX" #id " MUX"}
 
-enum {
-	MIC_BIAS_1 = 1,
-	MIC_BIAS_2,
-	MIC_BIAS_3,
-	MIC_BIAS_4
-};
+#define WCD934X_MAX_MICBIAS	MIC_BIAS_4
 
 enum {
 	SIDO_SOURCE_INTERNAL,
@@ -486,6 +500,15 @@ static struct interp_sample_rate sr_val_tbl[] = {
 	{352800, 0xC},
 };
 
+struct wcd934x_mbhc_zdet_param {
+	u16 ldo_ctl;
+	u16 noff;
+	u16 nshift;
+	u16 btn5;
+	u16 btn6;
+	u16 btn7;
+};
+
 struct wcd_slim_codec_dai_data {
 	struct list_head slim_ch_list;
 	struct slim_stream_config sconfig;
@@ -541,6 +564,18 @@ struct wcd934x_codec {
 	int comp_enabled[COMPANDER_MAX];
 	int sysclk_users;
 	struct mutex sysclk_mutex;
+	/* mbhc module */
+	struct wcd_mbhc *mbhc;
+	struct wcd_mbhc_config mbhc_cfg;
+	struct wcd_mbhc_intr intr_ids;
+	bool mbhc_started;
+	struct mutex micb_lock;
+	u32 micb_ref[WCD934X_MAX_MICBIAS];
+	u32 pullup_ref[WCD934X_MAX_MICBIAS];
+	u32 micb1_mv;
+	u32 micb2_mv;
+	u32 micb3_mv;
+	u32 micb4_mv;
 };
 
 #define to_wcd934x_codec(_hw) container_of(_hw, struct wcd934x_codec, hw)
@@ -1183,6 +1218,57 @@ static const struct soc_enum cdc_if_tx13_mux_enum =
 	SOC_ENUM_SINGLE(WCD934X_DATA_HUB_SB_TX13_INP_CFG, 0,
 			ARRAY_SIZE(cdc_if_tx13_mux_text), cdc_if_tx13_mux_text);
 
+static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD934X_ANA_MBHC_MECH, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD934X_ANA_MBHC_MECH, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD934X_ANA_MBHC_MECH, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_MIC_CLAMP_CTL, WCD934X_MBHC_NEW_PLUG_DETECT_CTL, 0x30),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_DETECTION_TYPE, WCD934X_ANA_MBHC_ELECT, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_CTRL, WCD934X_MBHC_NEW_PLUG_DETECT_CTL, 0xC0),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, WCD934X_ANA_MBHC_MECH, 0x04),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PLUG_TYPE, WCD934X_ANA_MBHC_MECH, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_GND_PLUG_TYPE, WCD934X_ANA_MBHC_MECH, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_SW_HPH_LP_100K_TO_GND, WCD934X_ANA_MBHC_MECH, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_SCHMT_ISRC, WCD934X_ANA_MBHC_ELECT, 0x06),
+	WCD_MBHC_FIELD(WCD_MBHC_FSM_EN, WCD934X_ANA_MBHC_ELECT, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_INSREM_DBNC, WCD934X_MBHC_NEW_PLUG_DETECT_CTL, 0x0F),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_DBNC, WCD934X_MBHC_NEW_CTL_1, 0x03),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_VREF, WCD934X_MBHC_NEW_CTL_2, 0x03),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_COMP_RESULT, WCD934X_ANA_MBHC_RESULT_3, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_IN2P_CLAMP_STATE, WCD934X_ANA_MBHC_RESULT_3, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_MIC_SCHMT_RESULT, WCD934X_ANA_MBHC_RESULT_3, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_SCHMT_RESULT, WCD934X_ANA_MBHC_RESULT_3, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_SCHMT_RESULT, WCD934X_ANA_MBHC_RESULT_3, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_OCP_FSM_EN, WCD934X_HPH_OCP_CTL, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_RESULT, WCD934X_ANA_MBHC_RESULT_3, 0x07),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_ISRC_CTL, WCD934X_ANA_MBHC_ELECT, 0x70),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_RESULT, WCD934X_ANA_MBHC_RESULT_3, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_MICB_CTRL, WCD934X_ANA_MICB2, 0xC0),
+	WCD_MBHC_FIELD(WCD_MBHC_HPH_CNP_WG_TIME, WCD934X_HPH_CNP_WG_TIME, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_PA_EN, WCD934X_ANA_HPH, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PA_EN, WCD934X_ANA_HPH, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPH_PA_EN, WCD934X_ANA_HPH, 0xC0),
+	WCD_MBHC_FIELD(WCD_MBHC_SWCH_LEVEL_REMOVE, WCD934X_ANA_MBHC_RESULT_3, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_ANC_DET_EN, WCD934X_MBHC_CTL_BCS, 0x02),
+	WCD_MBHC_FIELD(WCD_MBHC_FSM_STATUS, WCD934X_MBHC_STATUS_SPARE_1, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_MUX_CTL, WCD934X_MBHC_NEW_CTL_2, 0x70),
+	WCD_MBHC_FIELD(WCD_MBHC_MOISTURE_STATUS, WCD934X_MBHC_NEW_FSM_STATUS, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_GND, WCD934X_HPH_PA_CTL2, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_GND, WCD934X_HPH_PA_CTL2, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_DET_EN, WCD934X_HPH_L_TEST, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_DET_EN, WCD934X_HPH_R_TEST, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_STATUS, WCD934X_INTR_PIN1_STATUS0, 0x04),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_STATUS, WCD934X_INTR_PIN1_STATUS0, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_EN, WCD934X_MBHC_NEW_CTL_1, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_COMPLETE, WCD934X_MBHC_NEW_FSM_STATUS, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_TIMEOUT, WCD934X_MBHC_NEW_FSM_STATUS, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_RESULT, WCD934X_MBHC_NEW_ADC_RESULT, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_MICB2_VOUT, WCD934X_ANA_MICB2, 0x3F),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_MODE, WCD934X_MBHC_NEW_CTL_1, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_DETECTION_DONE, WCD934X_MBHC_NEW_CTL_1, 0x04),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_ISRC_EN, WCD934X_ANA_MBHC_ZDET, 0x02),
+};
+
 static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 {
 	if (sido_src == wcd->sido_input_src)
@@ -2127,7 +2213,8 @@ static struct clk *wcd934x_register_mclk_output(struct wcd934x_codec *wcd)
 	return NULL;
 }
 
-static int wcd934x_get_micbias_val(struct device *dev, const char *micbias)
+static int wcd934x_get_micbias_val(struct device *dev, const char *micbias,
+				   u32 *micb_mv)
 {
 	int mv;
 
@@ -2145,6 +2232,8 @@ static int wcd934x_get_micbias_val(struct device *dev, const char *micbias)
 		mv = WCD934X_DEF_MICBIAS_MV;
 	}
 
+	*micb_mv = mv;
+
 	return (mv - 1000) / 50;
 }
 
@@ -2155,13 +2244,17 @@ static int wcd934x_init_dmic(struct snd_soc_component *comp)
 	u32 def_dmic_rate, dmic_clk_drv;
 
 	vout_ctl_1 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias1-microvolt");
+					     "qcom,micbias1-microvolt",
+					     &wcd->micb1_mv);
 	vout_ctl_2 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias2-microvolt");
+					     "qcom,micbias2-microvolt",
+					     &wcd->micb2_mv);
 	vout_ctl_3 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias3-microvolt");
+					     "qcom,micbias3-microvolt",
+					     &wcd->micb3_mv);
 	vout_ctl_4 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias4-microvolt");
+					     "qcom,micbias4-microvolt",
+					     &wcd->micb4_mv);
 
 	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB1,
 				      WCD934X_MICB_VAL_MASK, vout_ctl_1);
@@ -2287,6 +2380,695 @@ static irqreturn_t wcd934x_slim_irq_handler(int irq, void *data)
 	return ret;
 }
 
+static void wcd934x_mbhc_clk_setup(struct snd_soc_component *component,
+				   bool enable)
+{
+	snd_soc_component_write_field(component, WCD934X_MBHC_NEW_CTL_1,
+				      WCD934X_MBHC_CTL_RCO_EN_MASK, enable);
+}
+
+static void wcd934x_mbhc_mbhc_bias_control(struct snd_soc_component *component,
+					   bool enable)
+{
+	snd_soc_component_write_field(component, WCD934X_ANA_MBHC_ELECT,
+				      WCD934X_ANA_MBHC_BIAS_EN, enable);
+}
+
+static void wcd934x_mbhc_program_btn_thr(struct snd_soc_component *component,
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
+		snd_soc_component_write_field(component, WCD934X_ANA_MBHC_BTN0 + i,
+					   WCD934X_MBHC_BTN_VTH_MASK, vth);
+	}
+}
+
+static bool wcd934x_mbhc_micb_en_status(struct snd_soc_component *component, int micb_num)
+{
+	u8 val;
+
+	if (micb_num == MIC_BIAS_2) {
+		val = snd_soc_component_read_field(component, WCD934X_ANA_MICB2,
+						   WCD934X_ANA_MICB2_ENABLE_MASK);
+		if (val == WCD934X_MICB_ENABLE)
+			return true;
+	}
+	return false;
+}
+
+static void wcd934x_mbhc_hph_l_pull_up_control(struct snd_soc_component *component,
+					       enum mbhc_hs_pullup_iref pull_up_cur)
+{
+	/* Default pull up current to 2uA */
+	if (pull_up_cur < I_OFF || pull_up_cur > I_3P0_UA ||
+	    pull_up_cur == I_DEFAULT)
+		pull_up_cur = I_2P0_UA;
+
+
+	snd_soc_component_write_field(component, WCD934X_MBHC_NEW_PLUG_DETECT_CTL,
+				      WCD934X_HSDET_PULLUP_C_MASK, pull_up_cur);
+}
+
+static int wcd934x_micbias_control(struct snd_soc_component *component,
+			    int micb_num, int req, bool is_dapm)
+{
+	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
+	int micb_index = micb_num - 1;
+	u16 micb_reg;
+
+	switch (micb_num) {
+	case MIC_BIAS_1:
+		micb_reg = WCD934X_ANA_MICB1;
+		break;
+	case MIC_BIAS_2:
+		micb_reg = WCD934X_ANA_MICB2;
+		break;
+	case MIC_BIAS_3:
+		micb_reg = WCD934X_ANA_MICB3;
+		break;
+	case MIC_BIAS_4:
+		micb_reg = WCD934X_ANA_MICB4;
+		break;
+	default:
+		dev_err(component->dev, "%s: Invalid micbias number: %d\n",
+			__func__, micb_num);
+		return -EINVAL;
+	};
+	mutex_lock(&wcd934x->micb_lock);
+
+	switch (req) {
+	case MICB_PULLUP_ENABLE:
+		wcd934x->pullup_ref[micb_index]++;
+		if ((wcd934x->pullup_ref[micb_index] == 1) &&
+		    (wcd934x->micb_ref[micb_index] == 0))
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD934X_ANA_MICB_EN_MASK,
+						      WCD934X_MICB_PULL_UP);
+		break;
+	case MICB_PULLUP_DISABLE:
+		if (wcd934x->pullup_ref[micb_index] > 0)
+			wcd934x->pullup_ref[micb_index]--;
+
+		if ((wcd934x->pullup_ref[micb_index] == 0) &&
+		    (wcd934x->micb_ref[micb_index] == 0))
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD934X_ANA_MICB_EN_MASK, 0);
+		break;
+	case MICB_ENABLE:
+		wcd934x->micb_ref[micb_index]++;
+		if (wcd934x->micb_ref[micb_index] == 1) {
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD934X_ANA_MICB_EN_MASK,
+						      WCD934X_MICB_ENABLE);
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd934x->mbhc,
+						      WCD_EVENT_POST_MICBIAS_2_ON);
+		}
+
+		if (micb_num  == MIC_BIAS_2 && is_dapm)
+			wcd_mbhc_event_notify(wcd934x->mbhc,
+					      WCD_EVENT_POST_DAPM_MICBIAS_2_ON);
+		break;
+	case MICB_DISABLE:
+		if (wcd934x->micb_ref[micb_index] > 0)
+			wcd934x->micb_ref[micb_index]--;
+
+		if ((wcd934x->micb_ref[micb_index] == 0) &&
+		    (wcd934x->pullup_ref[micb_index] > 0))
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD934X_ANA_MICB_EN_MASK,
+						      WCD934X_MICB_PULL_UP);
+		else if ((wcd934x->micb_ref[micb_index] == 0) &&
+			 (wcd934x->pullup_ref[micb_index] == 0)) {
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd934x->mbhc,
+						      WCD_EVENT_PRE_MICBIAS_2_OFF);
+
+			snd_soc_component_write_field(component, micb_reg,
+						      WCD934X_ANA_MICB_EN_MASK, 0);
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd934x->mbhc,
+						      WCD_EVENT_POST_MICBIAS_2_OFF);
+		}
+		if (is_dapm && micb_num  == MIC_BIAS_2)
+			wcd_mbhc_event_notify(wcd934x->mbhc,
+					      WCD_EVENT_POST_DAPM_MICBIAS_2_OFF);
+		break;
+	};
+
+	mutex_unlock(&wcd934x->micb_lock);
+
+	return 0;
+}
+
+static int wcd934x_mbhc_request_micbias(struct snd_soc_component *component,
+					int micb_num, int req)
+{
+	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
+	int ret;
+
+	if (req == MICB_ENABLE)
+		__wcd934x_cdc_mclk_enable(wcd, true);
+
+	ret = wcd934x_micbias_control(component, micb_num, req, false);
+
+	if (req == MICB_DISABLE)
+		__wcd934x_cdc_mclk_enable(wcd, false);
+
+	return ret;
+}
+
+static void wcd934x_mbhc_micb_ramp_control(struct snd_soc_component *component,
+					   bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, WCD934X_ANA_MICB2_RAMP,
+				    WCD934X_RAMP_SHIFT_CTRL_MASK, 0x3);
+		snd_soc_component_write_field(component, WCD934X_ANA_MICB2_RAMP,
+				    WCD934X_RAMP_EN_MASK, 1);
+	} else {
+		snd_soc_component_write_field(component, WCD934X_ANA_MICB2_RAMP,
+				    WCD934X_RAMP_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD934X_ANA_MICB2_RAMP,
+				    WCD934X_RAMP_SHIFT_CTRL_MASK, 0);
+	}
+}
+
+static int wcd934x_get_micb_vout_ctl_val(u32 micb_mv)
+{
+	/* min micbias voltage is 1V and maximum is 2.85V */
+	if (micb_mv < 1000 || micb_mv > 2850)
+		return -EINVAL;
+
+	return (micb_mv - 1000) / 50;
+}
+
+static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
+					    int req_volt, int micb_num)
+{
+	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+
+	switch (micb_num) {
+	case MIC_BIAS_1:
+		micb_reg = WCD934X_ANA_MICB1;
+		break;
+	case MIC_BIAS_2:
+		micb_reg = WCD934X_ANA_MICB2;
+		break;
+	case MIC_BIAS_3:
+		micb_reg = WCD934X_ANA_MICB3;
+		break;
+	case MIC_BIAS_4:
+		micb_reg = WCD934X_ANA_MICB4;
+		break;
+	default:
+		return -EINVAL;
+	}
+	mutex_lock(&wcd934x->micb_lock);
+	/*
+	 * If requested micbias voltage is same as current micbias
+	 * voltage, then just return. Otherwise, adjust voltage as
+	 * per requested value. If micbias is already enabled, then
+	 * to avoid slow micbias ramp-up or down enable pull-up
+	 * momentarily, change the micbias value and then re-enable
+	 * micbias.
+	 */
+	micb_en = snd_soc_component_read_field(component, micb_reg,
+						WCD934X_ANA_MICB_EN_MASK);
+	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
+						    WCD934X_MICB_VAL_MASK);
+
+	req_vout_ctl = wcd934x_get_micb_vout_ctl_val(req_volt);
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
+	if (micb_en == WCD934X_MICB_ENABLE)
+		snd_soc_component_write_field(component, micb_reg,
+					      WCD934X_ANA_MICB_EN_MASK,
+					      WCD934X_MICB_PULL_UP);
+
+	snd_soc_component_write_field(component, micb_reg,
+				      WCD934X_MICB_VAL_MASK,
+				      req_vout_ctl);
+
+	if (micb_en == WCD934X_MICB_ENABLE) {
+		snd_soc_component_write_field(component, micb_reg,
+					      WCD934X_ANA_MICB_EN_MASK,
+					      WCD934X_MICB_ENABLE);
+		/*
+		 * Add 2ms delay as per HW requirement after enabling
+		 * micbias
+		 */
+		usleep_range(2000, 2100);
+	}
+exit:
+	mutex_unlock(&wcd934x->micb_lock);
+	return ret;
+}
+
+static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
+						int micb_num, bool req_en)
+{
+	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
+	int rc, micb_mv;
+
+	if (micb_num != MIC_BIAS_2)
+		return -EINVAL;
+	/*
+	 * If device tree micbias level is already above the minimum
+	 * voltage needed to detect threshold microphone, then do
+	 * not change the micbias, just return.
+	 */
+	if (wcd934x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
+		return 0;
+
+	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd934x->micb2_mv;
+
+	rc = wcd934x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
+
+	return rc;
+}
+
+static inline void wcd934x_mbhc_get_result_params(struct wcd934x_codec *wcd934x,
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
+	regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_ZDET, 0x20, 0x20);
+	for (i = 0; i < WCD934X_ZDET_NUM_MEASUREMENTS; i++) {
+		regmap_read(wcd934x->regmap, WCD934X_ANA_MBHC_RESULT_2, &val);
+		if (val & 0x80)
+			break;
+	}
+	val = val << 0x8;
+	regmap_read(wcd934x->regmap, WCD934X_ANA_MBHC_RESULT_1, &val1);
+	val |= val1;
+	regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_ZDET, 0x20, 0x00);
+	x1 = WCD934X_MBHC_GET_X1(val);
+	c1 = WCD934X_MBHC_GET_C1(val);
+	/* If ramp is not complete, give additional 5ms */
+	if ((c1 < 2) && x1)
+		usleep_range(5000, 5050);
+
+	if (!c1 || !x1) {
+		dev_err(wcd934x->dev, "%s: Impedance detect ramp error, c1=%d, x1=0x%x\n",
+			__func__, c1, x1);
+		goto ramp_down;
+	}
+	d1 = d1_a[c1];
+	denom = (x1 * d1) - (1 << (14 - noff));
+	if (denom > 0)
+		*zdet = (WCD934X_MBHC_ZDET_CONST * 1000) / denom;
+	else if (x1 < minCode_param[noff])
+		*zdet = WCD934X_ZDET_FLOATING_IMPEDANCE;
+
+	dev_info(wcd934x->dev, "%s: d1=%d, c1=%d, x1=0x%x, z_val=%d(milliOhm)\n",
+		__func__, d1, c1, x1, *zdet);
+ramp_down:
+	i = 0;
+
+	while (x1) {
+		regmap_read(wcd934x->regmap, WCD934X_ANA_MBHC_RESULT_1, &val);
+		regmap_read(wcd934x->regmap, WCD934X_ANA_MBHC_RESULT_2, &val1);
+		val = val << 0x08;
+		val |= val1;
+		x1 = WCD934X_MBHC_GET_X1(val);
+		i++;
+		if (i == WCD934X_ZDET_NUM_MEASUREMENTS)
+			break;
+	}
+}
+
+static void wcd934x_mbhc_zdet_ramp(struct snd_soc_component *component,
+				 struct wcd934x_mbhc_zdet_param *zdet_param,
+				 int32_t *zl, int32_t *zr, s16 *d1_a)
+{
+	struct wcd934x_codec *wcd934x = dev_get_drvdata(component->dev);
+	int32_t zdet = 0;
+
+	snd_soc_component_write_field(component, WCD934X_MBHC_NEW_ZDET_ANA_CTL,
+				WCD934X_ZDET_MAXV_CTL_MASK, zdet_param->ldo_ctl);
+	snd_soc_component_update_bits(component, WCD934X_ANA_MBHC_BTN5,
+				    WCD934X_VTH_MASK, zdet_param->btn5);
+	snd_soc_component_update_bits(component, WCD934X_ANA_MBHC_BTN6,
+				      WCD934X_VTH_MASK, zdet_param->btn6);
+	snd_soc_component_update_bits(component, WCD934X_ANA_MBHC_BTN7,
+				     WCD934X_VTH_MASK, zdet_param->btn7);
+	snd_soc_component_write_field(component, WCD934X_MBHC_NEW_ZDET_ANA_CTL,
+				WCD934X_ZDET_RANGE_CTL_MASK, zdet_param->noff);
+	snd_soc_component_update_bits(component, WCD934X_MBHC_NEW_ZDET_RAMP_CTL,
+				0x0F, zdet_param->nshift);
+
+	if (!zl)
+		goto z_right;
+	/* Start impedance measurement for HPH_L */
+	regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_ZDET, 0x80, 0x80);
+	wcd934x_mbhc_get_result_params(wcd934x, d1_a, zdet_param->noff, &zdet);
+	regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_ZDET, 0x80, 0x00);
+
+	*zl = zdet;
+
+z_right:
+	if (!zr)
+		return;
+	/* Start impedance measurement for HPH_R */
+	regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_ZDET, 0x40, 0x40);
+	wcd934x_mbhc_get_result_params(wcd934x, d1_a, zdet_param->noff, &zdet);
+	regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_ZDET, 0x40, 0x00);
+
+	*zr = zdet;
+}
+
+static inline void wcd934x_wcd_mbhc_qfuse_cal(struct snd_soc_component *component,
+					      int32_t *z_val, int flag_l_r)
+{
+	s16 q1;
+	int q1_cal;
+
+	if (*z_val < (WCD934X_ZDET_VAL_400/1000))
+		q1 = snd_soc_component_read(component,
+			WCD934X_CHIP_TIER_CTRL_EFUSE_VAL_OUT1 + (2 * flag_l_r));
+	else
+		q1 = snd_soc_component_read(component,
+			WCD934X_CHIP_TIER_CTRL_EFUSE_VAL_OUT2 + (2 * flag_l_r));
+	if (q1 & 0x80)
+		q1_cal = (10000 - ((q1 & 0x7F) * 25));
+	else
+		q1_cal = (10000 + (q1 * 25));
+	if (q1_cal > 0)
+		*z_val = ((*z_val) * 10000) / q1_cal;
+}
+
+static void wcd934x_wcd_mbhc_calc_impedance(struct snd_soc_component *component,
+					    uint32_t *zl, uint32_t *zr)
+{
+	struct wcd934x_codec *wcd934x = dev_get_drvdata(component->dev);
+	s16 reg0, reg1, reg2, reg3, reg4;
+	int32_t z1L, z1R, z1Ls;
+	int zMono, z_diff1, z_diff2;
+	bool is_fsm_disable = false;
+	struct wcd934x_mbhc_zdet_param zdet_param[] = {
+		{4, 0, 4, 0x08, 0x14, 0x18}, /* < 32ohm */
+		{2, 0, 3, 0x18, 0x7C, 0x90}, /* 32ohm < Z < 400ohm */
+		{1, 4, 5, 0x18, 0x7C, 0x90}, /* 400ohm < Z < 1200ohm */
+		{1, 6, 7, 0x18, 0x7C, 0x90}, /* >1200ohm */
+	};
+	struct wcd934x_mbhc_zdet_param *zdet_param_ptr = NULL;
+	s16 d1_a[][4] = {
+		{0, 30, 90, 30},
+		{0, 30, 30, 5},
+		{0, 30, 30, 5},
+		{0, 30, 30, 5},
+	};
+	s16 *d1 = NULL;
+
+	reg0 = snd_soc_component_read(component, WCD934X_ANA_MBHC_BTN5);
+	reg1 = snd_soc_component_read(component, WCD934X_ANA_MBHC_BTN6);
+	reg2 = snd_soc_component_read(component, WCD934X_ANA_MBHC_BTN7);
+	reg3 = snd_soc_component_read(component, WCD934X_MBHC_CTL_CLK);
+	reg4 = snd_soc_component_read(component, WCD934X_MBHC_NEW_ZDET_ANA_CTL);
+
+	if (snd_soc_component_read(component, WCD934X_ANA_MBHC_ELECT) & 0x80) {
+		is_fsm_disable = true;
+		regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_ELECT, 0x80, 0x00);
+	}
+
+	/* For NO-jack, disable L_DET_EN before Z-det measurements */
+	if (wcd934x->mbhc_cfg.hphl_swh)
+		regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_MECH, 0x80, 0x00);
+
+	/* Turn off 100k pull down on HPHL */
+	regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_MECH, 0x01, 0x00);
+
+	/* First get impedance on Left */
+	d1 = d1_a[1];
+	zdet_param_ptr = &zdet_param[1];
+	wcd934x_mbhc_zdet_ramp(component, zdet_param_ptr, &z1L, NULL, d1);
+
+	if (!WCD934X_MBHC_IS_SECOND_RAMP_REQUIRED(z1L))
+		goto left_ch_impedance;
+
+	/* Second ramp for left ch */
+	if (z1L < WCD934X_ZDET_VAL_32) {
+		zdet_param_ptr = &zdet_param[0];
+		d1 = d1_a[0];
+	} else if ((z1L > WCD934X_ZDET_VAL_400) &&
+		  (z1L <= WCD934X_ZDET_VAL_1200)) {
+		zdet_param_ptr = &zdet_param[2];
+		d1 = d1_a[2];
+	} else if (z1L > WCD934X_ZDET_VAL_1200) {
+		zdet_param_ptr = &zdet_param[3];
+		d1 = d1_a[3];
+	}
+	wcd934x_mbhc_zdet_ramp(component, zdet_param_ptr, &z1L, NULL, d1);
+
+left_ch_impedance:
+	if ((z1L == WCD934X_ZDET_FLOATING_IMPEDANCE) ||
+		(z1L > WCD934X_ZDET_VAL_100K)) {
+		*zl = WCD934X_ZDET_FLOATING_IMPEDANCE;
+		zdet_param_ptr = &zdet_param[1];
+		d1 = d1_a[1];
+	} else {
+		*zl = z1L/1000;
+		wcd934x_wcd_mbhc_qfuse_cal(component, zl, 0);
+	}
+	dev_info(component->dev, "%s: impedance on HPH_L = %d(ohms)\n",
+		__func__, *zl);
+
+	/* Start of right impedance ramp and calculation */
+	wcd934x_mbhc_zdet_ramp(component, zdet_param_ptr, NULL, &z1R, d1);
+	if (WCD934X_MBHC_IS_SECOND_RAMP_REQUIRED(z1R)) {
+		if (((z1R > WCD934X_ZDET_VAL_1200) &&
+			(zdet_param_ptr->noff == 0x6)) ||
+			((*zl) != WCD934X_ZDET_FLOATING_IMPEDANCE))
+			goto right_ch_impedance;
+		/* Second ramp for right ch */
+		if (z1R < WCD934X_ZDET_VAL_32) {
+			zdet_param_ptr = &zdet_param[0];
+			d1 = d1_a[0];
+		} else if ((z1R > WCD934X_ZDET_VAL_400) &&
+			(z1R <= WCD934X_ZDET_VAL_1200)) {
+			zdet_param_ptr = &zdet_param[2];
+			d1 = d1_a[2];
+		} else if (z1R > WCD934X_ZDET_VAL_1200) {
+			zdet_param_ptr = &zdet_param[3];
+			d1 = d1_a[3];
+		}
+		wcd934x_mbhc_zdet_ramp(component, zdet_param_ptr, NULL, &z1R, d1);
+	}
+right_ch_impedance:
+	if ((z1R == WCD934X_ZDET_FLOATING_IMPEDANCE) ||
+		(z1R > WCD934X_ZDET_VAL_100K)) {
+		*zr = WCD934X_ZDET_FLOATING_IMPEDANCE;
+	} else {
+		*zr = z1R/1000;
+		wcd934x_wcd_mbhc_qfuse_cal(component, zr, 1);
+	}
+	dev_err(component->dev, "%s: impedance on HPH_R = %d(ohms)\n",
+		__func__, *zr);
+
+	/* Mono/stereo detection */
+	if ((*zl == WCD934X_ZDET_FLOATING_IMPEDANCE) &&
+		(*zr == WCD934X_ZDET_FLOATING_IMPEDANCE)) {
+		dev_dbg(component->dev,
+			"%s: plug type is invalid or extension cable\n",
+			__func__);
+		goto zdet_complete;
+	}
+	if ((*zl == WCD934X_ZDET_FLOATING_IMPEDANCE) ||
+	    (*zr == WCD934X_ZDET_FLOATING_IMPEDANCE) ||
+	    ((*zl < WCD_MONO_HS_MIN_THR) && (*zr > WCD_MONO_HS_MIN_THR)) ||
+	    ((*zl > WCD_MONO_HS_MIN_THR) && (*zr < WCD_MONO_HS_MIN_THR))) {
+		dev_dbg(component->dev,
+			"%s: Mono plug type with one ch floating or shorted to GND\n",
+			__func__);
+		wcd_mbhc_set_hph_type(wcd934x->mbhc, WCD_MBHC_HPH_MONO);
+		goto zdet_complete;
+	}
+	snd_soc_component_write_field(component, WCD934X_HPH_R_ATEST,
+				      WCD934X_HPHPA_GND_OVR_MASK, 1);
+	snd_soc_component_write_field(component, WCD934X_HPH_PA_CTL2,
+				      WCD934X_HPHPA_GND_R_MASK, 1);
+	if (*zl < (WCD934X_ZDET_VAL_32/1000))
+		wcd934x_mbhc_zdet_ramp(component, &zdet_param[0], &z1Ls, NULL, d1);
+	else
+		wcd934x_mbhc_zdet_ramp(component, &zdet_param[1], &z1Ls, NULL, d1);
+	snd_soc_component_write_field(component, WCD934X_HPH_PA_CTL2,
+				      WCD934X_HPHPA_GND_R_MASK, 0);
+	snd_soc_component_write_field(component, WCD934X_HPH_R_ATEST,
+				      WCD934X_HPHPA_GND_OVR_MASK, 0);
+	z1Ls /= 1000;
+	wcd934x_wcd_mbhc_qfuse_cal(component, &z1Ls, 0);
+	/* Parallel of left Z and 9 ohm pull down resistor */
+	zMono = ((*zl) * 9) / ((*zl) + 9);
+	z_diff1 = (z1Ls > zMono) ? (z1Ls - zMono) : (zMono - z1Ls);
+	z_diff2 = ((*zl) > z1Ls) ? ((*zl) - z1Ls) : (z1Ls - (*zl));
+	if ((z_diff1 * (*zl + z1Ls)) > (z_diff2 * (z1Ls + zMono))) {
+		dev_err(component->dev, "%s: stereo plug type detected\n",
+			__func__);
+		wcd_mbhc_set_hph_type(wcd934x->mbhc, WCD_MBHC_HPH_STEREO);
+	} else {
+		dev_err(component->dev, "%s: MONO plug type detected\n",
+			__func__);
+		wcd_mbhc_set_hph_type(wcd934x->mbhc, WCD_MBHC_HPH_MONO);
+	}
+
+zdet_complete:
+	snd_soc_component_write(component, WCD934X_ANA_MBHC_BTN5, reg0);
+	snd_soc_component_write(component, WCD934X_ANA_MBHC_BTN6, reg1);
+	snd_soc_component_write(component, WCD934X_ANA_MBHC_BTN7, reg2);
+	/* Turn on 100k pull down on HPHL */
+	regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_MECH, 0x01, 0x01);
+
+	/* For NO-jack, re-enable L_DET_EN after Z-det measurements */
+	if (wcd934x->mbhc_cfg.hphl_swh)
+		regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_MECH, 0x80, 0x80);
+
+	snd_soc_component_write(component, WCD934X_MBHC_NEW_ZDET_ANA_CTL, reg4);
+	snd_soc_component_write(component, WCD934X_MBHC_CTL_CLK, reg3);
+	if (is_fsm_disable)
+		regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_ELECT, 0x80, 0x80);
+}
+
+static void wcd934x_mbhc_gnd_det_ctrl(struct snd_soc_component *component,
+			bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, WCD934X_ANA_MBHC_MECH,
+					      WCD934X_MBHC_HSG_PULLUP_COMP_EN, 1);
+		snd_soc_component_write_field(component, WCD934X_ANA_MBHC_MECH,
+					      WCD934X_MBHC_GND_DET_EN_MASK, 1);
+	} else {
+		snd_soc_component_write_field(component, WCD934X_ANA_MBHC_MECH,
+					      WCD934X_MBHC_GND_DET_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD934X_ANA_MBHC_MECH,
+					      WCD934X_MBHC_HSG_PULLUP_COMP_EN, 0);
+	}
+}
+
+static void wcd934x_mbhc_hph_pull_down_ctrl(struct snd_soc_component *component,
+					  bool enable)
+{
+	snd_soc_component_write_field(component, WCD934X_HPH_PA_CTL2,
+				      WCD934X_HPHPA_GND_R_MASK, enable);
+	snd_soc_component_write_field(component, WCD934X_HPH_PA_CTL2,
+				      WCD934X_HPHPA_GND_L_MASK, enable);
+}
+
+static const struct wcd_mbhc_cb mbhc_cb = {
+	.clk_setup = wcd934x_mbhc_clk_setup,
+	.mbhc_bias = wcd934x_mbhc_mbhc_bias_control,
+	.set_btn_thr = wcd934x_mbhc_program_btn_thr,
+	.micbias_enable_status = wcd934x_mbhc_micb_en_status,
+	.hph_pull_up_control = wcd934x_mbhc_hph_l_pull_up_control,
+	.mbhc_micbias_control = wcd934x_mbhc_request_micbias,
+	.mbhc_micb_ramp_control = wcd934x_mbhc_micb_ramp_control,
+	.mbhc_micb_ctrl_thr_mic = wcd934x_mbhc_micb_ctrl_threshold_mic,
+	.compute_impedance = wcd934x_wcd_mbhc_calc_impedance,
+	.mbhc_gnd_det_ctrl = wcd934x_mbhc_gnd_det_ctrl,
+	.hph_pull_down_ctrl = wcd934x_mbhc_hph_pull_down_ctrl,
+};
+
+static int wcd934x_get_hph_type(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wcd_mbhc_get_hph_type(wcd->mbhc);
+
+	return 0;
+}
+
+static int wcd934x_hph_impedance_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	uint32_t zl, zr;
+	bool hphr;
+	struct soc_mixer_control *mc;
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(component);
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+	wcd_mbhc_get_impedance(wcd->mbhc, &zl, &zr);
+	dev_dbg(component->dev, "%s: zl=%u(ohms), zr=%u(ohms)\n", __func__, zl, zr);
+	ucontrol->value.integer.value[0] = hphr ? zr : zl;
+
+	return 0;
+}
+static const struct snd_kcontrol_new hph_type_detect_controls[] = {
+	SOC_SINGLE_EXT("HPH Type", 0, 0, UINT_MAX, 0,
+		       wcd934x_get_hph_type, NULL),
+};
+
+static const struct snd_kcontrol_new impedance_detect_controls[] = {
+	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, UINT_MAX, 0,
+		       wcd934x_hph_impedance_get, NULL),
+	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, UINT_MAX, 0,
+		       wcd934x_hph_impedance_get, NULL),
+};
+
+static int wcd934x_mbhc_init(struct snd_soc_component *component)
+{
+	struct wcd934x_ddata *data = dev_get_drvdata(component->dev->parent);
+	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd_mbhc_intr *intr_ids = &wcd->intr_ids;
+
+	intr_ids->mbhc_sw_intr = regmap_irq_get_virq(data->irq_data,
+						     WCD934X_IRQ_MBHC_SW_DET);
+	intr_ids->mbhc_btn_press_intr = regmap_irq_get_virq(data->irq_data,
+							    WCD934X_IRQ_MBHC_BUTTON_PRESS_DET);
+	intr_ids->mbhc_btn_release_intr = regmap_irq_get_virq(data->irq_data,
+							      WCD934X_IRQ_MBHC_BUTTON_RELEASE_DET);
+	intr_ids->mbhc_hs_ins_intr = regmap_irq_get_virq(data->irq_data,
+							 WCD934X_IRQ_MBHC_ELECT_INS_REM_LEG_DET);
+	intr_ids->mbhc_hs_rem_intr = regmap_irq_get_virq(data->irq_data,
+							 WCD934X_IRQ_MBHC_ELECT_INS_REM_DET);
+	intr_ids->hph_left_ocp = regmap_irq_get_virq(data->irq_data,
+						     WCD934X_IRQ_HPH_PA_OCPL_FAULT);
+	intr_ids->hph_right_ocp = regmap_irq_get_virq(data->irq_data,
+						      WCD934X_IRQ_HPH_PA_OCPR_FAULT);
+
+	wcd->mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
+	if (IS_ERR(wcd->mbhc)) {
+		wcd->mbhc = NULL;
+		return -EINVAL;
+	}
+
+	snd_soc_add_component_controls(component, impedance_detect_controls,
+				       ARRAY_SIZE(impedance_detect_controls));
+	snd_soc_add_component_controls(component, hph_type_detect_controls,
+				       ARRAY_SIZE(hph_type_detect_controls));
+
+	return 0;
+}
 static int wcd934x_comp_probe(struct snd_soc_component *component)
 {
 	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
@@ -2309,6 +3091,10 @@ static int wcd934x_comp_probe(struct snd_soc_component *component)
 		INIT_LIST_HEAD(&wcd->dai[i].slim_ch_list);
 
 	wcd934x_init_dmic(component);
+
+	if (wcd934x_mbhc_init(component))
+		dev_err(component->dev, "Failed to Initialize MBHC\n");
+
 	return 0;
 }
 
@@ -3756,6 +4542,7 @@ static int wcd934x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 					int event)
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(comp);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -3788,6 +4575,7 @@ static int wcd934x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 				WCD934X_CDC_RX_PGA_MUTE_EN_MASK, 0x00);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
+		wcd_mbhc_event_notify(wcd->mbhc, WCD_EVENT_POST_HPHL_PA_OFF);
 		/* Enable DSD Mute before PA disable */
 		snd_soc_component_update_bits(comp, WCD934X_HPH_L_TEST,
 					      WCD934X_HPH_OCP_DET_MASK,
@@ -3806,6 +4594,7 @@ static int wcd934x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 		 * disabled, then 20ms delay is needed after PA disable.
 		 */
 		usleep_range(20000, 20100);
+		wcd_mbhc_event_notify(wcd->mbhc, WCD_EVENT_POST_HPHL_PA_OFF);
 		break;
 	}
 
@@ -3817,6 +4606,7 @@ static int wcd934x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 					int event)
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(comp);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -3851,6 +4641,7 @@ static int wcd934x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 					      WCD934X_CDC_RX_PGA_MUTE_DISABLE);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
+		wcd_mbhc_event_notify(wcd->mbhc, WCD_EVENT_PRE_HPHR_PA_OFF);
 		snd_soc_component_update_bits(comp, WCD934X_HPH_R_TEST,
 					      WCD934X_HPH_OCP_DET_MASK,
 					      WCD934X_HPH_OCP_DET_DISABLE);
@@ -3868,6 +4659,7 @@ static int wcd934x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		 * disabled, then 20ms delay is needed after PA disable.
 		 */
 		usleep_range(20000, 20100);
+		wcd_mbhc_event_notify(wcd->mbhc, WCD_EVENT_POST_HPHR_PA_OFF);
 		break;
 	}
 
@@ -4323,6 +5115,29 @@ static int wcd934x_codec_enable_adc(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int wcd934x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	int micb_num = w->shift;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd934x_micbias_control(component, micb_num, MICB_ENABLE, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* 1 msec delay as per HW requirement */
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd934x_micbias_control(component, micb_num, MICB_DISABLE, true);
+		break;
+	};
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
 	/* Analog Outputs */
 	SND_SOC_DAPM_OUTPUT("EAR"),
@@ -4778,13 +5593,17 @@ static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
 			   wcd934x_codec_enable_adc, SND_SOC_DAPM_PRE_PMU),
 	SND_SOC_DAPM_ADC_E("ADC4", NULL, WCD934X_ANA_AMIC4, 7, 0,
 			   wcd934x_codec_enable_adc, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_SUPPLY("MIC BIAS1", WCD934X_ANA_MICB1, 6, 0, NULL,
+	SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
+			    wcd934x_codec_enable_micbias, SND_SOC_DAPM_PRE_PMU |
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_SUPPLY("MIC BIAS2", WCD934X_ANA_MICB2, 6, 0, NULL,
+	SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
+			    wcd934x_codec_enable_micbias, SND_SOC_DAPM_PRE_PMU |
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_SUPPLY("MIC BIAS3", WCD934X_ANA_MICB3, 6, 0, NULL,
+	SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
+			    wcd934x_codec_enable_micbias, SND_SOC_DAPM_PRE_PMU |
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_SUPPLY("MIC BIAS4", WCD934X_ANA_MICB4, 6, 0, NULL,
+	SND_SOC_DAPM_SUPPLY("MIC BIAS4", SND_SOC_NOPM, MIC_BIAS_4, 0,
+			    wcd934x_codec_enable_micbias, SND_SOC_DAPM_PRE_PMU |
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_MUX("AMIC4_5 SEL", SND_SOC_NOPM, 0, 0, &tx_amic4_5),
@@ -4961,6 +5780,26 @@ static const struct snd_soc_dapm_route wcd934x_audio_map[] = {
 	{"SRC1", NULL, "IIR1"},
 };
 
+static int wcd934x_codec_set_jack(struct snd_soc_component *comp,
+				  struct snd_soc_jack *jack, void *data)
+{
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	int ret = 0;
+
+	if (!wcd->mbhc)
+		return -ENOTSUPP;
+
+	if (jack && !wcd->mbhc_started) {
+		ret = wcd_mbhc_start(wcd->mbhc, &wcd->mbhc_cfg, jack);
+		wcd->mbhc_started = true;
+	} else if (wcd->mbhc_started) {
+		wcd_mbhc_stop(wcd->mbhc);
+		wcd->mbhc_started = false;
+	}
+
+	return ret;
+}
+
 static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.probe = wcd934x_comp_probe,
 	.remove = wcd934x_comp_remove,
@@ -4971,11 +5810,13 @@ static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.num_dapm_widgets = ARRAY_SIZE(wcd934x_dapm_widgets),
 	.dapm_routes = wcd934x_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(wcd934x_audio_map),
+	.set_jack = wcd934x_codec_set_jack,
 };
 
 static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
 {
 	struct device *dev = &wcd->sdev->dev;
+	struct wcd_mbhc_config *cfg = &wcd->mbhc_cfg;
 	struct device_node *ifc_dev_np;
 
 	ifc_dev_np = of_parse_phandle(dev->of_node, "slim-ifc-dev", 0);
@@ -5001,6 +5842,18 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
 	of_property_read_u32(dev->parent->of_node, "qcom,dmic-sample-rate",
 			     &wcd->dmic_sample_rate);
 
+	cfg->mbhc_micbias = MIC_BIAS_2;
+	cfg->anc_micbias = MIC_BIAS_2;
+	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
+	cfg->num_btn = WCD934X_MBHC_MAX_BUTTONS;
+	cfg->micb_mv = wcd->micb2_mv;
+	cfg->linein_th = 5000;
+	cfg->hs_thr = 1700;
+	cfg->hph_thr = 50;
+
+	wcd_dt_parse_mbhc_data(dev, cfg);
+
+
 	return 0;
 }
 
@@ -5020,6 +5873,7 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
 	wcd->extclk = data->extclk;
 	wcd->sdev = to_slim_device(data->dev);
 	mutex_init(&wcd->sysclk_mutex);
+	mutex_init(&wcd->micb_lock);
 
 	ret = wcd934x_codec_parse_data(wcd);
 	if (ret) {
-- 
2.21.0

