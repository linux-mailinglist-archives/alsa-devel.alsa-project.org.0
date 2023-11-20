Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F048B7F0B70
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 05:37:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30074A4B;
	Mon, 20 Nov 2023 05:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30074A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700455063;
	bh=TnahPqmCTKQ+C48mm+mIOsUZnsSskLGasUOBROcoumo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kni8lo0TwS2NExqG9BrBLiDAron4MNkRfbJHVWDsWOlbqIIpywZZZ0rBx/DCjRxAa
	 5+ZaEQ5gnILNwV7M8gSzssIDHO2SNI0TqkZL7+AN5Ol4DhDP8RqL21nzZ80dNpz2kq
	 vSQvlXddE/nqUIFgvSeW3dqAbtIDjQGXprQrShZo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95980F80254; Mon, 20 Nov 2023 05:36:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D24F80249;
	Mon, 20 Nov 2023 05:36:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3D88F80254; Mon, 20 Nov 2023 05:36:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CACC8F80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 05:36:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CACC8F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=egSTG6de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGdc0p0FjKWctC4gLnTtkNV8PYcgZWrBQju1Aewg4n1G7CXAW3FDO4BQZBdTOZacdHGtrH+jEEYZRzu/QqHlyJhH8hzMEYLhZ79TkqTEjeb8H5vWAZdk//d+49e55J06sgjBIoQ2Q+F7BvPlBffASzE7sFWVtpSWhlqubVAq6EwlZsHRb0mHPRbXBcyYj+Oae6Bhv3JV4QlfiZvIaireLxJPvSdJ0auh+VwZjutRghuCKn4OQYh9ngswBRGL7924tXDigPT1y3OsZqdFiHalSguiKfd9Hu4UIXvetMXSUKsS9fvdGEXmlB9hbUv0oeFBl658/yUgwqkdPPC64B+kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2m9G12fOfXBOjU5IfIRq9Tti2xZLzcudp2M8QvE8Eo=;
 b=SlxVJ0dMJE5cwQYADjCCtWIrxQl3HkuSTYpZI/jaMdlNM1hignnRq0cShI5P7cIfXbnnMUPjAjSTLExdPGTdG63KxxDd4Oi32OKKkcJbEwX2wZMfYucHEBilqxJw/2X3KrIII3rEq0EOWYvJ26Ct7U4AnVZkBHUxSlS2HeTI7au6vDUsdHFfvlD1Nlz8RrKBJdOZ5PFQpBxBb4HdtQ9Z8TuQF42/TrNTVuAt1+2e69zyYbYjTkTE5+mcqJRJufrwiktftk61vE8JD8ycYYzSmQnkmhKBeSMN1CT1DAxtTP5VLChKvcA3MSabeIGxZF8uMllc2EmA9XW9y6JJyhB0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2m9G12fOfXBOjU5IfIRq9Tti2xZLzcudp2M8QvE8Eo=;
 b=egSTG6deR1qK8jR1RhPKqzIIjSC69wXpNrLKjkG+V8IBEOH3qnNPMb189ZnzzfNon9iUUaXczM+hsCmwwxx3D80mBb0g8Ws8qBRKQwYI6cd+9j0bss8t2wieGBqa5y6dwOLMrYaRRPsLCswx9u7EbGrUYTDA7unrjSxv370VVwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10374.jpnprd01.prod.outlook.com
 (2603:1096:604:1fa::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 04:36:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 04:36:20 +0000
Message-ID: <874jhh2g8s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: broonie@kernel.org,
	daniel.baluta@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	iuliana.prodan@nxp.com,
	shengjiu.wang@nxp.com
Subject: Re: [RFC PATCH] ASoC: simple-card: Use dai_id from node description
In-Reply-To: <20231117163900.766996-1-daniel.baluta@oss.nxp.com>
References: <20231117163900.766996-1-daniel.baluta@oss.nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 20 Nov 2023 04:36:20 +0000
X-ClientProxiedBy: TY2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:404:a6::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10374:EE_
X-MS-Office365-Filtering-Correlation-Id: 771ef9e5-6f6f-4b11-5a57-08dbe9823e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TeO7zGAOaqVm26QP8Gq07L8NvemPtIGkSwAFoXuWx5eO0gJFIvFTvRrf6P+JTgJhI2p9th2H+3STovLol05wk83EFg1XFw1R2rDCPcwpTPVw2n1o3nXwW4xJ8Cr+qao5FbuxP7W/Po2jL5S6/8v0yhKZreLFtK+pHe+JNPGg0OklzB2zPoSVW3NaTBEpfrIJywQir49cQUdUdJ4l9ch8cpR1e2cKNeVmMzIJHLvyxZ0rSfP3TOP2wwAGfpLI4VM/+U0AJ8ao5lOkQ0a7WpYG4Vmi6OX14V+nNruNK8zDwoauLld3eDbBlpWdPdSFQXBa8DEVplQBa2VaryqZ6ta6K0u3I91YHJHbGIjBWPSMRxFhRATRzHIPz/QLVgh0B2Ps0WwHrwOo8gsObDRF4vDVJYnQ2dkZXo9f98R5rWkmGp+itq3h1oRQC6xIkznv88x14O4WxmrNswTncqYFuG1bb0unq7rDzOiEKJ87/fMs+7Im5qby/a7f/0Vy25Fy4Z4qjPKPbq+yjzGDduJa/5gY6JEj/KX3VkfK3XA3JO6NXLmw+WcDKgL/XItZVFIJGTvgLVPxMnYd7XOSv6VSns8QnMdOM4Fn9w+gOkyORgjcgpYzpn1U5uqTXrGQgm9PPYa3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4744005)(2906002)(4326008)(8676002)(8936002)(5660300002)(38100700002)(86362001)(38350700005)(41300700001)(36756003)(2616005)(6512007)(26005)(52116002)(6506007)(83380400001)(478600001)(66556008)(66946007)(66476007)(6916009)(316002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JwsYedNYMCyroSdzkTYQsBSDyJ3RgSGdQXd92kQqamW54YcxlzfRzPSST8kY?=
 =?us-ascii?Q?zuSULLtDaFCgQriTa1MbVwdwSFuOVlb3VJM/VVUhYGjLi1cRgv+CTHvqHyAC?=
 =?us-ascii?Q?5m/Ym+s0TGU3g27tyUuC0DacXeNhPaeZE7/KKDhHaD+1RIJOyzcQy8gu+fTk?=
 =?us-ascii?Q?AxWA+F/LqryGwOtfhGoflktKU0av82aEcmDQMCH5POu/K8zUBZ1aXjRN011C?=
 =?us-ascii?Q?7DYcKjB7A+DHj59JvSNHhzZ+B4ENC8/zOAAU6P3ws9x0ix9vmWB9PEV5z0yX?=
 =?us-ascii?Q?aHxPYofvqLpSLb2epvtqS4JvsjzEbvQDXiWnFAwaROb9NGZlPMlEIZ3liuj8?=
 =?us-ascii?Q?uIfhIp7xRwTJu6qpLUAxyciVUcid3QIWMRMf97zrXhE4lHQdscdTBADnkLMA?=
 =?us-ascii?Q?thonw+5NFsET0m4oRggrD0aijxUUhMkNTQy429OsB+xbGuj6CV6uAVqgpPLQ?=
 =?us-ascii?Q?XTdblkVtz4DRYN5KS5JQ2i8OCO8s55XQSVSu7+oj/7Z7KjKhPu+VsmGKueOR?=
 =?us-ascii?Q?Ko/JSpYsvhlY7fLsu/VnKKIHq7h4muvvn8AnIzcc/oefPahXaypD6PvBvLCO?=
 =?us-ascii?Q?fkuDPjRU0ryQnvZk+KkhvC2Wo/nOzsMvEnnSXQ5isORDP1Ef88AwlcpnAUpI?=
 =?us-ascii?Q?N39St8QfXpaEPApOae/KS9lW/k50NQqk6A4aW1E7zWb2qbd82nsL67GathNq?=
 =?us-ascii?Q?AX+jfu7n0o9mjc90LUZBJPm/vnccmjT+qays0qqFQW0D/+vBtYxT1ApMiux7?=
 =?us-ascii?Q?WfTjMKnzxWvspq4TMi+EiHzOhmyebsQ+52qYKSoNyb5cVZWi8/jx96Hblkqo?=
 =?us-ascii?Q?ObUySbLKDgKi7XqZf/AzzaAhdJeRdCo2xg8sLa7FZuWoYmz32dim3cHfWyQl?=
 =?us-ascii?Q?HyGWcxqnAFjjFZFaTId/oXdrS5YILRAlK+xF2spWmwMgE66zZ/gnMzJUCu/5?=
 =?us-ascii?Q?0w53mtpeCudpBYAFetdg1z4PvqjvN2B9TolKstCdtswtpf3cYYWp4w3sz8jW?=
 =?us-ascii?Q?YBITyvbGBfzi7PSqkEmd+Y3BvZCuA0eG5in7D/55je921mF2Wt6O7/I7fR6v?=
 =?us-ascii?Q?BGws6fKVB8/JzUUKha46xKa0sdlCshiM3/h/PQ++xe/inzz77D7fJIJsel7u?=
 =?us-ascii?Q?EVNWDqLTWoUFVFZhxPZCXCuU+D3m1oaQjhQIGrgjdxIXC82iKwBCOOOswO4T?=
 =?us-ascii?Q?jzBjB8qWvYJcYhPZ0A8TZuCCpEjk8AluA9WTTgaNqgUFLabtaWNE+fHGzeaC?=
 =?us-ascii?Q?J9pml0ysg+Obnik26ZzjEmfQE2YnGr6P263pAT5dOAQ50lawGuRdNp9FpDcT?=
 =?us-ascii?Q?9G49BFtCc9x6HufsATzQwbtpXhdY8ilRu5ai1u/g+LIiu65+lgpZrD18Tvvc?=
 =?us-ascii?Q?UKO2CkgpFjmBAR5WCzZThb6oDWorV//rjOO67IwxQdkiTG4MYCfTISXNK2nu?=
 =?us-ascii?Q?Oqw8P13OwScUtYMOM03OOyKacXYpu3rLmkDGQKeBzSlH5PIRdx4ji9xHWVNf?=
 =?us-ascii?Q?Bd3VG5MPXyt177djUji+i5cO6RUsHGBlvdEOLPYJl4EYdUfwKO6DK66NUaTY?=
 =?us-ascii?Q?yG11mpl0G2BtWmugE0PBZtTB+OADrxtLW86OF7Zmo3eVV9qwTXmmFVfBVtgx?=
 =?us-ascii?Q?BWquLts4R5nqIUrSZek04+E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 771ef9e5-6f6f-4b11-5a57-08dbe9823e2e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 04:36:20.2718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /VWRE4meupIicca34oxfzz/+y4jAuDkkO/VDCZMjEepfor6u6jTuqfmqnNCxLS357lGp5ut4sHLYOybY1Bsgzon9B0ZeQ+ivhBlWusdoqVMz/pywnAdR/FPy7Sw4/Ptm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10374
Message-ID-Hash: EC5EFLRK6QFQVPD4KNPXXGAA2GR2JWBP
X-Message-ID-Hash: EC5EFLRK6QFQVPD4KNPXXGAA2GR2JWBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EC5EFLRK6QFQVPD4KNPXXGAA2GR2JWBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Daniel, Mark

> We can specify DAI id using reg property. When dts
> node has only 1 DAI simple-card always assumes that DAI id is 0.
> 
> But this is not correct in the case of SOF for example which adds DAIs
> staticaly (See definition of snd_soc_dai_driver in sound/soc/sof/imx/imx8m.c)
(snip)
> -	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
> +	args.args_count	= (of_graph_get_endpoint_count(node) >= 1);

If my understanding was correct, for example you want to use 2nd DAI
but your DT has only 1 port (thus, it is using reg property) ?

Current simple utils is assuming (1) DT has all DAI settings, (2) having
reg property is option.

But current DT requests reg property.
So maybe it is good time to remove non-reg-property support ?


Thank you for your help !!

Best regards
---
Kuninori Morimoto
