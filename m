Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21487160732
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 00:24:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCB42846;
	Mon, 17 Feb 2020 00:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCB42846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581895497;
	bh=AhacRAaQ/rmPIYh/aTti0prLfX9Wl2nOWYDe9Uo/VkA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=muq1tn2MagIybiSZCdtVOQ9to5vuWkz1Cf1h86PglxpRq1U+eGNeC1E7GtvA36aNR
	 rL5yFuiWHyQr3TlV0pc4gUuZS0KZl143D+dECk/fvS0YBBp+tNApv0KIjhTYvJ2lu5
	 x5DCJHqMrLJ+CXmpPh4VpSbPHDM3M8pV4ZEmoI10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1636EF8028A;
	Mon, 17 Feb 2020 00:21:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C79FF80148; Mon, 17 Feb 2020 00:21:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A90E7F80148
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A90E7F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Xb0eOrhQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RG3iunF4"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 901BE214;
 Sun, 16 Feb 2020 18:21:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 18:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=u5rUOaZ+KA63Q
 O6fIYH5aQOsADl1tkc31gZUEhaZhl4=; b=Xb0eOrhQq8Q73vlh0qkXpFaJ+Z8SS
 v8Rze1LExsNTDdLtNKNPOqnbWsif1MElfrFJSj9yk0BPQv6PiHXsw6ejm5xPV/yF
 tXA3pHm8FtxhsVEX0hSteBEuTqreKhACtRb67CmE7NXxW2Mj6R7peXeN59dE3oZ+
 tqH8SI6mQMTOjm0fuKxlsuA/JMfygJcM8RM0Bg0HiJqQ7ROzsZrOdWE605XHzAkm
 2c8cWiskAkI2YIvb4ePD0U/Lu2skbl3MXNKHvunZQ07Nqkq3qA7M950j4hxBJdSH
 p+nF52Mxq+hYfjD6y6o97H5d+ukDyXwM7a/hX1zZ6ASQJMF+0cbExB1OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=u5rUOaZ+KA63QO6fIYH5aQOsADl1tkc31gZUEhaZhl4=; b=RG3iunF4
 A1SnUeDBaVySLB0qCqwUyGvPX0CRbZnclQBePYe2Po9DK9cx5IE7RySqmNaxt75P
 Z5l020fv92U5ZAHHTJfo5uNZOn3Hcygn/GcLK72TuBVbX8M7eLkHuI9iXa0G8IQp
 YaUJNC/nuUb6FKEdksrTVscfRR7SctqjxPWzAEYh5EV0W1cFDvnEl+P3caCf40ZI
 nU4DXZpq9yhJt9rMS7nzB1yPupXquBxUF/8y4oay4TfXIoo9wdQXipI6lAxJ5VvR
 lSKbs2fkupX1Mpz8lS50k6NRxYGTB6Jr/vsxfN/tRc8UxxU+PLesBp/HZMp9+SIZ
 7Yo0HzIFCLxVLg==
X-ME-Sender: <xms:bM5JXn0VZ0-5ulmC5Fp_iM0S1fA1LE6LOj2axFmuA9gqSG3ie0ZsTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:bM5JXpxnND9XeiOJO7aOgrR1h8VBaowGvWjGf7IOSnrBhPAhAyqhjw>
 <xmx:bM5JXgiTrZGowhYf1DsOjfZFCwq_l2OWQiwJzreNq9GblbtSfyv2zA>
 <xmx:bM5JXuMR4aTFMQ2buZEWmztC4dnaO3NGf8FIgTtG-CTo4SYVpi-SEw>
 <xmx:bc5JXpJbUu_hr6_ztWcAKc6XR_gepp4wha2aEtBQuJ1JNdPkydtOEA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 51C613060F09;
 Sun, 16 Feb 2020 18:21:16 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Date: Sun, 16 Feb 2020 17:21:13 -0600
Message-Id: <20200216232114.15742-3-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216232114.15742-1-samuel@sholland.org>
References: <20200216232114.15742-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 2/3] ASoC: pcm: Export parameter
	intersection logic
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

The logic to calculate the subset of stream parameters supported by all
DAIs associated with a PCM stream is nontrivial. Export a helper
function so it can be used to set up simple codec2codec DAI links.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 include/sound/soc.h |  3 +++
 sound/soc/soc-pcm.c | 55 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 262896799826..578a8e3e08ca 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -473,6 +473,9 @@ bool snd_soc_runtime_ignore_pmdown_time(struct snd_soc_pcm_runtime *rtd);
 void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream);
 void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream);
 
+int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_pcm_hardware *hw, int stream);
+
 int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	unsigned int dai_fmt);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 01e7bc03d92f..b53429330c8a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -348,11 +348,18 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
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
@@ -364,7 +371,7 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 	u64 formats = ULLONG_MAX;
 	int i;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
 		cpu_stream = &cpu_dai_drv->playback;
 	else
 		cpu_stream = &cpu_dai_drv->capture;
@@ -377,16 +384,12 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
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
@@ -398,6 +401,9 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 		rates = snd_pcm_rate_mask_intersect(codec_stream->rates, rates);
 	}
 
+	if (!chan_min)
+		return -EINVAL;
+
 	/*
 	 * chan min/max cannot be enforced if there are multiple CODEC DAIs
 	 * connected to a single CPU DAI, use CPU DAI's directly and let
@@ -410,18 +416,35 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
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

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
