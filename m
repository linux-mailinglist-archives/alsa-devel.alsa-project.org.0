Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A55E42F409
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED3817C7;
	Fri, 15 Oct 2021 15:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED3817C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305350;
	bh=Mcksoa6bNBIIivirRee9YAur4w6qGKMn1ufrbRGCC1U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SjZAlZByGxFA1KQxYM11sVeMcA4tFM8ZDrU3h0sCI1sVj8tHmKYbc70fL69jydYn2
	 FfruB7X4wXGNnC8tUxYMhXqqy1sfENEYmDwB460BX9tNDgL2/QLPnUyhUO+xGN1znj
	 a87paRLZZFbqrF2TMEN9+wg13XDbJ9JgIiWDr024=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D7DAF80558;
	Fri, 15 Oct 2021 15:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12EABF804ED; Fri, 15 Oct 2021 15:37:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1D65F804ED
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D65F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oRkoMvqz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FCfErO009690; 
 Fri, 15 Oct 2021 08:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JiZTEjn3rT94DKEzJlHkz1LwFpkNyEzxsu6DgasEdyI=;
 b=oRkoMvqz4OEAco+zgAvFy6SoVU0ETVYfY4qhKNOapmUTryggEqmsqvcsL/MV/E0QUpMY
 er+gQL/Zmccl8rAwSozQuJcanU8sby/wCCuspfXnpXXlkOfSBdsV7c2WKe9ANuXkLj3N
 ORSq9T2gbCs4CbQl1n7Au5ibpwn7qrJhanJtRLaUH5NrmrqeaZ6v9sNC6jRn4OyY1sSk
 FCT9aNrJoyl+07Eb5+GD1GjPNN+GOqS9WwZnP1gHM7haxZt9uvr4d3lzrc/GP7SbVCrl
 1iqCqQwad5+HI6bDTuOLVn+CGRpvB4hid/ruQRca3f7MJripNTu+IAxCT2kc7XDJOygv lw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5w-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:26 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:24 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 41892B2F;
 Fri, 15 Oct 2021 13:36:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 09/16] ASoC: cs42l42: Prevent NULL pointer deref in interrupt
 handler
Date: Fri, 15 Oct 2021 14:36:12 +0100
Message-ID: <20211015133619.4698-10-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gSRN3QdAD9LnPsJJ8JpKjsK9mUAZua9D
X-Proofpoint-GUID: gSRN3QdAD9LnPsJJ8JpKjsK9mUAZua9D
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

The interrupt handling code was getting the struct device* from a
struct snd_soc_component* stored in struct cs42l42_private. If the
interrupt was asserted before ASoC calls component_probe() the
snd_soc_component* will be NULL.

The stored snd_soc_component* is not actually used for anything other
than indirectly getting the struct device*. Remove it, and store the
struct device* in struct cs42l42_private.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 28 +++++++++-------------------
 sound/soc/codecs/cs42l42.h |  2 +-
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index cf1f68474d21..174f738e9e5a 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -506,17 +506,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	return 0;
 }
 
-static int cs42l42_component_probe(struct snd_soc_component *component)
-{
-	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
-
-	cs42l42->component = component;
-
-	return 0;
-}
-
 static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
-	.probe			= cs42l42_component_probe,
 	.set_jack		= cs42l42_set_jack,
 	.dapm_widgets		= cs42l42_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(cs42l42_dapm_widgets),
@@ -1168,7 +1158,7 @@ static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
 	 */
 	if (cs42l42->hs_type == CS42L42_PLUG_INVALID ||
 		cs42l42->hs_type == CS42L42_PLUG_HEADPHONE) {
-		dev_dbg(cs42l42->component->dev, "Running Manual Detection Fallback\n");
+		dev_dbg(cs42l42->dev, "Running Manual Detection Fallback\n");
 		cs42l42_manual_hs_type_detect(cs42l42);
 	}
 
@@ -1467,19 +1457,19 @@ static int cs42l42_handle_button_press(struct cs42l42_private *cs42l42)
 	switch (bias_level) {
 	case 1: /* Function C button press */
 		bias_level = SND_JACK_BTN_2;
-		dev_dbg(cs42l42->component->dev, "Function C button press\n");
+		dev_dbg(cs42l42->dev, "Function C button press\n");
 		break;
 	case 2: /* Function B button press */
 		bias_level = SND_JACK_BTN_1;
-		dev_dbg(cs42l42->component->dev, "Function B button press\n");
+		dev_dbg(cs42l42->dev, "Function B button press\n");
 		break;
 	case 3: /* Function D button press */
 		bias_level = SND_JACK_BTN_3;
-		dev_dbg(cs42l42->component->dev, "Function D button press\n");
+		dev_dbg(cs42l42->dev, "Function D button press\n");
 		break;
 	case 4: /* Function A button press */
 		bias_level = SND_JACK_BTN_0;
-		dev_dbg(cs42l42->component->dev, "Function A button press\n");
+		dev_dbg(cs42l42->dev, "Function A button press\n");
 		break;
 	default:
 		bias_level = 0;
@@ -1553,7 +1543,6 @@ static const struct cs42l42_irq_params irq_params_table[] = {
 static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 {
 	struct cs42l42_private *cs42l42 = (struct cs42l42_private *)data;
-	struct snd_soc_component *component = cs42l42->component;
 	unsigned int stickies[12];
 	unsigned int masks[12];
 	unsigned int current_plug_status;
@@ -1600,7 +1589,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 			default:
 				break;
 			}
-			dev_dbg(component->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
+			dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 		}
 	}
 
@@ -1634,7 +1623,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 
-				dev_dbg(component->dev, "Unplug event\n");
+				dev_dbg(cs42l42->dev, "Unplug event\n");
 			}
 			break;
 
@@ -1650,7 +1639,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 			CS42L42_M_HSBIAS_HIZ_MASK)) {
 
 			if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
-				dev_dbg(component->dev, "Button released\n");
+				dev_dbg(cs42l42->dev, "Button released\n");
 				report = 0;
 			} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
 				report = cs42l42_handle_button_press(cs42l42);
@@ -2004,6 +1993,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 	if (!cs42l42)
 		return -ENOMEM;
 
+	cs42l42->dev = &i2c_client->dev;
 	i2c_set_clientdata(i2c_client, cs42l42);
 
 	cs42l42->regmap = devm_regmap_init_i2c(i2c_client, &cs42l42_regmap);
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 2343213d0cdb..d30643398084 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -831,7 +831,7 @@ static const char *const cs42l42_supply_names[CS42L42_NUM_SUPPLIES] = {
 
 struct  cs42l42_private {
 	struct regmap *regmap;
-	struct snd_soc_component *component;
+	struct device *dev;
 	struct regulator_bulk_data supplies[CS42L42_NUM_SUPPLIES];
 	struct gpio_desc *reset_gpio;
 	struct completion pdn_done;
-- 
2.11.0

