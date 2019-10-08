Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5035ECF906
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 13:58:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C42321660;
	Tue,  8 Oct 2019 13:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C42321660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570535904;
	bh=x46DiqKFHfuZav+4D4LECXAdIJdP5U6fddkQOPMPdE0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dWKJLUfow+DiyU0MvxDfcPaQhJ6628qkIAObLaJNrhiZ+EIYoMcSa+xklNJ/DO+JH
	 DSIjJ7BWqjVaWQguZSoOFk4bYT/d55v6+lDXBzUbkFiFixWGjMtgYx81e3GcUjvLQr
	 4rHelUaZOWWKnFzl8DdrIi/2kRdwaj/u6cV2az7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B4D9F80322;
	Tue,  8 Oct 2019 13:56:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E3B5F8038F; Tue,  8 Oct 2019 13:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5845EF80113
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 13:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5845EF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a6jxkZbi"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98BuUJU112051;
 Tue, 8 Oct 2019 06:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570535790;
 bh=2m4Z+ILKTgwMdnFzMkp3FfYvEt175FxlTl3cltv0YlE=;
 h=From:To:CC:Subject:Date;
 b=a6jxkZbilfAqFr3Peh7c5utNefRXpNJBdTw0FiUcjjZ5Qyhf88w/Fp5eZZiDHSzw5
 J8Y1mARSeQGJFCfrnBC5HXQ28SsRbZ/dvwW3BSB/ME23hFSGYiC0JMkKxnicsWxgjQ
 IGvaZdEHbEAYTUyTOt1nW5TRrZ2FF2iwxmEgLREo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98BuUoX052259
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 06:56:30 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 06:56:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 06:56:27 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98BuSHB078230;
 Tue, 8 Oct 2019 06:56:28 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Tue, 8 Oct 2019 14:57:20 +0300
Message-ID: <20191008115720.7135-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH] ASoC: pcm3168a: Use fixup instead of
	constraint for channels and formats
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

The snd_pcm_hw_constraint_minmax() works fine when a single codec is
connected to a single CPU DAI, but in multicodec or DPCM setup the
constraints placed by the driver will apply to the whole PCM stream (FE
included) and thus prevents more than 8 playback channels for example.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
Hi,

I have a board which uses two pcm3168a codec connected to one McASP port with
parallel serializers.
One 16 channel (2x 8 channel) playback and one 12 (2x 6 channel) capture should
be possible as I use only one CPU DAI + platform.
However no matter how I tried to set things up ALSA blocked more than 8 channel
playback in simple multicodec or DPCM setup.

It turned out that the constraint set by the codec on the BE is actually applies
to the FE as well as they both use the same runtime.

The codec still have different constraints depending on the interface format, so
I replaced the constraint with a fixup function to make sure that the codec will
not advertise non supported formats.

Is this a know feature?

Another thing which I have came across is the lack of support for parallel data
pins in ASoC core.
For example the soc-pcm only checks the tdm slots to fix up the channels
supported by the codec, but when we have multiple pins in use and they are
operate in parallel, then the number of slots must be multiplied by the data
pins in use.
I have wip patches for this, adding

int snd_soc_dai_set_data_pins(struct snd_soc_dai *dai,
			      unsigned int tx_data_pins,
			      unsigned int rx_data_pins);

and then using the information in soc-pcm, but need to check further to see if
there are other places this might be needed.

Regards,
Peter

 sound/soc/codecs/pcm3168a.c | 98 +++++++++++++++----------------------
 1 file changed, 40 insertions(+), 58 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 88b75695fbf7..708dac27feff 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -62,6 +62,7 @@ struct pcm3168a_priv {
 	unsigned long sysclk;
 
 	struct pcm3168a_io_params io_params[2];
+	struct snd_soc_dai_driver dai_drv[2];
 };
 
 static const char *const pcm3168a_roll_off[] = { "Sharp", "Slow" };
@@ -314,6 +315,37 @@ static int pcm3168a_set_dai_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static void pcm3168a_update_fixup_pcm_stream(struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
+	u64 formats = SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE;
+	unsigned int channel_max = dai->id == PCM3168A_DAI_DAC ? 8 : 6;
+
+	if (!pcm3168a->io_params[dai->id].fmt)
+		return;
+
+	if (pcm3168a->io_params[dai->id].fmt == PCM3168A_FMT_RIGHT_J) {
+		/* S16_LE is only supported in RIGHT_J mode */
+		formats |= SNDRV_PCM_FMTBIT_S16_LE;
+
+		/*
+		 * If multi DIN/DOUT is not selected, RIGHT_J can only support
+		 * two channels (no TDM support)
+		 */
+		if (pcm3168a->io_params[dai->id].tdm_slots != 2)
+			channel_max = 2;
+	}
+
+	if (dai->id == PCM3168A_DAI_DAC) {
+		dai->driver->playback.channels_max = channel_max;
+		dai->driver->playback.formats = formats;
+	} else {
+		dai->driver->capture.channels_max = channel_max;
+		dai->driver->capture.formats = formats;
+	}
+}
+
 static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai, unsigned int format)
 {
 	struct snd_soc_component *component = dai->component;
@@ -376,6 +408,8 @@ static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai, unsigned int format)
 
 	regmap_update_bits(pcm3168a->regmap, reg, mask, fmt << shift);
 
+	pcm3168a_update_fixup_pcm_stream(dai);
+
 	return 0;
 }
 
@@ -409,6 +443,8 @@ static int pcm3168a_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	else
 		io_params->tdm_mask = rx_mask;
 
+	pcm3168a_update_fixup_pcm_stream(dai);
+
 	return 0;
 }
 
@@ -530,63 +566,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int pcm3168a_startup(struct snd_pcm_substream *substream,
-			    struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
-	unsigned int sample_min;
-	unsigned int channel_max;
-	unsigned int channel_maxs[] = {
-		8, /* DAC */
-		6  /* ADC */
-	};
-
-	/*
-	 * Available Data Bits
-	 *
-	 * RIGHT_J : 24 / 16
-	 * LEFT_J  : 24
-	 * I2S     : 24
-	 *
-	 * TDM available
-	 *
-	 * I2S
-	 * LEFT_J
-	 */
-	switch (pcm3168a->io_params[dai->id].fmt) {
-	case PCM3168A_FMT_RIGHT_J:
-		sample_min  = 16;
-		channel_max =  2;
-		break;
-	case PCM3168A_FMT_LEFT_J:
-	case PCM3168A_FMT_I2S:
-	case PCM3168A_FMT_DSP_A:
-	case PCM3168A_FMT_DSP_B:
-		sample_min  = 24;
-		channel_max = channel_maxs[dai->id];
-		break;
-	default:
-		sample_min  = 24;
-		channel_max =  2;
-	}
-
-	snd_pcm_hw_constraint_minmax(substream->runtime,
-				     SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
-				     sample_min, 32);
-
-	/* Allow all channels in multi DIN/DOUT mode */
-	if (pcm3168a->io_params[dai->id].tdm_slots == 2)
-		channel_max = channel_maxs[dai->id];
-
-	snd_pcm_hw_constraint_minmax(substream->runtime,
-				     SNDRV_PCM_HW_PARAM_CHANNELS,
-				     2, channel_max);
-
-	return 0;
-}
 static const struct snd_soc_dai_ops pcm3168a_dai_ops = {
-	.startup	= pcm3168a_startup,
 	.set_fmt	= pcm3168a_set_dai_fmt,
 	.set_sysclk	= pcm3168a_set_dai_sysclk,
 	.hw_params	= pcm3168a_hw_params,
@@ -776,8 +756,10 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	pm_runtime_enable(dev);
 	pm_runtime_idle(dev);
 
-	ret = devm_snd_soc_register_component(dev, &pcm3168a_driver, pcm3168a_dais,
-			ARRAY_SIZE(pcm3168a_dais));
+	memcpy(pcm3168a->dai_drv, pcm3168a_dais, sizeof(pcm3168a->dai_drv));
+	ret = devm_snd_soc_register_component(dev, &pcm3168a_driver,
+					      pcm3168a->dai_drv,
+					      ARRAY_SIZE(pcm3168a->dai_drv));
 	if (ret) {
 		dev_err(dev, "failed to register component: %d\n", ret);
 		goto err_regulator;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
