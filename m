Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A905632A76B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:11:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 511B91873;
	Tue,  2 Mar 2021 18:10:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 511B91873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614705060;
	bh=mMeSKZm0EtayDwTKsAZrc9Kk75r4H6fG9Q81Fg2u0hM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t+vGSQPmNQhCtyRDQZ21L28+GB2kr/TMajQu8M9N8+YpXWnC+Z207jYDvgZ7now0o
	 NnY/OBabXm+LNvpaL+6UFCfFnfOUHTRd2bOsb6TCxtHvxN+xVVbnPX0VlFyhvyLn/4
	 jUYEIiIlDnPS+WIFbMxFbFLZwsjNDRbBBqkzErBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F40F804FD;
	Tue,  2 Mar 2021 18:05:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22231F804BD; Tue,  2 Mar 2021 18:05:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7384CF8032B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7384CF8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WcJqpTRG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122H1q3Q022910; Tue, 2 Mar 2021 11:05:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=vCHWy3Exa6te6tewneVXoR9NeyrAMjtx7WMnGrouN1E=;
 b=WcJqpTRGPpz+7aAGYrLOBxcAImcAmbP3I4xPxXyhYKxWeeyR1fUKm+Bf4miCKNEYM+FV
 sST7W5dnXvgXvy1ZpWe3ad5UFJaZ9dXqG6cR+OgntmF/l8aRS0/IgT+JGtblnhoW0sl9
 c4C3/0ewPMaCJoGYn6lgYL+nmTIoTTmimiihc+b2fNjZPiySCe7hNeEdaajg633BISAH
 NDqz3rMj3QLSayfe5Csbh/jMt35DQK9RC01aGND9/gFCIHFNN9DPnSTg61SozqWzLHqm
 Lh8/+KVwtk+48C0CONq6g0N8rO8qjoTRzMWEkM49Hb0LOxmKtkPVpgmxZUPNjRbatRnu EQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc6usg9-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Mar 2021 11:05:05 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Mar 2021
 17:05:02 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 2 Mar 2021 17:05:02 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3EBA811D8;
 Tue,  2 Mar 2021 17:05:02 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>
Subject: [PATCH 12/15] ASoC: cs42l42: Wait at least 150us after writing
 SCLK_PRESENT
Date: Tue, 2 Mar 2021 17:04:51 +0000
Message-ID: <20210302170454.39679-13-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=936 bulkscore=0 impostorscore=0
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

From: Richard Fitzgerald <rf@opensource.cirrus.com>

There must be a delay of at least 150us after writing SCLK_PRESENT
before issuing another I2C write.

This is done using struct reg_sequence because it can specify a delay
after the write and the whole sequence is written atomically.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 28 +++++++++++++++++++++++-----
 sound/soc/codecs/cs42l42.h |  1 +
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 7898a2d52a3b7..5755f8baddbcf 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -517,6 +517,24 @@ static const struct snd_soc_dapm_route cs42l42_audio_map[] = {
 	{ "SDOUT2", NULL, "ASP TX EN" },
 };
 
+/* Switch to SCLK. Atomic delay after the write to allow the switch to complete. */
+static const struct reg_sequence cs42l42_to_sclk_seq[] = {
+	{
+		.reg = CS42L42_OSC_SWITCH,
+		.def = CS42L42_SCLK_PRESENT_MASK,
+		.delay_us = CS42L42_CLOCK_SWITCH_DELAY_US,
+	},
+};
+
+/* Switch to OSC. Atomic delay after the write to allow the switch to complete. */
+static const struct reg_sequence cs42l42_to_osc_seq[] = {
+	{
+		.reg = CS42L42_OSC_SWITCH,
+		.def = 0,
+		.delay_us = CS42L42_CLOCK_SWITCH_DELAY_US,
+	},
+};
+
 struct cs42l42_pll_params {
 	u32 sclk;
 	u8 mclk_div;
@@ -809,6 +827,7 @@ static int cs42l42_set_sysclk(struct snd_soc_dai *dai,
 static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
+	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	unsigned int regval;
 	u8 fullScaleVol;
 
@@ -828,8 +847,8 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 			 * SCLK must remain running until after this clock switch.
 			 * Without a source of clock the I2C bus doesn't work.
 			 */
-			snd_soc_component_update_bits(component, CS42L42_OSC_SWITCH,
-						      CS42L42_SCLK_PRESENT_MASK, 0);
+			regmap_multi_reg_write(cs42l42->regmap, cs42l42_to_osc_seq,
+					       ARRAY_SIZE(cs42l42_to_osc_seq));
 			snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
 						      CS42L42_PLL_START_MASK, 0);
 		}
@@ -840,9 +859,8 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 						      CS42L42_PLL_START_MASK, 1);
 
 			/* Mark SCLK as present, turn off internal oscillator */
-			snd_soc_component_update_bits(component, CS42L42_OSC_SWITCH,
-						      CS42L42_SCLK_PRESENT_MASK,
-						      CS42L42_SCLK_PRESENT_MASK);
+			regmap_multi_reg_write(cs42l42->regmap, cs42l42_to_sclk_seq,
+					       ARRAY_SIZE(cs42l42_to_sclk_seq));
 		}
 		cs42l42->stream_use |= 1 << stream;
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 1df9577e367c1..a0c87f2326e69 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -755,6 +755,7 @@
 
 #define CS42L42_NUM_SUPPLIES	5
 #define CS42L42_BOOT_TIME_US	3000
+#define CS42L42_CLOCK_SWITCH_DELAY_US 150
 
 static const char *const cs42l42_supply_names[CS42L42_NUM_SUPPLIES] = {
 	"VA",
-- 
2.30.1

