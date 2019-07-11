Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 889CB6533A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 10:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E715A16B8;
	Thu, 11 Jul 2019 10:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E715A16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562833947;
	bh=cvnQUmhMztw/hhTJ285UxSF/HgaYDc1/xvWvMs0NmVg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SECTnxVXZWG1CcqbMc2brbmh8+6adoOLnzS6hhRbVJPU2jBQc2t3fOYPGKv3krBm0
	 9IbqHlYk0LVvP1jMlyLsEZvUWA0g02XxuJKQkfsT9AXvYilFgQdjiVXsAH9V7bbjTp
	 0LLwWAaMLhlFmQVIPo4s8Dpyjy4DA4NdDTfJeY8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDD3AF80308;
	Thu, 11 Jul 2019 10:30:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A849CF802E0; Thu, 11 Jul 2019 10:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=TIME_LIMIT_EXCEEDED,
 URIBL_BLOCKED autolearn=unavailable version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AAA0F801A4
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 10:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AAA0F801A4
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x6B8MpV4023260,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x6B8MpV4023260
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 11 Jul 2019 16:22:51 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.439.0; Thu, 11 Jul 2019 16:22:51 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 11 Jul 2019 16:22:47 +0800
Message-ID: <20190711082247.8192-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Shuming Fan <shumingf@realtek.com>, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, naveen.m@intel.com, mingjane_hsieh@realtek.com,
 flove@realtek.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: rt1011: Add R0 temperature and TDM1
	ADC2DAT Swap control
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

- The user level application could set the R0 temperature after booting system.
  The degree Celsius of R0 temperature store in the non-volatile space
  when doing R0 calibration.
- TDM1 ADC2DAT Swap controls use to control TDM slot2/3 data

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 9 ++++++++-
 sound/soc/codecs/rt1011.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 0a6ff13d76e1..b25b4c1127ca 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1029,6 +1029,8 @@ static const char * const rt1011_tdm_adc_swap_select[] = {
 
 static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc1_1_enum,	RT1011_TDM1_SET_3, 6,
 	rt1011_tdm_adc_swap_select);
+static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc2_1_enum,	RT1011_TDM1_SET_3, 4,
+	rt1011_tdm_adc_swap_select);
 
 static void rt1011_reset(struct regmap *regmap)
 {
@@ -1333,7 +1335,8 @@ static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	/* TDM1 Data Out Selection */
 	SOC_ENUM("TDM1 DOUT Source", rt1011_tdm1_adc1_dat_enum),
 	SOC_ENUM("TDM1 DOUT Location", rt1011_tdm1_adc1_loc_enum),
-	SOC_ENUM("TDM1 ADCDAT Swap Select", rt1011_tdm_adc1_1_enum),
+	SOC_ENUM("TDM1 ADC1DAT Swap Select", rt1011_tdm_adc1_1_enum),
+	SOC_ENUM("TDM1 ADC2DAT Swap Select", rt1011_tdm_adc2_1_enum),
 
 	/* Data Out Mode */
 	SOC_ENUM("I2S ADC DOUT Mode", rt1011_adc_dout_mode_enum),
@@ -1355,6 +1358,10 @@ static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	SOC_SINGLE_EXT("R0 Calibration", SND_SOC_NOPM, 0, 1, 0,
 		rt1011_r0_cali_get, rt1011_r0_cali_put),
 	RT1011_R0_LOAD("R0 Load Mode"),
+
+	/* R0 temperature */
+	SOC_SINGLE("R0 Temperature", RT1011_STP_INITIAL_RESISTANCE_TEMP,
+		2, 255, 0),
 };
 
 static int rt1011_is_sys_clk_from_pll(struct snd_soc_dapm_widget *source,
diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
index 98a38800c4df..5d431d7f1d16 100644
--- a/sound/soc/codecs/rt1011.h
+++ b/sound/soc/codecs/rt1011.h
@@ -227,6 +227,7 @@
 #define RT1011_STP_CALIB_RS_TEMP			0x152a
 #define RT1011_INIT_RECIPROCAL_REG_24_16				0x1538
 #define RT1011_INIT_RECIPROCAL_REG_15_0				0x1539
+#define RT1011_STP_INITIAL_RESISTANCE_TEMP				0x153c
 #define RT1011_STP_ALPHA_RECIPROCAL_MSB				0x153e
 #define RT1011_SPK_RESISTANCE_1				0x1544
 #define RT1011_SPK_RESISTANCE_2				0x1546
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
