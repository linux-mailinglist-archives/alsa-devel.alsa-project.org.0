Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2873A92A1CB
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 14:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B2B868;
	Mon,  8 Jul 2024 14:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B2B868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720440064;
	bh=SVPmn6Cp6WHKowOLuTnClT5nOjNyb4fTwvPqEWbKwpc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DaLMXvDqwM8vlqGrTi5PsgotVMQjagCPqZLr1GR1LHqmO/Apa5sCX7tfZkAjigAUB
	 HiwdORpiTYzjTY4EdSB6FogMW5mMQ3RywKgjpKSAEiag8K/C6GQx8sC7T0BdKRVUxi
	 065ucj1txH/rM8a+kX3iirxrUDyE0xlriHBzmNPI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4F0CF805AD; Mon,  8 Jul 2024 14:00:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E67F805AE;
	Mon,  8 Jul 2024 14:00:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FF14F805BA; Mon,  8 Jul 2024 13:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9684F8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 13:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9684F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=m3n9ToLg
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4686Hsnp001576;
	Mon, 8 Jul 2024 06:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xd1s+uwkp2jPD7pNtseguVyE2jtEQKH2yEfBRQITNoU=; b=
	m3n9ToLgz5e6BXyVpKj69Wf4UEtue5xuBCk3JoM6ToqVHEhMUdhJNsaGOowy/rfb
	bp4DvCej0cm3uECMRyu00AnXgZL2zypgRnFJ0DuZvhSqcznx7opDLt2Sn1OhiNHB
	9lOD6SenZlKK5ITjeASWDVhK7LdzQNOJBNhhIQKD7SmZhZC4YzUiZt+d8yX5Pevf
	60XLGPDwfvcjfrDXmEgYEWqNwBW0RSYnSoFoYqnLQ1NqgqQdaCuUrJoZ2ZcQ5g7G
	bUPJ46ylqip53P24YUsvtDeCW8iZdxXZQnr0iXUxCed/fBOjWmYcnSD5fp9dtN2D
	90DvYgbvzJxMSmGX7iDJww==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4073axseju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 06:59:21 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 12:59:19 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 8 Jul 2024 12:59:19 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 875CB82024D;
	Mon,  8 Jul 2024 11:59:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 alsa-ucm-conf 2/2] sof-soundwire: Add support for
 cs42l43/cs35l56 bridge configuration
Date: Mon, 8 Jul 2024 12:59:19 +0100
Message-ID: <20240708115919.2506891-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240708115919.2506891-1-ckeepax@opensource.cirrus.com>
References: <20240708115919.2506891-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: b0ots47SLxxOTyi8OAPNsXXr0WOfvcmd
X-Proofpoint-GUID: b0ots47SLxxOTyi8OAPNsXXr0WOfvcmd
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PXBPHVXAYLIBUUYBAUSLCYDHGF2G5WRK
X-Message-ID-Hash: PXBPHVXAYLIBUUYBAUSLCYDHGF2G5WRK
X-MailFrom: prvs=4919e0c630=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXBPHVXAYLIBUUYBAUSLCYDHGF2G5WRK/>
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

Changes since v1:
 - Updated control name to Speaker Digital.

Thanks,
Charles

 ucm2/sof-soundwire/cs35l56-bridge.conf | 61 ++++++++++++++++++++++++++
 ucm2/sof-soundwire/sof-soundwire.conf  |  2 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 ucm2/sof-soundwire/cs35l56-bridge.conf

diff --git a/ucm2/sof-soundwire/cs35l56-bridge.conf b/ucm2/sof-soundwire/cs35l56-bridge.conf
new file mode 100644
index 0000000..5435b11
--- /dev/null
+++ b/ucm2/sof-soundwire/cs35l56-bridge.conf
@@ -0,0 +1,61 @@
+# Use case Configuration for sof-soundwire card
+
+LibraryConfig.remap.Config {
+	ctl.default.map {
+		"name='Speaker Digital Switch'" {
+			"name='AMPL Speaker Switch'".vindex.0 0
+			"name='AMPR Speaker Switch'".vindex.1 0
+		}
+		"name='Speaker Digital Volume'" {
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
+		PlaybackMixerElem "Speaker Digital"
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

