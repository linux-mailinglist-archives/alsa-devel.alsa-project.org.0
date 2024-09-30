Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02C989927
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E64C810BE;
	Mon, 30 Sep 2024 04:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E64C810BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662569;
	bh=n7fERorHze2JmC+6AyjZBH0qej2nC8phi50bjVYRW4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TAaAb575yCeGQwyycVF/5UDrJ6E46NVPSVZwDhk3Exod3NEILRv6GIrXUp/bQnGBm
	 sqiZeGtyzORFTvkMcRNQMKFhr0GAGc3OOFrxtpVB7Z2+TOh7Fp7q2McJ8wYe4MK3WS
	 WcX1ubbOIdHuVqZ21FhHOBFyIF7gtxY0Lv81sgQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32F88F805B0; Mon, 30 Sep 2024 04:14:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 106A7F8069A;
	Mon, 30 Sep 2024 04:14:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80CF9F80698; Mon, 30 Sep 2024 04:14:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 715B7F80579
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 715B7F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UKD/lcKJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lwgul+TBNZPzpwCfowsLVsz5AQWw/zHi74ohsMaxQpIoOSwGPcb8NWfWnig0Dq+AlZx8bWQn2xUcz6GOxbuLV6MdUB4yat1rawwmy83zAIi1fTxtdXMqkvPz6G/fkDKVL09Y4HdOejbXlOL/veifAAo49l2I8HgpQVpq/vVjyu1OTmQnQ1w0MFLhAHx9+QV3HyMmdqIfJPiEQn35X4fnJmgtdVKPVseb3ZYIF3dtV5RVn1XwIcSUN2+bEwE1mcZ9fauClt3U52keY7KBDnjvo7k+RGxuZ/fY8U541fiXKqMpL5TJUKWT8NP1LBhNnBwjcO+xuu8BZG6j2XwOrGj5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQbtWGqjWwJrlbSHrPG6x4hwYFF+NyLgnSgjClQ7fyo=;
 b=jMF4jl+f4QWWhHT4aTQllChMOMqvWYGJPoNm+2qgdpLUo2lnpRgs6q8P89eByvR9bj+mKskHZAEQvY6NWy5vyF9rgtqyYDmbRBvwH+NxyrQPiI4plIT+4Ij7SeBMpi+2uXwMK+RQnjlJOHCJDUE+U+B+G3oWqy/0igSg/pxjSkO6rhKB5Q4dMK2DHZNEvRAriMtrngMisP8qSj98k1ZnuhtR94hYIiuaja+tNDkCODRQKDtP1X4Bca/ms0SfL6O56jKlIFeZrRztYvbw6Ba+30Dd+EgHB7nN6S4BaUrXv9f9RMekrnhutuahVokla6/vsAOu5LFsgCh2JWOhVMEDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQbtWGqjWwJrlbSHrPG6x4hwYFF+NyLgnSgjClQ7fyo=;
 b=UKD/lcKJQnc4TtX/bO+//Q01LPxHcxvOqgVeVp9bFR3I0sk3yBNzT7FM1ydRiMHGZxUgBt/OJ4QkrbuT6dL+XI0OxCJWpEZ9Ad1oQ/f5pqoLjgVpETp19EIlFZ1EJt2k38FcHP/dug1xAcOVo7M1JP3tKh8cqsjS33weSOhv0yU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5798.jpnprd01.prod.outlook.com
 (2603:1096:604:c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:14:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:14:18 +0000
Message-ID: <87h69xlwg6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/13] ASoC: soc-core: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:14:18 +0000
X-ClientProxiedBy: TYAPR01CA0235.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8bece2-3897-4703-75e6-08dce0f596c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I+X3xCQDAW7yoBZ84HLDvBPAor8VxqpqV7Y2ARVZBxjIdm6qvvmoYfw9JcAg?=
 =?us-ascii?Q?ziwpU+UlPr1tc31rzrvJajzzQvuTWgFZeMAw+0jqAYmCAH+YcBKc9KOmo91V?=
 =?us-ascii?Q?uPVTmumM98b4IRkmrephhzxvWUmpQWA24J9vlKBpGhQhMZYdPUeVgNrlYdZE?=
 =?us-ascii?Q?AFRCmrd/VWngBHYVAgTMhf4bKjrbHEj2UPA48y7QB7R8hNso2I+ZG48t1Zdt?=
 =?us-ascii?Q?+E5/u8b6Ej2O/u43ydtbzu6bS+tUd4dxJio5H+FdSozxlcay3g2xH8OO9KzJ?=
 =?us-ascii?Q?2sL660BtFK6ChTuErvq2xWl57q3uiaasHFUW3Zd3w9z7hS1eCrxFm5t9S2TQ?=
 =?us-ascii?Q?qaIh9fVQro1VDFsLAcjVDeJSxeBJWgmqAuwU/9dCaryNUgYDwp2QEWhyW+jN?=
 =?us-ascii?Q?aRFMRWabbzhVK3MIGhfgO5nvMZMtFBN5SGxH+DyPc4MRSjP/7sT0QINs9MMA?=
 =?us-ascii?Q?lsQiJH7ck2YQFEJw8/VUjppTgVync17ems/IE2Taye1gdNy6XElSkopBPE0S?=
 =?us-ascii?Q?dHkMWs59mcuEP/egu0PA4ZzuRMaliba1tiQocYVmgIAfM3Tanh9nvX6w2Una?=
 =?us-ascii?Q?dMBsqyMPdsFpXwvmSrW6RAEpxEe66Gf1wtSee/FKTyb5HYB9wZXtWORSqJhW?=
 =?us-ascii?Q?25fMEs6jQpCMVt/ZiRCG2uxx//UozzWO/88DO4vf3eFcpgcqEVQPtPJF4yxs?=
 =?us-ascii?Q?mECZY7pSUKEMxN3Y+9F8xmMCcueARgMmfhbp+BLVBklCAsLiQxEJoeLmzF4J?=
 =?us-ascii?Q?nnAANKoF4jSWftQxiRv4LRd8yPtEsR0i+KDMeHo7whxu3t1K2WWRNsI9l/Cf?=
 =?us-ascii?Q?xja8siwamn2FpiRLk3bt4ZQ5tFOtDNKh13xNW1BgsGt/bnuy3n3GqITXIu4j?=
 =?us-ascii?Q?GQv6Fkq5l8P3GN7reCutFzVLjSqLow9JYy/s4kH6Fj5PWPeFd24aP5ZnsyPB?=
 =?us-ascii?Q?vYDjrKl3DVwYOCg/tBJNhJueF28TjX20o/xwIR1KEzy7KkA/LntISi15/Mbt?=
 =?us-ascii?Q?aSdnabTuxxhafHvudPWd3PYqzeROpHYckNxGq+FQF9Xc3PrUem0WXp0Eeg8N?=
 =?us-ascii?Q?OMrTQ078WozRewgbtUlKSy134c8SGQ4tCGpWIZ/hNeGMlkq5SaZsknhG/1ET?=
 =?us-ascii?Q?P4I8+N4A6HEIWpxdfU+WRmYdUAMnHw7qDgsL0p0zqESnLTE9hrOArpkhs8u8?=
 =?us-ascii?Q?BxPiip8wHEKn4y4hmSbUTkfFdD3gAUkMrWWAJl4S0/Vya7IpdIc7KaUJ2bLg?=
 =?us-ascii?Q?/810NP8YyB0pzJziYdSso0rH7N9FcmZoY8yQuwaBxHstzRRGG/1CTGfgyequ?=
 =?us-ascii?Q?2GYRDff+9RzbPgxwZHH72wC+8sYPui24IQ5cvNAjr7eDjn/fd54a67h8IX3b?=
 =?us-ascii?Q?rYpIzY9cn8/7XXTVzq9z3jGzmYhWh1kLoB6J5U6o1nop6jRxTg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yZFEl8LaFrpJlaQ5p8vJtRNF54idguiMbulHrxhgeRSmbZWHF/E4Rxi6Blct?=
 =?us-ascii?Q?ATdt7YEQOUIN4a0SQaPfLzhIsvLeIbVmVescP7HcmydrLuQ6IvIu0t6cIRVq?=
 =?us-ascii?Q?rEqmVK11xfO1seg1UhBNU/i1epVrbzuvEAmTzF/NOKwA4RD40Brbjsk7z8zn?=
 =?us-ascii?Q?jpINHqczcIrRergeNgrsiFGcAm70+Pq0tp+KrAW2VeE4mOHQlOgbCjzVgu0M?=
 =?us-ascii?Q?snnYdxJ4APjVpO2TKqviDy/Hg8J2WClorJt1xsW7yqvBsVrDd46DMLXRjQuv?=
 =?us-ascii?Q?X/uilHZn/ETJDvJPdYP/PXJqCGv+LDWhP0bpRUDmOfewGjJnEUbeXKMZp7fl?=
 =?us-ascii?Q?6BcpoZyxPINBYK6aS7TLVR6kfD6eW8TSsZWEeHRsDQnr6eUtyA/ba50O0n9u?=
 =?us-ascii?Q?jltKuSoyZadu5AP9yPAox+ZBY0R0SyPwc1VId3WvekRQfkfyjAc4t4I+qK05?=
 =?us-ascii?Q?MaSi2Pce2mt2xHzmBGWT6yVBNnXMkVHbdxtCGVmJ4KR0DAo1YjRy2mIAMbdp?=
 =?us-ascii?Q?zKbVZIyHq3f9wEIflHR9dQZo2OLhrDQNDPWwhskgg4bEtb+x5Pi9FiUnJ+Gm?=
 =?us-ascii?Q?myzwxbY3gIoHli3VjZJpePlG1fkUQwVvTa3Nk3rb0P//XmhAwuINRQEV/u6R?=
 =?us-ascii?Q?wM8Fj5YRfGvayAQqEka3qyccHHRF8XjYIWaerLhqbezPOix+DuAfhJoNixCe?=
 =?us-ascii?Q?pWFrySkP/ybdI4wK9eKmQgXwiCLiHlh9JMjmd+EX0ETD4wuvCF1Vn2j21/8j?=
 =?us-ascii?Q?jIHx4b/4OqHRI0yHjAtnt5nu9pg0peNJdOatVlowl/vB2JkbCrlBKoAHPIly?=
 =?us-ascii?Q?DAulBR8LTygi282YUobY1TZKQQ1OPPYdIJkoePWgqPD4R3oV64jRolSBktd1?=
 =?us-ascii?Q?32vJf5uRE2/qTn3lGxBg6FH+GobLNoUVEGpiIRlmiH7GN5JGVdhrOWuDr08f?=
 =?us-ascii?Q?/7mfwEPM2EQjfPnLt7t3NERwSscWfyDaA7+kr/WYjKVCZ4KW8WZiwm+WYD8e?=
 =?us-ascii?Q?I+w/pmezcQmjoBwkHIz+YN/cU40y0Wp42bduSZO5BwEw06GdJVgMuOPUMRzB?=
 =?us-ascii?Q?GKIqtzKL6L7bguuD/K7DjZP3Q7QsXojB2/WI66I5YfSeWrw4cGb5wC6kp18s?=
 =?us-ascii?Q?Ui9Y5lRPV/KgtFnlIxgga68O/1Wy82ZUtWu/klc5qSRX5y5ssSyIhe0895Kf?=
 =?us-ascii?Q?0kl4Q3KpyHTqMcjqiIXYVhHjVmDdplbyR70DT+JbwfGJUKvfr0qOolA9QEBb?=
 =?us-ascii?Q?943zOmt09nas+4BJOEM9W/ekb6w04CPepUnlksHjzMrIJppIB9hEDeL7GvyH?=
 =?us-ascii?Q?ZWpliCGUYtL1F/nj/3/hHowXmkphEUTZcmxyb6u6FXQW3aXpTgY2YoWZJIkD?=
 =?us-ascii?Q?EuSD51Qdtse2vxmqzMU0P7nndXEl515P81FfdIhu7cjtcl0WRO7jr4xy6gkt?=
 =?us-ascii?Q?lC1BHnNdMGn7MCpjpA64u2BcaUZwMOcx8JikoTwsmOanIiwRI9in5xyADKLr?=
 =?us-ascii?Q?fMRgN3ORTH0nRRG7d5+oiLeoAKwwkNO7q75LwnKtnG1ZAuNJ++xkctgDWYBx?=
 =?us-ascii?Q?9d6ujCFzch0fi5+L/snyPtUEqMncIfuIMeabnksgsZKOtgqeKv/HaL2+o0Zs?=
 =?us-ascii?Q?DU8Y5TNjeXGAaTrQ6zTEeiE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fa8bece2-3897-4703-75e6-08dce0f596c8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:14:18.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 c8AVFDmritKPTZwBNcaZ7K5zG32zR+CyqKZIQ6Ql9DiiIhI8uwcJJEOhcgEqsLj3wsArtCKMPzqAH9eTkvPxLfB4ghcsbl3ik61YN2wmUBDHg2ym1KKE/LQSNiOwWXwO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5798
Message-ID-Hash: Z5IUNLF6PWNHD5Q6D4UEP7WXUWMSZOZT
X-Message-ID-Hash: Z5IUNLF6PWNHD5Q6D4UEP7WXUWMSZOZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5IUNLF6PWNHD5Q6D4UEP7WXUWMSZOZT/>
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
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 20248a29d1674..f04b671ce33ea 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1999,25 +1999,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				dai_link->platforms->name = component->name;
 
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm = 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback = !dai_link->capture_only;
-					dai_link->dpcm_capture = !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm = 1;
 
 			/*
 			 * override any BE fixups
-- 
2.43.0

