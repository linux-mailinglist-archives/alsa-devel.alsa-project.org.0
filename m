Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D31839A6
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 20:38:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD27F1748;
	Thu, 12 Mar 2020 20:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD27F1748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584041936;
	bh=7hEMyzUP4VfE4PvpaOrKm9B91EEf6kdkxcj8b3/lZIY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=syzs5invixXNVxUbJg0xGDwR3eF68WWw5l7apjZKTIH6CVxqq8qNpM7TR9uWKAygy
	 fUkjNJ2fuDsDk8w5dUkumFfUpC6S4uNicDExnZW2Dd5LlfjgR4eTRttb5FjdB01KxF
	 bXBPFlz9IKoPXT9ncrWfJio96MYZQU+I/kAQfXpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCBA5F802BD;
	Thu, 12 Mar 2020 20:35:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AAB5F802BD; Thu, 12 Mar 2020 20:34:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65C0DF802A8
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 20:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65C0DF802A8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 12:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="243142589"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by orsmga003.jf.intel.com with ESMTP; 12 Mar 2020 12:34:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/10] ASoC: SOF: Intel: hda: initial SoundWire machine driver
 autodetect
Date: Thu, 12 Mar 2020 14:33:41 -0500
Message-Id: <20200312193346.3264-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
References: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
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

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 164 ++++++++++++++++++++++++++++++++++----
 1 file changed, 149 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index f257b21d2551..1892f612c11d 100644
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
 
@@ -537,24 +538,31 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
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
@@ -953,6 +961,122 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
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
+			for (i = 0; i < hdev->info.count; i++, link++) {
+				/*
+				 * Try next machine if any expected Slaves
+				 * are not found on this link.
+				 */
+				if (!link_slaves_found(sdev, link, hdev->sdw))
+					break;
+			}
+			/* Found if all Slaves are checked */
+			if (i == hdev->info.count)
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
@@ -972,8 +1096,18 @@ void hda_machine_select(struct snd_sof_dev *sdev)
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

