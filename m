Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D7E96CC93
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 04:22:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C253E9F6;
	Thu,  5 Sep 2024 04:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C253E9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725502933;
	bh=TSwC5XkYp2mINLH6gZttJ4Cj3F174g4Cea12pm61Euk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tWiH9yBkzHfuSPXSzV5pOu1NVBUamtmvg4GW4cqGtqM9YMUA3OlHt3MQt+OPt2EEX
	 rLyFqiCBX2BUxwUpZiCXg69QMZDDvoORmtJpkn6ZCcgnbl4hABqT+WOBde6TXreWI6
	 Avk917g9bYIA1GO5NpDxUmef9S9akJlVLWY5b0uQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAA60F8014C; Thu,  5 Sep 2024 04:21:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3117F805B0;
	Thu,  5 Sep 2024 04:21:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD87AF8016C; Thu,  5 Sep 2024 04:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71749F800E9
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 04:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71749F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PDiSBK7Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6AQrIYw1Zewkmf9UdPodHRaU8aNh2M9Wt+ARBNxps5CCsfcat+j+Q2/xyJzz1+HvQFuF4rJhSyoUIAZh/29leKMBTLacYkhfNm7YM3bSAF2P9TSK8Ac9ZJImbSDK84OAcHeXu+SHGwEa749ztBbsJQIswAa5IDaRpHao9mQDJw+R57v1ZVg8dJ/8Cv3jdm/SCSyM+PoOB07DvC52kBCoe8nPFaQrR0Z8emjKLmgvWvVrcjZ7EbXQffghY1fzL7yTJqNPXvn+sypjwV/W7xexHNpdFCwp0OVxMgLN+Gj9NXx5xAyznkV+w0G5mAgvzqtve+T3QsaPKaxobMz98mRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD4YrdQflAsUA7hZxRqZUO/iR7hBRuov43LsCtoy4Iw=;
 b=C7EmXkeUTUy4vj07Yd/g50hPnOTd4mVNdD78d0YwLTF8ifkNV/eRrFaW30bPX2fEY8VEG1Cw9aWlI7TXdZWIx7RJ4WK5KRJNhHZBBRcPa+Kar2BvkVkVl5CVkBKQLQMESToSTETxlUTC+qPwvhG49zsqE/cXvu38t4zuaweXBhAkoy2VbL7f11AYWuIL+n5EQINgXhAHfnG5ShmQem8+Rpft6K/M6Q5IB8lbBqTJmNVFnEKdvd8O0KwRQJTc1IpilxV4i2SCNpntM63OqDFwCSoguQvfJ8sj4Lcy7NzSCqOjGNO1zhopwbkUe4x+eP/xjQ9VG184Kzyj4ldduyeyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD4YrdQflAsUA7hZxRqZUO/iR7hBRuov43LsCtoy4Iw=;
 b=PDiSBK7ZA/nbk1HVbrUCt36aNfqOv7Kmed/bfacaeves0iSEKM6PZCFlGQAgh4/r8Yfr4xTiJL64IWU9+4V6DWKzqf7bc8BtmcE0Ohb93ZRA1NNWVh1EzRji348NnSDkAHQGTB5h1UvHOOJCdwr9a61TdrEUrMl5WUZb6xDdh3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12306.jpnprd01.prod.outlook.com
 (2603:1096:405:fc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 02:21:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 02:21:37 +0000
Message-ID: <87plpikfgv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: How to handle complex Codec2Codec
In-Reply-To: <fe428f02-3eca-4dce-9eef-675cf3e56831@sirena.org.uk>
References: <8734moq6ca.wl-kuninori.morimoto.gx@renesas.com>
	<31fb2975-4a27-43e5-b9cb-37db3206f5f3@sirena.org.uk>
	<87ed62ogvp.wl-kuninori.morimoto.gx@renesas.com>
	<fe428f02-3eca-4dce-9eef-675cf3e56831@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Sep 2024 02:21:37 +0000
X-ClientProxiedBy: TYCP286CA0096.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12306:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfb82a3-77b5-4ed1-8ae0-08dccd51782f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ke5tNs07R/fS1zN3s7W+wn6GB4YPPIzCQCulJb994VRpXZNu4ywg0huMAMox?=
 =?us-ascii?Q?xX+T2xhlh883hrHDpX3EC9PqMwak7pl0a42TbXnqgzWt95v+CgMb2Xb9PK5X?=
 =?us-ascii?Q?CwDqtva/d6+tVlHJF2b0AAXSBcYfVvJl3VAAkoNzWlAxWe9KB7DVGpHcBjqn?=
 =?us-ascii?Q?rT8jcAw0hO6p+0G1XYaq8R5u/0ik6wVE16a9bDG5VW28QyMI5smLe3Xft51k?=
 =?us-ascii?Q?9CsGc6DhPoNVYT/AlZQ1k1INyK6cSw7isPg+va+J4RnEzbNdlgVc+1tq98nm?=
 =?us-ascii?Q?VsAkf+wONbKpOopWEstwxRmE7FWJOtVFaFVmiiUu24JXi2r1NeqczF2JfASH?=
 =?us-ascii?Q?DnTCNc582NnonbyLhNpI3nBfrGdDa2n7KTGQeFoqxqjkszlXbJ56W6Z5GFvM?=
 =?us-ascii?Q?F1WU6kZWL0eJlYCaVfWGd85oJLnU438qmtjvm9hUJILQJZ8iLfbX1wQhz2iy?=
 =?us-ascii?Q?Rzqdt++SKwD5CKDoMDY1k62viEtDHSqGcBlqf5Jrq0thslWO4GIcsndefdEe?=
 =?us-ascii?Q?AnWk2Gj8uIDNqsRAHKf8wHjVlwCINWIvug8qLN0Cz2+nMludZKOZmrOKd65N?=
 =?us-ascii?Q?aBH7/iw0Xj2oreO0K6KAchgXJrAPn7Qeh27rh4cDgjMotPUGj71OPX44qGVR?=
 =?us-ascii?Q?oGldnUpxHti8o7oDD8fVBOObP75VxSv8Xq26z634sXDt9C0F4YFWHD2xegqJ?=
 =?us-ascii?Q?nEpFHiRCVAUZuIKMxAPgz015L5bGQqJQO8SUVVa8an1AMTqDKtfFKBH9xCrx?=
 =?us-ascii?Q?TCkZHGjR/IUI1AgbdThzBROyjiLmiuJz1kXnH0WZHkuxjYHf1wetVu1jkE3y?=
 =?us-ascii?Q?bRwRgGIoO4MCSbAMzPChse93/2KiYto9oTWB9SiIS1Bvb1bfAGni1Wkb2boB?=
 =?us-ascii?Q?YR2OHnZKfcKCf8bidhT/COCxkb3/sFkRQiJcyF42NZ4NFELsRuRv9T+DjqXy?=
 =?us-ascii?Q?Rmbq69s6gRnKO8RkmK5Y6SoZuznSKZQmmS9Bi1XNJVnhuzAf/QDxYUaSzY+L?=
 =?us-ascii?Q?WNcJViy8Vzu+FVpkzlzEJ0g7wj1OdbodjmNombqIM7Ars6lCrYtdRwGxbUtW?=
 =?us-ascii?Q?tHN85XkFXF7f4/Ece0RNMVNtFGohRzCAHy4B9ntxS/Piby8gaw34pejzH0nO?=
 =?us-ascii?Q?6IrlRq8M6QdRvkHlc6BUGXr1Ke+4Iia67SnMu/MCQP2oVXONYWJBsdesyu7y?=
 =?us-ascii?Q?ab8f5KD7cIV/sB+EiwhsRltA0AtC0F6bCbGsDlOac8FFYBnuqDqfWMUvh1cR?=
 =?us-ascii?Q?tfWA3/YPusmNmTcL3s9qB0bIGNuehM1a6yQNrcaYb4HTj/z6PwViIxOZUFXO?=
 =?us-ascii?Q?YZJCmPhT7jOJsM9zIxpjGTfQSVkVECdylWdoolEXQ87zKwcuFk0+2GdcoxcL?=
 =?us-ascii?Q?WR4We+1qHcYnO4M341Cn5Ml7N5/l+Yfqwk7dSmP+WwxKpzTumA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VBPHVjc85ExK0pdQllUNXaJYYozfHimcDEsejloHDJ22xi/b9SBZnxI/Amil?=
 =?us-ascii?Q?PxYlrYmfwEKkA07AkpDjySIJR2F8cStu3jWv9GkgH+Frx5UHj6DZLgOqARfV?=
 =?us-ascii?Q?bjswBCCUL+TsxsyEuO7nWc7KkeTb5wnAc2Eiqb337XBBrbRgdfjdjup75Amn?=
 =?us-ascii?Q?oELl/tjzECEv++asl0VBueVkTkxg+aXZ/hCEfasAH2wdlbSsdx4Xu0Z8r2TL?=
 =?us-ascii?Q?FE2kwvR+fMXupGmcLDzHWvUV+kBXcgUVBDoXFJjSU+gofQCdN/wseUy/rkmM?=
 =?us-ascii?Q?eBgR4s2MqTJ3BFMPvhdIUBbQB4G3iX+RwrVP/WYcjABaM51pY91mSOzVRxgS?=
 =?us-ascii?Q?TMRxedYvjDwXnjWiZjdQDfy7TR1h8nmP3xoHvJMcC4XQVcc5VbGE3Xntinqs?=
 =?us-ascii?Q?UifM9c/Nqhn5KbQ10huoOb/OB6lk+FMuqJcFGPzoH7FYj8LPFSbUeZmyW4NU?=
 =?us-ascii?Q?ftWRcq4nM3m+shSvcy8VX67zhEEM3OdNYqscGr/g61m4np5QZk6CGcgwRrkO?=
 =?us-ascii?Q?/t6ljtoHK5nivlPfU9oYWhuG+cUD/Lv+729aEHsQIisRZchmiWGMZc8Ej0G1?=
 =?us-ascii?Q?tcWUJ0tdUf2g3NfiEOqpUbCsIROhuihryoTkBKTkXg4jSV7e36rOSyuCoFFD?=
 =?us-ascii?Q?l/a9r4JsCT+/9wR2UNuXu0sDAnVVtT24tOBhQHtRAIJoR41EHCB2Ugqa0HIS?=
 =?us-ascii?Q?+qHZIRO5HXYwnnDPygL8FSZmBqr9hL1IFf6yI8UvalgDSdXuQfkbDDgTzhHm?=
 =?us-ascii?Q?niq9eqABYV0IARCsFX8nT7u0ig+tqUy6O1RYBePkdSicsewrLvidtdxhqAR1?=
 =?us-ascii?Q?SyH11km1BXPkpiUi9VtzxyXdGLzUNWElDdEowOrorRWpjJLxzUe4WUa+YYGO?=
 =?us-ascii?Q?iuHwLy+ZbJI/s+gkEP1btGCRQUBnhE1vYdq/RC5E2bauJeGrorUJMsTPnvWs?=
 =?us-ascii?Q?rqU9/veVksHdYMAbRWco76El7iRqugcVtjOUKL74aBTr5yYPss++Ndx/jT1w?=
 =?us-ascii?Q?C/BeYY70f0mvWiOlv38KedWSNPlNuuWkItB5uxJp2YD7HNarFHXW7ccuiJ/h?=
 =?us-ascii?Q?5rEidWeQbJCEYn7kCNWscKpmZBrfw8bjcNnsOvbd7uk1j/fPw3lN2LTd3krg?=
 =?us-ascii?Q?tCybh1cXYt23QSt905Od4l2IUB9lYoHUN4jX69+y4T1C+8SldU7dATnMxw41?=
 =?us-ascii?Q?lUo8f8KnZE26G55THJfYEd30+tr2XkfqufRCfcZjAhSTtD20O71oTMcLS3C1?=
 =?us-ascii?Q?AIMZvvy8fjQMwLkRNeYhMBaBCCmRWEDLdtOW3Zq7SGmtxOHuR3U4UErBbWnr?=
 =?us-ascii?Q?uH95jaS9ripFYUuHHtxiFOuyCASntweJgiuMTgmrdLmqw74Fm/BfjDnEd1Ni?=
 =?us-ascii?Q?Ye8xEjRio6bG+76bc0bwMAiKP0B35ULLAM+lCFXgJTbSnBDvrZMqbabmFTW6?=
 =?us-ascii?Q?M4f5Kztn/gYJiyrH2TL9BKb+lqhtzr2O6opx7kBuffqc+BtHpiHby6CGsOgn?=
 =?us-ascii?Q?1UJHyn41i1AeKxZ0b9TyfU7lELmTbiFsJQDAUglBZQs6mQ5PMB+bOvd4tyKF?=
 =?us-ascii?Q?Cmq7nHUal1fR9/S1anu5E3GzlaC2sFMbPSnBUowXbOwgQLGbrWCIDfde0PsI?=
 =?us-ascii?Q?4AocCh6gk1oIc1MLaNTDEsk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccfb82a3-77b5-4ed1-8ae0-08dccd51782f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 02:21:37.3249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Y5ix9FP0oZpM5EhOLjuNv3rYzQsavGV9BSqIkYA8IJ+kfRs/JniniTUWKGEItJy78bupb5CbBLaV7UliJIhMb8UjJ1nN4DhjQRavL7EgCysEXAtHnFOFz7j7ZYA0nPZY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12306
Message-ID-Hash: TS5NYTFCDLZOHQ6YHNNGX2VMW6HPD7BR
X-Message-ID-Hash: TS5NYTFCDLZOHQ6YHNNGX2VMW6HPD7BR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TS5NYTFCDLZOHQ6YHNNGX2VMW6HPD7BR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > I think we can learn how Codec2Codec is working, and apply it to DPCM
> > somehow. Then, if we can handle above via DPCM, I guess normal Codec2Codec
> > also can be handled via DPCM ?
> 
> I think that would cause trouble, with DPCM all the CPU drivers know
> about each other and it's all horribly fragile.  With two CODECs there's
> no CPU involved so the CPU drivers wouldn't know what's going on, I'd
> expect that at best the code would end up looking similar and we'd not
> gain much.  It's possible I'm not seeing something though.

Hmm...
Because Sound data path can be more complex from HW point of view,
and customer want to use it. And this trend will be increase/continue.
But it seems current ALSA SoC can't handle it in good way.

Unfortunately, indeed DPCM is fragile. We want to keep compatible,
and thus updating it to expand feature is not good idea, IMO.

We want to have new style connection which is more flexible, and is
possible to handle all connection in same way ?
... that may be an exaggeration.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
