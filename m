Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 788DE76C1C1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:57:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9585684D;
	Wed,  2 Aug 2023 02:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9585684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937871;
	bh=kRqSs6jt4N3ypRagLe2vBMEFLvD7gMgV8JjuUQK752c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fIW53OBJvDzyicTdcT6MVDG+/YWzXa1H9lwgnhZB3nfMvNKJCrL4boiBz0/IaGJX7
	 vW4kds+1VA7e+lxGVNt9DKrqjSUnUEfSBePj7eAxZ/UhOaJVs+fGVZWrg1oLIQLjiG
	 llWTGYPnHctwrT7ZsdOoXYxwnB4NB4CARtaQAEsw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AE94F805EF; Wed,  2 Aug 2023 02:54:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40EB2F805B4;
	Wed,  2 Aug 2023 02:54:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5531F80578; Wed,  2 Aug 2023 02:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADF1FF80520
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF1FF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=E8YlguMx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkSZlj6NCXGgZjYHPwtf+qaiVeJXPCxHuzWj2MrjJuvkv8eFZks/JzW+Jv29nBHtHYzT7Z7Cm/1Kd+JuQi4/KCqokybclOXqUgdhrOWGcdxMTKon1eIQANydbq+5fFhWD9ZvY35qDD8LTw/ArqUWH9v90HLMwyM3Vzoni3SF+97h8Gn6TvcodKwTrLTG8u2Wyzpv0aBGR40uG4xvr2CdxqFXioiLeULzdf94Mz7ivQu/91AQJvqZve9J+3ZYILhif5k3EUxs1/S0q57XH+y0yNKf2ybGndHwXZibgyZn1bWM/aUB3Y2BRwp+jRI4W7eW3G77lzM9j61LrGZV/pH2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UP2eRrn5W/0brVTeBcezl9YApU3z8EUrdBWpxvnLvA=;
 b=F8e244BLrn8RDpznzd27Tsur/TSRgcxre9pKmVnM7FtWb/yNLzG8FNie7PY5/bB94zo2Zq5kiNP/Fer0EYgxwMmpzN51EiRbUMArp3Dvt6qvwsX3gDRhqyOAmKpZVwJTcpRHGYwPYOAJjDlGiGcajfjSYnWhhBpBlVKRgp8B8eDVKPuv1Br3ZTos2T6AJ+Nc0l7X0lKbyciWUNyIadrRQ6qZfEtqyIZ6KShBeoCLkNz14csLvNzhvaP2rt12o8bn92WzJAh/yAkXZ5M1maw45rT3ktiyO084q8g+M5cNhXv6oJ6E/H7ipLBdOmvW8jkZQIec8gP+MirAcYOSKJRpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UP2eRrn5W/0brVTeBcezl9YApU3z8EUrdBWpxvnLvA=;
 b=E8YlguMxO8i/QIpBG1xCajBB762Ql0axiQZ3Ji++FC7DwjXGytMlOdufpVUYEqSpF9j6oS0mosQaaY3kojV3T2St5GpJxaDN95FUxVsIcO0cbZIkvRnjWXN8C9/5yRSe6d1KuUmzj2KQnM8TdZFRXCg6DVBsmXlHCWQG3RjapAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:54:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:54:41 +0000
Message-ID: <87leeutga7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 17/38] ASoC: ux500: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:54:41 +0000
X-ClientProxiedBy: TYCP286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 0deb61c2-1d72-432e-e898-08db92f30e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+WbGOMbNt1PSUquI3yjlvBOqjJ9K7h85ErrJ2gLtsDe5rU6ywu9U5GCLh/MSDs+S6uM601fQhcQxv3EvLt4fPHEXrINZlsEbmhSSDSRGxgpIOsrQFI7lokwhYP3e0qawe6uwMkUskbow0t2jkI/hVO/WMvwh3KWhU5qJo//cUnUf4X2yFWyzRH5WQYxmAn/4MyghN1gztcXr62hGfXmZJTUvPjH+ZKWHPERFZt+L+zEf2VT7qdsE+ZUdOrp6kJzebaS0GAa2mnXeKka1NaxbsGm1RBV8YD8hEYvD2+Z0pxMZ3WhbAOjqyCqg0nhwKg9+bwpQ4mrexDOWVvilHf13vewgrYi62U3lWaI/F2BHrRYptM2K7LR7N/qsHHCWfjSLbYja1PCAeI8wRw9nukGFMvqi7DiCeL6mnWTS1CQy39FZoVCVR965FAwWOlb6OR2hlf5tcxPu/lO74EI8k257UCXaKkTpmtaTO+aEQPlZIm+gntAM8hOaibDnxEM0LQ00ofy3YUBY9cwf70D+eM6AoVIszN8xS220YMvufupzCv4/daCTKOSUDgTUwHL4lFpWBzvfsLgCcTaAi8gL/bCPhDCUvKHtu2Sfp6KSQrwd/DCQrbT2m5JfCiMt9cKFomqh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(5660300002)(8936002)(8676002)(41300700001)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mRsNqw/jeolUJsXAOv4wm0/8vw/8mt1eL8LWWq6Ai+9V70Xz9uLvL7qVaQ5M?=
 =?us-ascii?Q?uNf2t74rUnq5h7HFHyjw63QCNwu8gaDs6r821Ux62nYbz2oVpfylGtySfFLS?=
 =?us-ascii?Q?muQiRL53uShvoy7dJWfcaOGcahYBpIomdBiVOwY7Kl6Voha77YDHZmr9U86H?=
 =?us-ascii?Q?uTRRKQWxnzLMviZcOsIFzzOdABZVSNVHkKucR2yImqtiP61Ar2QnmKdGcvlN?=
 =?us-ascii?Q?Yoim4//GGsjp9QatyrRQ+lpA82LQBUOudG+tyr82M38lr/vLA5VkUFpAF/Su?=
 =?us-ascii?Q?wc20sUcU41ltnsmnj5X60oBIhAkEXtzx/AP+VZcxqmGf3LmF2MNbL5zF8E+W?=
 =?us-ascii?Q?DiTQ01Py20TamBoUiqo3BkDq5Q72xPgx04niYljGVfgjdPQT9rUgvhC+SjUE?=
 =?us-ascii?Q?xZGKJVTjJKBY9nAUgQ03lvG1hqNxT3WjYOMVNWqZPrVd0n8tt/VfFgv5DAih?=
 =?us-ascii?Q?eXXcyy/BfMp1y3nGaKI70BNxngy+bdmOVmiltPEJCg1Y+RBhbw5SMbNkemUz?=
 =?us-ascii?Q?zrmhrWXBRMvmUvwIUZZEbSIsexnghWQ6M55eUjToQgrYc7nHqbX4jr33ucJr?=
 =?us-ascii?Q?wWMs/H/casuRRvD+FkvpPj8vqO/lm/6AnPtEtPKZFrFd9o+WnDMu1nYFDxOK?=
 =?us-ascii?Q?E26yXYfqomztOlMBjkWYY+u8Luj6vzS0Z/sEP2f9+qRGkHjqUN7UdeZZzlmt?=
 =?us-ascii?Q?B2uXfnRISuW1qN8VhKPiuYx15Dewt8KIfXrhY4knNEyC9SXb0ft7sAcdxs7R?=
 =?us-ascii?Q?EZnjTmoP176l8mFrLrcN5V5FiLd8YYSG3Oz+fYHbMIwOeO0BpO6aP9TZLFGs?=
 =?us-ascii?Q?ijDWkjjYjYNjvVJLGrqd09Ypx89QQdTrH3nub8BDPpZsg1gUGSAKj+XaUGQR?=
 =?us-ascii?Q?UEmJlMD7G481yy7LbfFOW4gE2d7OTgYtzs6WCyuTT5OPuLDkHFszi7mglT4Y?=
 =?us-ascii?Q?RFBYJlNHATov5MLV3J6q2CDH4V+pamwrW09r6BGN1Sm6rBHwDVTh+n1Xsan5?=
 =?us-ascii?Q?hfoBf/AZ+swS/q4uMADQ4PmOEAw4bqmxvg/8KvCOmgXdj5C6GbRXl8n0YrGM?=
 =?us-ascii?Q?BPENF/B5qPh+80tlZSbc5u51lCgleSSCFwASmNjFBk5cigE8m+vCMmN6Rlp2?=
 =?us-ascii?Q?gCdVO5dNfiZivqm8Byx1Pg+IF8EcKv2+NGtd+VBQBH4nDMiBgSN0cSZPB4RO?=
 =?us-ascii?Q?lGWMz1GIxvsHXVFsvlpSqUa3si1hQi8v9+BEpQJqKk6q1y8CjKzMU6pqlXid?=
 =?us-ascii?Q?X6YksBKmWJC0T3BXjoXlISkOwD5+VS6yvlWgDnEbKROpBGxJo+NuB2Qo3nfm?=
 =?us-ascii?Q?gRoX+cIsBm9e0LZ1i+JSN97qgrNJFUmbZudF5tQjlO5Y7VnUCrLF9N0xaIN+?=
 =?us-ascii?Q?qIpr02iVeRiPN7vThX2pBq2W4XKvsUcmAB0JqzNHBL5wZUdiwdKFJzaJugG/?=
 =?us-ascii?Q?OJov/GcjtDb+xQzxknIIKl4wFEIUsSZjHeqiRn/HRNMfXdIJgrNJjZEx8wC2?=
 =?us-ascii?Q?2i5MjCnObh9iWmPW4jXemcrL3r+2tvFuyzOXUI6wKeMfbRx6wjTbLN8BMXiP?=
 =?us-ascii?Q?7UL0r4v2gvZnXijPJVeMrFoZmwIDhctJtffWrjmkQgQ+1G8hZCwDsciDdmAM?=
 =?us-ascii?Q?996uQWwxl1y7HSucpA05aNQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0deb61c2-1d72-432e-e898-08db92f30e1e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:54:41.5754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wx56telO7IMfg6BLBIoNr4N/IUQTEWwWYILQuqW+JH/l8H6cmRdA7Hcy9ikwcFQ+mQ8CXFSLwn60p1aMED1QN2A6nZPUMM4tqtO6hBoxVBFwJFgiKO9MMcjXJ4GQHrtA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: R2CACZUY4EHLLUAO5ID5WYLZ5EEJRYMS
X-Message-ID-Hash: R2CACZUY4EHLLUAO5ID5WYLZ5EEJRYMS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2CACZUY4EHLLUAO5ID5WYLZ5EEJRYMS/>
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
 sound/soc/ux500/ux500_msp_dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 44e88dad8584..cde0dd8e2569 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -683,6 +683,7 @@ static int ux500_msp_dai_of_probe(struct snd_soc_dai *dai)
 
 static const struct snd_soc_dai_ops ux500_msp_dai_ops[] = {
 	{
+		.probe = ux500_msp_dai_of_probe,
 		.set_sysclk = ux500_msp_dai_set_dai_sysclk,
 		.set_fmt = ux500_msp_dai_set_dai_fmt,
 		.set_tdm_slot = ux500_msp_dai_set_tdm_slot,
@@ -695,7 +696,6 @@ static const struct snd_soc_dai_ops ux500_msp_dai_ops[] = {
 };
 
 static struct snd_soc_dai_driver ux500_msp_dai_drv = {
-	.probe                 = ux500_msp_dai_of_probe,
 	.playback.channels_min = UX500_MSP_MIN_CHANNELS,
 	.playback.channels_max = UX500_MSP_MAX_CHANNELS,
 	.playback.rates        = UX500_I2S_RATES,
-- 
2.25.1

