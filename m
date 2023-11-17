Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 766017EF43B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 15:14:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5B9E852;
	Fri, 17 Nov 2023 15:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5B9E852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700230491;
	bh=Z4GiqdxrhyDiVPHNOBK1nrqs/sqGLNXqcz1EWsGnAqM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F5SiJctp0qIlS1OA3XTI0TwBa2Y/jVmrzTAWQm9XFweoTKIa46YNLumTzlAjWVzyg
	 5PoZVmGuhhVQy8joLTp3JxkG305OzijZ3ti9vJgKzWq/co3jhFp3tPcFPlt9sk8McR
	 tmtmbW9g7eIVo6echvnH4sGmePGPyfoppX+MHSwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDFDAF80549; Fri, 17 Nov 2023 15:14:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EAA8F8022B;
	Fri, 17 Nov 2023 15:14:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11DD3F80549; Fri, 17 Nov 2023 15:13:56 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E5C41F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 15:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5C41F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZSBOZnkq
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AH7fERx025627;
	Fri, 17 Nov 2023 08:13:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=eQHPmKVYs9Cxq8bgVHJlqm/zIEmuE52dOPPbKaZHA6w=; b=
	ZSBOZnkqT87yPiuSy+d12hKuHYilyKARVa/3rMuBYkBOMg1rnhzSFcVvDSL5J2uj
	w129rkzizESKiu7XQS25EAv7pMjMK/P9Q/CVbbDqqpXF0NwFR46QTWIyzzE3XTRi
	QkC4dzk3KpHc5wirY7RUyu6bkzir0blOLlFGLCbELYAEc/XcWHuxrgYZ+aDfywp0
	bIIaMLU68sBIv/dJX0Cas1pnGsOk07MBnYiHG4dT97u14lsbMG8LxkqqDf7izaTM
	pPZEfCiIHg7s5GCkbklEe9Vrjev7kMP6BcDEzSVWQNphIGS8HWaymktnZ0ZDmrTm
	ud+M08cqa+15zG7fiGY0fg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ua6wpfjs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:13:48 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 14:13:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Fri, 17 Nov 2023 14:13:46 +0000
Received: from upx-tgl-008-ubuntu.ad.cirrus.com
 (upx-tgl-008-ubuntu.ad.cirrus.com [198.90.251.167])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D8F1A3582;
	Fri, 17 Nov 2023 14:13:46 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>
Subject: [PATCH 3/7] ASoC: cs43130: Allow configuration of bit clock and frame
 inversion
Date: Fri, 17 Nov 2023 14:13:40 +0000
Message-ID: <20231117141344.64320-4-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
References: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3Twmk12_ptNpSR9cgVrow_2OwfaJ63fc
X-Proofpoint-ORIG-GUID: 3Twmk12_ptNpSR9cgVrow_2OwfaJ63fc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QWVO5BEL3RJXTZQFVGLJPWZORRPYT3W5
X-Message-ID-Hash: QWVO5BEL3RJXTZQFVGLJPWZORRPYT3W5
X-MailFrom: prvs=668552b693=mstrozek@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWVO5BEL3RJXTZQFVGLJPWZORRPYT3W5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/codecs/cs43130.c | 42 ++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs43130.h |  1 +
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index d8ec325b9cc9..62647045d8c4 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -595,6 +595,27 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 		return -EINVAL;
 	}
 
+	switch (cs43130->dais[dai_id].dai_invert) {
+	case SND_SOC_DAIFMT_NB_NF:
+		sclk_edge = 1;
+		lrck_edge = 0;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		sclk_edge = 0;
+		lrck_edge = 0;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		sclk_edge = 1;
+		lrck_edge = 1;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		sclk_edge = 0;
+		lrck_edge = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	switch (cs43130->dais[dai_id].dai_mode) {
 	case SND_SOC_DAIFMT_CBS_CFS:
 		dai_mode_val = 0;
@@ -607,8 +628,6 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 	}
 
 	frm_size = bitwidth_sclk * params_channels(params);
-	sclk_edge = 1;
-	lrck_edge = 0;
 	loc_ch1 = 0;
 	loc_ch2 = bitwidth_sclk * (params_channels(params) - 1);
 
@@ -1483,6 +1502,25 @@ static int cs43130_pcm_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		cs43130->dais[codec_dai->id].dai_invert = SND_SOC_DAIFMT_NB_NF;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		cs43130->dais[codec_dai->id].dai_invert = SND_SOC_DAIFMT_IB_NF;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		cs43130->dais[codec_dai->id].dai_invert = SND_SOC_DAIFMT_NB_IF;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		cs43130->dais[codec_dai->id].dai_invert = SND_SOC_DAIFMT_IB_IF;
+		break;
+	default:
+		dev_err(cs43130->dev, "Unsupported invert mode 0x%x\n",
+			fmt & SND_SOC_DAIFMT_INV_MASK);
+		return -EINVAL;
+	}
+
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		cs43130->dais[codec_dai->id].dai_format = SND_SOC_DAIFMT_I2S;
diff --git a/sound/soc/codecs/cs43130.h b/sound/soc/codecs/cs43130.h
index 90e8895275e7..c7b2708aebcd 100644
--- a/sound/soc/codecs/cs43130.h
+++ b/sound/soc/codecs/cs43130.h
@@ -497,6 +497,7 @@ struct cs43130_dai {
 	unsigned int			sclk;
 	unsigned int			dai_format;
 	unsigned int			dai_mode;
+	unsigned int			dai_invert;
 };
 
 struct	cs43130_private {
-- 
2.34.1

