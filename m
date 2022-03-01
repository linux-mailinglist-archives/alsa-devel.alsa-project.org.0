Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 691654C9518
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 20:52:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D730F1B35;
	Tue,  1 Mar 2022 20:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D730F1B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646164372;
	bh=KtxwDerMncrohbmjqLkgFEyezsc9L0e7Pm2KMMn53S8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EHjJv4kZY3EczxMuyMu/DKhQQd1PacWqtXR7ozVs9SLxpE/Ui3ykpdWNmDPe04jhj
	 Hr06F0rQCSIrfZqI6dZIYIREPyU8VX0M5AdM28jIv5q09aXxpLnb1SltOJqfF6Yb7T
	 PvxNQCQSmQmP+KC34k4jwo5zSQP2RotzUwcoXTug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B26EF80543;
	Tue,  1 Mar 2022 20:49:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C3A8F80516; Tue,  1 Mar 2022 20:49:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFF6FF802DB
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 20:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFF6FF802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jlurXetF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646164162; x=1677700162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KtxwDerMncrohbmjqLkgFEyezsc9L0e7Pm2KMMn53S8=;
 b=jlurXetF0AbEYRt4C2lTFKoi8u0pMym3lC21qs13C158vrB1lpq9/quP
 KroMuw1vBsz1GnsI9M1jLTiSk7kRP83gnSVs/gryk04i/UmNghv21UR0o
 TGSs3IKLlYc4VIZmEbEBQXrZYX220ozF38VQPkHohwI7/IX2EiKtaPNG6
 268KVioT89c6r3HPiF8XioVTZUus4Err6qOp8m76lfrO4iAf/KRs3Wq32
 TQu2Kj7Usagq/ko/xcWEk8DPInkDJdTRHnuY+q0rG72qZkmiZW0Lq0nq8
 3GttQN/zUF5nPF4VAgtsTExc3+zDFcYcdPZdWCErfkaoHHuJXrc1QZY+I A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233841060"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233841060"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="630131847"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.131.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: Intel: boards: fix spelling in comments
Date: Tue,  1 Mar 2022 13:48:57 -0600
Message-Id: <20220301194903.60859-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 FRED OH <fred.oh@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

copy/paste spelling issues with platforms and buttons.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: FRED OH <fred.oh@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bdw-rt5650.c           | 2 +-
 sound/soc/intel/boards/bdw-rt5677.c           | 2 +-
 sound/soc/intel/boards/broadwell.c            | 2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 2 +-
 sound/soc/intel/boards/bxt_rt298.c            | 2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       | 2 +-
 sound/soc/intel/boards/bytcht_da7213.c        | 2 +-
 sound/soc/intel/boards/bytcht_es8316.c        | 2 +-
 sound/soc/intel/boards/bytcr_rt5640.c         | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c         | 2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  | 4 ++--
 sound/soc/intel/boards/cht_bsw_nau8824.c      | 4 ++--
 sound/soc/intel/boards/cht_bsw_rt5645.c       | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       | 2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 2 +-
 sound/soc/intel/boards/haswell.c              | 2 +-
 16 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 6cba5552f7a2..bc0eab1c304a 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -299,7 +299,7 @@ static int bdw_rt5650_probe(struct platform_device *pdev)
 	if (!bdw_rt5650)
 		return -ENOMEM;
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
 	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt5650_card,
 						    mach->mach_params.platform);
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 119c441f4c10..071557fada29 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -426,7 +426,7 @@ static int bdw_rt5677_probe(struct platform_device *pdev)
 	if (!bdw_rt5677)
 		return -ENOMEM;
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
 	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt5677_card,
 						    mach->mach_params.platform);
diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index 618d0645ed8d..d37c74fd1a3c 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -292,7 +292,7 @@ static int broadwell_audio_probe(struct platform_device *pdev)
 
 	broadwell_rt286.dev = &pdev->dev;
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
 	ret = snd_soc_fixup_dai_links_platform_name(&broadwell_rt286,
 						    mach->mach_params.platform);
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index b768d9b8ec02..9bc7b88e346b 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -825,7 +825,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
 	platform_name = mach->mach_params.platform;
 
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 920e575b4314..05e833076499 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -628,7 +628,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 	snd_soc_card_set_drvdata(card, ctx);
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
 	platform_name = mach->mach_params.platform;
 
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index ffd497a5b5a5..96d3201efbbd 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -257,7 +257,7 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
 		byt_cht_cx2072x_dais[dai_index].codecs->name = codec_name;
 	}
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	ret = snd_soc_fixup_dai_links_platform_name(&byt_cht_cx2072x_card,
 						    mach->mach_params.platform);
 	if (ret)
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index fae1e7e785b0..eb19bf16afad 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -260,7 +260,7 @@ static int bytcht_da7213_probe(struct platform_device *pdev)
 		dailink[dai_index].codecs->name = codec_name;
 	}
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	platform_name = mach->mach_params.platform;
 
 	ret_val = snd_soc_fixup_dai_links_platform_name(card, platform_name);
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 9d86fea51a7d..f4bf26e802a2 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -497,7 +497,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	byt_cht_es8316_card.dev = dev;
 	platform_name = mach->mach_params.platform;
 
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 2ace32c03ec9..d76a505052fb 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1764,7 +1764,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	byt_rt5640_card.long_name = byt_rt5640_long_name;
 #endif
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	platform_name = mach->mach_params.platform;
 
 	ret_val = snd_soc_fixup_dai_links_platform_name(&byt_rt5640_card,
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 5e9c53dadbc7..39348d2b242f 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -1088,7 +1088,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	byt_rt5651_card.long_name = byt_rt5651_long_name;
 #endif
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	platform_name = mach->mach_params.platform;
 
 	ret_val = snd_soc_fixup_dai_links_platform_name(&byt_rt5651_card,
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 1bc21434c9de..b3d7a0725ef2 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -296,7 +296,7 @@ static int cht_max98090_headset_init(struct snd_soc_component *component)
 	int ret;
 
 	/*
-	 * TI supports 4 butons headset detection
+	 * TI supports 4 buttons headset detection
 	 * KEY_MEDIA
 	 * KEY_VOICECOMMAND
 	 * KEY_VOLUMEUP
@@ -558,7 +558,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 			dev_dbg(dev, "Unable to add GPIO mapping table\n");
 	}
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	snd_soc_card_cht.dev = &pdev->dev;
 	mach = pdev->dev.platform_data;
 	platform_name = mach->mach_params.platform;
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index bad32d2bdf89..da6c659de266 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -100,7 +100,7 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 	struct snd_soc_component *component = codec_dai->component;
 	int ret, jack_type;
 
-	/* NAU88L24 supports 4 butons headset detection
+	/* NAU88L24 supports 4 buttons headset detection
 	 * KEY_PLAYPAUSE
 	 * KEY_VOICECOMMAND
 	 * KEY_VOLUMEUP
@@ -257,7 +257,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	snd_soc_card_set_drvdata(&snd_soc_card_cht, drv);
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	snd_soc_card_cht.dev = &pdev->dev;
 	mach = pdev->dev.platform_data;
 	platform_name = mach->mach_params.platform;
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index e182012d0c60..c21561c6a464 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -653,7 +653,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	    (cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
 		cht_dailink[dai_index].cpus->dai_name = "ssp0-port";
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	platform_name = mach->mach_params.platform;
 
 	ret_val = snd_soc_fixup_dai_links_platform_name(card,
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 26eb8ad0d262..9882aeb24d33 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -483,7 +483,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		drv->use_ssp0 = true;
 	}
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	snd_soc_card_cht.dev = &pdev->dev;
 	platform_name = mach->mach_params.platform;
 
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index bad3829e52ca..e4bfb0fe5f12 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -638,7 +638,7 @@ static int geminilake_audio_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 	snd_soc_card_set_drvdata(card, ctx);
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
 	platform_name = mach->mach_params.platform;
 
diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/haswell.c
index 36e136acbef5..aa61e101f793 100644
--- a/sound/soc/intel/boards/haswell.c
+++ b/sound/soc/intel/boards/haswell.c
@@ -175,7 +175,7 @@ static int haswell_audio_probe(struct platform_device *pdev)
 
 	haswell_rt5640.dev = &pdev->dev;
 
-	/* override plaform name, if required */
+	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
 	ret = snd_soc_fixup_dai_links_platform_name(&haswell_rt5640,
 						    mach->mach_params.platform);
-- 
2.25.1

