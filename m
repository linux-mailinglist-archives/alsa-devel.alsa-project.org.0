Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA5B98B1E6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:45:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 514C3828;
	Tue,  1 Oct 2024 03:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 514C3828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727747121;
	bh=stDU8JGHZ81Cv1ZnOvOQ0Z8lRF5ezijdp0O8cg2MXcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sg2i4xUrZOutDfYC6g5UrHVFxCqMKISwdzdv+Ch4fFWcxksm5hB2kyCCz18rLcTUj
	 ELC7nKD89wc+bBu5PRuFev2DWgsqcM7qSmQRu4xGtLkd6NzW/7O+tE+4Q9Pu4iP/6e
	 Hx4oktjTh1aYd+WuKg1Es9IG0ClP3hAIvzvrt6KM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F8AF80765; Tue,  1 Oct 2024 03:42:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 731AAF8076F;
	Tue,  1 Oct 2024 03:42:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50DACF80751; Tue,  1 Oct 2024 03:42:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32DF8F80722
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32DF8F80722
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IfP958DU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXYBLZti3SfBenAN1kE886qRmYIRjufODjjp1bHhk2AA47NrhVhFiFNf+WhyXrvICeCWjM87cL07t34k3OUZdzLSiUUxLC6JxRMcEZE8G46epiKYjtRjSqDEseeXW3UA9UGqkjwrjV0mp+CFv6nwBF812NhfloRraG5yRbCR2XE02McFkoDF+9NPcgZ4SwDFvG/r0Z1+THQY2DQkggH9OV1Aptxw40cdBUXMtIhxyC04I1qIfaeu73wGRpSVc39En5/sQRrMKQEV8jYmy2FQamTcIlRT9VkeMmAKIf8i7GT/MQxnDiMz8lii+4zsAQkkY+IMHnhwBkACU4c+cjdL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ExHSygHUc+FRACFEvvoxJ7uEx2s+w5hUoii2drGH8k=;
 b=g3uN3C9kKjIPqkLPozmYAzdtWk5toNZsPHbJqMbR2HVlHER5JaFORgfWsDBvehY4i/kSxopZGGvkOa4oEdUB0xkoVFAvEjgP1Wp4K8MsAovg7Zys8Hl3U0HtpL6HErje/gk0WIcQJIM2LrEqoF4VVsOLNDMM2XjVtZe5sy4BY1yRNPgFbFvR97Ir5sfUebJlTB+W0vGqZRjFXLx/dY5y+BKBHuYFWbGAyddjgTUKC+8Wr0Cb5ugAG4K2JelrSrODrOShgG8/zy/ZvDHPrja5F1Iaz7YVUSbrjNqDcjVCkZjky076ZmVbrnoFk15EFFROMXGQA6AAUqIHOLwIsUQRUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ExHSygHUc+FRACFEvvoxJ7uEx2s+w5hUoii2drGH8k=;
 b=IfP958DUqRbz1AyfYCC7h6Un15yNY2Lx7K1q/LKWus6725LnqGoW+9fg5CO1zT4Otk2OQPsRtkQH7M6Q9DaK2Q7AMxIvwrX8GJl9sjeuW8TNPass9Y5KVx4PRKZyKpYvu6tuhLmGq/J87eihp3tqLs+1jjdjUCy4MXku+ulYaPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6629.jpnprd01.prod.outlook.com
 (2603:1096:604:fd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:42:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:42:20 +0000
Message-ID: <87h69wvbsz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 12/13] ASoC: doc: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:42:20 +0000
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: 4375c046-075d-46db-f1f8-08dce1ba4a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0w3YDGnraIbuqM/RGD1gsdin/hHwY+tzhbRwJi7rNhu8tUyzF5/958txwv1g?=
 =?us-ascii?Q?8ik6b0ZcLKopaXkYaA6fXsV1H+7Cfsb45kPccv5tB2d0s2iacwPfNC77syNj?=
 =?us-ascii?Q?XW4AcNPoPgfyeUuTFJnHqlaVo8X34yuhbFonxGY3cvnV1dUubV4t3xI4RJuF?=
 =?us-ascii?Q?27h5VwG5rTYR4t64uaKm/3V46vyikelFcjjq6nILL2OiQP3FvzVQi5qN958t?=
 =?us-ascii?Q?XzJBhXeT1SE+8Y2wnhCRaM4fipdyfumqVuU2tZyOg9DHOrwAqI8tFwpn9xID?=
 =?us-ascii?Q?2tk/M0NlxPIfIA/MakI96hdvB8OsQ05FgTT9ITjh+dtV5K285Xc8X51vHIHV?=
 =?us-ascii?Q?AsAnGMBk5f6+01YmljJztPfpOVik7vzL419oqSBdGACA9dfkqLnU9OHEF08t?=
 =?us-ascii?Q?sNYvcR/N3/G9/rezkNwgVRlLg93xt2M3Hsou0EPQRQ6HdN/pLYQOkeLezRZB?=
 =?us-ascii?Q?CbdqbaNI1QkzTz0PHuyTcdW9uoyDYyGUw9z+NFzqSylJvco6tWgdOnm8CMWV?=
 =?us-ascii?Q?AoVqBPmpxrIcw7WkgD4oOaj2w3Y4RrFai3CYoGbvMWFbeGfyEn2yEF4cgABV?=
 =?us-ascii?Q?0ytRIBnsv2X6qG6THYbRHhWDwZG3Hz5kI+VA8rKQoE0cNX4MZTyJ4VL9bycz?=
 =?us-ascii?Q?88tfWtMinw5H++4S4PKgza7ZWB5ixacrV3VpAoAAWgOSMRXJxyVf25MihwxI?=
 =?us-ascii?Q?m3knh1dEb401/jUw09LgefTq6eKfM1ArdRnmON9iQpznCsbT1oVqI1GAT36n?=
 =?us-ascii?Q?aH1HJc8vC4+U3uCOmu/PZolfg5r3tC8JSK51BQkLbkWpb5K7o0PH8DIDuUPT?=
 =?us-ascii?Q?++MLcmY41//eQolfQZmlw5t/ZjwQWNhEbcoB0DwPuh2d6YMBWZR9ul1zrFI+?=
 =?us-ascii?Q?zgPAbIaH9Jjaog8e9pf8FboT4t6WvIAnEzvayEyrURNzTcsxFMau7PpWI5iU?=
 =?us-ascii?Q?Ws5Sdn1yVSi3hGdLblWmehZMqMJXcRUq6CVV1z9k/phE2TEcIsMCUslS+2ZF?=
 =?us-ascii?Q?wu/Y8ADJsrhUirExRDoU2wGCKtC3v1AJIlR3QvIxUz20heSbJjht1bcMiGVn?=
 =?us-ascii?Q?rPf4cOk78PPpin7ddlsj/SPmbMyS2LgL2vHkNqXoWPpg9VIg7vDIKFV7XYnx?=
 =?us-ascii?Q?c5QIu73EL/44qwnlZGmq7Oqj9ALqjy3oZb2M5DB3ToAFnx8gsY5Z9MLmTqKw?=
 =?us-ascii?Q?a19wX17ZMmp+XGRWLGPpxcn9F2LQHgXN53pjn0ofopycw8clMFJFFq4yPGno?=
 =?us-ascii?Q?u68z4TrMIf+o09e6M/PX8mu7Bmw7Hz2rWaZSynUYy9xEWFShoLPu9emW+LXM?=
 =?us-ascii?Q?glom6SR0osyyk6L8eqDWDfV3CzCDSU2mAu2tJ5T7IovX3w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C0ppTN1p+SemkDw8xxGZvxolR/DF1j73AaLFy7xynBiINoedgocg83Cpur49?=
 =?us-ascii?Q?g+Ei+KA4vWzKijSdfvHFF8D/VHJXXh1UitXnLc4xlGIy9D8HXVZNwXchLDtw?=
 =?us-ascii?Q?5EixB4BKlcLev/55+j4nSKKEtabN2eb7ZaTk9PPxyfumGekrZKY+3CQr7FrC?=
 =?us-ascii?Q?tQuzadtcYkeyO36sJvmgfp6PeGDNIyc9xMgdk9nMVFu2a1ZV73EMwccuRsPm?=
 =?us-ascii?Q?dboJxRhILSVY/2W11D/fETQyUuCDCYxBOGL4qLYJMQTWZuHDBm3hmRguwMJy?=
 =?us-ascii?Q?fqTNlcWGYEf26hkJsLevGjfNTAdZ/T8LyedsX5FNowk54MT7TqO7+FpqQt7r?=
 =?us-ascii?Q?D+R1dkPEgmQ+EJrz/FUzUjF2EIWiDmLe8WNRx17WmvC/CKNn7G9pC2ySoGNz?=
 =?us-ascii?Q?+6EAUTwdtV7KhlA50LFZSz2ep1Q2NqfhCrbEVtcegfPFoQzRYeZU8qF90wpS?=
 =?us-ascii?Q?KTu7xpqd29loS7Q+QrF3zUzvOOtg+K9piw/x4PQ8/d45B05kCN5m9qqtOetN?=
 =?us-ascii?Q?5kwTa/G2QjHzAwHyEq6cEDIg7ha46WnLlGdcPjxJOC0WWo0wgpUAY2WJ91z5?=
 =?us-ascii?Q?QZCt/V1hdxO38twsRo1lJBjvuUt1somwV8DUyMGu8G3Jb0n9rBtgyjgc8TPp?=
 =?us-ascii?Q?v7ATUcSwgFE8mzJJKKYcq778XQvvVUzJTZ2G4k2HmRCKdT6ipPOCh7QG/Ben?=
 =?us-ascii?Q?xadv4+URK3SAA74di099tTMOWdd9C2hTSlqy4Ycar5WdCKYxJItvL/+oxNMJ?=
 =?us-ascii?Q?it66j8qfSL1ijqkEHP4Mdg5wmiGa82pjA0ULUbP4yHJ+xeF3whYuEw73tlkS?=
 =?us-ascii?Q?qJwH8GkEbcHsFJqJk4im0xy4I6z0uFaQKyweYZnbCMd9OIdDEzC52ts145FU?=
 =?us-ascii?Q?b3PufDFsaLVcvSikeSF5pMAkh6J34nTvM0CZm/+/O+yLSYdmbngXm0y5l/OX?=
 =?us-ascii?Q?P2gMAGtFSx6WErJa0tGlfhBvlOH5+UnrS3xUpLHt79kTD+ExpMB8MXSYX4P2?=
 =?us-ascii?Q?Sa9xqLbwLeCl99CTPCJ9i0WJdFCuWLX4K6ZDQZM4uoSa4EUf+9NSn47Gq8rk?=
 =?us-ascii?Q?KgGCgCL1mgMXBbm83qLMjNJMEzZq7RGy9SqTvljoXr/Ofu+f9/Tz7zhhjLmh?=
 =?us-ascii?Q?Z5D3ExYLPI2uiDG8ZAt5i68s2DPHVLELXvTX7MDQY1bitYFQMbQoiijwQqg4?=
 =?us-ascii?Q?QJWMC37sOFVO5/wqL/hSWEBJKKPQATwrlKOxxm3tBBCZX4cULFadZfrTT7m/?=
 =?us-ascii?Q?DAZIuhuk/urLUZHZrDI19fhHERToqVrgyAQVLJOMFQX8cU7CkR4hmuZPKWGN?=
 =?us-ascii?Q?hERtu/sUAbuu40ppALuFg+r20khVKTCadmuoep98BqiaqxcXlAfRZKEBJJZg?=
 =?us-ascii?Q?yXk+sbCXHMuLPafxaTamnlgfr8ImEyAVU6OPEp6x++qGgFwsNfARUYh8A7OB?=
 =?us-ascii?Q?wkHJdb/phL7iT/bZYyHJzL78qyjvcR9KAtX7u4S+xZRvHWSI9wP1s3Wh/CfT?=
 =?us-ascii?Q?ioVErBlYwwsBbukHGUA+jVUT54IJD33Aal09cedpUJ4g00FHkGNeAg1c+RY7?=
 =?us-ascii?Q?UaRIIeAq9KO1NyZ8j3UEM3jCwuScRbLqG2FRtg8Uz64Tqj5JsZ7l3p9Y1bFy?=
 =?us-ascii?Q?e5KazNKiZEe+DK6ZvNdvLaY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4375c046-075d-46db-f1f8-08dce1ba4a3a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:42:20.6954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qoYK2WeBXIoVlkFmqSInOsAwhswfpqz5OptNAm83apQwjn0n71wkc04bPeLFUgjlyzdQx99hLRqw0TivQcWQn9DTzu6haCWqY8m4FrndZzPZgu4I0e5ksb/VCPGJ+41X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6629
Message-ID-Hash: CNDTQKOQHNTXTESIAHXH3JIARK4RMJVZ
X-Message-ID-Hash: CNDTQKOQHNTXTESIAHXH3JIARK4RMJVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CNDTQKOQHNTXTESIAHXH3JIARK4RMJVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/dpcm.rst | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 2d7ad1d91504..02419a6f8213 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -157,15 +157,13 @@ FE DAI links are defined as follows :-
 		.codec_dai_name = "snd-soc-dummy-dai",
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
 	},
 	.....< other FE and BE DAI links here >
   };
 
 This FE DAI link is pretty similar to a regular DAI link except that we also
-set the DAI link to a DPCM FE with the ``dynamic = 1``. The supported FE stream
-directions should also be set with the ``dpcm_playback`` and ``dpcm_capture``
-flags. There is also an option to specify the ordering of the trigger call for
+set the DAI link to a DPCM FE with the ``dynamic = 1``.
+There is also an option to specify the ordering of the trigger call for
 each FE. This allows the ASoC core to trigger the DSP before or after the other
 components (as some DSPs have strong requirements for the ordering DAI/DSP
 start and stop sequences).
@@ -189,15 +187,12 @@ The BE DAIs are configured as follows :-
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = hswult_ssp0_fixup,
 		.ops = &haswell_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 	},
 	.....< other BE DAI links here >
   };
 
 This BE DAI link connects DAI0 to the codec (in this case RT5460 AIF1). It sets
-the ``no_pcm`` flag to mark it has a BE and sets flags for supported stream
-directions using ``dpcm_playback`` and ``dpcm_capture`` above.
+the ``no_pcm`` flag to mark it has a BE.
 
 The BE has also flags set for ignoring suspend and PM down time. This allows
 the BE to work in a hostless mode where the host CPU is not transferring data
-- 
2.43.0

