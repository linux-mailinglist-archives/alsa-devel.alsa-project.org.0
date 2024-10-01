Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DE298B1DE
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:43:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48485DE5;
	Tue,  1 Oct 2024 03:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48485DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727746980;
	bh=bxRpl+CqANhmovPfpnJXiezEz9/NtjhfhDS0v5gdQ2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dDNhY09gWSkBMv9l3SKfy8AUrqkuxeR9fEnm07tR7L5RGAd67rgmwxyL804S5aK4X
	 I5GY9FGSVIAIJiW1rbvz4l+zSzsxZsCWgkZdaoroiDYy10/x05RhAvAQiVpFa3Rhhz
	 7wmbYh7GGNgKYmgr+Qyo7JS3dEpCGzMQ4RauVffc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69B20F8060A; Tue,  1 Oct 2024 03:41:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6EDFF805B3;
	Tue,  1 Oct 2024 03:41:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DB71F805C8; Tue,  1 Oct 2024 03:41:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91F1AF8060A
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F1AF8060A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VtmfXBDz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gav7ZbTf9Huv2il18w6j4vyae8nOQc2AYPck5YObMDuc6KaKJGTWDx0NesNSrDMDqn83u6bBqyml4Ptxu2KqSzVb4GmPLat8yJTvbz6BsbdBQ+g73sGG6sZAxqMEH+F9AkivIFHZOV6YzjsWgPNSgR23DRKQD0zYQC3s16yw5SZO2M/xKvT1PqsykqXAWDLAwjvaVL70t+B/Ca7f27U7YJwmhsy+uRPh/0W6IEwsvUuxcFky+RmFIBDO+4kQTisVqXGwOxPupACydKVwkD/loFv7eaiSMwouRhuxHJzsTBiArQRe/+gO7OJuLMmAqX8xhKmQmEWJZ7zr/W+JUoCtzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DySgeS9wpZgTE1VvWnEy/VzEhwwIUcnV5MdwwU66t5A=;
 b=IhItX7uzHclVR9+7b2WLqZSiDyzDAjY+rYBkeCi0cjiMoEC0cNg9K/hmfbaSRiMatp3tD/e2UagfZBdsVL4R4AGnQaf+Lt8isPvhvwvmDAFB04+LMvKOECrI+YyAG3xcbx6dy4khJGa5WNDuL/aFRqwIDU4y6FQhW5jK/Zhz2MwRZa3pNQSX5OLEaAxVWlpHHh+DxAYZdlGWFCZ2fwvUG4TTjdoU/DXZMw6KW+a8Ua+mTMad8brG+dWIrCY+CjOjB7k2NmD7Pj9OLv8hmu/OsK04LC3UFkluvAURqxXV62YP7TZXxfWWkoM7GWyhV8Tmhe9U/6LYDplWzdgk4Lf/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DySgeS9wpZgTE1VvWnEy/VzEhwwIUcnV5MdwwU66t5A=;
 b=VtmfXBDzKjoTcihh+KRKVgxe3fFmmmkbbevos8+jyC2g7Ro1IQQzZ/gRa0OB3nkrdLaa6oW/9AQmrkFFD553NKzZ9t1pC5gZmmnVlBnut5xUCqtmihsvzOSibY11VXViuUB8t1A2QBG6WcQrBUkU7k1Q5NBz3e0MSKl+9/kdMjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13482.jpnprd01.prod.outlook.com
 (2603:1096:604:334::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:41:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:41:38 +0000
Message-ID: <87setgvbu6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 04/13] ASoC: intel: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:41:38 +0000
X-ClientProxiedBy: TYCP301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13482:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b592abd-0edc-4e31-3a6c-08dce1ba30fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v21mC61dZlVr8wNGjgfAUu9kHozFA+E99Ma+vRoTglk24MwtGolN/4rU8+tb?=
 =?us-ascii?Q?89zgS8ypCvmiEHEE9pKqraGKqTteBPMggU0vfB7AnaFEcAkxKy1vTslsCaH+?=
 =?us-ascii?Q?E3PtGICiPxp8kX13C6gGD4MX+/8yhzFsfgDQS7v9BY7zHYDJuIA5G/phy/XS?=
 =?us-ascii?Q?u0E/s5RviEYQzwpg2RY+OI0nfzXrIk2egssTT5lh0U/mZD8mw3Mvh9vnMZGZ?=
 =?us-ascii?Q?FeCpXcdMOhE0p5H4Abo7pwxRYsQvOYYgpsUedKBpsyqjjbwKjpoLvVvKMW+a?=
 =?us-ascii?Q?TgTOtNKvmy0kJJM/1/aSunfnLLpMaiwMRee6hKRxPwtjbP7EsqGeybnNiJ1t?=
 =?us-ascii?Q?8I0afTgffg9smAqcOm/CYx7gGxL5+D0eSy5YHqVUZSX5fDppjPdNRedsmm3k?=
 =?us-ascii?Q?GF86BixFPBPfTTF6ZTayLakbZXqHyAw2djAtw3lYYTtLIxNlUGs4neeXMUTY?=
 =?us-ascii?Q?99KGQ5q+47xEUD4xF1UK1Yy+ZHMZKsFyJyeqlJXqG2Ry+U4OA4vKjIKtWTT+?=
 =?us-ascii?Q?NvW8Jh7ZRl/iT1SU3QZ+TRFH3h7UzbsgSMRBTMe4QAoEB3yXuzg323/LRvpX?=
 =?us-ascii?Q?bSj3kqUYyoR2CzmzxQm3u+GPu0eXXmk6gffZf+x11KWmn7LGm8LOowe2NLx3?=
 =?us-ascii?Q?4eq1bf3PWRBqSCuHs59953usCPC5RUND15D2wVQ4UqDoZTX7QMOWzhVIOYJQ?=
 =?us-ascii?Q?v7KEi6y8OmnhPRa20CWX2+alb4ortL/bA6GMarHOGoO4V+JJo0pUPVDDsZ+q?=
 =?us-ascii?Q?eKdJgJJPB/zbYqUndlJEUSpyNVw5ShTOwOOKP7Lty6VHQCEq+r+J6T+0/aCV?=
 =?us-ascii?Q?MHWk3BGUJtz5ZzNQwQVVgi8nkjajNyuk8h70V+EA9CPDu4ex6xQ2hON6elS/?=
 =?us-ascii?Q?qGcddCBwSWe15M6ifE8OIOv4lBkEyIcZnAJ4QqAOmZbiBc1TkycVabmdIViz?=
 =?us-ascii?Q?XU5zGvoiRTmh4cfx7JSk2jb5iFwE8kqjO2dzRvrhRJzqRuMOkrBtxARnl+k/?=
 =?us-ascii?Q?jXNTv8vLWp1OrmX5q6oj5OxDp2NKF91WDohKtLNL5YgcTWKyFpizaoPBbZ94?=
 =?us-ascii?Q?SZIDbJ0rkfQtlgRJhH6kNoNCN5uk9oZqcJ9LBIdTv3oXo7kzZ6urk6hz80IG?=
 =?us-ascii?Q?AgeNRNbtBDd04vqsW7Td8ybtS7f57hGxr4IwbUaHqkSgGYaAqtq+8g4ExbN1?=
 =?us-ascii?Q?59k+8X9COdLWUt50MDB2RaY45cXbn1pak3p1JONMA3nB99XLMuW6k0SXn9ps?=
 =?us-ascii?Q?jVDrf8cj9k3ymYUNjKcC8AjnhUWaeQW3BSwtTN0wkKoUU0bjBq0c1LKgYWBj?=
 =?us-ascii?Q?yNGUXx7gcWW7sE4qnqQbR0r1pN+NCBwckNm/PFvFIAIckA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T8qSaa7rBsPkKi2U7SuE+Q2ub84WdoVNKuihvuU6VfbjdOu697GmZpHAZ02D?=
 =?us-ascii?Q?3puvwPZ8McCISe3Z0HTSCSv4xer3h2AAalWxPu1DCgS6jxeP4S5ND02ofBZ7?=
 =?us-ascii?Q?TgXUfM5gBrY4nWn/Y3Jxt3RodzBWtIXrhP0R+QkAg1gv/qJ1Yf1Mf8pNLTPj?=
 =?us-ascii?Q?fgXCntptOS6GhZ7s4/XDa6Csj1gpkxXeV0xD0KBuoMkalEUwAlWtPBShtFz0?=
 =?us-ascii?Q?8Ofv771T5GvBJ+Ja5cQCAihjXsdjZ9SKEXWuhoI3NgT7/zBS6Rx4Z4BXCim/?=
 =?us-ascii?Q?vWnyGH7kS94GZNIfM94zSZsNl8bLrkK8qZW44N3At160D2VtC4/WyO/SFPsP?=
 =?us-ascii?Q?sRDOqGqMCK/CHZDXJIzAG5Q2kWL5eg8BlyMNQ0IkIBXey4TJWGENQ1Z8iUec?=
 =?us-ascii?Q?mSEHPLHHkXD+6sx7w6K8tqvr4dg9d9u7k4uEP8yueKMpykI4fxzFwhbivl+I?=
 =?us-ascii?Q?o22RavCVBP8CxD/yegSRCOuOsU4Azg9BcKda1WbLEFpDhTrPkKO+HIF2swSo?=
 =?us-ascii?Q?LxIj8ESrvKeTTJkGEqNEpRgYtuwW96o4LbpHeTHkZIPmcUZAZQsejAfqB+IU?=
 =?us-ascii?Q?QfJ01ysI8Hxqz48UMEjhq55fFfTfvRxCU19f3/Ub0bcEgFlggmx1AeFw8SUD?=
 =?us-ascii?Q?wJwImwtRpDjoQen+L56IfQXM+hKImSSaH1l5V/Ge3+OfWoB99hL6UHIEuiqw?=
 =?us-ascii?Q?XKnMYuGCjhuvCwyDcrqhaku67CfLmZWudyMJBQJsjke9mHFzD3+oO6dauV+x?=
 =?us-ascii?Q?SLqA1637W1TXJxk08/Dcwn5RCcRQc3WyLzYnbPihm5CCSyzQfg+6zTYRUSNv?=
 =?us-ascii?Q?xcmeO+LQi0RmPo4hIVKGZ17E/Fs9HqRiBUlK6LVM3R588k8mtl9gH0vhZdPd?=
 =?us-ascii?Q?sVnEcoNOo93+CKA8GzJhW1OjM4738W6nJiM22FRmsi/Dtwy1OcbeD1bKEzQt?=
 =?us-ascii?Q?x539Bv2oXDjXuVQB6D/Xr7jJAGEY24AY9oy+UFibNarbffduLpp4sHVqLY/W?=
 =?us-ascii?Q?jh7j1a/lLhFpmqm+pMe59oa1PqPo/+8BItMT2OtkQqymJmMSjrHsL9nJgNcj?=
 =?us-ascii?Q?x1Rjb4XfVyFDKJBUoAflPym+ge+/tHHp9Z9MhjdiYExf/HdMKyiImnzPDrW3?=
 =?us-ascii?Q?5dnT5odgNlZNOPeyRDFecWKbJwx9qvTk2kV9EWOHkUWUuLp2rMgG1BbFup2m?=
 =?us-ascii?Q?mIOrLB3kY5BSrgEiswZB8yLwe1L7ToEiVosdEqpz+3J6T3H9tcfM+I73vwcM?=
 =?us-ascii?Q?xYoILmcjrLeHqnIUmW1hDswjt6evEzdImXbxSO54NpmOtejQDnFA7WQFyxqX?=
 =?us-ascii?Q?+O+D3iJvv1NoqWztPRNXb3+syyvLEzzT8pZKx/jhRPpv83VMXwm2XJMAe5Dy?=
 =?us-ascii?Q?W4VIcdSCH1aVCzgRLmjIzs3pLHuoB2DhCMhKHDcUeE5lWdtheIX5t8WrnXPb?=
 =?us-ascii?Q?yALxhSZ6SeMwdOfQHl67NciW9rkPHX131vseQdOTmpBDmXxAeJHVWZJbUBS2?=
 =?us-ascii?Q?+QBfUX8PDvmJxD84bgU4HiCkiApPcwN/RKGNH6h2b2dfg1XGTR0Ws88iscCF?=
 =?us-ascii?Q?eUCo0WmxCi/Q2KQMhj/7QW16XRDLeSTYshOnmGRLASGKdnd1vjJ3gjSxOnnG?=
 =?us-ascii?Q?ztKwTKXuvzmSVkDypL+Id2k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b592abd-0edc-4e31-3a6c-08dce1ba30fa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:41:38.2481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IcIbdnhzf+aoiDZw90q5lBRvc3d73hh3yMnvwBcPNkFiykVSazNbtKaQqDe3Pnx85s0x8RztuF+9vXSPIZATeD4PWVjMRYRMWMecwYtlvSkVLku3Vwz6iGKjEV1xSGRy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13482
Message-ID-Hash: PW5KSFCLGHQ2OFL4KIUAJG3LCX7UM3XO
X-Message-ID-Hash: PW5KSFCLGHQ2OFL4KIUAJG3LCX7UM3XO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PW5KSFCLGHQ2OFL4KIUAJG3LCX7UM3XO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/da7219.c    | 2 --
 sound/soc/intel/avs/boards/dmic.c      | 4 ++--
 sound/soc/intel/avs/boards/es8336.c    | 2 --
 sound/soc/intel/avs/boards/hdaudio.c   | 4 ----
 sound/soc/intel/avs/boards/i2s_test.c  | 2 --
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 2 --
 sound/soc/intel/avs/boards/max98927.c  | 2 --
 sound/soc/intel/avs/boards/nau8825.c   | 2 --
 sound/soc/intel/avs/boards/rt274.c     | 2 --
 sound/soc/intel/avs/boards/rt286.c     | 2 --
 sound/soc/intel/avs/boards/rt298.c     | 2 --
 sound/soc/intel/avs/boards/rt5514.c    | 2 +-
 sound/soc/intel/avs/boards/rt5663.c    | 2 --
 sound/soc/intel/avs/boards/rt5682.c    | 2 --
 sound/soc/intel/avs/boards/ssm4567.c   | 2 --
 16 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 80c0a1a95654..93eba4fd2771 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -203,8 +203,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index a31aa471a1c2..4dd9591ee98b 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index c8522e2430f8..426ce37105ae 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -233,8 +233,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_es8336_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 430c070a1a0e..cb6d54db7189 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -160,8 +158,6 @@ static const struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
 	.cpus = &snd_soc_dummy_dlc,
 	.num_cpus = 1,
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 7e6c8d9c900b..4556f105c793 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -46,8 +46,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 8d550e82b46a..6570209c1a63 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -82,7 +82,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_only = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index fdef5a008daf..6f25e66344b7 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -134,8 +134,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 082f311d8b84..ad18c4e9a670 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -131,8 +131,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 6ea9058fdb2a..bf902540744c 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -210,8 +210,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 9fcce86c6eb4..4b6c02a40204 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -184,8 +184,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index f157f2d19efb..e40563ca99fd 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -153,8 +153,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 1e85242c8dd2..94fce07c83f9 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -173,8 +173,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index cfa146b6cf08..30588d9e9ba3 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -121,7 +121,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
+	dl->capture_only = 1;
 	dl->ops = &avs_rt5514_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 44f857e90969..b456b9d14665 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -171,8 +171,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5663_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ops = &avs_rt5663_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 0dcc6392a0cc..335960cfd7ba 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -242,8 +242,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 63bbfc30f35e..cfef00462f66 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -121,8 +121,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
-- 
2.43.0

