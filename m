Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23A58307E5
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 15:22:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEFCF741;
	Wed, 17 Jan 2024 15:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEFCF741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705501336;
	bh=gBXig6yrbUZ7fl7A3+H0pbhgdT/XeenlNfzptqQ2+Lg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VPOwdC2tAnBsfavBV/3BILgmK+7hg6YdeqMkuOH/Vy+jV0fx8qZFFnKqZ0HsHVQQZ
	 rSP2wzC7XdduQFugXbecntoHCVp4nRLx5NRk3bCaOj0Xx0nVZ1vrVBH95kiQNj/X+n
	 +uz5G98xN/cuVJ9Mo5oNaD3qL/5TrlQ6EryTGK3A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A60B2F8057C; Wed, 17 Jan 2024 15:21:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12027F8057C;
	Wed, 17 Jan 2024 15:21:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D4BF801F5; Wed, 17 Jan 2024 15:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB533F800F5
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 15:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB533F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qU1wYMRP
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40H7vaoN013800;
	Wed, 17 Jan 2024 08:21:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=c
	ZQSvnfYjXbv/aQ9bG3QxL4suf3OX5AYP9Se7D78djE=; b=qU1wYMRPuvc9zJkUT
	psxM5bJ+IU2+kJJINg/4foyyW45i+6VRYTmOKyrsmKstx+OH/16QmaMZYqp3emeR
	Sh6ip9x8tSyLm2EGCPs/bux+ZQCP7dUSfnncMDryfIjFcAci+vwjN6hXdJudGur3
	h7LwUUuzd4f7ov0AafmNF01ePDpLxyLecGh6z4YLWwXZDwKhG63Q9bwp5oBlv1ap
	SBCToIhLS8RlWI+YCeSQsXeDq0Jru7gVK8Mg+cPgcf2ZBvFca5KCXzPnm0UF800a
	G+5M2Wt3/kwEdPGBYjiNrDTVtOKyGi1N8DjDR5Zit1y4UgAWY3RdUL/4YaJjZJBI
	O+OtQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vkqtn5jfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 08:21:27 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 17 Jan
 2024 14:21:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 17 Jan 2024 14:21:25 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.251.45])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DFAD911D3;
	Wed, 17 Jan 2024 14:21:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <chao.song@linux.intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf v4] sof-soundwire: Add basic support for cs42l43
Date: Wed, 17 Jan 2024 14:21:25 +0000
Message-ID: <20240117142125.1080500-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _HrrjzskcptWxIE1st3l_3zSyjuok6jP
X-Proofpoint-GUID: _HrrjzskcptWxIE1st3l_3zSyjuok6jP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MBYG6DSKYRDMQ4L7BUHA22PD6L27TOLX
X-Message-ID-Hash: MBYG6DSKYRDMQ4L7BUHA22PD6L27TOLX
X-MailFrom: prvs=8746f69faa=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBYG6DSKYRDMQ4L7BUHA22PD6L27TOLX/>
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

No changes just a resend of v4.

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
2.30.2

