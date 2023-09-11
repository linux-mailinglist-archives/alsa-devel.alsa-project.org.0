Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6579B0CD
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F20599F6;
	Tue, 12 Sep 2023 01:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F20599F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476226;
	bh=wkXA8JiqOl3N+CMlj84TkW7VxeXjm946KAlHcmAELi0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PiOzcbcQXMfwFxJifsdup+uqw7GSU5nyH7399EPqc8GJbWhdQJgxkgln9suS0xYwc
	 /qNDLz2zQeH1UuEKtTM45BWh6c9ZnBNrDMrj4sZSyGqJdodbalH2tVW/KrCBjX6kPj
	 1GxKySz2c1pSeBa4ejn3guiAGMX0yra1/t5v5quU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADE77F80537; Tue, 12 Sep 2023 01:48:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3761F80537;
	Tue, 12 Sep 2023 01:48:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F46DF80570; Tue, 12 Sep 2023 01:48:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97DB5F805AD
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97DB5F805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TkufIQsU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4snERBxlgxr22BrWdgdHYP+TZiDlVaaS9KMeMYbrBeZ8mpSKTpKywTJlMMQ1bd0/7NkX7DN8W0us7WlIc/sjv1ap0/ccpIKuM7yl5cQsFOHGnS9bJq7M5SHL2aJXzAGmDWHC6laLSmuzWxVKBnIUsyLZaSBDNqKVkD1oRDeqtPndE2b+kUItihM84ZY8yKSnI+a5PhQ8B9gkcybv+VCnMrExx7/OoTiHP/av9rh/HHiJHgtk6qM6Lf1iNKYLVCnfseuyUZmCPI8zJKrv0vOeZFC9hNPsspALfR647arUgaab0NS3U4zRubBeu4cICDTF+TTANRnSYNu/91oETHGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+guEJLLgqdIWRg0RipHDsNWAzbF+tcHp1Qu3U0zi8eU=;
 b=XFt0paT7h2n5djizCH/mBRv/LWfHEpllCsQiLgPK/GYXKLM9lcdphGNY8UGLz3TovhrOUI1cTj8J53Bdp8PE4nl/hQdBt3zgaYoDBAPqyQQ9yDtrH0G5jf+KSfIqL2NmwWzB3yjS+7Im9Qro9CSBcWGow2UtIbQrMCOevDKqDrRGQj1A779i76iAgve0JDaEWXuelqNYNTgX59MaRzLhfNEr9D3pQxtHOkNY1VMXyYCNVEPsEBR1W5RsDiBWy9EDHG19XAuFmoF7oaPwhFYvjqaE8ixC6PelF1LbSB7Jcvlyhhm/fgs+XmaIohShrMS8efk8N5lXfMwYNIQIjGCnZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+guEJLLgqdIWRg0RipHDsNWAzbF+tcHp1Qu3U0zi8eU=;
 b=TkufIQsUgid2KDHYEgc0J2cORQzwtBm2RkundM6y/u/lR6wxy4wB5AY1D7Hql14YaWZSdlJO65ei/jxgx5cKQH6CGqWavQGwIq5VeG7Km+e//ATC/DLz6RtRrEc8cdW6JkUAaS4Hlau5RLQUZ0JJRrW8ajRF3kptASMSmvaaaSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:47:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:47:51 +0000
Message-ID: <877cows255.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/54] ASoC: bcm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:47:51 +0000
X-ClientProxiedBy: TYAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:15::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e10277-891d-4d95-1980-08dbb32182d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nsehUlWiuXwArrknk6l42qGgtLuoyuQpt1QSrFEeK0hW3XxlWdhlR81IIxOAT/elqwg/VDchRNZTkCwCye5kUZSx17Nh2OIvj9RtDYipRQ/LqlUipxwd2RPw20h6GsQ7YhkJZ9tXQqj/T7DP/SE+9fppPwSg7r2ICYeQoJ6aC+fxX1TzhyUvGVpz/El5GMm9sP6y/oW4X5wHB7iWLa2BWmgtWTWMF2CflhI1ArWFCfY4+t/Xh7ghoIKilZE35O892ei9/qViWQ5OQr4woUPnT28/rxiwuxhKloEFy4wu5w1yBV7GDwNONKaHF5btuiqixAoqVYVz0wjBLPMaztJbz1v1CjwU1sb5T7pikRe+J6KVJMbC+uL5J+4lHIW/+q/EsJiJE3lXMSz7ixWhhdPVlwOiX04zLDkl2fsW5sWLjBbxUwE8IQfzXj3hqAi+osWI5GkOJpdIOyHRAMPOkD3IHbOA1WZKcRLXM4mKp5kxVishaEbXMqEOakCXbmLNVycgAOfDSPaxUZXekB01eOvakwcDGJlpEzO0tlXTL9/C3PE0RBjY6qU2OVLZes6hPVgvH3SD1ohX/yqblPgVf5yrcz/9O/3P9zJ8B9FawLBSRp9gDS6YhQd6cywn8MkLgcuS5/bEMVqKl7FunXLZITB1CA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YyNpX/WKf//vhCv2BCw4F6k4ID9NUObJBVfngTA4ZieCE/aCVrBIAXaUwnJq?=
 =?us-ascii?Q?ONJk1vzpN8DaDUKP7hZKgPRdis8KI4cMAzAyw7qAu0MAL/1l1htZLp0JdjxT?=
 =?us-ascii?Q?2Q80vNIKx+XqUC5+T00SBnhe5mzDB45GSEK6BOaWpfFmz3pcurkdFuFb7ACg?=
 =?us-ascii?Q?89q/9ZWl+C3jXxQrVH5R3kBQJvNWuv9QpME5krxKKF5shHs+BUw4eZLXsbs2?=
 =?us-ascii?Q?L7QQwRUCJyBUpmdMjw17HIIHrwLLk7wB5J33iJBx3FbPVo2IgWPeXlfSjl1B?=
 =?us-ascii?Q?PCk4Cj4G2eZAWCznGV2uqImFS+dNM3rZUIxknvuCVMj+pqU8INRabMQKXBZQ?=
 =?us-ascii?Q?EGmSEGf3sF6J+E8MNR2/agh6bo+r77PHDQODEBkGTS/fcf5yPL6isqX45SZH?=
 =?us-ascii?Q?jj+W3CLmd7ck1Tdx9JCwQRqnzoQZ3kB/khnp3FPVQIa+knr3nKoS3oZPsSPp?=
 =?us-ascii?Q?w/01UJPlAHOLwjIO0MAG73OREpjZ3Nc4xKrWRuCha5b45Bt5QyDhJ5a4YW2V?=
 =?us-ascii?Q?vXtiikdMKcvuex+ogM75GVDx6hiatdn/EfyeyJghWQ1tchfCafrU69Dj/Bsj?=
 =?us-ascii?Q?PLbSvKUZA09ssqxPxHc4mgawemdsRCgojyYCKw6ddzOCLdSrxgtR+rxV4J5A?=
 =?us-ascii?Q?Ttm6gBUXopZLHb0cwqIy5NOx2g3T8/Yw1vbWZiK6KdRCTMAvE7VQr83w83iL?=
 =?us-ascii?Q?Q/JJMXkd4/e6wXyVFMNVvXyaJwZHyw590ZuCRyW9il8KlsIBCURRSv5NOHYh?=
 =?us-ascii?Q?tPT1BdoapM6o/hDjrky4J/PP8GuI3OxzN9gKrS1PHi79E4VWgI3TERrX5vne?=
 =?us-ascii?Q?CXSqYfjjRAlafd4yY80YMRlh7rlxip2xTdWcY1AEU5baPRozd1Xm19s00F5n?=
 =?us-ascii?Q?9xMVH6z4OOj2QaPo5RQE7fgh/Bl/4tCK7/HOQVeD3ejrflVl7AXWsqmq+FmU?=
 =?us-ascii?Q?6IFFb94HhDIdwmCaqLAkd5XoIeo/aqZQaeU9d9MK39RZY7r5vX6vpP6Q63/q?=
 =?us-ascii?Q?3LJAIvbb/2l/250MKirIZOYRJeGltaAuNqamo88aESJlsH/khclxJwbO2BEJ?=
 =?us-ascii?Q?f0CuMigOKXWvc2MRqc5ICmWGZYpMt9I4ateEfonqItYWKTNSthtIKvnV0p8L?=
 =?us-ascii?Q?0aRt4iPWr16ZnbWqXKHT50M36Z28zqEZxUbOyfWFytV2A/gtIxA+SR53PzZY?=
 =?us-ascii?Q?6pkKleedNZzErrgydaduY+ZoMtYrnUvD1OtEBn08VfNdmF/KwV/cA05Zgv5K?=
 =?us-ascii?Q?wAFuIf2g3A8zPSKQKzTWDo7bwtaQdwhEO9+PorSlhJAWzp51eLYXegoMCtJ3?=
 =?us-ascii?Q?QyOOyCMhpv2KGCn9hetnTjrWceL7VHTTDvF7oUDyx5xStfgr3PvfRncxaWGg?=
 =?us-ascii?Q?r0yt1OLrZ9PD976i8iQYOwbmUEJcU70aE4XOjczT0ko4nr74y13OW+v5AneY?=
 =?us-ascii?Q?9iGrYtp96FLh5J9R/mjHiCptgBaMjoRbcfj9XEBXDMvA/+UPoW5/Jz1WrLGu?=
 =?us-ascii?Q?5yooGVc/w2fbrlyrDz3TLTfF6zigz+tDy85iet9z0bHW6JZUw1tV3o5tCXvH?=
 =?us-ascii?Q?tmJWymSFYKJjDYJRWZ4UJslPb9LVfRJ0UdKP3aPQ/alkIVb7ry83fYZPn/pg?=
 =?us-ascii?Q?9A88DCT6cf5bshAHypm4zlE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 20e10277-891d-4d95-1980-08dbb32182d0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:47:51.4082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /L/xl2wTKhtvdAWotOJSU+ZennQsAh1pP3GKeUfCI6g6bhAucF851LMMu1Yu3lq/mVWp3KbPiGJjq+xl+urVxCI+zOkJxQuhjst1B0O8Os1cQXQ90+1PKvJbPVDpWvxN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: SPG6V3TUIJSDHQIYNLZDUGWY6RCJFQHF
X-Message-ID-Hash: SPG6V3TUIJSDHQIYNLZDUGWY6RCJFQHF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPG6V3TUIJSDHQIYNLZDUGWY6RCJFQHF/>
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
index 2c600b017524f..018f2372e892c 100644
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
index 8f488f92936b1..2d1e241d83673 100644
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

