Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD19A1EF2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2024 11:50:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B4E1207;
	Thu, 17 Oct 2024 11:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B4E1207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729158655;
	bh=zpGpd8k/QmdFdWxYZETNPIj88H6+/nAoDWS/HIN+8do=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A2ZKQ/gHX8Kz5TS/th0w61D9rtr2m/XHYH2+cqXmo2jJ7oWpMwyAr51aut2/g6baF
	 cibvPK8b+tFdTvFgo8Kdwsoc5Xkk/WvL226lkCYAZnGqZHWRkOGuTtB4jZeJKJZ2sx
	 A9wVR5nltVlQIVagQytIeYxZZljqPMmnUBAb+X6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4A12F805E4; Thu, 17 Oct 2024 11:50:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB0BCF805D7;
	Thu, 17 Oct 2024 11:50:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 197B2F805C3; Thu, 17 Oct 2024 11:50:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E52E9F80579
	for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2024 11:50:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52E9F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CEtvGjZK
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49H5Vms2004939;
	Thu, 17 Oct 2024 04:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=FEdVeUtMDmI8nzgq
	BVY+akjz2//1USId6rGJrrCwSWU=; b=CEtvGjZKRp9xy6QSMTDkB9mNEckieJKG
	OYCGNG/1lT6cH35ZLjU5TDYH5y7eOnTvn6unSwjTFebx+8JRsDINFpxKhLjGj1Uq
	FSBScIxjbkVd+1hBy30eayd/GH8Rl8CnqtsHpwZ/nPGOovVNbPTVAMjtG2+WXwdI
	omS8i8hKlyjDJ8xz8nRLODPTKLhM6UDple9STZllHHOVmVVM4tYat9NvCSdDU5+/
	5W90n0j2TRCgtgVJUUbFb2gBUhqrJ1pC6MVMwLwErNWpI677Si5TX77/hGiO8+G5
	W4B5JAZX+x2YU5tQoynWnuv2gyIJVpEOUCz1nNPa/mssjIFHoab1uw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 427nhk5tys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 04:50:08 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 10:49:45 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 17 Oct 2024 10:49:45 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 72C59820248;
	Thu, 17 Oct 2024 09:49:45 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf v4 1/2] sof-soundwire: Change map control names
 to make them unique and user friendly
Date: Thu, 17 Oct 2024 10:49:43 +0100
Message-ID: <20241017094944.950632-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wzWwHdxC0F_k2l72DoEOx6EPRsWOOJ1A
X-Proofpoint-ORIG-GUID: wzWwHdxC0F_k2l72DoEOx6EPRsWOOJ1A
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QEMUHL2OMIRFZV73SELSICR4BLFQSAPI
X-Message-ID-Hash: QEMUHL2OMIRFZV73SELSICR4BLFQSAPI
X-MailFrom: prvs=7020e5b0b2=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEMUHL2OMIRFZV73SELSICR4BLFQSAPI/>
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
v4: Add "CaptureMixer" to headset config
v3: Make Headset Microphone more user-friendly and contain the word "Capture"
v2: Rename to "Speaker Playback" instead of "Speaker Combined"
---
 ucm2/codecs/cs42l43/init.conf          | 10 ++++++++--
 ucm2/sof-soundwire/cs35l56-bridge.conf |  6 +++---
 ucm2/sof-soundwire/cs42l43-dmic.conf   |  2 +-
 ucm2/sof-soundwire/cs42l43.conf        |  3 ++-
 4 files changed, 14 insertions(+), 7 deletions(-)

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
index 1702cf0..ddca67a 100644
--- a/ucm2/sof-soundwire/cs42l43.conf
+++ b/ucm2/sof-soundwire/cs42l43.conf
@@ -40,7 +40,8 @@ SectionDevice."Headset" {
 	Value {
 		CapturePriority 200
 		CapturePCM "hw:${CardId},4"
-		CaptureMixerElem "cs42l43 Decimator 1"
+		CaptureMixer "default:${CardId}"
+		CaptureMixerElem "cs42l43 Headset Microphone"
 		JackControl "Headset Mic Jack"
 	}
 }
--
2.39.5

