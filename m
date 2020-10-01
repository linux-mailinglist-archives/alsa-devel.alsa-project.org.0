Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BEB280594
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 19:38:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ABDE1A96;
	Thu,  1 Oct 2020 19:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ABDE1A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601573927;
	bh=GiNZX79O2csAv7JOl/1RQUZbO7U3W/uAaLvwhjKGGXc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gTPf6R+RkYP8zjqr8HsObQbsi5ai1oCME1P7/dXIvx9wVMvu+lhcJVy91Gkrut/e2
	 pV9LzrgexhOM1H8umBzViCNscNm9hoTkuJhfvQzXIYprQql2XUawhB3XzD2WiSe8w/
	 cpvxLDGuyTAIJ8720tUFWOfFjE/t3fQ0eEPI3szI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A521FF80306;
	Thu,  1 Oct 2020 19:34:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E82B2F80305; Thu,  1 Oct 2020 19:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1117FF80303
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 19:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1117FF80303
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="fYUhqZEf"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7612fa0000>; Thu, 01 Oct 2020 10:33:46 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:34:36 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:34:30 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>
Subject: [PATCH v3 07/13] ASoC: audio-graph: Update driver as per new exposed
 members
Date: Thu, 1 Oct 2020 23:03:01 +0530
Message-ID: <1601573587-15288-8-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601573626; bh=KGVHwu7gz2uVTadbhaTYCpdQftlC5kySO8eaYF0Uy+k=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=fYUhqZEfnTADS7VXjUCEX/mFkoL/V4WT96/Hsx2evVoPrcLybnJFba3ISNLNlf7WU
 FnMTpnqun8xFjI3uVJi23uQ5ITpAkVfig+Fh9UK5HXzMM57j0zib40G5wWHOlt18Ij
 trZtM1py2HX8SMfwyVM5mGIg2N3lLMfVOIWhOe9GKnpwJNlT8Oo+GKrlqeOaFGSjIQ
 Ml3t6d0ZsZzx7E3uUefwAzqKIcWh6WVaXCZPk37uTzTBwjfU2UOJf9FUjFjk4MSvAE
 r06/nS0fX0dtHlwVTnfqW4iKDrzNDW4J8vUOMm/+AP1uzw6JJ7dzaRQovXi9GcY+Nb
 ajIa1X4fl2TlA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, atalambedu@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, nwartikar@nvidia.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

As per the members exposed earlier in the series, audio graph driver
is updated to make use of these. Functionally there is no change
in behavior if these are not populated. So following changes are made
as part of this.

 - Update 'dai_link->ops' for DPCM links if a custom 'snd_soc_ops'
   is defined by the vendor driver.

 - Consider 'force_dpcm' flag status when deciding if a DAI link
   needs to be treated as DPCM or not. In doing so the logic is
   moved to a separate inline function for a better readability.

 - Populate 'dpcm_selectable' flag which is then used to detect
   DPCM DAI links.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 40 ++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 0ba50be9..fb34e34 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -355,6 +355,11 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	snd_soc_dai_link_set_capabilities(dai_link);
 
 	dai_link->ops			= &graph_ops;
+
+	/* Use custom snd_soc_ops callbacks if available */
+	if (priv->ops)
+		dai_link->ops = priv->ops;
+
 	dai_link->init			= asoc_simple_dai_init;
 
 out_put_node:
@@ -439,6 +444,28 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
 	return 0;
 }
 
+static inline bool parse_as_dpcm_link(struct asoc_simple_priv *priv,
+				      struct device_node *codec_port,
+				      struct asoc_simple_data *adata)
+{
+	if (priv->force_dpcm)
+		return true;
+
+	if (!priv->dpcm_selectable)
+		return false;
+
+	/*
+	 * It is DPCM
+	 * if Codec port has many endpoints,
+	 * or has convert-xxx property
+	 */
+	if ((of_get_child_count(codec_port) > 1) ||
+	    (adata->convert_rate || adata->convert_channels))
+		return true;
+
+	return false;
+}
+
 static int graph_for_each_link(struct asoc_simple_priv *priv,
 			struct link_info *li,
 			int (*func_noml)(struct asoc_simple_priv *priv,
@@ -459,7 +486,6 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	struct device_node *codec_port;
 	struct device_node *codec_port_old = NULL;
 	struct asoc_simple_data adata;
-	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
 	int rc, ret;
 
 	/* loop for all listed CPU port */
@@ -482,14 +508,8 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			graph_parse_convert(dev, codec_ep, &adata);
 			graph_parse_convert(dev, cpu_ep,   &adata);
 
-			/*
-			 * It is DPCM
-			 * if Codec port has many endpoints,
-			 * or has convert-xxx property
-			 */
-			if (dpcm_selectable &&
-			    ((of_get_child_count(codec_port) > 1) ||
-			     adata.convert_rate || adata.convert_channels))
+			/* check if link requires DPCM parsing */
+			if (parse_as_dpcm_link(priv, codec_port, &adata))
 				ret = func_dpcm(priv, cpu_ep, codec_ep, li,
 						(codec_port_old == codec_port));
 			/* else normal sound */
@@ -678,6 +698,8 @@ static int graph_probe(struct platform_device *pdev)
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
 	card->probe		= graph_card_probe;
 
+	priv->dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
+
 	memset(&li, 0, sizeof(li));
 	graph_get_dais_count(priv, &li);
 	if (!li.link || !li.dais)
-- 
2.7.4

