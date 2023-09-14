Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF97A091A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 17:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A94A93A;
	Thu, 14 Sep 2023 17:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A94A93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694705192;
	bh=5Fuq6NekJjS/ad21WuviwNP0E6eGvCdCxtfZMAy3fS0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Im+NoVBKKXcrKhr1kVSMea7rkMGZfDXOYOdUpwq8YEPvixSl4oelgyDSrcEBk4S9v
	 3s5o6mxuNIO6hC5Amay04RbXW+gmkEDRhkolC8uClV4c3cvP68S61xFzjBZbRq9U46
	 dpjVIK/6i9jq/RONrKhMTvAwahnGm1FLeYpT2AqU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4A18F80558; Thu, 14 Sep 2023 17:25:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A82CF80246;
	Thu, 14 Sep 2023 17:25:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 715DFF80141; Thu, 14 Sep 2023 17:25:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24710F80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 17:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24710F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qi+ZUMqO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38ECunMr020490;
	Thu, 14 Sep 2023 10:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=q
	ygg2TVwFG6lKmZeeKC9INbE7+tFtemrFvcVvzZt+To=; b=qi+ZUMqO1tU9ij+0V
	q5mfM2KtEBchrQTsq7seqoCFLjCKcjm+SFrzGAdgLhQqjy98CzRPVv8oo4SY1aLH
	vW1OdwLMZUwSbCkfV1bOt7mINd+t+w0Dd8PtqLZuKxY3KzOeDzLCL1/TsS7Bicq5
	BW6v57nqHwhdVeiNoiHt2zdNxwcBuZqQdNMAsyEHrvfUqDtP+8+SVQgYiqlIJwNK
	+u8Qlu2wG0KUwCwxd020b01ZHh3sO2Blg0x+NEINStyYH5d/++1dmChKSpkF/UBC
	+bq4ZTP72TYMfyX9J54+V8cV5CBPxcmlBotpen3Fsu1Cml5a/EYFMcgWWgo+FCGQ
	9tqPA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7sj9g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 10:25:28 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 14 Sep
 2023 16:25:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 14 Sep 2023 16:25:27 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.215])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E561F3563;
	Thu, 14 Sep 2023 15:25:26 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v2] ALSA: hda: cs35l56: Fix missing RESET GPIO if _SUB is
 missing
Date: Thu, 14 Sep 2023 16:25:25 +0100
Message-ID: <20230914152525.20829-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hvb46J8ibE00wLVH5auGSVmnOad4e6AQ
X-Proofpoint-ORIG-GUID: hvb46J8ibE00wLVH5auGSVmnOad4e6AQ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2W3PPY4M5CSI3IY67JI6DYH3DT7WG4VO
X-Message-ID-Hash: 2W3PPY4M5CSI3IY67JI6DYH3DT7WG4VO
X-MailFrom: prvs=46218c6399=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2W3PPY4M5CSI3IY67JI6DYH3DT7WG4VO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In cs35l56_hda_read_acpi() do not return if ACPI _SUB is missing.

A missing _SUB means that the driver cannot load a system-specific
firmware, because the firmware is identified by the _SUB. But it can
fallback to a generic firmware. Unfortunately this was being handled
by immediately returning 0, which would skip the remaining ACPI
configuration in cs35l56_hda_read_acpi() and so it would not get the
RESET GPIO.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index bc75865b5de8..87ffe8fbff99 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -865,15 +865,13 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int id)
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
 
 	if (IS_ERR(sub)) {
-		/* If no ACPI SUB, return 0 and fallback to legacy firmware path, otherwise fail */
-		if (PTR_ERR(sub) == -ENODATA)
-			return 0;
-		else
-			return PTR_ERR(sub);
+		dev_info(cs35l56->base.dev,
+			 "Read ACPI _SUB failed(%ld): fallback to generic firmware\n",
+			 PTR_ERR(sub));
+	} else {
+		cs35l56->system_name = sub;
 	}
 
-	cs35l56->system_name = sub;
-
 	cs35l56->base.reset_gpio = devm_gpiod_get_index_optional(cs35l56->base.dev,
 								 "reset",
 								 cs35l56->index,
-- 
2.30.2

