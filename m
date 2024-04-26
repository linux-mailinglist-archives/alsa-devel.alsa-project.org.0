Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B48B2DFB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 02:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0328FEAB;
	Fri, 26 Apr 2024 02:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0328FEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714091104;
	bh=sY0DTKJU27sTmMXX9k0KQ3iPXJL4MFFJXdV42juREcc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c5rlpRdE2XtwcnI4dAh0+AfPqtLCUJC9efzEOwISt5DmuPmRgMcUXnpX2aPSKx4BE
	 pAWcvSmQE2Kwe8osX8GmGkPp8l8TvYBIVVXJgrDGs6X7m5WAFrICBaGLW+d1dHuFHi
	 X2UcFnhCHI1wO+ur7O/gXx453YFek4SXgynThtDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D83E3F8057D; Fri, 26 Apr 2024 02:24:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB51F805A0;
	Fri, 26 Apr 2024 02:24:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5328AF80423; Fri, 26 Apr 2024 02:24:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79349F8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 02:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79349F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=j3KAIb57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYX1P3raN+wx5xd1RR7AUpkkpKytdr/qzPgsA5SwhCSiYs74pqmNR2RL262hlZhctReJ/nCPCpRgEmZLsHk3ivT77+MKBf2cnysA9k4C1QXlZzz2bKlfn3in3davhl8q13pd/lXLGXcZaEKCWS0OI6O8qkBN0nhqiZzS/32NysUqL43qpZSYuLFfKgLkkPJ2gFIn8CDWQH13zefo5WfpqixthP4UheV2aygxIiQokGBClKsA0yocJ0mwg/k+9ILWytPHJcMinmAUpPIhbCb/WGGbC1zeQF3Wu63HOs7UtEawpXt3n4rwS5XU1llhKBCb8jArpM98BnbM90ID79XqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzOhTG3boytDfpNeuvR9H8B4QWL4hPgjdVikFFlp9JA=;
 b=N0xkUfvgB19/+eczIAjpwgU/DkFegKzNXkp/S+vG00KxQm1kU/mr2TEDb7NnwY+hzvNlM+VeOvbYpmNOJXPxabCPtfsUV8PKtJXt7wLCcYBpo8cay1PWOQaHFr97+AiR8j/BiKCNSfQvi/5lGeguevff53RGcayJ4ToB3U5fZv3fUGvSWxQ8syydQRDrmnNI/B5vIN62R5risst+vn8U+BCArhTqhYsTTuWB9oSvqZE3GGEODmOsf9Zbrcq2D/5KIXA96/lTWVLKuYGtJ7DxPpDZqojz0wjpW0gyvjuCoLrLUE8H5QXER9hQz19Ut8e8QdEe8zQ4tUxKDLFxOYA9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzOhTG3boytDfpNeuvR9H8B4QWL4hPgjdVikFFlp9JA=;
 b=j3KAIb57xoNwmBVwOf9+o/zPt1WHfrPnmxaacoN79haaYygLOJLXc0LwdvG8ct9YNMc8L/34FDuc4Yz0vvqA6eSRiD3OcWSInKIUjhU7OuthGJN+3QJTNiiWi7TQtC0ozVE64RlE7t28iaxQo4kChOo4HIhNOawTEqL4gjvFfcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7902.jpnprd01.prod.outlook.com
 (2603:1096:400:113::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Fri, 26 Apr
 2024 00:24:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 00:24:18 +0000
Message-ID: <87v845gee1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
In-Reply-To: <bdf31350-1f99-4588-8d6d-f4b9c8bad96f@linux.intel.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
	<87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
	<a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
	<87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
	<92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
	<87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
	<93294e52-97e5-4441-a849-867429da6573@linux.intel.com>
	<87h6fsisn8.wl-kuninori.morimoto.gx@renesas.com>
	<87plueovm1.wl-kuninori.morimoto.gx@renesas.com>
	<f65efc7b-d268-4b39-8665-5c4fe8e3ca1a@linux.intel.com>
	<bdf31350-1f99-4588-8d6d-f4b9c8bad96f@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Apr 2024 00:24:18 +0000
X-ClientProxiedBy: TYAPR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ba9fbb-9f04-40c8-9671-08dc6587360f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3BhVn2+fBA0T04giV7S0Hz1n76S+wcmNMk1wzqT1u3JfHnI+ysuO6+1T6hjU?=
 =?us-ascii?Q?RzQBgl7sIgceFGuuxX2qqqBTfBZQdU3JpFUBVcTd37f4fGbnTmo06U1r4GiG?=
 =?us-ascii?Q?K6WeS1bLT3JHWr1x71adaMxFQLHIFUvbTg7SMn/gsHj/jPgvP9A8mkpQ75nu?=
 =?us-ascii?Q?iXkP35azqtvN18eohwn4rfwaiFAQoZSWBcWyWqXgoP2nyDpWXFME8C865VhJ?=
 =?us-ascii?Q?ryh3Ubz05EhNlKnokrUQKhFDE/lSu6AWVGjQQOSI2tXP1EY+IaQLeQcU3eSo?=
 =?us-ascii?Q?+iWmRcp716WxCW1O6e0a9B6If5H53iYGlpbsPt4jtpHDq9Y0uokZWHVXpz7N?=
 =?us-ascii?Q?E8n7VMbex//yBRZYdzlFocDCNGR6XZxvuL8mZr6zwSdJw84KR0KtY25yHW+T?=
 =?us-ascii?Q?Wm+Wa++sKfFljRvPX2JL/ggcY1+5oDr4Rr5w15PQsnntwQYRpas5BTYyfGSS?=
 =?us-ascii?Q?zFf0Rmjbn43k5yIc/3rO6bnxSN6kbhfdsPAyEFZcNJBLVjP0QkM36vTAdTdJ?=
 =?us-ascii?Q?6b1oXdyjh4bF99BY7Z826YGGUIqnbYnHLRHZ0D3GK6KHWo4MJJoxK7Mnqfdw?=
 =?us-ascii?Q?dn7aCHPdKfceyur1MIF83OyRFB1p/EQLLk+T2FGTzipW9t8PLWpQplo8yHQL?=
 =?us-ascii?Q?dvGmOPjKAaTtojD8nkn09zCPhntA1PuFTt6Vhe4jI3Zu48OHOtEYPVWzXDHc?=
 =?us-ascii?Q?umHOsgRzzs6OJ6oOcLpiUS8RqdUdYuTqVL+/Ahfln0cytLzAXK1NIJg6bXKe?=
 =?us-ascii?Q?0asMjGPFKEu9ykmENMeSKB4Yb3kAYnyHe0jQLC2pfPcc6s+abv42XAyeOy2A?=
 =?us-ascii?Q?qC211q+H8aJCGVf0s70YeYNsJV4m07ZhQDnudwfx0p4WFeo5b8N+ARRkvv87?=
 =?us-ascii?Q?TeI/QoKIPXnr9JVAXBXG5U/g8/Jtq+57pZVee76X3hloqWrkzB/43PKTJHab?=
 =?us-ascii?Q?kPBZFD1jpvsJFzdadlL/Bo9tvGqvYjyUYFjU11A9cRGZO7E/V5etjVMWEnze?=
 =?us-ascii?Q?SnBbz3fq1lpETHySbLNGYxDwQLgaPG3Dh0i7NNb3b5zo0l5YPaDvLMkI5/OV?=
 =?us-ascii?Q?tlY4NQ0SyHq1k3FalBIw/IHex5RyYuf68nB/cYu0oT2JAPEgI27tA/fUdbv9?=
 =?us-ascii?Q?QHQxE1+SEpGwBPUx0SJpxmsU84wSPjwIfPgd/C07e7HF827i9H6Cd2IKePR7?=
 =?us-ascii?Q?gCvA6qAzKByv4ILZGBMkKkitOUERNQxbaYAAka2K/A9lqtTmedpbMhgZCf6v?=
 =?us-ascii?Q?pIRmgF2jX/ZKgOvcrxgui8+7J65yQFiZf7UvmpD1sHXR4u6bQYyF52rSjkD3?=
 =?us-ascii?Q?uz3Wc47ejuJADMJYPQzn5X2VK1iuaJ/EL5gIYm12huO2ZA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Io++xt34XPlJXnh/ocYaKGeBORWnzEY9ME/qy35iLiatvsNYAwu8Po6vsqmF?=
 =?us-ascii?Q?ral+aytFg7cTwWG/F45li7T1PSIyyKFYv42fZxUXOGmqJDqlxZaWmqFoBs29?=
 =?us-ascii?Q?PFAV41N6CfLR9Cv5dlxw2lx6ex52oRyA45UkCm0nkKAr4R0ldNSJIOdy7RFu?=
 =?us-ascii?Q?WjY+PSfd6qqNjpBJA++gAD2UigX0dFUXjSBENOC1tgYsBDcM+9h/DBsW/fww?=
 =?us-ascii?Q?/VS66QWfjAP8geTlUhYBUxayvOSbYVKABNqvkx2nnMuzWEKRmimORChA4g/D?=
 =?us-ascii?Q?wPD3n1cXqJS1Ivu6f8a2EHkb7gOZuFCKn7uGoRqkzvEp3haOXo84dmEVnkTl?=
 =?us-ascii?Q?PcluUgB2oiGrnD6n6i4klXqf497E9nWjankDmUBBY+hkoniEOQkuJEJixnah?=
 =?us-ascii?Q?h5aICdIlozRSLzy/c+AVAYYGirbxTn9eyw1DcM+Kh3ai6oQ1fGpJq87pL4I0?=
 =?us-ascii?Q?wgVsqwurld3zRvwH8OKuGBTOCXFEXs4Ht+fcYshZNxJ4APDvQU6Itto3xKfh?=
 =?us-ascii?Q?Hq+bYbKRVCHdYWhdNF5C1k/K6zcL6GwagSKnFSGZp7lZolfwQTb7ExlE7mSf?=
 =?us-ascii?Q?Ah95yMIHEemU6K8wuA3KuPPcnX18GX952LTq2IFfbqT0xnHLuwg9+xarnOru?=
 =?us-ascii?Q?+njtYNgDKObzMZPrdngVZkQfraMzsehh1+nwZ2WAwq9Q4y1IeytFyD7hNkDl?=
 =?us-ascii?Q?yunc+4mo8EgY9jIs1qqh9G2N0CDUgQiyK77RqwLZwazl4MZm7dn5qrMjn1n6?=
 =?us-ascii?Q?r53Ox4KtXyVNfvNwm+4sT/Vwo0AyGljvlIdbC5dPE17zJQRz+91onlHgkJRU?=
 =?us-ascii?Q?vEcY7ICGriia/qrRuK5OfVcDzG16NzohGlUoEKJRGTQwQwryKec5laORCgrU?=
 =?us-ascii?Q?scmmaA9iJIpCXtAGHUzivljn6FuFWdN6IDVWX6uwPh1U2ZT8kOyEpQ25qYIx?=
 =?us-ascii?Q?g5kBUuwWleRiMT2/Lh1rqXtDaOtLULYSVme8a0T2GthQXWee+9KBLM+plbdI?=
 =?us-ascii?Q?GBeN0Zq43ZvnYu9YjFQ7b9UE8wGL+pcqyLDX1prHt/u0DJ/g10KyEb/gSlfk?=
 =?us-ascii?Q?0PKbBmsvPL5i8LSQL2XLprVnj70H8w+MkuXIfAnyPh2KkIkxwNDj8fdDIxBe?=
 =?us-ascii?Q?MhP6MBN5a0sFrPd25aUV2gTd509UDJsUOqN1M8smi8bIOKpAwfrVJnLGM2TA?=
 =?us-ascii?Q?Ad97tANDai91aY6TztQkEtmBCfmp+QxsFFcpuKbZ4ANRbHguO90PwYpFY1WC?=
 =?us-ascii?Q?jBKrAMBo6I+EGtlSwL4fen+NYcVlbHrtNvzm7URlJvYesSbVUjODXDvnbKB/?=
 =?us-ascii?Q?X7IsQ8s7tPQvX6DN2+1okiZL9HmMD4jjj6yit6iISOUBLmFyo/XKaDXxhZMe?=
 =?us-ascii?Q?qkpupKaN0VbOfrsmVwmRXW+t0j7MRCupotPpHIY9hNoyeo6OfFyHkSa9uXjU?=
 =?us-ascii?Q?Md751ndddePN/NOphq2513AH9H4YSKpC9N6wPHpb1Gv0hiOPbniw9THSAZ6G?=
 =?us-ascii?Q?8PjeeLBgGNoJ9s03Zb/vOk3nD0WdyntU8nMN3YQ+91ZCegmoLfdTyw1ZS/Tr?=
 =?us-ascii?Q?vvjhukF8GnX0/znEcoBo4c6Quof9Lx7+xRwb4IHqTrrHWsDmKv7CmZ9KbWXG?=
 =?us-ascii?Q?PbpyNzzXszmIRgvBjIQFOJU=3D?=
Content-Transfer-Encoding: 7bit
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a5ba9fbb-9f04-40c8-9671-08dc6587360f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 00:24:18.5039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 X/rrTykxMnI7j6Q/0+OPYCcifwSOvl6cPl1UR3ftJzmqerEuUSDIo1RTQ68rHsXouNbhaehzaehdabIVXDufRcRR46bg7E6EamFi/eCzXl06LJWo3SJ4w4kiZTZ3oiv3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7902
Message-ID-Hash: 5OTFYGK4OPHHDOSEEEAPT42HHZRANGBP
X-Message-ID-Hash: 5OTFYGK4OPHHDOSEEEAPT42HHZRANGBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5OTFYGK4OPHHDOSEEEAPT42HHZRANGBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

Thank you for your feedback and report

> On some Chromebooks, we tag a dailink as supporting capture for echo
> reference, but that echo reference is generated by the Intel firmware.
> The amplifiers only support playback.
> 
> see https://github.com/thesofproject/linux/pull/4937 for details, I
> added a clear log:
> 
> [  807.304740] kernel:  SSP1-Codec: CPU dai SSP1 Pin supports capture
> but codec DAI rt1011-aif does not
> 
> So I think for now we probably want to avoid this stricter criterion and
> only check the supported direction with the cpu-dais. Or we add an
> escape mechanism to let the core know that the capture support was
> intentional.

I think my patch have escape mechanism, but it was for BE Codec.
If my understand was correct, above is FE Codec ?

One question is that is it just a mistake (no one noticed) ? or is there
some reasons it can't support capture (but use it ?). If it was just a
mistake, is it possible to update driver during the grace time ?
Or do you think we need "escape mechanism" permanently ?

> I agree with your analysis. We don't have a clear memory/understanding
> of which "no_chan_DAI" platforms (B) was supposed to handle, and why no
> one reported them as broken by (C).
(snip)
> I am good with that plan, but I'll need to investigate first why we had
> a failure with one of the Chromebooks on this v3 patchset. That may give
> us some insights on "special" uses of those flags.

Thanks.
It seems the code was just complicated, and we have been missing
important check. Let's break out my patch-set into small pieces,
and go more slowly.

I think it will be like below. Can you agree about this ?

Step1
	dpcm_xxx flag will be "option flag" instead of "mandatory flag"
	for a while to keep compatibility and avoide confusion.
	But it will be removed in Step3. To indicate such things,
	it will have dev_warn() if dpcm_xxx flag was used. like below

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		has_playback = /* at least one of CPU DAI supports playback */
		has_capture  = ...

		if (!playback && rtd->dai_link->dpcm_playback) {
			dev_warn(dev, "Playback is requested, but CPU doesn't support it\n")
			has_playback = 1;
		}
		...

Step2 (In case of "escape mechanism" is not needed)

	Current DPCM is checking CPU side only. Indicate warning until
	Step4 if Codec is not match . warning only, not error for a while.
	
	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		...

		if (has_playback && /* no Codec DAI supports playback */)
			dev_warn(dev, "Playback is requested, but Codec doesn't support it\n")
		...

Step3

	Step1 deadline
	remove dpcm_xxx flag

Step4
	Step2 deadline
	CPU / Codec mismatch will be error.
	It will be "at least one of CPU/Codec pair supports playback/capture"

Step5

	There is no big diff between DPCM / non-DPCM check.
	Merge these, and clean-up code (soc_get_playback_capture())


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
