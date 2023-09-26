Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C16E7AE5CA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:25:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526AAE7D;
	Tue, 26 Sep 2023 08:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526AAE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709536;
	bh=9H1FiWcWVuJtXGBpHZo1A4zNzln3nUGvbho7qhinYyM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dVKe04Is+ZdjAw04a5QprcwYoE6IHLc1znN2NNKUxVwnS+tIUt6x5EUSi/S1G395h
	 s4ZP+hkjwmqGiJ8TgDwdXc+UhJoMFgRwAKHwyaAZJ5lkeUf7Waye6mOKaMeKEISPzB
	 8SWopb84wuz96s2CgU+X/W65an1VT5PejsGhQ5t8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48D66F805FD; Tue, 26 Sep 2023 08:22:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11BDDF8059F;
	Tue, 26 Sep 2023 08:22:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29D57F805F8; Tue, 26 Sep 2023 08:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6FE4F8057C
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6FE4F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CFC5jFea
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIYCZj/krC4hhEbMSOKsjkbNoHUAQRini10W/WdLtmm4xhT/clIBlJgplyyLUd+i2TgtCQQ8Z2iaCkY1DugLK3VEqXWSKxdCxU65CLhYP2/41YZxMnASnr0zA8HGiuWR5oBIje0DPOt4ZNdKbqkoB/eWdf0p0wBISRPUIZWvu5c/5gMHtxo4kkU0mJ4eWL1dqiEVnnc60vbRkyN2vdDlG+isk9RKDVaZHwQ5VTqMwlHjVPd9OKI5K+w89nBG/gQH9oyP9MEAOwif/9lwBLUDBKu6KRWoakz/CVGsDI3UaYHM8jlbSdJmVSfutX1gQ237jNey0VIyAXjv4QtAHJo6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFZpTjJv+vW132Nn7vRiC6s9CTPpDoxdWJpJl7XoEbw=;
 b=SGRsGGT+tbX1OilFOGNG2DDU7+AAFkHs5kFcPTRLUIsbKAZ/jl+z/M2FryxrqWV2mKk2NWVmrgxeqEemjrFo8BvfIrpC7H4X2j3s2JPkZJy/E55HmGWwpWKXn4Lt/D7l0mfuLPYAV2u7r6FURIkiaC03C/uFAcpaiMbjiutBemgQkYYgPcXspn0u8XrwWUr+wm0bbfeK3cvFhVkuIpUd6kKzbZERU9aZXlIoHGCB2z8e2d5Z/LWJMhxwwN7adSkdG7APH+etO3Ft/9/HJG2FZggjYUU96AYInuuojE58woFnc8jVc2dKAffrb4A8+LN6Nz6FNi07GxNuvqkNi2vaVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFZpTjJv+vW132Nn7vRiC6s9CTPpDoxdWJpJl7XoEbw=;
 b=CFC5jFeaBVqSmEevE/WySgL3qXnKR8B4BXlxKaXHy4KNEN21r3QQECC31U36gTrevg4WtCIc2yhTGwhG6gZneAgruzBLMrxpv+Uh9EVi04lHf6eo8sZweoxXsrK5/zCVoXrGjae1qhA7fwoiTSlBb0ffuwPnI0E6/c9yuU1Nzs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:22:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:22:03 +0000
Message-ID: <87r0mlh2t1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 16/54] ASoC: sprd: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:22:03 +0000
X-ClientProxiedBy: TYCP286CA0331.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 7268899c-63c3-423a-922d-08dbbe58e656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tWROW37jgF3LjUbCGBYhzpPTducN7BCj7MY1WhXJm6S4FHzLK0DEPk+GGwtWg7FaNJepx13DmHYDibutnIFxIESoZL/DdnltvrU2pZiBCJa96yCirPP1X2ST40WqoLJO5ARLqfGojEvsSnjL7HDYEAazg8E4gCheu1UaForqwfGR/SbZsuiSPJ17Txdb/PL7PFYn/+kFgNJUCrspXwhZ9pkTfCfPCedSdXrRfMIN7gsuruC7g4NUMq0B5hXOarpZoh390r9b58vqA7R/Kan3I3QEWx/Zbw58rfWmQEWpefJevi4iDStGdQvj+0KQRiUmoRp6w9pYtI13lj72j4vwS3pTSuwsHH3euV2PK82mRn1EI6vIHQTauFRMEFjGaQ5lMTGkNnURcbmFvYCtvgwO8AB7oD5/AquCvPMPI5JJfdFhznJLUFGHJbyVWbnWewy/zTe22N6RIvjzzhb0Y1KzjEPoHwXetWefytVkpM/Gi9DeYa9JnrRiBwAiymgy3LD+oyRz/iv1imQtPXgrxOKtvIa8PdGbF84b8Jfg7gBkPYU9PTKqRcQfZEikAJuKBtQpzcTA3egiMZTyiXosJnCmvDBy5pxoyuo5H27O+Ovp3AnRB/jN1BVkw5PCAMMUBO9y2Aedb6RqqGEVieP8xiaWwg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wU5Zwjpv8VbxCA0djT5NIvn/NiF/ZCszRdg+Dxq1bqKSVMqsyPSrmSMsJdty?=
 =?us-ascii?Q?twbJhdvDZJUbON/K0La0gEg0iCfbdXqSBxQpSpwn43oQIfxG8csZ+DSedWdh?=
 =?us-ascii?Q?9oEu90SyrCawm4pRTZnl4n4iHVIMznJzDTVDGvPXXjKDhZW283Kd65yXulSP?=
 =?us-ascii?Q?ZzYmuUmerjt+a1t/uCpG2pCdgzali3ulzS1GY2VQDnbg4siRpADHP7NPMtHL?=
 =?us-ascii?Q?uReOMd1W+qS5ejj9O/CE/WQZFVx/USSWb9GiGtTh2QvEW4q86cJMl1l8Y0V9?=
 =?us-ascii?Q?1DFMIFoAL/AruIN9YZQE0RSuhSdwo8yhDmqgd/HW7vnq27epsb9RbRoUujgD?=
 =?us-ascii?Q?0weJ//m3OdZzFPFEZmfR5Q2yF8JoY5+8rdRgRwtcZmqqdpVPNmhcZFRIEcoo?=
 =?us-ascii?Q?1nN1615wECeNLbNlJU+IeDQGfJ9skr/2hJaXPnMP53RRuqi+NTnS77TLW2WN?=
 =?us-ascii?Q?51Y2pGGp3VHti/rVFu5B1IVfmj8kTJ8B8jFdZzxDg7cXRrzLb48cpwoMl4fG?=
 =?us-ascii?Q?wnTBMoRFA+LKzcrFhSZjjnqEQYwwU5JMA5jq5qQ+mYmRldR+6MSsHRTfkudx?=
 =?us-ascii?Q?IQp9yaxITqAsGxUImgBSoyuXo64p6Xn2g9umoJEfUML8TsC5QAvZwkwYD/12?=
 =?us-ascii?Q?zZJ0NAR5OsJCO/otaM4r5/KX/Xi1Zswarg4aHiBjRDM930ZWMnyrQkxLGoLD?=
 =?us-ascii?Q?J17pn+ZWdsVZJqxO9Yp/5SC9bu3TmPuHc5PlaclVJMpkOETzRYav6evJAef8?=
 =?us-ascii?Q?tOXf1qwEek/MmfCI3PFhWHA3nibeQyJvij5ao1Y3yU6dCzuw/gA4JqM6h9VS?=
 =?us-ascii?Q?sNPzzlOFSMJPiDkkEIo4Pbb4YvoV+38dt12YuEIYtbMInATExOis38ldbjj0?=
 =?us-ascii?Q?4Ojp3OL+b6WDvPLLguj8h+KMBJyjHIHMaPDx1L+pdEJY5NC9s1E39nNOeB+7?=
 =?us-ascii?Q?pBNwF5/9QWOoe71QWrydUniY0QUVnHlsmdw8nP7X12LKLeqU2kCcv20mSmSR?=
 =?us-ascii?Q?4BjEy8uc4lU3ZUHXppfCfajJWgiR1Fp0QhhEM7znTP2rb56GPDYOTRogXJWv?=
 =?us-ascii?Q?3FVNfsGGc9FvODQOhHlLvnjQd/76CDk5oCadbSaJURbH0hssOI4AcC8u1B+/?=
 =?us-ascii?Q?mcyCy+uNNeWzhPN4FIOTF9+Z4KWNCJiw8b+yGP1umN/3fVI4NFIh1iM4ke39?=
 =?us-ascii?Q?eqQlwVkVkfjmgL2AtRVChtVPctLLYooaaTPy4klFVpHGeh9RjUQ3l03H4mXM?=
 =?us-ascii?Q?jmre0fhnM5pgqcoWUFI9X7liXA+ISeEoK8DGlhxmwVbNrHZyc/j1ZFrgA2ES?=
 =?us-ascii?Q?HLT6GWkXY069kmiGqKSBrwDw9teLGqMQDXz7OM71VxzNw4CGxOaPPuZAjqor?=
 =?us-ascii?Q?jxDRhNnl5qy06CFggP/asfV+nuDRZ7HawHjOrU45j7+tE2fT2AqsZD4BtiSG?=
 =?us-ascii?Q?krT5On9Ur2vj8mxoaxLAQkHRvgjLaz2IMHC6JCJDmZlcR2YukvUSoZyI5Eaq?=
 =?us-ascii?Q?LVKhzj3aOzdDMcCdGDUmmceeIXD9wkKBVN9uMS3eYXOcZDAx17nnfJe4at7E?=
 =?us-ascii?Q?2ysAoEO8jaRmipgMzNZFpWkKBh/1comrWUe0qhC9DtLG6rJjr5nR7vGgfp8m?=
 =?us-ascii?Q?qFlGWZkMoibtOHoc1GY1bEs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7268899c-63c3-423a-922d-08dbbe58e656
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:22:03.5184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HAMdwCwhRIr0WiyuODMCEtou97eCfYQ8Z1sqjBcPfIoRn1iKDSHIJuIduBWsHuQ9dVtTnvXwWZftX+iaOxSE3k80TPBDqOSgAoeY7t5RTGsTlfeSYBpKYHJyLTTHJDCv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: VPJPSSSDYQ6SVAJ2VOQF4JIO3ID7O3FQ
X-Message-ID-Hash: VPJPSSSDYQ6SVAJ2VOQF4JIO3ID7O3FQ
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPJPSSSDYQ6SVAJ2VOQF4JIO3ID7O3FQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sprd/sprd-pcm-compress.c | 4 ++--
 sound/soc/sprd/sprd-pcm-dma.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index 6507c03cc80e..6cfab8844d0f 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -135,7 +135,7 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 	struct sprd_compr_stream *stream = runtime->private_data;
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct device *dev = component->dev;
-	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct sprd_pcm_dma_params *dma_params = data->dma_params;
 	struct sprd_compr_dma *dma = &stream->dma[channel];
 	struct dma_slave_config config = { };
@@ -318,7 +318,7 @@ static int sprd_platform_compr_open(struct snd_soc_component *component,
 	struct snd_compr_runtime *runtime = cstream->runtime;
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct device *dev = component->dev;
-	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct sprd_compr_stream *stream;
 	struct sprd_compr_callback cb;
 	int stream_id = cstream->direction, ret;
diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index 48d90616b23f..d6b96cc2f708 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -190,7 +190,7 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct sprd_pcm_dma_private *dma_private = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sprd_pcm_dma_params *dma_params;
 	size_t totsize = params_buffer_bytes(params);
 	size_t period = params_period_bytes(params);
@@ -200,7 +200,7 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 	unsigned long flags;
 	int ret, i, j, sg_num;
 
-	dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_params = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dma_params) {
 		dev_warn(component->dev, "no dma parameters setting\n");
 		dma_private->params = NULL;
-- 
2.25.1

