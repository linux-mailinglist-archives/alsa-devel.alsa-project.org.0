Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E2C3766CD
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 16:07:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8357F1686;
	Fri,  7 May 2021 16:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8357F1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620396467;
	bh=xbskP3zIzypGXJF7eef1R3mRyWYMg6q1xxXx1MFfeD4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EqW8DxPTrxpmV377Kb8ezXsqE5vCjzzknLzN6x6xY8dYLEohaijYQy/OScR5LwGPX
	 FuppE2ca/eo6S5Z/UwtIbtitR+Zbh4Eh1YLMitRxkbbXsX+5VbIjAiKRMiwBXTNemr
	 lIe/ys3vKmvCwW7lV3FktFhSPjfDx3PYE7dPYftk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92741F804AB;
	Fri,  7 May 2021 16:05:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B137FF804AD; Fri,  7 May 2021 16:05:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0602DF804AC
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 16:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0602DF804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="PKdfXH/2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cbkZKaVw"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id DA799F9B;
 Fri,  7 May 2021 10:05:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 07 May 2021 10:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ejMR2p4vrr0uC
 Wubp8kz2ujkHTEjbi5LEmMeT3y3bpY=; b=PKdfXH/2hSpGDU8ToIBOVbNfZzmaB
 LBDxYF8x/O/RhlmE142CzieyuwEBBiNZLD45/E/T3Ycc1oOUB8tejZxnvPBPxtUb
 81RLf24PL9l/vWje65xKUIpdr6OUL4li3DvHyXdTvqK5mcF0pZY6qFhGQvWDyma2
 xi1RRXPHihMw7ErxYU6Si0IIqLVBwNRN9Xj+zAgj98ZUd3xe1I7CyGIyduDApWZ4
 EVQX7yR99phP7Z0zmo9/4GSsYDPbjjztsmk23CT6YDe8/j6QGyXQW5+A5WEEjpUn
 GjkidME+6jxhyvIJZvLkCm40YmlnNVtTlINTYL0nVWsqyjhlTl6nBNvzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ejMR2p4vrr0uCWubp8kz2ujkHTEjbi5LEmMeT3y3bpY=; b=cbkZKaVw
 Aw6FN4Z7ft30u2JVD3vi+eQm4793+pPkp1AblmyNGL8NdCDdPqIRv5cTrTTn5n9b
 2M9AMMrylKcjmGZHwtc3gWnvyNmuErpGmrE4Ryycc+ktXaHG6NHhszbr9PSd0HD7
 gvzpEpvFw4D5O+ZKeGVeysZqQpRGsiWn3A84EAqFcSFfOlPTHS/bW+H5d//SCBt2
 Wq2dkUwyqqwYiKpoLaDDOtR1+tYG+SJBiiXsXsBlcrH2/jLnh9BiHVs/5QEKVdf9
 e6FNDwJZoPfnubnu/dDZhILzRIonGgnepFhnEe+PfaXwx2/sWYPggnP9KztyGAA9
 LPP3HfE/zxPqoA==
X-ME-Sender: <xms:EEmVYDY1IxSz2z2ZvGBvZp2nyCOctmGTqv3hHiIoyhY-OCX4ShbIOQ>
 <xme:EEmVYCZIil5ND1CVHX6bWY2MV04MOjy62vE775POyq6_WY0aXeOG53Ae47XXuIoUc
 mzwW3fo18AQsCd8XSs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepfeffhfevfeeghfekleehieelledvieelgeduffeivdffvedtheejuedvjedu
 gfeinecuffhomhgrihhnpegtvggrrdgthhgrnhhnvghlnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EEmVYF80G-wNvFVhA_HIx5IAk0SxiGlGjKHFqkVw-o0pixA4Kd1DCA>
 <xmx:EEmVYJoSGufVGjUM1UAFCNw7F_l5BGOYLv9jtDcA5w9lU8z1GI-hJA>
 <xmx:EEmVYOoLDMH5fBOz0Nx9CGRqGfnZSJsIW4WmP2fq0jbYUu6QsgIXEA>
 <xmx:EEmVYHYi2VD5MQ1ZDQ_57SeF4GYLvViSNCUCF-pWKQk_4QS6B8CjConM6dw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:05:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 04/11] ASoC: hdmi-codec: Add a prepare hook
Date: Fri,  7 May 2021 16:03:27 +0200
Message-Id: <20210507140334.204865-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507140334.204865-1-maxime@cerno.tech>
References: <20210507140334.204865-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
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

The IEC958 status bit is usually set by the userspace after hw_params
has been called, so in order to use whatever is set by the userspace, we
need to implement the prepare hook. Let's add it to the hdmi_codec_ops,
and mandate that either prepare or hw_params is implemented.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/sound/hdmi-codec.h    |  12 +++-
 sound/soc/codecs/hdmi-codec.c | 112 ++++++++++++++++++++++++++--------
 2 files changed, 99 insertions(+), 25 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 4b3a1d374b90..4fc733c8c570 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -65,12 +65,22 @@ struct hdmi_codec_ops {
 
 	/*
 	 * Configures HDMI-encoder for audio stream.
-	 * Mandatory
+	 * Having either prepare or hw_params is mandatory.
 	 */
 	int (*hw_params)(struct device *dev, void *data,
 			 struct hdmi_codec_daifmt *fmt,
 			 struct hdmi_codec_params *hparms);
 
+	/*
+	 * Configures HDMI-encoder for audio stream. Can be called
+	 * multiple times for each setup.
+	 *
+	 * Having either prepare or hw_params is mandatory.
+	 */
+	int (*prepare)(struct device *dev, void *data,
+		       struct hdmi_codec_daifmt *fmt,
+		       struct hdmi_codec_params *hparms);
+
 	/*
 	 * Shuts down the audio stream.
 	 * Mandatory
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 45081f928680..08b5880e8ca4 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -482,6 +482,42 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	mutex_unlock(&hcp->lock);
 }
 
+static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
+					unsigned int sample_width,
+					unsigned int sample_rate,
+					unsigned int channels,
+					struct hdmi_codec_params *hp)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	int idx;
+
+	/* Select a channel allocation that matches with ELD and pcm channels */
+	idx = hdmi_codec_get_ch_alloc_table_idx(hcp, channels);
+	if (idx < 0) {
+		dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
+			idx);
+		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
+		return idx;
+	}
+
+	memset(hp, 0, sizeof(*hp));
+
+	hdmi_audio_infoframe_init(&hp->cea);
+	hp->cea.channels = channels;
+	hp->cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
+	hp->cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
+	hp->cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
+	hp->cea.channel_allocation = hdmi_codec_channel_alloc[idx].ca_id;
+
+	hp->sample_width = sample_width;
+	hp->sample_rate = sample_rate;
+	hp->channels = channels;
+
+	hcp->chmap_idx = hdmi_codec_channel_alloc[idx].ca_id;
+
+	return 0;
+}
+
 static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -496,13 +532,24 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 			.dig_subframe = { 0 },
 		}
 	};
-	int ret, idx;
+	int ret;
+
+	if (!hcp->hcd.ops->hw_params)
+		return 0;
 
 	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
 		params_width(params), params_rate(params),
 		params_channels(params));
 
-	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp->iec_status));
+	ret = hdmi_codec_fill_codec_params(dai,
+					   params_width(params),
+					   params_rate(params),
+					   params_channels(params),
+					   &hp);
+	if (ret < 0)
+		return ret;
+
+	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));
 	ret = snd_pcm_fill_iec958_consumer_hw_params(params, hp.iec.status,
 						     sizeof(hp.iec.status));
 	if (ret < 0) {
@@ -511,32 +558,47 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	hdmi_audio_infoframe_init(&hp.cea);
-	hp.cea.channels = params_channels(params);
-	hp.cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
-	hp.cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
-	hp.cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
-
-	/* Select a channel allocation that matches with ELD and pcm channels */
-	idx = hdmi_codec_get_ch_alloc_table_idx(hcp, hp.cea.channels);
-	if (idx < 0) {
-		dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
-			idx);
-		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
-		return idx;
-	}
-	hp.cea.channel_allocation = hdmi_codec_channel_alloc[idx].ca_id;
-	hcp->chmap_idx = hdmi_codec_channel_alloc[idx].ca_id;
-
-	hp.sample_width = params_width(params);
-	hp.sample_rate = params_rate(params);
-	hp.channels = params_channels(params);
-
 	cf->bit_fmt = params_format(params);
 	return hcp->hcd.ops->hw_params(dai->dev->parent, hcp->hcd.data,
 				       cf, &hp);
 }
 
+static int hdmi_codec_prepare(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned int channels = runtime->channels;
+	unsigned int width = snd_pcm_format_width(runtime->format);
+	unsigned int rate = runtime->rate;
+	struct hdmi_codec_params hp;
+	int ret;
+
+	if (!hcp->hcd.ops->prepare)
+		return 0;
+
+	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
+		width, rate, channels);
+
+	ret = hdmi_codec_fill_codec_params(dai, width, rate, channels, &hp);
+	if (ret < 0)
+		return ret;
+
+	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));
+	ret = snd_pcm_fill_iec958_consumer(runtime, hp.iec.status,
+					   sizeof(hp.iec.status));
+	if (ret < 0) {
+		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
+			ret);
+		return ret;
+	}
+
+	cf->bit_fmt = runtime->format;
+	return hcp->hcd.ops->prepare(dai->dev->parent, hcp->hcd.data,
+				     cf, &hp);
+}
+
 static int hdmi_codec_i2s_set_fmt(struct snd_soc_dai *dai,
 				  unsigned int fmt)
 {
@@ -628,6 +690,7 @@ static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
 	.startup	= hdmi_codec_startup,
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
+	.prepare	= hdmi_codec_prepare,
 	.set_fmt	= hdmi_codec_i2s_set_fmt,
 	.mute_stream	= hdmi_codec_mute,
 };
@@ -918,7 +981,8 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	}
 
 	dai_count = hcd->i2s + hcd->spdif;
-	if (dai_count < 1 || !hcd->ops || !hcd->ops->hw_params ||
+	if (dai_count < 1 || !hcd->ops ||
+	    (!hcd->ops->hw_params && !hcd->ops->prepare) ||
 	    !hcd->ops->audio_shutdown) {
 		dev_err(dev, "%s: Invalid parameters\n", __func__);
 		return -EINVAL;
-- 
2.31.1

