Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6DA2A2DDB
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 16:15:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A23AE1751;
	Mon,  2 Nov 2020 16:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A23AE1751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604330101;
	bh=A70mDs5nz57RzZCwUWEnRg/6vl9K+fvVJJjxjhVz2/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k1QHgT92N2PfXnfMUYPNkrtp37PVeSVHBFEpxXSgZs+kU63yujN5bhGJTZUVtpu5/
	 BR0i8ZeQieVHc4ctwy6g/NSd8w2/YZCxFUnbOMPZn9visMMWiWK3lstPCQfrx2Ev57
	 h57Y0o6Jb/dgqw/mohG9ASTDfxwwlXMg4S45nyLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FAF2F804E2;
	Mon,  2 Nov 2020 16:12:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B42BEF804EC; Mon,  2 Nov 2020 16:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48C38F804E2
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C38F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="cIO5+jTj"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa021bc0001>; Mon, 02 Nov 2020 07:11:56 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 15:11:40 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 2 Nov 2020 15:11:37 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH v5 6/7] ASoC: audio-graph: Expose new members for
 asoc_simple_priv
Date: Mon, 2 Nov 2020 20:40:13 +0530
Message-ID: <1604329814-24779-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
References: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604329916; bh=NXU8XQwjRWZ/2sG+RWIF67eZnui/M+pQ/b5OeUa57ks=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=cIO5+jTj/JJrY4m33IEpY6HFu4zPXuxmWFV0YixAl1gm4313mJ5VP09Q0FvE/Jfg4
 WdDa0wtPSNdliSm7+4bVcCQOpxhGVBQ4a/I1RhYxyviNO9ZMME1CGj3NCr8x5TOqVi
 LMOavRItwEB3mQXMfyAcKf+pVAUPkcw/gyMoFlwjWjT1Ty//S8SjBungFrdpMK1aLD
 W1hwjNuljxsHkCptHSSQ860pK7bt15bOvMxOOfaKgP4Bh5f+he4Lg0vcJ7H3f6I0Fx
 0PGtRuNHpxZY8HU76zajBXl3Bqln704v4rRBFqUmFmo82y0TpXoFOuYZ0CvtfUVGr0
 7vrSLv06ltuHw==
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

Add new members in struct 'asoc_simple_priv'. Idea is to leverage
simple or graph card driver as much as possible and vendor can
maintain a thin driver to control the behavior by populating these
newly exposed members.

Following are the members added in 'asoc_simple_priv':

  - 'ops' struct: In some cases SoC vendor drivers may want to
    implement 'snd_soc_ops' callbacks differently. In such cases
    custom callbacks would be used.

  - 'force_dpcm' flag: Right now simple or graph card drivers
    detect DAI links as DPCM links if:

      * The dpcm_selectable is set AND
      * Codec is connected to multiple CPU endpoints or aconvert
        property is used for rate/channels.

    So there is no way to directly specify usage of DPCM alone. So a
    flag is exposed to mark all links as DPCM. Vendor driver can
    set this if required.

  - 'dpcm_selectable': Currently simple or audio graph drivers
    provide a way to enable this for specific compatibles. However
    vendor driver may want to define some additional info. Thus
    expose this variable where vendor drivers can set this if
    required.

Audio graph driver is updated to consider above flags or callbacks.
Subsequent patches in the series illustrate usage for above.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h    |  3 +++
 sound/soc/generic/audio-graph-card.c | 41 ++++++++++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 86a1e95..ba4a3e1 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -56,6 +56,9 @@ struct asoc_simple_priv {
 	struct asoc_simple_dai *dais;
 	struct snd_soc_codec_conf *codec_conf;
 	struct gpio_desc *pa_gpio;
+	const struct snd_soc_ops *ops;
+	unsigned int dpcm_selectable:1;
+	unsigned int force_dpcm:1;
 };
 #define simple_priv_to_card(priv)	(&(priv)->snd_card)
 #define simple_priv_to_props(priv, i)	((priv)->dai_props + (i))
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 0ba50be9..4db9c0e 100644
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
@@ -678,6 +698,9 @@ static int graph_probe(struct platform_device *pdev)
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
 	card->probe		= graph_card_probe;
 
+	if (of_device_get_match_data(dev))
+		priv->dpcm_selectable = 1;
+
 	memset(&li, 0, sizeof(li));
 	graph_get_dais_count(priv, &li);
 	if (!li.link || !li.dais)
-- 
2.7.4

