Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E79AB88EB2C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:27:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEE422C00;
	Wed, 27 Mar 2024 17:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEE422C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556832;
	bh=7mKkDHnpjVsMV+avsa/bSTvCScvxOlljZVffn/zZCXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tl7R+sY3FqANg1iVFefv+zVu8q5sSRr2wHJfNo7l5CNI2DleVW3v4yUhcRswgn+od
	 fSRwciwGoMZbAgHeewx+2mOPzodAJ/MQWfOEtrSxAlJwGz3Hll8B9JGOo8v267bEx/
	 3Rex5R2KxeEXncsimD2UBMq9vXkSHxEz5jfq+xxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66578F806C4; Wed, 27 Mar 2024 17:25:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CEABF8057D;
	Wed, 27 Mar 2024 17:25:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 183B1F80659; Wed, 27 Mar 2024 17:24:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 287BAF80564
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 287BAF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Pf9nwIyf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556678; x=1743092678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7mKkDHnpjVsMV+avsa/bSTvCScvxOlljZVffn/zZCXo=;
  b=Pf9nwIyfMGrQ7ZP5vClAZcCdAZDjXkV2Yax+fwQgdV4fAqbdSDr6ljxA
   OTVhnq8U00iFr2tnP9iqs3ixoV+ev3lUeioCD+oDi8r6aHsk+wbukyP9K
   RehHGMSeNjU/uXEFqy3gBpR+tZpeVeUpJtqBdOg4TcIqPuUGEIgix2tYC
   +cscBiC8zSXRO09deTSVGAxQOzaHpnKNITTYKCla0iFQI0+b69aU0Dc3v
   hL5LKrnJFi4D9iBKzvnFU3oYTkzBvQiUBnDCja9nyte7/DcYsyqmt1f5r
   8ElHhcFcgEGjfif9vlWdS/hVvU0vhXr20ncEm0NwvLvk+LTqd5PEdoWkq
   Q==;
X-CSE-ConnectionGUID: lW+mgChbTlOsssF5XaGWRA==
X-CSE-MsgGUID: EZmMEWOwQxS5khvFDCxraQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221520"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221520"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821285"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/18] ASoC: SOF: Intel: support tplg suffix detection
Date: Wed, 27 Mar 2024 11:23:57 -0500
Message-Id: <20240327162408.63953-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C2TTJBDJZA4C4KD7TFBBPRBPNPV7MQQO
X-Message-ID-Hash: C2TTJBDJZA4C4KD7TFBBPRBPNPV7MQQO
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2TTJBDJZA4C4KD7TFBBPRBPNPV7MQQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add new flags to tplg_quirk_mask to detect and append codec/amplifier
tplg suffix to topology file name at runtime. With this feature we
could implement an enumeration entry for all boards which implement
same headphone codec regardless the speaker amplifier type.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi.h  | 12 ++++++
 sound/soc/sof/intel/hda.c | 82 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 23d6d6bfb073..1d8f35ca1d6f 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -151,6 +151,18 @@ struct snd_soc_acpi_link_adr {
  */
 #define SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER BIT(2)
 
+/*
+ * when set the speaker amplifier name suffix (i.e. "-max98360a") will be
+ * appended to topology file name
+ */
+#define SND_SOC_ACPI_TPLG_INTEL_AMP_NAME BIT(3)
+
+/*
+ * when set the headphone codec name suffix (i.e. "-rt5682") will be appended to
+ * topology file name
+ */
+#define SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME BIT(4)
+
 /**
  * snd_soc_acpi_mach: ACPI-based machine descriptor. Most of the fields are
  * related to the hardware, except for the firmware and topology file names.
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7fe72b065451..e26b8fd682e5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -24,6 +24,7 @@
 #include <linux/soundwire/sdw_intel.h>
 #include <sound/intel-dsp-config.h>
 #include <sound/intel-nhlt.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
 #include <sound/hda-mlink.h>
@@ -1676,13 +1677,36 @@ void hda_set_mach_params(struct snd_soc_acpi_mach *mach,
 	mach_params->dai_drivers = desc->ops->drv;
 }
 
+static int check_tplg_quirk_mask(struct snd_soc_acpi_mach *mach)
+{
+	u32 dmic_ssp_quirk;
+	u32 codec_amp_name_quirk;
+
+	/*
+	 * In current implementation dmic and ssp quirks are designed for es8336
+	 * machine driver and could not be mixed with codec name and amp name
+	 * quirks.
+	 */
+	dmic_ssp_quirk = mach->tplg_quirk_mask &
+			 (SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER | SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER);
+	codec_amp_name_quirk = mach->tplg_quirk_mask &
+			 (SND_SOC_ACPI_TPLG_INTEL_AMP_NAME | SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME);
+
+	if (dmic_ssp_quirk && codec_amp_name_quirk)
+		return -EINVAL;
+
+	return 0;
+}
+
 struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 {
 	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
 	struct snd_soc_acpi_mach *mach = NULL;
+	enum snd_soc_acpi_intel_codec codec_type;
 	const char *tplg_filename;
+	const char *tplg_suffix;
 
 	/* Try I2S or DMIC if it is supported */
 	if (interface_mask & (BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC)))
@@ -1701,6 +1725,17 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			tplg_fixup = true;
 		}
 
+		/*
+		 * Checking quirk mask integrity; some quirk flags could not be
+		 * set concurrently.
+		 */
+		if (tplg_fixup &&
+		    check_tplg_quirk_mask(mach)) {
+			dev_err(sdev->dev, "Invalid tplg quirk mask 0x%x\n",
+				mach->tplg_quirk_mask);
+			return NULL;
+		}
+
 		/* report to machine driver if any DMICs are found */
 		mach->mach_params.dmic_num = check_dmic_num(sdev);
 
@@ -1775,6 +1810,52 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			}
 		}
 
+		codec_type = snd_soc_acpi_intel_detect_amp_type(sdev->dev);
+
+		if (tplg_fixup &&
+		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_AMP_NAME &&
+		    codec_type != CODEC_NONE) {
+			tplg_suffix = snd_soc_acpi_intel_get_amp_tplg_suffix(codec_type);
+			if (!tplg_suffix) {
+				dev_err(sdev->dev, "no tplg suffix found, amp %d\n",
+					codec_type);
+				return NULL;
+			}
+
+			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						       "%s-%s",
+						       sof_pdata->tplg_filename,
+						       tplg_suffix);
+			if (!tplg_filename)
+				return NULL;
+
+			sof_pdata->tplg_filename = tplg_filename;
+			add_extension = true;
+		}
+
+		codec_type = snd_soc_acpi_intel_detect_codec_type(sdev->dev);
+
+		if (tplg_fixup &&
+		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME &&
+		    codec_type != CODEC_NONE) {
+			tplg_suffix = snd_soc_acpi_intel_get_codec_tplg_suffix(codec_type);
+			if (!tplg_suffix) {
+				dev_err(sdev->dev, "no tplg suffix found, codec %d\n",
+					codec_type);
+				return NULL;
+			}
+
+			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						       "%s-%s",
+						       sof_pdata->tplg_filename,
+						       tplg_suffix);
+			if (!tplg_filename)
+				return NULL;
+
+			sof_pdata->tplg_filename = tplg_filename;
+			add_extension = true;
+		}
+
 		if (tplg_fixup && add_extension) {
 			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 						       "%s%s",
@@ -1842,3 +1923,4 @@ MODULE_IMPORT_NS(SND_INTEL_SOUNDWIRE_ACPI);
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
+MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_MATCH);
-- 
2.40.1

