Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD79A2219
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2024 14:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F3C86F;
	Thu, 17 Oct 2024 14:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F3C86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729167680;
	bh=52vEEwA8gtfAge+VYcvMq4slxAqma4t8jc7RN1yRO0Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iQH50U9pqr4GblVtRrPfCEjKmbjiHP6NHy0qOWeIM7hWtiWzozq2IRIvaVwzEi1Qj
	 ct6Eeq7KlZv79Q2tqHFQnHwRjxUz+zpmZMIRVZFdKybrYeEEGk8MC8MEHmHjD7Y2Gj
	 PnEnJGu6FxUJx4iRNObX/lW6B7SoTDRVpuUkshCM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54090F805AF; Thu, 17 Oct 2024 14:20:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86AE5F8016B;
	Thu, 17 Oct 2024 14:20:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC5DF804F3; Thu, 17 Oct 2024 14:20:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D51D4F8032D
	for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2024 14:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D51D4F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=N4p2DoB8
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49HArUw8027482;
	Thu, 17 Oct 2024 07:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Mqmx+AiUIn5s4+sMk1u4j03hz2qCBTRzgplSKIJS3VU=; b=
	N4p2DoB8/abKPDs6dJ3StVBrSRXYzXYVy4Ddl4VFnMhCGF35bnpVFeF66K/tx8xc
	2Je0tTmwjiFzqQQeBaRiCf4zRN81WBm8mosX3uKG4DzJzr59BT1IkHBKe31Jljj5
	qCz9FeuhDTBYJxKes5vaMzBYiobNKnnepchvxQt45xl0OV5CH2XQ8XhwrwNZ5ko9
	rD2zsxGNMtgFm03x3r/AxVcmyPrzxg23H6JrI0O0PlV+6BB+4y32SMNXMXaE20El
	4wiOzmDWWYUE+Y9YusYS4ZXqHr9jZ4HL6qRm8wGHkGTzjoFSMXNNtKccFKsArWA3
	7hiGVXF0/Akdnn/awOWjmA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 427nhk5y82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 07:20:30 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 13:20:29 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 17 Oct 2024 13:20:29 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 140C182024B;
	Thu, 17 Oct 2024 12:20:29 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf v5 2/2] sof-soundwire: Add sequence for
 controlling Mic Mute LED
Date: Thu, 17 Oct 2024 13:20:27 +0100
Message-ID: <20241017122027.1207373-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241017122027.1207373-1-mstrozek@opensource.cirrus.com>
References: <20241017122027.1207373-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YIFA4raEkxA1wERMqGJgkmP8wVZ-4ho7
X-Proofpoint-ORIG-GUID: YIFA4raEkxA1wERMqGJgkmP8wVZ-4ho7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SGAPWR4ZUNCUUGYWX3QYJY5AHEENDSC4
X-Message-ID-Hash: SGAPWR4ZUNCUUGYWX3QYJY5AHEENDSC4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGAPWR4ZUNCUUGYWX3QYJY5AHEENDSC4/>
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
v5: no changes
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

