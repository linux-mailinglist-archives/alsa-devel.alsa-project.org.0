Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212EBD5788
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 21:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFAF3886;
	Sun, 13 Oct 2019 21:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFAF3886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570993423;
	bh=RRNcf0JGB3dzHnhqfNUgF/g9E1rol2dVr2R/R2cE0pw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RzPGMHv4We4M5CqHFgDnPv/5kRJ6mDzsQx0kDJ0zgam5uZNfc3EK74PH6iNRYuVHV
	 NHgqHRtpDkwYjDd7PO043G71C64t/+tpQkO+PiipvoEy3g2J5LNZHWIxPeD0VcXrvd
	 ET2CsNYsYhr9UzJqSXmzkmDpvl8Y474JL11JU6oU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEBDDF805FC;
	Sun, 13 Oct 2019 21:00:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4857BF805FD; Sun, 13 Oct 2019 21:00:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D462BF80362
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 21:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D462BF80362
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C8C2D200190;
 Sun, 13 Oct 2019 21:00:16 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C5EB220014F;
 Sun, 13 Oct 2019 21:00:16 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 38E072059D;
 Sun, 13 Oct 2019 21:00:16 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org,
 kuninori.morimoto.gx@renesas.com
Date: Sun, 13 Oct 2019 22:00:13 +0300
Message-Id: <20191013190014.32138-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191013190014.32138-1-daniel.baluta@nxp.com>
References: <20191013190014.32138-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-imx@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>
Subject: [alsa-devel] [RFC PATCH 1/2] ASoC: simple-card: Introduce
	force-dpcm DT property
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Until now dai_link uses dynamic PCM in the following conditions:
	* it is dpcm_selectable (this means compatible string is simple-scu-card)
	* it has convert-xxx property
	* or it has more than one CPU DAIs

Our use case requires to be able to build a DPCM link with just 1 CPU.
Add force-dpcm DT property to realize this.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/sound/simple_card_utils.h     |  4 ++++
 sound/soc/generic/simple-card-utils.c | 17 +++++++++++++++++
 sound/soc/generic/simple-card.c       | 25 +++++++++++++++++++++++--
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 985a5f583de4..0578bbfa4a24 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -48,6 +48,7 @@ struct asoc_simple_priv {
 		struct asoc_simple_data adata;
 		struct snd_soc_codec_conf *codec_conf;
 		unsigned int mclk_fs;
+		unsigned int force_dpcm;
 	} *dai_props;
 	struct asoc_simple_jack hp_jack;
 	struct asoc_simple_jack mic_jack;
@@ -120,6 +121,9 @@ void asoc_simple_convert_fixup(struct asoc_simple_data *data,
 void asoc_simple_parse_convert(struct device *dev,
 			       struct device_node *np, char *prefix,
 			       struct asoc_simple_data *data);
+void asoc_simple_parse_force_dpcm(struct device *dev,
+				  struct device_node *np, char *prefix,
+				  unsigned int *force_dpcm);
 
 int asoc_simple_parse_routing(struct snd_soc_card *card,
 				      char *prefix);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 9b794775df53..2f03a73f8a8a 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -52,6 +52,23 @@ void asoc_simple_parse_convert(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_convert);
 
+void asoc_simple_parse_force_dpcm(struct device *dev,
+			       struct device_node *np,
+			       char *prefix,
+			       unsigned int *force_dpcm)
+{
+	char prop[128];
+
+	if (!prefix)
+		prefix = "";
+
+	/* dpcm property */
+	snprintf(prop, sizeof(prop), "%s%s", prefix, "force-dpcm");
+	if (of_find_property(np, prop, NULL))
+		*force_dpcm = 1;
+}
+EXPORT_SYMBOL_GPL(asoc_simple_parse_force_dpcm);
+
 int asoc_simple_parse_daifmt(struct device *dev,
 			     struct device_node *node,
 			     struct device_node *codec,
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index fc9c753db8dd..e40e22c8813b 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -92,6 +92,21 @@ static void simple_parse_convert(struct device *dev,
 	of_node_put(node);
 }
 
+static void simple_parse_force_dpcm(struct device *dev,
+				 struct device_node *np,
+				 unsigned int *force_dpcm)
+{
+	struct device_node *top = dev->of_node;
+	struct device_node *node = of_get_parent(np);
+
+	asoc_simple_parse_force_dpcm(dev, top,  PREFIX, force_dpcm);
+	asoc_simple_parse_force_dpcm(dev, node, PREFIX, force_dpcm);
+	asoc_simple_parse_force_dpcm(dev, node, NULL,   force_dpcm);
+	asoc_simple_parse_force_dpcm(dev, np,   NULL,   force_dpcm);
+
+	of_node_put(node);
+}
+
 static void simple_parse_mclk_fs(struct device_node *top,
 				 struct device_node *cpu,
 				 struct device_node *codec,
@@ -372,6 +387,7 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 		struct asoc_simple_data adata;
 		struct device_node *codec;
 		struct device_node *np;
+		unsigned int force_dpcm = 0;
 		int num = of_get_child_count(node);
 
 		/* get codec */
@@ -387,15 +403,20 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 		for_each_child_of_node(node, np)
 			simple_parse_convert(dev, np, &adata);
 
+		/* get force-dpcm property */
+		for_each_child_of_node(node, np)
+			simple_parse_force_dpcm(dev, np, &force_dpcm);
+
 		/* loop for all CPU/Codec node */
 		for_each_child_of_node(node, np) {
 			/*
 			 * It is DPCM
 			 * if it has many CPUs,
-			 * or has convert-xxx property
+			 * or it has convert-xxx property
+			 * or it has force-dpcm property
 			 */
 			if (dpcm_selectable &&
-			    (num > 2 ||
+			    (num > 2 || force_dpcm ||
 			     adata.convert_rate || adata.convert_channels))
 				ret = func_dpcm(priv, np, codec, li, is_top);
 			/* else normal sound */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
