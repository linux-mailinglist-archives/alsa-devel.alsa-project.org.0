Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099813E7CA6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 17:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D8F176E;
	Tue, 10 Aug 2021 17:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D8F176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628610248;
	bh=2uctnK5f+kFNTGZiks6tsWOAbxnxhnNaMaMA2F+VbbU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QhpYWlhXR2EXp5dP3hqg01qeBC/hs+XJQ7kAb26BJDL1ajO8E9zzbH75RaNyCW1Gj
	 c+knAqPFoPZOAFxLBJIlKV/GVagZxTaGUXC/0Cw3yR4FNNWvh3bYyLWgTHuX8/NMdX
	 m/oPM13suK/cr/zEvzN1YWB50MeL8qNrtLPHNw40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84A72F80538;
	Tue, 10 Aug 2021 17:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3031F80520; Tue, 10 Aug 2021 17:38:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C5BCF800C8
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C5BCF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jYcLpBRq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17AAlVvA027584; 
 Tue, 10 Aug 2021 10:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=DPhyqgUnsrA72hgwecq75U2I1wXQsCV52Caviz1x0yg=;
 b=jYcLpBRqZKejCGDoZv1kSbfh+xxtx9kUnfvHqRQkOFrVyDnu6/lqQJPTUvb3OMZ2UaG8
 OIEI/lCsHOBuac+00blJsTE+Cfr9MgfluUhqocln/GMAn7fXODTpsQEEU6oZ0Xre4+Ov
 UhGCuuAIInQhXBPzvlaH7/lcX6+VhLZ6EsdVmBC2UQwVd6iHzKRRArJnd6pLI3R6UzQo
 iJhMtsgWnwdP44Ujz9DzpOAx0Tid8u1zMxxnLoQMNuohc/geT+TI3bvHOIr2IAzodgTF
 xS3uu9359klGp7lpJAzILsJcGPqIfvI83pl/j2j9lLRG+4ptYHsNqUN7bj0h2wukeSxX hw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3abr0u0e2c-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Aug 2021 10:38:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 10 Aug
 2021 16:38:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 10 Aug 2021 16:38:04 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.221])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A027E478;
 Tue, 10 Aug 2021 15:38:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 08/12] ASoC: cs42l42: Prevent NULL pointer deref in interrupt
 handler
Date: Tue, 10 Aug 2021 16:37:55 +0100
Message-ID: <20210810153759.24333-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810153759.24333-1-rf@opensource.cirrus.com>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: DxAYCz2QYA4ZbJq4j_uGxAGfBETGp0OF
X-Proofpoint-GUID: DxAYCz2QYA4ZbJq4j_uGxAGfBETGp0OF
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100099
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
 sound/soc/codecs/cs42l42.c | 26 ++++++++------------------
 sound/soc/codecs/cs42l42.h |  2 +-
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 0b63dba07b6d..b7a1231add2d 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -554,17 +554,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
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
@@ -1416,19 +1406,19 @@ static int cs42l42_handle_button_press(struct cs42l42_private *cs42l42)
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
@@ -1502,7 +1492,6 @@ static const struct cs42l42_irq_params irq_params_table[] = {
 static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 {
 	struct cs42l42_private *cs42l42 = (struct cs42l42_private *)data;
-	struct snd_soc_component *component = cs42l42->component;
 	unsigned int stickies[12];
 	unsigned int masks[12];
 	unsigned int current_plug_status;
@@ -1549,7 +1538,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 			default:
 				break;
 			}
-			dev_dbg(component->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
+			dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 		}
 	}
 
@@ -1583,7 +1572,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 
-				dev_dbg(component->dev, "Unplug event\n");
+				dev_dbg(cs42l42->dev, "Unplug event\n");
 			}
 			break;
 
@@ -1599,7 +1588,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 			CS42L42_M_HSBIAS_HIZ_MASK)) {
 
 			if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
-				dev_dbg(component->dev, "Button released\n");
+				dev_dbg(cs42l42->dev, "Button released\n");
 				report = 0;
 			} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
 				report = cs42l42_handle_button_press(cs42l42);
@@ -1953,6 +1942,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 	if (!cs42l42)
 		return -ENOMEM;
 
+	cs42l42->dev = &i2c_client->dev;
 	i2c_set_clientdata(i2c_client, cs42l42);
 
 	cs42l42->regmap = devm_regmap_init_i2c(i2c_client, &cs42l42_regmap);
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index d13749e9d8c5..a1e6d443b489 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -774,7 +774,7 @@ static const char *const cs42l42_supply_names[CS42L42_NUM_SUPPLIES] = {
 
 struct  cs42l42_private {
 	struct regmap *regmap;
-	struct snd_soc_component *component;
+	struct device *dev;
 	struct regulator_bulk_data supplies[CS42L42_NUM_SUPPLIES];
 	struct gpio_desc *reset_gpio;
 	struct completion pdn_done;
-- 
2.11.0

