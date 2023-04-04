Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C186D5BD9
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:25:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C27E83A;
	Tue,  4 Apr 2023 11:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C27E83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600324;
	bh=IQ00o2dQfPckEhQ8RlWoZI5+nINBE9Dr9SlUFI+O/DE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uiRw1WbX+HJAqmkUmBbVNe1i/UWX3FRkz7fG5PLBPBMjH5L2+g3FlFpcN/59jtYyS
	 3q/Br5MyQmIhFW6nIoaCP1pMYVPtWf0nv00AefDClJGwTNWlshs29vHRaVuclqmfde
	 Zw5Cy+GXXml2LQ8ahYyvg/rMfEDBHvQubOTwGvfQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBA6F8053D;
	Tue,  4 Apr 2023 11:23:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC50F80533; Tue,  4 Apr 2023 11:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4C1DF8026D
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C1DF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qx8fbKvw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600053; x=1712136053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IQ00o2dQfPckEhQ8RlWoZI5+nINBE9Dr9SlUFI+O/DE=;
  b=Qx8fbKvwO25SjYycBwk2WsjMEZhDrUkSEXoujJ3dNYbbzqJi9kIgRseo
   UWj6wqFE2ZZ4JpjOtpUkyTxxSm/9otrUuVQ59j4nQqmi6rJSbWUJtMsxr
   5Y3aMIkg/+KPfB7qvdNuyneYAo2B9n404+xFCWd6kqSp+GDlhlt/WxeDq
   59QLTI8QSTOpVhK2XMIKic4vH78Z5+dhiDyyy9ECsY1xxKVEngNRuk+xZ
   r3lIdu0zRrFFn8AY9SOWZIjyLmbdBE8zv7JDcZROc6/6IZQ4v2yUxrzrg
   /HDXb9Yy6Kpq1Lrn4eYtQnA9tPWHBPro4FPpUR8W+QFoUwDPxRyLvRitT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620568"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620568"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688820002"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688820002"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:49 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 04/12] ASoC: SOF: Intel: hda: Skip interfaces not supported on
 a platform
Date: Tue,  4 Apr 2023 12:21:07 +0300
Message-Id: <20230404092115.27949-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SILKH3RNMZ4Q2RPOD5OEYXYPUM5TZ4B6
X-Message-ID-Hash: SILKH3RNMZ4Q2RPOD5OEYXYPUM5TZ4B6
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SILKH3RNMZ4Q2RPOD5OEYXYPUM5TZ4B6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Not all interfaces (SSP/DMIC/HDA/SDW) are available on all platforms.
If the interface is not even supported then there is no point in executing
a probe or query for that interface.

Introduce a simple function (hda_get_interface_mask) to query the
interfaces supported on the platform.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda.c | 50 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 65389c7278e2..19aad4141a78 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -44,6 +44,37 @@
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define HDA_EXT_ROM_STATUS_SIZE 8
 
+static u32 hda_get_interface_mask(struct snd_sof_dev *sdev)
+{
+	const struct sof_intel_dsp_desc *chip;
+	u32 interface_mask = 0;
+
+	chip = get_chip_info(sdev->pdata);
+	switch (chip->hw_ip_version) {
+	case SOF_INTEL_TANGIER:
+	case SOF_INTEL_BAYTRAIL:
+	case SOF_INTEL_BROADWELL:
+		interface_mask = BIT(SOF_DAI_INTEL_SSP);
+		break;
+	case SOF_INTEL_CAVS_1_5:
+	case SOF_INTEL_CAVS_1_5_PLUS:
+		interface_mask = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
+				 BIT(SOF_DAI_INTEL_HDA);
+		break;
+	case SOF_INTEL_CAVS_1_8:
+	case SOF_INTEL_CAVS_2_0:
+	case SOF_INTEL_CAVS_2_5:
+	case SOF_INTEL_ACE_1_0:
+		interface_mask = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
+				 BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
+		break;
+	default:
+		break;
+	}
+
+	return interface_mask;
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
@@ -845,6 +876,7 @@ static int dmic_detect_topology_fixup(struct snd_sof_dev *sdev,
 
 static int hda_init_caps(struct snd_sof_dev *sdev)
 {
+	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	struct sof_intel_hda_dev *hdev = pdata->hw_pdata;
@@ -865,6 +897,10 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 
 	hda_bus_ml_get_capabilities(bus);
 
+	/* Skip SoundWire if it is not supported */
+	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		goto skip_soundwire;
+
 	/* scan SoundWire capabilities exposed by DSDT */
 	ret = hda_sdw_acpi_scan(sdev);
 	if (ret < 0) {
@@ -1486,12 +1522,16 @@ void hda_set_mach_params(struct snd_soc_acpi_mach *mach,
 
 struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 {
+	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
-	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_acpi_mach *mach = NULL;
 	const char *tplg_filename;
 
-	mach = snd_soc_acpi_find_machine(desc->machines);
+	/* Try I2S or DMIC if it is supported */
+	if (interface_mask & (BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC)))
+		mach = snd_soc_acpi_find_machine(desc->machines);
+
 	if (mach) {
 		bool add_extension = false;
 		bool tplg_fixup = false;
@@ -1598,10 +1638,8 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		}
 	}
 
-	/*
-	 * If I2S fails, try SoundWire
-	 */
-	if (!mach)
+	/* If I2S fails, try SoundWire if it is supported */
+	if (!mach && (interface_mask & BIT(SOF_DAI_INTEL_ALH)))
 		mach = hda_sdw_machine_select(sdev);
 
 	/*
-- 
2.40.0

