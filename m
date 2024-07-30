Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A9094041B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 818F3839;
	Tue, 30 Jul 2024 04:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 818F3839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305218;
	bh=jH2DpPFEyirgwDwReXjxwS4/jLwlIzeNkkNDwVZeKIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E4fV0s9gR48onPgeh44MNmWwa+deAfNdXRfxuD2lFqGpEeiR/e1Eo6lts/FHyVvdC
	 63R0qPkAshdEnuRE19hgcv6HNVapciqahh9h3XB3tZzd/Zh0C+vDVubcaMYTFbYyvA
	 n1+h7pP+LNdkQFlXVj+stduXeK1ZjgyMELX5+9qo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4759F805C7; Tue, 30 Jul 2024 04:05:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FBD0F80649;
	Tue, 30 Jul 2024 04:05:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EBADF80579; Tue, 30 Jul 2024 04:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9B09F805AD
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9B09F805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V6VR1Va4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWBfhTVZ5htNAtYm8EltwYCa511+f3mPlhDqNcy3XkdhjrzrmEolHMv0QxnnEX3jRfZjzhhvh9O/nggBt7d2Nd9YRwMBZLlgB8yVzWjQfNzi3vgH+LCwTziKktOp5qIjtl2BjxyPykKsJSpKHoj41TZOE9Yb7M3kJEV5Mc1E5fs5GRWUW1wTsgeUn+BegAn0HNLJaWe9AEnsOlW5lZe7l5iFJ6Nww03hHO2XRgLrP8bH28GOku8/oID9NZ3XUHmRiWXkhYrK0cc2M9kal4TgE/Q5f+N1Em8KfHQmEFdGhyq4N93A7yLUJ2C2uQe5Q+dN2hN6JPC36LsrLoP1P3Q06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Kcc6ms8WPnx5zuAcgQzYbF1g7HgSnPy91ZRHxhdeTc=;
 b=e9iO3IE3YqryjpSRm3zn2Amul2R6h104aZJaOHGOTR0iLeq3Y2lEFD1C9hECjz+H+zHGIU5+uupTezBoWq4ur/bjRkN5aOeackI1zM109U8aDn0CE7GXlO74SwM+XRg3cyzbvj9LVPUeYMRL1KGYlN5ExIVytX0g3ciRVLApRJb4rj93X2w+XLhtO9xgE5pdnHQRRMlYt6OwQrPRKZky0r45AY01biFWpJKT3AoQZE+P46sTce/t828XNRHBLxar37YDbZSqSPtvMoOrhryy3b0JggQ3bAOfIjwIx+fuRZrMK2mesrRyJ29Ih3CopKV0QwI7vL/WlKDuEwtJjklxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Kcc6ms8WPnx5zuAcgQzYbF1g7HgSnPy91ZRHxhdeTc=;
 b=V6VR1Va4Xeb6jbD+Q2ce/n6+OJaFbMJF6gOYaJZAzVcMaaG4DiuoQdCeWzV4HbwfxUluLH74xHXw4aNd/IuWblFoPklvIebAn2cwp6RrQ3JYM3BHZr7YpoHGyA18J/U0/4zuXFHdRWGUdwCEHyGK+t6Q1vLSGMjpC5oH9hQMFdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6427.jpnprd01.prod.outlook.com
 (2603:1096:400:a1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:05:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:05:33 +0000
Message-ID: <87plqvk51y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/12] ALSA: pcm_timer: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:05:30 +0000
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 659c6604-8380-45b1-3dd4-08dcb03c1715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pAuYv0sIyfIbsFr/TlhXnRKQ22+3JSDOLn+9KRB1cz01IDaHrA8WACi7WLkS?=
 =?us-ascii?Q?HYokzpbH6bZWlT1t2MK2chYL3zsVXidJXzdkRZov2fLIWHygDCkeNR3c3UIq?=
 =?us-ascii?Q?AmFn8Sp7igzhtQF5nnMqgolSSYvGc12e0g7XbhHboCaySG65L06V1LkP5ZOA?=
 =?us-ascii?Q?EOWu6uXMRLRbsn01DTcyAgmsgjHQkPLhW1Ps/Bexsu/UBk7otPnVwUTyL01e?=
 =?us-ascii?Q?FpcsaGrAmei08FmG5AyqTVAP9flXbLPFOq8lKKqQqjf2amfPC4UZ7JGfJx9W?=
 =?us-ascii?Q?3XEoxI6FMHKKDzZe3QHnJLb/xmEBdfGABk2vb46CfHzq5+5HL3W9R+Y6clIS?=
 =?us-ascii?Q?uJPES35dHBX2RoYghS1LaGp38alq5k9bba/sq1DFldSPVe4iAr6IcW/RL5rS?=
 =?us-ascii?Q?DaWZJDRO6oLlVahEnZcqid50oJo8q+E1zcpAj127TwTQtoPMFWpmk5JKl3sT?=
 =?us-ascii?Q?imfSPss+yxXGwPr9dKfO6Xtgn8BnS1Pnq+Q6graDFUSzbwHNNLbah7XluNpr?=
 =?us-ascii?Q?pufvrtkqYxIu9hepFNrgJbWOfhCpIA1UKxYKfxTsMrgWbFnc9EiU6p4mddyl?=
 =?us-ascii?Q?pJWsB03IkGyu9Bmk6x7PM7onOIkwgtjBkIVo/60u5fGgYREHsIAW1be3m1Oj?=
 =?us-ascii?Q?9Sl1GsmfTRIdM4/nR/GlU5vYFZMQ9D3nDcKGQagoNDWkY9bGQMX1wJJMmHQt?=
 =?us-ascii?Q?DrCtFv2dVlgZdw48sc6LDGzi1y8beeoWJZn9WLsc4c7OPI8PTrPh0qLRlG9a?=
 =?us-ascii?Q?KrEFWr3Hjx31NgHBw6P5CghLFXyf20el/USEDCO4CaJR2KD0EFG5RL2mk1ud?=
 =?us-ascii?Q?P0LBpd6Kak/m0lSv/yEUdB1cpJ5CTuLHPGRjTA7Cl1UvXdjnf+5ypZ4i1IqR?=
 =?us-ascii?Q?x4iOIWHdOCOYsH+aFDVeznjDXshzCGoyLhuBYqAYyd8Rhxiqn0Vr8WwlALR7?=
 =?us-ascii?Q?mznJN9iT8Bc8KwBARsx8TZf6WGIk/+taGDjf3+uTqs7aHfUmclIxQqEpQ4Od?=
 =?us-ascii?Q?nQNo7ZqWTOUVM3vuASujktxof+ItLNvDjXYehNTOB//hRbf4BtmgjIEh+2As?=
 =?us-ascii?Q?03WT4oi2RztMkgfhwRIMlTTC6Z+D7etUo9tgRA8txX7Rgr9cHMNsB1aZPex7?=
 =?us-ascii?Q?ijTZRH+kFc3wJBa6yga0rkQeEAYkCalDl4wwaCMwUpV/AGGrqMLtbWHzO6xb?=
 =?us-ascii?Q?ft5fdcpDjCoWgPmz/GRhrogheXqpKGryDgf59LBfq1r0bBWtel/VIHBWuULw?=
 =?us-ascii?Q?RUak8lHPQpNee88FG6a/HZGt6/RPISBQSFeOI+re0rilvIATKlzTr+5EbBPE?=
 =?us-ascii?Q?P1u+9l/9KCvdv7zaeGTsG66PTaa6EWiENVqA/ojhFvdm75fP2JlR2vT7F4KB?=
 =?us-ascii?Q?0QiRfX3wg0l6a4kk1s0C95XeyC0jD6nDRqJX+jHR6VIuoPMEfg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EW3l53EW6FGTGn/C4LY7mlZTzdiYdpignQdN6XMHXW7M+Y8TNO8T5qP67KqM?=
 =?us-ascii?Q?UeZsfdbwl6Icz1JRFBvREmJdLUEfdYU4p4X7iuDe3eVpgs90wzxUezXD/CdP?=
 =?us-ascii?Q?Ha8hXwmCCZ13SYAzfwVkECWeL9vnygHFO3kSXZ5mj/A6P8kTcbhuk202krMp?=
 =?us-ascii?Q?xJ5mRQqyKpp31RDrK9HG8CLRqGzdrFCvMek6Vcn2d7CZrfwyC9l2ogaozotE?=
 =?us-ascii?Q?wHNP6AffiD0OkneYbi4xkdU0vIXquJlXeI1fEQ1NpPPYjpwspBtfw64fVCTI?=
 =?us-ascii?Q?3lHoQvyqMi9QezTj8nvW38LfhSSLixvUaXKZTqRlLrp9bsedF3FS3VBCC3U6?=
 =?us-ascii?Q?4k3afrMai8HJ/F4riVaQwzPnSvyH/OJG01r3DMUOXLJgdClI7Civ2amAgZ/k?=
 =?us-ascii?Q?KFnOL2viC6aNJxMFjNu6rEQm31lgx+zppYQhQ1cIbx0TenXOBhLsUeZNewqV?=
 =?us-ascii?Q?dxbH1gDWudI3LMTrZYvxZfjwnL17FMziu/djgXUhlQfQZm9NaC5RFkJqyfzH?=
 =?us-ascii?Q?OZxG9dQVkrTdaJU30Ubc0FIUtZqbHowckKW4TZgXOrQPisZivenzs0vXpuTs?=
 =?us-ascii?Q?o0qWQHc6lPdHFQkqqMY2kiXtEIutfH3JQS4RRF1CioZZxvO2XA5HIMFBXWIP?=
 =?us-ascii?Q?po8YuzoOMNICArHIjOrrpW9KUM3KIUW1ZbJwcmdaaGPzSzq/mfjGzN24aBcC?=
 =?us-ascii?Q?MjmGp7KoMHOpJsZubQGGArziYM/y1mw/D7GMNPB2NEp+GbTBkW11POAqsMvR?=
 =?us-ascii?Q?004FacgfyOrZOdOF1p+Etpmtw/mq5/yfOHGYteQziNt4NuEi+8kTeEHYVwvq?=
 =?us-ascii?Q?RvVTrxA6GDsL582mI14UUJKoUAlviBS7DA7scK8/YuLhoWNRcxs+XsshSLuc?=
 =?us-ascii?Q?8tpk+X+FcVWnrFHtbumw5Qu+Af8vbB0NU/pX8IwsF/QZgNa1EK0hIezaBbEr?=
 =?us-ascii?Q?rvh9DKVI9WdU5ymc8hUwAPL1U6FRU7Q3+rmBvcqEwIF6WWgiV4013iBb7lw9?=
 =?us-ascii?Q?fwuxC7wHBTYt25s/uzuSh8pmJbyNfZ8Oj+ZFeodqcARvPftn8liaF6VasWjU?=
 =?us-ascii?Q?sC1Nf8CHsVxCUJclrjzJADHX5Rzfgpg0G0lrYJwGmjaK+d6M+4JPDmbBnaid?=
 =?us-ascii?Q?8JfegxxHVN+BWCGxwbrVKfWj6wqQUiw2hMh6dw+/TuvQVWvK7kHCFJrbG4tw?=
 =?us-ascii?Q?ZTx+7W5o2Va3KCPREJI6cf88YNyHkuHFXrbBrmegQ419FNA+ytMA5wfdiaxz?=
 =?us-ascii?Q?g04j7Ja7YAKlhaGvV25ANXxLl8cdkZyYMHUKt09PjUmO89oo9/u6B8F9SRlN?=
 =?us-ascii?Q?U+xRrkYamF86ImSBcNJoa46SwydQEhfiONslmbjafssLIpiFTke44g39n0+Q?=
 =?us-ascii?Q?shxgJfxy/MYTcaOa84rA3yK38pfif+2OqNF13f9BsLMXowFzUWCDMrv+YrFq?=
 =?us-ascii?Q?mNUcqe3krTfVTBmrwbOHseFq0+DRdolt4OCqOsoI963NmKqArfoS3opDsXiv?=
 =?us-ascii?Q?NqP9jCpdRoO1CyN+++kef8ofsuujTMxo0hZW/FQi9HEvhzhmRngU3t5X5rFn?=
 =?us-ascii?Q?IjUhqt4nOG/Ee4JP71XKFWXOOr/5YOeLr94afzV04j0NzEc3CVlcpupBhNdj?=
 =?us-ascii?Q?nQdUU2RS7wLGt6FWdue6P/E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 659c6604-8380-45b1-3dd4-08dcb03c1715
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:05:32.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aPaPzhBskFW12LEYvtJn59teEmeVGYhfP6b7MiusLlZ0ZVr4B4LYBw7eagdf5Sm3GRs0OcmHmo4Exvfvri8c4zCZvJRoz9Eez15PjivhrB3e6BbhwFg/INNXU//Fw2pe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6427
Message-ID-Hash: QNXNRAZ37QG7FSSVD2Q66BJIQZQZIMEV
X-Message-ID-Hash: QNXNRAZ37QG7FSSVD2Q66BJIQZQZIMEV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNXNRAZ37QG7FSSVD2Q66BJIQZQZIMEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/core/pcm_timer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/core/pcm_timer.c b/sound/core/pcm_timer.c
index c43484b22b34c..ab0e5bd70f8fa 100644
--- a/sound/core/pcm_timer.c
+++ b/sound/core/pcm_timer.c
@@ -108,8 +108,7 @@ void snd_pcm_timer_init(struct snd_pcm_substream *substream)
 	if (snd_timer_new(substream->pcm->card, "PCM", &tid, &timer) < 0)
 		return;
 	sprintf(timer->name, "PCM %s %i-%i-%i",
-			substream->stream == SNDRV_PCM_STREAM_CAPTURE ?
-				"capture" : "playback",
+			snd_pcm_direction_name(substream->stream),
 			tid.card, tid.device, tid.subdevice);
 	timer->hw = snd_pcm_timer;
 	if (snd_device_register(timer->card, timer) < 0) {
-- 
2.43.0

