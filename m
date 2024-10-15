Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2448899DB05
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 03:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1751CED1;
	Tue, 15 Oct 2024 03:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1751CED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728954030;
	bh=G6O3FbFLkZiAkNzy3cz47yXID6ka4yLo1YV64oO7Gw0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LaggJD5CuVxvV/2/KwNcfsQajuPc4p3SUBWvDi/G/yHNObBAW1Ca1hZEWdr8DxlAt
	 ZXy3insEgYzkdmmmPAHxznuoRm8joPf+q0u3m9kaHXjPylZOdv4oqMMmg9t1B9SxpO
	 gHnGtNBUC9KehgSC67VKpevdbnDcDrS25/2UIOw0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D6E9F8080C; Tue, 15 Oct 2024 02:56:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4A3DF807CA;
	Tue, 15 Oct 2024 02:56:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB22AF80772; Tue, 15 Oct 2024 02:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A17AF80766
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A17AF80766
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RN+SyX0b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blJPbmqSSZEvDT/mAH1IomOGdBE3LpHF5tDQLLFPApbQbHF07M01IO5Z04/3E0FjFAY78PwGUyTvBiV57a5+ekt2hlTtWDt3xNZqGUY82z/BlZ6X7xgYAwDE0l/mjo3GyqnZ7caRLJUU+y1r73ys1pWRKIdm9eQllkjwa8FwQ5AuOnmgN1NRwnAWGmmcNRFOBWmPZjteBfaxCMvUZNx3eLX0Mdf0CihARthHAO1Eh9tpCMUw98PNxgUOwF7BKINHKTh57YkHB6OUefsSnbkaZsC1ldi0MahOzwABN0xPN/OKGLQk+ht/cb2y6HyHnREhABBZyTiOv+Bo2rtkBsuO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFI9/tZ+iCX79zEhF0xVSCFczVQqTc/RxNEUXk7rTOM=;
 b=tgatlH6/TqzQto9oyPf9wUCOGsKW26uf+ZNEz2EOI6j6srcJ/AO3ZAq/NlwALveFim892XPLAo2MkpFSP2IUfCa4CUB+N+G7fV4sWtfUmnHCi0BhWTpTHIluHHRCbyYXS6kszbeZdCwMZWrVS2MGlGE/GvPV4C7IKQuluGBU3/kgw0d4tDeWoTRb2Kd487z3F0MTHWbLIsQXvGYbjYeUc7Voz0McDWj/fdvJ5sY1CYUfKx+esbw4PbwCXe2mhyu/bx8foGEU30d0AiCGUTVuYxKFN17Z/uBdPE7g9mijZU0/xPMGJfoNv4Agkp5xGndM8LjqBCcbQir+laBvdegS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFI9/tZ+iCX79zEhF0xVSCFczVQqTc/RxNEUXk7rTOM=;
 b=RN+SyX0bI947lIrsQvSVS3YRuvogU9vIIuPnrHDTtT4pyRu98RZEULlV8XNezkbI/cX0zOfobM0ilZlXFpGCsEQv3qmW0ebVGskTcepI6491rb3to99H9b+B4Gx+Ia3A7H7Dyc8lFnvPgMLBWlg1dOtGprmZagDEHT/k2U/qXfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7121.jpnprd01.prod.outlook.com
 (2603:1096:400:c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:41 +0000
Message-ID: <878quqqj3q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 11/13] ASoC: soc-pcm: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:41 +0000
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d115f8-f9c7-42f5-e3bd-08dcecb43b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?039y37YdxdEIDSXmaTprqyQVADOlFdDsCdQ9b5IlJIj8OvcKDOMuwpYf0aYv?=
 =?us-ascii?Q?XXPe/F13inbDT/FKr/LKNIsjTt0pkfm1BzCCi/Go8J2zF6+ljiDk0uUmQwlH?=
 =?us-ascii?Q?g0evm25IsokFu7EDv6waclKIxnMr4Wkik58Ws+hGKdVlNYvtxSZkxt/WWdsG?=
 =?us-ascii?Q?tVKUMYzR3hWusxShRmUSwlu4W68FMeYT0towoMnH3rgwx3u8qw3lOzMkjTEO?=
 =?us-ascii?Q?0AMD+w7pIjK9pY823F7037S6fYmhn3aypotHtmwG7JoldzNPLJwzyZdGYjl6?=
 =?us-ascii?Q?Q7uZ6Ugz7YRRMzav83vqKVGgQig1HtyHN4b1w+YdMqoBmJOp3DheocXmoOaY?=
 =?us-ascii?Q?rvPtVLXz/nq6MpJ31OMqkKbGJmG4naLBrPa1dxhw8ENFs2JKmvPJF67up/7F?=
 =?us-ascii?Q?uDHcS1vtnwjPk9I1JNy8Rn6tu4E0vJKYqpK2mIsLQqbuMR9QHa+41tFrQfgb?=
 =?us-ascii?Q?B0MwDrDP3sYx0g1m5zzLFv1X/U03ce9DRg3TIZN5qUBlW61TpIoweZh2eND9?=
 =?us-ascii?Q?kf8DVZ7g0Mr4Fkq0rapF4n3haWgt1WL6j0wgatgPMbltogUi9yufC+IcxA3Z?=
 =?us-ascii?Q?t4joW97kgioZyUpD1OWl5fu8QtnbAQ8/6yjreG4PSkqxde146RrLHzI6QRQs?=
 =?us-ascii?Q?a+z4Ek14BGqC09pdk6q5qcWJJ/YEoMHPLLT1/fRq8sI1NCvneg2C59do15IC?=
 =?us-ascii?Q?yN70NZIrN78PvSkXmd5Xn3XrBl1AcibxHhoA+5aUjQEZNAIHxtxAcmqKcB/S?=
 =?us-ascii?Q?wOwHWrkBBDmnTav5j7FFJcjheab8skebhuUsYzbSPAtlgQ3O+FATYV3VCtIb?=
 =?us-ascii?Q?e4GsIrSmesLSrkxKN6RBo75N3zwPFxL9eEoWUSMFvkb5CXTWhhqYFoCgreMa?=
 =?us-ascii?Q?8xV6cQkvYj7w+urZUokrUlRtXALRezyDcBGNo8tV//ChQ0TATTbnYL3nmq/2?=
 =?us-ascii?Q?5GepfpPzwbT4dUx/vlRYT6rKs+iMqLq1ehYpEm/GUa7D8t77VrBvqY7qmX1O?=
 =?us-ascii?Q?6OaAtUtNNc+2uuht8qlhme/ZrPTjBjex9uq1VKa7xCtJYlg4jA73GwMTQ7As?=
 =?us-ascii?Q?wCEug1KY/l419dajuqdLB6JuTZHNYZeUIwj5udrDmFAL/7NMYDssOAM6vdZb?=
 =?us-ascii?Q?Pj4HdjboigFIRVdvkDRIFnIKLE2MBVLXmkcJk1FmuXWT9mWctfGqI9HoKN9p?=
 =?us-ascii?Q?E29VIdIkU64HtX3t2EEGzrV8lDMGFbjYFnl5Sj9EGHlAuRZ3qzYdPpDYD9gZ?=
 =?us-ascii?Q?mXe3FGJkLY6NjsZdXNidmZe9jh0XA1bn7iTq8NqDUfV5MDLssKBcekhkjEh6?=
 =?us-ascii?Q?7WUxODzZ0uvwRk/8lBFSKW5veZn1hnHANTWCNfY2SjujEQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R3Ou4YWjBotOikSI/CZSmd2OSwf/FhWc+s/7pFVJqB9YmNe86emHk96V8EWU?=
 =?us-ascii?Q?cH/ESeaTVO/Z6in5gc3934G9991xCpQxnXufCmbCflQLMBvadDkKXAuBx5tk?=
 =?us-ascii?Q?lur99WVrq6py56lvUkaChJkF8xLKNMKzIIxLukssbQa99lJEUhZmBk5MICdt?=
 =?us-ascii?Q?IBWaonApIg/SsNblseP7sPza9WHpH+VnHoImmoulfp2mUnY418XIWiYZWJmp?=
 =?us-ascii?Q?9RK/l/87F2AxxW+tL8BMQOxCQTA2YECx7nHhITPOOVZGUzzEZQQ4VomNOchk?=
 =?us-ascii?Q?lcxY+01ZcAzovZ6uIF34uBye30A7OF8iLj9ZAtf2kcGpdVlD3ppU5hS51lOI?=
 =?us-ascii?Q?Xt61sF2iA5jOfZhiHH3whMGsD32lqlrHI9WSoht0MsrL6TB2ccnHsQG0sulV?=
 =?us-ascii?Q?885s69jVpvv5KnZQSl95cib8MKZpvBFYwpW+0yeEjOz9VlgrODJ8WYmb0/R5?=
 =?us-ascii?Q?rWRj32Qh+KM9f7yu+3JMqvICQYSBVmziL5XsYNQm++Y2thvXOgadBpkTXulw?=
 =?us-ascii?Q?AlyJd8duxosqr/l7jdkDWzZVjxtOh+lrD0obKl2KNcn1DOe4PVlds1o6oBwV?=
 =?us-ascii?Q?dlDBLj4DwLy7y+5C1u0UMILYr2mrqcLX3eWPn6/JAtE/vtawsJATJoigxzNV?=
 =?us-ascii?Q?bf8pHuC7jMCx6S+qAEB3t0+KCSfEeXnfQ0fIUsEgaEMueBHd2aleFqR3ZU3x?=
 =?us-ascii?Q?xDRNc8mH1Ad0O8X9M99A3BTgLkGymzu19l3H2MYbJbCKy4Dy+DzgU7UZ7wyp?=
 =?us-ascii?Q?pZrQBVsumjMn4Erkw7szMp6flAfRlRgKl1BHZvNzpRP1vlQKv6Bes09GCeCQ?=
 =?us-ascii?Q?0N6CcEO1Hl7h0lwR/3o93myWbN4cT4OVPvy9HnYABCF6qMTDqqdMy0ZhIrQA?=
 =?us-ascii?Q?FbDJWYVQVrXSCcn4YnyQ+XNWB6uQSkhKcoKPppi7VXYOEn8y44pAwCE1OXT+?=
 =?us-ascii?Q?IiyRjGvqz8ExYH2NiNAcmpyUqHTQMEqMzpMI9eKwYJiXTPBz8ZdgXBMzlaaI?=
 =?us-ascii?Q?f8r6QrGUnau8c0GdrOYB92MjpXcqHWpuw3FpB/jV0PK3z/VWM+AQCCjoyPzM?=
 =?us-ascii?Q?La02jm6UYIRMG9FvK8leKOL0kLTV2cHicckXE5YzyWI7Pgc1ielMXqCobjsW?=
 =?us-ascii?Q?aM6+c6nOfK3Ym8qb0dLeY3eAO41L60sNsLTwNaVIQ/3qcLefWz6W4vhwBZbl?=
 =?us-ascii?Q?xZksRqPKZ39n4zQPlpGKXZz6+ZcHhPb4JsQ+bYDmExgd/VOUrS9dUF+LD4Ns?=
 =?us-ascii?Q?RiGr4ueZJ/EzwUwjEASS502K8sOR9XmQ9vmqqCE2gk5OtDTF7T5WkwNK1Lng?=
 =?us-ascii?Q?tSo1eGrGSgqiM9HNX/ySf8cPIgkKNmU0SrgEvAI7xy78evYHr21TvBOD5TR5?=
 =?us-ascii?Q?3X2Lwx1DXVAkHaBIdquSPGyIM3DLesY/H6BVNmJaV51ru3bhRSU25hbmo48s?=
 =?us-ascii?Q?JqAptOI0LemVGt6aI8KEGx/Fov1L+MUHfa/FZC6H2OqJ8qm5Rkp1EYyv8KMy?=
 =?us-ascii?Q?uzBy7Eplv+ONVtL8xgf2QeJfLascfw2nLKgLdz58BGllkb/4EY92kY16Esaw?=
 =?us-ascii?Q?078bGO06RE8tPOPxoLXY4d5rmls3w2T5BKG8hdjU5UE8etsTmpwN+Rlyiv2l?=
 =?us-ascii?Q?VXp8aRCZm/gZazV0fUwHuPI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6d115f8-f9c7-42f5-e3bd-08dcecb43b88
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:41.7593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W4nx857k0645aPqXi/4XQmsuhXV5kDkGNBXMeIpO9p8+7NGTQ4YWNO/mi6ucDMYD35/MuWvkdwnEAqbH8fSGkbNlR7L4UtwK0a0s6Ywn6KRa2Gp9lJT3XJTkB+szLbaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7121
Message-ID-Hash: ME7WUBA32FU6MZOTPIJL2E2VBEUQ6HFB
X-Message-ID-Hash: ME7WUBA32FU6MZOTPIJL2E2VBEUQ6HFB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ME7WUBA32FU6MZOTPIJL2E2VBEUQ6HFB/>
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
 include/sound/soc.h |  5 -----
 sound/soc/soc-pcm.c | 33 ---------------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e6e359c1a2ac4..123a0140a23cf 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -815,11 +815,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
-	/* REMOVE ME */
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7a59121fc323c..27810f6f86302 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2860,39 +2860,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				has_capture = 1;
 		}
 
-		/*
-		 * REMOVE ME
-		 *
-		 * dpcm_xxx flag will be removed soon, Indicates warning if dpcm_xxx flag was used
-		 * as availability limitation
-		 */
-		if (has_playback && has_capture) {
-			if ( dai_link->dpcm_playback &&
-			    !dai_link->dpcm_capture  &&
-			    !dai_link->playback_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using playback_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_capture = 0;
-			}
-
-			if (!dai_link->dpcm_playback &&
-			     dai_link->dpcm_capture  &&
-			    !dai_link->capture_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using capture_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_playback = 0;
-			}
-		}
 	} else {
 		struct snd_soc_dai *codec_dai;
 
-- 
2.43.0

