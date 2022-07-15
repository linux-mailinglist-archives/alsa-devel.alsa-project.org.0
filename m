Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2A5763E4
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B5B1938;
	Fri, 15 Jul 2022 16:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B5B1938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896927;
	bh=cxi2HTTANjMVI/FK+y13QqBb1a5xPeHX0id079YJnXo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuDkJW0b9LV1DiKzFU3S1peNseNJ51WJi8ad0La/ctTXXPOqAsNjsUgREG3uIEZh6
	 BpsvyBeJIpmZwNlxdLLwC5Z423hGFrEN9hnj7JsGfZafWdFAl9p1dz2Dg9mSTB5TAi
	 SBObEovai6idSUYEvu+GfnAiqOibb8RGzAfn1S/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A448F80567;
	Fri, 15 Jul 2022 16:53:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A81EAF80507; Fri, 15 Jul 2022 16:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B211FF800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B211FF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HMWmVKPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896776; x=1689432776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cxi2HTTANjMVI/FK+y13QqBb1a5xPeHX0id079YJnXo=;
 b=HMWmVKPeIJgHAbYAuDxzsGXHDn+6WtAHc3IGvQ9kuCI/vOjKn2ezDk0r
 YEpDSzT7qyscdIb4Pm+clxgLUce3KkDa6BD3rx9WkzS3GWHn0iUNlg9W8
 A0O8r/KU6kAmFweNCQ8QgzYfgm0sj0wBtwGi5daxV1a+NDSGpCbuwtMJK
 30F6bNHy1XNiL6lG1X8bRdQSQAuqWA10hM9AUyRVNshFZ6tTEEC/owc9D
 sLGZDpwPNY8vk4yOB7bgp/ifLu4nQBWPKFs/PD5S/TDHeDFzJ7XoWxjdb
 8CjEXSgJkZQILx/78bfg6D9VEq2NSjEqC+34e+F9/zEzJ3dLNTWKmtvki w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311476917"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="311476917"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:35 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923533128"
Received: from jmurope-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.14.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/11] ASoC: SOF: Intel: hda: only fixup topology name if not
 set already
Date: Fri, 15 Jul 2022 09:52:14 -0500
Message-Id: <20220715145216.277003-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
References: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

We do all kinds of renaming tricks that get in the way of kernel
parameter and DMI quirk overrides at a higher level.

Tested on UpExtreme board with

options snd-sof-pci tplg_filename=sof-hda-generic.tplg

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 70 +++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b702412e2a17..d337d55050e2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -776,13 +776,12 @@ static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 	return tplg_filename;
 }
 
-static int dmic_topology_fixup(struct snd_sof_dev *sdev,
-			       const char **tplg_filename,
-			       const char *idisp_str,
-			       int *dmic_found)
+static int dmic_detect_topology_fixup(struct snd_sof_dev *sdev,
+				      const char **tplg_filename,
+				      const char *idisp_str,
+				      int *dmic_found,
+				      bool tplg_fixup)
 {
-	const char *default_tplg_filename = *tplg_filename;
-	const char *fixed_tplg_filename;
 	const char *dmic_str;
 	int dmic_num;
 
@@ -808,14 +807,19 @@ static int dmic_topology_fixup(struct snd_sof_dev *sdev,
 		break;
 	}
 
-	fixed_tplg_filename = fixup_tplg_name(sdev, default_tplg_filename,
-					      idisp_str, dmic_str);
-	if (!fixed_tplg_filename)
-		return -ENOMEM;
+	if (tplg_fixup) {
+		const char *default_tplg_filename = *tplg_filename;
+		const char *fixed_tplg_filename;
+
+		fixed_tplg_filename = fixup_tplg_name(sdev, default_tplg_filename,
+						      idisp_str, dmic_str);
+		if (!fixed_tplg_filename)
+			return -ENOMEM;
+		*tplg_filename = fixed_tplg_filename;
+	}
 
 	dev_info(sdev->dev, "DMICs detected in NHLT tables: %d\n", dmic_num);
 	*dmic_found = dmic_num;
-	*tplg_filename = fixed_tplg_filename;
 
 	return 0;
 }
@@ -1221,6 +1225,8 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 		 *  - one external HDAudio codec
 		 */
 		if (!*mach && codec_num <= 2) {
+			bool tplg_fixup;
+
 			hda_mach = snd_soc_acpi_intel_hda_machines;
 
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
@@ -1232,8 +1238,15 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 				idisp_str = "";
 
 			/* topology: use the info from hda_machines */
-			tplg_filename = hda_mach->sof_tplg_filename;
-			ret = dmic_topology_fixup(sdev, &tplg_filename, idisp_str, &dmic_num);
+			if (pdata->tplg_filename) {
+				tplg_fixup = false;
+				tplg_filename = pdata->tplg_filename;
+			} else {
+				tplg_fixup = true;
+				tplg_filename = hda_mach->sof_tplg_filename;
+			}
+			ret = dmic_detect_topology_fixup(sdev, &tplg_filename, idisp_str, &dmic_num,
+							 tplg_fixup);
 			if (ret < 0)
 				return;
 
@@ -1397,11 +1410,19 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 		}
 		if (mach && mach->link_mask) {
 			int dmic_num = 0;
+			bool tplg_fixup;
+			const char *tplg_filename;
 
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
 			mach->mach_params.platform = dev_name(sdev->dev);
-			pdata->tplg_filename = mach->sof_tplg_filename;
+
+			if (pdata->tplg_filename) {
+				tplg_fixup = false;
+			} else {
+				tplg_fixup = true;
+				tplg_filename = mach->sof_tplg_filename;
+			}
 
 			/*
 			 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
@@ -1411,15 +1432,15 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 			 * b) the NHLT table reports the presence of microphones
 			 */
 			if (hweight_long(mach->link_mask) <= 2) {
-				const char *tplg_filename = mach->sof_tplg_filename;
 				int ret;
 
-				ret = dmic_topology_fixup(sdev, &tplg_filename, "", &dmic_num);
+				ret = dmic_detect_topology_fixup(sdev, &tplg_filename, "",
+								 &dmic_num, tplg_fixup);
 				if (ret < 0)
 					return NULL;
-
-				pdata->tplg_filename = tplg_filename;
 			}
+			if (tplg_fixup)
+				pdata->tplg_filename = tplg_filename;
 			mach->mach_params.dmic_num = dmic_num;
 
 			dev_dbg(sdev->dev,
@@ -1465,18 +1486,22 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	mach = snd_soc_acpi_find_machine(desc->machines);
 	if (mach) {
 		bool add_extension = false;
+		bool tplg_fixup = false;
 
 		/*
 		 * If tplg file name is overridden, use it instead of
 		 * the one set in mach table
 		 */
-		if (!sof_pdata->tplg_filename)
+		if (!sof_pdata->tplg_filename) {
 			sof_pdata->tplg_filename = mach->sof_tplg_filename;
+			tplg_fixup = true;
+		}
 
 		/* report to machine driver if any DMICs are found */
 		mach->mach_params.dmic_num = check_dmic_num(sdev);
 
-		if (mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER &&
+		if (tplg_fixup &&
+		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER &&
 		    mach->mach_params.dmic_num) {
 			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 						       "%s%s%d%s",
@@ -1499,7 +1524,8 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		/* report SSP link mask to machine driver */
 		mach->mach_params.i2s_link_mask = check_nhlt_ssp_mask(sdev);
 
-		if (mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER &&
+		if (tplg_fixup &&
+		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER &&
 		    mach->mach_params.i2s_link_mask) {
 			int ssp_num;
 
@@ -1522,7 +1548,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			add_extension = true;
 		}
 
-		if (add_extension) {
+		if (tplg_fixup && add_extension) {
 			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 						       "%s%s",
 						       sof_pdata->tplg_filename,
-- 
2.34.1

