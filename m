Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1E144B613
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:22:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF0451666;
	Tue,  9 Nov 2021 23:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF0451666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636496546;
	bh=KWQyp4KUtiDZ2PSsjvtehTLYYsXDPgG/pPblwLRzOGk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0UnTmtIsogcvGONGCZXQOdHEv7BWwFd6WtxamzFq0BBHepbQXblxCkYSrYKPg7Bh
	 0/+vu3iip9dySfmcdib8SR06rfSu6XCY/WxxXmt8KwFYAZ51zJtvYshS8K0uAj/NC+
	 uFXdApjDYpxexCJaIusHX6SiscgkykoVWnt/r2UQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EED6F80536;
	Tue,  9 Nov 2021 23:18:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B60B1F80535; Tue,  9 Nov 2021 23:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB0B4F80529
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB0B4F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VgMec/is"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AE7F6134F;
 Tue,  9 Nov 2021 22:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496301;
 bh=KWQyp4KUtiDZ2PSsjvtehTLYYsXDPgG/pPblwLRzOGk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VgMec/isS0i82qmGs71Nn9GhCH4HOY5WpPvAdhLUj24t8IiDsP+nDpeDC9fchLBMq
 wI8NMUdxb1kEr/MomT96g1Uq5xXcoLpCQQBsA+vBB+J+SuPfyzvxo8aD7+lwRUe0Ib
 +Eju/QustXk8UqrA7PA/+FkTjFcsdy5KTpx2AdJ7ltLROKNzv9bnhIseEZ1AwqkjZm
 dhaWCIYQqKW90MCTyTea62sMjkcatC5OGOLAcBNW8n3jrS1xf5hQSKiHKzrRzTXQCW
 VngEHBGP9fC1jKQ/09O2s32XV+BYo9nIFiD5UaYHxFneY9r3GUWy23yBJFFFQD6PEc
 zbmLTU4NzCtbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 55/82] ASoC: rt5682: fix a little pop while
 playback
Date: Tue,  9 Nov 2021 17:16:13 -0500
Message-Id: <20211109221641.1233217-55-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221641.1233217-1-sashal@kernel.org>
References: <20211109221641.1233217-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 bardliao@realtek.com
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

[ Upstream commit 4b19e4a77cc6baa0f840e8bae62ab974667f6207 ]

A little pop can be heard obviously from HP while playing a silent.
This patch fixes it by using two functions:
1. Enable HP 1bit output mode.
2. Change the charge pump switch size during playback on and off.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Link: https://lore.kernel.org/r/20211014094054.811-1-derek.fang@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5682.c | 56 +++++++++++++++++++++++++++++++++------
 sound/soc/codecs/rt5682.h | 20 ++++++++++++++
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 4a64cab99c55b..d550c0705c28b 100644
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
index b59221048ebf9..8e3244a62c160 100644
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
2.33.0

