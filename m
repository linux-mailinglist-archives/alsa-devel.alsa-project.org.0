Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8517187F8
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 19:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9D8C20C;
	Wed, 31 May 2023 19:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9D8C20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685552616;
	bh=eTMkJZ2jFX+MQ1BzohM+ybX4v9ni1yWEsK5XkEuKV28=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GnI/KHAzW2ss9DixldMsJXhkjcpDpFZ91a6RlWRuNQgF7XcmuY0JAJ5QB0VIMh/4y
	 TvB1P1kjDiOK7TYOGvxpk+7HXNz05EzjTNDwB7KkCT/71F963T4Msdxwq5zD1oOhnk
	 Hm8tv/CLNXvDVNVu7iuHFU9qqMFCslCqXDg0wiC4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 473E3F8026A; Wed, 31 May 2023 19:02:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8C5EF8026A;
	Wed, 31 May 2023 19:02:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45F4EF8042F; Wed, 31 May 2023 19:02:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 54564F800DF
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 19:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54564F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UP0ZGQZ9
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34VGt5lG014447;
	Wed, 31 May 2023 12:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=Q+bH1la1wWK9pGjCcwcHQ8LiJYhGaZp0HJpX1acTJyE=;
 b=UP0ZGQZ9fbFajE9OwZD4yhv2nHQUyRYunLvdXtjhUxQDzIfyY8ZAF+2hq6mT8XPrTNH/
 HWNi7xIEEPVK26/Dk/fKgVKTvluBe3Vz/n1sjFnfp4BfZespNfp+3qXnTfLXv+lCYtTv
 M3V8zaIAKcpiP/pdsgnb7aVDnm5KekrqLlwKqVBH1wdoemsfcTo3OmJDsLBvH3vhzlLP
 XWku8Jsxs9gGC+nfOPWceXZvAvJtL3ZVQWu9S46vK3eaDtfyRxo6elzWwNgh1+Q+l55+
 7t7l4y1mHgxk2DZWJvt0z8libeG0NyoIY+63tWg6QDf6ZGGlnj/JDew8YCSEwzB6KpJs jA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90vquq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 12:02:00 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 31 May
 2023 18:01:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 May 2023 18:01:58 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A9EEB45;
	Wed, 31 May 2023 17:01:58 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH] firmware: cs_dsp: Log that a bin file was loaded
Date: Wed, 31 May 2023 18:01:58 +0100
Message-ID: <20230531170158.2744700-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0qvnEfe6ssnlN3bUqX0tHfH3rHOW3NDt
X-Proofpoint-ORIG-GUID: 0qvnEfe6ssnlN3bUqX0tHfH3rHOW3NDt
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: R76ITUV3B7QJLQQ33GNNTDYTHREKKFHF
X-Message-ID-Hash: R76ITUV3B7QJLQQ33GNNTDYTHREKKFHF
X-MailFrom: prvs=15158edab9=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R76ITUV3B7QJLQQ33GNNTDYTHREKKFHF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the message at the start of bin file loading from
cs_dsp_dbg() to cs_dsp_info() so that there is confirmation
in the kernel log that a bin file was loaded, and the name
of the file.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index e4ccfb6a8fa5..d7e46a57ecf9 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2059,10 +2059,10 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 		goto out_fw;
 	}
 
-	cs_dsp_dbg(dsp, "%s: v%d.%d.%d\n", file,
-		   (le32_to_cpu(hdr->ver) >> 16) & 0xff,
-		   (le32_to_cpu(hdr->ver) >>  8) & 0xff,
-		   le32_to_cpu(hdr->ver) & 0xff);
+	cs_dsp_info(dsp, "%s: v%d.%d.%d\n", file,
+		    (le32_to_cpu(hdr->ver) >> 16) & 0xff,
+		    (le32_to_cpu(hdr->ver) >>  8) & 0xff,
+		    le32_to_cpu(hdr->ver) & 0xff);
 
 	pos = le32_to_cpu(hdr->len);
 
-- 
2.30.2

