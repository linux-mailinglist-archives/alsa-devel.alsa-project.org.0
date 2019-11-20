Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F8103E8C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 16:29:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA6916DF;
	Wed, 20 Nov 2019 16:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA6916DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574263772;
	bh=KIusMBDY5c3CxcXrNyD3oDItYhItQp0UwVoGVSSI8w0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KlV9PBUZK2IggA0nMFw5ubidqnlLJ4P3KrJnMkGD+7kmteqknYXZp9ZIfGd5gywNG
	 lTbL1yAB1yz0NTLgUNzNO1GBqZ5IOva9TXkqCrxVPkGT72wqwJ5FqHsbrJzbcawlmT
	 MY6eB2pTpvm9uVOisMBjurwO3KD16Ans6sO2ZVmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45272F8020C;
	Wed, 20 Nov 2019 16:24:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BD74F80161; Wed, 20 Nov 2019 16:24:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06C59F8014E
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 16:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06C59F8014E
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 6D9162910F0
Received: by earth.universe (Postfix, from userid 1000)
 id 35C833C0C7C; Wed, 20 Nov 2019 16:24:08 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 20 Nov 2019 16:24:06 +0100
Message-Id: <20191120152406.2744-7-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120152406.2744-1-sebastian.reichel@collabora.com>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject: [alsa-devel] [PATCHv2 6/6] ASoC: da7213: Add default clock handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This adds default clock/PLL configuration to the driver
for usage with generic drivers like simple-card for usage
with a fixed rate clock.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/codecs/da7213.c | 75 ++++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/da7213.h |  2 ++
 2 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 3e6ad996741b..ff1a936240be 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1156,6 +1156,7 @@ static int da7213_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 	u8 dai_ctrl = 0;
 	u8 fs;
 
@@ -1181,33 +1182,43 @@ static int da7213_hw_params(struct snd_pcm_substream *substream,
 	switch (params_rate(params)) {
 	case 8000:
 		fs = DA7213_SR_8000;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 11025:
 		fs = DA7213_SR_11025;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
 		break;
 	case 12000:
 		fs = DA7213_SR_12000;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 16000:
 		fs = DA7213_SR_16000;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 22050:
 		fs = DA7213_SR_22050;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
 		break;
 	case 32000:
 		fs = DA7213_SR_32000;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 44100:
 		fs = DA7213_SR_44100;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
 		break;
 	case 48000:
 		fs = DA7213_SR_48000;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 88200:
 		fs = DA7213_SR_88200;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
 		break;
 	case 96000:
 		fs = DA7213_SR_96000;
+		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	default:
 		return -EINVAL;
@@ -1392,9 +1403,9 @@ static int da7213_set_component_sysclk(struct snd_soc_component *component,
 }
 
 /* Supported PLL input frequencies are 32KHz, 5MHz - 54MHz. */
-static int da7213_set_component_pll(struct snd_soc_component *component,
-				    int pll_id, int source,
-				    unsigned int fref, unsigned int fout)
+static int _da7213_set_component_pll(struct snd_soc_component *component,
+				     int pll_id, int source,
+				     unsigned int fref, unsigned int fout)
 {
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 
@@ -1503,6 +1514,16 @@ static int da7213_set_component_pll(struct snd_soc_component *component,
 	return 0;
 }
 
+static int da7213_set_component_pll(struct snd_soc_component *component,
+				    int pll_id, int source,
+				    unsigned int fref, unsigned int fout)
+{
+	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
+	da7213->fixed_clk_auto_pll = false;
+
+	return _da7213_set_component_pll(component, pll_id, source, fref, fout);
+}
+
 /* DAI operations */
 static const struct snd_soc_dai_ops da7213_dai_ops = {
 	.hw_params	= da7213_hw_params,
@@ -1532,6 +1553,43 @@ static struct snd_soc_dai_driver da7213_dai = {
 	.symmetric_rates = 1,
 };
 
+static int da7213_set_auto_pll(struct snd_soc_component *component, bool enable)
+{
+	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
+	int mode;
+
+	if (!da7213->fixed_clk_auto_pll)
+		return 0;
+
+	da7213->mclk_rate = clk_get_rate(da7213->mclk);
+
+	if (enable)
+		mode = DA7213_SYSCLK_PLL;
+	else
+		mode = DA7213_SYSCLK_MCLK;
+
+	switch (da7213->out_rate) {
+	case DA7213_PLL_FREQ_OUT_90316800:
+		if (da7213->mclk_rate == 11289600 ||
+		    da7213->mclk_rate == 22579200 ||
+		    da7213->mclk_rate == 45158400)
+			mode = DA7213_SYSCLK_MCLK;
+		break;
+	case DA7213_PLL_FREQ_OUT_98304000:
+		if (da7213->mclk_rate == 12288000 ||
+		    da7213->mclk_rate == 24576000 ||
+		    da7213->mclk_rate == 49152000)
+			mode = DA7213_SYSCLK_MCLK;
+
+		break;
+	default:
+		return -1;
+	}
+
+	return _da7213_set_component_pll(component, 0, mode,
+					 da7213->mclk_rate, da7213->out_rate);
+}
+
 static int da7213_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
@@ -1551,6 +1609,8 @@ static int da7213_set_bias_level(struct snd_soc_component *component,
 						"Failed to enable mclk\n");
 					return ret;
 				}
+
+				da7213_set_auto_pll(component, true);
 			}
 		}
 		break;
@@ -1562,8 +1622,10 @@ static int da7213_set_bias_level(struct snd_soc_component *component,
 					    DA7213_VMID_EN | DA7213_BIAS_EN);
 		} else {
 			/* Remove MCLK */
-			if (da7213->mclk)
+			if (da7213->mclk) {
+				da7213_set_auto_pll(component, false);
 				clk_disable_unprepare(da7213->mclk);
+			}
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -1829,6 +1891,11 @@ static int da7213_probe(struct snd_soc_component *component)
 			return PTR_ERR(da7213->mclk);
 		else
 			da7213->mclk = NULL;
+	} else {
+		/* Do automatic PLL handling assuming fixed clock until
+		 * set_pll() has been called. This makes the codec usable
+		 * with the simple-audio-card driver. */
+		da7213->fixed_clk_auto_pll = true;
 	}
 
 	return 0;
diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
index 3890829dfb6e..97ccf0ddd2be 100644
--- a/sound/soc/codecs/da7213.h
+++ b/sound/soc/codecs/da7213.h
@@ -535,10 +535,12 @@ struct da7213_priv {
 	struct regulator_bulk_data supplies[DA7213_NUM_SUPPLIES];
 	struct clk *mclk;
 	unsigned int mclk_rate;
+	unsigned int out_rate;
 	int clk_src;
 	bool master;
 	bool alc_calib_auto;
 	bool alc_en;
+	bool fixed_clk_auto_pll;
 	struct da7213_platform_data *pdata;
 };
 
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
