Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B377469E7AB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:39:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22845EAB;
	Tue, 21 Feb 2023 19:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22845EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677004742;
	bh=aMgmOdAG35rbG/cBp9hKUln4WCnYX8QARqG3ow1ru4Q=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qUjTvwWiiW+woAHmNtVwJ5z2wMedxT9AGdYCkz6h60+wfHcqy4W555mLXrA4bVnTq
	 I2ZxPaTp5RGGNP0wrVgJrWA86ixnOaEgPe+F/QF+gYxRk0DWR3d2hOqSX73skPmqI1
	 W1Ej7rq50nIlzY2MdJ0ndlE9DaPwo5bYnfFa73f8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E71F80551;
	Tue, 21 Feb 2023 19:36:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66B5DF804FC; Tue, 21 Feb 2023 19:32:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AFF0F80496
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:32:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AFF0F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P2rP1loD
Received: by mail-ed1-x529.google.com with SMTP id o12so21425290edb.9
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 10:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9otEBsT6k51szcPeR0kTauQC7TYJHg3vZcCUlJI+pc=;
        b=P2rP1loDB9zDzKlPh8AUJXtkTwSG1jgp86DgcAWNlj14I1aKsyb/hY0cEu1mK/Em6v
         2VbL/pm9rgAIQGZXIqeZ3VRz3/sRqwnBOLwwjX6tj+LYaVa31idu512iPJmBe75R5Wy0
         SHMkE1qGCiJBrg2Gf02BCmoBRxVgHAlWM1zJlC9JnTXYn3+P4Ampb59c7Zzw/5cdbBag
         sJ4RJNxoRZC1or0mkhU6Ufi0LxIV6RMY7a/dQtOaww8wdtsMTPuVABcsplPD6FOlKXZa
         /9gYkT7e7/zI/eXBoS6cOqF3OfzoOGvRFtUgI6rucRtMP366vsS7/8HpZkIzrMF96XuD
         o77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9otEBsT6k51szcPeR0kTauQC7TYJHg3vZcCUlJI+pc=;
        b=4dEWsMLGrFbRaPcSZcZd0gTv1ZvZJk/oYACdpvKpF1VDPM+oCHi6rCLoghskubaRtX
         Xj7hLGIJ8rKRY+s19Ij8SVeWFy+dkbkhxeFebhilyD/WrnLqQiiNVPtoAE6sFCMV9b88
         Y8ho/5KiVc7jkFXJaZEquYvMLMvngGpxg7Sthy5g4vj6infQsYunieGakIq9zfBZRHhs
         Ibeg8WZs2EjK3fIJlZWNPpuznTgsBYN2X36VLPwTslfSStfIoV4m3mWNA5f6bFkbGcXY
         yhGtTf7EE0r+ehx9/3zE3O1DzHNqJaHrjsIIVQ7sHiWw+6QptYNknFYh7NmPiaflQ3N9
         vrNg==
X-Gm-Message-State: AO0yUKU7/RIGun0R5JDFZ1s8VM+bvyMCO+1KB6SkFe/5vcfjFBvon+Fd
	SYIVOwEOk/0MTfSZXUqqB20=
X-Google-Smtp-Source: 
 AK7set9t015eh91cqytauqJuSGOe9dRZJXr9U0AD04dYgH1iSSbPBCvAVw0DCAFgr2PSjfdFh6Zvnw==
X-Received: by 2002:a05:6402:164c:b0:4ad:7c30:25a3 with SMTP id
 s12-20020a056402164c00b004ad7c3025a3mr6436926edx.1.1677004350203;
        Tue, 21 Feb 2023 10:32:30 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 06/10] ASoC: tegra: Support MAX9808x by machine driver
Date: Tue, 21 Feb 2023 20:32:07 +0200
Message-Id: <20230221183211.21964-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YCFPSCHRUTQ5WKTLELR5RIW4V75TCNUS
X-Message-ID-Hash: YCFPSCHRUTQ5WKTLELR5RIW4V75TCNUS
X-Mailman-Approved-At: Tue, 21 Feb 2023 18:36:36 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCFPSCHRUTQ5WKTLELR5RIW4V75TCNUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Maxim MAX9808x codec support to the Tegra ASoC machine driver.
This codec is found on LG T30 devices like Optimus 4X HD and
Optimus Vu.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/Kconfig              |  9 ++++++
 sound/soc/tegra/tegra_asoc_machine.c | 46 +++++++++++++++++++++++++---
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index ff905e5dcd86..950f490b8d54 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -263,6 +263,15 @@ config SND_SOC_TEGRA_MAX98090
 	  Say Y or M here if you want to add support for SoC audio on Tegra
 	  boards using the MAX98090 codec, such as Venice2.
 
+config SND_SOC_TEGRA_MAX98088
+	tristate "SoC Audio support for Tegra boards using a MAX9808x codec"
+	depends on I2C && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
+	select SND_SOC_MAX98088
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the MAX98088 codec, such as LG X3.
+
 config SND_SOC_TEGRA_RT5677
 	tristate "SoC Audio support for Tegra boards using a RT5677 codec"
 	depends on I2C && GPIOLIB
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 607800ec07a6..fa0627ea20d7 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -86,11 +86,11 @@ static int tegra_machine_event(struct snd_soc_dapm_widget *w,
 		gpiod_set_value_cansleep(machine->gpiod_spkr_en,
 					 SND_SOC_DAPM_EVENT_ON(event));
 
-	if (!strcmp(w->name, "Mic Jack"))
+	if (!strcmp(w->name, "Mic Jack") || !strcmp(w->name, "Headset Mic"))
 		gpiod_set_value_cansleep(machine->gpiod_ext_mic_en,
 					 SND_SOC_DAPM_EVENT_ON(event));
 
-	if (!strcmp(w->name, "Int Mic"))
+	if (!strcmp(w->name, "Int Mic") || !strcmp(w->name, "Internal Mic 2"))
 		gpiod_set_value_cansleep(machine->gpiod_int_mic_en,
 					 SND_SOC_DAPM_EVENT_ON(event));
 
@@ -108,11 +108,12 @@ static const struct snd_soc_dapm_widget tegra_machine_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", tegra_machine_event),
 	SND_SOC_DAPM_SPK("Int Spk", tegra_machine_event),
+	SND_SOC_DAPM_SPK("Earpiece", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", tegra_machine_event),
 	SND_SOC_DAPM_MIC("Mic Jack", tegra_machine_event),
 	SND_SOC_DAPM_MIC("Internal Mic 1", NULL),
-	SND_SOC_DAPM_MIC("Internal Mic 2", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Internal Mic 2", tegra_machine_event),
+	SND_SOC_DAPM_MIC("Headset Mic", tegra_machine_event),
 	SND_SOC_DAPM_MIC("Digital Mic", NULL),
 	SND_SOC_DAPM_MIC("Mic", NULL),
 	SND_SOC_DAPM_LINE("Line In Jack", NULL),
@@ -123,6 +124,7 @@ static const struct snd_soc_dapm_widget tegra_machine_dapm_widgets[] = {
 static const struct snd_kcontrol_new tegra_machine_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 	SOC_DAPM_PIN_SWITCH("Int Spk"),
+	SOC_DAPM_PIN_SWITCH("Earpiece"),
 	SOC_DAPM_PIN_SWITCH("Int Mic"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
@@ -713,6 +715,40 @@ static const struct tegra_asoc_data tegra_max98090_data = {
 	.add_hp_jack = true,
 };
 
+/* MAX98088 machine */
+
+SND_SOC_DAILINK_DEFS(max98088_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_max98088_dai = {
+	.name = "MAX98088",
+	.stream_name = "MAX98088 PCM",
+	.init = tegra_asoc_machine_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(max98088_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_max98088 = {
+	.components = "codec:max98088",
+	.dai_link = &tegra_max98088_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_max98088_data = {
+	.mclk_rate = tegra_machine_mclk_rate_12mhz,
+	.card = &snd_soc_tegra_max98088,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
 /* SGTL5000 machine */
 
 SND_SOC_DAILINK_DEFS(sgtl5000_hifi,
@@ -941,6 +977,8 @@ static const struct tegra_asoc_data tegra_rt5631_data = {
 static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
 	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
+	{ .compatible = "nvidia,tegra-audio-max98088", .data = &tegra_max98088_data },
+	{ .compatible = "nvidia,tegra-audio-max98089", .data = &tegra_max98088_data },
 	{ .compatible = "nvidia,tegra-audio-sgtl5000", .data = &tegra_sgtl5000_data },
 	{ .compatible = "nvidia,tegra-audio-wm9712", .data = &tegra_wm9712_data },
 	{ .compatible = "nvidia,tegra-audio-wm8753", .data = &tegra_wm8753_data },
-- 
2.37.2

