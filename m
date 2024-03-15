Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4687DCB5
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:04:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EEDB2BA3;
	Sun, 17 Mar 2024 10:03:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EEDB2BA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666249;
	bh=/9MOC//4icL1mkYY+3/MDt3RrV6Xiz5zG1bPwSLg9DQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XkGFhlNYtLk63hY1bo/cBS1XwJg1vwtBc9CfNLXx3T5jwjcjHOalry8hu7uq3VQCD
	 7tKtL7i9U/GlvipEsgI+07LXBBv6aezcMEUzHUgZYTpRJvnW5BLLiZ3yE7oIfCM+D2
	 7qvhvB3T5Ao0v3j3sRw4uOaOYpmxa8mcNjXoYWBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34091F805AF; Sun, 17 Mar 2024 10:02:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 555E6F80672;
	Sun, 17 Mar 2024 10:02:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EFA1F8028D; Fri, 15 Mar 2024 12:29:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52558F804B2
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52558F804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S/51PEpq
Received: by mail.gandi.net (Postfix) with ESMTPA id ECB08E0003;
	Fri, 15 Mar 2024 11:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3k3C45wOf7UbcUd/6RBltZ20s6UElfnsHBgrHpSOQU=;
	b=S/51PEpqCZN+wUtFuSRm8pBQFVPcY4BLnwaNB4mNSnKqSQuUVtYMmdPYCJpXnkOPN6YaQk
	f+uQwYZFAFeNgP3Ov59dvGIeCvlLFlweA+YME59kcybf5I0ITaJPkz36wtf0d4hRz1Iond
	ydvtUD4grsItd54pKEoW7m2XWLQwPzzNjdmFAmvUZEz16tF62QA6nKNZtaOeFuObpANwmw
	P5ZsQ3vWWebLivXpCYsRzQqkbrVjl++5FtMhg5h4qMbsd8hQo2uFP//i7Ft3QSFE+ohqlG
	ZrkNXm3I1wVPiZ5DXqzF6woHCP0+lWJnLcyRn9MY+lw6LAJJ3ERDnrup3Pj5jg==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH 05/13] ASoC: ti: davinci-i2s: Use external clock to drive
 sample rate generator
Date: Fri, 15 Mar 2024 12:27:37 +0100
Message-ID: <20240315112745.63230-6-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D6VOB5BA4QHW7D3CFXBWMQZUQD6IJBII
X-Message-ID-Hash: D6VOB5BA4QHW7D3CFXBWMQZUQD6IJBII
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

McBSP's internal sample rate generator can be programed to be driven by
its internal clock or by an external clock source located on CLKS pin.
The external clock source case is not handled by the driver.

Handle an optional clock related to this external clock source. If
present, the driver uses the clock located on CLKS pin as input for the
sample rate generator. Thus, the external clock rate is used to compute
divisors. If this optional clock is not present, the sample rate
generator is driven by the McBSP's functional clock.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 65 ++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 4cb3ef62db20..8ee22d79b0f4 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -134,6 +134,7 @@ struct davinci_mcbsp_dev {
 	int				mode;
 	u32				pcr;
 	struct clk			*clk;
+	struct clk			*ext_clk;
 	/*
 	 * Combining both channels into 1 element will at least double the
 	 * amount of time between servicing the dma channel, increase
@@ -364,7 +365,8 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
 	struct snd_interval *i = NULL;
 	int mcbsp_word_length, master;
-	unsigned int rcr, xcr, srgr, clk_div, freq, framesize;
+	unsigned int rcr, xcr, clk_div, freq, framesize;
+	unsigned int srgr = 0;
 	u32 spcr;
 	snd_pcm_format_t fmt;
 	unsigned element_cnt = 1;
@@ -385,9 +387,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	switch (master) {
 	case SND_SOC_DAIFMT_BP_FP:
-		freq = clk_get_rate(dev->clk);
-		srgr = DAVINCI_MCBSP_SRGR_FSGM |
-		       DAVINCI_MCBSP_SRGR_CLKSM;
+		if (dev->ext_clk) {
+			freq = clk_get_rate(dev->ext_clk);
+		} else {
+			freq = clk_get_rate(dev->clk);
+			srgr = DAVINCI_MCBSP_SRGR_CLKSM;
+		}
+		srgr |= DAVINCI_MCBSP_SRGR_FSGM;
 		srgr |= DAVINCI_MCBSP_SRGR_FWID(mcbsp_word_length *
 						8 - 1);
 		if (dev->i2s_accurate_sck) {
@@ -688,12 +694,36 @@ static int davinci_i2s_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -ENODEV, "Missing DMA rx resource\n");
 	}
 
-	dev->clk = clk_get(&pdev->dev, NULL);
+	/*
+	 * The optional is there for backward compatibility.
+	 * If 'fck' is not present, the clk_get(dev, NULL) that follows may find something
+	 */
+	dev->clk = devm_clk_get_optional(&pdev->dev, "fck");
 	if (IS_ERR(dev->clk))
-		return -ENODEV;
-	ret = clk_enable(dev->clk);
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk), "Invalid functional clock\n");
+	if (!dev->clk) {
+		dev->clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(dev->clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk),
+					     "Missing functional clock\n");
+	}
+
+	dev->ext_clk = devm_clk_get_optional(&pdev->dev, "clks");
+	if (IS_ERR(dev->ext_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->ext_clk), "Invalid external clock\n");
+
+	ret = clk_prepare_enable(dev->clk);
 	if (ret)
-		goto err_put_clk;
+		return ret;
+
+	if (dev->ext_clk) {
+		dev_dbg(&pdev->dev, "External clock used for sample rate generator\n");
+		ret = clk_prepare_enable(dev->ext_clk);
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "Failed to enable external clock\n");
+			goto err_disable_clk;
+		}
+	}
 
 	dev->dev = &pdev->dev;
 	dev_set_drvdata(&pdev->dev, dev);
@@ -701,7 +731,7 @@ static int davinci_i2s_probe(struct platform_device *pdev)
 	ret = snd_soc_register_component(&pdev->dev, &davinci_i2s_component,
 					 &davinci_i2s_dai, 1);
 	if (ret != 0)
-		goto err_release_clk;
+		goto err_disable_ext_clk;
 
 	ret = edma_pcm_platform_register(&pdev->dev);
 	if (ret) {
@@ -713,10 +743,12 @@ static int davinci_i2s_probe(struct platform_device *pdev)
 
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
-err_release_clk:
-	clk_disable(dev->clk);
-err_put_clk:
-	clk_put(dev->clk);
+err_disable_ext_clk:
+	if (dev->ext_clk)
+		clk_disable_unprepare(dev->ext_clk);
+err_disable_clk:
+	clk_disable_unprepare(dev->clk);
+
 	return ret;
 }
 
@@ -726,9 +758,10 @@ static void davinci_i2s_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_component(&pdev->dev);
 
-	clk_disable(dev->clk);
-	clk_put(dev->clk);
-	dev->clk = NULL;
+	clk_disable_unprepare(dev->clk);
+
+	if (dev->ext_clk)
+		clk_disable_unprepare(dev->ext_clk);
 }
 
 static const struct of_device_id davinci_i2s_match[] __maybe_unused = {
-- 
2.43.2

