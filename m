Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C91179472B6
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:58:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85D2B52CA;
	Mon,  5 Aug 2024 02:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85D2B52CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819335;
	bh=75M3W4tVW9VeOc3MM+rbL8QGy0lIRnEwziVOJroiqOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tK8fq0U2BpMzGA36y4CoPI6Gcvyz3+BeHBsrvcwqPbdQcRziWcsArNsaAKBEVTp30
	 Oy6IQ8VjspTHwd0DzKmuSGv7NINuM2XrvNkRXv+V8mzi1iizC3EIwmgp0Sm2mUmPWo
	 EcJ0MBLct8mrsyK9B7m0nKuchAFYL4SGAMVrXf1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 036DDF89B57; Mon,  5 Aug 2024 02:40:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78546F89B29;
	Mon,  5 Aug 2024 02:40:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11197F89AE2; Mon,  5 Aug 2024 02:40:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ACB24F89A35
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACB24F89A35
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=a0gxzLkS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXzAnQrxY2LWf0DK86sPZcVr3+Pp2dW8zdPOpLiV2u6oqqL+xFblQfEH0s871sVNh9kKBYk8BnVhm/CcIJErcOtKIL9CHArHL1L6C+VDLFFGhcBMGdZSTlNffRAGN0DFAaremQ2Hkouzu1g4cqeYWIKSNAtjFJokVRmSXt6Wo/mzi9z+yxgM7Yc+2qUfZSxCZ9dQZt7vWwRt6/68zOw4ePeUqEQVVU+ASEvCqYfeyqzUPJWuz+UrvU3kuJ6oA3rjquoutuTYEaJM2PywBBIUSXcuyN60FvztykvVPKV78CeMQA5/zsYTX46rYuUSAQfDCFJmfwfckI7JYOKo9+InKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxRIoimJe05t2bsWKGO+/4Yh3+LXfJPxjHOA16YHuZ8=;
 b=gaWdf+S7gxq70YXPbHm3sYHVurf9SZ+QF/j0+WUjeH7qniYWm7cxXAOKqGVUZpiKEXPXorgv16GTtWEOmLCtEgWyfmf11PCWO58GxwMlPnhPwkZ8Sp4NKdDVdk17BtpTrExnSP+H5YAIJBWjid6tiwWY8jdWORF9bstaXaR1kD3SNvwNr+WcEmIlhkAptTzAqu3M6kegynplpch/AY+C+Rbs7X5hLrx3OJ+MwYcawoLfEm+buXUhmE2wd6MBiZfCrHuHBtF/GhNOeLa/A3EeGp3yvP382tQUQFrwSuHeQCvigaFoxHFw3XQ5rOhUqCjqklLRgiTqnV1R3gpLmEmw/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxRIoimJe05t2bsWKGO+/4Yh3+LXfJPxjHOA16YHuZ8=;
 b=a0gxzLkSRFBSzJb6cFD7lYfPQdRtbau7Wr3vcmtXC6XV3zz4+1yshIgZXnZ2X+5b0mdPMZvmRDcE+as2+wfWVU0U+62XTf038PoR4w1Y5l0e9KjZAFXaMPjh+oLwANtYVWWo6QGXWBHhPToePMe7UnJMcMA59/Y4XoC8rGfjCxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:12 +0000
Message-ID: <87mslryf83.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 062/113] ASoC: intel: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:12 +0000
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 944a19d4-bcb0-4bac-c189-08dcb4e72ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Gvb3nm7ohmvwAan/Fta5CjsNa7NJVnWe0l/kwehd2n7Pphfr3J3c87Wo6GJ+?=
 =?us-ascii?Q?sHMcI+prPxA6dtPpChlnEvuzZG30VVLDvTlC7SzStg0l1CYhyaP0RRmmyvZZ?=
 =?us-ascii?Q?BWvly+segHJSRu7VTqA7Lch6OKJlgBaEo+zRm7If5F9w6zhg2HjGdwGQjAoI?=
 =?us-ascii?Q?2TqYOyy2vaRw9Dx9uLke/hFQPGrZrQoahHF5UiPyUmwf+QtnJ9sgEGZnN0PZ?=
 =?us-ascii?Q?bltz6e7SFSHDKT2d4kAGVtqzvhVVQFdHsvBGN/n20SmcIbMc2J+fnVhHfYuj?=
 =?us-ascii?Q?4+gmUGn85VMLT0aSOdxSJ5Xy8j7XjIb2tdJm9SxjWppI4a8v+QyKhw2wZKCQ?=
 =?us-ascii?Q?Zhst4zzU7nfWJPbGm1SMb3Zu+zW/6FIgze8gZMNN9KQSMuNXywYqBKelvSq7?=
 =?us-ascii?Q?pZitdISqqX5AzRwddCNDI0yo11NW+Kf5D1QqlGFFfKxnH0xFbiyxj4m70FOn?=
 =?us-ascii?Q?lRx+PyNdbu38u/HYcADnUXP0kPzHjjAVfJZ5gRr1NxtL0harcFYs5XRQL4bF?=
 =?us-ascii?Q?wttmamxHwo0PdzS5XzW23fevtlUOyJH2qwE4g6IXuhEfO2IVrm3R7vV9YiqJ?=
 =?us-ascii?Q?WdnWKM1bAExMUm5iBkkvL5qYQeglGfyMfzuK3ffNvIesZtb78VZazm3FC75G?=
 =?us-ascii?Q?dS8da84fgxI5E0vlmCHx1RLYP1q9BA453IuJPM+S9LC2ZICvJZWVpfx08jUM?=
 =?us-ascii?Q?xMhEgvkJcOUzCl5av0tebo981sSOiUTKdWGvsUm7JjrmyEHDgJERM7lmqdI1?=
 =?us-ascii?Q?982zLo1nPo6h2NteDBN2c9xAlasYO0iAnPzrVU5qccjZ+yfbAK3T/Wc1LCcv?=
 =?us-ascii?Q?JkPwMLfRNaEJOstBDpdIYB/tvGXnUJAuDRl4dILO+qRXHrbQjgoutXKF47QP?=
 =?us-ascii?Q?riGawV4AbxIUCeaxxAO1QktV+m6/8MHnx5yZ0HYJHS2XaGhwBeroh0iKHDOv?=
 =?us-ascii?Q?p4AXKtdSj5yAzQW1kLKxeEe5iegj1GdZdCh4NMZPbfQG/s2pUUZGTfSlV9bC?=
 =?us-ascii?Q?Q2duhxUIuhXhbGI5ywQq4K515TdeywgOZQKCf/opvucQUsBrP0jQGCv7Rpyx?=
 =?us-ascii?Q?IwddF0flC7+179dRd2nfPgiAim7yq1BkcnhBs9Wx0f9QXSKKLkgebYCKl53/?=
 =?us-ascii?Q?XHwiXfdLZgMxEqwB/U3HKGRZWXM61cwUi0+2Q26J2vSO/ra5Wleh0YBcRCZV?=
 =?us-ascii?Q?Ci9O62Da1V4vQ8+C3dA+bFEBoGfaoRCvEmKwvNX6KXA31TZ/9poE2O9DtICg?=
 =?us-ascii?Q?/tCwan7sYtc799eM3MQy5W12bT/W5MzyLtXT+K8qY6wWhyodD7Aa8s8YnaIA?=
 =?us-ascii?Q?APUmf5XnJ/Q/KFsYropMAMsRxZ5Kdd6MqT0mUSjmDIO9xCm0+DP7wj/m+MCC?=
 =?us-ascii?Q?Ti7+Kf4miz8vyrElib2LQUv+3wf2GYF3mRvkjo+bEnFItc4boA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lMe25fXS//aO5TPGkigH6QkjIKzwcMvMF59GliZzWtYWJojS2vKkurtflbzo?=
 =?us-ascii?Q?DAtRVLY4MoBrkJKbyGVnG2waFVPBrkPHSXRov0zduTh/oMhF6qsLPk3HoU/U?=
 =?us-ascii?Q?iUoBy9xRH4hVh9VJfW5YcXGqs878lp90DQ6oUZ8IlkmW3Bl63bu5krp09Scw?=
 =?us-ascii?Q?WgW4lW50+twzenGf8bGlB9bSuucCVH7nqZcP5/78BlSj7MbWT129uaWUODtr?=
 =?us-ascii?Q?M++/hs0EQ7OVNdGG8o/CvxOo114EZYOW/kF2nvc7fEDu2N2mFpD9UOajoZ60?=
 =?us-ascii?Q?qQJfhhKSrg4Hq2XjNs1Z7lYbRDzzzbBb2nY4ovveWsVJRak1kJEVs7H6qvE1?=
 =?us-ascii?Q?yU1kq4HketwH5ymnf0pTVcQlCt6Bg1TOoTxCivbH5rcL4WGBTiFxVuNRYQsP?=
 =?us-ascii?Q?1gvmE8wjD7s/u08FmkN36LQ3OZ0WDGVATmBTc029dZUk0Spss3ZWXTmQrxVG?=
 =?us-ascii?Q?R7A0R1WQYosWngdHeByEyarLKJd59zFK265I41pkvYI7c95QVLedg+dd9+rN?=
 =?us-ascii?Q?+B2G2dtMJ/tQ1/1qHTJKq7nvFosXh0JIWQf+z9RCzv4DGYS+QR5+M0j49uRy?=
 =?us-ascii?Q?/R1jY9mcF5OrPOIXyWWe4vgB5u2GmE3fHBz73ngjJtKneKAjEio7EeDOZrGL?=
 =?us-ascii?Q?kDcdxermO1GYgMCJB3Vc4uBR1vxKN3pazxHcbYG76xL+PlZiZLr4NiSKrMJA?=
 =?us-ascii?Q?oOF1Jsl36CTPanY3BJ4sAydFDVIhg4N+lNm4nacCyoGRiQNZvE8bQ3klyiRY?=
 =?us-ascii?Q?0HK+orVwzVV9znjT1Ju+mIsl5sIxzz58nFHbK61p1ooB/CEyQwh+KqL8DlVP?=
 =?us-ascii?Q?7u2uPg0lyNcilXlY0JSJcRK/LUvsgrlpAztKxlbjBy4QH8ciWY0C7qLzNl0V?=
 =?us-ascii?Q?eSC5Ci0BcOyhdMyuFPw/YSULRj1EOBpvgxkzPpBkmKfbVNh8Jz0AWqtoDb01?=
 =?us-ascii?Q?RPUgPqLGInhT7UMzej+Oi3hD7jLrtXhht25akaAZlqp89QDgwdF5X4JcAhv/?=
 =?us-ascii?Q?15ztrdTqThfPpql9t+KvpP6mqaZr/rSLL/PxSaTjHn7fkYJkKkrVQr5hcTHD?=
 =?us-ascii?Q?1PNPMcVTiK9aiV38EFAEOzrGNJ/O6O7IGhh0K69tHH/v8HdOuZdRk8aVQgeY?=
 =?us-ascii?Q?jjqFE2K/fAnS7qPgInFZ+z1Ka/7okR03PEx757SNHE9MfT1biubOiVJkNnog?=
 =?us-ascii?Q?uoQ/Z7IKGvH7WUrIkTg2JG5b3e9Pm3BDHptkrWGdgioziTDz9jLryC5KLOvE?=
 =?us-ascii?Q?+2taeownwtCzsvpg/CgNNhGOsOWH+hRC0/Wonv0GqS4riu9Jw0YyVTGs4w2f?=
 =?us-ascii?Q?DW1GEScqt4IW6xuB8NqqXQ9SLCVsMjNOH8gDH1Xw+QKZ1Pq1SZde8Bs41Co/?=
 =?us-ascii?Q?5T6hh9JbmE3ZDyM1Q9PE/ZD5HJtFRwsFlHBWGS/jQglMgnyX/RARN3imnKcv?=
 =?us-ascii?Q?EOCDVU3SopL/mKgI1cGEkHvhXWAoXXwJBuxiLKG0KwOx07HEyaE7y8YCRgMi?=
 =?us-ascii?Q?8xcwYu5wKdB22Tu22Kcxs+nkVEJulijYOFAiLDg74LPAAWsEXnqYdPE7puYb?=
 =?us-ascii?Q?gPBq5855YBqJDi4SEAey0x7h7IbItBj0CW2K87Sr0GTpksVkp3FQFKeSKdGo?=
 =?us-ascii?Q?Yh2SF3CegFpTJ6wb7kmtIAs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 944a19d4-bcb0-4bac-c189-08dcb4e72ab3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:12.7454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SQ4vBiGo7hIxn9C5VXriDnMNgruvZL87cAbd22LoEuT8Qpd4C0JAma4vBzx2D0HQT5t3IVQ6Gz4sefDA5NR0ye1OCNa1Wgaf03uADAabTLCO/ZRAyYwyZAaH/rR9KXxJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: H76Z343XSOI47M6FO37QWSIDK5RCV4FH
X-Message-ID-Hash: H76Z343XSOI47M6FO37QWSIDK5RCV4FH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H76Z343XSOI47M6FO37QWSIDK5RCV4FH/>
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
 sound/soc/intel/atom/sst-atom-controls.c     |  2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c |  2 +-
 sound/soc/intel/boards/bdw-rt5650.c          |  2 +-
 sound/soc/intel/boards/sof_maxim_common.c    |  2 +-
 sound/soc/intel/boards/sof_sdw.c             |  4 +--
 sound/soc/intel/catpt/pcm.c                  |  4 +--
 sound/soc/intel/keembay/kmb_platform.c       | 28 ++++++++++----------
 sound/soc/intel/skylake/skl-pcm.c            | 14 +++++-----
 sound/soc/intel/skylake/skl-topology.c       | 18 ++++++-------
 9 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 38116c7587174..0c6ce403148f8 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -1333,7 +1333,7 @@ int sst_send_pipe_gains(struct snd_soc_dai *dai, int stream, int mute)
 	dev_dbg(dai->dev, "enter, dai-name=%s dir=%d\n", dai->name, stream);
 	dev_dbg(dai->dev, "Stream name=%s\n", w->name);
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		snd_soc_dapm_widget_for_each_sink_path(w, p) {
 			if (p->connected && !p->connected(w, p->sink))
 				continue;
diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index dc31c2c8f54c8..f02ee7f48a2a4 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -487,7 +487,7 @@ static inline int sst_calc_tstamp(struct intel_sst_drv *ctx,
 			fw_tstamp->ring_buffer_counter);
 	dev_dbg(ctx->dev, "mrfld hardware_counter %llu in bytes\n",
 			 fw_tstamp->hardware_counter);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		delay_bytes = (size_t) (fw_tstamp->ring_buffer_counter -
 					fw_tstamp->hardware_counter);
 	else
diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 3c7cee03a02e6..a5df4d3067d71 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -150,7 +150,7 @@ static int bdw_rt5650_fe_startup(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	/* Board supports stereo and quad configurations for capture */
-	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+	if (!snd_pcm_is_capture(substream))
 		return 0;
 
 	runtime->hw.channels_max = 4;
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index fcc3b95e57a4f..f520442bbb096 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -196,7 +196,7 @@ static int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 	int ret = 0;
 
 	/* set spk pin by playback only */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		return 0;
 
 	cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d258728d64cf5..5818c21173032 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -846,8 +846,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		WARN_ON(i != num_cpus || j != num_codecs);
 
-		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
-		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
+		playback = snd_pcm_is_playback(stream);
+		capture  = snd_pcm_is_capture(stream);
 
 		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
 				       cpus, num_cpus, platform_component,
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 81a2f0339e055..c32c101e65b9c 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -83,11 +83,11 @@ catpt_get_stream_template(struct snd_pcm_substream *substream)
 	/* account for capture in bidirectional dais */
 	switch (type) {
 	case CATPT_STRM_TYPE_SYSTEM:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			type = CATPT_STRM_TYPE_CAPTURE;
 		break;
 	case CATPT_STRM_TYPE_BLUETOOTH_RENDER:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			type = CATPT_STRM_TYPE_BLUETOOTH_CAPTURE;
 		break;
 	default:
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 37ea2e1d2e922..eab7b8223b51b 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -170,7 +170,7 @@ static inline void kmb_i2s_disable_channels(struct kmb_i2s_info *kmb_i2s,
 	u32 i;
 
 	/* Disable all channels regardless of configuration*/
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		for (i = 0; i < MAX_ISR; i++)
 			writel(0, kmb_i2s->i2s_base + TER(i));
 	} else {
@@ -184,7 +184,7 @@ static inline void kmb_i2s_clear_irqs(struct kmb_i2s_info *kmb_i2s, u32 stream)
 	struct i2s_clk_config_data *config = &kmb_i2s->config;
 	u32 i;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		for (i = 0; i < config->chan_nr / 2; i++)
 			readl(kmb_i2s->i2s_base + TOR(i));
 	} else {
@@ -199,7 +199,7 @@ static inline void kmb_i2s_irq_trigger(struct kmb_i2s_info *kmb_i2s,
 	u32 i, irq;
 	u32 flag;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		flag = TX_INT_FLAG;
 	else
 		flag = RX_INT_FLAG;
@@ -270,7 +270,7 @@ static int kmb_pcm_trigger(struct snd_soc_component *component,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			kmb_i2s->tx_ptr = 0;
 			kmb_i2s->tx_substream = substream;
 		} else {
@@ -279,7 +279,7 @@ static int kmb_pcm_trigger(struct snd_soc_component *component,
 		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			kmb_i2s->tx_substream = NULL;
 		else
 			kmb_i2s->rx_substream = NULL;
@@ -378,7 +378,7 @@ static snd_pcm_uframes_t kmb_pcm_pointer(struct snd_soc_component *component,
 	struct kmb_i2s_info *kmb_i2s = runtime->private_data;
 	snd_pcm_uframes_t pos;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		pos = kmb_i2s->tx_ptr;
 	else
 		pos = kmb_i2s->rx_ptr;
@@ -419,7 +419,7 @@ static inline void kmb_i2s_enable_dma(struct kmb_i2s_info *kmb_i2s, u32 stream)
 
 	dma_reg = readl(kmb_i2s->i2s_base + I2S_DMACR);
 	/* Enable DMA handshake for stream */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		dma_reg |= I2S_DMAEN_TXBLOCK;
 	else
 		dma_reg |= I2S_DMAEN_RXBLOCK;
@@ -433,7 +433,7 @@ static inline void kmb_i2s_disable_dma(struct kmb_i2s_info *kmb_i2s, u32 stream)
 
 	dma_reg = readl(kmb_i2s->i2s_base + I2S_DMACR);
 	/* Disable DMA handshake for stream */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		dma_reg &= ~I2S_DMAEN_TXBLOCK;
 		writel(1, kmb_i2s->i2s_base + I2S_RTXDMA);
 	} else {
@@ -451,7 +451,7 @@ static void kmb_i2s_start(struct kmb_i2s_info *kmb_i2s,
 	/* I2S Programming sequence in Keem_Bay_VPU_DB_v1.1 */
 	writel(1, kmb_i2s->i2s_base + IER);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		writel(1, kmb_i2s->i2s_base + ITER);
 	else
 		writel(1, kmb_i2s->i2s_base + IRER);
@@ -474,7 +474,7 @@ static void kmb_i2s_stop(struct kmb_i2s_info *kmb_i2s,
 	/* I2S Programming sequence in Keem_Bay_VPU_DB_v1.1 */
 	kmb_i2s_clear_irqs(kmb_i2s, substream->stream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		writel(0, kmb_i2s->i2s_base + ITER);
 	else
 		writel(0, kmb_i2s->i2s_base + IRER);
@@ -556,7 +556,7 @@ static void kmb_i2s_config(struct kmb_i2s_info *kmb_i2s, int stream)
 	kmb_i2s_disable_channels(kmb_i2s, stream);
 
 	for (ch_reg = 0; ch_reg < config->chan_nr / 2; ch_reg++) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(stream)) {
 			writel(kmb_i2s->xfer_resolution,
 			       kmb_i2s->i2s_base + TCR(ch_reg));
 
@@ -678,7 +678,7 @@ static int kmb_dai_prepare(struct snd_pcm_substream *substream,
 {
 	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		writel(1, kmb_i2s->i2s_base + TXFFR);
 	else
 		writel(1, kmb_i2s->i2s_base + RXFFR);
@@ -695,7 +695,7 @@ static int kmb_dai_startup(struct snd_pcm_substream *substream,
 	if (kmb_i2s->use_pio)
 		return 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dma_data = &kmb_i2s->play_dma_data;
 	else
 		dma_data = &kmb_i2s->capture_dma_data;
@@ -713,7 +713,7 @@ static int kmb_dai_hw_free(struct snd_pcm_substream *substream,
 	if (kmb_i2s->use_pio)
 		kmb_i2s_clear_irqs(kmb_i2s, substream->stream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		writel(0, kmb_i2s->i2s_base + ITER);
 	else
 		writel(0, kmb_i2s->i2s_base + IRER);
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 613b27b8da134..2ffd511eedfe4 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -189,7 +189,7 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	snd_hdac_ext_stream_setup(stream, format_val);
 
 	stream_tag = hstream->stream_tag;
-	if (stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream->hstream.direction)) {
 		list_for_each_entry(link, &bus->hlink_list, list) {
 			if (link->index == params->link_index)
 				snd_hdac_ext_bus_link_set_stream_id(link,
@@ -225,7 +225,7 @@ static int skl_pcm_open(struct snd_pcm_substream *substream,
 	 * disable WALLCLOCK timestamps for capture streams
 	 * until we figure out how to handle digital inputs
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_WALL_CLOCK; /* legacy */
 		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_LINK_ATIME;
 	}
@@ -319,7 +319,7 @@ static int skl_pcm_hw_params(struct snd_pcm_substream *substream,
 	p_params.host_dma_id = dma_id;
 	p_params.stream = substream->stream;
 	p_params.format = params_format(params);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		p_params.host_bps = dai->driver->playback.sig_bits;
 	else
 		p_params.host_bps = dai->driver->capture.sig_bits;
@@ -574,7 +574,7 @@ static int skl_link_hw_params(struct snd_pcm_substream *substream,
 	p_params.link_index = link->index;
 	p_params.format = params_format(params);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		p_params.link_bps = codec_dai->driver->playback.sig_bits;
 	else
 		p_params.link_bps = codec_dai->driver->capture.sig_bits;
@@ -645,7 +645,7 @@ static int skl_link_hw_free(struct snd_pcm_substream *substream,
 	if (!link)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		stream_tag = hdac_stream(link_dev)->stream_tag;
 		snd_hdac_ext_bus_link_clear_stream_id(link, stream_tag);
 	}
@@ -1193,7 +1193,7 @@ static snd_pcm_uframes_t skl_platform_soc_pointer(
 	 * or greater than period boundary.
 	 */
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		pos = readl(bus->remap_addr + AZX_REG_VS_SDXDPIB_XBASE +
 				(AZX_REG_VS_SDXDPIB_XINTERVAL *
 				hdac_stream(hstream)->index));
@@ -1226,7 +1226,7 @@ static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 	codec_nsecs = div_u64(codec_frames * 1000000000LL,
 			      substream->runtime->rate);
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		return nsec + codec_nsecs;
 
 	return (nsec > codec_nsecs) ? nsec - codec_nsecs : 0;
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 602ef43211221..cb51b98b92c9a 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -198,7 +198,7 @@ static void skl_tplg_update_params_fixup(struct skl_module_cfg *m_cfg,
 	in_fmt = &m_cfg->module->formats[m_cfg->fmt_idx].inputs[0].fmt;
 	out_fmt = &m_cfg->module->formats[m_cfg->fmt_idx].outputs[0].fmt;
 
-	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(params->stream)) {
 		if (is_fe) {
 			in_fixup = m_cfg->params_fixup;
 			out_fixup = (~m_cfg->converter) &
@@ -618,9 +618,9 @@ skl_tplg_get_pipe_config(struct skl_dev *skl, struct skl_module_cfg *mconfig)
 	}
 
 	if ((pipe->conn_type == SKL_PIPE_CONN_TYPE_FE &&
-	     pipe->direction == SNDRV_PCM_STREAM_PLAYBACK) ||
+	     snd_pcm_is_playback(pipe->direction)) ||
 	     (pipe->conn_type == SKL_PIPE_CONN_TYPE_BE &&
-	     pipe->direction == SNDRV_PCM_STREAM_CAPTURE))
+	      snd_pcm_is_capture(pipe->direction)))
 		in_fmt = true;
 
 	for (i = 0; i < pipe->nr_cfgs; i++) {
@@ -1612,7 +1612,7 @@ int skl_tplg_update_pipe_params(struct device *dev,
 	if (skl->nr_modules)
 		return 0;
 
-	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(params->stream))
 		format = &mconfig->module->formats[mconfig->fmt_idx].inputs[0].fmt;
 	else
 		format = &mconfig->module->formats[mconfig->fmt_idx].outputs[0].fmt;
@@ -1642,7 +1642,7 @@ int skl_tplg_update_pipe_params(struct device *dev,
 		return -EINVAL;
 	}
 
-	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(params->stream)) {
 		res->ibs = (format->s_freq / 1000) *
 				(format->channels) *
 				(format->bit_depth >> 3);
@@ -1666,7 +1666,7 @@ skl_tplg_fe_get_cpr_module(struct snd_soc_dai *dai, int stream)
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, stream);
 	struct snd_soc_dapm_path *p = NULL;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		snd_soc_dapm_widget_for_each_sink_path(w, p) {
 			if (p->connect && p->sink->power &&
 				!is_skl_dsp_widget_type(p->sink, dai->dev))
@@ -1745,7 +1745,7 @@ skl_tplg_be_get_cpr_module(struct snd_soc_dai *dai, int stream)
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, stream);
 	struct skl_module_cfg *mconfig;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		mconfig = skl_get_mconfig_pb_cpr(dai, w);
 	} else {
 		mconfig = skl_get_mconfig_cap_cpr(dai, w);
@@ -1813,7 +1813,7 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 		goto err;
 
 	dev_dbg(skl->dev, "%s using pipe config: %d\n", __func__, pipe->cur_config_idx);
-	if (pipe->direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(pipe->direction))
 		pipe_fmt = &pipe->configs[pipe->cur_config_idx].out_fmt;
 	else
 		pipe_fmt = &pipe->configs[pipe->cur_config_idx].in_fmt;
@@ -1903,7 +1903,7 @@ int skl_tplg_be_update_params(struct snd_soc_dai *dai,
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, params->stream);
 
-	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(params->stream)) {
 		return skl_tplg_be_set_src_pipe_params(dai, w, params);
 	} else {
 		return skl_tplg_be_set_sink_pipe_params(dai, w, params);
-- 
2.43.0

