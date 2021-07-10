Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D63C2D97
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3331516A5;
	Sat, 10 Jul 2021 04:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3331516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625883813;
	bh=yPiIAd5hNHupevODfkmJGWP8zPqAdOq77K8BYOIwQmo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQ5urB5vxZZ4LkTtz4rd7hVoelViVBysRKguSWiOxgySlS2CMExLubGlctDNgpRmy
	 +wb1+mkeL3b+0/DKZTNHROkCM1HkPOT/x9AA1uqNjJB+mpo5T0WpqiPYosLfU2D0SN
	 7mBaREnL5nO/ZAQVnSRzAD6U4FMVfnDf5GAwFuFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71DADF80528;
	Sat, 10 Jul 2021 04:18:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE3AF8051F; Sat, 10 Jul 2021 04:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61529F804F3
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61529F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hT0EHb8O"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 138C8613C7;
 Sat, 10 Jul 2021 02:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883515;
 bh=yPiIAd5hNHupevODfkmJGWP8zPqAdOq77K8BYOIwQmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hT0EHb8OyWQjO7iOOwuzLbM8TCDjkUnlL3tvnGqMw/m1BE5xM5CkIO4uviDNkWy6w
 MhILOdiN6h+w01rnPxTdxD+GI8POW8V2WVw3zuPdE2vhQrrSdESudS71xdnE6eN/+3
 pJQsDI+fN9OXfP9knxrZCRq5CokjV5+DGaYv7S0hJp+X7YjlhRAXsJZRkxvzRmZts8
 2hBw23SmY9T4BMj397gIjnRooIkPfB5YdIlP+SJrWVfl1lCCz735A1+sbGnkASzn2c
 E6P3Km2I9IRkVB76zlycyA8cW/AeO6TtZsY7fBehCrhmXK3kWYA3duD+WwyGo87XRd
 9by1Oj1eiTMdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 034/114] ASoC: cs42l42: Fix 1536000 Bit Clock
 instability
Date: Fri,  9 Jul 2021 22:16:28 -0400
Message-Id: <20210710021748.3167666-34-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710021748.3167666-1-sashal@kernel.org>
References: <20210710021748.3167666-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@sirena.org.uk>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

[ Upstream commit 1c52825c38fc4e44c61ed75a8ae32f5fa580383b ]

The 16 Bits, 2 channels, 48K sample rate use case needs
to configure a safer pll_divout during the start of PLL
After 800us from the start of PLL the correct pll_divout
can be set

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-Id: <20210525090822.64577-1-tanureal@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@sirena.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l42.c | 47 +++++++++++++++++++++++++-------------
 sound/soc/codecs/cs42l42.h |  2 ++
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 77473c226f9e..8434c48354f1 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -581,6 +581,7 @@ struct cs42l42_pll_params {
 	u8 pll_divout;
 	u32 mclk_int;
 	u8 pll_cal_ratio;
+	u8 n;
 };
 
 /*
@@ -588,21 +589,21 @@ struct cs42l42_pll_params {
  * Table 4-5 from the Datasheet
  */
 static const struct cs42l42_pll_params pll_ratio_table[] = {
-	{ 1536000, 0, 1, 0x00, 0x7D, 0x000000, 0x03, 0x10, 12000000, 125 },
-	{ 2822400, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 11289600, 128 },
-	{ 3000000, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 12000000, 128 },
-	{ 3072000, 0, 1, 0x00, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125 },
-	{ 4000000, 0, 1, 0x00, 0x30, 0x800000, 0x03, 0x10, 12000000, 96 },
-	{ 4096000, 0, 1, 0x00, 0x2E, 0xE00000, 0x03, 0x10, 12000000, 94 },
-	{ 5644800, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 11289600, 128 },
-	{ 6000000, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 12000000, 128 },
-	{ 6144000, 0, 1, 0x01, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125 },
-	{ 11289600, 0, 0, 0, 0, 0, 0, 0, 11289600, 0 },
-	{ 12000000, 0, 0, 0, 0, 0, 0, 0, 12000000, 0 },
-	{ 12288000, 0, 0, 0, 0, 0, 0, 0, 12288000, 0 },
-	{ 22579200, 1, 0, 0, 0, 0, 0, 0, 22579200, 0 },
-	{ 24000000, 1, 0, 0, 0, 0, 0, 0, 24000000, 0 },
-	{ 24576000, 1, 0, 0, 0, 0, 0, 0, 24576000, 0 }
+	{ 1536000, 0, 1, 0x00, 0x7D, 0x000000, 0x03, 0x10, 12000000, 125, 2},
+	{ 2822400, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
+	{ 3000000, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
+	{ 3072000, 0, 1, 0x00, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
+	{ 4000000, 0, 1, 0x00, 0x30, 0x800000, 0x03, 0x10, 12000000,  96, 1},
+	{ 4096000, 0, 1, 0x00, 0x2E, 0xE00000, 0x03, 0x10, 12000000,  94, 1},
+	{ 5644800, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
+	{ 6000000, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
+	{ 6144000, 0, 1, 0x01, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
+	{ 11289600, 0, 0, 0, 0, 0, 0, 0, 11289600, 0, 1},
+	{ 12000000, 0, 0, 0, 0, 0, 0, 0, 12000000, 0, 1},
+	{ 12288000, 0, 0, 0, 0, 0, 0, 0, 12288000, 0, 1},
+	{ 22579200, 1, 0, 0, 0, 0, 0, 0, 22579200, 0, 1},
+	{ 24000000, 1, 0, 0, 0, 0, 0, 0, 24000000, 0, 1},
+	{ 24576000, 1, 0, 0, 0, 0, 0, 0, 24576000, 0, 1}
 };
 
 static int cs42l42_pll_config(struct snd_soc_component *component)
@@ -738,8 +739,12 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 				snd_soc_component_update_bits(component,
 					CS42L42_PLL_CTL3,
 					CS42L42_PLL_DIVOUT_MASK,
-					pll_ratio_table[i].pll_divout
+					(pll_ratio_table[i].pll_divout * pll_ratio_table[i].n)
 					<< CS42L42_PLL_DIVOUT_SHIFT);
+				if (pll_ratio_table[i].n != 1)
+					cs42l42->pll_divout = pll_ratio_table[i].pll_divout;
+				else
+					cs42l42->pll_divout = 0;
 				snd_soc_component_update_bits(component,
 					CS42L42_PLL_CAL_RATIO,
 					CS42L42_PLL_CAL_RATIO_MASK,
@@ -894,6 +899,16 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 			if ((cs42l42->bclk < 11289600) && (cs42l42->sclk < 11289600)) {
 				snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
 							      CS42L42_PLL_START_MASK, 1);
+
+				if (cs42l42->pll_divout) {
+					usleep_range(CS42L42_PLL_DIVOUT_TIME_US,
+						     CS42L42_PLL_DIVOUT_TIME_US * 2);
+					snd_soc_component_update_bits(component, CS42L42_PLL_CTL3,
+								      CS42L42_PLL_DIVOUT_MASK,
+								      cs42l42->pll_divout <<
+								      CS42L42_PLL_DIVOUT_SHIFT);
+				}
+
 				ret = regmap_read_poll_timeout(cs42l42->regmap,
 							       CS42L42_PLL_LOCK_STATUS,
 							       regval,
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 36b763f0d1a0..be5fbf0df3e5 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -755,6 +755,7 @@
 
 #define CS42L42_NUM_SUPPLIES	5
 #define CS42L42_BOOT_TIME_US	3000
+#define CS42L42_PLL_DIVOUT_TIME_US	800
 #define CS42L42_CLOCK_SWITCH_DELAY_US 150
 #define CS42L42_PLL_LOCK_POLL_US	250
 #define CS42L42_PLL_LOCK_TIMEOUT_US	1250
@@ -777,6 +778,7 @@ struct  cs42l42_private {
 	int bclk;
 	u32 sclk;
 	u32 srate;
+	u8 pll_divout;
 	u8 plug_state;
 	u8 hs_type;
 	u8 ts_inv;
-- 
2.30.2

