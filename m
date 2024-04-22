Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BBE8ACABE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 12:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B60B6DF6;
	Mon, 22 Apr 2024 12:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B60B6DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713781986;
	bh=vG/0fLXhL9US68X2wfcTn3OalcGWddrMe6MQ6+UgZ6E=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D8jdeu8dpkK9iVdPF8QGMZ6UqbEUN0tA+O6rH/Tfvk2yDAVTGG91Ac12YDJqZuZON
	 NYa8B0cU7gfW20ixBeeguD0r5RCMuY3spmJL2nErTc04aduohP3E0KyG316NfBN2/z
	 LAkgctR67rV3n0gxa6qrIykBw03MhR2tJRkH5aIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19404F805AA; Mon, 22 Apr 2024 12:32:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91352F8056F;
	Mon, 22 Apr 2024 12:32:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83CC4F802E8; Mon, 22 Apr 2024 12:32:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4620F8003A
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 12:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4620F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VSUE9Bti
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43M6stke006883;
	Mon, 22 Apr 2024 05:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=S
	vws7KLOMCFKfcP6/baNnM0W4JCe1O1rsfsw8WhjRWE=; b=VSUE9Btit+dd8qRLw
	jyI5BPmSDVPV66kk6HYmj6DzA3t7O0grHI5gC3XDMEtvEXDC0uWwxf+z7iEh0ws+
	1eXCHnvNhnmRx9xnscdgT9iIA9kGvburg5aSKZJTny+5vWxJP4xV+r1LmZ5oAIGu
	sKfh6y2cfGS57fqoKQz61F3vXChOwk2FNUaX2ja8VH0uRFxbdusHuTweicf31FGL
	ufRVWKYsfgwc87RcLOjuVlS9PmBntgzNJJ+Tur+YCFDkzTD3AxfiYM4gUe+ZIiZi
	2a1rr5w2Q3qn6RD+QYE1XZ8iGdSgNrCnl+NgLPLreXmTuDthcQ9Lj04Y7sx8mES1
	sqVhg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xmqmh0wgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 05:32:13 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 11:32:11 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 22 Apr 2024 11:32:11 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 78D91820242;
	Mon, 22 Apr 2024 10:32:11 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Avoid static analysis warning of uninitialised
 variable
Date: Mon, 22 Apr 2024 11:32:11 +0100
Message-ID: <20240422103211.236063-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: t9vjsIWd4Aavgih1LBWDMcsrcStnFBr0
X-Proofpoint-GUID: t9vjsIWd4Aavgih1LBWDMcsrcStnFBr0
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Y7LCUMJ6HYXBWF4AWQAARPS5W7CUOEFY
X-Message-ID-Hash: Y7LCUMJ6HYXBWF4AWQAARPS5W7CUOEFY
X-MailFrom: prvs=1842b6a548=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7LCUMJ6HYXBWF4AWQAARPS5W7CUOEFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Static checkers complain that the silicon_uid variable passed by
pointer to cs35l56_read_silicon_uid() could later be used
uninitialised when calling cs_amp_get_efi_calibration_data().

cs35l56_read_silicon_uid() must have succeeded to call
cs_amp_get_efi_calibration_data() and that would have populated the
variable.

However, initialise the value so we are not haunted by it forevermore.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Fixes: e1830f66f6c6 ("ASoC: cs35l56: Add helper functions for amp calibration")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 3aa39f5923eb..8af89a263594 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -707,7 +707,7 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_calibration_controls, SND_SOC_CS35L56_SHARED);
 
 int cs35l56_get_calibration(struct cs35l56_base *cs35l56_base)
 {
-	u64 silicon_uid;
+	u64 silicon_uid = 0;
 	int ret;
 
 	/* Driver can't apply calibration to a secured part, so skip */
-- 
2.39.2

