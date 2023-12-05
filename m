Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F44C805741
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 15:25:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA438A4D;
	Tue,  5 Dec 2023 15:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA438A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701786306;
	bh=733NKxL4h+wm93HSHEujcT1ATDcM1CePguDygm1Gurg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tXZQFSMkAck5XJ1v4pmg+gwEYwx6TTLo2a2710tIdYq8Z2ccbJYCNLp7KCTgApnyt
	 mfnOjbVcJBRWgh6fEFEw4Edog98iWdSc6ICkhxXoGVQCgiGBhViBPeF6pCevBlLYDX
	 TxZDundbyhBEtdW0LTFJT2uRiIumRsBZdB/PQdv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63183F8024E; Tue,  5 Dec 2023 15:24:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B68DF8025F;
	Tue,  5 Dec 2023 15:24:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7974FF8025A; Tue,  5 Dec 2023 15:24:30 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 93823F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 15:24:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93823F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=q0JfNGpC
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B5AskcD031438;
	Tue, 5 Dec 2023 08:24:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=wsjEGUR0569MHdb3SMMQYhhzcIU8dA3MM8+YXYMq2bE=; b=
	q0JfNGpCXBjjWZv1Hhi9C5jG/3ghdShdwijm3zNqUb+qLE+xfl0O8uprgzbhb4mu
	R9xaTUJ6noAW3SfTISx433hTwW1U7OTYdXJCYd7XdrBcOh0KWdkouAkhV5onEHYM
	1aB3MebdO1B85wxYhZ9enDi747VXwX845+csy6PJt9WiYpmKCT0MBswhWqmd6Tit
	aDobsUt5HlQtROkoSS3ZF1v+aIbB+J5llYmzF+9Lg7039Do6eUgddThU8R2OiV0h
	vIEC8tTj6yy7hwvmUKQGIs0VysPTc7ZY4L69DtA4DqnlYbvoBV2XdPieQg2LR7Fx
	dxURtgqb5Xt4BfJJhzleGg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ur2v23991-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 08:24:23 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 14:24:20 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 5 Dec 2023 14:24:20 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D125811D1;
	Tue,  5 Dec 2023 14:24:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add basic support for a 4x
 cs35l56 configuration
Date: Tue, 5 Dec 2023 14:24:20 +0000
Message-ID: <20231205142420.1256042-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205142420.1256042-1-ckeepax@opensource.cirrus.com>
References: <20231205142420.1256042-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kvhZ5AtE0R2l5o5FDhagjV_HFRUmlFvO
X-Proofpoint-GUID: kvhZ5AtE0R2l5o5FDhagjV_HFRUmlFvO
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: T2VDX4JHFXLHA7ZPLAUYNX27U5YWE4WU
X-Message-ID-Hash: T2VDX4JHFXLHA7ZPLAUYNX27U5YWE4WU
X-MailFrom: prvs=7703bda8c8=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2VDX4JHFXLHA7ZPLAUYNX27U5YWE4WU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

cs35l56 is a boosted speaker amp add UCM support for a 4 amp
configuration.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 ucm2/sof-soundwire/cs35l56-4.conf | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 ucm2/sof-soundwire/cs35l56-4.conf

diff --git a/ucm2/sof-soundwire/cs35l56-4.conf b/ucm2/sof-soundwire/cs35l56-4.conf
new file mode 100644
index 0000000..f5af1e4
--- /dev/null
+++ b/ucm2/sof-soundwire/cs35l56-4.conf
@@ -0,0 +1,24 @@
+# Use case Configuration for sof-soundwire card
+
+SectionDevice."Speaker" {
+	Comment "Speaker"
+
+	EnableSequence [
+		cset "name='AMP1 Speaker Switch' 1"
+		cset "name='AMP2 Speaker Switch' 1"
+		cset "name='AMP3 Speaker Switch' 1"
+		cset "name='AMP4 Speaker Switch' 1"
+	]
+
+	DisableSequence [
+		cset "name='AMP4 Speaker Switch' 0"
+		cset "name='AMP3 Speaker Switch' 0"
+		cset "name='AMP2 Speaker Switch' 0"
+		cset "name='AMP1 Speaker Switch' 0"
+	]
+
+	Value {
+		PlaybackPriority 100
+		PlaybackPCM "hw:${CardId},2"
+	}
+}
-- 
2.39.2

