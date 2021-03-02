Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8376232A76E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:11:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 233CD1891;
	Tue,  2 Mar 2021 18:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 233CD1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614705105;
	bh=r+aBIGCUJYmgb5AWKXDdzhaoFfgVJAMInN9d+XQBnQA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NrNueSKjibkZUlaW88xSGokxomKgjjBjfhUpL0xzP9fUWmw8mtROnsUEKlz7gSX+B
	 hFYaTpgqhVhao6L2UGNG7/tlm5uo5e7/9SrsmaRMAFw9YBNyxs9eoZ/0VPBbuK+2MS
	 +d7wm5wUiWj5ZWiR4wb1ZJtsLpTd5yTH5z7+gTm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA51BF80508;
	Tue,  2 Mar 2021 18:05:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E24F8032D; Tue,  2 Mar 2021 18:05:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD97DF80273
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD97DF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Aq+U1tE0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122H1q3L022910; Tue, 2 Mar 2021 11:05:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=EsSeL7tWMlAoQXlVQikVMqxL+s1BhT75o0nHo/WdS8Y=;
 b=Aq+U1tE00AMFRuWOA4IibhtUktCdJPLWxpMWSldnuNZBDtB6hkW+R4IV5T+lH8BxEuA7
 zLhyMc79Ft6khaA30f3Gm0phsTkh0deCtcoIlWtm2pn8srVejQ7HJDmRTLfl+vazn1C+
 Eka2DxD2zrqRXW4XGn6rDDQL9qaIt0uN/wWtG7/l8wyNU9mIT6gAPslSeOh1M6+JXOX6
 opRVMHT0nRiSh+7jXs8S6XaDTTozthMpzcb8dNSoQYLcY3dZ5GSUf5zFmQq8rFQae7rN
 f3/wc0wOZNPpns4TMOXPbHIT8QmkhTkALrCU7D9IQ3fbd5XhFFF7hzXcvO6OSY6xsXlw lQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc6usg7-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Mar 2021 11:05:03 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Mar 2021
 17:05:01 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 2 Mar 2021 17:05:01 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ACCE311D7;
 Tue,  2 Mar 2021 17:05:01 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>
Subject: [PATCH 10/15] ASoC: cs42l42: Report jack and button detection
Date: Tue, 2 Mar 2021 17:04:49 +0000
Message-ID: <20210302170454.39679-11-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020131
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Report the Jack events to the user space through ALSA.
Also moves request_threaded_irq() to component_probe so it don't get
interrupts before the initialization the struct snd_soc_jack.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 142 +++++++++++++++++++++++++------------
 sound/soc/codecs/cs42l42.h |   4 ++
 2 files changed, 99 insertions(+), 47 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 9a7217cf59f36..8345f52ec9d58 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -517,29 +517,6 @@ static const struct snd_soc_dapm_route cs42l42_audio_map[] = {
 	{ "SDOUT2", NULL, "ASP TX EN" },
 };
 
-static int cs42l42_component_probe(struct snd_soc_component *component)
-{
-	struct cs42l42_private *cs42l42 =
-		(struct cs42l42_private *)snd_soc_component_get_drvdata(component);
-
-	cs42l42->component = component;
-
-	return 0;
-}
-
-static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
-	.probe			= cs42l42_component_probe,
-	.dapm_widgets		= cs42l42_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(cs42l42_dapm_widgets),
-	.dapm_routes		= cs42l42_audio_map,
-	.num_dapm_routes	= ARRAY_SIZE(cs42l42_audio_map),
-	.controls		= cs42l42_snd_controls,
-	.num_controls		= ARRAY_SIZE(cs42l42_snd_controls),
-	.idle_bias_on		= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-};
-
 struct cs42l42_pll_params {
 	u32 sclk;
 	u8 mclk_div;
@@ -1196,7 +1173,7 @@ static void cs42l42_cancel_hs_type_detect(struct cs42l42_private *cs42l42)
 				(3 << CS42L42_HSDET_AUTO_TIME_SHIFT));
 }
 
-static void cs42l42_handle_button_press(struct cs42l42_private *cs42l42)
+static int cs42l42_handle_button_press(struct cs42l42_private *cs42l42)
 {
 	int bias_level;
 	unsigned int detect_status;
@@ -1239,17 +1216,24 @@ static void cs42l42_handle_button_press(struct cs42l42_private *cs42l42)
 
 	switch (bias_level) {
 	case 1: /* Function C button press */
+		bias_level = SND_JACK_BTN_2;
 		dev_dbg(cs42l42->component->dev, "Function C button press\n");
 		break;
 	case 2: /* Function B button press */
+		bias_level = SND_JACK_BTN_1;
 		dev_dbg(cs42l42->component->dev, "Function B button press\n");
 		break;
 	case 3: /* Function D button press */
+		bias_level = SND_JACK_BTN_3;
 		dev_dbg(cs42l42->component->dev, "Function D button press\n");
 		break;
 	case 4: /* Function A button press */
+		bias_level = SND_JACK_BTN_0;
 		dev_dbg(cs42l42->component->dev, "Function A button press\n");
 		break;
+	default:
+		bias_level = 0;
+		break;
 	}
 
 	/* Set button detect level sensitivity back to default */
@@ -1279,6 +1263,8 @@ static void cs42l42_handle_button_press(struct cs42l42_private *cs42l42)
 		(0 << CS42L42_M_HSBIAS_HIZ_SHIFT) |
 		(1 << CS42L42_M_SHORT_RLS_SHIFT) |
 		(1 << CS42L42_M_SHORT_DET_SHIFT));
+
+	return bias_level;
 }
 
 struct cs42l42_irq_params {
@@ -1323,6 +1309,8 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	unsigned int current_plug_status;
 	unsigned int current_button_status;
 	unsigned int i;
+	int report = 0;
+
 
 	/* Read sticky registers to clear interurpt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
@@ -1349,9 +1337,20 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	if ((~masks[5]) & irq_params_table[5].mask) {
 		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
 			cs42l42_process_hs_type_detect(cs42l42);
-			dev_dbg(component->dev,
-				"Auto detect done (%d)\n",
-				cs42l42->hs_type);
+			switch(cs42l42->hs_type){
+			case CS42L42_PLUG_CTIA:
+			case CS42L42_PLUG_OMTP:
+				snd_soc_jack_report(&cs42l42->jack, SND_JACK_HEADSET,
+						    SND_JACK_HEADSET);
+				break;
+			case CS42L42_PLUG_HEADPHONE:
+				snd_soc_jack_report(&cs42l42->jack, SND_JACK_HEADPHONE,
+						    SND_JACK_HEADPHONE);
+				break;
+			default:
+				break;
+			}
+			dev_dbg(component->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 		}
 	}
 
@@ -1369,8 +1368,19 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 			if (cs42l42->plug_state != CS42L42_TS_UNPLUG) {
 				cs42l42->plug_state = CS42L42_TS_UNPLUG;
 				cs42l42_cancel_hs_type_detect(cs42l42);
-				dev_dbg(component->dev,
-					"Unplug event\n");
+
+				switch(cs42l42->hs_type){
+				case CS42L42_PLUG_CTIA:
+				case CS42L42_PLUG_OMTP:
+					snd_soc_jack_report(&cs42l42->jack, 0, SND_JACK_HEADSET);
+					break;
+				case CS42L42_PLUG_HEADPHONE:
+					snd_soc_jack_report(&cs42l42->jack, 0, SND_JACK_HEADPHONE);
+					break;
+				default:
+					break;
+				}
+				dev_dbg(component->dev, "Unplug event\n");
 			}
 			break;
 
@@ -1385,14 +1395,15 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 		if (!(current_button_status &
 			CS42L42_M_HSBIAS_HIZ_MASK)) {
 
-			if (current_button_status &
-				CS42L42_M_DETECT_TF_MASK) {
-				dev_dbg(component->dev,
-					"Button released\n");
-			} else if (current_button_status &
-				CS42L42_M_DETECT_FT_MASK) {
-				cs42l42_handle_button_press(cs42l42);
+			if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
+				dev_dbg(component->dev, "Button released\n");
+				report = 0;
+			} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
+				report = cs42l42_handle_button_press(cs42l42);
+
 			}
+			snd_soc_jack_report(&cs42l42->jack, report, SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+								   SND_JACK_BTN_2 | SND_JACK_BTN_3);
 		}
 	}
 
@@ -1731,6 +1742,53 @@ static int cs42l42_handle_device_data(struct i2c_client *i2c_client,
 	return 0;
 }
 
+static int cs42l42_component_probe(struct snd_soc_component *comp)
+{
+	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(comp);
+	struct snd_soc_card *crd = comp->card;
+	int ret = 0;
+
+	cs42l42->component = comp;
+
+	ret = snd_soc_card_jack_new(crd, "CS42L42 Headset", SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3,
+				    &cs42l42->jack, NULL, 0);
+	if (ret < 0) {
+		dev_err(comp->dev, "Cannot create CS42L42 Headset: %d\n", ret);
+		return ret;
+	}
+
+	/* Request IRQ */
+	ret = request_threaded_irq(cs42l42->irq, NULL, cs42l42_irq_thread,
+				   IRQF_ONESHOT | IRQF_TRIGGER_LOW, "cs42l42", cs42l42);
+
+	if (ret)
+		dev_err(comp->dev, "Failed to request IRQ: %d\n", ret);
+
+	return ret;
+}
+
+static void cs42l42_component_remove(struct snd_soc_component *comp)
+{
+	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(comp);
+
+	free_irq(cs42l42->irq, cs42l42);
+}
+
+static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
+	.probe			= cs42l42_component_probe,
+	.remove			= cs42l42_component_remove,
+	.dapm_widgets		= cs42l42_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(cs42l42_dapm_widgets),
+	.dapm_routes		= cs42l42_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(cs42l42_audio_map),
+	.controls		= cs42l42_snd_controls,
+	.num_controls		= ARRAY_SIZE(cs42l42_snd_controls),
+	.idle_bias_on		= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
 static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 				       const struct i2c_device_id *id)
 {
@@ -1745,6 +1803,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 		return -ENOMEM;
 
 	i2c_set_clientdata(i2c_client, cs42l42);
+	cs42l42->irq = i2c_client->irq;
 
 	cs42l42->regmap = devm_regmap_init_i2c(i2c_client, &cs42l42_regmap);
 	if (IS_ERR(cs42l42->regmap)) {
@@ -1787,17 +1846,6 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 	}
 	usleep_range(CS42L42_BOOT_TIME_US, CS42L42_BOOT_TIME_US * 2);
 
-	/* Request IRQ */
-	ret = devm_request_threaded_irq(&i2c_client->dev,
-			i2c_client->irq,
-			NULL, cs42l42_irq_thread,
-			IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-			"cs42l42", cs42l42);
-
-	if (ret != 0)
-		dev_err(&i2c_client->dev,
-			"Failed to request IRQ: %d\n", ret);
-
 	/* initialize codec */
 	ret = regmap_read(cs42l42->regmap, CS42L42_DEVID_AB, &reg);
 	devid = (reg & 0xFF) << 12;
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index c373259ed46f7..267c2b616e57d 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -12,6 +12,8 @@
 #ifndef __CS42L42_H__
 #define __CS42L42_H__
 
+#include <sound/jack.h>
+
 #define CS42L42_PAGE_REGISTER	0x00	/* Page Select Register */
 #define CS42L42_WIN_START	0x00
 #define CS42L42_WIN_LEN		0x100
@@ -768,6 +770,8 @@ struct  cs42l42_private {
 	struct regulator_bulk_data supplies[CS42L42_NUM_SUPPLIES];
 	struct gpio_desc *reset_gpio;
 	struct completion pdn_done;
+	struct snd_soc_jack jack;
+	int irq;
 	u32 sclk;
 	u32 srate;
 	u8 plug_state;
-- 
2.30.1

