Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB59220A5C3
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B0661AE5;
	Thu, 25 Jun 2020 21:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B0661AE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593113288;
	bh=PjfZ+Nhy1ilcPd3ZA6BNol+NU9Bf/VBIl7T8u2KGNHs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pJ3VOONQMHQntAOa5FkgFtfFmNshUYucP3o6XvTRLGuCGjacVf9hRChRN9Oub9JJi
	 qrkkSTfU/xghIb3DY4Fc110oux1A50fuwk+eRm3dgOqi06NOQ2/SnIe+riMftQoQB/
	 vfe3IAN6wy3pxkWJ6cfGQhYx6SK5m3UGtCrNOtGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 856C1F80259;
	Thu, 25 Jun 2020 21:26:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EBA5F80249; Thu, 25 Jun 2020 21:26:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0271EF80218
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0271EF80218
IronPort-SDR: hq91GO+LpJMXbChh43yjjOwnpKNnsFvwTwiWVCBMvVpE4p+MuhU9JgPbX2ugy5VPMBOaF5Ox62
 cKHFBMK6BnUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="143280359"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="143280359"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:26:45 -0700
IronPort-SDR: JMM66rIDGjgveRqOyqoyfcAKRot6bz491/wCy+5/VjK1NlRP8q0DDWKnCBvAx1eR6SiaZisLu6
 LtRT05HvuZZQ==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="311198178"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:26:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/17] ASoC: Intel: sof_sdw: Add MAX98373 support
Date: Thu, 25 Jun 2020 14:26:20 -0500
Message-Id: <20200625192620.4312-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Naveen Manohar <naveen.m@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Naveen Manohar <naveen.m@intel.com>

Add max98373-sdw helper function, which configures 2x MAX98373 codecs to
Link1. This patch shares code between the I2S and SoundWire modes of
MAX98373 and adds the trigger already added for I2S.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig            |  3 +-
 sound/soc/intel/boards/Makefile           |  2 +
 sound/soc/intel/boards/sof_maxim_common.c |  4 +-
 sound/soc/intel/boards/sof_maxim_common.h |  3 +
 sound/soc/intel/boards/sof_sdw.c          | 22 ++++++-
 sound/soc/intel/boards/sof_sdw_common.h   |  9 +++
 sound/soc/intel/boards/sof_sdw_max98373.c | 74 +++++++++++++++++++++++
 7 files changed, 111 insertions(+), 6 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_max98373.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index a2a5798c9139..da6234d23897 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -564,6 +564,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
+	select SND_SOC_MAX98373_SDW
 	select SND_SOC_RT700_SDW
 	select SND_SOC_RT711_SDW
 	select SND_SOC_RT1308_SDW
@@ -573,7 +574,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_DMIC
         help
 	  Add support for Intel SoundWire-based platforms connected to
-	  RT700, RT711, RT1308 and RT715
+	  MAX98373, RT700, RT711, RT1308 and RT715
 	  If unsure select "N".
 
 endif
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 15684610f8c6..dc04acb911b6 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -34,9 +34,11 @@ snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
 snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o hda_dsp_common.o
 snd-soc-ehl-rt5660-objs := ehl_rt5660.o hda_dsp_common.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
+			sof_sdw_max98373.o			\
 			sof_sdw_rt711.o sof_sdw_rt700.o		\
 			sof_sdw_rt1308.o sof_sdw_rt715.o	\
 			sof_sdw_rt5682.o			\
+			sof_maxim_common.o                      \
 			sof_sdw_dmic.o sof_sdw_hdmi.o hda_dsp_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 123e6e5313fb..1ddf9181a95d 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -11,7 +11,7 @@
 
 #define MAX_98373_PIN_NAME 16
 
-static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
+const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Left BE_OUT" },
 	{ "Right Spk", NULL, "Right BE_OUT" },
@@ -59,7 +59,7 @@ static int max98373_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int max98373_trigger(struct snd_pcm_substream *substream, int cmd)
+int max98373_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 785b34335368..5240b1c9d379 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -18,7 +18,10 @@
 
 extern struct snd_soc_dai_link_component max_98373_components[2];
 extern struct snd_soc_ops max_98373_ops;
+extern const struct snd_soc_dapm_route max_98373_dapm_routes[];
 
 int max98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
 void sof_max98373_codec_conf(struct snd_soc_card *card);
+int max98373_trigger(struct snd_pcm_substream *substream, int cmd);
+
 #endif /* __SOF_MAXIM_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 70ee79a6b8ab..45be9ec6d4ef 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -120,7 +120,8 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Volteer"),
 		},
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC),
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC |
+					SOF_SDW_FOUR_SPK),
 	},
 
 	{}
@@ -159,6 +160,15 @@ static struct snd_soc_codec_conf codec_conf[] = {
 		.dlc = COMP_CODEC_CONF("sdw:3:25d:715:0"),
 		.name_prefix = "rt715",
 	},
+	/* two MAX98373s on link1 with different unique id */
+	{
+		.dlc = COMP_CODEC_CONF("sdw:1:19f:8373:0:3"),
+		.name_prefix = "Right",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("sdw:1:19f:8373:0:7"),
+		.name_prefix = "Left",
+	},
 	{
 		.dlc = COMP_CODEC_CONF("sdw:0:25d:5682:0"),
 		.name_prefix = "rt5682",
@@ -180,12 +190,12 @@ static struct snd_soc_dai_link_component platform_component[] = {
 };
 
 /* these wrappers are only needed to avoid typecast compilation errors */
-static int sdw_startup(struct snd_pcm_substream *substream)
+int sdw_startup(struct snd_pcm_substream *substream)
 {
 	return sdw_startup_stream(substream);
 }
 
-static void sdw_shutdown(struct snd_pcm_substream *substream)
+void sdw_shutdown(struct snd_pcm_substream *substream)
 {
 	sdw_shutdown_stream(substream);
 }
@@ -222,6 +232,12 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_init,
 	},
+	{
+		.id = 0x8373,
+		.direction = {true, true},
+		.dai_name = "max98373-aif1",
+		.init = sof_sdw_mx8373_init,
+	},
 	{
 		.id = 0x5682,
 		.direction = {true, true},
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 69b363b8a686..3f820cf99a89 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -71,6 +71,9 @@ struct mc_private {
 
 extern unsigned long sof_sdw_quirk;
 
+int sdw_startup(struct snd_pcm_substream *substream);
+void sdw_shutdown(struct snd_pcm_substream *substream);
+
 /* generic HDMI support */
 int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 
@@ -105,6 +108,12 @@ int sof_sdw_rt715_init(const struct snd_soc_acpi_link_adr *link,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
+/* MAX98373 support */
+int sof_sdw_mx8373_init(const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback);
+
 /* RT5682 support */
 int sof_sdw_rt5682_init(const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
diff --git a/sound/soc/intel/boards/sof_sdw_max98373.c b/sound/soc/intel/boards/sof_sdw_max98373.c
new file mode 100644
index 000000000000..a38ddc099a95
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_max98373.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2020 Intel Corporation
+//
+// sof_sdw_max98373 - Helpers to handle 2x MAX98373
+// codec devices from generic machine driver
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof_sdw_common.h"
+#include "sof_maxim_common.h"
+
+static const struct snd_soc_dapm_widget mx8373_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
+static const struct snd_kcontrol_new mx8373_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static int spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:mx8373",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, mx8373_controls,
+					ARRAY_SIZE(mx8373_controls));
+	if (ret) {
+		dev_err(card->dev, "mx8373 ctrls addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, mx8373_widgets,
+					ARRAY_SIZE(mx8373_widgets));
+	if (ret) {
+		dev_err(card->dev, "mx8373 widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes, 2);
+	if (ret)
+		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
+
+	return ret;
+}
+
+static const struct snd_soc_ops max_98373_sdw_ops = {
+	.startup = sdw_startup,
+	.trigger = max98373_trigger,
+	.shutdown = sdw_shutdown,
+};
+
+int sof_sdw_mx8373_init(const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback)
+{
+	info->amp_num++;
+	if (info->amp_num == 2)
+		dai_links->init = spk_init;
+
+	dai_links->ops = &max_98373_sdw_ops;
+
+	return 0;
+}
-- 
2.20.1

