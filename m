Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F194B003
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 20:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518AF192E;
	Wed,  7 Aug 2024 20:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518AF192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723056778;
	bh=ID+csheWgrV/L9tCHnYLlCDfrNvBZjYjtTOC7Rt0xTM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZEcQTVCQJSB4SicXYwTIiBfPTd6IWweH1gFCv5zcTOXXF65cnSmi32j4dThx2UVWy
	 +YnF9TfbOtv5J0fZiJPDIatFmKo3BZJdQza4Gw3GhraZ54UDfXipmxkia9aLe1/Zgs
	 0wnK5AOT8hchz+g8bNUx9V3Lkfk6xNHZDsS3YL4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55502F805A1; Wed,  7 Aug 2024 20:52:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48D92F805AE;
	Wed,  7 Aug 2024 20:52:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6528F8023A; Wed,  7 Aug 2024 20:39:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,TIME_LIMIT_EXCEEDED,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C683F800B0
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 20:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C683F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=E/mWnsAr
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 476KWxKr015964;
	Wed, 7 Aug 2024 09:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=7SlY5M2cWRn7f4bQ
	m1GLdBjXOl2gTmwj2IkqR+fECm0=; b=E/mWnsArIjSb4GIW0eSFcZvB3rmVLZL/
	PoqsdCojlZcxVtTBMsmW1EycrIQh1Lj1E2FIyYy/59K33VqGtz9mO0zxE0tRPsHr
	hCk5vSKV1oM2zY3G28tCWa+h5UalYRmgC34z3HFFReJR8lKh9ZHS1AJEkp1nWGae
	LZlJUShGy02mpBfzr9seeVPpz/QWb4RibmdoHIkOM+9GBLHlaZGq350Z3Ri/5OW2
	uki8Tw+/Vbl/eHlQDJgWg8DzDHlo2ULAR4WeeznENTwJF7F9nZq4RZbBRCT0mj+8
	XXAH95jDxkZWGVEPIDTtM7tSNXXtWdaENSiQxsHRHTSTpxBrjSqGKw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40shxx4hv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 09:26:53 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 15:26:50 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 7 Aug 2024 15:26:50 +0100
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com
 [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5DF16820244;
	Wed,  7 Aug 2024 14:26:50 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Patch CS35L56_IRQ1_MASK_18 to the default
 value
Date: Wed, 7 Aug 2024 14:26:48 +0000
Message-ID: <20240807142648.46932-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -cBW06uARo2rdTMF2WZkUb4OSveLC9DZ
X-Proofpoint-ORIG-GUID: -cBW06uARo2rdTMF2WZkUb4OSveLC9DZ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PMKVVMEHNZTOAQ5D2VNV5Z52MI7DS437
X-Message-ID-Hash: PMKVVMEHNZTOAQ5D2VNV5Z52MI7DS437
X-MailFrom: prvs=5949c4a4be=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMKVVMEHNZTOAQ5D2VNV5Z52MI7DS437/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device tuning files made with early revision tooling may contain
configuration that can unmask IRQ signals that are owned by the host.

Adding a safe default to the regmap patch ensures that the hardware
matches the driver expectations.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index e7e8d617da94..bd74fef33d49 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -36,6 +36,7 @@ static const struct reg_sequence cs35l56_patch[] = {
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
 	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
+	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
 
 	/* These are not reset by a soft-reset, so patch to defaults. */
 	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
-- 
2.43.0

