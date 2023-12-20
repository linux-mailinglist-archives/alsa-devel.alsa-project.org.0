Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB5581A5E7
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 18:03:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1018BDEC;
	Wed, 20 Dec 2023 18:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1018BDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703091826;
	bh=l326KXJ2h5/pxMX0mC14yMNgaui0wBlbKqnrXOFvFpc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bF6aPmRuo+iAXlvxUVmJTCOW7zktBJZuT9Nbnv4zf31/TVu10lhmujAPNrtK5Y7w8
	 ehqI6iYF1zskamK4y6hDWQFI8VJPgVgIfFM/dxRuXD2dg27XkXoPod1TqOsMGf4F5J
	 CLImHAPC06ZrDDkiuobW62K2tzoDR93EH8CWcISQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 877F6F805EC; Wed, 20 Dec 2023 18:02:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F44F805D8;
	Wed, 20 Dec 2023 18:02:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19830F8016E; Wed, 20 Dec 2023 18:00:05 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C85EF800D2
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 17:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C85EF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SCDOOPh1
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BKFAuD1013270;
	Wed, 20 Dec 2023 10:59:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=/
	PVWllNrFZWaUHLxYPitsTCB7aPFL4UNw8UtOWI7AEo=; b=SCDOOPh1UIFsRkMMO
	dHXtI/EY1Vkd5PcCr/AoDZUeQbPfIrQ16eut9bUUUbcKETrYrYmA9ieXxb8EZpKY
	B48+Dy34b1C2C/P/AC5HlGUSAhKEUwCVaGSWO7Q9ODZJSyVgZqDnImiTuMcqTjzA
	WgolBl2MEWV+PrMgPMsbts+Ell4FGS0btKNpYMZFpEWO+1vc5WnnbYMFizXPOhWp
	8pJ4oOebvi6HZpqWB88pjaKCq/o8IUPpOBcs5oF4MeanzcMUONvKGK4jone2tWtG
	9xnRnvt3G/WGbKctZ9pcxUlgC/+/HisKlQXu6/dKhH0fCuIeT+j19jSylujC5xxD
	z6s+w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a625t9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 10:59:53 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Dec
 2023 16:59:51 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Wed, 20 Dec 2023 16:59:51 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2861A11CC;
	Wed, 20 Dec 2023 16:59:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: [PATCH v4] sof-soundwire: Add basic support for cs42l43
Date: Wed, 20 Dec 2023 16:59:51 +0000
Message-ID: <20231220165951.3675985-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8q5jUcfuIubYjjGXIpAkr3-hod1Mz2Q-
X-Proofpoint-ORIG-GUID: 8q5jUcfuIubYjjGXIpAkr3-hod1Mz2Q-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VXZLN5ABIDAJ2L5Q72DEQCHWH5UG4MNK
X-Message-ID-Hash: VXZLN5ABIDAJ2L5Q72DEQCHWH5UG4MNK
X-MailFrom: prvs=7718adeda9=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXZLN5ABIDAJ2L5Q72DEQCHWH5UG4MNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

cs42l43 is a codec device, add basic support for it. Including a dual
channel DMIC input, stereo headphones, and a mono headset microphone.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Rebase on GitHub series
 - Add control remapping for the PDM volume/switch

Little earlier than expected, still reviewing the workings behind the
scenes but this all tests out fine. So no need to hold everything up
on my account.

Thanks,
Charles

 ucm2/codecs/cs42l43/init.conf         | 14 ++++++++
 ucm2/sof-soundwire/cs42l43-dmic.conf  | 26 +++++++++++++++
 ucm2/sof-soundwire/cs42l43.conf       | 46 +++++++++++++++++++++++++++
 ucm2/sof-soundwire/sof-soundwire.conf |  2 +-
 4 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 ucm2/codecs/cs42l43/init.conf
 create mode 100644 ucm2/sof-soundwire/cs42l43-dmic.conf
 create mode 100644 ucm2/sof-soundwire/cs42l43.conf

diff --git a/ucm2/codecs/cs42l43/init.conf b/ucm2/codecs/cs42l43/init.conf
new file mode 100644
index 0000000..10a6e1f
--- /dev/null
+++ b/ucm2/codecs/cs42l43/init.conf
@@ -0,0 +1,14 @@
+# cs42l43 specific control settings
+
+LibraryConfig.remap.Config {
+	ctl.default.map {
+		"name='cs42l43 PDM2 Switch'" {
+			"name='cs42l43 Decimator 3 Switch'".vindex.0 0
+			"name='cs42l43 Decimator 4 Switch'".vindex.1 0
+		}
+		"name='cs42l43 PDM2 Volume'" {
+			"name='cs42l43 Decimator 3 Volume'".vindex.0 0
+			"name='cs42l43 Decimator 4 Volume'".vindex.1 0
+		}
+	}
+}
diff --git a/ucm2/sof-soundwire/cs42l43-dmic.conf b/ucm2/sof-soundwire/cs42l43-dmic.conf
new file mode 100644
index 0000000..d5f895d
--- /dev/null
+++ b/ucm2/sof-soundwire/cs42l43-dmic.conf
@@ -0,0 +1,26 @@
+# Use case Configuration for sof-soundwire card
+
+SectionDevice."Mic" {
+	Comment "Microphones"
+
+	ConflictingDevice [
+		"Headset"
+	]
+
+	EnableSequence [
+		cset "name='cs42l43 DP1TX1 Input' 'Decimator 3'"
+		cset "name='cs42l43 DP1TX2 Input' 'Decimator 4'"
+	]
+
+	DisableSequence [
+		cset "name='cs42l43 DP1TX1 Input' 'None'"
+		cset "name='cs42l43 DP1TX2 Input' 'None'"
+	]
+
+	Value {
+		CapturePriority 100
+		CapturePCM "hw:${CardId},4"
+		CaptureMixer "default:${CardId}"
+		CaptureMixerElem "cs42l43 PDM2"
+	}
+}
diff --git a/ucm2/sof-soundwire/cs42l43.conf b/ucm2/sof-soundwire/cs42l43.conf
new file mode 100644
index 0000000..1702cf0
--- /dev/null
+++ b/ucm2/sof-soundwire/cs42l43.conf
@@ -0,0 +1,46 @@
+# Use case Configuration for sof-soundwire card
+
+SectionDevice."Headphones" {
+	Comment "Headphones"
+
+	EnableSequence [
+		cset "name='cs42l43 Headphone L Input 1' 'DP5RX1'"
+		cset "name='cs42l43 Headphone R Input 1' 'DP5RX2'"
+	]
+
+	DisableSequence [
+		cset "name='cs42l43 Headphone L Input 1' 'None'"
+		cset "name='cs42l43 Headphone R Input 1' 'None'"
+	]
+
+	Value {
+		PlaybackPriority 200
+		PlaybackPCM "hw:${CardId},0"
+		PlaybackVolume "cs42l43 Headphone Digital Volume"
+		JackControl "Headphone Jack"
+	}
+}
+
+SectionDevice."Headset" {
+	Comment "Headset Microphone"
+
+	EnableSequence [
+		cset "name='cs42l43 ADC1 Input' 'IN1'"
+		cset "name='cs42l43 Decimator 1 Mode' 'ADC'"
+
+		cset "name='cs42l43 DP1TX1 Input' 'Decimator 1'"
+		cset "name='cs42l43 DP1TX2 Input' 'Decimator 1'"
+	]
+
+	DisableSequence [
+		cset "name='cs42l43 DP1TX1 Input' 'None'"
+		cset "name='cs42l43 DP1TX2 Input' 'None'"
+	]
+
+	Value {
+		CapturePriority 200
+		CapturePCM "hw:${CardId},4"
+		CaptureMixerElem "cs42l43 Decimator 1"
+		JackControl "Headset Mic Jack"
+	}
+}
diff --git a/ucm2/sof-soundwire/sof-soundwire.conf b/ucm2/sof-soundwire/sof-soundwire.conf
index 18b1bf8..35a262c 100644
--- a/ucm2/sof-soundwire/sof-soundwire.conf
+++ b/ucm2/sof-soundwire/sof-soundwire.conf
@@ -47,7 +47,7 @@ DefineRegex {
 If.hs_init {
 	Condition {
 		Type RegexMatch
-		Regex "(rt5682|rt700|rt711|rt713(-sdca)?)"
+		Regex "(cs42l43|rt5682|rt700|rt711|rt713(-sdca)?)"
 		String "${var:HeadsetCodec1}"
 	}
 	True.Include.hs_init.File "/codecs/${var:HeadsetCodec1}/init.conf"
-- 
2.39.2

