Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3087F708C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 10:51:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D086CDFA;
	Fri, 24 Nov 2023 10:51:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D086CDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700819502;
	bh=29Z7FXuo6ezswH/rP81Aelxg/2GhZvhns0FAw0YmeOo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CLi13lxMhUDkRzyft5Ars7pXdrCD8+Z8tkOaBFetT7FS598K+2hxOfLd8fxZHyVcP
	 nz/t+4TceMD1nnpwNluNKV3HLltGv6aZ+h5orE82X2ln6goAWQy8OCNZj531LFF01C
	 uJrhnc3hjjFeQjhYEQDQ3UivgmKR+I2VxpTLHLtg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DC17F8057D; Fri, 24 Nov 2023 10:51:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E103F80568;
	Fri, 24 Nov 2023 10:51:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A331AF802E8; Fri, 24 Nov 2023 10:50:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94A2FF80249
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 10:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A2FF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Jyxy9nFX
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AO6xNTZ010106;
	Fri, 24 Nov 2023 03:50:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=0
	BSvJ7usnWbGiPGf6UjTYXjzO1zlA/tY5Les5VqpUOI=; b=Jyxy9nFX8iQChZ0cS
	0BqOsuaBamyyKCpuiVvHH0G92KfBp30rU7A9qdkw1LoGX1T6v9uYQO7Ap0VKWIua
	NXr64i11q6N++FXaQNvAX57YThBAFwkwQiH8uLXk/r4l6ZcpGgdpC1Vc84fRAlGv
	/XbelQ3KhDkuLUiLXg4gK4lawpm5ZoyaM8BNn+y4t+kgSRSetrR3EC42tTx0pqMw
	hXQ0i4Re7FpDedcfAimsvCCLb1+u/w9bzrErIPvF/pQbmeHUQ0SmmTKC9jmE27rX
	2Nkn8C4/VPQI9D68je5kuPDvy15Yk2AC1XVMyWE7WVc4/MekNCiXWovdXBRyvn2c
	YYnHg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uetjpem55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 03:50:34 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 24 Nov
 2023 09:50:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Fri, 24 Nov 2023 09:50:32 +0000
Received: from upx-tgl-008-ubuntu.ad.cirrus.com
 (upx-tgl-008-ubuntu.ad.cirrus.com [198.90.251.167])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 64696357F;
	Fri, 24 Nov 2023 09:50:32 +0000 (UTC)
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
Subject: [RESEND] ASoC: cs43130: Allow configuration of bit clock and frame
 inversion
Date: Fri, 24 Nov 2023 09:50:30 +0000
Message-ID: <20231124095030.24539-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UevVvw5fily_5khQIm2O0txDPIJE2xNH
X-Proofpoint-ORIG-GUID: UevVvw5fily_5khQIm2O0txDPIJE2xNH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: V6SDJ6QFFMQWNWE5PKF3DQ52NF4K6IXL
X-Message-ID-Hash: V6SDJ6QFFMQWNWE5PKF3DQ52NF4K6IXL
X-MailFrom: prvs=6692789af5=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6SDJ6QFFMQWNWE5PKF3DQ52NF4K6IXL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Resending patch which previously broke x86 allmodconfig [1], now rebased on
for-next branch

[1]: https://lore.kernel.org/all/ZVfLMIbCpShVAYBf@finisterre.sirena.org.uk/

 sound/soc/codecs/cs43130.c | 42 ++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs43130.h |  1 +
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 4f16baf4eafb..0f3ead84665f 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -620,6 +620,27 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
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
@@ -632,8 +653,6 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 	}

 	frm_size = bitwidth_sclk * params_channels(params);
-	sclk_edge = 1;
-	lrck_edge = 0;
 	loc_ch1 = 0;
 	loc_ch2 = bitwidth_sclk * (params_channels(params) - 1);

@@ -1516,6 +1535,25 @@ static int cs43130_pcm_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
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
index 694286b78d03..dbdb5b262f1b 100644
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

