Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2C861609
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 16:40:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60EE5BC0;
	Fri, 23 Feb 2024 16:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60EE5BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708702810;
	bh=at4PleEsdofi0W9d0DHq9d3aHLVH9DNyQVTGoGwWLic=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IB0KiA5QCPDTPzWMhwcRvdrQGg6gD354rbGlBfk3VHPlmQlA0gyHEvbYVqB2DqcYE
	 oYb1P/UdNTvjz1OfhpW2/N12XDMvQT2oiHO+DvgVhRgbT6wosMtq5+ShGh9Mu6I85W
	 s7qSWlqOwidaYrG/vKzc7H/wXkBC4o1DAaUtUc30=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D200F805BA; Fri, 23 Feb 2024 16:39:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE2C2F805D4;
	Fri, 23 Feb 2024 16:39:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BD34F8056F; Fri, 23 Feb 2024 16:39:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DA85F80496
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 16:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA85F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XZjyc/Af
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N5xe8x005825;
	Fri, 23 Feb 2024 09:39:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=3z2szSszGyGY76+w1bd3gmMNzvy8vmlvqxcIqwLz1oU=; b=
	XZjyc/Af2fREOUTBwV6wnG0has8/ucQHH4/Dd/d4mpW20JOvHQzLT1olZW/jqv/x
	jKUeI8CmdN1a33AJoNZdpxwfjg7G8HESiXPTu1eQilK9h0IkxcSKE8EZHvDVWIib
	K6lTcLfU45oRysGtLDtoTN+OUo7AlK+TqHsoV42xZuq/Bn2+VeCCjLDDyOMVXyeV
	kLNMMkKrsgIjKw21BHTOlYi+m/wzeMzI2rs5IweAxKp2gXdAmzMEDCoB7s6YS5Ts
	hU0NZwMFfx2OYwPf9UvHKcLB5UOS5OFutPYOdbPWcGQVWPP/R5WujB3ZZTKtfX2o
	8FBDSlGbHXIcq56GILie9w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wd205m5pf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 09:39:12 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 15:39:10 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 23 Feb 2024 15:39:10 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6FF9B820258;
	Fri, 23 Feb 2024 15:39:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH v2 5/6] ALSA: hda: cs35l56: Apply amp calibration from EFI
 data
Date: Fri, 23 Feb 2024 15:39:09 +0000
Message-ID: <20240223153910.2063698-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240223153910.2063698-1-rf@opensource.cirrus.com>
References: <20240223153910.2063698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XPFxklkVkvtGI-zt_bsAP_b0xRbmgSLY
X-Proofpoint-GUID: XPFxklkVkvtGI-zt_bsAP_b0xRbmgSLY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KU7IJAD4BSVYC6MC7NOB2JEMNFFTGL7U
X-Message-ID-Hash: KU7IJAD4BSVYC6MC7NOB2JEMNFFTGL7U
X-MailFrom: prvs=97835e8ec7=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KU7IJAD4BSVYC6MC7NOB2JEMNFFTGL7U/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If there are factory calibration settings in EFI, extract the
settings and write them to the firmware calibration controls.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/Kconfig       |  2 ++
 sound/pci/hda/cs35l56_hda.c | 39 ++++++++++++++++++++++++++++++-------
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 26da739eea82..f806636242ee 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -165,6 +165,7 @@ config SND_HDA_SCODEC_CS35L56_I2C
 	select SND_HDA_SCODEC_CS35L56
 	select SND_HDA_CIRRUS_SCODEC
 	select SND_HDA_CS_DSP_CONTROLS
+	select SND_SOC_CS_AMP_LIB
 	help
 	  Say Y or M here to include CS35L56 amplifier support with
 	  I2C control.
@@ -180,6 +181,7 @@ config SND_HDA_SCODEC_CS35L56_SPI
 	select SND_HDA_SCODEC_CS35L56
 	select SND_HDA_CIRRUS_SCODEC
 	select SND_HDA_CS_DSP_CONTROLS
+	select SND_SOC_CS_AMP_LIB
 	help
 	  Say Y or M here to include CS35L56 amplifier support with
 	  SPI control.
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 75a14ba54fcd..5ad76d6914c3 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -14,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
+#include <sound/cs-amp-lib.h>
 #include <sound/hda_codec.h>
 #include <sound/tlv.h>
 #include "cirrus_scodec.h"
@@ -547,6 +548,22 @@ static void cs35l56_hda_add_dsp_controls(struct cs35l56_hda *cs35l56)
 	hda_cs_dsp_add_controls(&cs35l56->cs_dsp, &info);
 }
 
+static void cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
+{
+	int ret;
+
+	if (!cs35l56->base.cal_data_valid || cs35l56->base.secured)
+		return;
+
+	ret = cs_amp_write_cal_coeffs(&cs35l56->cs_dsp,
+				      &cs35l56_calibration_controls,
+				      &cs35l56->base.cal_data);
+	if (ret < 0)
+		dev_warn(cs35l56->base.dev, "Failed to write calibration: %d\n", ret);
+	else
+		dev_info(cs35l56->base.dev, "Calibration applied\n");
+}
+
 static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 {
 	const struct firmware *coeff_firmware = NULL;
@@ -618,12 +635,8 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (coeff_filename)
 		dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
 
-	if (!firmware_missing) {
-		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
-		if (ret)
-			goto err_powered_up;
-	} else if (wmfw_firmware || coeff_firmware) {
-		/* If we downloaded firmware, reset the device and wait for it to boot */
+	/* If we downloaded firmware, reset the device and wait for it to boot */
+	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
 		cs35l56_system_reset(&cs35l56->base, false);
 		regcache_mark_dirty(cs35l56->base.regmap);
 		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
@@ -646,6 +659,11 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (ret)
 		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
 
+	cs35l56_hda_apply_calibration(cs35l56);
+	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+	if (ret)
+		cs_dsp_stop(&cs35l56->cs_dsp);
+
 err_powered_up:
 	if (!cs35l56->base.fw_patched)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
@@ -953,6 +971,8 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
 		goto err;
 	}
 
+	cs35l56->base.cal_index = cs35l56->index;
+
 	cs35l56_init_cs_dsp(&cs35l56->base, &cs35l56->cs_dsp);
 	cs35l56->cs_dsp.client_ops = &cs35l56_hda_client_ops;
 
@@ -990,6 +1010,10 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
 	if (ret)
 		goto err;
 
+	ret = cs35l56_get_calibration(&cs35l56->base);
+	if (ret)
+		goto err;
+
 	ret = cs_dsp_halo_init(&cs35l56->cs_dsp);
 	if (ret) {
 		dev_err_probe(cs35l56->base.dev, ret, "cs_dsp_halo_init failed\n");
@@ -1064,10 +1088,11 @@ const struct dev_pm_ops cs35l56_hda_pm_ops = {
 EXPORT_SYMBOL_NS_GPL(cs35l56_hda_pm_ops, SND_HDA_SCODEC_CS35L56);
 
 MODULE_DESCRIPTION("CS35L56 HDA Driver");
+MODULE_IMPORT_NS(FW_CS_DSP);
 MODULE_IMPORT_NS(SND_HDA_CIRRUS_SCODEC);
 MODULE_IMPORT_NS(SND_HDA_CS_DSP_CONTROLS);
 MODULE_IMPORT_NS(SND_SOC_CS35L56_SHARED);
+MODULE_IMPORT_NS(SND_SOC_CS_AMP_LIB);
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(FW_CS_DSP);
-- 
2.30.2

