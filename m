Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B28E2513
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 23:19:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CB41166F;
	Wed, 23 Oct 2019 23:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CB41166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571865577;
	bh=mLYMlM1ww4XAFc5A2YiikdfdRdy2zOyfo6HdK1pAlM0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YPaxinhpjGj70c0/ZRiOH+pa/uXgbXHiO7g11BkzZfkUIT0YRFJkh4QayfWqfHpqJ
	 Q2C/jPYGjR+731Lv4SxMmCYDbvIEWO5mQ6BKwppkaUro4+M9oTFOvkXvgD6Sc2aFeM
	 JSJGhtIHovZQG83BO+CGq9WPm6wvS5NirSzZ08NM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D03F8063B;
	Wed, 23 Oct 2019 23:15:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CB0CF80639; Wed, 23 Oct 2019 23:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66AC4F80635
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 23:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66AC4F80635
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 14:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="373003475"
Received: from ayamada-mobl1.gar.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.95.208])
 by orsmga005.jf.intel.com with ESMTP; 23 Oct 2019 14:15:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 23 Oct 2019 16:15:03 -0500
Message-Id: <20191023211504.32675-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191023211504.32675-1-pierre-louis.bossart@linux.intel.com>
References: <20191023211504.32675-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/5] ASoC: SOF: Intel: hda: initial SoundWire
	machine driver autodetect
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

For now we have a limited number of machine driver configurations, and
we can detect them based on the link configuration returned after
checking hardware and firmware (BIOS) configurations.

It's likely that in the future we will need to check for _ADR match as
well, which can easily be done by extending the acpi_info structure.

There is a chance that in extreme cases where the BIOS contains too
much information we would need to detect which Slave devices actually
report as 'attached'. This would be more accurate than static
table-based solutions, but it also introduces timing dependencies
since we don't know when those devices might become attached, so will
only be only be looked at if we see limitations with static methods
and the usual quirks based e.g. on DMI information.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 61 ++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 98ac38ca0afa..5f614ec8de1d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -179,6 +179,9 @@ int hda_sdw_startup(struct snd_sof_dev *sdev)
 
 	hdev = sdev->pdata->hw_pdata;
 
+	if (!hdev->sdw)
+		return 0;
+
 	return sdw_intel_startup(hdev->sdw);
 }
 
@@ -502,11 +505,11 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_sof_pdata *pdata = sdev->pdata;
+	struct snd_soc_acpi_mach *mach;
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	struct hdac_ext_link *hlink;
-	struct snd_soc_acpi_mach_params *mach_params;
 	struct snd_soc_acpi_mach *hda_mach;
-	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_acpi_mach_params *mach_params;
 	const char *tplg_filename;
 	const char *idisp_str;
 	const char *dmic_str;
@@ -547,24 +550,56 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
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
+		dev_dbg(sdev->dev, "skipping SoundWire, no links enabled\n");
+		goto skip_soundwire;
+	}
+
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
+	/*
+	 * Select SoundWire machine driver if needed using the
+	 * alternate tables. This case deals with SoundWire-only
+	 * machines, for mixed cases with I2C/I2S the detection relies
+	 * on the HID list.
+	 */
+	if (!pdata->machine) {
+		mach = pdata->desc->alt_machines;
+		while (mach && mach->link_mask && mach->link_mask != link_mask)
+			mach++;
+		if (mach && mach->link_mask) {
+			dev_dbg(bus->dev,
+				"SoundWire machine driver %s topology %s\n",
+				mach->drv_name,
+				mach->sof_tplg_filename);
+			pdata->machine = mach;
+			mach->mach_params.platform = dev_name(sdev->dev);
+			pdata->fw_filename = mach->sof_fw_filename;
+			pdata->tplg_filename = mach->sof_tplg_filename;
+		} else {
+			dev_info(sdev->dev,
+				 "No SoundWire machine driver found\n");
 		}
 	}
 
+skip_soundwire:
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
