Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FDA20BEBD
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 07:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17AA3168F;
	Sat, 27 Jun 2020 07:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17AA3168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593234409;
	bh=TRUD72OyMqqwBQfsv367/YRzHUt3FEEW4/pJmrZ3Jgk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bn43IjIjM/99MiJDuuu0R2lrSXzecXGaXKkJJH1jGds6rcePJsgydOa42WRjP+6U2
	 d9qrD9IIDH15PG2tBCh6bmJcKyxzxitbjLDz5IanQ52onIaubj2PFiAFTJvtlZ/14B
	 Sd97LDRPs7/kdrjlT5Jk6tZqV248+kHL49QCS05A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 479FBF80370;
	Sat, 27 Jun 2020 06:56:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DEDCF8036F; Sat, 27 Jun 2020 06:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBC5FF80360
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBC5FF80360
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="nrVG6SeK"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d14d0001>; Fri, 26 Jun 2020 21:55:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:55:54 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:55:54 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:55:54 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:55:53 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d1540004>; Fri, 26 Jun 2020 21:55:53 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 18/23] ASoC: simple-card: Add support for component chaining
Date: Sat, 27 Jun 2020 10:23:40 +0530
Message-ID: <1593233625-14961-19-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233741; bh=RKcJuNtPINklkPDE/ES2HA3ahPNsVmFfqN/5tIE4PC4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=nrVG6SeKNthY/EYfWcUGkmd94IP/iq9r8TKiJ8Tj6WDnvMz2KLys70zWIn32VJoIu
 qyYkkhDTbTJ4RE5sQ6PClSubN5Zd2ULeJAmKY+iGDr34EgO52leG1uh5/SNOcVC1eX
 xrUT+shEz/jMWCob75frF+fRqBKWZuYNY/Suu2QQhWuIpfhCCGQk5CpqvPDUphM56m
 qUkPMMUIysi+pjeMMZjKlcLUADygkFFp5wRJjCXNCDVT7AUifn32MxaPWv06lsD40w
 /O1hDvSbo43MZEpHwdmEogzbMDKtAs3WJngFt6EszIzHt6Ew+8u7eRz+HfcKbUZg3z
 XRVZ2k3ecK5wg==
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

The simple-card driver supports both normal and DPCM DAI links. The
sound cards requiring DPCM DAI link support use DPCM_SELECTABLE flag
and DAI links are treated as DPCM links depending on the number of
child nodes in a given DAI link.

There is another requirement where multiple ASoC components need to
be connected together in a chained fashion in a component model. This
patch sets 'component_chaining' flag for such sound cards where FE<->BE
and multiple BE<->BE component connections is required. Hence support
for such sound cards is added under 'simple-cc-audio-card' compatible.
All DAI links under this are treated as DPCM links and links can have
empty Codec list since components are chainied via router controls.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/simple_card.h     |  5 +++++
 sound/soc/generic/simple-card.c | 35 ++++++++++++++++++++++++++++-------
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/include/sound/simple_card.h b/include/sound/simple_card.h
index d264e54..79019d0 100644
--- a/include/sound/simple_card.h
+++ b/include/sound/simple_card.h
@@ -23,4 +23,9 @@ struct asoc_simple_card_info {
 	struct asoc_simple_dai codec_dai;
 };
 
+struct asoc_simple_soc_data {
+	bool dpcm_selectable;
+	bool component_chaining;
+};
+
 #endif /* __SIMPLE_CARD_H */
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index f19030b..758c612 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -16,8 +16,6 @@
 #include <sound/soc-dai.h>
 #include <sound/soc.h>
 
-#define DPCM_SELECTABLE 1
-
 #define DAI	"sound-dai"
 #define CELL	"#sound-dai-cells"
 #define PREFIX	"simple-audio-card,"
@@ -386,10 +384,11 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 					 struct device_node *np,
 					 struct link_info *li, bool is_top))
 {
+	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
 	struct device_node *node;
-	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
+	const struct asoc_simple_soc_data *data = of_device_get_match_data(dev);
 	bool is_top = 0;
 	int ret = 0;
 
@@ -411,10 +410,13 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 		/* get codec */
 		codec = of_get_child_by_name(node, is_top ?
 					     PREFIX "codec" : "codec");
-		if (!codec) {
+
+		/* Codec list can be empty for component<->component chain */
+		if (!codec && !card->component_chaining) {
 			ret = -ENODEV;
 			goto error;
 		}
+
 		/* get platform */
 		plat = of_get_child_by_name(node, is_top ?
 					    PREFIX "plat" : "plat");
@@ -432,9 +434,10 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 			 * It is DPCM
 			 * if it has many CPUs,
 			 * or has convert-xxx property
+			 * or if component_chaining is used
 			 */
-			if (dpcm_selectable &&
-			    (num > 2 ||
+			if (data && data->dpcm_selectable &&
+			    (num > 2 || data->component_chaining ||
 			     adata.convert_rate || adata.convert_channels))
 				ret = func_dpcm(priv, np, li, is_top);
 			/* else normal sound */
@@ -654,6 +657,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	struct asoc_simple_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	const struct asoc_simple_soc_data *data;
 	struct snd_soc_card *card;
 	struct link_info li;
 	int ret;
@@ -668,6 +672,11 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	card->dev		= dev;
 	card->probe		= simple_soc_probe;
 
+	data = of_device_get_match_data(dev);
+
+	if (data)
+		card->component_chaining = data->component_chaining;
+
 	memset(&li, 0, sizeof(li));
 	simple_get_dais_count(priv, &li);
 	if (!li.link || !li.dais)
@@ -757,10 +766,22 @@ static int asoc_simple_remove(struct platform_device *pdev)
 	return asoc_simple_clean_reference(card);
 }
 
+static const struct asoc_simple_soc_data scu_card_data = {
+	.dpcm_selectable = true,
+};
+
+/* Component chaining with DPCM */
+static const struct asoc_simple_soc_data cc_card_data = {
+	.dpcm_selectable = true,
+	.component_chaining = true,
+};
+
 static const struct of_device_id simple_of_match[] = {
 	{ .compatible = "simple-audio-card", },
 	{ .compatible = "simple-scu-audio-card",
-	  .data = (void *)DPCM_SELECTABLE },
+	  .data = &scu_card_data },
+	{ .compatible = "simple-cc-audio-card",
+	  .data = &cc_card_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, simple_of_match);
-- 
2.7.4

