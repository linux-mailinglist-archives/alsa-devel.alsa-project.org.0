Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 188709472CE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:05:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF395856;
	Mon,  5 Aug 2024 03:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF395856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819691;
	bh=57YLvOUeVn/94qkKtm9Aay/K9AVLIKWSIydTAcSsNrQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g1f45jf9VCis34xV8k0c47x1YizLil4bLMiz1D5LL34n/OYIfJG3NhpzGoAFIev2c
	 Gtt/47AceHZKUVHN64QBgYRCrm7mIpPd3ToH81wQVSsbgg1VvCbLYaTuLp/rUblA2a
	 EHjvlKqAy1bioPMe/eMmE6Tzp4e67RRvkHTP0soE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71490F89D48; Mon,  5 Aug 2024 02:42:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC6D3F89D49;
	Mon,  5 Aug 2024 02:42:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 083B6F806B4; Mon,  5 Aug 2024 02:42:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B489DF8075C
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B489DF8075C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oaJUS4TR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGrK7nMgitZoo8UYRDwjK4YJedrT8orPl3eCZzILdlDkwMeoOZ/YiG65s1WGO+eY6uVvLfxhBkQI0EI08QmUOhE7G8tFOcpUMKk+FjH2pXvJpbovcE+JySya8PmY8YB2vYZaU5wguM7EfpL0+owtaqi9RHmDcJmEqv+nWlFt1gT3RqBJceCmt1sa5D638eum54vXnt+euJFCBQePcHmIJ4Cmvs3/2ewQ1XhA8nJifzDva2UPu8ZsMGvV+XPu6Ji1dFsirUr8mkclBXCymrZz6CvCwwdtXjd6YamXsVix0Pv/nYhUW5NlEvQRJ6hmBpp80QsRRk7n8Xh9sgtCmOKZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOmM4pYTIeHbnHegiHAyyr0wbZG7gG+hMjxUXFsAYGQ=;
 b=Ld359aitHuSHxB1B+Rsgjc8kHH0rL0Or9SBPhF3K/Xl7pQQ/zd4sIuT/8ARr3tiJAATa40ZxIDXebhfifKPmuxifyb/Rrss4e5v9ENI6RGyEsbk2sRujq3N4U1C0Y0vqqGVWG2V04XmR+PANsOmII5Lh4tC9yPDiA6PfGc/kjPmMOhCjZbfdiMZ3NtZt83BgkAhohFwYyujVv2KlLxNKdTJAzw/OFYIc23M6aL7BZsfM0iNDUtgKirbnLmORZYCd6D0msN+qJEZ271qfY3e6C35p6iAaD9yYAPEroPgEpB5m7U8LpHXffa0Ee1JqvCGCccNmt7fWY25wUS8jGGuIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOmM4pYTIeHbnHegiHAyyr0wbZG7gG+hMjxUXFsAYGQ=;
 b=oaJUS4TR8Ho5J0ZGgG+aS01p6w9loynws+MRoYg8QMUyNC1/+mA+MSWiugod8KHFCpunOoHZGxhkazZFpNbIE9Hta0hkz9dUpcMm4ZvgNZGjhsYcLUCqyZRgQWIMYG7BWrWgb4mTLwt7GB0CDmF5A7coBcE76bu+FUja6f2pSfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:42:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:23 +0000
Message-ID: <87sevjx0k0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 083/113] ASoC: codecs: rk3308: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:23 +0000
X-ClientProxiedBy: TYCPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:405:2::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c2b79d-7e4c-4503-fcb9-08dcb4e778b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Bxol7tH0Okcx2CO4v/XR3WcgQKox8cgiak/f8gu9WExWhQvEEsir7uxQQSVo?=
 =?us-ascii?Q?knaf5uvSzMeCUfJ32AbUG6ac9bDJ99e0SoqvA44EypjloZOrIQLvoyf4QS54?=
 =?us-ascii?Q?VoFEp6dJHVRI4oYG7O193mMl9ssuRqhHIwCAl7VbZ5+igrAXfVgoXxZbi/cq?=
 =?us-ascii?Q?Ogenm8iQdy25kcgl61ynewAXpxwbL1U3U0dYJZE0edyfW6MnKl+U0WiIMoiw?=
 =?us-ascii?Q?zyLbSDFtUjYt1IaGn7zRrPyK2+vrv8XsIeIbxLsiEv3X0cMno7kWm2FbwRkT?=
 =?us-ascii?Q?W5OUsXyZxyl44IOLmn5Nd3GXrz3qY7hWcZ3WQqOYCkbhWFJ50DzZEfmhji6s?=
 =?us-ascii?Q?iZRoTnAXE7tgOK85XsZJAMRq1JNlNyM9g7nL+O0w117hMFAYSFBa0apaJKLK?=
 =?us-ascii?Q?/GBe1KwH4OF1HQWr/TzfH5HBvRcnCMZLHeKd/g//+5yFAD7lqGOlSfjR8Ixy?=
 =?us-ascii?Q?tTPVG9H9zuXemxFwUchRFU9OA0dnxl/izTR3kdNsMI7e59EEzJ582a2tM3B2?=
 =?us-ascii?Q?MwrmR7E1l/cbvkFd2YIOBdLbhrIut7snlQz7tz7T2AVcJRy248PIpBph28HH?=
 =?us-ascii?Q?X/mhqoudMsXIVlB7aasLn4kcYxvfJ/ZsD8ymfBWek4k3Ya8NkljDIMKK+fq/?=
 =?us-ascii?Q?VFEftU4lJ1+axXa+7HFGemLoGorKZxvb2Jye5IMyuEkJaOjvawYQnGqaJ0Ty?=
 =?us-ascii?Q?/RFjehKTAFP+WrFHZ4vo2EqMjW8H7HIvx6oSllsi2qwDc2kd5P4mMCpPZAlQ?=
 =?us-ascii?Q?Y0FYG/xoCtc00n4SdwMV1F6HZPaSb8COk6FQz54hNQiOvUlNeVnHgCSMEeYQ?=
 =?us-ascii?Q?Kyq0aMv1ImYY8FIiVVtUkU7mloC/3xMM6ZtsAcm5PzXE4W9mV+JjJ+YN6aZd?=
 =?us-ascii?Q?HT5Oe1lZ6ajH8pS4+hC1gU4xKOHM+kn00j9IQtWR2bXEojYrKq1eWOgo4MHe?=
 =?us-ascii?Q?mheX3UyrHeWxnCY6GNb8ocD63jPxKUaJYAiFqiywftxJ99vnAJih8tkk0Q2y?=
 =?us-ascii?Q?R/vyFsSqq3/H+VSNbzpuXOZZtd9FxINQXkfovx4fSzGQSgjT13NiZcIHavdj?=
 =?us-ascii?Q?8b0SC3Y/rZOVJN3r+pqP6HKwO2PFgO23iwXrorvSYmxGONUTbX+tkpMUzKaE?=
 =?us-ascii?Q?3XP89WSlre1DLT92jeCf6dgW9b5htvOxUNHgaxsALG6mXsEeAuwD89FioAQw?=
 =?us-ascii?Q?Im77V9fSOuPq5+bUcU81CLmrHPbVrICMFJ9CDHsLezvuk5x7BuBlNpGBVFqi?=
 =?us-ascii?Q?UPGbDf/v5Q3KkCbov7HXuCypbKyjD6/1H6Na3+fokT4r0e1NCzZOHGfrAyr9?=
 =?us-ascii?Q?jUhzAbfoybWvYwgcSL7exiGLukQY+mrKzoxkqDOfBTpfUTl4adh+IJfAsyIc?=
 =?us-ascii?Q?mTSsFdUcSCIF/s/cu8XONDqUnII+km102FZrmCeGhiTGYHJwzg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DQXuuBxsN5U+F4t6+sQqNr2Lh4lyR+TNSjcSy3gmDNHDQNm15yA5e+vwPXSu?=
 =?us-ascii?Q?S3WC3sdrF/akyBK//byNWrzrSrR8jtlGAaMfoX46lBkMGg8R2FZiMA+j+5v0?=
 =?us-ascii?Q?d1W2V0S/N1/eDwhRlQkDj+fZlzw7h08pVhFGBudOkNXDRjSVOlzp3Y28wywq?=
 =?us-ascii?Q?amtAQnkB7+ho1LB0j1Iz3L+RWhCK4FpoO6sA05thpWp/aonoqxfh1rFmZnhi?=
 =?us-ascii?Q?BZzIPHq695kB+i3nPyfmsKzez0s/z7T4FkFB1qm4/+HzQABE8iyIJ2MZsnAx?=
 =?us-ascii?Q?29/XMGPLzAMVxf7tr0200gLEjTWDmzrXkaiUzCcX8em7a3dbOa71BbjdTNlp?=
 =?us-ascii?Q?SGDDeCCiM9ImyKsiKrrqQmLHHJcy9QSnfsKr38QnFwK6CzwRaKqDRm4Uz19w?=
 =?us-ascii?Q?Nx5X0w8GWhcikAvKbIG2B7u+ezEdNJ94L9ujAX3OMsNIT4q1xhy8H6HcLkx8?=
 =?us-ascii?Q?ISF8wKRg2d3h3O5AuIWBvA0RL8z9kDFu1m0Vc8DzSMAQPt6KVBtI5h41j7A6?=
 =?us-ascii?Q?7N+Bf5Zf6NmGcQB0IqRwM1jSebgLVFsxZ9JmkHTP9B3NvtEgScangCCXP9f+?=
 =?us-ascii?Q?xlXvyp03uYk02BXB71NueqWBJPOkBXbrtMYb8Unv2IgvRu0TrZZ2fFZK30eq?=
 =?us-ascii?Q?99RMHjrvWnka4TCyJuUHSLDEo1bFyJpIjb68BxQdfIcPFT9vnGBZNQxRid38?=
 =?us-ascii?Q?VULK0QV9EzkF86WwAKE7V9agofRXXAwwdkH7G6gsJjoZiL2MMGUzU3kdHSvl?=
 =?us-ascii?Q?jlFhNusIxsPwVNc+EofyUbHIrMQm1ZIBy+zleDAjaVH0DbW8fhlehwOpRyoL?=
 =?us-ascii?Q?pXSSCf/0Ubb/HcrXNJLf5MnomvJDrqCU3+mGq0qJk3XbAKDMW/m3GG4bHXVA?=
 =?us-ascii?Q?NygcAoM5lbJIirWe4sA8KAh2B6S1pwmqMd9Gzg5Wfmb9ktAzxLacypvLvbAS?=
 =?us-ascii?Q?DRkYsyQNbhrEY/1CxLmaseEl1Nm4G8n8xP3CRLsdYN+GKrs27LGRJ1gYlQVG?=
 =?us-ascii?Q?n13TSGqVCBkRbt7X2IoP5lRHq7TGtp8lpw7c072N8HxdkHKcQNdhvwRwwUY3?=
 =?us-ascii?Q?c99a/1akcqll+U5uuAAQ+LEixSZHABAJTvQUjTREIYdaxlm6KDQDRdK6VsjL?=
 =?us-ascii?Q?960vjUOo/TwN2+lCSbiVdL3RbCdH1D2Xz46+pYEmO/gfFXUWVuP5GmR+o1v9?=
 =?us-ascii?Q?2GTOLZOVEEq+tm294XhtSi2a84R/uaLDKRJJqYXnxVmHnKNlexi5HxiLX5/6?=
 =?us-ascii?Q?JhbOhLf+/d+M/QgJXLaKMop7cOKNXOlwuOtyHYrqp6oqSL5qK7lPNuyuBj9U?=
 =?us-ascii?Q?+DxPyHorCO+EgINN1FOX5nxE9h2zg2TnEjQhxpF+4jvQbK4RG7MwezJYlsi7?=
 =?us-ascii?Q?vziMT9iQKZLZEFkEU+h4f9hypWF0MehCWw9BNC83nItg0QqDArsnH0dIfD7X?=
 =?us-ascii?Q?SeWFJLhBFY8NaZSJ6KBlTk1CvAtiawzAylC9X6Efr7XR4NKS3XTZyit2oJKy?=
 =?us-ascii?Q?vymbdZoT7nUcwpST3O5XzBwJ9Qqv4UrCX+iuImK6A9X1uAAtkoY2OyGmlz+i?=
 =?us-ascii?Q?OX4gLl6ajeIsYTAJSqYxNU6iP4wkaZ67x/KBHryIQHJbhpmWFLLsLkzQbV16?=
 =?us-ascii?Q?DzyUDLUzGItGkT3qvt77WDw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7c2b79d-7e4c-4503-fcb9-08dcb4e778b5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:23.7357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6pmMhV1pq4tPdeb87uL7oZagDPyHX1YV+tHxl4sv5vJ2aLDdJxu6OFX+bVSp1Uvo9FfMBwvgaY3dfQKDwqphzToe6CuWPl+L0t/LvYvh0IfhkzReYHBVNcMRphKfJE9w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: ENQGSJOSQQ2BPLZ7P4Y6DVNMPQX5ZN5X
X-Message-ID-Hash: ENQGSJOSQQ2BPLZ7P4Y6DVNMPQX5ZN5X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ENQGSJOSQQ2BPLZ7P4Y6DVNMPQX5ZN5X/>
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
 sound/soc/codecs/rk3308_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index 8b51e87a17115..7a36cffc4f3be 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -674,7 +674,7 @@ static int rk3308_codec_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
 
-	return (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	return (snd_pcm_is_playback(substream)) ?
 		rk3308_codec_dac_dig_config(rk3308, params) :
 		rk3308_codec_adc_dig_config(rk3308, params);
 }
-- 
2.43.0

