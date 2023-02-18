Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD8469B074
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 17:17:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D357AF74;
	Fri, 17 Feb 2023 17:16:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D357AF74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676650657;
	bh=YwTh6l/G0+YOXT4O7xzVYBHeww38hzqLZJboEqhVhpg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jQYZ8DJEWexsUWeaBTTKmWYfR6qRbZ38nKrKT+GYIm+g5lrhoK8mX4JtccqLDIHDD
	 1NtdZCEkIuEU1zVTNMwZiBDIy4hVhQ4echTTbsQg/SpYhDy9HRr4WnrzUSj6PxYfT0
	 /5Llxml6rz5hObB8rT9sqoNKKlxAOahCPzWjmo0s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A0AF80570;
	Fri, 17 Feb 2023 17:14:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1A27F80534; Fri, 17 Feb 2023 17:14:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A370BF8047C
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 17:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A370BF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YF3vfUjg
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HFh1JP028722;
	Fri, 17 Feb 2023 10:14:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Mj1tBC9kIBPSdh03nZLEaXsdWjbFpICDGatqwBjcDR4=;
 b=YF3vfUjgEj5tGw5wYAzyDc9rn7gIa+LlgILWiM+jXyShmuCwwKyszHTs/y2Qou9ZT8bf
 HLtoT7Ycy31ajob4MwMiMU3L0kXqzKRy9dohHq34uck/vz5h2/FHlIOnqCOVYj2/I2Eh
 DwzMit/4Q8A33BaEjEyA9eefxkyRRaGq/PYwerRRZ1PYJGJFiV7WcB9/WV0VR2t71Ge4
 mJPv2Wq0/HzXXw1QqVPbuSieQrj0cY27EhEPSha4XsRQ+D3DNTVTqd11VnfotjG/ZbcP
 Ra7NUG1hsThvQaOPx4iNefw7QOtVA6dhLFdsOaRxTbTJhqI98FZITuTGOSXNqCsuzk3E uA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nt1btgsph-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 10:14:15 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 17 Feb
 2023 10:14:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Fri, 17 Feb 2023 10:14:10 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9945911D4;
	Fri, 17 Feb 2023 16:14:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>
Subject: [PATCH 07/10] ASoC: wm_adsp: Simplify the logging of requested
 firmware files
Date: Fri, 17 Feb 2023 16:14:07 +0000
Message-ID: <20230217161410.915202-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217161410.915202-1-rf@opensource.cirrus.com>
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: h8lpKO2amYwhtYNoLzjGstKi4YBMD61L
X-Proofpoint-GUID: h8lpKO2amYwhtYNoLzjGstKi4YBMD61L
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DRW33AO6AQUPBV4BYP6ZIZEDGZINKZNI
X-Message-ID-Hash: DRW33AO6AQUPBV4BYP6ZIZEDGZINKZNI
X-MailFrom: prvs=74127981b7=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRW33AO6AQUPBV4BYP6ZIZEDGZINKZNI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

This change makes the logging of firmware files more consistent and
simplifies the code - a debug message is logged whether the requested
file was found or not and this applies to both wmfw and bin files.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index c23c306dc38d..216120b68b64 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -787,6 +787,8 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 		adsp_dbg(dsp, "Failed to request '%s'\n", *filename);
 		kfree(*filename);
 		*filename = NULL;
+	} else {
+		adsp_dbg(dsp, "Found '%s'\n", *filename);
 	}
 
 	return ret;
@@ -807,7 +809,6 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 						   cirrus_dir, system_name,
 						   asoc_component_prefix, "wmfw")) {
-			adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
 			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 						      cirrus_dir, system_name,
 						      asoc_component_prefix, "bin");
@@ -819,7 +820,6 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 						   cirrus_dir, system_name,
 						   NULL, "wmfw")) {
-			adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
 			if (asoc_component_prefix)
 				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 							      cirrus_dir, system_name,
@@ -835,7 +835,6 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 
 	if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 					   "", NULL, NULL, "wmfw")) {
-		adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
 		wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 					      "", NULL, NULL, "bin");
 		return 0;
@@ -844,7 +843,6 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 	ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 					    cirrus_dir, NULL, NULL, "wmfw");
 	if (!ret) {
-		adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
 		wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 					      cirrus_dir, NULL, NULL, "bin");
 		return 0;
-- 
2.30.2

