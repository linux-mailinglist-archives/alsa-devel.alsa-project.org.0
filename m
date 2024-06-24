Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7604F9149B2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:21:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B28DD86F;
	Mon, 24 Jun 2024 14:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B28DD86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231683;
	bh=aYbNbBFHiYx2Zv1mXu+yI//b+XG//zhg+Qgg/MlAAgo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=evOtQWlD/2ynO9VIDn0OKwlRT9zW76nrhI/WrqhZ4OGFhgBjL75jVQAyAcHAxT3PO
	 g7q/j/b9hgDzJHgBq6XlfJp/Cn6mxWav3cRhc7skkftZh7nt4wLYhrbJmobgcbIhfI
	 74TGFp8IRpUijvaDkCxOoNf0G7hu9VfmhmoyIVEM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1F89F805B5; Mon, 24 Jun 2024 14:20:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 448FAF805B0;
	Mon, 24 Jun 2024 14:20:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E28F80495; Mon, 24 Jun 2024 14:20:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EF03EF80154
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF03EF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WhSgKTZF
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45O7je4L027262;
	Mon, 24 Jun 2024 07:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=i2HcqK+ELboYchfz
	lK0TDw4MXiEXi/QPmMumecRlwnY=; b=WhSgKTZFNLgzYVzEVitPWimrHZE4DKYZ
	pdSUZ2PPjlDAvzDZGXOQwPGIwc3x3XrnCt6iZ03+PbLViRXpcSinzdtvIGPOOX+K
	T+bIS3g/dPA7Eq+VSUh2KBRAaIXr+UgFG2efOD3vLDzkSswlG/xdfB+1uz0jMWm+
	IjlRdeixqqlIM6kWTt4ulUMHE6RzlpXRCyKuMIYzoM+uagQynOzEVUJ/fNPRp/X7
	T/PyIyVGRS3gSd149Bx4RUb5C+wLRnhpVPkacFGH5sqAeUKbXtOJckGOwP2QlYPy
	lkJeVrhgWcbdhHkJwZ/DZbmQDlggNZDxN+GC5rn4ZwYApL9helVv1w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ywu1hsn0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 07:20:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 13:20:41 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 24 Jun 2024 13:20:41 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 393C5820244;
	Mon, 24 Jun 2024 12:20:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf 1/2] sof-soundwire: Add missing match for
 cs42l43 speakers
Date: Mon, 24 Jun 2024 13:20:40 +0100
Message-ID: <20240624122041.952863-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kNiZ1Kn4zvRywORJ6neZTRPhZzhUzxse
X-Proofpoint-GUID: kNiZ1Kn4zvRywORJ6neZTRPhZzhUzxse
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Q7MOINSEPQCBQVD3CMGZV6Z7FWRRXAID
X-Message-ID-Hash: Q7MOINSEPQCBQVD3CMGZV6Z7FWRRXAID
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7MOINSEPQCBQVD3CMGZV6Z7FWRRXAID/>
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

