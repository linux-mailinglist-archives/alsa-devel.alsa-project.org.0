Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A389A1EEE
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2024 11:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74D6C850;
	Thu, 17 Oct 2024 11:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74D6C850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729158633;
	bh=UFu0SDfC91tkSQ9NhYa7rDxhtSdj4Go4hPP/KcNxNIo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F9nFik08QeTLlIR9DksR1fPqze8E+48dSsJq7n1xqwpWglwuYYyaZSwF7Qn7617sN
	 ZPDZQsfKZTRyNkhLm6yc2W6oaUwJB2SheZcXiA9BEeNVGpzf2jSRDiFNP8Gcjuny8y
	 QUup5TES4kNFChi3UI5YVJOe8EBl88zURcHlenoI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 281E5F805B5; Thu, 17 Oct 2024 11:50:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C16CF805A9;
	Thu, 17 Oct 2024 11:50:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F843F80448; Thu, 17 Oct 2024 11:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C95BF80149
	for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2024 11:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C95BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SU3G8hbE
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49GNNjmt009535;
	Thu, 17 Oct 2024 04:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hW1H9nMqrhhhNxordSUu/xf4Vx348qh5xHjWwdc2gOY=; b=
	SU3G8hbE0FBX52cMNKYuiyQeXmLY1iayky8dpEGNljjmRcTpl9wOUd5OPQIowNKu
	TrwQuOv3E3jNWF0e3QlRqMh8tZp5S/D0Pp449ze8rdwGZ5h+sUfArWxYvEo8F7Ui
	hY6WmM0VW+QadiHVfNY1gGjfO+Mwe83iTnG5WPramHcmcncomB0nEDhDTRSMgwTI
	O6nmp0mWl345UNEwHgkp2PFcIVu+E+Ot488PYAIwpygkXt5ymny15ukD7+IQHIn/
	lcqXmtqf5SaBc5Oh6wZ0I1DlN4vL51wiVy6DDkmAl7W3ZWp296go+EsMHiOaCXcM
	lOvP0k/+2kKbJP3T2acYZA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 427pgxp856-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 04:49:47 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 10:49:45 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 17 Oct 2024 10:49:45 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 765FC82024B;
	Thu, 17 Oct 2024 09:49:45 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf v4 2/2] sof-soundwire: Add sequence for
 controlling Mic Mute LED
Date: Thu, 17 Oct 2024 10:49:44 +0100
Message-ID: <20241017094944.950632-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241017094944.950632-1-mstrozek@opensource.cirrus.com>
References: <20241017094944.950632-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hEyuL2HO7FpgZF4JRDhq9VwjK0lKF0Jl
X-Proofpoint-ORIG-GUID: hEyuL2HO7FpgZF4JRDhq9VwjK0lKF0Jl
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2ZMJXAQCIH47T3IIVY5IFZ6L522RN3QC
X-Message-ID-Hash: 2ZMJXAQCIH47T3IIVY5IFZ6L522RN3QC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZMJXAQCIH47T3IIVY5IFZ6L522RN3QC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Also ensure the unused microphone is disabled so that currently used mic
can fully control the LED.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
v4: no changes
v3: Add Headset Microphone, ensure unused mic is disabled
v2: no changes
---
 ucm2/codecs/cs42l43/init.conf        | 7 +++++++
 ucm2/sof-soundwire/cs42l43-dmic.conf | 2 ++
 ucm2/sof-soundwire/cs42l43.conf      | 1 +
 3 files changed, 10 insertions(+)

diff --git a/ucm2/codecs/cs42l43/init.conf b/ucm2/codecs/cs42l43/init.conf
index b2796e2..c2f52ad 100644
--- a/ucm2/codecs/cs42l43/init.conf
+++ b/ucm2/codecs/cs42l43/init.conf
@@ -18,3 +18,10 @@ LibraryConfig.remap.Config {
 		}
 	}
 }
+
+FixedBootSequence [
+        exec "-/sbin/modprobe snd_ctl_led"
+        sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 1 Switch"
+        sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 3 Switch"
+        sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:cs42l43 Decimator 4 Switch"
+]
diff --git a/ucm2/sof-soundwire/cs42l43-dmic.conf b/ucm2/sof-soundwire/cs42l43-dmic.conf
index b68a70d..70ce40f 100644
--- a/ucm2/sof-soundwire/cs42l43-dmic.conf
+++ b/ucm2/sof-soundwire/cs42l43-dmic.conf
@@ -13,6 +13,8 @@ SectionDevice."Mic" {
 	]

 	DisableSequence [
+		cset "name='cs42l43 Decimator 3 Switch' 0"
+		cset "name='cs42l43 Decimator 4 Switch' 0"
 		cset "name='cs42l43 DP1TX1 Input' 'None'"
 		cset "name='cs42l43 DP1TX2 Input' 'None'"
 	]
diff --git a/ucm2/sof-soundwire/cs42l43.conf b/ucm2/sof-soundwire/cs42l43.conf
index ddca67a..dc11840 100644
--- a/ucm2/sof-soundwire/cs42l43.conf
+++ b/ucm2/sof-soundwire/cs42l43.conf
@@ -33,6 +33,7 @@ SectionDevice."Headset" {
 	]

 	DisableSequence [
+		cset "name='cs42l43 Decimator 1 Switch' 0"
 		cset "name='cs42l43 DP1TX1 Input' 'None'"
 		cset "name='cs42l43 DP1TX2 Input' 'None'"
 	]
--
2.39.5

