Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C316FFA6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EAFB1773;
	Mon, 22 Jul 2019 14:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EAFB1773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563798599;
	bh=bhGBAaEk/AsYz3VTEMXnC5wu6VgwadjeLi1lWcm6OWA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=l/mzPCwpRn/51gh3A65lCH8JcrwbCTmMSTDLNB7m6BkE9a3baHhIHuPibBPRdl2bk
	 hz7XQEHUk2pVFb8pDepLZoFrlps5MiLiVGP1lbgxtH99LsrVd4zINxdhccp3HgKgGN
	 V24R66c+R3FIS+Sb4tdb9xPVZp6oJ4QI5TpObOmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E00FF805DF;
	Mon, 22 Jul 2019 14:22:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79A3DF800F5; Mon, 22 Jul 2019 14:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC53CF800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC53CF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sVDqyC8B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PwE8GhCDe5WA4G95kaz0B0BeEh9jglgXGPJGVNh4A5s=; b=sVDqyC8BR0L7
 1OxviS0ds0tHbgD2vLWkdGCJQIFEVeCYjq8hIxrMNDF43i2swx5U39HVpSPZ4gykeWhTRLMIZhzdA
 Kiio1H+e0hApCXnKuGG5+Qh2Q+I9dq46jaikLWJlJKl2vw0x2tvdZu1atMHHZ3i+cVxQrO4jv7gmC
 7qXIg=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKS-0007cs-IO; Mon, 22 Jul 2019 12:22:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DD56927429FC; Mon, 22 Jul 2019 13:22:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190716032417.19015-1-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122207.DD56927429FC@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:07 +0100 (BST)
Cc: tzungbi@google.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, dgreid@google.com, cychiang@google.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183: make headset codec
	optional" to the asoc tree
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

   ASoC: mediatek: mt8183: make headset codec optional

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

From 2d7df506d176265d97bece4b55faa60ce7926970 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 16 Jul 2019 11:24:17 +0800
Subject: [PATCH] ASoC: mediatek: mt8183: make headset codec optional

Make headset codec optional because some variant machines may not
have an audio jack.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20190716032417.19015-1-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 887c932229d0..4c816c86844b 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -352,8 +352,6 @@ static struct snd_soc_card mt8183_mt6358_ts3a227_max98357_card = {
 	.owner = THIS_MODULE,
 	.dai_link = mt8183_mt6358_ts3a227_max98357_dai_links,
 	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_dai_links),
-	.aux_dev = &mt8183_mt6358_ts3a227_max98357_headset_dev,
-	.num_aux_devs = 1,
 };
 
 static int
@@ -404,10 +402,9 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 	mt8183_mt6358_ts3a227_max98357_headset_dev.codec_of_node =
 		of_parse_phandle(pdev->dev.of_node,
 				 "mediatek,headset-codec", 0);
-	if (!mt8183_mt6358_ts3a227_max98357_headset_dev.codec_of_node) {
-		dev_err(&pdev->dev,
-			"Property 'mediatek,headset-codec' missing/invalid\n");
-		return -EINVAL;
+	if (mt8183_mt6358_ts3a227_max98357_headset_dev.codec_of_node) {
+		card->aux_dev = &mt8183_mt6358_ts3a227_max98357_headset_dev;
+		card->num_aux_devs = 1;
 	}
 
 	default_pins =
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
