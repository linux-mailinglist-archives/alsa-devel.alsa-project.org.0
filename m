Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57D478080
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:26:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F5E427EE;
	Fri, 17 Dec 2021 00:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F5E427EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639697190;
	bh=RLQVci8mF9vA5BEyHlwaoxnmlfrbZfgdVoLB1Ni1Gh8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IZytGe+iPN3PlspGRjIouiwGP0ZkgEJwaNb6YFbe10EZZ1imkGKNcs9EaS860GEs0
	 Es85Y1uR2F5ZQhzedBZDAIJ1dbygpNsoSJ5kLFn+s5HQzVVw1vu6NSFfHox904BFXs
	 KumF1dLvKGuFFLdksLwBqogfIvC6a38uclQ1npRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F93FF8047B;
	Fri, 17 Dec 2021 00:24:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63183F800B0; Fri, 17 Dec 2021 00:24:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F68FF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:24:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F68FF800B0
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239439656"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="239439656"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:24:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="605702534"
Received: from priyosmi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.100.174])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:24:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: SOF: avoid casting "const" attribute away
Date: Thu, 16 Dec 2021 17:24:20 -0600
Message-Id: <20211216232422.345164-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216232422.345164-1-pierre-louis.bossart@linux.intel.com>
References: <20211216232422.345164-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Casting "const" attribute away is dangerous, obtain a writable
pointer instead to avoid that.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/renoir.c |  7 +++--
 sound/soc/sof/intel/atom.c | 13 +++++----
 sound/soc/sof/intel/atom.h |  4 +--
 sound/soc/sof/intel/bdw.c  | 11 +++----
 sound/soc/sof/intel/hda.c  | 60 ++++++++++++++++++--------------------
 sound/soc/sof/intel/hda.h  |  4 +--
 sound/soc/sof/ops.h        |  8 +++--
 sound/soc/sof/sof-audio.c  |  9 +++---
 sound/soc/sof/sof-priv.h   |  4 +--
 9 files changed, 62 insertions(+), 58 deletions(-)

diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 43037109e130..c3ecb9e9d5ba 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -104,7 +104,7 @@ static struct snd_soc_dai_driver renoir_sof_dai[] = {
 	},
 };
 
-static void amd_sof_machine_select(struct snd_sof_dev *sdev)
+static struct snd_soc_acpi_mach *amd_sof_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
@@ -113,12 +113,13 @@ static void amd_sof_machine_select(struct snd_sof_dev *sdev)
 	mach = snd_soc_acpi_find_machine(desc->machines);
 	if (!mach) {
 		dev_warn(sdev->dev, "No matching ASoC machine driver found\n");
-		return;
+		return NULL;
 	}
 
 	sof_pdata->tplg_filename = mach->sof_tplg_filename;
 	sof_pdata->fw_filename = mach->fw_filename;
-	sof_pdata->machine = mach;
+
+	return mach;
 }
 
 /* AMD Renoir DSP ops */
diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
index cdc96a7df493..5aa064b28fca 100644
--- a/sound/soc/sof/intel/atom.c
+++ b/sound/soc/sof/intel/atom.c
@@ -293,7 +293,7 @@ static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 	return tplg_filename;
 }
 
-void atom_machine_select(struct snd_sof_dev *sdev)
+struct snd_soc_acpi_mach *atom_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
@@ -304,7 +304,7 @@ void atom_machine_select(struct snd_sof_dev *sdev)
 	mach = snd_soc_acpi_find_machine(desc->machines);
 	if (!mach) {
 		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
-		return;
+		return NULL;
 	}
 
 	pdev = to_platform_device(sdev->dev);
@@ -322,12 +322,13 @@ void atom_machine_select(struct snd_sof_dev *sdev)
 	if (!tplg_filename) {
 		dev_dbg(sdev->dev,
 			"error: no topology filename\n");
-		return;
+		return NULL;
 	}
 
 	sof_pdata->tplg_filename = tplg_filename;
 	mach->mach_params.acpi_ipc_irq_index = desc->irqindex_host_ipc;
-	sof_pdata->machine = mach;
+
+	return mach;
 }
 EXPORT_SYMBOL_NS(atom_machine_select, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
 
@@ -402,14 +403,14 @@ struct snd_soc_dai_driver atom_dai[] = {
 };
 EXPORT_SYMBOL_NS(atom_dai, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
 
-void atom_set_mach_params(const struct snd_soc_acpi_mach *mach,
+void atom_set_mach_params(struct snd_soc_acpi_mach *mach,
 			  struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = pdata->desc;
 	struct snd_soc_acpi_mach_params *mach_params;
 
-	mach_params = (struct snd_soc_acpi_mach_params *)&mach->mach_params;
+	mach_params = &mach->mach_params;
 	mach_params->platform = dev_name(sdev->dev);
 	mach_params->num_dai_drivers = desc->ops->num_drv;
 	mach_params->dai_drivers = desc->ops->drv;
diff --git a/sound/soc/sof/intel/atom.h b/sound/soc/sof/intel/atom.h
index 96a462c7a2e5..b965e5e080a6 100644
--- a/sound/soc/sof/intel/atom.h
+++ b/sound/soc/sof/intel/atom.h
@@ -65,8 +65,8 @@ int atom_run(struct snd_sof_dev *sdev);
 int atom_reset(struct snd_sof_dev *sdev);
 void atom_dump(struct snd_sof_dev *sdev, u32 flags);
 
-void atom_machine_select(struct snd_sof_dev *sdev);
-void atom_set_mach_params(const struct snd_soc_acpi_mach *mach,
+struct snd_soc_acpi_mach *atom_machine_select(struct snd_sof_dev *sdev);
+void atom_set_mach_params(struct snd_soc_acpi_mach *mach,
 			  struct snd_sof_dev *sdev);
 
 extern struct snd_soc_dai_driver atom_dai[];
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 1a8a39a878fd..1121711e9029 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -509,7 +509,7 @@ static int bdw_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-static void bdw_machine_select(struct snd_sof_dev *sdev)
+static struct snd_soc_acpi_mach *bdw_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
@@ -518,22 +518,23 @@ static void bdw_machine_select(struct snd_sof_dev *sdev)
 	mach = snd_soc_acpi_find_machine(desc->machines);
 	if (!mach) {
 		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
-		return;
+		return NULL;
 	}
 
 	sof_pdata->tplg_filename = mach->sof_tplg_filename;
 	mach->mach_params.acpi_ipc_irq_index = desc->irqindex_host_ipc;
-	sof_pdata->machine = mach;
+
+	return mach;
 }
 
-static void bdw_set_mach_params(const struct snd_soc_acpi_mach *mach,
+static void bdw_set_mach_params(struct snd_soc_acpi_mach *mach,
 				struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = pdata->desc;
 	struct snd_soc_acpi_mach_params *mach_params;
 
-	mach_params = (struct snd_soc_acpi_mach_params *)&mach->mach_params;
+	mach_params = &mach->mach_params;
 	mach_params->platform = dev_name(sdev->dev);
 	mach_params->num_dai_drivers = desc->ops->num_drv;
 	mach_params->dai_drivers = desc->ops->drv;
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index dabbd5d908f6..21100d2e6644 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1105,7 +1105,8 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 }
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-static int hda_generic_machine_select(struct snd_sof_dev *sdev)
+static void hda_generic_machine_select(struct snd_sof_dev *sdev,
+				       struct snd_soc_acpi_mach **mach)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_soc_acpi_mach_params *mach_params;
@@ -1137,7 +1138,7 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 		 *  - one HDMI codec, and/or
 		 *  - one external HDAudio codec
 		 */
-		if (!pdata->machine && codec_num <= 2) {
+		if (!*mach && codec_num <= 2) {
 			hda_mach = snd_soc_acpi_intel_hda_machines;
 
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
@@ -1152,10 +1153,9 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 			tplg_filename = hda_mach->sof_tplg_filename;
 			ret = dmic_topology_fixup(sdev, &tplg_filename, idisp_str, &dmic_num);
 			if (ret < 0)
-				return ret;
+				return;
 
 			hda_mach->mach_params.dmic_num = dmic_num;
-			pdata->machine = hda_mach;
 			pdata->tplg_filename = tplg_filename;
 
 			if (codec_num == 2) {
@@ -1165,23 +1165,22 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 				 */
 				hda_mach->mach_params.link_mask = 0;
 			}
+
+			*mach = hda_mach;
 		}
 	}
 
 	/* used by hda machine driver to create dai links */
-	if (pdata->machine) {
-		mach_params = (struct snd_soc_acpi_mach_params *)
-			&pdata->machine->mach_params;
+	if (*mach) {
+		mach_params = &(*mach)->mach_params;
 		mach_params->codec_mask = bus->codec_mask;
 		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
 	}
-
-	return 0;
 }
 #else
-static int hda_generic_machine_select(struct snd_sof_dev *sdev)
+static void hda_generic_machine_select(struct snd_sof_dev *sdev,
+				       struct snd_soc_acpi_mach **mach)
 {
-	return 0;
 }
 #endif
 
@@ -1264,7 +1263,7 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 	return true;
 }
 
-static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
+static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct snd_soc_acpi_link_adr *link;
@@ -1282,7 +1281,7 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
 	 * machines, for mixed cases with I2C/I2S the detection relies
 	 * on the HID list.
 	 */
-	if (link_mask && !pdata->machine) {
+	if (link_mask) {
 		for (mach = pdata->desc->alt_machines;
 		     mach && mach->link_mask; mach++) {
 			/*
@@ -1317,7 +1316,6 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
 		if (mach && mach->link_mask) {
 			int dmic_num = 0;
 
-			pdata->machine = mach;
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
 			mach->mach_params.platform = dev_name(sdev->dev);
@@ -1339,9 +1337,8 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
 				int ret;
 
 				ret = dmic_topology_fixup(sdev, &tplg_filename, "", &dmic_num);
-
 				if (ret < 0)
-					return ret;
+					return NULL;
 
 				pdata->tplg_filename = tplg_filename;
 			}
@@ -1351,35 +1348,36 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
 				"SoundWire machine driver %s topology %s\n",
 				mach->drv_name,
 				pdata->tplg_filename);
-		} else {
-			dev_info(sdev->dev,
-				 "No SoundWire machine driver found\n");
+
+			return mach;
 		}
+
+		dev_info(sdev->dev, "No SoundWire machine driver found\n");
 	}
 
-	return 0;
+	return NULL;
 }
 #else
-static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
+static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev)
 {
-	return 0;
+	return NULL;
 }
 #endif
 
-void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
+void hda_set_mach_params(struct snd_soc_acpi_mach *mach,
 			 struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = pdata->desc;
 	struct snd_soc_acpi_mach_params *mach_params;
 
-	mach_params = (struct snd_soc_acpi_mach_params *)&mach->mach_params;
+	mach_params = &mach->mach_params;
 	mach_params->platform = dev_name(sdev->dev);
 	mach_params->num_dai_drivers = desc->ops->num_drv;
 	mach_params->dai_drivers = desc->ops->drv;
 }
 
-void hda_machine_select(struct snd_sof_dev *sdev)
+struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
@@ -1394,8 +1392,6 @@ void hda_machine_select(struct snd_sof_dev *sdev)
 		if (!sof_pdata->tplg_filename)
 			sof_pdata->tplg_filename = mach->sof_tplg_filename;
 
-		sof_pdata->machine = mach;
-
 		if (mach->link_mask) {
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
@@ -1405,16 +1401,18 @@ void hda_machine_select(struct snd_sof_dev *sdev)
 	/*
 	 * If I2S fails, try SoundWire
 	 */
-	hda_sdw_machine_select(sdev);
+	if (!mach)
+		mach = hda_sdw_machine_select(sdev);
 
 	/*
 	 * Choose HDA generic machine driver if mach is NULL.
 	 * Otherwise, set certain mach params.
 	 */
-	hda_generic_machine_select(sdev);
-
-	if (!sof_pdata->machine)
+	hda_generic_machine_select(sdev, &mach);
+	if (!mach)
 		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
+
+	return mach;
 }
 
 int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index cb71d9d5cf6c..5b4d59647a1d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -728,8 +728,8 @@ extern const struct sof_intel_dsp_desc jsl_chip_info;
 extern const struct sof_intel_dsp_desc adls_chip_info;
 
 /* machine driver select */
-void hda_machine_select(struct snd_sof_dev *sdev);
-void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
+struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev);
+void hda_set_mach_params(struct snd_soc_acpi_mach *mach,
 			 struct snd_sof_dev *sdev);
 
 /* PCI driver selection and probe */
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 0226a53148c9..b0ffb2a93bcc 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -557,15 +557,17 @@ snd_sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata)
 		sof_ops(sdev)->machine_unregister(sdev, pdata);
 }
 
-static inline void
+static inline struct snd_soc_acpi_mach *
 snd_sof_machine_select(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev) && sof_ops(sdev)->machine_select)
-		sof_ops(sdev)->machine_select(sdev);
+		return sof_ops(sdev)->machine_select(sdev);
+
+	return NULL;
 }
 
 static inline void
-snd_sof_set_mach_params(const struct snd_soc_acpi_mach *mach,
+snd_sof_set_mach_params(struct snd_soc_acpi_mach *mach,
 			struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev) && sof_ops(sdev)->set_mach_params)
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 91e3fa5a7350..9e76b796502f 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -1027,9 +1027,10 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)) {
 
 		/* find machine */
-		snd_sof_machine_select(sdev);
-		if (sof_pdata->machine) {
-			snd_sof_set_mach_params(sof_pdata->machine, sdev);
+		mach = snd_sof_machine_select(sdev);
+		if (mach) {
+			sof_pdata->machine = mach;
+			snd_sof_set_mach_params(mach, sdev);
 			return 0;
 		}
 
@@ -1051,7 +1052,7 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
 
 	sof_pdata->machine = mach;
-	snd_sof_set_mach_params(sof_pdata->machine, sdev);
+	snd_sof_set_mach_params(mach, sdev);
 
 	return 0;
 }
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 16caf5c74035..114882e4370f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -293,8 +293,8 @@ struct snd_sof_dsp_ops {
 				void *pdata); /* optional */
 	void (*machine_unregister)(struct snd_sof_dev *sdev,
 				   void *pdata); /* optional */
-	void (*machine_select)(struct snd_sof_dev *sdev); /* optional */
-	void (*set_mach_params)(const struct snd_soc_acpi_mach *mach,
+	struct snd_soc_acpi_mach * (*machine_select)(struct snd_sof_dev *sdev); /* optional */
+	void (*set_mach_params)(struct snd_soc_acpi_mach *mach,
 				struct snd_sof_dev *sdev); /* optional */
 
 	/* DAI ops */
-- 
2.25.1

