Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF965715276
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 01:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4337320C;
	Tue, 30 May 2023 01:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4337320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685404459;
	bh=+WVJE+C5VK3MIVeTTYqA59MVkdJBxIbgZxhamK8Wp0o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kc/bsm+zVM/5PbEFYSoGE8BsxzZGmYpKHaDSS2jO0zqRsVQNtQ3VUy06kbDPu3aES
	 w+Wgqp7j0YB0vzn00cVO5Xe8lOzVLGOSfRtak6mSxCR0Q7HmoTX1z7WkrSGQnjbdRx
	 Xh9oMjIXUxny3bNnc+/UeR1M6/kLDkqfXQedMYhE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83E09F80542; Tue, 30 May 2023 01:53:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E103F8026A;
	Tue, 30 May 2023 01:53:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42DC5F8042F; Tue, 30 May 2023 01:49:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B040F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 01:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B040F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UOV/3wcz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpjWu2/ZfGOnIwN3n1iOh9VjnYOOkJCBYpB/JGoKqVSX1/SwXnXeOZQxQGdHinUbTUeewuQx34vXUWEpqijbmd0gmEzWRlbKHQPhpvpdb4E/GKdGjYK/oH1bI4M8whvwA30IBsCXubqnTLp6zCBSC2Ei0WdiyM8yuJsfkR1nHupY/WtevTT9kiZ4Y0Cb9tf0m6hxbIoIvLJMROwhyYpYDfxdFfrro89VnqidoN2vK0UdLMuByqCVkhcGXyXbMskUgKff0Q0DJSPky3rf5edRtCub8mDGhQ1d8ptF3FJqOQH6HWbirq+oDCdQYmnB0Aly9jS+EIWGJAwsvmm6TXIrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6veAg7zrbEihNe/A6Obfpk/C9DLRD+49cbUoTNtVP6Y=;
 b=JI2IO3c7PHfst2xrynAcNMqSI0hqtYOerSXKjvA7m4HUMDw83xmF1B3tVoYKISE/o1x8CdnIbsCfgRwA/sJ5I5ByhR4n36yM6JNNDk1OCqWNx5o2PKxYIWUDLMH33s2M3b7TfGcaBBWiJ82KLH1FSh5IKM2bi10eMmLQ6YquAPaS2HLiZp7XtWQvncAFGe2ztq+vvUoByJjYMRwp2vRFDzC6KjqAsM2/8kc8ieM/vLSCC2g61Z0Z8lpsDGZHleN2ORCxFOFylELK4nEdd//PUFa+y0y4RsDNbpMcimsKA1ghv4VfPW64iZtoRHwPJnXtDHBBDBD2y4/rSMcq9lmjEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6veAg7zrbEihNe/A6Obfpk/C9DLRD+49cbUoTNtVP6Y=;
 b=UOV/3wczTXO2XGpvkBXq8wWk0jxHhwAdLxVzENEtVxlKhc1wJubyOTr5e3gHX5xFUr3op9SbeDusc6qh/zL5sv16oNLhH/zZCb6ct52ZS7BTScMyDmDQkh8fBVdu/OStTIC6lXlrwugQ5TsLwfinRgXwqc8f/bIfhB6rs76902Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8403.jpnprd01.prod.outlook.com (2603:1096:604:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 23:49:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 23:49:25 +0000
Message-ID: <874jnu1yww.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=c3=83=c2=b6nig?= <u.kleine-koenig@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 19/21] ASoC: soc-topology.c: replace
 dpcm_playback/capture to playback/capture_only
In-Reply-To: <c0471465-ce43-cb7f-9d0f-982e84bb8222@linux.intel.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
	<87wn0skkuw.wl-kuninori.morimoto.gx@renesas.com>
	<c0471465-ce43-cb7f-9d0f-982e84bb8222@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 23:49:25 +0000
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0e6d4a-6022-4817-2924-08db609f5571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BQMc6CyahwIPdMZyN87GE1NiLJg1TGV7ySYzFdZtut0kBZY+jZ7OEWioqsl5rNePy7o082fFJzl8yVWeM3+cORW6TU0vGClWKpEemldGaTQcVkcagpWVweCzTahJkwYNcA0NI5nwUh3kotcrR/LtIQYsplr+Xmw+YfPVYf4Bc7SIeVmRzUa0l9frU4mEq/G4VxkktpMML5DptYPRfql9QGpbwiY08dbzbinWnjg6NCkU9orJN5SSAsyGOvai1zs9mkxcv0NZwOtN+wWbdfqRnr8i3BRXXljkJFTnsBkpb7qaIgSCs+9BPYo50BLRJszbRCbrqR58XNAKPAIVnLu4SXTXp0sv6saV1FESgEZM1w3tCuJbL6P9BdNOZQFED1aPlyA//bBbHnVYHMpS7/ykVWp8U3N+XEmcC6feEwGjViD4b7Y4oJqzwjGTVW83WKdBgPDPWZPhWWb10U319oF7h6Qj4ujsL02lnRkOcrDVy2bYtw8NHpgqq5Bxi+SufaD7QhVZHG6q4eeknZOz8ni0JtKfj9eEdKsyCAz7PVhCYfeI3cx//hneUEYnprVwxzg3JQ1Nzo+iUpfmEiRp/ZUGVH+hTBwZTtaWDw6HkXNfjOo3TDK1Yq+1WTBm5OqQJwWp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39840400004)(396003)(136003)(346002)(366004)(451199021)(6486002)(52116002)(86362001)(41300700001)(6916009)(4326008)(316002)(66556008)(66476007)(66946007)(36756003)(5660300002)(186003)(2906002)(6506007)(6512007)(26005)(2616005)(38350700002)(38100700002)(478600001)(54906003)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/wEwNlFk3T45994j5/k/QI1hfO8GS7M0GNaHf92m3TPjssrEwLuMWZ7EGbR1?=
 =?us-ascii?Q?kUxUwT/oMyHvXQkz3NX0FMFM2YbH5ny3Yseas3+bRVRC3eO3MFp64OWJrn86?=
 =?us-ascii?Q?L7b1sGQIMe4PTiz1EpaG9gTzjeZhj3VKRPPPIEd+BcrqRHPQC4n0qlsqGxm1?=
 =?us-ascii?Q?kbjAMyz2hVgE6wDT0P0ct8177juz0iyYjB/DXgL5eMcONCafkZ/eeNLWyQzb?=
 =?us-ascii?Q?BJv8xelHN9lj7ZmN4O1z0YZfg0tiHhgwFpu9vhs8joIwmWPC2MTATfHkWS6m?=
 =?us-ascii?Q?Nzvux6iY9ukY9zakE68bRwIWpKkqfHy7p92zoMO/Dsy6Pwqjv81BmUCWKjtx?=
 =?us-ascii?Q?Ihqqql0MUvXZLOmIozubQgRAqKes3NlmKX0EGDtNXce+IrfKTUcHOr6AuFkb?=
 =?us-ascii?Q?kA7HT6HZpDmuPDBIRhRyq5kctvQ0tCRCzJ6qnow/CdaTZ1fke+8kQ4SEi1o2?=
 =?us-ascii?Q?eFgjvAdmphk/d7eKzFxbKTX439Yok0Co6+igAgM2ad4k3lIQI8scxRsQmkdy?=
 =?us-ascii?Q?M8ORMVlDmKWZ4jQcXkifOm7W54wmhQywXqnArOXdCEx7eHS5M1v2Y92IiSuv?=
 =?us-ascii?Q?XdLjysEXK7NBacwo0khFjX3oT6JLpu52R3HNXcZQNG+twIXQeP+UIFIjvoYv?=
 =?us-ascii?Q?6vh80Tfg7Ri1cFvH+ufcecx07OohWRLt2ajYq4hsrdtot5mnIVIZ84y9Pkln?=
 =?us-ascii?Q?OocnMUyfG2VJPOcZxHfrGYJI3p58bokljOMHliYz2evFrHZxGQHlggbj8YuS?=
 =?us-ascii?Q?qbT8h14Z2CedvtGJn9I26rEqkabYBUuZV2SMlg4ewGD7jhvT1madJSQFtiD7?=
 =?us-ascii?Q?Gd5C+yfxFxKHT8rkV1nkEaAKDLwO6SzOf9wFesq4XVm1rjkRFzuaV4HNvNIc?=
 =?us-ascii?Q?ZFND/b9O2104ZxZOhsqmETQhsV2eofAGXVFExTrgmO6Fu/ZJc2Q6C78j0Kx2?=
 =?us-ascii?Q?MzqDR1ImEEDqkv9cdiE3ycjtt7N92KI9g80UyuYI57FEIgVc6ig5n3x1NTmh?=
 =?us-ascii?Q?BYOAgp5ZZcVQNQDNEXoCEnphbl7lRA7JZpRvhVR6bmtyInbuKn2wperqaT4M?=
 =?us-ascii?Q?NjVHseholHCYYEtPlndu4ztQQpmtv/1Y7HqMKTbmnIWLarWbn2cjVV3pjzjs?=
 =?us-ascii?Q?W9PK2uNjcGMWm0Wym3RxpJPXudOqBkwHVA88BARbhR+fETLEbL+PDXM0ew7H?=
 =?us-ascii?Q?OysPpzdsP2HwGAISkcTAnaNIB91L+FbID/4jSwtuVJqAhF56LhJ0T3+Zeikh?=
 =?us-ascii?Q?00JAEoEboqRf5d1bDe8qJueRMSIZucJO9b1cEP26YX5il6hLjpx7ybwfYyKY?=
 =?us-ascii?Q?7zoJjJI640TFb4Ea4bFDKvV2EgpYdY/Og4yndW+/zV7EeiSJNaln5BsK8T/Y?=
 =?us-ascii?Q?yCa65+wZ9Oh2HjdpkW63mDP9UyJDH4hirh9RiS7iaPmt8uv8WXWgYA4ZlWEF?=
 =?us-ascii?Q?8629dherl9OAx3pnxuH/cUW+1F5cmb4YBmHXgZXnip6LvxB7LH+yL2jdRxIx?=
 =?us-ascii?Q?MVPYJOeEpjMtAT95cv+r1e7917jtJerXG+tC2iLoL745Y4NjhH4HriSkkzvd?=
 =?us-ascii?Q?R/ofA6w/31Vq1V3xcmkHXEdee16J1Ls/SyuUXSLk4EZLW4CyOJTdhGOb8yVE?=
 =?us-ascii?Q?NTtAR0VR4RXwfqwuxDR3jjk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef0e6d4a-6022-4817-2924-08db609f5571
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 23:49:25.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gm/ZH44ZCRzXDQr77W9BorHZLH59bZxZIsm8oEaTZt3Sv83j/eexcqHTPKOGZOlG0prOi/9Cq56jen5cxM8dfYHkH3RHSgXNZZ9KeG01YCXfkifYxbjwn1wvDMgz8l6m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8403
Message-ID-Hash: NFHGYPOTGCLZP6WZUXIXCJM2V6RE3HU2
X-Message-ID-Hash: NFHGYPOTGCLZP6WZUXIXCJM2V6RE3HU2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFHGYPOTGCLZP6WZUXIXCJM2V6RE3HU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

Thank you for your review and feedback

> patches look ok - I haven't run tests yet on v3, will try to get results 
> tomorrow. However looking at those assignments again, I wonder if we 
> really need them to be "negative" ones? Can't we just have some simple 
> fields like playback and capture (similar to dpcm_playback & 
> dpcm_capture from before). My concern is that having fields with "_only" 
> in name requires them to be handled properly - like in above code, while 
> having just "playback" and "capture" would be just simple assignment and 
> in the end a lot easier to understand. Is there any reason you chose to 
> use the *_only fields?

Not a super big reason, but want to keep compatibility as much as possible.
The driver which get effect from this patch is only DPCM user if it uses
playback/capture_only. I think DPCM user < normal user.

If we want to switch to use playback/capture flag from _only flag,
we want have such additional patch-set instead of "change everything" patch-set ?

And my understand is "playback/capture_only" are "option" flag,
"playback/capture" are "necessary" flag.
I like less "necessary settings" driver :)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
