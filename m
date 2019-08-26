Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA889CC1B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 11:04:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AA351680;
	Mon, 26 Aug 2019 11:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AA351680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566810273;
	bh=UgmYnN/Tqr+pdtF2rSSTRIh6CvMRctiW1a26mngbwDc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BaklB3/OeqKcLaPMO9nQTAc1bvttOpbvSJ6U1xJGUuJcMCdDen4YVKeG3PYeLh/+G
	 YhYgaxXYzru+mChtQtI7R1Y/8u2/iWtHQltOpKl9aRwqFWB38Z0riGTtfX+fhcfKg7
	 S2QvH7fO2l4MMFgHjyp8rwRt25Bz+LBIKSGbhxuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F7B4F805F7;
	Mon, 26 Aug 2019 11:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64E26F805F5; Mon, 26 Aug 2019 11:01:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5768AF80143
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 11:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5768AF80143
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x7Q91Rd1003604,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x7Q91Rd1003604
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 17:01:27 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.468.0; Mon, 26 Aug 2019 17:01:26 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Mon, 26 Aug 2019 17:01:20 +0800
Message-ID: <20190826090120.1937-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, Shuming Fan <shumingf@realtek.com>,
 derek.fang@realtek.com, sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: rt1011: ADCDAT pin config
	modification
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

ADCDAT pin config sets to output mode in default.
And the driver creates the kcontrol to control ADCDAT pin configuration.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index f9235764ad32..52c17450d5a0 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1029,6 +1029,14 @@ static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc1_1_enum,	RT1011_TDM1_SET_3, 6,
 static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc2_1_enum,	RT1011_TDM1_SET_3, 4,
 	rt1011_tdm_adc_swap_select);
 
+static const char * const rt1011_adcdat_pin_config_select[] = {
+	"Output", "Input"
+};
+static SOC_ENUM_SINGLE_DECL(rt1011_adcdat1_pin_config_enum, RT1011_TDM_TOTAL_SET, 4,
+	rt1011_adcdat_pin_config_select);
+static SOC_ENUM_SINGLE_DECL(rt1011_adcdat2_pin_config_enum, RT1011_TDM_TOTAL_SET, 3,
+	rt1011_adcdat_pin_config_select);
+
 static void rt1011_reset(struct regmap *regmap)
 {
 	regmap_write(regmap, RT1011_RESET, 0);
@@ -1343,6 +1351,8 @@ static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	SOC_ENUM("I2S ADC DOUT Mode", rt1011_adc_dout_mode_enum),
 	SOC_ENUM("TDM1 DOUT Length", rt1011_tdm1_dout_len_enum),
 	SOC_ENUM("TDM2 DOUT Length", rt1011_tdm2_dout_len_enum),
+	SOC_ENUM("ADCDAT1 Pin Config", rt1011_adcdat1_pin_config_enum),
+	SOC_ENUM("ADCDAT2 Pin Config", rt1011_adcdat2_pin_config_enum),
 
 	/* Speaker/Receiver Mode */
 	SOC_SINGLE_EXT("RECV SPK Mode", SND_SOC_NOPM, 0, 1, 0,
@@ -1859,9 +1869,6 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 		RT1011_TDM_I2S_DOCK_EN_1_MASK,	tdm_en);
 	snd_soc_component_update_bits(component, RT1011_TDM2_SET_2,
 		RT1011_TDM_I2S_DOCK_EN_2_MASK,	tdm_en);
-	snd_soc_component_update_bits(component, RT1011_TDM_TOTAL_SET,
-		RT1011_ADCDAT1_PIN_CONFIG | RT1011_ADCDAT2_PIN_CONFIG,
-		RT1011_ADCDAT1_OUTPUT | RT1011_ADCDAT2_OUTPUT);
 
 	snd_soc_dapm_mutex_unlock(dapm);
 	return ret;
@@ -2207,6 +2214,11 @@ static void rt1011_calibration_work(struct work_struct *work)
 
 	/* initial */
 	rt1011_reg_init(component);
+
+	/* set ADCDAT to output mode */
+	snd_soc_component_update_bits(component, RT1011_TDM_TOTAL_SET,
+		RT1011_ADCDAT1_PIN_CONFIG | RT1011_ADCDAT2_PIN_CONFIG,
+		RT1011_ADCDAT1_OUTPUT | RT1011_ADCDAT2_OUTPUT);
 }
 
 static int rt1011_i2c_probe(struct i2c_client *i2c,
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
