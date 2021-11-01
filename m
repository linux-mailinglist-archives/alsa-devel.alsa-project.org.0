Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B594E441991
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 11:11:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF0616DF;
	Mon,  1 Nov 2021 11:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF0616DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635761514;
	bh=U7RiVpcxF9qqi2jx0LDiQ9dFQer2cGy0Q8JrXDI39Uo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OunEc6KIOfLjPIgNuQO+COoxjvNTbR6M3GLlNTbwLg9kbwrfzgfws33ZgA4AS2qpT
	 kshc+px4BdNO7tnXA6SY9K6wwLLo/oQ+7Q/evPAgdtW1ThLtDakak56vIqszAfT6kE
	 JT246KvWvnBxaYyVk7FXM+upBRg78ElDh24WJTPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70B80F8026A;
	Mon,  1 Nov 2021 11:10:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74571F8012E; Mon,  1 Nov 2021 11:10:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21042F8012E
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 11:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21042F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Vm0pyE8M"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A17M1xZ007443;
 Mon, 1 Nov 2021 05:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=MuHTk7WWbI4FaMOqXKtopVQskFCqIgwcH1k0Lq3hmRo=;
 b=Vm0pyE8M/YIOxE4MGOwELCznlmtOENo8y39o9EcRXbZl4D2ue4f1fk9s8q8xtMWc6vMh
 qGm9sdGd4N/WGQGWKHoyZENJcq6k4r07op8oHW7+Yg4OH2RufkGDV+CtkeiLxtbRU2RM
 9jV3wgkBGtdNluOdhfOvMbePY+TY2bbMSY/VOuFuBtxutJRh34WeFPsnQq7isr+d9heR
 d7fEIqpXkraUhq8gzyA7YeICjj7SP4el4/pnCRvIhs2oCt19l0MBNfDx10C0n7dcEctx
 UXqRa6p6ni/ode8i4KE9bCoUvd6s1MVxrSy/KNjlZtyduQ1PRhmhKbU2SUSLTbd6+gQd fg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3c27qwrehr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 01 Nov 2021 05:10:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.12; Mon, 1 Nov
 2021 10:10:23 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.12 via
 Frontend Transport; Mon, 1 Nov 2021 10:10:23 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.118])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EA2B5B2F;
 Mon,  1 Nov 2021 10:10:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2] ASoC: cs42l42: Add control for audio slow-start switch
Date: Mon, 1 Nov 2021 10:10:06 +0000
Message-ID: <20211101101006.13092-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: v8mNlrN4fmjmj4_0JemTQZ59cjMICkPn
X-Proofpoint-GUID: v8mNlrN4fmjmj4_0JemTQZ59cjMICkPn
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

This adds an ALSA control so that the slow-start audio ramp feature
can be disabled. This is useful for high-definition audio applications.

The register field is unusual in that it is a 3-bit field with only
two valid values, 000=off and 111=on.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 30 +++++++++++++++++++++++++++++-
 sound/soc/codecs/cs42l42.h |  3 +++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 27a1c4c73074..56804a3f285e 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -42,6 +42,7 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_SRC_CTL,			0x10 },
 	{ CS42L42_MCLK_CTL,			0x02 },
 	{ CS42L42_SFTRAMP_RATE,			0xA4 },
+	{ CS42L42_SLOW_START_ENABLE,		0x70 },
 	{ CS42L42_I2C_DEBOUNCE,			0x88 },
 	{ CS42L42_I2C_STRETCH,			0x03 },
 	{ CS42L42_I2C_TIMEOUT,			0xB7 },
@@ -177,6 +178,7 @@ static bool cs42l42_readable_register(struct device *dev, unsigned int reg)
 	case CS42L42_MCLK_STATUS:
 	case CS42L42_MCLK_CTL:
 	case CS42L42_SFTRAMP_RATE:
+	case CS42L42_SLOW_START_ENABLE:
 	case CS42L42_I2C_DEBOUNCE:
 	case CS42L42_I2C_STRETCH:
 	case CS42L42_I2C_TIMEOUT:
@@ -387,6 +389,28 @@ static const struct regmap_config cs42l42_regmap = {
 static DECLARE_TLV_DB_SCALE(adc_tlv, -9700, 100, true);
 static DECLARE_TLV_DB_SCALE(mixer_tlv, -6300, 100, true);
 
+static int cs42l42_slow_start_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	u8 val;
+
+	/* all bits of SLOW_START_EN much change together */
+	switch (ucontrol->value.integer.value[0]) {
+	case 0:
+		val = 0;
+		break;
+	case 1:
+		val = CS42L42_SLOW_START_EN_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return snd_soc_component_update_bits(component, CS42L42_SLOW_START_ENABLE,
+					     CS42L42_SLOW_START_EN_MASK, val);
+}
+
 static const char * const cs42l42_hpf_freq_text[] = {
 	"1.86Hz", "120Hz", "235Hz", "466Hz"
 };
@@ -431,7 +455,11 @@ static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 				CS42L42_DAC_HPF_EN_SHIFT, true, false),
 	SOC_DOUBLE_R_TLV("Mixer Volume", CS42L42_MIXER_CHA_VOL,
 			 CS42L42_MIXER_CHB_VOL, CS42L42_MIXER_CH_VOL_SHIFT,
-				0x3f, 1, mixer_tlv)
+				0x3f, 1, mixer_tlv),
+
+	SOC_SINGLE_EXT("Slow Start Switch", CS42L42_SLOW_START_ENABLE,
+			CS42L42_SLOW_START_EN_SHIFT, true, false,
+			snd_soc_get_volsw, cs42l42_slow_start_put),
 };
 
 static int cs42l42_hp_adc_ev(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index f45bcc9a3a62..c8b3267a318b 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -62,6 +62,9 @@
 #define CS42L42_INTERNAL_FS_MASK	(1 << CS42L42_INTERNAL_FS_SHIFT)
 
 #define CS42L42_SFTRAMP_RATE		(CS42L42_PAGE_10 + 0x0A)
+#define CS42L42_SLOW_START_ENABLE	(CS42L42_PAGE_10 + 0x0B)
+#define CS42L42_SLOW_START_EN_MASK	GENMASK(6, 4)
+#define CS42L42_SLOW_START_EN_SHIFT	4
 #define CS42L42_I2C_DEBOUNCE		(CS42L42_PAGE_10 + 0x0E)
 #define CS42L42_I2C_STRETCH		(CS42L42_PAGE_10 + 0x0F)
 #define CS42L42_I2C_TIMEOUT		(CS42L42_PAGE_10 + 0x10)
-- 
2.11.0

