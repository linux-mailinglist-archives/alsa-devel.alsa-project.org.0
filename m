Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5920BEB8
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 07:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D024B168E;
	Sat, 27 Jun 2020 07:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D024B168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593234237;
	bh=rOMUsFuiS04eEkjr/nPPgpTiVe82xZizGNGX1eGCYbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHBo5THc4cRCAtpKeU30njBL5sc/1aSUQ9sOzYsraHdqU5AJfS0+YFygXYEe0kdNl
	 1KvFwpXN2/TrgBzuG/pjAuQQpjpAQ5Rqw+420lvV/g3fjj0HoZj/KVveKEL2SlB2h/
	 JEmM6Y1srUZYEedSk0pgaSy6l6CM7j+fvrfswPdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3251F80348;
	Sat, 27 Jun 2020 06:55:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B4B5F80345; Sat, 27 Jun 2020 06:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D81BEF8033E
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D81BEF8033E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ZSkV8WBm"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d10f0000>; Fri, 26 Jun 2020 21:54:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:55:27 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:55:27 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:55:26 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:55:26 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d1390006>; Fri, 26 Jun 2020 21:55:26 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 13/23] ASoC: simple-card: DPCM DAI link direction as per
 DAI capability
Date: Sat, 27 Jun 2020 10:23:35 +0530
Message-ID: <1593233625-14961-14-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233679; bh=9nVgJVTRQ13S3LRBSIRSN87+sbsTgdJe0B918DkGPzY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=ZSkV8WBmSSSZITVmXqRiFLCn/d52vJ1tE1vKAL8vgmRp/JgvKguLwEW84feQqrQnG
 25jTUWrA6yZ0avTbLn2+FyWedrVqLTP5x+TCsGpGZ9U6LssHKj20GR31e2PLSGqxhg
 TrMJJFz+Mw62maPYLHmUvqqu3wuCofT0QqhSH05SGdQLzQW8TDvNlE6w+LaB84poIL
 lItzlC4ufTG+YVFnA2MacSX96lfP67cJ2b2rxxOY0mOUKESRQnlIKkmf/RwJ3qbcUG
 h6YyBI9KOIkQlNRTyO5VZtUlsp6/YLCSUkSgdz+1jKt0Zr3d1vM13eRtGcAsfYUo7Q
 zSkMavRUepwaw==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

The soc_new_pcm() fails for DAI link having DAI which supports a
single stream direction of either PLAYBACK or CAPTURE. For example
it fails for Microphone which can support CAPTURE stream only. This
happens because simple-card driver by default populates both stream
directions.

This can be fixed by populating directions based on DAI capability.
For 'CPU<->Dummy' DAI links CPU is used to setup the direction and
similarly Codec is used for 'Dummy<->Codec' DAI links.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/simple-card.c | 27 +++++++++++++++++++++++++--
 sound/soc/soc-dai.c             |  1 +
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 15c4388..62f2978 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -114,6 +114,23 @@ static void simple_parse_mclk_fs(struct device_node *top,
 	of_node_put(node);
 }
 
+static int simple_parse_dpcm_dir(const struct snd_soc_dai_link_component *dlc,
+				 struct snd_soc_dai_link *dai_link)
+{
+	struct snd_soc_dai *dai = snd_soc_find_dai(dlc);
+
+	if (!dai)
+		return -EINVAL;
+
+	dai_link->dpcm_playback =
+		snd_soc_dai_stream_valid(dai, SNDRV_PCM_STREAM_PLAYBACK);
+
+	dai_link->dpcm_capture =
+		snd_soc_dai_stream_valid(dai, SNDRV_PCM_STREAM_CAPTURE);
+
+	return 0;
+}
+
 static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				   struct device_node *np,
 				   struct link_info *li,
@@ -183,6 +200,10 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 			goto out_put_node;
 
 		asoc_simple_canonicalize_cpu(dai_link, is_single_links);
+
+		ret = simple_parse_dpcm_dir(cpus, dai_link);
+		if (ret < 0)
+			goto out_put_node;
 	} else {
 		struct snd_soc_codec_conf *cconf;
 
@@ -223,6 +244,10 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 					     "prefix");
 		snd_soc_of_parse_node_prefix(np, cconf, codecs->of_node,
 					     "prefix");
+
+		ret = simple_parse_dpcm_dir(codecs, dai_link);
+		if (ret < 0)
+			goto out_put_node;
 	}
 
 	simple_parse_convert(dev, np, &dai_props->adata);
@@ -239,8 +264,6 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto out_put_node;
 
-	dai_link->dpcm_playback		= 1;
-	dai_link->dpcm_capture		= 1;
 	dai_link->ops			= &simple_ops;
 	dai_link->init			= asoc_simple_dai_init;
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index b05e18b..bd4465f 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -390,6 +390,7 @@ bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_valid);
 
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
-- 
2.7.4

