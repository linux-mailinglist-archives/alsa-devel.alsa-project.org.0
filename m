Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1891F3803E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA6861692;
	Fri,  7 Jun 2019 00:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA6861692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858750;
	bh=0sn74/xUDx8R/liWGCHswYRmUJz/7lRlJZ3QIu+PDyA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Mc8MhkIkcko8xUxgdgdvlaNAMvw4PYWXZtoiZSlYnxi8z/awC9WzgGIKi6x/LbWU+
	 lSpja2Pk1vLnF/0fjhcvgFXiA0TTL1evOwo+E9/ZeP8VaeMIK2EhoEm86Ry/sQjDNO
	 L/wyS+Gsrn6qZZnz8isQtVV+K0bsjhy6YlsJ9u2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A21F8988C;
	Thu,  6 Jun 2019 23:29:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBFDAF8982E; Thu,  6 Jun 2019 23:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 900E7F89785
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 900E7F89785
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="l66Q6vPb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mp9GUMZMmc5SfyVqhsJrV92DxsqQGtmTfBB+PZd22uA=; b=l66Q6vPbhY1r
 bDgAAiVD+0fEAgPWN8fxUcdK9HQYKveDIk/AgVGhoOYRHcH6Wso/QZOIcscGWV+KykWDDL84cEnww
 cKJK+iPX3KBmDJV00nHALjsQSKtrLD+820PXwe0dNPUcoEo1p1NYDw4iiF33mf3zxO7IasDpI9eW8
 4KPCU=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzu0-0007ML-8t; Thu, 06 Jun 2019 21:26:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C0753440046; Thu,  6 Jun 2019 22:26:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tvd3gy5n.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212627.C0753440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: meson: axg-card: use modern dai_link
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

   ASoC: meson: axg-card: use modern dai_link style

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

From c84836d7f6509141d5be31cc7a1028228fe0545a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:16:32 +0900
Subject: [PATCH] ASoC: meson: axg-card: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-card.c | 57 ++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index db0a7fc18928..fb03258d00ae 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -115,7 +115,7 @@ static void axg_card_clean_references(struct axg_card *priv)
 
 	if (card->dai_link) {
 		for_each_card_prelinks(card, i, link) {
-			of_node_put(link->cpu_of_node);
+			of_node_put(link->cpus->of_node);
 			for_each_link_codecs(link, j, codec)
 				of_node_put(codec->of_node);
 		}
@@ -254,6 +254,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	struct axg_card *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *pad = &card->dai_link[*index];
 	struct snd_soc_dai_link *lb;
+	struct snd_soc_dai_link_component *dlc;
 	int ret;
 
 	/* extend links */
@@ -267,11 +268,20 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	if (!lb->name)
 		return -ENOMEM;
 
+	dlc = devm_kzalloc(card->dev, 2 * sizeof(*dlc), GFP_KERNEL);
+	if (!dlc)
+		return -ENOMEM;
+
+	lb->cpus = &dlc[0];
+	lb->codecs = &dlc[1];
+	lb->num_cpus = 1;
+	lb->num_codecs = 1;
+
 	lb->stream_name = lb->name;
-	lb->cpu_of_node = pad->cpu_of_node;
-	lb->cpu_dai_name = "TDM Loopback";
-	lb->codec_name = "snd-soc-dummy";
-	lb->codec_dai_name = "snd-soc-dummy-dai";
+	lb->cpus->of_node = pad->cpus->of_node;
+	lb->cpus->dai_name = "TDM Loopback";
+	lb->codecs->name = "snd-soc-dummy";
+	lb->codecs->dai_name = "snd-soc-dummy-dai";
 	lb->dpcm_capture = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
@@ -284,7 +294,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	 * axg_card_clean_references() will iterate over this link,
 	 * make sure the node count is balanced
 	 */
-	of_node_get(lb->cpu_of_node);
+	of_node_get(lb->cpus->of_node);
 
 	/* Let add_links continue where it should */
 	*index += 1;
@@ -426,7 +436,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 	/* Setup tdm link */
 	link->ops = &axg_card_tdm_be_ops;
 	link->init = axg_card_tdm_dai_init;
-	link->dai_fmt = axg_card_parse_daifmt(node, link->cpu_of_node);
+	link->dai_fmt = axg_card_parse_daifmt(node, link->cpus->of_node);
 
 	of_property_read_u32(node, "mclk-fs", &be->mclk_fs);
 
@@ -499,12 +509,21 @@ static int axg_card_set_fe_link(struct snd_soc_card *card,
 				struct device_node *node,
 				bool is_playback)
 {
+	struct snd_soc_dai_link_component *codec;
+
+	codec = devm_kzalloc(card->dev, sizeof(*codec), GFP_KERNEL);
+	if (!codec)
+		return -ENOMEM;
+
+	link->codecs = codec;
+	link->num_codecs = 1;
+
 	link->dynamic = 1;
 	link->dpcm_merged_format = 1;
 	link->dpcm_merged_chan = 1;
 	link->dpcm_merged_rate = 1;
-	link->codec_dai_name = "snd-soc-dummy-dai";
-	link->codec_name = "snd-soc-dummy";
+	link->codecs->dai_name = "snd-soc-dummy-dai";
+	link->codecs->name = "snd-soc-dummy";
 
 	if (is_playback)
 		link->dpcm_playback = 1;
@@ -538,16 +557,24 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 			     int *index)
 {
 	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
+	struct snd_soc_dai_link_component *cpu;
 	int ret;
 
-	ret = axg_card_parse_dai(card, np, &dai_link->cpu_of_node,
-				 &dai_link->cpu_dai_name);
+	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
+	if (!cpu)
+		return -ENOMEM;
+
+	dai_link->cpus = cpu;
+	dai_link->num_cpus = 1;
+
+	ret = axg_card_parse_dai(card, np, &dai_link->cpus->of_node,
+				 &dai_link->cpus->dai_name);
 	if (ret)
 		return ret;
 
-	if (axg_card_cpu_is_playback_fe(dai_link->cpu_of_node))
+	if (axg_card_cpu_is_playback_fe(dai_link->cpus->of_node))
 		ret = axg_card_set_fe_link(card, dai_link, np, true);
-	else if (axg_card_cpu_is_capture_fe(dai_link->cpu_of_node))
+	else if (axg_card_cpu_is_capture_fe(dai_link->cpus->of_node))
 		ret = axg_card_set_fe_link(card, dai_link, np, false);
 	else
 		ret = axg_card_set_be_link(card, dai_link, np);
@@ -555,9 +582,9 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (axg_card_cpu_is_tdm_iface(dai_link->cpu_of_node))
+	if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
 		ret = axg_card_parse_tdm(card, np, index);
-	else if (axg_card_cpu_is_codec(dai_link->cpu_of_node))
+	else if (axg_card_cpu_is_codec(dai_link->cpus->of_node))
 		dai_link->params = &codec_params;
 
 	return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
