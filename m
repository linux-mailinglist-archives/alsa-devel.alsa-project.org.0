Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773B32FCB4
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Mar 2021 20:19:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B76101F85;
	Sat,  6 Mar 2021 20:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B76101F85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615058372;
	bh=jHgn2PGYQ+mJYWAUYjRLN72CI0afqxmrCjJW82T4fZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Onj9riEKrBL5PB/hO3qW1gV5yrn2itkqR3W8pMYGqYrdhe+x5pkv33PiBW+YqgvVy
	 BR45X0cniQynGYISe/JmS20UEjyaVuBvYLvfSELe8Ae0kx1vcpDK9jpjYWq9Jg4fsh
	 JXBtU74Fv9QcmN25LywO+QtwTXwMM1K5jHhwfGC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1CC7F804FD;
	Sat,  6 Mar 2021 20:14:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EA9DF804E2; Sat,  6 Mar 2021 20:14:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08179F802E3
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 20:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08179F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LlNdB25v"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 126JCNcg017698; Sat, 6 Mar 2021 13:13:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=D0L/2V284lBlYPp+kHSQexXxL3YGhWhj1b/e97X3Pf4=;
 b=LlNdB25vtWVZ4mWh3McSg4c/jVU30xpOTrNUWOELVNM+tY4taTVflQcCBlWnu1KQtPlt
 kMA4EZmmMSrDf382Amyat+iptJl/6lgby0U/HRmnHY/EO0lIZk2R/QFyBFL9HdFppSrY
 v3a9lzF8s4+ddV3ViiReOWHZcmcAMPjdJ7GblHBpnZGSDs5rkOhd5KOS9YNEM7ApTbLX
 rAK7lLUNqQlnoZcAbRLeVg2OhU73OjAU1+q4EUPkIg7WVSFb40t+qb9x3W3OyVjkibCI
 T7Wqvn8E4PSU7RDkJa1AuvZlYnTKO9cAO0Q1zQfGVUhb5AzRzmsn7uLL5rRyCqEoZpDi Ag== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3748198d08-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 06 Mar 2021 13:13:35 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 6 Mar 2021
 18:56:29 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Sat, 6 Mar 2021 18:56:29 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 56BFC11CF;
 Sat,  6 Mar 2021 18:56:29 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v3 13/15] ASoC: cs42l42: Wait at least 150us after writing
 SCLK_PRESENT
Date: Sat, 6 Mar 2021 18:55:51 +0000
Message-ID: <20210306185553.62053-14-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
References: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=863 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103060119
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>
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
Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
Changes in v3:
- No changes

Changes in v2:
- struct cs42l42_private add by this patch was wrong and moved to the
correct patch
- Lucas signed-off added

 sound/soc/codecs/cs42l42.c | 27 ++++++++++++++++++++++-----
 sound/soc/codecs/cs42l42.h |  1 +
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 68b7ed71ad542..08718fd10fb9b 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -549,6 +549,24 @@ static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
 	.non_legacy_dai_naming	= 1,
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
@@ -861,8 +879,8 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
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
@@ -873,9 +891,8 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
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
index 429c6833fc811..214cee762709d 100644
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

