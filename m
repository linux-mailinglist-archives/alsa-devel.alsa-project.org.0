Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4D3261F8F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 22:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB4321714;
	Tue,  8 Sep 2020 22:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB4321714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599595510;
	bh=J3J4iWKu9Hvnrmsm7orciZI0qwAMIBlfrVpaB+rXW5M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AV5T5qT741AFZhwbuy5kkAPO593kbrCp7Yfr7Mz1EBtGo9+m/7vjafsn/c6w2LpVB
	 LF+H5rZHaaHB4s/FEX1eaA4/WeOq4wVwJuzcBGxpvPlgcf/7bC3OeLpMfCzj9hZSXJ
	 FzYBAkQr4akGvuAlqltnKK4wWnF8wbgKuH0bKt1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03DCDF8026F;
	Tue,  8 Sep 2020 22:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CCDCF80264; Tue,  8 Sep 2020 22:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F50AF800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 22:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F50AF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="ahmixS3N"
Received: by mail-lj1-x243.google.com with SMTP id k25so548666ljk.0
 for <alsa-devel@alsa-project.org>; Tue, 08 Sep 2020 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=jzVNvMdkmIaUsZ7x+JjELSUeNQhOKHrsly0M9gLXpdM=;
 b=ahmixS3N+X/i3O8WKjTcnPnFsLBqx7VJEkf8zXHgRxatUbO+TEtkUPe2PR87WdGxe8
 zQyD84XLJ2xj8S0hpl4tPTcwlPQbm5Eik2mAt0FfnYjTd9/TddmWkCbcSDEyrWI3loYD
 UrBg8z2bHSsFGFoyX7gH9j6Eamihifqu1Rw2pYLshzyMEkKXSO1H9aC5Z2onYhoPqtvV
 BNUEGSMFRWn2/o7rjddFU2sHIFyvqY/mA5VQ5u3txpr8TbdFL9R9CE0bZUgpRBeCVJ/J
 N+ThhRm1d2RljFLnRCJu8dnoWj31B8HEeXuCV6TO0XSuYJIKufD76Lc5AsTjdA8V6yCK
 njwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jzVNvMdkmIaUsZ7x+JjELSUeNQhOKHrsly0M9gLXpdM=;
 b=DyslIl6WsaeF7N7zskk+O5VaRWX676+OF/Rqg6h094qfpXgygWqLvHz532t/T7IdjY
 gaIucomj7HbGY4YhPbvKcUQawmLF2umBH9kl83DpU6pE3a8vxA6k1rUuk4wJGVR3TYUU
 UzF1UY2v1pm9UckczBQBc60XksSRktFfJbI/eyzysbwQ6kBsWAINkbS/8Ea/M5LSfCqk
 V83b9prRvhLgXBVItityrYZIun65iAYZ+CieeA3FtIs1asnFUdUqTbkWuJbDafUA+Ihc
 GUaETXpwX529Kqssj/n/YiF4V8zlvdLx39FgYpX7fV33xPywXy18+S3SaM2qI5iphuPZ
 Ccng==
X-Gm-Message-State: AOAM532EPy09+ayxcppP5xLlC9ro9aQOj4kqfMKAF4wmBRbiTkes0GyZ
 B5hp5LE/g5h949Ex1puWp9/Acg==
X-Google-Smtp-Source: ABdhPJztsUWAHwyBIxJJ8lxlPIvtWE+lH08KkLVv4wqMJpu984hJb9gDcu7WS8gqwegX9Ypb3sJTFg==
X-Received: by 2002:a2e:5c5:: with SMTP id 188mr80229ljf.375.1599595397984;
 Tue, 08 Sep 2020 13:03:17 -0700 (PDT)
Received: from rad-H81M-S1.semihalf.local
 (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
 by smtp.gmail.com with ESMTPSA id c17sm115715lfs.62.2020.09.08.13.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 13:03:17 -0700 (PDT)
From: Radoslaw Biernacki <rad@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH V3] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
Date: Tue,  8 Sep 2020 22:03:14 +0200
Message-Id: <20200908200314.22771-1-rad@semihalf.com>
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

 .../soc/intel/boards/skl_nau88l25_max98357a.c | 71 +++++++++++++-----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 72 ++++++++++++++-----
 2 files changed, 105 insertions(+), 38 deletions(-)

diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index d7b8154c43a4..75976aad0366 100644
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
@@ -292,24 +286,39 @@ static const struct snd_soc_ops skylake_nau8825_fe_ops = {
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
@@ -630,10 +639,34 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
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
index 4b317bcf6ea0..09f090ba7fec 100644
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
 
@@ -344,24 +339,39 @@ static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
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
@@ -671,10 +681,34 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
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

