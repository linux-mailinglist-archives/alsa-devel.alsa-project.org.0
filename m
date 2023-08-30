Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B63678E7FB
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 10:28:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BA76DEB;
	Thu, 31 Aug 2023 10:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BA76DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693470537;
	bh=7CGwAFlYshEeIy38tORYRUUMpT+VfXLXxSE0ESBaYbo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ce+wWmyuc0kzVaFcmCPDnRsLNvbrYt+oQjp17Kyjo37aRDpPjXlXk4vuIBgnCLHTJ
	 mL8xaljgr7+CCvpi8I857mmlMy7pUKGSl+pLIXtt8z/priFZS8Q7/iFg5BR3s2iJ4H
	 ehWnZmyzGqgu/F4O8plalBcJeGEvdeOSyCjvd5q4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B076F80579; Thu, 31 Aug 2023 10:26:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB679F8057C;
	Thu, 31 Aug 2023 10:25:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5502F80158; Wed, 30 Aug 2023 21:56:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91A7CF80155
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 21:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A7CF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=QbjP289Q
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37UHsJ26024471;
	Wed, 30 Aug 2023 14:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=cRP2OU2xJab9AmweoY8xGNRQBx+HUUOK+XTV2yweFFU=; b=
	QbjP289QJcu4jrg/SvBQP8gidbvXfixpDvcUZDveL5DK4/5vrJguURTszwp+mdvC
	RLThdp+Ue8jS197XrD2eZjNKIvbHaUr2dMcs2u/9pKowPW/VrPIcmJpQ9/nKvaEk
	hW+36jw7fP2kbg0YwvXPlpuROYULbaL3Hxr3xBWVb5jYsbZFQ5TcyJ0m4C+BPo4b
	eyOaRve0rX1OP0csyUFz0/paZ/h7HyhGsVFhb3ioGFKgaxcBhlZHo4t6eh1HvZ0L
	v+4N5ihsi5R/xEkqjtXpm0AGroT5kbYooYXHucRT7vAjxWvSqIdTSonish741REH
	wra3Fq+ruMQOD8tMPmv07A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesydet9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 14:56:05 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 30 Aug
 2023 20:56:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 30 Aug 2023 20:56:05 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1A71911D4;
	Wed, 30 Aug 2023 19:56:02 +0000 (UTC)
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vlad Karpovich
	<vkarpovi@opensource.cirrus.com>
Subject: [PATCH v2 3/4] ASoC: cs35l45: Connect DSP to the monitoring signals
Date: Wed, 30 Aug 2023 14:55:35 -0500
Message-ID: <20230830195536.448884-3-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830195536.448884-1-vkarpovi@opensource.cirrus.com>
References: <20230830195536.448884-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bAlNDHx0cvkKQAhQB-Z6n5JfNcVmyrpq
X-Proofpoint-GUID: bAlNDHx0cvkKQAhQB-Z6n5JfNcVmyrpq
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4606cf803d=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZLOXTJJ4O6LVGJFO3H33NWKQCTH46VNO
X-Message-ID-Hash: ZLOXTJJ4O6LVGJFO3H33NWKQCTH46VNO
X-Mailman-Approved-At: Thu, 31 Aug 2023 08:25:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLOXTJJ4O6LVGJFO3H33NWKQCTH46VNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Link VMON, IMON, TEMPMON, VDD_BSTMON and VDD_BATTMON
to DSP1. The CSPL firmware uses them for the speaker calibration
and monitoring.

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 33 +++++++++++++++++++++++++++------
 sound/soc/codecs/cs35l45.h |  1 +
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 18e656e72cb3..4abc922ef210 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -433,17 +433,25 @@ static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
 
 	SND_SOC_DAPM_SIGGEN("VMON_SRC"),
 	SND_SOC_DAPM_SIGGEN("IMON_SRC"),
+	SND_SOC_DAPM_SIGGEN("TEMPMON_SRC"),
 	SND_SOC_DAPM_SIGGEN("VDD_BATTMON_SRC"),
 	SND_SOC_DAPM_SIGGEN("VDD_BSTMON_SRC"),
 	SND_SOC_DAPM_SIGGEN("ERR_VOL"),
 	SND_SOC_DAPM_SIGGEN("AMP_INTP"),
 	SND_SOC_DAPM_SIGGEN("IL_TARGET"),
-	SND_SOC_DAPM_ADC("VMON", NULL, CS35L45_BLOCK_ENABLES, CS35L45_VMON_EN_SHIFT, 0),
-	SND_SOC_DAPM_ADC("IMON", NULL, CS35L45_BLOCK_ENABLES, CS35L45_IMON_EN_SHIFT, 0),
-	SND_SOC_DAPM_ADC("VDD_BATTMON", NULL, CS35L45_BLOCK_ENABLES,
-			 CS35L45_VDD_BATTMON_EN_SHIFT, 0),
-	SND_SOC_DAPM_ADC("VDD_BSTMON", NULL, CS35L45_BLOCK_ENABLES,
-			 CS35L45_VDD_BSTMON_EN_SHIFT, 0),
+
+	SND_SOC_DAPM_SUPPLY("VMON_EN", CS35L45_BLOCK_ENABLES, CS35L45_VMON_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("IMON_EN", CS35L45_BLOCK_ENABLES, CS35L45_IMON_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("TEMPMON_EN", CS35L45_BLOCK_ENABLES, CS35L45_TEMPMON_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("VDD_BATTMON_EN", CS35L45_BLOCK_ENABLES, CS35L45_VDD_BATTMON_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("VDD_BSTMON_EN", CS35L45_BLOCK_ENABLES, CS35L45_VDD_BSTMON_EN_SHIFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_ADC("VMON", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("IMON", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("TEMPMON", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("VDD_BATTMON", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("VDD_BSTMON", NULL, SND_SOC_NOPM, 0, 0),
+
 
 	SND_SOC_DAPM_AIF_IN("ASP_RX1", NULL, 0, CS35L45_ASP_ENABLES1, CS35L45_ASP_RX1_EN_SHIFT, 0),
 	SND_SOC_DAPM_AIF_IN("ASP_RX2", NULL, 1, CS35L45_ASP_ENABLES1, CS35L45_ASP_RX2_EN_SHIFT, 0),
@@ -503,9 +511,16 @@ static const struct snd_soc_dapm_route cs35l45_dapm_routes[] = {
 	/* Feedback */
 	{ "VMON", NULL, "VMON_SRC" },
 	{ "IMON", NULL, "IMON_SRC" },
+	{ "TEMPMON", NULL, "TEMPMON_SRC" },
 	{ "VDD_BATTMON", NULL, "VDD_BATTMON_SRC" },
 	{ "VDD_BSTMON", NULL, "VDD_BSTMON_SRC" },
 
+	{ "VMON", NULL, "VMON_EN" },
+	{ "IMON", NULL, "IMON_EN" },
+	{ "TEMPMON", NULL, "TEMPMON_EN" },
+	{ "VDD_BATTMON", NULL, "VDD_BATTMON_EN" },
+	{ "VDD_BSTMON", NULL, "VDD_BSTMON_EN" },
+
 	{ "Capture", NULL, "ASP_TX1"},
 	{ "Capture", NULL, "ASP_TX2"},
 	{ "Capture", NULL, "ASP_TX3"},
@@ -560,6 +575,12 @@ static const struct snd_soc_dapm_route cs35l45_dapm_routes[] = {
 	{"DSP1", NULL, "DSP_RX7 Source"},
 	{"DSP1", NULL, "DSP_RX8 Source"},
 
+	{"DSP1", NULL, "VMON_EN"},
+	{"DSP1", NULL, "IMON_EN"},
+	{"DSP1", NULL, "VDD_BATTMON_EN"},
+	{"DSP1", NULL, "VDD_BSTMON_EN"},
+	{"DSP1", NULL, "TEMPMON_EN"},
+
 	{"DSP1 Preload", NULL, "DSP1 Preloader"},
 	{"DSP1", NULL, "DSP1 Preloader"},
 
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 16857321d945..e2ebcf58d7e0 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -165,6 +165,7 @@
 /* BLOCK_ENABLES */
 #define CS35L45_IMON_EN_SHIFT			13
 #define CS35L45_VMON_EN_SHIFT			12
+#define CS35L45_TEMPMON_EN_SHIFT		10
 #define CS35L45_VDD_BSTMON_EN_SHIFT		9
 #define CS35L45_VDD_BATTMON_EN_SHIFT		8
 #define CS35L45_BST_EN_SHIFT			4
-- 
2.25.1

