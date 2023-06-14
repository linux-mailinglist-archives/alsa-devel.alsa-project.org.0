Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54B372F6FE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 09:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BD3DEB;
	Wed, 14 Jun 2023 09:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BD3DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686729239;
	bh=wlCgR2jDnUhDvPDT+CuOWwhImKCkxcyK5DY0WjfQpcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K3sTDH64uPr0hvyZMLZ1Tl40GPFgmpSPTfEqTrqIJsRy8qc5tBN7be32CdHVIlo1A
	 aOR8T/cQyVTGeOKkPnEwwwZPnsv6JtzoyYgCXkZD9N+g31YsEHAvcFdVVINfHQsWhC
	 pXE8EA3i/9PvGNBxIC9GGOaIidK3KmNlMVHylFzY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 440F8F8060A; Wed, 14 Jun 2023 09:50:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88611F80603;
	Wed, 14 Jun 2023 09:50:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93DC3F805E4; Wed, 14 Jun 2023 09:50:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 718BFF805A9
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 09:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 718BFF805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iFxV+tYN
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686728987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WiCubefUJT8lqguruRQEQMdku90oEPaE9zL5TkFrvME=;
	b=iFxV+tYN3v2+t2eWuNKrLNLcS4hLiZq1hZLuJfUb3iK26KWVn+Nt9caJC65E6kaAB+2Lz1
	3rZvZtWxizsXeo6pJFK/pe2F2lQMmK6poyWtKVC/fvT1t44U6427ld+F3xSENDh+u/88J2
	8Ja1yaPjJgkaxg2PxiBchb2yNWLyzjDYCni6HJcKxeoGK8kQthUzSyYWH3bahas36/N3Gj
	onokN7ojrCLVPqlWeM50bc/Gc2jXiu2LplLah0FfpcI37RZryYm7GakwTK4r8RUSo/AyMs
	PB7vo8etCUnlP3YbJVuB9+hgpaKoJiROh1cBUVrxtPHFPHY4UIIeU7UDIEQkDg==
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
Received: by mail.gandi.net (Postfix) with ESMTPA id DEECF1C0011;
	Wed, 14 Jun 2023 07:49:45 +0000 (UTC)
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
Subject: [PATCH v4 13/13] ASoC: simple-card: Handle additional devices
Date: Wed, 14 Jun 2023 09:49:04 +0200
Message-Id: <20230614074904.29085-14-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614074904.29085-1-herve.codina@bootlin.com>
References: <20230614074904.29085-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6KBDXWJFK6CAO4U5QCGQNF5FJONFRHYW
X-Message-ID-Hash: 6KBDXWJFK6CAO4U5QCGQNF5FJONFRHYW
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
Archived-At: <>
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

