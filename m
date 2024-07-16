Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05182932228
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2024 10:45:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32B67847;
	Tue, 16 Jul 2024 10:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32B67847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721119516;
	bh=JsYVBSqNJXb2eN7XVFd49oK43QNpzg06jT/gd82/Sek=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Y7Nr2AJeXKaOp7CwDVMmfwxCnSOd3ZzGmuzcBj3pDHJe1CO/GxoV7eH4g4wq4vQI5
	 Hk/FaNqQlM+V37CYHJhaF6shihVEU6DY7Z3ZWBCGXOqCBo8tZXjGwB3Ahbw6Gq/tpE
	 BLIwYVIhaMQVpdv4WCKLF/i9Tb/l0+oPmoWpma3Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28C85F80528; Tue, 16 Jul 2024 10:44:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52293F805AF;
	Tue, 16 Jul 2024 10:44:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89586F8026D; Tue, 16 Jul 2024 10:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94C20F8007E
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 10:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94C20F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IkE1h69Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721119235; x=1752655235;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JsYVBSqNJXb2eN7XVFd49oK43QNpzg06jT/gd82/Sek=;
  b=IkE1h69ZuHv/8zR9dMxufmOsXBmZc5JuNTLPV7X3IeIqH5r8MIvMD+FO
   U+312xt7KkKz1CcYBfTeUWT9GNyP4ufhttvfE8kkxRhoBrei8hBsXJHO8
   96RDmF4Bt5PAbSuxgsBMBhkaqZ6intXY1U+yx9oFrf1e59Qpcok86XNsk
   dtoW8Nxwf0xr84JPlqyEPDbe3krg7gIPXRKsLPZgwAK9vjI+UfdaHqcrs
   7IetBC18s1r7stHjUqVc2cQWb4K4PHW9xJD4xpPtr5axZJXLEq38KqQ4v
   YJNCmB+Yh856MJyKaL/pZvVANfaefRB4VvI4vvkKjPVXeC/cKKdOAKVdu
   Q==;
X-CSE-ConnectionGUID: ujl2kTB/Tji5n44JXLmx+Q==
X-CSE-MsgGUID: F63FURjQRCCr65hwsJBawg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18490425"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800";
   d="scan'208";a="18490425"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 01:40:29 -0700
X-CSE-ConnectionGUID: qbor9/xXTym7nDwLh98bBA==
X-CSE-MsgGUID: q6BdUxXVQWqBwYorVa1H1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800";
   d="scan'208";a="49682065"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.211])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 01:40:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Curtis Malainey <cujomalainey@chromium.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: Intel: Fix RT5650 SSP lookup
Date: Tue, 16 Jul 2024 10:40:12 +0200
Message-ID: <20240716084012.299257-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DP64IHPLIFCFTXL6VCBLBHIUA4XEMLCM
X-Message-ID-Hash: DP64IHPLIFCFTXL6VCBLBHIUA4XEMLCM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DP64IHPLIFCFTXL6VCBLBHIUA4XEMLCM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Commit 8efcd4864652 ("ASoC: Intel: sof_rt5682: use common module for
sof_card_private initialization") migrated the pin assignment in the
context struct up to soc-acpi-intel-ssp-common.c. This uses a lookup
table to see if a device has a amp/codec before assigning the pin. The
issue here arises when combination parts that serve both (with 2 ports)
are used.

sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.3/adl_rt5682_def/SSP0-Codec'
CPU: 1 PID: 2079 Comm: udevd Tainted: G     U             6.6.36-03391-g744739e00023 #1 3be1a2880a0970f65545a957db7d08ef4b3e2c0d
Hardware name: Google Anraggar/Anraggar, BIOS Google_Anraggar.15217.552.0 05/07/2024
Call Trace:
 <TASK>
 dump_stack_lvl+0x69/0xa0
 sysfs_warn_dup+0x5b/0x70
 sysfs_create_dir_ns+0xb0/0x100
 kobject_add_internal+0x133/0x3c0
 kobject_add+0x66/0xb0
 ? device_add+0x65/0x780
 device_add+0x164/0x780
 snd_soc_add_pcm_runtimes+0x2fa/0x800
 snd_soc_bind_card+0x35e/0xc20
 devm_snd_soc_register_card+0x48/0x90
 platform_probe+0x7b/0xb0
 really_probe+0xf7/0x2a0
 ...
kobject: kobject_add_internal failed for SSP0-Codec with -EEXIST, don't try to register things with the same name in the same directory.

The issue is that the ALC5650 was only defined in the codec table and
not the amp table which left the pin unassigned but the dai link was
still created by the machine driver.

Also patch the suffix filename code for the topology to prevent double
suffix names as a result of this change.

Fixes: 8efcd4864652 ("ASoC: Intel: sof_rt5682: use common module for sof_card_private initialization")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ssp-common.c  |  9 ++++
 sound/soc/sof/intel/hda.c                     | 49 ++++++++++---------
 2 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 75d0b931d895..de7a3f7f47f1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -64,6 +64,15 @@ static const struct codec_map amps[] = {
 	CODEC_MAP_ENTRY("RT1015P", "rt1015", RT1015P_ACPI_HID, CODEC_RT1015P),
 	CODEC_MAP_ENTRY("RT1019P", "rt1019", RT1019P_ACPI_HID, CODEC_RT1019P),
 	CODEC_MAP_ENTRY("RT1308", "rt1308", RT1308_ACPI_HID, CODEC_RT1308),
+
+	/*
+	 * Monolithic components
+	 *
+	 * Only put components that can serve as both the amp and the codec below this line.
+	 * This will ensure that if the part is used just as a codec and there is an amp as well
+	 * then the amp will be selected properly.
+	 */
+	CODEC_MAP_ENTRY("RT5650", "rt5650", RT5650_ACPI_HID, CODEC_RT5650),
 };
 
 enum snd_soc_acpi_intel_codec
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index daf364f773dd..5a40b8fbbbd3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1307,9 +1307,10 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	const struct sof_dev_desc *desc = sof_pdata->desc;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_soc_acpi_mach *mach = NULL;
-	enum snd_soc_acpi_intel_codec codec_type;
+	enum snd_soc_acpi_intel_codec codec_type, amp_type;
 	const char *tplg_filename;
 	const char *tplg_suffix;
+	bool amp_name_valid;
 
 	/* Try I2S or DMIC if it is supported */
 	if (interface_mask & (BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC)))
@@ -1413,30 +1414,30 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			}
 		}
 
-		codec_type = snd_soc_acpi_intel_detect_amp_type(sdev->dev);
-
-		if (tplg_fixup &&
-		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_AMP_NAME &&
-		    codec_type != CODEC_NONE) {
-			tplg_suffix = snd_soc_acpi_intel_get_amp_tplg_suffix(codec_type);
-			if (!tplg_suffix) {
-				dev_err(sdev->dev, "no tplg suffix found, amp %d\n",
-					codec_type);
-				return NULL;
-			}
-
-			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
-						       "%s-%s",
-						       sof_pdata->tplg_filename,
-						       tplg_suffix);
-			if (!tplg_filename)
-				return NULL;
-
-			sof_pdata->tplg_filename = tplg_filename;
-			add_extension = true;
-		}
-
+		amp_type = snd_soc_acpi_intel_detect_amp_type(sdev->dev);
 		codec_type = snd_soc_acpi_intel_detect_codec_type(sdev->dev);
+		amp_name_valid = amp_type != CODEC_NONE && amp_type != codec_type;
+
+		if (tplg_fixup && amp_name_valid &&
+		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_AMP_NAME) {
+			tplg_suffix = snd_soc_acpi_intel_get_amp_tplg_suffix(amp_type);
+			if (!tplg_suffix) {
+				dev_err(sdev->dev, "no tplg suffix found, amp %d\n",
+					amp_type);
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
 
 		if (tplg_fixup &&
 		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME &&
-- 
2.43.0

