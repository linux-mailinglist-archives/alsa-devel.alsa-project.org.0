Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B98199DB04
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 03:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15E9EEC0;
	Tue, 15 Oct 2024 02:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15E9EEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728954008;
	bh=jL5hztbRGI1Tm1tovWSX7TbyVHtxGpxZwsK/lZd5mBs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RCrWj8dmfem9lTpQvT+6B9Y85TRE+WD5RHbE5WRxBX/wAEOMoyyRAwVGCq/ibq1TR
	 AYTuf7aeu6iJJV20AT8B0g2N9n4HshfXsSSZ7xLvMygXxjXqxiO73U9MnbvZHQF8Pb
	 jafFRoC6u2Zs8qYMbJ9mTK9co/pf5pzk62B8Or98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE46BF8076D; Tue, 15 Oct 2024 02:56:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBA26F80760;
	Tue, 15 Oct 2024 02:56:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71F89F806C4; Tue, 15 Oct 2024 02:56:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E704F80639
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E704F80639
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PdUKlG+p
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIv4mppH/V6lQwmHLpoeflGA3JDvNOVaN3eDUU1c7AKzQQiszeWjuoTU+y9JYn1427Q1YeoCtUwsYepI99OGOWS1KUt7TlgU/WxF+j1no8m264qW2el7ieG9NCxXkhbiqHipWCdVhMSpSdVsAP7KXCNfB/K2QIWcv36nnXR0kF763uTplvHc3C+dezHiJjXVS2QPfsugkRcSROK7fHQPYWP+FyHplsnCacnGe5Ton9BC/qtQL82H5j3EdeFxlDxuzhLgtWjMNNqAojZnIc6Ku0Yjjct/ZndxKZtGnjIC6EB9rVI4qSOCRCRhfcAlUkWqb5yyOkezrxhQb227y5wf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7YdZX1l6hpmIHvo28d4Vx8ad4WMxH5X72cmvyifWCA=;
 b=dAQe58dtQQ0lcaR52l3Q+c1FThM/0H5uA2+3KKqIWkcVUY8AlBFPumVpjOrzHNA2Oijz+Q65/fR+EppXUR/yrhYuviXuLEMwXPOOfLvE1Tr0y5Jp8T+YTTHmIvp6gaW9ggiuan3k55VzoAeTsdoAsGjCi9axFm0c5d1Wlbe9C7MbmZymg/Km7ujo3MVZaaxQvb1pYSl+QyWVTu/p019m+bjcfrUoXabk0f2Pkr7UdACyRoKCi6KjUiCm61a6wg2NljJDRRW7bP2cyZQVFjBr/DJ5ZeRQ7fpgO2E80xllkWC4u92XVzaGrQtigwk34xeyNtS9UcAgJ8ZTab+KyrTX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7YdZX1l6hpmIHvo28d4Vx8ad4WMxH5X72cmvyifWCA=;
 b=PdUKlG+p1JUFJFiUxzd9bu+4rYuMSAcBEEzgvBFTNEyEWRGsysgzYUvMuc6377Pu/hL1fUm4Uxpt/R/RNia9GUOH70PwSVyCISX/ABGsia2j9cPZc+cxmXJVc2SUc50miTC00fx1w1E/xc3mRTt4Xw16fOZvWV6y61dMe7X8tmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6130.jpnprd01.prod.outlook.com
 (2603:1096:604:cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:34 +0000
Message-ID: <87bjzmqj3y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 09/13] ASoC: soc-topology: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:33 +0000
X-ClientProxiedBy: TYAPR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: d719b99d-3ec6-4953-a330-08dcecb436e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l5X8hLSxIq4xg7Rwsj45Usy1UsTK/DvQh+JCPah1qjTc/ATq5uh7vp88KPGh?=
 =?us-ascii?Q?a0NzHz7Ilk0vsAoR1r1dgECP2GfePCweD8PJmfmJPx5AJBUrjo167Kq8I8Me?=
 =?us-ascii?Q?Tt+hGFT/9J20IDWI1/ephsda8wFsJdCe72SL9MmueBnKjBFqOPxnCjNkJ89D?=
 =?us-ascii?Q?L0Ejbp5loY5CACIP0XLFtyf9t/aqfUThJKkYiAvu6I76OQHzCNAjUhHIkCaS?=
 =?us-ascii?Q?mMUd6ys78+kYfj16AnK5nWT3NcEfLFVQuvVOj1PZggzxEV47DJ36zR8bKji6?=
 =?us-ascii?Q?LsRroZwEDIU1FNrsnplNAyBz4FcdAPZ7hE2nTdA0CbEGD1IBS5nDeyBxrh0t?=
 =?us-ascii?Q?M3G+2Ys22MBvx5TsIcbvZxSDTtELblPbuahZH1BKAjTOA2a2/MmrZgZCmXvU?=
 =?us-ascii?Q?BxLN5VH/DEiKVxZYGOvsCSxDP6KH/4dBRu0lRG0nVbdC2PWuMbhc/1WIaj9y?=
 =?us-ascii?Q?JBzJZjYPEUFxpIPjcSFfapzyrWgyt12D8BfgzAwA/RkYj84HlohKZvCHvjIM?=
 =?us-ascii?Q?Uq84s/BzLVYMjwJkPTi6FvSeTYmVI97rrx7Dhoet+yIMcrweGH7jQRDyPb9q?=
 =?us-ascii?Q?/t6IkQROYRZhD8pOaJR0/Cup8WhyiKeWCW/HaYx+6Rh2rQ7uUPwCneo95q9l?=
 =?us-ascii?Q?i0qI31fFhgRRLfYMnLj5FtC2YSNNupRMTcHT/Qb1auHKq5NlgjIbyqxHxn9K?=
 =?us-ascii?Q?Oyj2ZTjGiUh1+LqGIk539hI0TajhSK2BV6tCV5rcJj6CCs/jH/0aNj7Qwlqh?=
 =?us-ascii?Q?rXF12t8T/l6jLcwrM3gU6LTzPKqW94vJb7BHQ5N8z09tpY0c6WnZDe0k6Lfp?=
 =?us-ascii?Q?AbMnPidmRx8eGGi3K2dfnBPI8h4wLvm7XlUK9X2sbZswm6tuWSRuSY/ufH7t?=
 =?us-ascii?Q?oIBR+/1S9BYuUuDbN3lCVVdPKH8v80FLUQtWmwMNqMPEq/j5y2U2intVxH8c?=
 =?us-ascii?Q?lQ7RufzDEQWqiO4VWzUGsED9DgOtMJ3mNbQU6w4VFPcd1XrQI7GzIchsZp1W?=
 =?us-ascii?Q?JDlrdA6uYaO3vpL9sjl+dUbJkZZ4moqZNgbeKOf8geBCbdEwOBIaQ3M4Shf4?=
 =?us-ascii?Q?9i5JtRem2CZCkSKfPYAEwwtpK8Gb3f2YyirgqDLw1BhylrHDY3f9PR8MXHgw?=
 =?us-ascii?Q?z7E6edXh5NFyv3wJ8ZCUIGTNBdiaNzW19wS7+UHDI3v2awgRi45tE1cc3Jza?=
 =?us-ascii?Q?/37X/M5OEZnzawQC0NYoAzHudeTBvtCVg88oSU6gpQYRts4dH5j69tu8GGaj?=
 =?us-ascii?Q?2vjMthzlGpsDsvlv33IngLZnLBI95kcPcY4MTKPxxk7euUHHu4MHBw8Dsb6m?=
 =?us-ascii?Q?qsiZhCR1VVbqvdJDhjGlxBAxNlZPbX2A8bT4p7p05/c56g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X7eV0NDTy3dAYzkPBsPRvn2XD1TERqvDvz8mVOD3H/ILqWTaryGHQ04lpYqX?=
 =?us-ascii?Q?c3Lp5j+MLKudVCKlxpf8GBhAOmsF741U2h9VBWvgkE5rZK/xwUM8XoXX81HM?=
 =?us-ascii?Q?62mLvpeEWCfxKDMCE9vnu7uco7N+avDrrBKle66sQo6I1+v2+eYe7OUQ5MSF?=
 =?us-ascii?Q?fQWfOSJwiyUJBxtRu75nQ54ITekx4+BvobiqD0cE3OnOzGQyQVwFfuYK63EG?=
 =?us-ascii?Q?LDPratlZXWLyp0QNPUbVLfZsgUon0XP5fzt8GGsHPNHe/D70JXhgNZdUd9pp?=
 =?us-ascii?Q?G1jKU51Jv3X0UfhOc/bfG1arhkr3yKrVQvNtKGvlPbkqAY4ZmAAIZd3/qTfX?=
 =?us-ascii?Q?QwwmT/Be68OjNBsyOsOxqzwC5hWwcsuCGXpN2C8TXcDjBgWTWjGeahLg1RN1?=
 =?us-ascii?Q?lJjnbNNERo3tSr0CXzBXeeYBobjMkPabCUMBPxsib5Q8A4qT7Ck8xHEt5RRd?=
 =?us-ascii?Q?MJ6L3RXqYW9U4pa8LmDf2q/RSmQJWTlk4QF4yMKHWpu931VvFrDgwWWYUz5X?=
 =?us-ascii?Q?6fMWnnNZA2BbslLX+8Y4AO/FtMb+dSFNiyXEttRTuKjJVko7G9HyG4xUtSrY?=
 =?us-ascii?Q?TFbpq6cQG7dHf3XzIKqw9pJClIWtmgT/sx2UZgUyKkIz9mc53jDySwVS8N1X?=
 =?us-ascii?Q?rPWnJhxoiP25UM/5DD5sw4V7Y6LnWjX5Qs60OBb2ztB/DO2qPwWRJSRJi/Bo?=
 =?us-ascii?Q?+v1TvhqOTnt1RXC/2u1JEl8ag2csXkgBr08qmgLi++SbYDmfSIFc13Qh95Ht?=
 =?us-ascii?Q?/YkWRiUqyobGxbezHpl4gkaG/Cb3HU2Vvweptyq1e1WKl+ukhOA75CkzgwQW?=
 =?us-ascii?Q?knp+UwwOaOpo3wdTHMv5oNVV0EqNjaA5dd+2cQgKBFf2h+p0maRXVcHK399d?=
 =?us-ascii?Q?wHolvBF0H7G81B4nXRKW6ugXQfBCK5qavfntALlAi6PtUjt4DWwgnU+8Xn5j?=
 =?us-ascii?Q?Rf0VYDk/bjrmtppvraAeHxYh3egQaqloACfqS9touX74tRzVlRYVOZXXzDOB?=
 =?us-ascii?Q?MJwM3EE/zFnJZhxxr+AgwGn9ZkR+CnhhW14oXJx7/wz1xQzSCk8sYDlDRLpl?=
 =?us-ascii?Q?hbdSxuXy5xTgoO/ozN8mwmkyoccp1gRZmEU/b7Gu1Y0uNHNLq+b1GsLvsnad?=
 =?us-ascii?Q?/qREbUUxPmtk3SH5JgOwxiD84BtGxrOArtNgy6yRu25uwJGMwsQDmlNCeXg8?=
 =?us-ascii?Q?t1t6akQUB9AQ/UyZywZKrtZBkKK4XizTNkqrBvETC9EW5ov6thZ2CKZy+PUN?=
 =?us-ascii?Q?g7kAEa8wCs/Wu54m2rB7b3a9gVIVj4geEzxqFzukx96EchH92GkzU5nDkt8p?=
 =?us-ascii?Q?msd5k9uDKPWpPPuUsxUJtjS3VHfMJwqbjFSpEtZC8amOZqxZiLyacNC8oqYj?=
 =?us-ascii?Q?p0hx1JjZmjjR2VD+I5QhiusMLofb00cbhBuJ3yiWLjjaeYdRfP0alUbYoeyn?=
 =?us-ascii?Q?eVv0Njv39/GwFeooErQeWcE0KXKPUORk6eQAP8l2LHT0vsC1gUNm2hJdRS1K?=
 =?us-ascii?Q?8WLlncqokENxE7zoglRuOiTQnI0e/4mAnHhwAFn2RE7vZ66f7SEwCtGJXZbO?=
 =?us-ascii?Q?6DDOWZZOwctituCMuDFwRTYQXRsseyEZ7iG8X81b6LNfzCUbthiQxDHwXWVM?=
 =?us-ascii?Q?keEEBvoWMkowLb/pB83IHKw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d719b99d-3ec6-4953-a330-08dcecb436e8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:34.0051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rmpzCVvOJCftizRmdQkdkHpFalsUuCKQtaKT8aCa5WQVe4mVcNJcFmaJnYQIbBMU7dm5yeNu2jc5pB9hddjBqjkgSU6w8wwEYzvjg59UyLUD6nH3pNuFjiu2D0cBgBlc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6130
Message-ID-Hash: M4CCXYYXVGG6PRQ4WZVXVPWNUAMDKHKM
X-Message-ID-Hash: M4CCXYYXVGG6PRQ4WZVXVPWNUAMDKHKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4CCXYYXVGG6PRQ4WZVXVPWNUAMDKHKM/>
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
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index a2b08568f4e89..c8f2ec29e9703 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -88,8 +88,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 97517423d1f0b..43003d2d36667 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1544,8 +1544,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only =  le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = !le32_to_cpu(pcm->playback) &&  le32_to_cpu(pcm->capture);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.43.0

