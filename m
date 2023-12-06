Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECEC8071CE
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 15:09:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7242CDEB;
	Wed,  6 Dec 2023 15:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7242CDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701871758;
	bh=j8XHwJmJEXZpV18dD6qX8s43hJ1c5Jk/pHl6UVhlf8A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OrDl2Bbf4a5PxF0p9qT/OeHvq4RIxxZCc2jGNPCI1xNFJJG0HaWN3QuS7a5oTZLa5
	 QRO50z77p/yol2q3yPSxuRBpiHNiUIJE6Vme4tsIXZZFtioS2wKnYr8cTI5/pwsaAJ
	 O1v4P8vESDWE4hHBOxUdMkEca6D4Mjy4ATB5rWeA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64554F8024E; Wed,  6 Dec 2023 15:08:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA2FFF805B3;
	Wed,  6 Dec 2023 15:08:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A786AF8024E; Wed,  6 Dec 2023 15:06:11 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C4A5FF800F5
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 15:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4A5FF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RfpP3WRz
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B69KGJD027934;
	Wed, 6 Dec 2023 08:05:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=EQ/5Zcx+uo6H2qtGNEXE0eRPgdnWGb91HYL8S+uJyLU=; b=
	RfpP3WRzQJ39sT1BrM+N2sVKGzZrXZuiLffIOjHkri5voyfsnIt8oGMbejbKM2F9
	SQ3yVzJ25eNIn9PmZurY4C4BlxAkVZywARN3vRvLDz7Us81SD5MzLzhGWQAYE/XI
	ov8t8cE2tfhUmS6XY9h4F3pS27OlmIeRRcPWu6iCyuwlcZtIyCPYkx2nt4pyrKQL
	loGCb0ZefH7Aa76EQ+M8zKizMX/p0SLZIVY4zsYxHxWVwcwqdwbi6MANzlEaBUZM
	7q2O8M+p8YJBdUP7tbAG+dUp8Zr19EzKKmhcD2CXb9uOdK7tzuz8I3ZzMXApKgGs
	nKXDZ5AshwP8/401kwiHmg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3utd1w8rw0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 08:05:50 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 14:05:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Wed, 6 Dec 2023 14:05:47 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 60EA311D2;
	Wed,  6 Dec 2023 14:05:47 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf v2 2/2] sof-soundwire: Add basic support for a
 4x cs35l56 configuration
Date: Wed, 6 Dec 2023 14:05:47 +0000
Message-ID: <20231206140547.1344041-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206140547.1344041-1-ckeepax@opensource.cirrus.com>
References: <20231206140547.1344041-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NH7zV5n461h6TMcJgT5cMkxsYQmc7yzB
X-Proofpoint-ORIG-GUID: NH7zV5n461h6TMcJgT5cMkxsYQmc7yzB
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5LCK4UK74WBFHD2UX7D22LDUAOY7CRW3
X-Message-ID-Hash: 5LCK4UK74WBFHD2UX7D22LDUAOY7CRW3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LCK4UK74WBFHD2UX7D22LDUAOY7CRW3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

cs35l56 is a boosted speaker amp, add UCM support for configurations
with up to 8 amps. This also updates the default naming for the
speaker amp UCM file to remove the number of amps. Special cases are
added for the existing amps that require different UCM for different
numbers of amps, but future additions will defaults to not including
it in the naming.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 ucm2/sof-soundwire/HiFi.conf    |  12 +++-
 ucm2/sof-soundwire/cs35l56.conf | 123 ++++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 ucm2/sof-soundwire/cs35l56.conf

diff --git a/ucm2/sof-soundwire/HiFi.conf b/ucm2/sof-soundwire/HiFi.conf
index a8c1e33..8b32d20 100644
--- a/ucm2/sof-soundwire/HiFi.conf
+++ b/ucm2/sof-soundwire/HiFi.conf
@@ -13,7 +13,17 @@ If.spkdev {
 		Type String
 		Empty "${var:SpeakerCodec1}"
 	}
-	False.Include.spkdev.File "/sof-soundwire/${var:SpeakerCodec1}-${var:SpeakerAmps1}.conf"
+	False {
+		If.simplespeaker {
+			Condition {
+				Type RegexMatch
+				Regex "(rt1308|rt1316|rt1318)"
+				String "${var:SpeakerCodec1}"
+			}
+			True.Include.spkdev.File "/sof-soundwire/${var:SpeakerCodec1}-${var:SpeakerAmps1}.conf"
+			False.Include.spkdev.File "/sof-soundwire/${var:SpeakerCodec1}.conf"
+		}
+	}
 }
 
 If.micdev {
diff --git a/ucm2/sof-soundwire/cs35l56.conf b/ucm2/sof-soundwire/cs35l56.conf
new file mode 100644
index 0000000..32c08e7
--- /dev/null
+++ b/ucm2/sof-soundwire/cs35l56.conf
@@ -0,0 +1,123 @@
+# Use case Configuration for sof-soundwire card
+
+SectionDevice."Speaker" {
+	Comment "Speaker"
+
+	If.amp1 {
+		Condition {
+			Type ControlExists
+			Control "name='AMP1 Speaker Switch'"
+		}
+		True {
+			EnableSequence [
+				cset "name='AMP1 Speaker Switch' 1"
+			]
+			DisableSequence [
+				cset "name='AMP1 Speaker Switch' 0"
+			]
+		}
+	}
+	If.amp2 {
+		Condition {
+			Type ControlExists
+			Control "name='AMP2 Speaker Switch'"
+		}
+		True {
+			EnableSequence [
+				cset "name='AMP2 Speaker Switch' 1"
+			]
+			DisableSequence [
+				cset "name='AMP2 Speaker Switch' 0"
+			]
+		}
+	}
+	If.amp3 {
+		Condition {
+			Type ControlExists
+			Control "name='AMP3 Speaker Switch'"
+		}
+		True {
+			EnableSequence [
+				cset "name='AMP3 Speaker Switch' 1"
+			]
+			DisableSequence [
+				cset "name='AMP3 Speaker Switch' 0"
+			]
+		}
+	}
+	If.amp4 {
+		Condition {
+			Type ControlExists
+			Control "name='AMP4 Speaker Switch'"
+		}
+		True {
+			EnableSequence [
+				cset "name='AMP4 Speaker Switch' 1"
+			]
+			DisableSequence [
+				cset "name='AMP4 Speaker Switch' 0"
+			]
+		}
+	}
+	If.amp5 {
+		Condition {
+			Type ControlExists
+			Control "name='AMP5 Speaker Switch'"
+		}
+		True {
+			EnableSequence [
+				cset "name='AMP5 Speaker Switch' 1"
+			]
+			DisableSequence [
+				cset "name='AMP5 Speaker Switch' 0"
+			]
+		}
+	}
+	If.amp6 {
+		Condition {
+			Type ControlExists
+			Control "name='AMP6 Speaker Switch'"
+		}
+		True {
+			EnableSequence [
+				cset "name='AMP6 Speaker Switch' 1"
+			]
+			DisableSequence [
+				cset "name='AMP6 Speaker Switch' 0"
+			]
+		}
+	}
+	If.amp7 {
+		Condition {
+			Type ControlExists
+			Control "name='AMP7 Speaker Switch'"
+		}
+		True {
+			EnableSequence [
+				cset "name='AMP7 Speaker Switch' 1"
+			]
+			DisableSequence [
+				cset "name='AMP7 Speaker Switch' 0"
+			]
+		}
+	}
+	If.amp8 {
+		Condition {
+			Type ControlExists
+			Control "name='AMP8 Speaker Switch'"
+		}
+		True {
+			EnableSequence [
+				cset "name='AMP8 Speaker Switch' 1"
+			]
+			DisableSequence [
+				cset "name='AMP8 Speaker Switch' 0"
+			]
+		}
+	}
+
+	Value {
+		PlaybackPriority 100
+		PlaybackPCM "hw:${CardId},2"
+	}
+}
-- 
2.39.2

