Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F0C6B05C3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 12:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC14617DB;
	Wed,  8 Mar 2023 12:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC14617DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678274578;
	bh=BIx1h4U7YMoCC8k53PdT5IXHG7TB7MEbn8D/+L2GYrM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hTe1iHN/CC1C3CcKPB2BJN4cBga8MqHgbWdNzqnZLT5ItC/PloyFrUq04AxtqrsK5
	 t0sk1drliaBucxnziM6/zzOP2CloWEcgur3ir3m1dnILZennnmUZO6jsR1ZjcN1Ayx
	 f0Yw7JA6l2PGVzF0y6SD8rDuyBaCm1lyQftUvyQ4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB65CF80571;
	Wed,  8 Mar 2023 12:20:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50B36F8042F; Wed,  8 Mar 2023 08:37:08 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 55329F80236
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 08:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55329F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VbzEV/Vv
Received: by mail-ed1-x52a.google.com with SMTP id k10so38122355edk.13
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Mar 2023 23:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwmnzBCq63isuXl3Q6C2EI4fASZ8/CUk+jrNqzYxJ44=;
        b=VbzEV/VvOn0aSQHQgw9+0pNrIzr+/yH5ubUhN1HKeSmTXf94BdvU0QAKeTG/UexecP
         ZICikcpLbHW2e0fYNwJ1vyGRLpXhwmMMlXD9YP4uO+DI5vvTfwVk203z/MAYV7iNWyaM
         LzAP5cU4wfatBnoKPgcGA8qelmXohuXnpZcu1lSeTbjjW3JnQg7Lwe2dS93Db7T778FE
         cBvDSoBmgp6dMUeoYjAojgWZRchmdsvquJU223oHpOImJgsuy1k8R4gIJQ1WmoZmx8pJ
         N8S7zxDTRsGGvpgIvE+YkAOd2Hsg6lQsjUcJTHv2ZjlZBM3GeR1S2dA9jZ8xNEj38m4l
         TbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwmnzBCq63isuXl3Q6C2EI4fASZ8/CUk+jrNqzYxJ44=;
        b=xB4RncMbTSvJVaLx8G8iBqAY22+n3eChKZsiQ1LUGSfpSQrt8cueu80kURII/++Yjt
         KudY2E1oFAbmGb9sn+PdrAXzDsuSsN2pMK22PwWgpr7d3BFahWMfwbAY9pL7cxo7ME4L
         0EqOg04N3D+yszq5BPQz+YlYIuOVDCiFwKqxANQryG94dQCMdi63VFfzOB3ylWaJXVe8
         RE/vxaz+/YqYzgeVp71C2U/FIpmWNvuOknPuo+d/LOn7yPgr+bp6tGI/VhaKVu15qSW8
         0L+JHLwtGCuFv2hkoBb3md0QnVQ+Geq9YW9yC2A8VKC+C36sNBtIRwygBBUamxovwJj8
         Ezzw==
X-Gm-Message-State: AO0yUKUdUjzNpujlCb6hnjs2vXYVTRiR9FZCsHUwKxDV3MZ+5nkongPg
	j6nQwDooUeRxV5lgOm+HopY=
X-Google-Smtp-Source: 
 AK7set8yXe5XLI1jn/5JXFxjt5s2N24GAa37Qe0PvcVxhvZdWMgW9+5PjfaVT0zEhW3uEJtj78YZ1w==
X-Received: by 2002:a17:907:6f18:b0:8f8:5779:f1af with SMTP id
 sy24-20020a1709076f1800b008f85779f1afmr18421549ejc.15.1678260932432;
        Tue, 07 Mar 2023 23:35:32 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:32 -0800 (PST)
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
Subject: [PATCH v2 8/8] ASoC: tegra: Support MAX9808x by machine driver
Date: Wed,  8 Mar 2023 09:35:02 +0200
Message-Id: <20230308073502.5421-9-clamor95@gmail.com>
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
Message-ID-Hash: BPSWO5YX3FSDASMJA6HSKSOB6CBNH6IK
X-Message-ID-Hash: BPSWO5YX3FSDASMJA6HSKSOB6CBNH6IK
X-Mailman-Approved-At: Wed, 08 Mar 2023 11:20:04 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPSWO5YX3FSDASMJA6HSKSOB6CBNH6IK/>
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
index 020f03349373..cc08325d523b 100644
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
@@ -718,6 +720,40 @@ static const struct tegra_asoc_data tegra_max98090_data = {
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
@@ -946,6 +982,8 @@ static const struct tegra_asoc_data tegra_rt5631_data = {
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

