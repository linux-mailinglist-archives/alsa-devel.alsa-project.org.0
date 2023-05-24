Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A01F8710534
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:15:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEAD674C;
	Thu, 25 May 2023 07:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEAD674C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684991704;
	bh=Rx5d8Pvw9AyS2EiR8xcCtaHIRGKDwd4DeDXnRtzXP0o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WED/SUpBvbFnxRlNhpvxXLSVmKQlnG9T5lGojIr/spctNT338Z4cJNGebzfRdh+Sg
	 4TttFUzAD9xyyk8JBD1EyIXkO5hFgy39nSFdm0au0TW6xEWGOVRZoTCVNdEDlrU60V
	 Yewf9rEnNOWUSEF57ZV3GYBxGZUp7cn0OICq75u4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14A0FF80007; Thu, 25 May 2023 01:48:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39B13F800DF;
	Thu, 25 May 2023 01:48:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DA2DF80249; Thu, 25 May 2023 01:48:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70707F80007
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 01:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70707F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VBZeFfXu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbJSAUGsdfiT+GFOTmDMZCUzFZ1qA14VTLRXeNEPX8wdUX/2Ph3STWB0xFZtWxvph1rVvIul8nrILgv7B4h1zPXA6RYS7SoTMHgYUv87bWB5XgVzNU8fDyap1suF2IuXExVNKrZGGtr5tfhWoFvs3AvDTOhZMCan0a7AksNIoIGzI5OwvC/DhOFNXkL9sB/AqRZ/RoHH+i5rxvE+womSWTz+YB9d+wRA+GqtDGekzigcD9xHQq7lVa3zzVZcEkH5PQ5PE82DYMpCrOtc0a9gbbjMbsdzeTe4uGvWq0wQhmGIX/iTDM4gKEZgD2AQHmaykGr9nT1/ukS5PQ0aePC+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSL3Vj7fabb4XthWSqD0UYF6qOLdUIfkPkGgqPJSJY0=;
 b=W0o+WZJBk29/piLmnK9qIY1hTxDa1lfHyf6SwDJ4o+u3SQUk35K5WuLnI6NW+Dg9TZib0eLoXiUAuP1p/rFdBKFrd2o1ZaUwoZ1hlsEOw6SJQ1pLgR0kOSmBLzaNAPBIV/BJ4Ij//RMZQ2k5r9hezQqoZ8zfpkaVRLbWIyu2VKkhlF37TDNLyj6Q3PQ60joNmzeWtP+xhd3PWeMOmPztzpaDz4UAlBc/S3YXkaUGgfhjfuPIfITsDgNJA3CqCM41Po2/FCxMSO5mRbhe2XQXeOyZrOLk8hdBu4j6RMebOfIy5Ts+QisHrot7yGiRGiZwfegHBkat8kJ3wyF9xx4zxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSL3Vj7fabb4XthWSqD0UYF6qOLdUIfkPkGgqPJSJY0=;
 b=VBZeFfXuRzuchBJjC7LRUav4EyGhVn4HNtEi+b9iH26EPxfTzelSC2woGXJ7GL29AEjY8Ac6F59zdemxy8k3mpWvnoEa/d4p43c6tgGlvjmk4EMxRcjTEe7m+ZqN+Ohdz/97sRt2t2vNY++E/MZKuEbq2QqKQl1hVhlB7PnGuH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OS3PR01MB9623.jpnprd01.prod.outlook.com (2603:1096:604:1c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Wed, 24 May
 2023 23:48:26 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Wed, 24 May 2023
 23:48:24 +0000
Message-ID: <87wn0xguk9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz <amadeuszx.slawinski@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 08/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
In-Reply-To: <ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
	<87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
	<2e84d6f3-902f-d6f3-0084-ddfbd61ffa1f@linux.intel.com>
	<87lehh2db4.wl-kuninori.morimoto.gx@renesas.com>
	<8f977a29-14c2-a160-5eea-10fce6a73742@linux.intel.com>
	<87wn10ncyi.wl-kuninori.morimoto.gx@renesas.com>
	<ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 May 2023 23:48:24 +0000
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|OS3PR01MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 076eab04-ff95-4a87-2f4d-08db5cb15d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j/9SLZ1gBYv0IKXPAB2l/j2sC1RCDRkkV9cY07otaZydH30Hp+BW5oRD5UYIXJnlBbbGtOmKD9K/zRZmFKwALdRMUHW7e0NLRdeu0IvKylLw3jm5uQ5G/YzPMBKA4/DRwYjdCGxaHFq95toEYvEHKcAjXjPqCiXYohdP9C3ByTWuIAAXqtH5jYew+RKVbEtEbti4bPEQnu+v9LgtQxG37LjbjQTc2mRZcG7cdYWRlVFANmLYeyXiwVOgSuZjpW4JiER+s68Dx+ANcGKZquFaiKjG4kWWFzlqr9GAonRHwcD45ddJnm2/ofLfI95zoipb5v3oCQq5HOZOkpFDyrmhQSZ75KXunxSr4+GhPHDoqlUiu7mdxYyKN1YRwXYvB5IqMCMqZjCjRQupGuHvSYpXGi98TpvQrgHpKo0U6eKiIkLT78Z0RSTF2DViFSf2CzgUfoQR0orEBCxGFZ7QH9wIwcB2DxOa06ZcFKjHTHqa4blTTZIfn+Or/jIhIDlnzq34KPWAe05Ywon5T6adaTNCQ+S76ZmA/m6AyXRWcGFlkbRSYBPoHJ3TJLX1jIN4AROKI/LczAREZm71zhkTl8gyhcWlRYhS2x2rt7XuCpa9eucFs3mm6MBX2r/G5DZ/aHau
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(54906003)(478600001)(6512007)(6506007)(26005)(4326008)(66946007)(66556008)(66476007)(6916009)(316002)(52116002)(6486002)(41300700001)(8936002)(8676002)(5660300002)(2616005)(86362001)(83380400001)(36756003)(38100700002)(38350700002)(2906002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WXOI2HBnx8UondK5yaOfvGifF2BFL76L6D1V2HeSJJVp4jpICBdIk6OmKtfU?=
 =?us-ascii?Q?d5IeBGgNwedc2ZL5m235LSAplW+7o6bvge+eMq4/HuMSCz7+JqYYD/5o+J9M?=
 =?us-ascii?Q?V3gmJPcJcf/jhNeizy0B1LC/xx1PrIgBq8h8TLMDAwP5rBYaMNQQcx1XsAL9?=
 =?us-ascii?Q?X0DoheLloLS9n/PnpE0+WtbMG2X/Uh7GLkDSDg2LpxT9fQUaCLg4wYACPfo3?=
 =?us-ascii?Q?hLa4cfBIAaraPChgLEmoDlU7UPx0vC/B2WqKOXDyCOAoA5l74XRCw1ZqcI/A?=
 =?us-ascii?Q?iHPHR3EZePPVTa+uHEPumvUCni9D1p/HTgCTc63eyS4Z6w/LERmAoPTVIGTn?=
 =?us-ascii?Q?PQ5JKeNo6CDCVX+61GsH6K+V3PhPkxLiZ5npnJikDfD4CY1GWHFeyzj+SAR6?=
 =?us-ascii?Q?gjOER0Tb/cFZP/epzuLZqYLe6It2KjQj8a8CR4s3cCjQkYCbHzagC92Z2c9o?=
 =?us-ascii?Q?znT3toORP3yGj/hAt3fDms9JgxsCEvDny96CstBE6W6h3lAShtvC8+Du5BxQ?=
 =?us-ascii?Q?9MLU0GKjodJDxr93UwyleXcwhSK1smikqWDpjDvlRDPdf2glRynKu6zc5U/O?=
 =?us-ascii?Q?Eirmq/QMFYXoIRLzDeqMD+rF+oqXhUIACpILuH3q1zJya0AjUTmxH2SMDsTP?=
 =?us-ascii?Q?8oxvHFnEaqMdxmQ0KrTrGHqxke6wpV7B3RHJstozmchZMYyfeMiXkCWiXjj7?=
 =?us-ascii?Q?CysIitXyUsrVMTWAmxGjI/3ERdL/VgV+Msgd+EkK6JXJdkHkAUDaxNZQ8RQE?=
 =?us-ascii?Q?EkYHUBlMbYoHynFGyB1o9a0kE4kIxI5qXpfxne2hwPYMOAz41m6n7UqgBorW?=
 =?us-ascii?Q?hXkfA3psof7cyNA4N680zeXz3q1F9bQZXpxDddOaUlZjvH/IYaaoM1VpA97m?=
 =?us-ascii?Q?xnFain6W9hNYK+fLBg2OOk24Zubf98DaXkVD05BC3EQDUdabu33/klGNSD/i?=
 =?us-ascii?Q?dfFeGO6NTZBmXi93wQ+niLVdDhdn1CBJ6xjtgtoWPPDbR7gu6WAJWmNPiq5z?=
 =?us-ascii?Q?XdrEp9AjCChopNqSr2APjKoqfyKv+ZkMkYIMVtSt4wGfoCXV1RNcSTXOHGYD?=
 =?us-ascii?Q?yWisafifJJ3eiotGmHr5k/uUapc95SFtzkFD/w04PsG6CSAz4tC6bftxhp8C?=
 =?us-ascii?Q?1hMXLYRA2U7GXN3QMdtl15HsI/0y1s7iWVD0GiilqKby6Fd0Ewn0jUGYGb8H?=
 =?us-ascii?Q?Huyrj+mbsKY62/Mh7cUkxD8BB8hFljIkNP4xSz2hzvJiYKjzI50T/8rhZZcG?=
 =?us-ascii?Q?ztXLMhBtSCqKuWY2vKWNevwIepRfCjQs9Kh7sGv5um8Z/k9TOlVaWc6CD7VG?=
 =?us-ascii?Q?nfxOm80R9sTdzv19O0IBnAUkYFkcU4+rNAGxsa51cOkZRcAu4mbQzC1Fbzma?=
 =?us-ascii?Q?skWdynllHsroNdje0xg2pq7A8IQO1LKCsms316J6ev5yF9JfiaStKYyaj61S?=
 =?us-ascii?Q?XRxVokgIRxPkpZAwVyomo7p91xlhM3XcriLMco8KJWBXWyAcjsYSJaVJke95?=
 =?us-ascii?Q?VoxOApkcSII8x/xokjrHBChPSZ0HbjABFkayLVrvjg0Dje2lM0PsZWIqDVAX?=
 =?us-ascii?Q?aLCUkVU7R8V8IrMT2c7lQtApehfFyfsF5T5el4Ubq0XJzb3RnymiuZvUKXa7?=
 =?us-ascii?Q?jaW9BDwB+TRbJirY2ayjEf4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 076eab04-ff95-4a87-2f4d-08db5cb15d09
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 23:48:24.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Kk8Cef2HJLerY7nY6hbjOZQR0NM/vOx1PamIgWd3TwERIdOYevVJpmnejd/2mkdknltXieSFPlG0fec2CNeVXuYYrRP2dhAXqEVyASUCVRPRZ+dhzwlSj4H7nhJn09Kr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9623
Message-ID-Hash: SV646E3IVJVXEYGPDEJ2CCD2MGENLTUS
X-Message-ID-Hash: SV646E3IVJVXEYGPDEJ2CCD2MGENLTUS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SV646E3IVJVXEYGPDEJ2CCD2MGENLTUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz
Cc Mark

Thank you for debuging/checking.

> > I noticed that before the patch, it checks dummy DAI only for no_pcm ca=
se.
> > But after appling the patch, it will check both CPU and Codec
> > valid (X)/(Y)/(Z).
(snip)
> sorry for small delay, I've debugged the issue. Seems like one less=20
> critical problem is in ASoC HDA codec, which blocks HDA and HDMI probing=
=20
> altogether in our driver, something like this should fix this:
(snip)
> @@ -341,6 +341,8 @@ static const struct snd_soc_dapm_widget=20
> hda_dapm_widgets[] =3D {
>   static struct snd_soc_dai_driver card_binder_dai =3D {
>          .id =3D -1,
>          .name =3D "codec-probing-DAI",
> +       .capture.channels_min =3D 1,
> +       .playback.channels_min =3D 1,
>   };
(snip)
> and it works for testing purposes, but as commented in code, those=20
> fields are initialized later (in hdmi_pcm_open()), which apparently in=20
> case of ASoC binding is too late. Likely those assignments need to be=20
> moved earlier.
>=20
> Another thing that should probably be done is some kind of look through=20
> ASoC codec files to make sure that they all define channels_min=20
> properly, otherwise there may be more unexpected failures.

Hmm...

>From logic point of view, I think we need to check all validation.
But from compatible point of view, we want to skip validation check
for BE Codec...
Especially, quick hack solution (=3D adding channels_min in many place)
might case other bug I guess.

OK, let's skip BE Codec in v2 for now.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
