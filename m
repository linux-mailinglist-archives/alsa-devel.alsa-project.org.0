Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F4674DD0
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B89182E2F;
	Fri, 20 Jan 2023 08:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B89182E2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198552;
	bh=VMtWelD9fLakCoGBidp7XbMdZxnRxCsHw7y5dt97dvY=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qoJvWKltS+Dvgr1R/r99Ysb+yUX+/Cvklw/iqQpwY+JLWBVj6SHkg+6mbadZ93beD
	 YbbKZ4ODDLedjdIBV5ra4lIzffKedsEHUuW1qlj1JGJ0CwVS6STvBHPaUYhI4KJBLd
	 COPbd12kB1kEjiC6PQR28FnoIy85qNvPv7tRYfWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 054F7F805EC;
	Fri, 20 Jan 2023 08:04:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE010F805EC; Fri, 20 Jan 2023 08:04:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 095FFF805EA
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 095FFF805EA
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e9ZsyUnu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwTSUDXTd+Pf4TRkMLcggWao1wyp114w7lJS8R55uLHno04CfIicx8kB9q8eEwWqssCcDyh8a5+Z+69O4IwAVp59F2RsLEwqsXZPBGcqg3to/GR1b7uIBRK97TfJyTbOMx1QPP2IFaSV2TQ7mWLFelCB4wRpJjgWmGH3Yj2C/jzKIurVGHu5fVFMND1dtWzFPnb3AfW8vgENo53zqLxzQdpCjsxI9NkCLmASr44qQabR6kG36ecnqX6bPkvm6DZfTbw7/28xVWYsIPyNapTavVJAyZ5ukJNLvBKFc4fKyaOy5Acww68GLaOKPaE0pQnagb9x7pQf6BGVsdkNPFuciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfSBwC1PbmdXPFQs4+9KKPYn1h4V0AVu1SQwd9b7lPM=;
 b=YHTzcXCMvUxFauhrYoloLX6QEx3G0hnp7JNdXTTkXDZfO5HHbjv2N757Y8BUlz2rKzqX1nwScVmULjVAP7j06QrSA4ckU7fyfldbpxjuVtG5mfaLLXL0fJNNOmjR+kc7dmn1cUt5j3vf5r1B8igBANCgUBotO9p1YntLhJf7vg6s1XRUq10erTqXXR02WflTLt2WbIfLNLilnHTzGhjfqn+z4a7zqXdBR0+UcVpfEsXBKdmUBmQFxTPVChM3izYV2LhmDUK6B9Xmqc93SDqlJuBJh3qxVeKkVNW39KT5DsAf44Q35kyLwkvcsK7IYANNZ6ObDg19+kiMEZhjIoNPcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfSBwC1PbmdXPFQs4+9KKPYn1h4V0AVu1SQwd9b7lPM=;
 b=e9ZsyUnupiCwX40/5HXTHTq3lGgs3vapiNPyctgZBXq95CMA2hXn5bwupB+SPoAhakD2VfO5179ctIrTGWS9O0Xg+nRMV1QgtbyNwfl+z+Z2Sp9C8jSmLSWY0SbZbcz6wbM+OUaizUnSy4UlHCrWAPNhmUyjfrEjsXdCCthkXgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5825.jpnprd01.prod.outlook.com (2603:1096:604:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:04:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:04:03 +0000
Message-ID: <87cz79k7q5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 23/25] ASoC: soc-pcm.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:04:03 +0000
X-ClientProxiedBy: TYAPR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:15::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 51df9eb5-be2e-45b2-526e-08dafab48373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AYs6837AJWoEeMQV58XZtZ9yCl0yuo2XW0LEZZyg0z62/nsHsD9IFMzdkKibYJDv6ZEaiC7yhnC+C8+WzepVpbnviUVB5dhgFMPIJ/rVnO5Jf03kA3AIvvGkodp83+W/PnxzmzTe9teAXY2s2xI7guindwCdp4JhqqP/d9h2hYDPMILSbJglHDv+5BKAwvPPfpA2NM+fDUSP4XAdUP4C8i9zQ5bhbNJXMdrUbAZ1v67D2IeUreBsdFjmNzLjuKcFl2j1XsRkbiZxwAhISxb9lbqVefBOQrLsA0pFLgM9fzXGYe/cig82wo/NfnP9SIaykbVdnD6ZzpXOCjNc/XXPGt/Z6EX9Nla7+SX6WttOTqkxXZqsG9iQQv0UBjHr5Ml4bIU3Ii1AIh+CrCy5Jvk1KNhY2vut0eivgOx4XWMdlGwGFwI65ge/qKjNH7VJyRQZy5DJd8OoXwbMgSdmsbwvRPAj3aFxNkzr5/5Z0UcDw8QQlDr7FSO/JR98DL/2uh3MJD9mnBj3zZQyxVTZLpP0G6n9lfWOQKKYxFYA8Yya23RgJya5lUdNP+IxE76stPFYz/gUlU7zBW6h6P2//lTscmMpW6+lHrwN4cH2mgvId03LoPsBRS4BuiK5SgfRyonwi6jHo3xFDoysX/gT7aIi4Pto7AKLh+sg5uXqlK3x2gophT2BHaxOKYuKTTMl4nk8c02RoDNoE5AB4MxrwhWSkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(2616005)(36756003)(41300700001)(7416002)(5660300002)(8936002)(316002)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(26005)(186003)(6512007)(38350700002)(38100700002)(86362001)(2906002)(83380400001)(478600001)(6506007)(54906003)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xkcapcgvzhhk6kIYUSU1zHp/6Um/X8FfrgBqvO52pZdvPDgKqP21IxEVqenR?=
 =?us-ascii?Q?eYspcZOGOjXI4nMY6kxJ38HzCduu5K6kJRXoRCPpxKmu05dMU0yqFXRNBtxC?=
 =?us-ascii?Q?MxISJqQjcxm7j7jcJrsn8zlq9k9BH5B6RhB2c1EEJssTUzfo9XxdoP9h+cxz?=
 =?us-ascii?Q?FdqxGfNSkxwXey0SgVM6KK3sMItIvT6YH+JpJHj22tVv5rgHs7z2nMqsuGVf?=
 =?us-ascii?Q?fUG1XdMIyxM/C1nafzOZE2+TPy4doKOmcUmBtlMu1/ZJqEStBj5fUo3Bfgyp?=
 =?us-ascii?Q?NiblEZtP6y3fksVhwlyEeazT7dXwZ72yXMQBp93yjcwCIx1GY8f7DRuE5Owm?=
 =?us-ascii?Q?hDUku4kNb0kBOO9mZeyckwkHNYOA9kR2OaLbzXyV1kwWZal6DKQY2m2W35hv?=
 =?us-ascii?Q?BqbhRrFvgg2Y2MPIJd9jU1zq6IT1wCyUimMMPCbTHzMmL65k/dGtGo6AeTdP?=
 =?us-ascii?Q?uPOG/qh4gPzkOq+T9DZuVZ677uGgVmsG/i3551wv+PFJaMwLrnOTyZQQYqch?=
 =?us-ascii?Q?bUp49zVVQUEDWPpJy866wivFhVx53eS7BwzkimoCA2FDzr8wrawrAjSxQ38M?=
 =?us-ascii?Q?f21UFnB+ctHORSA2uiosZMgcszTI1jNbTBUdBvwrdDCotIMtAGc2Kn4tN/E9?=
 =?us-ascii?Q?mI6lXuSfP2UueXeopUdphLDganK56qLc0Lb3OUaJRiUMTfo2GT2sBig6X0hU?=
 =?us-ascii?Q?cG210MQjBTwIYweYBKDxCgQtLKRxSc+TLRjNUpY1viA+1J+CvnLsHGPakV/Q?=
 =?us-ascii?Q?bYsL9hVE2AbT6MKpFzRSZaImu1ofCBc+Lzv8iH+NOSWoCW8lyOkjewXGESOi?=
 =?us-ascii?Q?MxTr5FjY19Oubi9qMry8+SW6Wnkoha0hDzpJO4rKQbCu38IhdsdAbYzNRKW2?=
 =?us-ascii?Q?jDxiqe3dvBGxPU5y0hk3KA2XnaJbLx61xFlj3f/U8/tyZn6x/WQ61WKgeknD?=
 =?us-ascii?Q?b++hUawR4XQZkjRx7avRxsH6ZH6IoU/3RtVEgtwnQ+BIdsoKXaEuyNsJkNBl?=
 =?us-ascii?Q?k803K64QUYa14kx6MtJPzeKjY7X/hMFEcXjQvpr0TuSsGxq0wvEbtOo2wapA?=
 =?us-ascii?Q?qwUcz3c3v+pmrD0wckqpYBeRyuWGeLnGcG8WoxTg+HSg6bqyZM6giU+LBy0s?=
 =?us-ascii?Q?5WQfNOrLwjqK6GRHvtPbPYdzGTSbjM7+1XoOaLD2IL0q77Tb5ibpvtmI9VFP?=
 =?us-ascii?Q?bS8vEY5gcHsKCRr8kgdwoo1IcyK4CoOYiZgaR/kmgl5TMSnbxU9WNygAudVM?=
 =?us-ascii?Q?Evh+fz/+IUEgqilGduJLM0YjV2ibwZEtl5hrvkWvV9DI93RXM6rxc9utzw+L?=
 =?us-ascii?Q?fbrmfFhIuw6j+z6eZ8eaQIchjpt7SPWRMJ6CWRZwsDg5SSQozZaI/0Lt64nP?=
 =?us-ascii?Q?UFlaU16SM961+lvS+/SSnu8zMwB97YLt2xB+kk/AFzucuIrRIH0cMvAiqoB1?=
 =?us-ascii?Q?Z+LxXL1qcc+TOr9HWFIranVTx+uTcFCVkypIY5JchpKhxMV75+Ct0+dMUJZ3?=
 =?us-ascii?Q?7IovovSWw8ojGDoSAgrpCzLgiKxei8rSQWVVpJMfDsps+qxwFt98klr4gt7p?=
 =?us-ascii?Q?nqcDWOGzm2MK5KfPq7BtQOBYi0p9NFYsQOpA0RJq+P6sEqMxBEUboP82ub2r?=
 =?us-ascii?Q?ldkUluiCtiX/MYKR9yWVOc0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51df9eb5-be2e-45b2-526e-08dafab48373
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:04:03.3557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bE8UMfX/Bo8QQ+pDw8oRxKbsFdItuAGIPT/RQmoBZKrhcd3wEN5kKrUfY9NRVAoErL5yjykFk1wq+LHXm3XqxuSq3twoBSSNWpBL1orj5BjHd6gbFNDR0qNwQZHbLoBn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5825
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 82bb46c7f5cc..8023cc1fe066 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1012,6 +1012,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		struct snd_pcm_hw_params codec_params;
+		unsigned int tdm_mask = snd_soc_dai_tdm_mask_get(codec_dai, substream->stream);
 
 		/*
 		 * Skip CODECs which don't support the current stream type,
@@ -1034,15 +1035,8 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		codec_params = *params;
 
 		/* fixup params based on TDM slot masks */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
-		    codec_dai->tx_mask)
-			soc_pcm_codec_params_fixup(&codec_params,
-						   codec_dai->tx_mask);
-
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
-		    codec_dai->rx_mask)
-			soc_pcm_codec_params_fixup(&codec_params,
-						   codec_dai->rx_mask);
+		if (tdm_mask)
+			soc_pcm_codec_params_fixup(&codec_params, tdm_mask);
 
 		ret = snd_soc_dai_hw_params(codec_dai, substream,
 					    &codec_params);
-- 
2.25.1

