Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4027D6E3
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 10:05:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B1631697;
	Thu,  1 Aug 2019 10:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B1631697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564646742;
	bh=G20OWYtF6vuYSd8tZcTNuGyP7m1fGhZZNhcVwVbi6qI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uE52PWzQpUK5cxZz4qljuuN2Q9BQV19Gwn+BtHG1R3GV2sUoryh4wPiUb1UmdhHn8
	 uNKE+KvHAR6e3TpyKLLn+haTCMKvJcZbgX/tytyuVFnLEANCaPg5B8aSKFtNNrLCLz
	 jVyL1cAz0bz0wotioi9y5bPX6zXpJVMF76mteBWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE0DF80214;
	Thu,  1 Aug 2019 10:03:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CEC4F804CC; Thu,  1 Aug 2019 10:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBAFFF80214
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 10:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBAFFF80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 01:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="175163698"
Received: from macchian.itwn.intel.com ([10.5.230.135])
 by orsmga003.jf.intel.com with ESMTP; 01 Aug 2019 01:03:42 -0700
From: mac.chiang@intel.com
To: alsa-devel@alsa-project.org
Date: Thu,  1 Aug 2019 16:02:44 +0800
Message-Id: <1564646564-24990-1-git-send-email-mac.chiang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: sathya.prakash.m.r@intel.com, mac.chiang@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH] ASoC: Intel: boards: Add Cometlake Dialog
	Maxim machine driver
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mac Chiang <mac.chiang@intel.com>

enable Cometlake support with:
SSP0 for DA7219 headphone codec
SSP1 for MAX98357a speaker amp codec

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
 sound/soc/intel/boards/Kconfig                    | 31 +++++++------
 sound/soc/intel/boards/kbl_da7219_max98357a.c     | 55 ++++++++++++++++++++---
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 12 +++++
 3 files changed, 80 insertions(+), 18 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 50bf149..545aef8 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -322,19 +322,6 @@ config SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH
           Say Y or m if you have such a device. This is a recommended option.
           If unsure select "N".
 
-config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
-	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_DA7219
-	select SND_SOC_MAX98357A
-	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
-	help
-	  This adds support for ASoC Onboard Codec I2S machine driver. This will
-	  create an alsa sound card for DA7219 + MAX98357A I2S audio codec.
-	  Say Y if you have such a device.
-
 config SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH
 	tristate "KBL with DA7219 and MAX98927 in I2S Mode"
 	depends on I2C && ACPI
@@ -363,6 +350,24 @@ config SND_SOC_INTEL_KBL_RT5660_MACH
 
 endif ## SND_SOC_INTEL_KBL
 
+if SND_SOC_INTEL_KBL || SND_SOC_SOF_COMETLAKE_LP
+
+config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
+	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_DA7219
+	select SND_SOC_MAX98357A
+	select SND_SOC_DMIC
+	select SND_SOC_HDAC_HDMI
+	help
+	  This adds support for ASoC Onboard Codec I2S machine driver. This will
+	  create an alsa sound card for DA7219 + MAX98357A I2S audio codec for
+	  Kabylake/Cometlake platforms.
+	  Say Y if you have such a device.
+
+endif ## SND_SOC_INTEL_KBL || SND_SOC_SOF_COMETLAKE_LP
+
 if SND_SOC_INTEL_GLK || (SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK)
 
 config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 537a889..fe3ac70 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -9,6 +9,7 @@
  *   RT5663 codecs
  */
 
+#include <asm/cpu_device_id.h>
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -17,6 +18,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/soc-acpi.h>
 #include "../../codecs/da7219.h"
 #include "../../codecs/hdac_hdmi.h"
 #include "../../codecs/da7219-aad.h"
@@ -210,7 +212,11 @@ static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 	if (!pcm)
 		return -ENOMEM;
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
+	pcm->device = dai->id;
+#else
 	pcm->device = device;
+#endif
 	pcm->codec_dai = dai;
 
 	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
@@ -587,9 +593,17 @@ static struct snd_soc_card kabylake_audio_card_da7219_m98357a = {
 	.late_probe = kabylake_card_late_probe,
 };
 
+static const struct x86_cpu_id cml_ids[] = {
+	{ X86_VENDOR_INTEL, 6, 0x8E }, /* Cometlake CPU_ID */
+	{}
+};
+
 static int kabylake_audio_probe(struct platform_device *pdev)
 {
 	struct kbl_codec_private *ctx;
+	struct snd_soc_acpi_mach *mach;
+	const char *platform_name;
+	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -600,17 +614,46 @@ static int kabylake_audio_probe(struct platform_device *pdev)
 	kabylake_audio_card =
 		(struct snd_soc_card *)pdev->id_entry->driver_data;
 
+	kabylake_audio_card = &kabylake_audio_card_da7219_m98357a;
+
 	kabylake_audio_card->dev = &pdev->dev;
 	snd_soc_card_set_drvdata(kabylake_audio_card, ctx);
+
+	if (x86_match_cpu(cml_ids)) {
+		unsigned int i;
+
+		kabylake_audio_card->name = "cmlda7219max";
+
+		for (i = 0; i < ARRAY_SIZE(kabylake_dais); i++) {
+			/* MAXIM_CODEC is connected to SSP1. */
+			if (!strcmp(kabylake_dais[i].cpus->dai_name,
+					KBL_MAXIM_CODEC_DAI)) {
+				kabylake_dais[i].name = "SSP1-Codec";
+				kabylake_dais[i].cpus->dai_name = "SSP1 Pin";
+			}
+			/* DIALOG_CODEC is connected to SSP0 */
+			else if (!strcmp(kabylake_dais[i].cpus->dai_name,
+					KBL_DIALOG_CODEC_DAI)) {
+				kabylake_dais[i].name = "SSP0-Codec";
+				kabylake_dais[i].cpus->dai_name = "SSP0 Pin";
+			}
+		}
+	}
+
+	mach = (&pdev->dev)->platform_data;
+	platform_name = mach->mach_params.platform;
+
+	ret = snd_soc_fixup_dai_links_platform_name(kabylake_audio_card,
+							platform_name);
+	if (ret)
+		return ret;
+
 	return devm_snd_soc_register_card(&pdev->dev, kabylake_audio_card);
 }
 
 static const struct platform_device_id kbl_board_ids[] = {
-	{
-		.name = "kbl_da7219_max98357a",
-		.driver_data =
-			(kernel_ulong_t)&kabylake_audio_card_da7219_m98357a,
-	},
+	{.name = "kbl_da7219_max98357a",},
+	{.name = "cml_da7219_max98357a",},
 	{ }
 };
 
@@ -628,5 +671,7 @@ module_platform_driver(kabylake_audio)
 /* Module information */
 MODULE_DESCRIPTION("Audio Machine driver-DA7219 & MAX98357A in I2S mode");
 MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
+MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:kbl_da7219_max98357a");
+MODULE_ALIAS("platform:cml_da7219_max98357a");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index c36c0aa..4ea32b2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -19,6 +19,11 @@ static struct snd_soc_acpi_codecs cml_codecs = {
 	.codecs = {"10EC5682"}
 };
 
+static struct snd_soc_acpi_codecs cml_spk_codecs = {
+	.num_codecs = 1,
+	.codecs = {"MX98357A"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 	{
 		.id = "INT34C2",
@@ -29,6 +34,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
 	{
+		.id = "DLGS7219",
+		.drv_name = "cml_da7219_max98357a",
+		.quirk_data = &cml_spk_codecs,
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
+	},
+	{
 		.id = "MX98357A",
 		.drv_name = "sof_rt5682",
 		.quirk_data = &cml_codecs,
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
