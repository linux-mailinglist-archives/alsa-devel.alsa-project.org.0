Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9969E96ACEB
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 01:37:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43246844;
	Wed,  4 Sep 2024 01:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43246844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725406634;
	bh=E2WLspCtarDawRZKShXmkZ4fWorHQk21WpPnAcvzI/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kwtjwlpq5tbsvewWn3t6LEgUqivnG3BfuXr+O6HCm3AiIE+4Szf5PzJ0kTmQN3WoX
	 IQIIaXHGhVHfxfitx8dBgcy3EVIaXx5lRvPVJDlzCP5ympLCVTflnmSw7pp7MFNfJR
	 FvTTwAdTa3Z6oOg9OtfByTB96wlk+iFqigBfhSgU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2024F805BA; Wed,  4 Sep 2024 01:36:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3885F805B3;
	Wed,  4 Sep 2024 01:36:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 058D7F80199; Wed,  4 Sep 2024 01:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42ECFF80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 01:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42ECFF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dyu2PgRH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYnFauRynE2eNbXyUFDGlFFLgwJPKFo6mDNi9n8qqcnk8j/r7zPh4duoYs51C/YYIWJcVpMCDxdPVQRcPF2/Us1tDx99a8hzIU2/BAZNStBhXCe2T3jMkDgnQFB6JabLW8P//rFO5gg35IilQwKw2L8hzVQUU4/AkiN3DX67hf3V1nsTUCh2vpGweM0C6jDXCh19KhVaTdnuHC+lb+uipOONiv37T/D1WZSKqrUvputougGzJIkajxVbqQ1Pp0f3pqek7NsIpAggn+eQLAe4+aw48OT6I/d1Hg1hvt1SCm3Ukg38oA+hXLRUkrsrE+U2uAtZNAOBh1+Mom75g2ZGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCYGZeNniJBnnsRTCUuvBmIG3eCFFq/6GK2jk7NQ72Y=;
 b=IQgiqDuq8BQ2xe4HxeBxORydx3oeLnvRz3g0fYfJoPHwSbWwvf3I2TOFtpvgsToY64INVDJdwKNiFn3c2YfUNO2hKbqOU/zcM+NGpj+SEHfUhO2yib4bB5jRfWd1eEEZi+W6UfSU+u0DDNDRoUeR7nTJhk27QkxclNVlqZua4zj5+MJcAJPFIfawPHBv2I9wE9PKbFpD8e1RUbX7nUgQF5OIY2gJssdHp3jq+6MnkrV5XrCsZxDL9SOm9VRVDHFDqy1tHVMp/B+3up//oWcyqY17gG/lQsng8aT4tkGv822vGvd23VC7bAQKoaiMcE5X29IO7fnFG8+9bbSBbdD9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCYGZeNniJBnnsRTCUuvBmIG3eCFFq/6GK2jk7NQ72Y=;
 b=dyu2PgRHMX034v7WpWCRRFEXHD2pZt7TYKFweMneIgz9MqDdduPKgKFfTo3uR3jtks1LbGKooLRti+TU8WGG5GltNZJ4Yh8tZ8KSTjxlzTC/o54A2z8fuH9JHgf2BHYc8UNsW/Q1D0k3bPs/xP+rPpf4x6sQP92ByddCyWeR6fY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12960.jpnprd01.prod.outlook.com
 (2603:1096:405:159::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 23:36:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 23:36:20 +0000
Message-ID: <87bk148g3v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Saravana Kannan <saravanak@google.com>,
	Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-DT <devicetree@vger.kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Laurent <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Qestion: of property has dead-lock to call .probe()
In-Reply-To: 
 <CAMuHMdUVqojaz=bRSWV-SRqcZ9zEpw2=ooFaBFqJq6k_C0RYQw@mail.gmail.com>
References: <878qwaoa10.wl-kuninori.morimoto.gx@renesas.com>
	<877cbuo9l6.wl-kuninori.morimoto.gx@renesas.com>
	<20240902070746.GA11534@pendragon.ideasonboard.com>
	<CAMuHMdXqRQz22rjPs8LG__ow-B50bhgXQ14jkfM0HSFn99F_2Q@mail.gmail.com>
	<87y149bg8v.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdUVqojaz=bRSWV-SRqcZ9zEpw2=ooFaBFqJq6k_C0RYQw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 3 Sep 2024 23:36:20 +0000
X-ClientProxiedBy: TYAPR01CA0121.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12960:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc12740-adf3-43ec-dee8-08dccc7136f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YMuI4QnsUPp2wneqwYTK1o9R0Y0CH57HeJuGM0dQBoRRpV1DySovYov47KJm?=
 =?us-ascii?Q?xY48gsXVG7j1mcKevU/OLtT+ZyOG56FiReGhJoH50z5BYCLqhZz0xhmRipnC?=
 =?us-ascii?Q?ggyMGctuGiPnAzyr+jYEoHrhvJcGyyDaL1d642jRjeBJm6dNRamTDAT1kY9G?=
 =?us-ascii?Q?+uHEwtYCD8MeFYMJaTVzXtIu10o/MlPo5+p31S415VWrjd+e5Ng3+mpokXIf?=
 =?us-ascii?Q?vKtr6Jp5DkebR3OQ1GVCYNTJKX07gOtqGUwN8Ghmdbxcv6IGhutZcIoK9jsj?=
 =?us-ascii?Q?txl55nUlR5INPj7nFsVqx1OOp1ATXTcjD9XHfkSDjJI1Z8dybz3Pp5qT9hdd?=
 =?us-ascii?Q?ft+PcS97W6hZYPD82iGqmZDVGf93eoofynveGHBiMgZlmLt6GX/m9B7vpQMW?=
 =?us-ascii?Q?Uvzc/J5A4VLjx6AmSr4mg5kt+/jHuHy1NIaOucnmHQNEtiQe/ho9ECBJGZ8c?=
 =?us-ascii?Q?l7Dm1RErXO2v8XUyNZsf1GC6m+cz5Lx35FzRmSUFtTEa4dsO9sWch89If4nu?=
 =?us-ascii?Q?C2iVpBNeFTtIGn3k5YnrYF5zHD5y+7RSKXl/+WFKAWp5pSw3PF6Y3AZz9A42?=
 =?us-ascii?Q?2mycrWKd/bN3139lUApQBoXhZ1hbUlQatwoXg0olXilemP31xxieBfBM32c1?=
 =?us-ascii?Q?B9DQskjk43CagMX5uu6SRkTYuhwlyP09WwA+WJMV7qckgUYkYwPyuGJE3OkP?=
 =?us-ascii?Q?/ZXmbLmmzzBwbIu+QP9Br5pY/dJAWKNv3WMYizAX19mf2oIYK7Q2/j0O0L4/?=
 =?us-ascii?Q?45pZE/KtdrcoqJLMcO6SlIcrIqvUuRthxodFF9zBC4G4rVh5rb6iOQXa2Rn3?=
 =?us-ascii?Q?nl5HfhDzczszvkyQPATeBX0SbB0f5n2gHET89OHF4kAemyU9GWLS6Yc+ivnn?=
 =?us-ascii?Q?Pi8ZGOAP/A1130+K+qoWozWv34VN3vdQ7NkALeeXlQcjr2jVLEKoMF7v6EwG?=
 =?us-ascii?Q?hs8/yIuNyBaGHUImVbklHfZX88Q5j/zCG6xUw/aB2fKUESdhpCNqm4H0UBrk?=
 =?us-ascii?Q?ZTm7YZCM/6QPlsPw/1kLvJcBECfL39LwTvOHR904PbJ3/A186Bt2hFIS4zra?=
 =?us-ascii?Q?0gB36fGbosGYKWl5iSWrJ9NEi9SlUHuhAxgJXBgXvHHFN+1Jbr3cKD09+Y8p?=
 =?us-ascii?Q?49mpCBKYriH1oh4bk8Xz0+CU+sgjgX4/1CEmX1iYBYrUWTdKqR3ZKykZckxO?=
 =?us-ascii?Q?NYbvvdm1bLedjd4/O0J598Sh6nJGcqLIQZVdMB3acyoFF79nw85wLPXfUCtc?=
 =?us-ascii?Q?OsB2+EjmiQb++uRcevMLjEg5ClJplzT7lX3B1RUH/ckt6KHpInphTx5aEaN8?=
 =?us-ascii?Q?edRK1yiMV6edZ2uea3KTmuXxtTkM/iQZ+vnCgRuFtncMl1oHJKBQdw0BqVB1?=
 =?us-ascii?Q?Fk8kiu2s8llZR2OZ2EfI0sJ4dAiT4rYhbcevqeAhpk2RWgdlJg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1ZwHtKulVbQtJY6jJk+Cv3gGjrm7ds9LMQwnePSPbFTS5L5vkflLhHLeqRLN?=
 =?us-ascii?Q?15tGVZoPLCNdcwkV+N3RG7ILZz8joLTzDOu1H74N9IOKbkrB9ir8WTuR1yZW?=
 =?us-ascii?Q?9VXgSuQHM0LiSyb/IlizYrlMUFI0XZRdNWOJ8YebmJrgIv4nGTVuB5k1p7rB?=
 =?us-ascii?Q?MpCX9t7yB+Z2tFymX6A6t9o87RC3uVcKegfvqcPjpZHBLEu0SHqLoPK93L8Q?=
 =?us-ascii?Q?SehagYXJPZw6rVSms4RTFdqoLt7vIOnDEZoP6i7kLm8xknNLxFV09VgTU0qu?=
 =?us-ascii?Q?8tidBp8LZcArLL4x4dNlytDVbDL9h3UCNKYBO7vMVmRcAZDIpp+W1fS8Q0cd?=
 =?us-ascii?Q?xDh0+8XRqImQComOBYSpkY/egN6++nvhlOwgsULqmolpc4p7WDuDt6EyzA4l?=
 =?us-ascii?Q?kz+uURSP3Ak6MIt2H8iAhn7y0VS7kwBFrK0vbeyz4wfOYve6sknVRF3q0vWb?=
 =?us-ascii?Q?8/g+7jdzs6QY6UTPzpaePGT8AA00E7y4XUTWXKmoVTgey6dDZrrF+biYIBdU?=
 =?us-ascii?Q?SgmroR2oDJGY+kvbrAGmwU/UfFrlG7TL+GUe6S8BfugprkZOFYyu90R0oyhB?=
 =?us-ascii?Q?uj+VivmA9uKixGWjPt/9VNvFcDrLuTrJMjYD3iewbAvpYa4qNtUmXkNoNx8M?=
 =?us-ascii?Q?hFDQuE9QwZJMKz/KTbk3p/y8rdYxWNBqQm8dqHJPiX6to8HzqVpxGz2OrA7c?=
 =?us-ascii?Q?e2rdBA/tunZeG6Zl2SnwdyLZ31tpYwBn9I/OpswPNJr39BACnQPdTDDqB3Rr?=
 =?us-ascii?Q?zaR+fCSaL1epX4ClKXqcHIjmAbiq9MFSqtlpcj5twb+Rnqtj8r2EVq/HrIBY?=
 =?us-ascii?Q?DDKj2BcGyQ/OPRjxH7xA9xJ2YJ9/wYmpNEpL0PIliRpzcVgEnhqpvq296ckH?=
 =?us-ascii?Q?Hy9YjrsMM6KaO1LOK+OMMBPdh76TJqHvqz3DVEfGlEWPdxcmeqeAWtXvZw6c?=
 =?us-ascii?Q?osguDJ4OeLfbRPpfttO/Z1S+cxigHHTBoHRG4v+BAC/gzouILB8kc4NuTywo?=
 =?us-ascii?Q?tIDyLaeM4Nrvzw+e16T6uS5NEo2+d8zGx37xaK6Y4VjxlhgbTQNTyScCWW3a?=
 =?us-ascii?Q?cVw8H+0MX1ggk9zbDp8WmaXnNoqkcjMCm/sPmlHN+83w9ZOfOpphns7Lq412?=
 =?us-ascii?Q?fCeXRuBbWOPIQsZBa++LOzr1LKDcKqeNFxg01EGwq319vHahT6WK9eK8xyzo?=
 =?us-ascii?Q?5V4KNQzOe1SQ8BTh4Izdd0UI6NCUoQtau6j0RrdcRzhqUvhjIV4K8lHsxFBH?=
 =?us-ascii?Q?gcCnWrx6CTCkPrXNq6tWcidfZ4CP+oz8I92UHqR9sn1yvlLUWeTulqkIgiAH?=
 =?us-ascii?Q?2wMkPgsUdriyD7kU+hqZ18R0IeVipettLh+c0qI9GYSU0ulCeJmSGkNR5Nho?=
 =?us-ascii?Q?fzNho4Ft9Q3sjHgmccYDayAgRoNoVsledWgquYBGAp3OoxKtb4sr1C7PGQb8?=
 =?us-ascii?Q?V/vGBjFil7WE1fGJAD1Iwplsh46dRvqFU/wmn30Kj8CXDhdsY/gEftk63gOG?=
 =?us-ascii?Q?Xcnmt9O5KHKD4sz1GagRdv1RX/gtu9Nzm/NCHgZ4+ucBM79RXIwtfKoQF0Of?=
 =?us-ascii?Q?OH8zxTN1IG8Ga/sroeY0fMuZIbtVRDwkeY0fB8qq+uOrI6Ka9pnA9g4/6Z0p?=
 =?us-ascii?Q?ZJy9PnD28JRMYLpEgZXI9Wc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9cc12740-adf3-43ec-dee8-08dccc7136f4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 23:36:20.6432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lFvFtF1s2aV7LEyv+/7uvfEClmfpiPwR2uM08/tmdSYv/StulhSE5cU7FGjnDJtDqbrAiYUiF38bvXZHdIlSfjVXYYf/K0HQM8bHk4FQ21qJt5lab/oe+YfNXn7u4W9A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12960
Message-ID-Hash: QORERMKIX4KJA5OOLGS3YXKQ2F3AICXY
X-Message-ID-Hash: QORERMKIX4KJA5OOLGS3YXKQ2F3AICXY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QORERMKIX4KJA5OOLGS3YXKQ2F3AICXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Saravana, Rob
Cc Mark/ALSA-ML, Geert, Laurent

I got dead-lock issue on drivers/of/property.c to call .probe() 
I'm now using v6.11-rc5.

I'm using 3 devices, and these are connected via OF-Graph.
These are connected like this so far. Let's call it as [Style-A]

[Style-A]
	+---+  +---+
	|(A)+--+   |
	+-+-+  |   |
	  |    |(B)|
	+-+-+  |   |
	|(C)+--+   |
	+---+  +---+

These are using port/endpoint to connect. It works well for now,
no issue I have so far.

(B) is connector for (A)-(C) data, thus, (A) and (C) should
be probed first, and (B) needs probe later
(For ALSA member, this (B) is Audio Graph Card2).

Here, (A)-(C) can connect directly for some data.
Now it is using both data connection (= (A)-(B)-(C) and (A)-(C))

Now, I want to disconnect (A)-(C) connection, like below
Let's call it as [Style-B]

[Style-B]
	+---+  +---+
	|(A)+--+   |
	+---+  |   |
	       |(B)|
	+---+  |   |
	|(C)+--+   |
	+---+  +---+

Then, it seems dead-lock happen.

In my debug, it seems...
	- (B) is handled as supplier for (A).
	- (B) probe() is called, but it needs (A) info which is not yet
	  probed. So it returns -EPROBE_DEFER.
	- Because (B) is not probed, (A) probe() never called

In [Style-A], it seems __fwnode_link_cycle() is called for (A)-(B)
connection, so the dead-lock will be solved.
But it is not called for [Style-B]. Because of that (B) is always handled
as supplier for (A).

If I used below patch, and use "non-supplier" property on (B), this
dead-lock issue was solved. But I know this is not a good solution.

I think it is very normal connection, not super special.
How can I solve this issue on correct way ? Or how can I indicate you
my issue more detail ?
I can add debug patch and test it if you can indicate it to me.

-----------------------------------------------
diff --git a/drivers/of/property.c b/drivers/of/property.c
index def152c61049..2f08210c2ea4 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1502,11 +1502,22 @@ static struct device_node *parse_remote_endpoint(struct device_node *np,
 						 const char *prop_name,
 						 int index)
 {
+	struct device_node *node;
+
 	/* Return NULL for index > 0 to signify end of remote-endpoints. */
 	if (index > 0 || strcmp(prop_name, "remote-endpoint"))
 		return NULL;
 
-	return of_graph_get_remote_port_parent(np);
+	node = of_graph_get_remote_port_parent(np);
+
+	/*
+	 * There is clearly non-supplier node which is connected via "remote-endpoint".
+	 * Ignore it, otherwise dead-lock might occur
+	 */
+	if (of_property_present(node, "non-supplier"))
+		return NULL;
+
+	return node;
 }
-----------------------------------------------


Thank you for your help !!

Best regards
---
Kuninori Morimoto
