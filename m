Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2A919BC7
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 02:38:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 306021919;
	Thu, 27 Jun 2024 02:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 306021919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719448707;
	bh=BGnTJxfSxqosvOwxfiQqnt8mKyLlPkPsGkY2n2azc8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JOtNfVdyfcafUrQ3Dg1ih+RxneghrCeIXrse+lCLRVaiW4oq6FVPouU0kbYlAHvpN
	 aT+MloULe2chTDGeSIWgE7IiIJRHtGtudo9HeGvgpGzIpYMztl0ZYmw+eC3ARu22YZ
	 l3kdL39De3YzdzzVCKODF5yGlwHd7ttbvuZRuVrA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E25BF804D6; Thu, 27 Jun 2024 02:37:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B3FF80423;
	Thu, 27 Jun 2024 02:37:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F5C8F80423; Thu, 27 Jun 2024 02:35:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 762F2F800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 02:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 762F2F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=K0aAqCc7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4K+NaDoQFErIQNANcD/qmukA/RsatHF7wSEUJuHJplj+hiqIfqwGf3RecsjVmP48ErfwD1VBgL6NcP18zl6rHiZDB0SMsDnj1OxNN68q1izixVa7fHA6YxlwgQfC3avY8uhkW7kOdhCYxKi+atKueCTMLP5E0YEByaaEyY5xxBP+R6bifQicGIxmWyquHqOswoJJCXT0+GpWY0KMxjqVf0UWCG4KW/7RDbPBnYwHJZ27JiqXi/Vye+F03/8Qi50A9gTW++2Mn51E66BafmhJDmzC6Z5lE3QKQyZIafV/FKER4PunC94NiuhCi3QFh7VmvAbIoxHkI7F+AB31FlsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJzIIp8WVqY5lUKfdyDWuz0OSLCazroAIDwMt1kKXxA=;
 b=Mgh4LkFJMBHcFRe9LGAa5233//zWg4GwPaAC34HMgiQHXaJefqHbous7HG/D34gLWoODRZTNQnsQVKWsTMAH6gC0aV8ktUTjnDjzRKDGW5swv/bJu9rEf8toKcL3aogkZTjy9LtJiiVj2q5ubaV67mPlh2NlIB41yLHkB/c00FPHc/HnLd+boz+gie3VmSX889s12kPkaza5IWgjFFBHSnI7muN5ILMN+1ti273OerTzND4zCUjGgZBK4TlGCmDgYvdL41bIVRajEeHfWFeUtQmejwx99OwoC16/CrrL1FGB1ljbPcalbt1eNiEsd+lEFNt/p19GVZxLVPSGvhVnIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJzIIp8WVqY5lUKfdyDWuz0OSLCazroAIDwMt1kKXxA=;
 b=K0aAqCc70kRXk5aZdIOyrQOhzLf/dO6hL53hFfc+9IWPiYQfFnGRPIIjFq+L2CUJ7CXefxvg3ryWgqfSwN6Z14vkZmMm5URLJ74draUXrUFU0waK0cx8lgoE1IPRekNUV3C9kZZ1mGQCHKmMsrLvxqsVT9r4kK6ZD511BJudSZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7793.jpnprd01.prod.outlook.com
 (2603:1096:604:1b2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 00:35:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 00:35:05 +0000
Message-ID: <871q4jql3a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
Subject: Re: [PATCH v2 1/5] ASoC: audio-graph-port: add link-trigger-order
In-Reply-To: <f243545d-5298-4634-bbbc-e87fdcd7140f@sirena.org.uk>
References: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
	<87sexizojx.wl-kuninori.morimoto.gx@renesas.com>
	<f243545d-5298-4634-bbbc-e87fdcd7140f@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 27 Jun 2024 00:35:05 +0000
X-ClientProxiedBy: TYAPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5b334a-2649-4bf4-13a3-08dc9640fd7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LR9z0+xnkG/GIOcnwtc8wPusm/TK5m1/7k3Zj4aX62bnRRetIwteByailmZL?=
 =?us-ascii?Q?AVigrBVY6tSjbQFtxh7YnrWSsTHO+ucGJWVSBHeCXToSmhPaXs/B6i2N6Yl+?=
 =?us-ascii?Q?QOrCVQN9zBXQSr0p0hf7g8vAs+51Zi3wAIWDvwJKtFT5BPN6C+KIqVXAGLhW?=
 =?us-ascii?Q?uZXpJIsg4CHzSDRBzLJbwIrYwr86QFGvxttp6iKXTfsXmAPJdPZQGw2+GV52?=
 =?us-ascii?Q?vyh6mYR9hnsZaiedEqILDuv+OgXQ6f4b+I+xVxy3QrpOjRhEIegkO2jsri4Q?=
 =?us-ascii?Q?2TvZzt4n6oHBQDh8LMLyuG3izQK3TQn3epXx2s2laGb8x66lmFwxcQHe09v9?=
 =?us-ascii?Q?1ZHZJbh++skkTRg61X29F/Pm5NjBO79UnEeKVC5Nqkr8hxVmCE9/B8yPPpiu?=
 =?us-ascii?Q?+KIMoS2q9ELqFL5rX6UKayCfXwLCkcR5TrErtg+NjA9BdIwI/cUIuvo4V6sN?=
 =?us-ascii?Q?m/kxqD6ybOgvIhQHAFznRq2SB1J3qcrf26yXCIo7jrxKPa1eNAL+ryRYyp5+?=
 =?us-ascii?Q?dn6nP5RE1jE1XqUV92bu5YoM+ym3o+tpapQg5vTUsMuZBGlgBFT44kqFIu5H?=
 =?us-ascii?Q?a/P2r7pR91Q6VN5FPxzxg8M/8OvPCC5P5w4ki3UlxQcgLKuOItsuAmomH56e?=
 =?us-ascii?Q?KoOWLHxxhxun4HtH9H5mlBx6X0n8cci+6aZEhUGzxXJ9GOyvbrP1bweLYICo?=
 =?us-ascii?Q?TAXuvjTjqSzkTarfYH7hhGc4XOzVfplaEf1RMMPGnpZxNxqesetvf6fcNLsj?=
 =?us-ascii?Q?RT1qMeI3IDdSWp+K4n39V5Kd55rEzCvpQkRqdbTjhHm5Ec+NTIOl9eR9aH7/?=
 =?us-ascii?Q?ATmSgyVtEG037PScGC+RYRL2PWp6+yBdB6oyoPs19KDfE46Ul35881n543ni?=
 =?us-ascii?Q?E2MvJDYhC9sRwmF+HRSSa8hZNSIcMyJCBO78IXPMJrXJv5PB87Ig7gtoY8Xj?=
 =?us-ascii?Q?ty3qGNqoneTsI8+uuIP6hKyHHIR31cyTmZUYn6dBKnb1/SwsxDgmXM6cVJWT?=
 =?us-ascii?Q?NXLl3UItJ/n9LjHBMmmEhA1jre9CTxx+v2wGAH1CXjhdaassRJ1xVAibE2Zr?=
 =?us-ascii?Q?9O8LhOay0mFiWkfEgEQVUhU36R0gexPF8SfwbHivBApbcaZB3gch4W7FIsDh?=
 =?us-ascii?Q?JzxZxoXin2uU0eMIj05QP2++Ksw/fAo9h7L62iW/GGUTocVTvcZTnduLRwe3?=
 =?us-ascii?Q?Q4OZvMda6OMbF7QPWD3+2A9Kt3QVSCnCl37YdFb8Xb5Pkctv2iaqSXQYRPPP?=
 =?us-ascii?Q?NwSS+d3Zd715D7agls3xJ5/dO63fhF3cA4MYbheS3jY6Ux7+sDOgxRFEIezX?=
 =?us-ascii?Q?cjMfe8kpcZQ5ONxDh6dszGZMI0IvhyOmw0Ya/EXWEypWSYWRZ1ELLB/Vm8lq?=
 =?us-ascii?Q?kxaQOG0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I2iE5DqIk/gZSN7Rb+b5bq5v7lUJx0wEN5JrJ0EbUXd+tnvmby0h9e5ixuTY?=
 =?us-ascii?Q?jjJkJN7EYBSUuRDHmr+Zefx21newwD/Hc1VxflnRd4jqC3fug5Z9Cz2yaGu7?=
 =?us-ascii?Q?4b5myll7jqnKloTO9lSehNLzd2e/iLw3zOYLi5A/NiyJM5tkSdnc3ScopLbb?=
 =?us-ascii?Q?DUse5nv5BQ3VLy4fGWSrHv9wfCu7uj1Pkt8bPjCi4fzX2L0dCD3ZoV8k10l7?=
 =?us-ascii?Q?iW5x06pykLZtF3x+dQydVd6wXqY7gKYJSJLZdgMBtePHJULNNh/dE6Az0JTp?=
 =?us-ascii?Q?sNSQGelEjHmIXWr1oCiQDTKH3grMqzfWALvgKE4OzPahfj/TS5t6iBrOfuET?=
 =?us-ascii?Q?rW9QhHnleJ/8PXqppBOpt8TKJrDbEJ7zLd8ZPB9imYJT5mHt6kEaiJVDRGxq?=
 =?us-ascii?Q?evy7+gzfAE8j8+OeeeiZXvvRrwA9Fh64nNHVnl/bRHSY/tTrwIaeyx2itI0n?=
 =?us-ascii?Q?S2DIZgXRNmWB5JSa30dDb186//jX4dfrMgWlsapUgpCKE5unaPVP3A86v2bw?=
 =?us-ascii?Q?3DMzcjCW4HVl5WPO8brB53sD8mBxgEVXdPeAZVllOWU97guRR0S/2zTC90RZ?=
 =?us-ascii?Q?Qti1NXiOkVLYKY/VmAUKYIFFq2GbAQK/mANqqmF0hhIp7gnhBsSrKK1nEekb?=
 =?us-ascii?Q?F3Q2MYQfbaBGauRbBLkDCaRPYMjTLYhNJUMDSrOGUadsV94Ts25O9iGKIUKg?=
 =?us-ascii?Q?0inB7rB/1M8xIpmf69yhlMoUZwm96v5Kh4l5JbC+/n4yLRE+AFm37qNFDFev?=
 =?us-ascii?Q?uT3RshWVzMRJF7Zh20e71Ol3si/l0hblA8cWUPEKmapnw9xNnNsyKUcOBQAG?=
 =?us-ascii?Q?UsyXB0A6ekJY6LfDMZ7KBZkTkr+Gy9l7I14b7MGiUmMQQZp1TwNEsozEhGMy?=
 =?us-ascii?Q?VIanF2d6zBrFeBK/rYA17Kx6gdsjeoQNnYgT+eDtSGUl4d6dEJqRieP3bVjL?=
 =?us-ascii?Q?acjE5DVj9kiTDYGBnb6xbTk6awaFqz1E+uUu01K6JnbCe+Ez0pEOx/lJgGRS?=
 =?us-ascii?Q?6GbLFhKzbra32o5AEzo3ctX+nO3rBHPysjwD3hrfPpdJhonIDM4BSVAMc0PS?=
 =?us-ascii?Q?hIT1S8kh0IIo+E3vfQe75+HXgelYhzJDyeBnMFwrmSVK3Ggkb2zUZGa2QKbh?=
 =?us-ascii?Q?XFIyfvR03keAlOqRT4YoiphuzhAergCpyGXoEbjL+DJAAOecRKLavTxWQKf0?=
 =?us-ascii?Q?bVwiQ2g9aX9OndaxluVkSaHJOvLaNVxDKIcuTFz2M1okorDMU5EPsjoyjaVG?=
 =?us-ascii?Q?lGCRMHFMzUWfP+78UWEfU6wLHDfwGjlRfI8sWJQFd27nRZvQkF4JcJdc5XUN?=
 =?us-ascii?Q?dD+3uujky0ctsK9ih9hECvrKemFwtcQoN2ecdicdXNeUcCgse76Odi5U3GKJ?=
 =?us-ascii?Q?X0QJRpWUkzkGUm4SwOgCl8/dCI4FY+v6K0z3UvH1tASm/VYMu6r6bSoFn72O?=
 =?us-ascii?Q?qUJtmRdUJmVHjDE7SS3badACBDoJ8OB0YydSeX+k3SaCQKFsyA6Bn68pLxPT?=
 =?us-ascii?Q?9VgImJjfLUWQDeioU30OTwthCB2XzNIbkjTVLg69Mgma2HeaJZtHUelVadhs?=
 =?us-ascii?Q?A1IvGTuVmccPvrIK+pfAHHA54UEolup8r93M9qZgx7qWYsmgEZ52YWmM0DvM?=
 =?us-ascii?Q?IVSXgayq8BwD8GU7JIcwjME=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b5b334a-2649-4bf4-13a3-08dc9640fd7a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 00:35:05.5694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JeGIZfGQlOe16DU30OZTYlJ+lhDhYR8zLtvPgLmCUnIW61mEwWcvDn4/jJfh54pbViKG41TuCpoR+j6US34BLaPL2+vBMxi1htbCTQ7Wi0rNgdNboftNtg49X71ROYKT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7793
Message-ID-Hash: ZHAQ4LT35WK4LSDL2RTRFK5EH2UOAESA
X-Message-ID-Hash: ZHAQ4LT35WK4LSDL2RTRFK5EH2UOAESA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHAQ4LT35WK4LSDL2RTRFK5EH2UOAESA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > Sound Card need to consider/adjust HW control ordering based on the
> > combination of CPU/Codec. The controlling feature is already supported
> > on ASoC, but Simple Audio Card / Audio Graph Card still not support it.
> > Let's support it.
> 
> I'm really not thrilled about putting this in the DT bindings since it
> feels like something which is likely to change depending on what the OS
> is doing, at least sometimes.  OTOH I can't think of anything better
> other than quirks and there are some cases where we just need a specific
> order.

Thank you for reviewing.

I'm not 100% sure when it is needed, but I think it is based on CPU/Codec
chip pair selection ? A device needs to start before B device, etc,
not a whimsical setting.

Other choise to setup it is to creat Simple-Card/Audio-Card custom
driver, I think. But creating custom driver only for such purpose is
a little bit too much.

If it is just a property naming issue, how about to use
"trigger-order-quirks" or something ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
