Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC2610063D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 14:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DEC61684;
	Mon, 18 Nov 2019 14:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DEC61684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574082694;
	bh=4abGlnDIEWP/+racrrOHu1GPqBmhaf9/opkDbRUYD7M=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qW9+wohD33T6oapjm+SUslIpJtQH0OxrepG5xlFMpjkgHO1pw8TGywV296+qEs9nT
	 MGQgHqofXtuP7WOn/4dUfvQOceVampbVNkQUvM6sxUC9+luk9ql3+8fUSBJ6Jxdata
	 ogrNRKSrJXPNZ/0xRrpEo6yXTvjEZj5JtbHFl/lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D35B1F80141;
	Mon, 18 Nov 2019 14:10:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50CB4F8013D; Mon, 18 Nov 2019 14:09:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B33D5F800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 14:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B33D5F800FF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCEB21FB;
 Mon, 18 Nov 2019 05:09:55 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CD443F6C4;
 Mon, 18 Nov 2019 05:09:55 -0800 (PST)
Date: Mon, 18 Nov 2019 13:09:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20191113124734.27984-3-peter.ujfalusi@ti.com>
Message-Id: <applied-20191113124734.27984-3-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: pcm3168a: Add support for optional RST
	gpio handling" to the asoc tree
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

   ASoC: pcm3168a: Add support for optional RST gpio handling

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

From 79f6c108c87b470aacf25fc25a86f48694d03ae8 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Wed, 13 Nov 2019 14:47:34 +0200
Subject: [PATCH] ASoC: pcm3168a: Add support for optional RST gpio handling

In case the RST line is connected to a GPIO line it needs to be pulled high
when the driver probes to be able to use the codec.

Add support also for cases when more than one codec is is controlled by the
same GPIO line by requesting the gpio with GPIOD_FLAGS_BIT_NONEXCLUSIVE.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Link: https://lore.kernel.org/r/20191113124734.27984-3-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 38 +++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 313500ab36df..f3475134b519 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -9,7 +9,9 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
@@ -59,6 +61,7 @@ struct pcm3168a_priv {
 	struct regulator_bulk_data supplies[PCM3168A_NUM_SUPPLIES];
 	struct regmap *regmap;
 	struct clk *scki;
+	struct gpio_desc *gpio_rst;
 	unsigned long sysclk;
 
 	struct pcm3168a_io_params io_params[2];
@@ -643,6 +646,7 @@ static bool pcm3168a_readable_register(struct device *dev, unsigned int reg)
 static bool pcm3168a_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case PCM3168A_RST_SMODE:
 	case PCM3168A_DAC_ZERO:
 	case PCM3168A_ADC_OV:
 		return true;
@@ -702,6 +706,21 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 
 	dev_set_drvdata(dev, pcm3168a);
 
+	/*
+	 * Request the RST gpio line as non exclusive as the same reset line
+	 * might be connected to multiple pcm3168a codec
+	 */
+	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "rst",
+						GPIOD_OUT_HIGH |
+						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(pcm3168a->gpio_rst)) {
+		ret = PTR_ERR(pcm3168a->gpio_rst);
+		if (ret != -EPROBE_DEFER )
+			dev_err(dev, "failed to acquire RST gpio: %d\n", ret);
+
+		return ret;
+	}
+
 	pcm3168a->scki = devm_clk_get(dev, "scki");
 	if (IS_ERR(pcm3168a->scki)) {
 		ret = PTR_ERR(pcm3168a->scki);
@@ -743,10 +762,18 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 		goto err_regulator;
 	}
 
-	ret = pcm3168a_reset(pcm3168a);
-	if (ret) {
-		dev_err(dev, "Failed to reset device: %d\n", ret);
-		goto err_regulator;
+	if (pcm3168a->gpio_rst) {
+		/*
+		 * The device is taken out from reset via GPIO line, wait for
+		 * 3846 SCKI clock cycles for the internal reset de-assertion
+		 */
+		msleep(DIV_ROUND_UP(3846 * 1000, pcm3168a->sysclk));
+	} else {
+		ret = pcm3168a_reset(pcm3168a);
+		if (ret) {
+			dev_err(dev, "Failed to reset device: %d\n", ret);
+			goto err_regulator;
+		}
 	}
 
 	pm_runtime_set_active(dev);
@@ -785,6 +812,9 @@ static void pcm3168a_disable(struct device *dev)
 
 void pcm3168a_remove(struct device *dev)
 {
+	struct pcm3168a_priv *pcm3168a = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(pcm3168a->gpio_rst, 0);
 	pm_runtime_disable(dev);
 #ifndef CONFIG_PM
 	pcm3168a_disable(dev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
