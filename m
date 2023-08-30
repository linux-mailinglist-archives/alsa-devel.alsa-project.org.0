Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5529578E7FC
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 10:29:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A096C827;
	Thu, 31 Aug 2023 10:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A096C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693470549;
	bh=578qe9EQhP1dmtri/FEcsdHpn2WVT2mwvnOzor0BDIg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ly6xKzIrzqtQFzxssOFsD/G7xXauMr8fuT0HJYjQ0zEDduhebrdrX/ZLvxsgMTOkt
	 ImaecPOoWHOZL0fKovxrANjr0vzon+ZDd2zpohbzPiOlsjxhFIG+ZFeNG4PAHh86oe
	 6kufIpBGgy9hWuyyDnSMT1H52UjUecQCV10WXAy8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D92EF805B4; Thu, 31 Aug 2023 10:26:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 530CAF8057D;
	Thu, 31 Aug 2023 10:26:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A262CF80155; Wed, 30 Aug 2023 21:56:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F904F80074
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 21:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F904F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Og4455vf
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37UHsJsY002018;
	Wed, 30 Aug 2023 14:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=KxaoXeqFYIEnZu6KbS/zohWD3joz0j1CP25czl4VYXE=; b=
	Og4455vfK5csAfTULguC6o+ZqVnJ58GyzvQKT09m/H+XWSeJGl5aVt8ghJmTc6lD
	PW8iBe8Fmd3/i+jfy5V2saroRdf7urANI7xiuwDXpnCCwOJE7SO+7BgChY9YCyn5
	mFp9lGKhW07E8ybqysh8X0OMJBB/2B2ZhYH1fGHlZaqE4jHmag628ZngZ8MuI18Q
	RHNHVmlJM/kS15aMVnAD18JyWiVurLUQASx33xIfDs+E+kZjjTJZ19Nx8pSp5Dxz
	HDImuLAdR7CjM6swlVZxlQ1C2caJNMHdQ+DHsRIBFT6276u5zjtfp6ivvvF3t5ta
	TZb6CRMxASnQ/8nZUftk3A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj4k02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 14:56:09 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 30 Aug
 2023 20:56:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 30 Aug 2023 20:56:07 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4CFD011D4;
	Wed, 30 Aug 2023 19:56:05 +0000 (UTC)
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
Subject: [PATCH v2 4/4] ASoC: cs35l45: Add AMP Enable Switch control
Date: Wed, 30 Aug 2023 14:55:36 -0500
Message-ID: <20230830195536.448884-4-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830195536.448884-1-vkarpovi@opensource.cirrus.com>
References: <20230830195536.448884-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KxpIFz8N4jbsvR254Sa91GY3TkSWXF_n
X-Proofpoint-GUID: KxpIFz8N4jbsvR254Sa91GY3TkSWXF_n
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4606cf803d=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5LPZVG7VLMTIP3QY4563XEWJJSX3PIGL
X-Message-ID-Hash: 5LPZVG7VLMTIP3QY4563XEWJJSX3PIGL
X-Mailman-Approved-At: Thu, 31 Aug 2023 08:25:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LPZVG7VLMTIP3QY4563XEWJJSX3PIGL/>
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
index 4abc922ef210..f8646de20c36 100644
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

