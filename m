Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1AD4FF252
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 10:42:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EFB011C;
	Wed, 13 Apr 2022 10:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EFB011C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649839321;
	bh=/B2UgY32GDP+uBEDruRhr8ma0hy5ZstiTTOCL/Q0jyI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=duiGi7LDBHgSYOLg/3nZFBjtX1p7siHfwms+Wy59jdi2z/wTVmaaak96V8NMZrEO8
	 F0KA+hSZLYbiBBiTgqSCkdqJEFeLPnSN4yGhTkgDF/YKkx4ylFakjQ6/mjpmD8m8F/
	 U+2ybSNiISZkQZChSQ2rINnfS7gWg7LF6TVxs9rA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FCE5F8057B;
	Wed, 13 Apr 2022 10:38:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B6E5F8056F; Wed, 13 Apr 2022 10:38:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 887B4F80526
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 10:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 887B4F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DMQ44i7/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23D8ZTP0023702;
 Wed, 13 Apr 2022 03:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=NhL3cxAScXn1yla7chvvFreM6rA/gloLy2R4Wly7QkI=;
 b=DMQ44i7/684uL7zOL2iCQvyNqqnQ98AB82HgXW/k1gmSml0e76xivbQQSmFQKYE8+Fqy
 xQLV16qe/P/AZOxAhRxsXdkRnq0bLIL8eFbRiYvS/RMLJ5K2wn6sbch0QuZOx/LeiDXe
 Mwhyxd1vYKkli/HCkyO82l6j8bcjX648WdWefDPssANmP8Ea8ma2DivVkKWvlw7qlDqP
 v3e/XJXoc6Gsmpf0aBwgZ5kNoq4gSgp00gXQcHvHJEd1yFUHa79rpResulfk2O5i+xdz
 q6SQjyDu/7wdA/K2ozzjhmqCbTLn5XAoQn7qdl+68xprGI+cu92mS+jTyo6+O4WbkOt4 qQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fb7hymw6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 13 Apr 2022 03:37:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Apr
 2022 09:37:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 13 Apr 2022 09:37:32 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7D835475;
 Wed, 13 Apr 2022 08:37:32 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v7 09/16] ALSA: cs35l41: Enable Internal Boost in shared lib
Date: Wed, 13 Apr 2022 09:37:21 +0100
Message-ID: <20220413083728.10730-10-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220413083728.10730-1-tanureal@opensource.cirrus.com>
References: <20220413083728.10730-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: S0Mv4YqrlEzyPFkM5SVSUfCK_pdjoBAB
X-Proofpoint-ORIG-GUID: S0Mv4YqrlEzyPFkM5SVSUfCK_pdjoBAB
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Internal Boost enable is the default option from reset, but with
external boost support, internal boost must be disabled.
Add the enable of internal boost in cs35l41_boost_config to
centralize the internal boost configuration.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index eeeaeaa0db82..03039d8488b9 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1036,6 +1036,9 @@ int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_in
 		return ret;
 	}
 
+	regmap_update_bits(regmap, CS35L41_PWR_CTRL2, CS35L41_BST_EN_MASK,
+			   CS35L41_BST_EN_DEFAULT << CS35L41_BST_EN_SHIFT);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cs35l41_boost_config);
-- 
2.35.2

