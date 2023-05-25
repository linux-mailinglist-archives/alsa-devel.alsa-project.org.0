Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33314710513
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:00:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2C61E4;
	Thu, 25 May 2023 06:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2C61E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990804;
	bh=9f1ANpzzJ21vAJ6sznL97tr4erk6gKsNwL3dxVu9fo4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WR9aTcrYl5j6nqTjxSa1cU1gFj8fi/SZvvRT8MA+Qf107jnZtIBo3PD851Ag0f66+
	 elEe5CsQZRdW8iJQiPV0EMx5J+h4CjVYeUo8azrrWnaIEMwXDSH09Jfk6td7pPkM4W
	 4llEi44O9RBuveHsdrKg/RXdcCST717SuU+dAjqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1334FF80618; Thu, 25 May 2023 03:19:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D60E8F80613;
	Thu, 25 May 2023 03:19:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35E7BF80616; Thu, 25 May 2023 03:19:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 936EEF80611
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 936EEF80611
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=J74x/c0e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecLZsT1kVPsTOzyVal8+eK+4bcokfHZs0S4+ak9DxjEaKJGGOzl7yhsQLF153JwYZIjsX/2C4TAxyUbnLtbSLTngyHYWXGH4E1ZRtswCInakIZa9scSOnHddFBaiuDts/OKSbP+b/pk0DvCgyOc/fTqMOSmrNHUPB0akKbEV231OgMptfYOsAW7yyvgAxsGZaxiMAyvnn/1Q4IXKW3ftAJ6O0/sSikqRao9EoQfUArP9P2+au/73vnopjqcki79IVCk4e17i/AQ3pE6aZ3v6bo8PpaDPP2IZqvt0uJpaShnfWe/TjuxDIFYX5P9eJ7SFGhE9JtcmTC6aXKS7QdgBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quTzPI+DXYL8qTYW5B2BaitNPeeX4VG0sCugxSp3cIQ=;
 b=MCxnDHWmzIL7Fq+R/rwZFqgBKXnC2QjZ/YvosU5ORdIm3QAPU63QK0Qn4dNBaxDSBdFvdxmoQoM6begvf9Gr/UrRhjAuXckULoPXrE8orcoN8B5ARDmv8l1wBSq14Dz+IoKO7+eoVt220Y+zcjDjXuqIIcM0vYRIkL1AUYjBwUAZ1AqprC9vWGCJPFbxRt+vEuZjnTcFadCj3lncq3WxhHU3dGaI3yATPaF4V75e1C/L4hdwJ+lK7YM2pksReWRoUycTzK5kOCZB1UXN2GaO0E8k2jQG5fniDFUfQiMwMcyUbLZ+vqnlCMpD3JfZXjJ7ZvkB2Wb+NCBkO8BIqXgANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quTzPI+DXYL8qTYW5B2BaitNPeeX4VG0sCugxSp3cIQ=;
 b=J74x/c0ewMLC0Hlwmj/409QIsS9bY5FF7ziH33XumBwWWbKV2E4i0exdyR7CKiyW8Vr+A2VOuDrF5FddrzFsfauVuHJ9QfWmbn/eS4T2fZLTsFvVv5vSo/sjVPeOOyXiy9927p1jCl52VjQn/DJ5HgbrgS4B6hP3zn4JGTZMSP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB10982.jpnprd01.prod.outlook.com (2603:1096:400:397::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:19:13 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:19:13 +0000
Message-ID: <87ilchgqcu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 08/21] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:19:13 +0000
X-ClientProxiedBy: TYAPR01CA0149.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::17) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB10982:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8d277e-4b32-442a-a869-08db5cbe0d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kL8Ra5dhOs6Ui0d+geRdHyGa2hc06PGqDNG9Lva3mPMGvFAKS5InjC76bynvYvDlkL71XD6iXRPP4miaZaZ5kitF7ukJxJQHAAzo4b/t4KM/owTT4rCi6kIMU7T2qSF2xRrHM0EYNNhQ567sgGwpx9Ijzz8nZ8MGGA7K5Kd7i9OIBIZccFTzZhePZe4BMNOSHSCzUHncC7chOJK1agyMHNs6UlSmBFqOrXghirbFbR4qN++E5yyqrPn0TfcL9q1AqKLWD7Ckk5+YcCAvHSc1U53e+VW9ZFmNo8ZUmK+61eotusfatabkNGliyIBkNwSs9OPp9X7vuVZ4ejDb3DZd9hNGU8aYFRHnYpWOge51henZdMoWXP/3OYjK49qqcgg8iHPdsvhAsCw+TgF8hNCQZn1vNZGbkg3cQI4vwbCjsw5cWYEqTPZ4ZROQmjSoW5/NmyBZ8FQSc9S2sEjLTp8kg2tyDE1ilWzEvDpUZnwbjQrnDQl6iUOvhJ4GbWtsmIeGTzf7PgWd2akXyu88umBG0QgC82m2ziNhwZ2FrzjBr9+72/5i898gua8gLFq7Qwp2PeOZ5BjDbAxbUBtjBow+DzLnwxxwXBNA3M7lRJ6wKA513MmtYlxKcRyvIM9vJE9/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(52116002)(478600001)(6486002)(6512007)(186003)(6506007)(2616005)(26005)(38350700002)(38100700002)(4326008)(66574015)(83380400001)(66476007)(36756003)(66556008)(110136005)(8676002)(316002)(5660300002)(2906002)(66946007)(8936002)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?58L3JbVye5EJJzukn+3ZaFxhTwq72tmzusfs7+g0pSvGKT78dflMm9Czcb?=
 =?iso-8859-2?Q?8F8/vFtkDvf4CEeGERbSv6TtADXxYR5qfGr4sEg4kjYUaVnrncgBLItcvf?=
 =?iso-8859-2?Q?yOhsCihkhKFEnPnjJLZCSLKmOGY9TGWYRw+K7wmMm4T9bocU64tdvlk5WC?=
 =?iso-8859-2?Q?o0s8GUWw06cE40Ah91BJfDiqB2/2lZNXQZJNNM8Lshf6ZgIINZI7K+tYYy?=
 =?iso-8859-2?Q?sUeFkkFyYCwKTFgj7k78x5lYjII2PuiE9rUzP0aOMiJTCdYemx7GNWVdBa?=
 =?iso-8859-2?Q?JleirbvRrciKUVhURAxmjBNMa121r96xAcIyo7CSlVI+HjH0smyi4S6JaF?=
 =?iso-8859-2?Q?yG8YlIF3u3WSuAT6bmOMjdgY3/D9e5u9ZDtVirrOoOi0nMUVdprcPFZoIl?=
 =?iso-8859-2?Q?sL3pobPclBJ4qSc85qfudt8qB6EMOWTDpAlEJFrdKlgvm9qNKRn078Cs7v?=
 =?iso-8859-2?Q?xxziukxlLIuXHj2ViqEb9iEe8/USyLlBOIsPNwWZjLuCr7A32seWoy3YqG?=
 =?iso-8859-2?Q?gcDT+reeWwtYw5LSsyOw2aPyK5Am/k13Wfdh7DO7J3vyG3+wuCJI2fmrbk?=
 =?iso-8859-2?Q?f9717gepSUgvmowDm2MdNmWfS6SbwRatW4tAjKN0+hhg4AxZgttoqWSFfF?=
 =?iso-8859-2?Q?A+v7WIn6yiCfI9apix4aV7irRHLupSC/KK8RFbLDUWtgIp638Rg/FtBDXR?=
 =?iso-8859-2?Q?Uu05z2sESrmTGDFdZcG9UcOemo9C5RkqnAvOeq6LKCzOYw7HbFNFDb/hHP?=
 =?iso-8859-2?Q?nw7+ZGV+5VOu4NzIvTDhOxFcP/qGqYIDQWWPU9SzAx5Uc4OXG8XzaZ4N4s?=
 =?iso-8859-2?Q?SXrPEolOamHf/wKFZBMFbvBQtmyAKK4CP5Y7IWRnrnk3nuKwgLPZBm7LWy?=
 =?iso-8859-2?Q?aynqbeuoJUHDPXYzDPGvGk55+cgU47pY63S1gZzkiCl4HEkkLxf4LV/CD3?=
 =?iso-8859-2?Q?cIh9YuS1PKJosv/PYJ93RljxJoqpIsdcyKmvb6KwtOpc4ZIRPHNW4MfBGj?=
 =?iso-8859-2?Q?O4pQa0x0Sui3xoHOkXIQ+TlesilAWFv4Cdmr0U2FFARJJy5/phKTOd4yJw?=
 =?iso-8859-2?Q?xoSPbdZ8sABYk5YbPaFAES/WYOwJP6iA5H0VihIzdAtve1sDEw93bpvg3P?=
 =?iso-8859-2?Q?ZkH9jkE58gMblTCevHcEeXiczv8tmiVvP+ObzYCegsWo3ZgcNLiEJyFuqv?=
 =?iso-8859-2?Q?EYeKW+UBEvCUb1Br7IYhUJPecoJw9qosAXATIjvgsda2ZNqK0lmKx3guQB?=
 =?iso-8859-2?Q?vLYDpEKgiQF0k6aN4E3/svwMUm9f9T/u4ir2b2LQ12YRLMtvBms6jk772I?=
 =?iso-8859-2?Q?v8Pvj/WflShi4MYuv5AhVeqFWdE9Qg9Tt7137bO19tpv9FydhwOpWZejf8?=
 =?iso-8859-2?Q?+XuN/8XPJXz6Wa4SMOOwzrpfbKwMbmB0ISHtvEIx0iH6m4pIKWepm8QeUq?=
 =?iso-8859-2?Q?8Ge7QNdo5JiFgBvQL7/4KI0PJ54xbCxbznVjzVW+hgsmX+yB97BKzdGJHO?=
 =?iso-8859-2?Q?MzWCNXsKZaXyfrlS9Dkv1QBSt9JbFr96F93VbYZpYptXs6tpHPo9BWz6px?=
 =?iso-8859-2?Q?PJ/gwCD1mKIJkoZRD/rGcfzD8G8DIMFB3/ewHtTkJl0O3fcPeCUTWxCfZA?=
 =?iso-8859-2?Q?w2P5uSIhBsVWWmnelHsVBd5JRv4Dz66NqnaIQF9Y//F0N/9oIUJSrzTl2T?=
 =?iso-8859-2?Q?YvoFEI6z9u/yjpU5uzE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ff8d277e-4b32-442a-a869-08db5cbe0d0a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:19:13.6465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 syVSOzDYFECctKLoFxO9dNzk3OHbSReAHQOeOuCx/eAkF79LzcBPDzvpdbg66o5Vka4RdhKZZEq5pZtujmwjdDUwkNrOSf4MzHJU/p0YsOc8P3e1k1YoBTw3bk+ZH/QX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10982
Message-ID-Hash: EZ5T5BKTQ7OHQFLNA3WWSRVEBYJYXJ64
X-Message-ID-Hash: EZ5T5BKTQ7OHQFLNA3WWSRVEBYJYXJ64
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZ5T5BKTQ7OHQFLNA3WWSRVEBYJYXJ64/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current soc_get_playback_capture() (A) is checking playback/capture
availability for DPCM (X) / Normal (Y) / Codec2Codec (Z) connections.

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic || dai_link->no_pcm) {
 |			...
 |(a)			if (dai_link->dpcm_playback) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
(X)			}
 |(b)			if (dai_link->dpcm_capture) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
 v			}
		} else {
 ^ ^			/* Adapt stream for codec2codec links */
 |(Z)			int cpu_capture =3D ...
 | v			int cpu_playback =3D ...
(Y)
 | ^			for_each_rtd_codec_dais(rtd, i, codec_dai) {
 |(*)				...
 v v			}
		}
		...
	}

(*) part is checking each DAI's availability.

At first, (X) part is for DPCM, and it checks playback/capture
availability if dai_link has dpcm_playback/capture flag (a)(b).
But we are already using playback/capture_only flag.
for Normal (Y) and Codec2Codec (Z). We can use this flags for DPCM too.

Before				After
	dpcm_playback =3D 1;	=3D>	/* no flags */
	dpcm_capture  =3D 1;

	dpcm_playback =3D 1;	=3D>	playback_only =3D 1;

	dpcm_capture =3D 1;	=3D>	capture_only =3D 1;

This patch enables both flags case, but dpcm_playback/capture flags
will be removed if all driver were switched to new playback/capture_only
flags.

Here, CPU <-> Codec relationship is like this

	DPCM
		[CPU/dummy]-[dummy/Codec]
		^^^^         ^^^^^
	Normal
		[CPU/Codec]
		^^^^^^^^^^^

DPCM   part (X) is checking only CPU       DAI, and
Normal part (Y) is checking both CPU/Codec DAI

Here, validation check on dummy DAI is always true.
We want to expand validation check to all cases,
but unfortunately DPCM BE Codec validation check will breaks
compatibility on some devices. This patch ignore it with comment.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 80 ++++++++++++++++-----------------------------
 1 file changed, 28 insertions(+), 52 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 77552543dcb1..b1288553f6f6 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2732,7 +2732,10 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 				    int *playback, int *capture)
 {
 	struct snd_soc_dai_link *dai_link =3D rtd->dai_link;
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
+	int cpu_capture  =3D SNDRV_PCM_STREAM_CAPTURE;
+	int cpu_playback =3D SNDRV_PCM_STREAM_PLAYBACK;
 	int has_playback =3D 0;
 	int has_capture  =3D 0;
 	int i;
@@ -2748,61 +2751,34 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 		return -EINVAL;
 	}
=20
-	if (dai_link->dynamic || dai_link->no_pcm) {
-		int stream;
-
-		if (dai_link->dpcm_playback) {
-			stream =3D SNDRV_PCM_STREAM_PLAYBACK;
+	/* Adapt stream for codec2codec links */
+	if (dai_link->c2c_params) {
+		cpu_capture  =3D SNDRV_PCM_STREAM_PLAYBACK;
+		cpu_playback =3D SNDRV_PCM_STREAM_CAPTURE;
+	}
=20
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_playback =3D 1;
-					break;
-				}
-			}
-			if (!has_playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
-		}
-		if (dai_link->dpcm_capture) {
-			stream =3D SNDRV_PCM_STREAM_CAPTURE;
+	/* REMOVE ME */
+	if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
+		dai_link->playback_only =3D 1;
+	if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
+		dai_link->capture_only =3D 1;
=20
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_capture =3D 1;
-					break;
-				}
-			}
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+		codec_dai =3D asoc_rtd_to_codec(rtd, i); /* get paired codec */
=20
-			if (!has_capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
-		}
-	} else {
-		struct snd_soc_dai *codec_dai;
-
-		/* Adapt stream for codec2codec links */
-		int cpu_capture =3D dai_link->c2c_params ?
-			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
-		int cpu_playback =3D dai_link->c2c_params ?
-			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
-
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			cpu_dai =3D asoc_rtd_to_cpu(rtd, i);
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback =3D 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture =3D 1;
-		}
+		/*
+		 * FIXME
+		 *
+		 * DPCM BE Codec has been no checked before.
+		 * It should be checked, but it breaks compatibility.
+		 * It ignores BE Codec here, so far.
+		 */
+		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
+		    (dai_link->no_pcm || snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_S=
TREAM_PLAYBACK)))
+			has_playback =3D 1;
+		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
+		    (dai_link->no_pcm || snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_S=
TREAM_CAPTURE)))
+			has_capture =3D 1;
 	}
=20
 	if (dai_link->playback_only)
--=20
2.25.1

