Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FC26B05C0
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 12:22:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07FF817F6;
	Wed,  8 Mar 2023 12:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07FF817F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678274546;
	bh=CkZ7N8gfXdKcXi721jFroSnzA8OjweuVhWHU/HlgaaM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gmu497xF1DZ4bTA4De7WscigQE44uofpow0Q1LMbvKWP2JMNPrBUf6mUUsRcMQ1/O
	 IGdk/y4vZjxagupUlK8NgGNS3YpF3prjDMF82Pl1tYJUnYRNQJjhzV8VnMI4haOSoY
	 dUt2UnRaY638TKOaQNln6CtJp7DI8xe/75tzfSag=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E27CF80552;
	Wed,  8 Mar 2023 12:20:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DE7EF8042F; Wed,  8 Mar 2023 08:35:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B851DF804B1
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 08:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B851DF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DXEy2PFJ
Received: by mail-ed1-x52a.google.com with SMTP id cy23so61882331edb.12
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Mar 2023 23:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRurDuvuLcJjquBqSnwjPCy2E5AO2aJIW97iErA9sM4=;
        b=DXEy2PFJOzpqN104cccK6uYxR5c1174ZSer35zVcmfd97DYrcnuPs3IRxB/v6YC/wp
         oQDwktYZ/tbk79vXnE/ptfBSdhZsGjkcyJSrOm0pmNvXfQ1jyPc+GdTPA4Jtu+zh41Hu
         yajCjd28Dzvc5phqM0C1jybRX3odJZkM0tOIkefL9FgQoD+xjXvnphD0krYUU0bzw+Yb
         ADkOmnBfAgjkaa4iteoGxFXY1Fsrdldf3qxJtIckCoOpWsuYobTnVzc/21hN9RdadyJK
         toink2EWE4nBO2lnA04I4nKOjeYa6wK2oSFnI/QdJUZDbVQ+iZDQ3jyNAirNr3gVO0rW
         RhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRurDuvuLcJjquBqSnwjPCy2E5AO2aJIW97iErA9sM4=;
        b=4WnuTgd6WE0jgK91VJIAO3jmI7hQRf6cynY+wK7E+r0cSsBcyiA8xlA01TrqlZu/y2
         cEuLhF09jpdyt6BdxXzPEKzE0v3Ly8mmwP1ad6Eht343gjNjA7sLehfysueN+xitlo7k
         A7D9KdRUHZ1X76uG80s8BjD+ocRkuHyVc0KiW2yABhse5Rx2ROKwRjv6YjHVAGQJizIj
         bOcbsIb7/0hg1sIUTCiiyd8+Nf0HtuN9vSVTMzxJtyHp7mh2t+bXbBv9EM3YLUmK5pit
         7zxye5Nn8q28Nd/s2cbzQaO+FYSBH+ozkl0xsoKYFEEWTDQL4FjbzrXWNmE0y9b7ZwH3
         wQ0A==
X-Gm-Message-State: AO0yUKX1AkTOSjUIxjsgYv0SZXMtGBCJBJQSzd5ZzJnfWZCCtsLEb7Be
	nAP0nm5u8SBUVwDv1TjAk9wZ/vuxGjg=
X-Google-Smtp-Source: 
 AK7set8OCHzKkKrxJBrlox5O6l8IP+cyJzu0bSo+yF3mlv6CqL1SNkvM823PHr4dyRGdi2ZNr/Blhg==
X-Received: by 2002:a17:907:7fa7:b0:8d7:6699:3bae with SMTP id
 qk39-20020a1709077fa700b008d766993baemr20690292ejc.57.1678260928840;
        Tue, 07 Mar 2023 23:35:28 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 5/8] ASoC: tegra: Support RT5631 by machine driver
Date: Wed,  8 Mar 2023 09:34:59 +0200
Message-Id: <20230308073502.5421-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5JBRISN74UHOG4OLA5RRUYXXOINWN6YQ
X-Message-ID-Hash: 5JBRISN74UHOG4OLA5RRUYXXOINWN6YQ
X-Mailman-Approved-At: Wed, 08 Mar 2023 11:20:03 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JBRISN74UHOG4OLA5RRUYXXOINWN6YQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Realtek ALC5631/RT5631 codec support to the Tegra ASoC machine driver.
The RT5631 codec is found on devices like ASUS Transformer TF201, TF700T
and other Tegra-based Android tablets.

Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/Kconfig              |  9 ++++
 sound/soc/tegra/tegra_asoc_machine.c | 61 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index b6712a3d1fa1..ff905e5dcd86 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -189,6 +189,15 @@ config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
 config SND_SOC_TEGRA_MACHINE_DRV
 	tristate
 
+config SND_SOC_TEGRA_RT5631
+	tristate "SoC Audio support for Tegra boards using an RT5631 codec"
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
+	select SND_SOC_RT5631
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the RT5631 codec, such as Transformer.
+
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
 	depends on I2C && GPIOLIB
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 7b6d5d90c3a2..020f03349373 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -256,6 +256,32 @@ static unsigned int tegra_machine_mclk_rate_12mhz(unsigned int srate)
 	return mclk;
 }
 
+static unsigned int tegra_machine_mclk_rate_6mhz(unsigned int srate)
+{
+	unsigned int mclk;
+
+	switch (srate) {
+	case 8000:
+	case 16000:
+	case 64000:
+		mclk = 8192000;
+		break;
+	case 11025:
+	case 22050:
+	case 88200:
+		mclk = 11289600;
+		break;
+	case 96000:
+		mclk = 12288000;
+		break;
+	default:
+		mclk = 256 * srate;
+		break;
+	}
+
+	return mclk;
+}
+
 static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
@@ -883,6 +909,40 @@ static const struct tegra_asoc_data tegra_rt5632_data = {
 	.add_headset_jack = true,
 };
 
+/* RT5631 machine */
+
+SND_SOC_DAILINK_DEFS(rt5631_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_rt5631_dai = {
+	.name = "RT5631",
+	.stream_name = "RT5631 PCM",
+	.init = tegra_asoc_machine_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(rt5631_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_rt5631 = {
+	.components = "codec:rt5631",
+	.dai_link = &tegra_rt5631_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_rt5631_data = {
+	.mclk_rate = tegra_machine_mclk_rate_6mhz,
+	.card = &snd_soc_tegra_rt5631,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
 static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
 	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
@@ -892,6 +952,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
 	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
 	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
+	{ .compatible = "nvidia,tegra-audio-rt5631", .data = &tegra_rt5631_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_machine_of_match);
-- 
2.37.2

