Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A21933A1
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 23:12:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 482891682;
	Wed, 25 Mar 2020 23:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 482891682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585174329;
	bh=//lBAhEdsFgVIN8/XQhsc0bXprrcAYLLgDQ0atvWh/8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nrWFGDwc36x0TXKdRB9HWB4g3h/NjREDmzKROVOVhOR+a+QsDC15id8ojYYWEEPsP
	 cw3UfuC9HaASgLUFKOYdwlvcAp0HHcLxiCEBQ4uOJjjdNzdmtvgZICo6UjQtQOo9JJ
	 eJdsTs61CZtIEXjP9F8RMkkEv1YJORQYOnkuJRpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E06C6F802A8;
	Wed, 25 Mar 2020 23:08:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4602F80158; Wed, 25 Mar 2020 23:08:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC637F80147
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 23:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC637F80147
IronPort-SDR: 0MKkpKi88/ru0c4hn8wFepVB2QkGcFXu71TWhCLNiBKu97d87KypkBcVCZfMRyH5rPOtJ5mTAh
 XBxp+Th4Anwg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 15:07:51 -0700
IronPort-SDR: quJS9s272qRbLkW9R5Di3Mgz+B0ri3FdH4EbY+clddt1KU3vTRlJr1+4gmTt8eMwY52ijtX8Gx
 01e5TDz+kRSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="238634742"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2020 15:07:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: Intel: boards: add sof_sdw machine driver
Date: Wed, 25 Mar 2020 17:07:44 -0500
Message-Id: <20200325220746.29601-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325220746.29601-1-pierre-louis.bossart@linux.intel.com>
References: <20200325220746.29601-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

This machine driver provides support for different configurations:

RT700, RT711, RT1308 (1x and 2x, I2S or SoundWire mode), and RT715
CometLake, Icelake, TigerLake.
PDM digital microphones
HDMI

To avoid introducing one driver per configuration, this common machine
driver relies on platform-specific information, tables and quirks to
dynamically create the relevant dailinks.

Unlike a lot of machine drivers, we use different DAI links for
SoundWire capture and playback since the Cadence PDIs can do capture
OR playback, not both simultaneously.

For each configuration, the card component string is updated so that UCM
can select the relevant parts.

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig          |  23 +
 sound/soc/intel/boards/Makefile         |   7 +-
 sound/soc/intel/boards/sof_sdw.c        | 944 ++++++++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h | 108 +++
 sound/soc/intel/boards/sof_sdw_dmic.c   |  42 ++
 sound/soc/intel/boards/sof_sdw_hdmi.c   |  97 +++
 sound/soc/intel/boards/sof_sdw_rt1308.c | 151 ++++
 sound/soc/intel/boards/sof_sdw_rt700.c  | 125 ++++
 sound/soc/intel/boards/sof_sdw_rt711.c  | 156 ++++
 sound/soc/intel/boards/sof_sdw_rt715.c  |  42 ++
 10 files changed, 1693 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_common.h
 create mode 100644 sound/soc/intel/boards/sof_sdw_dmic.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_hdmi.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt1308.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt700.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt711.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt715.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index f18dd9fde973..4110ae5db65f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -524,4 +524,27 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 
 endif ## SND_SOC_SOF_JASPERLAKE
 
+if SND_SOC_SOF_INTEL_SOUNDWIRE
+
+config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
+	tristate "SoundWire generic machine driver"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
+	depends on SOUNDWIRE
+	depends on SND_HDA_CODEC_HDMI
+	select SND_SOC_RT700_SDW
+	select SND_SOC_RT711_SDW
+	select SND_SOC_RT1308_SDW
+	select SND_SOC_RT1308
+	select SND_SOC_RT715_SDW
+	select SND_SOC_DMIC
+        help
+	  Add support for Intel SoundWire-based platforms connected to
+	  RT700, RT711, RT1308 and RT715
+	  If unsure select "N".
+
+endif
+
+
 endif ## SND_SOC_INTEL_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index e083ceeccdad..c4ff5166a042 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -31,7 +31,10 @@ snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o hda_dsp_c
 snd-skl_nau88l25_max98357a-objs := skl_nau88l25_max98357a.o
 snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
 snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o hda_dsp_common.o
-
+snd-soc-sof-sdw-objs += sof_sdw.o				\
+			sof_sdw_rt711.o sof_sdw_rt700.o		\
+			sof_sdw_rt1308.o sof_sdw_rt715.o	\
+			sof_sdw_dmic.o sof_sdw_hdmi.o hda_dsp_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_RT5640_MACH) += snd-soc-sst-byt-rt5640-mach.o
@@ -64,4 +67,4 @@ obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH) += snd-skl_nau88l25_max9
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH) += snd-soc-skl_nau88l25_ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH) += snd-soc-sof_da7219_max98373.o
-
+obj-$(CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH) += snd-soc-sof-sdw.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
new file mode 100644
index 000000000000..8ed6d2079dee
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -0,0 +1,944 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw - ASOC Machine driver for Intel SoundWire platforms
+ */
+
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/module.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof_sdw_common.h"
+
+unsigned long sof_sdw_quirk = SOF_RT711_JD_SRC_JD1;
+
+#define INC_ID(BE, CPU, LINK)	do { (BE)++; (CPU)++; (LINK)++; } while (0)
+
+static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
+{
+	sof_sdw_quirk = (unsigned long)id->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id sof_sdw_quirk_table[] = {
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "09C6")
+		},
+		.driver_data = (void *)(SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX),
+	},
+	{
+		/* early version of SKU 09C6 */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0983")
+		},
+		.driver_data = (void *)(SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "098F"),
+		},
+		.driver_data = (void *)(SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX |
+					SOF_SDW_FOUR_SPK),
+	},
+		{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0990"),
+		},
+		.driver_data = (void *)(SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX |
+					SOF_SDW_FOUR_SPK),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME,
+				  "Tiger Lake Client Platform"),
+		},
+		.driver_data = (void *)(SOF_RT711_JD_SRC_JD1 |
+				SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC |
+				SOF_SSP_PORT(SOF_I2S_SSP2)),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Ice Lake Client"),
+		},
+		.driver_data = (void *)SOF_SDW_PCH_DMIC,
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CometLake Client"),
+		},
+		.driver_data = (void *)SOF_SDW_PCH_DMIC,
+	},
+
+	{}
+};
+
+static struct snd_soc_codec_conf codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF("sdw:0:25d:711:0"),
+		.name_prefix = "rt711",
+	},
+	/* rt1308 w/ I2S connection */
+	{
+		.dlc = COMP_CODEC_CONF("i2c-10EC1308:00"),
+		.name_prefix = "rt1308-1",
+	},
+	/* rt1308 left on link 1 */
+	{
+		.dlc = COMP_CODEC_CONF("sdw:1:25d:1308:0"),
+		.name_prefix = "rt1308-1",
+	},
+	/* two 1308s on link1 with different unique id */
+	{
+		.dlc = COMP_CODEC_CONF("sdw:1:25d:1308:0:0"),
+		.name_prefix = "rt1308-1",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("sdw:1:25d:1308:0:2"),
+		.name_prefix = "rt1308-2",
+	},
+	/* rt1308 right on link 2 */
+	{
+		.dlc = COMP_CODEC_CONF("sdw:2:25d:1308:0"),
+		.name_prefix = "rt1308-2",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("sdw:3:25d:715:0"),
+		.name_prefix = "rt715",
+	},
+};
+
+static struct snd_soc_dai_link_component dmic_component[] = {
+	{
+		.name = "dmic-codec",
+		.dai_name = "dmic-hifi",
+	}
+};
+
+static struct snd_soc_dai_link_component platform_component[] = {
+	{
+		/* name might be overridden during probe */
+		.name = "0000:00:1f.3"
+	}
+};
+
+/* these wrappers are only needed to avoid typecast compilation errors */
+static int sdw_startup(struct snd_pcm_substream *substream)
+{
+	return sdw_startup_stream(substream);
+}
+
+static void sdw_shutdown(struct snd_pcm_substream *substream)
+{
+	sdw_shutdown_stream(substream);
+}
+
+static const struct snd_soc_ops sdw_ops = {
+	.startup = sdw_startup,
+	.shutdown = sdw_shutdown,
+};
+
+static struct sof_sdw_codec_info codec_info_list[] = {
+	{
+		.id = 0x700,
+		.direction = {true, true},
+		.dai_name = "rt700-aif1",
+		.init = sof_sdw_rt700_init,
+	},
+	{
+		.id = 0x711,
+		.direction = {true, true},
+		.dai_name = "rt711-aif1",
+		.init = sof_sdw_rt711_init,
+	},
+	{
+		.id = 0x1308,
+		.acpi_id = "10EC1308",
+		.direction = {true, false},
+		.dai_name = "rt1308-aif",
+		.ops = &sof_sdw_rt1308_i2s_ops,
+		.init = sof_sdw_rt1308_init,
+	},
+	{
+		.id = 0x715,
+		.direction = {false, true},
+		.dai_name = "rt715-aif2",
+		.init = sof_sdw_rt715_init,
+	},
+};
+
+static inline int find_codec_info_part(unsigned int part_id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+		if (part_id == codec_info_list[i].id)
+			break;
+
+	if (i == ARRAY_SIZE(codec_info_list))
+		return -EINVAL;
+
+	return i;
+}
+
+static inline int find_codec_info_acpi(const u8 *acpi_id)
+{
+	int i;
+
+	if (!acpi_id[0])
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+		if (!memcmp(codec_info_list[i].acpi_id, acpi_id,
+			    ACPI_ID_LEN))
+			break;
+
+	if (i == ARRAY_SIZE(codec_info_list))
+		return -EINVAL;
+
+	return i;
+}
+
+/*
+ * get BE dailink number and CPU DAI number based on sdw link adr.
+ * Since some sdw slaves may be aggregated, the CPU DAI number
+ * may be larger than the number of BE dailinks.
+ */
+static int get_sdw_dailink_info(const struct snd_soc_acpi_link_adr *links,
+				int *sdw_be_num, int *sdw_cpu_dai_num)
+{
+	const struct snd_soc_acpi_link_adr *link;
+	bool group_visited[SDW_MAX_GROUPS];
+	bool no_aggregation;
+	int i;
+
+	no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
+	*sdw_cpu_dai_num = 0;
+	*sdw_be_num  = 0;
+
+	if (!links)
+		return -EINVAL;
+
+	for (i = 0; i < SDW_MAX_GROUPS; i++)
+		group_visited[i] = false;
+
+	for (link = links; link->num_adr; link++) {
+		const struct snd_soc_acpi_endpoint *endpoint;
+		int part_id, codec_index;
+		int stream;
+		u64 adr;
+
+		adr = link->adr_d->adr;
+		part_id = SDW_PART_ID(adr);
+		codec_index = find_codec_info_part(part_id);
+		if (codec_index < 0)
+			return codec_index;
+
+		endpoint = link->adr_d->endpoints;
+
+		/* count DAI number for playback and capture */
+		for_each_pcm_streams(stream) {
+			if (!codec_info_list[codec_index].direction[stream])
+				continue;
+
+			(*sdw_cpu_dai_num)++;
+
+			/* count BE for each non-aggregated slave or group */
+			if (!endpoint->aggregated || no_aggregation ||
+			    !group_visited[endpoint->group_id])
+				(*sdw_be_num)++;
+		}
+
+		if (endpoint->aggregated)
+			group_visited[endpoint->group_id] = true;
+	}
+
+	return 0;
+}
+
+static void init_dai_link(struct snd_soc_dai_link *dai_links, int be_id,
+			  char *name, int playback, int capture,
+			  struct snd_soc_dai_link_component *cpus,
+			  int cpus_num,
+			  struct snd_soc_dai_link_component *codecs,
+			  int codecs_num,
+			  int (*init)(struct snd_soc_pcm_runtime *rtd),
+			  const struct snd_soc_ops *ops)
+{
+	dai_links->id = be_id;
+	dai_links->name = name;
+	dai_links->platforms = platform_component;
+	dai_links->num_platforms = ARRAY_SIZE(platform_component);
+	dai_links->nonatomic = true;
+	dai_links->no_pcm = 1;
+	dai_links->cpus = cpus;
+	dai_links->num_cpus = cpus_num;
+	dai_links->codecs = codecs;
+	dai_links->num_codecs = codecs_num;
+	dai_links->dpcm_playback = playback;
+	dai_links->dpcm_capture = capture;
+	dai_links->init = init;
+	dai_links->ops = ops;
+}
+
+static bool is_unique_device(const struct snd_soc_acpi_link_adr *link,
+			     unsigned int sdw_version,
+			     unsigned int mfg_id,
+			     unsigned int part_id,
+			     unsigned int class_id,
+			     int index_in_link
+			    )
+{
+	int i;
+
+	for (i = 0; i < link->num_adr; i++) {
+		unsigned int sdw1_version, mfg1_id, part1_id, class1_id;
+		u64 adr;
+
+		/* skip itself */
+		if (i == index_in_link)
+			continue;
+
+		adr = link->adr_d[i].adr;
+
+		sdw1_version = SDW_VERSION(adr);
+		mfg1_id = SDW_MFG_ID(adr);
+		part1_id = SDW_PART_ID(adr);
+		class1_id = SDW_CLASS_ID(adr);
+
+		if (sdw_version == sdw1_version &&
+		    mfg_id == mfg1_id &&
+		    part_id == part1_id &&
+		    class_id == class1_id)
+			return false;
+	}
+
+	return true;
+}
+
+static int create_codec_dai_name(struct device *dev,
+				 const struct snd_soc_acpi_link_adr *link,
+				 struct snd_soc_dai_link_component *codec,
+				 int offset)
+{
+	int i;
+
+	for (i = 0; i < link->num_adr; i++) {
+		unsigned int sdw_version, unique_id, mfg_id;
+		unsigned int link_id, part_id, class_id;
+		int codec_index, comp_index;
+		char *codec_str;
+		u64 adr;
+
+		adr = link->adr_d[i].adr;
+
+		sdw_version = SDW_VERSION(adr);
+		link_id = SDW_DISCO_LINK_ID(adr);
+		unique_id = SDW_UNIQUE_ID(adr);
+		mfg_id = SDW_MFG_ID(adr);
+		part_id = SDW_PART_ID(adr);
+		class_id = SDW_CLASS_ID(adr);
+
+		comp_index = i + offset;
+		if (is_unique_device(link, sdw_version, mfg_id, part_id,
+				     class_id, i)) {
+			codec_str = "sdw:%x:%x:%x:%x";
+			codec[comp_index].name =
+				devm_kasprintf(dev, GFP_KERNEL, codec_str,
+					       link_id, mfg_id, part_id,
+					       class_id);
+		} else {
+			codec_str = "sdw:%x:%x:%x:%x:%x";
+			codec[comp_index].name =
+				devm_kasprintf(dev, GFP_KERNEL, codec_str,
+					       link_id, mfg_id, part_id,
+					       class_id, unique_id);
+		}
+
+		if (!codec[comp_index].name)
+			return -ENOMEM;
+
+		codec_index = find_codec_info_part(part_id);
+		if (codec_index < 0)
+			return codec_index;
+
+		codec[comp_index].dai_name =
+			codec_info_list[codec_index].dai_name;
+	}
+
+	return 0;
+}
+
+static int set_codec_init_func(const struct snd_soc_acpi_link_adr *link,
+			       struct snd_soc_dai_link *dai_links,
+			       bool playback)
+{
+	int i;
+
+	for (i = 0; i < link->num_adr; i++) {
+		unsigned int part_id;
+		int codec_index;
+
+		part_id = SDW_PART_ID(link->adr_d[i].adr);
+		codec_index = find_codec_info_part(part_id);
+
+		if (codec_index < 0)
+			return codec_index;
+
+		if (codec_info_list[codec_index].init)
+			codec_info_list[codec_index].init(link, dai_links,
+						 &codec_info_list[codec_index],
+						 playback);
+	}
+
+	return 0;
+}
+
+/*
+ * check endpoint status in slaves and gather link ID for all slaves in
+ * the same group to generate different CPU DAI. Now only support
+ * one sdw link with all slaves set with only single group id.
+ *
+ * one slave on one sdw link with aggregated = 0
+ * one sdw BE DAI <---> one-cpu DAI <---> one-codec DAI
+ *
+ * two or more slaves on one sdw link with aggregated = 0
+ * one sdw BE DAI  <---> one-cpu DAI <---> multi-codec DAIs
+ *
+ * multiple links with multiple slaves with aggregated = 1
+ * one sdw BE DAI  <---> 1 .. N CPU DAIs <----> 1 .. N codec DAIs
+ */
+static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
+			  struct device *dev, int *cpu_dai_id, int *cpu_dai_num,
+			  int *codec_num, int *group_id,
+			  bool *group_generated)
+{
+	const struct snd_soc_acpi_adr_device *adr_d;
+	const struct snd_soc_acpi_link_adr *adr_next;
+	bool no_aggregation;
+	int index = 0;
+
+	no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
+	*codec_num = adr_link->num_adr;
+	adr_d = adr_link->adr_d;
+
+	/* make sure the link mask has a single bit set */
+	if (!is_power_of_2(adr_link->mask))
+		return -EINVAL;
+
+	cpu_dai_id[index++] = ffs(adr_link->mask) - 1;
+	if (!adr_d->endpoints->aggregated || no_aggregation) {
+		*cpu_dai_num = 1;
+		*group_id = 0;
+		return 0;
+	}
+
+	*group_id = adr_d->endpoints->group_id;
+
+	/* gather other link ID of slaves in the same group */
+	for (adr_next = adr_link + 1; adr_next && adr_next->num_adr;
+		adr_next++) {
+		const struct snd_soc_acpi_endpoint *endpoint;
+
+		endpoint = adr_next->adr_d->endpoints;
+		if (!endpoint->aggregated ||
+		    endpoint->group_id != *group_id)
+			continue;
+
+		/* make sure the link mask has a single bit set */
+		if (!is_power_of_2(adr_next->mask))
+			return -EINVAL;
+
+		if (index >= SDW_MAX_CPU_DAIS) {
+			dev_err(dev, " cpu_dai_id array overflows");
+			return -EINVAL;
+		}
+
+		cpu_dai_id[index++] = ffs(adr_next->mask) - 1;
+		*codec_num += adr_next->num_adr;
+	}
+
+	/*
+	 * indicate CPU DAIs for this group have been generated
+	 * to avoid generating CPU DAIs for this group again.
+	 */
+	group_generated[*group_id] = true;
+	*cpu_dai_num = index;
+
+	return 0;
+}
+
+static int create_sdw_dailink(struct device *dev, int *be_index,
+			      struct snd_soc_dai_link *dai_links,
+			      int sdw_be_num, int sdw_cpu_dai_num,
+			      struct snd_soc_dai_link_component *cpus,
+			      const struct snd_soc_acpi_link_adr *link,
+			      int *cpu_id, bool *group_generated)
+{
+	const struct snd_soc_acpi_link_adr *link_next;
+	struct snd_soc_dai_link_component *codecs;
+	int cpu_dai_id[SDW_MAX_CPU_DAIS];
+	int cpu_dai_num, cpu_dai_index;
+	unsigned int part_id, group_id;
+	int codec_idx = 0;
+	int i = 0, j = 0;
+	int codec_index;
+	int codec_num;
+	int stream;
+	int ret;
+	int k;
+
+	ret = get_slave_info(link, dev, cpu_dai_id, &cpu_dai_num, &codec_num,
+			     &group_id, group_generated);
+	if (ret)
+		return ret;
+
+	codecs = devm_kcalloc(dev, codec_num, sizeof(*codecs), GFP_KERNEL);
+	if (!codecs)
+		return -ENOMEM;
+
+	/* generate codec name on different links in the same group */
+	for (link_next = link; link_next && link_next->num_adr &&
+	     i < cpu_dai_num; link_next++) {
+		const struct snd_soc_acpi_endpoint *endpoints;
+
+		endpoints = link_next->adr_d->endpoints;
+		if (group_id && (!endpoints->aggregated ||
+				 endpoints->group_id != group_id))
+			continue;
+
+		/* skip the link excluded by this processed group */
+		if (cpu_dai_id[i] != ffs(link_next->mask) - 1)
+			continue;
+
+		ret = create_codec_dai_name(dev, link_next, codecs, codec_idx);
+		if (ret < 0)
+			return ret;
+
+		/* check next link to create codec dai in the processed group */
+		i++;
+		codec_idx += link_next->num_adr;
+	}
+
+	/* find codec info to create BE DAI */
+	part_id = SDW_PART_ID(link->adr_d[0].adr);
+	codec_index = find_codec_info_part(part_id);
+	if (codec_index < 0)
+		return codec_index;
+
+	cpu_dai_index = *cpu_id;
+	for_each_pcm_streams(stream) {
+		char *name, *cpu_name;
+		int playback, capture;
+		static const char * const sdw_stream_name[] = {
+			"SDW%d-Playback",
+			"SDW%d-Capture",
+		};
+
+		if (!codec_info_list[codec_index].direction[stream])
+			continue;
+
+		/* create stream name according to first link id */
+		name = devm_kasprintf(dev, GFP_KERNEL,
+				      sdw_stream_name[stream], cpu_dai_id[0]);
+		if (!name)
+			return -ENOMEM;
+
+		/*
+		 * generate CPU DAI name base on the sdw link ID and
+		 * PIN ID with offset of 2 according to sdw dai driver.
+		 */
+		for (k = 0; k < cpu_dai_num; k++) {
+			cpu_name = devm_kasprintf(dev, GFP_KERNEL,
+						  "SDW%d Pin%d", cpu_dai_id[k],
+						  j + SDW_INTEL_BIDIR_PDI_BASE);
+			if (!cpu_name)
+				return -ENOMEM;
+
+			if (cpu_dai_index >= sdw_cpu_dai_num) {
+				dev_err(dev, "invalid cpu dai index %d",
+					cpu_dai_index);
+				return -EINVAL;
+			}
+
+			cpus[cpu_dai_index++].dai_name = cpu_name;
+		}
+
+		if (*be_index >= sdw_be_num) {
+			dev_err(dev, " invalid be dai index %d", *be_index);
+			return -EINVAL;
+		}
+
+		if (*cpu_id >= sdw_cpu_dai_num) {
+			dev_err(dev, " invalid cpu dai index %d", *cpu_id);
+			return -EINVAL;
+		}
+
+		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
+		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
+		init_dai_link(dai_links + *be_index, *be_index, name,
+			      playback, capture,
+			      cpus + *cpu_id, cpu_dai_num,
+			      codecs, codec_num,
+			      NULL, &sdw_ops);
+
+		ret = set_codec_init_func(link, dai_links + (*be_index)++,
+					  playback);
+		if (ret < 0) {
+			dev_err(dev, "failed to init codec %d", codec_index);
+			return ret;
+		}
+
+		*cpu_id += cpu_dai_num;
+		j++;
+	}
+
+	return 0;
+}
+
+/*
+ * DAI link ID of SSP & DMIC & HDMI are based on last
+ * link ID used by sdw link. Since be_id may be changed
+ * in init func of sdw codec, it is not equal to be_id
+ */
+static inline int get_next_be_id(struct snd_soc_dai_link *links,
+				 int be_id)
+{
+	return links[be_id - 1].id + 1;
+}
+
+static int sof_card_dai_links_create(struct device *dev,
+				     struct snd_soc_acpi_mach *mach,
+				     struct snd_soc_card *card)
+{
+	int ssp_num, sdw_be_num = 0, hdmi_num = 0, dmic_num;
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+	struct snd_soc_dai_link_component *idisp_components;
+#endif
+	struct snd_soc_dai_link_component *ssp_components;
+	struct snd_soc_acpi_mach_params *mach_params;
+	const struct snd_soc_acpi_link_adr *adr_link;
+	struct snd_soc_dai_link_component *cpus;
+	bool group_generated[SDW_MAX_GROUPS];
+	int ssp_codec_index, ssp_mask;
+	struct snd_soc_dai_link *links;
+	int num_links, link_id = 0;
+	char *name, *cpu_name;
+	int total_cpu_dai_num;
+	int sdw_cpu_dai_num;
+	int i, j, be_id = 0;
+	int cpu_id = 0;
+	int comp_num;
+	int ret;
+
+	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+		codec_info_list[i].amp_num = 0;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+	hdmi_num = sof_sdw_quirk & SOF_SDW_TGL_HDMI ?
+				SOF_TGL_HDMI_COUNT : SOF_PRE_TGL_HDMI_COUNT;
+#endif
+
+	ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
+	/*
+	 * on generic tgl platform, I2S or sdw mode is supported
+	 * based on board rework. A ACPI device is registered in
+	 * system only when I2S mode is supported, not sdw mode.
+	 * Here check ACPI ID to confirm I2S is supported.
+	 */
+	ssp_codec_index = find_codec_info_acpi(mach->id);
+	ssp_num = ssp_codec_index >= 0 ? hweight_long(ssp_mask) : 0;
+	comp_num = hdmi_num + ssp_num;
+
+	mach_params = &mach->mach_params;
+	ret = get_sdw_dailink_info(mach_params->links,
+				   &sdw_be_num, &sdw_cpu_dai_num);
+	if (ret < 0) {
+		dev_err(dev, "failed to get sdw link info %d", ret);
+		return ret;
+	}
+
+	/* enable dmic01 & dmic16k */
+	dmic_num = (sof_sdw_quirk & SOF_SDW_PCH_DMIC) ? 2 : 0;
+	comp_num += dmic_num;
+
+	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d", sdw_be_num, ssp_num,
+		dmic_num, hdmi_num);
+
+	/* allocate BE dailinks */
+	num_links = comp_num + sdw_be_num;
+	links = devm_kcalloc(dev, num_links, sizeof(*links), GFP_KERNEL);
+
+	/* allocated CPU DAIs */
+	total_cpu_dai_num = comp_num + sdw_cpu_dai_num;
+	cpus = devm_kcalloc(dev, total_cpu_dai_num, sizeof(*cpus),
+			    GFP_KERNEL);
+
+	if (!links || !cpus)
+		return -ENOMEM;
+
+	/* SDW */
+	if (!sdw_be_num)
+		goto SSP;
+
+	adr_link = mach_params->links;
+	if (!adr_link)
+		return -EINVAL;
+
+	/*
+	 * SoundWire Slaves aggregated in the same group may be
+	 * located on different hardware links. Clear array to indicate
+	 * CPU DAIs for this group have not been generated.
+	 */
+	for (i = 0; i < SDW_MAX_GROUPS; i++)
+		group_generated[i] = false;
+
+	/* generate DAI links by each sdw link */
+	for (; adr_link->num_adr; adr_link++) {
+		const struct snd_soc_acpi_endpoint *endpoint;
+
+		endpoint = adr_link->adr_d->endpoints;
+		if (endpoint->aggregated && !endpoint->group_id) {
+			dev_err(dev, "invalid group id on link %x",
+				adr_link->mask);
+			continue;
+		}
+
+		/* this group has been generated */
+		if (endpoint->aggregated &&
+		    group_generated[endpoint->group_id])
+			continue;
+
+		ret = create_sdw_dailink(dev, &be_id, links, sdw_be_num,
+					 sdw_cpu_dai_num, cpus, adr_link,
+					 &cpu_id, group_generated);
+		if (ret < 0) {
+			dev_err(dev, "failed to create dai link %d", be_id);
+			return -ENOMEM;
+		}
+	}
+
+	/* non-sdw DAI follows sdw DAI */
+	link_id = be_id;
+
+	/* get BE ID for non-sdw DAI */
+	be_id = get_next_be_id(links, be_id);
+
+SSP:
+	/* SSP */
+	if (!ssp_num)
+		goto DMIC;
+
+	for (i = 0, j = 0; ssp_mask; i++, ssp_mask >>= 1) {
+		struct sof_sdw_codec_info *info;
+		int playback, capture;
+		char *codec_name;
+
+		if (!(ssp_mask & 0x1))
+			continue;
+
+		name = devm_kasprintf(dev, GFP_KERNEL,
+				      "SSP%d-Codec", i);
+		if (!name)
+			return -ENOMEM;
+
+		cpu_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
+		if (!cpu_name)
+			return -ENOMEM;
+
+		ssp_components = devm_kzalloc(dev, sizeof(*ssp_components),
+					      GFP_KERNEL);
+		if (!ssp_components)
+			return -ENOMEM;
+
+		info = &codec_info_list[ssp_codec_index];
+		codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
+					    info->acpi_id, j++);
+		if (!codec_name)
+			return -ENOMEM;
+
+		ssp_components->name = codec_name;
+		ssp_components->dai_name = info->dai_name;
+		cpus[cpu_id].dai_name = cpu_name;
+
+		playback = info->direction[SNDRV_PCM_STREAM_PLAYBACK];
+		capture = info->direction[SNDRV_PCM_STREAM_CAPTURE];
+		init_dai_link(links + link_id, be_id, name,
+			      playback, capture,
+			      cpus + cpu_id, 1,
+			      ssp_components, 1,
+			      NULL, info->ops);
+
+		ret = info->init(NULL, links + link_id, info, 0);
+		if (ret < 0)
+			return ret;
+
+		INC_ID(be_id, cpu_id, link_id);
+	}
+
+DMIC:
+	/* dmic */
+	if (dmic_num > 0) {
+		cpus[cpu_id].dai_name = "DMIC01 Pin";
+		init_dai_link(links + link_id, be_id, "dmic01",
+			      0, 1, // DMIC only supports capture
+			      cpus + cpu_id, 1,
+			      dmic_component, 1,
+			      sof_sdw_dmic_init, NULL);
+		INC_ID(be_id, cpu_id, link_id);
+
+		cpus[cpu_id].dai_name = "DMIC16k Pin";
+		init_dai_link(links + link_id, be_id, "dmic16k",
+			      0, 1, // DMIC only supports capture
+			      cpus + cpu_id, 1,
+			      dmic_component, 1,
+			      /* don't call sof_sdw_dmic_init() twice */
+			      NULL, NULL);
+		INC_ID(be_id, cpu_id, link_id);
+	}
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+	/* HDMI */
+	if (hdmi_num > 0) {
+		idisp_components = devm_kcalloc(dev, hdmi_num,
+						sizeof(*idisp_components),
+						GFP_KERNEL);
+		if (!idisp_components)
+			return -ENOMEM;
+	}
+
+	for (i = 0; i < hdmi_num; i++) {
+		name = devm_kasprintf(dev, GFP_KERNEL,
+				      "iDisp%d", i + 1);
+		if (!name)
+			return -ENOMEM;
+
+		idisp_components[i].name = "ehdaudio0D2";
+		idisp_components[i].dai_name = devm_kasprintf(dev,
+							      GFP_KERNEL,
+							      "intel-hdmi-hifi%d",
+							      i + 1);
+		if (!idisp_components[i].dai_name)
+			return -ENOMEM;
+
+		cpu_name = devm_kasprintf(dev, GFP_KERNEL,
+					  "iDisp%d Pin", i + 1);
+		if (!cpu_name)
+			return -ENOMEM;
+
+		cpus[cpu_id].dai_name = cpu_name;
+		init_dai_link(links + link_id, be_id, name,
+			      1, 0, // HDMI only supports playback
+			      cpus + cpu_id, 1,
+			      idisp_components + i, 1,
+			      sof_sdw_hdmi_init, NULL);
+		INC_ID(be_id, cpu_id, link_id);
+	}
+#endif
+
+	card->dai_link = links;
+	card->num_links = num_links;
+
+	return 0;
+}
+
+/* SoC card */
+static const char sdw_card_long_name[] = "Intel Soundwire SOF";
+
+static struct snd_soc_card card_sof_sdw = {
+	.name = "soundwire",
+	.late_probe = sof_sdw_hdmi_card_late_probe,
+	.codec_conf = codec_conf,
+	.num_configs = ARRAY_SIZE(codec_conf),
+};
+
+static int mc_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &card_sof_sdw;
+	struct snd_soc_acpi_mach *mach;
+	struct mc_private *ctx;
+	int ret;
+
+	dev_dbg(&pdev->dev, "Entry %s\n", __func__);
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	dmi_check_system(sof_sdw_quirk_table);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
+#endif
+
+	card->dev = &pdev->dev;
+
+	mach = pdev->dev.platform_data;
+	ret = sof_card_dai_links_create(&pdev->dev, mach,
+					card);
+	if (ret < 0)
+		return ret;
+
+	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
+
+	snd_soc_card_set_drvdata(card, ctx);
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "cfg-spk:%d",
+					  (sof_sdw_quirk & SOF_SDW_FOUR_SPK) ? 4 : 2);
+	if (!card->components)
+		return -ENOMEM;
+
+	card->long_name = sdw_card_long_name;
+
+	/* Register the card */
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err(card->dev, "snd_soc_register_card failed %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, card);
+
+	return ret;
+}
+
+static struct platform_driver sof_sdw_driver = {
+	.driver = {
+		.name = "sof_sdw",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = mc_probe,
+};
+
+module_platform_driver(sof_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC SoundWire Generic Machine driver");
+MODULE_AUTHOR("Bard Liao <yung-chuan.liao@linux.intel.com>");
+MODULE_AUTHOR("Rander Wang <rander.wang@linux.intel.com>");
+MODULE_AUTHOR("Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:sof_sdw");
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
new file mode 100644
index 000000000000..0d738e234bc5
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *  Copyright (c) 2020 Intel Corporation
+ */
+
+/*
+ *  sof_sdw_common.h - prototypes for common helpers
+ */
+
+#ifndef SND_SOC_SOF_SDW_COMMON_H
+#define SND_SOC_SOF_SDW_COMMON_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+#define MAX_NO_PROPS 2
+#define MAX_HDMI_NUM 4
+#define SDW_DMIC_DAI_ID 4
+#define SDW_MAX_CPU_DAIS 16
+#define SDW_INTEL_BIDIR_PDI_BASE 2
+
+/* 8 combinations with 4 links + unused group 0 */
+#define SDW_MAX_GROUPS 9
+
+enum {
+	SOF_RT711_JD_SRC_JD1 = 1,
+	SOF_RT711_JD_SRC_JD2 = 2,
+};
+
+enum {
+	SOF_PRE_TGL_HDMI_COUNT = 3,
+	SOF_TGL_HDMI_COUNT = 4,
+};
+
+enum {
+	SOF_I2S_SSP0 = BIT(0),
+	SOF_I2S_SSP1 = BIT(1),
+	SOF_I2S_SSP2 = BIT(2),
+	SOF_I2S_SSP3 = BIT(3),
+	SOF_I2S_SSP4 = BIT(4),
+	SOF_I2S_SSP5 = BIT(5),
+};
+
+#define SOF_RT711_JDSRC(quirk)		((quirk) & GENMASK(1, 0))
+#define SOF_SDW_FOUR_SPK		BIT(2)
+#define SOF_SDW_TGL_HDMI		BIT(3)
+#define SOF_SDW_PCH_DMIC		BIT(4)
+#define SOF_SSP_PORT(x)		(((x) & GENMASK(5, 0)) << 5)
+#define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 5) & GENMASK(5, 0))
+#define SOF_RT715_DAI_ID_FIX		BIT(11)
+#define SOF_SDW_NO_AGGREGATION		BIT(12)
+
+struct sof_sdw_codec_info {
+	const int id;
+	int amp_num;
+	const u8 acpi_id[ACPI_ID_LEN];
+	const bool direction[2]; // playback & capture support
+	const char *dai_name;
+	const struct snd_soc_ops *ops;
+
+	int  (*init)(const struct snd_soc_acpi_link_adr *link,
+		     struct snd_soc_dai_link *dai_links,
+		     struct sof_sdw_codec_info *info,
+		     bool playback);
+};
+
+struct mc_private {
+	struct list_head hdmi_pcm_list;
+	bool common_hdmi_codec_drv;
+	struct snd_soc_jack sdw_headset;
+};
+
+extern unsigned long sof_sdw_quirk;
+
+/* generic HDMI support */
+int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
+
+int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card);
+
+/* DMIC support */
+int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
+
+/* RT711 support */
+int sof_sdw_rt711_init(const struct snd_soc_acpi_link_adr *link,
+		       struct snd_soc_dai_link *dai_links,
+		       struct sof_sdw_codec_info *info,
+		       bool playback);
+
+/* RT700 support */
+int sof_sdw_rt700_init(const struct snd_soc_acpi_link_adr *link,
+		       struct snd_soc_dai_link *dai_links,
+		       struct sof_sdw_codec_info *info,
+		       bool playback);
+
+/* RT1308 support */
+extern struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
+
+int sof_sdw_rt1308_init(const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback);
+
+/* RT715 support */
+int sof_sdw_rt715_init(const struct snd_soc_acpi_link_adr *link,
+		       struct snd_soc_dai_link *dai_links,
+		       struct sof_sdw_codec_info *info,
+		       bool playback);
+
+#endif
diff --git a/sound/soc/intel/boards/sof_sdw_dmic.c b/sound/soc/intel/boards/sof_sdw_dmic.c
new file mode 100644
index 000000000000..e92176bf0ad4
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_dmic.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_dmic - Helpers to handle dmic from generic machine driver
+ */
+
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof_sdw_common.h"
+
+static const struct snd_soc_dapm_widget dmic_widgets[] = {
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_route dmic_map[] = {
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
+};
+
+int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+					ARRAY_SIZE(dmic_widgets));
+	if (ret) {
+		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_map,
+				      ARRAY_SIZE(dmic_map));
+
+	if (ret)
+		dev_err(card->dev, "DMic map addition failed: %d\n", ret);
+
+	return ret;
+}
+
diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
new file mode 100644
index 000000000000..c7b5612a39e6
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_hdmi - Helpers to handle HDMI from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/jack.h>
+#include "sof_sdw_common.h"
+#include "../../codecs/hdac_hdmi.h"
+#include "hda_dsp_common.h"
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+static struct snd_soc_jack hdmi[MAX_HDMI_NUM];
+
+struct hdmi_pcm {
+	struct list_head head;
+	struct snd_soc_dai *codec_dai;
+	int device;
+};
+
+int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct hdmi_pcm *pcm;
+
+	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
+	if (!pcm)
+		return -ENOMEM;
+
+	/* dai_link id is 1:1 mapped to the PCM device */
+	pcm->device = rtd->dai_link->id;
+	pcm->codec_dai = dai;
+
+	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
+
+	return 0;
+}
+
+#define NAME_SIZE	32
+int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
+{
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct hdmi_pcm *pcm;
+	struct snd_soc_component *component = NULL;
+	int err, i = 0;
+	char jack_name[NAME_SIZE];
+
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm,
+			       head);
+	component = pcm->codec_dai->component;
+
+	if (ctx->common_hdmi_codec_drv)
+		return hda_dsp_hdmi_build_controls(card, component);
+
+	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
+		component = pcm->codec_dai->component;
+		snprintf(jack_name, sizeof(jack_name),
+			 "HDMI/DP, pcm=%d Jack", pcm->device);
+		err = snd_soc_card_jack_new(card, jack_name,
+					    SND_JACK_AVOUT, &hdmi[i],
+					    NULL, 0);
+
+		if (err)
+			return err;
+
+		err = snd_jack_add_new_kctl(hdmi[i].jack,
+					    jack_name, SND_JACK_AVOUT);
+		if (err)
+			dev_warn(component->dev, "failed creating Jack kctl\n");
+
+		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
+					  &hdmi[i]);
+		if (err < 0)
+			return err;
+
+		i++;
+	}
+
+	if (!component)
+		return -EINVAL;
+
+	return hdac_hdmi_jack_port_init(component, &card->dapm);
+}
+#else
+int hdmi_card_late_probe(struct snd_soc_card *card)
+{
+	return 0;
+}
+#endif
diff --git a/sound/soc/intel/boards/sof_sdw_rt1308.c b/sound/soc/intel/boards/sof_sdw_rt1308.c
new file mode 100644
index 000000000000..321768e54d08
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt1308.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_rt1308 - Helpers to handle RT1308 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof_sdw_common.h"
+#include "../../codecs/rt1308.h"
+
+static const struct snd_soc_dapm_widget rt1308_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+/*
+ * dapm routes for rt1308 will be registered dynamically according
+ * to the number of rt1308 used. The first two entries will be registered
+ * for one codec case, and the last two entries are also registered
+ * if two 1308s are used.
+ */
+static const struct snd_soc_dapm_route rt1308_map[] = {
+	{ "Speaker", NULL, "rt1308-1 SPOL" },
+	{ "Speaker", NULL, "rt1308-1 SPOR" },
+	{ "Speaker", NULL, "rt1308-2 SPOL" },
+	{ "Speaker", NULL, "rt1308-2 SPOR" },
+};
+
+static const struct snd_kcontrol_new rt1308_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:rt1308",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, rt1308_controls,
+					ARRAY_SIZE(rt1308_controls));
+	if (ret) {
+		dev_err(card->dev, "rt1308 controls addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt1308_widgets,
+					ARRAY_SIZE(rt1308_widgets));
+	if (ret) {
+		dev_err(card->dev, "rt1308 widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1308_map, 2);
+	if (ret)
+		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
+
+	return ret;
+}
+
+static int second_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1308_map + 2, 2);
+	if (ret)
+		dev_err(rtd->dev, "failed to add second SPK map: %d\n", ret);
+
+	return ret;
+}
+
+static int all_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+
+	ret = first_spk_init(rtd);
+	if (ret)
+		return ret;
+
+	return second_spk_init(rtd);
+}
+
+static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	int clk_id, clk_freq, pll_out;
+	int err;
+
+	clk_id = RT1308_PLL_S_MCLK;
+	clk_freq = 38400000;
+
+	pll_out = params_rate(params) * 512;
+
+	/* Set rt1308 pll */
+	err = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
+	if (err < 0) {
+		dev_err(card->dev, "Failed to set RT1308 PLL: %d\n", err);
+		return err;
+	}
+
+	/* Set rt1308 sysclk */
+	err = snd_soc_dai_set_sysclk(codec_dai, RT1308_FS_SYS_S_PLL, pll_out,
+				     SND_SOC_CLOCK_IN);
+	if (err < 0) {
+		dev_err(card->dev, "Failed to set RT1308 SYSCLK: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+/* machine stream operations */
+struct snd_soc_ops sof_sdw_rt1308_i2s_ops = {
+	.hw_params = rt1308_i2s_hw_params,
+};
+
+int sof_sdw_rt1308_init(const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback)
+{
+	info->amp_num++;
+	if (info->amp_num == 1)
+		dai_links->init = first_spk_init;
+
+	if (info->amp_num == 2) {
+		/*
+		 * if two 1308s are in one dai link, the init function
+		 * in this dai link will be first set for the first speaker,
+		 * and it should be reset to initialize all speakers when
+		 * the second speaker is found.
+		 */
+		if (dai_links->init)
+			dai_links->init = all_spk_init;
+		else
+			dai_links->init = second_spk_init;
+	}
+
+	return 0;
+}
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
new file mode 100644
index 000000000000..2ee4e6910d7f
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_rt700 - Helpers to handle RT700 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/input.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/jack.h>
+#include "sof_sdw_common.h"
+
+static const struct snd_soc_dapm_widget rt700_widgets[] = {
+	SND_SOC_DAPM_HP("Headphones", NULL),
+	SND_SOC_DAPM_MIC("AMIC", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_soc_dapm_route rt700_map[] = {
+	/* Headphones */
+	{ "Headphones", NULL, "HP" },
+	{ "Speaker", NULL, "SPK" },
+	{ "MIC2", NULL, "AMIC" },
+};
+
+static const struct snd_kcontrol_new rt700_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphones"),
+	SOC_DAPM_PIN_SWITCH("AMIC"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static struct snd_soc_jack_pin rt700_jack_pins[] = {
+	{
+		.pin    = "Headphones",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "AMIC",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
+static int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s hs:rt700",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, rt700_controls,
+					ARRAY_SIZE(rt700_controls));
+	if (ret) {
+		dev_err(card->dev, "rt700 controls addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt700_widgets,
+					ARRAY_SIZE(rt700_widgets));
+	if (ret) {
+		dev_err(card->dev, "rt700 widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt700_map,
+				      ARRAY_SIZE(rt700_map));
+
+	if (ret) {
+		dev_err(card->dev, "rt700 map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3,
+				    &ctx->sdw_headset,
+				    rt700_jack_pins,
+				    ARRAY_SIZE(rt700_jack_pins));
+	if (ret) {
+		dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
+			ret);
+		return ret;
+	}
+
+	jack = &ctx->sdw_headset;
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret)
+		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
+			ret);
+
+	return ret;
+}
+
+int sof_sdw_rt700_init(const struct snd_soc_acpi_link_adr *link,
+		       struct snd_soc_dai_link *dai_links,
+		       struct sof_sdw_codec_info *info,
+		       bool playback)
+{
+	/*
+	 * headset should be initialized once.
+	 * Do it with dai link for playback.
+	 */
+	if (!playback)
+		return 0;
+
+	dai_links->init = rt700_rtd_init;
+
+	return 0;
+}
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
new file mode 100644
index 000000000000..2a4917e3d561
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_rt711 - Helpers to handle RT711 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/input.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/jack.h>
+#include "sof_sdw_common.h"
+
+/*
+ * Note this MUST be called before snd_soc_register_card(), so that the props
+ * are in place before the codec component driver's probe function parses them.
+ */
+static int rt711_add_codec_device_props(const char *sdw_dev_name)
+{
+	struct property_entry props[MAX_NO_PROPS] = {};
+	struct device *sdw_dev;
+	int ret;
+
+	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_dev_name);
+	if (!sdw_dev)
+		return -EPROBE_DEFER;
+
+	if (SOF_RT711_JDSRC(sof_sdw_quirk)) {
+		props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
+					      SOF_RT711_JDSRC(sof_sdw_quirk));
+	}
+
+	ret = device_add_properties(sdw_dev, props);
+	put_device(sdw_dev);
+
+	return ret;
+}
+
+static const struct snd_soc_dapm_widget rt711_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route rt711_map[] = {
+	/* Headphones */
+	{ "Headphone", NULL, "rt711 HP" },
+	{ "rt711 MIC2", NULL, "Headset Mic" },
+};
+
+static const struct snd_kcontrol_new rt711_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static struct snd_soc_jack_pin rt711_jack_pins[] = {
+	{
+		.pin    = "Headphone",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
+static int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s hs:rt711",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, rt711_controls,
+					ARRAY_SIZE(rt711_controls));
+	if (ret) {
+		dev_err(card->dev, "rt711 controls addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt711_widgets,
+					ARRAY_SIZE(rt711_widgets));
+	if (ret) {
+		dev_err(card->dev, "rt711 widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt711_map,
+				      ARRAY_SIZE(rt711_map));
+
+	if (ret) {
+		dev_err(card->dev, "rt711 map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3,
+				    &ctx->sdw_headset,
+				    rt711_jack_pins,
+				    ARRAY_SIZE(rt711_jack_pins));
+	if (ret) {
+		dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
+			ret);
+		return ret;
+	}
+
+	jack = &ctx->sdw_headset;
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+
+	if (ret)
+		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
+			ret);
+
+	return ret;
+}
+
+int sof_sdw_rt711_init(const struct snd_soc_acpi_link_adr *link,
+		       struct snd_soc_dai_link *dai_links,
+		       struct sof_sdw_codec_info *info,
+		       bool playback)
+{
+	int ret;
+
+	/*
+	 * headset should be initialized once.
+	 * Do it with dai link for playback.
+	 */
+	if (!playback)
+		return 0;
+
+	ret = rt711_add_codec_device_props("sdw:0:25d:711:0");
+	if (ret < 0)
+		return ret;
+
+	dai_links->init = rt711_rtd_init;
+
+	return 0;
+}
diff --git a/sound/soc/intel/boards/sof_sdw_rt715.c b/sound/soc/intel/boards/sof_sdw_rt715.c
new file mode 100644
index 000000000000..321e1cbc03ed
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt715.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_rt715 - Helpers to handle RT715 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof_sdw_common.h"
+
+static int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:rt715",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int sof_sdw_rt715_init(const struct snd_soc_acpi_link_adr *link,
+		       struct snd_soc_dai_link *dai_links,
+		       struct sof_sdw_codec_info *info,
+		       bool playback)
+{
+	/*
+	 * DAI ID is fixed at SDW_DMIC_DAI_ID for 715 to
+	 * keep sdw DMIC and HDMI setting static in UCM
+	 */
+	if (sof_sdw_quirk & SOF_RT715_DAI_ID_FIX)
+		dai_links->id = SDW_DMIC_DAI_ID;
+
+	dai_links->init = rt715_rtd_init;
+
+	return 0;
+}
-- 
2.20.1

