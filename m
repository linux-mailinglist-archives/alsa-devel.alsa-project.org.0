Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ACF92A1C7
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 14:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E08785D;
	Mon,  8 Jul 2024 13:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E08785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720440006;
	bh=jWIDSkUua3eh1V6yCKzn6GZFcC8GAHsNvbbyNGZx83A=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i/1K1fOVKJ7gWmOevB5cLI0PWIk5TJZUHkrOO8rbdC2UT8outsQz4meuiB4pUgaT7
	 +XI/GjyDv5AOnioVxMWJOzNjN9eemsJylwtfqWS3+COYZv4/0WoPdt/rkisB4gwScC
	 0LjIYx2lEmcT05l/wyf9sqLwDlSHO3eJyUfcd5OU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C52C2F805A1; Mon,  8 Jul 2024 13:59:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55BEAF805AF;
	Mon,  8 Jul 2024 13:59:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5461BF8020D; Mon,  8 Jul 2024 13:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 796E1F80074
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 13:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 796E1F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fxzp96S3
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 468BvdJW016303;
	Mon, 8 Jul 2024 06:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=hGyLTt/CriP9CW2S
	F1pOcfJT+wFKnpd4kYrdtuRGbiw=; b=fxzp96S3XEyXu492ygJ/s4Cv9r064XV8
	edaIuSBczPDb9jd0uCr/S91FiaN+7GAa5gmv5DJHGYbEJAs7y21KYah7WISTEOAz
	FmzbSNdRYLGEPcgGy5FJvlXCZ8NeR0AOQ3CL+uJ6Tne/ejRDxZm8rr543HbKa2Wc
	L++Plu7gbObDK38IZJDC48nlFoKI2s2dv6dG+CVaNXFlGFbe6fse+pod8HeLoMga
	cn96Me8iW/Qe3UOswmxz2qTpMxfcA2KHiN0eMagOgut+yU7iR4zdhEbZUmhtX7Qs
	2H1+FCeeFwbkdeYVA7eUMQCTZTezwgZi+PqS8byfXADGb4/3FXfi2Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4072bj9eh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 06:59:21 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 12:59:19 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 8 Jul 2024 12:59:19 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 799EA820244;
	Mon,  8 Jul 2024 11:59:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf v3 1/2] sof-soundwire: Add missing match for
 cs42l43 speakers
Date: Mon, 8 Jul 2024 12:59:18 +0100
Message-ID: <20240708115919.2506891-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nAECmtFLAHhIffZXc1VPaD9k4vyYVhjY
X-Proofpoint-GUID: nAECmtFLAHhIffZXc1VPaD9k4vyYVhjY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5BONZY5OU3NJ6SMVXQA5LGEN7NPM7UQB
X-Message-ID-Hash: 5BONZY5OU3NJ6SMVXQA5LGEN7NPM7UQB
X-MailFrom: prvs=4919e0c630=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BONZY5OU3NJ6SMVXQA5LGEN7NPM7UQB/>
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

No changes since v1.

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

