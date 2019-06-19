Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F15A74B81F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CDC016A0;
	Wed, 19 Jun 2019 14:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CDC016A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560947117;
	bh=rk1wwfOUdow83feZSyPeh6hNRNl2J8E6AORahn2NeQE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fi451L93Qt5A20UVuaxMcFA4zv2Uh0FDX1CKA4HxXcc6NMyE1thCugFxLx5K3lvuw
	 lIQ1x7uwCL8c/NB5PHv0DjmbK/x8+AMn43EgAaVyuDeDH8IREt3jBfV9Ql8jmhGR2H
	 Wrciq0w4qqURPy4cxvgn4g+SN5ErWhxRcrX/I8Vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E0AEF8978C;
	Wed, 19 Jun 2019 14:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36E48F89763; Wed, 19 Jun 2019 14:12:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D35FDF89735
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D35FDF89735
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZDZ/3Oov"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=bq8mwcWPSVgGJnhW8Eo1tkuOev9GLbxQAdpneTWpVzg=; b=ZDZ/3OovGgzX
 EACKkYhLUpqpHtLPBdte6A2lBm4bTg5a94tafVV8Az7ZJTtDJo84wkTR1BAtvfwkWNp/m/Qeekcqg
 I79+R0zPu36qetiGIr2zn2NuP7aDlU/IZq7kuIMiGDYH9jOjKb4LbfwrHqL0nYSuvScokqn9Uu/p3
 6fJzk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRY-00079J-Vf; Wed, 19 Jun 2019 12:12:01 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8B1A3440046; Wed, 19 Jun 2019 13:12:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgs6tlvs.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121200.8B1A3440046@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:00 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: tegra: tegra_sgtl5000: don't select
	unnecessary Platform" to the asoc tree
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

   ASoC: tegra: tegra_sgtl5000: don't select unnecessary Platform

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

From cee1cf3f9f9ed7b5fecfcd194cbb7e3718d8da5f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:18:48 +0900
Subject: [PATCH] ASoC: tegra: tegra_sgtl5000: don't select unnecessary
 Platform

ALSA SoC is now supporting "no Platform". Sound card doesn't need to
select "CPU component" as "Platform" anymore if it doesn't need
special Platform.
This patch removes such settings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra_sgtl5000.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index c5d45a6147bd..2a9e1ceaa574 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -94,8 +94,7 @@ static const struct snd_soc_dapm_widget tegra_sgtl5000_dapm_widgets[] = {
 
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")));
 
 static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 	.name = "sgtl5000",
@@ -157,8 +156,6 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
 		goto err_put_codec_of_node;
 	}
 
-	tegra_sgtl5000_dai.platforms->of_node = tegra_sgtl5000_dai.cpus->of_node;
-
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
 		goto err_put_cpu_of_node;
@@ -177,7 +174,6 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
 err_put_cpu_of_node:
 	of_node_put(tegra_sgtl5000_dai.cpus->of_node);
 	tegra_sgtl5000_dai.cpus->of_node = NULL;
-	tegra_sgtl5000_dai.platforms->of_node = NULL;
 err_put_codec_of_node:
 	of_node_put(tegra_sgtl5000_dai.codecs->of_node);
 	tegra_sgtl5000_dai.codecs->of_node = NULL;
@@ -197,7 +193,6 @@ static int tegra_sgtl5000_driver_remove(struct platform_device *pdev)
 
 	of_node_put(tegra_sgtl5000_dai.cpus->of_node);
 	tegra_sgtl5000_dai.cpus->of_node = NULL;
-	tegra_sgtl5000_dai.platforms->of_node = NULL;
 	of_node_put(tegra_sgtl5000_dai.codecs->of_node);
 	tegra_sgtl5000_dai.codecs->of_node = NULL;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
