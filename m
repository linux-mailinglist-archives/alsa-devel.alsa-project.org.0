Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F37479025B6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 17:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79135B65;
	Mon, 10 Jun 2024 17:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79135B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718033547;
	bh=aYbNbBFHiYx2Zv1mXu+yI//b+XG//zhg+Qgg/MlAAgo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H16O8RBrQUt2hnsQYwm3raK6kPsjV+RalD5V3veixTiXmUpbjCLUDNrWO5dlxSQgY
	 jDP3ySrRk+R4qBT0aBRe56Dek3NTJfZ7MJkmCOrHQEO1VzMVP4AkQEImULOHWHf+iD
	 64vdnwHjSg/uCFOKthbFU/4PyZmgVTRsYstZzuc8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B83CBF805E9; Mon, 10 Jun 2024 17:31:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C15A1F805D2;
	Mon, 10 Jun 2024 17:31:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2373F8057A; Mon, 10 Jun 2024 17:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF54BF80579
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 17:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF54BF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=X9u5FuGc
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45AEOLHY023981;
	Mon, 10 Jun 2024 10:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=i2HcqK+ELboYchfz
	lK0TDw4MXiEXi/QPmMumecRlwnY=; b=X9u5FuGcaSzwE44nbxQs2aZudrlFAnoe
	gWkgVNO6AGk/1j8ucnTgusiOjCKYeh9MpNUjaBgSkOQvFLX4w4ppk9dsJJvUB2ZE
	iqwCJNJU+kL7aqICayRQRPxTF1u0WWxfQe/lDrMLkNR2K3Po5SbYvxDP/SImuNX/
	oYLJm53yLxS0q8NgPcjGzoXhFctSPTFaN1WJmii9OR3JLBddEFsFr4Nlo64dVl6w
	7HTcqTMXYJsnB6ghMXtgy1b4+mFXgT2SzVAVjdA8mgcGsKL3Sw1g4zSGtvCYnEDI
	4bnk7oa0kjBaALSKmC3oICLNCa92y3zecQ+WoCwhahQXL4ZWXbnz0A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ymkqhsu8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:31:26 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 16:31:24 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 10 Jun 2024 16:31:24 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B7844820249;
	Mon, 10 Jun 2024 15:31:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH 1/2] sof-soundwire: Add missing match for cs42l43 speakers
Date: Mon, 10 Jun 2024 16:31:23 +0100
Message-ID: <20240610153124.1329052-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: x-5GVfKKQpxsgSS0DNGHRjOVI3wPv7aw
X-Proofpoint-ORIG-GUID: x-5GVfKKQpxsgSS0DNGHRjOVI3wPv7aw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: N4LOTNTVDZTWCY7I6AR5MIHSQD5GJFG6
X-Message-ID-Hash: N4LOTNTVDZTWCY7I6AR5MIHSQD5GJFG6
X-MailFrom: prvs=3891f53e6a=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4LOTNTVDZTWCY7I6AR5MIHSQD5GJFG6/>
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

