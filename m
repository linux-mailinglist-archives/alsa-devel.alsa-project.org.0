Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA8CFB41
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:24:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE6FD16A1;
	Tue,  8 Oct 2019 15:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE6FD16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570541074;
	bh=Yj0Q5wKztZo2XXVl5a3O0HIIrf0broK2VvX1YufsAx4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Vftu2IZr4+/0c1mEezkvWUAA2rLu/H2uv3LlnPIIYYoloBm4PHzh8msgaC1SYlhMM
	 sMpjWyNZlCxdHdJqQAKEqOvTEB4mKlmVil2tNFwa4aqaLe9iiv1BlPsK49ehttk1Jg
	 GL12O2jO/ZLJKUx/kLIi9uFyeAOdrvytHevjagsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 848E8F896C7;
	Tue,  8 Oct 2019 14:54:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 201E2F807C3; Tue,  8 Oct 2019 14:54:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69240F80674
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69240F80674
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NM8VZfMI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=9O6txXRLv1sjXEt8FogG1k4Lf/rnYC6gufa7gKrKrds=; b=NM8VZfMI3mhY
 zsHOuMfdR7iU5dOa7CWnIGTQppGRjdPsZpTZyZRU3xyLrKWIy4xMeOWd3DRmFHFBKsrIoIuO2mN1e
 kv2ouzJ8VUPAcJZfuAJ5xqpoCIQddVoSEhvEgnrD1wwAYNjOw6SytjB4r52gNDr19BFFRhbnlUErQ
 e6BSk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozf-0008QA-Uw; Tue, 08 Oct 2019 12:53:36 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6B0132740D48; Tue,  8 Oct 2019 13:53:35 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20191008115720.7135-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125335.6B0132740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:35 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] Applied "ASoC: pcm3168a: Use fixup instead of
	constraint for channels and formats" to the asoc tree
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

The patch

   ASoC: pcm3168a: Use fixup instead of constraint for channels and formats

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From cfc28ac124c456ffbff5b34d4108d8a201cd7fbb Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 8 Oct 2019 14:57:20 +0300
Subject: [PATCH] ASoC: pcm3168a: Use fixup instead of constraint for channels
 and formats

The snd_pcm_hw_constraint_minmax() works fine when a single codec is
connected to a single CPU DAI, but in multicodec or DPCM setup the
constraints placed by the driver will apply to the whole PCM stream (FE
included) and thus prevents more than 8 playback channels for example.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20191008115720.7135-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
