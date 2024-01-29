Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4105840B7A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:31:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 428AB83B;
	Mon, 29 Jan 2024 17:31:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 428AB83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545874;
	bh=R1QHxOx4Sr0JtnBQnCXuCrel+1OfZI23IoUuIh6UYDE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jt1xhvIVl39zuAwuvhWLmkNZ4vdLdNISc8nTl5dblrc9lOGBqIeiTdUQB0IXX6/lK
	 T6GRZlOCCfgCJ+omnaFNOmz/2q/5PfvVd+q7iggH+1u9A7eCHc5qxhkI1QTbzpf1X+
	 KqEVW9gDtE1L2RtJeAP4rnzP+kJHLWarXZYARhwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DCB7F80710; Mon, 29 Jan 2024 17:28:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C6AF80717;
	Mon, 29 Jan 2024 17:28:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA8EDF8062F; Mon, 29 Jan 2024 17:28:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 03517F805A8
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03517F805A8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SylP/xHn
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0K006968;
	Mon, 29 Jan 2024 10:27:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=bTDeZPKMjF1LZBgDZqWVGGUorkGwCKYk0L/1ww1B5x4=; b=
	SylP/xHnYdV3I9AghlABCYVmcIN5Mi2dzL5HGIY6qUAh5Ih4PWmCGsbGJ2MHMkVA
	zfTe96hSsjctZ9Mwitm3DwRSrjuDBxmfJluxvT8767VN3Cu9GT6iNGR64uYxddCq
	lWZnCumuC/Uz/CUhpOHGMx94Rxo56hPjxNKaMZSIbGO6Egc6rtsbU/jsVZ0uohhu
	zjHTdFe8Ajsto5btI2C5bXV/2LiG2QTRTcjlZPWqbMxjrkMofFvExaYwgU2JSpq8
	r7isA70bciKodcvnpmbzLbUdMRPbRe+AVd3Tuwkg2K7nXz15HL3TiUhoGAZUtDL4
	Urjo3u4Rm4ehcCXX4Z5k8A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8n-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:55 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:46 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:46 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 91CB082024B;
	Mon, 29 Jan 2024 16:27:46 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 15/18] ALSA: hda: cs35l56: Fix order of searching for firmware
 files
Date: Mon, 29 Jan 2024 16:27:34 +0000
Message-ID: <20240129162737.497-16-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PmhZbXe5gxq0nalhv0POwxT439SOX2jp
X-Proofpoint-GUID: PmhZbXe5gxq0nalhv0POwxT439SOX2jp
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XGLSWUUHHJOHD5GV4JMS7MFSNGEQ53Y4
X-Message-ID-Hash: XGLSWUUHHJOHD5GV4JMS7MFSNGEQ53Y4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGLSWUUHHJOHD5GV4JMS7MFSNGEQ53Y4/>
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
Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index f22bcb104a4e..7ba7234d8d9c 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -483,6 +483,20 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
 								  NULL, "bin");
 			return;
 		}
+
+		/*
+		 * Check for system-specific bin files without wmfw before
+		 * falling back to generic firmware
+		 */
+		if (amp_name)
+			cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
+							  cirrus_dir, system_name, amp_name, "bin");
+		if (!*coeff_firmware)
+			cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
+							  cirrus_dir, system_name, NULL, "bin");
+
+		if (*coeff_firmware)
+			return;
 	}
 
 	ret = cs35l56_hda_request_firmware_file(cs35l56, wmfw_firmware, wmfw_filename,
@@ -493,16 +507,6 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
 		return;
 	}
 
-	/* When a firmware file is not found must still search for the coeff files */
-	if (system_name) {
-		if (amp_name)
-			cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
-							  cirrus_dir, system_name, amp_name, "bin");
-		if (!*coeff_firmware)
-			cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
-							  cirrus_dir, system_name, NULL, "bin");
-	}
-
 	if (!*coeff_firmware)
 		cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
 						  cirrus_dir, NULL, NULL, "bin");
-- 
2.39.2

