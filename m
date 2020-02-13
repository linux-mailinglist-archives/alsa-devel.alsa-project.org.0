Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ADA15B9AF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 07:41:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B61FC1687;
	Thu, 13 Feb 2020 07:40:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B61FC1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581576077;
	bh=A/RAAHLPJyqcBRLEn9dhrE5lEDOuJiwuetalbBoywNA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u7HZZaQ6nKiHNaDdHbtIgJ+8zJuYZoa5QirnexngOkiGTfj95V1pIayV6CbT2nrbr
	 MeocGJo+Lvo916G1CrU0uwey7oPJESAFhbqA50cyHI6VFuUHkWLLcPfgI5ipoyBYQP
	 M2I3V1kZX0kUBAxVM0Q7ZHOlsyYio3xaTsxyAnJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 828FFF802A0;
	Thu, 13 Feb 2020 07:36:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE5EEF8021E; Thu, 13 Feb 2020 07:12:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DAACF80145
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DAACF80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="oO1fEF3q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oIifojuq"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4A4185787;
 Thu, 13 Feb 2020 01:11:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 13 Feb 2020 01:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=a9fTVyecXZrj4
 58LoOMqCDqMuCHq/1PpDqlvwxBn0+c=; b=oO1fEF3quLxfZqwDeQ9/UNhL3HvU7
 EsJHZLhrBLEbi/R5gpHI8kHWC/7NXVLisih/bgVrWjQK3ZNPBdzcWkpgxwiX39Ia
 q98Vh2qnkGidwIgdd0fhWVIr+eAF6Ln4nB+0drCqIrm1S/1nQ70u//5dQ8gUSRtw
 Wib4kghZMCtGyyKRPEgmUG6DEHTmtpVzKCsxHX0YE/As829aSAmT/YiavYW5k+b1
 xM5NZLX5HRbPMMFMwKDUBB7Z5kT/0M+0sJH0TOh/UhQHOxdQPXs64+3FuHGEPiJH
 oyOehFN1eLBoB8zuviA1BQ9fYnBIaEoDLR9jCxW5MFgknDBs+BlqqozwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=a9fTVyecXZrj458LoOMqCDqMuCHq/1PpDqlvwxBn0+c=; b=oIifojuq
 S5ysWOq2g9Cx7o/fk4hirjDVqXdBd8nyMR2KoJWIB+ddmM329Uc/f1e/FkgjkAGr
 hOrFyuMc+B+frHaT9+GvQokTBhve7+mqGFoBRHs9FcG6BTVu/PO8AuD3E05MlPC3
 DcXl290S97f5922T8EWufCmkFbSJO9g40EfNPwa6QngMMkBSk4K/5IS8ZczCmqY9
 crAcoBD62VsajZhu1lYFjGM5PV3fTXvxQwGZFtHXyBNICzKlA77yVMMU3lo8A3Qt
 BxY3vhfpT9btBQUjhS29I+Ue66jUVXhQkKDHlZz6u2sSO1Upv6G3CBRSQAZUmKkr
 IH2M2hxfMDfncw==
X-ME-Sender: <xms:qOhEXooMJhtRvkCJDvNnjLyNRcAwO4xiWjOPZZ0MRQg38HBZ4ZHuDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieejgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:qOhEXq8_Wrvd1OZCq8AlQQpfWQbjrbPnz7M5UjPbZikWqz8OoEHkTg>
 <xmx:qOhEXv9g92D09xqgbZ78izXkK0rw5PyY_Iuq1DyQHtSvI71vKzw0-A>
 <xmx:qOhEXhsGIfBscFXYf-IGYPEpMGri3E_eJwGDABLdjpKT36FYGuOb5Q>
 <xmx:qOhEXkzjoOxGGG-uqS15ZlGwDxj5xaMwH3uvkM6tgnwSP7KxBHShJQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69E5C3280059;
 Thu, 13 Feb 2020 01:11:51 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 13 Feb 2020 00:11:47 -0600
Message-Id: <20200213061147.29386-5-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213061147.29386-1-samuel@sholland.org>
References: <20200213061147.29386-1-samuel@sholland.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Feb 2020 07:36:42 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [alsa-devel] [PATCH 4/4] ASoC: simple-card: Add support for
	codec-to-codec dai_links
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

For now we assume there are only a few sets of valid PCM stream
parameters, to avoid needing to specify them in the device tree. We
also assume they are the same in both directions. We calculate the
common subset of parameters, and then the existing code automatically
chooses the highest quality of the remaining values.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../devicetree/bindings/sound/simple-card.txt |  1 +
 Documentation/sound/soc/codec-to-codec.rst    |  9 ++++-
 include/sound/simple_card_utils.h             |  1 +
 sound/soc/generic/simple-card-utils.c         | 39 +++++++++++++++++++
 sound/soc/generic/simple-card.c               | 12 ++++++
 5 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.txt b/Documentation/devicetree/bindings/sound/simple-card.txt
index 79954cd6e37b..18a62e404a30 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.txt
+++ b/Documentation/devicetree/bindings/sound/simple-card.txt
@@ -63,6 +63,7 @@ Optional dai-link subnode properties:
 - mclk-fs             			: Multiplication factor between stream
 					  rate and codec mclk, applied only for
 					  the dai-link.
+- codec-to-codec			: Indicates a codec-to-codec dai-link.
 
 For backward compatibility the frame-master and bitclock-master
 properties can be used as booleans in codec subnode to indicate if the
diff --git a/Documentation/sound/soc/codec-to-codec.rst b/Documentation/sound/soc/codec-to-codec.rst
index 810109d7500d..efe0a8c07933 100644
--- a/Documentation/sound/soc/codec-to-codec.rst
+++ b/Documentation/sound/soc/codec-to-codec.rst
@@ -104,5 +104,10 @@ Make sure to name your corresponding cpu and codec playback and capture
 dai names ending with "Playback" and "Capture" respectively as dapm core
 will link and power those dais based on the name.
 
-Note that in current device tree there is no way to mark a dai_link
-as codec to codec. However, it may change in future.
+A dai_link in a "simple-audio-card" can be marked as codec to codec in
+the device tree by adding the "codec-to-codec" property. The dai_link
+will be initialized with the subset of stream parameters (channels,
+format, sample rate) supported by all DAIs on the link. Since there is
+no way to provide these parameters in the device tree, this is mostly
+useful for communication with simple fixed-function codecs, such as a
+Bluetooth controller or cellular modem.
diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index bbdd1542d6f1..80b60237b3cd 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -49,6 +49,7 @@ struct asoc_simple_priv {
 		struct asoc_simple_data adata;
 		struct snd_soc_codec_conf *codec_conf;
 		unsigned int mclk_fs;
+		bool codec_to_codec;
 	} *dai_props;
 	struct asoc_simple_jack hp_jack;
 	struct asoc_simple_jack mic_jack;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 9b794775df53..2de4cfead790 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -331,6 +331,41 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
+					    struct simple_dai_props *dai_props)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_pcm_stream *params;
+	struct snd_pcm_hardware hw;
+	int ret;
+
+	if (!dai_props->codec_to_codec)
+		return 0;
+
+	/* Assumes the hardware capabilities are the same in both directions */
+	ret = snd_soc_runtime_calc_hw(rtd, &hw, SNDRV_PCM_STREAM_PLAYBACK);
+	if (ret < 0) {
+		dev_err(rtd->dev, "simple-card: no valid dai_link params\n");
+		return ret;
+	}
+
+	params = devm_kzalloc(rtd->dev, sizeof(*params), GFP_KERNEL);
+	if (!params)
+		return -ENOMEM;
+
+	params->formats = hw.formats;
+	params->rates = hw.rates;
+	params->rate_min = hw.rate_min;
+	params->rate_max = hw.rate_max;
+	params->channels_min = hw.channels_min;
+	params->channels_max = hw.channels_max;
+
+	dai_link->params = params;
+	dai_link->num_params = 1;
+
+	return 0;
+}
+
 int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
@@ -347,6 +382,10 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret < 0)
 		return ret;
 
+	ret = asoc_simple_init_dai_link_params(rtd, dai_props);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_dai_init);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 55e9f8800b3e..179ab4482d10 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -77,6 +77,16 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	return 0;
 }
 
+static void simple_parse_codec_to_codec(struct device_node *node,
+					struct simple_dai_props *props,
+					char *prefix)
+{
+	char prop[128];
+
+	snprintf(prop, sizeof(prop), "%scodec-to-codec", prefix);
+	props->codec_to_codec = of_property_read_bool(node, prop);
+}
+
 static void simple_parse_convert(struct device *dev,
 				 struct device_node *np,
 				 struct asoc_simple_data *adata)
@@ -217,6 +227,7 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 					     "prefix");
 	}
 
+	simple_parse_codec_to_codec(node, dai_props, prefix);
 	simple_parse_convert(dev, np, &dai_props->adata);
 	simple_parse_mclk_fs(top, np, codec, dai_props, prefix);
 
@@ -292,6 +303,7 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
+	simple_parse_codec_to_codec(node, dai_props, prefix);
 	simple_parse_mclk_fs(top, cpu, codec, dai_props, prefix);
 
 	ret = asoc_simple_parse_cpu(cpu, dai_link, &single_cpu);
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
