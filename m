Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F076948AD
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 15:52:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10AEE843;
	Mon, 13 Feb 2023 15:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10AEE843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676299930;
	bh=ebBIr6e0LY4E6QN3nT7UAYe8TbP10lIbDsp4eg21iwI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Etee86vlin8ThWKDRuCauCasj2ihcnnkWOG3KiLf/mmP6xyBBl9tFXgfPkSVOdlpC
	 E/LZXaMcfzQ+biWIiFuCWpfqNh1bmlJeciBIIp1Y+42G1VHRkZft5UWzdwBERFG3BW
	 54xFHqWtMxo0VRG5af+U8DcqQvRlM0Xc3msncc8s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 209ECF80527;
	Mon, 13 Feb 2023 15:50:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C350F804B4; Mon, 13 Feb 2023 15:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD010F80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 15:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD010F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SOxPYNDZ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31D5UX5E028354;
	Mon, 13 Feb 2023 08:50:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ea/rFFhINu/phNw7OHU5UmtWWEBCiXfiwatQeZgF6Vg=;
 b=SOxPYNDZFNUrzaVkKlZRZtxz523HSCLbevaahZ/tzQH+l/xe5xA7q5LncoK4dzjkmm2o
 UujSsWbLwiKkZJpDmo4YTC9gw2TDDa4EShF+8gRjwRhBbsLEE/03l4u/RqrPS5KR0rVZ
 6bQPCKM4MCbP/SycEBbPmsvWh3/6EEFORpot6TvGmwi6gJidroVbWJhJpF76uQga5VOd
 iMQ4WMYZp0po6womMlIYNMk3Af+KngDWFXrhdumV4KRYa03eXkE8kxA/xSQTZfp9zMnx
 ZXUGcxmFGvU3i0dmDqlU7Fc/C4+6vOvLK/4L17G9/id+5U56JHQqd9AmkJrQ9QYA9klv Hg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3np9a72amh-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 08:50:14 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Mon, 13 Feb
 2023 08:50:11 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Mon, 13 Feb 2023 08:50:11 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0FF69B0E;
	Mon, 13 Feb 2023 14:50:11 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/3] ALSA: hda: cs35l41: Ensure firmware/tuning pairs are
 always loaded
Date: Mon, 13 Feb 2023 14:50:07 +0000
Message-ID: <20230213145008.1215849-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213145008.1215849-1-sbinding@opensource.cirrus.com>
References: <20230213145008.1215849-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4OBsQf7bp4e6wQ_oYQPMR7uCXMz1H5mJ
X-Proofpoint-ORIG-GUID: 4OBsQf7bp4e6wQ_oYQPMR7uCXMz1H5mJ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Y35KOBYV5RJ5QC5K6ZCVMP7XHCJ66WQV
X-Message-ID-Hash: Y35KOBYV5RJ5QC5K6ZCVMP7XHCJ66WQV
X-MailFrom: prvs=7408c1a398=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y35KOBYV5RJ5QC5K6ZCVMP7XHCJ66WQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To ensure firmware for cs35l41 is correctly running, it is necessary
that a corresponding tuning file is also loaded. Without both,
the firmware may not be performing correctly
Ensure that if we load the firmware, we have also loaded the correct
tuning file. Otherwise, fall back to default firmware and tuning.
If default tuning is also missing, then disable DSP firmware.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 103 ++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 52 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index f7815ee24f83..1aad2604b9db 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -178,11 +178,10 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 					    cs35l41->speaker_id, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
-		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-					      CS35L41_FIRMWARE_ROOT,
-					      cs35l41->acpi_subsystem_id, cs35l41->amp_name,
-					      cs35l41->speaker_id, "bin");
-		return 0;
+		return cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						     CS35L41_FIRMWARE_ROOT,
+						     cs35l41->acpi_subsystem_id, cs35l41->amp_name,
+						     cs35l41->speaker_id, "bin");
 	}
 
 	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
@@ -191,10 +190,10 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 					    cs35l41->amp_name, -1, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
-		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-					      CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
-					      cs35l41->amp_name, cs35l41->speaker_id, "bin");
-		return 0;
+		return cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						     CS35L41_FIRMWARE_ROOT,
+						     cs35l41->acpi_subsystem_id, cs35l41->amp_name,
+						     cs35l41->speaker_id, "bin");
 	}
 
 	/* try cirrus/part-dspN-fwtype-sub<-spkidN>.wmfw */
@@ -209,11 +208,10 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 						    cs35l41->amp_name, cs35l41->speaker_id, "bin");
 		if (ret)
 			/* try cirrus/part-dspN-fwtype-sub<-spkidN>.bin */
-			cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						CS35L41_FIRMWARE_ROOT,
-						cs35l41->acpi_subsystem_id,
-						NULL, cs35l41->speaker_id, "bin");
-		return 0;
+			return cs35l41_request_firmware_file(cs35l41, coeff_firmware,
+							     coeff_filename, CS35L41_FIRMWARE_ROOT,
+							     cs35l41->acpi_subsystem_id, NULL,
+							     cs35l41->speaker_id, "bin");
 	}
 
 	/* try cirrus/part-dspN-fwtype-sub.wmfw */
@@ -224,29 +222,16 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
 		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
 						    CS35L41_FIRMWARE_ROOT,
-						    cs35l41->acpi_subsystem_id,
-						    cs35l41->amp_name, cs35l41->speaker_id, "bin");
+						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
+						    cs35l41->speaker_id, "bin");
 		if (ret)
 			/* try cirrus/part-dspN-fwtype-sub<-spkidN>.bin */
-			cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						      CS35L41_FIRMWARE_ROOT,
-						      cs35l41->acpi_subsystem_id,
-						      NULL, cs35l41->speaker_id, "bin");
-		return 0;
-	}
-
-	/* fallback try cirrus/part-dspN-fwtype.wmfw */
-	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");
-	if (!ret) {
-		/* fallback try cirrus/part-dspN-fwtype.bin */
-		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-					      CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
-		return 0;
+			return cs35l41_request_firmware_file(cs35l41, coeff_firmware,
+							     coeff_filename, CS35L41_FIRMWARE_ROOT,
+							     cs35l41->acpi_subsystem_id, NULL,
+							     cs35l41->speaker_id, "bin");
 	}
 
-	dev_warn(cs35l41->dev, "Failed to request firmware\n");
-
 	return ret;
 }
 
@@ -258,9 +243,12 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 {
 	int ret;
 
-	if (cs35l41->speaker_id > -1)
-		return cs35l41_request_firmware_files_spkid(cs35l41, wmfw_firmware, wmfw_filename,
-							    coeff_firmware, coeff_filename);
+	if (cs35l41->speaker_id > -1) {
+		ret = cs35l41_request_firmware_files_spkid(cs35l41, wmfw_firmware, wmfw_filename,
+							   coeff_firmware, coeff_filename);
+		goto out;
+
+	}
 
 	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
@@ -268,10 +256,11 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 					    cs35l41->amp_name, -1, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-ampname>.bin */
-		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-					      CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
-					      cs35l41->amp_name, -1, "bin");
-		return 0;
+		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						    CS35L41_FIRMWARE_ROOT,
+						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
+						    -1, "bin");
+		goto out;
 	}
 
 	/* try cirrus/part-dspN-fwtype-sub.wmfw */
@@ -286,25 +275,35 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 						    cs35l41->amp_name, -1, "bin");
 		if (ret)
 			/* try cirrus/part-dspN-fwtype-sub.bin */
-			cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						      CS35L41_FIRMWARE_ROOT,
-						      cs35l41->acpi_subsystem_id,
-						      NULL, -1, "bin");
-		return 0;
+			ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+							    CS35L41_FIRMWARE_ROOT,
+							    cs35l41->acpi_subsystem_id, NULL, -1,
+							    "bin");
 	}
 
+out:
+	if (!ret)
+		return 0;
+
+	/* Handle fallback */
+	dev_warn(cs35l41->dev, "Falling back to default firmware.\n");
+
+	release_firmware(*wmfw_firmware);
+	kfree(*wmfw_filename);
+
 	/* fallback try cirrus/part-dspN-fwtype.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
 					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");
-	if (!ret) {
+	if (!ret)
 		/* fallback try cirrus/part-dspN-fwtype.bin */
-		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-					      CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
-		return 0;
-	}
-
-	dev_warn(cs35l41->dev, "Failed to request firmware\n");
+		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
 
+	if (ret) {
+		release_firmware(*wmfw_firmware);
+		kfree(*wmfw_filename);
+		dev_warn(cs35l41->dev, "Unable to find firmware and tuning\n");
+	}
 	return ret;
 }
 
-- 
2.34.1

