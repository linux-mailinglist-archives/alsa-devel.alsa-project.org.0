Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BE117B906
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 10:12:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D60E61616;
	Fri,  6 Mar 2020 10:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D60E61616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583485925;
	bh=irGftE8DSuHSh2boR+DRLBvCgNqD6xwIjX7rgN9XpxY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L6IbXR6dEyYNWoXmNOYBheDNvBFwlCFCNVVLuiyl2IleNw9E2zphssc17qtvzFzhe
	 A+2L7p+9yxZqJ9vLlcUEq0tOLcomBkVOUxmh5sNz5WHz/PXxV9q8Dj8BMaVCCKwox8
	 ZaNubvN9r2z2bt9+P4hQ4UGbN5a5LhM3RK4pHOHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D01F8012D;
	Fri,  6 Mar 2020 10:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01BDDF8025F; Thu,  5 Mar 2020 18:23:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49C06F800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 18:23:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49C06F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="A93gzN+Z"
Received: by mail-lf1-x141.google.com with SMTP id z9so5321132lfa.2
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=fPcaCIVhLaLkGll6nxgOHW5KQZcIBDxuWhoHfzoQVN0=;
 b=A93gzN+Zn4n6r51CIk1zU+p7sSs6MHMyNSevDZnnZZEu1MeBqkV5MxsmltQ8zkYhoV
 poNcTljr1IQ1u3tXPUeE5CYCAa/ERTJuTgCXXV6CQjn1ZF/y8TTTqOl25hxkR8/opX9h
 T2NKn1GvTVrWyHuRCWCfhRGwDenKqHGKYyDfae3kMCOAmosGzdzAbaHwpTA+O2E6srg4
 b44Nw3mfA0NRhqNr+8Mv9iU89qEV58OZrBG2wP7SohzKVz5lm1akkF15NTvQKvoohsYL
 mVlocBmDFWM2ruQj64AnISnwbVehPDNvXEAsN7uLZtLyFlWh48EqIwsBwz3NO2mp+JCG
 djZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fPcaCIVhLaLkGll6nxgOHW5KQZcIBDxuWhoHfzoQVN0=;
 b=N6BTmEK/fZ4VkQttoRTRjgMCp3jw5egvCqWr34jw/hBXiWQzlra4PmeLjWP2OP0Bu7
 DA+o79gXbQaQJApuyBV+LropU8BYKe9s9Xdjwznhpkb4xdfhMCZqss6NNPcdIX5wOqOl
 EowXo6cyPTVs6Q/5bRrZYTHRMCoBgHB5FELBB7aBoyUX4ObnyT6XkGyiOHsaYpl5e8ob
 XrLiscvuhFLaycaUYtuboub+ss8hW31J3WRUjqz7vd/FkUbSw+kJWqjCWDa47/+K3ZDv
 OUThAz0SHeukbL7QOoLfJLmekuoPSTH/zEgl/bEvUMmYz3yNoJZPWNy7mtK/t0Ccrud1
 WZkw==
X-Gm-Message-State: ANhLgQ0oBvHkxo7l2wAEh4/S72WPiJY5HdPfSl7GQ04zLw/hK/HwWCFl
 Wd9IOYCMMwlf9mAfS1Bl1/RnAQ==
X-Google-Smtp-Source: ADFU+vsqiH7bKpeE49BGJmj5PDxA/JYqwdl/zBQkFoVsaIP8ZhQ8uEjo2q86RcuN2IJjBI9sjuNwXg==
X-Received: by 2002:ac2:58ee:: with SMTP id v14mr6276462lfo.62.1583428996947; 
 Thu, 05 Mar 2020 09:23:16 -0800 (PST)
Received: from rad-H81M-S1.semihalf.local
 (31-172-191-173.noc.fibertech.net.pl. [31.172.191.173])
 by smtp.gmail.com with ESMTPSA id x23sm2377621ljj.8.2020.03.05.09.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 09:23:16 -0800 (PST)
From: Radoslaw Biernacki <rad@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_ssm4567 machine
Date: Thu,  5 Mar 2020 18:22:19 +0100
Message-Id: <eec72ad35e45a9898027f2d4da82c5c1998febad.1583356568.git.rad@semihalf.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 06 Mar 2020 10:10:22 +0100
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

From: Ben Zhang <benzh@chromium.org>

This single fix address two issues on machine with nau88125 + ssm4567:
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
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 71 ++++++++++++++-----
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index c99c8b23e509..c5354da49670 100644
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
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
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
@@ -671,10 +682,32 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
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
+		codec_dai->playback_active, codec_dai->playback_widget->active,
+		codec_dai->rate);
+
+	if (codec_dai->playback_active && codec_dai->playback_widget->active)
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

