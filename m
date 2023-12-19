Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6D8180DA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 06:12:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45C4FE8A;
	Tue, 19 Dec 2023 06:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45C4FE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702962723;
	bh=RYK3kzypNmsoZpUrVC8QneHyqkwuBEB1ux3ERhAMGoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XzQqSTPtF/E5Uqgy5n3heMFn0sj/z5yWm1NJCRDhVD8CboBa5S7cDT5obma4hxCIE
	 yL3G28ckdx/5JJu4VyEzmBaji/8piVHlO6HlbXl2MwAQsXHNKh6tiawBU3VGNjJhvT
	 9J7mtATfFA8ddfXsgTnMf34xXGCH3+E59/tHyZWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EBC8F805C7; Tue, 19 Dec 2023 06:11:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66533F8060E;
	Tue, 19 Dec 2023 06:11:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73FF8F8057C; Tue, 19 Dec 2023 06:10:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26558F805B4
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 06:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26558F805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=icySnz3O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaqLEzKXDEaec0QdZyGUrrZtxXcNTOAga8UDqub8Vx/spds9c1siNp6QHriSsjy0k6yMUpFgRK1RVPszejaNd6+q54nJIv3RKoMoXhpz6+d5l0pl7abkUi5kFoVmyX5wYh0v+SJcLiZVQZcDMF02aHGg3CgF9tXp87epMR7dXYmTnwF5ZecrQwJMBQU4SGNndzonkKxZ+velly1pXLNmm0ac6tyP7+EqB3jtuJ2IR78jTTtDhvte3yqHdvDl0yAfE0l6pGgWbi2ApqgxPlGl7Sdhwkm82KE2eq35CrnijFy1qtjC9Drkn5fPs1LalvTRff1FaGuVISoHEMAT7f/egA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fH0MleAibr3XRikiAnmDYyZbsqI1mSAuN04fh/k2yQ=;
 b=Z4ZuLBR8axaYna+gVnRLtm7TcCfv7ohyTBR5Se2zCn3i3XQMGxjyrHzJfNScqGppV0xgFBFajwaQSZdc0SJF0dXIPRC9ndXdll2ns3e4AUBxgEU75vN5Y90I7mUCoC/bdoptbeJZ/Pqi/Xva7ZnFe2NJ7+0v3Rb/njENstmNJx1KRJtwne9FsF/Gsx9OHuKbXIA9mksCaPdIZkV83KUJ1qBWXajUP0vhdLtbHb+m0lHIMU3U5LpfpvXfKA+qlxnmlbiSdAboXLiOenWZqD/ywukId6NBr4zcfc6fUC/Ox4P2pE+tQb333Kr7+q+DjB9uI8PH5AfFuV6lxVh9UH2RBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fH0MleAibr3XRikiAnmDYyZbsqI1mSAuN04fh/k2yQ=;
 b=icySnz3Ohe0XrWatZarmbZZDneb4rTDOvY7xb5yYW24ekbBGhExCztAAGwlMBf77t5T90zqWTykVQi114rPQ/mjuQ0j1YECdAp0MzAMif1gRR3zUH87O++yCNqGNrMs1lfP5W/PyxeEz+A5U8fMhglBxRcYp+oYEc2uIqScdFzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11260.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.15; Tue, 19 Dec
 2023 05:10:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 05:10:34 +0000
Message-ID: <871qbi93qu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/5] ASoC: soc.h: don't create dummy Component via
 COMP_DUMMY()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
In-Reply-To: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
References: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Dec 2023 05:10:33 +0000
X-ClientProxiedBy: TYAPR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11260:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cab6098-6215-4710-1879-08dc0050d45e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dEj8TBEJXF7FnmzJaNIqg1ZlRIM3erm7ZQwt9ToqMkJOIO1XLf2D4NQfwq3pT8hejZEY16QQ3+69mMfjjB1g3t9ufOxDsbdSLmfvFdLNzhnUehBxpqQLvqnrNJAb0LUhhkf+jGpGJqUdjE6O1u57zZ4EO+XIvqdCrHrmug4mU04nWAw6L2M6LeCwFvlgKvfk8Pf5IBOG5QU3cyhUk/oZ3nTwHGVUgtYebX2Fq1cdPZHhQnJTiLOZUGPz4GFLKfCLGJ6ZWMnAH4prQKecSOF3LA95ovcbe5ewgwyciUKQ+XK/UWxgI5zvVw9eyky34HwK4TSkAQzEELF/azntUMaVe9rJi+WaoBZV30W0FigYGnHoHJKjg5ljGTbRzAZ0TKGa/6bsHIde+ftFOr8cLY3BIP85Mapk3ujeRvWGcemQkt8IQ+acz6+r5GsJSxNTuDIsMHUKfJpthe5tiEmvx+2WvmQx23XADHFO6qesGYu5NoQUwv9XLLbubhV6GW7CTFl3HLJQp91geZNSXzJPh8vYu1ruDha1gu7gqyeazy3+XH1odoPe/6OhMxs/V6puY80cStXazEN4PMk1ox9LQvyAOKZvPOuBffEAIeCMj6Qj0RIix7UvGc8p088oW5ulH5VmiCzrEA2ui5470pBl0tiieQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(8936002)(4326008)(8676002)(2906002)(6512007)(52116002)(316002)(83380400001)(66476007)(110136005)(66556008)(54906003)(7416002)(66946007)(41300700001)(6506007)(478600001)(2616005)(6486002)(26005)(38100700002)(86362001)(38350700005)(921008)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r4dsCQ4Rgb3DJCil+JDAyxSt0wMaLfV7wwd2+3U4uIFvTHl4UtHZv9tSNEu3?=
 =?us-ascii?Q?fNnOkjxWAa6oYQOv1Ln6g3LU3g4A2UciazqHPOMuGFMmC1STFwmN4oNVgEXV?=
 =?us-ascii?Q?+LaPzXXSOO3p/njc4QmjghwN7CBDWlOPjCETuYoWzlhjdLfrqA6B+mQIdupr?=
 =?us-ascii?Q?fsX6qSBjemdaQcLj3SkQHLk4dBIATK7KLRMXi2WBjz4naacPWNGSZzi3pIkj?=
 =?us-ascii?Q?ZSroABHO2ZSZliy3S4ddT9sJ7i+uxlTvwjO5rRjyeXSm3jzP5nM9VJulkZ3T?=
 =?us-ascii?Q?wezjgf0VPvFR9vnbb3nbFSX3aeoSQhJ9nIk9sqjuAHUWPAxUbBUx0/7RqFgr?=
 =?us-ascii?Q?y2xpWVRRyeR3X+tAYj1NMbw8ciJVswozpUK/w5bpbv/4tmwGfuockw2uZ656?=
 =?us-ascii?Q?KXwbv0qZ3YVcIBFu6gEYGkgCd9nOTrVNzsWghX3Gcojle/+3abzIg8hcC/G2?=
 =?us-ascii?Q?Cubj9vHR8B+tpvrKQLVjyfJLSTEXmHPoUsi5biCj0Mok+rMH72PYHwtyb2sz?=
 =?us-ascii?Q?tcxAyLWwkJNVxUOoTkrnk9yBkL8x054xqFn7rCb6jVSniAGvS9Rvhd5fj6NA?=
 =?us-ascii?Q?TZYtqxY/MJjH/zhjnccXgzQFpGO+iF7Ibrauc9Xji5ndia0x1layVLRPS3eU?=
 =?us-ascii?Q?59z265qdDxz+EA/QAcjA9PwJAH+MTAmXfs2KbFwodda224I4ZXef0oC0j3iK?=
 =?us-ascii?Q?3xvKgP8hS45Ph7FN21X3iQoRkEDA4tx4lNIUKcxlL4yhqYpftJxzTgs2h8d2?=
 =?us-ascii?Q?igND33Iy5DvR1kekgynEKXaBSVoISGs0NL5IJoTQ5RPCCRPyKi9lVbv2+tLT?=
 =?us-ascii?Q?xb6kqKmrHIL9COSDJ/buAM6kMy2Xj8MZmNx1WI97k1B8FIC+l42PHkgRbM3C?=
 =?us-ascii?Q?mP+dH0TfobHNMGwjrA16tSSX2B3k+4Inwx4bPw2Gl1yllTux0BTDNvs/MX6H?=
 =?us-ascii?Q?HJto4DqGilXvdekLUmTxqCZV2oer1zqhkzZR5kz8zXx7cMEw9T9nzL7wTZGZ?=
 =?us-ascii?Q?+HNOPi2qvu93gPbpkA3GJR7YIMQpXzqH7BJzBqSmcbcFccdQfuUEdUo+GF92?=
 =?us-ascii?Q?QOdB16rkwL8cikjj2rB9AQ5hpPOIOZuv8bkhXnWif3J3Y54Bj712100r3ISG?=
 =?us-ascii?Q?xtvrJzpOxeaFaiQFObX1DBdK2iR/4V0jsYm3zAMfULxh7bSGKuc+iCUhxEGM?=
 =?us-ascii?Q?/gK6xtrDV4JqPtCcZV5nnP6f5vdjUcxqGXszThG/eiy9ygwg+oy7+/Imb3Lv?=
 =?us-ascii?Q?o9mNJnkB7MUIRiAOnEtGYZ6NNZkiGNJoB8HbDR05k1xLuF0OlGgdGL6uhCDy?=
 =?us-ascii?Q?cJwaSzvJJFSAXK5AOc3dt6CMfoWSC6cZ6Lbglane5XgXRgGxzWFGCBY1LTL/?=
 =?us-ascii?Q?sHipsE+4HdK9wkau6N8gP6BLCGi+NFlsDLbTRCtscVd6a3kJEESeSihRB40Y?=
 =?us-ascii?Q?Zn8WY2eEW0rtb7YDYSCUJgA1acKvOakR0kmWnR3iZ4Y7EYkcSgkUJfzVKagJ?=
 =?us-ascii?Q?l/YCAfCLM6cgAKPhtw6G88Fdcrw5j2oNjVWk2e/i1A1ZYVZKZ2e7E2t3RNsS?=
 =?us-ascii?Q?0wa3aQz8u+bWulax3VOnJbQbVZeodj2DQ5BiN+dvA4O8JrFaUmnSk+s9oJY/?=
 =?us-ascii?Q?MK5htqcO7ilqmlYHKeGqeeQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1cab6098-6215-4710-1879-08dc0050d45e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 05:10:34.1236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7fgzd3ylOaTJsosXhU9FsrQmM6da8c9AV2QdAAWGwrLKZPmPye+jdxnFrZKQ3dPI3aH+kDeDHk5D7dccQKtMlAl0RYwiqZpnGpqPt5QTZQCw6ei2x1EcX0fCSVjjFJ/P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11260
Message-ID-Hash: 56DUPXLWMGR2WBAAOXO2H5GKMKHB5GHQ
X-Message-ID-Hash: 56DUPXLWMGR2WBAAOXO2H5GKMKHB5GHQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56DUPXLWMGR2WBAAOXO2H5GKMKHB5GHQ/>
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
 sound/soc/soc-core.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

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
index 132946f82a29..f8524b5bfb33 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -576,6 +576,28 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	return NULL;
 }
 
+static void snd_soc_fill_dummy_dai(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
+	/*
+	 * COMP_DUMMY() creates size 0 array on dai_link.
+	 * Fill it as dummy DAI in case of CPU/Codec here.
+	 * Do nothing for Platform.
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
+	}
+}
+
 static void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -2131,6 +2153,8 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	mutex_lock(&client_mutex);
 	snd_soc_card_mutex_lock_root(card);
 
+	snd_soc_fill_dummy_dai(card);
+
 	snd_soc_dapm_init(&card->dapm, card, NULL);
 
 	/* check whether any platform is ignore machine FE and using topology */
-- 
2.25.1

