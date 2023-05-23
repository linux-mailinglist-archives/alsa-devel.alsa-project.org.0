Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D227370E027
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 17:16:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F956886;
	Tue, 23 May 2023 17:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F956886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684854975;
	bh=Q3Tagmkm9x49TqXtMJXK2UPLv+r91Z8Cc0MknZnDSRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TOSYvxWfL1myr/lXDzNNk0znXhXstjFReRWX9F38bZUKky3CNejhcS2ZDy07EmuLT
	 A111YphF1aKdLYgdt46Y0z3GKOzJN9fHWRCanFKSa6WE7sH1fb09XqGaQOnaaa7LgE
	 dmdRGZMX12se3LV47bR23BNT60OmVD+aNvRu8W74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E8FCF805E7; Tue, 23 May 2023 17:13:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73949F805E0;
	Tue, 23 May 2023 17:13:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F13F805C4; Tue, 23 May 2023 17:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CF9AF805AA
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 17:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CF9AF805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IZBvW7uf
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id A8BFCC0002;
	Tue, 23 May 2023 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684854776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIgj9hYW8BvuR/TDsfHXr8sG/1TWuLwG/JP4/jjJtyQ=;
	b=IZBvW7ufNfmBKRdFYU2zKdQY3poFbD6ku8VIEy0wSJzRFfUMQ0lvdQcbQgs2nS17SfIzAJ
	tLUjKVqr/RSK7nBgjE3CoOTiMCIp0G/fRadFVnuY0keir3Y0Zu9X3iHCw/YGNgrnIad82L
	Eqx7GWI1MMPrNJMmDBI/VGXLaDqO6NWhIpdOJsFyMSEZ4+GmP+nUdTb9p+/bWwEBhDC9sG
	Ym5KhIssszuqIewM+VlX8ZKrLKhStOhiN6uZQfi4yIfw7GzyClaK76oKoB/XSHOO77k4jk
	HPX5OOXyOts4LDfxRTS1ssBs0dqdxpb0dYgCQz9/mueuDAEHgZRj9BZ4vHYvow==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 9/9] ASoC: simple-card: Handle additional devices
Date: Tue, 23 May 2023 17:12:23 +0200
Message-Id: <20230523151223.109551-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523151223.109551-1-herve.codina@bootlin.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XF4R46IGI7VPPGCNOKAR6WX6AYY3F5LL
X-Message-ID-Hash: XF4R46IGI7VPPGCNOKAR6WX6AYY3F5LL
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XF4R46IGI7VPPGCNOKAR6WX6AYY3F5LL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

An additional-devs subnode can be present in the simple-card top node.
This subnode is used to declared some "virtual" additional devices.

Create related devices from this subnode and avoid this subnode presence
to interfere with the already supported subnodes analysis.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/generic/simple-card.c | 52 +++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 5a5e4ecd0f61..4992ab433d6a 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -348,6 +348,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
 	struct device_node *node;
+	struct device_node *add_devs;
 	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
 	bool is_top = 0;
 	int ret = 0;
@@ -359,6 +360,8 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 		is_top = 1;
 	}
 
+	add_devs = of_get_child_by_name(top, PREFIX "additional-devs");
+
 	/* loop for all dai-link */
 	do {
 		struct asoc_simple_data adata;
@@ -367,6 +370,12 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 		struct device_node *np;
 		int num = of_get_child_count(node);
 
+		/* Skip additional-devs node */
+		if (node == add_devs) {
+			node = of_get_next_child(top, node);
+			continue;
+		}
+
 		/* get codec */
 		codec = of_get_child_by_name(node, is_top ?
 					     PREFIX "codec" : "codec");
@@ -380,12 +389,15 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 
 		/* get convert-xxx property */
 		memset(&adata, 0, sizeof(adata));
-		for_each_child_of_node(node, np)
+		for_each_child_of_node(node, np) {
+			if (np == add_devs)
+				continue;
 			simple_parse_convert(dev, np, &adata);
+		}
 
 		/* loop for all CPU/Codec node */
 		for_each_child_of_node(node, np) {
-			if (plat == np)
+			if (plat == np || add_devs == np)
 				continue;
 			/*
 			 * It is DPCM
@@ -428,6 +440,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 	} while (!is_top && node);
 
  error:
+	of_node_put(add_devs);
 	of_node_put(node);
 	return ret;
 }
@@ -652,6 +665,36 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	return 0;
 }
 
+static void simple_populate_aux_release(struct device *dev, void *res)
+{
+	of_platform_depopulate(*(struct device **)res);
+}
+
+static int simple_populate_aux(struct asoc_simple_priv *priv)
+{
+	struct device *dev = simple_priv_to_dev(priv);
+	struct device_node *node;
+	struct device **ptr;
+	int ret;
+
+	node = of_get_child_by_name(dev->of_node, PREFIX "additional-devs");
+	if (!node)
+		return 0;
+
+	ptr = devres_alloc(simple_populate_aux_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = of_platform_populate(node, NULL, NULL, dev);
+	if (ret) {
+		devres_free(ptr);
+	} else {
+		*ptr = dev;
+		devres_add(dev, ptr);
+	}
+	return ret;
+}
+
 static int asoc_simple_probe(struct platform_device *pdev)
 {
 	struct asoc_simple_priv *priv;
@@ -688,6 +731,11 @@ static int asoc_simple_probe(struct platform_device *pdev)
 		return ret;
 
 	if (np && of_device_is_available(np)) {
+		ret = simple_populate_aux(priv);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "populate aux error\n");
+			goto err;
+		}
 
 		ret = simple_parse_of(priv, li);
 		if (ret < 0) {
-- 
2.40.1

