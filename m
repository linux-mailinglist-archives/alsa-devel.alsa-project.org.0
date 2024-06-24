Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 290699149B3
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8247E85D;
	Mon, 24 Jun 2024 14:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8247E85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231694;
	bh=quN3GCu727mkYwNqw2GpV6NVVObYioBkxAul5I2vmcY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=re2gqBNvu6ylLuFb3oqy4mzrd/Vh7nI7ygiMm6rMF3PvJO6yiEEetOhxonQ3aWMko
	 OeC3qzCKmHNfPEFTD/WFMGtvFAtMRS9Jpb1FkscTkZId1SxtyLkKtHoa5EfRQEOKw8
	 T5OGwgdxx/dHvU50zyrG70TItia1QuSQCRiVq2Cg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CE22F805D3; Mon, 24 Jun 2024 14:20:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6AE5F805D3;
	Mon, 24 Jun 2024 14:20:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 652F9F80495; Mon, 24 Jun 2024 14:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9FCBF80154
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9FCBF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=D2z/tc2v
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45O7jFfs001265;
	Mon, 24 Jun 2024 07:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NAQiw9Lfn5b4wkQDfb7cAGW02PiLIbTJ52todkMah9A=; b=
	D2z/tc2vFiGOXsvGaZYZ5tWyS6bq08muoCPhICCT9JG710tV/yF47yVwyemmEzcA
	FRurHtRjmt8ODaL5cKAmTfeOfXWgGg0PJsTcekK/pn64W5/BST52kShgsezrn3ch
	OP00peoLDWJ8Kn2hixI0h2Wv6NdXi6cYyPbs03kyJpfdlp4BYRTAcazp0Rfi9URr
	jp0eWPeKI/WZy6UjzhKmb2TyHkCauBqK58534WyfH0KcCwJ0hV2RM56TecOJLruB
	EsnDeHOKfOpUjfWshRpflNU2iHBbDURRNDQ+qhwMQIyqUZZYM3kbvvpU0XBYgGtk
	V5hNkY4CXzg8jhOhZ/Gd2A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ywv0x9jjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 07:20:43 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 13:20:41 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 24 Jun 2024 13:20:41 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4715882024D;
	Mon, 24 Jun 2024 12:20:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add support for
 cs42l43/cs35l56 bridge configuration
Date: Mon, 24 Jun 2024 13:20:41 +0100
Message-ID: <20240624122041.952863-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240624122041.952863-1-ckeepax@opensource.cirrus.com>
References: <20240624122041.952863-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nCTECa08KtxC2B4Rj8RzUIYZY7dWR2c4
X-Proofpoint-GUID: nCTECa08KtxC2B4Rj8RzUIYZY7dWR2c4
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 742QUD5TZ24G7D4XFAU3BWL2L6DVNN25
X-Message-ID-Hash: 742QUD5TZ24G7D4XFAU3BWL2L6DVNN25
X-MailFrom: prvs=3905e7e383=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/742QUD5TZ24G7D4XFAU3BWL2L6DVNN25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs42l43 has both a SPI master and an I2S interface, in some
configurations 2 cs35l56 amplifiers are connected to these to provide
bass speakers whilst the cs42l43's internal speaker drivers are used for
the tweeters. Add UCM configuration for this type of system.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 ucm2/sof-soundwire/cs35l56-bridge.conf | 61 ++++++++++++++++++++++++++
 ucm2/sof-soundwire/sof-soundwire.conf  |  2 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 ucm2/sof-soundwire/cs35l56-bridge.conf

diff --git a/ucm2/sof-soundwire/cs35l56-bridge.conf b/ucm2/sof-soundwire/cs35l56-bridge.conf
new file mode 100644
index 0000000..6fafc80
--- /dev/null
+++ b/ucm2/sof-soundwire/cs35l56-bridge.conf
@@ -0,0 +1,61 @@
+# Use case Configuration for sof-soundwire card
+
+LibraryConfig.remap.Config {
+	ctl.default.map {
+		"name='cs42l43 Bridge Switch'" {
+			"name='AMPL Speaker Switch'".vindex.0 0
+			"name='AMPR Speaker Switch'".vindex.1 0
+		}
+		"name='cs42l43 Bridge Volume'" {
+			"name='AMPL Speaker Volume'".vindex.0 0
+			"name='AMPR Speaker Volume'".vindex.1 0
+		}
+	}
+}
+
+SectionDevice."Speaker" {
+	Comment "Speaker"
+
+	ConflictingDevice [
+		"Headphones"
+	]
+
+	EnableSequence [
+		cset "name='cs42l43 Speaker L Input 1' 'ASPRX1'"
+		cset "name='cs42l43 Speaker R Input 1' 'ASPRX2'"
+		cset "name='cs42l43 ASPTX1 Input' 'DP5RX1'"
+		cset "name='cs42l43 ASPTX2 Input' 'DP5RX2'"
+
+		cset "name='AMPL ASP1 TX1 Source' 'DSP1TX1'"
+		cset "name='AMPL ASP1 TX2 Source' 'None'"
+		cset "name='AMPL ASP1 TX3 Source' 'None'"
+		cset "name='AMPL ASP1 TX4 Source' 'None'"
+
+		cset "name='AMPR ASP1 TX1 Source' 'None'"
+		cset "name='AMPR ASP1 TX2 Source' 'DSP1TX1'"
+		cset "name='AMPR ASP1 TX3 Source' 'None'"
+		cset "name='AMPR ASP1 TX4 Source' 'None'"
+
+		cset "name='cs42l43 Speaker Digital Switch' 1"
+		cset "name='cs42l43 Speaker Digital Volume' 128"
+	]
+
+	DisableSequence [
+		cset "name='cs42l43 Speaker Digital Switch' 0"
+
+		cset "name='AMPL ASP1 TX2 Source' 'None'"
+		cset "name='AMPR ASP1 TX1 Source' 'None'"
+
+		cset "name='cs42l43 ASPTX1 Input' 'None'"
+		cset "name='cs42l43 ASPTX2 Input' 'None'"
+		cset "name='cs42l43 Speaker L Input 1' 'None'"
+		cset "name='cs42l43 Speaker R Input 1' 'None'"
+	]
+
+	Value {
+		PlaybackPriority 100
+		PlaybackPCM "hw:${CardId},0"
+		PlaybackMixer "default:${CardId}"
+		PlaybackMixerElem "cs42l43 Bridge"
+	}
+}
diff --git a/ucm2/sof-soundwire/sof-soundwire.conf b/ucm2/sof-soundwire/sof-soundwire.conf
index 2f61d11..2ede1cd 100644
--- a/ucm2/sof-soundwire/sof-soundwire.conf
+++ b/ucm2/sof-soundwire/sof-soundwire.conf
@@ -21,7 +21,7 @@ Define {
 
 DefineRegex {
 	SpeakerCodec {
-		Regex " spk:([a-z0-9]+((-sdca)|(-spk))?)"
+		Regex " spk:([a-z0-9]+((-sdca)|(-spk)|(-bridge))?)"
 		String "${CardComponents}"
 	}
 	SpeakerChannels {
-- 
2.39.2

