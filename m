Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967666FFC5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B7517A8;
	Mon, 22 Jul 2019 14:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B7517A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563798964;
	bh=KSFEUSlIo0MTEc/Bm6xKEzmy+74oArskipcuPNnDslE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HPGPHr3d9uYteMe/NcSoBcampJM0K5C5Np59Bm0XNR0AhgassxKv07tALpQxCZ8tA
	 faTLxu3Tmk84geiUrbQDEd34hNm7LkYLKXSmgVxUaflVKz9Oj/FuV1oePZaJExyZlY
	 h16rhncvgOHGCAkMuBG/JVGJW5Rz1HGJdJyA3F5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3D2BF8067B;
	Mon, 22 Jul 2019 14:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E299F800F5; Mon, 22 Jul 2019 14:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D1BF803F3
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D1BF803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bxxtTfz5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=JJpZPkthDVnJ6TY2XdoAQSEqby2Z3IUOmsq+vRsOEbo=; b=bxxtTfz5nVd3
 +/VEz1ID4bsD0o9a8o8tEwAueovWU4wGIAdNUbCwJXoG+DpwHLZbeBFqV4D6xqx3H4AYKIo9zAT9f
 FQMktGBfvtS5CjUpNmYovX07YmBNhUAoLsfN25cWoaxmlzzNn1Z7t8j5wo90j1NiXYGK4AFmFpU2U
 y9kXI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKT-0007dV-QJ; Mon, 22 Jul 2019 12:22:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3392127429FC; Mon, 22 Jul 2019 13:22:09 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
In-Reply-To: <20190710105119.22987-1-codrin.ciubotariu@microchip.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122209.3392127429FC@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:09 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: codecs: ad193x: Use
	regmap_multi_reg_write() when initializing" to the asoc tree
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

   ASoC: codecs: ad193x: Use regmap_multi_reg_write() when initializing

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

From eaba5585944e6d692828bca701c9362f60172b8a Mon Sep 17 00:00:00 2001
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Date: Wed, 10 Jul 2019 13:51:19 +0300
Subject: [PATCH] ASoC: codecs: ad193x: Use regmap_multi_reg_write() when
 initializing

Using regmap_multi_reg_write() when we set the default values for our
registers makes the code smaller and easier to read.

Suggested-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20190710105119.22987-1-codrin.ciubotariu@microchip.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ad193x.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index 80dab5df9633..fb04c9379b71 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -413,15 +413,10 @@ static struct snd_soc_dai_driver ad193x_no_adc_dai = {
 	.ops = &ad193x_dai_ops,
 };
 
-struct ad193x_reg_default {
-	unsigned int reg;
-	unsigned int val;
-};
-
 /* codec register values to set after reset */
 static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
 {
-	const struct ad193x_reg_default reg_init[] = {
+	const struct reg_sequence reg_init[] = {
 		{  0, 0x99 },	/* PLL_CLK_CTRL0: pll input: mclki/xi 12.288Mhz */
 		{  1, 0x04 },	/* PLL_CLK_CTRL1: no on-chip Vref */
 		{  2, 0x40 },	/* DAC_CTRL0: TDM mode */
@@ -437,21 +432,17 @@ static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
 		{ 12, 0x00 },	/* DAC_L4_VOL: no attenuation */
 		{ 13, 0x00 },	/* DAC_R4_VOL: no attenuation */
 	};
-	const struct ad193x_reg_default reg_adc_init[] = {
+	const struct reg_sequence reg_adc_init[] = {
 		{ 14, 0x03 },	/* ADC_CTRL0: high-pass filter enable */
 		{ 15, 0x43 },	/* ADC_CTRL1: sata delay=1, adc aux mode */
 		{ 16, 0x00 },	/* ADC_CTRL2: reset */
 	};
-	int i;
 
-	for (i = 0; i < ARRAY_SIZE(reg_init); i++)
-		regmap_write(ad193x->regmap, reg_init[i].reg, reg_init[i].val);
+	regmap_multi_reg_write(ad193x->regmap, reg_init, ARRAY_SIZE(reg_init));
 
 	if (ad193x_has_adc(ad193x)) {
-		for (i = 0; i < ARRAY_SIZE(reg_adc_init); i++) {
-			regmap_write(ad193x->regmap, reg_adc_init[i].reg,
-				     reg_adc_init[i].val);
-		}
+		regmap_multi_reg_write(ad193x->regmap, reg_adc_init,
+				       ARRAY_SIZE(reg_adc_init));
 	}
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
