Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056BA84F7FA
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 15:57:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70887827;
	Fri,  9 Feb 2024 15:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70887827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707490670;
	bh=wO38Yt4tXTY92INv32gdo8g+xlsn6zHVAdq7e+Xxp0k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KyNZYGEPq0WPK5JuBuJtWYJFYBu4Qw+uMrdHGasy6zfNeMooKQCyqJbvQdZyFwO/l
	 /Ei6z/sbk9PrryIf/JpItBBqByPVVQkh91mF+CAYbjyQRCWF7UqWPX9Qryw5Pl3rku
	 HO350qvGG1nTeGAOXdYl6qZXx78DcT0YN3S5dKRs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA3D1F80568; Fri,  9 Feb 2024 15:57:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49A75F805A0;
	Fri,  9 Feb 2024 15:57:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66B5CF801EB; Fri,  9 Feb 2024 15:57:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 51A80F800EE
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 15:57:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51A80F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fNTJr+CM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4199AB9n000674;
	Fri, 9 Feb 2024 08:57:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=/
	8ZkQK18xlzwxeIuyhUWjvqXdyTGQv17yphhR0arZB8=; b=fNTJr+CM+26yf+JQe
	+aWvSfE1KDRgDGk2eCawIV32aAFw8m4+BLqVKaLSl2tr1f/N7NCKC0mSzyU4tjiD
	MHaWTM+dvnpUquN4BFLny+ZHUPeDoF7wnH9eBBP+FY/GdGesix7JshmRGYyq+jO6
	F6YB4Gu1rDxJkKrT3xHxu1Bpg4gegEk42DYkUCwJTI03KQR+e+VmFHco/R1PdhqP
	QjkC6Tbd0t1Q7OpDoi5VAoIJlt6QpLZ9An5Qaq9mE+lLMpVfdya13wjK22UIVZLv
	w7C9hdzJqu+uuVtNzEYdVSGdjoWquhh9ovgk5VzlRz+C6KIRpE948x5ZrxzMxDLS
	kjiqg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2g1sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 08:57:02 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 14:57:00 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 9 Feb 2024 14:57:00 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3AB74820243;
	Fri,  9 Feb 2024 14:57:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Remove default from IRQ1_CFG register
Date: Fri, 9 Feb 2024 14:57:00 +0000
Message-ID: <20240209145700.1555950-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ra__ikqGi0ZyXfYsS1F3WyRJeJ8lXdt2
X-Proofpoint-ORIG-GUID: Ra__ikqGi0ZyXfYsS1F3WyRJeJ8lXdt2
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IITW4D3CDUP7TJNDJRKNOI33UPB7WN7G
X-Message-ID-Hash: IITW4D3CDUP7TJNDJRKNOI33UPB7WN7G
X-MailFrom: prvs=97692a8f23=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IITW4D3CDUP7TJNDJRKNOI33UPB7WN7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver never uses the IRQ1_CFG register so there's no need to provide
a default value. It's set as a readable register only for debugging
through the regmap registers file.

A system-specific firmware could overwrite this register with a non-default
value. Therefore the driver can't hardcode what the initial value actually
is. As the register is only for debugging the value can be left unknown
until someone wants to read it through debugfs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 02fba4bc0a14..995d979b6d87 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -51,7 +51,6 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
 	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
-	{ CS35L56_IRQ1_CFG,			0x00000000 },
 	{ CS35L56_IRQ1_MASK_1,			0x83ffffff },
 	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
 	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
-- 
2.30.2

