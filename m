Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92435721B1B
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 01:52:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B802C6C1;
	Mon,  5 Jun 2023 01:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B802C6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685922728;
	bh=y0HUbi3iUxsq6jzfaKcw54nwi4qCDiQFy9mAnv8Z6XQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hWdXeTFjInv9Pi7v8gPOxWeemG3HBDHQxIRoBawxIsgIEBt7409FselVUF5xtBjgO
	 Te5l8mWnXEpKrczFHrpqPJ+xuTPUM9On/07KG9627Y8WCLIHfkwDP3eBcO11EnwyXq
	 iafyXZ/EfriEUhMDhXOZlNRtB/hrufeW7bZFO8IQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EA17F80520; Mon,  5 Jun 2023 01:51:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF00CF8016C;
	Mon,  5 Jun 2023 01:51:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6446DF80199; Mon,  5 Jun 2023 01:49:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DB84F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 01:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DB84F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NQJhuQUn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrj7Zol7SHqZZKx4s7tXbL9bD8f/YcCfHaMXzroN4CgWvKB/TLFPG5boGOBj7LciGYXa03xiKi0oPGqyAPcoKA9fIaWq8tBKxauE6QnaUyA++ZpPzyvtU3tMsiQe+yDND874YCubSSb8z9pWkQmkDqiAuS4CvOUa0bP51MOuivB2BGV8RFQWjNxLOZTvFXxRB3pHl3xlyH+xcqx9g+f/aWVIg6zT/ozPPM9kRrii532JmLkc1XfgOOy9kfqq39AqWSIPAEUfaTyH47tRDzvt4WssSMs9VAw4rUJzJakYCD7Pwx+oyd3zrgQdXk8HhxfZeNF1R9YHZthpCiIJDZIYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qX+t/D89Kuctk2Tptr4p/gT7xRYCbOaVAygYmoWd8TM=;
 b=Rd8xKD++GEeLVwHTcATTKFNUHUf1bfTH1E/q5wQu4wQYCRivo4sBDHKtiB91Iknkqok/8klSSgvmjreJvVOm07KHSD0p/FY2Y9vbjR3s4PPf7D5f3JElD/fJa7UQuyNnD698OXUZJrKWIHb1mFERAhXy+KRe6Pi1fDq0TJjh4K8O6KM+iFCVx8nAFv/DuCg7oO05L+SZsQxiAfW92GdPKfpEbxj8+dvwwNQY7QBJj+rDTcQ1J2+W6q6CYsRnnjRF8B5Wwp6o6a+HS8FcqNCYUhGwrjamwSJt91HYLg8LxiRPnS9x068Yup3lq6et3+2v25nmY1gJNhM1Z4NABR0FQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qX+t/D89Kuctk2Tptr4p/gT7xRYCbOaVAygYmoWd8TM=;
 b=NQJhuQUnEv4Gc3aL6Rt4wGQC7U/rTrXNaurlQfCWlLYz6ZeGgJvTcXJaOtMls/+uWZWMWzy+Iig1ItJIxqS5Ezzdo0Kt5QkFv3GcjbnNjwfNaSz8xJlcSuqrrEnTDvE3zE9cbx5a3iP7ZUUvASazz3pNBwt93dLVnErlD7tz0SY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8743.jpnprd01.prod.outlook.com (2603:1096:400:169::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Sun, 4 Jun
 2023 23:49:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Sun, 4 Jun 2023
 23:49:38 +0000
Date: Mon, 05 Jun 2023 08:49:33 +0900
Message-ID: <877csiiy9e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1?=
 =?ISO-8859-2?Q?ski=22?= <amadeuszx.slawinski@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/21] ASoC: replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <ba2d6ec7-6337-d6e5-cc11-9f0c4f17df3c@linux.intel.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
	<ff4586eb-4363-2592-97f7-d2fa8bbdee8a@linux.intel.com>
	<875y8fx5fy.wl-kuninori.morimoto.gx@renesas.com>
	<87mt1ihhm3.wl-kuninori.morimoto.gx@renesas.com>
	<ba2d6ec7-6337-d6e5-cc11-9f0c4f17df3c@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 983a91e8-1665-4ba8-2c75-08db65565bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fJ9rNr2HE1mggzz1wHHJoWMTe/I+kSnKRCnhZLGzyLzeT9ArxOO87N6WkjbQu1EkwakvKN0EmG5ps1D8pX70OGIgNwo6mPZMmaPfmJrsnox1lhRb2gmc5vL5GyiphlTsGTsC1C5QtVOs2WvcZZTDLfyijncFcL15Ka1Vb9t4FtR+i4QoOuez+GA9zRYYsxe1tdzHO5KFPhP21CbffUB2rREB2IFD7gzH1fejUdnt8Ln7TnzH1DmTxm4rs6NXOkA8YWbU1RVY7JiXuLWgz8JRQMR4JtunoN/2+CZAQhSIhJJbKg8HWbfaH+lgYTjEN0fOvNjBkBNYO95L/vTFfL3Rh3sNnzfXuIyeHIUwgZC5QPUIIdnoEh9LIcHU/eZdKx+vMpiRC9fdQd9UEqVZgpK/83YdeYkKz8gZfRMN151uN3dIkJVnie6Nbpzfs9yLgFU8kuOb6LkvoKW6C/BSX09/CK7kQCrPL/R6lbmOdFtNiD7HQt8/X9woX8Ii85nOJzPlOt9Uz6ZqiYNQamWFXgM7ESaEfBUa5zs50RtaUfp+aebZ3pfh4Z6hdgqeUQtojLap6EANBQlcP0q0K9bNVpFqff967gPVWocr3N++qydBCQM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199021)(26005)(6512007)(2616005)(6506007)(38100700002)(83380400001)(41300700001)(38350700002)(52116002)(6486002)(6666004)(186003)(966005)(478600001)(54906003)(4326008)(66476007)(66556008)(6916009)(66946007)(316002)(5660300002)(8936002)(8676002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?38YZ3hCUz9mNhMwcwBqxt1LJBF+dVV2dMdKEBKAUMaZhN0SU8WOk4zl1ivSn?=
 =?us-ascii?Q?100M/F5DYO759gjBNHUfT+SyaBuJMWViznuh887J5JLsE9v2YkgyGAgKgYN0?=
 =?us-ascii?Q?UnKgVPtGHFWlU1rBDw1bHKioNB8hsIO20Hn/EQaLwt/4zvPQ1eFvzIzV8Fjl?=
 =?us-ascii?Q?3SaU5oxaT3WMcGHGJoEdXJ5dUg6qTdCLhBKkVvs1JPmjydyTVRhT7odhvtif?=
 =?us-ascii?Q?IdhXevqyMqB8YUGuVusroulVevPPlnjGcTMWulzjX5aF/P2pJ9Tvp8uK9RUo?=
 =?us-ascii?Q?ZQ4zkF4/aAVNVGMWVgxbu7Mln7J69QqS3UhjZGKJf6yznitorORejg+dLtz6?=
 =?us-ascii?Q?jTRHBILuPQaEk3twkFn/TC3VeWrKEn1vzXi8+ok9I3hTv6KyWbzCjczxELyJ?=
 =?us-ascii?Q?mU6mfiozbx60dxnleG0OrCdEXV1YOb3UvV1drYu/aRRvXIpvOk8YWvftBjgd?=
 =?us-ascii?Q?pLoYw8XyyEuUuqYWrmaWythWy2iycYmtuiYCWHIdK9xuhfx0UksEFge0cBRU?=
 =?us-ascii?Q?Rsy6eE2Vydyziww55CjLYPpvsStdb42Syqd5qr2kwY7esnY/eKRfvNrEwWaf?=
 =?us-ascii?Q?qHe95tDL4OXx/1D1vbXCs/XxC2VX1p1yCw14CqpbErGBsKnoANSMaXvMb2OE?=
 =?us-ascii?Q?ECy5REaVIIU890NS7NjxhsKc6nxf1Bk6G8aeucWRz0Lt4EiF18/Zkvykv3KB?=
 =?us-ascii?Q?+hWXCYAcbQR0OMxbVrjrl5javCZ2MATe4P5gCl2zQjBm1AvGiQgJ3djALxpB?=
 =?us-ascii?Q?cPN/UBnLamRKkxIvB759ZgfOQ14zjb20u4hCTe68pSnmn1dWbNcY6ZpC7qdS?=
 =?us-ascii?Q?YaIzMy/QivloV83p3vnWFRyvHvgaPcjflls9GvZvGMqXdFRyO7aP1Lb6mKOv?=
 =?us-ascii?Q?jrkzM9LZfaoG0SoDhlDn6x5EtCtyK5Yo9q0X0t1WdCjcSoZiUFdM0IqHZVFr?=
 =?us-ascii?Q?jChvkVE9Sq5qjMGkxgZ2oxru3Pt+I90eimqIslfjmunvSUkDFNsDROfLjnoV?=
 =?us-ascii?Q?kEzDWX+h5QLnb0kxsEP8Qc0nLS+VtqhUYrDHeIX9+4IOtJfMAf+TjzOKHpm8?=
 =?us-ascii?Q?mLdLOxPpAjpPRyYpqpE6MHFJ50sU+VcFudcVpgodgfj4e0PxoKnOtlcW6SIg?=
 =?us-ascii?Q?UX7QmxkmXE0SttLaqjioXn7hGK2wAEH6jHC6mTLqxN3rnj3DaZjvoOdUV2Sf?=
 =?us-ascii?Q?bwQ2zU4SRI1BKw8OhK3RzQF1SGFmrDEerGhVXrDrjoC/g/j94Hm4z6KXmJyr?=
 =?us-ascii?Q?CTHuztxxBRr+8BqaytuLMJUnCHR6c8ZjHqswyaXbG5UHAV/mi3dNFi5XhhAN?=
 =?us-ascii?Q?I/k2FMLCbzPMmebcIJ+UUoU1uizPSBZzgaCq1v8BMy7Gsshg7YU3vtVGKELc?=
 =?us-ascii?Q?Dwrx2r5OSkHOvv12bNMNG8y2l62OlekddnYE7dvvwMbjnC3vJktS7f64888O?=
 =?us-ascii?Q?a8cyX3W8FcaupW/Y7Fdy7sL3bS+UzxRidEpMv3FPjsTHJiZFDk+qGr/Z88c6?=
 =?us-ascii?Q?Co07G4UrihQ1BLh614ZCwa3Wn+mEdrw/g4eXpTAloST9uDwbK+/l2EA0qNa4?=
 =?us-ascii?Q?TfhzTHb6dzux6q23MA3qJJbboK/oWnD+osJmKPaqfdQCBS6zH6bGOwh9xRPY?=
 =?us-ascii?Q?Ll1cgwTc2KyI/5r1KLiDZGg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 983a91e8-1665-4ba8-2c75-08db65565bfe
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2023 23:49:38.9314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bYhuL9d0P4OqkLTI+O1R+taS6KM10WCV3JfKQCPjVvk98XB6a1q/ZCf9LAaE/eF5b05r07NTuB6kylXySKyo+SBqTMLudZ3IoCfp4AzU66JV3yTB00eIyULo5Ij1RNHo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8743
Message-ID-Hash: PO5IRQ2RTIBBYF6XOABACSCHCDPI6RLJ
X-Message-ID-Hash: PO5IRQ2RTIBBYF6XOABACSCHCDPI6RLJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PO5IRQ2RTIBBYF6XOABACSCHCDPI6RLJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis
Cc Amadeusz

Thank you for your feedback

> > In case of CPU:Codec = 1:N, and if its validation were
> > 
> > 	CPU   : OK
> > 
> > 	Codec : OK
> > 	Codec : NG
> > 	...
> > 
> > Current soc_get_playback_capture() will have has_playback/capture = 1
> > evan though one of Codec was NG.
> > I think it should be error, but am I right ?
> 
> Indeed, we should only enable playback (resp. capture) when all codec
> dais have the same settings. We should revert the logic here IMHO to go
> from 'at least one' to 'all'.

Thank you !
The code can be more cleanup if my understanding was correct.

As my v1 patch-set and Amadeusz revealed, DPCM BE Codec has been not checked,
and Intel drivers rely on it [1].
But it seems it is using complex driver style, and also I can't test
it, because I can't access to it.

[1] https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com

I'm happy if Intel drivers are updated around it.
(Add missing .channels_min or update snd_soc_dai_stream_valid() (?))

I will post remaining patch-set first, thus it is not rush,
and of course not mandatory though


Thank you for your help !!

Best regards
---
Kuninori Morimoto
