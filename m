Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 755321695A6
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Feb 2020 04:47:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D20F816D7;
	Sun, 23 Feb 2020 04:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D20F816D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582429647;
	bh=uaLFz/V937gh7Bur0STGGP5WizaD72/yIZz4J7Am2xI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dz22EnUDQsbfRVDjflQ+CT20oZD8wAWXcQAYzLhYzsyz611YvSjCORSASQBeaUT+Y
	 xR6BjXNkqu7AIxFcrbBn7uK7o39aNipHEMGT+ZVPal2lDs2j01h10MD4CJodRqDg//
	 SCImf+uCcM+KZ927b6NdZrdNXKk5nN9l03izZ464=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E77F80161;
	Sun, 23 Feb 2020 04:45:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A250F80161; Sun, 23 Feb 2020 04:45:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59744F80142
 for <alsa-devel@alsa-project.org>; Sun, 23 Feb 2020 04:45:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59744F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="OVAe4Sx4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="u+rr7xFz"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id CAA9F6A25;
 Sat, 22 Feb 2020 22:45:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 22 Feb 2020 22:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=nH7Kmg7ThlWd7
 kEVdMu3S/euAwB/rKaoU3VHdY5QxBQ=; b=OVAe4Sx446LxGgN5sp1ikghZE7vAR
 O9pJYZuq22lK0wfTAr3jJsryYqoAJ5DogOJ4JZNW4l2oKVC0Vzc1knQVb32VdHGv
 BLCN+OX1IUrFzaUBeSdKmPe6XWVyuZgoeOJUcJmaqijqgj80j9R3ovhBLZD+WWi7
 rC0RR7jMk1UaZ5A9DT1cVLxW7cUMUfjTkudqqD75QumsQq0uzkBopXJDpOrPTs0+
 3/k6qnarHW2QtCSjR2tsHcoQ33nldPUxN/Y8USiJEWpx8ZcEbCc9/duhxcmQsTxB
 79XzGTPyqDArJv+7uO8b9RmHTCr9vjMnjbgwg5hguc1ZBrFwEp+QgUq6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nH7Kmg7ThlWd7kEVdMu3S/euAwB/rKaoU3VHdY5QxBQ=; b=u+rr7xFz
 EzRsweMFroTrcBPjNfiLh+lsfVdofaxUzMmJFL0xF4latTvCHfpHs4vHOmT142F0
 AZHjT0FzhUlOl2oE1SGV1XoZdiZjRPaQcSXRWBTqegCfjJCTOsULNRCz3V05Kick
 4koySjvhzuWjR6Tn6BgqYNFYHovkxdAtZIeRVdutj8ayzqctLfqMy99Wb3qhlyT4
 CglMhK6N5OJPIr2BEFLViKhVfCoVMzN+f/+Q9C6QyAOnxgLsbc5I23SzBlXah5c3
 GqvKv7iasWCbHOeF2hozFVhlBqkuVr3IqK4nKZxapOCtnwEj30UOeSnTFKWsKdUv
 2aff2/f3uj9loA==
X-ME-Sender: <xms:X_VRXjBy9mqHTZJCAsn0KlG589KyUBYs1G5haL151xoBKrDSYaSxVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeejgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:X_VRXkv8xKkgvZm-CJw1aJHqcC4ZRYEV7Cin7HP6mYq1vZq8Lujwvg>
 <xmx:X_VRXiZM5x68EsXSDGT1oJn2wx3rMtKocxtvloZFl7WLhy2rvyVCUA>
 <xmx:X_VRXgGWmvzK1DFA-tjY2VIsU7tb9fNgxZmJC54M1ENxk0vwTWmHAw>
 <xmx:X_VRXqk_wSKm55TmQKgCKr6ge91tNMaZdwh8nIbaoeCD0z4Yz2OVjA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id E22E43060FCB;
 Sat, 22 Feb 2020 22:45:34 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 2/3] ASoC: pcm: Export parameter intersection logic
Date: Sat, 22 Feb 2020 21:45:32 -0600
Message-Id: <20200223034533.1035-3-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200223034533.1035-1-samuel@sholland.org>
References: <20200223034533.1035-1-samuel@sholland.org>
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

The logic to calculate the subset of stream parameters supported by all
DAIs associated with a PCM stream is nontrivial. Export a helper
function so it can be used to set up simple codec2codec DAI links.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 include/sound/soc.h |  3 +++
 sound/soc/soc-pcm.c | 55 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f0e4f36f83bf..8724928d02c5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -471,6 +471,9 @@ bool snd_soc_runtime_ignore_pmdown_time(struct snd_soc_pcm_runtime *rtd);
 void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream);
 void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream);
 
+int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_pcm_hardware *hw, int stream);
+
 int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	unsigned int dai_fmt);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ff1b7c7078e5..6680d31eece3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -402,11 +402,18 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	soc_pcm_set_msb(substream, cpu_bits);
 }
 
-static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
+/**
+ * snd_soc_runtime_calc_hw() - Calculate hw limits for a PCM stream
+ * @rtd: ASoC PCM runtime
+ * @hw: PCM hardware parameters (output)
+ * @stream: Direction of the PCM stream
+ *
+ * Calculates the subset of stream parameters supported by all DAIs
+ * associated with the PCM stream.
+ */
+int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_pcm_hardware *hw, int stream)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_pcm_hardware *hw = &runtime->hw;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai_driver *cpu_dai_drv = rtd->cpu_dai->driver;
 	struct snd_soc_dai_driver *codec_dai_drv;
@@ -418,7 +425,7 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 	u64 formats = ULLONG_MAX;
 	int i;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
 		cpu_stream = &cpu_dai_drv->playback;
 	else
 		cpu_stream = &cpu_dai_drv->capture;
@@ -431,16 +438,12 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 		 * Otherwise, since the rate, channel, and format values will
 		 * zero in that case, we would have no usable settings left,
 		 * causing the resulting setup to fail.
-		 * At least one CODEC should match, otherwise we should have
-		 * bailed out on a higher level, since there would be no
-		 * CODEC to support the transfer direction in that case.
 		 */
-		if (!snd_soc_dai_stream_valid(codec_dai,
-					      substream->stream))
+		if (!snd_soc_dai_stream_valid(codec_dai, stream))
 			continue;
 
 		codec_dai_drv = codec_dai->driver;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
 			codec_stream = &codec_dai_drv->playback;
 		else
 			codec_stream = &codec_dai_drv->capture;
@@ -452,6 +455,9 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 		rates = snd_pcm_rate_mask_intersect(codec_stream->rates, rates);
 	}
 
+	if (!chan_min)
+		return -EINVAL;
+
 	/*
 	 * chan min/max cannot be enforced if there are multiple CODEC DAIs
 	 * connected to a single CPU DAI, use CPU DAI's directly and let
@@ -464,18 +470,35 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
 	hw->channels_min = max(chan_min, cpu_stream->channels_min);
 	hw->channels_max = min(chan_max, cpu_stream->channels_max);
-	if (hw->formats)
-		hw->formats &= formats & cpu_stream->formats;
-	else
-		hw->formats = formats & cpu_stream->formats;
+	hw->formats = formats & cpu_stream->formats;
 	hw->rates = snd_pcm_rate_mask_intersect(rates, cpu_stream->rates);
 
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_hw_limit_rates(hw);
 
 	hw->rate_min = max(hw->rate_min, cpu_stream->rate_min);
 	hw->rate_min = max(hw->rate_min, rate_min);
 	hw->rate_max = min_not_zero(hw->rate_max, cpu_stream->rate_max);
 	hw->rate_max = min_not_zero(hw->rate_max, rate_max);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_runtime_calc_hw);
+
+static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_hardware *hw = &substream->runtime->hw;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	u64 formats = hw->formats;
+
+	/*
+	 * At least one CODEC should match, otherwise we should have
+	 * bailed out on a higher level, since there would be no
+	 * CODEC to support the transfer direction in that case.
+	 */
+	snd_soc_runtime_calc_hw(rtd, hw, substream->stream);
+
+	if (formats)
+		hw->formats &= formats;
 }
 
 static int soc_pcm_components_open(struct snd_pcm_substream *substream,
-- 
2.24.1

