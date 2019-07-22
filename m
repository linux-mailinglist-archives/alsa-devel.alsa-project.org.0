Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 405876FFB3
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:32:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C72A31771;
	Mon, 22 Jul 2019 14:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C72A31771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563798769;
	bh=kzfORarU7a70ctyEOqd5VkhloNe9PkYivyTXHtSSfI0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bs1kAoMwviJulGrIH0MwJpWTldF387cBh0sQH4j0HZb18tvq0x3Mn209ixNhvGsUz
	 zUWsxI8lz/RW2UN4uVXbjA1p3AsjMd7ynTMkSqOLvEsydM+fYAD69IgVdiaqD7FiNx
	 1NiqDuFFMk8baZ/xm5/4VXMx0ex3MYxGSYLzfsCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21B05F8063A;
	Mon, 22 Jul 2019 14:22:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A328F80482; Mon, 22 Jul 2019 14:22:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0D85F803D1
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D85F803D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mzGDl9CL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=7M7lfxWMFFVq8j0P/G4KjJPLxGJ0Xmx4Exm43dS/2gQ=; b=mzGDl9CLEFH+
 xj8Kc54ODYAuIM97N1LZlwA7PAiqB1VWeNZoD2+/R8MufkpBoEF7KV0A0G+GTff6Kg90+FLXank9D
 LkLhQVzhIzlDSfG+nKTXhqlmVF2EAQMbowy8IjBINdHFl+ZwvvqAiiUGh9+HDk9VMKod3WpffgWX5
 BpzqA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKR-0007cO-G3; Mon, 22 Jul 2019 12:22:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EEFF22742C38; Mon, 22 Jul 2019 13:22:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: fengchunguo <chunguo.feng@amlogic.com>
In-Reply-To: <20190715095556.1614-1-chunguo.feng@amlogic.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122206.EEFF22742C38@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:06 +0100 (BST)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 RyanS.Lee@maximintegrated.com, grundler@chromium.org, bleung@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, chunguo.feng@amlogic.com
Subject: [alsa-devel] Applied "ASoC: max98383: fix i2c probe failure" to the
	asoc tree
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

   ASoC: max98383: fix i2c probe failure

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

From 1eac7bb88ae5a4c45283de1dc1f93e9da9278a7f Mon Sep 17 00:00:00 2001
From: fengchunguo <chunguo.feng@amlogic.com>
Date: Mon, 15 Jul 2019 17:55:56 +0800
Subject: [PATCH] ASoC: max98383: fix i2c probe failure

Added reset_gpio configuration for i2c probe successfully.
If not,i2c address can't be found rightly.

Error information:
max98373 3-0031: Failed to read: 0x21FF

Fixed:
[3.761299@3] max98373 3-0031: MAX98373 revisionID: 0x43
[3.828911@3] asoc-aml-card auge_sound: max98373-aif1 <-> TDM-B mapping ok

Signed-off-by: fengchunguo <chunguo.feng@amlogic.com>
Link: https://lore.kernel.org/r/20190715095556.1614-1-chunguo.feng@amlogic.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98373.c | 34 ++++++++++++++++++++++++++++++----
 sound/soc/codecs/max98373.h |  1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 528695cd6a1c..9a1eb7222357 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -12,6 +12,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <linux/gpio.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98373.h"
@@ -895,6 +896,17 @@ static void max98373_slot_config(struct i2c_client *i2c,
 	else
 		max98373->i_slot = 1;
 
+	max98373->reset_gpio = of_get_named_gpio(dev->of_node,
+						"maxim,reset-gpio", 0);
+	if (!gpio_is_valid(max98373->reset_gpio)) {
+		dev_err(dev, "Looking up %s property in node %s failed %d\n",
+			"maxim,reset-gpio", dev->of_node->full_name,
+			max98373->reset_gpio);
+	} else {
+		dev_dbg(dev, "maxim,reset-gpio=%d",
+			max98373->reset_gpio);
+	}
+
 	if (!device_property_read_u32(dev, "maxim,spkfb-slot-no", &value))
 		max98373->spkfb_slot = value & 0xF;
 	else
@@ -923,7 +935,6 @@ static int max98373_i2c_probe(struct i2c_client *i2c,
 	else
 		max98373->interleave_mode = false;
 
-
 	/* regmap initialization */
 	max98373->regmap
 		= devm_regmap_init_i2c(i2c, &max98373_regmap);
@@ -934,6 +945,24 @@ static int max98373_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	/* voltage/current slot & gpio configuration */
+	max98373_slot_config(i2c, max98373);
+
+	/* Power on device */
+	if (gpio_is_valid(max98373->reset_gpio)) {
+		ret = gpio_request(max98373->reset_gpio, "MAX98373_RESET");
+		if (ret) {
+			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
+				__func__, max98373->reset_gpio);
+			gpio_free(max98373->reset_gpio);
+			return -EINVAL;
+		}
+		gpio_direction_output(max98373->reset_gpio, 0);
+		msleep(50);
+		gpio_direction_output(max98373->reset_gpio, 1);
+		msleep(20);
+	}
+
 	/* Check Revision ID */
 	ret = regmap_read(max98373->regmap,
 		MAX98373_R21FF_REV_ID, &reg);
@@ -944,9 +973,6 @@ static int max98373_i2c_probe(struct i2c_client *i2c,
 	}
 	dev_info(&i2c->dev, "MAX98373 revisionID: 0x%02X\n", reg);
 
-	/* voltage/current slot configuration */
-	max98373_slot_config(i2c, max98373);
-
 	/* codec registeration */
 	ret = devm_snd_soc_register_component(&i2c->dev, &soc_codec_dev_max98373,
 		max98373_dai, ARRAY_SIZE(max98373_dai));
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
index f6a37aa02f26..533d2053f608 100644
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -203,6 +203,7 @@
 
 struct max98373_priv {
 	struct regmap *regmap;
+	int reset_gpio;
 	unsigned int v_slot;
 	unsigned int i_slot;
 	unsigned int spkfb_slot;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
