Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683CF78C723
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:16:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D19E93A;
	Tue, 29 Aug 2023 16:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D19E93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318607;
	bh=psNKzq++myMPEPkGsB9144QSDGEvn0yYgw6E3WF4hS4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qn1V/pnbQ+Ae4mFxMlq67X8rIlwZOjVuwX9t2i+lItnT4vvDkX9hsBlC2pMaZ1iiw
	 CJqO8YVxOtxwYmZFY8l51WmuIw3uzqQee2Q5K6UHoS0ZbEt1fiI01NEG2TJQIcdq+H
	 KPz9yPhQx3dtOWYB9zompBGM6v/NBcXHAOfYtcLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5065CF805BF; Tue, 29 Aug 2023 16:14:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B44A4F805BF;
	Tue, 29 Aug 2023 16:14:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0228BF80236; Mon, 28 Aug 2023 19:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F4ACF80158
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 19:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F4ACF80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jcTH7DKN
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37SFkYnN027174;
	Mon, 28 Aug 2023 12:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=2tYF2G4WowOVzEZDkxYllLwRJTRxylMzCzkRJWx89mc=; b=
	jcTH7DKN9MwamkXwDzh8Sek00eQ8hQD5Mt1ZsYuWaThUWlHvdoosXXBAAsH5+P1G
	8tPcDhpVDDh2YL/qnJOrAv2lSXtPdQ0f92NBPFKuERJB+GkK6VCRxxvmYkjcSBob
	aWKd9y8vuEwsY1xoky3m5Pn+4u/q1wN1iW0IWBMrHQNnUn7TyGSswBIPn7+jdUlu
	zANNNTkDd+9wY7wmcAibVTYmG3mJt4ZV8scrEVNFuetIvePg/+yycUKU+R3hq4sc
	a3EVCQJl8TqFnXh9gYzoQY3Fh69guCjhjhHy2gWv8UHx0u4Wn2OPeFe/ze77339W
	OS+dDIAecM96bwyXB6R2Ww==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj218a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 12:05:51 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 18:05:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 28 Aug 2023 18:05:50 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 55F0311D4;
	Mon, 28 Aug 2023 17:05:48 +0000 (UTC)
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
Subject: [PATCH 5/7] ASoC: cs35l45: Rename DACPCM1 Source control
Date: Mon, 28 Aug 2023 12:05:23 -0500
Message-ID: <20230828170525.335671-5-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4ENn95ZPXt9wnM_SioXAJese1UIW6AWd
X-Proofpoint-GUID: 4ENn95ZPXt9wnM_SioXAJese1UIW6AWd
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4604b61042=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GWM7CAD3SBC66GR54F5HHEV2JOLWDB42
X-Message-ID-Hash: GWM7CAD3SBC66GR54F5HHEV2JOLWDB42
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:13:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWM7CAD3SBC66GR54F5HHEV2JOLWDB42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename control to "DACPCM Source" for backward compatibility
with previous implementation.

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 32ecc2ebaf9d..efd2d6aa3d67 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -415,7 +415,7 @@ static const struct snd_kcontrol_new cs35l45_dsp_muxes[] = {
 };
 
 static const struct snd_kcontrol_new cs35l45_dac_muxes[] = {
-	SOC_DAPM_ENUM("DACPCM1 Source", cs35l45_dacpcm_enums[0]),
+	SOC_DAPM_ENUM("DACPCM Source", cs35l45_dacpcm_enums[0]),
 };
 
 static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
@@ -469,7 +469,7 @@ static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("DSP_RX7 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[6]),
 	SND_SOC_DAPM_MUX("DSP_RX8 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[7]),
 
-	SND_SOC_DAPM_MUX("DACPCM1 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dac_muxes[0]),
+	SND_SOC_DAPM_MUX("DACPCM Source", SND_SOC_NOPM, 0, 0, &cs35l45_dac_muxes[0]),
 
 	SND_SOC_DAPM_OUT_DRV("AMP", SND_SOC_NOPM, 0, 0, NULL, 0),
 
@@ -539,7 +539,7 @@ static const struct snd_soc_dapm_route cs35l45_dapm_routes[] = {
 	{ "ASP_RX1", NULL, "ASP_EN" },
 	{ "ASP_RX2", NULL, "ASP_EN" },
 
-	{ "AMP", NULL, "DACPCM1 Source"},
+	{ "AMP", NULL, "DACPCM Source"},
 	{ "AMP", NULL, "GLOBAL_EN"},
 
 	CS35L45_DSP_MUX_ROUTE("DSP_RX1"),
@@ -563,7 +563,7 @@ static const struct snd_soc_dapm_route cs35l45_dapm_routes[] = {
 	{"DSP1 Preload", NULL, "DSP1 Preloader"},
 	{"DSP1", NULL, "DSP1 Preloader"},
 
-	CS35L45_DAC_MUX_ROUTE("DACPCM1"),
+	CS35L45_DAC_MUX_ROUTE("DACPCM"),
 
 	{ "SPK", NULL, "AMP"},
 };
-- 
2.25.1

