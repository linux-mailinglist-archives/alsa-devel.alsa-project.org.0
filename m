Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EEB5BCA79
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 13:14:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D20B163A;
	Mon, 19 Sep 2022 13:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D20B163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663586077;
	bh=Lfx6i53+RiO5+QzyUxtTXrjQmGmvvKs2PPjMKY51PfE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cwPF2nEzBXz41mE9ssTl3Hsb1M3vu9SqqN+Sts2gtieigwipzkA4WCOrGuz/lkmhu
	 qj3GxZfopiaKwDb3be7WtvLGkF57cJ8qMIYYftH0do4LhFx8SctJdPWPYfNTfRzDLj
	 uyrbQ2VFs6YPw4INB4A/aJZvYtHr3vwhqZgVNwYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 343B9F80539;
	Mon, 19 Sep 2022 13:13:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87B77F8016D; Mon, 19 Sep 2022 13:13:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 277EFF80134
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 13:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 277EFF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="AVQpQsvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663585985;
 x=1695121985; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fWT8qRbiWNa5/mbcYWo86wQNVuPvppjS+ANHTTdMVNE=;
 b=AVQpQsvAeJoZYodBLlOYh1IHNxNIRwA5+dEs5MgYZhju8Yo5mEEAZJKZ
 qNowZUQIp838HwRbuaFEKXMA1M5R731z2A/doLz2Y2+QGQOBU6hX9FUlM
 Furg5Sx2QpcfOSOkMFJ4FlFVnPSsqdmd7GOY1+4KQa6FJTql8+ix6QrnE
 oC9ZJC1yu9OrQrJORxzA26yr2UyQcZAcmLF4W59PrJCOak21OLM9f+j1x
 D7kcBGYsSve/qoxNbvGkxpYFTb+ot1Os6p0gYsAcq3JnymMO/fbmAdyJh
 z6DB6Q3TJM5jlDiuJmk12cPgvhtkCyWQ5eDIR61j9giC1KNHhaUUTMZUl A==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 3/3] ASoC: ts3a227e: add parameters to control debounce
 times
Date: Mon, 19 Sep 2022 13:12:58 +0200
Message-ID: <20220919111258.3774-4-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220919111258.3774-1-astrid.rost@axis.com>
References: <20220919111258.3774-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Astrid Rost <astrid.rost@axis.com>,
 kernel@axis.com, linux-kernel@vger.kernel.org, Astrid Rost <astridr@axis.com>
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

Add devicetree parameters to control the insert, release and press
debounce times.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 sound/soc/codecs/ts3a227e.c | 58 +++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
index d8ab0810fceb..f2d1367c46ca 100644
--- a/sound/soc/codecs/ts3a227e.c
+++ b/sound/soc/codecs/ts3a227e.c
@@ -78,12 +78,20 @@ static const int ts3a227e_buttons[] = {
 #define ADC_COMPLETE_INT_DISABLE 0x04
 #define INTB_DISABLE 0x08
 
+/* TS3A227E_REG_SETTING_1 0x4 */
+#define DEBOUNCE_INSERTION_SETTING_SFT (0)
+#define DEBOUNCE_INSERTION_SETTING_MASK (0x7 << DEBOUNCE_PRESS_SETTING_SFT)
+
 /* TS3A227E_REG_SETTING_2 0x05 */
 #define KP_ENABLE 0x04
 
 /* TS3A227E_REG_SETTING_3 0x06 */
-#define MICBIAS_SETTING_SFT (3)
+#define MICBIAS_SETTING_SFT 3
 #define MICBIAS_SETTING_MASK (0x7 << MICBIAS_SETTING_SFT)
+#define DEBOUNCE_RELEASE_SETTING_SFT 2
+#define DEBOUNCE_RELEASE_SETTING_MASK (0x1 << DEBOUNCE_RELEASE_SETTING_SFT)
+#define DEBOUNCE_PRESS_SETTING_SFT 0
+#define DEBOUNCE_PRESS_SETTING_MASK (0x3 << DEBOUNCE_PRESS_SETTING_SFT)
 
 /* TS3A227E_REG_ACCESSORY_STATUS  0x0b */
 #define TYPE_3_POLE 0x01
@@ -136,7 +144,7 @@ static bool ts3a227e_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case TS3A227E_REG_INTERRUPT ... TS3A227E_REG_INTERRUPT_DISABLE:
-	case TS3A227E_REG_SETTING_2:
+	case TS3A227E_REG_SETTING_1 ... TS3A227E_REG_SETTING_2:
 	case TS3A227E_REG_SWITCH_STATUS_1 ... TS3A227E_REG_ADC_OUTPUT:
 		return true;
 	default:
@@ -269,14 +277,52 @@ static const struct regmap_config ts3a227e_regmap_config = {
 static int ts3a227e_parse_device_property(struct ts3a227e *ts3a227e,
 				struct device *dev)
 {
-	u32 micbias;
+	u32 value;
+	u32 value_ms;
+	u32 setting3_value = 0;
+	u32 setting3_mask = 0;
 	int err;
 
-	err = device_property_read_u32(dev, "ti,micbias", &micbias);
+	err = device_property_read_u32(dev, "ti,micbias", &value);
+	if (!err) {
+		setting3_mask = MICBIAS_SETTING_MASK;
+		setting3_value =
+			(value << MICBIAS_SETTING_SFT) & MICBIAS_SETTING_MASK;
+	}
+
+	err = device_property_read_u32(dev, "ti,debounce-release-ms", &value_ms);
 	if (!err) {
+		value = (value_ms > 10);
+		setting3_mask |= DEBOUNCE_RELEASE_SETTING_MASK;
+		setting3_value |= (value << DEBOUNCE_RELEASE_SETTING_SFT) &
+				  DEBOUNCE_RELEASE_SETTING_MASK;
+	}
+
+	err = device_property_read_u32(dev, "ti,debounce-press-ms", &value_ms);
+	if (!err) {
+		value = (value_ms + 20) / 40;
+		if (value > 3)
+			value = 3;
+		setting3_mask |= DEBOUNCE_PRESS_SETTING_MASK;
+		setting3_value |= (value << DEBOUNCE_PRESS_SETTING_SFT) &
+				  DEBOUNCE_PRESS_SETTING_MASK;
+	}
+
+	if (setting3_mask)
 		regmap_update_bits(ts3a227e->regmap, TS3A227E_REG_SETTING_3,
-			MICBIAS_SETTING_MASK,
-			(micbias & 0x07) << MICBIAS_SETTING_SFT);
+				   setting3_mask, setting3_value);
+
+	err = device_property_read_u32(dev, "ti,debounce-insertion-ms", &value_ms);
+	if (!err) {
+		if (value_ms < 165)
+			value = (value_ms + 15) / 30;
+		else if (value_ms < 1500)
+			value = 6;
+		else
+			value = 7;
+		regmap_update_bits(ts3a227e->regmap, TS3A227E_REG_SETTING_1,
+			DEBOUNCE_INSERTION_SETTING_MASK, (value << DEBOUNCE_INSERTION_SETTING_SFT)
+			& DEBOUNCE_INSERTION_SETTING_MASK);
 	}
 
 	return 0;
-- 
2.20.1

