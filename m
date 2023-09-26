Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E6B7AE5BA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:23:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2856DE74;
	Tue, 26 Sep 2023 08:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2856DE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709392;
	bh=G8eGHCerx35KVsAG5Y998vZvBZQB9cA4sFQRB2ZU3qs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E2LYyMVXj3H30LaHhx4+8Xq16v2rUTFwOWtsIkouYWN1s62qfXchdi7WiLIo2iJwl
	 E/B2nRm5wqs4uBo+nG7cD9B4tfHET7Tn/IxLnVInk7vy32cftoT4pPqiJXGyc+i5M+
	 AZXGtkIO2Bstr715OoScK1XY7hT3ZmOlF9gkYXvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07FE3F80579; Tue, 26 Sep 2023 08:21:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5177EF80578;
	Tue, 26 Sep 2023 08:21:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C856F8016A; Tue, 26 Sep 2023 08:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB943F805AF
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB943F805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=E/QAZQIO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=if4wwIa5lNpkG9+W3oFp2gEEKyER0X4PxE6qgQLA7Y6xnW+5ecRf01N11/NfbbGjCbI9MISiJB/aUjwwcMm0rIPfHRguROS4tLXZxCBBKudo8sOJ98ZeLpz6LBAiUZzA6EGoQaocwZialWPNUt0EEHG9+mOKiOlCFRdzs5g5t7aWCN9MLP1QUXS21d8pFwBBhnibP9cSbb7nKKgIoEasF45CzHoYRV1G4art3KmUoVYAQVQk03ic1Ha6A2PZTfFEkxbfPJrqDYkI2M1ZGBSE9thHViqGgA0HqH+6+kVeIHLbfMkWDjYBxy9xvzgHAdxqgsyCWGwcmqkFxIKPaaE4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkiYa7Eqxre0/TQocTDA6MJjCHEUTuXMOSQThgJhQUY=;
 b=MZy9e659/dqWsrNGpax+Tf+2DdWxl0kPUy+55y34kDhqftsRMPcuk9mhF3Ngax3OB0uFqSpjLEOmIKyFn8gSS+t+dRPWXdOfz80ebzDy1NmmZsBIIqpz/zXp93P+t7d4/gFr/wJLrIQhEPk9IqdVyFvQTAWmy7jF7m/txDJ9o7yGbAh+KYUH7p4Y0w7Hm9eub97SBSLdFRSFBSZAcFPtPcqWFyJkAkZvImTuZ5rsQFTNnVW1MkkcVSizJ+WOZlFOBQn25aEo/7OU0CMoqtYgfFluEl2F7P7vUzyKpUcHA+lTyY+i4//QK7Ve9+QxU7jhntQpXhNBc4+6crNyyrB1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkiYa7Eqxre0/TQocTDA6MJjCHEUTuXMOSQThgJhQUY=;
 b=E/QAZQIOdwdNxT3Edh+ykYW5C3JpqUuY7ieI6DwNlXZJ3C1KQRGpek/60802flbFO72krVTVK8lj2EhoXueubppGDT864ep2SQCnQ4JKjeqPQLJ95UVE6zZ8RFN5nj7KordBvM4zLxg7stNDMNY6DO/mTkO4AuQX99WdkIfvN8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:21:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:21:07 +0000
Message-ID: <874jjhihf1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/54] ASoC: bcm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:21:07 +0000
X-ClientProxiedBy: TYCP301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 17212d6a-0faa-4d48-465d-08dbbe58c50a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WUiiTOFuwLHDxC7hLYhdmtQX1SKP40o+rt5keJi6kDja21KSV48tdTT+0pz8iyhmk+54PdAbycbMGPUnpg+2d4SXAw9GGxB6PtxBO21oeA2KA4asx/xqyr90B/Q9DqPswugYhZ+geFJYFNlYOi4spJEVEA7JFnwTQOxi8pIDMiUxu0D9v90v7TI6NMxTvYELqZd6wtRk70zGacZRybYh1kqvr4CKOAQObT18dkACyMIpiw3RNdgJCEr5qkakcaaYbVH0TZxR92EhFA2k/gz/NqxQasmH1p//2Jrgz6leZEWOZIFwEdwfHw95RdeobENPmj+c4Dt2qJZB3LIHuuBPDh9SxGiaEoarCh4cog3XsuPvln8aXHKQYu2ofwsoQxXr1RMzQaKim+1AUbyUTVmxx9t6lc1B/npxID2sW2w8hSiRk5N5jLEz+lx16lECHXdLAGmvjn6Vqj6/allT+TXPVFKX+T2SRmbC20fQB+AERudwqJZCEFVREOAbZ2jReIKXH+pI7rcGamFXkEx59AqQJNapCBMI3pmXp2XseMX4s1hIqeUIATft1jX38OSvEniWiSLgPDswY2gggOMvpcSKh0Vc2nb8es4YPbS82QTj8wR0MVglNGivfapgHo1SEAM1U28fA7XHBe9pQpDHoTi49Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DBxas3H0KAECYZSGQ+tKCidXxioUc+gWCjPG27oVWe3sWjYNHnkGIOQdayqM?=
 =?us-ascii?Q?FLqt6xI1JuPiWU6/AmhZYS/GEmpc66hUkZyj3mB/6DeCwRfxE5m61P1Fod9q?=
 =?us-ascii?Q?pmIbh6G+M+bRSB8NPbBs9DWRgy+G4j/03GoOUIXlJMX5PXG9f5yaH+KGRfIe?=
 =?us-ascii?Q?uIoKUi7m81etmBtVGJgJul3FvqKiysL5JUa/XPPKLhkKj/Qavbh40IBtykaA?=
 =?us-ascii?Q?a0uosWT3bjJXF24sKXSli1TqF8tWgHpUVPbrmDY5hR47RAbPQoTfMXVPAXHI?=
 =?us-ascii?Q?A1kV17j1mn2SrS7OiyS0Y1UQIKwQLglhy+LpUPTv9+aj+kXKCYP3kTc5c/jq?=
 =?us-ascii?Q?VXVJ7PN/YwsfM0F2lrLYxFoP4N1wTvt0wQ84vH3rrCRHW0aA9Hz1Qpnu1gtx?=
 =?us-ascii?Q?zazIIxkw/Zyp3vmd+aOjAkal29IHIb18BAAhQPpbUec4Ev0BJYkUbXeip+sy?=
 =?us-ascii?Q?2sL7Wj6AcmFPhthkD5U7m7z+16Vhp2io3Xh7N9Ruw68IeeCMLH3krwlIaiQf?=
 =?us-ascii?Q?rblsWwaNsFTAkmbbgcZytbT5lvTIk3Z73VAN43bufUIoQCGRBXQjj/ff+AKV?=
 =?us-ascii?Q?yaxNwF4pSgPaK4j9eVI0szMzOIP23CcmeOA/L3s8GLlC1DIj8+sCt4zZ8jpB?=
 =?us-ascii?Q?L/14WYqVEFWc4qe71R7JmRESI/8hRN5Z+QUbqrhWkxKsczBSdvGEz/EDmxuP?=
 =?us-ascii?Q?yOb5Y8Kr5Pb4s/2LOhMQOH2Ku2X2Ra78FPH0rE8XOe2oLJDwdLHkP6KmoTFl?=
 =?us-ascii?Q?d9/JxenYGmGlSS3cWJbv9jdxl2jfb0D04qDUFlO8n9VRfEfT/WqD85zlKbFz?=
 =?us-ascii?Q?EFOf3UiHqrUcXFSG8lsx/VIEoeFq6il5E/brBtpAilu5fot+yJt/maVCyZNx?=
 =?us-ascii?Q?kWnzH+HNjrzHPEVfsLUe8D2kgcuwSncVM2LcTXNl+cI+moVTqfDr8zKGDHGE?=
 =?us-ascii?Q?4q8HZWysDzRmtRlUXeU0Y/EvjuEoKo+ebCddukj70Jm+/6p35aLrICzBYFXF?=
 =?us-ascii?Q?exi4BGKeCJ4Mr8ra4itlXI/ioYx1oef5YKCJ0hQvbzR4Hf0EJT87GlCc4nmv?=
 =?us-ascii?Q?jVc3enQJ8DKVoMVn/zoyNJaS9TF8FCoxPnFW4sdbVcD3T5L9s00eiTdTdYZd?=
 =?us-ascii?Q?sDg92HWpsbmoYeO3cxB+elWioMFWFZP/3GLigSl5XqYLo3yv8TBwcUyGWLAO?=
 =?us-ascii?Q?ovEwL1Zgr9OWCTL7xX8F4Hpmc2mDX9Qp3D+JJazzT4W5kWh4Oxl86xAbi7Zi?=
 =?us-ascii?Q?p7cr8aQEYbSwFLOo4omV2Hg9n6MG7/IbhSDkav9XXtXLSniW4ILfk+nbVGyj?=
 =?us-ascii?Q?Z0G8WHqv7K+yXqfuasbNHqlKRewHsYRcqtGBPWrlQGHWfuRyxzDB2IIaeWcb?=
 =?us-ascii?Q?UBKjshxO9+s9BTtBm76Whd3F4z/z2S0j+WPOed64K/On4LxHGrqrK+HRp4xg?=
 =?us-ascii?Q?zOrfbJct6WPvvgf9S7vCL8N50H+Gbf0rTiPoctDvJxmVeVlSO03NIq+Qqpw2?=
 =?us-ascii?Q?x9OhosblxADouAcG0GM6O22wso2p799iFRpsVW3XnY5H+d/Gi4cqlbcMrFt+?=
 =?us-ascii?Q?XVPsLeCNjq1BXuOCtl+k1obc2EpXUesBs1EpDZhOpDnFkSbPmpmZwBvXfFoS?=
 =?us-ascii?Q?Ac5/MdtnR0gxg9daxctijJA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17212d6a-0faa-4d48-465d-08dbbe58c50a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:21:07.8608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xt5kpk4W4qSpAgXfr+McDJXTJrv/Y91lVVzic+VgK7O3sy6CjKdKAWgDfzsrftbtx23VgLDTq9UPeM3kk2e+7ZoZst9UeUEdvfXOXQGrMxV6gUHz5cv+TJQxQrZY1TGj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: OWCSFUCGVUU4SWD43VXCSCMUBKVHGKXW
X-Message-ID-Hash: OWCSFUCGVUU4SWD43VXCSCMUBKVHGKXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OWCSFUCGVUU4SWD43VXCSCMUBKVHGKXW/>
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
 sound/soc/bcm/bcm63xx-pcm-whistler.c | 28 ++++++++++++++--------------
 sound/soc/bcm/cygnus-pcm.c           | 24 ++++++++++++------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/bcm/bcm63xx-pcm-whistler.c b/sound/soc/bcm/bcm63xx-pcm-whistler.c
index 2c600b017524..018f2372e892 100644
--- a/sound/soc/bcm/bcm63xx-pcm-whistler.c
+++ b/sound/soc/bcm/bcm63xx-pcm-whistler.c
@@ -46,13 +46,13 @@ static int bcm63xx_pcm_hw_params(struct snd_soc_component *component,
 				 struct snd_pcm_hw_params *params)
 {
 	struct i2s_dma_desc *dma_desc;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	dma_desc = kzalloc(sizeof(*dma_desc), GFP_NOWAIT);
 	if (!dma_desc)
 		return -ENOMEM;
 
-	snd_soc_dai_set_dma_data(asoc_rtd_to_cpu(rtd, 0), substream, dma_desc);
+	snd_soc_dai_set_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream, dma_desc);
 
 	return 0;
 }
@@ -61,9 +61,9 @@ static int bcm63xx_pcm_hw_free(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct i2s_dma_desc	*dma_desc;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
-	dma_desc = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_desc = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	kfree(dma_desc);
 
 	return 0;
@@ -77,8 +77,8 @@ static int bcm63xx_pcm_trigger(struct snd_soc_component *component,
 	struct bcm_i2s_priv *i2s_priv;
 	struct regmap   *regmap_i2s;
 
-	rtd = asoc_substream_to_rtd(substream);
-	i2s_priv = dev_get_drvdata(asoc_rtd_to_cpu(rtd, 0)->dev);
+	rtd = snd_soc_substream_to_rtd(substream);
+	i2s_priv = dev_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0)->dev);
 	regmap_i2s = i2s_priv->regmap_i2s;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -144,11 +144,11 @@ static int bcm63xx_pcm_prepare(struct snd_soc_component *component,
 	struct i2s_dma_desc	*dma_desc;
 	struct regmap		*regmap_i2s;
 	struct bcm_i2s_priv	*i2s_priv;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	uint32_t regaddr_desclen, regaddr_descaddr;
 
-	dma_desc = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_desc = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	dma_desc->dma_len  = snd_pcm_lib_period_bytes(substream);
 	dma_desc->dma_addr = runtime->dma_addr;
 	dma_desc->dma_area = runtime->dma_area;
@@ -161,7 +161,7 @@ static int bcm63xx_pcm_prepare(struct snd_soc_component *component,
 		regaddr_descaddr = I2S_RX_DESC_IFF_ADDR;
 	}
 
-	i2s_priv = dev_get_drvdata(asoc_rtd_to_cpu(rtd, 0)->dev);
+	i2s_priv = dev_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0)->dev);
 	regmap_i2s = i2s_priv->regmap_i2s;
 
 	regmap_write(regmap_i2s, regaddr_desclen, dma_desc->dma_len);
@@ -250,9 +250,9 @@ static irqreturn_t i2s_dma_isr(int irq, void *bcm_i2s_priv)
 	if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
 		substream = i2s_priv->capture_substream;
 		runtime = substream->runtime;
-		rtd = asoc_substream_to_rtd(substream);
+		rtd = snd_soc_substream_to_rtd(substream);
 		prtd = runtime->private_data;
-		dma_desc = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+		dma_desc = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 		offlevel = (int_status & I2S_RX_DESC_OFF_LEVEL_MASK) >>
 			   I2S_RX_DESC_OFF_LEVEL_SHIFT;
@@ -298,9 +298,9 @@ static irqreturn_t i2s_dma_isr(int irq, void *bcm_i2s_priv)
 	if (int_status & I2S_TX_DESC_OFF_INTR_EN_MSK) {
 		substream = i2s_priv->play_substream;
 		runtime = substream->runtime;
-		rtd = asoc_substream_to_rtd(substream);
+		rtd = snd_soc_substream_to_rtd(substream);
 		prtd = runtime->private_data;
-		dma_desc = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+		dma_desc = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 		offlevel = (int_status & I2S_TX_DESC_OFF_LEVEL_MASK) >>
 			   I2S_TX_DESC_OFF_LEVEL_SHIFT;
@@ -352,7 +352,7 @@ static int bcm63xx_soc_pcm_new(struct snd_soc_component *component,
 	struct bcm_i2s_priv *i2s_priv;
 	int ret;
 
-	i2s_priv = dev_get_drvdata(asoc_rtd_to_cpu(rtd, 0)->dev);
+	i2s_priv = dev_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0)->dev);
 
 	of_dma_configure(pcm->card->dev, pcm->card->dev->of_node, 1);
 
diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 8f488f92936b..2d1e241d8367 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -197,9 +197,9 @@ static u64 cygnus_dma_dmamask = DMA_BIT_MASK(32);
 static struct cygnus_aio_port *cygnus_dai_get_dma_data(
 				struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 
-	return snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(soc_runtime, 0), substream);
+	return snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(soc_runtime, 0), substream);
 }
 
 static void ringbuf_set_initial(void __iomem *audio_io,
@@ -343,13 +343,13 @@ static void enable_intr(struct snd_pcm_substream *substream)
 
 static void disable_intr(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct cygnus_aio_port *aio;
 	u32 set_mask;
 
 	aio = cygnus_dai_get_dma_data(substream);
 
-	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "%s on port %d\n", __func__, aio->portnum);
+	dev_dbg(snd_soc_rtd_to_cpu(rtd, 0)->dev, "%s on port %d\n", __func__, aio->portnum);
 
 	/* The port number maps to the bit position to be set */
 	set_mask = BIT(aio->portnum);
@@ -571,7 +571,7 @@ static irqreturn_t cygnus_dma_irq(int irq, void *data)
 static int cygnus_pcm_open(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct cygnus_aio_port *aio;
 	int ret;
@@ -580,7 +580,7 @@ static int cygnus_pcm_open(struct snd_soc_component *component,
 	if (!aio)
 		return -ENODEV;
 
-	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "%s port %d\n", __func__, aio->portnum);
+	dev_dbg(snd_soc_rtd_to_cpu(rtd, 0)->dev, "%s port %d\n", __func__, aio->portnum);
 
 	snd_soc_set_runtime_hwparams(substream, &cygnus_pcm_hw);
 
@@ -608,12 +608,12 @@ static int cygnus_pcm_open(struct snd_soc_component *component,
 static int cygnus_pcm_close(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct cygnus_aio_port *aio;
 
 	aio = cygnus_dai_get_dma_data(substream);
 
-	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "%s  port %d\n", __func__, aio->portnum);
+	dev_dbg(snd_soc_rtd_to_cpu(rtd, 0)->dev, "%s  port %d\n", __func__, aio->portnum);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		aio->play_stream = NULL;
@@ -621,7 +621,7 @@ static int cygnus_pcm_close(struct snd_soc_component *component,
 		aio->capture_stream = NULL;
 
 	if (!aio->play_stream && !aio->capture_stream)
-		dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "freed  port %d\n", aio->portnum);
+		dev_dbg(snd_soc_rtd_to_cpu(rtd, 0)->dev, "freed  port %d\n", aio->portnum);
 
 	return 0;
 }
@@ -629,7 +629,7 @@ static int cygnus_pcm_close(struct snd_soc_component *component,
 static int cygnus_pcm_prepare(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct cygnus_aio_port *aio;
 	unsigned long bufsize, periodsize;
@@ -638,12 +638,12 @@ static int cygnus_pcm_prepare(struct snd_soc_component *component,
 	struct ringbuf_regs *p_rbuf = NULL;
 
 	aio = cygnus_dai_get_dma_data(substream);
-	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "%s port %d\n", __func__, aio->portnum);
+	dev_dbg(snd_soc_rtd_to_cpu(rtd, 0)->dev, "%s port %d\n", __func__, aio->portnum);
 
 	bufsize = snd_pcm_lib_buffer_bytes(substream);
 	periodsize = snd_pcm_lib_period_bytes(substream);
 
-	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "%s (buf_size %lu) (period_size %lu)\n",
+	dev_dbg(snd_soc_rtd_to_cpu(rtd, 0)->dev, "%s (buf_size %lu) (period_size %lu)\n",
 			__func__, bufsize, periodsize);
 
 	configure_ringbuf_regs(substream);
-- 
2.25.1

