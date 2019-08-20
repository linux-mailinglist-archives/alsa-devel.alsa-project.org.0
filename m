Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F17967BE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:42:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CAE166B;
	Tue, 20 Aug 2019 19:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CAE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566322963;
	bh=GT/xGbnAWzaw1cRNd6/BWuzF+mQRDTn5qAhbWi952HA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tt+6JPg4LIdN99T9za2YtWHpD/NJnZuLZdMInwTlUnCfe/JBRzxmopVXcdJQDoxvM
	 jQVWlKzkY+fgvmoQnt5AZY85CccCF3to7qYp78Gs9h5nA56VhkTIsCReb1brKXUQTk
	 wRuhwFv541iLmdn1lcbAzcgq6CHhJSUJLWlG8W9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24A34F800BF;
	Tue, 20 Aug 2019 19:41:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3768F805F9; Tue, 20 Aug 2019 19:41:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B698F802E0
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B698F802E0
Received: by mail-wm1-f97.google.com with SMTP id o4so3368436wmh.2
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=JrwceyLHFU0hgmI9AovAhbDEUxaznzklC8RnSS8SPlk=;
 b=gV3uYvPaY98WqHOG/JSGHb2t5dMzJ6f11OQ4tX2CdJ4o+dIWRNmdwZhMJB7Yi/VFgT
 gNTxR0utmmSaqYh4w6H7ng/HR4tHBhJg6NvJOzknNjhK1LRkR2TCIxnUu7CnOujcfp7H
 rkEIJ5LaVsJwisApsQt+dAHiGTfbnqnXibEQczobwhA8BaOWMX0ty6iohdDIYKHR/Bgk
 Cq2VBcl1jVVkXdoM6TnWn4DuUEpo3ofFNRVzTKacbbPCfzyqfiYE16hjnTaJPdrsAzAr
 Iz+J49e4R55h+Q6QIuddkqYIGB9+R/UsE0muvqZzkq5n90+xqDuJ1eysDDMOEMTFo+mw
 OYKA==
X-Gm-Message-State: APjAAAW9/UfKdbLdsB3ycqQaDFQoIxujPd1iX44bh32cJkLb+MHJ55Bn
 F9fUYajyO0Xrsgb6Dy8PNcVSv3dAB5Gm49g/8xH95BQdL4G8+KL0urwc1IzP5CVbsA==
X-Google-Smtp-Source: APXvYqwt7YVlyRrKGvChY8x1oTFlBpL2kQBuLGyaEcaYtjIZNlgsflzi26I4H8MbINCByU9/IZByXAw5KxRD
X-Received: by 2002:a1c:6387:: with SMTP id x129mr1209622wmb.166.1566322864444; 
 Tue, 20 Aug 2019 10:41:04 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id 204sm1639wmc.24.2019.08.20.10.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:04 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i087z-00032C-UU; Tue, 20 Aug 2019 17:41:04 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 225022742B4A; Tue, 20 Aug 2019 18:41:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
In-Reply-To: <20190820162411.24836-4-codrin.ciubotariu@microchip.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174103.225022742B4A@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:03 +0100 (BST)
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 ludovic.desroches@microchip.com, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: mchp-i2s-mcc: Fix simultaneous capture
	and playback in master mode" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: mchp-i2s-mcc: Fix simultaneous capture and playback in master mode

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From c9cff337eab394c4dc8b128dde7308a1dd2e653a Mon Sep 17 00:00:00 2001
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Date: Tue, 20 Aug 2019 19:24:11 +0300
Subject: [PATCH] ASoC: mchp-i2s-mcc: Fix simultaneous capture and playback in
 master mode

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
Link: https://lore.kernel.org/r/20190820162411.24836-4-codrin.ciubotariu@microchip.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 70 ++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 86495883ca3f..9a406144b18f 100644
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
 	if (ret < 0)
 		return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
