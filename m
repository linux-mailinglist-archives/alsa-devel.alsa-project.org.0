Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0747B6B58
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 16:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49AA984B;
	Tue,  3 Oct 2023 16:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49AA984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696342987;
	bh=Rx48N00R0K3Qu/hTAOAwP55QiN+VFzP5FbhPkHUSeXk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TJDf25j4735praUm2BMyEcukcbwMmIadP52hAkWZp7BEGCjCnkrGfyFRYarFFiApL
	 0QGoGY7M+pF0RJKrbmJsBeANhUhOxlS3NZdSbXwTOxYmwTnc96idp5bzg0yFUg0jKN
	 Sop572xqE3G5AJW1AA6iQWKfWbpr9e5pJBT3iLxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF951F801EB; Tue,  3 Oct 2023 16:22:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90B04F8047D;
	Tue,  3 Oct 2023 16:22:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51BD8F8047D; Tue,  3 Oct 2023 16:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DCD9F80130
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 16:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DCD9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RVybI8Rh
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 393DCOkb031857;
	Tue, 3 Oct 2023 09:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=B
	b3GpnlgSqQLro9IisI3/aE52cZDpykC3Lf7qb/4cGc=; b=RVybI8Rhe1c3GAYCQ
	sBWTBAInWeD3BHnOKW0tXBn0j6muCVIYLPKZVyz8jKw6cL0LmB+vJRfnhVrhGQsA
	GC4pcysTKpeq/k/WtqzJmBfgbC3BJa4FFnGEb+o6R4/w2HoAiu8DkH+NQ1s2NJao
	yqqwiGmyx7FgfdPSLMukCegBySUJPBKYgCO0ype9Na1CzsCR2TJTN8IpFPKIKQXR
	qKoJBdlmpFmwxQulK+izZ6yrRkiqbKoGxlcLE8ohBZE3NaUV5XhjQju4y9h13lOW
	vHyR0fCtsSEY1OL9seugl3WjA8/XLuEiIIymihasSjaf5BgSOsVmfx9tSN7Lfgck
	Smoaw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k41wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 09:21:50 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 3 Oct
 2023 15:21:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 3 Oct 2023 15:21:48 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.165])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7E0D211AC;
	Tue,  3 Oct 2023 14:21:48 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>,
        kernel test robot <lkp@intel.com>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>
Subject: [PATCH v1] ALSA: hda: cs35l41: Cleanup and fix double free in
 firmware request
Date: Tue, 3 Oct 2023 15:21:38 +0100
Message-ID: <20231003142138.180108-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2yldpt3QjVh-CIwuzVOKdDE5ttRfCRio
X-Proofpoint-ORIG-GUID: 2yldpt3QjVh-CIwuzVOKdDE5ttRfCRio
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EGQOWKXXDLANLWOV2TRR33QT42TSQ2XI
X-Message-ID-Hash: EGQOWKXXDLANLWOV2TRR33QT42TSQ2XI
X-MailFrom: prvs=5640728812=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EGQOWKXXDLANLWOV2TRR33QT42TSQ2XI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is an unlikely but possible double free when loading firmware,
and a missing free calls if a firmware is successfully requested but
the coefficient file request fails, leading to the fallback firmware
request occurring without clearing the previously loaded firmware.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202309291331.0JUUQnPT-lkp@intel.com/

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 115 +++++++++++++++++++++++++-----------
 1 file changed, 79 insertions(+), 36 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index dd10b4cd3d1a..28cb10ddd191 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -188,10 +188,14 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 					    cs35l41->speaker_id, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
-		return cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						     CS35L41_FIRMWARE_ROOT,
-						     cs35l41->acpi_subsystem_id, cs35l41->amp_name,
-						     cs35l41->speaker_id, "bin");
+		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						    CS35L41_FIRMWARE_ROOT,
+						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
+						    cs35l41->speaker_id, "bin");
+		if (ret)
+			goto coeff_err;
+
+		return 0;
 	}
 
 	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
@@ -200,10 +204,14 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 					    cs35l41->amp_name, -1, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
-		return cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						     CS35L41_FIRMWARE_ROOT,
-						     cs35l41->acpi_subsystem_id, cs35l41->amp_name,
-						     cs35l41->speaker_id, "bin");
+		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						    CS35L41_FIRMWARE_ROOT,
+						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
+						    cs35l41->speaker_id, "bin");
+		if (ret)
+			goto coeff_err;
+
+		return 0;
 	}
 
 	/* try cirrus/part-dspN-fwtype-sub<-spkidN>.wmfw */
@@ -218,10 +226,14 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 						    cs35l41->amp_name, cs35l41->speaker_id, "bin");
 		if (ret)
 			/* try cirrus/part-dspN-fwtype-sub<-spkidN>.bin */
-			return cs35l41_request_firmware_file(cs35l41, coeff_firmware,
-							     coeff_filename, CS35L41_FIRMWARE_ROOT,
-							     cs35l41->acpi_subsystem_id, NULL,
-							     cs35l41->speaker_id, "bin");
+			ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware,
+							    coeff_filename, CS35L41_FIRMWARE_ROOT,
+							    cs35l41->acpi_subsystem_id, NULL,
+							    cs35l41->speaker_id, "bin");
+		if (ret)
+			goto coeff_err;
+
+		return 0;
 	}
 
 	/* try cirrus/part-dspN-fwtype-sub.wmfw */
@@ -236,12 +248,50 @@ static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
 						    cs35l41->speaker_id, "bin");
 		if (ret)
 			/* try cirrus/part-dspN-fwtype-sub<-spkidN>.bin */
-			return cs35l41_request_firmware_file(cs35l41, coeff_firmware,
-							     coeff_filename, CS35L41_FIRMWARE_ROOT,
-							     cs35l41->acpi_subsystem_id, NULL,
-							     cs35l41->speaker_id, "bin");
+			ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware,
+							    coeff_filename, CS35L41_FIRMWARE_ROOT,
+							    cs35l41->acpi_subsystem_id, NULL,
+							    cs35l41->speaker_id, "bin");
+		if (ret)
+			goto coeff_err;
+	}
+
+	return ret;
+coeff_err:
+	release_firmware(*wmfw_firmware);
+	kfree(*wmfw_filename);
+	return ret;
+}
+
+static int cs35l41_fallback_firmware_file(struct cs35l41_hda *cs35l41,
+					  const struct firmware **wmfw_firmware,
+					  char **wmfw_filename,
+					  const struct firmware **coeff_firmware,
+					  char **coeff_filename)
+{
+	int ret;
+
+	/* Handle fallback */
+	dev_warn(cs35l41->dev, "Falling back to default firmware.\n");
+
+	/* fallback try cirrus/part-dspN-fwtype.wmfw */
+	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
+					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");
+	if (ret)
+		goto err;
+
+	/* fallback try cirrus/part-dspN-fwtype.bin */
+	ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
+	if (ret) {
+		release_firmware(*wmfw_firmware);
+		kfree(*wmfw_filename);
+		goto err;
 	}
+	return 0;
 
+err:
+	dev_warn(cs35l41->dev, "Unable to find firmware and tuning\n");
 	return ret;
 }
 
@@ -257,7 +307,6 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 		ret = cs35l41_request_firmware_files_spkid(cs35l41, wmfw_firmware, wmfw_filename,
 							   coeff_firmware, coeff_filename);
 		goto out;
-
 	}
 
 	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
@@ -270,6 +319,9 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 						    CS35L41_FIRMWARE_ROOT,
 						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
 						    -1, "bin");
+		if (ret)
+			goto coeff_err;
+
 		goto out;
 	}
 
@@ -289,32 +341,23 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 							    CS35L41_FIRMWARE_ROOT,
 							    cs35l41->acpi_subsystem_id, NULL, -1,
 							    "bin");
+		if (ret)
+			goto coeff_err;
 	}
 
 out:
-	if (!ret)
-		return 0;
+	if (ret)
+		/* if all attempts at finding firmware fail, try fallback */
+		goto fallback;
 
-	/* Handle fallback */
-	dev_warn(cs35l41->dev, "Falling back to default firmware.\n");
+	return 0;
 
+coeff_err:
 	release_firmware(*wmfw_firmware);
 	kfree(*wmfw_filename);
-
-	/* fallback try cirrus/part-dspN-fwtype.wmfw */
-	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");
-	if (!ret)
-		/* fallback try cirrus/part-dspN-fwtype.bin */
-		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-						    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
-
-	if (ret) {
-		release_firmware(*wmfw_firmware);
-		kfree(*wmfw_filename);
-		dev_warn(cs35l41->dev, "Unable to find firmware and tuning\n");
-	}
-	return ret;
+fallback:
+	return cs35l41_fallback_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
+					      coeff_firmware, coeff_filename);
 }
 
 #if IS_ENABLED(CONFIG_EFI)
-- 
2.34.1

