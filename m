Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 633DC224FC1
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 07:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25591661;
	Sun, 19 Jul 2020 07:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25591661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595135833;
	bh=4qWDHuE1jgKByExzWZlSb29EMeQh08WwdLLoI75sQ+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOVTTsKunOnDsqqLbx2sSIV+gemPBwkPofxJxT4iFYD6nUaMD/2qFp7Vkxn1oacLV
	 NZFmmpgRPo7cFfuYBRWAGk2HkM0HxTQlBpmHZZnHNM5Audbvl9VD72f3pznKZ+xBcp
	 z971D7jITeaAiyWlRAORd6yiiwX7Tkyug4t1bKWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7530F802FB;
	Sun, 19 Jul 2020 07:11:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D11FF80306; Sun, 19 Jul 2020 07:11:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790A3F802EC
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 07:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790A3F802EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="lpY4PtPC"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f13d5bb0000>; Sat, 18 Jul 2020 22:10:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 18 Jul 2020 22:11:19 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 18 Jul 2020 22:11:19 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:11:19 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:11:19 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f13d5f20000>; Sat, 18 Jul 2020 22:11:19 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH 08/10] ASoC: audio-graph: Add support for component chaining
Date: Sun, 19 Jul 2020 10:40:15 +0530
Message-ID: <1595135417-16589-9-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595135419; bh=AiqEdZ6kbQEZN+yKxns+eeEbpHyNEjylXXmbVfA2vRc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=lpY4PtPC1RCmN21Y3KqN8JKVhYJV4xeUAbttKd8y05KYyRojl4UH86cw5GrZBlTez
 XCxZdKgDIvx8MVoBL/q28pjVuzOW5GNT5dC962U4K59YMjD/jBm8Gjd53eSaWWnioa
 av4IQh29lOPc9tAk4UbBMlGVA6mFwh6994MXW17dQAW6uKMX92UoHsEZ8w4Mcg7+MW
 P11WoMkVQ6eqyfpF11/V1KpmAmrtUbsw/Q4zEsWTh0rGym2l3Vqgax9JEwVEa7vs9p
 mFw5FtE+BdfWZIzVThRrneuskaRvTRB03ljG1jYgUMFibq2fumiZnN4WIXYvf0rgZi
 KOje/Hd3e7JzA==
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
index 82d8c740..ccfcf5f 100644
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
@@ -449,7 +452,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	struct device_node *codec_ep;
 	struct device_node *codec_port;
 	struct asoc_simple_data adata;
-	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
+	const struct asoc_simple_soc_data *data = of_device_get_match_data(dev);
 	int rc, ret;
 
 	/* loop for all listed CPU port */
@@ -476,10 +479,12 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
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
 				ret = func_dpcm(priv, cpu_ep, codec_ep, li);
 			/* else normal sound */
 			else
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

