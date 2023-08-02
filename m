Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F3976C1D3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C7EDF0;
	Wed,  2 Aug 2023 03:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C7EDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938145;
	bh=nYOwFuWiJCbcgRQuZbjLy2Vwkck7OT2fIfXTzId2KFE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C0gmi3ULZUBlViGpTV1OuxlPo30ZgdiTQvColhN018jK466XEBqmPstGpj5GiEgrO
	 0SRsvKqtsqTWcteUE5V/xpyBUS8/2a4/rQaaypPMcPru3j5S4RR+LIJutioSFyq49v
	 T175s8g4GfXMSm5144hHqSHE/iip9PyN+odeGVVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB89BF8065B; Wed,  2 Aug 2023 02:57:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C15F805C3;
	Wed,  2 Aug 2023 02:57:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9864F805EC; Wed,  2 Aug 2023 02:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5708FF805ED
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5708FF805ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mak2Mmv6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWfWdx0ARSZ1O1HZ5EhvBQ5nll8/tYSTiRxgQHrXX8+TGsGN7mUjoX94bz9I36TWr2RVhcWQMLk1niBabyTj/QIH1PcQ3AJLIT81KNjfGB1t257TSzt8j52uKHgMkW0w/qUdGBpoSm2/Mzk3as/qUtU7B20Naj+iY0uKzGrBYDhQ5C4sxipdsFHrvBaDqwPFxsVV9LvMnCIklO9GhVFOTfWtXmXVeW7E+nRD0jVQ3iyVTHiJvGFlprhZYtScPzc2RyQ2qlPtPeCLZQwnII55H9US2HdJ0oJDAxrS0i0BCIkpIqRiarxRJm+4k6mTh87t7foHf7e2jwOgGQ6X18MXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFzH5ifI5oKBdZx3fXCsCJkFtncuNUByOtrVnkvBNYI=;
 b=ezcvUTW2z7BSP6D0JDKwvHWZGrVYZ+khk2avPRvc6WQiYAOcWufn4r8Prxd2ZARXJ8UW/jD2DKo0Xsimymi08iKfI1NofdnxPxHazGDXel9Ryw7X1n4rzje01zLeWETNleyCM0hP76vV567CwQocmgeEeOL8xHKCs7ZVt1E8dYZlZox7eCz9DdKl6udrHli9+FAeMSoxN+Cm+ub3B9uIoxHYDnnStUBCWAZJQw7GnAd4NUbazEfhsV6HMUb27cIdj/xLk7B4KVVqTHi82lXbJlEhj0aghTKZV6x6MqEK8ciQWwP+jfDjR3QbHK8PXEjRWsRIp6XbmI40rCPC4mcZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFzH5ifI5oKBdZx3fXCsCJkFtncuNUByOtrVnkvBNYI=;
 b=mak2Mmv6sR8f08sJGCtmluQ8kIUCQK7ejgnn/Z8qIsx+Nu4EhvFb/g16/PuwimRVPukv6a3V48JAQvKeQ8ELvWgbwttNjQZAqLiaeb0/5bU9V3YdVv3xK9Zmer3NwdwVbmKVEBxvRt6txQlTlGAhtGOGqILz1oDLlliBi9bcDsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:57:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:57:42 +0000
Message-ID: <87zg3as1kp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 32/38] ASoC: hisilicon: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:57:42 +0000
X-ClientProxiedBy: TYCP286CA0223.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf443fa-6bbc-4c7e-db87-08db92f37a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sdq6beI5goRNZw10iCf3ECxSwLyP0RtPbC3IEBnvjTD8Ek6/geswZWOyceNVt6yrPGZxeoaWZBTTfm8tSl0TyXtHc4Et1+n3p4BkE5uEWJscU0ZpMgSBjSBrHtvKb/8a5UiIF2R/6s9a7SdTPXgv2eSS1gKTx0RRB1R+uDiTALCeVNCOPU3Xo9kQtgU6rNSJJklqkyUb6hzZg01g/lZIKZYPF4c4HAawBw+sQqGPZlRQaTg8y3hvVYTr8bii0FQ2v6Pgg5sLGsBLc9RtZXZ3M5rqFvCG2AsVdFNBbt2U8Vv6pogISi3PI97mMmRoxOP2K+3Rebe+vLkdNGHmSdETCkBoJfnPXUI+rjjbadBYctSpdyXLj/BWApePHk9MbaQAl2EXNLDNItpuNhaoNEv2/yAwmUzGAqYKUZEr1+yU0uWS9tREqjb5KL7tbZ6kPOM8Hf27MTd4ADt+p0B2vemoSnNP18i2cKa9M2aDVrNfsbCRQsz7GJqHJkrGKcmwBgu2rk5LvSEIiCn0nUIuj9o8dNsNksHHVSrsEiQJMDlFn6Ckfzf7FbLzONEJYcN0cUomlZyQdj7yISwqpOHihGQ5cGWml/QEHDy1lFhga6242OSb1XkjZuucPkhzLycS0gRM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52116002)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(110136005)(478600001)(83380400001)(36756003)(38100700002)(4744005)(2906002)(5660300002)(86362001)(8676002)(8936002)(66556008)(41300700001)(66476007)(66946007)(316002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W+Yjr3bfT+3/oSylbP13EHGTM8zvriXWfE+fm8J8FNiCfGw54Ykk4iWKlmxa?=
 =?us-ascii?Q?LSyZIEeaoiszUzxvCAGOI8yaQ9zVHdXpJTZLB50BLOknGQo4s5D5DV/8niV3?=
 =?us-ascii?Q?CLCt7u8p0k69C1BeOticPLYGUg/XlTmCSUvlZ5aWBM+apyPOhcZ0/SSKYpnq?=
 =?us-ascii?Q?sw919qqAUM415EWpHvZ8LHCffZCw+ZoIlNTCI0HbpGkwZ30u6cs4pS4/9cGy?=
 =?us-ascii?Q?x1FCJ4hihyPBm/jCGAxUl07awOJecOGqtKW7CR9J4NGA89vzgtFaYGQUtErx?=
 =?us-ascii?Q?9JEDiUcGp8TlPsbpj874NrE8570dDuQxf0if2WDYeK34zAaNhgwmgx1pYJPt?=
 =?us-ascii?Q?1KgC4C6QzLRS4H0Xnuvf3jJBguxIuni83AR3rrYbtOrq73lnyszTSHDS59Vu?=
 =?us-ascii?Q?olk1lefaggWDGw2wVxXHi7JlbJuuAm9Yze2q96kAoN8Gf2TMfP3d5BUcJYMJ?=
 =?us-ascii?Q?7b4RNG43woDLUh3T9aiybwzPKJCZlEDzid9I+SftxsYO84gU5DI8CdXrLcVY?=
 =?us-ascii?Q?zVQKtNJVjalyS6C9acdf2MBG94O+oITg8mREuMAVcNk7y33ySHbbHeUozc4K?=
 =?us-ascii?Q?VoUfdYz/xSrQfO0OIVKdc3OWjMPXGkQhP3x8a14+gNi+E9eXxKnCvrGMMip2?=
 =?us-ascii?Q?PbQSSti5wpWgKeLcttumJ3gnWB85ehZk7GW914rLAx5BwXqeUNSr5fpCvCf/?=
 =?us-ascii?Q?BTiYsi/SBOUBp2lq+tMmafLKrgC9KGCql2w7v8nrkD9SCd1avXe5MWyJiTzm?=
 =?us-ascii?Q?QK9TAWWZwus4mCSqxBC+l++Cct3t+5UXEiimc5M/IwDQOHBwt4Xkn/zDzdrL?=
 =?us-ascii?Q?rwF/okzkSh9/SQFaOwsP7FXIUQCCQ1LhB3fxpEoDGWINp65MwZgYqQTWmzbY?=
 =?us-ascii?Q?c56Anq5l1nT7Dk8YobCzZeCFfDUD7L0VWx3UC4vjABVGEfdhu3UD3gNqToDQ?=
 =?us-ascii?Q?E+bEsS7f9SjFoWGi8Rkl9c8LjINEExKbWP6tezlV0KXfapT0C+jQnQUonUhT?=
 =?us-ascii?Q?8PEFqGtRQz6RigQkPLGu+siuVlUcAIPXS7KATIoazd2/9QD/Ztnuf9NWbtmj?=
 =?us-ascii?Q?sokO+xNxyzAMZRkokRql9Xi2rl/tAYAHgRIZU9TXaHyYevquKKXIvCwB22rZ?=
 =?us-ascii?Q?ub1Vnl922dgZoc+yr7EsOMEJERnocbnv0p9ssH5OWtFkU/3W3JweP3Jugspg?=
 =?us-ascii?Q?C7mM3YJzNZ/aElxMx5eFjesrJUuQ7fy725fQouxK+e4qulkdZ0o1ENR1quQZ?=
 =?us-ascii?Q?5HUZxKyTCgmWLo83MEnJqAvGOUT32FPTh/q66RloK6k8/5MOKe3aqFTNivN8?=
 =?us-ascii?Q?wn2Rp/etFpaA7WQ4JI7KjzOoziSYFfHaeDDgoEzvlb/O8uaa3oKZapnBA0nU?=
 =?us-ascii?Q?yrA1OS0F3ke2at/rhwqxMDqknvETVfYZZtsWY0y5jMEy97Y4pBI7IGNgY8jG?=
 =?us-ascii?Q?1g9BqDQ4PBNzNoBVXSAxnvQDhen+3pvkp1rgtxlB99gAQ9qhXMpwMrdEKmoW?=
 =?us-ascii?Q?4PvAt5Ffrhra3/It9phRsZeJ2MIM9uzIjHzyC8Xd01NvRT8AC1dFhGHJSUQr?=
 =?us-ascii?Q?k3MmvEeqmX9mZCPCxf8f9dTn2jv5Bbd4B/hMNQaPkoWV0ek0lr4kYtm4lBYk?=
 =?us-ascii?Q?plKNwrcoXrYkh1/6EZGcbbE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bbf443fa-6bbc-4c7e-db87-08db92f37a24
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:57:42.7917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YEfbM3KrDUHYk5HBOFgRBnFZjNcSIUoCUUDI6X1GiwsEJycNjoM+ePflw/lXVK2eloymIWLFKP7XZYdOzQukAlMOmOaX1AGN5siAmHts5hjHzrDI8y7ZUAG3OU6hdkRK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
Message-ID-Hash: PTV47EWKGOB35W6FDJOUWAKENT7G5OB7
X-Message-ID-Hash: PTV47EWKGOB35W6FDJOUWAKENT7G5OB7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PTV47EWKGOB35W6FDJOUWAKENT7G5OB7/>
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
 sound/soc/hisilicon/hi6210-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 27219a9e7d0d..dd7d2a077248 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -511,6 +511,7 @@ static int hi6210_i2s_dai_probe(struct snd_soc_dai *dai)
 
 
 static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
+	.probe		= hi6210_i2s_dai_probe,
 	.trigger	= hi6210_i2s_trigger,
 	.hw_params	= hi6210_i2s_hw_params,
 	.set_fmt	= hi6210_i2s_set_fmt,
@@ -519,7 +520,6 @@ static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 };
 
 static const struct snd_soc_dai_driver hi6210_i2s_dai_init = {
-	.probe		= hi6210_i2s_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.25.1

