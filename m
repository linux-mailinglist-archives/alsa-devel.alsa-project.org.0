Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71838098
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 579F316F0;
	Fri,  7 Jun 2019 00:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 579F316F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559860069;
	bh=T2NW5nUZBZe+qIV/dL0gLg+ijrtEacWYc4Ib2pBaSBE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=prNYGyYpt+4TmC7AA+FhGvVbKcwdhhKoXfzVybjVa3G77bq9iU4pXJ223wpTQfg+W
	 C5pxXTm1am0IvlBaZZsVBkOwO4JRC7oSeW/bUhKEE/eqOpkpISQKkxCVErVnLmfgyM
	 UB/jj4jKTJdNYLJKidi7yMHaJ4M8kKZcWg4HgzSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC47EF89934;
	Thu,  6 Jun 2019 23:30:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72111F8984F; Thu,  6 Jun 2019 23:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7108F896F8
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7108F896F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XvAxfwaH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=O81JVzU+jNkAfWE85324BAclKSLt33zfyII7+wZSnJs=; b=XvAxfwaHL+rI
 m2ww1EbbCeebE1dL3uQ8iIJUUr2r6G2xytIHcqDcE7D3ldFIEHMHzbwAsqhwvLfYqQmRJqiYJloJs
 P9U43vB28zK6cT80ZqgpxMpVU+yT69dlgfsdlhbJJNEHIjEnAGXwc76mBys6dNxSu0tAqYRKwOXIw
 L9LyI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuJ-0007Pi-82; Thu, 06 Jun 2019 21:26:47 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C1EA5440046; Thu,  6 Jun 2019 22:26:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e9zjrgc.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212646.C1EA5440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:46 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: omap-hdmi: use modern dai_link
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

   ASoC: ti: omap-hdmi: use modern dai_link style

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

From 3b785a63ee3d2bc9eb6473ca9490d5a268c88c3e Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:13:02 +0900
Subject: [PATCH] ASoC: ti: omap-hdmi: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/omap-hdmi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 673a9eb153b2..11c1440da226 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -321,6 +321,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	struct hdmi_audio_data *ad;
 	struct snd_soc_dai_driver *dai_drv;
 	struct snd_soc_card *card;
+	struct snd_soc_dai_link_component *compnent;
 	int ret;
 
 	if (!ha) {
@@ -371,12 +372,23 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);
 	if (!card->dai_link)
 		return -ENOMEM;
+
+	compnent = devm_kzalloc(dev, 3 * sizeof(*compnent), GFP_KERNEL);
+	if (!compnent)
+		return -ENOMEM;
+	card->dai_link->cpus		= &compnent[0];
+	card->dai_link->num_cpus	= 1;
+	card->dai_link->codecs		= &compnent[1];
+	card->dai_link->num_codecs	= 1;
+	card->dai_link->platforms	= &compnent[2];
+	card->dai_link->num_platforms	= 1;
+
 	card->dai_link->name = card->name;
 	card->dai_link->stream_name = card->name;
-	card->dai_link->cpu_dai_name = dev_name(ad->dssdev);
-	card->dai_link->platform_name = dev_name(ad->dssdev);
-	card->dai_link->codec_name = "snd-soc-dummy";
-	card->dai_link->codec_dai_name = "snd-soc-dummy-dai";
+	card->dai_link->cpus->dai_name = dev_name(ad->dssdev);
+	card->dai_link->platforms->name = dev_name(ad->dssdev);
+	card->dai_link->codecs->name = "snd-soc-dummy";
+	card->dai_link->codecs->dai_name = "snd-soc-dummy-dai";
 	card->num_links = 1;
 	card->dev = dev;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
