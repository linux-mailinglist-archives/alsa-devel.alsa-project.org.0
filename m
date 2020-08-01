Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E38235198
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Aug 2020 12:06:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCFEB16D7;
	Sat,  1 Aug 2020 12:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCFEB16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596276368;
	bh=+823si1CZiP5z0sJ1tTDVh0uwIk5AfISmiDLRPA+FyM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lrDhXczcYntVQBedCJLaHHZd+HAU3KJY4MNWfmuIJzxDw++xvXkC9UTz65CYd2Fc+
	 Y/MQk751Sbdl4DkiTl4qdoTLZF9ZXBLIF3R3SGzarsBjOyNuXtqliXrjJr+gnOmbuZ
	 dZY+7HiUjOdV2DNLk4zJwUVnWS2/FSWtRNuDm1Eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFCE5F8011C;
	Sat,  1 Aug 2020 12:04:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADEF6F80256; Sat,  1 Aug 2020 12:04:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D49CF8011C
 for <alsa-devel@alsa-project.org>; Sat,  1 Aug 2020 12:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D49CF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="VvyPB7yK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596276255;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=D201RxrKY/jF6vCi3Z/0LyKu6Ty7PhswE7QCdIrJJ7c=;
 b=VvyPB7yKeFHIdT99h8B9QVLSfCrGKcym9G7GEwLVcR4i9JOn6WAyJaJdt5s+8nhr9o
 NwYM0xOjdwwsbnpl3Pbq0gDzxdxCitjGcsV3aQRYmFnPjFBCzBlmiEem7hXmtlvDr0hj
 bXnZ/i6szUcNaxGvvkUoxum8mnbQVncIaU6QdSWPiTVB/BC/j6XawApNAOOmbIcZNOLT
 NcCjnJGIt2vwulHDCh2Io9+iVWgdOO1QdbGcilyEfo93vZwYsvnonFw/oZGEfqBcoQsx
 NdT3Js3sC4NnlEZBufg2bs/87bnS7O0fkTxCZIJOxh95Ptmv0+T+AmbIbgGmUOSmyYsT
 F/BQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew71A41rZ7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 1 Aug 2020 12:04:01 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: simple-card: Use snd_soc_of_parse_aux_devs()
Date: Sat,  1 Aug 2020 12:02:56 +0200
Message-Id: <20200801100257.22658-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801100257.22658-1-stephan@gerhold.net>
References: <20200801100257.22658-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

Use the new common snd_soc_of_parse_aux_devs() helper function
to parse auxiliary devices from the device tree. The code is slightly
different but the binding that is parsed is exactly the same.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/generic/simple-card.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 04d4d28ed511..75365c7bb393 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -424,37 +424,6 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int simple_parse_aux_devs(struct device_node *node,
-				 struct asoc_simple_priv *priv)
-{
-	struct device *dev = simple_priv_to_dev(priv);
-	struct device_node *aux_node;
-	struct snd_soc_card *card = simple_priv_to_card(priv);
-	int i, n, len;
-
-	if (!of_find_property(node, PREFIX "aux-devs", &len))
-		return 0;		/* Ok to have no aux-devs */
-
-	n = len / sizeof(__be32);
-	if (n <= 0)
-		return -EINVAL;
-
-	card->aux_dev = devm_kcalloc(dev,
-			n, sizeof(*card->aux_dev), GFP_KERNEL);
-	if (!card->aux_dev)
-		return -ENOMEM;
-
-	for (i = 0; i < n; i++) {
-		aux_node = of_parse_phandle(node, PREFIX "aux-devs", i);
-		if (!aux_node)
-			return -EINVAL;
-		card->aux_dev[i].dlc.of_node = aux_node;
-	}
-
-	card->num_aux_devs = n;
-	return 0;
-}
-
 static int simple_parse_of(struct asoc_simple_priv *priv)
 {
 	struct device *dev = simple_priv_to_dev(priv);
@@ -504,7 +473,7 @@ static int simple_parse_of(struct asoc_simple_priv *priv)
 	if (ret < 0)
 		return ret;
 
-	ret = simple_parse_aux_devs(top, priv);
+	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
 
 	return ret;
 }
-- 
2.27.0

