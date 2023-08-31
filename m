Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E11791736
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94EBADF1;
	Mon,  4 Sep 2023 14:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94EBADF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693830900;
	bh=7CGwAFlYshEeIy38tORYRUUMpT+VfXLXxSE0ESBaYbo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EJCeJUJ5OCGd8BXCF/u4cHhXJgGUIVuvZtlevSOTXA30G/luqW5ZmEjcFJXkiHyaB
	 ZD+SaK+vSKqZjoCdstxdUkBRLydNgeUv+yFSKsmbVvrzjcowo7rdPRxAbYOJdM98Tk
	 lUx92hPKNHXnOtMe56YhSnjJJC9+7WFfPOW/T+bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49ED4F805BD; Mon,  4 Sep 2023 14:32:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87647F805B2;
	Mon,  4 Sep 2023 14:32:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AE54F8023B; Thu, 31 Aug 2023 18:21:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 892E8F800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 18:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 892E8F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TtuqTHCU
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37VFjmJr032437;
	Thu, 31 Aug 2023 11:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=cRP2OU2xJab9AmweoY8xGNRQBx+HUUOK+XTV2yweFFU=; b=
	TtuqTHCU5YcNcQeheIHAgKeLT69Q45DgQlbELCHwpxU0J7eMxBOqTFulSM9672ro
	d33cMBjpSasZ8pdPIWFvDwwTtEVn3dsDQq2ThzWTe0wTybFmmBjvhbl7CQkPJrjM
	1eWssKfqwyhXgx4ERKFzeyN30sSuKfr2pnFSqwjcG4ZWpP6BMdsrgp5PQQJOVLJA
	9wVw18KelnwMyrq3f+VQapTg66+B9XIVc4T9wrYPghQ78bbdLB9a+ckHiC/s/VuQ
	vY9XrG7x4gEs+j/LPXstUkNQRM9TKQvcRIaUjBYk3Mc/ch22lF0pQuidwzrVkX88
	ETuYmLWP80mPJTn0A7qAtg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj5mge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 11:21:00 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 31 Aug
 2023 17:20:59 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 31 Aug 2023 17:20:59 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 08E8911D6;
	Thu, 31 Aug 2023 16:20:56 +0000 (UTC)
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
Subject: [PATCH v3 3/4] ASoC: cs35l45: Connect DSP to the monitoring signals
Date: Thu, 31 Aug 2023 11:20:41 -0500
Message-ID: <20230831162042.471801-3-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
References: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: oa-ugEslqU_NQSichKIO3DGF63Um9zyC
X-Proofpoint-GUID: oa-ugEslqU_NQSichKIO3DGF63Um9zyC
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4607c60d60=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VTSG2HPYM2GPRX7IGXYOQEUKNR6C5MP4
X-Message-ID-Hash: VTSG2HPYM2GPRX7IGXYOQEUKNR6C5MP4
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:32:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VTSG2HPYM2GPRX7IGXYOQEUKNR6C5MP4/>
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

