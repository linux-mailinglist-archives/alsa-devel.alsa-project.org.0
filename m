Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B036B62E
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 17:54:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F769168C;
	Mon, 26 Apr 2021 17:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F769168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619452492;
	bh=umzspy1Cjp9fafUg/93GCtJw4Fhglq8ikIMIybx5bKU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hND3rZPwkoaOuk1B3/6THiAiLcaL4dWQ4mtoQZCIrF6S0i9zKp0a1TB8jhU7ofTn8
	 RvoNCj8BBL0DbQbfXyalA64wYZxK9ndGyMyaFStbjbkpTZ0WK8qxftQMPdJ4EA+Zpo
	 W9LE6pbT41py8+gbDltodsYdfrH4TuiBto9xRPN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BC60F80218;
	Mon, 26 Apr 2021 17:53:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A1DF80218; Mon, 26 Apr 2021 17:53:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC679F800F0
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 17:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC679F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TwoRJWUB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFlrcL016436; Mon, 26 Apr 2021 10:53:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=ptx7OhFuamyxUh+NJp772J0MW1D0OUk+XT656xfuuN4=;
 b=TwoRJWUBHaP9Oo8AqbjAyOyd1Ezaf9r/wVmwyqDVfHmNipkjGGNrZgB/kcsihp0NWr3j
 OW3uQrMt74jPAz4aISlTZOsxKrJMiGlWBMReMZNchA17puU1K7r+zbTFzNYOTLQG5RGG
 jkNnXhc0jpg+H+gFKAX3TBdzn14zpIYNQ+ZBSDHXaNYiNt9qA2mc8wrR3g8yOIs7w1oK
 q7isdSEqQwnbZTEfAK1u2f/vj6W70x49eZ6RmESkmlaLtwEgMt/sGwuiMP0HhrtEPeWz
 xyF7xkwjQ8nF0fDkGIxxo7JdIU7q4e/lZuNUER3c3BrL3vaMO2Q2UigCZjavVurRPolK jg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 385u9a8gs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Apr 2021 10:53:10 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 16:53:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Apr 2021 16:53:08 +0100
Received: from mail1.cirrus.com (unknown [198.61.65.115])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 53E9311D1;
 Mon, 26 Apr 2021 15:53:07 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH 1/3] ASoC: cs42l42: Add support for set_jack calls
Date: Mon, 26 Apr 2021 16:53:01 +0100
Message-ID: <20210426155303.853236-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TJFl4cYi8zKnmMynoxDVGUzUEho0lE1r
X-Proofpoint-GUID: TJFl4cYi8zKnmMynoxDVGUzUEho0lE1r
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104260121
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

Replace the internal jack creation by set_jack call, so users can map
buttons in their machine driver
Also only enable jack detection IRQ after set_jack call

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 43 ++++++++++++++++++++++----------------
 sound/soc/codecs/cs42l42.h |  2 +-
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index bf982e145e94..2143957b95e6 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -518,26 +518,33 @@ static const struct snd_soc_dapm_route cs42l42_audio_map[] = {
 	{ "SDOUT2", NULL, "ASP TX EN" },
 };

+static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_jack *jk, void *d)
+{
+	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+
+	cs42l42->jack = jk;
+
+	regmap_update_bits(cs42l42->regmap, CS42L42_TSRS_PLUG_INT_MASK,
+			   CS42L42_RS_PLUG_MASK | CS42L42_RS_UNPLUG_MASK |
+			   CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK,
+			   (1 << CS42L42_RS_PLUG_SHIFT) | (1 << CS42L42_RS_UNPLUG_SHIFT) |
+			   (0 << CS42L42_TS_PLUG_SHIFT) | (0 << CS42L42_TS_UNPLUG_SHIFT));
+
+	return 0;
+}
+
 static int cs42l42_component_probe(struct snd_soc_component *component)
 {
-	struct cs42l42_private *cs42l42 =
-		(struct cs42l42_private *)snd_soc_component_get_drvdata(component);
-	struct snd_soc_card *crd = component->card;
-	int ret = 0;
+	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);

 	cs42l42->component = component;

-	ret = snd_soc_card_jack_new(crd, "CS42L42 Headset", SND_JACK_HEADSET | SND_JACK_BTN_0 |
-				    SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &cs42l42->jack, NULL, 0);
-	if (ret < 0)
-		dev_err(component->dev, "Cannot create CS42L42 Headset: %d\n", ret);
-
-	return ret;
+	return 0;
 }

 static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
 	.probe			= cs42l42_component_probe,
+	.set_jack		= cs42l42_set_jack,
 	.dapm_widgets		= cs42l42_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(cs42l42_dapm_widgets),
 	.dapm_routes		= cs42l42_audio_map,
@@ -1410,11 +1417,11 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 			switch(cs42l42->hs_type){
 			case CS42L42_PLUG_CTIA:
 			case CS42L42_PLUG_OMTP:
-				snd_soc_jack_report(&cs42l42->jack, SND_JACK_HEADSET,
+				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
 						    SND_JACK_HEADSET);
 				break;
 			case CS42L42_PLUG_HEADPHONE:
-				snd_soc_jack_report(&cs42l42->jack, SND_JACK_HEADPHONE,
+				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
 						    SND_JACK_HEADPHONE);
 				break;
 			default:
@@ -1442,10 +1449,10 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 				switch(cs42l42->hs_type){
 				case CS42L42_PLUG_CTIA:
 				case CS42L42_PLUG_OMTP:
-					snd_soc_jack_report(&cs42l42->jack, 0, SND_JACK_HEADSET);
+					snd_soc_jack_report(cs42l42->jack, 0, SND_JACK_HEADSET);
 					break;
 				case CS42L42_PLUG_HEADPHONE:
-					snd_soc_jack_report(&cs42l42->jack, 0, SND_JACK_HEADPHONE);
+					snd_soc_jack_report(cs42l42->jack, 0, SND_JACK_HEADPHONE);
 					break;
 				default:
 					break;
@@ -1472,7 +1479,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 				report = cs42l42_handle_button_press(cs42l42);

 			}
-			snd_soc_jack_report(&cs42l42->jack, report, SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			snd_soc_jack_report(cs42l42->jack, report, SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 								   SND_JACK_BTN_2 | SND_JACK_BTN_3);
 		}
 	}
@@ -1579,8 +1586,8 @@ static void cs42l42_set_interrupt_masks(struct cs42l42_private *cs42l42)
 			CS42L42_TS_UNPLUG_MASK,
 			(1 << CS42L42_RS_PLUG_SHIFT) |
 			(1 << CS42L42_RS_UNPLUG_SHIFT) |
-			(0 << CS42L42_TS_PLUG_SHIFT) |
-			(0 << CS42L42_TS_UNPLUG_SHIFT));
+			(1 << CS42L42_TS_PLUG_SHIFT) |
+			(1 << CS42L42_TS_UNPLUG_SHIFT));
 }

 static void cs42l42_setup_hs_type_detect(struct cs42l42_private *cs42l42)
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 36b763f0d1a0..2e0d3836bd7e 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -773,7 +773,7 @@ struct  cs42l42_private {
 	struct regulator_bulk_data supplies[CS42L42_NUM_SUPPLIES];
 	struct gpio_desc *reset_gpio;
 	struct completion pdn_done;
-	struct snd_soc_jack jack;
+	struct snd_soc_jack *jack;
 	int bclk;
 	u32 sclk;
 	u32 srate;
--
2.31.1

