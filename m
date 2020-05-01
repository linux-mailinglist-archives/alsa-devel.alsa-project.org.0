Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA321C1DF2
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 21:33:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96DEF16BB;
	Fri,  1 May 2020 21:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96DEF16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588361631;
	bh=gto8d1R8rGLTutQPkXpRcIJ0JPHG7/pmV26amZmoDbc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i7WwdS8JDPNcfTVjtZG4d4bcTQtNJSOk43KZfRTj7H50d7fe8xfejsImE2xX6/XWk
	 ho06RRgNz7qKbffA1SnttpQYJ1pbOvn7mDmu/kw/zIiqiVJ7IqiIwpGNa+0tbh3Idn
	 fG24AlE9G1um4cZBVgdd9Hau9DxkNonJ0549OGDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E9AF80217;
	Fri,  1 May 2020 21:32:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A0B3F8022B; Fri,  1 May 2020 21:32:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3346F800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 21:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3346F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="ohsuYv8A"
Received: by mail-lf1-x143.google.com with SMTP id t11so4637821lfe.4
 for <alsa-devel@alsa-project.org>; Fri, 01 May 2020 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=Y1Sxa1L6MHtu4yCi6bcxHWPjDF8MAxhNbnipuwNwfpQ=;
 b=ohsuYv8AvDs+U2XslgnY/gQSYMYEK0EDhVT2tdfn957mC+7qCzjCY+xYHUbL3zCWm3
 ty+EE8kuwN1A69MSfs5YYYUA9hhfndNYHnyJ1au1aNnc4Nma8w0xPvMq1Ei9YNcxi6tK
 VYxEbMpVZBCfYYqKbHuGSmElyidr/n8VwM/BxZ/B7gme7G6n+GyzMhNxpPtT3kKn5h5Y
 9B+ndFPeW4rbum6Ji+rZuZDKbhC19bOvVaVA5qH6Ji1Z+0do0X4QdoasOSY6s1nvjZdd
 4FuBlbdNRwO/7eaXQ84q4TEAME1Ejt12B5BVzabbBDTWcRm2Q79C/BKVjeSlnYPonpWb
 cTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y1Sxa1L6MHtu4yCi6bcxHWPjDF8MAxhNbnipuwNwfpQ=;
 b=ryHmNIV+BHBqWTHdtRWlriN1vxxRRR2X7mBLcgFSWPXmD0RTpbtj3IX9+WSm0mUqyv
 YVP8EX+65ZRVYv4QJsjzAAfZyrrXUIYJevFxDfj76UL6h5YF7dbOFgEnKKbTlccI9IvQ
 mAABskYI+y8NraoOPwWZrKlBtRUv2N7lVXU7Ie/AcGt4MAtRiaMM6dAnaqoziDLbceeq
 sMAR9tPZ0bnV0S01G4ArTGJuBaKQHDxfPvGzhKH04wLmw76tHJROFMzS7MU8CcDRHeq2
 DxgaRD2kMvXppYw3vvfAXYMKMWakn78TyONJZCQQdxHitWtleJy2JsGUf67m1rKxzbTo
 tLRQ==
X-Gm-Message-State: AGi0PubvUwELzqzi5Xnw/3CfDvJlEsdM4/9NPZyMjf+QSNd5errQ4aYQ
 dLVIT8FY4abn10q/J1uL2thSMg==
X-Google-Smtp-Source: APiQypI2HHesOzyHN/LU2g7osuTrzqPEGqEV+ENUUy1yzzVBfakVnOBDeZhU69EWGCUhkDUqbKn/Fw==
X-Received: by 2002:a05:6512:10d0:: with SMTP id
 k16mr3489149lfg.71.1588361509310; 
 Fri, 01 May 2020 12:31:49 -0700 (PDT)
Received: from rad-H81M-S1.semihalf.local
 (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
 by smtp.gmail.com with ESMTPSA id v17sm2789711lfe.34.2020.05.01.12.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 12:31:48 -0700 (PDT)
From: Radoslaw Biernacki <rad@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH V2] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
Date: Fri,  1 May 2020 21:31:41 +0200
Message-Id: <20200501193141.30293-1-rad@semihalf.com>
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

This single fix address two issues on machines with nau88125:
1) Audio distortion, due to lack of required clock rate on MCLK line
2) Loud audible "pops" on headphones if there is no sysclk during nau8825
   playback power up sequence

Explanation for:
1) Due to Skylake HW limitation, MCLK pin can only output 24MHz clk
   rate (it can be only connected to XTAL parent clk). The BCLK pin
   can be driven by dividers and therefore FW is able to set it to rate
   required by chosen audio format. According to nau8825 datasheet, 256*FS
   sysclk gives the best audio quality and the only way to achieve this
   (taking into account the above limitations) its to regenerate the MCLK
   from BCLK on nau8825 side by FFL. Without required clk rate, audio is
   distorted by added harmonics.

2) Currently Skylake does not output MCLK/FS when the back-end DAI op
   hw_param is called, so we cannot switch to MCLK/FS in hw_param.  This
   patch reduces pop by letting nau8825 keep using its internal VCO clock
   during widget power up sequence, until SNDRV_PCM_TRIGGER_START when
   MCLK/FS is available. Once device resumes, the system will only enable
   power sequence for playback without doing hardware parameter, audio
   format, and PLL configure. In the mean time, the jack detecion sequence
   has changed PLL parameters and switched to internal clock. Thus, the
   playback signal distorted without correct PLL parameters.  That is why
   we need to configure the PLL again in SNDRV_PCM_TRIGGER_RESUME case.

Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Radoslaw Biernacki <rad@semihalf.com>
---
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 72 +++++++++++++-----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 73 ++++++++++++++-----
 2 files changed, 107 insertions(+), 38 deletions(-)

diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index d7b8154c43a4..0f3cea1342d1 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -47,7 +48,7 @@ enum {
 };
 
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *k, int  event)
+	struct snd_kcontrol *k, int event)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
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
@@ -292,24 +286,40 @@ static const struct snd_soc_ops skylake_nau8825_fe_ops = {
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
+	int ret = 0;
 
-	if (ret < 0)
-		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
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
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
+					  runtime->rate * 256);
+		if (ret < 0)
+			dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
+		msleep(20);
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
@@ -630,10 +640,34 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
 
+static int __maybe_unused skylake_nau8825_resume_post(struct snd_soc_card *card)
+{
+	struct snd_soc_dai *codec_dai;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
+	if (!codec_dai) {
+		dev_err(card->dev, "Codec dai not found\n");
+		return -EIO;
+	}
+
+	dev_dbg(codec_dai->dev, "playback_active:%d playback_widget->active:%d codec_dai->rate:%d\n",
+		codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK],
+		codec_dai->playback_widget->active,
+		codec_dai->rate);
+
+	if (codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK] &&
+	    codec_dai->playback_widget->active)
+		snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0,
+				       SND_SOC_CLOCK_IN);
+
+	return 0;
+}
+
 /* skylake audio machine driver for SPT + NAU88L25 */
 static struct snd_soc_card skylake_audio_card = {
 	.name = "sklnau8825max",
 	.owner = THIS_MODULE,
+	.resume_post = skylake_nau8825_resume_post,
 	.dai_link = skylake_dais,
 	.num_links = ARRAY_SIZE(skylake_dais),
 	.controls = skylake_controls,
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index 4b317bcf6ea0..be44a40067f0 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -12,6 +12,7 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
@@ -57,7 +58,7 @@ static const struct snd_kcontrol_new skylake_controls[] = {
 };
 
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
-		struct snd_kcontrol *k, int  event)
+		struct snd_kcontrol *k, int event)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
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
 
@@ -344,24 +339,40 @@ static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
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
+	int ret = 0;
 
-	if (ret < 0)
-		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
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
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
+					  runtime->rate * 256);
+		if (ret < 0)
+			dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
+		msleep(20);
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
@@ -671,10 +682,34 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
 
+static int __maybe_unused skylake_nau8825_resume_post(struct snd_soc_card *card)
+{
+	struct snd_soc_dai *codec_dai;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
+	if (!codec_dai) {
+		dev_err(card->dev, "Codec dai not found\n");
+		return -EIO;
+	}
+
+	dev_dbg(codec_dai->dev, "playback_active:%d playback_widget->active:%d codec_dai->rate:%d\n",
+		codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK],
+		codec_dai->playback_widget->active,
+		codec_dai->rate);
+
+	if (codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK] &&
+	    codec_dai->playback_widget->active)
+		snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0,
+				       SND_SOC_CLOCK_IN);
+
+	return 0;
+}
+
 /* skylake audio machine driver for SPT + NAU88L25 */
 static struct snd_soc_card skylake_audio_card = {
 	.name = "sklnau8825adi",
 	.owner = THIS_MODULE,
+	.resume_post = skylake_nau8825_resume_post,
 	.dai_link = skylake_dais,
 	.num_links = ARRAY_SIZE(skylake_dais),
 	.controls = skylake_controls,
-- 
2.17.1

