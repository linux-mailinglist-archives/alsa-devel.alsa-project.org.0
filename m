Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5E94041C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6171FE7F;
	Tue, 30 Jul 2024 04:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6171FE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305238;
	bh=knIOxpuXFYFL3U3j7UpP/kTWVJAQRh9G17inUkAhz5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sBnp4ioBZ39UCTovXWg7mk+BLZeATDoYZ/l4bpzkWb1JcqPsUa1R0FEDGL8nC96/C
	 BosXomf41J2ILPrit+D/SkJX2SQ2bBfgEVgZiQznot9zoXn4rbLbUJELpOp7+BU7Nn
	 oiDVIG+jc4GyKnx5JkeMCK7fiyTLQlHE0UTr7k7E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BCD4F80659; Tue, 30 Jul 2024 04:05:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2423F80684;
	Tue, 30 Jul 2024 04:05:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 879C5F80580; Tue, 30 Jul 2024 04:05:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 84584F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84584F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=du7yFnAh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJa8/PYXBQUKqhrYzaZguf0V0qN38KtsWcSN8RgNMOCoqvcCYhXVv0DhuzdqiLAPxnJQL0hIKTo038ta36+mx7gQueSkHh4O0rKNMQUC07cE0nR8c/Y+rWrELqnSq+u3XNjKhYV1a8vMowRlPSUrhJRpSyNjSnj9Vu1m8xK8mlUW4KdSgm0wpGcz4PGwPXNeBB9JwXjXvKlYmqiVCS6yBxWG4+XsqKU7F0yFvSenlvX/TJZ1GwmFNM+mje9VnaTHgRwbiE4gFZP0p0AXr58BFHjvDMP45UwVZj0ZjG5JjupTOE+PPjR0uUseN1R8Ad3oL2wsMcwGwfCXGMyZ30awyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgM5/VN+7lugDaPojuL7lscomxtYOS2SA5JxhZ0KdhU=;
 b=n9fixvjUMSvBmi/gLgdacvS4BSXnSBV9KvyM8qLJwmd+j9tgBrv1Zwa6CWfzqtvAMnWXY3LdzlhOveauirFyHowZbxdxr/xuFyzFOOeSL4ImLwouXxKpKqZsk5//gXIA7TTCJ9WFpXEE6x+rpo0LyOAd26s2FQDLG7DbKadXeZFICia19d5SSjMlZf6y++6cl8U+070q8sUeVv5ARBQr9o4+/wC089R1i67OQbJNIKA2+gC94rUdwtAyKlPdzX7BpzUyEsNoc4qJD5hk29z/g309EIXyHv+UMJ12jESZiN9A+ZlqonRYJdRLuHkuN4Q+M65xKRrypWzIMYWEE5ka4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgM5/VN+7lugDaPojuL7lscomxtYOS2SA5JxhZ0KdhU=;
 b=du7yFnAhPsRTGXulGElxVKRsi3tx++FrBvV5oaLEIEvF2m9kWOuIq7UCNxHUXr4gdPdDQF/o7Z+LW/i4eKXVSdMk9lG8aTMaG84y+vBSgCFufn3CeGs/63EjzRzX+p3mhLRgHjqctkaskPuI/37EIsvv8fcuEYjqW33QHG4eyLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6427.jpnprd01.prod.outlook.com
 (2603:1096:400:a1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:05:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:05:40 +0000
Message-ID: <87o76fk51p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/12] ASoC: stm: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:05:39 +0000
X-ClientProxiedBy: TY2PR0101CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ddce54-bf68-4313-3941-08dcb03c1c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kUe0z++B0KuVNpEdb2cHP3IvhYKHcH2wibZ6OuuFw/e+xmwZ9b31OLC3zJPo?=
 =?us-ascii?Q?pd8loSLutylbqNre/95y005ve2IyzkSieiNawlfH2hapxkkx6rDlCKQu7Cbj?=
 =?us-ascii?Q?NCe31UfHuXDQfLo5KD8KBsqmeFvf6PNGN90JwpkeMVF9pUYyZDHYq0vBQucJ?=
 =?us-ascii?Q?vMZkJPm9jX6LLsBoAma30RhTA/0nt42A+X6xX+Qmru9icJFwNE+CRzWoE00+?=
 =?us-ascii?Q?KAC8pIX7kh1P1TRMkzPEVutGJL57UexWV3w2f4hMBukiwTGc0zDYce4ooEZE?=
 =?us-ascii?Q?mFNIovtIjhnYMOKaTwtXfgVWPYb7+enSNeeXBDYttYOTswv1+9M7nZEE7jBB?=
 =?us-ascii?Q?vDECIk/low/gXkv6UhuvszKVjEyijGa0L52xlm3gx5j0bfHOeLbYKLhZm1f8?=
 =?us-ascii?Q?cc5hvadvn1wsEIf2pipHHHicRTjLfdFq/Zn1mqXpdEuCOtlfDyWpVt3XTS2a?=
 =?us-ascii?Q?VP/AwKXOiWgGoPd79hYGI7r1NKc7i6sS1ryIlsclfZMpM/Xy2KPv5llRS/fv?=
 =?us-ascii?Q?f0GmVfjNS8Fg8cvykryU7SDOD+COeq56BMqm4lMPKuoaFPguOPw3zk/g63tY?=
 =?us-ascii?Q?gTWRg7Krs4gPIiCiXitn9Mh6lgk6oC61NUTnMY73lexXcJWzzXAdNxuytq6l?=
 =?us-ascii?Q?0dBNRWwyDu1wTnmlac6hbuzwOBUPQkzD02U0pO+8bRBOeCO5751QOH6Br2Tf?=
 =?us-ascii?Q?59/3MqgulrJFMqBEHB/Frc3v2vh9gB/lrILr/G7G+Zmmdmt04LiYHX4TDDT4?=
 =?us-ascii?Q?xoc4e7nmFeXFwj4Uk2C1X9rY0VYgie0e7z3fqaYDMAfOy3lPqGqQbPvLQ/ij?=
 =?us-ascii?Q?vme8eKgA8qH8ODeTNxYn//1TjSbnumzLYJ8o2DBfLMvahrQP3iYflsw1iwe3?=
 =?us-ascii?Q?fZ0isMx131iZWELGrmx3n2ilbaBfj0+bZtQZdKcPgcmNy0Q3PiHVVufuXwAr?=
 =?us-ascii?Q?tgW6aTUrxaSvSVl2hTBp6scaz1HIks5LI8cDasar0cCLmdAK2jvYg5s8dqz7?=
 =?us-ascii?Q?oddHoJ0dBuwPZc6WhOSCwGGnSMJRUzIcwZ0OXDIfmlA+TboD1tsKabiwhwAx?=
 =?us-ascii?Q?3U0l22zyK4k4ISJ2lWTRsG6WAeZu7cBbwaCIfF7mHPBCQLKSxAlmWkym3XF8?=
 =?us-ascii?Q?jt1kCKjS1Q/C2FhoNBtfqAa6VLuAFysBPStl/0JS0ANe3m/NeKltzrrZN3OR?=
 =?us-ascii?Q?t9M/J8e46u+JO0Ru7uX5CoRVE223Kh+TYjuWtH9iwDoZSVxqFGPjfYSsgmdg?=
 =?us-ascii?Q?EXfp5ZdlUOQ40WkDgS6a+4jYR7GLxjhjWTMdUQcIBhm5UhHXoRyEaatQB2NH?=
 =?us-ascii?Q?Z/Hm2ACWdoCGQTuCuvXbw+hH1M5sPSziexROsyJGmw4auvGSFc31VoWQ0fgp?=
 =?us-ascii?Q?lgt23wCigLOdpjj8E3U2SQg98tRRJaa/p3eTWWdeezGG68vumA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QykMqoP+mTCU2Gcq3R/6C1YIuQZt8nuedL+ApGfugX7sY/YwYDrvyV98/rD4?=
 =?us-ascii?Q?Xa4z/oPsqlel39Dl9XvfiJR2fd5PCB2HGPd/YGXjZZUXF5WPmhh3G6DfbTN3?=
 =?us-ascii?Q?xBwwk9h0H90Uk8fegFGXbjGDOKZzfNlTe2XYoHo2etdxIGjbCTHXz9C5BPYO?=
 =?us-ascii?Q?Qqd8T4qalt/7nRRxHUOhCSzHZMNdfcWZ8hf0avTPjqDUiWPiL3PhFoRd626+?=
 =?us-ascii?Q?Qx+MljjUSq/QPmF9feknqdnrZp3HFDOsmOKEcqXXcDBzcKAwM2Vu4p87KL2O?=
 =?us-ascii?Q?EfXw5UOnhNT7uuTkKiO2XfloveC6/J7fqHZO2zWByaeSXibLBS7vMeAU0jOy?=
 =?us-ascii?Q?LQWykFfgfH4FXlTLT1NLzaho56z3jzafzf2ZbTx3sKCaJilgyolyN4kL4OA6?=
 =?us-ascii?Q?lQ1/SsrLniJ/MBFOWwjVTovnxETLaJm9QG04XN9FKOFHgjoQCo3peSoJ9Xpa?=
 =?us-ascii?Q?ktB6iWowSkKvPrnu9xJJsLlxzqReoo48mC8ds33vvtS9EWr8YkVWU+up1JJB?=
 =?us-ascii?Q?X1vjjXDdZp3e+GSIQak8omPfj9hNQQMQLguQLSA49n5G7S0r3DbCbl/GtyFC?=
 =?us-ascii?Q?W3AF1uxg5h58GQGgeJAolhwSLOdRlxHK29cCoij+nj3h4pVsrH4+FbnhyLuz?=
 =?us-ascii?Q?9ERiCjnWLW+ZjIkM64Dhl28bHIpRBFyCIUvc8EHbf4ZSqnO0F+Xcd+pSTO2S?=
 =?us-ascii?Q?yAdR3wVbCcAo5+whOtm+7cwvLL5IYVjnWFcTS2fYvx2YcfQ6FkoIRWhlvP5v?=
 =?us-ascii?Q?ev2mBhjOHd3O5TuZoAZ6ouK965rWyBrnnGmIR2p3076HprVu2JddSEbfpV7B?=
 =?us-ascii?Q?Gr5ekhH22Q3Dhm3W3h77xgN1MDLvzBakM9JLd3DEcn4a61afde++AebYnZwF?=
 =?us-ascii?Q?M6Y38fnEw5oF+9jHAbMeYmChN73kCmzqMQK+PWtiX0qHx65RLjIsBYbcpF9O?=
 =?us-ascii?Q?WG5kMnhX4z8VaWBFnL52tvrnpuR4TmmIhosnKljsvfzIW/Pg1eKSZL7NgIQC?=
 =?us-ascii?Q?doB2uMhFOuprhiDumjUxuecwwM6oNu+jMGXF3aYRAIvAdhB7viinrznJcScu?=
 =?us-ascii?Q?iJyCzd8jbHLy5csTKXlwoNTCXCs+ZWOoZTP0H4wmo168wtwedoYJfr/lpODL?=
 =?us-ascii?Q?c8JzbeAXUZLt9WhCAA47BYI+YZWxn8Gqp+d12XveTqJvnfJsscaPhPDW5N/Z?=
 =?us-ascii?Q?9MRX7z0dkC0K95zjV0F6DemWIKyAiDVctllCRTMmstIQ6lJBnTKzX7PJV40n?=
 =?us-ascii?Q?QikN/6dCz8qyAsNRxn+s6gWFoHFRx7DSLFiD0sqP+hiBKvBiJaDkUlOj6zAs?=
 =?us-ascii?Q?iVhaSWcdQ1df6tK2zTGJZNCk4J5zLm0vqjASp4p6JvvSaRJjnc+viOLEStht?=
 =?us-ascii?Q?nU/Z6yXU4UXhDDZHZNJrhw2kYesrycockXrNZv3WU1F1jBCZAbZSkDPEY5UY?=
 =?us-ascii?Q?79fd4NDLdgNTxxqL5vogBxr668+qt1SU90g50W85MRyTfXIMQPK7OH3DJx1e?=
 =?us-ascii?Q?N4Lft0SMk3OoJBwy6dMwGyIblAwNfDwSvKO8fknc/cLrCXuQvYit4B5lXzcw?=
 =?us-ascii?Q?z2l16QwbDSVOWDnvLpTAmTbafLjx8UUsaRqE/+YR7irTbycbqeQ1qgSLp+Iw?=
 =?us-ascii?Q?1DhEmk6akTaNgw0Pm6ip3v0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80ddce54-bf68-4313-3941-08dcb03c1c02
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:05:39.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7eyz9hLyae1+ejvJXbDNjI6oEd7PaTV2FYru4LjYbPWIWDsP2VaIUZKI6tExYWHQnMNDq1hDCpfV0+avUP+0dEoBoTwJf1z7wG0yBPH5uzve+hp81As6EO1McSVE5ih9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6427
Message-ID-Hash: MCBE4UQWM42Y7H3AAJ3ZYXD2K3GL3NV4
X-Message-ID-Hash: MCBE4UQWM42Y7H3AAJ3ZYXD2K3GL3NV4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCBE4UQWM42Y7H3AAJ3ZYXD2K3GL3NV4/>
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
 sound/soc/stm/stm32_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 46098e1111422..a96aa308681a2 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -823,7 +823,7 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		/* Enable i2s */
 		dev_dbg(cpu_dai->dev, "start I2S %s\n",
-			playback_flg ? "playback" : "capture");
+			snd_pcm_direction_name(substream->stream));
 
 		cfg1_mask = I2S_CFG1_RXDMAEN | I2S_CFG1_TXDMAEN;
 		regmap_update_bits(i2s->regmap, STM32_I2S_CFG1_REG,
@@ -869,7 +869,7 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		dev_dbg(cpu_dai->dev, "stop I2S %s\n",
-			playback_flg ? "playback" : "capture");
+			snd_pcm_direction_name(substream->stream));
 
 		if (playback_flg)
 			regmap_update_bits(i2s->regmap, STM32_I2S_IER_REG,
-- 
2.43.0

