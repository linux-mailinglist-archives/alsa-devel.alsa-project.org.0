Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B359D8C03
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 11:00:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E837166C;
	Wed, 16 Oct 2019 10:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E837166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571216406;
	bh=Y2HvlJuiF1ku634ls81O065dVzZexj/+M/cwNrVfi8s=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eRmJADQg/qS0vC9HYP6ZYYUqdoExOu8I6Whmdl0YWMWxG1d1OJti+E1p0Om/WofF6
	 PyNY2qMYJGFUx26BHiRj0PPdjp9fHi2VcQFpL/hLZtwpbbWrwPGyhyV9NvwKpn0Soa
	 klTdvx4F38JkRpAq+wHzACP4YJQlqJb1+T7njz5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED32EF80369;
	Wed, 16 Oct 2019 10:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79934F80362; Wed, 16 Oct 2019 10:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FD9FF80322
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 10:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD9FF80322
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9G8w7PY002045,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS12.realtek.com.tw[172.21.6.16])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9G8w7PY002045
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 16:58:07 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCAS12.realtek.com.tw (172.21.6.16) with Microsoft SMTP Server id
 14.3.439.0; Wed, 16 Oct 2019 16:58:06 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 16 Oct 2019 16:57:54 +0800
Message-ID: <20191016085754.11614-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Shuming Fan <shumingf@realtek.com>, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] [PATCH v2] ASoC: rt1011: set tx/rx slots from
	tx/rx_mask in TDM case
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

The TX/RX slot configuration use tx/rx_mask which requested
by the machine driver.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 142 ++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/rt1011.h |  23 ++++++
 2 files changed, 160 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index be1e276e3631..b927e61b32df 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1805,8 +1805,8 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 	struct snd_soc_component *component = dai->component;
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
-	unsigned int val = 0, tdm_en = 0;
-	int ret = 0;
+	unsigned int val = 0, tdm_en = 0, rx_slotnum, tx_slotnum;
+	int ret = 0, first_bit, last_bit;
 
 	snd_soc_dapm_mutex_lock(dapm);
 	if (rx_mask || tx_mask)
@@ -1829,6 +1829,7 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 		break;
 	default:
 		ret = -EINVAL;
+		goto _set_tdm_err_;
 	}
 
 	switch (slot_width) {
@@ -1848,6 +1849,135 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 		break;
 	default:
 		ret = -EINVAL;
+		goto _set_tdm_err_;
+	}
+
+	/* Rx slot configuration */
+	rx_slotnum = hweight_long(rx_mask);
+	first_bit = find_next_bit((unsigned long *)&rx_mask, 32, 0);
+	if (rx_slotnum > 1 || rx_slotnum == 0) {
+		ret = -EINVAL;
+		dev_dbg(component->dev, "too many rx slots or zero slot\n");
+		goto _set_tdm_err_;
+	}
+
+	switch (first_bit) {
+	case 0:
+	case 2:
+	case 4:
+	case 6:
+		snd_soc_component_update_bits(component,
+			RT1011_CROSS_BQ_SET_1, RT1011_MONO_LR_SEL_MASK,
+			RT1011_MONO_L_CHANNEL);
+		snd_soc_component_update_bits(component,
+			RT1011_TDM1_SET_4,
+			RT1011_TDM_I2S_TX_L_DAC1_1_MASK |
+			RT1011_TDM_I2S_TX_R_DAC1_1_MASK,
+			(first_bit << RT1011_TDM_I2S_TX_L_DAC1_1_SFT) |
+			((first_bit+1) << RT1011_TDM_I2S_TX_R_DAC1_1_SFT));
+		break;
+	case 1:
+	case 3:
+	case 5:
+	case 7:
+		snd_soc_component_update_bits(component,
+			RT1011_CROSS_BQ_SET_1, RT1011_MONO_LR_SEL_MASK,
+			RT1011_MONO_R_CHANNEL);
+		snd_soc_component_update_bits(component,
+			RT1011_TDM1_SET_4,
+			RT1011_TDM_I2S_TX_L_DAC1_1_MASK |
+			RT1011_TDM_I2S_TX_R_DAC1_1_MASK,
+			((first_bit-1) << RT1011_TDM_I2S_TX_L_DAC1_1_SFT) |
+			(first_bit << RT1011_TDM_I2S_TX_R_DAC1_1_SFT));
+		break;
+	default:
+		ret = -EINVAL;
+		goto _set_tdm_err_;
+	}
+
+	/* Tx slot configuration */
+	tx_slotnum = hweight_long(tx_mask);
+	first_bit = find_next_bit((unsigned long *)&tx_mask, 32, 0);
+	last_bit = find_last_bit((unsigned long *)&tx_mask, 32);
+	if (tx_slotnum > 2 || (last_bit-first_bit) > 1) {
+		ret = -EINVAL;
+		dev_dbg(component->dev, "too many tx slots or tx slot location error\n");
+		goto _set_tdm_err_;
+	}
+
+	if (tx_slotnum == 1) {
+		snd_soc_component_update_bits(component, RT1011_TDM1_SET_2,
+			RT1011_TDM_I2S_DOCK_ADCDAT_LEN_1_MASK |
+			RT1011_TDM_ADCDAT1_DATA_LOCATION, first_bit);
+		switch (first_bit) {
+		case 1:
+			snd_soc_component_update_bits(component,
+				RT1011_TDM1_SET_3,
+				RT1011_TDM_I2S_RX_ADC1_1_MASK,
+				RT1011_TDM_I2S_RX_ADC1_1_LL);
+			break;
+		case 3:
+			snd_soc_component_update_bits(component,
+				RT1011_TDM1_SET_3,
+				RT1011_TDM_I2S_RX_ADC2_1_MASK,
+				RT1011_TDM_I2S_RX_ADC2_1_LL);
+			break;
+		case 5:
+			snd_soc_component_update_bits(component,
+				RT1011_TDM1_SET_3,
+				RT1011_TDM_I2S_RX_ADC3_1_MASK,
+				RT1011_TDM_I2S_RX_ADC3_1_LL);
+			break;
+		case 7:
+			snd_soc_component_update_bits(component,
+				RT1011_TDM1_SET_3,
+				RT1011_TDM_I2S_RX_ADC4_1_MASK,
+				RT1011_TDM_I2S_RX_ADC4_1_LL);
+			break;
+		case 0:
+			snd_soc_component_update_bits(component,
+				RT1011_TDM1_SET_3,
+				RT1011_TDM_I2S_RX_ADC1_1_MASK, 0);
+			break;
+		case 2:
+			snd_soc_component_update_bits(component,
+				RT1011_TDM1_SET_3,
+				RT1011_TDM_I2S_RX_ADC2_1_MASK, 0);
+			break;
+		case 4:
+			snd_soc_component_update_bits(component,
+				RT1011_TDM1_SET_3,
+				RT1011_TDM_I2S_RX_ADC3_1_MASK, 0);
+			break;
+		case 6:
+			snd_soc_component_update_bits(component,
+				RT1011_TDM1_SET_3,
+				RT1011_TDM_I2S_RX_ADC4_1_MASK, 0);
+			break;
+		default:
+			ret = -EINVAL;
+			dev_dbg(component->dev,
+				"tx slot location error\n");
+			goto _set_tdm_err_;
+		}
+	} else if (tx_slotnum == 2) {
+		switch (first_bit) {
+		case 0:
+		case 2:
+		case 4:
+		case 6:
+			snd_soc_component_update_bits(component,
+				RT1011_TDM1_SET_2,
+				RT1011_TDM_I2S_DOCK_ADCDAT_LEN_1_MASK |
+				RT1011_TDM_ADCDAT1_DATA_LOCATION,
+				RT1011_TDM_I2S_DOCK_ADCDAT_2CH | first_bit);
+			break;
+		default:
+			ret = -EINVAL;
+			dev_dbg(component->dev,
+				"tx slot location should be paired and start from slot0/2/4/6\n");
+			goto _set_tdm_err_;
+		}
 	}
 
 	snd_soc_component_update_bits(component, RT1011_TDM1_SET_1,
@@ -1860,10 +1990,12 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 		RT1011_TDM_I2S_DOCK_EN_1_MASK,	tdm_en);
 	snd_soc_component_update_bits(component, RT1011_TDM2_SET_2,
 		RT1011_TDM_I2S_DOCK_EN_2_MASK,	tdm_en);
-	snd_soc_component_update_bits(component, RT1011_TDM_TOTAL_SET,
-		RT1011_ADCDAT1_PIN_CONFIG | RT1011_ADCDAT2_PIN_CONFIG,
-		RT1011_ADCDAT1_OUTPUT | RT1011_ADCDAT2_OUTPUT);
+	if (tx_slotnum)
+		snd_soc_component_update_bits(component, RT1011_TDM_TOTAL_SET,
+			RT1011_ADCDAT1_PIN_CONFIG | RT1011_ADCDAT2_PIN_CONFIG,
+			RT1011_ADCDAT1_OUTPUT | RT1011_ADCDAT2_OUTPUT);
 
+_set_tdm_err_:
 	snd_soc_dapm_mutex_unlock(dapm);
 	return ret;
 }
diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
index 2d65983f3d0f..3f7dea1191ad 100644
--- a/sound/soc/codecs/rt1011.h
+++ b/sound/soc/codecs/rt1011.h
@@ -460,6 +460,23 @@
 #define RT1011_TDM_I2S_DOCK_EN_1_MASK			(0x1 << 3)
 #define RT1011_TDM_I2S_DOCK_EN_1_SFT			3
 #define RT1011_TDM_I2S_DOCK_EN_1		(0x1 << 3)
+#define RT1011_TDM_ADCDAT1_DATA_LOCATION			(0x7 << 0)
+
+/* TDM1 Setting-3 (0x0118) */
+#define RT1011_TDM_I2S_RX_ADC1_1_MASK			(0x3 << 6)
+#define RT1011_TDM_I2S_RX_ADC2_1_MASK			(0x3 << 4)
+#define RT1011_TDM_I2S_RX_ADC3_1_MASK			(0x3 << 2)
+#define RT1011_TDM_I2S_RX_ADC4_1_MASK			(0x3 << 0)
+#define RT1011_TDM_I2S_RX_ADC1_1_LL			(0x2 << 6)
+#define RT1011_TDM_I2S_RX_ADC2_1_LL			(0x2 << 4)
+#define RT1011_TDM_I2S_RX_ADC3_1_LL			(0x2 << 2)
+#define RT1011_TDM_I2S_RX_ADC4_1_LL			(0x2 << 0)
+
+/* TDM1 Setting-4 (0x011a) */
+#define RT1011_TDM_I2S_TX_L_DAC1_1_MASK			(0x7 << 12)
+#define RT1011_TDM_I2S_TX_R_DAC1_1_MASK			(0x7 << 8)
+#define RT1011_TDM_I2S_TX_L_DAC1_1_SFT 12
+#define RT1011_TDM_I2S_TX_R_DAC1_1_SFT 8
 
 /* TDM2 Setting-2 (0x0120) */
 #define RT1011_TDM_I2S_DOCK_ADCDAT_LEN_2_MASK			(0x7 << 13)
@@ -585,6 +602,12 @@
 #define RT1011_STP_T0_EN_BIT		6
 #define RT1011_STP_T0_EN		(0x1 << 6)
 
+/* Cross Biquad Setting-1 (0x0702) */
+#define RT1011_MONO_LR_SEL_MASK			(0x3 << 5)
+#define RT1011_MONO_L_CHANNEL			(0x0 << 5)
+#define RT1011_MONO_R_CHANNEL			(0x1 << 5)
+#define RT1011_MONO_LR_MIX_CHANNEL			(0x2 << 5)
+
 /* ClassD Internal Setting-1 (0x1300) */
 #define RT1011_DRIVER_READY_SPK			(0x1 << 12)
 #define RT1011_DRIVER_READY_SPK_BIT		12
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
