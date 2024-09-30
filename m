Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D6498A5A2
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 15:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3614920C6;
	Mon, 30 Sep 2024 15:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3614920C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727703755;
	bh=G/ixEObSOTuXPAFJQk5DiQWe2Kj9Mn1bgHA4yPo+H8g=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=r1fCsdp9U3sbKO1sh2faepABcOhvCH+jhKTmSN/9i0Fc9eu3hsq/U+qfpHc+/i7Be
	 ljPW104X0Q05FGeDZ9yc2YCkX4WOoZ0bDC//aFk17Pjh0KN2/z1EVyHMlc7YPtxkT5
	 UEmXBid0VVZGLm8oWgeTzDGsnQp9yFsvjMEABvuo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60C32F805B1; Mon, 30 Sep 2024 15:42:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAF6AF805B0;
	Mon, 30 Sep 2024 15:42:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 764A0F80518; Mon, 30 Sep 2024 15:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6D7FF80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 15:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6D7FF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=kVa4ujpm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48U4Uw3q003415;
	Mon, 30 Sep 2024 08:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=XswW10kZaQjCBakV
	KhdgOJsxdHD+BcLhC7zv+dVBA+A=; b=kVa4ujpmOGBp9h9qqvUX0G3RvjnwbYRZ
	lPRKXFvGcibGVQ6aVIkYkL7zyHsJ3KXZqQ3eoGPlbCdTGwwsrMNflPB3gi4FpsPF
	hqWOfCi5rMhRxQ+vPtUQfNxC/d3KzN1Zk+mlea9c2FLytPABwTSXcJJJvjHJVo1/
	91clNDAnJy4giVYdLIyfTX3n6r9E7BxUhSKkzaK/L08671Wq3WQg55Aqoc5KqDsW
	r/OUjMUMGDeq6VVXPeXioNyZtgIIl46JEGLUOtwnOivfiaraUQb3D4/ODPdQn2pc
	v+IvaMnaDPfZpVQLC2rvU3FXuibeDVFWF8mqklLKGY9uf71dW5/+zA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41xf6xadxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 08:41:43 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 14:41:41 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 30 Sep 2024 14:41:41 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1B44B820248;
	Mon, 30 Sep 2024 13:41:41 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf 1/2] sof-soundwire: Change mapped control names
 to make them unique
Date: Mon, 30 Sep 2024 14:41:17 +0100
Message-ID: <20240930134118.2640509-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NRe7Z579Q52g1nidZNd15TfwazybCv9g
X-Proofpoint-GUID: NRe7Z579Q52g1nidZNd15TfwazybCv9g
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6RWKWZTLGPFPZ6VXPB27EQYN2OQQCEEG
X-Message-ID-Hash: 6RWKWZTLGPFPZ6VXPB27EQYN2OQQCEEG
X-MailFrom: prvs=700313c41c=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RWKWZTLGPFPZ6VXPB27EQYN2OQQCEEG/>
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
index 5435b11..7c36655 100644
--- a/ucm2/sof-soundwire/cs35l56-bridge.conf
+++ b/ucm2/sof-soundwire/cs35l56-bridge.conf
@@ -2,11 +2,11 @@

 LibraryConfig.remap.Config {
 	ctl.default.map {
-		"name='Speaker Digital Switch'" {
+		"name='Speaker Combined Switch'" {
 			"name='AMPL Speaker Switch'".vindex.0 0
 			"name='AMPR Speaker Switch'".vindex.1 0
 		}
-		"name='Speaker Digital Volume'" {
+		"name='Speaker Combined Volume'" {
 			"name='AMPL Speaker Volume'".vindex.0 0
 			"name='AMPR Speaker Volume'".vindex.1 0
 		}
@@ -56,6 +56,6 @@ SectionDevice."Speaker" {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId},0"
 		PlaybackMixer "default:${CardId}"
-		PlaybackMixerElem "Speaker Digital"
+		PlaybackMixerElem "Speaker Combined"
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

