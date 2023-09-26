Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8477AE5B5
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:22:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10568E79;
	Tue, 26 Sep 2023 08:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10568E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709328;
	bh=OkgacE2MIFdYq5q3dRtZTEo6ZVVpFtdhg9sSX0yXucg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JSoQFSrVHkDhXXB6gBM5CPhpgRwCuKt3JK+bnLlQWVdGo9v9IqlPJ2/3hox94xj8+
	 MikPSQ05SQ7mREDKyjmuV5Of5sXACxV3xuU5yuiK58jDHn2sSjLw1HfyUEkiltEcsN
	 070pGSe1zuXytuhE9g+N+6dFVVAdamso8CSj3tbE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6846F8059F; Tue, 26 Sep 2023 08:20:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 446B4F8055C;
	Tue, 26 Sep 2023 08:20:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D27E0F8057C; Tue, 26 Sep 2023 08:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB1F2F8055C
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB1F2F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oo9o8hsc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ+nZLlXvItxDOG6a8vasmT5iUD1WR1jhH5XXa3HDQNOc9oAfxLxBz28GUByme5MWXpwOzt81lLVOT5Xb++LDYs/faDNrYy78f/eq4/CGyQNPU8X6Dm46bnTmMwHBqdWS7VOqW21/00IGca9TptZRXMu+zW4eHkjvJxBB6+Q6iqqyqA+krXS2lT3iuquvMbzRTrfKZBPpHVXZmC9qsyu955GDGWSB6KiF9rTkP2hlkp4ZzRlZ7zDu52E0er3Dkts/WsfJKZufj5iRctfjV2c8i6SpanZT8XxhDp/76h0rdByAZ/XX3PYO8LS43/orEd5l8DC7x09cwMpzMJkIqTqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ng3UjHwPESLSdPE2RNGYiV/thDZL9hgYgYkNQaxVhCE=;
 b=FXNHwthZ36n9jy10UFJs1Pnt4mJoaKlzDelYhuoE3YJHfONsLAq8GaiiRAtGp6FYcC4C6XGipNXArNcHTTqJmVCDRRdGLGOSXlcKpuBK23y6+PyTxt/0RuVOEr8pIWJJIr1Rkip1q9Y1+MdJpou6I7Vq5ChymBW7nYR4arKWuY7eo7uRjFxIkl5jSC5UNiUPTvPnTGb0/G5uwhBCxg7xZ7FfcBY1uSUGhposgGrbH3G7gS97t6qm5Ra7MbMm05yZS/9U2ZchZd0QbCHvJe+TDUq6GQ/XFJ0w9/qkGWI27AfGEGvuN/O7Tkf0p8TtMVHSi55DZ8KFhetM+16v4BzJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng3UjHwPESLSdPE2RNGYiV/thDZL9hgYgYkNQaxVhCE=;
 b=oo9o8hscx8venOR4nKtEDlBgR3O7XnJ96dahYCo/5NWWV63VTVGfUY2W3TVUOTAi1shcr7KRzcIFpc18evL6FFdzSvkFOOlHXR8c235nIHJAgMzFGaqnXLvz63ksN2SGLflzzL+5svgqw9Nuueh8SqVqBcjqyHmHdA+sI20zB6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:20:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:20:33 +0000
Message-ID: <87a5t9ihfy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: [PATCH v2 03/54] ASoC: sh: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:20:33 +0000
X-ClientProxiedBy: TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 98175454-b36a-4e4b-ead5-08dbbe58b0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gaFQSmK4MQyWwQZ5FS9N9+dqn/yAJQKd91vtZXo8Dmt/oMi0Q+Oc+XyKrJaDpEixYs2ZcRl56dMSplq44spqn3QfQcwAdfP7kJQBcMapB33dh1pCYMPe7f61VswjPc3QZdBu+Z2g3Pb8Nxc/qevljk4jXoutXeqs9b6GJMyh6R3HuyaDmLaYTATlbyG6Qk+m0br/GY6gOExHJ/i9nwNv3dygCpCm1rhOqAXTQ0QnRx/yzZjFNinpqACOxk48T30qrrhwuznk7aajlOT1cevbsG1TnEPxESObo8SoQd1yDDGauh0zrNLEJToYfG+OEXheR54JhXLkGcGEOVoeKHQvzNoz2+gyfI+N0RYcEaxGzuy+wXffoc55sIpjAvcuSlr0Vfm/zIy3stKUG673RJAsg9ovnDSMupW9W3zntpok1QIAQEUIfKJsQRlzgmV2Nm8GE9go4kcDlGwU8dmpx8oQjFVsrGDxF9axBe107oJF3gQmOl6ifMWIZc2EiT169UlWxwjhGHrJbYBoRAFAYDGXBSZG2qwFP0BIKVSz8hVnhC1ZMOotXfIbM5AiSuHByHgiBwCGYCHh+vvT1Y5d+MROflZzZ63LUey/x/BVMLI+b5dhxmKO5hYMPhu8PG6VIes8WxQ+P4YZvktVsoBe2RnE0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d0zLM1c3XuZkyfFGRFYq/ef+LIs3HCb4+i0nf5yWVf5xLTHmi57U4itv4FRQ?=
 =?us-ascii?Q?l3DsLyf8HbIcrUmcdl62WbWuG+YUTwtPTUMqR6RZmxrJSbRX5xGBYIaYEyBe?=
 =?us-ascii?Q?gtec6AzppudcPwGzxu6/0XrTW5TMIrIQ79Yyp+kmatcjchj/e2ihG9+uAavi?=
 =?us-ascii?Q?hEin4x3yui0YBJtQ+OopXKCu/6gFvzt3oaUzUhOe5d/LjvujzpFg4nPr9CR6?=
 =?us-ascii?Q?+HQ0eHtrB/iiaS5FZ9W4qW+ZFX99pH79uih0KHJLY8FxUrHjvgNtiOGiA84A?=
 =?us-ascii?Q?yTGalsLdzGyMoP3PE6cnpGQOAQvkdrogw4GrPLzW65k+hQJStxErE6VDCpJp?=
 =?us-ascii?Q?q3Dpt2XWBoxkszzHkOymignIwBXhKtLVjdH7p/tBlNHNXSgLsGLbKix/pa1G?=
 =?us-ascii?Q?8baFYWQGb/7Q0szzwb6WkxId6w9T8+nEPmfLMrr7oOePS+Oy2rxXGWcf9gUw?=
 =?us-ascii?Q?ZRpwlLLCBB39mXSNs5ZVOP3NM+TzLEooG7668hgmC99hhxnOioxbEhrYm9Yd?=
 =?us-ascii?Q?NK3+fk62j7u0IqDeUEHdphpfC4tZ5E/6QJvxKiaI4u6oGL/C+aJFYLWAa5o3?=
 =?us-ascii?Q?r80CAs7/nHzt6jJKV+f4MzeEIZBSsrfPSMelhurHvtE/YwxeGuIecUbggPJn?=
 =?us-ascii?Q?QuZLCZ6DUQyFgk6FXpV+QWIhJA70Jb+3uBRyiyJM5NWWahT3SAMHv9vTjKRR?=
 =?us-ascii?Q?mxzysUJ7HFeEqQsKoep5Z6yCHruYAHz4zlyxjEIjz7rCy9ujVMFTpxbPacrb?=
 =?us-ascii?Q?bRrvxamITbmCjKr6YJleXpgNL6C6mFcTef8Tu8ECIjxN9RY43+IHrIEHic1m?=
 =?us-ascii?Q?IqNVaREUJBN9IdIFxLnrTI7edD2jvyo7oKTk1IzXFr2D2dSQK6+6/43gksMm?=
 =?us-ascii?Q?8Mtr0TuvBCPtcAaL5LKlrrFbSpLvIe0us5O9cRMqSZvFboeejxPsoOnTr2+F?=
 =?us-ascii?Q?3aG5chVDigvD+Smy4TSgb/JUSiRKVL2kL/XA581B4yADpHYurUwxTuOxqx04?=
 =?us-ascii?Q?K9xzLd89BzJC41jp7chHgMKZBsxHNugjA41YAP3iQfNKaZYcWVR+4dWY0nWM?=
 =?us-ascii?Q?HiXxy2afdCUlavAyQ8UPGMKkP3IopLHrsuclXSnuaU5Ux2/8QFS356R9LAEJ?=
 =?us-ascii?Q?/GpZACWlunVbUcH7rSIlkKmnKNq0Xn5yrU/C7rVTs5mAI18gnMXDZML9g9fO?=
 =?us-ascii?Q?+t6tn7JnkrPbR1c7rZv556undYAE28Eu1wRcZOsOAUiAaS3+gaqCQlz5K+GM?=
 =?us-ascii?Q?qkM/7Wi7UlJ8hdjD1WFUJkkYDOcy0PvbFPIIXR2da1ncknP91SCZ2HnsKIlX?=
 =?us-ascii?Q?5aZilgn2WQwWzedB86urjNzkx0esGMJQqw8bNEqEFgZ4XeV30JD8JCfW1fx2?=
 =?us-ascii?Q?dvKOM/ChDVll/7YJNHbqXN8eZLrM+bU28m6Z+ILM2uQOcHW7E7p0W4C/D6Dk?=
 =?us-ascii?Q?RUVt4qY1H8UjfiJB4XzHLPkoghDCM2Kj9DCRp8Kj3UBdvFABtyyjlQM0JJV0?=
 =?us-ascii?Q?Nj6ResNxBuoUdzNqTu0Wgk/vkXvj5ZzrL6CPbieJ5V788dNVerE2q0SMcKHL?=
 =?us-ascii?Q?HrZQoIJWxHHEAF6oCvnZIBCgkRsd/Vv3EL9p29xBjBtgtlBT3NR+fJZUtlYS?=
 =?us-ascii?Q?GYry4gtRNP2W5MliU/WDCfg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 98175454-b36a-4e4b-ead5-08dbbe58b0d7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:20:33.9078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 76O6u/YgzJmZlwQSWspSe5pmiwBFj1onp/pdk4YkM7DcKM17YtBg9oamvFlekeaKQDRPs32xCuEE95FZTA+i/Zjf7tYPa60sAjQF/bicJgxVKJ/pIpCPo/81xbfH/AHc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: JINU66S6345LXT76QABAX3NPDNBYJESI
X-Message-ID-Hash: JINU66S6345LXT76QABAX3NPDNBYJESI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JINU66S6345LXT76QABAX3NPDNBYJESI/>
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
 sound/soc/sh/dma-sh7760.c | 28 ++++++++++++++--------------
 sound/soc/sh/fsi.c        |  4 ++--
 sound/soc/sh/migor.c      | 10 +++++-----
 sound/soc/sh/rcar/core.c  |  6 +++---
 sound/soc/sh/rz-ssi.c     |  4 ++--
 5 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index 121e48f984c5..9e26df823b76 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -118,8 +118,8 @@ static void camelot_rxdma(void *data)
 static int camelot_pcm_open(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	int ret, dmairq;
 
@@ -132,7 +132,7 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 		ret = dmabrg_request_irq(dmairq, camelot_rxdma, cam);
 		if (unlikely(ret)) {
 			pr_debug("audio unit %d irqs already taken!\n",
-			     asoc_rtd_to_cpu(rtd, 0)->id);
+			     snd_soc_rtd_to_cpu(rtd, 0)->id);
 			return -EBUSY;
 		}
 		(void)dmabrg_request_irq(dmairq + 1,camelot_rxdma, cam);
@@ -141,7 +141,7 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 		ret = dmabrg_request_irq(dmairq, camelot_txdma, cam);
 		if (unlikely(ret)) {
 			pr_debug("audio unit %d irqs already taken!\n",
-			     asoc_rtd_to_cpu(rtd, 0)->id);
+			     snd_soc_rtd_to_cpu(rtd, 0)->id);
 			return -EBUSY;
 		}
 		(void)dmabrg_request_irq(dmairq + 1, camelot_txdma, cam);
@@ -152,8 +152,8 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 static int camelot_pcm_close(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	int dmairq;
 
@@ -174,8 +174,8 @@ static int camelot_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *hw_params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 
 	if (recv) {
@@ -192,8 +192,8 @@ static int camelot_prepare(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 
 	pr_debug("PCM data: addr 0x%08lx len %d\n",
 		 (u32)runtime->dma_addr, runtime->dma_bytes);
@@ -240,8 +240,8 @@ static inline void dmabrg_rec_dma_stop(struct camelot_pcm *cam)
 static int camelot_trigger(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 
 	switch (cmd) {
@@ -268,8 +268,8 @@ static snd_pcm_uframes_t camelot_pos(struct snd_soc_component *component,
 				     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	unsigned long pos;
 
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 1051c306292f..d0931f4c9976 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -406,9 +406,9 @@ static int fsi_is_play(struct snd_pcm_substream *substream)
 
 static struct snd_soc_dai *fsi_get_dai(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
-	return  asoc_rtd_to_cpu(rtd, 0);
+	return  snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 static struct fsi_priv *fsi_get_priv_frm_dai(struct snd_soc_dai *dai)
diff --git a/sound/soc/sh/migor.c b/sound/soc/sh/migor.c
index 7082c12d3bf2..5a0bc6edac0a 100644
--- a/sound/soc/sh/migor.c
+++ b/sound/soc/sh/migor.c
@@ -45,8 +45,8 @@ static struct clk_lookup *siumckb_lookup;
 static int migor_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 	unsigned int rate = params_rate(params);
 
@@ -67,7 +67,7 @@ static int migor_hw_params(struct snd_pcm_substream *substream,
 	clk_set_rate(&siumckb_clk, codec_freq);
 	dev_dbg(codec_dai->dev, "%s: configure %luHz\n", __func__, codec_freq);
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), SIU_CLKB_EXT,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), SIU_CLKB_EXT,
 				     codec_freq / 2, SND_SOC_CLOCK_IN);
 
 	if (!ret)
@@ -78,8 +78,8 @@ static int migor_hw_params(struct snd_pcm_substream *substream,
 
 static int migor_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (use_count) {
 		use_count--;
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index b30e78cd7478..dd256bf7cdd4 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -690,9 +690,9 @@ static void rsnd_dai_stream_quit(struct rsnd_dai_stream *io)
 static
 struct snd_soc_dai *rsnd_substream_to_dai(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
-	return  asoc_rtd_to_cpu(rtd, 0);
+	return snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 static
@@ -1574,7 +1574,7 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 	struct snd_soc_dai *dai = rsnd_substream_to_dai(substream);
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	struct rsnd_dai_stream *io = rsnd_rdai_to_io(rdai, substream);
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 
 	/*
 	 * rsnd assumes that it might be used under DPCM if user want to use
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index fe79eb90e1e5..f5f102d878c7 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -158,9 +158,9 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 static inline struct snd_soc_dai *
 rz_ssi_get_dai(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
-	return asoc_rtd_to_cpu(rtd, 0);
+	return snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
-- 
2.25.1

