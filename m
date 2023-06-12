Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D414572C455
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 14:33:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F29182B;
	Mon, 12 Jun 2023 14:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F29182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686573228;
	bh=wlCgR2jDnUhDvPDT+CuOWwhImKCkxcyK5DY0WjfQpcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z93ke3Mv82xLoePUYlPrnGOxUENroIerPNyyBFfCgkBSt8fRu9eqV5Ojbw7+e4rTl
	 cnYbTIKLf2KP6BzRWd4ytnI51Zn9do4h8axB+OENuS9h5Yc8lML9RbrFCaVEC/FhJQ
	 obLgclT4xDuo1NHmLIrFpocu/UFZL+U0FeXICLWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB54FF805E1; Mon, 12 Jun 2023 14:30:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85BA9F805D7;
	Mon, 12 Jun 2023 14:30:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C152F80533; Mon, 12 Jun 2023 14:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BE97F8057F
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 14:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BE97F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UVTjqFqe
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686573029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WiCubefUJT8lqguruRQEQMdku90oEPaE9zL5TkFrvME=;
	b=UVTjqFqeiwbaRUU6H2d/zpeDnZ0fSZBT+iYgzFmLlOODEI4mx7EZK9JarbLbIT90Zt3OML
	8l8QFndX0Zhp6jynvE9RdqGRbRLl48SpJILKJBjVmKVN+4DeaHsLeHcREmJlmq56ptYuC1
	jlSZ7ggx+JpXcgxmnJESESwHyYHcXQP6q3l1EcmkLe0S1qZQOk14gZjwbKTjx/YgcoewRW
	NnU+vHlyLWR3e4U5B8YVxFBfRvblOpwRqnsMe+g61K/8zuckXxP3quVITLD6Cm3pO7kVSd
	xR6HwkeIN59ozPGbB4JgT5rPV0MPbBL8qZxko2PfuCIUz71b+2njB2pElibvrw==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 3A7F024000B;
	Mon, 12 Jun 2023 12:30:26 +0000 (UTC)
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 12/12] ASoC: simple-card: Handle additional devices
Date: Mon, 12 Jun 2023 14:29:26 +0200
Message-Id: <20230612122926.107333-13-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612122926.107333-1-herve.codina@bootlin.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LM2YQMHMOORU3F3GO4CUWWS2Q4OOL6WI
X-Message-ID-Hash: LM2YQMHMOORU3F3GO4CUWWS2Q4OOL6WI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LM2YQMHMOORU3F3GO4CUWWS2Q4OOL6WI/>
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
 sound/soc/generic/simple-card.c | 46 +++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 6f044cc8357e..ae4a47018278 100644
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
@@ -427,6 +439,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 	} while (!is_top && node);
 
  error:
+	of_node_put(add_devs);
 	of_node_put(node);
 	return ret;
 }
@@ -464,6 +477,31 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
+static void simple_depopulate_aux(void *data)
+{
+	struct asoc_simple_priv *priv = data;
+
+	of_platform_depopulate(simple_priv_to_dev(priv));
+}
+
+static int simple_populate_aux(struct asoc_simple_priv *priv)
+{
+	struct device *dev = simple_priv_to_dev(priv);
+	struct device_node *node;
+	int ret;
+
+	node = of_get_child_by_name(dev->of_node, PREFIX "additional-devs");
+	if (!node)
+		return 0;
+
+	ret = of_platform_populate(node, NULL, NULL, dev);
+	of_node_put(node);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, simple_depopulate_aux, priv);
+}
+
 static int simple_parse_of(struct asoc_simple_priv *priv, struct link_info *li)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
@@ -493,6 +531,10 @@ static int simple_parse_of(struct asoc_simple_priv *priv, struct link_info *li)
 	if (ret < 0)
 		return ret;
 
+	ret = simple_populate_aux(priv);
+	if (ret < 0)
+		return ret;
+
 	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
 
 	return ret;
-- 
2.40.1

