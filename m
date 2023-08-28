Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB9178C71B
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:15:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD49DEE;
	Tue, 29 Aug 2023 16:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD49DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318558;
	bh=r2Vv1bTIl3AR6QuFxlugFXePHBHkY3DhBZC7i1solrU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SBR21O71EZMBc+4sejNZPsP0+4TZDazFcGK6+/3cZaY2vqrmKHJwBvoIBWiPBMXFS
	 Lms6vqQxqdXh1LxQUH+vb+/R+7r9YVxGl5gZD39DOvQ+tgPW9oiRpb4PfMqZsPEbP5
	 ZsQpyuxgVTDBMHrSahEQ27W8WPZ/ndGveokZTK3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88E86F80563; Tue, 29 Aug 2023 16:14:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 066EFF80563;
	Tue, 29 Aug 2023 16:14:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 245AFF8023B; Mon, 28 Aug 2023 19:06:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9398CF80249
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 19:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9398CF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=dZUiNmlM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37SF2s65001342;
	Mon, 28 Aug 2023 12:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=SQtnHbRaoAsToR0WVKcLtnqTjexFNX8ZPfFI4KHxdVk=; b=
	dZUiNmlMFT2l392bl+wfM4XAAkBNs1Wu8sdhMlX3jhdu5RmVCVZXMXTxoeLbluT4
	xmVCJ2uIE6ewD3Krps+IZ3MHBzPXWaTKfaGOi1rXKOVnFi8/fWbUEaLsY5Zo2Pyh
	5SErI1M6SindS4DIAD2RDpPpYcE6quC+lsIAjQWElqje+SVbsnHWacu5Sq97UJUM
	umhL21sL8viJVRe0ANQYKZbOU3Re76E+KiIDvUzloJSdU/LGUzSf8pg2GWRk9y+T
	rX66njkftBaVwuRXN01BUCMR54x3OYU5eYT/o8B5sTVOUDUGGWlrVSpjfR3+c7ez
	3XcqlAFXEcUUSebiW0n5jQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyae72-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 12:05:55 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 18:05:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 28 Aug 2023 18:05:55 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 06ADD11D4;
	Mon, 28 Aug 2023 17:05:52 +0000 (UTC)
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
Subject: [PATCH 7/7] ASoC: cs35l45: Add AMP Enable Switch control
Date: Mon, 28 Aug 2023 12:05:25 -0500
Message-ID: <20230828170525.335671-7-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Drl185civB_IATAnqVR-xX2Ixsxj4doD
X-Proofpoint-GUID: Drl185civB_IATAnqVR-xX2Ixsxj4doD
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4604b61042=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BJKGPRLYHNU3UZTSORWKMQ7MQYWMXHHS
X-Message-ID-Hash: BJKGPRLYHNU3UZTSORWKMQ7MQYWMXHHS
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:13:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJKGPRLYHNU3UZTSORWKMQ7MQYWMXHHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The "AMP Enable Switch" is useful in systems with multiple
amplifiers connected to the same audio bus
but not all of them are needed for all use cases.

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 6c8f179b9c1c..ddbf26f2e73a 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -417,6 +417,8 @@ static const struct snd_kcontrol_new cs35l45_dsp_muxes[] = {
 static const struct snd_kcontrol_new cs35l45_dac_muxes[] = {
 	SOC_DAPM_ENUM("DACPCM Source", cs35l45_dacpcm_enums[0]),
 };
+static const struct snd_kcontrol_new amp_en_ctl =
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0);
 
 static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("DSP1 Preload", NULL),
@@ -479,6 +481,8 @@ static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
 
 	SND_SOC_DAPM_MUX("DACPCM Source", SND_SOC_NOPM, 0, 0, &cs35l45_dac_muxes[0]),
 
+	SND_SOC_DAPM_SWITCH("AMP Enable", SND_SOC_NOPM, 0, 0, &amp_en_ctl),
+
 	SND_SOC_DAPM_OUT_DRV("AMP", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	SND_SOC_DAPM_OUTPUT("SPK"),
@@ -586,7 +590,8 @@ static const struct snd_soc_dapm_route cs35l45_dapm_routes[] = {
 
 	CS35L45_DAC_MUX_ROUTE("DACPCM"),
 
-	{ "SPK", NULL, "AMP"},
+	{ "AMP Enable", "Switch", "AMP" },
+	{ "SPK", NULL, "AMP Enable"},
 };
 
 static const char * const amplifier_mode_texts[] = {"SPK", "RCV"};
-- 
2.25.1

