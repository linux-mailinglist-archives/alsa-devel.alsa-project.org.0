Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5F99DAFF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 02:58:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D59F393A;
	Tue, 15 Oct 2024 02:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D59F393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728953912;
	bh=0JuyPGS4VbwTkOk2Dwr01bxEenHqvdBp0UVbg2PblNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yc1czMpzafWka/4AWpukifEQJBGPYU0g8i2Hn5iGOvHM1YpjCF9S/zKW1b5IHPqcn
	 hJ9YzF/1WL8dr2ZTg5tIlESBjkJNWbBriQ56XbtBpbl1i1GuNUlpJAAEWyi9dcsZPA
	 DtUCMtH84XQUijUgYrQYti1e5pFkK4yUYjFUAego=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25CF0F80659; Tue, 15 Oct 2024 02:56:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0D8CF8065A;
	Tue, 15 Oct 2024 02:56:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8954CF805F4; Tue, 15 Oct 2024 02:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDD50F805EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD50F805EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NB0brcA7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkuS5Nsnw2RyDg2k8NUU2vJoB4zs/QSHCFdZDQvzDbXRkjdRXh/IIEu49c1Q3OqsYoKxTbwGLVaVJGvTbYaUsh70zYp6zcSX/3GUY0HuH/ZEV74VsBCnJ23lqYF7oNSd3fm/FkxopocyjnfYf+4dnUGpOuL4O+SCZXyQafatqQldK8/P9OVEJS7MiH9aMvmNBfmtwBQX1QwyFPQomXJpKd3lxejPg/4suROEljjAjDy2SazZrjGpZkuz+Xamq0HjzVmfxUeNC04Q2q6FEyNTjJ10qYxQ76bBbV5YF+gvaGJr/LXHqF/7Kcy5s5gXVDqm7elruVZ30H8UjzXN4Grr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyf5TLq8Py/lTSeeOBhHx/br0P8Zo0IJRcqO4iKs/Qc=;
 b=w/pPmidudlHDaoU6/3WDg6HnpXSh25AXuw/rXOCrZihbQj44rkPvSPvo0Uz3QdvvvedxQM0KuoRCtbLTNwjGdr/Lw0s8a6lprtDsuCDuTah6IOep/kqvVtD7RMuT9DtSf+VuK6mlAew7gvoeKvUhJj6xt6LRlOuKXb0ULh5h9IxsepJ9mpokwi854tNs6IjaFD4HJihtQijhOOjnJGLVDGQgelpajDK3twq495N3ODXkkRKqp91z3k2YyO2WrtqQtci8TuDFnHnh2qfLnmU8bsbhxedaSOX80o6qkIGVDqxSIf8GIkVLrnm4zu24DpkY577z/Nt0nyaI/MVg4wZmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyf5TLq8Py/lTSeeOBhHx/br0P8Zo0IJRcqO4iKs/Qc=;
 b=NB0brcA7xDVy6Yu17UeazsmV7WdueXM1uCS3JQceWCWKUBet29rV8qxijbHkdoelwG9TfWd89bAUiMgeZSZlU26z9BwgFLCai8wLNpdWAtUVXpzOraCk86MITE1YqGo41aq9yjtmEbTxaTzjUiblhvvB20AoKbhkgcceGDlDMuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6130.jpnprd01.prod.outlook.com
 (2603:1096:604:cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:14 +0000
Message-ID: <87iktuqj4i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 04/13] ASoC: intel: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:13 +0000
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f82092-6c09-44b7-5b06-08dcecb42b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JOMo0UTbtKP4Vi+nRXoTh0rCu17ytLmoaa4SLtJt5UpSteFnB4nT4yzfhmKP?=
 =?us-ascii?Q?udbQwMKWnq8nUI9GRxqQK+obc4U9YLrVWvwGeN44mA74tUASypl/OtcgaqjF?=
 =?us-ascii?Q?tBmUP9R2Onic/d/RpXx64MouOcaKFYY4yr1bgc7lTtmd6fciwbfS8BatCBut?=
 =?us-ascii?Q?ivQhlBckKC5DdIyVehQo1aRdJ2Q2MRVTx2O3XAxqyM3K7ZHZiIMifhG9E7ju?=
 =?us-ascii?Q?HfuP+qHNcAuDQPfcNDkfeLiSSVd/j8SWOmtYPyMi4hxSe7HAJi1VzIjmYEVD?=
 =?us-ascii?Q?SWg0ZVx9N/zqfTYiKYZy+Q5kGXkI9ArBCcjpRr2qEQRPVUWzDinoAZBbv5fo?=
 =?us-ascii?Q?chc+eJhzmhAkHsYsC4Y42OWsXgIPr5vJpqR5jXIarA1mm5j1rjM369sNF4yS?=
 =?us-ascii?Q?GAIfcVAPC6jP+nab6JN66dTkiHrysQ7yc9LF3TRIC20GvXfUmp9/m3jPi8xY?=
 =?us-ascii?Q?F9I91+FiSXrSDHPs3mVYF7uD5hpxddiRyiys6li0ehHGe86yjGE+cPKS7aRa?=
 =?us-ascii?Q?WKwQPP7yxwkft5O7F8QB34QApa68k9ntNAmfMZ6UsSEIhQLk5eatpCFTxgEA?=
 =?us-ascii?Q?eEyR3Lexj1Dhv8UR+Hz4yFjr3vIpiXXRM/XaW81FIVV8VKUWnz6boQ/7N6LK?=
 =?us-ascii?Q?c+6AQOvGYp49DxxipgnL0V6cA85hvGXa/pyGmf0VrVa4YHVFz7Ri61qOW9G7?=
 =?us-ascii?Q?GpsVxc+l9evb1Sx1zsWfOvBozu1FhKkpwYAybqvNnC2SHyFINxm5PyT0DNPJ?=
 =?us-ascii?Q?V/7rTo30y7dyTwtIv/ZYJr3ybVsZkKEptf9sMQ8ey5aFMMlTVQcCkrwQOXa/?=
 =?us-ascii?Q?9xFIo/z25U8jyv5yjY0MzZunbPpiXI4VYnU1BnLpeG6QO0CCcbfQIAPeiHGY?=
 =?us-ascii?Q?7OkuOf8S58kfzH+RqA7aixHP6o9mI8k0T4hEQTV6lueOnmIuBe23vMxsJUr1?=
 =?us-ascii?Q?BlBXZsvwNQzPq1bWF8ycoBVuCuccwhKnggxciYe4fYewIFjeC8GysOMF3b5e?=
 =?us-ascii?Q?MykjBfFCbNL3QFAZshCUM0lOrFK8RULSdRxdPf9l0sB975+GMPa+p65Fvc2E?=
 =?us-ascii?Q?RoNDk9F9p9VF7rMw8YMQxO02Ura6JhcEnqW5uTdAh0t2xbjwrwDlEYYXN3nE?=
 =?us-ascii?Q?erhS01vSkgBWFF2iGdRj8DTlvMzVp7JPwKREmtrzjfZz/8LnRODtJdf9MKE6?=
 =?us-ascii?Q?U8IjN2B4bv8xSxkUMuuPAuj5BhU1BzApAyUbt1y0eoBzG4447zxNz7FBf/sX?=
 =?us-ascii?Q?aKocLjwgiAuF/JBSbFHjEVSXGSG/N8QSbyOvOE3lHKXQBsuStkaC+LhH9EfF?=
 =?us-ascii?Q?CaXWbfO6l+NOA+PHPmWwWtPFe8/XsjsPac6lCr7yCdqNUQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+h/Z+p1hpo7KAZVoFf60q7OdWcO80fIiekMXshncORYFR9RkUz/mgJqyIbBG?=
 =?us-ascii?Q?ELS49sYhJtdHfXXIOfud634sO+9BieN0Yj9KaE8JAhchZ4xqr2JtvvXR3zPZ?=
 =?us-ascii?Q?yh4bnOfHH1IsP+nNPvew/dfhWlg+5u9hEWw9vNMPYSIL/863ERDcumJGp1W7?=
 =?us-ascii?Q?mivSc0mdYMqWZG6acqwRPUcZKh441u0uRHD3xppgGIpOfQQ3oWp8J6oIsWNt?=
 =?us-ascii?Q?wT+kNPefil41Ne7Ion8SdSenjufMPJMRfJto6znDnRJQlUPB+tgkGZPSfYW/?=
 =?us-ascii?Q?XqI1DSdvEpU/FEAvyDZZtvQwzEQRSZCEzSHRgHJIuLmHIx5zLhwogAZ573RO?=
 =?us-ascii?Q?YbAtM0UbczsxevaSCH4gKCPcfwMJwC2JOcfjt2qIbMhDgMZNhGKjWPYAD3P3?=
 =?us-ascii?Q?L+fgx4x9S9/DPurz6T3W4BK6T/zFG10DzP4d0izHNYs4AeVaGko7tRn1/769?=
 =?us-ascii?Q?PiGQzl5zpXmOU10ddsFFzSCM8ncnLA13sLY1ybdp9vdyUqO8bYWKyo9Y/P5j?=
 =?us-ascii?Q?GXB7XhWH0V5x3Fr1r7CE7VN+VrhbGQOdyMbarOPL/onWt45B+hOlkCsIxDG2?=
 =?us-ascii?Q?uw53EkBPTVkmHFjbZYHCCfOei/h9GyUDwsc6yu9o6Jy4vIM59/D51gWry1ok?=
 =?us-ascii?Q?cAm8/B3MYVS1i9Rg5GXS7QWX7cqJsz+RjtlOX1GyhuAYAJ3cWKXq3Ugj0LkR?=
 =?us-ascii?Q?UbvpwXdRff98qsZ9DBDkfv6fZfAdI63nHsWUtYeavnWjz5168NMrBrKdGksP?=
 =?us-ascii?Q?8Oa+d/Rj5lfifNiviHCOWwW8137pI4KaLTmBzlAduVs5P6HYRFlg/3fUvIVV?=
 =?us-ascii?Q?SuvFVkuBFKTpZ7BNMQiBqRt0SZB7kCL0Qb5Qf0e2R9SFeSj9I8icKsQjYxs/?=
 =?us-ascii?Q?gvspzqltua2kDCY9EQN/BVQ8ToJZ+5m9zpfUHBvv1t+MTw86aFneluD2xbYe?=
 =?us-ascii?Q?MeyhMd8CXH49+fWKfZtZu+AMy6Dv5XaIfVBPzOZmJxTbaD/BNz3p/MZG0yqU?=
 =?us-ascii?Q?sBnuHwM9urNCx1qH8+XKXaOps9kcvBPxU0fq+aCYP5qEDvB34TTnux4B8W5D?=
 =?us-ascii?Q?JDJje3QLxNOY4ZLnpG4oNmUHlecEHPic1sXQfuDt9TC0SDtGYTxzntUnTICM?=
 =?us-ascii?Q?FZHX/1Ve1IA04DvUlW0laXUpDMgp2SshW7IWukgXepuJRu6r3KwNH9qoGjdc?=
 =?us-ascii?Q?1E0mqNsEBk3mZVd18mEraxfj6rEsMZ1i0zwr+x3EgrbDdwcmI1t2F2E7ElRo?=
 =?us-ascii?Q?Nyqw1MKWsuLJusCL7J2ssXHQkSNOvvIbudHQatfsQjgAI7F3kUOGsFfVlhhv?=
 =?us-ascii?Q?PRXmF/+NBEMxLY/94OLXeiZzSf6aEm6GkCQXsqk8CeXn10cnbJIc14BuKWU3?=
 =?us-ascii?Q?8JOe3RECCcqa1sUb17Q9zavlq9Hp/k+9Vabv9uWLdLXUg0/WdMBFBS3hjr/M?=
 =?us-ascii?Q?XxqP6dqDryLZtM8RgGmyVN/Jir6E7yWctTMOUb01DzkVzwItS9yWi3VFSDQK?=
 =?us-ascii?Q?S/Syxf08VLRcKzuUxrZB1El56YR0ltmk+xdHwrJR1uZweu5bSzf53QQE/sw9?=
 =?us-ascii?Q?PGGYjntAcfxB4MiZ02SolgJ10Q8pnrpBanFDaxsnRoimAx5feFsVuv7D5Z4P?=
 =?us-ascii?Q?SiwTgqSXxfVvF6/CiDaj/aE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4f82092-6c09-44b7-5b06-08dcecb42b00
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:14.0623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zNlEN/X3xEIM6/f/LXrRP3G7IzL566vvoJUNpouwQp4CnZv8Ru2M3gFw/TeXOK+H/HA2beOcC8AldGYIawSOTDSOJCMMGynC8IK8y0z2TQq7+hBBxMZocQpwZ+u5/xm2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6130
Message-ID-Hash: MBLJ3HMEQLYD3H66K2XMU52HVQ34BDLG
X-Message-ID-Hash: MBLJ3HMEQLYD3H66K2XMU52HVQ34BDLG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBLJ3HMEQLYD3H66K2XMU52HVQ34BDLG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/da7219.c    | 2 --
 sound/soc/intel/avs/boards/dmic.c      | 4 ++--
 sound/soc/intel/avs/boards/es8336.c    | 2 --
 sound/soc/intel/avs/boards/hdaudio.c   | 4 ----
 sound/soc/intel/avs/boards/i2s_test.c  | 2 --
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 2 --
 sound/soc/intel/avs/boards/max98927.c  | 2 --
 sound/soc/intel/avs/boards/nau8825.c   | 2 --
 sound/soc/intel/avs/boards/rt274.c     | 2 --
 sound/soc/intel/avs/boards/rt286.c     | 2 --
 sound/soc/intel/avs/boards/rt298.c     | 2 --
 sound/soc/intel/avs/boards/rt5514.c    | 2 +-
 sound/soc/intel/avs/boards/rt5663.c    | 2 --
 sound/soc/intel/avs/boards/rt5682.c    | 2 --
 sound/soc/intel/avs/boards/ssm4567.c   | 2 --
 16 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 80c0a1a956542..93eba4fd27710 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -203,8 +203,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index a31aa471a1c21..4dd9591ee98b7 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index c8522e2430f8a..426ce37105aeb 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -233,8 +233,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_es8336_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 430c070a1a0ee..cb6d54db71892 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -160,8 +158,6 @@ static const struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
 	.cpus = &snd_soc_dummy_dlc,
 	.num_cpus = 1,
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 7e6c8d9c900bd..4556f105c793e 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -46,8 +46,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 8d550e82b46a8..6570209c1a63e 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -82,7 +82,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_only = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index fdef5a008daff..6f25e66344b7a 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -134,8 +134,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 082f311d8b840..ad18c4e9a6704 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -131,8 +131,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 6ea9058fdb2a7..bf902540744c5 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -210,8 +210,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 9fcce86c6eb48..4b6c02a402047 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -184,8 +184,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index f157f2d19efb4..e40563ca99fd5 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -153,8 +153,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 1e85242c8dd2b..94fce07c83f9e 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -173,8 +173,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index cfa146b6cf087..30588d9e9ba3b 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -121,7 +121,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
+	dl->capture_only = 1;
 	dl->ops = &avs_rt5514_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 44f857e909691..b456b9d146654 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -171,8 +171,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5663_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ops = &avs_rt5663_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 0dcc6392a0cc8..335960cfd7ba1 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -242,8 +242,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 63bbfc30f35e9..cfef00462f661 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -121,8 +121,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
-- 
2.43.0

