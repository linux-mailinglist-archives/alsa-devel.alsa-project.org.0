Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C31B242D64F
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 11:42:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EA82166A;
	Thu, 14 Oct 2021 11:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EA82166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634204559;
	bh=2MdCGIDCZD0pSF5Ax53b68ptDNF1jRQshArV6EHE+1c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VQbQo5d1m6pdqIklYWg6ZNxz3GPUpaa4JCPvMHiLw/2q1Hc6p3gdgEmnldgmgSKIu
	 27S7vHZDrujVym0ItvkYc3oKqov9nbK5KsXVgF+it5IcOKY8+xmj37PtxitoN3nqdj
	 Sb4QUa2nlsX2mTNRQlKDXDnEiyrMiSavyd87j6y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFFE9F80088;
	Thu, 14 Oct 2021 11:41:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04059F80212; Thu, 14 Oct 2021 11:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D62A3F80088
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 11:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D62A3F80088
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 19E9f1asD011168,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 19E9f1asD011168
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 14 Oct 2021 17:41:01 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 14 Oct 2021 17:41:00 +0800
Received: from localhost.localdomain (172.22.233.32) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 14 Oct 2021 17:41:00 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682: fix a little pop while playback
Date: Thu, 14 Oct 2021 17:40:54 +0800
Message-ID: <20211014094054.811-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.233.32]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/14/2021 09:16:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzEwLzE0IKRXpMggMDg6MjI6MDA=?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/14/2021 09:13:28
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 166718 [Oct 14 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: derek.fang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 463 463 5854868460de3f0d8e8c0a4df98aeb05fb764a09
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
X-KSE-Antiphishing-Bases: 10/14/2021 09:16:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Derek Fang <derek.fang@realtek.com>,
 kevin_chen_ym@realtek.com, shumingf@realtek.com, flove@realtek.com
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

A little pop can be heard obviously from HP while playing a silent.
This patch fixes it by using two functions:
1. Enable HP 1bit output mode.
2. Change the charge pump switch size during playback on and off.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682.c | 56 +++++++++++++++++++++++++++++++++------
 sound/soc/codecs/rt5682.h | 20 ++++++++++++++
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 914fe7debc05..78b4cb5fb6c8 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -46,6 +46,8 @@ static const struct reg_sequence patch_list[] = {
 	{RT5682_SAR_IL_CMD_1, 0x22b7},
 	{RT5682_SAR_IL_CMD_3, 0x0365},
 	{RT5682_SAR_IL_CMD_6, 0x0110},
+	{RT5682_CHARGE_PUMP_1, 0x0210},
+	{RT5682_HP_LOGIC_CTRL_2, 0x0007},
 };
 
 void rt5682_apply_patch_list(struct rt5682_priv *rt5682, struct device *dev)
@@ -1515,21 +1517,29 @@ static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		snd_soc_component_write(component,
-			RT5682_HP_LOGIC_CTRL_2, 0x0012);
-		snd_soc_component_write(component,
-			RT5682_HP_CTRL_2, 0x6000);
+		snd_soc_component_update_bits(component, RT5682_HP_CTRL_2,
+			RT5682_HP_C2_DAC_AMP_MUTE, 0);
+		snd_soc_component_update_bits(component, RT5682_HP_LOGIC_CTRL_2,
+			RT5682_HP_LC2_SIG_SOUR2_MASK, RT5682_HP_LC2_SIG_SOUR2_REG);
 		snd_soc_component_update_bits(component,
 			RT5682_DEPOP_1, 0x60, 0x60);
 		snd_soc_component_update_bits(component,
 			RT5682_DAC_ADC_DIG_VOL1, 0x00c0, 0x0080);
+		snd_soc_component_update_bits(component, RT5682_HP_CTRL_2,
+			RT5682_HP_C2_DAC_L_EN | RT5682_HP_C2_DAC_R_EN,
+			RT5682_HP_C2_DAC_L_EN | RT5682_HP_C2_DAC_R_EN);
+		usleep_range(5000, 10000);
+		snd_soc_component_update_bits(component, RT5682_CHARGE_PUMP_1,
+			RT5682_CP_SW_SIZE_MASK, RT5682_CP_SW_SIZE_L);
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, RT5682_HP_CTRL_2,
+			RT5682_HP_C2_DAC_L_EN | RT5682_HP_C2_DAC_R_EN, 0);
+		snd_soc_component_update_bits(component, RT5682_CHARGE_PUMP_1,
+			RT5682_CP_SW_SIZE_MASK, RT5682_CP_SW_SIZE_M);
 		snd_soc_component_update_bits(component,
 			RT5682_DEPOP_1, 0x60, 0x0);
-		snd_soc_component_write(component,
-			RT5682_HP_CTRL_2, 0x0000);
 		snd_soc_component_update_bits(component,
 			RT5682_DAC_ADC_DIG_VOL1, 0x00c0, 0x0000);
 		break;
@@ -1637,6 +1647,23 @@ static SOC_VALUE_ENUM_SINGLE_DECL(rt5682_adcdat_pin_enum,
 static const struct snd_kcontrol_new rt5682_adcdat_pin_ctrl =
 	SOC_DAPM_ENUM("ADCDAT", rt5682_adcdat_pin_enum);
 
+static const unsigned int rt5682_hpo_sig_out_values[] = {
+	2,
+	7,
+};
+
+static const char * const rt5682_hpo_sig_out_mode[] = {
+	"Legacy",
+	"OneBit",
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(rt5682_hpo_sig_out_enum,
+	RT5682_HP_LOGIC_CTRL_2, 0, RT5682_HP_LC2_SIG_SOUR1_MASK,
+	rt5682_hpo_sig_out_mode, rt5682_hpo_sig_out_values);
+
+static const struct snd_kcontrol_new rt5682_hpo_sig_demux =
+	SOC_DAPM_ENUM("HPO Signal Demux", rt5682_hpo_sig_out_enum);
+
 static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("LDO2", RT5682_PWR_ANLG_3, RT5682_PWR_LDO2_BIT,
 		0, NULL, 0),
@@ -1820,6 +1847,10 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 	SND_SOC_DAPM_SWITCH("HPOR Playback", SND_SOC_NOPM, 0, 0,
 		&hpor_switch),
 
+	SND_SOC_DAPM_OUT_DRV("HPO Legacy", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_OUT_DRV("HPO OneBit", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_DEMUX("HPO Signal Demux", SND_SOC_NOPM, 0, 0, &rt5682_hpo_sig_demux),
+
 	/* CLK DET */
 	SND_SOC_DAPM_SUPPLY("CLKDET SYS", RT5682_CLK_DET,
 		RT5682_SYS_CLK_DET_SFT,	0, NULL, 0),
@@ -1987,10 +2018,19 @@ static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
 	{"HP Amp", NULL, "Charge Pump"},
 	{"HP Amp", NULL, "CLKDET SYS"},
 	{"HP Amp", NULL, "Vref1"},
-	{"HPOL Playback", "Switch", "HP Amp"},
-	{"HPOR Playback", "Switch", "HP Amp"},
+
+	{"HPO Signal Demux", NULL, "HP Amp"},
+
+	{"HPO Legacy", "Legacy", "HPO Signal Demux"},
+	{"HPO OneBit", "OneBit", "HPO Signal Demux"},
+
+	{"HPOL Playback", "Switch", "HPO Legacy"},
+	{"HPOR Playback", "Switch", "HPO Legacy"},
+
 	{"HPOL", NULL, "HPOL Playback"},
 	{"HPOR", NULL, "HPOR Playback"},
+	{"HPOL", NULL, "HPO OneBit"},
+	{"HPOR", NULL, "HPO OneBit"},
 };
 
 static int rt5682_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 262512babc50..d93829c35585 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -375,6 +375,14 @@
 #define RT5682_R_VOL_MASK			(0x3f)
 #define RT5682_R_VOL_SFT			0
 
+/* Headphone Amp Control 2 (0x0003) */
+#define RT5682_HP_C2_DAC_AMP_MUTE_SFT		15
+#define RT5682_HP_C2_DAC_AMP_MUTE		(0x1 << 15)
+#define RT5682_HP_C2_DAC_L_EN_SFT		14
+#define RT5682_HP_C2_DAC_L_EN			(0x1 << 14)
+#define RT5682_HP_C2_DAC_R_EN_SFT		13
+#define RT5682_HP_C2_DAC_R_EN			(0x1 << 13)
+
 /*Headphone Amp L/R Analog Gain and Digital NG2 Gain Control (0x0005 0x0006)*/
 #define RT5682_G_HP				(0xf << 8)
 #define RT5682_G_HP_SFT				8
@@ -1265,6 +1273,10 @@
 #define RT5682_HPA_CP_BIAS_6UA			(0x3 << 2)
 
 /* Charge Pump Internal Register1 (0x0125) */
+#define RT5682_CP_SW_SIZE_MASK			(0x7 << 8)
+#define RT5682_CP_SW_SIZE_L			(0x4 << 8)
+#define RT5682_CP_SW_SIZE_M			(0x2 << 8)
+#define RT5682_CP_SW_SIZE_S			(0x1 << 8)
 #define RT5682_CP_CLK_HP_MASK			(0x3 << 4)
 #define RT5682_CP_CLK_HP_100KHZ			(0x0 << 4)
 #define RT5682_CP_CLK_HP_200KHZ			(0x1 << 4)
@@ -1315,6 +1327,14 @@
 #define RT5682_DEB_STO_DAC_MASK			(0x7 << 4)
 #define RT5682_DEB_80_MS			(0x0 << 4)
 
+/* HP Behavior Logic Control 2 (0x01db) */
+#define RT5682_HP_LC2_SIG_SOUR2_MASK		(0x1 << 4)
+#define RT5682_HP_LC2_SIG_SOUR2_REG		(0x1 << 4)
+#define RT5682_HP_LC2_SIG_SOUR2_DC_CAL		(0x0 << 4)
+#define RT5682_HP_LC2_SIG_SOUR1_MASK		(0x7)
+#define RT5682_HP_LC2_SIG_SOUR1_1BIT		(0x7)
+#define RT5682_HP_LC2_SIG_SOUR1_LEGA		(0x2)
+
 /* SAR ADC Inline Command Control 1 (0x0210) */
 #define RT5682_SAR_BUTT_DET_MASK		(0x1 << 15)
 #define RT5682_SAR_BUTT_DET_EN			(0x1 << 15)
-- 
2.17.1

