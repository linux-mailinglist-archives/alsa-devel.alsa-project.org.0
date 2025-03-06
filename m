Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B81F8A54B3D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Mar 2025 13:55:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAB76603D8;
	Thu,  6 Mar 2025 13:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAB76603D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741265711;
	bh=bBcZ9ABLANw0m43KLoo+f6Pi3K1Mjs5DqMhw6S0nBPM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YALvWJ+5kNPcSp2Sp/PkohDKhZtG8p1MswGtnbtIXVxucF2475UK3jp7oAk+syt04
	 WdvDrDfIHtswebdgfwZ79kyT1AZp0P2Y9iV+Rcwx2PC6HRWUck9TcAZ6Mc/CI319Ug
	 7NV+qE2/4mkm+Kps48Hqu2HN5LEvisHT+mJJKeGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 111A0F805B3; Thu,  6 Mar 2025 13:54:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D21EF805BD;
	Thu,  6 Mar 2025 13:54:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C00AF804B0; Thu,  6 Mar 2025 13:54:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70F5EF8011B
	for <alsa-devel@alsa-project.org>; Thu,  6 Mar 2025 13:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F5EF8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SXLcQr+l
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 5264MlXx028765;
	Thu, 6 Mar 2025 06:54:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=DtoCK8jw6C/y9f59
	b02KKkBHYUairlbU3HgbdnmjOjs=; b=SXLcQr+lEEt+T3QBeUrxy2CxglO7Hqjf
	N0lUb6Q2N4aePbWq30UKEepfQexWapE2MwQiuUQqmNivVbFnOUAzXvuCjaQsUoaV
	ULOQ0qwfS5XOrF24XHCSDHGBf+foMTBUYCasHZKobXulVo5bg6EGsmaZIH8+CrxC
	Xvl7jZo/DJli9uYs7QkRLKmjSXzYb+4mGL5zXkfgt+YGtlrg3mosZhPFWsGBDNYd
	ewkVweu8VyMJBptMv0IHIO4ZDR/9aHq2TEOgvoGBA/CFFcrP67/oRMzQ/1xeItJo
	yGBYrVoVy7CtOLK4yj/e7PMNONr9rh8kbu8L2n35f/xr3mWTs+ZOtQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4571nu1283-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 06:54:04 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Mar
 2025 12:54:02 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 12:54:02 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9CD60820248;
	Thu,  6 Mar 2025 12:54:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf] sof-soundwire: Split cs42l43 dmic
 initialisation
Date: Thu, 6 Mar 2025 12:54:02 +0000
Message-ID: <20250306125402.1741562-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: y5LN-o2H50n6wH48bl5uzSghbNUAi4mR
X-Authority-Analysis: v=2.4 cv=Lqxoymdc c=1 sm=1 tr=0 ts=67c99aec cx=c_pps
 a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17
 a=Vs1iUdzkB0EA:10 a=w1d2syhTAAAA:8 a=dpcNpdP63YbFYX7TTaEA:9
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: y5LN-o2H50n6wH48bl5uzSghbNUAi4mR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LJU2L4KODC4WO7GS2K3CRRCNKLUJCO4L
X-Message-ID-Hash: LJU2L4KODC4WO7GS2K3CRRCNKLUJCO4L
X-MailFrom: prvs=216027eb45=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJU2L4KODC4WO7GS2K3CRRCNKLUJCO4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Split the initialisation of cs42l43 into a headset part and a dmic
part. This will prevent the dmic mute controls getting attached to
the mute LED when the codec dmics are not being used.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 ucm2/codecs/cs42l43-dmic/init.conf    | 23 +++++++++++++++++++++++
 ucm2/codecs/cs42l43/init.conf         | 11 +----------
 ucm2/sof-soundwire/sof-soundwire.conf |  2 +-
 3 files changed, 25 insertions(+), 11 deletions(-)
 create mode 100644 ucm2/codecs/cs42l43-dmic/init.conf

diff --git a/ucm2/codecs/cs42l43-dmic/init.conf b/ucm2/codecs/cs42l43-dmic/init.conf
new file mode 100644
index 0000000..441d082
--- /dev/null
+++ b/ucm2/codecs/cs42l43-dmic/init.conf
@@ -0,0 +1,23 @@
+# cs42l43 specific control settings
+
+LibraryConfig.remap.Config {
+	ctl.default.map {
+		"name='cs42l43 Microphone Capture Switch'" {
+			"name='cs42l43 Decimator 3 Switch'".vindex.0 0
+			"name='cs42l43 Decimator 4 Switch'".vindex.1 0
+		}
+		"name='cs42l43 Microphone Capture Volume'" {
+			"name='cs42l43 Decimator 3 Volume'".vindex.0 0
+			"name='cs42l43 Decimator 4 Volume'".vindex.1 0
+		}
+	}
+}
+
+FixedBootSequence [
+	cset "name='cs42l43 Decimator 3 Switch' 0"
+	cset "name='cs42l43 Decimator 4 Switch' 0"
+	exec "-/sbin/modprobe snd_ctl_led"
+	sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 3 Switch"
+	sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 4 Switch"
+]
+
diff --git a/ucm2/codecs/cs42l43/init.conf b/ucm2/codecs/cs42l43/init.conf
index 0fbb517..8e41a0f 100644
--- a/ucm2/codecs/cs42l43/init.conf
+++ b/ucm2/codecs/cs42l43/init.conf
@@ -2,14 +2,6 @@
 
 LibraryConfig.remap.Config {
 	ctl.default.map {
-		"name='cs42l43 Microphone Capture Switch'" {
-			"name='cs42l43 Decimator 3 Switch'".vindex.0 0
-			"name='cs42l43 Decimator 4 Switch'".vindex.1 0
-		}
-		"name='cs42l43 Microphone Capture Volume'" {
-			"name='cs42l43 Decimator 3 Volume'".vindex.0 0
-			"name='cs42l43 Decimator 4 Volume'".vindex.1 0
-		}
 		"name='cs42l43 Headset Microphone Capture Switch'" {
 			"name='cs42l43 Decimator 1 Switch'".vindex.0 0
 		}
@@ -20,8 +12,7 @@ LibraryConfig.remap.Config {
 }
 
 FixedBootSequence [
+	cset "name='cs42l43 Decimator 1 Switch' 0"
 	exec "-/sbin/modprobe snd_ctl_led"
 	sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 1 Switch"
-	sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 3 Switch"
-	sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 4 Switch"
 ]
diff --git a/ucm2/sof-soundwire/sof-soundwire.conf b/ucm2/sof-soundwire/sof-soundwire.conf
index 96d2966..57e5610 100644
--- a/ucm2/sof-soundwire/sof-soundwire.conf
+++ b/ucm2/sof-soundwire/sof-soundwire.conf
@@ -114,7 +114,7 @@ If.hs_init {
 If.mic_init {
 	Condition {
 		Type RegexMatch
-		Regex "(rt712-dmic|rt713-dmic|rt715(-sdca)?)"
+		Regex "(cs42l43-dmic|rt712-dmic|rt713-dmic|rt715(-sdca)?)"
 		String "${var:MicCodec1}"
 	}
 	True.Include.mic_init.File "/codecs/${var:MicCodec1}/init.conf"
-- 
2.39.5

