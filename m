Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F69868CDB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 11:04:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD36A4D;
	Tue, 27 Feb 2024 11:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD36A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709028246;
	bh=icVQbNc6Pzd3/XoMFybZxZR4XgSeB5FGoOCVNAL9xWE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hJDATSbXGwP9OFrYLzjYHA1twrKpe4FpTHBPXQpwx5VslzJQ4gqc7HBtpGCAyzKJu
	 fD5B7ZXSEjT8tlMldjKFMfbS4BzSWqowLaWTOprHvzJQ75pFqtfDMVWvrM0DUElPw+
	 TvIBcldEiKxBYys5kbTate4+s00inu5kMme1aRtY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23B11F805B5; Tue, 27 Feb 2024 11:03:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71FE6F805A0;
	Tue, 27 Feb 2024 11:03:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F41C1F801C0; Tue, 27 Feb 2024 11:00:59 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AFFADF80087
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 11:00:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFFADF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jjIKGiEF
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41R59Fpo012520;
	Tue, 27 Feb 2024 04:00:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=e
	KIvLq8xXb6oflbot81eGZAizbrGvdd+1Q79YDlPBfg=; b=jjIKGiEF9iJDojLcV
	PmzfDAPYEFMmbld2KLy4GldiaePq3k9Xvew+Toj1H5E0xCM5mDEQq8XX988QuOPd
	r8owsQyxVMc8gi+bSpQxQrLYg7cWiwwrHnXWyVzzcuinM+SctHuQhSI2YIOuLPWn
	nRFbPeP2+e1sOszAyKKXJCrbjkiYbeFNtzverDy0eYae2xQQ+jfS91pjV89ilaHF
	Exp4fet7/0TeIG5w5xqh/Ltb6jzia7cZwnDYzXPocyWu/6ltE/8oeR5xtU556UU7
	aKLgEwj6nZvuwzxFzQNbvPewmQklIx39aUaZVMWBcEqYmnRofMopye2Ydzx9l9rU
	+UOZw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wfer2u9e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 04:00:47 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 10:00:44 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 27 Feb 2024 10:00:44 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.56])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5A600820246;
	Tue, 27 Feb 2024 10:00:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Prevent bad sign extension in
 cs35l56_read_silicon_uid()
Date: Tue, 27 Feb 2024 10:00:42 +0000
Message-ID: <20240227100042.99-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sVtyfHros6atG7YF84seuCbHvi2LKv4u
X-Proofpoint-ORIG-GUID: sVtyfHros6atG7YF84seuCbHvi2LKv4u
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JV4W2332ZMMCXGK67ZMBSKECJRZTXKPE
X-Message-ID-Hash: JV4W2332ZMMCXGK67ZMBSKECJRZTXKPE
X-MailFrom: prvs=9787057d79=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JV4W2332ZMMCXGK67ZMBSKECJRZTXKPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Cast u8 values to u32 when using them to build a 32-bit unsigned value
that is then stored in a u64. This avoids the possibility of a bad sign
extension where the u8 is implicitly extended to an int, thus changing it
from an unsigned to a signed value.

Whether this is a real problem is debatable, but it does no harm to
ensure that the u8 are cast to a suitable type for shifting.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e1830f66f6c6 ("ASoC: cs35l56: Add helper functions for amp calibration")
---
 sound/soc/codecs/cs35l56-shared.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 20b6dbd3fbab..f3670bf85a95 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -659,9 +659,10 @@ static int cs35l56_read_silicon_uid(struct cs35l56_base *cs35l56_base, u64 *uid)
 		return ret;
 	}
 
-	unique_id = pte.lot[2] | (pte.lot[1] << 8) | (pte.lot[0] << 16);
+	unique_id = (u32)pte.lot[2] | ((u32)pte.lot[1] << 8) | ((u32)pte.lot[0] << 16);
 	unique_id <<= 32;
-	unique_id |= pte.x | (pte.y << 8) | (pte.wafer_id << 16) | (pte.dvs << 24);
+	unique_id |= (u32)pte.x | ((u32)pte.y << 8) | ((u32)pte.wafer_id << 16) |
+		     ((u32)pte.dvs << 24);
 
 	dev_dbg(cs35l56_base->dev, "UniqueID = %#llx\n", unique_id);
 
-- 
2.39.2

