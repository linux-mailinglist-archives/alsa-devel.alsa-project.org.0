Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 339A74E784F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:45:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1E42172E;
	Fri, 25 Mar 2022 16:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1E42172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648223117;
	bh=ASmJnaDdZ+Nyaj2PA95nJQlZZOD2sgjozfnZ23JhTNE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WqY45xSo+/+Ei5h2DI50oW7QgJi05IAp6ZKi+zPQ1rCTAWA6ClrzFmH7SNU3SvPVB
	 s9QxXsdJmKsPPtHf0Ooizm+AMXHcOfod//qLBRe47e2h9j+ZLusDTy5zHh69OiswRW
	 OAmgg9DGV4xLvuB5vI2x6BuVYKvIDufcBqN29SuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E47BFF804CB;
	Fri, 25 Mar 2022 16:43:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7BB0F804CC; Fri, 25 Mar 2022 16:43:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA63F800AA
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA63F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qmFNLwT2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F68D6183D;
 Fri, 25 Mar 2022 15:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB11C340F3;
 Fri, 25 Mar 2022 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648223012;
 bh=ASmJnaDdZ+Nyaj2PA95nJQlZZOD2sgjozfnZ23JhTNE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qmFNLwT2aQ7ATezL7JLhiX+Yk8HY7/uMzEiE8L1fTHXrYntjaV2KGMu0vXkx2GgqA
 D1Ja/Sk8Wi11U65ODaI11Mzg2ABi7Lfn8Z5Iu7UXKIoEm4TmcUQl60d3sC4R6N7lka
 WFwHOSHgg8RfqiY0jUNZH/uOoDd31peUFLGumXRTkZHJaFsM5JKz1PITh9+oUPthZX
 k8f7g/KG9tKsxs4VBEu9P6webwVi/G8cTugyIdcFofZ5tk6juZkBZQoO26ElqGcRa+
 uqPvHuXDCok43D9Qw79MB5Bhm+JvTyZMzQ/xGTP08JKaC5leXeyz5AjNh5hCIz9g2K
 hXTF2L9+sNqtw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v1 1/3] ASoC: atmel: Remove system clock tree configuration
 for at91sam9g20ek
Date: Fri, 25 Mar 2022 15:42:39 +0000
Message-Id: <20220325154241.1600757-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325154241.1600757-1-broonie@kernel.org>
References: <20220325154241.1600757-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3790; h=from:subject;
 bh=ASmJnaDdZ+Nyaj2PA95nJQlZZOD2sgjozfnZ23JhTNE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeLvfsokRHH+Pq1/L8yPPh4M5ejpNCXJFDXGeth7
 DK1WvEWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3i7wAKCRAk1otyXVSH0In7B/
 9pzbpPKTUvOFRP1y3AIyMSnDc5NF4Fh4OXe+UthQd++yu8tyQFhqwkHidrDgqwhXocNrcH2IpJ3L6N
 9R+8QJ41+9Tv986mtbLkrhzMsjCIZupuukkagw5EW5CIU32nRfHrmDPRB7LRKOeDvLY3oeAuFlefkL
 sUUFNnasv7Efflt/3D4/gqn1QhyyDTiyWA/oYuInCDw2u3EcnyliVNIP0C9dk4C1nfdBSGN/vCblVe
 3BZLj2pgar0jr/j+RcPo5Hf4wIKfoXhwyNWS8pCIPizSb0f7CgNvrL16QO9MnS73tCxHxqUxYHcMSu
 wwHJxznfY87d+kuS8uPplBfP3Hou2i
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The MCLK of the WM8731 on the AT91SAM9G20-EK board is connected to the
PCK0 output of the SoC, intended in the reference software to be supplied
using PLLB and programmed to 12MHz. As originally written for use with a
board file the audio driver was responsible for configuring the entire tree
but in the conversion to the common clock framework the registration of
the named pck0 and pllb clocks was removed so the driver has failed to
instantiate ever since.

Since the WM8731 driver has had support for managing a MCLK provided via
the common clock framework for some time we can simply drop all the clock
management code from the machine driver other than configuration of the
sysclk rate, the CODEC driver still respects that configuration from the
machine driver.

Fixes: ff78a189b0ae55f ("ARM: at91: remove old at91-specific clock driver")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/sam9g20_wm8731.c | 61 --------------------------------
 1 file changed, 61 deletions(-)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index 33e43013ff77..0d639a33ad96 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -46,35 +46,6 @@
  */
 #undef ENABLE_MIC_INPUT
 
-static struct clk *mclk;
-
-static int at91sam9g20ek_set_bias_level(struct snd_soc_card *card,
-					struct snd_soc_dapm_context *dapm,
-					enum snd_soc_bias_level level)
-{
-	static int mclk_on;
-	int ret = 0;
-
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-	case SND_SOC_BIAS_PREPARE:
-		if (!mclk_on)
-			ret = clk_enable(mclk);
-		if (ret == 0)
-			mclk_on = 1;
-		break;
-
-	case SND_SOC_BIAS_OFF:
-	case SND_SOC_BIAS_STANDBY:
-		if (mclk_on)
-			clk_disable(mclk);
-		mclk_on = 0;
-		break;
-	}
-
-	return ret;
-}
-
 static const struct snd_soc_dapm_widget at91sam9g20ek_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SPK("Ext Spk", NULL),
@@ -135,7 +106,6 @@ static struct snd_soc_card snd_soc_at91sam9g20ek = {
 	.owner = THIS_MODULE,
 	.dai_link = &at91sam9g20ek_dai,
 	.num_links = 1,
-	.set_bias_level = at91sam9g20ek_set_bias_level,
 
 	.dapm_widgets = at91sam9g20ek_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(at91sam9g20ek_dapm_widgets),
@@ -148,7 +118,6 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *codec_np, *cpu_np;
-	struct clk *pllb;
 	struct snd_soc_card *card = &snd_soc_at91sam9g20ek;
 	int ret;
 
@@ -162,31 +131,6 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/*
-	 * Codec MCLK is supplied by PCK0 - set it up.
-	 */
-	mclk = clk_get(NULL, "pck0");
-	if (IS_ERR(mclk)) {
-		dev_err(&pdev->dev, "Failed to get MCLK\n");
-		ret = PTR_ERR(mclk);
-		goto err;
-	}
-
-	pllb = clk_get(NULL, "pllb");
-	if (IS_ERR(pllb)) {
-		dev_err(&pdev->dev, "Failed to get PLLB\n");
-		ret = PTR_ERR(pllb);
-		goto err_mclk;
-	}
-	ret = clk_set_parent(mclk, pllb);
-	clk_put(pllb);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "Failed to set MCLK parent\n");
-		goto err_mclk;
-	}
-
-	clk_set_rate(mclk, MCLK_RATE);
-
 	card->dev = &pdev->dev;
 
 	/* Parse device node info */
@@ -230,9 +174,6 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 
 	return ret;
 
-err_mclk:
-	clk_put(mclk);
-	mclk = NULL;
 err:
 	atmel_ssc_put_audio(0);
 	return ret;
@@ -242,8 +183,6 @@ static int at91sam9g20ek_audio_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
-	clk_disable(mclk);
-	mclk = NULL;
 	snd_soc_unregister_card(card);
 	atmel_ssc_put_audio(0);
 
-- 
2.30.2

