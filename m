Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1BF2AB147
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 07:31:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995741667;
	Mon,  9 Nov 2020 07:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995741667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604903518;
	bh=xpoG1DlCuYEFZ9mLytM29Y5cjzlK473Z50RY5vsj19M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IdeN9bv3dyfyLBsrnNWDyZN7moRBs7Gyc0Joa6OOQVNsAWuEFXSckUqArRaBVvFN2
	 PLO0Cwt2xaKSOyGoKrJL+eyrFv1apr+ME6oK1BTGRls/ojzQ5z7s+cxJpgdTLiHUjg
	 Uhwp5sleAMCavC5ImbevN7q+E1Lb2CL4k/b1ainY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76A91F801F5;
	Mon,  9 Nov 2020 07:30:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52A51F8020C; Mon,  9 Nov 2020 07:30:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2A3CF800EA
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 07:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2A3CF800EA
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0A96U5Go8019475,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0A96U5Go8019475
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 9 Nov 2020 14:30:05 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 9 Nov 2020 14:30:05 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 9 Nov 2020 14:30:04 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1015: modification for calibration to get better
 performance
Date: Mon, 9 Nov 2020 14:29:58 +0800
Message-ID: <20201109062958.16917-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.36)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
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

From: Jack Yu <jack.yu@realtek.com>

Modification for calibration to get better performance.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1015.c | 101 ++++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 53 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 52787fbd522f..32d748cc5ae3 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -497,18 +497,40 @@ static void rt1015_calibrate(struct rt1015_priv *rt1015)
 	snd_soc_dapm_mutex_lock(&component->dapm);
 	regcache_cache_bypass(regmap, true);
 
-	regmap_write(regmap, RT1015_PWR1, 0xd7df);
-	regmap_write(regmap, RT1015_PWR4, 0x00b2);
-	regmap_write(regmap, RT1015_CLSD_INTERNAL8, 0x2008);
+	regmap_write(regmap, RT1015_PWR9, 0xAA60);
+	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x0089);
+	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x008A);
+	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x008C);
+	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x008D);
+	regmap_write(regmap, RT1015_PWR4, 0x80B2);
+	regmap_write(regmap, RT1015_CLASSD_SEQ, 0x5797);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL8, 0x2100);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL9, 0x0100);
+	regmap_write(regmap, RT1015_PWR5, 0x2175);
+	regmap_write(regmap, RT1015_MIXER1, 0x005D);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL1, 0x00A1);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL2, 0x12F7);
+	regmap_write(regmap, RT1015_DC_CALIB_CLSD1, 0x1205);
+	msleep(200);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL8, 0x2000);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL9, 0x0180);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL1, 0x00A1);
+	regmap_write(regmap, RT1015_DC_CALIB_CLSD1, 0x0A05);
+	msleep(200);
+	regmap_write(regmap, RT1015_PWR4, 0x00B2);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL8, 0x2028);
 	regmap_write(regmap, RT1015_CLSD_INTERNAL9, 0x0140);
-	regmap_write(regmap, RT1015_GAT_BOOST, 0x0efe);
-	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000d);
-	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000e);
-	regmap_write(regmap, RT1015_DC_CALIB_CLSD1, 0x5a00);
-	regmap_write(regmap, RT1015_DC_CALIB_CLSD1, 0x5a01);
-	regmap_write(regmap, RT1015_DC_CALIB_CLSD1, 0x5a05);
-	msleep(500);
-	regmap_write(regmap, RT1015_PWR1, 0x0);
+	regmap_write(regmap, RT1015_PWR5, 0x0175);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL1, 0x1721);
+	regmap_write(regmap, RT1015_CLASSD_SEQ, 0x570E);
+	regmap_write(regmap, RT1015_MIXER1, 0x203D);
+	regmap_write(regmap, RT1015_DC_CALIB_CLSD1, 0x5A01);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL2, 0x12FF);
+	regmap_write(regmap, RT1015_GAT_BOOST, 0x0eFE);
+	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x008E);
+	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x0088);
+	regmap_write(regmap, RT1015_SYS_RST1, 0x05F5);
+	regmap_write(regmap, RT1015_SYS_RST2, 0x0b9a);
 
 	regcache_cache_bypass(regmap, false);
 	regcache_mark_dirty(regmap);
@@ -603,6 +625,8 @@ static int r1015_dac_event(struct snd_soc_dapm_widget *w,
 		if (rt1015->bypass_boost == RT1015_Enable_Boost) {
 			snd_soc_component_write(component,
 				RT1015_SYS_RST1, 0x05f7);
+			snd_soc_component_write(component,
+				RT1015_SYS_RST2, 0x0b0a);
 			snd_soc_component_write(component,
 				RT1015_GAT_BOOST, 0xacfe);
 			snd_soc_component_write(component,
@@ -610,10 +634,14 @@ static int r1015_dac_event(struct snd_soc_dapm_widget *w,
 			snd_soc_component_write(component,
 				RT1015_GAT_BOOST, 0xecfe);
 		} else {
+			snd_soc_component_write(component,
+				0x032d, 0xaa60);
 			snd_soc_component_write(component,
 				RT1015_SYS_RST1, 0x05f7);
 			snd_soc_component_write(component,
-				RT1015_PWR_STATE_CTRL, 0x026e);
+				RT1015_SYS_RST2, 0x0b0a);
+			snd_soc_component_write(component,
+				RT1015_PWR_STATE_CTRL, 0x008e);
 		}
 		break;
 
@@ -627,11 +655,17 @@ static int r1015_dac_event(struct snd_soc_dapm_widget *w,
 				RT1015_PWR9, 0xa800);
 			snd_soc_component_write(component,
 				RT1015_SYS_RST1, 0x05f5);
+			snd_soc_component_write(component,
+				RT1015_SYS_RST2, 0x0b9a);
 		} else {
 			snd_soc_component_write(component,
-				RT1015_PWR_STATE_CTRL, 0x0268);
+				0x032d, 0xaa60);
+			snd_soc_component_write(component,
+				RT1015_PWR_STATE_CTRL, 0x0088);
 			snd_soc_component_write(component,
 				RT1015_SYS_RST1, 0x05f5);
+			snd_soc_component_write(component,
+				RT1015_SYS_RST2, 0x0b9a);
 		}
 		rt1015->dac_is_used = 0;
 
@@ -664,38 +698,12 @@ static int rt1015_amp_drv_event(struct snd_soc_dapm_widget *w,
 }
 
 static const struct snd_soc_dapm_widget rt1015_dapm_widgets[] = {
-	SND_SOC_DAPM_SUPPLY("LDO2", RT1015_PWR1, RT1015_PWR_LDO2_BIT, 0,
-		NULL, 0),
-	SND_SOC_DAPM_SUPPLY("INT RC CLK", RT1015_PWR1, RT1015_PWR_INTCLK_BIT,
-		0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("ISENSE", RT1015_PWR1, RT1015_PWR_ISENSE_BIT, 0,
-		NULL, 0),
-	SND_SOC_DAPM_SUPPLY("VSENSE", RT1015_PWR1, RT1015_PWR_VSENSE_BIT, 0,
-		NULL, 0),
 	SND_SOC_DAPM_SUPPLY("PLL", RT1015_PWR1, RT1015_PWR_PLL_BIT, 0,
 		NULL, 0),
-	SND_SOC_DAPM_SUPPLY("BG1 BG2", RT1015_PWR1, RT1015_PWR_BG_1_2_BIT, 0,
-		NULL, 0),
-	SND_SOC_DAPM_SUPPLY("MBIAS BG", RT1015_PWR1, RT1015_PWR_MBIAS_BG_BIT, 0,
-		NULL, 0),
-	SND_SOC_DAPM_SUPPLY("VBAT", RT1015_PWR1, RT1015_PWR_VBAT_BIT, 0, NULL,
-		0),
-	SND_SOC_DAPM_SUPPLY("MBIAS", RT1015_PWR1, RT1015_PWR_MBIAS_BIT, 0,
-		NULL, 0),
-	SND_SOC_DAPM_SUPPLY("ADCV", RT1015_PWR1, RT1015_PWR_ADCV_BIT, 0, NULL,
-		0),
-	SND_SOC_DAPM_SUPPLY("MIXERV", RT1015_PWR1, RT1015_PWR_MIXERV_BIT, 0,
-		NULL, 0),
-	SND_SOC_DAPM_SUPPLY("SUMV", RT1015_PWR1, RT1015_PWR_SUMV_BIT, 0, NULL,
-		0),
-	SND_SOC_DAPM_SUPPLY("VREFLV", RT1015_PWR1, RT1015_PWR_VREFLV_BIT, 0,
-		NULL, 0),
-
 	SND_SOC_DAPM_AIF_IN("AIFRX", "AIF Playback", 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_DAC_E("DAC", NULL, RT1015_PWR1, RT1015_PWR_DAC_BIT, 0,
+	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0,
 		r1015_dac_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 		SND_SOC_DAPM_POST_PMD),
-
 	SND_SOC_DAPM_OUT_DRV_E("Amp Drv", SND_SOC_NOPM, 0, 0, NULL, 0,
 			rt1015_amp_drv_event, SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_OUTPUT("SPO"),
@@ -703,19 +711,7 @@ static const struct snd_soc_dapm_widget rt1015_dapm_widgets[] = {
 
 static const struct snd_soc_dapm_route rt1015_dapm_routes[] = {
 	{ "DAC", NULL, "AIFRX" },
-	{ "DAC", NULL, "LDO2" },
 	{ "DAC", NULL, "PLL", rt1015_is_sys_clk_from_pll},
-	{ "DAC", NULL, "INT RC CLK" },
-	{ "DAC", NULL, "ISENSE" },
-	{ "DAC", NULL, "VSENSE" },
-	{ "DAC", NULL, "BG1 BG2" },
-	{ "DAC", NULL, "MBIAS BG" },
-	{ "DAC", NULL, "VBAT" },
-	{ "DAC", NULL, "MBIAS" },
-	{ "DAC", NULL, "ADCV" },
-	{ "DAC", NULL, "MIXERV" },
-	{ "DAC", NULL, "SUMV" },
-	{ "DAC", NULL, "VREFLV" },
 	{ "Amp Drv", NULL, "DAC" },
 	{ "SPO", NULL, "Amp Drv" },
 };
@@ -1058,7 +1054,6 @@ static int rt1015_probe(struct snd_soc_component *component)
 	rt1015->component = component;
 	rt1015->bclk_ratio = 0;
 	rt1015->cali_done = 0;
-	snd_soc_component_write(component, RT1015_BAT_RPO_STEP1, 0x061c);
 
 	INIT_DELAYED_WORK(&rt1015->flush_work, rt1015_flush_work);
 
-- 
2.29.0

