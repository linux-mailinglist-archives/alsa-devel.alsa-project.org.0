Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D3726493A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 17:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A3C016AF;
	Thu, 10 Sep 2020 17:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A3C016AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599753574;
	bh=yq3Ot0Rb4xST67esO3Fi8AivixP4H0Q462r8SUXZILg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qSy/VX6U9XLZsg1709KSi0ZIKIxUf3tAKQDkxmoMrdtCCwpnEBqu319Logta7ttNK
	 PS0M79nxKnbGuFQmqo1UMo0Yma/zeCxMYZjVT6FSIdVJZJEeklVxnBzsBlNyOAz8Du
	 UZMZYCuUHYjBZ/s1fnFxNbiEUbYzL2r2owhFr+X8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27A36F800D0;
	Thu, 10 Sep 2020 17:57:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2DD9F80264; Thu, 10 Sep 2020 17:57:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E6B1F800D0
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 17:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E6B1F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="D478FXgW"
Received: by mail-lj1-x242.google.com with SMTP id u4so8828511ljd.10
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=fXxlnm6mzZkdPNyQX2gzT9535bgLY4RyP7V7YRZOFEU=;
 b=D478FXgW9K+R8hcKL9eH1QRG9D62zukErZ9Iu4D4TFLwDUCvtU/YO98qIh0FlU/LUr
 s+grxASJc2NesL23S3XIzq21tSkHX5xEIZmt+RtBx5H/ju4kmcykC9dTxGmtCl+Bk90A
 Fxae/aR34Hgn767VBY3XezCiGJxLBTZO5fLB1/09JZX8+OQcAXC5V9ZVTPnJCLzvvauv
 soD6gaHGKY6mnQzHeL4fMtCRNcmlDZE7At25OU5vxBRIsEtl032/pXx0ZEd1tybGtUMI
 am8Rb9K9hTP1QQt1Jn+RkWcgAeRX5k6w9NygDwDapGp2n/0aY4OwotjYbq6HQDLfuYGe
 GDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fXxlnm6mzZkdPNyQX2gzT9535bgLY4RyP7V7YRZOFEU=;
 b=Bt5a8kSZAwKguhqSaIfTJ45st0mnsW2nIjnMS4U6fysGFfwlof7OO1rY1/bVVbrqF2
 4UNFr7ckVOW7XDu81FHakbCjsm9c2OLdu8hI2GQSxg6d1NBR8mjpX9GXdX5G10EDKekK
 KJB6GmuaKjnERHSikQp0fux7m3UMR43+5OYlYClQRWVK++00mKV9m0+Ccsf5oULb1fj8
 OIvLvCyV2q+LYhi8gKolTbhrAFHvSMGY2l2u3zLKqLSaPdoaBEB/zYepYKaJypgD12K1
 4ed4Mpi2rXjmRnzPLLCjPdZWGMEjxq+uUrUvcg9L1/3mbF/vvwANMr1GIKDH1iGyja90
 +9cg==
X-Gm-Message-State: AOAM531UlKz1V0O1ZW8T8s5CS344E1SnXYNNqIu1RvuYLNWVrrYkDzmx
 sZKdGts6cmOagu/wohRvmXZO7g==
X-Google-Smtp-Source: ABdhPJy0susvnGKtbcQCxas4yxAG6dVdRWhW07I56q5zY4qihIPpchpCLvfYSKtfmi1sV0Lkj1jt9g==
X-Received: by 2002:a2e:800e:: with SMTP id j14mr4742770ljg.145.1599753458323; 
 Thu, 10 Sep 2020 08:57:38 -0700 (PDT)
Received: from rad-H81M-S1.semihalf.local
 (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
 by smtp.gmail.com with ESMTPSA id k14sm1445494lfm.90.2020.09.10.08.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 08:57:37 -0700 (PDT)
From: Radoslaw Biernacki <rad@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH V5] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
Date: Thu, 10 Sep 2020 17:57:34 +0200
Message-Id: <20200910155734.31101-1-rad@semihalf.com>
X-Mailer: git-send-email 2.17.1
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 Radoslaw Biernacki <rad@semihalf.com>, John Hsu <KCHSU0@nuvoton.com>,
 linux-kernel@vger.kernel.org, michal.sienkiewicz@intel.com,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Marcin Wojtas <mw@semihalf.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 Alex Levin <levinale@google.com>
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

Since 256xFS clocks cannot be generated by SKL, the NAU8825 is
configured to re-generate its system clock from the BCLK using the
FLL. The link is configured to use a 48kHz frame rate, and 24 bits in
25-bit slot. The SSP configuration is extracted from NHLT settings and
not dynamically changed. Listening tests and measurements do not show
any distortion or issues

Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Radoslaw Biernacki <rad@semihalf.com>
---

Notes:
    v1 -> v2:
    - adding same changes to skl_nau88l25_max98357a.c
    v2 -> v3:
    - removing msleep() in SNDRV_PCM_TRIGGER_RESUME as it unnecessarily increase
      playback/capture latency while actually FLL does not require it.
    - simplifing commit message
    v3 -> v4:
    - simplifing the PM resume callback code for setting the FLL
    - adding comment for the stream START/RESUME sequence which prevent audio pops
    - fixing mising var initialization in platform_clock_control()
    V4 -> V5:
    - removed stray change ~ SSP0 ops

 .../soc/intel/boards/skl_nau88l25_max98357a.c | 63 ++++++++++++------
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 64 +++++++++++++------
 2 files changed, 85 insertions(+), 42 deletions(-)

diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index d7b8154c43a4..2f0abbd2dd8d 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -47,12 +48,12 @@ enum {
 };
 
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *k, int  event)
+	struct snd_kcontrol *k, int event)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
 	struct snd_soc_dai *codec_dai;
-	int ret;
+	int ret = 0;
 
 	codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
 	if (!codec_dai) {
@@ -60,14 +61,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		return -EIO;
 	}
 
-	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		ret = snd_soc_dai_set_sysclk(codec_dai,
-				NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-			return -EIO;
-		}
-	} else {
+	if (!SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = snd_soc_dai_set_sysclk(codec_dai,
 				NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
@@ -292,24 +286,51 @@ static const struct snd_soc_ops skylake_nau8825_fe_ops = {
 	.startup = skl_fe_startup,
 };
 
-static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
+static int skylake_nau8825_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	int ret;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai,
-			NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
-
-	if (ret < 0)
-		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		/* Since 256xFS clocks cannot be generated by SKL, the NAU8825
+		 * is configured to re-generate its system clock from the BCLK
+		 * using the FLL.
+		 * We must switch system clock (FLL to use BCLK) here as it is
+		 * not given eariler by FW (like in hw_param). We let nau8825 to
+		 * use internal VCO clock till now which reduces the audiable
+		 * pop's. */
+
+		/* fall through */
+
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/* Once device resumes, the system will only enable power
+		 * sequence for playback without doing hardware parameter, audio
+		 * format, and PLL configure. In the mean time, the jack
+		 * detecion sequence has changed PLL parameters and switched to
+		 * internal clock. Thus, the playback signal distorted without
+		 * correct PLL parameters. Therefore we need to configure PLL
+		 * again */
+		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0,
+					     SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "can't set FS clock %d\n", ret);
+			break;
+		}
+		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
+					  runtime->rate * 256);
+		if (ret < 0)
+			dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
+		break;
+	}
 
 	return ret;
 }
 
-static const struct snd_soc_ops skylake_nau8825_ops = {
-	.hw_params = skylake_nau8825_hw_params,
+static struct snd_soc_ops skylake_nau8825_ops = {
+	.trigger = skylake_nau8825_trigger,
 };
 
 static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index 4b317bcf6ea0..6791be63c866 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -12,6 +12,7 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
@@ -57,12 +58,12 @@ static const struct snd_kcontrol_new skylake_controls[] = {
 };
 
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
-		struct snd_kcontrol *k, int  event)
+		struct snd_kcontrol *k, int event)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
 	struct snd_soc_dai *codec_dai;
-	int ret;
+	int ret = 0;
 
 	codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
 	if (!codec_dai) {
@@ -70,14 +71,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		return -EIO;
 	}
 
-	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		ret = snd_soc_dai_set_sysclk(codec_dai,
-				NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-			return -EIO;
-		}
-	} else {
+	if (!SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = snd_soc_dai_set_sysclk(codec_dai,
 				NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
@@ -85,6 +79,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			return -EIO;
 		}
 	}
+
 	return ret;
 }
 
@@ -344,24 +339,51 @@ static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
+static int skylake_nau8825_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	int ret;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai,
-			NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
-
-	if (ret < 0)
-		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		/* Since 256xFS clocks cannot be generated by SKL, the NAU8825
+		 * is configured to re-generate its system clock from the BCLK
+		 * using the FLL.
+		 * We must switch system clock (FLL to use BCLK) here as it is
+		 * not given eariler by FW (like in hw_param). We let nau8825 to
+		 * use internal VCO clock till now which reduces the audiable
+		 * pop's. */
+
+		/* fall through */
+
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/* Once device resumes, the system will only enable power
+		 * sequence for playback without doing hardware parameter, audio
+		 * format, and PLL configure. In the mean time, the jack
+		 * detecion sequence has changed PLL parameters and switched to
+		 * internal clock. Thus, the playback signal distorted without
+		 * correct PLL parameters. Therefore we need to configure PLL
+		 * again */
+		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0,
+					     SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "can't set FS clock %d\n", ret);
+			break;
+		}
+		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
+					  runtime->rate * 256);
+		if (ret < 0)
+			dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
+		break;
+	}
 
 	return ret;
 }
 
-static const struct snd_soc_ops skylake_nau8825_ops = {
-	.hw_params = skylake_nau8825_hw_params,
+static struct snd_soc_ops skylake_nau8825_ops = {
+	.trigger = skylake_nau8825_trigger,
 };
 
 static const unsigned int channels_dmic[] = {
-- 
2.17.1

