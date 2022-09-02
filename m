Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368205AA716
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 06:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F471634;
	Fri,  2 Sep 2022 06:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F471634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662094705;
	bh=yLb8llUZdwvg/rvEYil7cActxOWZ96UmqEZ6m8swdMo=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vfNGkv//GWEqSOMkMtrsY3b7GAclkfj+w8xdCdGl3FiJ1J00Sw/jOfdScRJbPOgwx
	 x2VZpg82iZ3UHGE1gQoyuVBysp2Sf+k4yMWeH2hXcCivsJoq7fTZZPn5nTcCy5xhgz
	 Le5k6l7szeyqYNw+JSaHTVh1Zijm7Gj7Mo1yayDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB004F80125;
	Fri,  2 Sep 2022 06:57:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAFB6F80125; Fri,  2 Sep 2022 06:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E29BF80125
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 06:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E29BF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="RI/fNe4t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3wosMud7/OsXTo7EPFc13T2zBs6HJnrpSURQnMlTX5rKJ2BaiknupMosDmqt37Zu/9TOogEktJ5cCZCS95Inr1jtMORt0DFe/XiVRMXwtLHDDhFKU/QwAE4HaA5EvgSEoDRuGnFVUqDd9VJ4e381QvEJspSeTUPfBhjEUYQbVzVkBw4I40+jyVD6Axw8sBkaGDTMHny+ilIJcQRWyM83pBco3SUZfdhkn6zHCfVZUl+fcFjNLPk0UkitCMoHKkRmrz/ZwiixL79RsDU59ATyZ8UBBLlinZWbM1dCVsaAdImlP3tm6RRcBTRtna/zTGRHn7C8E0ZlXrPAqMacgFO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6fnx4YSa9QSZYwy9cjuyR6DLMi0FjDS2FfyjXqV5Ek=;
 b=K8aSmPPeOZsms33oUYDDNNG5EFPHdx+WqDVuB6ayJruaqWpTDjqlWCQo/JaO/cHgxNYRJ/WXqHAbBceshp06m3qN1fR2cTlMJI6hQzephCLOPtgUHTVJ3IbUZL4xXF9haBLEmjboB23d4e135JJrvbdxTyplP5VCeqziRD5yX9xsqGGAeHwP77soJNVi2SVwT/Xl6hNCfc8KQYQ1Y/2I/xPyRsU/OETGWtckUJ24Rv8CZVzLoclF7zmPxSyFytfWP3YaBuWJ/wpG5F7GScb7ufZc5yqH5TZSU8kvEubQepkppiGxK7naZYv8gw8xY376rPBLNlEIVL/C/p8re7QJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6fnx4YSa9QSZYwy9cjuyR6DLMi0FjDS2FfyjXqV5Ek=;
 b=RI/fNe4tQCB3UFSuiGn9IePFcdlHj+tylXHk3Nu5pVn1HzxRjUfRIJli0ePtS1ydeYB8rwP940UNKDCXf1Wxfs8rqd125CQ+4lps5cLhvWS0cOMDO6ctsnltQraFDxJY3//3ISxKcgkHFGQ2mlrcLWRc827FHGL0cX6Je1QCh1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8113.jpnprd01.prod.outlook.com (2603:1096:604:163::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 04:57:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 04:57:08 +0000
Message-ID: <87pmge5q70.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: rsnd: Add check for rsnd_mod_power_on
In-Reply-To: <20220902013030.3691266-1-jiasheng@iscas.ac.cn>
References: <20220902013030.3691266-1-jiasheng@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 2 Sep 2022 04:57:08 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07546e86-05a9-4e2e-4a43-08da8c9f96aa
X-MS-TrafficTypeDiagnostic: OS3PR01MB8113:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WNO1GPmFdcHTZTrtzDZut1wQuYtsroUwl9w/ScdyyEHI0yj1UxC0sDepVDApK8dd1LLjvBR1Txaw+GuwdcNMzqiuF6i6ttOuFXg4tKpEDQdtzznF1/ZRzmI1edOg7nQ4SowA9RoQf4tpM4OyYMvi5jO9b53oELBriD+5Yq4x4nB+GsgUChCdhTJyCfCPb6yDOkpiAriqzWzKIk1TkiVPqJZW5BGQY0/odVxtRMCUOmi643uM4JnARkEJKv/ACfm9ei2JFTluFoPgqTCl82OumeVvFyj+qP1xk4l80Uu5OsJxEq4dbWaTITHNf26FpjwmulEwTzIcQd9BgP7j73C1mquhC7D3Uo/MMJDzHrnlndpbCW+wYyzNKet2UTXTU6i7RJpbf0XLF/D12xdDkeuJkhRC/kuT3NiMRc0BuKE741RwABsMAGEWytXuGlUBzyBUP1b/pm/Q9gIpPYDFnSlSzwUihGJO825vkdhIotTgOY6vJu93TN09dlFevXEu/Ah1+tyyrnLs8MtM5/C1SBI9n4xVqG24ok8KC67CGzoWyth8ZhkNFGrCJoLZ/CzorBX3oiwklwjRZnICvrDeX5rNhkoWI4WGpGSV5IzxGNPUwTyup25e2zwtAeo+ygoFLgtqEILBbrFLkXgmq9BC6/v9F2gfb6C9XNCHq500Rc6KV27ANoC/nRkvgtcRF7YTuQNtQCMxmQ1pcdTAFBQLA9r4oz2e3x8VIuvY/DB/Dda/p7EEWXzdEBIwt8U9hHtb8dQ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(316002)(6506007)(86362001)(2906002)(6916009)(52116002)(4326008)(8676002)(8936002)(66556008)(66476007)(41300700001)(5660300002)(38350700002)(38100700002)(36756003)(6486002)(6512007)(26005)(66946007)(186003)(478600001)(4744005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PokR/MGpdA6cUm2XxAtxTTiUFOW5B9w9/pwKt4bmOlQ9KV1oFUOs30eMrZEL?=
 =?us-ascii?Q?JsrmERmakDYtxC6g9WXApKgYUokPqiIBdRLYiph2BA9dg/pGzF4vM9hSW6et?=
 =?us-ascii?Q?s2vSZumO/XLKMbixyWRTJW9Ny8wSAVvBvXyFBKKtCMCxPIs2kauJ4+L77rAR?=
 =?us-ascii?Q?CwZjo/BTbfRBF0GYhrkLcNUnIs3T+FaxNXJY0A3SHGcbkmau3tpKjfUgWKzK?=
 =?us-ascii?Q?R2LH1XIZXZPGsW57yD+3ep2xIEaKnejELTDFW98LyC4sNAEEAGlsq9rbiS3F?=
 =?us-ascii?Q?s+tckWskxxNAWVsRhVf5akZX8IU70rJUOCHODvulVUogdW8fmEEouutDXdfS?=
 =?us-ascii?Q?th55Tf1uwjBW9FTIgq87YYC9Z/AKvra2YH5T+2RKa5529yCpNbbwZQ8AGXzD?=
 =?us-ascii?Q?g7QPeFbVmStV9qLChdrVnPPwA7CcB2afFCky7gM9TbWbPBgO8V082aor9pTJ?=
 =?us-ascii?Q?Vz9FMlIFgwYzSRpy1PQsJxjq9blTcqdfBqWbF9neY6dqzGg1zliAHuKc+05r?=
 =?us-ascii?Q?5JnCyKYAREMUEYNxHW/ERaa0Wvf425SV2QSAzmWBm4huXrvyir0D+E7fdkQ1?=
 =?us-ascii?Q?tp38tp+40AsERLSGSnXXrQE7LgiQUwPU08ibW1XvuF8eyuO3D36QbIr3QQBP?=
 =?us-ascii?Q?QhPrMA4+CZV2p9tVFI+MMQpesP0y7ZCfYugZxZmDgnrnZADJ6HYB2S189K4I?=
 =?us-ascii?Q?BM3KctUukrKEkezGd1yV+4A3KpaEnpGrvyBv6JENxXaoxRoIcPzo2AApTxZG?=
 =?us-ascii?Q?nvjofiLQvPv7e06xlc2hMuP4AJ6VqqmUKtDbwYusbQk0TQg5MELsZwBVUB0z?=
 =?us-ascii?Q?k5UJWNg8ACioV4lh4oHctx0VsKP5swfOpxJFmY5zNDPmv3PkKKD7wcw8Yq9h?=
 =?us-ascii?Q?sSV9kybCyKBJlwRmSd6Fv/ZAXzwYVMWap06qmOCm/PJKKgJwv/M0pHSXbDP6?=
 =?us-ascii?Q?15c4ugheG6puI20tGpUTUd54FZxcNAURaeLEF7cHag+ln7TiVrFMs3ueDCfe?=
 =?us-ascii?Q?+nf7HnWqgyA0fjtErR8Z2F0/DDCM1JL2s0CJjsmvGNhi6je59LcCfjKvSds+?=
 =?us-ascii?Q?mFQH6W2XakbwWRPzsGM/ZknrFQc7rMNf+1gDtrBtBUhVIDX7QBB8UdP2FloV?=
 =?us-ascii?Q?CesP1b7pFr/ccQ6oaz8+22StRTI/3SwskYPDMz890gTLu4u2EFrjL22rGeKf?=
 =?us-ascii?Q?csP6uAS9LlJxHK2pLZWg0Jgg16TbsCYdE1LHbzo783GWYmv9iMxat0LN8YDD?=
 =?us-ascii?Q?GnZC6efa2+pgcVLu9sO7EwN/zt4yEXnq4E3Qf2ayNmMH9hOhN/mWvttFwWmj?=
 =?us-ascii?Q?p4vKz9/i+hvmnjMrPLH7AcUhNf84geN+Is49x3H9XV6865ea1qzj4KnwV0Gf?=
 =?us-ascii?Q?jBZp/kDLLHZ+SrxnvjJqEjbLCv7Y19w+f1Zvo0HVjwazEAmcqWX9oa9kpBRY?=
 =?us-ascii?Q?Nh9DuXUPgZCd/m2k1A/c+Zt5ROCYFYVh9mpCg51XxoYYe4mVOOFSwStKjObP?=
 =?us-ascii?Q?g3IBl2jItyDYOCAdMwp+YpOcK8GAsC+toJ+xEAalsjyYLORBN+q5r+kuS4OI?=
 =?us-ascii?Q?S1pLUYJQGgjIHzsGTIp4WiD/QSaE1bU07Z9euckFbuIcj/2wmpbTZn9UyL1O?=
 =?us-ascii?Q?j0U5cTmWS/JUt+Yn/R1wNgc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07546e86-05a9-4e2e-4a43-08da8c9f96aa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 04:57:08.4745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qofK4q9sExtVU361UCQ2L1tV3ew8TkwGhWGIbg96k8L1ZPTGJwV+vxpaTNp3nKyzG6XXauLghtZ9iJKGuOcYY2RTj2ZOt2NPMhJxkKHWeldgMJpvLL324p8c7oqdag+R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8113
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org
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


Hi

> As rsnd_mod_power_on() can return negative numbers,
> it should be better to check the return value and
> deal with the exception.
> 
> Fixes: e7d850dd10f4 ("ASoC: rsnd: use mod base common method on SSI-parent")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
