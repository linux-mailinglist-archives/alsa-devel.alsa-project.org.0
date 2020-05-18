Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 034251D6EF6
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 04:34:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC83E16AB;
	Mon, 18 May 2020 04:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC83E16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589769278;
	bh=OCnoVpjZuzeyPykHwK9AlEwcRpV7E9uMuT6f2cxq7+4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRJ6KVzAdMW66KM+Hyo40jVUanTdx7YekbWdJ1uk5P2jFOU2iuLiTw5JvGEeWnhfY
	 aZUyT+YZnUiKaGarpSq6rE16LBeH1i0Ut7DJ7c201NenNpCws3y+0qQY7Ye3v9CyY0
	 9nOC7cK+LJRgtnqC9vY3X8zXTnoHn1GlFx1SD6U0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1842FF802BD;
	Mon, 18 May 2020 04:30:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCFEDF8029A; Mon, 18 May 2020 04:30:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E4A8F801F9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 04:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E4A8F801F9
IronPort-SDR: +H3bJS5STBvDb3D21mmgKujyu3qkJvhcDAFDGlVbHvmOReYzogxmclwsh9HMfpb0wjV936Qi8/
 sTRiTt+UpJxQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 19:30:14 -0700
IronPort-SDR: LSR6v/7S7NQt2Un6EZNjsJNa2kXG+2ALNqBkciF93i7C5Nl98u+Y//rZAC3Oy76A9oNrXIgYJI
 eDJahwe3jeNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,405,1583222400"; d="scan'208";a="307972089"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by FMSMGA003.fm.intel.com with ESMTP; 17 May 2020 19:30:13 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v2 2/4] ASoC: Intel: Boards: Add KeemBay machine driver
Date: Mon, 18 May 2020 10:17:20 +0800
Message-Id: <1589768242-4594-3-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
References: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
Cc: liam.r.girdwood@linux.intel.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

Add KeemBay machine driver which glues the tlv320aic3204 codec driver
and kmb_platform driver to form the asoc sound driver.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 sound/soc/intel/boards/kmb_tlv3204.c | 144 +++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 sound/soc/intel/boards/kmb_tlv3204.c

diff --git a/sound/soc/intel/boards/kmb_tlv3204.c b/sound/soc/intel/boards/kmb_tlv3204.c
new file mode 100644
index 0000000..813c291
--- /dev/null
+++ b/sound/soc/intel/boards/kmb_tlv3204.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*  KeemBay ASOC Machine driver
+ *
+ *  Copyright (C) 2020 Intel Corporation.
+ *
+ */
+
+#include <linux/module.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/soc.h>
+#include "../../codecs/tlv320aic32x4.h"
+
+static unsigned int channels[] = {
+	2,
+};
+
+static struct snd_pcm_hw_constraint_list constraints_ch = {
+	.count	= ARRAY_SIZE(channels),
+	.list	= channels,
+};
+
+static unsigned int rates[] = {
+	16000,
+	48000,
+};
+
+static struct snd_pcm_hw_constraint_list constraints_rates = {
+	.count	= ARRAY_SIZE(rates),
+	.list	= rates,
+};
+
+static int kmb_mach_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int ret;
+	unsigned int sysclk;
+
+	/* As per codec datasheet Sysclk = 256 * fs */
+	sysclk = 12288000;
+
+	/* set the codec system clock */
+	ret = snd_soc_dai_set_sysclk(codec_dai, 1, sysclk, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+
+	return ret;
+}
+
+static int kmb_mach_dai_link_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *str_runtime;
+
+	str_runtime = substream->runtime;
+
+	snd_pcm_hw_constraint_list(str_runtime, 0,
+				   SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_ch);
+
+	snd_pcm_hw_constraint_list(str_runtime, 0,
+				   SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	return 0;
+}
+
+static const struct snd_soc_ops kmb_mach_dai_link_ops = {
+	.startup = kmb_mach_dai_link_startup,
+	.hw_params = kmb_mach_hw_params,
+};
+
+static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
+	SND_SOC_DAPM_MIC("External Mic", NULL),
+	SND_SOC_DAPM_HP("Headphone", NULL),
+};
+
+static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
+	{"Headphone", NULL, "HPL"},
+	{"Headphone", NULL, "HPR"},
+	{"IN3_R", NULL, "External Mic"},
+	{"IN3_L", NULL, "External Mic"},
+};
+
+/* Linking platform to the codec-drivers  */
+SND_SOC_DAILINK_DEFS(link1,
+	DAILINK_COMP_ARRAY(COMP_CPU("20140000.i2s")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic32x4.2-0018",
+					"tlv320aic32x4-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("20140000.i2s")));
+
+/* kmb digital audio interface glue */
+static struct snd_soc_dai_link kmb_mach_dais[] = {
+	{
+		.name		= "tlv320aic32x4",
+		.stream_name	= "TLV320AIC32X4",
+		.ops = &kmb_mach_dai_link_ops,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+				SND_SOC_DAIFMT_NB_NF |
+				SND_SOC_DAIFMT_CBS_CFS,
+		SND_SOC_DAILINK_REG(link1),
+	},
+};
+
+/* kmb audio machine driver */
+static struct snd_soc_card kmb_mach = {
+	.name = "kmb_audio_card",
+	.dai_link = kmb_mach_dais,
+	.num_links = ARRAY_SIZE(kmb_mach_dais),
+	.dapm_routes = aic32x4_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(aic32x4_dapm_routes),
+	.dapm_widgets = aic32x4_dapm_widgets,
+	.num_dapm_widgets =  ARRAY_SIZE(aic32x4_dapm_widgets),
+	.fully_routed = true,
+};
+
+static int kmb_mach_audio_probe(struct platform_device *pdev)
+{
+	kmb_mach.dev = &pdev->dev;
+
+	return devm_snd_soc_register_card(&pdev->dev, &kmb_mach);
+}
+
+static const struct of_device_id kmb_mach_of_match[] = {
+	{ .compatible = "intel,kmb-snd-asoc", },
+	{}
+};
+
+static struct platform_driver kmb_mach_audio = {
+	.probe = kmb_mach_audio_probe,
+	.driver = {
+		.name = "kmb_tlv3204",
+		.of_match_table = kmb_mach_of_match,
+	},
+};
+
+module_platform_driver(kmb_mach_audio)
+
+/* Module information */
+MODULE_DESCRIPTION("Intel Audio tlv3204 machine driver for KeemBay");
+MODULE_AUTHOR("Sia Jee Heng <jee.heng.sia@intel.com>");
+MODULE_AUTHOR("Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:kmb_tlv3204");
-- 
1.9.1

