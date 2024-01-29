Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB3A840B61
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:28:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BAE0B70;
	Mon, 29 Jan 2024 17:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BAE0B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545733;
	bh=YNy1JWOtLJKU45sFmv/JhPh9ECD5YpTQr0LWjodMVxE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gFbJFpcFHfrBgBJXvr9d4l2wfJjr6l7oJLYJlb58Zco4+rTF706JsvI8F0lIcXAY8
	 B8rWdYY/mBBayj0sy4CQudMm/cXnXcpSkELxbpehHIIppM7KGy8mzjSI+8C6WRbNSl
	 Lma+f2FGJWXsfhjzpZL4qy1A8KTVP6EPQg6S9P1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA27AF805C7; Mon, 29 Jan 2024 17:28:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B589F805AB;
	Mon, 29 Jan 2024 17:28:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3456FF80589; Mon, 29 Jan 2024 17:28:05 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 95516F8055C
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95516F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=k3BSmIxC
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM09006968;
	Mon, 29 Jan 2024 10:27:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=/NhAJ3fdwCVsLA5bc0/RGJ1iAFv0wBsPiSTQRRzHFRo=; b=
	k3BSmIxCWwDFA19lGaxa3gbUzVbGUSbyGf/g4TssO3co6eK/j1wz7ISQOvXv/aMK
	4tS3mAAuOZssTMwWPPzq4utImA2J4yZBMgmMncABsP/9LQbRJwGIlIAJukK87bST
	2Rj/rvZ48T/YgWbZzXsD+cZQHSj9A2KrHv00EOHu4RRGsQlvCj/gl2flVExxy3pD
	vx6fajVZt14CmLZ+fETtj99eMq9UMSAB4mHT//9aXXyvhklSllaGorew5FsKOI8F
	aCf9AHOftRi5r/gmQehSJ12YPHOGB6iamnlWN/hCUK8H25D9x09gdqj1mtk7rh3w
	AiAOQnxRR6a38JBHM5Zruw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:51 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:42 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:42 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B6772820247;
	Mon, 29 Jan 2024 16:27:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 01/18] ASoC: wm_adsp: Fix firmware file search order
Date: Mon, 29 Jan 2024 16:27:20 +0000
Message-ID: <20240129162737.497-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AAA_zOVOg9JmAI51yfuMMNJEDPvciKib
X-Proofpoint-GUID: AAA_zOVOg9JmAI51yfuMMNJEDPvciKib
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6GI7NX44NCMFLKBK2JNL6MBYJFK2XKBV
X-Message-ID-Hash: 6GI7NX44NCMFLKBK2JNL6MBYJFK2XKBV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6GI7NX44NCMFLKBK2JNL6MBYJFK2XKBV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Check for the cases of system-specific bin file without a
wmfw before falling back to looking for a generic wmfw.

All system-specific options should be tried before falling
back to loading a generic wmfw/bin. With the original code,
the presence of a fallback generic wmfw on the filesystem
would prevent using a system-specific tuning with a ROM
firmware.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 0e7d82cbea8b ("ASoC: wm_adsp: Add support for loading bin files without wmfw")
---
 sound/soc/codecs/wm_adsp.c | 44 ++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index c01e31175015..bd60ceebb6a9 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -823,6 +823,23 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		}
 	}
 
+	/* Check system-specific bin without wmfw before falling back to generic */
+	if (dsp->wmfw_optional && system_name) {
+		if (asoc_component_prefix)
+			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+						      cirrus_dir, system_name,
+						      asoc_component_prefix, "bin");
+
+		if (!*coeff_firmware)
+			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+						      cirrus_dir, system_name,
+						      NULL, "bin");
+
+		if (*coeff_firmware)
+			return 0;
+	}
+
+	/* Check legacy location */
 	if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 					   "", NULL, NULL, "wmfw")) {
 		wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
@@ -830,38 +847,15 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		return 0;
 	}
 
+	/* Fall back to generic wmfw and optional matching bin */
 	ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 					    cirrus_dir, NULL, NULL, "wmfw");
-	if (!ret) {
+	if (!ret || dsp->wmfw_optional) {
 		wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 					      cirrus_dir, NULL, NULL, "bin");
 		return 0;
 	}
 
-	if (dsp->wmfw_optional) {
-		if (system_name) {
-			if (asoc_component_prefix)
-				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-							      cirrus_dir, system_name,
-							      asoc_component_prefix, "bin");
-
-			if (!*coeff_firmware)
-				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-							      cirrus_dir, system_name,
-							      NULL, "bin");
-		}
-
-		if (!*coeff_firmware)
-			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-						      "", NULL, NULL, "bin");
-
-		if (!*coeff_firmware)
-			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-						      cirrus_dir, NULL, NULL, "bin");
-
-		return 0;
-	}
-
 	adsp_err(dsp, "Failed to request firmware <%s>%s-%s-%s<-%s<%s>>.wmfw\n",
 		 cirrus_dir, dsp->part, dsp->fwf_name, wm_adsp_fw[dsp->fw].file,
 		 system_name, asoc_component_prefix);
-- 
2.39.2

