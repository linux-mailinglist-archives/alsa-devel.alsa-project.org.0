Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBCF8075A0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 17:47:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2630FA4E;
	Wed,  6 Dec 2023 17:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2630FA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701881245;
	bh=29sFZC3R0IzQ6roznC7ojDIXg4EHI/aHMZczPXrp7j4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aVOUeK2FU44VYw5vEo0W7L/WylIHjJ7oXmmCQ+X4vUspVMxiDYYvHhA4SCC6UMd+j
	 pg4WVhCUGYXHQTZPFvFmN0LgJylIsaf0Bm8WXFdPX4XXXlXpOyB1Mty79U+WYmjNeq
	 1aiM7t1k2O2iAirCZtTDRQQrk/pvImagirJcf5WE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A5A4F805B6; Wed,  6 Dec 2023 17:46:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F07CF805BA;
	Wed,  6 Dec 2023 17:46:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6A4FF8024E; Wed,  6 Dec 2023 17:46:27 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AB81FF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 17:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB81FF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qgl62cMg
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B65Vl7H031364;
	Wed, 6 Dec 2023 10:46:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=OEDKpcxPcUU60oN/s6RYmS+QC5+Q9qVBcxp6vXRVk8U=; b=
	qgl62cMg7bIkpY5gskRSf6+kWMpSatO0HL3jpOFzMNOrKvTxREogTMhjjuPYY2rJ
	Ies9VozEMMawdkCQgMb+/iiaAJYKjfPGebHMcAWP2eznuqAemA0eqW2C72OtHEtI
	1pK2m02sktjbICi+NRHdFAABzkTjYF4qQCtnXWZGtJwCIUDMt01irpHu4E4KyMPq
	/ZCsetx3mvqx1SECkF3ICtN4XpejZYEP1q52h0C+UQpefPAF+rZNZ7QCS8JZ/Qeq
	OFPNAQG5G41eM8gTzVZLrMgaonSdwkzuvtaUUmHwJMJ4S25YaMK7MqHxp0ftB6Li
	5pvQC4mX4vgloZlEjHRClQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47s03s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 10:46:14 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 16:46:12 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 6 Dec 2023 16:46:12 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 33ADC11D2;
	Wed,  6 Dec 2023 16:46:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf v3 2/2] sof-soundwire: Add basic support for
 basic cs35l56 configurations
Date: Wed, 6 Dec 2023 16:46:12 +0000
Message-ID: <20231206164612.1362203-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206164612.1362203-1-ckeepax@opensource.cirrus.com>
References: <20231206164612.1362203-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HpTxYQ_b_d2BJ0GmgGbdWXGtUh_RySPX
X-Proofpoint-ORIG-GUID: HpTxYQ_b_d2BJ0GmgGbdWXGtUh_RySPX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VETUBDV6CWAX7W6TCA7B34LFHU4YBTJQ
X-Message-ID-Hash: VETUBDV6CWAX7W6TCA7B34LFHU4YBTJQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VETUBDV6CWAX7W6TCA7B34LFHU4YBTJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

cs35l56 is a boosted speaker amp, add UCM support for configurations
with up to 8 amps.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Rebased on top of conversion of the Realtek amps.
 - Add a macro for each amp to simplify things a bit.

Thanks,
Charles

 ucm2/sof-soundwire/cs35l56.conf | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 ucm2/sof-soundwire/cs35l56.conf

diff --git a/ucm2/sof-soundwire/cs35l56.conf b/ucm2/sof-soundwire/cs35l56.conf
new file mode 100644
index 0000000..7eca3fd
--- /dev/null
+++ b/ucm2/sof-soundwire/cs35l56.conf
@@ -0,0 +1,41 @@
+# Use case Configuration for sof-soundwire card
+
+#
+# Arguments:
+#   Amp - Amp number 1-8
+#
+
+DefineMacro.cs42l43spk {
+	If.amppresent {
+		Condition {
+			Type ControlExists
+			Control "name='AMP${var:__Amp} Speaker Switch'"
+		}
+		True {
+			EnableSequence [
+				cset "name='AMP${var:__Amp} Speaker Switch' 1"
+			]
+			DisableSequence [
+				cset "name='AMP${var:__Amp} Speaker Switch' 0"
+			]
+		}
+	}
+}
+
+SectionDevice."Speaker" {
+	Comment "Speaker"
+
+	Macro.num1.cs42l43spk { Amp 1 }
+	Macro.num2.cs42l43spk { Amp 2 }
+	Macro.num3.cs42l43spk { Amp 3 }
+	Macro.num4.cs42l43spk { Amp 4 }
+	Macro.num5.cs42l43spk { Amp 5 }
+	Macro.num6.cs42l43spk { Amp 6 }
+	Macro.num7.cs42l43spk { Amp 7 }
+	Macro.num8.cs42l43spk { Amp 8 }
+
+	Value {
+		PlaybackPriority 100
+		PlaybackPCM "hw:${CardId},2"
+	}
+}
-- 
2.39.2

