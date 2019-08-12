Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D888A2F9
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 18:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E920B166B;
	Mon, 12 Aug 2019 18:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E920B166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565626127;
	bh=SUpwVVszj9TYAmBt+W21XqoKp/ltzeo3AVxAxn64e+I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ayV9kRaeqg+dbdIl0lOreMKwXCtjdbZ73uzQFVV8DUEzfBSpbt/YEYJDz381jgB2Y
	 RozS8sXTCUQEXMfXpiHibF7KR3QhoBQlmIppn48Tv7Lf6GTj6td2CgSX0QFbvcqy5G
	 RGM+l1p5YJpQReGnXBOZTq5JKGRtlogwzqk7vv1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E66FF80214;
	Mon, 12 Aug 2019 18:07:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83F7BF80213; Mon, 12 Aug 2019 18:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12F29F8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 18:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F29F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 09:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,378,1559545200"; d="scan'208";a="166762033"
Received: from narju-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.252.203.162])
 by orsmga007.jf.intel.com with ESMTP; 12 Aug 2019 09:06:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 12 Aug 2019 11:06:23 -0500
Message-Id: <20190812160623.20821-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: Intel: hda: fixup HDaudio topology
	name with DMIC number
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

The SOF project maintains 6 topologies for HDaudio (iDisp or
HDaudio+iDisp, no DMIC, 2 DMICs, 4 DMICs). The user is currently
required to manually rename the topology file used in
/lib/firmware/intel/sof-tplg. We can do better to avoid such
renames and use logic to select the relevant file.

The NHLT information can be used to figure out which topology file
should be used.

Alternatively, when NHLT is not present in ACPI tables or is possibly
incorrect, a module parameter can provide that information, e.g. on
Up^2 board with the test DMIC kit.

Tested on Up^2 board and Acer Swift-SF314-55

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig |  1 +
 sound/soc/sof/intel/hda.c   | 75 +++++++++++++++++++++++++++++++------
 2 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index dd14ce92fe10..545071afbe18 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -254,6 +254,7 @@ config SND_SOC_SOF_HDA
 	tristate
 	select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
 	select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
+	select SND_INTEL_NHLT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index ebf277754901..c72e9a09eee1 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -19,6 +19,7 @@
 #include <sound/hda_register.h>
 
 #include <linux/module.h>
+#include <sound/intel-nhlt.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
 #include "../ops.h"
@@ -49,6 +50,12 @@ module_param_named(use_msi, hda_use_msi, bool, 0444);
 MODULE_PARM_DESC(use_msi, "SOF HDA use PCI MSI mode");
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+static int hda_dmic_num = -1;
+module_param_named(dmic_num, hda_dmic_num, int, 0444);
+MODULE_PARM_DESC(dmic_num, "SOF HDA DMIC number");
+#endif
+
 static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
 	{HDA_DSP_ROM_FW_MANIFEST_LOADED, "status: manifest loaded"},
 	{HDA_DSP_ROM_FW_FW_LOADED, "status: fw loaded"},
@@ -283,8 +290,26 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 
+static int check_nhlt_dmic(struct snd_sof_dev *sdev)
+{
+	struct nhlt_acpi_table *nhlt;
+	int dmic_num;
+
+	nhlt = intel_nhlt_init(sdev->dev);
+	if (nhlt) {
+		dmic_num = intel_nhlt_get_dmic_geo(sdev->dev, nhlt);
+		intel_nhlt_free(nhlt);
+		if (dmic_num == 2 || dmic_num == 4)
+			return dmic_num;
+	}
+
+	return 0;
+}
+
 static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
-				   const char *sof_tplg_filename)
+				   const char *sof_tplg_filename,
+				   const char *idisp_str,
+				   const char *dmic_str)
 {
 	const char *tplg_filename = NULL;
 	char *filename;
@@ -298,7 +323,8 @@ static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 	split_ext = strsep(&filename, ".");
 	if (split_ext) {
 		tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
-					       "%s-idisp.tplg", split_ext);
+					       "%s%s%s.tplg",
+					       split_ext, idisp_str, dmic_str);
 		if (!tplg_filename)
 			return NULL;
 	}
@@ -317,6 +343,9 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	struct snd_soc_acpi_mach *mach;
 	const char *tplg_filename;
+	const char *idisp_str;
+	const char *dmic_str;
+	int dmic_num;
 	int codec_num = 0;
 	int i;
 #endif
@@ -387,17 +416,39 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
 				 hda_mach->drv_name);
 
-			/* fixup topology file for HDMI only platforms */
-			if (codec_num == 1) {
-				/* use local variable for readability */
-				tplg_filename = pdata->tplg_filename;
-				tplg_filename = fixup_tplg_name(sdev, tplg_filename);
-				if (!tplg_filename) {
-					hda_codec_i915_exit(sdev);
-					return ret;
-				}
-				pdata->tplg_filename = tplg_filename;
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
+			if (!tplg_filename) {
+				hda_codec_i915_exit(sdev);
+				return ret;
 			}
+			pdata->tplg_filename = tplg_filename;
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
