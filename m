Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528671417A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7C74E;
	Mon, 29 May 2023 03:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7C74E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322378;
	bh=uRQ8TCjDDNb7JC+dQBrtep0rjoz2d8EgH5G1BEqi2e8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lwlN5hqz6fxKvSDcx2gJFOI/uV3iDRK4rdC08WJiq4LMfBBKRUY4AVdgEB+HGIbH9
	 8SlfNOYi7aUCJAf6XwgC22/qk7U9MRi2FYrGQaiW9hBf671uM+B3InZD8PXmbkwl6E
	 4LDiC9QvDL3rYQCOJ4qbDDJREKL0/5ikp/EcVfJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F280F805C7; Mon, 29 May 2023 03:03:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B93F9F8055A;
	Mon, 29 May 2023 03:03:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5061F8057E; Mon, 29 May 2023 03:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7189DF80552
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7189DF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OuFpOdBd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD6BM0X/vCErCAKue2nB5aORMPs7z3eFE4grEy0yFuKOrkpuG6WB7bN9JS/7tCjFrCLAYcIuG09pddHHGoKP0sn2tgh1BQsaTGnwEwHrVQMCVo0dgc90yK2+HXQ7e/f7ZRiNYA4W5/zon/2sF75XqUf4T9wKszyoqg4uTW0iwBg/zEXHFvA9BiyORSC+is2MyM+DGCTJ95g7bzLj2PfF991hX9FMTit7ti4pXzGDXcvLxZRc2wMDBorPc3bfdMnzCQRk+n/7voCt5R+lP7TSJbTS6OQoK1s3a2D8qMe+JkUBYegHfDQ+S9+LrZRcn8qWMI+2DDcm1VC20vDfCyfsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgCmUKYOr2cJWLuBvqa8k/SYR9tr6UmuFgf7o8fsLmY=;
 b=FpmDpzikA9LQkuSbe8u9Zh3AF135OkYosp/+RQGZ7ni/oeMiXYUwxscN2g8L2fgaf4372C29Q58XB/J6K4iWjOd82oc+1kWcXEHYEqrGrpEacOZ1VjJ4HDCITgAu8dWHhiE7KlUSBlHS/LJ/o6FhL3stRa+5Y7JsuWFc3MsIvZL+s/Z0oXWYXsT9OzYZ0myhLN6nCsFbfblLb1bstKE99XgEEk0RFs0623/qOihj7aLcnKeuiLWmVOQojoq138+7kkSrvNpyTdDmT6rt+7d9V3Qawa44Gq9UQnrMQ0UA3kjEWbSVTmyYHlqCu/2ePeUUxRxNMvOuFtmrp1JX+yC+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgCmUKYOr2cJWLuBvqa8k/SYR9tr6UmuFgf7o8fsLmY=;
 b=OuFpOdBdvjYFhetl2W+kCF3VQsISvrbub83liW7mqdw17xnQFuz9scrroRO0XxuvhYOeFLzZr3rgpKPKrgxP9fwkJaKz36GB3wGgZC1JUzwpRQ4Wl98fB2wmi9j0NjgmKYPe4gv7V9egRfFfy45zUp4A8mc2oJFdFrPZZ5Y4JEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11557.jpnprd01.prod.outlook.com (2603:1096:400:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:03:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:03:47 +0000
Message-ID: <87cz2klzin.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 08/21] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:03:45 +0000
X-ClientProxiedBy: TYCP286CA0155.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: 0761c74b-e6d6-4efa-8ee1-08db5fe08d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L9GHYHfXfrd2w5d7g3fmZEab+EaOAvIWD5adWJm3afQ95n0wa2u3uPEQ3BTZKz+YEP7xDX9sg7IR2jzn4uEI4vs+Dzb9VTxW4drQ7zP/oLkKXB+Wxps6HdUuBE/TlPDgGyGoEmQmmgPdhCUibz2511bDCroSKL32Y+2y2Iyx45VSIK79NdFvDO0FINaliIQ6VyuJ8VDqC5GCkZKvtDoKUt2cJW6IC/x+6tS3Z42RdIwEWijmaVI7EYmtr0QjmNHN6A5oUPe4hJgwhCzWahDJVTdhS84V3/FqdNBNvToxVs8PJBouuJS1ChuwjrtFsb+9G2KmXdv3rFxNpDX/I951dt8l2EbEpKH9d7Sdq/nufSMh4PvFgMd5dVx1QW/q8vOGAMF2PbiC1zKgdp2OgktW9ob/+lRMqEjeY1RmVaQlT9irCVoy11T2wmtz4PsCbkzvIxpbvN4FavrTdnRdD6PRo5pt4usRH83HGb2eBzoiC9a7IQU2vfvowwWI4F/Lh542rvwRu4jUIvUSsUbj+DbZ/tJ2DNJMIqi0+US+0JgqwuS31C32Pqy/vzjAMD5bcvfKuOcmfkaVLHZZFuFDB4XHiXH3e+f5StZoxLo6wOhmtGsjWJHWKiuDrprXOSXkRoJU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(66574015)(2616005)(38100700002)(41300700001)(6486002)(52116002)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?ZEMjvlfEz8I9fj26RdFbb3kiPENstOEP157PoxU5qFG/O+ldBuD2bkbCap?=
 =?iso-8859-2?Q?YJuNWNLqchNaB9hRLDMMV0nAF5EDs//Wokc8d2wGRToBFRxSHWvVicUn/3?=
 =?iso-8859-2?Q?SkadynoSN13tOt6fXhgz5i0Q1K4QbOVwFiSKwRk3jk/R9pVeg2kssiR/HV?=
 =?iso-8859-2?Q?/0bYYGW3HJDr1G5Fs99Zus6sz/k57dZ97U5scRFuZWH+qz5pJFxQsSi8x8?=
 =?iso-8859-2?Q?6bQ9hzoD7tklfOzxG9Ev2vXs9l859mJ5hz5AmLDXaR6rllvRIaIEBO9NBX?=
 =?iso-8859-2?Q?LzU6fUTV8uRxfj7j19gyFUjxw8jdmbETpd69ldUagvEC1lRlTLdtMgRAjo?=
 =?iso-8859-2?Q?+7UQXb1lrTjXvLMETcN8wDZPnuK93ATVpEBk+WcWbpgUSXle9o5FdLtqYI?=
 =?iso-8859-2?Q?si25rj1PwbREm7PV6i0Yp6/deqz6bzSUuY5qsdjlN4hjbmEkyCmVCQac3p?=
 =?iso-8859-2?Q?QLDr4ls+l4bscYGfc4k/Eny34WkDgS7gAIf7ZWVbPshAfo4KW5fvo7/KfF?=
 =?iso-8859-2?Q?+oa+ybS49obiYyzbFrS8RdFirFYIQ9saOzvSD6pX6QEYcDjKEn1Tz1Ytpw?=
 =?iso-8859-2?Q?mlY5RbOp/K2Rnuz0HqiX8ejrfyowgiZFhtJ8g4vwayxs//5dGVNM1ha1Jp?=
 =?iso-8859-2?Q?zYsdu0055/XBWARKCdIDcuMDqg99pIlzIfa96lAEsNI7vkR6Q1N7yR5hqF?=
 =?iso-8859-2?Q?jyWXxsMceEBRr8q2kexOjOB9VBHzxWrbdG5c0qxknMW/9Wzk6bTdQUCBm3?=
 =?iso-8859-2?Q?AmjfFAXlFfzY7u7mOsbuJXhENXYzfP13dXbFuz5L8Rhovwlr2ZId1c6tIJ?=
 =?iso-8859-2?Q?vmp4jc6OXx49N3b49AHo5Z0g6f64f2fyRtvFYTlkqoOP+RaIBODpRKiQc/?=
 =?iso-8859-2?Q?fdUsXcIOQJS95m13FWExfzone1cO950vg/xnAtcXsJQJST5Gg7xcf396N4?=
 =?iso-8859-2?Q?XnT5K/9UZpZ47BIJ8uBHw0pdW+rsT7O44w7Fz9tghWpIoPu0FOjk9TpCSw?=
 =?iso-8859-2?Q?mB96sLDnn2qgdzb8NNXsOJMiUZykavx7tKKmAo5kKNqB+hrxWHnIJrdbT+?=
 =?iso-8859-2?Q?GBkOV1pmOL1s06Ez8weV+8MuPW0Q406I27lRT2T8WPb/QiRAya7RFOnw0v?=
 =?iso-8859-2?Q?/QjBdzlcEZtuuZ2j0vAa9IiqOqzXAOsoT/P4I08NtCEaZnVS90/2w/c6ZV?=
 =?iso-8859-2?Q?EHQU+nD98K3rCkuvPSBznip/DiEY3vioK7H51scK6gpMMaBMZLQBDWd9yu?=
 =?iso-8859-2?Q?LMhg6vE9B2saK7bNHrlaD+KolB5XH9Vzm9N3xfY7BApVcHclOUOagGqVpX?=
 =?iso-8859-2?Q?HbvYFhqMLy2RktET+j/qHtpqcKt58p/G6EJpLSzPFcRa5KAadz1jZTiDSv?=
 =?iso-8859-2?Q?SWdEyDjDWfHJcG3WE+g0z85RikYKpYCll0rH1aUFFR7XgFDz8kOOHj6GfO?=
 =?iso-8859-2?Q?85mtw6i39/slEHA9s1PbPesBVKOnmfZTyDeyh3NzgQgw8R7Y177BLy8Vx4?=
 =?iso-8859-2?Q?grLgPr/BjNXlHyBjIZdjQ3eynukVxyFt3WMO19NAZbApQBXFHQ8Ox7rms4?=
 =?iso-8859-2?Q?ZuWhhqqnVmGszoz8L+FMRPnxYeR+AdPVWTlI4zVMmLOxuN+ZHpekhleKNw?=
 =?iso-8859-2?Q?lJanKloRlLQt1aICDo3W7n/sLUijX3c2gO1KL8N68ruPKdJe3h9RwNV2Q0?=
 =?iso-8859-2?Q?c6C08rGs46DGaklnRbA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0761c74b-e6d6-4efa-8ee1-08db5fe08d8c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:03:47.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mrG7ZEQLFnESYtCkTokalcrS2dFsa/Frv6mHoEi+AM58JDF7aJZs0ejCVX4tKIg0MI74v1R5AH/Owh/NM5RfksjoSu5TBIz+GOIjILHRHDueTpvGwFTSNZx47JYCcJfI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11557
Message-ID-Hash: PZLKHKJUNTQXN7B6HQQ3KSKA2AGLUSB3
X-Message-ID-Hash: PZLKHKJUNTQXN7B6HQQ3KSKA2AGLUSB3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZLKHKJUNTQXN7B6HQQ3KSKA2AGLUSB3/>
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
index c1ddd3fc71b0..923a66a51b18 100644
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
@@ -2749,61 +2752,34 @@ static int soc_get_playback_capture(struct snd_soc_=
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

