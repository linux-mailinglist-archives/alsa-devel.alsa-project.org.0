Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD13769D77
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 18:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43EB4FA;
	Mon, 31 Jul 2023 18:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43EB4FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822789;
	bh=IyJfsigd4+829FJmgHuDda4IWBtjDOLWqBUgN4NP6VE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pjSmgL2vr4LofiMMJobhl21rY0VLBf56L5zQihxfrbi6uMMHUwhgNW6ba2Hs0G73B
	 xNvsprCfQH+h394WHrnbgetQ7CARE3T1dMpixTbF4DScRXGqUgBv7EJHItDTNdwyG2
	 eKYc7NcEQhWZ6sxD+WJPrtnFV8EKqv85ZAb/Sb6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96F3EF80520; Mon, 31 Jul 2023 18:57:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2308F8057C;
	Mon, 31 Jul 2023 18:57:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E6F0F80551; Mon, 31 Jul 2023 18:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0555EF8025A
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0555EF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=dR3leKCT
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36V5lNJL017071;
	Mon, 31 Jul 2023 11:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=AXY+yhAp337Xwcjj3zvet6CtUqG0Njj546QB9XWh5P4=; b=
	dR3leKCTZAVrxwO0wPK+UWwW3uv94qwZytByxI1VNDrgjUIld+LaOg3VSFvq2hEY
	gsi9PJRFqeakomq5K22j6ALxETFbYrdnfmRu+KoITHpQQPyX1zL373aWg1GkGwgv
	0SMnFX2tNyPOY+gdVS2cpA3IHqtfp8MVt8aVvoUuzSgUL1+w4dhg3QqQnIwq36+G
	MXXkAf+0nckqRsfYqbrpj3J9sevjUTAgzEDKbwFuld6TEoHkvFiD0JpJ9YFabMFF
	uymVysTy77zAdAtemnmO/C4UiaFjiQFiN6aCpSpdmnkLuUySKhHi/fudSe3zEKsr
	gmOUdjQHVcKTGSPrzh+GpA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sg45-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:33 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Mon, 31 Jul 2023 17:57:30 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AEBFF11CA;
	Mon, 31 Jul 2023 16:57:30 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 3/9] ALSA: hda/cs35l56: Call cs_dsp_power_down() before
 reloading firmware
Date: Mon, 31 Jul 2023 17:57:20 +0100
Message-ID: <20230731165726.7940-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OyU2U_LcCaKSimPOtdrXDTdjC5YFF-F0
X-Proofpoint-ORIG-GUID: OyU2U_LcCaKSimPOtdrXDTdjC5YFF-F0
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: N52UZECMUGMOIJDNSLI5VBK2KIU5JAFF
X-Message-ID-Hash: N52UZECMUGMOIJDNSLI5VBK2KIU5JAFF
X-MailFrom: prvs=3576b45159=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N52UZECMUGMOIJDNSLI5VBK2KIU5JAFF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When firmware is reloaded after a system resume cs_dsp_power_down() should
be called before calling cs_dsp_power_up().

The fw_patched flag should also be cleared and only set again if the
firmware download succeeded.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index fda716e0db09..b6b8cb21da75 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -527,6 +527,12 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	char *wmfw_filename = NULL;
 	int ret = 0;
 
+	/* Prepare for a new DSP power-up */
+	if (cs35l56->base.fw_patched)
+		cs_dsp_power_down(&cs35l56->cs_dsp);
+
+	cs35l56->base.fw_patched = false;
+
 	cs35l56_hda_request_firmware_files(cs35l56, &wmfw_firmware, &wmfw_filename,
 					   &coeff_firmware, &coeff_filename);
 
-- 
2.30.2

