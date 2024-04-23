Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A5D8AEB5B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 17:43:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBBE14E6;
	Tue, 23 Apr 2024 17:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBBE14E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713887037;
	bh=VF5/Sec0n6Cv8p5GNgovR3lfxCPanV1UA1P9ASmMFKY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T9Cm+pmoIwhl15GnHOtnG6XrRQc2MLV742jBemvjqVhfCrovYbMuRyVWf0wDCPMaw
	 2d7CiW4ar593AaBdFGKl4NUwsMjqa5oUKqMLhnHS1gcKOPPree7wT1zx5GfL3SOX0n
	 4vQO9dWtbrbASFCvzwwLUaZEjSjv+bpVwzwicM/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57AB6F805AB; Tue, 23 Apr 2024 17:43:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C4ADF805A0;
	Tue, 23 Apr 2024 17:43:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 540E8F80423; Tue, 23 Apr 2024 17:43:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72AE1F8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 17:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72AE1F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=h8j0RWbV
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43N5qORd019606;
	Tue, 23 Apr 2024 10:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=p
	qCXY0F/hH5vE3n5vzvGnl1NWHE0FIkwzef1pxPp3HM=; b=h8j0RWbVKY1mcxoni
	v6umdZLoopSjSx2m+pXM/i1RRqJqTWfhjlHMLzXY755L5ve7QJsEsd3uRmcyj8cq
	LvCc7GoFfNvZhAFw+hdH+dJw1wEj8Gd8ilZjX0XhM52rGerv6W07jcYIOlS2g0iZ
	nuj5SLq34pJCQtSNb3KylUr/Zrt0t2P2ApFl8k0kQ5kn/lq3ikRsRnl32q9hM68q
	qpaQnMInshWphEJ85UZV/GgWm7xpZCOkNNtInnzUMj+9BtHJnB3rG6XFx+MDo0P2
	Xv6zMxl7oKSFQuLFdIVZaf1WTIhBltEDa0U2J2wE2x8gDCxkTIvhzL4r3FrGyyTk
	XoWbQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xmqmh29bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 10:43:09 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 16:43:05 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 23 Apr 2024 16:43:05 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BE99A820243;
	Tue, 23 Apr 2024 15:43:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf] sof-soundwire: Add basic support for cs42l43's
 speaker
Date: Tue, 23 Apr 2024 16:43:05 +0100
Message-ID: <20240423154305.2782347-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wO1e9wE5kDJLrxsbfio6vqx-EDZJ8q4u
X-Proofpoint-GUID: wO1e9wE5kDJLrxsbfio6vqx-EDZJ8q4u
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4VA4FJFXNMPLU33ZPX74OBUVTKMXULJ5
X-Message-ID-Hash: 4VA4FJFXNMPLU33ZPX74OBUVTKMXULJ5
X-MailFrom: prvs=184338f5c6=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4VA4FJFXNMPLU33ZPX74OBUVTKMXULJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Previous support was added for the mics and headset on cs42l43, expand
this support with additional configuration for the speaker output.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 ucm2/sof-soundwire/cs42l43-spk.conf | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 ucm2/sof-soundwire/cs42l43-spk.conf

diff --git a/ucm2/sof-soundwire/cs42l43-spk.conf b/ucm2/sof-soundwire/cs42l43-spk.conf
new file mode 100644
index 0000000..73f1299
--- /dev/null
+++ b/ucm2/sof-soundwire/cs42l43-spk.conf
@@ -0,0 +1,25 @@
+# Use case Configuration for sof-soundwire card
+
+SectionDevice."Speaker" {
+	Comment "Speaker"
+
+	ConflictingDevice [
+		"Headphones"
+	]
+
+	EnableSequence [
+		cset "name='cs42l43 Speaker L Input 1' 'DP5RX1'"
+		cset "name='cs42l43 Speaker R Input 1' 'DP5RX2'"
+	]
+
+	DisableSequence [
+		cset "name='cs42l43 Speaker L Input 1' 'None'"
+		cset "name='cs42l43 Speaker R Input 1' 'None'"
+	]
+
+	Value {
+		PlaybackPriority 100
+		PlaybackPCM "hw:${CardId},0"
+		PlaybackMixerElem "cs42l43 Speaker Digital"
+	}
+}
-- 
2.39.2

