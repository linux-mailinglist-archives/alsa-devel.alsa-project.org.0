Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DECEE38035
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736FF1697;
	Fri,  7 Jun 2019 00:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736FF1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858629;
	bh=GJLXw9N+EWrYWAO796p532CITmPFv7Tf3ZKlPP9Vqnc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HQtaUyzR1pa6/GcqqT0LgdxJrUpGrJVxJidOXVNdy1iNGeEgCOBtflSevPmelEk9D
	 sERR7vnJZ1+pwKY/tGd+YBsMM6H1nGv3fFyluDJAssR1xgof++ocJWp0DG5RHus9Lr
	 xz+7Ts+GCB5EfDC2e8RRK3PfuUJstl1INzcAgRgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 282AFF897F0;
	Thu,  6 Jun 2019 23:29:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2EDCF8973A; Thu,  6 Jun 2019 23:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29BD0F89771
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29BD0F89771
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZZkt9EfR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=X27Hlh5QJs3OPwRyz8CfUgdOzL+euTTxvy0hFOVeV34=; b=ZZkt9EfROu6h
 yyx8JsYu0JmrU4Jw1efxJMw9GU05G/zfVBTPhOgqX3N0Edj62786FgpN9TLMlj9desRLP0oKpFkiX
 7B7GfTU3o52fI1zgIc0km1e/bG01o5CHY/jetELh5f/ipfThGgqlEJxG+g1QTcKL8JoMHS6F4Ux04
 FoTmU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztx-0007Lx-V8; Thu, 06 Jun 2019 21:26:26 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 82B3E440046; Thu,  6 Jun 2019 22:26:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o93bgy4w.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212625.82B3E440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:25 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: qcom: common: use modern dai_link
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

   ASoC: qcom: common: use modern dai_link style

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

From 1e36ea360ab98e9c20329a3d9364705d1347e411 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:16:58 +0900
Subject: [PATCH] ASoC: qcom: common: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/common.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 5661025e8cec..c7a878507220 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -14,6 +14,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	struct device *dev = card->dev;
 	struct snd_soc_dai_link *link;
 	struct of_phandle_args args;
+	struct snd_soc_dai_link_component *dlc;
 	int ret, num_links;
 
 	ret = snd_soc_of_parse_card_name(card, "model");
@@ -40,6 +41,17 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 	card->num_links = num_links;
 	link = card->dai_link;
+
+	dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
+	if (!dlc)
+		return -ENOMEM;
+
+	link->cpus	= &dlc[0];
+	link->platforms	= &dlc[1];
+
+	link->num_cpus		= 1;
+	link->num_platforms	= 1;
+
 	for_each_child_of_node(dev->of_node, np) {
 		cpu = of_get_child_by_name(np, "cpu");
 		platform = of_get_child_by_name(np, "platform");
@@ -57,20 +69,20 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			dev_err(card->dev, "error getting cpu phandle\n");
 			goto err;
 		}
-		link->cpu_of_node = args.np;
+		link->cpus->of_node = args.np;
 		link->id = args.args[0];
 
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpu_dai_name);
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
 		if (ret) {
 			dev_err(card->dev, "error getting cpu dai name\n");
 			goto err;
 		}
 
 		if (codec && platform) {
-			link->platform_of_node = of_parse_phandle(platform,
+			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
 					0);
-			if (!link->platform_of_node) {
+			if (!link->platforms->of_node) {
 				dev_err(card->dev, "platform dai not found\n");
 				ret = -EINVAL;
 				goto err;
@@ -84,9 +96,16 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			link->no_pcm = 1;
 			link->ignore_pmdown_time = 1;
 		} else {
-			link->platform_of_node = link->cpu_of_node;
-			link->codec_dai_name = "snd-soc-dummy-dai";
-			link->codec_name = "snd-soc-dummy";
+			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
+			if (!dlc)
+				return -ENOMEM;
+
+			link->codecs	 = dlc;
+			link->num_codecs = 1;
+
+			link->platforms->of_node = link->cpus->of_node;
+			link->codecs->dai_name = "snd-soc-dummy-dai";
+			link->codecs->name = "snd-soc-dummy";
 			link->dynamic = 1;
 		}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
