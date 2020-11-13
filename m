Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD442B15AB
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 06:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3203F188B;
	Fri, 13 Nov 2020 06:55:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3203F188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605246968;
	bh=86pboi+v1sIcDt4lX2DNwOBE/5og+v2AHY9SAf7WDXw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XU585meFjeCBTHJUUah//7Wuc2KkooOM82ZIfVTUiM+m+0BdcCLA9S7ATIJgkdg3B
	 Txp/jEkgOiLdsLzsLxvE9h8GJauSCd8iQ6GYIKh+cE539HIQQ/Gk4VH34QpiZN8v+l
	 qR6i2qzY+UGGDCvL6Cw+VPPl+5UKabGU5RXFfETg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF596F8022D;
	Fri, 13 Nov 2020 06:54:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B4BCF8022D; Fri, 13 Nov 2020 06:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 610D7F800D1
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 06:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 610D7F800D1
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AD5s68E1001876,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb03.realtek.com.tw[172.21.6.96])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AD5s68E1001876
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 13 Nov 2020 13:54:06 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Fri, 13 Nov 2020 13:54:06 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 13 Nov 2020 13:54:05 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: rt5682: Add a new property for the DMIC clock
 driving
Date: Fri, 13 Nov 2020 13:53:59 +0800
Message-ID: <20201113055400.11242-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.36)
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, cychiang@google.com, albertchen@realtek.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

The patch adds a new property to set the DMIC clock driving.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 include/sound/rt5682.h        |  1 +
 sound/soc/codecs/rt5682-i2c.c |  5 +++++
 sound/soc/codecs/rt5682.c     |  3 +++
 sound/soc/codecs/rt5682.h     | 14 ++++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/include/sound/rt5682.h b/include/sound/rt5682.h
index e1f790561ac1..3900a07e3935 100644
--- a/include/sound/rt5682.h
+++ b/include/sound/rt5682.h
@@ -40,6 +40,7 @@ struct rt5682_platform_data {
 	unsigned int btndet_delay;
 	unsigned int dmic_clk_rate;
 	unsigned int dmic_delay;
+	bool dmic_clk_driving_high;
 
 	const char *dai_clk_names[RT5682_DAI_NUM_CLKS];
 };
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 6b4e0eb30c89..37d13120f5ba 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -221,6 +221,11 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 		case RT5682_DMIC1_CLK_GPIO3: /* share with BCLK2 */
 			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
 				RT5682_GP3_PIN_MASK, RT5682_GP3_PIN_DMIC_CLK);
+			if (rt5682->pdata.dmic_clk_driving_high)
+				regmap_update_bits(rt5682->regmap,
+					RT5682_PAD_DRIVING_CTRL,
+					RT5682_PAD_DRV_GP3_MASK,
+					2 << RT5682_PAD_DRV_GP3_SFT);
 			break;
 
 		default:
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index a9acce7b6cca..f299b30f4f59 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2989,6 +2989,9 @@ int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 			 rt5682->pdata.dai_clk_names[RT5682_DAI_WCLK_IDX],
 			 rt5682->pdata.dai_clk_names[RT5682_DAI_BCLK_IDX]);
 
+	rt5682->pdata.dmic_clk_driving_high = device_property_read_bool(dev,
+		"realtek,dmic-clk-driving-high");
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rt5682_parse_dt);
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 354acd735ef4..99b85cfe6248 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1271,6 +1271,20 @@
 #define RT5682_CP_CLK_HP_300KHZ			(0x2 << 4)
 #define RT5682_CP_CLK_HP_600KHZ			(0x3 << 4)
 
+/* Pad Driving Control (0x0136) */
+#define RT5682_PAD_DRV_GP1_MASK			(0x3 << 14)
+#define RT5682_PAD_DRV_GP1_SFT			14
+#define RT5682_PAD_DRV_GP2_MASK			(0x3 << 12)
+#define RT5682_PAD_DRV_GP2_SFT			12
+#define RT5682_PAD_DRV_GP3_MASK			(0x3 << 10)
+#define RT5682_PAD_DRV_GP3_SFT			10
+#define RT5682_PAD_DRV_GP4_MASK			(0x3 << 8)
+#define RT5682_PAD_DRV_GP4_SFT			8
+#define RT5682_PAD_DRV_GP5_MASK			(0x3 << 6)
+#define RT5682_PAD_DRV_GP5_SFT			6
+#define RT5682_PAD_DRV_GP6_MASK			(0x3 << 4)
+#define RT5682_PAD_DRV_GP6_SFT			4
+
 /* Chopper and Clock control for DAC (0x013a)*/
 #define RT5682_CKXEN_DAC1_MASK			(0x1 << 13)
 #define RT5682_CKXEN_DAC1_SFT			13
-- 
2.29.0

