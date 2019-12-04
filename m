Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750B113701
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:22:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E16851668;
	Wed,  4 Dec 2019 22:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E16851668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575494561;
	bh=Qugg2kM/DYhzdTryms9cJIlwUQbu0w8oE2zhu8tzvyI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qbFQnRzSbOeXQNlSa+TODsfOMk2PYp5RBx+fTSysWgWYTtkVkCb+CeyzV8jTV+k98
	 A9Un5cwYg/41uh/3Vz8Hjqf4Mcou8UpOqQ5aGGMvupINvqpwQxDG60oIKOKur9wHe9
	 zqxhhNMtPzJ/hn+sJBInSczkfCRKbpCh3E3vh/6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E50F80279;
	Wed,  4 Dec 2019 22:16:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BE44F80248; Wed,  4 Dec 2019 22:16:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FE65F80217
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE65F80217
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="223378648"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by orsmga002.jf.intel.com with ESMTP; 04 Dec 2019 13:16:22 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:15:53 -0600
Message-Id: <20191204211556.12671-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
References: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 10/13] ASoC: SOF: Make creation of machine
	device from SOF core optional
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

Currently, SOF probes machine drivers by creating a platform device
and passing the machine description as private data.

This is driven by the ACPI restrictions. Ideally, ACPI tables
should contain the description for the machine driver. This is
not possible because ACPI tables are frozen and used on multiple
OS-es (e.g Windows).

In the case of Device Tree we don't have this restriction, so we
choose to probe the machine drivers by creating a DT node as is
the standard ALSA way.

This patch makes the probing of machine drivers from SOF
core optional allowing for Device Tree platforms to decouple
the SOF core from machine driver probing.

Along with this, it also consolidates the machine driver selection
for Intel platforms by defining optional ops for selecting the machine
driver based on the ACPI match for HDA and non-HDA platforms and
setting the mach params.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c         |  59 +--------
 sound/soc/sof/intel/apl.c    |   7 ++
 sound/soc/sof/intel/bdw.c    |  33 +++++
 sound/soc/sof/intel/byt.c    |  45 +++++++
 sound/soc/sof/intel/cnl.c    |   7 ++
 sound/soc/sof/intel/hda.c    | 227 ++++++++++++++++++++---------------
 sound/soc/sof/intel/hda.h    |   5 +
 sound/soc/sof/nocodec.c      |   1 -
 sound/soc/sof/ops.h          |  34 ++++++
 sound/soc/sof/sof-acpi-dev.c |  29 +----
 sound/soc/sof/sof-audio.c    |  80 ++++++++++++
 sound/soc/sof/sof-audio.h    |   4 +
 sound/soc/sof/sof-of-dev.c   |  22 +---
 sound/soc/sof/sof-pci-dev.c  |  28 +----
 sound/soc/sof/sof-priv.h     |  11 ++
 15 files changed, 361 insertions(+), 231 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 9832322adbec..e258f6a8e7a5 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -92,47 +92,9 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 }
 EXPORT_SYMBOL(snd_sof_get_status);
 
-/*
- * SOF Driver enumeration.
- */
-static int sof_machine_check(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_pdata *plat_data = sdev->pdata;
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
-	struct snd_soc_acpi_mach *machine;
-	int ret;
-#endif
-
-	if (plat_data->machine)
-		return 0;
-
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
-	dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
-	return -ENODEV;
-#else
-	/* fallback to nocodec mode */
-	dev_warn(sdev->dev, "No ASoC machine driver found - using nocodec\n");
-	machine = devm_kzalloc(sdev->dev, sizeof(*machine), GFP_KERNEL);
-	if (!machine)
-		return -ENOMEM;
-
-	ret = sof_nocodec_setup(sdev->dev, plat_data, machine,
-				plat_data->desc, plat_data->desc->ops);
-	if (ret < 0)
-		return ret;
-
-	plat_data->machine = machine;
-
-	return 0;
-#endif
-}
-
 static int sof_probe_continue(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
-	const char *drv_name;
-	const void *mach;
-	int size;
 	int ret;
 
 	/* probe the DSP hardware */
@@ -218,22 +180,9 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto fw_run_err;
 	}
 
-	drv_name = plat_data->machine->drv_name;
-	mach = (const void *)plat_data->machine;
-	size = sizeof(*plat_data->machine);
-
-	/* register machine driver, pass machine info as pdata */
-	plat_data->pdev_mach =
-		platform_device_register_data(sdev->dev, drv_name,
-					      PLATFORM_DEVID_NONE, mach, size);
-
-	if (IS_ERR(plat_data->pdev_mach)) {
-		ret = PTR_ERR(plat_data->pdev_mach);
+	ret = snd_sof_machine_register(sdev, plat_data);
+	if (ret < 0)
 		goto fw_run_err;
-	}
-
-	dev_dbg(sdev->dev, "created machine %s\n",
-		dev_name(&plat_data->pdev_mach->dev));
 
 	/*
 	 * Some platforms in SOF, ex: BYT, may not have their platform PM
@@ -363,9 +312,7 @@ int snd_sof_device_remove(struct device *dev)
 	 * will remove the component driver and unload the topology
 	 * before freeing the snd_card.
 	 */
-	if (!IS_ERR_OR_NULL(pdata->pdev_mach))
-		platform_device_unregister(pdata->pdev_mach);
-
+	snd_sof_machine_unregister(sdev, pdata);
 	/*
 	 * Unregistering the machine driver results in unloading the topology.
 	 * Some widgets, ex: scheduler, attempt to power down the core they are
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 7daa8eb456c8..9e4d859b4dba 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -17,6 +17,7 @@
 
 #include "../sof-priv.h"
 #include "hda.h"
+#include "../sof-audio.h"
 
 static const struct snd_sof_debugfs_map apl_dsp_debugfs[] = {
 	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
@@ -53,6 +54,12 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.ipc_msg_data	= hda_ipc_msg_data,
 	.ipc_pcm_params	= hda_ipc_pcm_params,
 
+	/* machine driver */
+	.machine_select = hda_machine_select,
+	.machine_register = sof_machine_register,
+	.machine_unregister = sof_machine_unregister,
+	.set_mach_params = hda_set_mach_params,
+
 	/* debug */
 	.debug_map	= apl_dsp_debugfs,
 	.debug_map_count	= ARRAY_SIZE(apl_dsp_debugfs),
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 141dad554764..c09885c0eb7d 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -17,6 +17,7 @@
 #include <sound/sof/xtensa.h>
 #include "../ops.h"
 #include "shim.h"
+#include "../sof-audio.h"
 
 /* BARs */
 #define BDW_DSP_BAR 0
@@ -536,6 +537,32 @@ static int bdw_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+static void bdw_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_soc_acpi_mach *mach;
+
+	mach = snd_soc_acpi_find_machine(desc->machines);
+	if (!mach) {
+		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
+		return;
+	}
+
+	sof_pdata->tplg_filename = mach->sof_tplg_filename;
+	mach->mach_params.acpi_ipc_irq_index = desc->irqindex_host_ipc;
+	sof_pdata->machine = mach;
+}
+
+static void bdw_set_mach_params(const struct snd_soc_acpi_mach *mach,
+				struct device *dev)
+{
+	struct snd_soc_acpi_mach_params *mach_params;
+
+	mach_params = (struct snd_soc_acpi_mach_params *)&mach->mach_params;
+	mach_params->platform = dev_name(dev);
+}
+
 /* Broadwell DAIs */
 static struct snd_soc_dai_driver bdw_dai[] = {
 {
@@ -574,6 +601,12 @@ const struct snd_sof_dsp_ops sof_bdw_ops = {
 	.ipc_msg_data	= intel_ipc_msg_data,
 	.ipc_pcm_params	= intel_ipc_pcm_params,
 
+	/* machine driver */
+	.machine_select = bdw_machine_select,
+	.machine_register = sof_machine_register,
+	.machine_unregister = sof_machine_unregister,
+	.set_mach_params = bdw_set_mach_params,
+
 	/* debug */
 	.debug_map  = bdw_debugfs,
 	.debug_map_count    = ARRAY_SIZE(bdw_debugfs),
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index b9061b79a57b..b3a40d9ef7ce 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -17,6 +17,7 @@
 #include <sound/sof/xtensa.h>
 #include "../ops.h"
 #include "shim.h"
+#include "../sof-audio.h"
 
 /* DSP memories */
 #define IRAM_OFFSET		0x0C0000
@@ -382,6 +383,32 @@ static int byt_reset(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static void byt_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_soc_acpi_mach *mach;
+
+	mach = snd_soc_acpi_find_machine(desc->machines);
+	if (!mach) {
+		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
+		return;
+	}
+
+	sof_pdata->tplg_filename = mach->sof_tplg_filename;
+	mach->mach_params.acpi_ipc_irq_index = desc->irqindex_host_ipc;
+	sof_pdata->machine = mach;
+}
+
+static void byt_set_mach_params(const struct snd_soc_acpi_mach *mach,
+				struct device *dev)
+{
+	struct snd_soc_acpi_mach_params *mach_params;
+
+	mach_params = (struct snd_soc_acpi_mach_params *)&mach->mach_params;
+	mach_params->platform = dev_name(dev);
+}
+
 /* Baytrail DAIs */
 static struct snd_soc_dai_driver byt_dai[] = {
 {
@@ -514,6 +541,12 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 	.ipc_msg_data	= intel_ipc_msg_data,
 	.ipc_pcm_params	= intel_ipc_pcm_params,
 
+	/* machine driver */
+	.machine_select = byt_machine_select,
+	.machine_register = sof_machine_register,
+	.machine_unregister = sof_machine_unregister,
+	.set_mach_params = byt_set_mach_params,
+
 	/* debug */
 	.debug_map	= byt_debugfs,
 	.debug_map_count	= ARRAY_SIZE(byt_debugfs),
@@ -682,6 +715,12 @@ const struct snd_sof_dsp_ops sof_byt_ops = {
 	.ipc_msg_data	= intel_ipc_msg_data,
 	.ipc_pcm_params	= intel_ipc_pcm_params,
 
+	/* machine driver */
+	.machine_select = byt_machine_select,
+	.machine_register = sof_machine_register,
+	.machine_unregister = sof_machine_unregister,
+	.set_mach_params = byt_set_mach_params,
+
 	/* debug */
 	.debug_map	= byt_debugfs,
 	.debug_map_count	= ARRAY_SIZE(byt_debugfs),
@@ -748,6 +787,12 @@ const struct snd_sof_dsp_ops sof_cht_ops = {
 	.ipc_msg_data	= intel_ipc_msg_data,
 	.ipc_pcm_params	= intel_ipc_pcm_params,
 
+	/* machine driver */
+	.machine_select = byt_machine_select,
+	.machine_register = sof_machine_register,
+	.machine_unregister = sof_machine_unregister,
+	.set_mach_params = byt_set_mach_params,
+
 	/* debug */
 	.debug_map	= cht_debugfs,
 	.debug_map_count	= ARRAY_SIZE(cht_debugfs),
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 0e1e265f3f3b..3541063ba84c 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -18,6 +18,7 @@
 #include "../ops.h"
 #include "hda.h"
 #include "hda-ipc.h"
+#include "../sof-audio.h"
 
 static const struct snd_sof_debugfs_map cnl_dsp_debugfs[] = {
 	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
@@ -243,6 +244,12 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.ipc_msg_data	= hda_ipc_msg_data,
 	.ipc_pcm_params	= hda_ipc_pcm_params,
 
+	/* machine driver */
+	.machine_select = hda_machine_select,
+	.machine_register = sof_machine_register,
+	.machine_unregister = sof_machine_unregister,
+	.set_mach_params = hda_set_mach_params,
+
 	/* debug */
 	.debug_map	= cnl_dsp_debugfs,
 	.debug_map_count	= ARRAY_SIZE(cnl_dsp_debugfs),
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 955b06c2e296..84279f43576c 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -344,16 +344,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	struct hdac_ext_link *hlink;
-	struct snd_soc_acpi_mach_params *mach_params;
-	struct snd_soc_acpi_mach *hda_mach;
-	struct snd_sof_pdata *pdata = sdev->pdata;
-	struct snd_soc_acpi_mach *mach;
-	const char *tplg_filename;
-	const char *idisp_str;
-	const char *dmic_str;
-	int dmic_num = 0;
-	int codec_num = 0;
-	int i;
 #endif
 	int ret = 0;
 
@@ -387,94 +377,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
-	/* codec detection */
-	if (!bus->codec_mask) {
-		dev_info(bus->dev, "no hda codecs found!\n");
-	} else {
-		dev_info(bus->dev, "hda codecs found, mask %lx\n",
-			 bus->codec_mask);
-
-		for (i = 0; i < HDA_MAX_CODECS; i++) {
-			if (bus->codec_mask & (1 << i))
-				codec_num++;
-		}
-
-		/*
-		 * If no machine driver is found, then:
-		 *
-		 * hda machine driver is used if :
-		 * 1. there is one HDMI codec and one external HDAudio codec
-		 * 2. only HDMI codec
-		 */
-		if (!pdata->machine && codec_num <= 2 &&
-		    HDA_IDISP_CODEC(bus->codec_mask)) {
-			hda_mach = snd_soc_acpi_intel_hda_machines;
-			pdata->machine = hda_mach;
-
-			/* topology: use the info from hda_machines */
-			pdata->tplg_filename =
-				hda_mach->sof_tplg_filename;
-
-			/*
-			 * firmware: pick the first in machine list,
-			 * or use nocodec firmware name if list is empty
-			 */
-			mach = pdata->desc->machines;
-			if (mach->id[0])
-				pdata->fw_filename = mach->sof_fw_filename;
-			else
-				pdata->fw_filename =
-					pdata->desc->nocodec_fw_filename;
-
-			dev_info(bus->dev, "using HDA machine driver %s now\n",
-				 hda_mach->drv_name);
-
-			if (codec_num == 1)
-				idisp_str = "-idisp";
-			else
-				idisp_str = "";
-
-			/* first check NHLT for DMICs */
-			dmic_num = check_nhlt_dmic(sdev);
-
-			/* allow for module parameter override */
-			if (hda_dmic_num != -1)
-				dmic_num = hda_dmic_num;
-
-			switch (dmic_num) {
-			case 2:
-				dmic_str = "-2ch";
-				break;
-			case 4:
-				dmic_str = "-4ch";
-				break;
-			default:
-				dmic_num = 0;
-				dmic_str = "";
-				break;
-			}
-
-			tplg_filename = pdata->tplg_filename;
-			tplg_filename = fixup_tplg_name(sdev, tplg_filename,
-							idisp_str, dmic_str);
-			if (!tplg_filename) {
-				hda_codec_i915_exit(sdev);
-				return ret;
-			}
-			pdata->tplg_filename = tplg_filename;
-		}
-	}
-
-	/* used by hda machine driver to create dai links */
-	if (pdata->machine) {
-		mach_params = (struct snd_soc_acpi_mach_params *)
-			&pdata->machine->mach_params;
-		mach_params->codec_mask = bus->codec_mask;
-		mach_params->platform = dev_name(sdev->dev);
-		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
-		mach_params->dmic_num = dmic_num;
-	}
-
 	/* create codec instances */
 	hda_codec_probe_bus(sdev, hda_codec_use_common_hdmi);
 
@@ -736,4 +638,133 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+static int hda_generic_machine_select(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct snd_soc_acpi_mach_params *mach_params;
+	struct snd_soc_acpi_mach *hda_mach;
+	struct snd_sof_pdata *pdata = sdev->pdata;
+	const char *tplg_filename;
+	const char *idisp_str;
+	const char *dmic_str;
+	int dmic_num = 0;
+	int codec_num = 0;
+	int i;
+
+	/* codec detection */
+	if (!bus->codec_mask) {
+		dev_info(bus->dev, "no hda codecs found!\n");
+	} else {
+		dev_info(bus->dev, "hda codecs found, mask %lx\n",
+			 bus->codec_mask);
+
+		for (i = 0; i < HDA_MAX_CODECS; i++) {
+			if (bus->codec_mask & (1 << i))
+				codec_num++;
+		}
+
+		/*
+		 * If no machine driver is found, then:
+		 *
+		 * hda machine driver is used if :
+		 * 1. there is one HDMI codec and one external HDAudio codec
+		 * 2. only HDMI codec
+		 */
+		if (!pdata->machine && codec_num <= 2 &&
+		    HDA_IDISP_CODEC(bus->codec_mask)) {
+			hda_mach = snd_soc_acpi_intel_hda_machines;
+
+			/* topology: use the info from hda_machines */
+			pdata->tplg_filename =
+				hda_mach->sof_tplg_filename;
+
+			dev_info(bus->dev, "using HDA machine driver %s now\n",
+				 hda_mach->drv_name);
+
+			if (codec_num == 1)
+				idisp_str = "-idisp";
+			else
+				idisp_str = "";
+
+			/* first check NHLT for DMICs */
+			dmic_num = check_nhlt_dmic(sdev);
+
+			/* allow for module parameter override */
+			if (hda_dmic_num != -1)
+				dmic_num = hda_dmic_num;
+
+			switch (dmic_num) {
+			case 2:
+				dmic_str = "-2ch";
+				break;
+			case 4:
+				dmic_str = "-4ch";
+				break;
+			default:
+				dmic_num = 0;
+				dmic_str = "";
+				break;
+			}
+
+			tplg_filename = pdata->tplg_filename;
+			tplg_filename = fixup_tplg_name(sdev, tplg_filename,
+							idisp_str, dmic_str);
+			if (!tplg_filename)
+				return -EINVAL;
+
+			pdata->machine = hda_mach;
+			pdata->tplg_filename = tplg_filename;
+		}
+	}
+
+	/* used by hda machine driver to create dai links */
+	if (pdata->machine) {
+		mach_params = (struct snd_soc_acpi_mach_params *)
+			&pdata->machine->mach_params;
+		mach_params->codec_mask = bus->codec_mask;
+		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
+		mach_params->dmic_num = dmic_num;
+	}
+
+	return 0;
+}
+#else
+static int hda_generic_machine_select(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+#endif
+
+void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
+			 struct device *dev)
+{
+	struct snd_soc_acpi_mach_params *mach_params;
+
+	mach_params = (struct snd_soc_acpi_mach_params *)&mach->mach_params;
+	mach_params->platform = dev_name(dev);
+}
+
+void hda_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_soc_acpi_mach *mach;
+
+	mach = snd_soc_acpi_find_machine(desc->machines);
+	if (mach) {
+		sof_pdata->tplg_filename = mach->sof_tplg_filename;
+		sof_pdata->machine = mach;
+	}
+
+	/*
+	 * Choose HDA generic machine driver if mach is NULL.
+	 * Otherwise, set certain mach params.
+	 */
+	hda_generic_machine_select(sdev);
+
+	if (!sof_pdata->machine)
+		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
+}
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index b7164a26984b..97c3fcb23d15 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -623,4 +623,9 @@ extern const struct sof_intel_dsp_desc tgl_chip_info;
 extern const struct sof_intel_dsp_desc ehl_chip_info;
 extern const struct sof_intel_dsp_desc jsl_chip_info;
 
+/* machine driver select */
+void hda_machine_select(struct snd_sof_dev *sdev);
+void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
+			 struct device *dev);
+
 #endif
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 3d128e5a132c..0a2167f19f25 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -77,7 +77,6 @@ int sof_nocodec_setup(struct device *dev,
 	sof_pdata->drv_name = "sof-nocodec";
 
 	mach->drv_name = "sof-nocodec";
-	sof_pdata->fw_filename = desc->nocodec_fw_filename;
 	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
 
 	/* create dummy BE dai_links */
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 93512dcbaacd..e929a6e0058f 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -391,6 +391,40 @@ snd_sof_pcm_platform_pointer(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+/* machine driver */
+static inline int
+snd_sof_machine_register(struct snd_sof_dev *sdev, void *pdata)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->machine_register)
+		return sof_ops(sdev)->machine_register(sdev, pdata);
+
+	return 0;
+}
+
+static inline void
+snd_sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->machine_unregister)
+		sof_ops(sdev)->machine_unregister(sdev, pdata);
+}
+
+static inline void
+snd_sof_machine_select(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->machine_select)
+		sof_ops(sdev)->machine_select(sdev);
+}
+
+static inline void
+snd_sof_set_mach_params(const struct snd_soc_acpi_mach *mach,
+			struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+
+	if (sof_ops(sdev) && sof_ops(sdev)->set_mach_params)
+		sof_ops(sdev)->set_mach_params(mach, dev);
+}
+
 static inline const struct snd_sof_dsp_ops
 *sof_get_ops(const struct sof_dev_desc *d,
 	     const struct sof_ops_table mach_ops[], int asize)
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 22e13ef09811..8174b9a7da95 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -145,7 +145,6 @@ static int sof_acpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct sof_dev_desc *desc;
-	struct snd_soc_acpi_mach *mach;
 	struct snd_sof_pdata *sof_pdata;
 	const struct snd_sof_dsp_ops *ops;
 	int ret;
@@ -172,35 +171,9 @@ static int sof_acpi_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
-	/* force nocodec mode */
-	dev_warn(dev, "Force to use nocodec mode\n");
-	mach = devm_kzalloc(dev, sizeof(*mach), GFP_KERNEL);
-	if (!mach)
-		return -ENOMEM;
-	ret = sof_nocodec_setup(dev, sof_pdata, mach, desc, ops);
-	if (ret < 0)
-		return ret;
-#else
-	/* find machine */
-	mach = snd_soc_acpi_find_machine(desc->machines);
-	if (!mach) {
-		dev_warn(dev, "warning: No matching ASoC machine driver found\n");
-	} else {
-		sof_pdata->fw_filename = mach->sof_fw_filename;
-		sof_pdata->tplg_filename = mach->sof_tplg_filename;
-	}
-#endif
-
-	if (mach) {
-		mach->mach_params.platform = dev_name(dev);
-		mach->mach_params.acpi_ipc_irq_index = desc->irqindex_host_ipc;
-	}
-
-	sof_pdata->machine = mach;
 	sof_pdata->desc = desc;
 	sof_pdata->dev = &pdev->dev;
-	sof_pdata->platform = dev_name(dev);
+	sof_pdata->fw_filename = desc->default_fw_filename;
 
 	/* alternate fw and tplg filenames ? */
 	if (fw_path)
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index bf99d040c9c1..9c3851bfe788 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -360,3 +360,83 @@ struct snd_sof_dai *snd_sof_find_dai(struct snd_soc_component *scomp,
 	return NULL;
 }
 
+/*
+ * SOF Driver enumeration.
+ */
+int sof_machine_check(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_soc_acpi_mach *mach;
+	int ret;
+
+	/* force nocodec mode */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
+		dev_warn(sdev->dev, "Force to use nocodec mode\n");
+		goto nocodec;
+#endif
+
+	/* find machine */
+	snd_sof_machine_select(sdev);
+	if (sof_pdata->machine) {
+		snd_sof_set_mach_params(sof_pdata->machine, sdev->dev);
+		return 0;
+	}
+
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
+	dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
+	return -ENODEV;
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
+nocodec:
+#endif
+	/* select nocodec mode */
+	dev_warn(sdev->dev, "Using nocodec machine driver\n");
+	mach = devm_kzalloc(sdev->dev, sizeof(*mach), GFP_KERNEL);
+	if (!mach)
+		return -ENOMEM;
+
+	ret = sof_nocodec_setup(sdev->dev, sof_pdata, mach, desc, desc->ops);
+	if (ret < 0)
+		return ret;
+
+	sof_pdata->machine = mach;
+	snd_sof_set_mach_params(sof_pdata->machine, sdev->dev);
+
+	return 0;
+}
+EXPORT_SYMBOL(sof_machine_check);
+
+int sof_machine_register(struct snd_sof_dev *sdev, void *pdata)
+{
+	struct snd_sof_pdata *plat_data = (struct snd_sof_pdata *)pdata;
+	const char *drv_name;
+	const void *mach;
+	int size;
+
+	drv_name = plat_data->machine->drv_name;
+	mach = (const void *)plat_data->machine;
+	size = sizeof(*plat_data->machine);
+
+	/* register machine driver, pass machine info as pdata */
+	plat_data->pdev_mach =
+		platform_device_register_data(sdev->dev, drv_name,
+					      PLATFORM_DEVID_NONE, mach, size);
+	if (IS_ERR(plat_data->pdev_mach))
+		return PTR_ERR(plat_data->pdev_mach);
+
+	dev_dbg(sdev->dev, "created machine %s\n",
+		dev_name(&plat_data->pdev_mach->dev));
+
+	return 0;
+}
+EXPORT_SYMBOL(sof_machine_register);
+
+void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata)
+{
+	struct snd_sof_pdata *plat_data = (struct snd_sof_pdata *)pdata;
+
+	if (!IS_ERR_OR_NULL(plat_data->pdev_mach))
+		platform_device_unregister(plat_data->pdev_mach);
+}
+EXPORT_SYMBOL(sof_machine_unregister);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 5703698633af..a62fb2da6a6e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -204,4 +204,8 @@ int sof_restore_pipelines(struct device *dev);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_dsp_d0i3_on_suspend(struct snd_sof_dev *sdev);
 
+/* Machine driver enumeration */
+int sof_machine_register(struct snd_sof_dev *sdev, void *pdata);
+void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata);
+
 #endif
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 81deb5582d77..170a5839150f 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -44,8 +44,6 @@ static int sof_of_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct sof_dev_desc *desc;
-	/*TODO: create a generic snd_soc_xxx_mach */
-	struct snd_soc_acpi_mach *mach;
 	struct snd_sof_pdata *sof_pdata;
 	const struct snd_sof_dsp_ops *ops;
 	int ret;
@@ -67,27 +65,9 @@ static int sof_of_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
-	/* force nocodec mode */
-	dev_warn(dev, "Force to use nocodec mode\n");
-	mach = devm_kzalloc(dev, sizeof(*mach), GFP_KERNEL);
-	if (!mach)
-		return -ENOMEM;
-	ret = sof_nocodec_setup(dev, sof_pdata, mach, desc, ops);
-	if (ret < 0)
-		return ret;
-#else
-	/* TODO: implement case where we actually have a codec */
-	return -ENODEV;
-#endif
-
-	if (mach)
-		mach->mach_params.platform = dev_name(dev);
-
-	sof_pdata->machine = mach;
 	sof_pdata->desc = desc;
 	sof_pdata->dev = &pdev->dev;
-	sof_pdata->platform = dev_name(dev);
+	sof_pdata->fw_filename = desc->default_fw_filename;
 
 	/* TODO: read alternate fw and tplg filenames from DT */
 	sof_pdata->fw_filename_prefix = sof_pdata->desc->default_fw_path;
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 046bd57657ca..1c7b87392708 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -275,7 +275,6 @@ static int sof_pci_probe(struct pci_dev *pci,
 	struct device *dev = &pci->dev;
 	const struct sof_dev_desc *desc =
 		(const struct sof_dev_desc *)pci_id->driver_data;
-	struct snd_soc_acpi_mach *mach;
 	struct snd_sof_pdata *sof_pdata;
 	const struct snd_sof_dsp_ops *ops;
 	int ret;
@@ -306,35 +305,10 @@ static int sof_pci_probe(struct pci_dev *pci,
 	if (ret < 0)
 		return ret;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
-	/* force nocodec mode */
-	dev_warn(dev, "Force to use nocodec mode\n");
-	mach = devm_kzalloc(dev, sizeof(*mach), GFP_KERNEL);
-	if (!mach) {
-		ret = -ENOMEM;
-		goto release_regions;
-	}
-	ret = sof_nocodec_setup(dev, sof_pdata, mach, desc, ops);
-	if (ret < 0)
-		goto release_regions;
-
-#else
-	/* find machine */
-	mach = snd_soc_acpi_find_machine(desc->machines);
-	if (!mach) {
-		dev_warn(dev, "warning: No matching ASoC machine driver found\n");
-	} else {
-		mach->mach_params.platform = dev_name(dev);
-		sof_pdata->fw_filename = mach->sof_fw_filename;
-		sof_pdata->tplg_filename = mach->sof_tplg_filename;
-	}
-#endif /* CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE */
-
 	sof_pdata->name = pci_name(pci);
-	sof_pdata->machine = mach;
 	sof_pdata->desc = (struct sof_dev_desc *)pci_id->driver_data;
 	sof_pdata->dev = dev;
-	sof_pdata->platform = dev_name(dev);
+	sof_pdata->fw_filename = desc->default_fw_filename;
 
 	/* alternate fw and tplg filenames ? */
 	if (fw_path)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index eae1fc209a65..54dd6d4b4c12 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -202,6 +202,15 @@ struct snd_sof_dsp_ops {
 	int (*get_window_offset)(struct snd_sof_dev *sdev,
 				 u32 id);/* mandatory for common loader code */
 
+	/* machine driver ops */
+	int (*machine_register)(struct snd_sof_dev *sdev,
+				void *pdata); /* optional */
+	void (*machine_unregister)(struct snd_sof_dev *sdev,
+				   void *pdata); /* optional */
+	void (*machine_select)(struct snd_sof_dev *sdev); /* optional */
+	void (*set_mach_params)(const struct snd_soc_acpi_mach *mach,
+				struct device *dev); /* optional */
+
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
 	int num_drv;
@@ -511,4 +520,6 @@ int intel_pcm_open(struct snd_sof_dev *sdev,
 int intel_pcm_close(struct snd_sof_dev *sdev,
 		    struct snd_pcm_substream *substream);
 
+int sof_machine_check(struct snd_sof_dev *sdev);
+
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
