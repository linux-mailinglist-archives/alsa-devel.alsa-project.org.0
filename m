Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D392F9920
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:52:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A7F1612;
	Tue, 12 Nov 2019 19:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A7F1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573584728;
	bh=fDXNTlRmegUJIDX/7tVQaDNyWA/+hE3mhOzp8rzODnw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gSCekZWIAjzJwJANkSp77BDMdeIUk3DGDbJcNm9MjkwGp/+IUf8N/Jm+2kfjSt0Df
	 6L7Pf5lSAjfTvNyrkvO6AfoXkF8ELR3DiVMRKxbV6HGHM7Fm5VRDXqE0nUNLLFZQqr
	 voKjS5IRvIPMfppxr/uNImOKHTxenBWAPwJfHshM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FA88F8065B;
	Tue, 12 Nov 2019 19:47:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7660F8049C; Tue, 12 Nov 2019 19:47:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C21A4F8049C
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 19:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C21A4F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="C/6jw8xB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DLZu+SnZ0F1S8R8cdTZUBNxuzXmjuLQC8IHSkapzFTo=; b=C/6jw8xB8bnc
 MBWuNI4zv3mvYWyoy0qATG1MSkDSdH1hzip0Uzbvt26ZJ+3jwB0dk/fKy68lbY0jlF4f+xReKIyqZ
 VPQQ0KzUQ37yTTU76fzrZ9/cly2ViePqn9kO167Wd5qI9bddutuklYZp5V+v+UGhJqB9J//pEqRDF
 EPQ/Y=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUbC5-000054-2i; Tue, 12 Nov 2019 18:47:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7C0AB274299F; Tue, 12 Nov 2019 18:47:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgn1hkxg.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112184712.7C0AB274299F@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 18:47:12 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge
	snd_soc_unregister_dai() and soc_del_dai()" to the asoc tree
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

   ASoC: soc-core: merge snd_soc_unregister_dai() and soc_del_dai()

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

From ffdbca0be6c78ea32b9243eea976270441210f2f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 6 Nov 2019 10:07:23 +0900
Subject: [PATCH] ASoC: soc-core: merge snd_soc_unregister_dai() and
 soc_del_dai()

We don't need to separete snd_soc_unregister_dai() and
soc_del_dai() anymore. Let's merge these

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87sgn1hkxg.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b2544c7ff0f4..01a8fb28b48f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2511,11 +2511,12 @@ static inline char *fmt_multiple_name(struct device *dev,
 	return devm_kstrdup(dev, dai_drv->name, GFP_KERNEL);
 }
 
-static void soc_del_dai(struct snd_soc_dai *dai)
+void snd_soc_unregister_dai(struct snd_soc_dai *dai)
 {
 	dev_dbg(dai->dev, "ASoC: Unregistered DAI '%s'\n", dai->name);
 	list_del(&dai->list);
 }
+EXPORT_SYMBOL_GPL(snd_soc_unregister_dai);
 
 /**
  * snd_soc_register_dai - Register a DAI dynamically & create its widgets
@@ -2576,13 +2577,6 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
 	return dai;
 }
-EXPORT_SYMBOL_GPL(snd_soc_register_dai);
-
-void snd_soc_unregister_dai(struct snd_soc_dai *dai)
-{
-	soc_del_dai(dai);
-}
-EXPORT_SYMBOL_GPL(snd_soc_unregister_dai);
 
 /**
  * snd_soc_unregister_dai - Unregister DAIs from the ASoC core
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
