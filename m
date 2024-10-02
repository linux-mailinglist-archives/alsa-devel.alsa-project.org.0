Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2998DB5B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 16:31:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C8083B;
	Wed,  2 Oct 2024 16:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C8083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727879464;
	bh=ErPkfOwBTC5KFcU3ZDKD62x5EEYp8c6KsEVuEZ7DI3o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Rs8dTwH8Y8fej8cIIoWhkfDz9LkYehUeTZqGGwJhq0Tb9wkHxMIgaTrEPzpybVLaD
	 FIfZi80NnWw7modN1fFQlfcHHbdTuE7Q8QZd7elFRp1jUaGAxsGln5VNY6nW2RFI/2
	 NgTJRwl5Y9hwReAuKCjKcsXCCkWLONfekchptEsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32919F805DF; Wed,  2 Oct 2024 16:30:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5319EF805D4;
	Wed,  2 Oct 2024 16:30:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69AA6F80517; Wed,  2 Oct 2024 16:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F720F80508
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 16:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F720F80508
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VDOi2JBO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4926KwR5000732;
	Wed, 2 Oct 2024 09:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=5Qts3orW7hcEq/FF
	gc0E/n6Jm1L/fZkrF4alazwK4e8=; b=VDOi2JBOR7CuP3tn8qIE8uLOwu3iODVl
	xRTc8Duezy4FePoig4DzIbyl38Qscq/i32y3mVmyRRBBZGSbLOal80iqbnvni174
	xO+NzjIpspeax6xbVTEnpGTiTAJLysWxeodJGIZ9E8UHWLVuUakeFO22xlTyHUfc
	9BzJONG9eIhgx2tso1oppp6Tr4nqfJQDA94RZGeUqV6H+2Jt6Zr/1x4LiLovsfqX
	pnuRKLu9cnfJK0tlTOgydPf9xGvOSzBTc4cuycxnwKBNbo92Ubct2SbUNeKtTyRx
	mcfJNktyZr8faN2KLHg8xw8L1IkDsCt0zWwSXm0+enHs3GzYkT6PuQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41xe7jw7vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Oct 2024 09:29:58 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Oct 2024
 15:29:56 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 2 Oct 2024 15:29:56 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C822A820248;
	Wed,  2 Oct 2024 14:29:56 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf v2 1/2] sof-soundwire: Change mapped control
 names to make them unique
Date: Wed, 2 Oct 2024 15:29:46 +0100
Message-ID: <20241002142947.4015912-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8Emkv2nebqyQqvfj5i4ZyPHU8f_m4huk
X-Proofpoint-GUID: 8Emkv2nebqyQqvfj5i4ZyPHU8f_m4huk
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: A6JYE5JFLADVPIWCCPDM7C4AT427MC5R
X-Message-ID-Hash: A6JYE5JFLADVPIWCCPDM7C4AT427MC5R
X-MailFrom: prvs=7005510c00=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6JYE5JFLADVPIWCCPDM7C4AT427MC5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Both 'Speaker Digital' and 'cs42l43 PDM2' names were found as substrings in
other alsa controls, confusing the MixerElems paths. Make them unique to avoid
errors for hardware mutes. Also add 'Capture' string into microphone controls
to make them work properly.

Fixes: e87dde51d689 ("sof-soundwire: Add basic support for cs42l43")
Fixes: e4277a204cd6 ("sof-soundwire: Add support for cs42l43/cs35l56 bridge configuration")
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
v2: Rename to "Speaker Playback" instead of "Speaker Combined"
---
 ucm2/codecs/cs42l43/init.conf          | 4 ++--
 ucm2/sof-soundwire/cs35l56-bridge.conf | 6 +++---
 ucm2/sof-soundwire/cs42l43-dmic.conf   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/ucm2/codecs/cs42l43/init.conf b/ucm2/codecs/cs42l43/init.conf
index 10a6e1f..cf61833 100644
--- a/ucm2/codecs/cs42l43/init.conf
+++ b/ucm2/codecs/cs42l43/init.conf
@@ -2,11 +2,11 @@

 LibraryConfig.remap.Config {
 	ctl.default.map {
-		"name='cs42l43 PDM2 Switch'" {
+		"name='cs42l43 Microphone Capture Switch'" {
 			"name='cs42l43 Decimator 3 Switch'".vindex.0 0
 			"name='cs42l43 Decimator 4 Switch'".vindex.1 0
 		}
-		"name='cs42l43 PDM2 Volume'" {
+		"name='cs42l43 Microphone Capture Volume'" {
 			"name='cs42l43 Decimator 3 Volume'".vindex.0 0
 			"name='cs42l43 Decimator 4 Volume'".vindex.1 0
 		}
diff --git a/ucm2/sof-soundwire/cs35l56-bridge.conf b/ucm2/sof-soundwire/cs35l56-bridge.conf
index 5435b11..a3cf6ad 100644
--- a/ucm2/sof-soundwire/cs35l56-bridge.conf
+++ b/ucm2/sof-soundwire/cs35l56-bridge.conf
@@ -2,11 +2,11 @@

 LibraryConfig.remap.Config {
 	ctl.default.map {
-		"name='Speaker Digital Switch'" {
+		"name='Speaker Playback Switch'" {
 			"name='AMPL Speaker Switch'".vindex.0 0
 			"name='AMPR Speaker Switch'".vindex.1 0
 		}
-		"name='Speaker Digital Volume'" {
+		"name='Speaker Playback Volume'" {
 			"name='AMPL Speaker Volume'".vindex.0 0
 			"name='AMPR Speaker Volume'".vindex.1 0
 		}
@@ -56,6 +56,6 @@ SectionDevice."Speaker" {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId},0"
 		PlaybackMixer "default:${CardId}"
-		PlaybackMixerElem "Speaker Digital"
+		PlaybackMixerElem "Speaker Playback"
 	}
 }
diff --git a/ucm2/sof-soundwire/cs42l43-dmic.conf b/ucm2/sof-soundwire/cs42l43-dmic.conf
index d5f895d..b68a70d 100644
--- a/ucm2/sof-soundwire/cs42l43-dmic.conf
+++ b/ucm2/sof-soundwire/cs42l43-dmic.conf
@@ -21,6 +21,6 @@ SectionDevice."Mic" {
 		CapturePriority 100
 		CapturePCM "hw:${CardId},4"
 		CaptureMixer "default:${CardId}"
-		CaptureMixerElem "cs42l43 PDM2"
+		CaptureMixerElem "cs42l43 Microphone"
 	}
 }
--
2.39.5

