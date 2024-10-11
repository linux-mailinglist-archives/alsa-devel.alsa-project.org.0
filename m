Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B0999A227
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 12:58:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45325828;
	Fri, 11 Oct 2024 12:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45325828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728644303;
	bh=bnC6XoBKVEBs6k1SoGJQHII4T0GLZl4Gs2hAY2zd1OE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d2nua/JaaUQp3Rt25v4BSsSgkk78pxZdTVQqKJhEU80uGoAcLajXMyGJ2et3AWLu8
	 TGE8FMTuTKHzuAz9xwLFO1FXXyAQA0vOZB8VmwdxZ/wWd4buP1xxGH6gvzZ/2LIlmw
	 aKqULJpv6/t46QTRp8dfDdKKBuzRULNx387oXHfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D1AEF805E5; Fri, 11 Oct 2024 12:57:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB656F805AF;
	Fri, 11 Oct 2024 12:57:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44717F80528; Fri, 11 Oct 2024 12:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48F67F80496
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 12:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48F67F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=K/bPnTjK
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49B6HNLC001583;
	Fri, 11 Oct 2024 05:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SCVTn4X1Uni6FnQclFvVa/jdaZKepvH1P7SvXe15/xI=; b=
	K/bPnTjKCeDH2haM3fI+EC1L6YYZu8Lo3jxpBHf5Z3yBXyNx8oSyzqHKqvUgBJ9k
	Kdfuh35cQBWeZFaDlPK1hdwSn336M7ro98t7DXAmsVVGnHFOFI58TjE6RXCEEP0x
	ClSMMGsRmCIWJorqToRx5jEW9nEB9QnurZDZYy6HBMDNwZ/Ncz6BeW/Fr/mR1AQF
	IJgYvCmuAHJproRxnZDLacvtPkj1Xjr5yagQhqFtbQ7JM/GfCM79+Bt4+BwV0HYZ
	19OOeltk8wGCNRBzG8xkVGX9Ai32xFmpXBI/oPtanktiMHqERZCe1otc0TGPmi/F
	rm+v/jaaj4UfbR9kcFykuw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4232uy97qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 05:57:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 11:57:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 11 Oct 2024 11:57:15 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1AE9882024B;
	Fri, 11 Oct 2024 10:57:15 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf v3 2/2] sof-soundwire: Add sequence for
 controlling Mic Mute LED
Date: Fri, 11 Oct 2024 11:57:10 +0100
Message-ID: <20241011105710.1998823-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241011105710.1998823-1-mstrozek@opensource.cirrus.com>
References: <20241011105710.1998823-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZRmWp74KaqWr633fBzi6_v4GRZD-MzQ4
X-Proofpoint-ORIG-GUID: ZRmWp74KaqWr633fBzi6_v4GRZD-MzQ4
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6UHJAWBBB2YXFAVM44JKZEPGRBKHDPV6
X-Message-ID-Hash: 6UHJAWBBB2YXFAVM44JKZEPGRBKHDPV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UHJAWBBB2YXFAVM44JKZEPGRBKHDPV6/>
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
index 7e74fb8..af3fd03 100644
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

