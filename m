Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4ED76C1B4
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A45C883A;
	Wed,  2 Aug 2023 02:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A45C883A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937736;
	bh=yqoKC4gW7I7HfCN/FYVKHtZXfACEmkDfbhvG+hhfpC0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wo7vF8Unk0Hi8gHzXOcKfsqGRCpnA62CyU8BCY70av8Z4lRPpKEvKUhpbd8pLJLeY
	 GXqEBLLIfHnPtaCxp51skvkibnqnQicvcHhIQ9USlBNshOdWqPCYU8W9pHQJ1kxa9y
	 yglqYbdIjRPysVlHHaHQUeNc5EfRiyi62ppdvB2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6652F805BA; Wed,  2 Aug 2023 02:53:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53141F8025A;
	Wed,  2 Aug 2023 02:53:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B44EF80163; Wed,  2 Aug 2023 02:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78DB7F8025A
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78DB7F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ITf6FrTC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPfkQ+IoDvuvYb5uFDxR3fnDAes7goHSmZdj1dxhmtT7cvPW8t6F/S4DKxABRVbGPtptppJNKOTW9jN31NCWNQtMKZSL6vDMGUYI1vApBZzdPQt5XaVweg/RBai0FTmy8GsAgcRoHyOG19A/JzU73N0kSMxCOckRq5QPPHRQUTXRs/eDXAu8sp1SgEC0rCeVjczxXffwAO4hcAVDnDOR96xgjXjq2JAXDyem2SCWVPUCzaSMRRcrlE0mFFtqq/tlh0i7wEMyebI3gJYwcsZfd9oFgg4ygrR93rSes+ch0Ne6QhU2CLuYBdTPKYCT3ZaT1JAFpnbE2mlPudFpSnG6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjP/X10TNebzobe16IuG64ZVdZkNUeXlJbvzqPmqMqA=;
 b=g/ivyMo3l+fKxN6pLgKDLIdcCIwdt+p0roygU2Zj24vaXACt5iiehJH0B7nECFkYLoJkuJ3U5YXQyseQa1vaPfCti4kzJ7s1nDvz2IRuT+LVrmuL2lhXkjuxjMeyXtXhAbJaoUgjMam0Cp/JEnqK/50XJ9z8J/6G6Gwz27B7PrAwsHyd3FJmsTpsBY540+MAigYSdX+xSYyZktwwZIK6senaHUg9RXI0h7xEj3N7YFpkKRHQOL+MJ572TFVO39L9QRalj3F2Oz9YBwzGgDyLUM88YQiSl0iwK8ybhkYBCHmFa+qAGW2/YonWdTpxv2SM9KjNOoUMKme0z6/SmzbWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjP/X10TNebzobe16IuG64ZVdZkNUeXlJbvzqPmqMqA=;
 b=ITf6FrTCYZoipG5OWaJKXBZzjm4SFf5ZZIbUn0ZPsMZrd9Vcq+y00Y3hOW0FTa/7Pv3TManXUt7+5tnqoudYnV+JEnWzcgZkIiCPluLk+KkMJMSWlEhJAslFie98Yx0GDQPfVS3vO+I57GwBKN+4c9ZcFzhjzBqlqRd5DFYdoac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:53:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:53:19 +0000
Message-ID: <87y1iutgch.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 08/38] ASoC: bcm: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:53:18 +0000
X-ClientProxiedBy: TYCPR01CA0155.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12016:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ae20ca-e84c-497c-86ba-08db92f2dced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8RZr+RAWpD5HhXPvEQ64BDHa8w4StwHoIA465aLU2RS7im/S9KJ/rUNwPbuo7BtI1rRWN+YReGpWGCSdPnd8lWP5YwOm5saENVUDXugcFP1PJvth9wnKhc5QeohSonvyPUzjCrMcjwxDy1KIz8Ts/+jrvP6HIku3BKhteGVm07fGzzGxRroYzsTsNnPjddd51TdDD08AeqhV4LxJQkOYs7hWQfBAX/I2pXJgWGtNh4Hr2FPKUBGcF/hVcf2l1dW4kyTvgWUr69emGqPVB4+0/qBmaFJWIj9KKqFzZLPBChhoglzdvhGlaMk7gO3qBPdHme+bH4mUy6wztA2IOTaHzvQt5HWZXlZ9K7SK8TmGK22j8+LsLYjESxiumd5zya2K4F/K24T7rX71jaEKrz1DqFU3YUTSTbaEj3uUxMabXAaiI/vvWvB+1YrrNk1fb5W231RUXJWkPu9Gz0UkZ5dNufu0VT9KmDxcfOKrHmj50wH+xvn+RFf9uxoNGZcRWAqaso4lu3Ox38KaPrbRPRYaIVCtzD2GDq/0Yf++2lIL9VfiWSgZCfb9+MydZNCDQqUl0fDUoVtgryMwSZfkf/fQX64Nz+yCIj2vBfFgeveOSUhxry8bO4x95qPndkEsmAy2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(2906002)(5660300002)(2616005)(86362001)(478600001)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cBFEYPr/deKf2GXQUOeS8/mOY+rxEohBSs3F0KKgzyicxNaIt6GgjOKW/Tts?=
 =?us-ascii?Q?dmbguSX54KP7M7ldIy7y1y9tgEYG6TDf6nIzBcj/DhIJfEahE3maetOjp32W?=
 =?us-ascii?Q?bkJuGtv55RZXnm6Ng3e9f0GFO87OuVSbiDjDvVxKFg+nXvniNoMosjOB0w+f?=
 =?us-ascii?Q?Ok8qBFRzUZz7w99H2JgR+SokMDzs5VAF5Hh3H7F/hKifgoKKwQqvWiD4Bxqm?=
 =?us-ascii?Q?KX0ESN6YpDAvwsvy3SNVtsJB2/PCWS3STio4evnOqChPqRp1ThxEMKRpcLcM?=
 =?us-ascii?Q?0jHyKp2iCKwO4WySvn0JJkMJgeE9dtVWVPjaae5MRLcdI7nEPqN0icC9W1Z2?=
 =?us-ascii?Q?RMAeWgprcTHCw4pMKoTn70ia6AAouLBRGdxHzkUosyyD9s4J1QHKFPXd4LnR?=
 =?us-ascii?Q?wU7mlQr2R3Ul99xWPGdv1rhGV+kDokX+WTlCV2fRH42uXxbokMht5bbKfSbP?=
 =?us-ascii?Q?X/QfDjpubOSvXwQPjm735AQqYi21uEwVdooqaHo6+453cQbAl7bQjgcCF8cH?=
 =?us-ascii?Q?SpyF/zC92t+yR7nyvkGfoBWrL+N9rpsNvo1EDwp9X8g+QvpL6/mkqrmpkUm5?=
 =?us-ascii?Q?cklZrwCj3veQQcazZRJ1GiKTM3i1y9A4ANJ4ENl3+Vn+HgGO4G+iIhF5t0zr?=
 =?us-ascii?Q?nPUJ9zm9eM/5xoWH+FaGOECwRoCprXAOQDLXOEjKce+2AzyxOM8J3/JrsOPO?=
 =?us-ascii?Q?UgcntCXYFj/I9CLq0RcZbwiX12ERW5Bc8tv6oH4+2yD/MQK9TLHXbk1iCKYd?=
 =?us-ascii?Q?U1pMDIUClKmEcwqMqh13FEjrXHyv8T4049grHECEBSY/e56oeBI+MqC7MUjm?=
 =?us-ascii?Q?yj6IV6a8Bccq7hayeAlpHvmWjjTSBXwbVF39GlSv/tU3Q1Xj81Dp5F6wxO4M?=
 =?us-ascii?Q?PYlEfJ1L4l4gELiwbWs50lodnJaprw/XiMjKuo23J0oCuDMObV6jdBGfTSxO?=
 =?us-ascii?Q?S/JzO8+wYEFfW6X+sPq/5Ede5zahh6JgvOv1sNh4+1tpO9yj+uEuOHVqocmi?=
 =?us-ascii?Q?+cF77hXjlQUNwnzB0o8FEVXiG8EOSykQFoxB19FuBGyUx1wXz83/y9I02ms6?=
 =?us-ascii?Q?RM4TGue+2dacdLRc3thKM6BHAgp/sh9nzNKGtQ4pKXFijk4Zdiey8mg562LA?=
 =?us-ascii?Q?JrU31pIrVsE6bUYW4nhvRGQWuE+06uUcgWWEBWv42mE2AIlWvCDY2zR+sCCz?=
 =?us-ascii?Q?k0JOwd237BdaRihSXAQ4aBfsdX4h743l22C5Pevv9YMYPDGja0kgZSaxGder?=
 =?us-ascii?Q?9XZ/DUx78T+5cLiEioFj3psrM0KFXOQRPuRgBq7oYQ8M1gRgOcB3uxqLQhKA?=
 =?us-ascii?Q?t2Ex09319jBA3NAK9oHplqixPXoQSrOiAm0IpdQvPs0aXxH0YNKMwiibmKtg?=
 =?us-ascii?Q?srcz+0trOfFg4AOuRBCtEx7i34SrMl64q7IYRCZxVxyDp0W2XzNQsiHC+hni?=
 =?us-ascii?Q?/Ylz5wzoW9zGBP3jNTNnc9UnA71WmTA094cfQwSg2UHGKHArGR6Rh8RSqzBC?=
 =?us-ascii?Q?Ah4AOzTr+xt2WKeoPVZNuID8ojqoAcJhavj4V3mapVEc350FARd75HCZxEER?=
 =?us-ascii?Q?APdmwF1AwyJIeKI88qu/CSNZQBqBQ8GBmznFKYFGE7d6MfIkHTwlw9voZjs/?=
 =?us-ascii?Q?lK1vLu0TIZkOC7fYyy0ULY8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 27ae20ca-e84c-497c-86ba-08db92f2dced
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:53:19.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WyyhGXN6WtHpO2MG2Au1iqCXxIDoOjTeWRRQEN/2HZgnkwzyR9wZW55xO/w6M4wNlynGzek8J8qdiEF7JgOnmQPR3W7sr8h+Z6QLpTlqKW7nFeIicsMdp7a5lanC/T4X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
Message-ID-Hash: JL76HZ3XWGD6Q6YI7XUCKK67MVPEQUQO
X-Message-ID-Hash: JL76HZ3XWGD6Q6YI7XUCKK67MVPEQUQO
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/bcm/bcm2835-i2s.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 85f705afcdbb..9bda6499e66e 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -737,7 +737,19 @@ static void bcm2835_i2s_shutdown(struct snd_pcm_substream *substream,
 	bcm2835_i2s_stop_clock(dev);
 }
 
+static int bcm2835_i2s_dai_probe(struct snd_soc_dai *dai)
+{
+	struct bcm2835_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai,
+				  &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK],
+				  &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE]);
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
+	.probe		= bcm2835_i2s_dai_probe,
 	.startup	= bcm2835_i2s_startup,
 	.shutdown	= bcm2835_i2s_shutdown,
 	.prepare	= bcm2835_i2s_prepare,
@@ -748,20 +760,8 @@ static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.set_tdm_slot	= bcm2835_i2s_set_dai_tdm_slot,
 };
 
-static int bcm2835_i2s_dai_probe(struct snd_soc_dai *dai)
-{
-	struct bcm2835_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
-
-	snd_soc_dai_init_dma_data(dai,
-			&dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK],
-			&dev->dma_data[SNDRV_PCM_STREAM_CAPTURE]);
-
-	return 0;
-}
-
 static struct snd_soc_dai_driver bcm2835_i2s_dai = {
 	.name	= "bcm2835-i2s",
-	.probe	= bcm2835_i2s_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.25.1

