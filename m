Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D5D9152A0
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 17:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262C3857;
	Mon, 24 Jun 2024 17:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262C3857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719243509;
	bh=1eGMXZpdQKhkhSjhppnLU4k6yRbcC0KGeLsCNDejIis=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rIPvvVEEXtRHWPvZwU8Arjz+5EUAYoLpsalYxKGTxQ2250TOVdHU0gdONvGmOQxpb
	 8FQrIux34w+gH3/qUz0hZQtKJLMW9L+h9+a/ShoNvN0e2aCjBtZQicgeIA3+WDPWSl
	 b+s0Sk99QqkKbu42cdFp49yctFFuNnCyW4o1tQFg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9D4EF805E1; Mon, 24 Jun 2024 17:37:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2463F805C0;
	Mon, 24 Jun 2024 17:37:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 995B5F805C0; Mon, 24 Jun 2024 17:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4B6FF800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 17:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4B6FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=j4AYQIKI
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45O49C59019003;
	Mon, 24 Jun 2024 10:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=zIU0V/MgH1+Co7IG
	yw3fzdEKyoM7MA9XoZ30fj3Lk1c=; b=j4AYQIKIR/1VOhrJemBRfU8JtYkCgvCg
	sEX9jlmxca8QrHZ+0dXOXlBfsHSP3oV/qGJnw1bzvVHR+MFOVNj5JY/4tZ8yluI6
	6PSo3REV0sAU4NNN8lF9SmW+NNC9EOC4k/X2ItL+IaQUgjAAFfDQRx3UxmF/O+gZ
	T6FpgnOLkB+5yyOlwr9qtSCNN5U5P11zvioNtbNeGJ3ZjJMutaML3fxEb7L/xUse
	yYfbrmClEnUA3bVvPlesD6ttq2wWxm9SGSeSGUBqGn02mYE/++PW1STLc8k8dTiC
	9cjc0PGjAoh1B2bq8obrOEjQjTaqNvfzzGt0oHgXnoNsBciCc59wFw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ywv0x9su9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 10:37:22 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 16:37:19 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 24 Jun 2024 16:37:19 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9BFBA820248;
	Mon, 24 Jun 2024 15:37:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf v2 1/2] sof-soundwire: Add missing match for
 cs42l43 speakers
Date: Mon, 24 Jun 2024 16:37:18 +0100
Message-ID: <20240624153719.1053093-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: C2trxqQBTASs5YWwdRihYFGDMQb0GtBF
X-Proofpoint-GUID: C2trxqQBTASs5YWwdRihYFGDMQb0GtBF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5KMD2PIKHNTB7D4HYKHLY5M5Z2SC7IDP
X-Message-ID-Hash: 5KMD2PIKHNTB7D4HYKHLY5M5Z2SC7IDP
X-MailFrom: prvs=3905e7e383=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5KMD2PIKHNTB7D4HYKHLY5M5Z2SC7IDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs42l43 reports as cs42l43-spk in the speaker case, the regex in
sof-soundwire needs updated to recognise that.

Fixes: 035d9206cffd ("sof-soundwire: Add basic support for cs42l43's speaker")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

Thanks,
Charles

 ucm2/sof-soundwire/sof-soundwire.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ucm2/sof-soundwire/sof-soundwire.conf b/ucm2/sof-soundwire/sof-soundwire.conf
index 31492e3..2f61d11 100644
--- a/ucm2/sof-soundwire/sof-soundwire.conf
+++ b/ucm2/sof-soundwire/sof-soundwire.conf
@@ -21,7 +21,7 @@ Define {
 
 DefineRegex {
 	SpeakerCodec {
-		Regex " spk:([a-z0-9]+(-sdca)?)"
+		Regex " spk:([a-z0-9]+((-sdca)|(-spk))?)"
 		String "${CardComponents}"
 	}
 	SpeakerChannels {
-- 
2.39.2

