Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876BCE29C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 15:05:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B949F1657;
	Mon,  7 Oct 2019 15:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B949F1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570453501;
	bh=wJ9bMjQS1886aIPFkQJa/7432Q904aDK52UUIkloOGQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HIJelW9NiiknO3h719BdTVklBA/r8tDCWh9JOh+9p5i8mvoo7JCUUthEn40g+pJGE
	 4t4tTbRlRTQKfqgLnGx0f84HMjPIwKTh941kMr+rRV185zdoprRKJXUYo9NKX2Grnb
	 ikVeOjWbnq6vR4i142qWvJlm64zYd+vPVfvtD2bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E353EF80137;
	Mon,  7 Oct 2019 15:03:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACAE7F80308; Mon,  7 Oct 2019 15:03:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CE96F80137
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 15:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE96F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OgjLSj6W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qq8ZMRWiz8nkAQzcMQF3gjrXhlaP3cAYvdl4PKw/Bgw=; b=OgjLSj6WMEoj
 SUQ9glLy16FT/oZ5dgcloEQ4VrEAbx3BtvFOG+f9WZlz2DEXQxUK2fKsmn3aoeTaKeSwhT+aQclDP
 k2R4t5wc76GF5StvwGfSFfQzchw9iMtdFLuO7ThYokeP2on3Le/KdT6BAUJvHe9KIeExKmg/RBI7A
 CI+P8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHSfO-0003Qp-UE; Mon, 07 Oct 2019 13:03:10 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3401B2743178; Mon,  7 Oct 2019 14:03:10 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20191004214334.149976-8-swboyd@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20191007130310.3401B2743178@ypsilon.sirena.org.uk>
Date: Mon,  7 Oct 2019 14:03:10 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [alsa-devel] Applied "ASoC: jz4740: Use of_device_get_match_data()"
	to the asoc tree
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

   ASoC: jz4740: Use of_device_get_match_data()

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

From 67ad656bdd703157154d0db5bf1b35a5a86073b9 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <swboyd@chromium.org>
Date: Fri, 4 Oct 2019 14:43:31 -0700
Subject: [PATCH] ASoC: jz4740: Use of_device_get_match_data()

This probe function is only called if the device is backed by a DT node,
so switch this call to of_device_get_match_data() to reduce code size
and simplify a bit. This also avoids needing to reference a potentially
undefined variable because of_device_get_match_data() doesn't need to
know anything beyond the struct device to find the match table.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <alsa-devel@alsa-project.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20191004214334.149976-8-swboyd@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/jz4740/jz4740-i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 13408de34055..d2dab4d24b87 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -503,9 +503,8 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 	if (!i2s)
 		return -ENOMEM;
 
-	match = of_match_device(jz4740_of_matches, &pdev->dev);
-	if (match)
-		i2s->version = (enum jz47xx_i2s_version)match->data;
+	i2s->version =
+		(enum jz47xx_i2s_version)of_device_get_match_data(&pdev->dev);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	i2s->base = devm_ioremap_resource(&pdev->dev, mem);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
