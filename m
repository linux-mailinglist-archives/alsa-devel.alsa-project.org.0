Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 251AC8A96A8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 11:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88A4DB65;
	Thu, 18 Apr 2024 11:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88A4DB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713433857;
	bh=QQb/yEHNcu6BoLkFoAVAEDTaV0FNvGALpQ1jbEEDhqo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LuRo+vG1zECcPH6BmKr8b8SPqeR9wLt2HSXMbzGU4J+8pcciluBtPqykWbUxl7s65
	 oKFaDA7XBBjYZbqvZWhYDExxDkymHY/SVlSroEXG7x+INIOnOK1zUcGAbN7xWf04VL
	 PIhI23ozU4CIaWSzm73bGaNnEq3tuD1OfXZR/G48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3982AF80587; Thu, 18 Apr 2024 11:50:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 229F8F8059F;
	Thu, 18 Apr 2024 11:50:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3613EF8025A; Thu, 18 Apr 2024 11:44:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BA32F80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 11:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BA32F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=H6opVoQK
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43I4tftJ004328;
	Thu, 18 Apr 2024 04:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=1
	N2CZOBMiSECQas0FB6FFT900jfO8opQ645yOpaXiLc=; b=H6opVoQKIF/+r5NM0
	8yyfh51sPLm36vt9dQ5W/Fb1U2lM/liBRDGRdR4tMxoA6EZ7c7Dw4L2nqyC9isWY
	a9GgfGD3Eol77kQ17yxwX+ZdJsp3fX+Ih44wWDxDlDAVCZdzvjKZqR8s4U0xEG7q
	cPTduglX79VoBBviB4DcVXuT21fRBn/Bw8H3eYpGCest/VaeVLa+oMBIwdVYVPnN
	uA9xfg6I7RznubgJf+1vuMpD9rQUpxhaN3/2gFNJ55q0GwtlrBMT7zqEzHLLPaos
	Ckx5gG3p0NEhPhJkQn66Un8jv2b2cDwBL/AcrOdp7pBK1GccEYeg98o4BZjfbSPz
	n07qA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xfqeyckaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 04:42:11 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 10:42:09 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Thu, 18 Apr 2024 10:42:09 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 094DC820245;
	Thu, 18 Apr 2024 09:42:09 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>
Subject: [PATCH] spi: cs42l43: Correct name of ACPI property
Date: Thu, 18 Apr 2024 10:42:06 +0100
Message-ID: <20240418094206.1323489-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7DMe5XzNF2zLqLaM82aRsM8UBOaRyPq5
X-Proofpoint-ORIG-GUID: 7DMe5XzNF2zLqLaM82aRsM8UBOaRyPq5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 66ORN3EFQOBJTHQZ76LRGQH3FUHPFE7V
X-Message-ID-Hash: 66ORN3EFQOBJTHQZ76LRGQH3FUHPFE7V
X-MailFrom: prvs=183834ae71=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66ORN3EFQOBJTHQZ76LRGQH3FUHPFE7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixes: 1f05252a3a95 ("Add bridged amplifiers to cs42l43")

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 drivers/spi/spi-cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index cdc61cd089ad..9d747ea69926 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -267,7 +267,7 @@ static bool cs42l43_has_sidecar(struct fwnode_handle *fwnode)
 			continue;

 		ret = fwnode_property_read_u32(ext_fwnode,
-					       "01fa-cirrus-sidecar-instances",
+					       "01fa-sidecar-instances",
 					       &val);

 		fwnode_handle_put(ext_fwnode);
--
2.34.1

