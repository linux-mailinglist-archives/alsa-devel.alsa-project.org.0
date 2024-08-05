Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C85947228
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B414872;
	Mon,  5 Aug 2024 02:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B414872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818355;
	bh=miJE6KXiPvDKsReZa9e2bwFRnbuIWKrVr2OpcbuTOPk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jqRNUAqyrFBrmx9FGv+OYXOAiwtO3l9I5eYVXcumPHNkOIslsOZTFi4TiltRGLHi8
	 qg60YSvKVE4ZHOX8CxK5WS/dmA6E4L8r29Pk+dq0J6IAYnEh7NfLO2uJBNUyGZg37B
	 l+jm/mCp2BtF9pJn1ty5CdIkgcbdzuahEFhP6oRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE04CF805AD; Mon,  5 Aug 2024 02:38:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36548F805AE;
	Mon,  5 Aug 2024 02:38:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1905F802DB; Mon,  5 Aug 2024 02:33:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A479EF800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A479EF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oL41U6pY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHqWol2f854QbrVhM5ugl71bJ03k9QHWmMd2z/ctTJkSZLBi1sW62BRHTdStCRTOsOL5uqc3gY+rpLv9Cze185bvg87Enhbb/bQhGFKbSklaRPeODBXkqQFuCdPngBB3PIMfDMvWIRetC2grrgaddfvqRlkmZLHtGus+kTaQK3fNx/4owTSN5CNzcSzNi1Gl4rZaWXEOTygNBOPQB3GcVLu902oraN0Babh8PZFHlRkkHOxILTVcIynXj7oj7RT+gdE1c8MNvKNnIPlc7ipH/v6khO91rRBFYBcCl401ZFfbqm1qTtogpvedYQfCjvAWd0IYWJuc8FrEzw8W2kS0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NRar3CVHTGKsz6makIqskDFjvA00olfs7YWD9Y7fJI=;
 b=XXkDh7f/ad8j1J+eR923c7D9hQDvdByLGaGqIe6MG08hxbb714jo31nk/Pi+Q8axyNCQAxO2NP1eDmv//b0uL6uNNepkwIkoBRg8xpAgWkB3SDFNnD9OfqQ15GjGSyHb5IehGiE6kzROpd6MxGANEyeu1RicOUGe5W9XzCCn1UAlriflYXrjlj9JULrkhZJYQIor9uZrR53UvkH8nN11GZ7JPN8g8CHRe4mlpdMJXYsZ5t4iAkKXeXCM1xFUvTijFsk9RL0GWEccglyv/EJY6W+g5cHRCwsg466+JApikGuarsXyiOCcLvCO6budvYGOGWhlOoue5bepG6CuYuHxTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NRar3CVHTGKsz6makIqskDFjvA00olfs7YWD9Y7fJI=;
 b=oL41U6pYeNWzk3zJh3zmayh13cGzFA4SiLGbawWXKpv05q00+frLbM5qfu4aoWU4+chCfZB+221UFJtvfKCUEQiiIP/I3fjSNSOVi6wgdbAezqR4eI6+ANfJD8SVK2Rk958JBTjoG+dAZ+CmuGLeQVYZ7pRzajlLMnnhjTAq7uE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:33:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:33:41 +0000
Message-ID: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: [PATCH 000/113] ALSA: add snd_pcm_is_playback/capture() macro
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:33:38 +0000
X-ClientProxiedBy: TYBP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a65bff9-9710-4115-481f-08dcb4e63fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yTWAtWKYahHOC5DRfHWjterJ3IL5dc1MIdrNBtWLvfkgPHxIzwcNy+ZJgseb?=
 =?us-ascii?Q?wGcPWAs9+aLEWcGhhlDDLL85t5L0cR0LTIUFmYaHWudv43El6UfK4MTU5cDA?=
 =?us-ascii?Q?HjvQgzjENFm48MULCv7XmqJb48TbtMEvdwexhddHE793xNj/hqXzx0qvdqPK?=
 =?us-ascii?Q?hnamwFTAUDLeAYyYP3GNDffHFlDN8Jrt45zSBOhiYj6yMP3QzPl1J5mqUXZj?=
 =?us-ascii?Q?DoRgS6MZBhRSYHpGakibRrWIQOOxq0uYf++KIfdHUU8lspzZQ1KTw83tkbpR?=
 =?us-ascii?Q?dy3W5FWWHQ+R81OMJQYkgrnSdNi2bdEuP0neM+zvE2JhozRu1X6ttnWV6XKc?=
 =?us-ascii?Q?6sRYHAH6bYthnjkOPOBL/jO6DTg81k50+K4u5O7LVC6ZnBfLcEcWDMRkc9qB?=
 =?us-ascii?Q?rNRReO5t2wn7TzKX4nuPdBr6HBFvtd6771H3YIpgBZAy1eans+kQPgi1+8vr?=
 =?us-ascii?Q?h+8/7q3d3a6/wXM9+ZdANMa1aywUAbRmNHHyP+nd5DIwkasWlDQgME8Kq95v?=
 =?us-ascii?Q?3PokIU3SuvQr4hAjLULS5aN4mPUDgAvHkB3/X7Iu1VdE904aH3ZIf1qAh1Iq?=
 =?us-ascii?Q?eveJJ7awONoTT1MXiA99qflet8loe1CY8MONjQjojYSEYKGCKUFzNu5b4Uwo?=
 =?us-ascii?Q?ogIzZ59QvaYF8dS9NQ18T6lkF95Wixrc7u1rNpBnA/MyJyAkbPN7QtzYj4bZ?=
 =?us-ascii?Q?J49T55PnBu5Mz3bwFsisqYIHf1SAff4EEIVSobrMX2dxGhAC3VmQHYOkqWr2?=
 =?us-ascii?Q?mVFJ6AEV3EfEzisjTAImwfbAhDCFx76IPXhrCWKozpuVLnfCHIgw5SKNinv6?=
 =?us-ascii?Q?OgnWhOlg48Obm6HXUVpylVtx801czbZCj8sPlQ40lB8MEoYzuCxhCx4qACQF?=
 =?us-ascii?Q?B8S4HCFd/pn4+EBSV8VeFNJDAtkJdemHXDuRYp33vMRyPN5J/YNzJymODQkj?=
 =?us-ascii?Q?FGAXa1YHcqzo68qxElempJlKgRVqBjfjE8ollMjYFv9SKMS4TmOiagmXo8PO?=
 =?us-ascii?Q?zaP7DdquR2vNE0Enxt/+4HgthJ2VOMt7/1frrvvqxDTmnQg7Kbcx4NiQsmx2?=
 =?us-ascii?Q?o2QEp27O3u13SQ0e6/Voh1zmQKrP8By0ad1TPEYKXompVS9F+8jNuTcemjn7?=
 =?us-ascii?Q?GyZ/MMpKj0mt2T4/SHNiVpsoQIqeqGAVpjoCyDtAhm8bz3S/oGo/EXi1dTa2?=
 =?us-ascii?Q?c1CB0Cv5eru2vTBdyLu4Pv/oZz83N5iltw1bjRWUqpHAzmF8b2HGqKEQf8bk?=
 =?us-ascii?Q?mPHNTAn2iyD48V2BLY1p3NLIyV8kFzQ2cE5q83MY1rMjhHW1S+DJLUDzvX66?=
 =?us-ascii?Q?EspBCex601EiX4wf1v6GWaTTprEFYpues/fvQ4ebcjCPtfpOQk24zbtS0fvp?=
 =?us-ascii?Q?wOWBO2JOfpZelFRXPS77SYvWqgGud4v/kEAtewAm308jhq/e7g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BjfNadBTbTTvRl8hUDdkW5Xnx9oLdDlmKLXzHLGMiYkAhyaDPl9hohuQIg6F?=
 =?us-ascii?Q?D/AMnLIJvwNQQ0CoWNCvLBa8OMAbSKoIvroVrnOhz3qvjVLxlKHRlfGNZqUk?=
 =?us-ascii?Q?DK+5tqeIMM9xXKnb4UeXfXe4k4doa6fKHqdA2jM9Zktd501poAESmWG6Sfx0?=
 =?us-ascii?Q?pqXdWgRH3NMlLNVruBGgntq0LykPZD2HP89ZoJYmnLiJ04dJgysRiZ0YxYrZ?=
 =?us-ascii?Q?PVJvTIti++2Fs2NON40YDeJM6kqps7imlaNkMdVxYvwDGle4TJxs7oSSiTqw?=
 =?us-ascii?Q?1eBAC3KufJSP+WmSOdgGJ9Acd996r0U1q7mIS2NbJ1Zy942paN6ZNR88EhsV?=
 =?us-ascii?Q?j47lmTJRB7Qll/44oxICraiUmeugjrVo1H8kETLc4C4L/5HngvcPV7GQsJBb?=
 =?us-ascii?Q?Cb5rqFZZAWH/FmG4ewNEeoO2kYh6xMYkCaLTq2OeecwRxkOeInagwqt4W6Er?=
 =?us-ascii?Q?ZfMisMIvZ/ZYwojK3CwF5HT8OfQ9rgpGy58iBws/ofXY1O78zgq8KiKK63Nn?=
 =?us-ascii?Q?XmyAJEg8WaEgXYDu8OVMJGXwF00N61BU4XpSCGkT/brtAwKqThiQjqzskJ9D?=
 =?us-ascii?Q?sVeI0d5fsqhAYWOWc9ncmiPxHr8RbmibH0BR7oDiuexlgaO07odE1XRt2gZT?=
 =?us-ascii?Q?rpfgDGpDWSxzOlMbvq9Cxjr38RBlu6FIR7JBmlD/lizhPLK/3dXAWNN7+geM?=
 =?us-ascii?Q?vge6BrVwaH0dPXFIk5UMo9jJXI5L/IajDazjiBvMCM8U+Q4ZJJydMG5q0Qj1?=
 =?us-ascii?Q?mL45cbPE6Pkk9jDSb0zFwU2ehRAjyFgzMXn8yNE3A/uUqjU2BxObvvFAvyIR?=
 =?us-ascii?Q?bxpM2g4caPG0/e6To9EH52J7u9pbuhDILXa7Gx4nXJFFOtTupOuJh7oi73si?=
 =?us-ascii?Q?zRodpW2vdh4BLNL+3Bxn4CuHuL6tyF7pidBMjYjj3oyfhw2jQl58tfHEb3Z5?=
 =?us-ascii?Q?t6BylJk6QoenZa+8ImNowE4uiu8lkb38aXPfiOxYLljvelzqDIpPrvCOdMTF?=
 =?us-ascii?Q?vT39I/yc0rONxIHLukn5J8qJFtZD3tos4Wkc+tlDpiVkrqxMxa8CLTxsh0ve?=
 =?us-ascii?Q?8vyvsx7frj6v3DeEoZWZbXsJL4cEXt+nhRPX2Tq4kXtr+thykoM4hKOQG92y?=
 =?us-ascii?Q?Vvbq1g5iI5gTiXk3SetW8fYj+sP2xVwABUHFmWAvyVVHyPSXJHj2TeCXXGH+?=
 =?us-ascii?Q?AnJd4sEOeOcmCEeHqmg4Mllk7gCObRoJPJ8DRnh+8zv6aVRWtHB+lcyimtpM?=
 =?us-ascii?Q?mgIOhlwr+qPt3dPq8mMfM1kedB+XQUaveihhe8qZspYjRndfILmCnX5OAxH4?=
 =?us-ascii?Q?LKDfEgy61dwqdwmuI+iA/o7t2XnmkkR7SI3khjRM18NFDhcJC+ZRiC0ljAJj?=
 =?us-ascii?Q?LAWmCZHOyP44FresvLiGBdw7CGtKUddo01eLI0hFKUZ0DJsEMmamoWJhcIBy?=
 =?us-ascii?Q?ZPm/6gtg+uKDE7sMm7UHovxgEDrX7My8JVfhp0ohVTHNelM8+l9hg85gTJfu?=
 =?us-ascii?Q?m4u/qCCd9ormhVbSKati/buqFJQpALcAuXhbyBRoWoxB3WafGCvS81GOWsIR?=
 =?us-ascii?Q?qNy+7N/RtSI4gSZnKstlCEVYhYadEeK7hlfzLHvBMMMUMqptksdS7RbGKza7?=
 =?us-ascii?Q?b8vg6sSfx0xbxB/djJ8W/bM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8a65bff9-9710-4115-481f-08dcb4e63fb5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:33:40.7292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yJuAUCPVXmUlQVG2k+UcgoHGSxzbdF0YuNmVuyEnXb0g81sFj0Mj9pKmKlWRW64HmXydYDdRdwvJdatXKDcvjH67zZakEN5DBPNPffCcvz+BUu59zsQgmXcy4jeJzWuq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994
Message-ID-Hash: GWAQQULOL4LWXS6DV463HB3SAA6MTGY7
X-Message-ID-Hash: GWAQQULOL4LWXS6DV463HB3SAA6MTGY7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWAQQULOL4LWXS6DV463HB3SAA6MTGY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi ALSA-ML
Cc Staging-ML, USB-ML

Many drivers are using below code to know the Sound direction.

	if (direction == SNDRV_PCM_STREAM_PLAYBACK)

This patch-set add snd_pcm_is_playback/capture() macro to handle it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
