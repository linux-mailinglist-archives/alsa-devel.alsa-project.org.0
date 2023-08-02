Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4B576C1C9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:59:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E75404E;
	Wed,  2 Aug 2023 02:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E75404E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937992;
	bh=7FPMac2Bbsym8ZD6vK8cSe6C1gmdnCd6gzEJ+HgyT58=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vBit92z6PezH0+wvOBLYzzsfPpDmhFyYK6IjLVf+DG8KB1DdVQU5NZj5NytElmtJg
	 RODah0MHT3EOEx4pWBjzat0kGCw29dKQJUM4BtE6ozlwbCpJpZasMbmjiVDZGGxTyN
	 WRYhucdb4U9YBDLFMzqmuenb/1/RsiTYNTSuCHJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9C4EF80612; Wed,  2 Aug 2023 02:55:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 998E4F80604;
	Wed,  2 Aug 2023 02:55:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 757C5F8060F; Wed,  2 Aug 2023 02:55:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAAF4F80608
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAAF4F80608
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=cTO6xezC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a986aAw10sfmwRswuFdqikbzv5ME7yFOopPDXgqqhKyS9DFDK1NecDZwt/jQn9lGFgMWd4cCaAM04zEu9KaPq1BjaeAHl/SO6q8fpiraE/7zb4AvqEpvD3qvyTj8AJAbCN4+Dt9pYI/2pVFUnpeG/DPsl0HlMRrsisZknX3u5tdwHwJgOzzvOkEEW8KRJIjfTPbapWIfU6Q4S2sMuVdjJqxpj4XrxrvPT5zOIPm4k+8VisHe09dA/ZQn4O9UtQgQLgaoHjBaZJGBJ3hjK+LAZnLMuxpQggvloDgx+pWUiAo7Linc9CklGL9xMmMgDIBXmm9L6oxd8QgNgSIQ9Xv36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9lt0t4H3slQDmuUYV4/CiZU97sPeSEz2mtSgkWlo4g=;
 b=QRwQY37oy/x+UvOgis+XZssLtgx4Q0fM/Em1QXr5YjK8J46Gp8gXHvoI+YK4wN/oB2JqlD5G7ofU9HTCTZoQctS7/S1M2L+2vrKBsSuX9aBzynVQYfXRxx5E3/hA/8bswg3OCn5lCAF0o9id9PdnmEne26FLy4VYnKKUHPLIwiaFFewJnbt4vgUGE//VfqYGFWihepTshNlNHD8sw/iAMo+oy+JkZ8ki8DzXLlEp5cEZC2DGf/inlqoUEuzIYh6B3n/EAtHY4Ppz/NYkXOpHYyeXYAtt3jLF3BEETn7UqrXlIf4VFVUfAZyH3AftkPPTdIxHqtPGlc4jsszTsF+tsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9lt0t4H3slQDmuUYV4/CiZU97sPeSEz2mtSgkWlo4g=;
 b=cTO6xezCBbhojKJjrKn2zAxOVfk3GP4E0dBWlwJRRgmKSuJlLXnsS1pQJ+359VmAExzQ16u2DGcDW3F6AFOZePwZONpUuF8sPWEZZ0c54US5I0Cn1E5QWdC5ucObtnsse9lML2hGe4b9mEtWjPwOJx207T76g3p3mgxLK+cMYzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:55:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:55:41 +0000
Message-ID: <87bkfqtg8j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 24/38] ASoC: cirrus: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:55:40 +0000
X-ClientProxiedBy: TYCP286CA0124.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: f776041c-7190-4264-8a84-08db92f331c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9QvnMiQ3/KNRQIpcGzAiSLo+hJYmAJm4rRWeZZwV39VZpmeh77qsD2dYMZgh6o8UcuwBK0lELcXNCdLR9YEvZv1t/YKH30Le7t+5BQ8AYsTaSr/bC5o7kpGqXEdcfj9zNdJVuZjEAnYiOa4iU+C6fzkf2EZKfeM+3iVfMQ0CPfoWgJxvm8iZ2gjW8hgiDcWdxruz9oMEsBxHjwK9y6PeosetRB4OVQeQX17irSJ+arL1g3geY+PJn2/ZWkvy/pvigc5wJkJ4KO/8BCBq/fkJCOL0bpe0l9ISNZg2GrCvTHWAo+9PxwIcHeVIQ3R7ZSe+Vytqm/i3WGJdDijAY8Cm921f/LEpqMmynVWDXx8fLLd4cvPvlox8to4FwejTikIFBAbuMKbyw7nCYAaA1vYI4QMpbWA8UVT3FQA7wlH66B00jaNoCnw2Nbppj/pJvTsnFZbD7Ng7u5Au+P81FCPvAp7ZdZIfysqj+F6SH9MHQxWa1Fa0vA4G7PO9JhcCqYmYSZUfILQKEFM4Z+ko2YZjb7jlP9dAYQIc2yN0VoKA0ldNzoa5mttNNSNkEhyrEnEGT8mHDyoBwGKgwf+O38DWHR7AyyZZxtFznJ4M2YQUq1buT5si8CHQz8uldD7mQMrk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(4744005)(5660300002)(8936002)(8676002)(41300700001)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YKsVqMKRvJSLu543T5hPvglgieJVr3nmZfEK/VBET48toPGmTqpSM7H2EXEM?=
 =?us-ascii?Q?pStFPqvFRnw0PP1OaG3xYKiMRQdN3PWSQzyX/k5x8KMH4Fil2uP0frxgwRTZ?=
 =?us-ascii?Q?gBwC3G53daj69FZhT8A7MOuzlCxBafc+fab9it1EfUhW2GBNJHO4xd7DagSx?=
 =?us-ascii?Q?01VV9TGrjh4Y7xfCyS3KzxIIbvPymX+2raV4xPlewINrQFaLk4w9NP+ADC1G?=
 =?us-ascii?Q?uN5We1a5mcgvz+ncjvaoinXzuD2lt2gsj9z4vBw+eR2wEL+EX3ave/rUhq8t?=
 =?us-ascii?Q?5QYCHccg9zVbgdcQMiHbkf297pdD4bMId3dfySGUjyV2G4LzRGji2TjjudQO?=
 =?us-ascii?Q?UwFy5gMMTqFrzxYCElituW9mOfyvc/DYNgU+8iwWKbaYqSjcjnj6H5uhd1hP?=
 =?us-ascii?Q?Sk23Oi/EXskecPjUevaIoMfvi8yFoyqdlD3y4BOW9BoxsA2YVIItshKS4Msj?=
 =?us-ascii?Q?qSiBjMOR1TDXFX/1Re7Q4NtHRAK/asU+jP2u+XuOM2ISIGnPdZvTRdNrwF1o?=
 =?us-ascii?Q?c0uzyJXvNkyGJM0IgazBILSojV0fSext2Hy2YaWZvXQo4yCnrS4awXo8+Pgu?=
 =?us-ascii?Q?dUo8hl67nOM9BW/54oiG5Tc5g5DFXMqP/0hGFLYryTYluc5j4li4+V7F6Pn0?=
 =?us-ascii?Q?laIWZ1CkTZDpf3xB4McmZn1NdHHuc+DDb98xd0zvm9u9OP6Rdo5E2YuuqwzY?=
 =?us-ascii?Q?ANUBNDilSh6QRGD2g9h/OrmOoquSITGSnmh1iBNiLyCzGSAmkJnEp0+jtqex?=
 =?us-ascii?Q?H80oyK+GpH7sYL/2XWiiwQN0PMGexwUI6FrsDwb0nCkuTziwxnUn7BTvelDm?=
 =?us-ascii?Q?qIiq5MaPGI2atxT8d3m6P8VeKKRkLu4SuJ9qMS6CjidV3tqHi1pnSV7mhZNJ?=
 =?us-ascii?Q?mQebhwir5+NcVqGdvi2Kk8qq4w0jKRT61yAferIu/aHanHe6M8fCI31xkF3W?=
 =?us-ascii?Q?dpPTgHq9DCLVxlGKaAVHB7/1hcV25YwQUOwG0GHPRysPF7tnhyHvcb3mnBDh?=
 =?us-ascii?Q?AoJZXnycVQuymkGxXkGTvF5rrOYN17PL+tzZWCJNWZfgGpc3lwummSVPEsVW?=
 =?us-ascii?Q?0u12Jmt+SXc6aaRTA8CAbF6BNGKkoVWMWwnnb0Q/vkqqP6oVDB/rVYsLd64T?=
 =?us-ascii?Q?0kccAi0KBsxmLFVmAmxdkCmRvkwbdQbPhI638A+txnHN6lpOb0e1V9SrlCLr?=
 =?us-ascii?Q?a/oPrMpcwBqL0Ch2m394eq6OJmLCZw5yiN8ebK2JSwoq6vjm+K8t2vjJMm0O?=
 =?us-ascii?Q?tjGEMbhTXJoxamk4mi8aSknVNlpXg0X76ga7l1ZqJy8ThlkL4KjaIdA0fo78?=
 =?us-ascii?Q?liEyuR6hKUfcAcAxDkp+HpuA2kA1jvoVaY4V4bafqzbHPSlguMl2BozHe6lP?=
 =?us-ascii?Q?mNZTGoCZM9HcAfPWHs3k3pLm9FgxJhSIlLI+UKHbFpk5X03fzF15eK0VRwbY?=
 =?us-ascii?Q?QPq6IlHTFWi9LLICk3aRyHpspxJRcmQVovBhoLcFeL1XHN8GmrPcLC/Vc7KT?=
 =?us-ascii?Q?Kv79NTSJIxq88Yn9TLUgV3Vppc4OLe9K982uOv2DaRHf7niEXuG3GWkkoWfg?=
 =?us-ascii?Q?aDUJWS/mPFVSdv8qSRi3rWU6J3k7XcYOLbKtqzL6JuuJwo+YFEDMOsTwx7i+?=
 =?us-ascii?Q?JXfsmMRRNR3XlUKD7iAlV1U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f776041c-7190-4264-8a84-08db92f331c1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:55:41.3767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pfnLdUmKPVOwvhi+p76zITTKwuRMWFBzPWo4hw3DXCAkJu0OYB/7TISeNDOWMHPUtS/Rf0mS6cj6v+jPgoirxFHiT7NaQRL/4q3JmQpqQoincHVDzsvx+ub45gRqjZGg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: YHFRQBR46BQFHD55ZCF757M5LFWZIXIB
X-Message-ID-Hash: YHFRQBR46BQFHD55ZCF757M5LFWZIXIB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHFRQBR46BQFHD55ZCF757M5LFWZIXIB/>
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
 sound/soc/cirrus/ep93xx-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index afc6b5b570ea..522de4b80293 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -407,6 +407,7 @@ static int ep93xx_i2s_resume(struct snd_soc_component *component)
 #endif
 
 static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
+	.probe		= ep93xx_i2s_dai_probe,
 	.startup	= ep93xx_i2s_startup,
 	.shutdown	= ep93xx_i2s_shutdown,
 	.hw_params	= ep93xx_i2s_hw_params,
@@ -418,7 +419,6 @@ static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver ep93xx_i2s_dai = {
 	.symmetric_rate	= 1,
-	.probe		= ep93xx_i2s_dai_probe,
 	.playback	= {
 		.channels_min	= 2,
 		.channels_max	= 2,
-- 
2.25.1

