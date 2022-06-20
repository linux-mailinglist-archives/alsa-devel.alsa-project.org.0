Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76631551554
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED9F91913;
	Mon, 20 Jun 2022 12:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED9F91913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719687;
	bh=ksVf2AFaHE40QroBGXJIQnCoo3/l/xJZpADUJf1WVu8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUkQnDHgVk/naZzJfrSt6hhxyd5LaFeBpiJIEfcLuGG7X7vuGdWHViEn212Ku75PM
	 gn/M3ln0fFF6gEiB1hfGfdeRGtmdnuYZuQ+0//ZAIlMfkWbWW5kNmFStcNOwcaUgUd
	 ym/L4wk4m8Yr77WJYLDDYFQ7cUZ2q97hOn2cVL6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AE5BF8058C;
	Mon, 20 Jun 2022 12:04:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38E36F8057A; Mon, 20 Jun 2022 12:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B3ADF80570
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B3ADF80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MmQMvgII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719454; x=1687255454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ksVf2AFaHE40QroBGXJIQnCoo3/l/xJZpADUJf1WVu8=;
 b=MmQMvgII9qEfDWQIUSHzW9DZ/5ZdNJpCWrfkfAHiBP19zg4dPMkITXNG
 /roqqPkAEre+1FonuFElV5V9yd1fVAu8C4+QB7bc+BjxrUDDxqMlFHf06
 0jOLZd9RjRUmOMsCk740BWzRijQfGfUnwgybkEwfXVm/SSprcbkyiVMtq
 qZFeVdLFMwL4kH02sOGrrmzoZafv6/ZHbH4ehqHaAcnYAbxBrZbalL5ji
 5xHuTnTeF0bzAz64Zc72q9DmGSTAxJ1CAwdhlTnvhuqwDsgxcMp3TNzaa
 yZOooSW6rG4uvh3k777Z4B9gQHLRomYmsfeY3R0cfSmXx9shhD+aZG5iJ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180717"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180717"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046381"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:04:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 11/17] ASoC: Intel: bdw_rt286: Update code indentation
Date: Mon, 20 Jun 2022 12:13:56 +0200
Message-Id: <20220620101402.2684366-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Make use of 100 character limit and modify indentation so code is easier
to read. While at it, sort includes in alphabetical order.

While at it, rename local variable 'chan' to 'channels' to match
hsw_rt5640 board's equivalent.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 79 +++++++++++-------------------
 1 file changed, 28 insertions(+), 51 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 26ec671a5a52..6c0cd53224d5 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -8,12 +8,11 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
 #include <sound/jack.h>
+#include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/soc.h>
 #include <sound/soc-acpi.h>
-
 #include "../../codecs/rt286.h"
 
 static struct snd_soc_jack card_headset;
@@ -44,7 +43,6 @@ static const struct snd_soc_dapm_widget card_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route card_routes[] = {
-
 	/* speaker */
 	{"Speaker", NULL, "SPOR"},
 	{"Speaker", NULL, "SPOL"},
@@ -69,9 +67,10 @@ static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
-	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset",
-		SND_JACK_HEADSET | SND_JACK_BTN_0, &card_headset,
-		card_headset_pins, ARRAY_SIZE(card_headset_pins));
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
+					 &card_headset, card_headset_pins,
+					 ARRAY_SIZE(card_headset_pins));
 	if (ret)
 		return ret;
 
@@ -79,34 +78,29 @@ static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-
 static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_hw_params *params)
+				      struct snd_pcm_hw_params *params)
 {
-	struct snd_interval *rate = hw_param_interval(params,
-						      SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *chan = hw_param_interval(params,
-						      SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 
 	/* The ADSP will covert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
-	chan->min = chan->max = 2;
-
+	channels->min = channels->max = 2;
 	/* set SSP0 to 16 bit */
 	params_set_format(params, SNDRV_PCM_FORMAT_S16_LE);
+
 	return 0;
 }
 
 static int codec_link_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
+				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000,
-		SND_SOC_CLOCK_IN);
-
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
 		return ret;
@@ -135,8 +129,7 @@ static int bdw_rt286_fe_startup(struct snd_pcm_substream *substream)
 
 	/* Board supports stereo configuration only */
 	runtime->hw.channels_max = 2;
-	return snd_pcm_hw_constraint_list(runtime, 0,
-					  SNDRV_PCM_HW_PARAM_CHANNELS,
+	return snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 					  &constraints_channels);
 }
 
@@ -144,29 +137,15 @@ static const struct snd_soc_ops bdw_rt286_fe_ops = {
 	.startup = bdw_rt286_fe_startup,
 };
 
-SND_SOC_DAILINK_DEF(system,
-	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
-
-SND_SOC_DAILINK_DEF(offload0,
-	DAILINK_COMP_ARRAY(COMP_CPU("Offload0 Pin")));
+SND_SOC_DAILINK_DEF(system, DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
+SND_SOC_DAILINK_DEF(offload0, DAILINK_COMP_ARRAY(COMP_CPU("Offload0 Pin")));
+SND_SOC_DAILINK_DEF(offload1, DAILINK_COMP_ARRAY(COMP_CPU("Offload1 Pin")));
+SND_SOC_DAILINK_DEF(loopback, DAILINK_COMP_ARRAY(COMP_CPU("Loopback Pin")));
 
-SND_SOC_DAILINK_DEF(offload1,
-	DAILINK_COMP_ARRAY(COMP_CPU("Offload1 Pin")));
-
-SND_SOC_DAILINK_DEF(loopback,
-	DAILINK_COMP_ARRAY(COMP_CPU("Loopback Pin")));
-
-SND_SOC_DAILINK_DEF(dummy,
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
-SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
-
-SND_SOC_DAILINK_DEF(codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00", "rt286-aif1")));
-
-SND_SOC_DAILINK_DEF(ssp0_port,
-	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
+SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
+SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
+SND_SOC_DAILINK_DEF(codec, DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00", "rt286-aif1")));
+SND_SOC_DAILINK_DEF(ssp0_port, DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
 
 /* broadwell digital audio interface glue - connects codec <--> CPU */
 static struct snd_soc_dai_link card_dai_links[] = {
@@ -216,8 +195,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.init = codec_link_init,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
@@ -233,7 +211,6 @@ static void bdw_rt286_disable_jack(struct snd_soc_card *card)
 
 	for_each_card_components(card, component) {
 		if (!strcmp(component->name, "i2c-INT343A:00")) {
-
 			dev_dbg(component->dev, "disabling jack detect before going to suspend.\n");
 			snd_soc_component_set_jack(component, NULL, NULL);
 			break;
@@ -248,17 +225,18 @@ static int bdw_rt286_suspend(struct snd_soc_card *card)
 	return 0;
 }
 
-static int bdw_rt286_resume(struct snd_soc_card *card){
+static int bdw_rt286_resume(struct snd_soc_card *card)
+{
 	struct snd_soc_component *component;
 
 	for_each_card_components(card, component) {
 		if (!strcmp(component->name, "i2c-INT343A:00")) {
-
 			dev_dbg(component->dev, "enabling jack detect for resume.\n");
 			snd_soc_component_set_jack(component, &card_headset, NULL);
 			break;
 		}
 	}
+
 	return 0;
 }
 
@@ -291,11 +269,10 @@ static int bdw_rt286_probe(struct platform_device *pdev)
 	int ret;
 
 	bdw_rt286_card.dev = &pdev->dev;
-
 	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
-	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt286_card,
-						    mach->mach_params.platform);
+
+	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt286_card, mach->mach_params.platform);
 	if (ret)
 		return ret;
 
-- 
2.25.1

