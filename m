Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC886335F7
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 08:40:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF61E166D;
	Tue, 22 Nov 2022 08:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF61E166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669102812;
	bh=12cHoO/t9P5INurBtayTInChCuiGAlrVhfaEspZcnaw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bWFejdijdnplH1SS5mr6l5haJ6JD78T+PHHv6VyheWnLfzGyIap9klBS33D/dwOUX
	 65nDG3ALSDNw4qY3er2kiuRS83plS/M4Wgb4S2z6ix2mKF3nDuj7d/k9HKpXnwow66
	 SSRfoYbBPJRH5bE3WEngZV0dH0NpPCotQo7V3j8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD06F80149;
	Tue, 22 Nov 2022 08:39:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 264AAF80154; Tue, 22 Nov 2022 08:39:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 74634F80154
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 08:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74634F80154
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id 4A7A01C812D5;
 Tue, 22 Nov 2022 15:39:05 +0800 (CST)
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 22 Nov
 2022 15:39:05 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 22 Nov
 2022 15:39:04 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Tue, 22 Nov 2022 15:39:04 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: nau8825: Add a manually mechanism for detection
 failure
Date: Tue, 22 Nov 2022 15:38:56 +0800
Message-ID: <20221122073855.43024-2-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122073855.43024-1-CTLIN0@nuvoton.com>
References: <20221122073855.43024-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, David Lin <CTLIN0@nuvoton.com>
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

This patch is to use saradc to check the jack type when auto
detection is still failure.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 128 ++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/nau8825.h |  23 +++++++
 2 files changed, 148 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index ba7f5ec28609..4bffa9c20f2b 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1736,6 +1736,121 @@ static int nau8825_button_decode(int value)
 	return buttons;
 }
 
+static int nau8825_high_imped_detection(struct nau8825 *nau8825)
+{
+	struct regmap *regmap = nau8825->regmap;
+	struct snd_soc_dapm_context *dapm = nau8825->dapm;
+	unsigned int adc_mg1, adc_mg2;
+
+	/* Initial phase */
+	regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
+			   NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2 | NAU8825_SPKR_DWN1R |
+			   NAU8825_SPKR_DWN1L, NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2);
+	regmap_update_bits(regmap, NAU8825_REG_ANALOG_CONTROL_1,
+			   NAU8825_TESTDACIN_MASK, NAU8825_TESTDACIN_GND);
+	regmap_write(regmap, NAU8825_REG_TRIM_SETTINGS, 0x6);
+	regmap_update_bits(regmap, NAU8825_REG_MIC_BIAS,
+			   NAU8825_MICBIAS_LOWNOISE_MASK | NAU8825_MICBIAS_VOLTAGE_MASK,
+			   NAU8825_MICBIAS_LOWNOISE_EN);
+	regmap_update_bits(regmap, NAU8825_REG_SAR_CTRL,
+			   NAU8825_SAR_INPUT_MASK | NAU8825_SAR_TRACKING_GAIN_MASK |
+			   NAU8825_SAR_HV_SEL_MASK | NAU8825_SAR_RES_SEL_MASK |
+			   NAU8825_SAR_COMPARE_TIME_MASK | NAU8825_SAR_SAMPLING_TIME_MASK,
+			   NAU8825_SAR_HV_SEL_VDDMIC | NAU8825_SAR_RES_SEL_70K);
+
+	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
+	snd_soc_dapm_force_enable_pin(dapm, "SAR");
+	snd_soc_dapm_sync(dapm);
+
+	/* Configure settings for first reading of SARADC */
+	regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
+			   NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2 | NAU8825_SPKR_DWN1R |
+			   NAU8825_SPKR_DWN1L, NAU8825_SPKR_ENGND2);
+	regmap_update_bits(regmap, NAU8825_REG_MIC_BIAS,
+			   NAU8825_MICBIAS_JKSLV | NAU8825_MICBIAS_JKR2,
+			   NAU8825_MICBIAS_JKR2);
+	regmap_read(regmap, NAU8825_REG_SARDOUT_RAM_STATUS, &adc_mg1);
+
+	/* Configure settings for second reading of SARADC */
+	regmap_update_bits(regmap, NAU8825_REG_MIC_BIAS,
+			   NAU8825_MICBIAS_JKSLV | NAU8825_MICBIAS_JKR2, 0);
+	regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
+			   NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2 | NAU8825_SPKR_DWN1R |
+			   NAU8825_SPKR_DWN1L, NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2 |
+			   NAU8825_SPKR_DWN1R | NAU8825_SPKR_DWN1L);
+	regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
+			   NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2 | NAU8825_SPKR_DWN1R |
+			   NAU8825_SPKR_DWN1L, NAU8825_SPKR_ENGND1);
+	regmap_update_bits(regmap, NAU8825_REG_MIC_BIAS,
+			   NAU8825_MICBIAS_JKSLV | NAU8825_MICBIAS_JKR2,
+			   NAU8825_MICBIAS_JKSLV);
+	regmap_update_bits(regmap, NAU8825_REG_SAR_CTRL,
+			   NAU8825_SAR_INPUT_MASK, NAU8825_SAR_INPUT_JKSLV);
+	regmap_read(regmap, NAU8825_REG_SARDOUT_RAM_STATUS, &adc_mg2);
+
+	/* Disable phase */
+	snd_soc_dapm_disable_pin(dapm, "SAR");
+	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
+	snd_soc_dapm_sync(dapm);
+
+	regmap_update_bits(regmap, NAU8825_REG_MIC_BIAS,
+			   NAU8825_MICBIAS_JKSLV | NAU8825_MICBIAS_LOWNOISE_MASK |
+			   NAU8825_MICBIAS_VOLTAGE_MASK, nau8825->micbias_voltage);
+	regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
+			   NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2 | NAU8825_SPKR_DWN1R |
+			   NAU8825_SPKR_DWN1L, NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2 |
+			   NAU8825_SPKR_DWN1R | NAU8825_SPKR_DWN1L);
+	regmap_update_bits(regmap, NAU8825_REG_ANALOG_CONTROL_1,
+			   NAU8825_TESTDACIN_MASK, NAU8825_TESTDACIN_GND);
+	regmap_write(regmap, NAU8825_REG_TRIM_SETTINGS, 0);
+	regmap_update_bits(regmap, NAU8825_REG_SAR_CTRL,
+			   NAU8825_SAR_TRACKING_GAIN_MASK | NAU8825_SAR_HV_SEL_MASK,
+			   nau8825->sar_voltage << NAU8825_SAR_TRACKING_GAIN_SFT);
+	regmap_update_bits(regmap, NAU8825_REG_SAR_CTRL,
+			   NAU8825_SAR_COMPARE_TIME_MASK | NAU8825_SAR_SAMPLING_TIME_MASK,
+			   (nau8825->sar_compare_time << NAU8825_SAR_COMPARE_TIME_SFT) |
+			   (nau8825->sar_sampling_time << NAU8825_SAR_SAMPLING_TIME_SFT));
+	dev_dbg(nau8825->dev, "adc_mg1:%x, adc_mg2:%x\n", adc_mg1, adc_mg2);
+
+	/* Confirmation phase */
+	if (adc_mg1 > adc_mg2) {
+		dev_dbg(nau8825->dev, "OMTP (micgnd1) mic connected\n");
+
+		/* Unground MICGND1 */
+		regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
+				   NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2,
+				   NAU8825_SPKR_ENGND2);
+		/* Attach 2kOhm Resistor from MICBIAS to MICGND1 */
+		regmap_update_bits(regmap, NAU8825_REG_MIC_BIAS,
+				   NAU8825_MICBIAS_JKSLV | NAU8825_MICBIAS_JKR2,
+				   NAU8825_MICBIAS_JKR2);
+		/* Attach SARADC to MICGND1 */
+		regmap_update_bits(regmap, NAU8825_REG_SAR_CTRL,
+				   NAU8825_SAR_INPUT_MASK,
+				   NAU8825_SAR_INPUT_JKR2);
+	} else if (adc_mg1 < adc_mg2) {
+		dev_dbg(nau8825->dev, "CTIA (micgnd2) mic connected\n");
+
+		/* Unground MICGND2 */
+		regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
+				   NAU8825_SPKR_ENGND1 | NAU8825_SPKR_ENGND2,
+				   NAU8825_SPKR_ENGND1);
+		/* Attach 2kOhm Resistor from MICBIAS to MICGND2 */
+		regmap_update_bits(regmap, NAU8825_REG_MIC_BIAS,
+				   NAU8825_MICBIAS_JKSLV | NAU8825_MICBIAS_JKR2,
+				   NAU8825_MICBIAS_JKSLV);
+		/* Attach SARADC to MICGND2 */
+		regmap_update_bits(regmap, NAU8825_REG_SAR_CTRL,
+				   NAU8825_SAR_INPUT_MASK,
+				   NAU8825_SAR_INPUT_JKSLV);
+	} else {
+		dev_err(nau8825->dev, "Jack broken.\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int nau8825_jack_insert(struct nau8825 *nau8825)
 {
 	struct regmap *regmap = nau8825->regmap;
@@ -1797,9 +1912,16 @@ static int nau8825_jack_insert(struct nau8825 *nau8825)
 		snd_soc_dapm_sync(dapm);
 		break;
 	case 3:
-		/* detect error case */
-		dev_err(nau8825->dev, "detection error; disable mic function\n");
-		type = SND_JACK_HEADPHONE;
+		/* Detection failure case */
+		dev_warn(nau8825->dev,
+			 "Detection failure. Try the manually mechanism for jack type checking.\n");
+		if (!nau8825_high_imped_detection(nau8825)) {
+			type = SND_JACK_HEADSET;
+			snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
+			snd_soc_dapm_force_enable_pin(dapm, "SAR");
+			snd_soc_dapm_sync(dapm);
+		} else
+			type = SND_JACK_HEADPHONE;
 		break;
 	}
 
diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
index d84191a7beb2..0c3a446e0e1a 100644
--- a/sound/soc/codecs/nau8825.h
+++ b/sound/soc/codecs/nau8825.h
@@ -155,6 +155,8 @@
 /* HSD_CTRL (0xc) */
 #define NAU8825_HSD_AUTO_MODE	(1 << 6)
 /* 0 - open, 1 - short to GND */
+#define NAU8825_SPKR_ENGND1	(1 << 3)
+#define NAU8825_SPKR_ENGND2	(1 << 2)
 #define NAU8825_SPKR_DWN1R	(1 << 1)
 #define NAU8825_SPKR_DWN1L	(1 << 0)
 
@@ -207,6 +209,17 @@
 #define NAU8825_SAR_INPUT_JKR2	(0 << 11)
 #define NAU8825_SAR_TRACKING_GAIN_SFT	8
 #define NAU8825_SAR_TRACKING_GAIN_MASK	(0x7 << NAU8825_SAR_TRACKING_GAIN_SFT)
+#define NAU8825_SAR_HV_SEL_SFT		7
+#define NAU8825_SAR_HV_SEL_MASK		(1 << NAU8825_SAR_HV_SEL_SFT)
+#define NAU8825_SAR_HV_SEL_MICBIAS	(0 << NAU8825_SAR_HV_SEL_SFT)
+#define NAU8825_SAR_HV_SEL_VDDMIC	(1 << NAU8825_SAR_HV_SEL_SFT)
+#define NAU8825_SAR_RES_SEL_SFT		4
+#define NAU8825_SAR_RES_SEL_MASK	(0x7 << NAU8825_SAR_RES_SEL_SFT)
+#define NAU8825_SAR_RES_SEL_35K		(0 << NAU8825_SAR_RES_SEL_SFT)
+#define NAU8825_SAR_RES_SEL_70K		(1 << NAU8825_SAR_RES_SEL_SFT)
+#define NAU8825_SAR_RES_SEL_170K	(2 << NAU8825_SAR_RES_SEL_SFT)
+#define NAU8825_SAR_RES_SEL_360K	(3 << NAU8825_SAR_RES_SEL_SFT)
+#define NAU8825_SAR_RES_SEL_SHORTED	(4 << NAU8825_SAR_RES_SEL_SFT)
 #define NAU8825_SAR_COMPARE_TIME_SFT	2
 #define NAU8825_SAR_COMPARE_TIME_MASK	(3 << 2)
 #define NAU8825_SAR_SAMPLING_TIME_SFT	0
@@ -385,6 +398,13 @@
 #define NAU8825_BIAS_VMID_SEL_SFT	4
 #define NAU8825_BIAS_VMID_SEL_MASK	(3 << NAU8825_BIAS_VMID_SEL_SFT)
 
+/* ANALOG_CONTROL_1 (0x69) */
+#define NAU8825_TESTDACIN_SFT		14
+#define NAU8825_TESTDACIN_MASK		(0x3 << NAU8825_TESTDACIN_SFT)
+#define NAU8825_TESTDACIN_HIGH		(1 << NAU8825_TESTDACIN_SFT)
+#define NAU8825_TESTDACIN_LOW		(2 << NAU8825_TESTDACIN_SFT)
+#define NAU8825_TESTDACIN_GND		(3 << NAU8825_TESTDACIN_SFT)
+
 /* ANALOG_CONTROL_2 (0x6a) */
 #define NAU8825_HP_NON_CLASSG_CURRENT_2xADJ (1 << 12)
 #define NAU8825_DAC_CAPACITOR_MSB (1 << 1)
@@ -412,6 +432,9 @@
 /* MIC_BIAS (0x74) */
 #define NAU8825_MICBIAS_JKSLV	(1 << 14)
 #define NAU8825_MICBIAS_JKR2	(1 << 12)
+#define NAU8825_MICBIAS_LOWNOISE_SFT	10
+#define NAU8825_MICBIAS_LOWNOISE_MASK	(0x1 << NAU8825_MICBIAS_LOWNOISE_SFT)
+#define NAU8825_MICBIAS_LOWNOISE_EN	(0x1 << NAU8825_MICBIAS_LOWNOISE_SFT)
 #define NAU8825_MICBIAS_POWERUP_SFT	8
 #define NAU8825_MICBIAS_VOLTAGE_SFT	0
 #define NAU8825_MICBIAS_VOLTAGE_MASK	0x7
-- 
2.25.1

