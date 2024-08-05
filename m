Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CF49472EB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:13:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 318574D8E;
	Mon,  5 Aug 2024 03:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 318574D8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722820096;
	bh=XjMBVqNlTUOWpw7Gb/9gkhR2CUqEbHUVWn+CdgGZ30k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=swLZiUcFsfgc2fiHieRJMdljZG+w2+wv5rc9UJuYkzRggTjbG5T30H+tiwTSx3GRG
	 n62MbeorpT+L7cENYqRAXWLC/Be7+O9EPQEvOZkLiRzTFnrLy5naf1VeA8EWrBv7N9
	 EnfDg7XuoCxocPEfkdbdy9Fc4FX3wS/qlVvdAyoQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DB5BF89F83; Mon,  5 Aug 2024 02:44:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 562DEF89F7D;
	Mon,  5 Aug 2024 02:44:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F304F808C8; Mon,  5 Aug 2024 02:44:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 142DCF8023A
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 142DCF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dmijOjPd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRkf1QS04NxjfFB6ytmbhnVjg3r0jADS7hjiQnvX53MICbo7ny6r9CrmN/lw9URP1TzN8KEWEyJN4YdWt73mBtqOXE+ayajeYA1GdKpuoX14Pltz5ZN2se5DU6cXEFInTh2isjl3SScmqqXht9tqt8uTxjDEl/P/gp6ShXmxLbnKawSjK7cG0++jzUfFams315qZWvPi9nE+sJ1UnNfOjl5b67EcS2nLgvNl/5Ov3uwg34QgSRRB/HjCk4l6iGaSt9zVnw9vsW6mphD8bf+H8MDKgtNT3cErx4yot74fWQ422JJvnm7YnD2U83T/P5bWFNi5h664xs/jY0TIJHti8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1uSGCvxZ03WSJ8CNiRMGJ39LJB+PUIOfv/6+QH/kDE=;
 b=ih1NIMuQL+zf1clwtP0LqMWnJYbXrpKrQ2EGVssW8pHHITlW+j38UX3cnvXJQgzfPoU1WCoFoEk1TD+nayA0mXJq3EAjl8ObN9yasH3UEf0V8701PhDvDBsjXdS5uy8kl3yEKstQKna3Z6NR8qEGkYJ2qmh3PGIk9EZ2SR52MHviPwgsaRtGzZud1t+nKPJa5i+t78RpRdQ2zMFgJ66eVGKOHOO818R9BBHeuEgZbMkeHzwIoEGLg6cFBWJ8rRqM4g0VBrDv0B1/vtrOhOZRxCmx25IdBcEfEL6NGaTHDw/37ZqJIGxYdWiYNoAySz/ji6AF7BxErbGMVTc/1RVmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1uSGCvxZ03WSJ8CNiRMGJ39LJB+PUIOfv/6+QH/kDE=;
 b=dmijOjPdGccdE1s/7uG21ixP82V8Rou/iOIUfxG85cFjuI/MR9eaTxOE/QWjnfZdvKs7OMP94m8jN3jRe6Y3vpbdCr/961NbA4HKxRXMxxO5R5LOm1zTOjBNEgcbT7HzkJ5wuJBbF54TVgVbV7OX2NkhNMneGY1U5TYfDk96Elg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7846.jpnprd01.prod.outlook.com
 (2603:1096:400:183::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:44:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:44:14 +0000
Message-ID: <87sevjvlwh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 108/113] ASoC: mediatek: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:44:14 +0000
X-ClientProxiedBy: TYAPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b5560e-9aa9-4fca-a186-08dcb4e7baeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8hVWq472DHZkiLbK4G6Drbk8ya0zKQApdfzeEJfwRZ5qRhBRt2nnTP0JV6se?=
 =?us-ascii?Q?oZrofVuPlk3aT25Hr9nlhGx/gjqU6dXt0IIRqCXQghrcZtS40TPx5UTwg8n2?=
 =?us-ascii?Q?Dbgt/Gg386/yw5dBV0s3TkffIRylwd2HNFycc7WMVD81Tfu3F4zuggto6SK0?=
 =?us-ascii?Q?wH4FS2FksPx3ImNQxfE2DEjgZECAChfxzwiZFgX5k+cr0lqI67gPoFcb4pss?=
 =?us-ascii?Q?7I4OiYbqvKpSIbqTkpTLCZK+ypIn/Ll5CNMJHIoDhsEA9IuxXX73pbBWyFiE?=
 =?us-ascii?Q?/vd570JX+HvnSX+zRjjITmMxDjXVYEQ9ULadG94wmkeMNGZujIPySQ896D7f?=
 =?us-ascii?Q?2ngbtTV4tVa8Nh7dXcl8Z+nBVyS9/WUif42RgTr6oAO197bJ3dSxHZc/3Je6?=
 =?us-ascii?Q?diEwqjfTwpEPIv3x2cbcxy9ZfW0nlKkczifXmTMTrV1A/0+gywoNrPQZh2Wn?=
 =?us-ascii?Q?TkLTnTrhgkmrx/HvmMVStZEI/a2gwC866Qg0I7krtofQDKaFPTn3n39IkIqY?=
 =?us-ascii?Q?VsFgTf3fg0guRc7ofXfdOPyp6kb1URI5iwvd61wA/S/8+cTekcLZuDbOwe95?=
 =?us-ascii?Q?QOuiADx1KAVdDsZTS1szrRPSybajkGQm9m5iKgW/HU++eMlVE4Nep7juYw9n?=
 =?us-ascii?Q?D7GtijgaesVrWo8b2w/CAaL+DSwp3uffe7OX5nj5tS+rfOHgFf4JvnLjYhx6?=
 =?us-ascii?Q?mNwNUkFDXNcG8nS2yDf7k+hUWqDrfMl2K97/medjJCaEUBknInI+v8JaMkZ5?=
 =?us-ascii?Q?CdtxbC46qqgfxXV7LsN83aKSUJolWmheAjMvGGQ48wXSnZN6COo/PRvkjMsW?=
 =?us-ascii?Q?0rwBsO0XQRh58yUQhxDjn1ZOvJfVZU2OogKt81OqHuC9+yUDIHa468SU0eNt?=
 =?us-ascii?Q?qXeHDPPfBmoo6ZrMYiBqIOanhHbP8XSCKDnz7B+Uy9/KoDh/WDX+McfpEiEs?=
 =?us-ascii?Q?Kh6NPQ/VmPj9cWFxsptQ1KSU0SfCUihdvYagOpK7sy9gOnGWaXql8Gas8IfG?=
 =?us-ascii?Q?aCB2LkoiXuk2Atq6nu+780Kw0jZ/VsUUvR4Xqj1Ugxjj+4INqYVS0QDCHGsp?=
 =?us-ascii?Q?45YLnPLeZjANH8DsOOShNQn24T2k1Qmivx6dl1TFDuGMKlhLyXYf4FGBsqhT?=
 =?us-ascii?Q?PQhEC30C5mr2Gm0zVYW9FVhnJ/zMBK7DZAEAHHDxCVLVdE/NnglUKpgskgEO?=
 =?us-ascii?Q?yDu8WMWEr3P0RuedI69b6CYE61wprNH6z+9tf8fhkYl0lYLDAxOusVIQUSOy?=
 =?us-ascii?Q?weEchb5VAj3g2oToDdbO5xLZbiBzeZ0uL9pZOFpdRRQhOy3Y0MuRxGTMEaru?=
 =?us-ascii?Q?PupygbsyGL0kwKqxLrzRfHVJv9m1V305G5QAtc05b7/szu1KLGehE7G/FOrO?=
 =?us-ascii?Q?VSdH8oHpuZmu//xpRRwi7tJsiC8FEgs1DwfiwTF7/aq8kNxRgw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NUQ9e+wTtsdmdjpwbBl2PsI1CAToQJyGhkDSYi7DOWsObI/XuHbP+2ndiH6X?=
 =?us-ascii?Q?pE4rBTi/jbJWL0+OnIQZe/qw7r4K7DerRFQv+IVprzOJB/tqdEZYkr1Eaemz?=
 =?us-ascii?Q?qyAv4ZiHV2xkp4J7LzM9+rT9BZUgPL+FfELU2CIPt2gz5uANDWefKCHf5UVQ?=
 =?us-ascii?Q?SvastcxKa7Me5DZFLuGkB79meDsSbntyz5JxLdet02llHOtQHbQsmv9mWteT?=
 =?us-ascii?Q?mqcvg/PTNNl7A9XsWYkoo6L5YXrE8T5iveMUaN8Hpt4WHgKJjmSKA4hiEjHW?=
 =?us-ascii?Q?pzzeEP59lYVUsxMXUtS0gR0IkwnHyKJ/a3ZfES+2IL0Dlx8I9P52QJr7cHas?=
 =?us-ascii?Q?q5aaKEf5Inqx6svgBRz7aXnY+UCTg6nWKm+puXNjkjDTkRKxOzATe8Lw4vnw?=
 =?us-ascii?Q?mQUIxSftf/YdqK+3GIXe0wowdQlvDiRt9A1vj7v+YnXwrgWCIzm1n/HWg46l?=
 =?us-ascii?Q?y71RWXUY6VQLfNd1s7jBnDwkm9O2kQDfIY8RwMoeUJXP8ItdVr8ObsYBRRrs?=
 =?us-ascii?Q?6+LL2KOR3x5k7czZ2aVxHFljiwD+CKKpQRyYiDb70r+KK9V6IZgtT7l3gyyj?=
 =?us-ascii?Q?yepKnacEvfkXYNDlqDlXD2GgurG3Ut4pgPU9QtQq1PcO1epuY1glJytKUY1S?=
 =?us-ascii?Q?7b0XzMXtb4odanU3gnmMfnZt4NADj3WlmO2UhQRB9HRLBJMCOE4P72Mabj1+?=
 =?us-ascii?Q?SGJ4ftH9cqOXcWh8IAuUBUKI6zVWpeE7TX8kto3ULeiLMQymL45BtGQgHL/o?=
 =?us-ascii?Q?1KyqhsHZTWQe/2ztaj1Qhcv7LgYqb5veKmGASTgkJ8W5mf17FH+HTXQuaT41?=
 =?us-ascii?Q?X5gyF9FTCEW39Os6aS247FOpbZ3WZLHUhndFi+qhj9Pz2AIBgX+9OYnqzUfc?=
 =?us-ascii?Q?LPCYRmTt92ybudNW4gPl8NzXnZ7d2Z7R/ekE3dolQcMsZGz7aQvUc7hefGti?=
 =?us-ascii?Q?/5NtBMhINHT7UuUx6ecATriRFyoyrIJuB3dQbgzoZ9a8YmWlWTH3u2Zmhr3+?=
 =?us-ascii?Q?9bHhYcdUE1UcyFYZcmA9rXyGOw3EM8LJ48YtNbQixUcCC+IanEmj1CwicoPI?=
 =?us-ascii?Q?FQE42ZYBd4aGVBAjn6LSN1OuOoyekxWCyymhxU8iAm9FnwyLOxF7XCeblI+D?=
 =?us-ascii?Q?m18FrzUNakBUXyQutTpbmtBeQu01LU8E+fLK9w49ede/8MMx2dHLML8QVsS9?=
 =?us-ascii?Q?tn3PF59Xq7wFVMzUa2V1eLn9NYC8i18l18Ip1SrNP+Uh3EQLxHkLm8iLlBA8?=
 =?us-ascii?Q?faENIUnBUU7TpdHcMRGImbxv39XWf5map3zwwH0IqWVVbqt0MgkfZrKi/9fq?=
 =?us-ascii?Q?n/NAPikzuqbzTL9NLhRcNEuWWv8BMIJs/7jTEHYofxvI8EylZOqxZy++GAQZ?=
 =?us-ascii?Q?Ah0c53h4wNVX22vzF+zULJj0YRIV1GxXsFKCVIC/2lQpIRoXo8kqumVWgjSL?=
 =?us-ascii?Q?LYaLn71oVv7yjeOh7AaJB/V1D4PnK/Q0jNuKkgQMY04d35lBxJAEWja2bKxq?=
 =?us-ascii?Q?qL1cA0rB1xgaq5Ht4uS1nXqDG80ZGkMLuLB3z6ns03FLTNopW6dvi7iHf5Hv?=
 =?us-ascii?Q?cpkyum2uEJNsHCAJKdEM2EfxfMWauOfJcdNvHPONT/TkcGBJLrkiXMvJIzA2?=
 =?us-ascii?Q?IIrnYxI9ASD2eue9jTRqYx8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18b5560e-9aa9-4fca-a186-08dcb4e7baeb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:44:14.7049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bDejFYYgUayUKKFLyp5bX0ipcr16+rN86FB/IACXI6Fp2WFdpvJzjwFMxc8GhFQfA+/CztTK0kQ9OpIagdQwFTFDf9Cgz6PLfVtDPhoRX2MwPxauGcD50PGcRVsevo8s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7846
Message-ID-Hash: HTSURW6HRRYPDBBWATOY7UUYRYQX76JE
X-Message-ID-Hash: HTSURW6HRRYPDBBWATOY7UUYRYQX76JE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTSURW6HRRYPDBBWATOY7UUYRYQX76JE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c     |  4 ++--
 sound/soc/mediatek/common/mtk-btcvsd.c         | 18 +++++++++---------
 sound/soc/mediatek/common/mtk-dsp-sof-common.c |  4 ++--
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c     | 10 +++++-----
 sound/soc/mediatek/mt6797/mt6797-dai-adda.c    |  2 +-
 sound/soc/mediatek/mt8183/mt8183-dai-adda.c    |  2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c     |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c    |  2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-src.c     |  4 ++--
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c     |  2 +-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c    |  2 +-
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c    |  2 +-
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c    |  2 +-
 13 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3044d9ab3d4d9..71223feefa1af 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -61,7 +61,7 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 	 * This easily leads to overrun when avail_min is period_size.
 	 * One more period can hold the possible unread buffer.
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		int periods_max = mtk_afe_hardware->periods_max;
 
 		ret = snd_pcm_hw_constraint_minmax(runtime,
@@ -268,7 +268,7 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int pbuf_size;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (afe->get_memif_pbuf_size) {
 			pbuf_size = afe->get_memif_pbuf_size(substream);
 			mtk_memif_set_pbuf_size(afe, id, pbuf_size);
diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index c12d170fa1de6..a896f0c01e600 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -647,7 +647,7 @@ static int wait_for_bt_irq(struct mtk_btcvsd_snd *bt,
 
 	while (max_timeout_trial && !bt_stream->wait_flag) {
 		t1 = sched_clock();
-		if (bt_stream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(bt_stream->stream)) {
 			ret = wait_event_interruptible_timeout(bt->tx_wait,
 				bt_stream->wait_flag,
 				nsecs_to_jiffies(timeout_limit));
@@ -850,7 +850,7 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 static struct mtk_btcvsd_snd_stream *get_bt_stream
 	(struct mtk_btcvsd_snd *bt, struct snd_pcm_substream *substream)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return bt->tx;
 	else
 		return bt->rx;
@@ -879,7 +879,7 @@ static int mtk_pcm_btcvsd_open(struct snd_soc_component *component,
 
 	snd_soc_set_runtime_hwparams(substream, &mtk_btcvsd_hardware);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ret = mtk_btcvsd_snd_tx_init(bt);
 		bt->tx->substream = substream;
 	} else {
@@ -909,7 +909,7 @@ static int mtk_pcm_btcvsd_hw_params(struct snd_soc_component *component,
 {
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(substream) &&
 	    params_buffer_bytes(hw_params) % bt->tx->packet_size != 0) {
 		dev_warn(bt->dev, "%s(), error, buffer size %d not valid\n",
 			 __func__,
@@ -926,7 +926,7 @@ static int mtk_pcm_btcvsd_hw_free(struct snd_soc_component *component,
 {
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		btcvsd_tx_clean_buffer(bt);
 
 	return 0;
@@ -958,7 +958,7 @@ static int mtk_pcm_btcvsd_trigger(struct snd_soc_component *component,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		hw_packet_ptr = stream == SNDRV_PCM_STREAM_PLAYBACK ?
+		hw_packet_ptr = snd_pcm_is_playback(stream) ?
 				bt_stream->packet_r : bt_stream->packet_w;
 		bt_stream->prev_packet_idx = hw_packet_ptr;
 		bt_stream->prev_frame = 0;
@@ -987,7 +987,7 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 	spinlock_t *lock;	/* spinlock for bt stream control */
 	unsigned long flags;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		lock = &bt->tx_lock;
 		bt_stream = bt->tx;
 	} else {
@@ -996,7 +996,7 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 	}
 
 	spin_lock_irqsave(lock, flags);
-	hw_packet_ptr = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+	hw_packet_ptr = snd_pcm_is_playback(substream) ?
 			bt->tx->packet_r : bt->rx->packet_w;
 
 	/* get packet diff from last time */
@@ -1030,7 +1030,7 @@ static int mtk_pcm_btcvsd_copy(struct snd_soc_component *component,
 {
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return mtk_btcvsd_snd_write(bt, buf, count);
 	else
 		return mtk_btcvsd_snd_read(bt, buf, count);
diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index bca758dca2c9a..050a72b5fc21e 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -200,13 +200,13 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 				struct snd_soc_dapm_widget *widget = snd_soc_dai_get_widget(cpu_dai, conn->stream_dir);
 
 				memset(&route, 0, sizeof(route));
-				if (conn->stream_dir == SNDRV_PCM_STREAM_CAPTURE && widget) {
+				if (snd_pcm_is_capture(conn->stream_dir) && widget) {
 					snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 						route.source = conn->sof_dma;
 						route.sink = p->sink->name;
 						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
 					}
-				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK && widget) {
+				} else if (snd_pcm_is_playback(conn->stream_dir) && widget) {
 					snd_soc_dapm_widget_for_each_source_path(widget, p) {
 						route.source = p->source->name;
 						route.sink = conn->sof_dma;
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 6a17deb874df7..6bad411dcf243 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -160,7 +160,7 @@ static void mt2701_afe_i2s_shutdown(struct snd_pcm_substream *substream,
 	mt2701_afe_i2s_path_disable(afe, i2s_path, substream->stream);
 
 	/* need to disable i2s-out path when disable i2s-in */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		mt2701_afe_i2s_path_disable(afe, i2s_path, !substream->stream);
 
 exit:
@@ -192,7 +192,7 @@ static int mt2701_i2s_path_enable(struct mtk_base_afe *afe,
 	      ASYS_I2S_CON_I2S_MODE |
 	      ASYS_I2S_CON_WIDE_MODE_SET(w_len);
 
-	if (stream_dir == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(stream_dir)) {
 		mask |= ASYS_I2S_IN_PHASE_FIX;
 		val |= ASYS_I2S_IN_PHASE_FIX;
 		reg = ASMI_TIMING_CON1;
@@ -250,7 +250,7 @@ static int mt2701_afe_i2s_prepare(struct snd_pcm_substream *substream,
 	i2s_path->occupied[substream->stream] = 1;
 
 	/* need to enable i2s-out path when enable i2s-in */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		mt2701_i2s_path_enable(afe, i2s_path, !substream->stream,
 				       substream->runtime->rate);
 
@@ -368,7 +368,7 @@ static int mt2701_simple_fe_startup(struct snd_pcm_substream *substream,
 	int stream_dir = substream->stream;
 
 	/* can't run single DL & DLM at the same time */
-	if (stream_dir == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream_dir)) {
 		memif_tmp = &afe->memif[MT2701_MEMIF_DLM];
 		if (memif_tmp->substream) {
 			dev_warn(afe->dev, "memif is not available");
@@ -387,7 +387,7 @@ static int mt2701_simple_fe_hw_params(struct snd_pcm_substream *substream,
 	int stream_dir = substream->stream;
 
 	/* single DL use PAIR_INTERLEAVE */
-	if (stream_dir == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream_dir))
 		regmap_update_bits(afe->regmap,
 				   AFE_MEMIF_PBUF_SIZE,
 				   AFE_MEMIF_PBUF_SIZE_DLM_MASK,
diff --git a/sound/soc/mediatek/mt6797/mt6797-dai-adda.c b/sound/soc/mediatek/mt6797/mt6797-dai-adda.c
index 78f3ad758c120..baf5a46781071 100644
--- a/sound/soc/mediatek/mt6797/mt6797-dai-adda.c
+++ b/sound/soc/mediatek/mt6797/mt6797-dai-adda.c
@@ -158,7 +158,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d\n",
 		__func__, dai->id, substream->stream, rate);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		unsigned int dl_src2_con0 = 0;
 		unsigned int dl_src2_con1 = 0;
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
index be69bcea2a786..8317fc1cc5e25 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
@@ -276,7 +276,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d\n",
 		__func__, dai->id, substream->stream, rate);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		unsigned int dl_src2_con0 = 0;
 		unsigned int dl_src2_con1 = 0;
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index bafbef96a42da..08776982e44ff 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -184,7 +184,7 @@ static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		 * for small latency record
 		 * ul memif need read some data before irq enable
 		 */
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+		if (snd_pcm_is_capture(substream) &&
 		    ((runtime->period_size * 1000) / rate <= 10))
 			udelay(300);
 
@@ -219,7 +219,7 @@ static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		if (afe_priv->xrun_assert[id] > 0) {
-			if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+			if (snd_pcm_is_capture(substream)) {
 				int avail = snd_pcm_capture_avail(runtime);
 				/* alsa can trigger stop/start when occur xrun */
 				if (avail >= runtime->buffer_size)
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index dbd157d1a1ea2..5243e263c105d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -565,7 +565,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d\n",
 		__func__, id, substream->stream, rate);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		unsigned int dl_src2_con0;
 		unsigned int dl_src2_con1;
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-src.c b/sound/soc/mediatek/mt8186/mt8186-dai-src.c
index e475f4591aef5..5071fd69281c7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-src.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-src.c
@@ -560,7 +560,7 @@ static int mtk_dai_src_hw_params(struct snd_pcm_substream *substream,
 		__func__, id, substream->stream, rate);
 
 	/* rate */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		src_priv->dl_rate = rate;
 		if (id == MT8186_DAI_SRC_1) {
 			sft = GENERAL1_ASRCIN_MODE_SFT;
@@ -596,7 +596,7 @@ static int mtk_dai_src_hw_free(struct snd_pcm_substream *substream,
 	dev_dbg(afe->dev, "%s(), id %d, stream %d\n",
 		__func__, id, substream->stream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		src_priv->dl_rate = 0;
 	else
 		src_priv->ul_rate = 0;
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index ccb6c1f3adc7d..2058e0aa63993 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -397,7 +397,7 @@ static int mt8188_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 					   fs << irq_data->irq_fs_shift);
 
 		/* delay for uplink */
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (snd_pcm_is_capture(substream)) {
 			u32 sample_delay;
 
 			sample_delay = ((MEMIF_AXI_MINLEN + 1) * 64 +
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
index 8a17d1935c48f..58e1795bfad92 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
@@ -414,7 +414,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 
 	adda_priv->hires_required = (rate > ADDA_HIRES_THRES);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		ret = mtk_dai_da_configure(afe, rate, id);
 	else
 		ret = mtk_dai_ad_configure(afe, rate, id);
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index 99de85b876435..5fae5e877d449 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -1067,7 +1067,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	int id = dai->id;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		unsigned int dl_src2_con0 = 0;
 		unsigned int dl_src2_con1 = 0;
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 8da1587128ccf..18c63f7fc5407 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -638,7 +638,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 	else
 		adda_priv->hires_required = 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		ret = mtk_dai_da_configure(afe, rate, dai->id);
 	else
 		ret = mtk_dai_ad_configure(afe, rate, dai->id);
-- 
2.43.0

