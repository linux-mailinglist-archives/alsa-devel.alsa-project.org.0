Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34398791F93
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 00:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4080874C;
	Tue,  5 Sep 2023 00:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4080874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693867584;
	bh=e5hq12ZK+EefE/6qdpoMchRLoYEbt0xM4FgVxd/9aD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dgaTdIsWGvhDfjYMyxm2qKfiN+BtU3Ox5hFbZfmvvT9aSxpESjnmPUhu6YYNSgMvi
	 EG8HRrFzMcC/FouJdQfvcL3WC+y6vgyZ7SOTjZvXRGAQtnZ8bGLtfUQimYmffIeMi9
	 x2VBqFitqJ6NbKQwE8MSeZNLdTHIQKAx6Ul5TeFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4DA5F8047D; Tue,  5 Sep 2023 00:45:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73248F80431;
	Tue,  5 Sep 2023 00:45:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B050F8047D; Tue,  5 Sep 2023 00:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 255CDF80236
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 00:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 255CDF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nyffe8YK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A78KLUbGRWsDrNQiO6+ke1a85Nxb4S313GGtvBSCbSZg5VwO75dbL3dmnKbcfhfm0ly4XtUp+S1HWiZX2dTzQEno9s0f/GJT6wFMaXzu8lExKg0oWbhUvmevaBzwvBuwXcWAEdsKlPrwLmAcOC+Z+rhCLLmcntw+wkOw0YuZ8LxLqkVywPXFHVgWJmPG3+mMcL0szdJQIEmGjOG+n/Dk/Jc4FbWaP/C9HqFAeZ/hFpoKly2f79evgQkb/bH8Bbxr/AE7BOTXijtNm/2IHnTuLAvWTUGZRWBdXIQwp9WmgutHD38FJz6Fz2ZYF6l5TXhIe7f9NVuSFRRug4Wdp9c9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmYOjIPC6993ZiL6cTTKEQtYAbJEnsbkmgapMO3sydI=;
 b=MiKnNXEg57Bd/Y3s6VGdnkTgRrJPyfKNMk8vPsjCjdi2429/oUtjxROmZ6mkdpJnZmHICZfO4GTlKQUEYYPcQsWJbkXVWO6nMzAb2S+Z4s0hpXzbpt5TV/se469Gs8BGNoEpp9BFymTib/RgS/X3qZhVzPgSJ0NLPUkedPPvef76z8OvAaWS9lzLaUIz7x74YEuzm/OdDZdfSgLjjI5wUAgAxTPNxZNnt3RWq4SgZ6XdjzJ1J8HIGRd/Cr8LTccaWhwHmlS4b1PapTHdOpkCvdvfFEoAZSHhSjdNGJiIVjo658SquND6CfIZe/RuOURZinpO/v6gV2vmb5fF+e3WYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmYOjIPC6993ZiL6cTTKEQtYAbJEnsbkmgapMO3sydI=;
 b=nyffe8YKHTeBzbevmzdDiFp4ImaLrcqiFYoI526ICsLSpGvzffw32cqp6Xj0QOsk8FTrRW+DoTSkBGG14X3kvPYHJoVsA0E3YRXCBEqmbt2zo/6UIouy3sRVfYp9OgHPulywLQkKizExcrSnnsg58y5eSOQKs9gizC+2UC0iAi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYTPR01MB10939.jpnprd01.prod.outlook.com (2603:1096:400:3a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Mon, 4 Sep
 2023 22:45:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 22:45:12 +0000
Message-ID: <87msy1fthk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ASoC: soc.h: replace custom COUNT_ARGS() &
 CONCATENATE() implementations
In-Reply-To: <20230904111524.1740930-1-andriy.shevchenko@linux.intel.com>
References: <20230904111524.1740930-1-andriy.shevchenko@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 4 Sep 2023 22:45:11 +0000
X-ClientProxiedBy: TY2PR0101CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYTPR01MB10939:EE_
X-MS-Office365-Filtering-Correlation-Id: 783f7b9c-be72-43b3-3bcf-08dbad98992f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m0PL/LWv9vlD3VUCCOWIkKQPrpAEInVhtez0vjfj5k3oNym8ogoo45naNoE6opfZn5FLTStJSRgpTFL+g19xknZSL3QJT+zIxLMXg7bE96vlmsOP1uXZbSLi3gJwxCZJyZrim1ztvgbHdwUX+x+FDrXU4Ih6WefRz545418pXraARXmYJgzFOnsnwtto0C4Ryg6wcDqYMpTu9/tcVu5/Krt1A6loq3mad8PuVbmPcO/28X2dyBBWX+RPv+mnwlOxrf2ISd5l+2P9Db3eiTprRp8u/Adz9M+KAM4lxe3f2DVL1yExeiKsBorwX3M/6qRhsv7ixG2TRtONlqc+otv5h+M1tTp6nF7NVFdsIk/Xfd1y8eTswv89VikZ5VdKKUZe6VlfVafiayFjI24CCLW0TgaWmkyCRIzOFOsml5/qDs8Lx9trVPK65h3pByOyju4bnSbnUhQIHSB4CFFmN7pkGwuR1tMwWAVWM9VOxhMWFbigEprKIJ65+peBYCS4kaYmRufSrpGdP9E1znCEEilpGFjCzirNCyLjQ3O6dhT8utYx0B8zDy59yVkFQmG6vRvEcgl3cjyaycYnWN0Kqu2qa3dchA6YBA1bATjEh7M5g+bSV7A+YiVwGQPHPhgFgDLQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199024)(1800799009)(186009)(66946007)(66556008)(66476007)(54906003)(6916009)(478600001)(38100700002)(38350700002)(316002)(4744005)(2906002)(86362001)(8936002)(8676002)(41300700001)(4326008)(5660300002)(6512007)(6486002)(6506007)(52116002)(2616005)(26005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aN4FupUqFU0EZTvtQ3l5ft/P0Cnmr4P7MzwcY3/mqG8otrfXtrq12w2K6UIE?=
 =?us-ascii?Q?ABWVMlkB0oWDuoGpdAIKIF+oKXv94Tb9Tois36quHUo/WmE8ykGYkPjabuTi?=
 =?us-ascii?Q?5SOciqpw6BMPwYjO8xKfojt6zqLzT2esKBldqmPKsmvUTKfgBZviRxlPoFu9?=
 =?us-ascii?Q?jqe+bIza8gf26DP3yHBkGHdrvO93v3+V5z0omrIYOu3dwf5mq6v3eSWIkVoU?=
 =?us-ascii?Q?rF6BgLHWxf4ulHZovNauxyYo+2gpdo7KBTfMcup4PGFZ8PrP6q698o5BY9v1?=
 =?us-ascii?Q?8FOiou09kDEA691xrQBQyvoCnkmcOcZHuaqo7M5TME5pF+ioujQ9KXJ0xMlc?=
 =?us-ascii?Q?xLLBb3CvXjhg4d9qsKgOHn7HSXOyRFIcx2MrzUg6VkYBXX/AgJlOQgPtOAiQ?=
 =?us-ascii?Q?umKpgwT4yPyE5Azunx8MtBJOnDBHVrXNq1eaD7ODk+1krdxtocDiU16lKvPB?=
 =?us-ascii?Q?q0ZzYChj06CEFqcy8VT4w/Zd2iOYG2AyIwMGWQ/C9MJmXGc+yqFmh8FAnBKq?=
 =?us-ascii?Q?QiwVAH7hb4CY7y0EqCxjMTHX9QMazS8geDs4/prZMndwaiVFX5wc5L8kShZx?=
 =?us-ascii?Q?4lK8Hp7/gASy6kPNwTaIHkk1mZ/94UUkJngwy7EqjRQX3VgrMi2UvznFWfry?=
 =?us-ascii?Q?AA3DzN/fk57RDjgL3pI1PXz6S9U7V0/rZSKtDDaYGRS0F4bow+1y8u4hz0AG?=
 =?us-ascii?Q?A+VmKVwsEZP+xh63w4rL8AC4gfWPVMlMeboVoruCgGYrwAAXcN2I90I9Zqhx?=
 =?us-ascii?Q?CDbRB3DoB41k1EzHvDKVdy9NVcbSXjUPvAMWqTI1qf39Op57cgoG7EIwD3uR?=
 =?us-ascii?Q?kdVsJz/v+IOBVNDK71Bl0SRfP69vV6G/0sVqFa85klXFhVRy993ujX/8XCTh?=
 =?us-ascii?Q?0riQdKSbZ/Psy9axVK6Kjf+DynpmDZGOVjV7qBCV6syeC4ywCwzQXHHY3YWV?=
 =?us-ascii?Q?OfPGFZplyqoKSw1FMltFD3dAL5H12sL34Ewu98HgY7wtOYsWcvVIBQei2VJb?=
 =?us-ascii?Q?lqfbtol9y5tk+fI8G3lEBoKDj4DVsjytHwpW9DX+JtyNe+uQygtdlnCkt0qj?=
 =?us-ascii?Q?hel0nbTWjztkgGUwUJHW801SeUu6XVOgrjC6acZ/+DIHkWKChhJoLPQbxq4R?=
 =?us-ascii?Q?kGof2KMOS+dInYPfviLkarObBez4huqKpy+GpGh/5n3nVVThznuuqgo7iVi1?=
 =?us-ascii?Q?mwZfAO5FQegDkpJSYrB8i0paPDiycqtfAhR7/H8fqS1n2tJbKh5GZ1PsRdS3?=
 =?us-ascii?Q?Ua0dGEVtE/j/hiJgBIoI3dU1oZUGT1yJBimdCQAZPtfkCFqDhr3CZocEOhbN?=
 =?us-ascii?Q?MrwxHz965C0o4Hyo/72ADNbgVxHaLJG1QitirslcoOeU9YTyGrzeJ3mc7+e6?=
 =?us-ascii?Q?lp9SrsW11UkzRAf7PqmAILrEaPZhj1WfJvEUUKGWuWiWnwNKSBG/ga8X5hag?=
 =?us-ascii?Q?ToVnnn1okb0P0K8dLxeksDpl13nt58LbcBDeivM9r8U/IueA35599xvxRJ46?=
 =?us-ascii?Q?pcB5F9qvdok3/+F+ufgeehm/QtUAgCXkWnBC/GWo/VnA8OJPEN6hhl9vx/58?=
 =?us-ascii?Q?v9wYinFtqycW3E4pwjDDmQThBPxlatAoJik2tWA+ddsmwRaV6GYqLiRH7PhT?=
 =?us-ascii?Q?RSzGVkAv7Eg6l/UVSAJU/gU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 783f7b9c-be72-43b3-3bcf-08dbad98992f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 22:45:12.0743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Oip2KNRTMbJn1Sc92nT6YdZ02A0XAcdQIIUUAkwdKLHm3UN5y2Q9xwlQ8a1MlHtEoK+kvP+0uvCd/OhERlfyEskbCg7omWfcL1zbu6N1D22z36FOsGykSG8ucYFyWDK4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10939
Message-ID-Hash: 2FHYJFCQZHTZEQGL5KDAHZGVF4CT4Z6X
X-Message-ID-Hash: 2FHYJFCQZHTZEQGL5KDAHZGVF4CT4Z6X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FHYJFCQZHTZEQGL5KDAHZGVF4CT4Z6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> Replace custom implementation of the macros from args.h.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(snip)
> -#define SND_SOC_DAILINK_REGx(_1, _2, _3, func, ...) func
>  #define SND_SOC_DAILINK_REG(...) \
> -	SND_SOC_DAILINK_REGx(__VA_ARGS__,		\
> -			SND_SOC_DAILINK_REG3,	\
> -			SND_SOC_DAILINK_REG2,	\
> -			SND_SOC_DAILINK_REG1)(__VA_ARGS__)
> +	CONCATENATE(SND_SOC_DAILINK_REG, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)

Interesting nice macro !

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto
