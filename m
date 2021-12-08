Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1CD46D21B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:23:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B5FE26CD;
	Wed,  8 Dec 2021 12:23:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B5FE26CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962639;
	bh=iTqkzwjFkq0TAEncVXiG0WtrLGqOO+mcDdLACwRvtqU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H2aq8gkD0OQl4XV6c5xLxixd8NCOS4rcvwiBCV/cR8PTJ5m7QYjBpOBpEGrG+/HiJ
	 HeN5eP3NxTmWY4GiKSzSNYbxGTUTdFLu+VpkxqNLYmoD0dVXbSplmMA7Yd1V46cRMS
	 Sdi+gqWs2dCF+QisywcZh3Oic9EuRFaLd+fUDcX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A3FFF80615;
	Wed,  8 Dec 2021 12:12:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B60CF8060C; Wed,  8 Dec 2021 12:12:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85682F80615
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85682F80615
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548515"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548515"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600571"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:43 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 33/37] ASoC: Intel: avs: Machine board registration
Date: Wed,  8 Dec 2021 12:12:57 +0100
Message-Id: <20211208111301.1817725-34-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

AVS driver operates with granular audio card division in mind.
Super-card approach (e.g.: I2S, DMIC and HDA DAIs combined) is
deprecated in favour of individual cards - one per each device. This
provides necessary dynamism, especially for configurations with number
of codecs present and makes it easier to survive auxiliary devices
failures - one card failing to probe does not prevent others from
succeeding.

All boards spawned by AVS are unregistered on ->remove(). This includes
dummy codecs such as DMIC.

As all machine boards found in sound/soc/intel/boards are irreversibly
tied to 'super-card' approach, new boards are going to be introduced.
This temporarily increases number of boards available under /intel
directory until skylake-driver becomes deprecated and removed.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile          |   2 +-
 sound/soc/intel/avs/avs.h             |   3 +
 sound/soc/intel/avs/board_selection.c | 459 ++++++++++++++++++++++++++
 3 files changed, 463 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/board_selection.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 479b76b48433..e515ed7f18f9 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o topology.o path.o \
-		    core.o loader.o pcm.o
+		    core.o loader.o pcm.o board_selection.o
 snd-soc-avs-objs += cldma.o
 
 snd-soc-avs-objs += trace.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index dea9b93e3131..653cdecf9d83 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -288,6 +288,9 @@ int avs_ssp_platform_register(struct avs_dev *adev, const char *name,
 			      unsigned long port_mask, unsigned long *tdms);
 int avs_hda_platform_register(struct avs_dev *adev, const char *name);
 
+int avs_register_all_boards(struct avs_dev *adev);
+void avs_unregister_all_boards(struct avs_dev *adev);
+
 /* Firmware tracing helpers */
 
 unsigned int __kfifo_fromio_locked(struct kfifo *fifo, const void __iomem *src,
diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
new file mode 100644
index 000000000000..61b8894f0ad6
--- /dev/null
+++ b/sound/soc/intel/avs/board_selection.c
@@ -0,0 +1,459 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/acpi.h>
+#include <linux/debugfs.h>
+#include <linux/module.h>
+#include <linux/dmi.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <sound/hda_codec.h>
+#include <sound/hda_register.h>
+#include <sound/intel-nhlt.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-component.h>
+#include "avs.h"
+
+static bool ssp_loopback_test;
+module_param_named(ssp_loopback, ssp_loopback_test, bool, 0444);
+MODULE_PARM_DESC(ssp_loopback, "SSP loopback test 0=disabled, 1=enabled");
+
+static const struct dmi_system_id kbl_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Skylake Y LPDDR3 RVP3"),
+		},
+	},
+	{}
+};
+
+static const struct dmi_system_id kbl_r_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Kabylake R DDR4 RVP"),
+		},
+	},
+	{}
+};
+
+static struct snd_soc_acpi_mach *dmi_match_quirk(void *arg)
+{
+	struct snd_soc_acpi_mach *mach = arg;
+	const struct dmi_system_id *dmi_id;
+	struct dmi_system_id *dmi_table;
+
+	if (mach->quirk_data == NULL)
+		return mach;
+
+	dmi_table = (struct dmi_system_id *)mach->quirk_data;
+
+	dmi_id = dmi_first_match(dmi_table);
+	if (!dmi_id)
+		return NULL;
+
+	return mach;
+}
+
+#define AVS_SSP(x)		(BIT(x))
+#define AVS_SSP_RANGE(a, b)	(GENMASK(b, a))
+
+/* supported I2S board codec configurations */
+static struct snd_soc_acpi_mach avs_skl_i2s_machines[] = {
+	{
+		.id = "INT343A",
+		.drv_name = "avs_rt286",
+		.link_mask = AVS_SSP(0),
+		.tplg_filename = "skl-rt286-tplg.bin",
+	},
+	{
+		.id = "10508825",
+		.drv_name = "avs_nau8825",
+		.link_mask = AVS_SSP(1),
+		.tplg_filename = "skl-nau8825-tplg.bin",
+	},
+	{
+		.id = "INT343B",
+		.drv_name = "avs_ssm4567",
+		.link_mask = AVS_SSP(0),
+		.tplg_filename = "skl-ssm4567-tplg.bin",
+	},
+	{
+		.id = "MX98357A",
+		.drv_name = "avs_max98357a",
+		.link_mask = AVS_SSP(0),
+		.tplg_filename = "skl-max98357a-tplg.bin",
+	},
+	{},
+};
+
+static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
+	{
+		.id = "INT343A",
+		.drv_name = "avs_rt286",
+		.link_mask = AVS_SSP(0),
+		.quirk_data = &kbl_dmi_table,
+		.machine_quirk = dmi_match_quirk,
+		.tplg_filename = "kbl-rt286-tplg.bin",
+	},
+	{
+		.id = "INT343A",
+		.drv_name = "avs_rt298",
+		.link_mask = AVS_SSP(0),
+		.quirk_data = &kbl_r_dmi_table,
+		.machine_quirk = dmi_match_quirk,
+		.tplg_filename = "kblr-rt298-tplg.bin",
+	},
+	{},
+};
+
+static struct snd_soc_acpi_mach avs_apl_i2s_machines[] = {
+	{
+		.id = "INT343A",
+		.drv_name = "avs_rt298",
+		.link_mask = AVS_SSP(5),
+		.tplg_filename = "apl-rt298-tplg.bin",
+	},
+	{
+		.id = "INT34C3",
+		.drv_name = "avs_tdf8532",
+		.link_mask = AVS_SSP_RANGE(0, 5),
+		.pdata = (unsigned long[]){ 0, 0, 0x14, 0, 0, 0 }, /* SSP2 TDMs */
+		.tplg_filename = "apl-tdf8532-tplg.bin",
+	},
+	{
+		.id = "MX98357A",
+		.drv_name = "avs_max98357a",
+		.link_mask = AVS_SSP(5),
+		.tplg_filename = "apl-max98357a-tplg.bin",
+	},
+	{
+		.id = "DLGS7219",
+		.drv_name = "avs_da7219",
+		.link_mask = AVS_SSP(1),
+		.tplg_filename = "apl-da7219-tplg.bin",
+	},
+	{},
+};
+
+static struct snd_soc_acpi_mach avs_gml_i2s_machines[] = {
+	{
+		.id = "INT343A",
+		.drv_name = "avs_rt298",
+		.link_mask = AVS_SSP(2),
+		.tplg_filename = "gml-rt298-tplg.bin",
+	},
+	{},
+};
+
+static struct snd_soc_acpi_mach avs_test_i2s_machines[] = {
+	{
+		.drv_name = "avs_ssp_test",
+		.link_mask = AVS_SSP(0),
+		.tplg_filename = "avs_ssp_test.bin",
+	},
+	{
+		.drv_name = "avs_ssp_test",
+		.link_mask = AVS_SSP(1),
+		.tplg_filename = "avs_ssp_test.bin",
+	},
+	{
+		.drv_name = "avs_ssp_test",
+		.link_mask = AVS_SSP(2),
+		.tplg_filename = "avs_ssp_test.bin",
+	},
+	{
+		.drv_name = "avs_ssp_test",
+		.link_mask = AVS_SSP(3),
+		.tplg_filename = "avs_ssp_test.bin",
+	},
+	{
+		.drv_name = "avs_ssp_test",
+		.link_mask = AVS_SSP(4),
+		.tplg_filename = "avs_ssp_test.bin",
+	},
+	{
+		.drv_name = "avs_ssp_test",
+		.link_mask = AVS_SSP(5),
+		.tplg_filename = "avs_ssp_test.bin",
+	},
+	/* no NULL terminator, as we depend on ARRAY SIZE due to .id == NULL */
+};
+
+struct avs_acpi_boards {
+	int id;
+	struct snd_soc_acpi_mach *machs;
+};
+
+#define AVS_MACH_ENTRY(_id, _mach) \
+	{ .id = (_id), .machs = (_mach), }
+
+/* supported I2S boards per platform */
+static const struct avs_acpi_boards i2s_boards[] = {
+	AVS_MACH_ENTRY(0x9d70, avs_skl_i2s_machines), /* SKL */
+	AVS_MACH_ENTRY(0x9d71, avs_kbl_i2s_machines), /* KBL */
+	AVS_MACH_ENTRY(0x5a98, avs_apl_i2s_machines), /* APL */
+	AVS_MACH_ENTRY(0x3198, avs_gml_i2s_machines), /* GML */
+	{},
+};
+
+static const struct avs_acpi_boards *avs_get_i2s_boards(struct avs_dev *adev)
+{
+	int id, i;
+
+	id = adev->base.pci->device;
+	for (i = 0; i < ARRAY_SIZE(i2s_boards); i++)
+		if (i2s_boards[i].id == id)
+			return &i2s_boards[i];
+	return NULL;
+}
+
+/* platform devices owned by AVS audio are removed with this hook */
+static void board_pdev_unregister(void *data)
+{
+	platform_device_unregister(data);
+}
+
+static int avs_register_dmic_board(struct avs_dev *adev)
+{
+	struct platform_device *codec, *board;
+	struct snd_soc_acpi_mach mach = {0};
+	int ret;
+
+	if (!adev->nhlt ||
+	    !intel_nhlt_has_endpoint_type(adev->nhlt, NHLT_LINK_DMIC)) {
+		dev_dbg(adev->dev, "no DMIC endpoints present\n");
+		return 0;
+	}
+
+	codec = platform_device_register_simple("dmic-codec",
+						PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(codec)) {
+		dev_err(adev->dev, "dmic codec register failed\n");
+		return PTR_ERR(codec);
+	}
+
+	ret = devm_add_action(adev->dev, board_pdev_unregister, codec);
+	if (ret < 0) {
+		platform_device_unregister(codec);
+		return ret;
+	}
+
+	ret = avs_dmic_platform_register(adev, "dmic-platform");
+	if (ret < 0)
+		return ret;
+
+	mach.tplg_filename = "dmic-tplg.bin";
+	mach.mach_params.platform = "dmic-platform";
+
+	board = platform_device_register_data(NULL, "avs_dmic",
+					PLATFORM_DEVID_NONE,
+					(const void *)&mach, sizeof(mach));
+	if (IS_ERR(board)) {
+		dev_err(adev->dev, "dmic board register failed\n");
+		return PTR_ERR(board);
+	}
+
+	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
+	if (ret < 0) {
+		platform_device_unregister(board);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int avs_register_i2s_board(struct avs_dev *adev,
+				  struct snd_soc_acpi_mach *mach)
+{
+	struct platform_device *board;
+	int num_ssps;
+	char *name;
+	int ret;
+
+	num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
+	if (fls(mach->link_mask) > num_ssps) {
+		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
+			num_ssps, mach->drv_name, __fls(mach->link_mask));
+		return -ENODEV;
+	}
+
+	name = devm_kasprintf(adev->dev, GFP_KERNEL,
+			      "%s.%d-platform", mach->drv_name, mach->link_mask);
+	if (!name)
+		return -ENOMEM;
+
+	ret = avs_ssp_platform_register(adev, name, mach->link_mask, mach->pdata);
+	if (ret < 0)
+		return ret;
+
+	mach->mach_params.platform = name;
+
+	board = platform_device_register_data(NULL, mach->drv_name,
+					mach->link_mask,
+					(const void *)mach, sizeof(*mach));
+	if (IS_ERR(board)) {
+		dev_err(adev->dev, "ssp board register failed\n");
+		return PTR_ERR(board);
+	}
+
+	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
+	if (ret < 0) {
+		platform_device_unregister(board);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int avs_register_i2s_boards(struct avs_dev *adev)
+{
+	const struct avs_acpi_boards *boards;
+	struct snd_soc_acpi_mach *mach;
+	int ret;
+
+	if (!adev->nhlt || !intel_nhlt_has_endpoint_type(adev->nhlt, NHLT_LINK_SSP)) {
+		dev_dbg(adev->dev, "no I2S endpoints present\n");
+		return 0;
+	}
+
+	if (ssp_loopback_test) {
+		int i, num_ssps;
+
+		num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
+		/* constrain just in case FW says there can be more SSPs than possible */
+		num_ssps = min_t(int, ARRAY_SIZE(avs_test_i2s_machines),
+				 num_ssps);
+
+		mach = avs_test_i2s_machines;
+
+		for (i = 0; i < num_ssps; i++) {
+			ret = avs_register_i2s_board(adev, &mach[i]);
+			if (ret < 0)
+				dev_warn(adev->dev, "register i2s %s failed: %d\n",
+					 mach->drv_name, ret);
+		}
+		return 0;
+	}
+
+	boards = avs_get_i2s_boards(adev);
+	if (!boards) {
+		dev_dbg(adev->dev, "no I2S endpoints supported\n");
+		return 0;
+	}
+
+	for (mach = boards->machs; mach->id[0]; mach++) {
+		if (!acpi_dev_present(mach->id, NULL, -1))
+			continue;
+
+		if (mach->machine_quirk)
+			if (!mach->machine_quirk(mach))
+				continue;
+
+		ret = avs_register_i2s_board(adev, mach);
+		if (ret < 0)
+			dev_warn(adev->dev, "register i2s %s failed: %d\n",
+				 mach->drv_name, ret);
+	}
+
+	return 0;
+}
+
+static int avs_register_hda_board(struct avs_dev *adev, struct hda_codec *codec)
+{
+	struct snd_soc_acpi_mach mach = {0};
+	struct platform_device *board;
+	struct hdac_device *hdev = &codec->core;
+	char *pname;
+	int ret, id;
+
+	pname = devm_kasprintf(adev->dev, GFP_KERNEL, "%s-platform",
+			       dev_name(&hdev->dev));
+	if (!pname)
+		return -ENOMEM;
+
+	ret = avs_hda_platform_register(adev, pname);
+	if (ret < 0)
+		return ret;
+
+	mach.pdata = codec;
+	mach.mach_params.platform = pname;
+	mach.tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
+					  "hda-%08x-tplg.bin", hdev->vendor_id);
+	if (!mach.tplg_filename)
+		return -ENOMEM;
+
+	id = adev->base.core.idx * HDA_MAX_CODECS + hdev->addr;
+	board = platform_device_register_data(NULL, "avs_hdaudio", id,
+					(const void *)&mach, sizeof(mach));
+	if (IS_ERR(board)) {
+		dev_err(adev->dev, "hda board register failed\n");
+		return PTR_ERR(board);
+	}
+
+	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
+	if (ret < 0) {
+		platform_device_unregister(board);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int avs_register_hda_boards(struct avs_dev *adev)
+{
+	struct hdac_bus *bus = &adev->base.core;
+	struct hdac_device *hdev;
+	int ret;
+
+	if (!bus->num_codecs) {
+		dev_dbg(adev->dev, "no HDA endpoints present\n");
+		return 0;
+	}
+
+	list_for_each_entry(hdev, &bus->codec_list, list) {
+		struct hda_codec *codec;
+
+		codec = dev_to_hda_codec(&hdev->dev);
+
+		ret = avs_register_hda_board(adev, codec);
+		if (ret < 0)
+			dev_warn(adev->dev, "register hda-%08x failed: %d\n",
+				 codec->core.vendor_id, ret);
+	}
+
+	return 0;
+}
+
+int avs_register_all_boards(struct avs_dev *adev)
+{
+	int ret;
+
+	ret = avs_register_dmic_board(adev);
+	if (ret < 0)
+		dev_warn(adev->dev, "enumerate DMIC endpoints failed: %d\n",
+			 ret);
+
+	ret = avs_register_i2s_boards(adev);
+	if (ret < 0)
+		dev_warn(adev->dev, "enumerate I2S endpoints failed: %d\n",
+			 ret);
+
+	ret = avs_register_hda_boards(adev);
+	if (ret < 0)
+		dev_warn(adev->dev, "enumerate HDA endpoints failed: %d\n",
+			 ret);
+
+	return 0;
+}
+
+void avs_unregister_all_boards(struct avs_dev *adev)
+{
+	snd_soc_unregister_component(adev->dev);
+}
-- 
2.25.1

