Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E2E252CA4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 13:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 819EE174E;
	Wed, 26 Aug 2020 13:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 819EE174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598442138;
	bh=ZRZA5KSLrS9/ukxU2rzBBkr3A8X6vSEtTNX3aWXBzOY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pOzryCdCnLm7iwXP7DH0R2lHpHCHrDXndIYBIYnLNK2x/WTwJiAxFlKIGqOfqJhiL
	 yvWoKpAqaWAAELM/kxKFqmHaN8Ke43Hse9ccxy2W0jkeS5m2TRDoRwJ8b9ioAWdPjW
	 dZPrO3ypOx3istunjCd3pv2t5/X/hmNvw6OEWvoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 910F3F80105;
	Wed, 26 Aug 2020 13:40:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C26ACF801D9; Wed, 26 Aug 2020 13:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79993F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 13:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79993F80105
IronPort-SDR: ihiAbG38bEsQ6G9F7lLD92CWCNU0IgYWIpEFRwvTrhIZ0Ldt3wT03WNm2QEkGgyPOyv8lueI0Q
 bfMKlgT5OSc0ereWFfN1YxD7pPBb76h7cQqYdr1WD00zRmEnH0qPVYE0ObxWR1Thy0Vvak6xp0
 5CSX+dxn0/kakrSj19U+ZfdreRU6oRFB4R2/UqhdwR1eIN9mWogKnlwj5fN0baaM2ximgZHJjy
 7pg7NV8KwUUylqCjkTzoYqckOLH2NpN7iMyrXVHl2iuyGubSaGm+rbHtvRjy59MhDCwa7gyNdV
 +cw=
X-IronPort-AV: E=Sophos;i="5.76,355,1592863200"; d="scan'208";a="12229664"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: max9867: shutdown codec when changing filter type
Date: Wed, 26 Aug 2020 13:39:04 +0200
Message-ID: <20200826113904.10265-1-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX04.axis.com (10.0.5.18)
Cc: broonie@kernel.org, ladis@linux-mips.org, Pavel Dobias <dobias@2n.cz>
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

Changing filter type without disabling codec results in filter
malfunction. Disable codec when changing filter type.

Signed-off-by: Pavel Dobias <dobias@2n.cz>
---
 sound/soc/codecs/max9867.c | 64 ++++++++++++++++++++++++++++++++------
 sound/soc/codecs/max9867.h |  4 ++-
 2 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index fcb31144d69c..c5bceb93b171 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -15,6 +15,13 @@
 #include <sound/tlv.h>
 #include "max9867.h"
 
+struct max9867_priv {
+	struct regmap *regmap;
+	const struct snd_pcm_hw_constraint_list *constraints;
+	unsigned int sysclk, pclk;
+	bool master, dsp_a;
+};
+
 static const char *const max9867_spmode[] = {
 	"Stereo Diff", "Mono Diff",
 	"Stereo Cap", "Mono Cap",
@@ -32,8 +39,52 @@ static const char *const max9867_adc_dac_filter_text[] = {
 	"Butterworth/8-24"
 };
 
-static SOC_ENUM_SINGLE_DECL(max9867_filter, MAX9867_CODECFLTR, 7,
-	max9867_filter_text);
+static int max9867_filter_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(max9867->regmap, MAX9867_CODECFLTR, &reg);
+	if (ret)
+		return -EINVAL;
+
+	if (reg & MAX9867_CODECFLTR_MODE)
+		ucontrol->value.enumerated.item[0] = 1;
+	else
+		ucontrol->value.enumerated.item[0] = 0;
+
+	return 0;
+}
+
+static int max9867_filter_set(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
+	unsigned int mode = ucontrol->value.enumerated.item[0];
+
+	if (mode > 1)
+		return -EINVAL;
+
+	/* shutdown codec before switching filter mode */
+	regmap_update_bits(max9867->regmap, MAX9867_PWRMAN,
+		MAX9867_PWRMAN_SHDN, 0);
+
+	/* switch filter mode */
+	regmap_update_bits(max9867->regmap, MAX9867_CODECFLTR,
+		MAX9867_CODECFLTR_MODE, mode ? MAX9867_CODECFLTR_MODE : 0);
+
+	/* out of shutdown now */
+	regmap_update_bits(max9867->regmap, MAX9867_PWRMAN,
+		MAX9867_PWRMAN_SHDN, MAX9867_PWRMAN_SHDN);
+
+	return 0;
+}
+
+static SOC_ENUM_SINGLE_EXT_DECL(max9867_filter, max9867_filter_text);
 static SOC_ENUM_SINGLE_DECL(max9867_dac_filter, MAX9867_CODECFLTR, 0,
 	max9867_adc_dac_filter_text);
 static SOC_ENUM_SINGLE_DECL(max9867_adc_filter, MAX9867_CODECFLTR, 4,
@@ -76,7 +127,7 @@ static const struct snd_kcontrol_new max9867_snd_controls[] = {
 	SOC_ENUM("Speaker Mode", max9867_spkmode),
 	SOC_SINGLE("Volume Smoothing Switch", MAX9867_MODECONFIG, 6, 1, 0),
 	SOC_SINGLE("Line ZC Switch", MAX9867_MODECONFIG, 5, 1, 0),
-	SOC_ENUM("DSP Filter", max9867_filter),
+	SOC_ENUM_EXT("DSP Filter", max9867_filter, max9867_filter_get, max9867_filter_set),
 	SOC_ENUM("ADC Filter", max9867_adc_filter),
 	SOC_ENUM("DAC Filter", max9867_dac_filter),
 	SOC_SINGLE("Mono Playback Switch", MAX9867_IFC1B, 3, 1, 0),
@@ -197,13 +248,6 @@ static const struct snd_pcm_hw_constraint_list max9867_constraints_48k = {
 	.count = ARRAY_SIZE(max9867_rates_48k),
 };
 
-struct max9867_priv {
-	struct regmap *regmap;
-	const struct snd_pcm_hw_constraint_list *constraints;
-	unsigned int sysclk, pclk;
-	bool master, dsp_a;
-};
-
 static int max9867_startup(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
diff --git a/sound/soc/codecs/max9867.h b/sound/soc/codecs/max9867.h
index 3092c3b99075..b6b880631b13 100644
--- a/sound/soc/codecs/max9867.h
+++ b/sound/soc/codecs/max9867.h
@@ -44,7 +44,8 @@
 #define MAX9867_IFC1B_PCLK_4	0x05
 #define MAX9867_IFC1B_PCLK_8	0x06
 #define MAX9867_IFC1B_PCLK_16	0x07
-#define MAX9867_CODECFLTR    0x0a
+#define MAX9867_CODECFLTR	0x0a
+#define MAX9867_CODECFLTR_MODE	(1<<7)
 #define MAX9867_SIDETONE     0x0b
 #define MAX9867_DACLEVEL     0x0c
 #define MAX9867_ADCLEVEL     0x0d
@@ -58,6 +59,7 @@
 #define MAX9867_MICCONFIG    0x15
 #define MAX9867_MODECONFIG   0x16
 #define MAX9867_PWRMAN       0x17
+#define MAX9867_PWRMAN_SHDN  (1<<7)
 #define MAX9867_REVISION     0xff
 
 #define MAX9867_CACHEREGNUM 10
-- 
2.20.1

