Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4732F184
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 18:40:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC801936;
	Fri,  5 Mar 2021 18:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC801936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614966018;
	bh=QE7K/7thUdorWu/d5WOgGG2wa9fwdrtQD6SGSImzCZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OScfBxTjPIT2SizuylEZ7j/k6Hw43gxzhxc+GGcihRDm4txYIhOLVcd1CcNJjD2aH
	 wT7eKyKDAXUG3QS2hBan19xGeCHpYeFL4u7kRKei2gGFeOmbQu2pde6Ku11LRuDzaT
	 Lo69XUynRpC+/XQ1gm0wD6IjPNgKTDJUFMaLpAxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DB0CF804E4;
	Fri,  5 Mar 2021 18:35:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17D20F804AA; Fri,  5 Mar 2021 18:35:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 276A8F802E3
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 18:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 276A8F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gkZWdUaA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125HWLWc005729; Fri, 5 Mar 2021 11:34:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=V92//usCAgPrYcOQlrA51IEqEqfTTrguEF7VyWvOWj8=;
 b=gkZWdUaAi5RqmGM72BxLWkmlTJldzfOgdjhGViZgS/ID6F7UapeYANnR43tlvn3i7gBJ
 sle0dm23FF7gnC1qnz5deo7fbuy9yeJyS30uSwvnngiXRhZqwvDRx+h+1bUotZJVCYvK
 zVxEI/iuoNBb36ZZqS8Z22RgWRm1XZFJTKVCA1igIQITuYq7yNBVo4uc5W1UN18/wCmZ
 RGdg9HZTHXO8F9fp85iGInf+MAY0AKUIjbtogPxYZatx8NHJdg8jVk9AES0KM7GX1tn8
 aNg2w3qOPZjLzErFFLgfNTI5VopUAZZdzHIG+qkdTiPzkLSt6uM0ssn9cznwkyyy2d6I ZA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc70eyn-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 05 Mar 2021 11:34:50 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 5 Mar 2021
 17:34:48 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:34:48 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C94E711D8;
 Fri,  5 Mar 2021 17:34:47 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v2 09/15] ASoC: cs42l42: Set clock source for both ways of
 stream
Date: Fri, 5 Mar 2021 17:34:36 +0000
Message-ID: <20210305173442.195740-10-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
References: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103050090
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

Move the enable/disable of clocks to cs42l42_mute_stream so the record
path also get clocks.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
Changes in v2:
- Add missing cs42l42_private struct pointer

 sound/soc/codecs/cs42l42.c | 86 +++++++++++++++++++++-----------------
 sound/soc/codecs/cs42l42.h |  1 +
 2 files changed, 49 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index cad623e73d0fd..774d81a1de1d8 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -784,52 +784,63 @@ static int cs42l42_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int cs42l42_mute(struct snd_soc_dai *dai, int mute, int direction)
+static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
+	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	unsigned int regval;
 	u8 fullScaleVol;
 
 	if (mute) {
-		/* Mark SCLK as not present to turn on the internal
-		 * oscillator.
-		 */
-		snd_soc_component_update_bits(component, CS42L42_OSC_SWITCH,
-						CS42L42_SCLK_PRESENT_MASK, 0);
-
-		snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
-				CS42L42_PLL_START_MASK,
-				0 << CS42L42_PLL_START_SHIFT);
-
 		/* Mute the headphone */
-		snd_soc_component_update_bits(component, CS42L42_HP_CTL,
-				CS42L42_HP_ANA_AMUTE_MASK |
-				CS42L42_HP_ANA_BMUTE_MASK,
-				CS42L42_HP_ANA_AMUTE_MASK |
-				CS42L42_HP_ANA_BMUTE_MASK);
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+			snd_soc_component_update_bits(component, CS42L42_HP_CTL,
+						      CS42L42_HP_ANA_AMUTE_MASK |
+						      CS42L42_HP_ANA_BMUTE_MASK,
+						      CS42L42_HP_ANA_AMUTE_MASK |
+						      CS42L42_HP_ANA_BMUTE_MASK);
+
+		cs42l42->stream_use &= ~(1 << stream);
+		if(!cs42l42->stream_use) {
+			/*
+			 * Switch to the internal oscillator.
+			 * SCLK must remain running until after this clock switch.
+			 * Without a source of clock the I2C bus doesn't work.
+			 */
+			snd_soc_component_update_bits(component, CS42L42_OSC_SWITCH,
+						      CS42L42_SCLK_PRESENT_MASK, 0);
+			snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
+						      CS42L42_PLL_START_MASK, 0);
+		}
 	} else {
-		snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
-				CS42L42_PLL_START_MASK,
-				1 << CS42L42_PLL_START_SHIFT);
-		/* Read the headphone load */
-		regval = snd_soc_component_read(component, CS42L42_LOAD_DET_RCSTAT);
-		if (((regval & CS42L42_RLA_STAT_MASK) >>
-			CS42L42_RLA_STAT_SHIFT) == CS42L42_RLA_STAT_15_OHM) {
-			fullScaleVol = CS42L42_HP_FULL_SCALE_VOL_MASK;
-		} else {
-			fullScaleVol = 0;
+		if (!cs42l42->stream_use) {
+			/* SCLK must be running before codec unmute */
+			snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
+						      CS42L42_PLL_START_MASK, 1);
+
+			/* Mark SCLK as present, turn off internal oscillator */
+			snd_soc_component_update_bits(component, CS42L42_OSC_SWITCH,
+						      CS42L42_SCLK_PRESENT_MASK,
+						      CS42L42_SCLK_PRESENT_MASK);
 		}
+		cs42l42->stream_use |= 1 << stream;
+
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			/* Read the headphone load */
+			regval = snd_soc_component_read(component, CS42L42_LOAD_DET_RCSTAT);
+			if (((regval & CS42L42_RLA_STAT_MASK) >> CS42L42_RLA_STAT_SHIFT) ==
+			    CS42L42_RLA_STAT_15_OHM) {
+				fullScaleVol = CS42L42_HP_FULL_SCALE_VOL_MASK;
+			} else {
+				fullScaleVol = 0;
+			}
 
-		/* Un-mute the headphone, set the full scale volume flag */
-		snd_soc_component_update_bits(component, CS42L42_HP_CTL,
-				CS42L42_HP_ANA_AMUTE_MASK |
-				CS42L42_HP_ANA_BMUTE_MASK |
-				CS42L42_HP_FULL_SCALE_VOL_MASK, fullScaleVol);
-
-		/* Mark SCLK as present, turn off internal oscillator */
-		snd_soc_component_update_bits(component, CS42L42_OSC_SWITCH,
-				CS42L42_SCLK_PRESENT_MASK,
-				CS42L42_SCLK_PRESENT_MASK);
+			/* Un-mute the headphone, set the full scale volume flag */
+			snd_soc_component_update_bits(component, CS42L42_HP_CTL,
+						      CS42L42_HP_ANA_AMUTE_MASK |
+						      CS42L42_HP_ANA_BMUTE_MASK |
+						      CS42L42_HP_FULL_SCALE_VOL_MASK, fullScaleVol);
+		}
 	}
 
 	return 0;
@@ -844,8 +855,7 @@ static const struct snd_soc_dai_ops cs42l42_ops = {
 	.hw_params	= cs42l42_pcm_hw_params,
 	.set_fmt	= cs42l42_set_dai_fmt,
 	.set_sysclk	= cs42l42_set_sysclk,
-	.mute_stream	= cs42l42_mute,
-	.no_capture_mute = 1,
+	.mute_stream	= cs42l42_mute_stream,
 };
 
 static struct snd_soc_dai_driver cs42l42_dai = {
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 4b448c102f538..3dcbfebc53b0f 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -768,6 +768,7 @@ struct  cs42l42_private {
 	u8 bias_thresholds[CS42L42_NUM_BIASES];
 	u8 hs_bias_ramp_rate;
 	u8 hs_bias_ramp_time;
+	u8 stream_use;
 };
 
 #endif /* __CS42L42_H__ */
-- 
2.30.1

