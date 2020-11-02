Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E02A26CC
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 10:18:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2757B16EF;
	Mon,  2 Nov 2020 10:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2757B16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604308734;
	bh=mB24KmeOCZsL7tAOMOfNEgJFrGUwWc0/6dyHmVbYH5g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AQQ8Lke0UvqcKwrmS6M5kvZn6jW/xmS8hqPxP4Xc8D0h6D6vVFq8GaaV5mwJvJUZZ
	 Hm+pCTh9myYfSYubK9lYiypy4X6qdoYfkMqSACnmyau86LocmVYN7ejzFqjQd7m/lc
	 71lSUv8wZIjfuTtVYqMD55XL/6ssnJZJVBQsJbe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F0DF8015A;
	Mon,  2 Nov 2020 10:17:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46760F80232; Mon,  2 Nov 2020 10:17:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1822F80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 10:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1822F80083
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0A29H5Jn8022737,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0A29H5Jn8022737
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 2 Nov 2020 17:17:05 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 2 Nov 2020 17:17:05 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 2 Nov 2020 17:17:05 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1015: support TDM slot configuration
Date: Mon, 2 Nov 2020 17:16:56 +0800
Message-ID: <20201102091656.25379-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.36)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, kent_chen@realtek.com, Keith.Tzeng@quantatw.com,
 derek.fang@realtek.com, Shuming Fan <shumingf@realtek.com>, brent.lu@intel.com,
 flove@realtek.com
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

From: Shuming Fan <shumingf@realtek.com>

Add TDM slot callback function to support TDM configuration

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1015.c | 101 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt1015.h |  42 ++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 25fe2ddedd54..5d3e269d17f5 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -944,6 +944,106 @@ static int rt1015_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	return 0;
 }
 
+static int rt1015_set_tdm_slot(struct snd_soc_dai *dai,
+	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	unsigned int val = 0, rx_slotnum, tx_slotnum;
+	int ret = 0, first_bit;
+
+	switch (slots) {
+	case 4:
+		val |= RT1015_I2S_TX_4CH;
+		break;
+	case 6:
+		val |= RT1015_I2S_TX_6CH;
+		break;
+	case 8:
+		val |= RT1015_I2S_TX_8CH;
+		break;
+	case 2:
+		break;
+	default:
+		ret = -EINVAL;
+		goto _set_tdm_err_;
+	}
+
+	switch (slot_width) {
+	case 20:
+		val |= RT1015_I2S_CH_TX_LEN_20B;
+		break;
+	case 24:
+		val |= RT1015_I2S_CH_TX_LEN_24B;
+		break;
+	case 32:
+		val |= RT1015_I2S_CH_TX_LEN_32B;
+		break;
+	case 16:
+		break;
+	default:
+		ret = -EINVAL;
+		goto _set_tdm_err_;
+	}
+
+	/* Rx slot configuration */
+	rx_slotnum = hweight_long(rx_mask);
+	if (rx_slotnum > 1 || !rx_slotnum) {
+		ret = -EINVAL;
+		dev_err(component->dev, "too many rx slots or zero slot\n");
+		goto _set_tdm_err_;
+	}
+
+	first_bit = __ffs(rx_mask);
+	switch (first_bit) {
+	case 0:
+	case 2:
+	case 4:
+	case 6:
+		snd_soc_component_update_bits(component,
+			RT1015_PAD_DRV2, RT1015_MONO_LR_SEL_MASK,
+			RT1015_MONO_L_CHANNEL);
+		snd_soc_component_update_bits(component,
+			RT1015_TDM1_4,
+			RT1015_TDM_I2S_TX_L_DAC1_1_MASK |
+			RT1015_TDM_I2S_TX_R_DAC1_1_MASK,
+			(first_bit << RT1015_TDM_I2S_TX_L_DAC1_1_SFT) |
+			((first_bit+1) << RT1015_TDM_I2S_TX_R_DAC1_1_SFT));
+		break;
+	case 1:
+	case 3:
+	case 5:
+	case 7:
+		snd_soc_component_update_bits(component,
+			RT1015_PAD_DRV2, RT1015_MONO_LR_SEL_MASK,
+			RT1015_MONO_R_CHANNEL);
+		snd_soc_component_update_bits(component,
+			RT1015_TDM1_4,
+			RT1015_TDM_I2S_TX_L_DAC1_1_MASK |
+			RT1015_TDM_I2S_TX_R_DAC1_1_MASK,
+			((first_bit-1) << RT1015_TDM_I2S_TX_L_DAC1_1_SFT) |
+			(first_bit << RT1015_TDM_I2S_TX_R_DAC1_1_SFT));
+		break;
+	default:
+		ret = -EINVAL;
+		goto _set_tdm_err_;
+	}
+
+	/* Tx slot configuration */
+	tx_slotnum = hweight_long(tx_mask);
+	if (tx_slotnum) {
+		ret = -EINVAL;
+		dev_err(component->dev, "doesn't need to support tx slots\n");
+		goto _set_tdm_err_;
+	}
+
+	snd_soc_component_update_bits(component, RT1015_TDM1_1,
+		RT1015_I2S_CH_TX_MASK | RT1015_I2S_CH_RX_MASK |
+		RT1015_I2S_CH_TX_LEN_MASK | RT1015_I2S_CH_RX_LEN_MASK, val);
+
+_set_tdm_err_:
+	return ret;
+}
+
 static int rt1015_probe(struct snd_soc_component *component)
 {
 	struct rt1015_priv *rt1015 =
@@ -975,6 +1075,7 @@ static struct snd_soc_dai_ops rt1015_aif_dai_ops = {
 	.hw_params = rt1015_hw_params,
 	.set_fmt = rt1015_set_dai_fmt,
 	.set_bclk_ratio = rt1015_set_bclk_ratio,
+	.set_tdm_slot = rt1015_set_tdm_slot,
 };
 
 static struct snd_soc_dai_driver rt1015_dai[] = {
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index d3fdd30aca6d..ad8274c80990 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -213,6 +213,12 @@
 #define RT1015_ID_VERA				0x0
 #define RT1015_ID_VERB				0x1
 
+/* 0x00f2 */
+#define RT1015_MONO_LR_SEL_MASK			(0x3 << 4)
+#define RT1015_MONO_L_CHANNEL			(0x0 << 4)
+#define RT1015_MONO_R_CHANNEL			(0x1 << 4)
+#define RT1015_MONO_LR_MIX_CHANNEL			(0x2 << 4)
+
 /* 0x0102 */
 #define RT1015_DAC_VOL_MASK			(0x7f << 9)
 #define RT1015_DAC_VOL_SFT			9
@@ -275,6 +281,42 @@
 #define RT1015_TDM_INV_BCLK_MASK		(0x1 << 15)
 #define RT1015_TDM_INV_BCLK_SFT			15
 #define RT1015_TDM_INV_BCLK			(0x1 << 15)
+#define RT1015_I2S_CH_TX_MASK			(0x3 << 10)
+#define RT1015_I2S_CH_TX_SFT			10
+#define RT1015_I2S_TX_2CH			(0x0 << 10)
+#define RT1015_I2S_TX_4CH			(0x1 << 10)
+#define RT1015_I2S_TX_6CH			(0x2 << 10)
+#define RT1015_I2S_TX_8CH			(0x3 << 10)
+#define RT1015_I2S_CH_RX_MASK			(0x3 << 8)
+#define RT1015_I2S_CH_RX_SFT			8
+#define RT1015_I2S_RX_2CH			(0x0 << 8)
+#define RT1015_I2S_RX_4CH			(0x1 << 8)
+#define RT1015_I2S_RX_6CH			(0x2 << 8)
+#define RT1015_I2S_RX_8CH			(0x3 << 8)
+#define RT1015_I2S_LR_CH_SEL_MASK			(0x1 << 7)
+#define RT1015_I2S_LR_CH_SEL_SFT			7
+#define RT1015_I2S_LEFT_CH_SEL			(0x0 << 7)
+#define RT1015_I2S_RIGHT_CH_SEL			(0x1 << 7)
+#define RT1015_I2S_CH_TX_LEN_MASK			(0x7 << 4)
+#define RT1015_I2S_CH_TX_LEN_SFT			4
+#define RT1015_I2S_CH_TX_LEN_16B			(0x0 << 4)
+#define RT1015_I2S_CH_TX_LEN_20B			(0x1 << 4)
+#define RT1015_I2S_CH_TX_LEN_24B			(0x2 << 4)
+#define RT1015_I2S_CH_TX_LEN_32B			(0x3 << 4)
+#define RT1015_I2S_CH_TX_LEN_8B			(0x4 << 4)
+#define RT1015_I2S_CH_RX_LEN_MASK			(0x7 << 0)
+#define RT1015_I2S_CH_RX_LEN_SFT			0
+#define RT1015_I2S_CH_RX_LEN_16B			(0x0 << 0)
+#define RT1015_I2S_CH_RX_LEN_20B			(0x1 << 0)
+#define RT1015_I2S_CH_RX_LEN_24B			(0x2 << 0)
+#define RT1015_I2S_CH_RX_LEN_32B			(0x3 << 0)
+#define RT1015_I2S_CH_RX_LEN_8B			(0x4 << 0)
+
+/* TDM1 Setting-4 (0x011a) */
+#define RT1015_TDM_I2S_TX_L_DAC1_1_MASK			(0x7 << 12)
+#define RT1015_TDM_I2S_TX_R_DAC1_1_MASK			(0x7 << 8)
+#define RT1015_TDM_I2S_TX_L_DAC1_1_SFT 12
+#define RT1015_TDM_I2S_TX_R_DAC1_1_SFT 8
 
 /* 0x0330 */
 #define RT1015_ABST_AUTO_EN_MASK		(0x1 << 13)
-- 
2.28.0

