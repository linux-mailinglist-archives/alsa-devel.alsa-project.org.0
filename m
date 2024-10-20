Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C89A5798
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B63F3B60;
	Mon, 21 Oct 2024 02:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B63F3B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468970;
	bh=q3K47Ix06ztqHR2fT471Jy6zPSf5frK7N4iHFcqYa9I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CtM6wImskIZk7dmifoiffigJ5HJTDSb9eHusfDMCi0IFmCpQrgMefDh/YZWjQcfP1
	 l0+kivZamaWtn8BBnAc2STpeb+4EYTQs319gTbIWBoOXEFl2ja+S5XqMssUftHzWsB
	 Mh8BpAeHDbwNJnWjYUO2cBFZmPxYqJnz8OOH0hDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A190CF80799; Mon, 21 Oct 2024 01:59:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4908F80793;
	Mon, 21 Oct 2024 01:59:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD619F80772; Mon, 21 Oct 2024 01:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE8D5F80764
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8D5F80764
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e2uCXgPv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYE16JRcdnq2YJPJEWFQkjov/zUH2HwsgmTgEkUaPmr5n7E1T6Oi/XrpEFfsMFetcGRmZCL2mV+qneUETFhn4pRKBGiT3HnOYf2EL9f/P12xAz6GSvN1a+plL38C4KU5Sk/0UvdtxRmbY/lwAqHDR/GND53JtIZcoY6ek8riff4GgJkgeiRcaRGJJoUqHRLVX+zhn48xMKaikMwY8feJZGmL0s2sBozEB+DpXhuvRLEkfQXd8mGIlQ7QMbeHBDzOvx0gzI8J6iIaqpzR4vz4KENh5rTOahcJfAYu8ZLyu/J6o9N4uEPlcMk40yP4EHklJwiKKDpzzVzF97i5YC4tDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPcoVuxjb4OlUhRC7ptTQhVcWoYjTj1nqw2QrQKd1QU=;
 b=kqlDh7gm5L3IzQvLpc/gnByTDGv/PaGMLVw+YbElnDpiy8Q+B14Ih2lEb+kdMULsOip5T6kubhDo+N6ZPAyFLSxYQrPUjcNz6uyhJsYOq2MaBrrkxw5mc2twWlHIZ/Ie1pt+1u/xjA/QgE1jWZ5Ajcxy9PdTwB1bGFb+cRrewXBMPcqS9o0YYDZ25dLc1Mm3u0AqWdYo+b7mEHTGydCKFK7CAu3IaweZBHSltJBaAoEbdJR2LBTCtIhKeJtsy48LxP6jU+rjee+6dzPXMgsf6qnyXWB1o9Av8a49l32+qZ1jDN5secvuSEBL12GtR7ElhJ/Nwc1eAZd/UD/2vnwO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPcoVuxjb4OlUhRC7ptTQhVcWoYjTj1nqw2QrQKd1QU=;
 b=e2uCXgPvKnCc5YkzzJ7bHFkXjxguHKBXGb2PbFCqXrHcsl8qfV1u915MwzKgX4Hgj02tKkO/8qffX4vn9WJ9Vl7Zz23Kd2r2YpocvYqf/JSvHbHVr0ZvPFRJoxK8jpXOje9Bqjo08MhKITXL2OCaLeuCgPpZ7Tb06pRSEJ3VJI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:59:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:59:50 +0000
Message-ID: <8734kq9vgq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 13/13] ASoC: soc-pcm: merge DPCM and non-DPCM validation
 check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:59:49 +0000
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 917bd1ed-fb31-4ea5-359c-08dcf163486c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0Yh66Y0ji2GhU/gAIJOJ1YmMZZG2YsOTg1q9BbhcfaZGz7ZTbQLIUjyOnzbB?=
 =?us-ascii?Q?4ylcPayqtB/0DbVPj4HYdkiE/2jreKceL8zYCuePaHPNOZK7LPToirAMz16q?=
 =?us-ascii?Q?KOqXIPzdWhmnFcRSTRxDQgrTFip/byfj4iKfrMusEc0kJMJ5JEcwiUmob2Va?=
 =?us-ascii?Q?BtpLcnn4xFbNGKa828acKSWYqpxE9G2iytBU7dm6iFJUkh06LsfLc+zArzUs?=
 =?us-ascii?Q?feh7sTWI/iI1IuG7RcYfWpIO9kF+y6t6L7fy6dkthGijDhPmttohRVRhYw/8?=
 =?us-ascii?Q?BwtfVDH/qwHtue2FlfQWZPRplBJQBCEd1ZGX0/TtccYJXn0kTcXZKIpGjMZS?=
 =?us-ascii?Q?/pCElGjKziJ3nO3FF/j3hB3leeq91vywxZmxc3B4vZhxE5EzHbjz8Fd3RkT/?=
 =?us-ascii?Q?gnvBNcijmzEVi6uReLzMMQ02PeAwjoig1qHKMG3N5vxNlL7UaX/UeX50vCkw?=
 =?us-ascii?Q?ESQCfEiBdJpdZSsZ9kyk73y0xZz8DRbWi7NUtdqwcAjV4250IVsIjZjrn11S?=
 =?us-ascii?Q?GOBfA9+pQTggpWPUzpJcStrH25KkP7b6d33qEBoJ5QmV6xu6Th11jUeAAgGP?=
 =?us-ascii?Q?47JuBXt22c3kSuew8buRcFt08JgV9bKiLpZex4zxeDIK8kjTPVELVgCiE5wW?=
 =?us-ascii?Q?d/SjA9Pz4onkcsR1eB+aLFlcClwS3a6QHMdxISKc/DTGkQxrwpL8SVNvMPJ3?=
 =?us-ascii?Q?ix6RJmdCUyRYwOW6y6P34C/bwuTv/BSM0Lw41v4bd/LflOSITdsVn4Ut/2jK?=
 =?us-ascii?Q?lNFSRS79hTMAWDJac7Ius9LL5FKEWgcdQjwa+hS4Jpspdj65GoukQETSRQ+F?=
 =?us-ascii?Q?IUBfrGATVvkGWqSOGCXcN6khq5SRCMqaXQBigHJecdYj7fa5W4uMpyQhhB7j?=
 =?us-ascii?Q?hxRKrRHZ0nIVRyogIr+3XENrUh9qYRRXB2yrqonyITJtkmjeLqlF7nbvWLIe?=
 =?us-ascii?Q?jvBK937lkZIcZLfFXJEGniAlk4SUfFSPrweV9gvZkXvwl8FgP0E7kOgNJ5MS?=
 =?us-ascii?Q?mo76WLzRm0K8RkDlSq1LryBoQ5OUY2Qvg9Whdu3C3xcQ8IN7qUTKESd8xnR1?=
 =?us-ascii?Q?B13RtkdUvPGgjEeHhEdy096TFBq/7I/C7K1XwcGkeKvATCvIUh9pv3S9AR4x?=
 =?us-ascii?Q?ofYvhyIUo4t3++LoXibVCmP7qOrl7ry2G+CJJ48blQie7U6fzlMroeimeQTf?=
 =?us-ascii?Q?x99i06Z6uKpUqDU/HQGF134i5xC+GVfeiIiIdc/z814q9W0zkVM8XPymALea?=
 =?us-ascii?Q?CnsrRCcuseoKd/TJTQKy7ul5anRnkPczOoGf8yv0q5xtbAi6h9l8CQJoXW6A?=
 =?us-ascii?Q?7mkMZJ/1H2oeQ5i13xO+b9O3vxHMm2WrF8SE4OL39hsZtZqUji+cfQ5DcCm5?=
 =?us-ascii?Q?u3LqT3Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WD4J+Rj8olK+b2rgzYPPZSwYZlRvHM3rMhxymNgCBXScgnbYVpKkVAeyDFU6?=
 =?us-ascii?Q?e1SdV3teXplZlFbA3AW77n/wUKgbM4LMIDkOKvsE5omzKZC0t3vsZtPKrdv5?=
 =?us-ascii?Q?oDzAs2kSMnKZu9k/x2RZ51rTKDO6qiezUkt8BSZu7MA1Rw5eki/NRFZPci2e?=
 =?us-ascii?Q?g6KSO+Fysb+9cpLjQgqNV9jEXOhXE4uq6iZGLLhefrBjcid7Kq6nj/tq8HfH?=
 =?us-ascii?Q?WEiFFP8/rM3OVq4dkq1yMxnX8adm+W4pYF7Pdo5KKwbO6+ypcwIaVnQwTGYR?=
 =?us-ascii?Q?ZBcQBr0Vf79Ydv00oZyEmgZrpJf2yagRhT2cizbV1Ruq2XyD1NUrjstrep11?=
 =?us-ascii?Q?8r9eayd6wtyjuhXDGuGL/GjKuOI2mTo2FdDbeiLaDnmJo1LcMf885hdjPMLM?=
 =?us-ascii?Q?DN98oKMeBxCo3cJ1XZuS0WbPoiaDmy3yF20u8UYmZ8jSVFr7al7dF2sTT0z9?=
 =?us-ascii?Q?l0X69msoF8B5ygs5QdOy40v2QUBoLEsRVTvgeyPNZgs7dR3qCmNnUad7JVVw?=
 =?us-ascii?Q?cOhrX7qdrto6hvw7yhFOgXroJPQZWbboLQoxOsADTsG71s1IqqjNJHOUCm2D?=
 =?us-ascii?Q?EIEJHjOlEMCGvoBQMHtOloy1V8yTTPLu9/ksC+AzcYDhAj4VhMtmOLprf6Zn?=
 =?us-ascii?Q?pleYrsmAo1Ssk+h+sOL7Vw56j1Fkwzr6o/t5HGyo1bvAqILggega1BiE6sH6?=
 =?us-ascii?Q?TBtG5Js/GaoxtCXfeW05p4BUUFRkaAM3jnFyd+npVFYjKVcLUn2Ycu4f2fGP?=
 =?us-ascii?Q?8KPI51TOchxHMhcWu5YMLWyJ7pbs/Bdhx3VlmumbBHUoo6+3vUeNv9mnOXIn?=
 =?us-ascii?Q?MPe8YccE7Q8vZr85pW9aHECQn88ErannyIOEAN00a6ueU2yh0kz1ui9KhcKI?=
 =?us-ascii?Q?N1F6B9A0t5//a7SSdHfTngt4+oKDJ+rRqG94PUqVh11IXRsXUZj+oFmpfIjy?=
 =?us-ascii?Q?I2LdfX9ld8EGcicevFKxGLgI4iJ/j9XMJhMP7UN/ua3SHuJh/qFOkCQa/45s?=
 =?us-ascii?Q?9icF86QptMdjFdix7iFludQrypvVpQN9kCA+nGwH0elBIjzUhF5K53IS3LZL?=
 =?us-ascii?Q?Qwhwz8d5qPZEsx5tgXbv92rQEPG0Ibc2GAKKjCmKHEfwQRWXXO+1Mo54wL56?=
 =?us-ascii?Q?VBPFqs7eIjFOhRK3bOC8RIdv0E7/pRl3pC2GNU43ubgSfYoF6c/Nrg41S+jb?=
 =?us-ascii?Q?gyfpMWFamoiUG7ID1uTcUzkR+DYBpeiPWh4+/Zq0j0mxh+ZiqnOPaV46cIIx?=
 =?us-ascii?Q?V35vt31+I9kK5tiXvCWILHFe9QGCy8dPCCojPSrD8O9ygLrgtHtkm5xKjzbT?=
 =?us-ascii?Q?B52RREXQt9OOwdCSFIXPZody+uyvi3JR9uCFEmmrYII9GYqKYyVhoYqqSHia?=
 =?us-ascii?Q?mJZLBeWpvcQvt2+5PdhA+TAfwzddjbr2IE8hoZmTMOvNXM5+HZBtJkNjfsX8?=
 =?us-ascii?Q?VFl5FQcxYO13l4dU4xEV3CFENKme3dR2JNMTnEq29nV3H/YLw9iGQ/nmaE1U?=
 =?us-ascii?Q?B91QOvNS6UlR2rELaTBWIThohQG5dQ3YSYC7B23clMl6cfgCfX3zLpdKEhHn?=
 =?us-ascii?Q?auB/cTPofnRg/YlkOCZgADe1T+7kKpqx3hKu1KsjEvCQN8QidD0VyqvGtB9z?=
 =?us-ascii?Q?Vd9HK0Wtu4zqF8AkajovfCA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 917bd1ed-fb31-4ea5-359c-08dcf163486c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:59:49.9992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9V00BquKKYxVxX9mbVDc/7wy0+Yrm1R/9x5Xv27NKxwdQTIXW2DURQHYplmh+47xbCsJfWNbmNON4S7Yo2iXyEuvgJJrv5oinKyUvQlp7AkaZvxdlk67Q2YXXG5zViR7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: PUGIU5IKOBNGFJTMIESQ4HQY7FSBAQRE
X-Message-ID-Hash: PUGIU5IKOBNGFJTMIESQ4HQY7FSBAQRE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUGIU5IKOBNGFJTMIESQ4HQY7FSBAQRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DPCM and non-DPCM validation check are very similar. The big difference
is that DPCM doesn't check Codec validation. This is historical reason.
It should be checked, but it breaks existing driver/behavior.

Anyway, if we uses dummy DAI as Codec when DPCM case, there is no
difference between DPCM and non-DPCM. Let's merge these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 62 +++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 5142d1abbc7b0..678400e76e53b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2822,7 +2822,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai_link_ch_map *ch_maps;
+	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
+	int cpu_capture;
+	int cpu_playback;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2832,40 +2836,38 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	if (dai_link->dynamic || dai_link->no_pcm) {
-
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-
-			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
-				has_playback = 1;
-
-			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
-				has_capture = 1;
-		}
-
-	} else {
-		struct snd_soc_dai *codec_dai;
+	/* Adapt stream for codec2codec links */
+	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
+	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		/* Adapt stream for codec2codec links */
-		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	/*
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_rtd_ch_maps(rtd, i, ch_maps) {
+		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 		/*
-		 * see
-		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 * FIXME
+		 *
+		 * DPCM Codec has been no checked before.
+		 * It should be checked, but it breaks compatibility.
+		 *
+		 * For example there is a case that CPU have loopback capabilities which is used
+		 * for tests on boards where the Codec has no capture capabilities. In this case,
+		 * Codec capture validation check will be fail, but system should allow capture
+		 * capabilities. We have no solution for it today.
 		 */
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
-		}
+		if (dai_link->dynamic || dai_link->no_pcm)
+			codec_dai = dummy_dai;
+
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+			has_playback = 1;
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+			has_capture = 1;
 	}
 
 	if (dai_link->playback_only)
-- 
2.43.0

