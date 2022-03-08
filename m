Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADAA4D2176
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:29:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B7C189A;
	Tue,  8 Mar 2022 20:28:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B7C189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767785;
	bh=DSwnvYylFpt6OjgGrsNGm5Y7gxtMzOIQAeKa18Oi+GE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J05n55P6/jm5RARENK59EAZTQHqhdgkCMCQJruxSAxwFDpYAW6/tWnKAYPj2B2Gr1
	 Mlb9Vx4NZOZraM21x2ozLWtm7WicHnHD13SJ37dM9ZYDfs563y4eia+vog6wwwbyQR
	 6sD/2ztSuABNHG2W2NhPt8PEc/H3a5W4Om3VJAh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6240F8053C;
	Tue,  8 Mar 2022 20:26:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92C20F8052E; Tue,  8 Mar 2022 20:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 903FDF80279
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 903FDF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AotMZIyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767606; x=1678303606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DSwnvYylFpt6OjgGrsNGm5Y7gxtMzOIQAeKa18Oi+GE=;
 b=AotMZIyYDmMLycjPr1dX0FPvhoCHfdBaL00ZT1bYobEY+LRHxe+zEXCP
 hV3HgC0DcdYpjdC8LXN0GKGSYOKe34pyJXyMO/SMG6Nny5oPtw3OVPvOX
 LAAbVGfZBJSWUqe0eBEc42zBGOUaPvOX4iZqaJxS6cCJiOHvJTtpKqioF
 BvyS/eawLhPFsh1MPeO+bMk20jXB28VVXLLYPWZe+9++HLv9bMDcxXOx4
 mYJHgyFLz9LQsTC+mt99f3SYH4EWsVXD2Ojr7LnC1tLYRiUS2irDD6XCY
 q3Vnb3kpBOvYBwbt0jLqgM9xP3daKLlquSwFxh3dcquic19oXC2RPK4ei w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363694"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363694"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573950"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/20] ASoC: Intel: soc-acpi: quirk topology filename
 dynamically
Date: Tue,  8 Mar 2022 13:25:56 -0600
Message-Id: <20220308192610.392950-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Different topology filenames may be required depending on which SSP is
used, and whether or not digital mics are present.

This patch adds a tplg_quirk_mask and in the case of the SOF driver
adds the relevant configurations.

This is a short-term solution to the ES8336 support issues.

In a long-term solution, we would need an interface where the machine
driver or platform driver have the ability to alter the topology
hard-coded low-level hardware support, e.g. by substituting an
interface for another, or disabling an interface that is not supported
on a given skew.

BugLink: https://github.com/thesofproject/linux/issues/3248
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/soc-acpi.h                      | 20 +++++++
 .../intel/common/soc-acpi-intel-bxt-match.c   |  5 +-
 .../intel/common/soc-acpi-intel-cml-match.c   |  5 +-
 .../intel/common/soc-acpi-intel-glk-match.c   |  5 +-
 .../intel/common/soc-acpi-intel-jsl-match.c   |  5 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |  5 +-
 sound/soc/sof/intel/hda.c                     | 52 +++++++++++++++++++
 7 files changed, 92 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 093bbe7f0e1f..d33cf8df14b1 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -125,6 +125,24 @@ struct snd_soc_acpi_link_adr {
 	const struct snd_soc_acpi_adr_device *adr_d;
 };
 
+/*
+ * when set the topology uses the -ssp<N> suffix, where N is determined based on
+ * BIOS or DMI information
+ */
+#define SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER BIT(0)
+
+/*
+ * when more than one SSP is reported in the link mask, use the most significant.
+ * This choice was found to be valid on platforms with ES8336 codecs.
+ */
+#define SND_SOC_ACPI_TPLG_INTEL_SSP_MSB BIT(1)
+
+/*
+ * when set the topology uses the -dmic<N>ch suffix, where N is determined based on
+ * BIOS or DMI information
+ */
+#define SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER BIT(2)
+
 /**
  * snd_soc_acpi_mach: ACPI-based machine descriptor. Most of the fields are
  * related to the hardware, except for the firmware and topology file names.
@@ -146,6 +164,7 @@ struct snd_soc_acpi_link_adr {
  * @pdata: intended for platform data or machine specific-ops. This structure
  *  is not constant since this field may be updated at run-time
  * @sof_tplg_filename: Sound Open Firmware topology file name, if enabled
+ * @tplg_quirk_mask: quirks to select different topology files dynamically
  */
 /* Descriptor for SST ASoC machine driver */
 struct snd_soc_acpi_mach {
@@ -161,6 +180,7 @@ struct snd_soc_acpi_mach {
 	void *pdata;
 	struct snd_soc_acpi_mach_params mach_params;
 	const char *sof_tplg_filename;
+	const u32 tplg_quirk_mask;
 };
 
 #define SND_SOC_ACPI_MAX_CODECS 3
diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
index 718947068956..0a2d0874dc4f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
@@ -80,7 +80,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[] = {
 	{
 		.id = "ESSX8336",
 		.drv_name = "sof-essx8336",
-		.sof_tplg_filename = "sof-apl-es8336.tplg",
+		.sof_tplg_filename = "sof-apl-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
 	{},
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index d033474f8768..f75fa1b551d7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -78,7 +78,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	{
 		.id = "ESSX8336",
 		.drv_name = "sof-essx8336",
-		.sof_tplg_filename = "sof-cml-es8336.tplg",
+		.sof_tplg_filename = "sof-cml-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
 	{},
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index c5ca077c7ac9..d494860b8190 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -55,7 +55,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 	{
 		.id = "ESSX8336",
 		.drv_name = "sof-essx8336",
-		.sof_tplg_filename = "sof-glk-es8336.tplg",
+		.sof_tplg_filename = "sof-glk-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
 	{},
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index a2da5cad520c..53c42a4e1694 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -83,7 +83,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	{
 		.id = "ESSX8336",
 		.drv_name = "sof-essx8336",
-		.sof_tplg_filename = "sof-jsl-es8336.tplg",
+		.sof_tplg_filename = "sof-jsl-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
 	{},
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 224b54d35c7a..8bf14295deb0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -393,7 +393,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 	{
 		.id = "ESSX8336",
 		.drv_name = "sof-essx8336",
-		.sof_tplg_filename = "sof-tgl-es8336.tplg",
+		.sof_tplg_filename = "sof-tgl-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
 	{
 		.id = "10EC1308",
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index eebb3b318d79..07d8686632a5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1393,9 +1393,12 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
 	struct snd_soc_acpi_mach *mach;
+	const char *tplg_filename;
 
 	mach = snd_soc_acpi_find_machine(desc->machines);
 	if (mach) {
+		bool add_extension = false;
+
 		/*
 		 * If tplg file name is overridden, use it instead of
 		 * the one set in mach table
@@ -1406,6 +1409,21 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		/* report to machine driver if any DMICs are found */
 		mach->mach_params.dmic_num = check_dmic_num(sdev);
 
+		if (mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER &&
+		    mach->mach_params.dmic_num) {
+			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						       "%s%s%d%s",
+						       sof_pdata->tplg_filename,
+						       "-dmic",
+						       mach->mach_params.dmic_num,
+						       "ch");
+			if (!tplg_filename)
+				return NULL;
+
+			sof_pdata->tplg_filename = tplg_filename;
+			add_extension = true;
+		}
+
 		if (mach->link_mask) {
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
@@ -1413,6 +1431,40 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 
 		/* report SSP link mask to machine driver */
 		mach->mach_params.i2s_link_mask = check_nhlt_ssp_mask(sdev);
+
+		if (mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER &&
+		    mach->mach_params.i2s_link_mask) {
+			int ssp_num;
+
+			if (hweight_long(mach->mach_params.i2s_link_mask) > 1 &&
+			    !(mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_MSB))
+				dev_warn(sdev->dev, "More than one SSP exposed by NHLT, choosing MSB\n");
+
+			/* fls returns 1-based results, SSPs indices are 0-based */
+			ssp_num = fls(mach->mach_params.i2s_link_mask) - 1;
+
+			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						       "%s%s%d",
+						       sof_pdata->tplg_filename,
+						       "-ssp",
+						       ssp_num);
+			if (!tplg_filename)
+				return NULL;
+
+			sof_pdata->tplg_filename = tplg_filename;
+			add_extension = true;
+		}
+
+		if (add_extension) {
+			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						       "%s%s",
+						       sof_pdata->tplg_filename,
+						       ".tplg");
+			if (!tplg_filename)
+				return NULL;
+
+			sof_pdata->tplg_filename = tplg_filename;
+		}
 	}
 
 	/*
-- 
2.30.2

