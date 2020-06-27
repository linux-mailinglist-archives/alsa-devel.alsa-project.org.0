Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAD720BEB7
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 07:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3858166A;
	Sat, 27 Jun 2020 07:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3858166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593234205;
	bh=MnA+G+x9I0u7o1iq0juGjLHssp4J9mem72cTLyGpDRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PMOkYKf+GB/r96N13PXAkDrkiIklD6rrgpJ6RVlNrWZPpFt0htY/3Sk5bnRH0xgAS
	 LXSY2Kul8Sh8YsMeBPhIKFnWGHvH91UsbN2QZcXKru1Ww92Ule7NUS0ybT7hHrv1DB
	 DKUZVWtfrhWo5nn7mq64h7+uybeKFNZYst9LqX+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA17DF80341;
	Sat, 27 Jun 2020 06:55:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E39BF8033F; Sat, 27 Jun 2020 06:55:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4196BF80321
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4196BF80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="AaidnfWi"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d12c0000>; Fri, 26 Jun 2020 21:55:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:55:21 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:55:21 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:55:21 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:55:21 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d1340000>; Fri, 26 Jun 2020 21:55:20 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link with
 multiple Codecs
Date: Sat, 27 Jun 2020 10:23:34 +0530
Message-ID: <1593233625-14961-13-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233709; bh=IqBT1WCuoY5lYRme/6GLgfFP9jZAK+ByO0ygcqZjbOw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=AaidnfWiPnIbnQ5jy4+5I+p1zko3YeLq7I5vqzuH819m62cA6CJUzUHh4btzV96j1
 idNVIn+5+HfR25vdzJbJrrI1p5FU4JyUL6oaYG0VMSrxxjsQU2pqezzjz9IeDGkLM/
 7HWAcz3mfcZS2rHGy58RrWWVqxC8leQKvlC25DhkIvca0m876kWx7fe8KfmK15qQW9
 yn1iad07cDonj7kVNbQN75uOWMPsFRh+6rGbW+hSf+HMWnWxrvP4vK74RahdZgnTlE
 WHXRsneNvRdUTuR52n0iuVvtL/KrBRk3Qgv0dw4zDKs66cMLRnp8/pLHHL/sUSFT60
 MA4/Cfqs9njYg==
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

The simple-card driver supports multiple CPU and single Codec entries
for DPCM DAI links. In some cases it is required to have multiple
CPU/Codecs. Currently parsing logic for DPCM link loops over all
children of DAI link but assumes that there is a single Codec entry.
When DAI link has multiple Codecs it considers only the first Codec
entry and remaining Codecs are wrongly treated as CPU. This happens
because first Codec is used as reference for parsing all other child
nodes.

This is fixed by using string comparisons of child node names instead
of node pointer reference in simple_dai_link_of_dpcm(). So All CPU
get parsed in first run and all Codecs in subsequent run. After this
simple_dai_link_of_dpcm() does not required 'codec' argument and hence
is removed.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/simple-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 02d6295..15c4388 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -116,7 +116,6 @@ static void simple_parse_mclk_fs(struct device_node *top,
 
 static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				   struct device_node *np,
-				   struct device_node *codec,
 				   struct link_info *li,
 				   bool is_top)
 {
@@ -137,8 +136,13 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	 * Codec |return|Pass
 	 * np
 	 */
-	if (li->cpu == (np == codec))
-		return 0;
+	if (li->cpu) {
+		if (!strcmp(np->name, "codec"))
+			return 0;
+	} else {
+		if (!strcmp(np->name, "cpu"))
+			return 0;
+	}
 
 	dev_dbg(dev, "link_of DPCM (%pOF)\n", np);
 
@@ -354,7 +358,6 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 					 struct link_info *li, bool is_top),
 			int (*func_dpcm)(struct asoc_simple_priv *priv,
 					 struct device_node *np,
-					 struct device_node *codec,
 					 struct link_info *li, bool is_top))
 {
 	struct device *dev = simple_priv_to_dev(priv);
@@ -407,7 +410,7 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 			if (dpcm_selectable &&
 			    (num > 2 ||
 			     adata.convert_rate || adata.convert_channels))
-				ret = func_dpcm(priv, np, codec, li, is_top);
+				ret = func_dpcm(priv, np, li, is_top);
 			/* else normal sound */
 			else
 				ret = func_noml(priv, np, codec, li, is_top);
@@ -527,12 +530,11 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
 
 static int simple_count_dpcm(struct asoc_simple_priv *priv,
 			     struct device_node *np,
-			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
 	li->dais++; /* CPU or Codec */
 	li->link++; /* CPU-dummy or dummy-Codec */
-	if (np == codec)
+	if (!strcmp(np->name, "codec"))
 		li->conf++;
 
 	return 0;
-- 
2.7.4

