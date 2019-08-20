Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970996657
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 18:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DF551671;
	Tue, 20 Aug 2019 18:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DF551671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566318506;
	bh=0e0SQkYm3uIYbePeV0yejpqjO2I9WoyNDMhnhg2EtZM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRSAwdcxi6k2D+WQRsM5rCkoHtalm6nxYNMxggdL4WAQkEhcNE8uxeHG/QMzMpewX
	 fgGGD6ihkM93SKpxm6VOyYJDekxK4QHfSPoYTatpZPVkEJezpVGvvOPRI/yb1i0j0O
	 jhim+nm3KDruuLQ/HUDprN0gUFyHANL1j76xHH7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6A97F805A1;
	Tue, 20 Aug 2019 18:25:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4016F805F9; Tue, 20 Aug 2019 18:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
 [216.71.150.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 970CEF805A1
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 18:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 970CEF805A1
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: aFji5dW+I/aW1uJ68pXVxk3YkM2nOrhXauZi1r3/fqZ5u+7X/UBgr88KGpJ42V5Kl5kBNgCZhT
 Z9LY2AQs1YvZQk9VHWzuXLFrY5XucSJ+6srzf9od2uEKnMuQiJhBwT23cZm1SQe4mCZBIHUiYN
 yqmilAUguI/n4Ofvphe+2ql+GHyEMcC3LSYl7l4+vyOXTysYuh+dRqiBrnqUpXBVMey5qfrJdj
 Aw/4ID4rBcL6yjET0N7loQXZh9NArVOuhXKozgvfWPxVnPdYBZuS1h9YEsdsXR1nRKY1ivPh+2
 i5g=
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="44306438"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Aug 2019 09:24:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 09:24:56 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Tue, 20 Aug 2019 09:24:54 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 20 Aug 2019 19:24:11 +0300
Message-ID: <20190820162411.24836-4-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820162411.24836-1-codrin.ciubotariu@microchip.com>
References: <20190820162411.24836-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [alsa-devel] [PATCH 3/3] ASoC: mchp-i2s-mcc: Fix simultaneous
	capture and playback in master mode
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

This controller supports capture and playback running at the same time,
with the limitation that both capture and playback must be configured the
same way (sample rate, sample format, number of channels, etc). For this,
we have to assure that the configuration registers look the same when
capture and playback are initiated.
This patch fixes a bug in which the controller is in master mode and the
hw_params() callback fails for the second audio stream. The fail occurs
because the divisors are calculated after comparing the configuration
registers for capture and playback. The fix consists in calculating the
divisors before comparing the configuration registers. BCLK and LRC are
then configured and started only if the controller is not already running.

Fixes: 7e0cdf545a55 ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Channel Controller")
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 70 ++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index ab7d5f98e759..befc2a3a05b0 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -392,11 +392,11 @@ static int mchp_i2s_mcc_clk_get_rate_diff(struct clk *clk,
 }
 
 static int mchp_i2s_mcc_config_divs(struct mchp_i2s_mcc_dev *dev,
-				    unsigned int bclk, unsigned int *mra)
+				    unsigned int bclk, unsigned int *mra,
+				    unsigned long *best_rate)
 {
 	unsigned long clk_rate;
 	unsigned long lcm_rate;
-	unsigned long best_rate = 0;
 	unsigned long best_diff_rate = ~0;
 	unsigned int sysclk;
 	struct clk *best_clk = NULL;
@@ -423,7 +423,7 @@ static int mchp_i2s_mcc_config_divs(struct mchp_i2s_mcc_dev *dev,
 	     (clk_rate == bclk || clk_rate / (bclk * 2) <= GENMASK(5, 0));
 	     clk_rate += lcm_rate) {
 		ret = mchp_i2s_mcc_clk_get_rate_diff(dev->gclk, clk_rate,
-						     &best_clk, &best_rate,
+						     &best_clk, best_rate,
 						     &best_diff_rate);
 		if (ret) {
 			dev_err(dev->dev, "gclk error for rate %lu: %d",
@@ -437,7 +437,7 @@ static int mchp_i2s_mcc_config_divs(struct mchp_i2s_mcc_dev *dev,
 		}
 
 		ret = mchp_i2s_mcc_clk_get_rate_diff(dev->pclk, clk_rate,
-						     &best_clk, &best_rate,
+						     &best_clk, best_rate,
 						     &best_diff_rate);
 		if (ret) {
 			dev_err(dev->dev, "pclk error for rate %lu: %d",
@@ -459,33 +459,17 @@ static int mchp_i2s_mcc_config_divs(struct mchp_i2s_mcc_dev *dev,
 
 	dev_dbg(dev->dev, "source CLK is %s with rate %lu, diff %lu\n",
 		best_clk == dev->pclk ? "pclk" : "gclk",
-		best_rate, best_diff_rate);
-
-	/* set the rate */
-	ret = clk_set_rate(best_clk, best_rate);
-	if (ret) {
-		dev_err(dev->dev, "unable to set rate %lu to %s: %d\n",
-			best_rate, best_clk == dev->pclk ? "PCLK" : "GCLK",
-			ret);
-		return ret;
-	}
+		*best_rate, best_diff_rate);
 
 	/* Configure divisors */
 	if (dev->sysclk)
-		*mra |= MCHP_I2SMCC_MRA_IMCKDIV(best_rate / (2 * sysclk));
-	*mra |= MCHP_I2SMCC_MRA_ISCKDIV(best_rate / (2 * bclk));
+		*mra |= MCHP_I2SMCC_MRA_IMCKDIV(*best_rate / (2 * sysclk));
+	*mra |= MCHP_I2SMCC_MRA_ISCKDIV(*best_rate / (2 * bclk));
 
-	if (best_clk == dev->gclk) {
+	if (best_clk == dev->gclk)
 		*mra |= MCHP_I2SMCC_MRA_SRCCLK_GCLK;
-		ret = clk_prepare(dev->gclk);
-		if (ret < 0)
-			dev_err(dev->dev, "unable to prepare GCLK: %d\n", ret);
-		else
-			dev->gclk_use = 1;
-	} else {
+	else
 		*mra |= MCHP_I2SMCC_MRA_SRCCLK_PCLK;
-		dev->gclk_use = 0;
-	}
 
 	return 0;
 }
@@ -502,6 +486,7 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params,
 				  struct snd_soc_dai *dai)
 {
+	unsigned long rate = 0;
 	struct mchp_i2s_mcc_dev *dev = snd_soc_dai_get_drvdata(dai);
 	u32 mra = 0;
 	u32 mrb = 0;
@@ -640,6 +625,17 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	if (set_divs) {
+		bclk_rate = frame_length * params_rate(params);
+		ret = mchp_i2s_mcc_config_divs(dev, bclk_rate, &mra,
+					       &rate);
+		if (ret) {
+			dev_err(dev->dev,
+				"unable to configure the divisors: %d\n", ret);
+			return ret;
+		}
+	}
+
 	/*
 	 * If we are already running, the wanted setup must be
 	 * the same with the one that's currently ongoing
@@ -656,19 +652,27 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 	}
 
-	/* Save the number of channels to know what interrupts to enable */
-	dev->channels = channels;
-
-	if (set_divs) {
-		bclk_rate = frame_length * params_rate(params);
-		ret = mchp_i2s_mcc_config_divs(dev, bclk_rate, &mra);
+	if (mra & MCHP_I2SMCC_MRA_SRCCLK_GCLK && !dev->gclk_use) {
+		/* set the rate */
+		ret = clk_set_rate(dev->gclk, rate);
 		if (ret) {
-			dev_err(dev->dev, "unable to configure the divisors: %d\n",
-				ret);
+			dev_err(dev->dev,
+				"unable to set rate %lu to GCLK: %d\n",
+				rate, ret);
+			return ret;
+		}
+
+		ret = clk_prepare(dev->gclk);
+		if (ret < 0) {
+			dev_err(dev->dev, "unable to prepare GCLK: %d\n", ret);
 			return ret;
 		}
+		dev->gclk_use = 1;
 	}
 
+	/* Save the number of channels to know what interrupts to enable */
+	dev->channels = channels;
+
 	ret = regmap_write(dev->regmap, MCHP_I2SMCC_MRA, mra);
 	if (ret < 0) {
 		if (dev->gclk_use) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
