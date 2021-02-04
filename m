Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42B30FE8B
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:40:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56FCD166C;
	Thu,  4 Feb 2021 21:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56FCD166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612471206;
	bh=wUGEw6AnLv+J/2f2iFhmCOkJAFQbdTKZSbYMqhLOCU4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YD/kusg5ux9bCK7SS1FuS6Io2OIXrPg9WfFyVBx5m5g/scdZtkUSs1rFee56l0vHS
	 8o+48zqhWjHu6qGsvkorQ/iYhiWs6cUijjLuoqTRfLh5DaADyMI3fIxR1tp3JDjp59
	 0zqrUVkXyIFaMnwdOnNKzTtWGASDHFuviCmJXfaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB61DF804FE;
	Thu,  4 Feb 2021 21:34:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 628A2F8026B; Thu,  4 Feb 2021 21:34:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25A25F8025C
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25A25F8025C
IronPort-SDR: z+I3F8BrCZ2wGKsYx3sqErtCd0fwmOzydkdgJkSAaIoFW0HQ7CQp/JocV5x4lebyuE2VpOrl1U
 oekz0LSU2S1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181472548"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="181472548"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:55 -0800
IronPort-SDR: p1Om/QDUnUPkNhYIXkw6X5MvIyvv3bB3sHNiwMRfwDsFFoL9u3/8MYATdic1oQmtE1CembVOgV
 9LWzZiHHKHrg==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="483700367"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/14] ASoC: SOF: Intel: detect DMIC number in SoundWire mixed
 config
Date: Thu,  4 Feb 2021 14:33:10 -0600
Message-Id: <20210204203312.27112-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
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

The pinmux allows for 2 SoundWire links to be enabled along with
DMICs. This was the default configuration on the TGL-RVP.

One issue with this configuration is that we don't have a means to
automatically detect how many DMICs are used, which in turn requires
the user to manually rename the topology file required on a platform.

This was borderline acceptable for Intel RVPs, but now that this
configuration is present in HP devices we need to automate the
process.

This patch makes use of the NHLT information and will pass the DMIC
number to the machine driver as a parameter. A follow-up patch will
expose the DMIC number to userspace/UCM with the configuration strings.

The Google devices do make use of DMICs instead of SoundWire link 2
and 3, but their topology is unique enough that they do not need any
NHTL support or topology renaming.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 129 ++++++++++++++++++++++++--------------
 1 file changed, 82 insertions(+), 47 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index db868376039a..7dfa30c8a168 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -555,7 +555,7 @@ static int hda_init(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 static int check_nhlt_dmic(struct snd_sof_dev *sdev)
 {
@@ -598,6 +598,53 @@ static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 	return tplg_filename;
 }
 
+static int dmic_topology_fixup(struct snd_sof_dev *sdev,
+			       const char **tplg_filename,
+			       const char *idisp_str,
+			       int *dmic_found)
+{
+	const char *default_tplg_filename = *tplg_filename;
+	const char *fixed_tplg_filename;
+	const char *dmic_str;
+	int dmic_num;
+
+	/* first check NHLT for DMICs */
+	dmic_num = check_nhlt_dmic(sdev);
+
+	/* allow for module parameter override */
+	if (hda_dmic_num != -1)
+		dmic_num = hda_dmic_num;
+
+	switch (dmic_num) {
+	case 1:
+		dmic_str = "-1ch";
+		break;
+	case 2:
+		dmic_str = "-2ch";
+		break;
+	case 3:
+		dmic_str = "-3ch";
+		break;
+	case 4:
+		dmic_str = "-4ch";
+		break;
+	default:
+		dmic_num = 0;
+		dmic_str = "";
+		break;
+	}
+
+	fixed_tplg_filename = fixup_tplg_name(sdev, default_tplg_filename,
+					      idisp_str, dmic_str);
+	if (!fixed_tplg_filename)
+		return -ENOMEM;
+
+	dev_info(sdev->dev, "DMICs detected in NHLT tables: %d\n", dmic_num);
+	*dmic_found = dmic_num;
+	*tplg_filename = fixed_tplg_filename;
+
+	return 0;
+}
 #endif
 
 static int hda_init_caps(struct snd_sof_dev *sdev)
@@ -963,9 +1010,9 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const char *tplg_filename;
 	const char *idisp_str;
-	const char *dmic_str;
 	int dmic_num = 0;
 	int codec_num = 0;
+	int ret;
 	int i;
 
 	/* codec detection */
@@ -990,10 +1037,6 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 		if (!pdata->machine && codec_num <= 2) {
 			hda_mach = snd_soc_acpi_intel_hda_machines;
 
-			/* topology: use the info from hda_machines */
-			pdata->tplg_filename =
-				hda_mach->sof_tplg_filename;
-
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
 				 hda_mach->drv_name);
 
@@ -1002,42 +1045,13 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 			else
 				idisp_str = "";
 
-			/* first check NHLT for DMICs */
-			dmic_num = check_nhlt_dmic(sdev);
-
-			/* allow for module parameter override */
-			if (hda_dmic_num != -1)
-				dmic_num = hda_dmic_num;
-
-			switch (dmic_num) {
-			case 1:
-				dmic_str = "-1ch";
-				break;
-			case 2:
-				dmic_str = "-2ch";
-				break;
-			case 3:
-				dmic_str = "-3ch";
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
-			if (!tplg_filename)
-				return -EINVAL;
-
-			dev_info(bus->dev,
-				 "DMICs detected in NHLT tables: %d\n",
-				 dmic_num);
+			/* topology: use the info from hda_machines */
+			tplg_filename = hda_mach->sof_tplg_filename;
+			ret = dmic_topology_fixup(sdev, &tplg_filename, idisp_str, &dmic_num);
+			if (ret < 0)
+				return ret;
 
+			hda_mach->mach_params.dmic_num = dmic_num;
 			pdata->machine = hda_mach;
 			pdata->tplg_filename = tplg_filename;
 		}
@@ -1049,7 +1063,6 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 			&pdata->machine->mach_params;
 		mach_params->codec_mask = bus->codec_mask;
 		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
-		mach_params->dmic_num = dmic_num;
 	}
 
 	return 0;
@@ -1144,7 +1157,6 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct snd_soc_acpi_link_adr *link;
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_soc_acpi_mach *mach;
 	struct sof_intel_hda_dev *hdev;
 	u32 link_mask;
@@ -1192,10 +1204,8 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
 				break;
 		}
 		if (mach && mach->link_mask) {
-			dev_dbg(bus->dev,
-				"SoundWire machine driver %s topology %s\n",
-				mach->drv_name,
-				mach->sof_tplg_filename);
+			int dmic_num = 0;
+
 			pdata->machine = mach;
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
@@ -1205,6 +1215,31 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
 			else
 				pdata->fw_filename = pdata->desc->default_fw_filename;
 			pdata->tplg_filename = mach->sof_tplg_filename;
+
+			/*
+			 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
+			 * link 2 and 3, thus we only try to enable dmics if all conditions
+			 * are true:
+			 * a) link 2 and 3 are not used by SoundWire
+			 * b) the NHLT table reports the presence of microphones
+			 */
+			if (!(mach->link_mask & GENMASK(3, 2))) {
+				const char *tplg_filename = mach->sof_tplg_filename;
+				int ret;
+
+				ret = dmic_topology_fixup(sdev, &tplg_filename, "", &dmic_num);
+
+				if (ret < 0)
+					return ret;
+
+				pdata->tplg_filename = tplg_filename;
+			}
+			mach->mach_params.dmic_num = dmic_num;
+
+			dev_dbg(sdev->dev,
+				"SoundWire machine driver %s topology %s\n",
+				mach->drv_name,
+				pdata->tplg_filename);
 		} else {
 			dev_info(sdev->dev,
 				 "No SoundWire machine driver found\n");
-- 
2.25.1

