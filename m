Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 395A444D3E6
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Nov 2021 10:18:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA9011658;
	Thu, 11 Nov 2021 10:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA9011658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636622337;
	bh=M3QA54M6illCmC7M8c6MJnxxXTh6fwJ4CHF+Z9fUX20=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rLWOTlNUTxKgqcWUi+uNOajwV+i6HDjbhfqrvfylYOKi38+QLAGM1kONdTRunm9gy
	 aoc1JLgs36P4VYxSWwUKw7/jCjlldg0nU3lHRCmAk5PPke5YVHCdqJlwJ79b6hWdHv
	 3+37U7CrWZw+tv6rsYeSSUV/54SEiRi3sbtKDn2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DA3CF802E3;
	Thu, 11 Nov 2021 10:17:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A02AF802D2; Thu, 11 Nov 2021 10:17:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55FD6F80054
 for <alsa-devel@alsa-project.org>; Thu, 11 Nov 2021 10:17:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55FD6F80054
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1AB9HCkyC015357,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1AB9HCkyC015357
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Nov 2021 17:17:12 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 17:17:12 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 11 Nov 2021 04:17:11 -0500
From: Jack Yu <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1011: revert 'I2S Reference' to SOC_ENUM_EXT
Date: Thu, 11 Nov 2021 17:17:05 +0800
Message-ID: <20211111091705.20879-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/11/2021 09:03:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzExLzExIKRXpMggMDc6NDM6MDA=?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 11/11/2021 08:59:40
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 167198 [Nov 11 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: jack.yu@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 465 465 eb31509370142567679dd183ac984a0cb2ee3296
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
X-KSE-Antiphishing-Bases: 11/11/2021 09:03:00
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
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

Revert 'I2S Reference' to SOC_ENUM_EXT because the settings are specific
for some platforms, the default setting for 'I2S Reference' does nothing,
only some SoC platform need to configure it.
Previous 'I2S Reference' in SOC_ENUM format only toggles one bit of
RT1011_TDM1_SET_1 register, which isn't enough for specific platform.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1011.c | 55 ++++++++++++++++++++++++++++++++++-----
 sound/soc/codecs/rt1011.h |  7 +++++
 2 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 297af7ff824c..b62301a6281f 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1311,13 +1311,54 @@ static int rt1011_r0_load_info(struct snd_kcontrol *kcontrol,
 	.put = rt1011_r0_load_mode_put \
 }
 
-static const char * const rt1011_i2s_ref_texts[] = {
-	"Left Channel", "Right Channel"
+static const char * const rt1011_i2s_ref[] = {
+	"None", "Left Channel", "Right Channel"
 };
 
-static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum,
-			    RT1011_TDM1_SET_1, 7,
-			    rt1011_i2s_ref_texts);
+static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum, 0, 0,
+	rt1011_i2s_ref);
+
+static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct rt1011_priv *rt1011 =
+		snd_soc_component_get_drvdata(component);
+
+	rt1011->i2s_ref = ucontrol->value.enumerated.item[0];
+	switch (rt1011->i2s_ref) {
+	case RT1011_I2S_REF_LEFT_CH:
+		regmap_write(rt1011->regmap, RT1011_TDM_TOTAL_SET, 0x0240);
+		regmap_write(rt1011->regmap, RT1011_TDM1_SET_2, 0x8);
+		regmap_write(rt1011->regmap, RT1011_TDM1_SET_1, 0x1022);
+		regmap_write(rt1011->regmap, RT1011_ADCDAT_OUT_SOURCE, 0x4);
+		break;
+	case RT1011_I2S_REF_RIGHT_CH:
+		regmap_write(rt1011->regmap, RT1011_TDM_TOTAL_SET, 0x0240);
+		regmap_write(rt1011->regmap, RT1011_TDM1_SET_2, 0x8);
+		regmap_write(rt1011->regmap, RT1011_TDM1_SET_1, 0x10a2);
+		regmap_write(rt1011->regmap, RT1011_ADCDAT_OUT_SOURCE, 0x4);
+		break;
+	default:
+		dev_info(component->dev, "I2S Reference: Do nothing\n");
+	}
+
+	return 0;
+}
+
+static int rt1011_i2s_ref_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct rt1011_priv *rt1011 =
+		snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.enumerated.item[0] = rt1011->i2s_ref;
+
+	return 0;
+}
 
 static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	/* I2S Data In Selection */
@@ -1358,7 +1399,8 @@ static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	SOC_SINGLE("R0 Temperature", RT1011_STP_INITIAL_RESISTANCE_TEMP,
 		2, 255, 0),
 	/* I2S Reference */
-	SOC_ENUM("I2S Reference", rt1011_i2s_ref_enum),
+	SOC_ENUM_EXT("I2S Reference", rt1011_i2s_ref_enum,
+		rt1011_i2s_ref_get, rt1011_i2s_ref_put),
 };
 
 static int rt1011_is_sys_clk_from_pll(struct snd_soc_dapm_widget *source,
@@ -2017,6 +2059,7 @@ static int rt1011_probe(struct snd_soc_component *component)
 
 	schedule_work(&rt1011->cali_work);
 
+	rt1011->i2s_ref = 0;
 	rt1011->bq_drc_params = devm_kcalloc(component->dev,
 		RT1011_ADVMODE_NUM, sizeof(struct rt1011_bq_drc_params *),
 		GFP_KERNEL);
diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
index 68fadc15fa8c..4d6e7492d99c 100644
--- a/sound/soc/codecs/rt1011.h
+++ b/sound/soc/codecs/rt1011.h
@@ -654,6 +654,12 @@ enum {
 	RT1011_AIFS
 };
 
+enum {
+	RT1011_I2S_REF_NONE,
+	RT1011_I2S_REF_LEFT_CH,
+	RT1011_I2S_REF_RIGHT_CH,
+};
+
 /* BiQual & DRC related settings */
 #define RT1011_BQ_DRC_NUM 128
 struct rt1011_bq_drc_params {
@@ -692,6 +698,7 @@ struct rt1011_priv {
 	unsigned int r0_reg, cali_done;
 	unsigned int r0_calib, temperature_calib;
 	int recv_spk_mode;
+	int i2s_ref;
 };
 
 #endif		/* end of _RT1011_H_ */
-- 
2.33.0

