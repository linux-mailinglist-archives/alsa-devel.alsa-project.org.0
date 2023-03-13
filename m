Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B816B7CC3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 16:53:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE125148D;
	Mon, 13 Mar 2023 16:52:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE125148D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678722797;
	bh=zFReu1nD3yGSXr605HnFCynTT8Xeza283PKgJONahCo=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=ubxKMbyZUWqx/kUAQ3u04fKJGMt3veVcbsAjyP3vk3OGOZBogFXKXE077UiIhjCRa
	 FUYMl/WmBfjPHMVxHJ920lZ7Mz0Njb6rEA+zVeinTImx7yCfcrTkMi4QO8k8UBccGB
	 p3cFdjIhd7aUQmhJznuwONZfJX/A4JUWyQSX1FK4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2416F8032D;
	Mon, 13 Mar 2023 16:52:07 +0100 (CET)
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 7/8] ASoC: wm_adsp: Simplify the logging of requested
 firmware files
Date: Mon, 13 Mar 2023 15:49:54 +0000
In-Reply-To: <20230313154955.4268-1-rf@opensource.cirrus.com>
References: <20230313154955.4268-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGXYPZDX44SSGJ3QPRGUVGORSFCUU7TA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167872272713.26.2210648064927857232@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39002F80529; Mon, 13 Mar 2023 16:52:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 033CBF804FE
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 16:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 033CBF804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=c1SVp4Ab
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DEPFBq004637;
	Mon, 13 Mar 2023 10:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Mj1tBC9kIBPSdh03nZLEaXsdWjbFpICDGatqwBjcDR4=;
 b=c1SVp4AbUp3oW+ggs9RuAtb0f8gyffrWZJfaNi/hacy7dOK27LwM3bu+0alzw4m2yvke
 5FbT/oRqGLTSFJT41w0DXTYDl+dzJ4PNLhFDHMFOAelJG4AbEqUEPH7gV+WWymXZVyEs
 Y52u6oeQjDq+2UWJpJlwMF8HqpCyms4M1O1bBWIj+Ls63oetvenVCS7/yIJQgnbHuHAa
 yNhOIAaYnHUOXfDt9HdXi4W0U4PlHhc9aH+oGXi8tvTQpZNnToxuw3pp3kDN+TLAh+yQ
 3kr/B1ZffpJdrgD4+Mvor3dDkE9u3L2X++tG3zzCHhW13Tkkp6uOGwn6Z9wTa4RSiFeZ BA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p8qx7b4rb-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 10:50:09 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 13 Mar
 2023 10:50:07 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 13 Mar 2023 10:50:07 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.92])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0CC2911D4;
	Mon, 13 Mar 2023 15:50:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 7/8] ASoC: wm_adsp: Simplify the logging of requested
 firmware files
Date: Mon, 13 Mar 2023 15:49:54 +0000
Message-ID: <20230313154955.4268-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230313154955.4268-1-rf@opensource.cirrus.com>
References: <20230313154955.4268-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jdJpG7vzcdpQp1SOId44tBGAz4moFljj
X-Proofpoint-GUID: jdJpG7vzcdpQp1SOId44tBGAz4moFljj
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FGXYPZDX44SSGJ3QPRGUVGORSFCUU7TA
X-Message-ID-Hash: FGXYPZDX44SSGJ3QPRGUVGORSFCUU7TA
X-MailFrom: prvs=843636b565=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGXYPZDX44SSGJ3QPRGUVGORSFCUU7TA/>
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

