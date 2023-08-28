Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEE278C71F
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176EABC0;
	Tue, 29 Aug 2023 16:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176EABC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318589;
	bh=RdbFF+Ey67kCYpKElAn3zOG59Y7e4rHt9hklmfLmprY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JVvgOWCYFjjHX5ZewMUnhQCazlPYwgzgn5q/OUIALHagIh0CPXiPVhf/e2wLV8dy+
	 HVvVkG9XfgXazJtb11O5YTELOWkqjOZsts1C6c/o52mGQrTIUb2BX+CGfhIqmQNPv5
	 qnT3Ll65uf/gRXqI0scUrTeWEPjG4jzr4yn8D00Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04A81F8058C; Tue, 29 Aug 2023 16:14:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D29AF8059F;
	Tue, 29 Aug 2023 16:14:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BE85F8025F; Mon, 28 Aug 2023 19:06:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C545F80074
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 19:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C545F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mq8I3sCQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37SF2s64001342;
	Mon, 28 Aug 2023 12:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=emwn8Rh+GiK839KOBaZXWgo02wchBa0++hofCDljvaE=; b=
	mq8I3sCQVEmNVUdpUtoEkXKsxTwm8b2gszrJ8dTyoJYV42aIeIQvpQm6zibnO5wb
	9fYl4b9aC2Ew4ZXbgifu1fLFEfxUtlDBfxwcEDsTwH9D+DpdHKtCas7oDXLWP6FD
	w2UClyZWxk1HHIqN3Ac+Yi5P6OUWOjV8Hz0YY+RXQTAEYfLVUecGY/Z9Ps+ekVrw
	CFTd58tyPfokBppENz+Xk4hx+DUXRlVSrNDsW+MjwwVQJyjz6mHzhBN/eMwKBbJu
	c3mXuZW6WQKUxBqbM3v5IUlxAqJ3IuBCAV0+F2RFbbV/CtP7STmjG41dXanDnh0K
	PMOtNPWMomtHE4UvUWelNg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyae72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 12:05:54 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 18:05:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 28 Aug 2023 18:05:52 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A6A9A11D4;
	Mon, 28 Aug 2023 17:05:50 +0000 (UTC)
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
        <RicardoRivera-Matosricardo.rivera-matos@cirrus.com>,
        Vlad Karpovich
	<vkarpovi@opensource.cirrus.com>
Subject: [PATCH 6/7] ASoC: cs35l45: Connect DSP to the monitoring signals
Date: Mon, 28 Aug 2023 12:05:24 -0500
Message-ID: <20230828170525.335671-6-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qc2UoEWanY0NIkKlynDHo9Ng0q0dSHOU
X-Proofpoint-GUID: qc2UoEWanY0NIkKlynDHo9Ng0q0dSHOU
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4604b61042=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: A3ZMDAAD5NPCMMFKHY5P456TAVICQW4L
X-Message-ID-Hash: A3ZMDAAD5NPCMMFKHY5P456TAVICQW4L
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:13:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3ZMDAAD5NPCMMFKHY5P456TAVICQW4L/>
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
index efd2d6aa3d67..6c8f179b9c1c 100644
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

