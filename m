Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C817C861
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 23:32:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08FA811C;
	Fri,  6 Mar 2020 23:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08FA811C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583533953;
	bh=PYy+9qNedfJXUGXV6tVpNlsGf0FdnWPfBxjEQ7R8QPs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IclRoEMH04mPwuLF2zlWDnsLcpqErPrTRfRwU3383heK0aCI9W+KqvdERXopuy9bv
	 za8YUoUMzsT+GQABFb6wbRXn3ERDLwEQv34pE1RycCnb4/O4X7MZWpdzRwSLq+smbQ
	 uWPTywhtEXvdmRM0LVUGea8jGReZN9FxUEGkLXiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F24F801F9;
	Fri,  6 Mar 2020 23:30:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB786F8028B; Fri,  6 Mar 2020 23:29:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4832BF80232
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 23:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4832BF80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="x3vpN2ti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583533779; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRGg6vO7hMIxilmoFbXVvo35zl/6jF7rGN4qOJe/OOE=;
 b=x3vpN2tin6NERjx2+lVzw/clOc67Dd4y/qx3U8Y7EZUi58iPda05Veka6z9hKrOTBcpKPY
 shrh/XvoIcLb6JYSq/R+tfiXdahqgV1YsYTMQOy0uQch+dha7wjOVBRh3yXeiGCENaGg4t
 ZULk80cHXrjRHNxfx1ZAuy71JT2F+wg=
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/6] ASoC: jz4740-i2s: Add local dev variable in probe function
Date: Fri,  6 Mar 2020 23:29:28 +0100
Message-Id: <20200306222931.39664-3-paul@crapouillou.net>
In-Reply-To: <20200306222931.39664-1-paul@crapouillou.net>
References: <20200306222931.39664-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Zhou Yanjie <zhouyanjie@wanyeetech.com>,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
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

Make the code cleaner by using a "struct device *dev" variable instead
of dereferencing it everytime from within the struct platform_device.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/jz4740/jz4740-i2s.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 434737b2b2b2..b7e5056a8fde 100644
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
2.25.1

