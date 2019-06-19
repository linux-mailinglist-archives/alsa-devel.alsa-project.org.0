Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0204B8E2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:42:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5166A16AF;
	Wed, 19 Jun 2019 14:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5166A16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560948141;
	bh=bl649zOtgP0IbSS6qjP0eoTwvj/XtscL/czO40i8WYU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=prYoBDD90ctb9Ed5y/doIupW8DziidXgbplNqhI9luw87KpsHt2FEmQy15C8F6/aj
	 YzIRMEZ0fGmIR4je6OOy6RZMoogpCP8NMbPtGYiNlnCMHtDVNVqSZJfdNt5HyBSN/o
	 xPreiZfBHcTMqdzIo9vNpnsIBfzF3joext0nj0Qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C31DF89822;
	Wed, 19 Jun 2019 14:13:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 372B8F89781; Wed, 19 Jun 2019 14:12:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4320EF8974E
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4320EF8974E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xI/U72iS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=abD2jRALg3Z3XxpUGWMu9x9cT76eBMFJWHqvI90e0no=; b=xI/U72iSVeU8
 gIRuBKWiU6Wj0sLqamjGNcejwchZeDwWHYWCqlQ0c/+Of5ptiXkRrpGx8aN/2//aqsUfiXT3h9iw/
 9q4O8lff0wtLDYjXtTuYGJmc9O7JDTZErI6wWCknjtC/56I3YsM9JyvSvUbsSltyu97pvmWjTvlQ3
 bh/BQ=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRc-0007Bu-At; Wed, 19 Jun 2019 12:12:04 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B97CF440050; Wed, 19 Jun 2019 13:12:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhmev0mw.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121203.B97CF440050@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:03 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: atmel: atmel_wm8904: don't select
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

   ASoC: atmel: atmel_wm8904: don't select unnecessary Platform

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

From 3609750e9d4ba9db7027866827a0e462fbe86866 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:14:48 +0900
Subject: [PATCH] ASoC: atmel: atmel_wm8904: don't select unnecessary Platform

ALSA SoC is now supporting "no Platform". Sound card doesn't need to
select "CPU component" as "Platform" anymore if it doesn't need
special Platform.
This patch removes such settings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/atmel_wm8904.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index 084788ed328c..df5268939331 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -59,8 +59,7 @@ static const struct snd_soc_ops atmel_asoc_wm8904_ops = {
 
 SND_SOC_DAILINK_DEFS(pcm,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8904-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8904-hifi")));
 
 static struct snd_soc_dai_link atmel_asoc_wm8904_dailink = {
 	.name = "WM8904",
@@ -114,7 +113,6 @@ static int atmel_asoc_wm8904_dt_init(struct platform_device *pdev)
 		return ret;
 	}
 	dailink->cpus->of_node = cpu_np;
-	dailink->platforms->of_node = cpu_np;
 	of_node_put(cpu_np);
 
 	codec_np = of_parse_phandle(np, "atmel,audio-codec", 0);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
