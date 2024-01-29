Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBFB840B91
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:33:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F73E0D;
	Mon, 29 Jan 2024 17:33:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F73E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706546023;
	bh=NRMDvD0vxNRKgxlLOSzmn2dpNThkxXHVbWIuGruXu50=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E8x69APm5q4o17pY177X4VZ+xt6VwEN6tzOTBoVMEn25R49wt0PJc/ppvUpCjY8aS
	 uSw6DM7Giz7K4kKaPsMm1sRVq3Np9CAbyzKAISLB4Iec971JuirdihCoaSkhCSNi+s
	 Jz/a34wNqZq1AukC3bTsN+D8knx/trGOcUgyxAVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B19CF89622; Mon, 29 Jan 2024 17:29:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56F71F89629;
	Mon, 29 Jan 2024 17:29:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 884D3F80751; Mon, 29 Jan 2024 17:28:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 03DF3F8057C
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DF3F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mljppLpM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0Q006968;
	Mon, 29 Jan 2024 10:27:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=37MSW/hy78o0kYtBqlPxexCVPEI0hgAN0u/sgJLzdzA=; b=
	mljppLpMe2oGPVBd1G9Zwm7npTdx2eM51yNBZV9VR0eZWqebVd/IlJ2RnqplmA7w
	T2tuXIVr1AOvbLb4lP7FD2guiVU2hEAo3vlMOjXzfBBWRl6Q5fH0sQi3NemWKby1
	edmlokIIc1xnfJZrGVPrCA/Env6Q4Q45QAEmTAYdTErmkr5gpVV9IwkMagl1SG2l
	yR8LlSGbCsxAJjSpE/QnPbjqZtABmeIVhaPqv9l4A1b3nk7YVRw0MTeWDyN0bOqw
	GK6Bzs0V2XHov/wbRl4tNbAD2BSztRYbd05p/njXUR8nAnqyI8E3huUnulZv0+sc
	D7Zz3OSM2+9K/ku6lYJJaw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8p-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:59 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:47 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:47 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 42D22820271;
	Mon, 29 Jan 2024 16:27:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 17/18] ALSA: hda: cs35l56: Firmware file must match the
 version of preloaded firmware
Date: Mon, 29 Jan 2024 16:27:36 +0000
Message-ID: <20240129162737.497-18-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VHTzq7MtSKGxv8kCFVaBYqlhqM2wXgMp
X-Proofpoint-GUID: VHTzq7MtSKGxv8kCFVaBYqlhqM2wXgMp
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BQGEXDBB5EXQMQ3SGBBQQODSB5AAFMDG
X-Message-ID-Hash: BQGEXDBB5EXQMQ3SGBBQQODSB5AAFMDG
X-MailFrom: prvs=97580788b4=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQGEXDBB5EXQMQ3SGBBQQODSB5AAFMDG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Check whether the firmware is already patched. If so, include the
firmware version in the firmware file name.

If the firmware has already been patched by the BIOS the driver
can only replace it if it has control of hard RESET.

If the driver cannot replace the firmware, it can still load a wmfw
(for ALSA control definitions) and/or a bin (for additional tunings).
But these must match the version of firmware that is running on the
CS35L56.

The firmware is pre-patched if either:
 - FIRMWARE_MISSING == 0, or
 - it is a secured CS35L56 (which implies that is was already patched),

cs35l56_hw_init() will set preloaded_fw_ver to the (non-zero)
firmware version if either of these conditions is true.

Normal (unpatched or replaceable firmware):
   cs35l56-rev-dsp1-misc[-system_name].[wmfw|bin]

Preloaded firmware:
   cs35l56-rev[-s]-VVVVVV-dsp1-misc[-system_name].[wmfw|bin]

Where:
   [-s] is an optional -s added into the name for a secured CS35L56
   VVVVVV is the 24-bit firmware version in hexadecimal.

Backport note:
This won't apply to kernel versions older than v6.6.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda.c | 95 +++++++++++++++++++------------------
 1 file changed, 50 insertions(+), 45 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 081479f65fe7..32736d3e45ba 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -397,7 +397,7 @@ static const struct cs_dsp_client_ops cs35l56_hda_client_ops = {
 
 static int cs35l56_hda_request_firmware_file(struct cs35l56_hda *cs35l56,
 					     const struct firmware **firmware, char **filename,
-					     const char *dir, const char *system_name,
+					     const char *base_name, const char *system_name,
 					     const char *amp_name,
 					     const char *filetype)
 {
@@ -405,20 +405,13 @@ static int cs35l56_hda_request_firmware_file(struct cs35l56_hda *cs35l56,
 	int ret = 0;
 
 	if (system_name && amp_name)
-		*filename = kasprintf(GFP_KERNEL, "%scs35l56-%02x%s-dsp1-misc-%s-%s.%s", dir,
-				      cs35l56->base.rev,
-				      cs35l56->base.secured ? "-s" : "",
+		*filename = kasprintf(GFP_KERNEL, "%s-%s-%s.%s", base_name,
 				      system_name, amp_name, filetype);
 	else if (system_name)
-		*filename = kasprintf(GFP_KERNEL, "%scs35l56-%02x%s-dsp1-misc-%s.%s", dir,
-				      cs35l56->base.rev,
-				      cs35l56->base.secured ? "-s" : "",
+		*filename = kasprintf(GFP_KERNEL, "%s-%s.%s", base_name,
 				      system_name, filetype);
 	else
-		*filename = kasprintf(GFP_KERNEL, "%scs35l56-%02x%s-dsp1-misc.%s", dir,
-				      cs35l56->base.rev,
-				      cs35l56->base.secured ? "-s" : "",
-				      filetype);
+		*filename = kasprintf(GFP_KERNEL, "%s.%s", base_name, filetype);
 
 	if (!*filename)
 		return -ENOMEM;
@@ -451,8 +444,8 @@ static int cs35l56_hda_request_firmware_file(struct cs35l56_hda *cs35l56,
 	return 0;
 }
 
-static const char cirrus_dir[] = "cirrus/";
 static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
+					       unsigned int preloaded_fw_ver,
 					       const struct firmware **wmfw_firmware,
 					       char **wmfw_filename,
 					       const struct firmware **coeff_firmware,
@@ -460,29 +453,43 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
 {
 	const char *system_name = cs35l56->system_name;
 	const char *amp_name = cs35l56->amp_name;
+	char base_name[37];
 	int ret;
 
+	if (preloaded_fw_ver) {
+		snprintf(base_name, sizeof(base_name),
+			 "cirrus/cs35l56-%02x%s-%06x-dsp1-misc",
+			 cs35l56->base.rev,
+			 cs35l56->base.secured ? "-s" : "",
+			 preloaded_fw_ver & 0xffffff);
+	} else {
+		snprintf(base_name, sizeof(base_name),
+			 "cirrus/cs35l56-%02x%s-dsp1-misc",
+			 cs35l56->base.rev,
+			 cs35l56->base.secured ? "-s" : "");
+	}
+
 	if (system_name && amp_name) {
 		if (!cs35l56_hda_request_firmware_file(cs35l56, wmfw_firmware, wmfw_filename,
-						       cirrus_dir, system_name, amp_name, "wmfw")) {
+						       base_name, system_name, amp_name, "wmfw")) {
 			cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
-							  cirrus_dir, system_name, amp_name, "bin");
+							  base_name, system_name, amp_name, "bin");
 			return;
 		}
 	}
 
 	if (system_name) {
 		if (!cs35l56_hda_request_firmware_file(cs35l56, wmfw_firmware, wmfw_filename,
-						       cirrus_dir, system_name, NULL, "wmfw")) {
+						       base_name, system_name, NULL, "wmfw")) {
 			if (amp_name)
 				cs35l56_hda_request_firmware_file(cs35l56,
 								  coeff_firmware, coeff_filename,
-								  cirrus_dir, system_name,
+								  base_name, system_name,
 								  amp_name, "bin");
 			if (!*coeff_firmware)
 				cs35l56_hda_request_firmware_file(cs35l56,
 								  coeff_firmware, coeff_filename,
-								  cirrus_dir, system_name,
+								  base_name, system_name,
 								  NULL, "bin");
 			return;
 		}
@@ -493,26 +500,26 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
 		 */
 		if (amp_name)
 			cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
-							  cirrus_dir, system_name, amp_name, "bin");
+							  base_name, system_name, amp_name, "bin");
 		if (!*coeff_firmware)
 			cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
-							  cirrus_dir, system_name, NULL, "bin");
+							  base_name, system_name, NULL, "bin");
 
 		if (*coeff_firmware)
 			return;
 	}
 
 	ret = cs35l56_hda_request_firmware_file(cs35l56, wmfw_firmware, wmfw_filename,
-						cirrus_dir, NULL, NULL, "wmfw");
+						base_name, NULL, NULL, "wmfw");
 	if (!ret) {
 		cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
-						  cirrus_dir, NULL, NULL, "bin");
+						  base_name, NULL, NULL, "bin");
 		return;
 	}
 
 	if (!*coeff_firmware)
 		cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
-						  cirrus_dir, NULL, NULL, "bin");
+						  base_name, NULL, NULL, "bin");
 }
 
 static void cs35l56_hda_release_firmware_files(const struct firmware *wmfw_firmware,
@@ -546,7 +553,8 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	const struct firmware *wmfw_firmware = NULL;
 	char *coeff_filename = NULL;
 	char *wmfw_filename = NULL;
-	unsigned int firmware_missing;
+	unsigned int preloaded_fw_ver;
+	bool firmware_missing;
 	int ret = 0;
 
 	/* Prepare for a new DSP power-up */
@@ -557,24 +565,21 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 
 	pm_runtime_get_sync(cs35l56->base.dev);
 
-	ret = regmap_read(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS, &firmware_missing);
-	if (ret) {
-		dev_err(cs35l56->base.dev, "Failed to read PROTECTION_STATUS: %d\n", ret);
-		goto err_pm_put;
-	}
-
-	firmware_missing &= CS35L56_FIRMWARE_MISSING;
-
 	/*
-	 * Firmware can only be downloaded if the CS35L56 is secured or is
-	 * running from the built-in ROM. If it is secured the BIOS will have
-	 * downloaded firmware, and the wmfw/bin files will only contain
-	 * tunings that are safe to download with the firmware running.
+	 * The firmware can only be upgraded if it is currently running
+	 * from the built-in ROM. If not, the wmfw/bin must be for the
+	 * version of firmware that is running on the chip.
 	 */
-	if (cs35l56->base.secured || firmware_missing) {
-		cs35l56_hda_request_firmware_files(cs35l56, &wmfw_firmware, &wmfw_filename,
-						   &coeff_firmware, &coeff_filename);
-	}
+	ret = cs35l56_read_prot_status(&cs35l56->base, &firmware_missing, &preloaded_fw_ver);
+	if (ret)
+		goto err_pm_put;
+
+	if (firmware_missing)
+		preloaded_fw_ver = 0;
+
+	cs35l56_hda_request_firmware_files(cs35l56, preloaded_fw_ver,
+					   &wmfw_firmware, &wmfw_filename,
+					   &coeff_firmware, &coeff_filename);
 
 	/*
 	 * If the BIOS didn't patch the firmware a bin file is mandatory to
@@ -589,12 +594,12 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	mutex_lock(&cs35l56->base.irq_lock);
 
 	/*
-	 * When the device is running in secure mode the firmware files can
-	 * only contain insecure tunings and therefore we do not need to
-	 * shutdown the firmware to apply them and can use the lower cost
-	 * reinit sequence instead.
+	 * If the firmware hasn't been patched it must be shutdown before
+	 * doing a full patch and reset afterwards. If it is already
+	 * running a patched version the firmware files only contain
+	 * tunings and we can use the lower cost reinit sequence instead.
 	 */
-	if (!cs35l56->base.secured && (wmfw_firmware || coeff_firmware)) {
+	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
 		ret = cs35l56_firmware_shutdown(&cs35l56->base);
 		if (ret)
 			goto err;
@@ -613,7 +618,7 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (coeff_filename)
 		dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
 
-	if (cs35l56->base.secured) {
+	if (!firmware_missing) {
 		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
 		if (ret)
 			goto err_powered_up;
-- 
2.39.2

