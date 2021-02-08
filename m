Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A53143F7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:38:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 991B91696;
	Tue,  9 Feb 2021 00:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 991B91696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612827522;
	bh=snat7hi7BUIlkzw1dOpJLDWwyKA3Jqf2HgEkg1OaW5w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sWavc/8WcABaDS9im797q6penMOS/DKCvPCNPMMNFxjWjXF/CsyyliWaDA3jL95F5
	 k/zpFNsR6Bkgu/fG6QhmBqWxb36rztiABldYbntwpKKvhR2IxV1Wmczqj1ip28Gp2L
	 HewB01F6MgcsaA51TX6QNH1PEdawUqx8qQNhLfeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 174DDF804D9;
	Tue,  9 Feb 2021 00:34:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C9F3F80423; Tue,  9 Feb 2021 00:34:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A31DF8027C
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A31DF8027C
IronPort-SDR: Vex0EAEJjhkHbvG0i9trD11bLCyZAGicwZffcUpITQw3edZT3V7HNnAjLcSNbkHOBhIqTG1SE5
 60e4vmJm11iA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168923515"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168923515"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:58 -0800
IronPort-SDR: QhMFDHO0RVpoKItRrg0AcEplACJMjr8wmkBNrjldKe9nRuS+ZEsNcxeafYm094dR7YreMn004L
 tFl/w1o38y1Q==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="374741361"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:57 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 09/11] ASoC: SOF: Intel: detect DMIC number in SoundWire
 mixed config
Date: Mon,  8 Feb 2021 17:33:34 -0600
Message-Id: <20210208233336.59449-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
References: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
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
 sound/soc/sof/intel/hda.c | 133 ++++++++++++++++++++++++--------------
 1 file changed, 85 insertions(+), 48 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2279e30c9245..4f7de3d12292 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -285,11 +285,13 @@ static char *hda_model;
 module_param(hda_model, charp, 0444);
 MODULE_PARM_DESC(hda_model, "Use the given HDA board model.");
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 static int hda_dmic_num = -1;
 module_param_named(dmic_num, hda_dmic_num, int, 0444);
 MODULE_PARM_DESC(dmic_num, "SOF HDA DMIC number");
+#endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 static bool hda_codec_use_common_hdmi = IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI);
 module_param_named(use_common_hdmi, hda_codec_use_common_hdmi, bool, 0444);
 MODULE_PARM_DESC(use_common_hdmi, "SOF HDA use common HDMI codec driver");
@@ -505,7 +507,7 @@ static int hda_init(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 static int check_nhlt_dmic(struct snd_sof_dev *sdev)
 {
@@ -548,6 +550,53 @@ static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
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
@@ -913,9 +962,9 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const char *tplg_filename;
 	const char *idisp_str;
-	const char *dmic_str;
 	int dmic_num = 0;
 	int codec_num = 0;
+	int ret;
 	int i;
 
 	/* codec detection */
@@ -940,10 +989,6 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 		if (!pdata->machine && codec_num <= 2) {
 			hda_mach = snd_soc_acpi_intel_hda_machines;
 
-			/* topology: use the info from hda_machines */
-			pdata->tplg_filename =
-				hda_mach->sof_tplg_filename;
-
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
 				 hda_mach->drv_name);
 
@@ -952,42 +997,13 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
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
@@ -999,7 +1015,6 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 			&pdata->machine->mach_params;
 		mach_params->codec_mask = bus->codec_mask;
 		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
-		mach_params->dmic_num = dmic_num;
 	}
 
 	return 0;
@@ -1094,7 +1109,6 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct snd_soc_acpi_link_adr *link;
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_soc_acpi_mach *mach;
 	struct sof_intel_hda_dev *hdev;
 	u32 link_mask;
@@ -1142,10 +1156,8 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
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
@@ -1155,6 +1167,31 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
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

