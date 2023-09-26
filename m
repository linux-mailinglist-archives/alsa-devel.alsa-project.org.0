Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9487AE5B8
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:22:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BD4E7C;
	Tue, 26 Sep 2023 08:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BD4E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709364;
	bh=KNVFpJJxdr6ofi3CMTVQmGTyJZEIlKErKwljSFoMFuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vmHCBR5krvXaQtSrBWFr9ZF/HbU6LB4aDXgNO/hy66DTE4LX1s5DKyW+YVNEZr5LH
	 yRFEBVoKA0oKGPKaPDAUXnKXcWhS+5PykkJ8S4cHXJ39sJe6VgJjBj0PJuVXUrK+1o
	 qLNcY/cueNfU8/HeBF647+MLx/1ZMisfZ8dRo85A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48B23F805B4; Tue, 26 Sep 2023 08:21:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A94F805AC;
	Tue, 26 Sep 2023 08:21:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E959BF805AD; Tue, 26 Sep 2023 08:21:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDF66F80571
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF66F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hPGDVM5Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2pQT6+MXN9lLAErDsg5od1jpJy6L7L6xqbVrMF5iji/is0uZDXeLhgtbZYBmGp3dn2THWS0dGY+/jizQAYMxMJxBMGQUJkEikAXCoYiOdcSKvp5JLFGZmYTXQ/UKxy801cgSz1FgsD16Mr5jN6knH4x2czff3QVViTciicfLq6DE9gfs/CrLSOqkkNyEIl23aA9OY0H+CAqjEbAPkYjIYjU7d1zmbOSgkaG1eXBSHLP+q3KwrecnqA5Y6z7Fx1Lzvc2Ij6Yv3s61ReC+k7jblrS1bNC6ijCCJoQkw8g0agYJs9Yuqt6GMHb9cVSqOGqj4LOZJbGRlleo5DLh4v96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdHg4tssfIOdzM98RRJLJtEDue65CI8ERFfm3w3Rn2k=;
 b=czaOj5jCy2M7uePDgh0582/iYKLxUKnN20ZZVHtwMprCaInwutkz/b1JZkltnIVMOTR1F9eZsgXmnvaJoN+u1cJVFgOPzwBotY24qCi1EDw854Vfhunu8XZvP0FpYHiez8N9AYVQbVjT5Qrmc6ohvMW6VadqM9f+l03pFUj8mBXj/1rd/ZzcvCh5PCeuznG02LV/c/Jk7GO22RdDIqSN5DIzlOLj8VMWyZDY9lcbXoRWRYdpuHB6vJHDh8PgRaqUc/PzmxvXQ2lcunIGZiQdumgzd5LVat2vFnO97sGvb09vJzVUFRbZ16W/YT6CQUhbTdAonMLdKjMTCrl6CBMI5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdHg4tssfIOdzM98RRJLJtEDue65CI8ERFfm3w3Rn2k=;
 b=hPGDVM5Y3x7Se7y3Hx0gVp2S6fTcH/MgJTHmcQsTnfFEaJPwvc9ito+TjgesmUrjgXkZISyzqz/eJb5vCKd5w+9V75ogp97fPAXwyzpgi55rBQJ0o90WUXgZioudHoqVa+XbGOhOGUzK3sv9iceZWRefYFimTe0gFEqRuv1pG4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:20:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:20:53 +0000
Message-ID: <877codihff.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 05/54] ASoC: arm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:20:53 +0000
X-ClientProxiedBy: TYCP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9735e19a-69a8-44be-217d-08dbbe58bca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lD9vF2nvZ7lOr3eR+7opupUQJFBtxcI8g6CN4wcuxvpJQvhzFBCot090dYjLVg6dA72DVL2EepgaNftYRvdiK14Kf4x2k/8Y0Rau2dfOkPtjnYdSr908geLTeRQMsHv8JXLdXEfqhUMWPXpex1MJ93qSOx5RZwIkQhR2D91xQaNHcLWLWsfnJZGJJ8AeN/HMELekVCwgBa75+ztxYjdlYxJOi2EMcvKBJ3yM+ISLz9cDtgSgCjsiHTx1TiHHON53tyhFj6L5WWifOAJxRWVD6crXOUcTyyCkW3N7KKLyn863VWSU5SbulLvwEHsqAdxEn+qaCYDPja+UXUYw2A4kcrDgb5n133Y2gXiVLOMq0liOaSruVk4NOJ+YtkkPTeRAOoyVp2Zuam0ANbMhAJiphbR+mf9a/qqk9zb4hj2z5RmbrMbJMVDj0fFNDtqa2iEdpGyH877gvjRIh1VyhfrgS/nr44kfojovjEge9m9a/N8IWNPrgmhsJF2KOp443hQJO8tpGmYtRhMzkad/dMaE2Gj053qhENgB+ycyO+EDyAEmwdSO5CSUww7v767lZycERIEYiakOdBBOS6E4HXN00t+Ivwpg7GBtuLlOtGHBKGAMe690UNcsk1S6nQxL999yJVthOBCWtYtP8E3Jgp4U285gv7quFjiBlQDd3rbknCo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lwKPs7fuGwp+8sDk5mkjCWICTfbioVPdJMc8LPg4GDUtMHM/51zv56jH7Fyn?=
 =?us-ascii?Q?v+AHLU+TLJJa3/RBqVlWd7SnW6x+tpMeqAohPFvB+8hAoqWevsJ7uLYlH5oL?=
 =?us-ascii?Q?6zcVJW8HsCDs+EgyGSQjgb9qFOqj1ZhFVG3LK0oP89tEnIQ8njnDXqedTPT9?=
 =?us-ascii?Q?bWjSn/ByxumfqW5181Z3kD5mGgp6BxQ8vnCCHzyQ2UZzU+SIzLN5g2sABo4I?=
 =?us-ascii?Q?zOZWVjZG4oDzRwVxFT9yJmXLaEl8AwULJpF3Qi8sFEu3943iIOqTfYCQGdgv?=
 =?us-ascii?Q?zYP9wD9ZAmO1RqUV3ZNvA5wob463Irin+qjZP5oiFAYqbixOR9C4MqJsQMzS?=
 =?us-ascii?Q?p1ZIx2gCQ4OMusyCBad+qr6mSKNCWHc8ED2RJychefmI5uYj7FALb99xQAGW?=
 =?us-ascii?Q?Pk9uYpp+INa+HgIzPwuXWA12oh0Q8U8gE2uIRWjeSYNwH+21cUMAAhWnNqb9?=
 =?us-ascii?Q?JdJIOaKLMpN2JIrLqeRtmUs3ufrm1jJmY/s7q9SaXTYdYE8L2baXYGkyzKLl?=
 =?us-ascii?Q?CbAFoUgNJHOM65jnc0uAWGeWsjqFDIIqeCYl836KWOmo4ZM4ZXKyWl3qeyeS?=
 =?us-ascii?Q?y4Nut8dWwJbgppN8gBw3yewn6vaBFWsmCuTTQ9GXlEFYCx4h6aL9l8LZYbPn?=
 =?us-ascii?Q?zw3fjOSRFz2TR43QDpiFHZDM4Kj8enq2BsHlWlTexUX8IiuS4L/E9cjk97kx?=
 =?us-ascii?Q?hXxnydM9oL6uLrqzEhhy0bahU5NPKHSwcrsUAHAulIYYPWdgPw9nO0Z1+zp4?=
 =?us-ascii?Q?orGr6fO+k0Fk6oee9jrvop27E8I+5fR6HdhDAn81Z9/DFVeoP07Kkh3S13S1?=
 =?us-ascii?Q?amd39q6nC2bz3Qcao8DLOuU5upKuAiZlAOrJd3DWYuNHOunOi5Cp6NySOoBT?=
 =?us-ascii?Q?E2qD45N0asLCPyTShGXH7B1JkNCIHO/2fYjttg6vQoG7C2cqusENHRGjyVgP?=
 =?us-ascii?Q?lvIf0+evsCqkfTs8cmJA2NuVlSvTdaqoJ/4qvGAmRlUAfIvEazZo4t6BIuvE?=
 =?us-ascii?Q?Dbj4bw1bJ9UJ2BiNaw4lXuLuthr8w3ZPW1cYIM7AXKfHo57wCEoZ+vL/eFnq?=
 =?us-ascii?Q?94YwnqhefA/U+GmJ/nqEMS8KyO2jSOzzyNqC39s6nGCeS9oZQD8+enS55KeO?=
 =?us-ascii?Q?BHflvMcld2lTBW0zdPcsHwun1eWxFLkOAhoubI1LKQ6nAIPIvscaKjG21RA1?=
 =?us-ascii?Q?809mqo1cXPEKrvTteXtt0OjTj4Ky5hvWpbNTeTjCNJHoe1DcEkTXw+lBnl1U?=
 =?us-ascii?Q?juO7qkyD2lMhsjdUTEV19XY/IneQEb5xhJD3tKr6R9C8LVn6v0kH1O2E/8i2?=
 =?us-ascii?Q?0fiwcApq6IsTSP/qW4z2zKllpy9bOQnpZzW+1nKEzcVQv/ySB8+eEYd9GLv1?=
 =?us-ascii?Q?Dj7B7v7XEuT6c+iL/CH1KTsgm9KYwoZKFeqLJrOKdMHsljAeFzRJ5y1FEmrr?=
 =?us-ascii?Q?I/0nPyQ1XgNe9aY95NbhXi8kqambJwLgRttot6TXXnxgY5V7CEKhYseGt9BN?=
 =?us-ascii?Q?GZxUXoFXdbGcVEMrAmkHT3Z9SZutkeVGmUaDHcHqAq/93WTJm3H9/hXTSZUA?=
 =?us-ascii?Q?eN/vFgw/3V535KFplP7Q3/XP4peDh1gI3L62qR6kYFsaZMYsaIyxR6Hnm7pN?=
 =?us-ascii?Q?XinF3998esXkOACDiaPLfxk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9735e19a-69a8-44be-217d-08dbbe58bca4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:20:53.5724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 679IFz7cf4ei9f0c38jSwXrLfElmQSBiDRX6gxh5B203ttSud7Gn3M0RUkQMN8voV4Z1+Cj/+72U4Oh8h3u6fuy+XRLHY6k2Tx58H21ONbhmQom/4evgf1nQvYb3vlAF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: DEUOUDR3XTUHYHT6QPBGSI2ZK2XE6BLU
X-Message-ID-Hash: DEUOUDR3XTUHYHT6QPBGSI2ZK2XE6BLU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEUOUDR3XTUHYHT6QPBGSI2ZK2XE6BLU/>
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
 sound/arm/pxa2xx-pcm-lib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
index 0a48805e513a..51d2ff80df16 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/arm/pxa2xx-pcm-lib.c
@@ -38,7 +38,7 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct dma_slave_config config;
 	int ret;
 
-	dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_params = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dma_params)
 		return 0;
 
@@ -47,7 +47,7 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	snd_dmaengine_pcm_set_config_from_dai_data(substream,
-			snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream),
+			snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream),
 			&config);
 
 	ret = dmaengine_slave_config(chan, &config);
@@ -86,7 +86,7 @@ int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 
 	runtime->hw = pxa2xx_pcm_hardware;
 
-	dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_params = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dma_params)
 		return 0;
 
@@ -111,7 +111,7 @@ int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 		return ret;
 
 	return snd_dmaengine_pcm_open(
-		substream, dma_request_slave_channel(asoc_rtd_to_cpu(rtd, 0)->dev,
+		substream, dma_request_slave_channel(snd_soc_rtd_to_cpu(rtd, 0)->dev,
 						     dma_params->chan_name));
 }
 EXPORT_SYMBOL(pxa2xx_pcm_open);
-- 
2.25.1

