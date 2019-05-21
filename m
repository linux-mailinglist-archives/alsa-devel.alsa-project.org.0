Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11E25977
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 22:51:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7AD815F2;
	Tue, 21 May 2019 22:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7AD815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558471882;
	bh=bCkLnXaXFI9bubiNZKZzmck1zLU9TUA2JcJ5/gX6r7I=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Kf0QPSHcKJ/vz+V2xlGzdEhqU4k1xR0U6dCrOPZcEAkacIo1Ot7kAi5eAupVwIvq+
	 ZC+tf6KmioHr0j0NK0rWotxZdOtpgrX7mTk0+uaaIr3+T0W0sUKtPs/lrpgFYS7R87
	 j8UO09diNK60QIop3/MO4nVH6b4429BJgZAiYKIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 965A8F8975F;
	Tue, 21 May 2019 22:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13B63F8972A; Tue, 21 May 2019 22:46:20 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 187AFF8972A
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 187AFF8972A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wESFLjIq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=yBoefPM/+aGORt6Hgixp/+uCtlOxgYGxahQmeI0dtAs=; b=wESFLjIqIe0u
 eGA9FHtoZ1KP+sLH7YXjUL9t1g7FTUmxwRds0m6BQYEPCCaX5yucmDqifQbY51ifcZ3irEtj/D322
 jKO3w7qu7+2tdf3Ax0xpKZIAGavbEsPOfU4YSEo2SK+LvaWyJIaHLUPMbycJVKTmABZmoQx3HlZo7
 OKdAc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBRI-0001yk-05; Tue, 21 May 2019 20:32:48 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 280541126D21; Tue, 21 May 2019 21:32:43 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
In-Reply-To: <20190516102641.6574-2-amir73il@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203243.280541126D21@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 21:32:43 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Jan Kara <jack@suse.cz>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 linux-fsdevel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: rename functions that pollute the
	simple_xxx namespace" to the asoc tree
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

   ASoC: rename functions that pollute the simple_xxx namespace

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From b0a821daf0d04e5a8ae99829e24f2fe538f25763 Mon Sep 17 00:00:00 2001
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 16 May 2019 13:26:28 +0300
Subject: [PATCH] ASoC: rename functions that pollute the simple_xxx namespace

include/linux/fs.h defines a bunch of simple fs helpers, (e.g.
simple_rename) and we intend to add an fs helper named simple_remove.

Rename the ASoC driver static functions, so they will not collide with
the upcoming fs helper function name.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/simple-card.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9b568f578bcd..d16e894fce2b 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -607,7 +607,7 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-static int simple_probe(struct platform_device *pdev)
+static int asoc_simple_probe(struct platform_device *pdev)
 {
 	struct asoc_simple_priv *priv;
 	struct device *dev = &pdev->dev;
@@ -705,7 +705,7 @@ static int simple_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int simple_remove(struct platform_device *pdev)
+static int asoc_simple_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
@@ -726,8 +726,8 @@ static struct platform_driver asoc_simple_card = {
 		.pm = &snd_soc_pm_ops,
 		.of_match_table = simple_of_match,
 	},
-	.probe = simple_probe,
-	.remove = simple_remove,
+	.probe = asoc_simple_probe,
+	.remove = asoc_simple_remove,
 };
 
 module_platform_driver(asoc_simple_card);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
