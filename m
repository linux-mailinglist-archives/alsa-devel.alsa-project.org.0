Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810038017
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:57:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70151690;
	Thu,  6 Jun 2019 23:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70151690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858267;
	bh=NP7NbZy6VfA+56EwUCKfXitPzUDEzQyW2We4Aj+aKBg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LkFNYL0CkOuGli3z59rB1BIo05FYe5llD9tkpu13Ox1YAchLKAaU7haRRt9/AfBSb
	 1Z+ra47aPagH85hUokPC0uIaRcH2NGpE2k2Q7DLWRgbeVYPKpRnRzhetKedEiEVf35
	 LaEuUQf2gukZXiYOyOHQgByl57kmHYODWbu9R3Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9209F89862;
	Thu,  6 Jun 2019 23:28:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5782F89764; Thu,  6 Jun 2019 23:27:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77262F89769
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77262F89769
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="hmFz9k2C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=TvX6enaPPDb+qXTRorQElUC1+V9EdpdUnWJwXX3YZpE=; b=hmFz9k2C1cOe
 ZVwj/eHlsbJhKzmnSOy9DhJdtrtR5M0GE5GVjxTGSQ7UxYkrf0LgfP7xpY+AtjgR6f7tljF2bUT3h
 jFg/3r9PB/8GmP7m4N/Qk9NdvWHWLHhWYzJTQ52tfM5+lPnpGCc4jdnMJF/7ZN8Om1OV4pV6FDMQd
 CMOM0=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztt-0007L9-8d; Thu, 06 Jun 2019 21:26:21 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B7354440046; Thu,  6 Jun 2019 22:26:20 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blzbgy2n.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212620.B7354440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:20 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sunxi: sun4i-codec: use modern dai_link
	style" to the asoc tree
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

   ASoC: sunxi: sun4i-codec: use modern dai_link style

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

From 950d10e879d4a263ca10ab1ff9657a258208e7b9 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:18:19 +0900
Subject: [PATCH] ASoC: sunxi: sun4i-codec: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 28d2f7713f8d..161444fe4518 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1305,15 +1305,25 @@ static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
 {
 	struct snd_soc_dai_link *link = devm_kzalloc(dev, sizeof(*link),
 						     GFP_KERNEL);
-	if (!link)
+	struct snd_soc_dai_link_component *dlc = devm_kzalloc(dev,
+						3 * sizeof(*dlc), GFP_KERNEL);
+	if (!link || !dlc)
 		return NULL;
 
+	link->cpus	= &dlc[0];
+	link->codecs	= &dlc[1];
+	link->platforms	= &dlc[2];
+
+	link->num_cpus		= 1;
+	link->num_codecs	= 1;
+	link->num_platforms	= 1;
+
 	link->name		= "cdc";
 	link->stream_name	= "CDC PCM";
-	link->codec_dai_name	= "Codec";
-	link->cpu_dai_name	= dev_name(dev);
-	link->codec_name	= dev_name(dev);
-	link->platform_name	= dev_name(dev);
+	link->codecs->dai_name	= "Codec";
+	link->cpus->dai_name	= dev_name(dev);
+	link->codecs->name	= dev_name(dev);
+	link->platforms->name	= dev_name(dev);
 	link->dai_fmt		= SND_SOC_DAIFMT_I2S;
 
 	*num_links = 1;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
