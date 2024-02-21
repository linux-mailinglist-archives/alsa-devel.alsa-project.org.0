Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F92985E087
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:07:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F4F84A;
	Wed, 21 Feb 2024 16:07:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F4F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708528047;
	bh=ezwGTmb0p2OuSkCHLsCPYmiNs24E5alpl0HgPG9YWWg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FVMrz3eMvhmjQNl77kyHhSsCQA/A348Rm+xx6RyGzZxo1TUWSGDrZYx6c3QQMZiZh
	 mc561bal0VFGdKsWEfx9tf5p/fVgVTAx+8GJc8eMLOuslezHu3SQoHgul55oac7qlO
	 6PpWF+AZ2yS3SXjNEKATdcOXlwutlhw6FVsU6Bk0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 986B3F8067F; Wed, 21 Feb 2024 16:05:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64FA9F80638;
	Wed, 21 Feb 2024 16:05:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F123F805FB; Wed, 21 Feb 2024 16:05:36 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 62F57F80567
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F57F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qU7lSW0g
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41LCUQsK011338;
	Wed, 21 Feb 2024 09:05:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=yytQ7GXTVFXWsBrfAM2U1tdjKyAr/L1PFu8PYDeSpuk=; b=
	qU7lSW0gY1I9XSP5MP3iw5+29WbYShFT/gR0Jx2zLyIxmWG36I8qL712wxXZiOF6
	sUD6aUFpMPAhdnlZCJi31w//3bdJmMTRSGQ1EAHok/Iff+q2H2PQhJA33ZMxy0w+
	i9ImqbXMjySKc6bz0FM6tXXrqr00myOBs52ZAp51JgCQGKE43RjXGiHHqwRln2yM
	8csjA+KKjJ824YrhbvrzyMH4ZOj/xqqjPxNWaiF0nrqVY/79rxkL4oHCcYLVYotY
	c6UnQo35vjJ+dmD1tTXipDmVxlccheF3ugp0dNzcLjLDbfU5a5qXQuc4l2GMb5ye
	DcMrzKK+FDaucnRG7V5n8g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wd205h4tk-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 09:05:13 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 15:05:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 21 Feb 2024 15:05:07 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4CC6482025A;
	Wed, 21 Feb 2024 15:05:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 8/9] ALSA: hda: cs35l56: Apply amp calibration from EFI data
Date: Wed, 21 Feb 2024 15:05:06 +0000
Message-ID: <20240221150507.1039979-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240221150507.1039979-1-rf@opensource.cirrus.com>
References: <20240221150507.1039979-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: k2y-l2KGer9iwDt8BYqoie2PBIRRsdIE
X-Proofpoint-GUID: k2y-l2KGer9iwDt8BYqoie2PBIRRsdIE
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QPY4EIR54SAFNR75J2XWA7VPOB57N37X
X-Message-ID-Hash: QPY4EIR54SAFNR75J2XWA7VPOB57N37X
X-MailFrom: prvs=97814b2c7f=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPY4EIR54SAFNR75J2XWA7VPOB57N37X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
 sound/pci/hda/cs35l56_hda.c | 36 ++++++++++++++++++++++++++++++------
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 21a90b3c4cc7..6edfdaf98a74 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -162,6 +162,7 @@ config SND_HDA_SCODEC_CS35L56_I2C
 	select SND_HDA_SCODEC_CS35L56
 	select SND_HDA_CIRRUS_SCODEC
 	select SND_HDA_CS_DSP_CONTROLS
+	select SND_SOC_CS_AMP_LIB
 	help
 	  Say Y or M here to include CS35L56 amplifier support with
 	  I2C control.
@@ -177,6 +178,7 @@ config SND_HDA_SCODEC_CS35L56_SPI
 	select SND_HDA_SCODEC_CS35L56
 	select SND_HDA_CIRRUS_SCODEC
 	select SND_HDA_CS_DSP_CONTROLS
+	select SND_SOC_CS_AMP_LIB
 	help
 	  Say Y or M here to include CS35L56 amplifier support with
 	  SPI control.
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 75a14ba54fcd..47a225114f56 100644
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
+	ret = hda_cs_dsp_write_cal_coeffs(&cs35l56->cs_dsp,
+					  &cs35l56_calibration_controls,
+					  &cs35l56->base.cal_data);
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
-- 
2.30.2

