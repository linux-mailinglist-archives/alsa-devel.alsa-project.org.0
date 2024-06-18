Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8E90E038
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 01:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899EDE0D;
	Wed, 19 Jun 2024 01:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899EDE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718754787;
	bh=B0B2Kg1KtuY14AWuc+dTr6OgjzDDLHvqySHtO5B9iV0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ven0YEqVZMuEJtr4Q3eeVlHBUzMqCLe3smfZ+yVfc2y8XulTTS9CkYhcFnbx6dtdP
	 hrL1aKF8b+A53HDfAq5gyOqic5IpbUV5sqqIVGYvAkeCyhyoEhwe38sYHag0YxEoMe
	 +I2YGYVrxn+QEzjHS2QbQpfRjJdN/NsI27Bv6CbI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED4DCF8059F; Wed, 19 Jun 2024 01:52:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4961DF805B0;
	Wed, 19 Jun 2024 01:52:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80BADF8023A; Wed, 19 Jun 2024 01:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93A9CF800ED
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 01:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93A9CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CFpPq+Mt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVijkhPfxe8ikJbFkdG51Qbxjlcglo1yFl60S4hSgP2H7YL/DiareyzuWQEctr5m1WO4UmbGlUSwQN987vy88vsIvpFMcZBnjiR7Ed8KqfLhWvXbIq+t74Cqpv4995bMF48QkIm1h1comiNqFQGICxFeqfNPW7v4d6LWjd5Lq3vFBvGbcSYr3BCkK6sKXsGv5hAHLyGuXfW81LIuQh1mpKUgNzEWib1jrFRC59L5fr2TTEINfmia8O2TO+arXYHf1f6ENBgArZJUKgBGCjuI8j/++aCfILnvFP/Zg+4a2LoTb2pW1sszs6FvAb6uQ6ZzbU1ECY892JmFlNVCSDaNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiMgvPAGiUoKqfn6XkE089lp/OYPq1OpWXdhkNw0AMc=;
 b=U4cHljwPR89qLvac0reZWngXUnF+CFkmhVD0GhPMZ6avgfJFXPum7p/Is7e6Vh0Lz34B7DxmCojMF2mVkQm5H3ZtJkrCgOdMTVQLCX/ZPlK7q0vplmJstpksBir8nqPs7CCuEBQ8mVugxtODNmRZvKYjBWU75odI4mlHo+6kTIhC3xg+di2NdWM15FkXMAD7fXY0Muqd4ThORBA1cPb2UdWESeR6yvV3VOl7JvJoJiVITv7jvFkJRTJwmz5BEb05bjTgyRJp492EI5Ycy9tJbqWlcrT7Jya7AfBr9v6TzEhCTY+2ZP9AT0XYeBsa7Q6DXxXjEUoAd2+aW+tr24G27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiMgvPAGiUoKqfn6XkE089lp/OYPq1OpWXdhkNw0AMc=;
 b=CFpPq+MtNr9ZCd+NGV9GlRH+Q39PPwA0nJop0ya2c2EVxO0LRjQ+WcRapqIo+j8uwMDQScIrAL/ECBKKsb2VDLkvIB5aLhe9XquvusZDDL6tVbE/7tyCnSp2boXhB7tSH5aI9XtBkTlcTyy4U7Iv6RyOjCX/4hxTQMcNiUrKIdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8620.jpnprd01.prod.outlook.com
 (2603:1096:604:19a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 23:50:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 23:50:22 +0000
Message-ID: <87tthpx135.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] ASoC: dt-bindings: rename akXXXX to
 asahi-kasei,akXXXX
In-Reply-To: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
References: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Jun 2024 23:50:22 +0000
X-ClientProxiedBy: TYWPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8620:EE_
X-MS-Office365-Filtering-Correlation-Id: 3727d589-fafd-4faa-2f81-08dc8ff16b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|1800799021|52116011|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?06Ms0y5AwzKHM+YA4ueIewID+FGj4wJaUxJ+wwDq4S1ypKvi7BX/V5SJr75q?=
 =?us-ascii?Q?SvDyq4T5iJA1XMHoaFgp3T+AtMNiz9HYD4UeHCT48PhmolB5Fyv+TcjSG8Zt?=
 =?us-ascii?Q?iWA6DdhvCali5rYY3iCpgDLy0Jm4Iz9BVScfFLHkNu0m4sQH6Dv0wJrtPNwL?=
 =?us-ascii?Q?j2caFJVNG3XNLMPbXXafYGltH+tW/v2H+NeSHIxleXgejcqeuFTYR2JGMjVi?=
 =?us-ascii?Q?Sumw/M/ZU0wQwyWYIi776Bh9/75Qs+Tfvc3VbzyYzFNe8U8ZSNJCtl3SYlu9?=
 =?us-ascii?Q?O55YvDp8ckiiecwEz/hzwnVJ5+jXZcpoga4+OJH0pfy2N+dWXuuIPzfappRI?=
 =?us-ascii?Q?U7NAcH8K7fiGLCK1N7fCmO7KHDfH2/Z4YdYd+UsXAKdo/TtEk9ywymk1qlYl?=
 =?us-ascii?Q?cm7ZgcqDwEE3pITbEnjLyHBwm3aNR2i369/Hi2l5HKZfSjQEHbEvbw2oqnNW?=
 =?us-ascii?Q?M/hq60/VrmB4jL+G7BKvDIlLnncV1r/RxkfVCrZalN+IqQoqdGdT3S3MwdRT?=
 =?us-ascii?Q?EB165GFkCywrIo4h3AlSZxx2ML61nZBfchyy+TQF5EhzL5BYV6G2MOgEi6x1?=
 =?us-ascii?Q?oMa1f+sAOrGR0iwpMU3SGUOYMi9pfa7+DvqrQRBhNrPiQ1BJNb6NiVqc7aaA?=
 =?us-ascii?Q?IzroASA4ylhZ3Lq3EWsFmKz4KzkM92QqwMtppaxbIo5SxhR3ztGjyTvDshQe?=
 =?us-ascii?Q?Iq5ZnYqIXp4Y+Cp9ksaE51QosKM1uUPyyKZAV1vFcYSH4NugaUznCXn+WuLg?=
 =?us-ascii?Q?IbXo2+PIX2JzDnbShIrGdyl/xsGf5WHOYI882hpxPbJkFY9DgB6PSq4gIQkF?=
 =?us-ascii?Q?UTV8pYwhgeDeoGQ8c15y4o0DJQInwdcc2KLkgUOp4UTO1ZzDTXuJXMcqmEkd?=
 =?us-ascii?Q?SQPA5ASh1HeD6kGuviuxBlQuTaxWVZicX2YJoVwpTQjrHPnhuFF3SqjOcxRz?=
 =?us-ascii?Q?OiCSJnnF1eVTxCkC46Dq5bxjZoTt1a6YracXyI3UM51UOWtI3X2+MWJWMEP6?=
 =?us-ascii?Q?7rvn4DU2gRJBEXP6988bIVJ03FK/z2FCJomQOzMBwP0wZqry+dL2sRy9CTw5?=
 =?us-ascii?Q?IV274y0ONMkzKRCjzAjN0aMRBoBQN+qh1/QVTCb2Qq6BEjg+ZjS3kN3Jw2kI?=
 =?us-ascii?Q?qMm7qnkSjG+ejwsqk38WOoYK6lLk9j7qjU22d3vZEomdU0bG0gnrNMqH5ea5?=
 =?us-ascii?Q?Fk7IzMo0NCOI/itXPz8WPPqu/22RHqAZA3oR95CGz71Y7W5rDRwhIKSkthEU?=
 =?us-ascii?Q?uu95unOy853sSsVq6oDCkrZIMIX2hn2klpUZ4QfB4dFEB/QSO+XZpy3rdh3W?=
 =?us-ascii?Q?0K9MzuC1sm6iXmbOQjx4dnTTiWdgdhUwRJeLgWaU5HzEqJ7Un3Ta4/n8kzra?=
 =?us-ascii?Q?2gMkon0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(52116011)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T/81ITGpSWqtY5tA+LqHVisseeHuzKtAlcp+N/4XIrKL/OEgsTk4bAsJ/qUG?=
 =?us-ascii?Q?vCcQfQpLfc4AHfU0j1A4FmCZ9yS/0MKzZJaLKOYnRc6I49Wm//F7ShX5uivr?=
 =?us-ascii?Q?T0EPM76SfDSlJwzEmMnJg3zg1cpocIfqEesuK9BGOKNTUY31oz4fhq3r4K/V?=
 =?us-ascii?Q?3dZm8BQ5cdLiA5pWswgT17hz2hSm+iHMAG476Su8jCi6T3uDA3KHSGff8vu/?=
 =?us-ascii?Q?mBIKaI+pUL9uQIEDDztlLnA4ja91Bq44ThFsIMzTkIcnZ7qCdagozC8y+h5J?=
 =?us-ascii?Q?C/KTKz+pPqUP5oBX11ooMUPNkvzpXrn8agtOhsoOfMLCVXdOiGjJvFfX2zjj?=
 =?us-ascii?Q?lQKi6kFkMmRf4Dzu4Sp1ahF13IpdYcW1PQvw97TPfJMed+ZtDkSK5x+PXsnJ?=
 =?us-ascii?Q?TdnpKGI8joTNoGQ4TD/Xd/gxz/pMxypsS3ktaohbDfAwqJtXrsP6Jljrq4+C?=
 =?us-ascii?Q?yxvUS1jY6qb2jjO94kxwbhhp2JIxYEYGIkxhgKqyj1vTMUcMrZYgrmy0CI8h?=
 =?us-ascii?Q?JbI07f4Etr2jXgi8rXUvAA3KOGdLeyO11fCR7RC6g5kRuGApyQTeTbYqSmML?=
 =?us-ascii?Q?0Bf7ruBgS/BYQvV4xyq7/l/KeLD4J+q6DYYMxFC06pdVeSU8uwkHNELOHXoT?=
 =?us-ascii?Q?U8eAyN6yC719Vkl1sX5T6L/dz4FHmiD1x1CiXNgeiZA2NBRsQ+Wz+Y22WmeS?=
 =?us-ascii?Q?qYq/8mb07mGZaICfowlOglcf0YLNN0RoFdLvGw+aP/Vms4FVCz0PTRtg/dIh?=
 =?us-ascii?Q?wb9E1eQiVYF7BiMoDQrEob9hr1Ck1HI4UC0Yho8WI1YgQSmu3jx6/wLwc9vP?=
 =?us-ascii?Q?UAgo/BrERfETIfdZ6PZJAK8jWolw4dACQVnXTmo+CVijicMQkB4eQnFV9RYd?=
 =?us-ascii?Q?1YdsuZKOtnMujykjquFThbe/ePNmdGujJz5eJVpTBvXz960krnBQpfvoNibi?=
 =?us-ascii?Q?MWf5L7STqGK7NuTpdDXrNLaanIIwbGeEJTDJSbkKll3mpdRUGsQuOBNANlYE?=
 =?us-ascii?Q?vrAnGNWDks7QpJgTPcNl1UvgEwsWan1mXMWEHEqdJs2vyvzpgdjw3D5z5yjF?=
 =?us-ascii?Q?37MNpDEKKZvaeMVkel43oLR6iCuw3BIcG8ypZ3OpX1ORqU1Tx/xFu1nPPabx?=
 =?us-ascii?Q?fCC50XMsYsbRCg2/iJOr/e1ShmbkY6++MibFl/2aR5fAbdiRkIe2QQMXp8Zk?=
 =?us-ascii?Q?Bg7XbKHfJ/j53OfTZxcZ0zBHiR46NYT5L0UjMCg1ljS0bK63KXUaeY5vTBex?=
 =?us-ascii?Q?QNvUNOINUYBCtrk8SndAnWt5I/fN0Af1rK5XKP7tgaucKmf1SS785rb9vuf1?=
 =?us-ascii?Q?FLSi0AlyeF1vmSeHwq5d8w281YJ+4/umDtVgrGp7C1tZZ2baQGZppfCV2/u1?=
 =?us-ascii?Q?Aymf+V1QmRaXNiX+WbM7Si6RZDSyG/aAG9zs41YtjBXZKWt0/bMUU42zRW2J?=
 =?us-ascii?Q?WihdSpt30+hKVrgIZrT6tRQMnck7L2XIhA6i9dslarLhSgAXYX1OwZGlSqgF?=
 =?us-ascii?Q?C6dmtBI1GVyYy83zDz8u/682+U2F4LCdevDqI+ep+l5NghwQWFTAqPOecqSQ?=
 =?us-ascii?Q?4ez2rNsH23g89gD+sGnxn0Vds36MmImklOpmXraWZKP3VbZRTaLurPdtdWjj?=
 =?us-ascii?Q?5P4dJpx1oW+5Q6RF4LCQLa4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3727d589-fafd-4faa-2f81-08dc8ff16b01
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 23:50:22.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HjqX8zkIxb+vuod8PzS4/tntSc2/bVcVms7MYHdburVx+okpSSpecQ0f+1P1ts6YwmiyT8oJm2u4u2tcMfhYnJViZEu/IQokS9Pc/OIogADOxWT+OPgNtjew59XtB+/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8620
Message-ID-Hash: WQVTPW3KGECD5MKW36GSNPSL5TATQMBW
X-Message-ID-Hash: WQVTPW3KGECD5MKW36GSNPSL5TATQMBW
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQVTPW3KGECD5MKW36GSNPSL5TATQMBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> Kuninori Morimoto (5):
>   ASoC: dt-bindings: rename ak4118.txt to asahi-kasei,ak4118.txt
>   ASoC: dt-bindings: rename ak5386.txt to asahi-kasei,ak5386.txt
>   ASoC: dt-bindings: rename ak4375.yaml to asahi-kasei,ak4375.yaml
>   ASoC: dt-bindings: rename ak4613.yaml to asahi-kasei,ak4613.yaml
>   ASoC: dt-bindings: rename ak4642.yaml to asahi-kasei,ak4642.yaml

As Krzysztof mentioned, [1/5][2/5] can be ignored, but should I send
v2 patch for it ?

And as Krzysztof mentioned, indeed there are some yamls which doesn't have
vendor prefix. I can do some things for them, but I think it can be other
patch-set, but is it OK ?


Thank you for your help !!
Best regards
---
Kuninori Morimoto
