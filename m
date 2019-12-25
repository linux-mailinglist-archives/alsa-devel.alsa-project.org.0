Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFDC12A52E
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 01:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8866D16B0;
	Wed, 25 Dec 2019 01:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8866D16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577232852;
	bh=jFhIC3cf4Gy0NzW3zQSBMIwZBwtoqWwzQ/zqiDVhAeE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SE+xJ8U0xRE0SOdGoA8MPloKuAv8K7dE8ojcDWSuDorGrDz8EqZdpLMMaH0YSxUSC
	 G9+o8DbFq5uyTGgrSkq8Os8JV8QcRhkibEbLccnDxue3AgehHXt7QRpaHOlD9tfEfq
	 d06jL+8dlTWJG3FKQcW9AH50KbnHy9owFFk73bIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B518BF80291;
	Wed, 25 Dec 2019 01:09:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0FCAF80274; Wed, 25 Dec 2019 01:09:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C73FF80136
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 01:08:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C73FF80136
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uc+NypEq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=p26wgisYxxYMSvvPgu9UbmNcMRVE/Th6vTcPV+OsQJw=; b=uc+NypEqzyEH
 a/y3n70VYmrfyw0xoV9fXTRRzr8AdE5JrJgqd/SMmC9nbPVxPJBTE17J3JvfDvBsNMgaBJFMjzT2n
 zRfNWiGYAizT4dCr9lYUqH1hZGNkXG1lnK5jTs3K2oLfBPasmIdvpqC1aJDZrey9KmzG2k9ZuM1s6
 NjyZM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ijuET-0007KY-Rf; Wed, 25 Dec 2019 00:08:57 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5140BD01963; Wed, 25 Dec 2019 00:08:57 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Angus Ainslie (Purism) <angus@akkea.ca>
In-Reply-To: <20191223154712.18581-2-angus@akkea.ca>
Message-Id: <applied-20191223154712.18581-2-angus@akkea.ca>
X-Patchwork-Hint: ignore
Date: Wed, 25 Dec 2019 00:08:57 +0000 (GMT)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, kernel@puri.sm,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: gtm601: add Broadmobi bm818 sound
	profile" to the asoc tree
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

   ASoC: gtm601: add Broadmobi bm818 sound profile

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

From 057a317a8d94136b76a3cc6f7be53ee2b85dc115 Mon Sep 17 00:00:00 2001
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Date: Mon, 23 Dec 2019 07:47:11 -0800
Subject: [PATCH] ASoC: gtm601: add Broadmobi bm818 sound profile

The Broadmobi bm818 uses stereo sound at 48Khz sample rate

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Link: https://lore.kernel.org/r/20191223154712.18581-2-angus@akkea.ca
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/gtm601.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/gtm601.c b/sound/soc/codecs/gtm601.c
index d454294c8d06..7f05ebcb88d1 100644
--- a/sound/soc/codecs/gtm601.c
+++ b/sound/soc/codecs/gtm601.c
@@ -13,7 +13,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/device.h>
+#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/initval.h>
@@ -47,6 +47,24 @@ static struct snd_soc_dai_driver gtm601_dai = {
 	},
 };
 
+static struct snd_soc_dai_driver bm818_dai = {
+	.name = "bm818",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+};
+
 static const struct snd_soc_component_driver soc_component_dev_gtm601 = {
 	.dapm_widgets		= gtm601_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(gtm601_dapm_widgets),
@@ -60,13 +78,19 @@ static const struct snd_soc_component_driver soc_component_dev_gtm601 = {
 
 static int gtm601_platform_probe(struct platform_device *pdev)
 {
+	const struct snd_soc_dai_driver *dai_driver;
+
+	dai_driver = of_device_get_match_data(&pdev->dev);
+
 	return devm_snd_soc_register_component(&pdev->dev,
-			&soc_component_dev_gtm601, &gtm601_dai, 1);
+			&soc_component_dev_gtm601,
+			(struct snd_soc_dai_driver *)dai_driver, 1);
 }
 
 #if defined(CONFIG_OF)
 static const struct of_device_id gtm601_codec_of_match[] = {
-	{ .compatible = "option,gtm601", },
+	{ .compatible = "option,gtm601", .data = (void *)&gtm601_dai },
+	{ .compatible = "broadmobi,bm818", .data = (void *)&bm818_dai },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gtm601_codec_of_match);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
