Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C4224FBA
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 07:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCFB516B6;
	Sun, 19 Jul 2020 07:13:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCFB516B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595135650;
	bh=FpAbqsOY4P0bxJdO1g8CIASa9ZEie+g3TFs3jCexvXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5Zajkp5Cbwn77Ry1xOkjh1GSpkvxweVWZAdV6F7MPU7J2amutj2EHEjpYYdwF5n0
	 5SYJn65B624zRx3Azld+sVciH81aQbA9Ei+hxh+eQb6fasovSeLN+bFrdXJpXsPXVO
	 Yl8VO+nz8efi8KRnBWSBlcE8478y912bCh0ilSIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80287F802D2;
	Sun, 19 Jul 2020 07:11:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EACD3F802C3; Sun, 19 Jul 2020 07:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8207AF802BE
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 07:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8207AF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="LIbzgJd2"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f13d5a10000>; Sat, 18 Jul 2020 22:09:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 18 Jul 2020 22:10:53 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 18 Jul 2020 22:10:53 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:10:53 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:10:53 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f13d5d80002>; Sat, 18 Jul 2020 22:10:53 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH 03/10] ASoC: audio-graph: Support Codec with multiple endpoints
Date: Sun, 19 Jul 2020 10:40:10 +0530
Message-ID: <1595135417-16589-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595135393; bh=IQlK96/RLPdpEAiXfNPlP7nM1ld3WcJT6cego6KI2FA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=LIbzgJd2p1LajQMZBTEYpLmcVs0GFAoawdRHl4VRVjAeBxatmdM5Ue5Th8E4E1VtO
 0w1wxE16PmmQKIKDvLpYDE+Bk/euGPN65RgJv4A8yZkPDc9rLlfCfBmZJpo+7XJjzc
 3qKF3ujedOVaINW0M3+oOYc60Ta91FsBgBZq67an6si1pTQdpQbw7X7xmAaO6Uyb7F
 qRQ2JyyBim2xGdqtU4G3x6LA00pCGtG6/Ty+729AcZ45nKhYRl0wzLtXl1i2yoSEnr
 9DT0vaShq3QN7IqChWy+9RgbTm+WBYHaMxO47GZLsEaokhMnqVKEx0bGmUQEKR3YUg
 0GPanwvJla+Kw==
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

If a Codec port has multiple endpoints, only first endpoint gets parsed
and remaining are ignored. This can be fixed by removing 'dup_codec' flag
passed to graph_dai_link_of_dpcm() and thus it loops over all endpoints
of Codec. Similarly graph_count_dpcm() is updated as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/audio-graph-card.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 1e20562..b1903f9 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -201,8 +201,7 @@ static void graph_parse_mclk_fs(struct device_node *top,
 static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				  struct device_node *cpu_ep,
 				  struct device_node *codec_ep,
-				  struct link_info *li,
-				  int dup_codec)
+				  struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
@@ -217,10 +216,6 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link_component *codecs = dai_link->codecs;
 	int ret;
 
-	/* Do it all CPU endpoint, and 1st Codec endpoint */
-	if (!li->cpu && dup_codec)
-		return 0;
-
 	port	= of_get_parent(ep);
 	ports	= of_get_parent(port);
 	node	= of_graph_get_port_parent(ep);
@@ -415,7 +410,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			int (*func_dpcm)(struct asoc_simple_priv *priv,
 					 struct device_node *cpu_ep,
 					 struct device_node *codec_ep,
-					 struct link_info *li, int dup_codec))
+					 struct link_info *li))
 {
 	struct of_phandle_iterator it;
 	struct device *dev = simple_priv_to_dev(priv);
@@ -424,7 +419,6 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	struct device_node *cpu_ep;
 	struct device_node *codec_ep;
 	struct device_node *codec_port;
-	struct device_node *codec_port_old = NULL;
 	struct asoc_simple_data adata;
 	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
 	int rc, ret;
@@ -457,8 +451,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			if (dpcm_selectable &&
 			    ((of_get_child_count(codec_port) > 1) ||
 			     adata.convert_rate || adata.convert_channels))
-				ret = func_dpcm(priv, cpu_ep, codec_ep, li,
-						(codec_port_old == codec_port));
+				ret = func_dpcm(priv, cpu_ep, codec_ep, li);
 			/* else normal sound */
 			else
 				ret = func_noml(priv, cpu_ep, codec_ep, li);
@@ -468,8 +461,6 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 
 			if (ret < 0)
 				return ret;
-
-			codec_port_old = codec_port;
 		}
 	}
 
@@ -532,19 +523,18 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
 static int graph_count_dpcm(struct asoc_simple_priv *priv,
 			    struct device_node *cpu_ep,
 			    struct device_node *codec_ep,
-			    struct link_info *li,
-			    int dup_codec)
+			    struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
+	/* CPU */
 	li->link++; /* 1xCPU-dummy */
 	li->dais++; /* 1xCPU */
 
-	if (!dup_codec) {
-		li->link++; /* 1xdummy-Codec */
-		li->conf++; /* 1xdummy-Codec */
-		li->dais++; /* 1xCodec */
-	}
+	/* Codec */
+	li->link++; /* 1xdummy-Codec */
+	li->conf++; /* 1xdummy-Codec */
+	li->dais++; /* 1xCodec */
 
 	dev_dbg(dev, "Count As DPCM\n");
 
-- 
2.7.4

