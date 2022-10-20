Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC2A605FDF
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A3A2639A;
	Thu, 20 Oct 2022 14:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A3A2639A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268076;
	bh=Cbsm4rCNiVKBRKIvYJD7bJ0wCpKcwJ0A4ciloFo1a8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gbhwQvptu11spIAfuAii96fxxL2WrOGzd4dAkLEWe6giraY9ZQ00Qdk/qDEcBHxsK
	 +8dDnZTAMENATELcR3wrG79ayII6l2ChsLPKwut6S1uml9txmwf5sl/1KookcowDby
	 w2FrYKgxXT5MeHGwAd+eepfxIOcbVJ0SuNosptVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB333F80567;
	Thu, 20 Oct 2022 14:12:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBFBDF80557; Thu, 20 Oct 2022 14:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 598EBF8054A
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 598EBF8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D9n3GaE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267951; x=1697803951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cbsm4rCNiVKBRKIvYJD7bJ0wCpKcwJ0A4ciloFo1a8Y=;
 b=D9n3GaE1HZePEIyvpFCUFe7pak4yD0jQyNUVFIwZwJpRNZ9IG5p6rS2k
 w6l6Z3eRFO7WwEa4ASNAoEUVkYDXnJxm4kiUOk20kJ07UJNq0JtURX5Lb
 mLgeLEGPImWkt8sMxQFxmYP8h61ZmPMuw0PTggiiuCusD9lfCJJqQjD2M
 4becyayyUKieHQga/3r3YRn/1gukL/cazlflen2AKMa01eGAqFfmcEccH
 eauxV82FRzqSX6AjTJRXGMH2ag3Uv8p6rpNj+9gHNwsMOsE39n8YqK88I
 8cg8aIGqlCdBgXbtz4JBN29oXLRHVhQAdmH05jQgfCI33XwyGlN0QGef8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256306"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256306"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663009901"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663009901"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 04/19] ASoC: SOF: Intel: hda-loader: Use the basefw
 firmware container directly
Date: Thu, 20 Oct 2022 15:12:23 +0300
Message-Id: <20221020121238.18339-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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

Switch to access to the firmware struct via sdev->basefw container to
unblock the removal of the firmware information from plat_data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 98812d51b31c..147ddc5ee932 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -318,7 +318,6 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 
 int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_pdata *plat_data = sdev->pdata;
 	struct hdac_ext_stream *iccmax_stream;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct firmware stripped_firmware;
@@ -329,12 +328,12 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	/* save the original LTRP guardband value */
 	original_gb = snd_hdac_chip_readb(bus, VS_LTRP) & HDA_VS_INTEL_LTRP_GB_MASK;
 
-	if (plat_data->fw->size <= plat_data->fw_offset) {
+	if (sdev->basefw.fw->size <= sdev->basefw.payload_offset) {
 		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
 		return -EINVAL;
 	}
 
-	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
+	stripped_firmware.size = sdev->basefw.fw->size - sdev->basefw.payload_offset;
 
 	/* prepare capture stream for ICCMAX */
 	iccmax_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
@@ -405,13 +404,13 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 
 	chip_info = desc->chip_info;
 
-	if (plat_data->fw->size <= plat_data->fw_offset) {
+	if (sdev->basefw.fw->size <= sdev->basefw.payload_offset) {
 		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
 		return -EINVAL;
 	}
 
-	stripped_firmware.data = plat_data->fw->data + plat_data->fw_offset;
-	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
+	stripped_firmware.data = sdev->basefw.fw->data + sdev->basefw.payload_offset;
+	stripped_firmware.size = sdev->basefw.fw->size - sdev->basefw.payload_offset;
 
 	/* init for booting wait */
 	init_waitqueue_head(&sdev->boot_wait);
-- 
2.38.1

