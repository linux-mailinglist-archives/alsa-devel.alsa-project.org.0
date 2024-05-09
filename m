Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2598C1A0C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 01:43:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D114F14E6;
	Fri, 10 May 2024 01:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D114F14E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715298212;
	bh=T47luIg5Me3IEbBpwOBn3y3w1Q3bW3fBVMWnEhOXYFw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ULE+/xTbRS3AGwy9H+lTsOr6vKKu1ReOMemZMwalGKpvzdRiaJK+x4OHVakMgt/1X
	 WCuWaumruEKPEM2+3DOqTlKV2RD8utlazRwVTnseY0zPcNaeIne1b92wKMZ1xE1l9C
	 UfdA7vpGFegL+TmfA+Oage0SLrAjrDNyGmaFAlIY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39569F80580; Fri, 10 May 2024 01:42:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 804F7F805A1;
	Fri, 10 May 2024 01:42:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF03FF8049C; Fri, 10 May 2024 01:42:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A97CF8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 01:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A97CF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MoaQmslv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu7fmoRB7FfEBMIbRmnCtiEpJXccmZ7sN/xvmj/onDrfqJIp8+iRENSYeJWod8Kqcg28OXzlDT0Bqi/foKp3CSpYKMIhGB3hyWtgs0ZyboxnLSsnHxr0ej5UkQ/hjg7v/ERNbD1SwC2P/nFJCQrbo03LsDxoTkuqiwkXdEybHmxBaQdnr9JAcM0BCYc6GnV1yfy5TZadBqak1N1JczJK+4yl3C7O/zrQn2ZtSZH62iATGUPutKTtd7vbyD0hN2D77tlizU5aNo+sAdDqniYGvjTaJO90odieNN1uk2P0K5+qSIy14BNKJmE0HWCPYy6Za2UU2pBrHj6Zyh9s1Us0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57bbOVFVgwVM/vbmVWpJuyjxlPuf7GVqyf5s81UWpvM=;
 b=k1cICag2YaHqM2SKKfEH2E7y2lVcf8dNFMUTQTUwB1VjzhAiCyDmoTdU6+DahjdhA/pFluBxPMdsljVsNvzfzsApg45JiXW24Hz4InReska4A+u3vfzdX+t5ZGnGBalM9kGWL70O8QR2xpppCBRhg78TN3zyys2W9qBq+ErI7hgmgvWcROAzx8+C2bKBsFeWhOTFZkiBXZrA6q94Cr1emNhHgiYsHnp6N0vwDyQ6HkJZzaUlCPaVnscUJwKEy/mUI46MTlHjo8KKw70wm/8e6RjW1IHD67XTPAxmCN1O3GPITXhn/jChXAPfLqn4FNtIa4JJ4NnboTMtZMFqbZ2sDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57bbOVFVgwVM/vbmVWpJuyjxlPuf7GVqyf5s81UWpvM=;
 b=MoaQmslvLKZai9JSBFOKXb7f9mrVY4ca27UzDfGbVYiWH2LA2saiCc448kdg/lEABOIYTHNc/6lOz8Y0qZuvvuU0BrFfAOXtms1WO1Yk0d3c1vqjgn1whvHMURrqXPEZcf/spu5Xpzm+UeQ/HTddAOa3EOqG6o14JrMC6H6JfGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10536.jpnprd01.prod.outlook.com
 (2603:1096:400:29f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Thu, 9 May
 2024 23:42:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 23:42:32 +0000
Message-ID: <878r0ir1qw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
  Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jiawei Wang <me@jwang.link>,	Jonathan  Corbet <corbet@lwn.net>,	Kai
 Vehmanen <kai.vehmanen@linux.intel.com>,	Kevin Hilman
 <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown
 <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,	Matthias
 Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: grace time for DPCM cleanup
In-Reply-To: <1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
	<1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
	<87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
	<87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
	<1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 May 2024 23:42:32 +0000
X-ClientProxiedBy: TYCP301CA0004.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10536:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd00c29-5ae0-4fe7-1e75-08dc7081b22e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|1800799015|52116005|7416005|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+YlYPhQceo/QwGe8mhK06PfMP7hexv/pPbfOowGyiEsrP90kltPfOPt/N1j5?=
 =?us-ascii?Q?6jVmiOHzxgr/H197E9XIcrmar62o5gJbyXrydhGpeVGuYd353bh47svvqkU2?=
 =?us-ascii?Q?do9kMk3kzwoV8Um+/v3maEZVFeZ8HStGivLyEkS2kS54efpgV2B31UxrPqeO?=
 =?us-ascii?Q?k2kUKv3y8Opl7nNYiUDIrcK+45ZU6h4cfn5ZcRHzXVmVZiIFjIIqcQqORsXy?=
 =?us-ascii?Q?aEIM5pW6p1R2qLtGRFNrtp4YiTQ4xoAnXvXtCd4elDIGwIgEIBfachl0VPZe?=
 =?us-ascii?Q?r91ky6AzX/7wv8acKSeFsTKTvATBgwqdCjgumy5i61k2K/mP1lzCnGhx3nUD?=
 =?us-ascii?Q?N/qyfD4Br9YjOs2XLsunqxfdswgrZ8yyQWb3iUyOwczZ/Zz06l8+3h+kLP3l?=
 =?us-ascii?Q?RvIcLv9QHWjkinybMykfhbyxba0JG5I1AznVyeM3E3jnY/zeKVdWM+Wg0yQO?=
 =?us-ascii?Q?DrDK/bp6ejaLL9TY5mgwkXvAt0TOfJAf9/EaiSf+UWh5l5+u9IVdQeXQxSpJ?=
 =?us-ascii?Q?ynFbHFpJMR4d/ESRyDgCqeBrSCTgotRQ2Mwc47jGOCuhc4/i9+G3cAATkQNQ?=
 =?us-ascii?Q?W1KUAeQmz6naIKS7fjgCFVW2Y4z1rSq9Bua2QkrbA6Aul5E8YUNWsvmjEO30?=
 =?us-ascii?Q?w4WL6lFpriJzsXhJqJDO8aPihIA/kjTpMG2vnQSbdMODEAimWv6jD0gmrYDv?=
 =?us-ascii?Q?7nOMxqNzygwgdWLfQNOGuSUQVVxd2G/YR+/79ebre2JcrGZgw/WC0UJ6/drJ?=
 =?us-ascii?Q?Mgx8IQFbMyHqoMTIk4VvaoK6T3Pu8qC5QOj9n75pSJuBUqXKGzKPuX6FJwsW?=
 =?us-ascii?Q?Wh2DdDmVy7S6SjvVmZChjIc2y9/SKMCwhzmAKYzb0emkyzq6w8yS+ARQamDQ?=
 =?us-ascii?Q?pNxkH9LqQEPIy/LaQX09r/ZBhrRq9gKbhzXHNWfvRWA2d/p/MFwE6xbca1ik?=
 =?us-ascii?Q?4BEAks2r4+21tgndIus9bxpbyTZoD9APj4IFmHGXHRlbJHLQp45ViochLHdJ?=
 =?us-ascii?Q?0cwwO7i1zvKrri1bAXXF5+Q4/0/mLbFE21LpGqIJMdGshdGyY0ihq3iqYOUF?=
 =?us-ascii?Q?/dIQoMfLFmVUtSFPD6l1OsOtK4qEg2MkKxvHv6Corvg02ccFGXqDQP95CAwZ?=
 =?us-ascii?Q?bZgtc30G/tVoTHZsBkj0mHWamcaacI/wQ4XodTVr91XKwOXthLsnfRNGZ2+2?=
 =?us-ascii?Q?bqkdTUjaqX4KqWGQl0s8PKkJ+DEG+Cj71RS/0fuf3K+MduiDU4SAUHqQbKME?=
 =?us-ascii?Q?d0AKQGKde584TzhndZfPstdjSAh4lLstRRm54z0BjA/xkQckXRj6GrtR2hlK?=
 =?us-ascii?Q?13JoW3ISctcbW8MukQt6kQqlBK/15FPLG18gPF+VHvpz1g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(7416005)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lm3HTcLO+otOf+HvLNH8a0tf3doH6BFV+9uOYg4x9KC/HnAJD6F4uUNWF+GP?=
 =?us-ascii?Q?OGlQZvwvT0fzEnJ5i5D7mDBMGl58OfO9YSlXuvqCunVWu0NBi+fzgLLkstF3?=
 =?us-ascii?Q?9SAnAUTSKUcL07J82jvA4tGZiefKhONzb2YkXKgUTjRn72pQ8sBs1bdO4fv7?=
 =?us-ascii?Q?D09G6bqXSWCtoPCSOFE05PftyRFF2w73IwNjBYCklhYKv+U9+fTj085+9uYM?=
 =?us-ascii?Q?gstufesYgeFFoPBdyK7Wj53DbP9j1UoPSDiTws+85Cd8mQvuX8NjdG1W43mq?=
 =?us-ascii?Q?mMZntwqjkimcDC3UuAwzxMdi3/AdWtQVLBBE2FUWKvgtjlG8rWpY/YzpEumh?=
 =?us-ascii?Q?PMuYs5Lsz6sGrH8M6NXfhlgXOcWbgYuxnN0YH/vyyYlkyweQu6HKVxKIlEnr?=
 =?us-ascii?Q?AchsDnRUne0tZ82dnQWWpwZ59Pc3uWJZu+aMKctzq/KOjZQ5aZA6xyN7dWuh?=
 =?us-ascii?Q?e4oLk2oLZPQyxHJkZTaTHQEadnIhyc5z/RKtDdcd2FXYoBhtoTlMxVxmkwcI?=
 =?us-ascii?Q?9NQALA3/SD0kDcW3IEOve138SQhDVi1Ws7IGhu644018hcJNfdqVNG5P4zpZ?=
 =?us-ascii?Q?hG7iibun+tstCZHRlhKlZjNncaXSgB4Oz0uBv1bq1Z1av9YyY3yLayopPp1I?=
 =?us-ascii?Q?C7iB4IX6tnXQl0OpIU+aQPE4ZjcOXI3ZuoGUPMItmLvdX1VVbMAz2BN2rQuv?=
 =?us-ascii?Q?qGiVS6OxwSsTM/rKDE6zNxRzTtw0ZiBW47t1lYbCwUKVzrwFX8So9rkEFId+?=
 =?us-ascii?Q?ZF3jZowmmPDJ+lBHXYSqQfWb03rWzsbpbIrk8yQrpfqMo8TLCX5TyCRxjoTJ?=
 =?us-ascii?Q?NutvKYhyRljeyAIK645E3xv8hE3djDamfMH0ZGWIm03B5ZwWxSRMse5XzbNv?=
 =?us-ascii?Q?4bij9ck09bmSikaArBAOGrnvgkQ4eH0ryNyLF1K9prXfeOOxRlaSi8JCuNDx?=
 =?us-ascii?Q?jK7z4Mcr4BUiTexf02Rf8JoOOiwO6FnmY/cR7OTHArcKgAXQ2PIDZRKFsCl+?=
 =?us-ascii?Q?fbDVvL3NNe28ZhWdCs1EhNWmi39T6w5TBgvxU8UWsSgMWF2kvuhwrkLVWkdu?=
 =?us-ascii?Q?a3by5G/rlG9sOiSk+PkKIQ5iIRV1ZxSwxDll7nbeoObEvqx7srpXHoJ8KC9G?=
 =?us-ascii?Q?vwWRqcTsi2RLwNJZjQQsu0L2dn3PylaurZLg1HrtBg+OU0QbkYZmAMoSxzYF?=
 =?us-ascii?Q?VlqEfg+Tadda/XeJHV0wxAwPrDws0nqaVG2DupyGs5GU33/Jn3aIXABZeV9e?=
 =?us-ascii?Q?rsWvzmAr4DPZ/M1rNnhCcqGn+DSqf1tK7885+qNx+hokN0peoMeQeggLp1CJ?=
 =?us-ascii?Q?OfHhQNKWwMIyZUZbjQMNznd6cozhQmiU/yht/zScKt33RzPydtOTbmRvYPgC?=
 =?us-ascii?Q?tudh9pdH0s0L73KK/SY1W6YApYrqQIGTBt/CmcahyIBETuKpukyH49SX8KAK?=
 =?us-ascii?Q?SIQn0b7J1x87Ar5+cnxbXZXr/KdckVOeTNEVEeZ0RGawMgwW958L4fmU83mq?=
 =?us-ascii?Q?TDtSmylAyzJ8LVoOx8ZiMvv6vkjNqus1EqqJhFhHhkgOlGUflOT8v1A/M3s+?=
 =?us-ascii?Q?4ia9fbb6FwWM0wXDIW033y+Dj11cai6NVFm4eXxvJ4235wAB9m8gjPHDW3lP?=
 =?us-ascii?Q?OCiaVM5qYlY6/0ZQMtoTsGY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4cd00c29-5ae0-4fe7-1e75-08dc7081b22e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 23:42:32.3359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nYVOqCS+i/1COIXNICNhbD+fkc5AXSEj7eisPvcFyaYSMC9HYucdNiCMQlbWxrbbZmka7TxwDjjRjgm9jg1CBxuRK7QI9/Au1UW9ybmCPa9s3idHoCkIZ9DfljmdE2+7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10536
Message-ID-Hash: BMK36I6GRXEBPCEZLCAGKTCUULDIH2QH
X-Message-ID-Hash: BMK36I6GRXEBPCEZLCAGKTCUULDIH2QH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMK36I6GRXEBPCEZLCAGKTCUULDIH2QH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Jerome

Thank you for your reply

> >> If so, did you get below warning too ?
> >> 	 "both playback/capture are available, but not using playback_only flag (%s)\n",
> >>
> 
> I've checked. No such trace, no.

OK, thanks

> >> Card
> >> 	dpcm_playback = (0 or 1)
> >> 	dpcm_capture  = (0 or 1)
> >> 	playback_only = (0 or 1)
> >> 	capture_only  = (0 or 1)
> >> BE.CPU
> >> 	playback = (available, not available)
> >> 	capture  = (available, not available)
> >> BE.Codec
> >> 	playback = (available, not available)
> >> 	capture  = (available, not available)
> >> Expect
> >> 	playback = (available, not available)
> >> 	capture  = (available, not available)
> 
> I'm not too sure I undestand this. I'll try to illustrate the case
> raising the warning as precisely as possible bellow

Thanks

Because you got was

(A)	axg-sound-card sound: CPU capture is available but Codec capture is
	not (be.dai-link-6) Please update Codec driver

It is for BE. And validation check is for each rtd only, this means it checks
BE only, relationship with other rtd is not related here.

>     --------
>     |CPU BE|  This is the TDM interface. Capable of both Playback and
>     --------  Capture. Through routing it can be connected to Playback
>       ^       and/or Capture FE CPUs.
>       |
>       V
>     -------------
>     |BE Codec(s)| Possibly N codecs, supporting both direction, or a
>     ------------- Single one, or one direction each. In this particular case
>       |           it is Playback only C2C.

So, I think the warning happen here.
The validation check is checking this BE only.

As I mentioned above, you use this BE through playback only FE and/or C2C,
but that relationship is not related to here.

According to above explanation, this BE itself is available for both
playback and capture. And you didn't get below warning, I guess this BE
has both dpcm_playback/capture flag, and no xxx_only flag.

	 "both playback/capture are available, but not using playback_only
	  flag (%s)\n",

Before my patch, the validation check is checks CPU-BE only, but it also
checks BE-Codec after my patch, and you got the warning (A).

So, I guess your BE-Codec simply missing capture channels_min settings.
Please double check it, or please tell me which codec driver this BE is
using.

	static struct snd_soc_dai_driver xxx_dai = {
		...
		.playback = {
			...
			.channels_min	= x,
			...
		},
		.capture = {
			...
=>			.channels_min	= x,
			...
		},
	},

> But I noticed that we want to update below. I'm happy if it can solve your
> issue.
>
> -	if (has_playback && !has_playback_both)
> +	if (has_playback && !has_playback_both && !dai_link->capture_only)
> 		dev_warn(rtd->card->dev, ...)
>
> -	if (has_capture && !has_capture_both)
> +	if (has_capture && !has_capture_both && !dai_link->playback_only)
> 		dev_warn(rtd->card->dev, ...)
>
> Honestly I'm a bit lost in all these flag :/

Thanks, no problem, me too :9

Unfortunately and confusingly, there are many combination exist around here.
But because of your feedback, I noticed one missing pattern. Thanks


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
