Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B5E647A73
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 01:07:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 062361888;
	Fri,  9 Dec 2022 01:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 062361888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670544421;
	bh=VF2xSyGXggIUrFhQePapP64xzZ2sen7mTsRKXSHAeaw=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=f9xlNT84mfXOeCE0qFrkMschCNSWXfFf2ZWPxWPwa8bgvT6H1YtmIprDI5Yd2o11y
	 Zr6yFuATBadEyQeTNgwRimyUR/czv8PP0JAFdEhw5WF3of2uKqVt1jtWaVt7HfFPWW
	 7aMXuD0kg/PpmLYj+gjbiaYLGSg45o+uvB6VoMNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E03F800F8;
	Fri,  9 Dec 2022 01:06:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F8C0F80124; Fri,  9 Dec 2022 01:06:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0794AF800F8
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 01:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0794AF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FYZgIiLC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAq3PFDm/jGhSyJK6Yf09AMPP8JQflEmzGrru8OzmbqWMfmrO1yuYGq65XnsGycAE2hOjChFvHKtjHKOs7br5++NwQ22AQ3x5Pu5DA3XCkQi3g7zljRSgiviFaI25o0nw9E/1l6biq7x+tCtjeAhHtUZU9g4AEHd2/mHzSdAwisfT8rIe3TVhJxYNFk8aXRwNCMnEPqTuZJ+aJx5TNBgVnSB7OCnpJ8gszyzJ9EIuCzwa46c67QLpd9aC+na7Qp5sRpcrFX42XirVOj+3hISE/YfRLR8zFoMjbgurMhBoUofo1EYiyR2gdyVFR15UVX7BI67INh3ve6Itr/io9H7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnga1BVpyFrlLll0vwhw0bmkevx1uuTR/ZvV99JBBHw=;
 b=aMQaL695BMOLXmvzVI0HZssl9lStBx6yuAL07barTQFABXvs4WuSwui9TB3hdEVAFvJYQNvxp98kd0xZILGcnfYBs/CLPYXY903OdwP93ZDyVt9NLtbws/bdnQz4SEtxz1wfSQEiMBCuYBHFr5k7AVMgGLeTsgFiCiKEhCyh/G6EQeQpW7yY3ARd6UU++BE5rbfFpCMCtiPD2PjiK5z/sBIngotuNjIJyvfYWfjvsYBDpDphTnkMZoFqAiPVksHgTaSs1PJKpTjQVO/Qroky1jm0HDW7w1hK/RnIe3Xqz4rEBWWjXVAeRE16uXG0iMDNlIPa4id5kPVORyZymuqbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnga1BVpyFrlLll0vwhw0bmkevx1uuTR/ZvV99JBBHw=;
 b=FYZgIiLCMnQKDDZxxR5b6KAs1ykcApWxuB70ptdEcnEtAHf+vBePxwtW+OFCwV1eXF04zlad0T/ztqITcnKGHDvXJPtxl+9WST+uT2MExVmFBu2QlWMVQdgN1de7CeAJ8Y1ztzdDZ+9jh1CqPmTORKR73ojJvQ8hJZZmVIYFziw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB6172.jpnprd01.prod.outlook.com (2603:1096:402:34::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 00:05:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 00:05:51 +0000
Message-ID: <87edt930gx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: Simple card and PLL/FLL
In-Reply-To: <4172f4b2-9198-dfc8-a2b0-d75a95265e14@gmail.com>
References: <4172f4b2-9198-dfc8-a2b0-d75a95265e14@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Dec 2022 00:05:51 +0000
X-ClientProxiedBy: TY2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:404:42::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5bd067-b0f8-456f-ab3b-08dad9792215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sRVncvyfLcFaugM1oBlTaGWKT5sKx11fDkMZvvZbb/59kaZHj2Dnxi0qwer4Cli2tXOjGXGDUkDyKPSPlyF658zk2Zzb7OBs3zFHoRjEyl4z6XyT0utZa9dEoJftbMiQN9Ol86b6rwNi+6UgfSxWb6ZgVIkDz0hWqtlLaJ2C0cEHm/TK+kHfPHZeqDd6YjkwzE+iRQXwsmhueJHqg+qNL+X7xtqQv9/0WMbOyIrRmmlbVsL5la7qCQ3hzwvf4rQBJHHLdqfsx42YytsSwyQACo1V/zZEXQ5eqCwQjgwBxfDo+AvwOtSdDrfxULa0AdN25DQvR+qDjg/FKa+rgn0rdDcZFGx3IX0JsCHP12amfVWpRbTJ/673r+rpa/RRUcuKHoUJS2px96CGzes1ZvywLtLNCT4SLQaI2xS2KFXhH2N3cWGzeJnVMdGaC6R3s1hdLWtcUFDl3bz6isJowIZE26m7FRKQoXnANILcVG0niwpJIDSepwnVC4u33Yv3I7ZSxu1wIV4pImieeUBnX0mVQaA1Dr6dDQFHJIxWt3T1MTpydDinQS4dujI7/6UPP7imVeBFTIIEtzjJJmYeiBGl3wgpUZH4EF1oRJnugN7p0B8LE12deky2c/jKmVbXXX4eBS/kR5lleuHM5eF1FwZFGO0wYfZOvcAxLqd+CFj8t1dgYiwLEW7HwryzN5FBOlclWBUoUHiH6m/h5L4hygZf2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199015)(36756003)(2906002)(38100700002)(38350700002)(8936002)(5660300002)(83380400001)(2616005)(186003)(86362001)(54906003)(6916009)(316002)(478600001)(6512007)(26005)(6486002)(41300700001)(8676002)(4326008)(52116002)(66946007)(66476007)(66556008)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jk274wIncTdwlx0XzkHksQkZHGtDr4QiALqzAUnPfWrJ8K9slf7iPUQHfc1j?=
 =?us-ascii?Q?Z7rRgKsSy+pJQF5obMoTnSAUDTjH7c8W8uQnAL9a1g0v4UztXheepA9DCtXh?=
 =?us-ascii?Q?+VOgqfRIyPGOcKl2gZN1r0GDkhC8Q2H8iHaFivm5xKPMpwCNFRAsb6t+Ql6G?=
 =?us-ascii?Q?4ByOcEhybMCl3TOS7osLstf3SI1foL4csewsLSubmCvW92pgDVf3jEYWCP3/?=
 =?us-ascii?Q?2n01/aFTRdjjtGWJfsnd7mIRQ7i1nRPfyO5Z1/pQjSwE0jXXlYwsREHAkcAI?=
 =?us-ascii?Q?iKk8fNtaKvHVpDLnOHVEVXu/F0s0Lte9sbJAAwAw+6r73Pz1Xok4qF/BYllU?=
 =?us-ascii?Q?UfoBz47ynQf1ajsYBNmRDSkIAVrMDIrTiwo9xk9RYPzenYUF2urReEKUNxsy?=
 =?us-ascii?Q?TVdnAUwqCRVcWujQygRXP/XoaN1ijiGz91ZLypPbJOWCFXNJUCX2qiZzLhBR?=
 =?us-ascii?Q?YCDIXFnYEv6g57DdRrBM/+scxRXU+vICQpahbOZorXjtbi/u5aqAJwz6k3Zz?=
 =?us-ascii?Q?XfO8GvcfuhBu3liCUoX5vuu0T17iECilj2WOI8S8WOhn9k0W6it98zVAFYyL?=
 =?us-ascii?Q?BKpJjHQ96t2IecF1+xAJsjaMap8jNMUGCUTl8m0Fm1H2F30cezwReinGD8Sj?=
 =?us-ascii?Q?B0+WTPZ9bbwyFa1PpmTfLg17X6fwBVZZPPcXrR72M95LtViOpr+TEyhfAYb0?=
 =?us-ascii?Q?T9Z7+PYTfSZwi58pQtZmhz0d9whjoCcVd8AI/2D2zFqqZ0mTkr77Iy/xF4ik?=
 =?us-ascii?Q?yNyhjI/6WeKaAEbji/YRgrfLl2iYouI+xLefr4bSFIZsylyVKpvcMXmipZ1Z?=
 =?us-ascii?Q?rDEq7jNWcEyNSZjVuJFQL8WjXGQT6MIlslsLsRdEo+2fnkqFJX0B665Kpd7T?=
 =?us-ascii?Q?58GuWbApa2ctl2HfsqmhrZPERX4N/uG9aDQPXLlEHtUJrHx+1G6DUL2k2Dsh?=
 =?us-ascii?Q?vn8mBZAngrsqqBCYkTvg8va2Fzd9AhaVxhdM9pp3m2dVVuYUdJL+WgxU5Y7p?=
 =?us-ascii?Q?LureLsqFxUmuvjblZ76UlB40J/gtfxRGXARDtXbzIZINr9Qp9+8cE/Z7m0Xw?=
 =?us-ascii?Q?UOpC6HTQ+rO/lXtHVy5/9Md8G/jqLHsptxMckpdTobe2ySqkSNmcaWrd0oAq?=
 =?us-ascii?Q?c0fLt7nUe0zj9hZpQ/D6LWgUw/v0wRuK1Alby/QzO++AiOpEjA7K6O5Ou8U3?=
 =?us-ascii?Q?VBOTZB+mJL8i5Q3O842A6hUiSZW2sVZNZeY7erdl5EtyLRKDxxCWBD5dS854?=
 =?us-ascii?Q?30NDpGTlMBqHaU68avCQv1ymKfSr5xiG33f3R90+wh7tTSEaTH7LxLfP9v0Y?=
 =?us-ascii?Q?vAD/Jv7+Yi/SgYMyXf3on9rw1QFvLdlFrbMbqU48X5sEqeynT2XsxamwYNC1?=
 =?us-ascii?Q?OPI4oUNf+Y4gqSmzwKaNh7oNHEz6u5kpvKVsbHDEfVlaEMA3z4jrT8p/U1H8?=
 =?us-ascii?Q?t1aZojMkhzY9lEQTytCYybG/hUUCbiN8hmGxXAmPnTcCaJRnubfH+ASwNPDA?=
 =?us-ascii?Q?N+2iZ7kb8PWSYRzmFYUxp+L8jh0v5OxjQ4yDyl7Fj0jpQHLYCDn/LOaR+EPN?=
 =?us-ascii?Q?s8dixji9ossb4zqKSUNI9TTnAORBpD5uIPgnwLF05OPuBhIDIvYtMDyEt08O?=
 =?us-ascii?Q?b8V+yduifrYuI9ea6WHoaDs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5bd067-b0f8-456f-ab3b-08dad9792215
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 00:05:51.8567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1YX80wQtfOe66cpPXPLLUNBLk9y2oqbLMqoV6wSKoHAX/PXowcJwPz7O1UF4gEIZf6Cx7BijrdYHF+cu4dhFzL1GfRQx/cZMUNghE9R46MZ57jiq7wi9jImTVzLhp72
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6172
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 emanuele.ghidoli@toradex.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Emanuele

> I want to understand what is the right way to implement PLL/FLL usage
> on audio codec when using simple-card.
> In wm8904 driver I found that FLL is used if set_sysclk is called
> (that means mclk-fs property is set, otherwise it is not called).
> In this case the frequency passed to set_sysclk is assumed to be the
> "desired" frequency, the codec read the currently clkrate coming from
> "cpu" ("clk_get_rate(priv->mclk)") and use these information to
> program FLL.
> In other codec drives I do not find a similar approach.
> In general codec register the set_pll function but it is never called
> by simple-card driver.
> I guess what is the "right/better" implementation? Have we to add the
> set_pll call in simple-card? Or have we to add it to e.g. fsl_sai
> driver? Or, in some way, the wm8904 codec driver is approaching in the
> right way?
> 
> Is there any documentation that explain all of that (I have already
> looked at Documentation/sound)? Any driver that is considered well
> written and complete I should use as a reference?

Handling clock is one of difficult part on generic driver, IMO.
Therefore, "Audio Graph Card" and "Audio Graph Card2" are supporting
Customizing feature (Unfortunately simple-card doesn't have it).
I'm happy if it works for you.

These are sample code

Audio Graph Card + Customize
	${LINUX}/sound/soc/tegra/tegra_audio_graph_card.c

Audio Graph Card2 + Customize
	${LINUX}/sound/soc/generic/audio-graph-card2-custom-sample.c
	${LINUX}/sound/soc/generic/audio-graph-card2-custom-sample.dtsi

Thank you for your help !!

Best regards
---
Kuninori Morimoto
