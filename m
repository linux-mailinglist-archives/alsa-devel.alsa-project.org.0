Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC0F15B9AA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 07:39:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0AB71685;
	Thu, 13 Feb 2020 07:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0AB71685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581575976;
	bh=DIbsSe8ic8fDJ5UUbz11cMvjIKtxEh8J+CXdSfsIvfE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=onxl3S+0LSoydmUUIHdk7IHDkVin9BJRpuJ5NXZwEXm1N5RJYL1ZTqDmch3Vd7nT7
	 YrzB92flzZkRAnKT7WWmuqYHBbKbh9fhWaFTafkPB0Bo8kUE8R85dPC+yT/NSiZRKB
	 iYZacwwwwt3qSqwIfQK42kCuYgeKroHVdggOCOJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D734DF8028A;
	Thu, 13 Feb 2020 07:36:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF847F8021E; Thu, 13 Feb 2020 07:12:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B62FFF80146
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B62FFF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="HuTe7gDh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="r08qgJFV"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 85D655745;
 Thu, 13 Feb 2020 01:11:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 13 Feb 2020 01:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=BnFpMnZIH+IrE
 oIeA9z7OmIPXGTf7QPVyZwphJmMTpk=; b=HuTe7gDhC+/6vGK7BZT2Eg/qMRRoI
 F1u/FUOyMZZPbZyKnRtLwFAAWa0mEWwNxT2mOs9Spz/KMKcYCURKLNyzQokOn5JH
 YcrOc/zXveoHT4JjNMnDkHuFsRxVNebrRKWkgos8nrje2EivrgJNUiyPt25N6ZGO
 G2ngwCGmSxr0RUYsVn7jZf2Nm9TGbEXl11zTZmec4+8G5h1IW4gfTfNBQJWjnTOh
 pS5w5MdWhaY2fUxE74B23JADsT2HA6AZd/3PJgwLwRtr/BZ6Ov+IK9UBjKFgp6Cu
 4l9NfBb7Pp/vT5MpB6RVbh+YAXNRhlA3U4neVDoPI+I1WmBWTGAtzb2pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=BnFpMnZIH+IrEoIeA9z7OmIPXGTf7QPVyZwphJmMTpk=; b=r08qgJFV
 vVUqOibRPrPFxRsY5nZMTV8qJ1awZORWHSOs0B5qQVlI9+RlmK60KEp3XgjLzkDY
 FRNMqmnow5lQQlfutVkRguKe9CFo11IdAyK4p9xM8T9jobiWFjIYgmyJklvAAGXs
 BY4jdfzB3qK3bu8b/sfKeCNvdyeLNW4ttudTCgygtwqm0NPaGnzXRclsVuOdqSuL
 QCdKJyl9bf5DbgPOybS1Ac/w+QrG9BqdA+qGoF1ePiql0gFJhkmeL1Onv5oZ7zDI
 xZGCLWJQ0FPEhF5O4nDhFa5xG+VAWRIe9WPLO58F6rLodasOoM7Ji/pSA6qggZef
 CGz2u+oipiSzGQ==
X-ME-Sender: <xms:p-hEXtBrKZzfVelcFLI7DpwXgf8Xa2TXNFpBiEWI1NK-4MlbRa4Kwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieejgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:p-hEXgzRPodw9Jcubj6pueg6SBCO4GBLlv2sFaXsTVW8tzEexRrOww>
 <xmx:p-hEXqRpM_1wWRDO1r5g7wqOhP3gwGIp_hKOX8KUd7cQiQcZDB3zCg>
 <xmx:p-hEXv9IRs-mWL9OotWgW5gwAHvg0VgfOPScmSg6VvzzfaYkb_wgew>
 <xmx:p-hEXm8ZEJ4FuzP87YMwjDzuBcliNYivaowgPBcRf4ATWZ6n1eFUxw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2DB33280067;
 Thu, 13 Feb 2020 01:11:50 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 13 Feb 2020 00:11:46 -0600
Message-Id: <20200213061147.29386-4-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213061147.29386-1-samuel@sholland.org>
References: <20200213061147.29386-1-samuel@sholland.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Feb 2020 07:36:42 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [alsa-devel] [PATCH 3/4] ASoC: pcm: Export parameter intersection
	logic
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
 sound/soc/soc-pcm.c | 53 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 41 insertions(+), 15 deletions(-)

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
index bd7b3cfcfa62..562af1d3f24e 100644
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
@@ -410,10 +416,7 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
 	hw->channels_min = max(chan_min, cpu_stream->channels_min);
 	hw->channels_max = min(chan_max, cpu_stream->channels_max);
-	if (hw->formats)
-		hw->formats &= formats & cpu_stream->formats;
-	else
-		hw->formats = formats & cpu_stream->formats;
+	hw->formats = formats & cpu_stream->formats;
 	hw->rates = snd_pcm_rate_mask_intersect(rates, cpu_stream->rates);
 
 	snd_pcm_limit_hw_rates(hw);
@@ -422,6 +425,26 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
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
