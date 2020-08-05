Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA1223C516
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 07:30:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E931669;
	Wed,  5 Aug 2020 07:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E931669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596605409;
	bh=v/17S1HkHxPdEj59NFpQ6K/LTWrRY5tFXm4sGwFzVak=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VExz4mIJc3lWiL1DG/ZD2nb6WVO16SVjYSuVNnA5uT1lbYM3RTRagvnrjvoQAE7Dt
	 /jxitmGe21MqhlRHbS9rrntvsQv4NQON0phVr/AW9dvJJDKM+Lt4Xsmbh7GqCn1iuP
	 0BQvkpUpoIFbW6VIKU4FFhGbDBf2141Z+OtKco24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A37F802E8;
	Wed,  5 Aug 2020 07:25:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06B8FF802FB; Wed,  5 Aug 2020 07:25:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EC9DF802E8
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 07:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EC9DF802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="fvY9K8+9"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2a42ad0000>; Tue, 04 Aug 2020 22:25:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 04 Aug 2020 22:25:14 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 04 Aug 2020 22:25:14 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 05:25:14 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 05:25:14 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2a42b50000>; Tue, 04 Aug 2020 22:25:14 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v2 6/9] ASoC: audio-graph: Add support for component chaining
Date: Wed, 5 Aug 2020 10:54:21 +0530
Message-ID: <1596605064-27748-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596605101; bh=MUJnSbo5zEvskPcyqojAeBN9LZ+000+ki+nIaV5bpJQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=fvY9K8+9EqU00tCZF4+p2+PEaeWYSlMLwfFR09dkadDhK1QgAoSaDl235Z63ThCNO
 sspJJzYHKwIEU98tPwe1rPX3/J+vCHM2j9LxpNvhP3zs6/BHcmr8JWkkwCQqpwwG6Z
 6wPzNFEH5u5smM9AlzGqHAo/hopopgP4uH3wlhCeXzucjR2gPCFhAKnIbfY4tfl+mS
 qvAxPfoLukIbOXtuorxBq+TwxQxcFX2Bix9Wx4cKjsZ8Kd5AKTsZHIvtJe+w3u4Clu
 e/a6Bzds1qEFKVGRdhPUKWbe/FLGHdkp98Jads63vqoKB3sb1XbwSp8EQQDrcu2tct
 KlWywHSgh/DSQ==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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

The audio-graph driver supports both normal and DPCM DAI links. The
sound cards requiring DPCM DAI link support, use DPCM_SELECTABLE flag
and DAI links are treated as DPCM links depending on the number of
child nodes in a given DAI link.

There is another requirement where multiple ASoC components need to
be connected together in a chained fashion in a component model. This
patch sets 'component_chaining' flag for such sound cards where FE<->BE
and multiple BE<->BE component connections are required. Hence support
for such sound cards is added under 'audio-graph-cc-card' compatible.
All DAI links under this are treated as DPCM links.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/audio-graph-card.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 93bddf6..4a0a345 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -20,10 +20,13 @@
 #include <linux/string.h>
 #include <sound/simple_card_utils.h>
 
-#define DPCM_SELECTABLE 1
-
 #define PREFIX	"audio-graph-card,"
 
+struct asoc_simple_soc_data {
+	unsigned int dpcm_selectable:1;
+	unsigned int component_chaining:1;
+};
+
 static int graph_outdrv_event(struct snd_soc_dapm_widget *w,
 			      struct snd_kcontrol *kcontrol,
 			      int event)
@@ -447,7 +450,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	struct device_node *codec_port;
 	struct device_node *codec_port_old = NULL;
 	struct asoc_simple_data adata;
-	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
+	const struct asoc_simple_soc_data *data = of_device_get_match_data(dev);
 	int rc, ret;
 
 	/* loop for all listed CPU port */
@@ -474,10 +477,12 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			 * It is DPCM
 			 * if Codec port has many endpoints,
 			 * or has convert-xxx property
+			 * or component chaining is used
 			 */
-			if (dpcm_selectable &&
+			if (data && data->dpcm_selectable &&
 			    ((of_get_child_count(codec_port) > 1) ||
-			     adata.convert_rate || adata.convert_channels))
+			     adata.convert_rate || adata.convert_channels ||
+			     data->component_chaining))
 				ret = func_dpcm(priv, cpu_ep, codec_ep, li,
 						(codec_port_old == codec_port));
 			/* else normal sound */
@@ -650,6 +655,7 @@ static int graph_probe(struct platform_device *pdev)
 {
 	struct asoc_simple_priv *priv;
 	struct device *dev = &pdev->dev;
+	const struct asoc_simple_soc_data *data = of_device_get_match_data(dev);
 	struct snd_soc_card *card;
 	struct link_info li;
 	int ret;
@@ -666,6 +672,9 @@ static int graph_probe(struct platform_device *pdev)
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
 	card->probe		= graph_card_probe;
 
+	if (data)
+		card->component_chaining = data->component_chaining;
+
 	memset(&li, 0, sizeof(li));
 	graph_get_dais_count(priv, &li);
 	if (!li.link || !li.dais)
@@ -711,10 +720,19 @@ static int graph_remove(struct platform_device *pdev)
 	return asoc_simple_clean_reference(card);
 }
 
+static const struct asoc_simple_soc_data scu_card_data = {
+	.dpcm_selectable = 1,
+};
+
+static const struct asoc_simple_soc_data cc_card_data = {
+	.dpcm_selectable = 1,
+	.component_chaining = 1,
+};
+
 static const struct of_device_id graph_of_match[] = {
 	{ .compatible = "audio-graph-card", },
-	{ .compatible = "audio-graph-scu-card",
-	  .data = (void *)DPCM_SELECTABLE },
+	{ .compatible = "audio-graph-scu-card", .data = &scu_card_data, },
+	{ .compatible = "audio-graph-cc-card", .data = &cc_card_data, },
 	{},
 };
 MODULE_DEVICE_TABLE(of, graph_of_match);
-- 
2.7.4

