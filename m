Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DAC649C5
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 17:36:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B15BD168F;
	Wed, 10 Jul 2019 17:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B15BD168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562772993;
	bh=Ckqu2SB9W3TFSwpOjPvTyMd7eyz0b4AZUiPbaWGuhpI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VE8VflzEceY0AowTVZajPIj93snlHTpqu1zIl7Wz3puj2bSoBQlKrsSGByMZg6yOh
	 XjcoRvtY4148zqxntPxafZw0c8NVOSH3y1pqZOyU6bOv7+t8FdOsftHKlGXKhfHcfy
	 7G+AtNSh8hDKW8TYSS36oLhiV+dIM9YhThQrbTEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0330F802A2;
	Wed, 10 Jul 2019 17:34:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33D10F800E2; Wed, 10 Jul 2019 17:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 781AFF802A0
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 17:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 781AFF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cCD2xF53"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=XL6NtJgyGoIzYEN3aZtJOFgsmtAvVEBqqaJp2gL0E/U=; b=cCD2xF53to9c
 GLp0NSGeVjCgAb9Flp6LPjUDl8EyZV2Q84GXNNMHHrlJqSql9Moxk0vPUWre4pchF1WA1aMutrCeE
 g/3khiJdW7L54qOsHoYNZB5n+XfEBvGR818SJnxBZH7FQmk6geCRrjBg0yR9Oe60EpNNUxT2culz3
 wRQfg=;
Received: from [217.140.106.53] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlEcD-00082n-ES; Wed, 10 Jul 2019 15:34:41 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2A25DD02D7C; Wed, 10 Jul 2019 16:34:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Wen Yang <wen.yang99@zte.com.cn>
In-Reply-To: <1562743509-30496-4-git-send-email-wen.yang99@zte.com.cn>
X-Patchwork-Hint: ignore
Message-Id: <20190710153441.2A25DD02D7C@fitzroy.sirena.org.uk>
Date: Wed, 10 Jul 2019 16:34:41 +0100 (BST)
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 jonathanh@nvidia.com, Mark Brown <broonie@kernel.org>, xue.zhihong@zte.com.cn,
 cheng.shengyu@zte.com.cn
Subject: [alsa-devel] Applied "ASoC: audio-graph-card: fix use-after-free in
	graph_dai_link_of_dpcm()" to the asoc tree
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

   ASoC: audio-graph-card: fix use-after-free in graph_dai_link_of_dpcm()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From aa2e362cb6b3f5ca88093ada01e1a0ace8a517b2 Mon Sep 17 00:00:00 2001
From: Wen Yang <wen.yang99@zte.com.cn>
Date: Wed, 10 Jul 2019 15:25:08 +0800
Subject: [PATCH] ASoC: audio-graph-card: fix use-after-free in
 graph_dai_link_of_dpcm()

After calling of_node_put() on the ports, port, and node variables,
they are still being used, which may result in use-after-free.
Fix this issue by calling of_node_put() after the last usage.

Fixes: dd98fbc558a0 ("ASoC: audio-graph-card: cleanup DAI link loop method - step1")
Link: https://lore.kernel.org/r/1562743509-30496-4-git-send-email-wen.yang99@zte.com.cn
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/audio-graph-card.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index e438011f5e45..bddfcfd7bedf 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -208,10 +208,6 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 	dev_dbg(dev, "link_of DPCM (%pOF)\n", ep);
 
-	of_node_put(ports);
-	of_node_put(port);
-	of_node_put(node);
-
 	if (li->cpu) {
 		int is_single_links = 0;
 
@@ -229,17 +225,17 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 		ret = asoc_simple_parse_cpu(ep, dai_link, &is_single_links);
 		if (ret)
-			return ret;
+			goto out_put_node;
 
 		ret = asoc_simple_parse_clk_cpu(dev, ep, dai_link, dai);
 		if (ret < 0)
-			return ret;
+			goto out_put_node;
 
 		ret = asoc_simple_set_dailink_name(dev, dai_link,
 						   "fe.%s",
 						   cpus->dai_name);
 		if (ret < 0)
-			return ret;
+			goto out_put_node;
 
 		/* card->num_links includes Codec */
 		asoc_simple_canonicalize_cpu(dai_link, is_single_links);
@@ -263,17 +259,17 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 		ret = asoc_simple_parse_codec(ep, dai_link);
 		if (ret < 0)
-			return ret;
+			goto out_put_node;
 
 		ret = asoc_simple_parse_clk_codec(dev, ep, dai_link, dai);
 		if (ret < 0)
-			return ret;
+			goto out_put_node;
 
 		ret = asoc_simple_set_dailink_name(dev, dai_link,
 						   "be.%s",
 						   codecs->dai_name);
 		if (ret < 0)
-			return ret;
+			goto out_put_node;
 
 		/* check "prefix" from top node */
 		snd_soc_of_parse_node_prefix(top, cconf, codecs->of_node,
@@ -293,19 +289,23 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 	ret = asoc_simple_parse_tdm(ep, dai);
 	if (ret)
-		return ret;
+		goto out_put_node;
 
 	ret = asoc_simple_parse_daifmt(dev, cpu_ep, codec_ep,
 				       NULL, &dai_link->dai_fmt);
 	if (ret < 0)
-		return ret;
+		goto out_put_node;
 
 	dai_link->dpcm_playback		= 1;
 	dai_link->dpcm_capture		= 1;
 	dai_link->ops			= &graph_ops;
 	dai_link->init			= asoc_simple_dai_init;
 
-	return 0;
+out_put_node:
+	of_node_put(ports);
+	of_node_put(port);
+	of_node_put(node);
+	return ret;
 }
 
 static int graph_dai_link_of(struct asoc_simple_priv *priv,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
