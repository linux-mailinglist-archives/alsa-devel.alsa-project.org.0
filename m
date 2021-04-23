Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455063698B8
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 19:55:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D57CB16EE;
	Fri, 23 Apr 2021 19:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D57CB16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619200530;
	bh=bKn8MNRjXHotc1xL4MpIdJFtFVkVlvyWmGxylaAZpv4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k/FlL9TvUjudUO6Fz4GBA3eP3wDCD9N8hFwfZhduaXrUnFLHo2QNfbGnuntGjAEbz
	 +OlA9tgBXC2Ldq+2FK8TFy48kGtcGWA7ENFrK0iosb8aULNed6vebm4drsx+v6IsOl
	 M8H9Rsg1tnIpNKdjaf32ntNTP4v5P1TqIchUkxrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95C52F80256;
	Fri, 23 Apr 2021 19:54:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDA85F80227; Fri, 23 Apr 2021 19:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7538DF800E3
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 19:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7538DF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UiSfPNQn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E792D6144A;
 Fri, 23 Apr 2021 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619200430;
 bh=bKn8MNRjXHotc1xL4MpIdJFtFVkVlvyWmGxylaAZpv4=;
 h=From:To:Cc:Subject:Date:From;
 b=UiSfPNQn6zWR6UhAC9KdjgvYlsRC+6OvdarD9NXspggqHwj9G6YAPSfGAhCGN3tlQ
 jZBvt/vCFkGNhGKsFkfHlKFXPBcwoQEWwUD/8NNYMFyJN2ee8FhYVKORvzGwxUYFUw
 iGjl6wRfWktpVZG/bdc50fXvjB6vJ/c9qKlhhNwfbXgYnRpHN10X1DPhmDpImcxYVz
 BZEaBV0mw0Whs8IM/UDMaD/7SnlqoyK2wENopZPCCI0x6MTvgKTp/uPUcGnjuHafps
 dLYyZbmdpOkuEFo2EwgavpjXEuNOvtDCNofhKcJ+W79LzmwwN9hCqG8YA9xoSl06BB
 6Wgbs0UNhK7AQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card: Fix breakage on kontron-sl28-var3-ads2
Date: Fri, 23 Apr 2021 18:53:18 +0100
Message-Id: <20210423175318.13990-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=i3vympdNrC2mMc055UiRRDNJY5IeywiQ8rof9eavY7A=;
 m=s2MylM3+pnmwe1TWaE28qR2H85i2SKkbGi3G41MJknk=;
 p=dFZCYdy7l++0op8Nyb0APjfG5V8stTgtmFGTIZOCJGw=;
 g=c4da63476bf007166f337dfe3bef4cb7ac1b0057
X-Patch-Sig: m=pgp; i=broonie@kernel.org; s=0xC3F436CA30F5D8EB;
 b=iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCDCIoACgkQJNaLcl1Uh9CQVAf/X5/
 tU4ZHQi3aGn3z0EAipj7v+8I//fhLXV+UrQex5uFPunnxhyThGrf0+uvYU/6mV6UQdvokhetTqhcR
 lJdKw7T+FXvu9U+evxqWy21aTazETp8yTj8IbTkQbDE1jdahIHwS/Jr0RvfJIuKUfWo03kLz+Otus
 otPst7wQuVRzQ22mYJbc2fy0JUqfl3ggKfvtntZZVufKhGiRbtxpot34ndMU3Idz927qor876tRWU
 C+k9kJZqfQcnokE6uSK6DZuGCVzLeXNkYCbumNXnbAOeeo0dsTNpca9430tLJ+A180sn9IqImws9z
 fXw6HBS7vnSGfi2AYR1DelD9PRNl/8w==
Content-Transfer-Encoding: 8bit
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, "kernelci.org bot" <bot@kernelci.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A KernelCI bisection identified 59c35c44a9cf89 "ASoC: simple-card: add
simple_parse_node()" as causing simple-card to fail to instantiate on
kontron-sl28-var3-ads2 systems.  Since the merge window is expected to
open over the weekend drop that commit and subsequent ones which depend
on it for now in case other systems are affected too.

The boot log showed the error as:

<4>[    9.948821] sysfs: cannot create duplicate filename '/devices/platform/sound/(null)-wm8904-hifi'

(backtrace)

<3>[   10.191982] kobject_add_internal failed for (null)-wm8904-hifi with -EEXIST, don't try to register things with the same name in the same directory.

The dropped commits are:

73371bacf0475a20ab6 "ASoC: audio-graph: tidyup graph_dai_link_of_dpcm()"
434392271afcff350fe "ASoC: simple-card: add simple_link_init()"
59c35c44a9cf89a83a9 "ASoC: simple-card: add simple_parse_node()"

Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/audio-graph-card.c |  30 ++---
 sound/soc/generic/simple-card.c      | 178 ++++++++++++++-------------
 2 files changed, 106 insertions(+), 102 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 0159a4576e9c..2c8a2fcb7922 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -276,19 +276,24 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				  struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
+	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *top = dev->of_node;
 	struct device_node *ep = li->cpu ? cpu_ep : codec_ep;
+	struct device_node *port;
+	struct device_node *ports;
+	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
+	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
 	char dai_name[64];
 	int ret;
 
+	port	= of_get_parent(ep);
+	ports	= of_get_parent(port);
+
 	dev_dbg(dev, "link_of DPCM (%pOF)\n", ep);
 
 	if (li->cpu) {
-		struct snd_soc_card *card = simple_priv_to_card(priv);
-		struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
-
 		/* Codec is dummy */
 
 		/* FE settings */
@@ -297,7 +302,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 		ret = graph_parse_node(priv, cpu_ep, li, 1);
 		if (ret)
-			return ret;
+			goto out_put_node;
 
 		snprintf(dai_name, sizeof(dai_name),
 			 "fe.%pOFP.%s", cpus->of_node, cpus->dai_name);
@@ -314,10 +319,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		if (card->component_chaining && !soc_component_is_pcm(cpus))
 			dai_link->no_pcm = 1;
 	} else {
-		struct snd_soc_codec_conf *cconf = simple_props_to_codec_conf(dai_props, 0);
-		struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
-		struct device_node *port;
-		struct device_node *ports;
+		struct snd_soc_codec_conf *cconf;
 
 		/* CPU is dummy */
 
@@ -325,25 +327,22 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		dai_link->no_pcm		= 1;
 		dai_link->be_hw_params_fixup	= asoc_simple_be_hw_params_fixup;
 
+		cconf	= simple_props_to_codec_conf(dai_props, 0);
+
 		ret = graph_parse_node(priv, codec_ep, li, 0);
 		if (ret < 0)
-			return ret;
+			goto out_put_node;
 
 		snprintf(dai_name, sizeof(dai_name),
 			 "be.%pOFP.%s", codecs->of_node, codecs->dai_name);
 
 		/* check "prefix" from top node */
-		port = of_get_parent(ep);
-		ports = of_get_parent(port);
 		snd_soc_of_parse_node_prefix(top, cconf, codecs->of_node,
 					      "prefix");
 		if (of_node_name_eq(ports, "ports"))
 			snd_soc_of_parse_node_prefix(ports, cconf, codecs->of_node, "prefix");
 		snd_soc_of_parse_node_prefix(port, cconf, codecs->of_node,
 					     "prefix");
-
-		of_node_put(ports);
-		of_node_put(port);
 	}
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
@@ -352,8 +351,11 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
+out_put_node:
 	li->link++;
 
+	of_node_put(ports);
+	of_node_put(port);
 	return ret;
 }
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 6a04632944b8..a1373be4558f 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -93,11 +93,12 @@ static void simple_parse_convert(struct device *dev,
 }
 
 static void simple_parse_mclk_fs(struct device_node *top,
-				 struct device_node *np,
+				 struct device_node *cpu,
+				 struct device_node *codec,
 				 struct simple_dai_props *props,
 				 char *prefix)
 {
-	struct device_node *node = of_get_parent(np);
+	struct device_node *node = of_get_parent(cpu);
 	char prop[128];
 
 	snprintf(prop, sizeof(prop), "%smclk-fs", PREFIX);
@@ -105,79 +106,12 @@ static void simple_parse_mclk_fs(struct device_node *top,
 
 	snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
 	of_property_read_u32(node,	prop, &props->mclk_fs);
-	of_property_read_u32(np,	prop, &props->mclk_fs);
+	of_property_read_u32(cpu,	prop, &props->mclk_fs);
+	of_property_read_u32(codec,	prop, &props->mclk_fs);
 
 	of_node_put(node);
 }
 
-static int simple_parse_node(struct asoc_simple_priv *priv,
-			     struct device_node *np,
-			     struct link_info *li,
-			     char *prefix,
-			     int is_cpu)
-{
-	struct device *dev = simple_priv_to_dev(priv);
-	struct device_node *top = dev->of_node;
-	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
-	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
-	struct snd_soc_dai_link_component *dlc;
-	struct asoc_simple_dai *dai;
-	int ret, single = 0;
-
-	if (is_cpu) {
-		dlc = asoc_link_to_cpu(dai_link, 0);
-		dai = simple_props_to_dai_cpu(dai_props, 0);
-	} else {
-		dlc = asoc_link_to_codec(dai_link, 0);
-		dai = simple_props_to_dai_codec(dai_props, 0);
-	}
-
-	simple_parse_mclk_fs(top, np, dai_props, prefix);
-
-	ret = asoc_simple_parse_dai(np, dlc, &single);
-	if (ret)
-		return ret;
-
-	ret = asoc_simple_parse_clk(dev, np, dai, dlc);
-	if (ret)
-		return ret;
-
-	ret = asoc_simple_parse_tdm(np, dai);
-	if (ret)
-		return ret;
-
-	if (is_cpu) {
-		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
-
-		asoc_simple_canonicalize_cpu(dlc, single);
-		asoc_simple_canonicalize_platform(platforms, dlc);
-	}
-
-	return 0;
-}
-
-static int simple_link_init(struct asoc_simple_priv *priv,
-			    struct device_node *node,
-			    struct device_node *codec,
-			    struct link_info *li,
-			    char *prefix,
-			    char *name)
-{
-	struct device *dev = simple_priv_to_dev(priv);
-	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
-	int ret;
-
-	ret = asoc_simple_parse_daifmt(dev, node, codec,
-				       prefix, &dai_link->dai_fmt);
-	if (ret < 0)
-		return 0;
-
-	dai_link->init			= asoc_simple_dai_init;
-	dai_link->ops			= &simple_ops;
-
-	return asoc_simple_set_dailink_name(dev, dai_link, name);
-}
-
 static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				   struct device_node *np,
 				   struct device_node *codec,
@@ -187,32 +121,50 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
+	struct asoc_simple_dai *dai;
 	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
 	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
+	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
 	struct device_node *top = dev->of_node;
 	struct device_node *node = of_get_parent(np);
 	char *prefix = "";
-	char dai_name[64];
 	int ret;
 
 	dev_dbg(dev, "link_of DPCM (%pOF)\n", np);
 
+	li->link++;
+
 	/* For single DAI link & old style of DT node */
 	if (is_top)
 		prefix = PREFIX;
 
 	if (li->cpu) {
+		int is_single_links = 0;
+
 		/* Codec is dummy */
 
 		/* FE settings */
 		dai_link->dynamic		= 1;
 		dai_link->dpcm_merged_format	= 1;
 
-		ret = simple_parse_node(priv, np, li, prefix, 1);
+		dai = simple_props_to_dai_cpu(dai_props, 0);
+
+		ret = asoc_simple_parse_dai(np, cpus, &is_single_links);
+		if (ret)
+			goto out_put_node;
+
+		ret = asoc_simple_parse_clk(dev, np, dai, cpus);
 		if (ret < 0)
 			goto out_put_node;
 
-		snprintf(dai_name, sizeof(dai_name), "fe.%s", cpus->dai_name);
+		ret = asoc_simple_set_dailink_name(dev, dai_link,
+						   "fe.%s",
+						   cpus->dai_name);
+		if (ret < 0)
+			goto out_put_node;
+
+		asoc_simple_canonicalize_cpu(cpus, is_single_links);
+		asoc_simple_canonicalize_platform(platforms, cpus);
 	} else {
 		struct snd_soc_codec_conf *cconf;
 
@@ -222,13 +174,22 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		dai_link->no_pcm		= 1;
 		dai_link->be_hw_params_fixup	= asoc_simple_be_hw_params_fixup;
 
+		dai	= simple_props_to_dai_codec(dai_props, 0);
 		cconf	= simple_props_to_codec_conf(dai_props, 0);
 
-		ret = simple_parse_node(priv, np, li, prefix, 0);
+		ret = asoc_simple_parse_dai(np, codecs, NULL);
+		if (ret < 0)
+			goto out_put_node;
+
+		ret = asoc_simple_parse_clk(dev, np, dai, codecs);
 		if (ret < 0)
 			goto out_put_node;
 
-		snprintf(dai_name, sizeof(dai_name), "be.%s", codecs->dai_name);
+		ret = asoc_simple_set_dailink_name(dev, dai_link,
+						   "be.%s",
+						   codecs->dai_name);
+		if (ret < 0)
+			goto out_put_node;
 
 		/* check "prefix" from top node */
 		snd_soc_of_parse_node_prefix(top, cconf, codecs->of_node,
@@ -240,14 +201,23 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	}
 
 	simple_parse_convert(dev, np, &dai_props->adata);
+	simple_parse_mclk_fs(top, np, codec, dai_props, prefix);
+
+	ret = asoc_simple_parse_tdm(np, dai);
+	if (ret)
+		goto out_put_node;
+
+	ret = asoc_simple_parse_daifmt(dev, node, codec,
+				       prefix, &dai_link->dai_fmt);
+	if (ret < 0)
+		goto out_put_node;
 
 	snd_soc_dai_link_set_capabilities(dai_link);
 
-	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
+	dai_link->ops			= &simple_ops;
+	dai_link->init			= asoc_simple_dai_init;
 
 out_put_node:
-	li->link++;
-
 	of_node_put(node);
 	return ret;
 }
@@ -260,19 +230,23 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
+	struct asoc_simple_dai *cpu_dai	= simple_props_to_dai_cpu(dai_props, 0);
+	struct asoc_simple_dai *codec_dai = simple_props_to_dai_codec(dai_props, 0);
 	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
 	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
 	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
+	struct device_node *top = dev->of_node;
 	struct device_node *cpu = NULL;
 	struct device_node *node = NULL;
 	struct device_node *plat = NULL;
-	char dai_name[64];
 	char prop[128];
 	char *prefix = "";
-	int ret;
+	int ret, single_cpu = 0;
 
 	cpu  = np;
 	node = of_get_parent(np);
+	li->link++;
 
 	dev_dbg(dev, "link_of (%pOF)\n", node);
 
@@ -283,11 +257,18 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	snprintf(prop, sizeof(prop), "%splat", prefix);
 	plat = of_get_child_by_name(node, prop);
 
-	ret = simple_parse_node(priv, cpu, li, prefix, 1);
+	ret = asoc_simple_parse_daifmt(dev, node, codec,
+				       prefix, &dai_link->dai_fmt);
 	if (ret < 0)
 		goto dai_link_of_err;
 
-	ret = simple_parse_node(priv, codec, li, prefix, 0);
+	simple_parse_mclk_fs(top, cpu, codec, dai_props, prefix);
+
+	ret = asoc_simple_parse_dai(cpu, cpus, &single_cpu);
+	if (ret < 0)
+		goto dai_link_of_err;
+
+	ret = asoc_simple_parse_dai(codec, codecs, NULL);
 	if (ret < 0)
 		goto dai_link_of_err;
 
@@ -295,18 +276,39 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
-	snprintf(dai_name, sizeof(dai_name),
-		 "%s-%s", cpus->dai_name, codecs->dai_name);
-	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
+	ret = asoc_simple_parse_tdm(cpu, cpu_dai);
+	if (ret < 0)
+		goto dai_link_of_err;
+
+	ret = asoc_simple_parse_tdm(codec, codec_dai);
 	if (ret < 0)
 		goto dai_link_of_err;
 
+	ret = asoc_simple_parse_clk(dev, cpu, cpu_dai, cpus);
+	if (ret < 0)
+		goto dai_link_of_err;
+
+	ret = asoc_simple_parse_clk(dev, codec, codec_dai, codecs);
+	if (ret < 0)
+		goto dai_link_of_err;
+
+	ret = asoc_simple_set_dailink_name(dev, dai_link,
+					   "%s-%s",
+					   cpus->dai_name,
+					   codecs->dai_name);
+	if (ret < 0)
+		goto dai_link_of_err;
+
+	dai_link->ops = &simple_ops;
+	dai_link->init = asoc_simple_dai_init;
+
+	asoc_simple_canonicalize_cpu(cpus, single_cpu);
+	asoc_simple_canonicalize_platform(platforms, cpus);
+
 dai_link_of_err:
 	of_node_put(plat);
 	of_node_put(node);
 
-	li->link++;
-
 	return ret;
 }
 
-- 
2.20.1

