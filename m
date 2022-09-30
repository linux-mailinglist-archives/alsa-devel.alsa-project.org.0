Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 971DE5F05B6
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 09:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11985846;
	Fri, 30 Sep 2022 09:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11985846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664522981;
	bh=Iwi/LS3D+zIRBrzElguCR6rGpWWFWRfAX+egGgnX/so=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sqXqHDQ9vPrCoRxTBfCM9X6sBoiD1BNBOf++DVWYHn2hua/QoQz70hBjewjbXTLkn
	 jlTPZIp+/M2CRVRz4Vn5zN4slVik6514mK9zHERXxuP4GREDq/AGAmE4/WCkjxqpwW
	 54hT3ZKg3J1XcJ7s4AUOIHdYVeyopnChIAjknhAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68796F800E8;
	Fri, 30 Sep 2022 09:28:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC002F80155; Fri, 30 Sep 2022 09:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id DE33AF800E8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 09:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE33AF800E8
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id 7F64F1C80F4A;
 Fri, 30 Sep 2022 15:28:30 +0800 (CST)
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 30
 Sep 2022 15:28:30 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Fri, 30 Sep
 2022 15:28:30 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 30 Sep 2022 15:28:29 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8825: Add TDM support
Date: Fri, 30 Sep 2022 15:28:05 +0800
Message-ID: <20220930072804.2524352-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
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

Support TDM format for NAU88L25.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 97 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/nau8825.h | 14 ++++++
 2 files changed, 111 insertions(+)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index b3cdbe884c05..6a2c2e373efd 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1425,10 +1425,107 @@ static int nau8825_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	return 0;
 }
 
+/**
+ * nau8825_set_tdm_slot - configure DAI TDM.
+ * @dai: DAI
+ * @tx_mask: bitmask representing active TX slots.
+ * @rx_mask: bitmask representing active RX slots.
+ * @slots: Number of slots in use.
+ * @slot_width: Width in bits for each slot.
+ *
+ * Configures a DAI for TDM operation. Support TDM 4/8 slots.
+ * The limitation is DAC and ADC need shift 4 slots at 8 slots mode.
+ */
+static int nau8825_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+				unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
+	unsigned int ctrl_val = 0, ctrl_offset = 0, value = 0, dac_s, adc_s;
+
+	if (slots != 4 && slots != 8) {
+		dev_err(nau8825->dev, "Only support 4 or 8 slots!\n");
+		return -EINVAL;
+	}
+
+	/* The driver is limited to 1-channel for ADC, and 2-channel for DAC on TDM mode */
+	if (hweight_long((unsigned long) tx_mask) != 1 ||
+	    hweight_long((unsigned long) rx_mask) != 2) {
+		dev_err(nau8825->dev,
+			"The limitation is 1-channel for ADC, and 2-channel for DAC on TDM mode.\n");
+		return -EINVAL;
+	}
+
+	if (((tx_mask & 0xf) && (tx_mask & 0xf0)) ||
+	    ((rx_mask & 0xf) && (rx_mask & 0xf0)) ||
+	    ((tx_mask & 0xf) && (rx_mask & 0xf0)) ||
+	    ((rx_mask & 0xf) && (tx_mask & 0xf0))) {
+		dev_err(nau8825->dev,
+			"Slot assignment of DAC and ADC need to set same interval.\n");
+		return -EINVAL;
+	}
+
+	/* The offset of fixed 4 slots for 8 slots support */
+	if (rx_mask & 0xf0) {
+		regmap_update_bits(nau8825->regmap, NAU8825_REG_I2S_PCM_CTRL2,
+				   NAU8825_I2S_PCM_TS_EN_MASK, NAU8825_I2S_PCM_TS_EN);
+		regmap_read(nau8825->regmap, NAU8825_REG_I2S_PCM_CTRL1, &value);
+		ctrl_val |= NAU8825_TDM_OFFSET_EN;
+		ctrl_offset = 4 * slot_width;
+		if (!(value & NAU8825_I2S_PCMB_MASK))
+			ctrl_offset += 1;
+		dac_s = (rx_mask & 0xf0) >> 4;
+		adc_s = fls((tx_mask & 0xf0) >> 4);
+	} else {
+		dac_s = rx_mask & 0xf;
+		adc_s = fls(tx_mask & 0xf);
+	}
+
+	ctrl_val |= NAU8825_TDM_MODE;
+
+	switch (dac_s) {
+	case 0x3:
+		ctrl_val |= 1 << NAU8825_TDM_DACR_RX_SFT;
+		break;
+	case 0x5:
+		ctrl_val |= 2 << NAU8825_TDM_DACR_RX_SFT;
+		break;
+	case 0x6:
+		ctrl_val |= 1 << NAU8825_TDM_DACL_RX_SFT;
+		ctrl_val |= 2 << NAU8825_TDM_DACR_RX_SFT;
+		break;
+	case 0x9:
+		ctrl_val |= 3 << NAU8825_TDM_DACR_RX_SFT;
+		break;
+	case 0xa:
+		ctrl_val |= 1 << NAU8825_TDM_DACL_RX_SFT;
+		ctrl_val |= 3 << NAU8825_TDM_DACR_RX_SFT;
+		break;
+	case 0xc:
+		ctrl_val |= 2 << NAU8825_TDM_DACL_RX_SFT;
+		ctrl_val |= 3 << NAU8825_TDM_DACR_RX_SFT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ctrl_val |= adc_s - 1;
+
+	regmap_update_bits(nau8825->regmap, NAU8825_REG_TDM_CTRL,
+			   NAU8825_TDM_MODE | NAU8825_TDM_OFFSET_EN |
+			   NAU8825_TDM_DACL_RX_MASK | NAU8825_TDM_DACR_RX_MASK |
+			   NAU8825_TDM_TX_MASK, ctrl_val);
+	regmap_update_bits(nau8825->regmap, NAU8825_REG_LEFT_TIME_SLOT,
+			   NAU8825_TSLOT_L0_MASK, ctrl_offset);
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops nau8825_dai_ops = {
 	.startup	= nau8825_dai_startup,
 	.hw_params	= nau8825_hw_params,
 	.set_fmt	= nau8825_set_dai_fmt,
+	.set_tdm_slot	= nau8825_set_tdm_slot,
 };
 
 #define NAU8825_RATES	SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
index 6d112b6145df..d84191a7beb2 100644
--- a/sound/soc/codecs/nau8825.h
+++ b/sound/soc/codecs/nau8825.h
@@ -225,6 +225,15 @@
 #define NAU8825_JKDET_PULL_EN	(1 << 9) /* 0 - enable pull, 1 - disable */
 #define NAU8825_JKDET_OUTPUT_EN	(1 << 8) /* 0 - enable input, 1 - enable output */
 
+/* TDM_CTRL (0x1b) */
+#define NAU8825_TDM_MODE		(0x1 << 15)
+#define NAU8825_TDM_OFFSET_EN		(0x1 << 14)
+#define NAU8825_TDM_DACL_RX_SFT		6
+#define NAU8825_TDM_DACL_RX_MASK	(0x3 << NAU8825_TDM_DACL_RX_SFT)
+#define NAU8825_TDM_DACR_RX_SFT		4
+#define NAU8825_TDM_DACR_RX_MASK	(0x3 << NAU8825_TDM_DACR_RX_SFT)
+#define NAU8825_TDM_TX_MASK		0x3
+
 /* I2S_PCM_CTRL1 (0x1c) */
 #define NAU8825_I2S_BP_SFT	7
 #define NAU8825_I2S_BP_MASK	(1 << NAU8825_I2S_BP_SFT)
@@ -249,6 +258,9 @@
 #define NAU8825_I2S_TRISTATE	(1 << 15) /* 0 - normal mode, 1 - Hi-Z output */
 #define NAU8825_I2S_LRC_DIV_SFT	12
 #define NAU8825_I2S_LRC_DIV_MASK	(0x3 << NAU8825_I2S_LRC_DIV_SFT)
+#define NAU8825_I2S_PCM_TS_EN_SFT	10
+#define NAU8825_I2S_PCM_TS_EN_MASK	(1 << NAU8825_I2S_PCM_TS_EN_SFT)
+#define NAU8825_I2S_PCM_TS_EN		(1 << NAU8825_I2S_PCM_TS_EN_SFT)
 #define NAU8825_I2S_MS_SFT	3
 #define NAU8825_I2S_MS_MASK	(1 << NAU8825_I2S_MS_SFT)
 #define NAU8825_I2S_MS_MASTER	(1 << NAU8825_I2S_MS_SFT)
@@ -259,6 +271,8 @@
 #define NAU8825_FS_ERR_CMP_SEL_SFT	14
 #define NAU8825_FS_ERR_CMP_SEL_MASK	(0x3 << NAU8825_FS_ERR_CMP_SEL_SFT)
 #define NAU8825_DIS_FS_SHORT_DET	(1 << 13)
+#define NAU8825_TSLOT_L0_MASK		0x3ff
+#define NAU8825_TSLOT_R0_MASK		0x3ff
 
 /* BIQ_CTRL (0x20) */
 #define NAU8825_BIQ_WRT_SFT   4
-- 
2.25.1

