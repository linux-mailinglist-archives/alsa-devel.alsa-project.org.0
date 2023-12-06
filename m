Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFD8071CA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 15:09:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83091CF;
	Wed,  6 Dec 2023 15:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83091CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701871745;
	bh=+9U7lTLXFmXO4cGfsSfbvjsmVcPVaWiLU8wGYpgmDRA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LynfWgOW5rGAJQTRrXRW2+rwGnGL3c9SwhlfUeQ9TB6Kwxg+Ro0N4/pF3w2o9d83p
	 sszMEXTAp9hVbLsbs7XGBZvtRWh+Et51rODRxPRv8LXxpmnubci13G23/0LHe+Bwkd
	 eK8JP4vktdeTzUkq4ifc12w+0p5oGu5tEDRZbvrQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A80AF805AD; Wed,  6 Dec 2023 15:08:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37251F80570;
	Wed,  6 Dec 2023 15:08:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 157E2F8024E; Wed,  6 Dec 2023 15:06:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DD6CF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 15:05:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DD6CF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=elEwlyl+
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B69KGJC027934;
	Wed, 6 Dec 2023 08:05:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=k
	NGwJRuCDSQPDWHxSRcWN5IiutDcB9RgwlpBxLTtnaY=; b=elEwlyl+lPYmOpvST
	RcTvVlMNcuZA4u6vv2KjDkysrMDYgsEJIMyWf5q1JzB/bGqd7LveHsboHQGt7Gy+
	xCjxJyHim3vSoZ0r8KvYY7YawYfHH9sifUQ06edHvjIIHNspYPD+oD2/6GzxRoBw
	0JNnh+TnRDKQSdtNUNgMaA+1mRay4B2ORsFtkDfwfsQ0MEilxa2JQVfh107fBTns
	cRfKISC3+uvsNVOLtXOfglT2R/HT6O/xN4V2PqVEWHpb9GERvhNYHFjTZ+pk41ij
	OtjRYVHqzEtFJpLSufv6ODBZbTzC8Numnfibod7XKp7rg8z70YxZDr7Ad75gI/h8
	fyePw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3utd1w8rw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 08:05:49 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 14:05:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 6 Dec 2023 14:05:47 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52D0811AB;
	Wed,  6 Dec 2023 14:05:47 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf v2 1/2] sof-soundwire: Add basic support for
 cs42l43
Date: Wed, 6 Dec 2023 14:05:46 +0000
Message-ID: <20231206140547.1344041-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AmMydDG0nyz-xFEmiSl11sEfRgx5pqXB
X-Proofpoint-ORIG-GUID: AmMydDG0nyz-xFEmiSl11sEfRgx5pqXB
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: X7MTVR7YXBWDHL7RPHMBNHV6PRJE4A5Q
X-Message-ID-Hash: X7MTVR7YXBWDHL7RPHMBNHV6PRJE4A5Q
X-MailFrom: prvs=77042597b4=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7MTVR7YXBWDHL7RPHMBNHV6PRJE4A5Q/>
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
 ucm2/sof-soundwire/cs42l43-dmic.conf | 28 +++++++++++++++++
 ucm2/sof-soundwire/cs42l43.conf      | 47 ++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 ucm2/sof-soundwire/cs42l43-dmic.conf
 create mode 100644 ucm2/sof-soundwire/cs42l43.conf

diff --git a/ucm2/sof-soundwire/cs42l43-dmic.conf b/ucm2/sof-soundwire/cs42l43-dmic.conf
new file mode 100644
index 0000000..bf59eca
--- /dev/null
+++ b/ucm2/sof-soundwire/cs42l43-dmic.conf
@@ -0,0 +1,28 @@
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
+		cset "name='cs42l43 Decimator 3 Switch' on"
+		cset "name='cs42l43 Decimator 4 Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='cs42l43 Decimator 3 Switch' off"
+		cset "name='cs42l43 Decimator 4 Switch' off"
+		cset "name='cs42l43 DP1TX1 Input' 'None'"
+		cset "name='cs42l43 DP1TX2 Input' 'None'"
+	]
+
+	Value {
+		CapturePriority 100
+		CapturePCM "hw:${CardId},4"
+	}
+}
diff --git a/ucm2/sof-soundwire/cs42l43.conf b/ucm2/sof-soundwire/cs42l43.conf
new file mode 100644
index 0000000..378dbb2
--- /dev/null
+++ b/ucm2/sof-soundwire/cs42l43.conf
@@ -0,0 +1,47 @@
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
+		CaptureVolume "cs42l43 Decimator 1 Volume"
+		CaptureSwitch "cs42l43 Decimator 1 Switch"
+		JackControl "Headset Mic Jack"
+	}
+}
-- 
2.39.2

