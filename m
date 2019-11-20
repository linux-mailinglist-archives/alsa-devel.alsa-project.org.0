Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B79CF1041FA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 18:21:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 604AF172C;
	Wed, 20 Nov 2019 18:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 604AF172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574270486;
	bh=5duKM/aRiRLD17EwT9QH9eTB0cXJIOGfa9pTuvf/dwI=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pH7ZIvlGjVg55qkfnCGvPhJtiFYhJQwngXNhMr2yfX6S7VYXvT5UQZ2eL1wgbwYFw
	 7YdgyubbJS3v0BmTFa06nwXKS9AWg/TxCNzrrqwynYuP8MPx64JOEDTNilJ7CGUOOl
	 7IrZeI0swyKegzBcNR9r6W7ylBsQndoUxcbIk0hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 806F1F8015E;
	Wed, 20 Nov 2019 18:18:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37B9CF8014D; Wed, 20 Nov 2019 18:18:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C63F6F80140
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:18:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63F6F80140
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF7781045;
 Wed, 20 Nov 2019 09:18:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 199333F703;
 Wed, 20 Nov 2019 09:18:05 -0800 (PST)
Date: Wed, 20 Nov 2019 17:18:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20191120131753.6831-3-peter.ujfalusi@ti.com>
Message-Id: <applied-20191120131753.6831-3-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: pcm3168a: Update the RST gpio handling
	to align with documentation" to the asoc tree
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

   ASoC: pcm3168a: Update the RST gpio handling to align with documentation

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 4ec48e7cbe6e70352c802b5cb172b00ebd8af8e0 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Wed, 20 Nov 2019 15:17:53 +0200
Subject: [PATCH] ASoC: pcm3168a: Update the RST gpio handling to align with
 documentation

The RST (reset-gpios) is low active so the driver must handle it
accordingly.

Add comments to explain clearly how the line is used.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20191120131753.6831-3-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index f3475134b519..9711fab296eb 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -707,11 +707,15 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	dev_set_drvdata(dev, pcm3168a);
 
 	/*
-	 * Request the RST gpio line as non exclusive as the same reset line
-	 * might be connected to multiple pcm3168a codec
+	 * Request the reset (connected to RST pin) gpio line as non exclusive
+	 * as the same reset line might be connected to multiple pcm3168a codec
+	 *
+	 * The RST is low active, we want the GPIO line to be high initially, so
+	 * request the initial level to LOW which in practice means DEASSERTED:
+	 * The deasserted level of GPIO_ACTIVE_LOW is HIGH.
 	 */
-	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "rst",
-						GPIOD_OUT_HIGH |
+	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset",
+						GPIOD_OUT_LOW |
 						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	if (IS_ERR(pcm3168a->gpio_rst)) {
 		ret = PTR_ERR(pcm3168a->gpio_rst);
@@ -814,7 +818,13 @@ void pcm3168a_remove(struct device *dev)
 {
 	struct pcm3168a_priv *pcm3168a = dev_get_drvdata(dev);
 
-	gpiod_set_value_cansleep(pcm3168a->gpio_rst, 0);
+	/*
+	 * The RST is low active, we want the GPIO line to be low when the
+	 * driver is removed, so set level to 1 which in practice means
+	 * ASSERTED:
+	 * The asserted level of GPIO_ACTIVE_LOW is LOW.
+	 */
+	gpiod_set_value_cansleep(pcm3168a->gpio_rst, 1);
 	pm_runtime_disable(dev);
 #ifndef CONFIG_PM
 	pcm3168a_disable(dev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
