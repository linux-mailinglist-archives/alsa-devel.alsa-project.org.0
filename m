Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE22D17E285
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 15:27:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 869D41672;
	Mon,  9 Mar 2020 15:26:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 869D41672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583764069;
	bh=CUvHsyb4NnoMIXB/Ro0tmAGHeTgxzBj9AjeT9wTt46g=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZmD75yERBDOjegJkpfnVa7OM3NhwBAFfhDjJAiQ+D4D2IDaS9Es1Vd/+MaEvEg3C+
	 btqyFRVTXFk+bdl0hmXOUvxnM25erEZfTubMjLMHzn9anYNTGhdgDtlTZkk3/dZ1SD
	 fCSTNgWl9SKUdrOFSFtJLGK7iEOZP8UUR2FbHDNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35330F80227;
	Mon,  9 Mar 2020 15:25:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99A02F80227; Mon,  9 Mar 2020 15:25:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id BDEC4F801F8
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 15:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDEC4F801F8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F16707FA;
 Mon,  9 Mar 2020 07:25:20 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 750B93F67D;
 Mon,  9 Mar 2020 07:25:20 -0700 (PDT)
Date: Mon, 09 Mar 2020 14:25:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Applied "ASoC: jz4740-i2s: Add local dev variable in probe function"
 to the asoc tree
In-Reply-To: <20200306222931.39664-3-paul@crapouillou.net>
Message-Id: <applied-20200306222931.39664-3-paul@crapouillou.net>
X-Patchwork-Hint: ignore
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, od@zcrc.me,
 Zhou Yanjie <zhouyanjie@wanyeetech.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: jz4740-i2s: Add local dev variable in probe function

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From a42d9ba15cbf3e84307906db65fc598a8b73e2f1 Mon Sep 17 00:00:00 2001
From: Paul Cercueil <paul@crapouillou.net>
Date: Fri, 6 Mar 2020 23:29:28 +0100
Subject: [PATCH] ASoC: jz4740-i2s: Add local dev variable in probe function

Make the code cleaner by using a "struct device *dev" variable instead
of dereferencing it everytime from within the struct platform_device.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Link: https://lore.kernel.org/r/20200306222931.39664-3-paul@crapouillou.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/jz4740/jz4740-i2s.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 9d5405881209..2572aba843e3 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -492,45 +492,45 @@ MODULE_DEVICE_TABLE(of, jz4740_of_matches);
 
 static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct jz4740_i2s *i2s;
 	struct resource *mem;
 	int ret;
 
-	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
+	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
 	if (!i2s)
 		return -ENOMEM;
 
-	i2s->version =
-		(enum jz47xx_i2s_version)of_device_get_match_data(&pdev->dev);
+	i2s->version = (enum jz47xx_i2s_version)of_device_get_match_data(dev);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2s->base = devm_ioremap_resource(&pdev->dev, mem);
+	i2s->base = devm_ioremap_resource(dev, mem);
 	if (IS_ERR(i2s->base))
 		return PTR_ERR(i2s->base);
 
 	i2s->phys_base = mem->start;
 
-	i2s->clk_aic = devm_clk_get(&pdev->dev, "aic");
+	i2s->clk_aic = devm_clk_get(dev, "aic");
 	if (IS_ERR(i2s->clk_aic))
 		return PTR_ERR(i2s->clk_aic);
 
-	i2s->clk_i2s = devm_clk_get(&pdev->dev, "i2s");
+	i2s->clk_i2s = devm_clk_get(dev, "i2s");
 	if (IS_ERR(i2s->clk_i2s))
 		return PTR_ERR(i2s->clk_i2s);
 
 	platform_set_drvdata(pdev, i2s);
 
 	if (i2s->version == JZ_I2S_JZ4780)
-		ret = devm_snd_soc_register_component(&pdev->dev,
+		ret = devm_snd_soc_register_component(dev,
 			&jz4740_i2s_component, &jz4780_i2s_dai, 1);
 	else
-		ret = devm_snd_soc_register_component(&pdev->dev,
+		ret = devm_snd_soc_register_component(dev,
 			&jz4740_i2s_component, &jz4740_i2s_dai, 1);
 
 	if (ret)
 		return ret;
 
-	return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL,
+	return devm_snd_dmaengine_pcm_register(dev, NULL,
 		SND_DMAENGINE_PCM_FLAG_COMPAT);
 }
 
-- 
2.20.1

