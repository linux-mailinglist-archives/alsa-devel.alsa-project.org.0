Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2439B1252CF
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:10:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B41201687;
	Wed, 18 Dec 2019 21:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B41201687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576699841;
	bh=6LA0sRA1raTlhg6ZHwMn5CvzAX6HQRrGhKJpu7/GY1Y=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QDQWkTWV1LDIayzxCoxWm/5pIMkgUztVg+or12O3UHYLhs8A9NMZfz0KCiKNuGhk0
	 KWYOdxBTLhQFVngi9PxorQyP8YFSxq8E7cMT/qS5aBKjnYJ7qyIoIxx+iZ5YGDFs9X
	 A4o2bAEv411VWOUAj/4t9aoZKEJ2sK/dbisU5YT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3305EF8028B;
	Wed, 18 Dec 2019 21:05:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C4BFF8028E; Wed, 18 Dec 2019 21:05:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F2BBBF80279
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2BBBF80279
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8369611FB;
 Wed, 18 Dec 2019 12:05:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3F263F67D;
 Wed, 18 Dec 2019 12:05:39 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20191218172420.1199117-4-jbrunet@baylibre.com>
Message-Id: <applied-20191218172420.1199117-4-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: axg-fifo: improve depth
	handling" to the asoc tree
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

   ASoC: meson: axg-fifo: improve depth handling

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 23b89e1d62c75f2c1985449e968886e8a97860c0 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 18 Dec 2019 18:24:19 +0100
Subject: [PATCH] ASoC: meson: axg-fifo: improve depth handling

Let the fifo driver parse the fifo depth from DT. Eventually all DT should
have this property. Until it is actually the case, default to 256 bytes if
the property is missing. 256 bytes is the size of the smallest fifo on the
supported SoCs.

On the supported SoC, fifo A is usually bigger than the other ones.  With
depth known, we can improve the usage of the fifo and adapt the setup of
request threshold.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20191218172420.1199117-4-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-fifo.c  | 19 +++++++++++++++++--
 sound/soc/meson/axg-fifo.h  |  1 +
 sound/soc/meson/axg-frddr.c | 13 ++++---------
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 4365086c9a31..c2742a02d866 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -132,8 +132,7 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	 * - Half the fifo size
 	 * - Half the period size
 	 */
-	threshold = min(period / 2,
-			(unsigned int)AXG_FIFO_MIN_DEPTH / 2);
+	threshold = min(period / 2, fifo->depth / 2);
 
 	/*
 	 * With the threshold in bytes, register value is:
@@ -320,6 +319,7 @@ int axg_fifo_probe(struct platform_device *pdev)
 	const struct axg_fifo_match_data *data;
 	struct axg_fifo *fifo;
 	void __iomem *regs;
+	int ret;
 
 	data = of_device_get_match_data(dev);
 	if (!data) {
@@ -370,6 +370,21 @@ int axg_fifo_probe(struct platform_device *pdev)
 	if (IS_ERR(fifo->field_threshold))
 		return PTR_ERR(fifo->field_threshold);
 
+	ret = of_property_read_u32(dev->of_node, "amlogic,fifo-depth",
+				   &fifo->depth);
+	if (ret) {
+		/* Error out for anything but a missing property */
+		if (ret != -EINVAL)
+			return ret;
+		/*
+		 * If the property is missing, it might be because of an old
+		 * DT. In such case, assume the smallest known fifo depth
+		 */
+		fifo->depth = 256;
+		dev_warn(dev, "fifo depth not found, assume %u bytes\n",
+			 fifo->depth);
+	}
+
 	return devm_snd_soc_register_component(dev, data->component_drv,
 					       data->dai_drv, 1);
 }
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index c442195ba191..521b54e98fd3 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -68,6 +68,7 @@ struct axg_fifo {
 	struct clk *pclk;
 	struct reset_control *arb;
 	struct regmap_field *field_threshold;
+	unsigned int depth;
 	int irq;
 };
 
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index df104303351f..c3ae8ac30745 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -50,7 +50,7 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
-	unsigned int fifo_depth;
+	unsigned int val;
 	int ret;
 
 	/* Enable pclk to access registers and clock the fifo ip */
@@ -61,15 +61,10 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 	/* Apply single buffer mode to the interface */
 	regmap_update_bits(fifo->map, FIFO_CTRL0, CTRL0_FRDDR_PP_MODE, 0);
 
-	/*
-	 * TODO: We could adapt the fifo depth and the fifo threshold
-	 * depending on the expected memory throughput and lantencies
-	 * For now, we'll just use the same values as the vendor kernel
-	 * Depth and threshold are zero based.
-	 */
-	fifo_depth = AXG_FIFO_MIN_CNT - 1;
+	/* Use all fifo depth */
+	val = (fifo->depth / AXG_FIFO_BURST) - 1;
 	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
-			   CTRL1_FRDDR_DEPTH(fifo_depth));
+			   CTRL1_FRDDR_DEPTH(val));
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
