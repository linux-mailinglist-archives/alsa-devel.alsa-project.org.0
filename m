Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE270195A0D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:40:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36889166C;
	Fri, 27 Mar 2020 16:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36889166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323613;
	bh=ddkvhlGTIej1LO6/PT49JPQ4UZdORR/hAm+IHmcPNfA=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=I+9RCaoM7cqpE7inBBeSZDG0YI5TxUPF1q/V/C9NMBgNjiILsoRpMPd+Geyqz0ZOA
	 6Dg7Sj9QPYUJVExoscwXqjwSpmKninAL4Ivuwd50tRGfJDj1+uCoMnjgmTxfI9sN0k
	 WA3lzQmbRqfVPiVKv8HMCaG+NvCbbZluQFkH8O/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 735E6F802F7;
	Fri, 27 Mar 2020 16:34:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7702F802EC; Fri, 27 Mar 2020 16:34:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id BA1AEF802E7
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA1AEF802E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8F271FB;
 Fri, 27 Mar 2020 08:34:02 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AA3F3F71F;
 Fri, 27 Mar 2020 08:34:02 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:34:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda: initial SoundWire machine driver
 autodetect" to the asoc tree
In-Reply-To: <20200325215027.28716-6-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325215027.28716-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

The patch

   ASoC: SOF: Intel: hda: initial SoundWire machine driver autodetect

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From b9ddd81bad19ef7b0955156e7590130127cfdaae Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 25 Mar 2020 16:50:21 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: initial SoundWire machine driver
 autodetect

For now we have a limited number of machine driver configurations, and
we can detect them based on the link configuration returned after
checking hardware and firmware (BIOS) configurations.

The link configuration is checked with a link_mask as well as a list
of _ADR descriptors for each link.

There is a chance that in extreme cases where the BIOS contains too
much information we would need to detect which Slave devices actually
report as 'attached'. This would be more accurate than static
table-based solutions, but it also introduces timing dependencies
since we don't know when those devices might become attached, so will
only be only be looked at if we see limitations with static methods
and the usual quirks based e.g. on DMI information.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Link: https://lore.kernel.org/r/20200325215027.28716-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 165 ++++++++++++++++++++++++++++++++++----
 1 file changed, 150 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1f93124a63cd..dea3c385b664 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -20,6 +20,7 @@
 
 #include <linux/acpi.h>
 #include <linux/module.h>
+#include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
 #include <sound/intel-nhlt.h>
 #include <sound/sof.h>
@@ -136,11 +137,8 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hdev;
 	struct sdw_intel_res res;
-	acpi_handle handle;
 	void *sdw;
 
-	handle = ACPI_HANDLE(sdev->dev);
-
 	hdev = sdev->pdata->hw_pdata;
 
 	memset(&res, 0, sizeof(res));
@@ -180,6 +178,9 @@ int hda_sdw_startup(struct snd_sof_dev *sdev)
 
 	hdev = sdev->pdata->hw_pdata;
 
+	if (!hdev->sdw)
+		return 0;
+
 	return sdw_intel_startup(hdev->sdw);
 }
 
@@ -536,24 +537,31 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	/* scan SoundWire capabilities exposed by DSDT */
 	ret = hda_sdw_acpi_scan(sdev);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: SoundWire ACPI scan error\n");
-		return ret;
+		dev_dbg(sdev->dev, "skipping SoundWire, ACPI scan error\n");
+		goto skip_soundwire;
 	}
 
 	link_mask = hdev->info.link_mask;
 	if (!link_mask) {
-		/*
-		 * probe/allocated SoundWire resources.
-		 * The hardware configuration takes place in hda_sdw_startup
-		 * after power rails are enabled.
-		 */
-		ret = hda_sdw_probe(sdev);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: SoundWire probe error\n");
-			return ret;
-		}
+		dev_dbg(sdev->dev, "skipping SoundWire, no links enabled\n");
+		goto skip_soundwire;
 	}
 
+	/*
+	 * probe/allocate SoundWire resources.
+	 * The hardware configuration takes place in hda_sdw_startup
+	 * after power rails are enabled.
+	 * It's entirely possible to have a mix of I2S/DMIC/SoundWire
+	 * devices, so we allocate the resources in all cases.
+	 */
+	ret = hda_sdw_probe(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: SoundWire probe error\n");
+		return ret;
+	}
+
+skip_soundwire:
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
@@ -949,6 +957,123 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+/* Check if all Slaves defined on the link can be found */
+static bool link_slaves_found(struct snd_sof_dev *sdev,
+			      const struct snd_soc_acpi_link_adr *link,
+			      struct sdw_intel_ctx *sdw)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct sdw_intel_slave_id *ids = sdw->ids;
+	int num_slaves = sdw->num_slaves;
+	unsigned int part_id, link_id, unique_id, mfg_id;
+	int i, j;
+
+	for (i = 0; i < link->num_adr; i++) {
+		u64 adr = link->adr_d[i].adr;
+
+		mfg_id = SDW_MFG_ID(adr);
+		part_id = SDW_PART_ID(adr);
+		link_id = SDW_DISCO_LINK_ID(adr);
+		for (j = 0; j < num_slaves; j++) {
+			if (ids[j].link_id != link_id ||
+			    ids[j].id.part_id != part_id ||
+			    ids[j].id.mfg_id != mfg_id)
+				continue;
+			/*
+			 * we have to check unique id
+			 * if there is more than one
+			 * Slave on the link
+			 */
+			unique_id = SDW_UNIQUE_ID(adr);
+			if (link->num_adr == 1 ||
+			    ids[j].id.unique_id == SDW_IGNORED_UNIQUE_ID ||
+			    ids[j].id.unique_id == unique_id) {
+				dev_dbg(bus->dev,
+					"found %x at link %d\n",
+					part_id, link_id);
+				break;
+			}
+		}
+		if (j == num_slaves) {
+			dev_dbg(bus->dev,
+				"Slave %x not found\n",
+				part_id);
+			return false;
+		}
+	}
+	return true;
+}
+
+static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *pdata = sdev->pdata;
+	const struct snd_soc_acpi_link_adr *link;
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct snd_soc_acpi_mach *mach;
+	struct sof_intel_hda_dev *hdev;
+	u32 link_mask;
+	int i;
+
+	hdev = pdata->hw_pdata;
+	link_mask = hdev->info.link_mask;
+
+	/*
+	 * Select SoundWire machine driver if needed using the
+	 * alternate tables. This case deals with SoundWire-only
+	 * machines, for mixed cases with I2C/I2S the detection relies
+	 * on the HID list.
+	 */
+	if (link_mask && !pdata->machine) {
+		for (mach = pdata->desc->alt_machines;
+		     mach && mach->link_mask; mach++) {
+			if (mach->link_mask != link_mask)
+				continue;
+
+			/* No need to match adr if there is no links defined */
+			if (!mach->links)
+				break;
+
+			link = mach->links;
+			for (i = 0; i < hdev->info.count && link->num_adr;
+			     i++, link++) {
+				/*
+				 * Try next machine if any expected Slaves
+				 * are not found on this link.
+				 */
+				if (!link_slaves_found(sdev, link, hdev->sdw))
+					break;
+			}
+			/* Found if all Slaves are checked */
+			if (i == hdev->info.count || !link->num_adr)
+				break;
+		}
+		if (mach && mach->link_mask) {
+			dev_dbg(bus->dev,
+				"SoundWire machine driver %s topology %s\n",
+				mach->drv_name,
+				mach->sof_tplg_filename);
+			pdata->machine = mach;
+			mach->mach_params.links = mach->links;
+			mach->mach_params.link_mask = mach->link_mask;
+			mach->mach_params.platform = dev_name(sdev->dev);
+			pdata->fw_filename = mach->sof_fw_filename;
+			pdata->tplg_filename = mach->sof_tplg_filename;
+		} else {
+			dev_info(sdev->dev,
+				 "No SoundWire machine driver found\n");
+		}
+	}
+
+	return 0;
+}
+#else
+static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+#endif
+
 void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
 			 struct device *dev)
 {
@@ -968,8 +1093,18 @@ void hda_machine_select(struct snd_sof_dev *sdev)
 	if (mach) {
 		sof_pdata->tplg_filename = mach->sof_tplg_filename;
 		sof_pdata->machine = mach;
+
+		if (mach->link_mask) {
+			mach->mach_params.links = mach->links;
+			mach->mach_params.link_mask = mach->link_mask;
+		}
 	}
 
+	/*
+	 * If I2S fails, try SoundWire
+	 */
+	hda_sdw_machine_select(sdev);
+
 	/*
 	 * Choose HDA generic machine driver if mach is NULL.
 	 * Otherwise, set certain mach params.
-- 
2.20.1

