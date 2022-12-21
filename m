Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D312653769
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 21:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CE0516DF;
	Wed, 21 Dec 2022 21:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CE0516DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671653663;
	bh=RpQU74H+UOR3BhMwrsAec9Z4aRPjFF3mJHG+jmAKifE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=uUoP2GhkDrH0vNLTCvazrrIhkJ5ikgiFAeUHz6xUAAmZzsz9VoRf1Gere98CuSAVC
	 T8QHuzA3DdiYckJWMlc7Yuf776KfmjkLW8rvBpGjX8j3ZVlQ6efzocDi4s332Kzsvs
	 rg8s1w0iFINGRUR2qDlj9ja4EFvS04F8ZfLakDos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FE4FF80022;
	Wed, 21 Dec 2022 21:13:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F1D9F8047B; Wed, 21 Dec 2022 21:13:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BF49F801C1
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 21:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BF49F801C1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qMcRZhV2
Received: by mail-ed1-x52c.google.com with SMTP id z92so123628ede.1
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 12:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ATD0jdA4hEHgw70KYmeJzTQzWvXRSxdA5xCMRn+TpbY=;
 b=qMcRZhV2F3M+nm4C2Y92ioNYuVzAbjt66BRYaY/D0TMXv99NbLhXcXKJR4zjKkLwxG
 TowDN/A/UvzmdYwyhSTFfD5D5ZwYzNild/YLbmZedo/K5j7etywxPqRjx4uBd9ymFJHc
 2ELBq6EX9TV6phcgsavP4K1Tvr1pFJsG9BcrSKIwbDdPY0VN0XIss3pzEmPUnKuXhaw0
 3IhhQXeD3EBFDvl2/15gVWT/0rvI6jLDmAvP9eAkSJJtPb8q+fALIGtotIKccOIsMstS
 DnC75jWctA91K18+9LpD4xbUpLnMConPH+wl6oD8NT6LwbmyOa+HV3bnUQ4hPKNQGfLi
 2BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ATD0jdA4hEHgw70KYmeJzTQzWvXRSxdA5xCMRn+TpbY=;
 b=GI5AR4xRWcnT3x7+arwr6NtA7yR1+bcNZICFvRmm6A5VlVyaBn9Jl97YvRdytcXEdU
 3Ca0zGHmG5lHM8zgaWPETefqKG9ZipD098SIb86eiCYuScOo1cYq8elAfB5LLmjVP4RJ
 sYB1EHhs6i4flDKPDB7DSFH2NRp5Rv/JzvcsKJYiJm702HuVgqSVS74xbI9WlUugMvOy
 M7Tkgu6y/6NhX+wL1/K+bZmlm6+jWDO6oFSpkscAC4ey4QyrUG/0HtOtT9NjD6enCZmJ
 fVBJvZT0BzenLbQ9nux8ABVndoQJVRA8i4EnWOClnmaVuopG2/sw1b/IYbgM4UVUj+tJ
 n+UQ==
X-Gm-Message-State: AFqh2kqZET4udxQ0dVIB7wDgWS7ddkj/hROrDEae1CdxGwNBnjC6gT/+
 UQw4CS3qXiI3Qx66aXPu7GIN0GpC2snciD/5
X-Google-Smtp-Source: AMrXdXsjOgc5BwtKkrG1cEZhkTj/skJvDxnC1OKeRYZO3or/EAid7R4rTajITBUm6Es9x6bDBZ7yhw==
X-Received: by 2002:a05:6402:220b:b0:475:32d2:74a5 with SMTP id
 cq11-20020a056402220b00b0047532d274a5mr2255585edb.42.1671653600588; 
 Wed, 21 Dec 2022 12:13:20 -0800 (PST)
Received: from tora (80.49.37.164.ipv4.supernova.orange.pl. [80.49.37.164])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906218900b008373f9ea148sm2533810eju.71.2022.12.21.12.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 12:13:20 -0800 (PST)
Date: Wed, 21 Dec 2022 21:13:17 +0100
From: Alicja Michalska <ahplka19@gmail.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org
Subject: [PATCH] ASoC: Intel: avs: Add support for RT5663 codec
Message-ID: <Y6No3WsiZ7Sbg35u@tora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: cezary.rojewski@intel.com, upstream@semihalf.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds support for RT5663 codec on KBL platform.
Such hardware configuration can be found in Google Pixelbook (Google/Eve).

Reported-and-tested-by: CoolStar <coolstarorganization@gmail.com>
Signed-off-by: Alicja Michalska <ahplka19@gmail.com>

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index b2823c2107f7..b167a641d1d5 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -159,6 +159,14 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
 		},
 		.tplg_filename = "da7219-tplg.bin",
 	},
+	{
+		.id = "10EC5663",
+		.drv_name = "avs_rt5663",
+		.mach_params = {
+			.i2s_link_mask = AVS_SSP(1),
+		},
+		.tplg_filename = "rt5663-tplg.bin",
+	},
 	{},
 };
 
diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index e4c230efe8d7..04c090c3f9b5 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -125,6 +125,16 @@ config SND_SOC_INTEL_AVS_MACH_RT5682
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
+config SND_SOC_INTEL_AVS_MACH_RT5663
+	tristate "rt5663 in I2S mode"
+	depends on I2C
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_RT5663_I2C
+	help
+	  This adds support for ASoC machine driver with RT5663 I2S audio codec.
+	  Say Y or m if you have such a device. This is a recommended option.
+	  If unsure select "N".
+
 config SND_SOC_INTEL_AVS_MACH_SSM4567
 	tristate "ssm4567 I2S board"
 	depends on I2C
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index b81343420370..3db863fc26a7 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -13,6 +13,7 @@ snd-soc-avs-rt274-objs := rt274.o
 snd-soc-avs-rt286-objs := rt286.o
 snd-soc-avs-rt298-objs := rt298.o
 snd-soc-avs-rt5682-objs := rt5682.o
+snd-soc-avs-rt5663-objs := rt5663.o
 snd-soc-avs-ssm4567-objs := ssm4567.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DA7219) += snd-soc-avs-da7219.o
@@ -28,4 +29,5 @@ obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT274) += snd-soc-avs-rt274.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT286) += snd-soc-avs-rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT298) += snd-soc-avs-rt298.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5682) += snd-soc-avs-rt5682.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5663) += snd-soc-avs-rt5663.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_SSM4567) += snd-soc-avs-ssm4567.o
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
new file mode 100644
index 000000000000..7d8f45267d27
--- /dev/null
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) CoolStar. All rights reserved.
+// Based off da7219 module
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Author: CoolStar <coolstarorganization.com>
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include <uapi/linux/input-event-codes.h>
+#include "../../../codecs/rt5663.h"
+
+#define RT5663_DAI_NAME		"rt5663-aif"
+
+static const struct snd_kcontrol_new card_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static const struct snd_soc_dapm_widget card_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route card_base_routes[] = {
+	/* HP jack connectors - unknown if we have jack detection */
+	{"Headphone Jack", NULL, "HPOL"},
+	{"Headphone Jack", NULL, "HPOR"},
+
+	{"IN1P", NULL, "Headset Mic"},
+	{"IN1N", NULL, "Headset Mic"},
+};
+
+static int avs_rt5663_codec_init(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_jack *jack;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	int ret;
+
+	jack = snd_soc_card_get_drvdata(card);
+
+	rt5663_sel_asrc_clk_src(component,
+				RT5663_DA_STEREO_FILTER | RT5663_AD_STEREO_FILTER,
+				RT5663_CLK_SEL_I2S1_ASRC);
+				
+	snd_soc_dai_set_sysclk(codec_dai,
+			RT5663_SCLK_S_MCLK, 24576000, SND_SOC_CLOCK_IN);
+
+	/*
+	 * Headset buttons map to the google Reference headset.
+	 * These can be configured by userspace.
+	 */
+	ret = snd_soc_card_jack_new(card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3 | SND_JACK_LINEOUT, jack);
+	if (ret) {
+		dev_err(card->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	return 0;
+}
+
+static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
+			       struct snd_soc_dai_link **dai_link)
+{
+	struct snd_soc_dai_link_component *platform;
+	struct snd_soc_dai_link *dl;
+
+	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
+	if (!dl || !platform)
+		return -ENOMEM;
+
+	platform->name = platform_name;
+
+	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
+	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
+	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
+	if (!dl->name || !dl->cpus || !dl->codecs)
+		return -ENOMEM;
+
+	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
+	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5663:00");
+	dl->codecs->dai_name = RT5663_DAI_NAME;
+	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
+		return -ENOMEM;
+
+	dl->num_cpus = 1;
+	dl->num_codecs = 1;
+	dl->platforms = platform;
+	dl->num_platforms = 1;
+	dl->id = 0;
+	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->init = avs_rt5663_codec_init;
+	dl->nonatomic = 1;
+	dl->no_pcm = 1;
+	dl->dpcm_capture = 1;
+	dl->dpcm_playback = 1;
+
+	*dai_link = dl;
+
+	return 0;
+}
+
+static int avs_create_dapm_routes(struct device *dev, int ssp_port,
+				  struct snd_soc_dapm_route **routes, int *num_routes)
+{
+	struct snd_soc_dapm_route *dr;
+	const int num_base = ARRAY_SIZE(card_base_routes);
+	const int num_dr = num_base + 2;
+	int idx;
+
+	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
+
+	idx = num_base;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "AIF Playback");
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	idx++;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "AIF Capture");
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	*routes = dr;
+	*num_routes = num_dr;
+
+	return 0;
+}
+
+static int avs_card_set_jack(struct snd_soc_card *card, struct snd_soc_jack *jack)
+{
+	struct snd_soc_component *component;
+
+	for_each_card_components(card, component)
+		snd_soc_component_set_jack(component, jack, NULL);
+	return 0;
+}
+
+static int avs_card_remove(struct snd_soc_card *card)
+{
+	return avs_card_set_jack(card, NULL);
+}
+
+static int avs_card_suspend_pre(struct snd_soc_card *card)
+{
+	return avs_card_set_jack(card, NULL);
+}
+
+static int avs_card_resume_post(struct snd_soc_card *card)
+{
+	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
+
+	return avs_card_set_jack(card, jack);
+}
+
+static int avs_rt5663_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dapm_route *routes;
+	struct snd_soc_dai_link *dai_link;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	struct snd_soc_jack *jack;
+	struct device *dev = &pdev->dev;
+	const char *pname;
+	int num_routes, ssp_port, ret;
+
+	mach = dev_get_platdata(dev);
+	pname = mach->mach_params.platform;
+	ssp_port = __ffs(mach->mach_params.i2s_link_mask);
+
+	ret = avs_create_dai_link(dev, pname, ssp_port, &dai_link);
+	if (ret) {
+		dev_err(dev, "Failed to create dai link: %d", ret);
+		return ret;
+	}
+
+	ret = avs_create_dapm_routes(dev, ssp_port, &routes, &num_routes);
+	if (ret) {
+		dev_err(dev, "Failed to create dapm routes: %d", ret);
+		return ret;
+	}
+
+	jack = devm_kzalloc(dev, sizeof(*jack), GFP_KERNEL);
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!jack || !card)
+		return -ENOMEM;
+
+	card->name = "avs_rt5663";
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->remove = avs_card_remove;
+	card->suspend_pre = avs_card_suspend_pre;
+	card->resume_post = avs_card_resume_post;
+	card->dai_link = dai_link;
+	card->num_links = 1;
+	card->controls = card_controls;
+	card->num_controls = ARRAY_SIZE(card_controls);
+	card->dapm_widgets = card_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
+	card->dapm_routes = routes;
+	card->num_dapm_routes = num_routes;
+	card->fully_routed = true;
+	snd_soc_card_set_drvdata(card, jack);
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_rt5663_driver = {
+	.probe = avs_rt5663_probe,
+	.driver = {
+		.name = "avs_rt5663",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_rt5663_driver);
+
+MODULE_AUTHOR("CoolStar <coolstarorganization@gmail.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_rt5663");
