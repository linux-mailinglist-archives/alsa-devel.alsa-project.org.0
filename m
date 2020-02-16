Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C248160731
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 00:24:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C46D1677;
	Mon, 17 Feb 2020 00:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C46D1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581895480;
	bh=3QKL9/dtHVcJrsIrhqQvHySMfy6dmQMq6Uo01/L6c20=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LhBfGIr3R6x29S3dr2QP40hURHYtaeRg82I6leJdjr9fhwulxlETGTDvZaoDwWf4R
	 +eJTfDVKwNkXmaFD2J7zkJD4F0qdFjEucQ2pOO8V92TuUru78AvjkP5OAPHps/Pdt7
	 ya1c/c5hTxOfT8b4IC1/5aizb4hifUEUhmSIbVvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26DA6F8027D;
	Mon, 17 Feb 2020 00:21:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F535F80145; Mon, 17 Feb 2020 00:21:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F0C5F80138
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F0C5F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="jDhLpDOD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="J5Et/ArF"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A1C5A40F;
 Sun, 16 Feb 2020 18:21:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 18:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=SWLqZb9zqp7Iz
 Oga1M+7E+qtPf8iOyJLDa/iZoQvwzM=; b=jDhLpDODm5DE2N7TRqIVNyhBmBTQ+
 g6umIiyXj0Wm/loWObigMfBbnkrcRpO7+0nGhDR9jNVDJcbymb5HabQMkvJ1fZiu
 zLV7hZkTBrbmuG6vvJr1lSbOT9+m0Z8PWbN40ObLBxVY59W8HlHnVYlALgQkN7C3
 4Umh+UQ5dKx0AttRVnrlSCTRK/KtI/7KF84LfnoFwuJGMOObUmZtSHb6by1hr1jp
 xm7+kM3ukbLTX39Zy/y5D3Rxk79tV+kJ9XtxxCEJaW5IIRYaGZNmlCP8lN62eMQF
 s0fxHaTcLxbqzbYGfKU2yC3jrcrm9v1Mk2ips2j1foDGOGjoej2UfAPsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=SWLqZb9zqp7IzOga1M+7E+qtPf8iOyJLDa/iZoQvwzM=; b=J5Et/ArF
 Crf/Lx3rKah/A2yL9H5TfEJZ/CtDCHCphGhOtRFpwdfdc1pMquHaU8IkzW8WCTi8
 1WTFw/J6eCKorx2iN1+qzYaKrO1MwJa8e/oCcbuIsp89tY7If96p4rEvco8+FGKK
 SWesogOT0oHZuLP/XdZRAV/8g0hHVTpvysNvpL+jsl526zZZHljFuJVAnu91QeRk
 CHlzowVEUlcA4een2rRUvottNzSgeCQtFrRGttBkTsBcOKI7YOdGM+hpbK2ViRSV
 j1NOBKSdgncXodJTYhbx0jqJTy1Yn6MekqkKvPqD87RJWECDsHVuIjlqPgdNDgbu
 tjnbbXoEPdr8pA==
X-ME-Sender: <xms:bc5JXhu8Q8H8oMXZbHvn4D81jfkwsyqabzzzY_0vJIbO9GNsl0WWrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:bc5JXlGJO3lTGvl44Ffb_JR2Cyi83BXC58P7umQ2k5P5GhbphMsIsA>
 <xmx:bc5JXqzzBQJHTib8LFbWmjMlLMpRLHu7d6xNcpP6FB6VRtmR3Ibr5g>
 <xmx:bc5JXn1EDMk5ONC1TKXBVUmxssrGmwa3xid-3ziOlL0pdY85Bd7_hA>
 <xmx:bc5JXnjMe0DoqDIGDRWPlm7kg92ZknfGWO6elgO7Hz4vcSHkN3lmsw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id BAB223060F9B;
 Sun, 16 Feb 2020 18:21:16 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Date: Sun, 16 Feb 2020 17:21:14 -0600
Message-Id: <20200216232114.15742-4-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216232114.15742-1-samuel@sholland.org>
References: <20200216232114.15742-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 3/3] ASoC: simple-card: Add support for
	codec to codec DAI links
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

Following the example in cb2cf0de1174 ("ASoC: soc-core: care Codec <->
Codec case by non_legacy_dai_naming"), determine if a DAI link contains
only codec DAIs by examining the non_legacy_dai_naming flag in each
DAI's component.

For now, we assume there is only one or a small set of valid PCM stream
parameters, so num_params == 1 is good enough. We also assume that the
same params are valid for all supported streams. We calculate the subset
of parameters common among all DAIs, and then the existing code
automatically chooses the highest quality of the remaining values.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 Documentation/sound/soc/codec-to-codec.rst |  9 +++-
 sound/soc/generic/simple-card-utils.c      | 50 ++++++++++++++++++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/Documentation/sound/soc/codec-to-codec.rst b/Documentation/sound/soc/codec-to-codec.rst
index 810109d7500d..4eaa9a0c41fc 100644
--- a/Documentation/sound/soc/codec-to-codec.rst
+++ b/Documentation/sound/soc/codec-to-codec.rst
@@ -104,5 +104,10 @@ Make sure to name your corresponding cpu and codec playback and capture
 dai names ending with "Playback" and "Capture" respectively as dapm core
 will link and power those dais based on the name.
 
-Note that in current device tree there is no way to mark a dai_link
-as codec to codec. However, it may change in future.
+A dai_link in a "simple-audio-card" will automatically be detected as
+codec to codec when all DAIs on the link belong to codec components.
+The dai_link will be initialized with the subset of stream parameters
+(channels, format, sample rate) supported by all DAIs on the link. Since
+there is no way to provide these parameters in the device tree, this is
+mostly useful for communication with simple fixed-function codecs, such
+as a Bluetooth controller or cellular modem.
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 9b794775df53..e380ffb2d480 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -331,6 +331,52 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
+					    struct simple_dai_props *dai_props)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_component *component;
+	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_pcm_stream *params;
+	struct snd_pcm_hardware hw;
+	int stream;
+	int ret;
+
+	/* Only codecs should have non_legacy_dai_naming set. */
+	for_each_rtd_components(rtd, rtdcom, component) {
+		if (!component->driver->non_legacy_dai_naming)
+			return 0;
+	}
+
+	/* Assumes the capabilities are the same for all supported streams */
+	for (stream = 0; stream < 2; stream++) {
+		ret = snd_soc_runtime_calc_hw(rtd, &hw, stream);
+		if (ret == 0)
+			break;
+	}
+
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
@@ -347,6 +393,10 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret < 0)
 		return ret;
 
+	ret = asoc_simple_init_dai_link_params(rtd, dai_props);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_dai_init);
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
