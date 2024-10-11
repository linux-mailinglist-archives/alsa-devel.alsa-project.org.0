Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BCA99A226
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 12:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3F0AB60;
	Fri, 11 Oct 2024 12:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3F0AB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728644289;
	bh=fqNWX9aJ4eQahTMafLFccTpsclKWxBQcLRTn0YneEJE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NLIm6YERy7P76FcYM5lIJnkUp5xqMNOZl31OBRapRvAJ6R7FbJFEWM+Qn0JSsBNg3
	 vSaigP8O5YW8GJ6W080jAg6BanUe/L7CgsjmkKSYCIni+1zJGBDbSJUX0Xp0aZgsUs
	 Cqggb/RR3W5QQ7W3zHdfOgs4arCiCteIOxRE5qFw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58D8DF805C3; Fri, 11 Oct 2024 12:57:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC046F805B1;
	Fri, 11 Oct 2024 12:57:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDA64F80528; Fri, 11 Oct 2024 12:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 704A9F80496
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 12:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 704A9F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NJMqXs4U
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49B4pl5H015709;
	Fri, 11 Oct 2024 05:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Fq85ne27V4BxqUHf
	HjoSy3gS5VgWSSoTeX/P9lG8bcs=; b=NJMqXs4U6kaP9Gwq3xLZ5moBwa+d1Twi
	AP596bjLRKyFwkWUynsIdhVPOcoUyYvrtbS/vZ3JhU7ZZferYzsmLf8Q0spIFBmW
	UmWtNf8gd+1oHMqvwkeFSBXVIWtZie70DCtj0d7etgQafdfgqONGdn1lz85p9t9i
	3f/M62vXnpI4E3fZ+qf/Ijl91IyXHcvZgReyw+IPd0I2W/aI/I5lwaLPTk6t+GfJ
	+aA3nii5qYkvGQxgk18uyvIgJDWv1T5I6t5gIyVYvSuQ7DlroH9o5VdbUwGBrj2S
	tSoeT3Nm2npv/OJHjiGpwgtQ6alTPW7nFZ+fsIbl7I+5vcg4WR5BNQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4231vj0jph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 05:57:16 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 11:57:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 11 Oct 2024 11:57:15 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 16A2D820248;
	Fri, 11 Oct 2024 10:57:15 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf v3 1/2] sof-soundwire: Change map control names
 to make them unique and user friendly
Date: Fri, 11 Oct 2024 11:57:09 +0100
Message-ID: <20241011105710.1998823-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Qe7lwCjOgYKVt6LnC5Ysgjqy9StZ8XIr
X-Proofpoint-ORIG-GUID: Qe7lwCjOgYKVt6LnC5Ysgjqy9StZ8XIr
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: L7KUTCDPWRR3ALX56UAWZNPQKY6TTY3S
X-Message-ID-Hash: L7KUTCDPWRR3ALX56UAWZNPQKY6TTY3S
X-MailFrom: prvs=701410cdec=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7KUTCDPWRR3ALX56UAWZNPQKY6TTY3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Both 'Speaker Digital' and 'cs42l43 PDM2' names were found in other alsa
controls, confusing the MixerElems paths. Make them unique to avoid errors for
hardware mutes. Also add 'Capture' string into microphone controls to make
them work properly.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
v3: Make Headset Microphone more user-friendly and contain the word "Capture"
v2: Rename to "Speaker Playback" instead of "Speaker Combined"
---
 ucm2/codecs/cs42l43/init.conf          | 10 ++++++++--
 ucm2/sof-soundwire/cs35l56-bridge.conf |  6 +++---
 ucm2/sof-soundwire/cs42l43-dmic.conf   |  2 +-
 ucm2/sof-soundwire/cs42l43.conf        |  2 +-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/ucm2/codecs/cs42l43/init.conf b/ucm2/codecs/cs42l43/init.conf
index 10a6e1f..b2796e2 100644
--- a/ucm2/codecs/cs42l43/init.conf
+++ b/ucm2/codecs/cs42l43/init.conf
@@ -2,13 +2,19 @@

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
+		"name='cs42l43 Headset Microphone Capture Switch'" {
+			"name='cs42l43 Decimator 1 Switch'".vindex.0 0
+		}
+		"name='cs42l43 Headset Microphone Capture Volume'" {
+			"name='cs42l43 Decimator 1 Volume'".vindex.0 0
+		}
 	}
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
diff --git a/ucm2/sof-soundwire/cs42l43.conf b/ucm2/sof-soundwire/cs42l43.conf
index 1702cf0..7e74fb8 100644
--- a/ucm2/sof-soundwire/cs42l43.conf
+++ b/ucm2/sof-soundwire/cs42l43.conf
@@ -40,7 +40,7 @@ SectionDevice."Headset" {
 	Value {
 		CapturePriority 200
 		CapturePCM "hw:${CardId},4"
-		CaptureMixerElem "cs42l43 Decimator 1"
+		CaptureMixerElem "cs42l43 Headset Microphone"
 		JackControl "Headset Mic Jack"
 	}
 }
--
2.39.5

