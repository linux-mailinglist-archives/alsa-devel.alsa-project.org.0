Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B81710515
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:01:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE6A9207;
	Thu, 25 May 2023 07:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE6A9207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990887;
	bh=duiazLdKQ9UAhKAyTc9nQ3DMycjfjr3bIsPwJR+Z9rs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ayKiwYFawaxzdM6YrdVlKozQ7XdXkXgDWUWhY0ka4DmGXDiBQt+NhDCPVNG+qarJ3
	 CZqcJbbcoRuC+dpv7gth1AUeWnfCvjuYoUC0kOwFsSeiXRFMEhXLr1iuy10BeiI8oQ
	 bhl/2KsoZBImVDF7VMjOP9gKXwU0n8CxtSrXz/oA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AB65F806E1; Thu, 25 May 2023 03:22:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A87E5F806DC;
	Thu, 25 May 2023 03:22:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ED29F806D3; Thu, 25 May 2023 03:22:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFF7CF806CB
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF7CF806CB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p+T/3vV+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTQdY3g0GQTY6NeL0GL5BlkdM+DC3c3gDGGROGwtZ9JYa4TNE6i7JlvL2Dh/rts6oII7RmdzjQynDmJDtU7N5Bl8LehO9skjZ7X1vZAsO5uOzbmpEIG4nhnb/HuUlfkj2woqN/PVrC9xfpxvPr1JZS6vlmV1thnkYuuu8T025p3jxAVefl+AGWwk0M/AuQDfMOT7gLHCd9qlLF6Aj+1uxGElBPae7h0bERS+EIoSRmCBm2XDW+EjkwQmrnSsl99Cn1uMtaRiXoibJxsMAAG6P3eO/25VObPLqc0wkBFoRZQ+WZG8RkgG/9IzQLUyKjTG2XGBux/uswuf3hxdgU/8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVwkbycOqSeBkUtaCE2Iku2rQfjuG4f8jQU05ci+3Q4=;
 b=AgYLXvnYKp24vVG2ID5box1cQ+52boA/7rZpXwYWkhSRLJzm+mQdS+RzWoQF+te2KHA2PLJm8kDxiPBGvXJPsW+VeqXwKGKgfzfTS8EDQyIVclyMQg1zJagQjr09WjnxY/+4RPxGUmq1IdW5qxoR71wu9s+WH7VgK+POVAJ47KHjrW2r3xn10maJL7Vit+WDykqTVawGrSLHqjW4+xfTZd3gjouk+Jy2VDCaGfDUYiSli6uDh5KbARgCj7wJBQIej+Qanm4vKbx2MxAgRii2nWE7pVhJtdF06ucf6X6vOEIIQUXWrCupUkzCYzQUNY8zeGPf+xRzqyXPyyqQuEi6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVwkbycOqSeBkUtaCE2Iku2rQfjuG4f8jQU05ci+3Q4=;
 b=p+T/3vV+/farRDDGv7/MKFP4X7eDSlSQGgkOrkVhNMKT9bCqfs2q+/nE28Rlvh43OUfn4Oc/0y+Eq4wINlzL4ZIs15uIRrUUaMgjedpX2ThBlM7uBTpe6Xp3/DMAb6WjELi8LW+NzfEGQufFishfU1ExUCduqFsSUjZpYM1L49A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB9477.jpnprd01.prod.outlook.com (2603:1096:400:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Thu, 25 May
 2023 01:22:02 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:22:02 +0000
Message-ID: <87zg5tfbnq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 21/21] ASoC: soc-pcm.c: remove dpcm_playback/capture
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:22:01 +0000
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: c9525e18-7cba-45c4-f6a6-08db5cbe716d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OpaIv+J1iPisasuPVBsdPZ52uKLKqFZ3XYzgSiwnhCMdK85ljiGNNqFaGQGYUev2P5DMhrDt4r0xXIL+IzyVTxM7Mg8NbYXzwbU0mnQ5FXMCH74/eJDRXXBrBkUi2VZESYxDSgehez6JaFXYaLWCMn9L8Y4EwfnUMHx2fAjPBPw7cAVColuB6L+YuAjV7sf/HgFEosUZnKpR4xFezJ2tgzW87PQeCYU4lAdHi0sW8bccfYmslVOh/m02It/9fjDn+oqFHpw3WkL3vatRJRtBaUXpgY9GeM4m8E4n+8EPnnl2Q8g+OVccapeVT3hdZhS5vRjpB2vhq8GGmVDjeiSGlk05XR4zevbQfW+0I+Oe8OpqagQC2mZ25uYsOeYstP7bRwAHhfegEEXoDYhe3jHAyxPTsg7/3SgSZhZMoDfKB62dlIiYQZyKUiDhulZoA7QCdRAdr46LCij1yP0nnHIFzuzRN0tVwHluVqkyVn4vo4hAMICu7/nMXDmnPpN2E4gP3o7D3rhtNtL9ux0N1Bb2+268l+hdjshZIxy+bkjrLSBfxxhweX+Ah0GzRzE9S4wo2rLtBU3i75kGtfUAUU+aTLWF1Xxb/zEWJBKYWsAjEe1FYXkL6mie2omyCAhL1dzp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199021)(38100700002)(38350700002)(6486002)(2906002)(66946007)(66476007)(4326008)(8936002)(8676002)(41300700001)(66556008)(316002)(36756003)(5660300002)(478600001)(2616005)(52116002)(110136005)(186003)(6512007)(83380400001)(86362001)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?OlnVPdWiliI2D2ssSvArWTb0UtlTDz6cNddoBn7Jj48FBXqNjuhn616/AK?=
 =?iso-8859-2?Q?rBTXIuTKQRYsLGZ3zJDCZixlYabRc681qJlwYxCoEzs9FSUNMVAsVZBsZG?=
 =?iso-8859-2?Q?JSMriaF81mOREKrWlPzZ/gxHfbUsAAueCIYQVXYJydtAJl6KYyqbUiaF7r?=
 =?iso-8859-2?Q?k/CNYvB3FCGqEn/fMXlcpvoPppUsZgRWnhUb25puap/daVeVdHiUJ/D74t?=
 =?iso-8859-2?Q?3gQo62ysRfvUmSxTGunXMSxHPAty3Xb9hCLdah4ZiDMlfhkkA6CqS3FHEg?=
 =?iso-8859-2?Q?xlvwNt6UsZ9sxkAisw7AhTUum+4PW+HdKmHRwvSfD1qNPTeJrdQplxzkwY?=
 =?iso-8859-2?Q?WWjfnmfEWQMfuqBYG2jJ0p/p40XZW7iAP2NGtILi/AYOZKexD2I/8pwcR3?=
 =?iso-8859-2?Q?mPon7nj321NvEAUe0sRISMSjKOBxvVZnz98WJXQ/wAhreOYwWnczKgutDe?=
 =?iso-8859-2?Q?BtngAeqDxf2dLUS9ALv/IaOYw9/61w10evu06UhXMFVvf5T4jAuxrUhuSP?=
 =?iso-8859-2?Q?re5qa3B9VY5TKM4Jgs1tg38NKlVMUVXu36kGqeNsudK9wp2Ihr8LkFi5Hw?=
 =?iso-8859-2?Q?QALfhSR25Ek7qKCaoLpBlA/K3ln0ZSvga6opr9ii7JGkwIeAGApu9qEn8s?=
 =?iso-8859-2?Q?eG8/sh0LFOfEvOLlPB0+WHUcHeMURAnmdT57sQadbrQdcMCopYVm+8pwZ5?=
 =?iso-8859-2?Q?LTHFuVgBcM9JxsjDeZ4+ZE0wwTY28oz7mkX2Ym+mZIBJTYLKuqtakp439a?=
 =?iso-8859-2?Q?V8eqAYp7iyjYL/XVpR7Qe/CkrPrwZ/K5BwtGD0Y8LFns24Sv2o12yiSejV?=
 =?iso-8859-2?Q?pOJf7DMGpAC6nPCiorPoDJ4URXMSajjhaiqKHqCkcyS14VjiMTmMihQgB1?=
 =?iso-8859-2?Q?r2ejPTdgiH5AGVvrdV47zlrX1xxbBmcQh+BEfWTczwql6mLXXdwGLwBhMO?=
 =?iso-8859-2?Q?uS3BxN929C70r8q1MjPATuZCMaAK0QiQ01IsgF7F04c0VbHn0/0OLyq9+z?=
 =?iso-8859-2?Q?W8v0AGaCWkjLJct6d9MqHOzxpwWpYnOT/UeCXPLAmXjN4Ff7+SwLKLThAM?=
 =?iso-8859-2?Q?3YXpNUUyu+mxA8YFthzqvwIi/hLcxHfGKNFZ+Ic1YZlRlg7h8bhfuloIm5?=
 =?iso-8859-2?Q?tBlak+ESpNd9PCjmCFJw5ROLWSVWKyUO71+c5OyY76Qw8kqyjnhM6Ny6m1?=
 =?iso-8859-2?Q?PXqxoqISHwi5DhbBwAjAdFXigVZFEY0QjK/FzSGSOKW3BZDYcP/9tBYs4L?=
 =?iso-8859-2?Q?1FwEaaEJT0rf/BIa+41EFZ9W6HtZ9KsjRo6OH6P3C+yc9D5b7M0uNqRuCG?=
 =?iso-8859-2?Q?z96IhocsVvxoVj+QQLzON75U39zIMjFQkFMrSUjBHleQfod7rMrYnFvcKZ?=
 =?iso-8859-2?Q?E5R95AzhlDAaiMr2tDV1go/ilXGSGm7DNvMtxbtgY8gw6XQXs7rOkpfHKe?=
 =?iso-8859-2?Q?gB+0S+fJ3TNFuiCbYlFsOdq1OU64ovGxAe12tpSSkbL7WAlmdMfAQaIEO8?=
 =?iso-8859-2?Q?TuzC7EtpafzVUe6oeSNdmacW5zt3WYIFmkC1uNXQJcpDi7sZ8NB/FYG4JS?=
 =?iso-8859-2?Q?NbVTc66Ujox0uPZvEWUcov7hCXoYe3u7YV+OC9VioMEkqlsCcg56WBWEST?=
 =?iso-8859-2?Q?g7qyeAttGo3VgwP8LwNIaI2FCBONtjY5PhFWU8WlfSVb5PlSJWG3XMwB71?=
 =?iso-8859-2?Q?VbtnyiV4AdCie28A7TU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c9525e18-7cba-45c4-f6a6-08db5cbe716d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:22:02.0639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZmeuKqtcYpFe/Dr+AmqoRsr7b0EsDFpQSREF5gD2dg6aVCtBZkIUpv9Ulj9+soNbu/ISRIvK+OARpxh/fOAdMDuJFo1E7WHVEH93sLCxTNl9plVz55RohejRu2zpE5+e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9477
Message-ID-Hash: EKVOAMVUQIH7YWDRNZ4OEVYUXVZS62VE
X-Message-ID-Hash: EKVOAMVUQIH7YWDRNZ4OEVYUXVZS62VE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EKVOAMVUQIH7YWDRNZ4OEVYUXVZS62VE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No driver is using dpcm_playback/capture, let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/soc.h | 4 ----
 sound/soc/soc-pcm.c | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 533e553a343f..b98f49037d71 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -729,10 +729,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
=20
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b1288553f6f6..db430afade50 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2757,12 +2757,6 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 		cpu_playback =3D SNDRV_PCM_STREAM_CAPTURE;
 	}
=20
-	/* REMOVE ME */
-	if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
-		dai_link->playback_only =3D 1;
-	if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
-		dai_link->capture_only =3D 1;
-
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		codec_dai =3D asoc_rtd_to_codec(rtd, i); /* get paired codec */
=20
--=20
2.25.1

