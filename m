Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C2537FBB
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1996F166B;
	Thu,  6 Jun 2019 23:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1996F166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559857174;
	bh=9pU/FJh9ptDImqW/3mKpAaycNShVlE2xJc05xIkiqag=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hPnDv0Ht65AtnxjMKabO8+4upUjcjWDVcU1oai5l1XWz4TmcUwNvMHOY8OKC2eV7B
	 IdlWZElTCZykk7r89CSXxo+qGzDQ34EvYKBvvWTTZbamYNw/AFQ7NBIh5+sfRMPo6m
	 1LNl7CSLdCegP+PG09VU1eJaloP6I+cvIcRvcIyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02B51F897ED;
	Thu,  6 Jun 2019 23:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCD86F89791; Thu,  6 Jun 2019 23:26:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D629F89738
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D629F89738
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GZFD1Hif"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+TRFRtCKLIGQ2bCuYqktMcSfHI0Q44ZxWJnYuhISb/I=; b=GZFD1HifX2Lb
 YRqdBc2HIfE88I85iusXdiLaUnyXFVa3+Om3zwY2gQ+Hw5KM7IcLP5h6Kof6wImMht3jzEUkhgEp0
 Rat8e4C7OMrQEdbiiMUABIUOMgzBdb9wA/8CEpQI+r4njUYZgfFiDVVjqGIGOmeD8tNpULGNyCC4P
 3z3tA=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzte-0007IS-23; Thu, 06 Jun 2019 21:26:06 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7D225440046; Thu,  6 Jun 2019 22:26:05 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878suffje2.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212605.7D225440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:05 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: cht_bsw_rt5645: use modern
	dai_link style" to the asoc tree
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

   ASoC: Intel: cht_bsw_rt5645: use modern dai_link style

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 75909d7e2e264f848cf112f7ccb15f9254e1e7af Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:20:48 +0900
Subject: [PATCH] ASoC: Intel: cht_bsw_rt5645: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/cht_bsw_rt5645.c | 43 +++++++++++++++----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index de5fe58ae3b4..daac92e48703 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -425,48 +425,56 @@ static const struct snd_soc_ops cht_be_ssp2_ops = {
 	.hw_params = cht_aif1_hw_params,
 };
 
+SND_SOC_DAILINK_DEF(dummy,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(media,
+	DAILINK_COMP_ARRAY(COMP_CPU("media-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(deepbuffer,
+	DAILINK_COMP_ARRAY(COMP_CPU("deepbuffer-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(ssp2_port,
+	DAILINK_COMP_ARRAY(COMP_CPU("ssp2-port")));
+SND_SOC_DAILINK_DEF(ssp2_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5645:00", "rt5645-aif1")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("sst-mfld-platform")));
+
 static struct snd_soc_dai_link cht_dailink[] = {
 	[MERR_DPCM_AUDIO] = {
 		.name = "Audio Port",
 		.stream_name = "Audio",
-		.cpu_dai_name = "media-cpu-dai",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.codec_name = "snd-soc-dummy",
-		.platform_name = "sst-mfld-platform",
 		.nonatomic = true,
 		.dynamic = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
+		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
 	[MERR_DPCM_DEEP_BUFFER] = {
 		.name = "Deep-Buffer Audio Port",
 		.stream_name = "Deep-Buffer Audio",
-		.cpu_dai_name = "deepbuffer-cpu-dai",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.codec_name = "snd-soc-dummy",
-		.platform_name = "sst-mfld-platform",
 		.nonatomic = true,
 		.dynamic = 1,
 		.dpcm_playback = 1,
 		.ops = &cht_aif1_ops,
+		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
 	/* CODEC<->CODEC link */
 	/* back ends */
 	{
 		.name = "SSP2-Codec",
 		.id = 0,
-		.cpu_dai_name = "ssp2-port",
-		.platform_name = "sst-mfld-platform",
 		.no_pcm = 1,
-		.codec_dai_name = "rt5645-aif1",
-		.codec_name = "i2c-10EC5645:00",
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
 		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
+		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
 };
 
@@ -555,8 +563,9 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 
 	/* set correct codec name */
 	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
-		if (!strcmp(card->dai_link[i].codec_name, "i2c-10EC5645:00")) {
-			card->dai_link[i].codec_name = drv->codec_name;
+		if (!strcmp(card->dai_link[i].codecs->name,
+			    "i2c-10EC5645:00")) {
+			card->dai_link[i].codecs->name = drv->codec_name;
 			dai_index = i;
 		}
 
@@ -566,7 +575,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snprintf(cht_rt5645_codec_name, sizeof(cht_rt5645_codec_name),
 			 "i2c-%s", acpi_dev_name(adev));
 		put_device(&adev->dev);
-		cht_dailink[dai_index].codec_name = cht_rt5645_codec_name;
+		cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
 	}
 
 	/*
@@ -637,7 +646,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 			sizeof(cht_rt5645_codec_aif_name),
 			"%s", "rt5645-aif2");
 
-		cht_dailink[dai_index].codec_dai_name =
+		cht_dailink[dai_index].codecs->dai_name =
 			cht_rt5645_codec_aif_name;
 	}
 
@@ -649,7 +658,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 			sizeof(cht_rt5645_cpu_dai_name),
 			"%s", "ssp0-port");
 
-		cht_dailink[dai_index].cpu_dai_name =
+		cht_dailink[dai_index].cpus->dai_name =
 			cht_rt5645_cpu_dai_name;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
