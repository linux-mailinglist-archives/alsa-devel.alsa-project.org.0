Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681C8029EE
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 02:36:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3FF6868;
	Mon,  4 Dec 2023 02:35:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3FF6868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701653759;
	bh=ssyDM8plDkrIOiv3T7w4Y2tVhEBCWW8phJuPtsagJIU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lm8xMwxNt2pnNYl25Wn8pYe/AUUGwr5u2nNiDrGdFpQiwondj4enQ9+jmv82Vn4ZC
	 cBbJfsPYoQXiD3UL6hDPlDomzINdJD27cRT3gHqAhiEuTwwuo/cFJOFk+rOiWKPIax
	 SZUb6Qh0bV7KCjxp1JU6mi9ot+EJPk7HvndGrYw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F13AF80633; Mon,  4 Dec 2023 02:34:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EA0F80563;
	Mon,  4 Dec 2023 02:34:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C70BEF8024E; Mon,  4 Dec 2023 02:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3220EF800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 02:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3220EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Txc/IC54
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEiVFglfomzVwNT24xyWpXWAYeMpCWXadugLOlGiheON0s+GlIc3Ta5RhfnYE+rYezlYwi3MvOoZlfUhzR8CXCYDNkEei5AcRk0CuVQN0L7BtOLHrQdmzz5c0KMqYsVmvJV8/6YKAyHLHY6ojPSuYtIowDYpzWt0GtoUHbtntYM8Rz8FlSOqop4Ug0ZEiqNs5dahrYwsphVaWO2vB/4zAiSkrZ2mCAjk9ZMrsN6920qZwfjngyYT69+5UeJm19UXYa7VqyEQUgmq8LVnmm2/V5Qxa/5zKmws5xBPfwGKCQWDfqZK9iC4rO6UkCpjEFLVkkNtKrnQNq9Y0mdRxdjuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBLZ/+3ugUWdXTtPiy9GPGZP5N+1GyR1QSbAhrKZi3A=;
 b=gBaCTYhubrJxWS8m1M6jv1nIc6zlbZEyjql45hM0SetdMvH8F0yMakI9rl0f+S1rpQJioxkRZBPJxhPyj/UPLDqdPLJdomHUb6p6knBUtm4KFpASWH0sfevVtqzTw3hOhJDUNlckAxc/gBc5GXDf3WU4Q3AxA/WRnTJpJsqBZfEzOOcLpOy87fIyQrt+ffi9kIQN5PmAb6+14fFu/RyzMSvlfXwrI4AgOOmu6gmme9S7ytkURnMaKAy4JaYiZs+urBxNZrnuGPh+yn1+GDxxF8I4qPFsVzrHfzyhvjgvMBbOb/4jgpNZejNLDPmohh32smwhm2jBNZ83JpzSbXKJHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBLZ/+3ugUWdXTtPiy9GPGZP5N+1GyR1QSbAhrKZi3A=;
 b=Txc/IC54s4AyYpWxdu6+6dI+nqvgpJRjBpUEc/+kAcFTEnRXzKqmGATznUVNarCLU6cFGEBf9mIb042P7kejaNyNwe/ZOt/ZNe/cCMdyyfKn/vuWBFFi/e8cq4/eOGFY21OkF6e7nPQF3cKfGq0PYke3X0Kri2MjclTmOb45lN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11282.jpnprd01.prod.outlook.com
 (2603:1096:400:3d0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 01:31:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 01:31:55 +0000
Message-ID: <87bkb6bvn9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
References: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/5] ASoC: soc.h: don't create dummy Component via
 COMP_DUMMY()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 4 Dec 2023 01:31:55 +0000
X-ClientProxiedBy: TYCPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:1::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11282:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0939e3-ca56-4dbb-7a1b-08dbf468ccae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5PEyA3FbAalMcaEjVEEUQhdxyY/ID/D3GhKfy9woIz8fDDvR1hRWWBovMNGgVMqapAHlgvbq1Bq3+uZ92pNgKYD6RZocv09sis4MguHl0tPEPBBDRquEGxEWYXbdW179IvgrvEIcgMKP5ezMnQeF8uG88kwLgOEy0XtCYKlydKb5v9LBSEJKetulVKj83+PXABujUsoulsWJoS4u4Wo1XtB8ljtsp+HFMvja1F4Qc4NnlASN7rnftp2cWCgfUt6LUg62N1XFz3pUVsXSUFYZGtakWUJXKTCSsOxAWkL1D4iL0qZeoTVk+vCDa3GWsiNXG+JjTC3GmTOEIeh9F2uf3J4fjFG7ivp4t8w60zOejXrrKXan6puAw7SmINPKQQJkj4i5skfAvRrUO3uOlxIkE7di5R1oH6IMjP7dM/vXZxL0Sxbjqtzw3Df0NBeM7O8+SRurh28wk2+sHwxWjeEw1H7IqEjv7VoJU/oBetmk2OVze/RVsl4K0qydBjcWer2wwvsRaN6kfoQOSkF3m67FUSEzekZ9+Exhb/D8fKZxi038WvmPIV4xGJRCpiFcTrd1IxTlecwZFmfl5CyKVjWBIBhjQuMR/YOE1uzdsyjTmAWpx2oZMXhTL00kyuLXWElU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(6506007)(478600001)(6486002)(4326008)(8676002)(8936002)(86362001)(5660300002)(66476007)(66556008)(316002)(66946007)(110136005)(83380400001)(26005)(36756003)(41300700001)(38100700002)(2616005)(6512007)(52116002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a7qZAgWDwkGnTTFl3CMQwEfS22z4oe5Ah58CIiyXXd/a2js93LILL770dSCQ?=
 =?us-ascii?Q?5WaaOijYCIdAwJF7vhto1IkudDi9RhAIw28bI/crI2fhrqhLJPxnlbZpiOms?=
 =?us-ascii?Q?abEGSKQwXA4tECm/wettd6o1hF4cVNhic9XEdqouZE6rDFIIHDe3R/Y+l2qA?=
 =?us-ascii?Q?/4XgDKA4q57uKSLiO7mClhhWVOENQPiTKTtIyhHLuX1ngCNkc5BaFlw4cBKu?=
 =?us-ascii?Q?/tR2lsckK37SyngVBiyOTy0uh1VAadYuzee/GE70us/k+Efv9tBdVBvrLXy8?=
 =?us-ascii?Q?3+cYOIbXAE6VnpmmH2n7N62ttiYnVlrGXKerXSADqxmfwTw0LT7E/niAmfQj?=
 =?us-ascii?Q?oddBztpb4HB3tai4uOLxvPQVR1J/l+brnGHc+f2EONSUYHmyheMR+E1Hjr4s?=
 =?us-ascii?Q?4JNALidJOyD/LC+JQjMBhYjEhuOKFSgvJZ/6U5ykFC0ezC6emtCRtmx5v6ta?=
 =?us-ascii?Q?nRVw66p6mQ1DDnlLWth2Mx4oA2AyZQY0bBlgy9frHKsUs9fgBMA3f68xft01?=
 =?us-ascii?Q?oSUz2QPhZl+zVllLQq433sYI7vgnwLGWHZA8OcOF7TwCqHmClkaPi/DXK31I?=
 =?us-ascii?Q?UzR4bkuaAsQ2zTkx+2l156/jYe9fpIk0VTucTbo16VHvxiZO+rpdp5fkCbGg?=
 =?us-ascii?Q?iwe34GoF4KOpVGashaBBF3I/nPPssH0tOSwuD8ucXafLaBL8SLqWrZ/djWuM?=
 =?us-ascii?Q?6zz4YL3GEZNmibfhjn2XoKeVrwafW7ok2xlsF8Ul4mUbvC0MS2aTQzia4t6g?=
 =?us-ascii?Q?M7lEK4PTSOyZjEsdgwcfpaeWDwu3GORSIe6HG+uhrtOTU9/Xl6I3kZ7M0zvD?=
 =?us-ascii?Q?zkSuEyUvyVSbLZBM+V3+c1jcdAYwnP1mAStym17v/HK7oJ+qTod2gZjddwxz?=
 =?us-ascii?Q?oYOUTAg8cYUFJg5wtrLBE5ljIlsZphfzl5562LMTBJD3B6mVwuu5yiU19AET?=
 =?us-ascii?Q?ki/FwQCi9Xp/eEG++fUNCtmRew/D2FrR9sRUMXZqaf4N59wSV9lVwHZSL0ae?=
 =?us-ascii?Q?CL8O29NyEVhb+XiRZA/SmBbHo+SyNg4V8X4A49QF81JpxawCje1lHGJG9yxQ?=
 =?us-ascii?Q?KQoa48Ujv4SgmkY3ARjcxbYht8vP+s1GMyFKF0wfw4hnkQ7IZ6F1+kKFYIpb?=
 =?us-ascii?Q?rSqIQOkfGsZbnwsnwZX/BUT3B2CUnPbt9jaOZ+DRDkIarhlt+OJsJsC16Rih?=
 =?us-ascii?Q?vs1nTHEascvELv0XZb6J/2h8dbgwiK+7j2yquLNm0z4XaXqsKq5ME5bDgW/L?=
 =?us-ascii?Q?Oml/rIc1BxYRdJKd1N1suI7tF+T3wLU84kqOhgSvkDZ8wu9iZJYTUCOm9K8t?=
 =?us-ascii?Q?XqpQQdMxMHT5d8LGwLIY10uqXLQsDBEmTz9kZWWLPVDpmI89VQvdNOGw6WD6?=
 =?us-ascii?Q?9lAmo2LCyXwKfwRuxu/GfUYi6HnlS+hBKVASXm6OB847qVGR7e6ICWArKrMi?=
 =?us-ascii?Q?JzlwGAJASQFg1Qayz22D98D8WeEuW4wOFHCJjnaTRgxLveAP0JEtnDRnMBlm?=
 =?us-ascii?Q?/v/nMjwbui11hqJrZKQpyO7XUmQOQXBiSh4jYq89hw2JZZJj/3dgZF5c9J3w?=
 =?us-ascii?Q?XEmBh/eqxWwZ4I33pxgYraUEqOcUNbf/HInZoFubmKN4rzBGEovMjyAvLInc?=
 =?us-ascii?Q?Gfzb71cf2Fvnqe+MuQ3709o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f0939e3-ca56-4dbb-7a1b-08dbf468ccae
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 01:31:55.2059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SnIMJz9jpZ29TrGPjpvjhse/9HEoLP88V8ZVJV+R7W59oSkN+mVYgDJeqrT9igsqY++y/ULPNZ1I7Ox2hD1sxKJy0SipDzr+RAi3f4m6J2l5/SRpMUsonCXWdT1FJZ0q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11282
Message-ID-Hash: FZWYYJHAKRILNW7ZAHIXTRJUZSR5TFES
X-Message-ID-Hash: FZWYYJHAKRILNW7ZAHIXTRJUZSR5TFES
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZWYYJHAKRILNW7ZAHIXTRJUZSR5TFES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many ASoC drivers define CPU/Codec/Platform dai_link by below macro.

	SND_SOC_DAILINK_DEFS(link,
(A)		     DAILINK_COMP_ARRAY(COMP_CPU("cpu_dai")),
(B)		     DAILINK_COMP_ARRAY(COMP_CODEC("codec", "dai1"),
(B)					COMP_CODEC("codec", "dai2")),
(C)		     DAILINK_COMP_ARRAY(COMP_EMPTY()));

In this case, this macro will be converted to like below

	[o] = static struct snd_soc_dai_link_component

(A)	[o] link_cpus[]      = {{ .dai_name = "cpu_dai" }};
(B)	[o] link_codecs[]    = {{ .dai_name = "dai1", .name = "codec" },
				{ .dai_name = "dai2", .name = "codec" }}
(C)	[o] link_platforms[] = {{ }};

CPU and Codec info will be filled by COMP_CPU() / COMP_CODEC (= A,B),
and Platform will have empty data by COMP_EMPTY() (= C) in this case.

Platform empty info will be filled when driver probe()
(most of case, CPU info will be copied to use soc-generic-dmaengine-pcm).

For example in case of DPCM FE/BE, it will be like below.
Codec will be dummy Component / DAI in this case (X).

	SND_SOC_DAILINK_DEFS(link,
		     DAILINK_COMP_ARRAY(COMP_CPU(...)),
(X)		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
		     DAILINK_COMP_ARRAY(COMP_EMPTY()));

(X) part will converted like below

	[o] link_codecs[]    = {{ .name = "snd-soc-dummy",
				  .dai_name = "snd-soc-dummy-dai", }}

Even though we already have common asoc_dummy_dlc for dummy
Component / DAI, this macro will re-create new dummy dlc.
Some drivers defines many dai_link info via SND_SOC_DAILINK_DEFS(),
this means many dummy dlc also will be re-created. This is waste of
memory.

If we can use existing common asoc_dummy_dlc at (X),
we can avoid to re-creating dummy dlc, then, we can save the memory.

At that time, we want to keep existing code as much as possible, because
too many drivers are using this macro. But because of its original style,
using common asoc_dummy_dlc from it is very difficult or impossible.

So let's change the mind. The macro is used like below

	SND_SOC_DAILINK_DEFS(link,
		     DAILINK_COMP_ARRAY(COMP_CPU(...)),
(x)		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
		     DAILINK_COMP_ARRAY(COMP_EMPTY()));

	static struct snd_soc_dai_link dai_links[] = {
	{
		.name = ...,
		.stream_name = ...,
(y)		SND_SOC_DAILINK_REG(link),
	},

(y) part will be like below

        static struct snd_soc_dai_link dai_links[] = {
        {
                .name = ...,
                .stream_name = ...,
 ^		...
 |		.codecs		= link_codecs,
(y)		.num_codecs	= ARRAY_SIZE(link_codecs),
 v		...
	}

This patch try to use trick on COMP_DUMMY()

-	#define COMP_DUMMY()	{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
+	#define COMP_DUMMY()

By this tric, (x) part will be like below.

before
	[o] link_codecs[] = {{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }}
after
	[o] link_codecs[] = { };

This is same as below

	[o] link_codecs[0];

This means it has pointer (link_codecs), but the array size is 0.
(y) part will be like below.

	static struct snd_soc_dai_link dai_links[] = {
	{
		...
		.codecs		= link_codecs,
		.num_codecs	= 0,
		...
	},

This is very special settings that normal use usually not do,
but new macro do.
We can find this special settings on soc-core.c and fill it as
"dummy DAI" (= asoc_dummy_dlc). By this tric, we can avoid to re-create
dummy dlc and save the memory.

This patch add tric at COMP_DUMMY() and add snd_soc_fill_dummy_dai()
to fill dummy DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  2 +-
 sound/soc/soc-core.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f3803c2dc349..7cbe85ca040d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -938,7 +938,7 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 #define COMP_PLATFORM(_name)		{ .name = _name }
 #define COMP_AUX(_name)			{ .name = _name }
 #define COMP_CODEC_CONF(_name)		{ .name = _name }
-#define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
+#define COMP_DUMMY()			/* see snd_soc_fill_dummy_dai() */
 
 extern struct snd_soc_dai_link_component null_dailink_component[0];
 extern struct snd_soc_dai_link_component snd_soc_dummy_dlc;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 132946f82a29..88de4c5a376f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -576,6 +576,34 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	return NULL;
 }
 
+static void snd_soc_fill_dummy_dai(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
+	/*
+	 * COMP_DUMMY() creates size 0 array for CPU/Codec on dai_link.
+	 * This function fill it as dummy DAI.
+	 *
+	 * size = 0, but has pointer means created by COMP_DUMMY()
+	 */
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->num_cpus == 0 && dai_link->cpus) {
+			dai_link->num_cpus	= 1;
+			dai_link->cpus		= &snd_soc_dummy_dlc;
+		}
+		if (dai_link->num_codecs == 0 && dai_link->codecs) {
+			dai_link->num_codecs	= 1;
+			dai_link->codecs	= &snd_soc_dummy_dlc;
+		}
+		if (dai_link->num_platforms == 0 && dai_link->platforms) {
+			dev_warn(card->dev, "platform don't need dummy Component/DAI\n");
+			dai_link->num_platforms	= 0;
+			dai_link->platforms	= NULL;
+		}
+	}
+}
+
 static void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -2131,6 +2159,8 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	mutex_lock(&client_mutex);
 	snd_soc_card_mutex_lock_root(card);
 
+	snd_soc_fill_dummy_dai(card);
+
 	snd_soc_dapm_init(&card->dapm, card, NULL);
 
 	/* check whether any platform is ignore machine FE and using topology */
-- 
2.25.1

