Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F0C8A12A0
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 13:10:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 651762BAD;
	Thu, 11 Apr 2024 13:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 651762BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712833845;
	bh=AMWp2LHHPlkid311uJ50F+pEQ152qqit1D1tRFBrxBs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gk89y6q6EPUl+AWn8fWkvoxD2NnRoXdA4Z2fapQ44RH5HC7FJKfyBCwdiMMFivg4/
	 WN/gSfxTHx2OUN2mGSZjiQmkHU9TjAveWtyfpJgNUdYKzRsaN0/4UsVAK9Kg2W89oq
	 v3/rz3JHWAPF/Xha0qGope88CpHzgBN7r/wMHkqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8222F8057F; Thu, 11 Apr 2024 13:08:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D17BAF80693;
	Thu, 11 Apr 2024 13:08:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97C2CF80634; Thu, 11 Apr 2024 13:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11AB3F8056F
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 13:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11AB3F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DNZmS5Co
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43B40AxV009489;
	Thu, 11 Apr 2024 06:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=hZy+g1IZf9QdRbbXbBeYAz5FpFJFKy2zhpm4F9dfA7Q=; b=
	DNZmS5Co7Z/wHOqMydpv9jZNPegJAGwAcztyljhuf3SgHBkyAfg1gi6jiJqkvMvW
	XI7i7QS1DR4QB0fvctwFvcb3FZiZ9vtuXfptWICyEuaA5fSPeINSY5P2PKBqsTVA
	gtoZhiihI1K/6NqlfPsGPGF6e7PQ2MRnX2d5NKgPseb6kPjsT0JmJ6tRwGPieAVw
	YCPqnbAV5R2P+EPaGBg44Rql/So5WJgbWuZpkzVMKgRxaV/mMAQLS9tOSHpuie2z
	EuihAgTmXId1qN7bFFhKYZ9S4SP7uhD377BnzPAim8352hWD54kIOlPdqn5IaXla
	/ba8Nve4ZhDYgjT/8dqWuQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xb3sxpva8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 06:08:19 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 12:08:16 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Thu, 11 Apr 2024 12:08:16 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.64.140])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7C2B3820245;
	Thu, 11 Apr 2024 11:08:16 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 6/7] ALSA: hda: cs35l41: Remove redundant argument to
 cs35l41_request_firmware_file()
Date: Thu, 11 Apr 2024 12:08:12 +0100
Message-ID: <20240411110813.330483-7-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411110813.330483-1-sbinding@opensource.cirrus.com>
References: <20240411110813.330483-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BYf2bpTdIOn0pCeJ7RpuyoQmFmEJrJ3l
X-Proofpoint-GUID: BYf2bpTdIOn0pCeJ7RpuyoQmFmEJrJ3l
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GRFNHR5IM2X22R3657D77J4XTUJFDYD4
X-Message-ID-Hash: GRFNHR5IM2X22R3657D77J4XTUJFDYD4
X-MailFrom: prvs=1831d0461d=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRFNHR5IM2X22R3657D77J4XTUJFDYD4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

In every case the 'dir' argument to cs35l41_request_firmware_file() is passed
the string "cirrus/", so this is a redundant argument and can be removed.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 39 ++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 4d4f1e1aca09..74076fa45dd6 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -23,7 +23,6 @@
 #include "hda_cs_dsp_ctl.h"
 #include "cs35l41_hda_property.h"
 
-#define CS35L41_FIRMWARE_ROOT "cirrus/"
 #define CS35L41_PART "cs35l41"
 
 #define HALO_STATE_DSP_CTL_NAME		"HALO_STATE"
@@ -172,7 +171,7 @@ static int cs35l41_request_tuning_param_file(struct cs35l41_hda *cs35l41, char *
 
 static int cs35l41_request_firmware_file(struct cs35l41_hda *cs35l41,
 					 const struct firmware **firmware, char **filename,
-					 const char *dir, const char *ssid, const char *amp_name,
+					 const char *ssid, const char *amp_name,
 					 int spkid, const char *filetype)
 {
 	const char * const dsp_name = cs35l41->cs_dsp.name;
@@ -180,23 +179,23 @@ static int cs35l41_request_firmware_file(struct cs35l41_hda *cs35l41,
 	int ret = 0;
 
 	if (spkid > -1 && ssid && amp_name)
-		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-spkid%d-%s.%s", dir, CS35L41_PART,
+		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-spkid%d-%s.%s", CS35L41_PART,
 				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
 				      ssid, spkid, amp_name, filetype);
 	else if (spkid > -1 && ssid)
-		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-spkid%d.%s", dir, CS35L41_PART,
+		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-spkid%d.%s", CS35L41_PART,
 				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
 				      ssid, spkid, filetype);
 	else if (ssid && amp_name)
-		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-%s.%s", dir, CS35L41_PART,
+		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-%s.%s", CS35L41_PART,
 				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
 				      ssid, amp_name, filetype);
 	else if (ssid)
-		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, CS35L41_PART,
+		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s.%s", CS35L41_PART,
 				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
 				      ssid, filetype);
 	else
-		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s.%s", dir, CS35L41_PART,
+		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s.%s", CS35L41_PART,
 				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
 				      filetype);
 
@@ -237,13 +236,11 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 
 	/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT,
 					    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
 					    cs35l41->speaker_id, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
 		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						    CS35L41_FIRMWARE_ROOT,
 						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
 						    cs35l41->speaker_id, "bin");
 		if (ret)
@@ -254,12 +251,11 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 
 	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
+					    cs35l41->acpi_subsystem_id,
 					    cs35l41->amp_name, -1, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
 		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						    CS35L41_FIRMWARE_ROOT,
 						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
 						    cs35l41->speaker_id, "bin");
 		if (ret)
@@ -270,18 +266,17 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 
 	/* try cirrus/part-dspN-fwtype-sub<-spkidN>.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
+					    cs35l41->acpi_subsystem_id,
 					    NULL, cs35l41->speaker_id, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
 		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						    CS35L41_FIRMWARE_ROOT,
 						    cs35l41->acpi_subsystem_id,
 						    cs35l41->amp_name, cs35l41->speaker_id, "bin");
 		if (ret)
 			/* try cirrus/part-dspN-fwtype-sub<-spkidN>.bin */
 			ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware,
-							    coeff_filename, CS35L41_FIRMWARE_ROOT,
+							    coeff_filename,
 							    cs35l41->acpi_subsystem_id, NULL,
 							    cs35l41->speaker_id, "bin");
 		if (ret)
@@ -292,18 +287,17 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 
 	/* try cirrus/part-dspN-fwtype-sub.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
+					    cs35l41->acpi_subsystem_id,
 					    NULL, -1, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
 		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						    CS35L41_FIRMWARE_ROOT,
 						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
 						    cs35l41->speaker_id, "bin");
 		if (ret)
 			/* try cirrus/part-dspN-fwtype-sub<-spkidN>.bin */
 			ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware,
-							    coeff_filename, CS35L41_FIRMWARE_ROOT,
+							    coeff_filename,
 							    cs35l41->acpi_subsystem_id, NULL,
 							    cs35l41->speaker_id, "bin");
 		if (ret)
@@ -330,13 +324,13 @@ static int cs35l41_fallback_firmware_file(struct cs35l41_hda *cs35l41,
 
 	/* fallback try cirrus/part-dspN-fwtype.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");
+					    NULL, NULL, -1, "wmfw");
 	if (ret)
 		goto err;
 
 	/* fallback try cirrus/part-dspN-fwtype.bin */
 	ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
+					    NULL, NULL, -1, "bin");
 	if (ret) {
 		release_firmware(*wmfw_firmware);
 		kfree(*wmfw_filename);
@@ -365,12 +359,11 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 
 	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
+					    cs35l41->acpi_subsystem_id,
 					    cs35l41->amp_name, -1, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-ampname>.bin */
 		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						    CS35L41_FIRMWARE_ROOT,
 						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
 						    -1, "bin");
 		if (ret)
@@ -381,18 +374,16 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 
 	/* try cirrus/part-dspN-fwtype-sub.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
+					    cs35l41->acpi_subsystem_id,
 					    NULL, -1, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-ampname>.bin */
 		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						    CS35L41_FIRMWARE_ROOT,
 						    cs35l41->acpi_subsystem_id,
 						    cs35l41->amp_name, -1, "bin");
 		if (ret)
 			/* try cirrus/part-dspN-fwtype-sub.bin */
 			ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-							    CS35L41_FIRMWARE_ROOT,
 							    cs35l41->acpi_subsystem_id, NULL, -1,
 							    "bin");
 		if (ret)
-- 
2.34.1

