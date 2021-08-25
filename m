Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDF3F6E13
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 06:05:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA314167E;
	Wed, 25 Aug 2021 06:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA314167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629864349;
	bh=YPyz+drH9RsVD/EneruHxA/oDILVzuj1rhlWL9VYpUA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=acRiRMGF7LUWpCaR3G7MtGQVFjAoo9OY3nai+e6b9r1J2cdr2hVFPh7TCdHlrQQiB
	 x/02CA3hEC7Vpm+M/HOcuxuORNHUAz5YMcAALJ0erGOEnrp5gHe8r3N6gpbnLqtC4g
	 9ZQ3xHiIQdBxbsqYQlreKrBzVMf7EK+RHXUnE18U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C894F8020D;
	Wed, 25 Aug 2021 06:04:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72522F8020C; Wed, 25 Aug 2021 06:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB05F800B6
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 06:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB05F800B6
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 17P441uB4021123,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36501.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 17P441uB4021123
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 Aug 2021 12:04:01 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36501.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 25 Aug 2021 12:04:00 +0800
Received: from derek-PORTEGE-R930.realtek.com.tw (172.22.102.119) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 25 Aug 2021 12:03:59 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: rt5682: Fix the vol+ button detection issue
Date: Wed, 25 Aug 2021 12:03:46 +0800
Message-ID: <20210825040346.28346-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.102.119]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/25/2021 03:44:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzgvMjUgpFekyCAwMToyODowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36501.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 08/25/2021 03:41:13
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 165774 [Aug 24 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: derek.fang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 457 457 f9912fc467375383fbac52a53ade5bbe1c769e2a
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/25/2021 03:44:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Derek Fang <derek.fang@realtek.com>,
 shumingf@realtek.com, flove@realtek.com
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

From: Derek Fang <derek.fang@realtek.com>

Fix the wrong button vol+ detection issue with some brand headsets
by fine tuning the threshold of button vol+ and SAR ADC button accuracy.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index fcf442b8a732..e822fa1b9d4b 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -43,7 +43,9 @@ static const struct reg_sequence patch_list[] = {
 	{RT5682_DAC_ADC_DIG_VOL1, 0xa020},
 	{RT5682_I2C_CTRL, 0x000f},
 	{RT5682_PLL2_INTERNAL, 0x8266},
-	{RT5682_SAR_IL_CMD_3, 0x8365},
+	{RT5682_SAR_IL_CMD_1, 0x22b7},
+	{RT5682_SAR_IL_CMD_3, 0x0365},
+	{RT5682_SAR_IL_CMD_6, 0x0110},
 };
 
 void rt5682_apply_patch_list(struct rt5682_priv *rt5682, struct device *dev)
@@ -1726,8 +1728,6 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("Stereo1 ADC MIXR", RT5682_STO1_ADC_DIG_VOL,
 		RT5682_R_MUTE_SFT, 1, rt5682_sto1_adc_r_mix,
 		ARRAY_SIZE(rt5682_sto1_adc_r_mix)),
-	SND_SOC_DAPM_SUPPLY("BTN Detection Mode", RT5682_SAR_IL_CMD_1,
-		14, 1, NULL, 0),
 
 	/* ADC PGA */
 	SND_SOC_DAPM_PGA("Stereo1 ADC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -1898,8 +1898,6 @@ static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
 	{"Stereo1 ADC MIXR", "ADC2 Switch", "Stereo1 ADC R2 Mux"},
 	{"Stereo1 ADC MIXR", NULL, "ADC Stereo1 Filter"},
 
-	{"ADC Stereo1 Filter", NULL, "BTN Detection Mode"},
-
 	{"Stereo1 ADC MIX", NULL, "Stereo1 ADC MIXL"},
 	{"Stereo1 ADC MIX", NULL, "Stereo1 ADC MIXR"},
 
@@ -2949,7 +2947,8 @@ static int rt5682_suspend(struct snd_soc_component *component)
 
 		/* enter SAR ADC power saving mode */
 		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
-			RT5682_SAR_BUTT_DET_MASK | RT5682_SAR_BUTDET_MODE_MASK | RT5682_SAR_BUTDET_RST_MASK, 0);
+			RT5682_SAR_BUTT_DET_MASK | RT5682_SAR_BUTDET_MODE_MASK |
+			RT5682_SAR_BUTDET_RST_MASK | RT5682_SAR_SEL_MB1_MB2_MASK, 0);
 		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
 			RT5682_SAR_BUTT_DET_MASK | RT5682_SAR_BUTDET_MODE_MASK | RT5682_SAR_BUTDET_RST_MASK,
 			RT5682_SAR_BUTT_DET_EN | RT5682_SAR_BUTDET_POW_SAV | RT5682_SAR_BUTDET_RST_NORMAL);
@@ -2971,6 +2970,9 @@ static int rt5682_resume(struct snd_soc_component *component)
 	regcache_sync(rt5682->regmap);
 
 	if (rt5682->hs_jack && rt5682->jack_type == SND_JACK_HEADSET) {
+		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
+			RT5682_SAR_BUTDET_MODE_MASK | RT5682_SAR_SEL_MB1_MB2_MASK,
+			RT5682_SAR_BUTDET_POW_NORM | RT5682_SAR_SEL_MB1_MB2_AUTO);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
 			RT5682_MB1_PATH_MASK | RT5682_MB2_PATH_MASK,
 			RT5682_CTRL_MB1_FSM | RT5682_CTRL_MB2_FSM);
-- 
2.17.1

