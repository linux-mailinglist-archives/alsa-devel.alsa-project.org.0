Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406DF93B9B6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 02:04:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F8E5F51;
	Thu, 25 Jul 2024 02:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F8E5F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721865858;
	bh=muWjQb1DEu3iOJKJ3yetRXunpXO9j9oe3Ng+nllTCPI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hDYORmJEBsr8GrDfCol3cgdY23VbEL99xXAYtV79dUIf1zB5BQr+DU2+0xpOGNqbT
	 3+BSgn+GkpJ62oe9bIwhzK0S+uI1mTjAfWHxmI5ymZrubiUF8+IlRvEBa5pXsLwzxF
	 pACDizgnAjqRXdMa6OWMx5C1xx8FCt8tgqut1Mvk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED41DF805B0; Thu, 25 Jul 2024 02:03:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 334A6F805B0;
	Thu, 25 Jul 2024 02:03:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1060EF8026D; Thu, 25 Jul 2024 02:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AE14F800C9
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 02:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AE14F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ofwHZlIE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaOBWFkFrDD3Ur2vO6LmW++WZf0r7Jm8Xo/Xnn+EunZR3uIKjqyKEvlhno8NijYvq/2jAf4GtF/KNBmwH+a+Cz6gv7VApmQmv62j3gIcptVMQ5hRhspL8M0+QmXm5F8vLx9vlzHSnqJsXRtDELLmK8NYJ6Qwqixld1mqRiqDUbYlzwUTJ2LJK2plq37qBOP6EAlVRLXjeDD5U9m+aqdvjofLcEflLcMdXcjy3PDFKpcg8kgOahuL8uzEgsJ0wkAJMVr2MELQ0gJPjtAIXEcu5BHkmdPVJkU11VKoduBWtIn+kbxYntfUhtZ4mcFBzlVhuEA1XY2cRCX4nA6S8Z6RGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GztrfkjAeVGSSsmEUu9pw4N9qdsVho64Eot/65JC78o=;
 b=aNPr0PR6gwVuz/K1NMs6FCU2g1EtJZSPNyYB3OX52srLt5r08O4RNNmK24LY74e1oeED/ibfjzx6MpDWfoCc8O6SWH7iEXVzKbcKiISmdfG4xNwQ46bqiH131pJb5+ieSZMI0mKqzjHf+PmaybWE8v0A9QpHyRSAqlx0cjwdU1NwTDHDL5qsXhXyGJ9TxuiwJRkhnk/ZYbYrL05KS7wW2JmxSJuPsYIbNrX5rmWLk9q+T9YFaRnExKek3UilEoEhdGpIdBv2/z6curMCLdLXH2BuCYaBo6hV9xbcapk1J/NVJ6w7BfWd9Go/4hbmJFt6TCz6FQ8RMIHuLxTDVGeczQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GztrfkjAeVGSSsmEUu9pw4N9qdsVho64Eot/65JC78o=;
 b=ofwHZlIEBbdyr2TYXvrth3Xc1QBsRJcSU9oy2evRBGCuWj5tCJaMq+g1gwN5N0mkaZfaVrteNGUnQ7VcALTjMzSvvDIiN0mlS5tehWhDjtsAZ71OXtnI/XAi55jfv9g9Mmds71adJkYzAG+rs58cXslzDEc7ADAojlyL/cVmNYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8585.jpnprd01.prod.outlook.com
 (2603:1096:604:19e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 00:01:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 00:01:15 +0000
Message-ID: <87ed7il4qc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,	Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,	Takashi Sakamoto
 <o-takashi@sakamocchi.jp>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC v2 00/xx] ALSA: ALSA: add snd_pcm_is_playback/capture()
In-Reply-To: <58899a1d-163d-45cc-8358-72ea7bb44354@perex.cz>
References: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
	<58899a1d-163d-45cc-8358-72ea7bb44354@perex.cz>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Jul 2024 00:01:15 +0000
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 764fd1e8-c24e-453f-b004-08dcac3ce731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rti6d+++NSVIDXSKPurQPVmfYMr64oe+W9wxDsQqeIhEYPsG0R9KBZ32Abcx?=
 =?us-ascii?Q?8z2i0Zt4V8rVxTwnWX4h+myFcQkJwaQ0l/z4G5lM6ySxr9dIi10kVYfgKsbK?=
 =?us-ascii?Q?xStPA0onk4DhFoIm3uzOMlWJizxJxtGIBMxXGrYhWXz172tSPLqsdgX9hh7w?=
 =?us-ascii?Q?vqLAShvfE8PbxE3CSWKL2el6E9B/cD+XBBAQ2H/OSdMNyvLPnrsUhHLIZhoV?=
 =?us-ascii?Q?NkUlMPXqO11J6vjvMxAGsQhDIGkOhMx5igyt9ZTYvitmmOMBIp5LPNS0KdUQ?=
 =?us-ascii?Q?JKdLx+00S9U0wkEw4CM1iobE6ToYLz57SCM5v50FprJmxanj9rbZ4OvrG5lk?=
 =?us-ascii?Q?ZbcPDE9CGDIXWfon4tMkXDlVMJWdkG+PdJv6kvRqXISVlKD7an30rMUXeGLM?=
 =?us-ascii?Q?gzSkhZhKPPhUxSWjFxyYKIImi8bv6MGKBIophwIKGy6blvgmPZmPkbWe3gau?=
 =?us-ascii?Q?x2M038eBGJxRtvq1Wm1vp3/TF0OPV6MYcqEkbwP6p0h0MRa1x0gIUa1eDXJK?=
 =?us-ascii?Q?q1DnlEK1MdxS85cxbgIhs5EHcWFUQVc+1iCWwh47qOiqnRoNlHYrKGAd4v76?=
 =?us-ascii?Q?TvsV23d6CSvQbcz0ABmpIv78vFrpOvRCS1iRr5l56V+f1E6hG3rymRJoxklo?=
 =?us-ascii?Q?JQPc9F7Zz11rXCeHlvn6zzSInLw7i7AEROQ2gF7lx3oqhiIWTM0/Ovl79Uv/?=
 =?us-ascii?Q?Gfmon3/Yu+wy18HEeHM0CYuyevxSmXIN3HKpnqWnmRyolGLgPYX6rMJdBh6x?=
 =?us-ascii?Q?xJOciM5ZJBrkk111pcxryWnDNCdTAdQKwA3BzC4QPnNon4bNQp4A655/MZkG?=
 =?us-ascii?Q?dHsoKv0y+KZVO1RlfKJ/6jq7yLWDEyu7KwY6Zd/mAGkmhvUF8+wDoRYT2IN2?=
 =?us-ascii?Q?zfcPI6IR2jTQtQYqdMbMSn6KlqEHOdN2K9iAQD08zFSdhUKKEX9UoeuV/IGw?=
 =?us-ascii?Q?8PAtjieolbPLkeP4kLuKKp/0ttYibm7BlKOSP+Q/97PHyAUkOjmqs9Scpp9e?=
 =?us-ascii?Q?xaOcuDBrC1FXlD7/lxRIqfcGSpID7N76+q3icN/hjjsKkuRc+G6w4k/2sf2f?=
 =?us-ascii?Q?fXnmlNlhEl5yuWcBFK9K0jImsHx9QoLpn7DIHz8WDc6uAuBd2uDbO7W1lEhM?=
 =?us-ascii?Q?ci+jWMWx0XqTndD3HgZjozKOTpX9cNzmOc1LC6Yu32pOCD0HNJdJnvIXYESN?=
 =?us-ascii?Q?XfsdM2fCEseskK3ubJ7cGRdG6R/+IBiv0EWilmMeryAZZOiN/UsCe4B1uRWP?=
 =?us-ascii?Q?DVx5Qx+IMoJv1Yzki4dO3ZPC4511emtNGROWfImp9BhyTDfEpUTOo2ypUa/t?=
 =?us-ascii?Q?rGWS2N/Gy4VCfm9EUAlZq5dBdZl3QfCOwTHYkkPrVWpmZ1ycFEsEiH9kjQKa?=
 =?us-ascii?Q?IyXakPqJpRFeM/AfGk7Dmd+gDd274mwikbF9R+L2oBKy+9NXGg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gbFSyiCzeD4J+Tl7Bq5zLMd4uHgyHQ5NSGpLrzeVg3wQneN6m83L71fdGxEp?=
 =?us-ascii?Q?/GA6l8xOrQbF/yH2baOgFx1fu1Q++LPVRZLlowrQrsdJhCZzYFrF+FisIQy3?=
 =?us-ascii?Q?5VlzF5bUl4+a4jetXvJSWL19QCF1kc7ukh2KOSsjN6t2ivAfcrZS3qxJ7b1C?=
 =?us-ascii?Q?pP8AkN8wcRDpuDAStBvV+fChRL1IC+3ojL5VKIyKjhFIzVJENiNlFTMCZREN?=
 =?us-ascii?Q?sByxGBvBqsR2Y+ZQNrp+H0vAo/3llnjecryFbMVRAL0kpJ2wHs9rPuNt//PZ?=
 =?us-ascii?Q?Ff/kC08WHD5SwZlNQfoakU5rHRRAgERs1zVmPdUzteq8E2DIb6uAW6TSNHKk?=
 =?us-ascii?Q?ocyG6zjqV1gHB0lwl882v8ijFRnlGwLVFaYGCDiVT36cJvYVU9kLOhJXT0xk?=
 =?us-ascii?Q?mNeafyIDCPqV2DcG0lx0ytrf7npvxkHDc4w0TOPffIOINPu1oIgkN4SAlpo9?=
 =?us-ascii?Q?bUgfU3GuoN0pIF7x8XyC/9uuhPMdxiOSVfOyl8OCyB2a80PiG/CuJeHspfz9?=
 =?us-ascii?Q?uHvyLtzY2bOmrmKSVrs0wEJDoFyLsMVIpVpC3bCynVTHuknAmGU0JfEhCiWI?=
 =?us-ascii?Q?O/GmGhHkF0o640zjoa2m9Nn1V3ob2X0R3lK26HVNGQIlbwA+I5wo9GhaTpns?=
 =?us-ascii?Q?//Sl4Z139fCPx7p1E6BH3ekwkyIHt3peUq5ubIxP3MC/0ru9v34fLm+leZ4V?=
 =?us-ascii?Q?Vezb7oIOTnHODygScUX/Q63g5kW2PMxK76O+HpLFOxeh8s3++QjPBEGqhPMU?=
 =?us-ascii?Q?Ebk++XImwzPz5zp8Jj4vg0qqOewfbXPsgq/KOOIPvqsR14d8OsaUhZdpsDnc?=
 =?us-ascii?Q?ZKYyumKqiwF6TBITLxPU/EKqvJrJKHhDDDo73O407j2g6LTbQvircCfq4pgL?=
 =?us-ascii?Q?y5j9fS+uio2AznIj6a56UcNCGRPDjHDNOkblMH5FyghccqM6ynsMzrplZFw1?=
 =?us-ascii?Q?xa5V3qlll8dc7Sg25ewtRHSxZV0xhV8B9g7dJX9r4YmoT/dCk05VPxmHA4Fo?=
 =?us-ascii?Q?l+ZHCuTSNc1sfQM6xA7EaWVtSU3XMQTYGhIdm7CrraxrqXstQBNaqRe8Q+Qf?=
 =?us-ascii?Q?9Puj/Ggu9jOhtoG+iTA2s8V3Qio7Z9DTkLIQdXT+BG/LOBCKuJDZ8CEg2z0r?=
 =?us-ascii?Q?F4GW7KGp7YZHA2/t7AF3dyb8ZSMLo9YTQEz9tnYUrRVq+VMrXgI+o/NwbiK8?=
 =?us-ascii?Q?rHAnkhGHCkMZHM9BxkPreUI+y1Uaxt4diB+OYGVr2g6xV9VbpovJwHagdLex?=
 =?us-ascii?Q?BRktn1gzGcxJNaH8HCYrbbXLpF3dgvYf5hiEIMk6IhxUdYNGgoHlpR9EvOun?=
 =?us-ascii?Q?RRuw7/eWMp4sX3vLhXkaTTXpe3xvUiTkEuccG+h473RlUmtslbravXQ6NUst?=
 =?us-ascii?Q?pqGXq/ytKtc6inRAi69GsI0T8bwSv/kLPdJvNAffSrCwXO5PCzv0+umN5LrL?=
 =?us-ascii?Q?czhjkqX/AwIKVXgXCYQszPyUkCziRCUYNFffU1Xd6+cl1CWQ8LfUWeiYNAyX?=
 =?us-ascii?Q?kto5WvWqRL85rUOJf5eWQoiUed1PaYbLC9/Ln/U+aRjCAAMD3bDh5Ig3XUNe?=
 =?us-ascii?Q?oUDkzishmjJXtRVo4qVgctWxxbwaeYLhi1Hb8A9hipKsu9EGuF2Z73qqI+Nz?=
 =?us-ascii?Q?czaL1o9QJRwzU+9nnzLzDbQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 764fd1e8-c24e-453f-b004-08dcac3ce731
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 00:01:15.7812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mDCyAN1IHFVCQCIgfATVGe95urq4LBNhERrLWkagVZs40HzkUF/3X+oDxL1Ritvp3g1pKKB6mpzmLqZbbTis+xcuWPbz3vLK5Hz3vPveDug5NcBNspqrz0D52ILQaNJJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8585
Message-ID-Hash: DI3W6R73LJJ7KWA3GOTROPVAQW72BDQQ
X-Message-ID-Hash: DI3W6R73LJJ7KWA3GOTROPVAQW72BDQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DI3W6R73LJJ7KWA3GOTROPVAQW72BDQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Jaroslav
Cc Takashi, Mark

Thank you for your comment

> my opinion is that this massive patch-set is just an overdesign. Even using
> the _Generic macro does not bring anything new and the code readability is not 
> improved. If we add such macros for all simple cases (condition expressions), 
> the code will be unreadable at some point.

I can understand that there are pros and cons.

I don't like redundant long and hard-to-read code to getting simple result.
If there is no way to do it, then there is no other way, but if there is an
easy way to shorten and easy-to-read it, then I would like to use it.

But Yes, I can agree that it will be huge patch-set, and indeed this code
does nothing.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
