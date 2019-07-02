Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2D95D02A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 15:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3671484A;
	Tue,  2 Jul 2019 15:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3671484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562072916;
	bh=yIg5CBIcacP9FQOEkg+QTSRUnKJ1zGr/kWwXv3drPVQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=P+Y1FNXFwEqMilafUpTWNUUUpMyUe8eTHMazQZFBd90qfZ26eF7J2wvdg2gJFFjQG
	 p6W8POUc33f1EiAx3w6WwsORNXYNvDyNwSB5A19oDxJt5STUItIvg6HlO/rmDU7hCm
	 BnYIyK4SeSL/HjG/cIClN5HEjjFBPz3CKi3DyR4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7DDCF8011D;
	Tue,  2 Jul 2019 15:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D04DAF800E4; Tue,  2 Jul 2019 15:04:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D618FF800C9
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 15:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D618FF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WhK0n/Cf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=K2DrXKYbD2aVaN9oYwR8bkApTlGZfkPXG3WCxRIJ//Q=; b=WhK0n/CfFJuK
 /5m+PfoMKw5p1JrEt42Xzi1AKsm4mKay3TFZJxl7mMCvzzkphapHhPubof5vusfeYwdO3EY0ugixz
 uc7nU3za807yUXRb/STDu8cgM0fShchb7QrVfAYFDdKiUGzPlmWuN8LdSbujRaxLMkwW7a7pKVycD
 cxpAA=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hiISf-0002NH-2N; Tue, 02 Jul 2019 13:04:41 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 57C8244004B; Tue,  2 Jul 2019 14:04:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9wqs68q.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190702130440.57C8244004B@finisterre.sirena.org.uk>
Date: Tue,  2 Jul 2019 14:04:40 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rt5682: use
	devm_snd_soc_register_component()" to the asoc tree
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

   ASoC: rt5682: use devm_snd_soc_register_component()

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

From 61c8a7d6ff11a31fc4ea47667c5f33119be7bcd3 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 13:09:28 +0900
Subject: [PATCH] ASoC: rt5682: use devm_snd_soc_register_component()

We have devm_xxx version of snd_soc_register_component,
let's use it.

This patch also removes related empty functions

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5682.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 78409dd11488..1ef470700ed5 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2662,15 +2662,9 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 
 	}
 
-	return snd_soc_register_component(&i2c->dev, &soc_component_dev_rt5682,
-			rt5682_dai, ARRAY_SIZE(rt5682_dai));
-}
-
-static int rt5682_i2c_remove(struct i2c_client *i2c)
-{
-	snd_soc_unregister_component(&i2c->dev);
-
-	return 0;
+	return devm_snd_soc_register_component(&i2c->dev,
+					&soc_component_dev_rt5682,
+					rt5682_dai, ARRAY_SIZE(rt5682_dai));
 }
 
 static void rt5682_i2c_shutdown(struct i2c_client *client)
@@ -2703,7 +2697,6 @@ static struct i2c_driver rt5682_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(rt5682_acpi_match),
 	},
 	.probe = rt5682_i2c_probe,
-	.remove = rt5682_i2c_remove,
 	.shutdown = rt5682_i2c_shutdown,
 	.id_table = rt5682_i2c_id,
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
