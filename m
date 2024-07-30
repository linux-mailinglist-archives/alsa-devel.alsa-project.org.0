Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5117940422
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3EBF54;
	Tue, 30 Jul 2024 04:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3EBF54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305322;
	bh=mYuTvqtStt4B4q9ahq5WB/z6GrhgByodBdB1BgAGqs4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UbLLRAiW0B0aq614OrPPOxfZgrN+8kAbhirMzWlCMHqxZXbU+wbekspxkledWXm08
	 fbrDLJ7h3Ywa79bqGleOGuEpt+4VLb7LOL03+ZzvcN8ybzJFgkcrW7bSm81Lg3C66s
	 V62T4nAn4OwkbjqK8aPSEixsDe+apqpFgLp8RZ9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12B3CF806ED; Tue, 30 Jul 2024 04:06:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2408CF806E9;
	Tue, 30 Jul 2024 04:06:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1854F80606; Tue, 30 Jul 2024 04:06:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E3512F805E9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3512F805E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BWOO3Ol/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIXgQ0HXcZDax3szUfcMgZHXq/LON1ALv50E7qQSaEEuF13G3nwyzHPCu8fgX+QrEx2aJgF2U6quRbA1OsCKOxK2YbyYXNBApEKTf+UAkVmLblirQeO0Ks8PdyQAO1SrHi9M1tCLhAXz6X8We79I2wcqgIPxKEMvXwxK84ph9kI9yJktK8zYdvot46o71zeantPDlrQa5EWeu3aw9q5cq+CHB0VA3eGKIwfdKtN07/KaZqNqj+E+2xgdc4Tg+hisXoedtkZeSoHKYEUB2W74t5yfb28vWPfwSEXRdjY+HCCS97lly7tmWAXsgM7kNuQvGVvjLU820zD5V5fzoxGCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkKt+cOgw4RBFWf0ynqXrMiNv/H3mOk5GGEgecNi1Ik=;
 b=e1UcjjgBG2dpm2zcmKg05P2/sqQwFV8+SRmwMULglSo2qb9a/QPZneBSjQEHi4kpAev2/ivtsOhZpMU2l3tP0HBLaol8BB998Pg2HH/72gB/IoMBlKLfrGUccmPSFu7cIEB2BQzh7Wi2XxfAUkDoLlMzi972lhori6ZZ5GCkCtgYUnY7Q3klmGocU7q089L/gi2BwtwZ5DBqZ2SsOmH1Tnt0NQ7cEhvb6m/DwIHk2V4rDekOYrHBuEhFo4vz32Awy2i0HtfgHkl7gp7zDSTEmXROJ48qV9cwmG6N/foSPMJbxFeiawg7DOEb/73UOq3TvOPFWs08W6BXj4eEHI3kUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkKt+cOgw4RBFWf0ynqXrMiNv/H3mOk5GGEgecNi1Ik=;
 b=BWOO3Ol/JEh8xw9lTekJoOuC5/eu5k9f2GoInRoV0FW4/7slee+Jkg5msBs6elJk8PNYMFcgSn3uNI0hzxwrRGE+RA5J62furK+IW+cvUBeijMFciJeScY8AypkMAthTOA+4XdMWds5pA3+q1gvJA6Raaq5ioSYZf8sdEExWFig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6621.jpnprd01.prod.outlook.com
 (2603:1096:400:ad::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:06:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:06:10 +0000
Message-ID: <87h6c7k50t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/12] ASoC: soc-pcm: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:06:10 +0000
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c9e006-cae9-44af-5215-08dcb03c2eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4XgjXfyyVl77oT9ujKsYHPn5x9e9qR+FKIZepT4veUsSIwbRPP5jVUPVVVvU?=
 =?us-ascii?Q?7IG8orByLxpOjgT4kAJLieYCKBQs7sx4rzbAnhjA7SOYCBrcnN6XFv4BpyGL?=
 =?us-ascii?Q?0M6TVvf3FyFbCirSqvsndL/zG7Rkr5Bdm+74qxQFjfBSzpydrcgeSDNupyW2?=
 =?us-ascii?Q?JTrs1+ZBpOQJCL0IxgST7jPMvtkdequKmU1IMikRS39i8GT1eAK3E7Wu9qtF?=
 =?us-ascii?Q?r4QKUbutQkk0SFV7X3WIWtKjRxU1+Un2oaPaXbRJqB39lug8k+jJO4so6k7b?=
 =?us-ascii?Q?6aDpVKIyH6SgOgTDHKUqpg4S9oA/D3vfba2n1sFEPvHIHyuvzb8GNvbTB18q?=
 =?us-ascii?Q?aY1J3E2u+m/UhbPWdWTHIyfhsiLplNLTJLv6GbWnulIsGnlUgqyQWTjTANcQ?=
 =?us-ascii?Q?8fRknFT31FDr+wzkRyWIXXO6n7zvJrLeH7gcbhdB9LCk7g4ASxRQDOP2Ib04?=
 =?us-ascii?Q?PQ4Oz65G//Kfrx4aGcLBqnp7iDDNAu4lkUu92k07zblsrTp3j1KlkoN2nFXl?=
 =?us-ascii?Q?G3+D85hBJxgnGxJ6cygirMn7LtUznWwUfBQPhP+6EY1qRT5R6cNq5p4xNvtK?=
 =?us-ascii?Q?XhhbCZpF4WyJRrUgjR10LCQDv24+MjU1Ib6j24U7kJ+VyL94dGZ9EX6VzoxG?=
 =?us-ascii?Q?fQtkV1hEzhxhBVZsXQEhWRd62FuJh5Jjii3AvTLSLJcw2II/MhHi3cRyUTFI?=
 =?us-ascii?Q?tei6pQ7e3qFRB/Vbo/JYunGlpsz96CDe3NZti199CxLnU3Faeaek6GmwnFL3?=
 =?us-ascii?Q?fpcllDEXY3pAdalbOAciybCOTaMfNl901Dw1VTL0m0y/8HCOnpUW5lBl2Nib?=
 =?us-ascii?Q?9KqsbJUVTvgjnHQkEI42SPJRNhQTkhqKMLcCwknFvdDI8wHCQXjbyaNwlcMV?=
 =?us-ascii?Q?PVlsA5Uur4x+zJsetkFyYapNokWBuvgA/HtqfvQMCzeO+jCXNVXDjErEDadh?=
 =?us-ascii?Q?2pZKsVidixVLqZgfiJzTW85j047kXpKuoPnkkAiIPV30EAf+P3T12GiMSLtO?=
 =?us-ascii?Q?w13PPR2Mq2On2NavG1lyRm5FvRFkgjluG6Hdz2eTh04ens+kr9/uvGOiHSwt?=
 =?us-ascii?Q?dUeGnf9pMLNieCNgvGpIJZ1Zuhrn/SzyrMSup68FjDHEj7pht2g0XU1e6bZS?=
 =?us-ascii?Q?OSWoFpT26WQEdJ0B/9+2eIvCQDVy7KBEklPlOeYLDXZRPMlQfRCF6dbI85WN?=
 =?us-ascii?Q?sLWvsAblBgoyfRTD8js8KqLnT7VWlhhvCDeXZCT75RmzBCM0oiS8DeyCyNfm?=
 =?us-ascii?Q?dH9PCcgSDCxckWsI0FfUROqLvdeNoTGTva20Nwp50qD9vStqnWLNiVAlWk/E?=
 =?us-ascii?Q?jhSQrUHiKUAlDHJf2CsyUsiw3jv561DHD+xLAYljvm6c5dnpt5b+2qx8If/6?=
 =?us-ascii?Q?bmt5Iarl0C6h6OLEMKKBN9/giPt+g7Ouj8P5NDBh9p8RGrmovQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ykQIPCNxK001Py9y2Th7FecmbTh2wVxoTOvzjsVTvXK6cFL2bGEQDxQ4hbju?=
 =?us-ascii?Q?8dqHJouVuHEixIplJjKJDl2jSI1LNt3ogLVoo4kYBgki1Oy8DF0ClLXiHYun?=
 =?us-ascii?Q?ZtbjhMPn3PrO3HgH8zkaz9FerMuSN9zNq6DLV9TppKiI2/XlGIDTRC6RKUR9?=
 =?us-ascii?Q?6EkfhuB/xiox0sJhg+dG0xxrIrj1TuYDTbfI624H+C2lWP1bkvQk2AUF/Eae?=
 =?us-ascii?Q?Y5/n4+fIf1zDdWCGPT/73+/qKeM3Dx1kJbcHpeUwkaWUzjCV6+JV8kK/xCWf?=
 =?us-ascii?Q?8cquSS2a894sqTM4ifXyA0OR3bgDx7Ne+3EvcubTT4wVquoWBTfWlhHd1U59?=
 =?us-ascii?Q?YhFyTrpcqkIE9+IwqurPaDUcfISaVSWXj72dhm6QashTZ/FCUBonA19E2Qqm?=
 =?us-ascii?Q?/eaF+RYJVrd8O020gbin2gDN4anBsosEMjbZk9H9chjJgQVHHNXi0f3nJj+l?=
 =?us-ascii?Q?qfTc3PCFSz3izQmM6y9F/84XDPxFlOLa253Njz0CeZgsJ3GgcK2HXfGi0Zd8?=
 =?us-ascii?Q?q+LrCSAblwD2FuCnmIh4gVMifnezb7xXTStxh5nzTq7KXl3KDHT1P6tblHxW?=
 =?us-ascii?Q?ZqYGg8sjkTrl1zC2nyZuyly0SG6o4yVLpjsrue4G9qHnk2lRpv20sHvS8pNF?=
 =?us-ascii?Q?eOxtOEfPGNsHCy6HAIj9jZKdUWQBKJlDmbRyhZ7TivlrxKajRA5G1bi5LHY4?=
 =?us-ascii?Q?zGum2nw9t4NLXxLDAxdHJyt94Bd8/9B8Qke6lD1KpB7lWUMXHyY+g4jrYzxG?=
 =?us-ascii?Q?Ok0OnI0w0ihBTcnX4okEVFfFk7onxPV6cl1/Z+yoJsiUMGW7HL+UDGaualc8?=
 =?us-ascii?Q?KS66LcZnjypbIl8dZXYHfiKQV/1utUFSiLot02duM9k7zeY0DxO+tqKJW2U+?=
 =?us-ascii?Q?AWAT+tBJQYcv7fqCAua9an9K9S/ZVTe83I0S+kBP1S06Xak588njsrGDevGy?=
 =?us-ascii?Q?LQ/4bMoblKeYFLAft1D/nIbCZhYwDrO8lyUCm9rfK4QMNUeEofwsuZWYHsvD?=
 =?us-ascii?Q?G3FzhydFPNy06uXV3Rh1X+jI0auQdMJoPfK9EoHVGCZJ+NfTAAJ1IXm2uukk?=
 =?us-ascii?Q?5f/tmjKJvEGRLfeZQcnLMGHNUn+Lq4y3pgTQwIKC354KDfN8+FDSRwgXHiC8?=
 =?us-ascii?Q?b0y6tHoSN115LYaBTvIwbdIL5oCtO2mBRf2nfKt0Q9JINmLoy6gPrGDZtNYc?=
 =?us-ascii?Q?i675RXvFjjdjoDaB1aCBvV2VvAW13XpHLdw9gxkZprsJD7Lr9XZl96PXbwtc?=
 =?us-ascii?Q?ZvvBrABiuRJiNydQgA/RwV4yP0mU+oobDHIkDZQDwoyc1RFCzAQKESAjY0l5?=
 =?us-ascii?Q?m95u5bU2Q85Fr64KjQ3fzG3FIfgKKq8HNK8obUA9lV1hUZ47IIOpC6kEroFU?=
 =?us-ascii?Q?LV0hw6oeH+GLXn6DN5zzFXk9YU1T+H8MDKUe7TXIMjY0fJsK/yAqlBs7sL5L?=
 =?us-ascii?Q?XI+ZeY6dmvz4prRka7B55IVD6blZOfALmqiEi7kqTvs3PE3rK5HYpUpzLMw6?=
 =?us-ascii?Q?GTfCfSbU3Jn7FGhTKg4OCMXBpeJ2c3DVYHWanOY53esUeP2+cwyy8YPhQ7VD?=
 =?us-ascii?Q?zb3r1ABlJ6lK2U4X2tZ5AhM0FF/sCqybnpPYkWOeEcBNN67Q0l11tzOnh+YS?=
 =?us-ascii?Q?8bztP7oYRsEUZ2zyCfpUblk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 92c9e006-cae9-44af-5215-08dcb03c2eb9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:06:10.9061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Y0LSENsPy5ATfscnlf+cTHL/7iKDExNEc4RCduEkMd38Lwq/x0QVrychMDa5eiS+ZK7FcqhoqbJ15CIG/I8fq74vqInvYRRh58ZklVefz1XwyYoHakIwNSHkKRZf7b2b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6621
Message-ID-Hash: K4G67FFHPVHBZM5JFLX3G25RWZLJU5ET
X-Message-ID-Hash: K4G67FFHPVHBZM5JFLX3G25RWZLJU5ET
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4G67FFHPVHBZM5JFLX3G25RWZLJU5ET/>
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
 sound/soc/soc-pcm.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index bad823718ae47..5520944ac9ddc 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -222,7 +222,7 @@ static void dpcm_create_debugfs_state(struct snd_soc_dpcm *dpcm, int stream)
 	char *name;
 
 	name = kasprintf(GFP_KERNEL, "%s:%s", dpcm->be->dai_link->name,
-			 stream ? "capture" : "playback");
+			 snd_pcm_direction_name(stream));
 	if (name) {
 		dpcm->debugfs_state = debugfs_create_dir(
 			name, dpcm->fe->debugfs_dpcm_root);
@@ -1278,7 +1278,7 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 	snd_soc_dpcm_stream_unlock_irq(fe, stream);
 
 	dev_dbg(fe->dev, "connected new DPCM %s path %s %s %s\n",
-			stream ? "capture" : "playback",  fe->dai_link->name,
+			snd_pcm_direction_name(stream),  fe->dai_link->name,
 			stream ? "<-" : "->", be->dai_link->name);
 
 	dpcm_create_debugfs_state(dpcm, stream);
@@ -1306,7 +1306,7 @@ static void dpcm_be_reparent(struct snd_soc_pcm_runtime *fe,
 			continue;
 
 		dev_dbg(fe->dev, "reparent %s path %s %s %s\n",
-			stream ? "capture" : "playback",
+			snd_pcm_direction_name(stream),
 			dpcm->fe->dai_link->name,
 			stream ? "<-" : "->", dpcm->be->dai_link->name);
 
@@ -1327,14 +1327,14 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 	snd_soc_dpcm_stream_lock_irq(fe, stream);
 	for_each_dpcm_be_safe(fe, stream, dpcm, d) {
 		dev_dbg(fe->dev, "ASoC: BE %s disconnect check for %s\n",
-				stream ? "capture" : "playback",
+				snd_pcm_direction_name(stream),
 				dpcm->be->dai_link->name);
 
 		if (dpcm->state != SND_SOC_DPCM_LINK_STATE_FREE)
 			continue;
 
 		dev_dbg(fe->dev, "freed DSP %s path %s %s %s\n",
-			stream ? "capture" : "playback", fe->dai_link->name,
+			snd_pcm_direction_name(stream), fe->dai_link->name,
 			stream ? "<-" : "->", dpcm->be->dai_link->name);
 
 		/* BEs still alive need new FE */
@@ -1441,10 +1441,10 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 
 	if (paths > 0)
 		dev_dbg(fe->dev, "ASoC: found %d audio %s paths\n", paths,
-			stream ? "capture" : "playback");
+			snd_pcm_direction_name(stream));
 	else if (paths == 0)
 		dev_dbg(fe->dev, "ASoC: %s no valid %s path\n", fe->dai_link->name,
-			 stream ? "capture" : "playback");
+			snd_pcm_direction_name(stream));
 
 	return paths;
 }
@@ -1487,7 +1487,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 			continue;
 
 		dev_dbg(fe->dev, "ASoC: pruning %s BE %s for %s\n",
-			stream ? "capture" : "playback",
+			snd_pcm_direction_name(stream),
 			dpcm->be->dai_link->name, fe->dai_link->name);
 		dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
 		dpcm_set_be_update_state(dpcm->be, stream, SND_SOC_DPCM_UPDATE_BE);
@@ -1605,7 +1605,7 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 
 		if (be->dpcm[stream].users == 0) {
 			dev_err(be->dev, "ASoC: no users %s at close - state %d\n",
-				stream ? "capture" : "playback",
+				snd_pcm_direction_name(stream),
 				be->dpcm[stream].state);
 			continue;
 		}
@@ -1645,7 +1645,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 
 		if (!be_substream) {
 			dev_err(be->dev, "ASoC: no backend %s stream\n",
-				stream ? "capture" : "playback");
+				snd_pcm_direction_name(stream));
 			continue;
 		}
 
@@ -1656,7 +1656,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		/* first time the dpcm is open ? */
 		if (be->dpcm[stream].users == DPCM_MAX_BE_USERS) {
 			dev_err(be->dev, "ASoC: too many users %s at open %d\n",
-				stream ? "capture" : "playback",
+				snd_pcm_direction_name(stream),
 				be->dpcm[stream].state);
 			continue;
 		}
@@ -1669,7 +1669,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 			continue;
 
 		dev_dbg(be->dev, "ASoC: open %s BE %s\n",
-			stream ? "capture" : "playback", be->dai_link->name);
+			snd_pcm_direction_name(stream), be->dai_link->name);
 
 		be_substream->runtime = fe_substream->runtime;
 		err = __soc_pcm_open(be, be_substream);
@@ -1677,7 +1677,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 			be->dpcm[stream].users--;
 			if (be->dpcm[stream].users < 0)
 				dev_err(be->dev, "ASoC: no users %s at unwind %d\n",
-					stream ? "capture" : "playback",
+					snd_pcm_direction_name(stream),
 					be->dpcm[stream].state);
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
@@ -2531,7 +2531,7 @@ static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
 	int err;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s close on FE %s\n",
-			stream ? "capture" : "playback", fe->dai_link->name);
+		snd_pcm_direction_name(stream), fe->dai_link->name);
 
 	if (trigger == SND_SOC_DPCM_TRIGGER_BESPOKE) {
 		/* call bespoke trigger - FE takes care of all BE triggers */
@@ -2565,7 +2565,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	int ret = 0;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s open on FE %s\n",
-			stream ? "capture" : "playback", fe->dai_link->name);
+		snd_pcm_direction_name(stream), fe->dai_link->name);
 
 	/* Only start the BE if the FE is ready */
 	if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_HW_FREE ||
-- 
2.43.0

