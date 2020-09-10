Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B0264B37
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 19:27:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33E9516C9;
	Thu, 10 Sep 2020 19:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33E9516C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599758858;
	bh=qCRCZEhe2Fk9+VY1atg5zA+52UtAT2DNRWU42koClcE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U1w4MWzULhou8bipz49EMKpSlGm6ndeR3BKvuFvlbYOJOBLtvaNkY8QguFPQfz9qF
	 khC/kkxMl+4clR6FSrOXYSRqpZwguVZFVVvV1EsHv7Wrz3BtG6KG9nfFNi+T3NnS9z
	 p/MUjHHHpu6+gcTdUywZA3XWgJac5eYkS7Hrrc9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FD6AF8026F;
	Thu, 10 Sep 2020 19:25:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD537F801F2; Thu, 10 Sep 2020 19:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 114BCF800D0
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 19:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 114BCF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="VdZmhk1u"
Received: by mail-lj1-x243.google.com with SMTP id b19so9190157lji.11
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 10:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=Kk0XQNKqYfxJTLaKrt8nQK8M1p7oRPoQlJZqqiNIcnU=;
 b=VdZmhk1u/YdRZKjJ5HfFDnNdo3EYFX+MLk+JF10ESprrhiw/HkwpYwd9hb2BXxOSZb
 1R6kX2YF3Z5KTjtdw9DREuqmDhsjpBdQpuZvG+dzOZCbWrIPtfMDI8Sg6xIVID2VDLtH
 j/1DSHYlmXBz0a65LmcFaYTMF9+X55ydI5wBdAO85PCKGSrlP+784kBfpkB8RMyxCvWM
 bnFbS6e+nMOePh1kffzQF2sxpaxg+CwDoskZKUWFdn0LE12yfbAdcck3yK6gyXqMcXdY
 yc8JBs1MbLaM9HelB2F0rzxlcigJMYmw7nA4FFghcwKeU49MeZ8yUrDScWZfvqOfJtWh
 zgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Kk0XQNKqYfxJTLaKrt8nQK8M1p7oRPoQlJZqqiNIcnU=;
 b=m41iQu1bs/Zl/m1sohb6FdXduJcx5yCqK7GzErYRlV6j8LHHSwI96xQch6LQj5YOPm
 HGP+Z5X+Q7Wty/AnZohX685VfBptAyGFC+mLiM4M2ve54+FKzhoN7OuIEcYr86Zrw10G
 1wrX1iMA7tj3NIBR0bUFWv82GPEXKl2V6EI+GVbb94lLhTj2jeSxkr/KX/jQ86hSeFiV
 Ml2puto/7Fr7EhsU/ASl9vUpmhTis5QCVeLZKt13x+ZI56y3R7sSF7Ow8VWRLbyeWLPz
 ndbLMXF1GF13v40oKw0w4+Z9Z2NFA63BOmlGZfX41HrPS3MwiIXD54E9vBfAilgsf+I0
 iEkA==
X-Gm-Message-State: AOAM530k0VfGzfl1dpi+edsE1RTix6vJbxVca/CeQHe9Q2C9Kmb+DTYh
 TrSphjsuLS4ba/BOYfJ+ckToEw==
X-Google-Smtp-Source: ABdhPJxudeY6fTGVl5c0g/UH6MTEHtKcAfGOUGOnRU0QFxMEzqkONNtOjgzMNh65NumDGs9moMoQuA==
X-Received: by 2002:a05:651c:3c2:: with SMTP id
 f2mr4828475ljp.14.1599758742622; 
 Thu, 10 Sep 2020 10:25:42 -0700 (PDT)
Received: from rad-H81M-S1.semihalf.local
 (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
 by smtp.gmail.com with ESMTPSA id f6sm1755079ljj.28.2020.09.10.10.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:25:41 -0700 (PDT)
From: Radoslaw Biernacki <rad@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH V6] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
Date: Thu, 10 Sep 2020 19:25:38 +0200
Message-Id: <20200910172538.31425-1-rad@semihalf.com>
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
    v4 -> v5:
     - removed stray change ~ SSP0 ops
    v5 -> v6:
     - fixing typos and comment style

 .../soc/intel/boards/skl_nau88l25_max98357a.c | 62 +++++++++++-------
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 63 ++++++++++++-------
 2 files changed, 83 insertions(+), 42 deletions(-)

diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index d7b8154c43a4..12595138f44b 100644
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
@@ -292,24 +286,50 @@ static const struct snd_soc_ops skylake_nau8825_fe_ops = {
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
+		 * not given earlier by FW (like in hw_param). We let nau8825 to
+		 * use internal VCO clock till now which reduces the audible
+		 * pop's.
+		 */
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/* Once device resumes, the system will only enable power
+		 * sequence for playback without doing hardware parameter, audio
+		 * format, and PLL configure. In the mean time, the jack
+		 * detection sequence has changed PLL parameters and switched to
+		 * internal clock. Thus, the playback signal distorted without
+		 * correct PLL parameters. Therefore we need to configure PLL
+		 * again
+		 */
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
index 4b317bcf6ea0..38faaf20306e 100644
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
 
@@ -344,24 +339,50 @@ static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
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
+		 * not given earlier by FW (like in hw_param). We let nau8825 to
+		 * use internal VCO clock till now which reduces the audible
+		 * pop's.
+		 */
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/* Once device resumes, the system will only enable power
+		 * sequence for playback without doing hardware parameter, audio
+		 * format, and PLL configure. In the mean time, the jack
+		 * detection sequence has changed PLL parameters and switched to
+		 * internal clock. Thus, the playback signal distorted without
+		 * correct PLL parameters. Therefore we need to configure PLL
+		 * again
+		 */
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

