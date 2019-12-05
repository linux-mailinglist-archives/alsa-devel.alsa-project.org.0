Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEF6113CEA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 09:16:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAFFA166E;
	Thu,  5 Dec 2019 09:15:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAFFA166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575533787;
	bh=FCUQ20Y3UygJyi2M40pH73ziVNkelJMCHa3HhV/C/CE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJRiajQnRGzlCm6UfMs+b9RXrK42xeGs4aWGqG53S0Cd6pWBme2unyUBh8jIndwfg
	 c201g71hBTd05y4g8ZxXiPNem1128ureo54KVYNAw0kH2M1Um+IwgVM039YlMqtZEd
	 o2ZmARWap9FdEZ+R/U1VGvWv6YKvlXD2nZOIZM5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 098AAF800B4;
	Thu,  5 Dec 2019 09:14:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55972F801F8; Thu,  5 Dec 2019 09:14:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id 16E11F800B4
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 09:14:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16E11F800B4
Received: from zenbar.localdomain (unknown [194.162.236.226])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 7764A2E4F7C;
 Thu,  5 Dec 2019 08:08:27 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: alsa-devel@alsa-project.org
Date: Thu,  5 Dec 2019 09:14:28 +0100
Message-Id: <20191205081428.611572-2-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191205081428.611572-1-daniel@zonque.org>
References: <20191205081428.611572-1-daniel@zonque.org>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] [PATCH 2/2] ASoC: simple-card: add support for
	codec-to-codec links
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DAI links in ASoC can be turned into codec-to-codec links by populating
the .params field. This patch adds support for this to the simple-card
driver and exposes the feature via three new device-tree properties that
configure the pcm format, the sampling rate and the channel count.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/sound/simple-card.txt | 10 ++++++
 include/sound/simple_card_utils.h             |  6 +++-
 sound/soc/generic/simple-card-utils.c         | 33 +++++++++++++++++++
 sound/soc/generic/simple-card.c               | 19 +++++++++++
 4 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.txt b/Documentation/devicetree/bindings/sound/simple-card.txt
index 79954cd6e37b..13f0c0da8b53 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.txt
+++ b/Documentation/devicetree/bindings/sound/simple-card.txt
@@ -27,6 +27,16 @@ Optional properties:
 - simple-audio-card,pin-switches	: List of strings containing the widget names for
 					  which pin switches must be created.
 
+Optional dai-link properies for CODEC-to-CODEC links:
+
+- codec-to-codec-format			: Format to configure
+					  "s16_le"; "s24_le", "s32_le", ...
+- codec-to-codec-rate			: Sample rate to configure
+- codec-to-codec-channels		: Number of channels to configure
+
+Note that for a CODEC-to-CODEC link to be activated, you also need to provide a
+valid DAPM path that connects the two components.
+
 Optional subnodes:
 
 - simple-audio-card,dai-link		: Container for dai-link level
diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 31f76b6abf71..2d34a34c5e74 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -47,6 +47,7 @@ struct asoc_simple_priv {
 		struct snd_soc_dai_link_component platforms;
 		struct asoc_simple_data adata;
 		struct snd_soc_codec_conf *codec_conf;
+		struct snd_soc_pcm_stream c2c_params;
 		unsigned int mclk_fs;
 	} *dai_props;
 	struct asoc_simple_jack hp_jack;
@@ -120,7 +121,10 @@ void asoc_simple_convert_fixup(struct asoc_simple_data *data,
 void asoc_simple_parse_convert(struct device *dev,
 			       struct device_node *np, char *prefix,
 			       struct asoc_simple_data *data);
-
+void asoc_simple_parse_c2c_params(struct device *dev,
+				  struct device_node *np,
+				  char *prefix,
+				  struct snd_soc_pcm_stream *dest);
 int asoc_simple_parse_routing(struct snd_soc_card *card,
 				      char *prefix);
 int asoc_simple_parse_widgets(struct snd_soc_card *card,
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 9b794775df53..208708cd880b 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -52,6 +52,39 @@ void asoc_simple_parse_convert(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_convert);
 
+void asoc_simple_parse_c2c_params(struct device *dev,
+				  struct device_node *np,
+				  char *prefix,
+				  struct snd_soc_pcm_stream *dest)
+{
+	char prop[128];
+	unsigned int rate, channels;
+	const char *format_string;
+
+	if (!prefix)
+		prefix = "";
+
+	snprintf(prop, sizeof(prop), "%s%s", prefix, "codec-to-codec-rate");
+	of_property_read_u32(np, prop, &rate);
+
+	snprintf(prop, sizeof(prop), "%s%s", prefix, "codec-to-codec-channels");
+	of_property_read_u32(np, prop, &channels);
+
+	snprintf(prop, sizeof(prop), "%s%s", prefix, "codec-to-codec-format");
+	if (!of_property_read_string(np, prop, &format_string)) {
+		int format = snd_pcm_format_by_name(format_string);
+
+		if (format >= 0) {
+			dest->formats = 1ULL << format;
+			dest->channels_min = dest->channels_max = channels;
+			dest->rate_min = dest->rate_max = rate;
+		} else {
+			dev_err(dev, "unknown dai format %s\n", format_string);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(asoc_simple_parse_c2c_params);
+
 int asoc_simple_parse_daifmt(struct device *dev,
 			     struct device_node *node,
 			     struct device_node *codec,
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 8b30e5bc73af..854d871eb5bd 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -94,6 +94,21 @@ static void simple_parse_convert(struct device *dev,
 	of_node_put(node);
 }
 
+static void simple_parse_c2c_params(struct device *dev,
+				    struct device_node *np,
+				    struct snd_soc_pcm_stream *dest)
+{
+	struct device_node *top = dev->of_node;
+	struct device_node *node = of_get_parent(np);
+
+	asoc_simple_parse_c2c_params(dev, top,  PREFIX, dest);
+	asoc_simple_parse_c2c_params(dev, node, PREFIX, dest);
+	asoc_simple_parse_c2c_params(dev, node, NULL,   dest);
+	asoc_simple_parse_c2c_params(dev, np,   NULL,   dest);
+
+	of_node_put(node);
+}
+
 static void simple_parse_mclk_fs(struct device_node *top,
 				 struct device_node *cpu,
 				 struct device_node *codec,
@@ -334,6 +349,10 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	dai_link->ops = &simple_ops;
 	dai_link->init = asoc_simple_dai_init;
 
+	simple_parse_c2c_params(dev, node, &dai_props->c2c_params);
+	if (dai_props->c2c_params.formats != 0)
+		dai_link->params = &dai_props->c2c_params;
+
 	asoc_simple_canonicalize_cpu(dai_link, single_cpu);
 	asoc_simple_canonicalize_platform(dai_link);
 
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
