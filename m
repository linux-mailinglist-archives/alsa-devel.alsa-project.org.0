Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF24F20C7
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 04:07:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A055816D6;
	Tue,  5 Apr 2022 04:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A055816D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649124468;
	bh=WkYHvmS8jRhzwNkV+BH5oHgzToxLQyvD0aH55zVvc5I=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFpXPcTZaXqD+uoFscPzmxLu30c/RgxtDR1EvElPUUUC6tI87fyTgamIZV/ezIx9b
	 J2DE7X8IqxUyDG31XCHWUL6hZ3HtV9HexT4EXF7pEFzFNvBsZzfY1vWTv7EDR1c5zS
	 xWMWjdrB31Aumi3jXp+1CUDmqU4LO/9aC5kROwjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39FC9F80482;
	Tue,  5 Apr 2022 04:06:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA3A4F80518; Tue,  5 Apr 2022 04:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34AFDF80482
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 04:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34AFDF80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="DZaBk7AV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJjevDgawUpX5+lSaVe8HfYzFrWvjsykaWn9QA/pE+XuO0NxJanQAZ8v8i69t/Fr4iDT6YWD0QpmnDcey06PL6YDh0OaymQRrFX1q8dWXe27evulAvy2PjXvTHJkbXx5dq8uOs8YeQxhjxrcsMlwBb2eODBEsJgMmiDvfJyr8u+YDtGmJdslJlItj3uo4F5pSsw2AjDLzEd1DTlfrKxGbCKFccGhirf0t2jW4GrlOxLtioKqhc1qOJnPZkk19mzca+RV49tXvqmGP0KIq2fBfYfhPQmNUu4C7z626taVR2/wiDGRF680M7giaTTL/1fpetLIKxTjqCZ+8DyTO640dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyXVkZ+BKLbPpQ1uFt0SHdkgnMWI/GGX9CfM7wbVRWg=;
 b=cW7E+U5nYGpfWHY81nQqL2CG8nTM+1Dj9aOKSe0WDiGJXoS9z2sL53djN+DOChi8+2tt+JdFKX4RreRp9AfrNkbyZQoHLJCpvCOeg7DH/jzdHxb8FsNKPCcHvL0Ca+pdsPGi23ChLHKvPo8GoAzFpur8RkAHYOnTSk3XD8V/x7Wq52nIX7+Y+UAqukwmQKFYckP0QsmPqZyn/JH/3Qu2uIOzfrSjV4bQ0THdDaGZ8TRlVvlm83S8Awjks/pRK2Q5Fek5kPXgyOeqLDOfXBUPvkp9YHxSAAd0IFcAUzSSbsdZcNM9Ve6rMrF32ESc3BTbofMv+OWePv9FbNRszSBPIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyXVkZ+BKLbPpQ1uFt0SHdkgnMWI/GGX9CfM7wbVRWg=;
 b=DZaBk7AVbXSAcccDgZ7zZNrvmFRLEvfIK6ezuHXzMUJlS440ImYFUYz3lPIH6TGIJiz6O91xAGBT3Aal1oLF2cNQ6E+c3HvTxm+8p7CsYXmUGeUJeK7Z60dNQQudabqYFQHYtEjnz3gYBhHwumw2h7TpSyWYF6GEPXKbpnbznxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8525.jpnprd01.prod.outlook.com (2603:1096:400:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Tue, 5 Apr
 2022 02:06:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 02:06:17 +0000
Message-ID: <87ee2cp9lz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/6] ASoC: ak4613: tidyup ak4613_interface
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Apr 2022 02:06:17 +0000
X-ClientProxiedBy: TYCPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:405:1::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67e80d05-2455-4387-e0b9-08da16a8dea0
X-MS-TrafficTypeDiagnostic: TYWPR01MB8525:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB8525CF55F6A21A8E7A9AA708D4E49@TYWPR01MB8525.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VpPCBUfFFgi32RmUJMesrFbZIdHHzVToXTboZGWwOAXtOIzws7GRQdsbwakoRp3mA7WkZLzjsNSShNcTjEK+ojXqovMEKVNuI6P5/8DXQQSljN4kY9w78j2U2Xudaa+98NejI9YuGNvkJi2ks03BVbvgPmrL5+ZyJtmhk1IyDxxysQK9STcEpp6QQYvUHe8pZw29VYgVEmJqOhBMcDuymH675z9d9VShgX7eUeRshm2Qa33qPSVSpNFhNu2IfD01jCDiOJBbtYUkPAaSeaPE/iRuCwXJunkjlzOJkWUyD//RN9PhblL5bWPdrivti7ZBjgCpaTsO4a0syBaBS1Mja7SNmeB9fhB/shxmc0i4uo+JgkJ2BoihjOc67UuGCT8caHRmcBoYGdavdBhCtHWdet9h8z5RLz+RJONinyP7eEpINPqG7Bjg0q67Q1IntfW7DFd+c03EzhCwrYh9XHBX1Vcce8as+m/hf5a3fHmTXvn/zswvKC3e1f0/QwIoifpYJFz/9gjMD0wkIwvfrYqibCthnm2/My1bSaaW/GY6jdByALVSBuMlCtrYZRLrrUxkOcWwXDlC4E4pZemIUvyWrDxrY1K7p5Tca5vF5Fu7eL3FJCgl2yvXcmiHYeHkZ+41rSGU5Dg+lmHnfo4pXY7U7zjJDGo119zWVcEyuOcpjocI+PiGeALXyPm68twdLEy4jU1vCQAzprtZBM2IXLKuDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(8936002)(5660300002)(36756003)(6486002)(2906002)(316002)(66946007)(66556008)(6916009)(66476007)(508600001)(6512007)(2616005)(186003)(38350700002)(86362001)(26005)(83380400001)(52116002)(38100700002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O+7psaYcCEy1FbNhcMarzaGVJJsbjYQJKhDFlovJHF8LzwsqJa5eJNkV4vfB?=
 =?us-ascii?Q?W2D0KE0TA6xHe65rmHH1fzpV0r8t8OgzceUKzpiJN8e70HbZikLvX0Ffcd8L?=
 =?us-ascii?Q?LrOc3r8vDmgZ0YyrTbiuKvtPxCJzwe+jjpVdhsuZtjwbzku58mhMwSr34u4r?=
 =?us-ascii?Q?982vvjf5XqKNkycRog4qG6oAFQwe4hgf2Sp2Zk3J8pEzDsR5hthpTOS9+HQE?=
 =?us-ascii?Q?RN7UqeaMMO2T2yDdy4Ivb0+gCpAFk2/IKuzxLCJlTp16D3PSsZi1ctgmjXX5?=
 =?us-ascii?Q?GxqRFuBiti29JdqkJwlVLl0DkGeC4p2prpFYx3PkHrQ0+KdzK12ToihixjjN?=
 =?us-ascii?Q?TLp9FLgUHteuaHybkRQMlpwfCiqEnE8ZKw9m7h5KI3yTJYBc8Os/ErOdPVJw?=
 =?us-ascii?Q?Cve+Axso8A/5SoH55hc5atpuFQSjvW8tT61SoRwjTzdhyANNkVpBtzcpIchw?=
 =?us-ascii?Q?7O20Ry7L6Y4f2x31+RgqNsDTweJEI18Y0RrTatQnJFon6QKWlcGmi93K0hT6?=
 =?us-ascii?Q?+Bm1V3NFiyQqTj/nDvpHaEEmRJ/og+qMhsMwlaYBfXZ3sFGSpeZuWAR04+ql?=
 =?us-ascii?Q?Ka73UWDAro93Zo7bBTu1o0T3kRehodabpDmMm/w4n5HpS082n39mtzXmKGXn?=
 =?us-ascii?Q?fHDKS2hxT8z/zqTOsICLEfsK1XRsplW4A5S9xHUYtnbiCPBCMmghABRFlZSU?=
 =?us-ascii?Q?MPqlCEAn/VMgycEPg7zd7A9RJlZs1kpxJWh9gmMOjNA/ZiTmwCEYFVCicR90?=
 =?us-ascii?Q?kwtefYXmTWGfCvJEvi3MRRko0eIK9YptEVwubEPRTXMocuWqZCJh2FqwbUIu?=
 =?us-ascii?Q?2bGxOTlRcDeDK4lzsu4yDUahL6A5C+zlolDfEpybjhEtvCtc8FDaQTIp4W6t?=
 =?us-ascii?Q?99ak1QLafveTc6qBaOGK9ekaujYscgvhqVdoLtXSwhSNOGjRQ1ftxRO1k+JF?=
 =?us-ascii?Q?UyhwaOu3tlbRoUy9YfVGFk6Whxl8Exf2j/KKfqycurBYRe4HPKN1cqd23AAe?=
 =?us-ascii?Q?v/3MGnwf3gt7z46xgneLXb83TwKJPeDTSE24AfRkJrXsWqVQ2qxR2EQMoTza?=
 =?us-ascii?Q?fZd9rcKnvKjAES1CKDUsl/QOfJi5b410fEhvfj20X7nhuN6uH4tZ3p+EeoSP?=
 =?us-ascii?Q?klYhgJKtCjhx8MkSEGIoVv1yD0xPF+ZX8pp9OEDe0/USEiU4RHQQBGl1MsRB?=
 =?us-ascii?Q?souvhAxD2ZQFwVPQjpLONFUH4BHByrBsvFbhbISUb1DC9IfPKM02VtLDWHBW?=
 =?us-ascii?Q?kqDrJS5ViQBZAiWeOVWdFpD5nkF5oIvHr41q6Cw0aA3qbVAjpYKNWCJis3n1?=
 =?us-ascii?Q?oAcUON/RJdcd6WGfBch30/fh6eNJCYiEcVSymjR03CYlLvcCAb5I07RZMF3i?=
 =?us-ascii?Q?iKSVekriqXwPuVh2ZXp5AKfxGOyCOCnTiJ9Lf548Y0NYrDxO3rOwoVcP6dAY?=
 =?us-ascii?Q?yD/7wFbAsM+eVQX5OVBpq7jw0LpnlZAA2veUGt5MNTB5kzBX+I8uTRshwdW0?=
 =?us-ascii?Q?BfMAMKDBuMeWPDlLHn6WnY+vP4Xg1xn+5Dxeo8s3bh7U3X6NT8JdFe8KJ45l?=
 =?us-ascii?Q?EckC4ZSEVtVjg+iWRDsP3BFOIurmzkLltXkFwxh21fotopMm75CdU4u0oo3l?=
 =?us-ascii?Q?13+m8TuclFzMIUbx+A2l/698Wg4sFvsLywjI3+2lRhDKwO5pT1KBjYiYxTqp?=
 =?us-ascii?Q?47IVprtYISLG37sXDeYm0c71m2jEYMsFM/u+380SONoylvirHjCA4+somfEt?=
 =?us-ascii?Q?KBdB45rFbKvrh7qIx3M7eedECZMBGXF7MDHfTh0HdsRFbMpVHLx1?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e80d05-2455-4387-e0b9-08da16a8dea0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 02:06:17.4716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yj9Rz1/aZGAqfbiuV/OB2hLR9pMShibBq9wXE27I4lxmpJePPa896OQSgyUpd8x0dbfxvc/Xo3jryXqOzbzu0T5RcW40M8+XTP34Qf/Ku86BAtl3LX8xL9oIudeApbgm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8525
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ak4613 driver is assuming symmetric format.
Thus, we don't need to have asymmetric table for judging the
iface at .hw_param.

This patch cleanup ak4613_interface for it.
This is prepare for TDM support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4613.c | 55 +++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index e0d9a8c58e10..a20bbf82e8df 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -78,14 +78,10 @@
 /* OCTRL */
 #define OCTRL_MASK	(0x3F)
 
-struct ak4613_formats {
+struct ak4613_interface {
 	unsigned int width;
 	unsigned int fmt;
-};
-
-struct ak4613_interface {
-	struct ak4613_formats capture;
-	struct ak4613_formats playback;
+	u8 dif;
 };
 
 struct ak4613_priv {
@@ -137,13 +133,22 @@ static const struct reg_default ak4613_reg[] = {
 	{ 0x14, 0x00 }, { 0x15, 0x00 }, { 0x16, 0x00 },
 };
 
-#define AUDIO_IFACE_TO_VAL(fmts) ((fmts - ak4613_iface) << 3)
-#define AUDIO_IFACE(b, fmt) { b, SND_SOC_DAIFMT_##fmt }
+/*
+ * CTRL1 register
+ * see
+ *	Table 11/12/13/14
+ */
+#define AUDIO_IFACE(_val, _width, _fmt) \
+	{					\
+		.dif	= (_val << 3),		\
+		.width	= _width,		\
+		.fmt	= SND_SOC_DAIFMT_##_fmt,\
+	}
 static const struct ak4613_interface ak4613_iface[] = {
-	/* capture */				/* playback */
-	/* [0] - [2] are not supported */
-	[3] = {	AUDIO_IFACE(24, LEFT_J),	AUDIO_IFACE(24, LEFT_J) },
-	[4] = {	AUDIO_IFACE(24, I2S),		AUDIO_IFACE(24, I2S) },
+	/* It doesn't support asymmetric format */
+
+	AUDIO_IFACE(0x03, 24, LEFT_J),
+	AUDIO_IFACE(0x04, 24, I2S),
 };
 
 static const struct regmap_config ak4613_regmap_cfg = {
@@ -344,20 +349,13 @@ static int ak4613_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static bool ak4613_dai_fmt_matching(const struct ak4613_interface *iface,
-				    int is_play,
 				    unsigned int fmt, unsigned int width)
 {
-	const struct ak4613_formats *fmts;
-
-	fmts = (is_play) ? &iface->playback : &iface->capture;
+	if ((iface->fmt		== fmt) &&
+	    (iface->width	== width))
+		return true;
 
-	if (fmts->fmt != fmt)
-		return false;
-
-	if (fmts->width != width)
-		return false;
-
-	return true;
+	return false;
 }
 
 static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
@@ -371,9 +369,8 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int width = params_width(params);
 	unsigned int fmt = priv->fmt;
 	unsigned int rate;
-	int is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int i, ret;
-	u8 fmt_ctrl, ctrl2;
+	u8 ctrl2;
 
 	rate = params_rate(params);
 	switch (rate) {
@@ -401,18 +398,16 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	 *
 	 * It doesn't support TDM at this point
 	 */
-	fmt_ctrl = NO_FMT;
 	ret = -EINVAL;
 	iface = NULL;
 
 	mutex_lock(&priv->lock);
 	if (priv->iface) {
-		if (ak4613_dai_fmt_matching(priv->iface, is_play, fmt, width))
+		if (ak4613_dai_fmt_matching(priv->iface, fmt, width))
 			iface = priv->iface;
 	} else {
 		for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
 			if (!ak4613_dai_fmt_matching(ak4613_iface + i,
-						     is_play,
 						     fmt, width))
 				continue;
 			iface = ak4613_iface + i;
@@ -430,9 +425,7 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		goto hw_params_end;
 
-	fmt_ctrl = AUDIO_IFACE_TO_VAL(iface);
-
-	snd_soc_component_update_bits(component, CTRL1, FMT_MASK, fmt_ctrl);
+	snd_soc_component_update_bits(component, CTRL1, FMT_MASK, iface->dif);
 	snd_soc_component_update_bits(component, CTRL2, DFS_MASK, ctrl2);
 
 	snd_soc_component_update_bits(component, ICTRL, ICTRL_MASK, priv->ic);
-- 
2.25.1

