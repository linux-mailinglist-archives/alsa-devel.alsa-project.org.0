Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB788179EF8
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 06:14:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21641668;
	Thu,  5 Mar 2020 06:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21641668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583385267;
	bh=YdjkLN6zaCqzm7BNkMrKO+hhUwT5/Yiwy2j0ceuVxxE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6k0PE3kXizHbk/qxo954+p9N9qoaYbXhgk82DC959NPci2x3U1FOAwQ6Piv9+LRd
	 9jxa/qUNzu42I6zgwr/2WT+wLMgyP/ir09D99ReGv1pG//ocOLi5ErrXRWgNflIOkg
	 b5i1gG3ibpMqDdxrtAmry6VcmAENy9eTO3KQg4Vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 253E2F8027B;
	Thu,  5 Mar 2020 06:12:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC054F800D8; Thu,  5 Mar 2020 06:11:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D78ADF800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 06:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D78ADF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="szqNxEJq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BgPpJs9X"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5548A13FA;
 Thu,  5 Mar 2020 00:11:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 05 Mar 2020 00:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0dYXasnkpGOQZ
 LFyXNdb8zxFf9H+yIuoHLwntjCQcYE=; b=szqNxEJqg4QyV52aLoqP+WYBelowo
 eQ6BEYKCOFpgD+JXGqx2NZ8zCi5IlmLadM1ynCd3hdA9wF6wiMPqrn6C95LRqlH3
 OI6OKss6LOzAcPykH02uDzlmxDWmuV7PQLDXGmuuUxxCIByXUO+AA4xRwh4Pb6LL
 TRndzK085mhIXgWW0RKHnj6GOBgUU5tHvykmLpw82rBhHzVTNWDxqF9YHpORrbHm
 fDWMIyPoWocTFr95WWg2cRuYfKfBjMnCY8v+SX+3SLpDq4V20EwpXJMBigfRt1x8
 JqDi1X0LdN4/45+YB+0e3kh5RGL8RVF3deNBB2MNdW0Jnls9kcxo1Pkpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0dYXasnkpGOQZLFyXNdb8zxFf9H+yIuoHLwntjCQcYE=; b=BgPpJs9X
 qsYUrb9w7uwYG19jMccmRazQAMNM546YSkycFXyGzqfy7hcSFCLBJj8e30U0O2zm
 zwtGl4HcGFuJYOJSbzOQZfdQziPb2dXHjzUPN8HaAPW4tMlpPgl4x5d4HAFyJ38J
 yEVmEaKqkRYaux+wLthEup7zSjN4t02GD6xmOmq9vlHsITLro6Mged8Q7OXBeaIU
 HWdwXX/qcKg6UlhizRVNBKdrhbNuYTWhhkBtERsbVkVk04JTSkdL2ZoXznC9bEft
 SW45YobGLe8dMjV/nGEjwffXu0o/AcJTNGK2JdE5wVToeipLwAMalDeawOlGyOEg
 0bTrPZ6pn+IMSg==
X-ME-Sender: <xms:EYpgXr6j67OazVuBPO9hACrMGV7_3SHA7XpD6g2LmPdpHkjMa2BTWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddtledgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
 epjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:EYpgXhGI7sRg5OEHhbkLiPFtze7OlPJqaHEE3WaXkSNID1MYGCqiLw>
 <xmx:EYpgXlGaXqlC7FSaK9l_GMfgxFHAiD895wzeShRcFS2bUisNgGUXow>
 <xmx:EYpgXntxGPM4zr3xWEW0WVHhFotmFeUToX0DEMZGee8om_Sgb3isrA>
 <xmx:EopgXvo5zk0bawmLU3Hc_R0gLlq_TZdZO72Hk_z3Qf30ZBwDoZaVYw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6C5853280067;
 Thu,  5 Mar 2020 00:11:45 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 3/3] ASoC: simple-card: Add support for codec2codec DAI
 links
Date: Wed,  4 Mar 2020 23:11:43 -0600
Message-Id: <20200305051143.60691-4-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305051143.60691-1-samuel@sholland.org>
References: <20200305051143.60691-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
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

Following the example in cb2cf0de1174 ("ASoC: soc-core: care Codec <->
Codec case by non_legacy_dai_naming"), determine if a DAI link contains
only codec DAIs by examining the non_legacy_dai_naming flag in each
DAI's component.

For now, we assume there is only one or a small set of valid PCM stream
parameters, so num_params == 1 is good enough. We also assume that the
same params are valid for all supported streams. params is set to the
subset of parameters common among all DAIs, and then the existing code
automatically chooses the highest quality of the remaining values when
the link is brought up.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 Documentation/sound/soc/codec-to-codec.rst |  9 +++-
 sound/soc/generic/simple-card-utils.c      | 48 ++++++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)

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
index 9b794775df53..320e648f7499 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -331,6 +331,50 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
+					    struct simple_dai_props *dai_props)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_component *component;
+	struct snd_soc_pcm_stream *params;
+	struct snd_pcm_hardware hw;
+	int i, ret, stream;
+
+	/* Only codecs should have non_legacy_dai_naming set. */
+	for_each_rtd_components(rtd, i, component) {
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
@@ -347,6 +391,10 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
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

