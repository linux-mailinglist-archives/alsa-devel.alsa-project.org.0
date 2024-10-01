Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A898B1E2
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:44:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E189846;
	Tue,  1 Oct 2024 03:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E189846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727747052;
	bh=3g/snjlfb2XSX2dfRWXRD6mShHGLmwed8aThlrMzShI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NkftSgDTnEAm7czWVA6yM+7LtKDCWsu8+bECEykElcC4vpy4Pe6XBBVbAwG11J/xK
	 uY2OtzfAnH1xnyAmJNx6S49oJAquGfOf8CJ0jefG0LbKoYLbZ2ub81OE/gE9gneDIy
	 pSZ09cue44GRffoLrHGsBjisggCR/UwwnB+03Ts4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8488EF806C6; Tue,  1 Oct 2024 03:42:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A8F0F806C8;
	Tue,  1 Oct 2024 03:42:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1C93F80693; Tue,  1 Oct 2024 03:42:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F95AF80527
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F95AF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TeuwCRAG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+Uz8OKN9ugo6bxjKnKSila9XAOwnPx0QUK+eue9AxPSWKFX0VLtypEQl+zyIw0smDNKsECV3VXqEeCAwVXg889OaZZq/D3OujUo/V4iZbGqgoxB8q4mNIOSKCkpdu0exlsG37J6zj4+StRXnmxbgvSnR9XxjDT7iksCuThZX4YEMnwo0FZaHbAmKvWunjGGjCFXYezeMKW6sIwUlRJLJcdZFOATLctpiR11IlrDzyawVvVALoj6LLqEOznBdk+yA3BjKPoyfDUenrPl/D1FL+hHzkRlUOfKXww0DK5Olr88XPdPUMDhsWowOi8Y9gBJJeo4F1a4JeAw+Uk49S2guQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV18HMbNeNn1nP68oRwggkr9QiSOvRe1aZ8FlAj5FWQ=;
 b=V1yCtViiHFin21Erba9zWYAAwSuSt6E4TSEeiOWZoFNAfPfqBOx7lxSgJFE4L/uq2PmFd0Xr9v2y+z+qAjwpGAW6VBTO2sC2yjh2O/nZT/Qxc7kIGSBifJwgOGTOis2T240fRD9UgI52GkHNDxVHM4w+bc1M6qcRckTJCIjkVSHFGNsumPz7JHsPXJb29ZkgQGa2Nn0mK/h67ojBQszo75YcUXZ9AaI/2p+Bdm2fErnmyUMlOCvd+2LVUVEByRCRppS/NNBeBHGWkXCCUlFeazMMCr5Yu3n7NPWU+tQjZPWtThhnF1CiEsyMYxts44Bvz+K06cSQvWejSdSUPerUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV18HMbNeNn1nP68oRwggkr9QiSOvRe1aZ8FlAj5FWQ=;
 b=TeuwCRAGMyH3+E72lBclkbWwTlYUGmzYJWZdkhuTbKiC0o9kHG45vA/zXQ48puKm4h7lu3AC+1mAgZ0i6veiQZP3OY89bpLV4Rre7UgJNovio3SN8qMgwgO9Rh2yGDWiNzcOczt6vnAmVPkwplzQaIoA8UbmGCdAYjVJtoos0JI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7132.jpnprd01.prod.outlook.com
 (2603:1096:604:11a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:41:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:41:59 +0000
Message-ID: <87msjovbtk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 08/13] ASoC: soc-compress: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:41:59 +0000
X-ClientProxiedBy: TY2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:404:e2::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b276dc4-b719-4491-6d04-08dce1ba3db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hk7PLn8BB/tl/w4i50wwiro7laoDaRFyxWvSR62iHJ/arTwlAyoBjJZvokzH?=
 =?us-ascii?Q?rdtvT0JWnHI+/GkiLiMbtXb2+3AG2cM7QbYk+98IYRGfhtSVfbdOKG6oJwxe?=
 =?us-ascii?Q?IxSmvke9zvsbAWORMOvfg0jqgy+PAHFs2bE7othkT9BHCSjPXUdfb9ppUnE9?=
 =?us-ascii?Q?GqvXzj1D/wpu5PN8IDRaxc+QkJNZZa1Vuw40Qy5LV7oWTzZ8MDAjpzSlDD0e?=
 =?us-ascii?Q?Klh0QnMeGDG9rs5PrQ74UhFn7hrKp+YKXq44oidDMPl+JSVBBLFxAKIYLEPI?=
 =?us-ascii?Q?nzioQ/CEFIoMcEj/btRTgSUiW7w65wXxfeDNv6EJMI9cvXckdT8K9vRPiP2s?=
 =?us-ascii?Q?hLTvjrKS1Vc7CnDIQnuD4iNsxJhazCrXGkk6VADGImoCFPiIOUyYV8fWAD/f?=
 =?us-ascii?Q?YOOkxFeGI+C+UGnrGWxQphN2T0jyoUJ59ErAL120HEylSPMqBgNZgTUYUi0U?=
 =?us-ascii?Q?ux+Wxg4PeSn4yRJvfTPxZsO6JNeD/VZ9vQXVaCoR9MiCmT8Qo850GFWKS3vZ?=
 =?us-ascii?Q?lIi8ehljqDuG/yGdnWACuL+rqSJRLlg6UdvoClnrS7ERqWOvBphTKMExlo/Q?=
 =?us-ascii?Q?w8nblW8SFRsuTsbkPapLAJfK6O4ZXDu2hyEt0j0jp5xX4BU+LdX0eha/+FOZ?=
 =?us-ascii?Q?AXcR7plfa7Ubad9YF4Pl00vKk8OEpsLftcUYR0O9O7YLqIJy3IjraeZ3QyNS?=
 =?us-ascii?Q?RTjt1rnlzz5j70RTZTIRUVJcgx1dc/tS1vOj3PdrKRX8kctGB4OKVxLSrEIk?=
 =?us-ascii?Q?JfutrO+UgPi22YuF/0GL+rn0HCT1LNkWG9/QP7tD9RgAljebco6S8qPD0G+c?=
 =?us-ascii?Q?//UWpggEC8ZzDpL+Ex8rWteU8X645V/xk4uLiGpq6l/ZZzXTPyaPhKxTdyvq?=
 =?us-ascii?Q?/dEdYOjHEe3cKeXq/DGeWLVWKo2TirrzLMWrzv5iKofWmrHZzOJ9ITbdNwbz?=
 =?us-ascii?Q?3d96/XTC2vdElUW3ZjK025c6hSH6i2dFdvUHk7/oEj7b3tOeu/+b2ZtGqC0A?=
 =?us-ascii?Q?ziE28G21rHpGuEp/yJk37lHwDnjjA13uWx2Psd+SeU0lwOD6sNrPBdCC877t?=
 =?us-ascii?Q?ikag6us4+4x9ZpP/DIJvu10NQbmxI9lqbQoh4h17xB6vDUmAYfZQMGeijN5E?=
 =?us-ascii?Q?JnbcdI/0xnjF2A5IOJCUH6lzeKp3xKgMFy4/4WNuThVsN9wNeoIEHYZAh15m?=
 =?us-ascii?Q?d4ynDsK5NUQgAUSpTZL/PJisDjKlonvbUi+elHc5wTmWjqJsYc038XhAzvvD?=
 =?us-ascii?Q?DORNhHRekGwLGbS6XJHxU3pWW8ubKDwG5Ls/9uEgZ1+fZoyd1P7LbkscEHON?=
 =?us-ascii?Q?w26fnpGydkzzwUP4i1ph51vVe1JTXmfapNiiEVIHzjOw1Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Huh41zOQIQ+64SHZD3wy9suF3L/5LGLSP5vcHqHU4RH4GsAPCk42ZpmcL68u?=
 =?us-ascii?Q?vP5PQDfiKtSo09lP81mk+pd0AEpN213YUZNGiO/+x7ixiJIYO+UEg3Alj8DB?=
 =?us-ascii?Q?EKkLdBRhtj3pBBFtrYaNkr31eApHK+aVbh2J7SjJJmLagIJdSIh98E5NA1lh?=
 =?us-ascii?Q?2zA9FAfxnSbam0HICZ3jYkQJqnTcLFzDzXduud0JSxkJ7carIa8R6udMbeGP?=
 =?us-ascii?Q?Eu9zTesY1iiiaXhud1NOhR0D7KcmXS+AvWCOY36LCk8zRpOxrc6rKa2TRc1T?=
 =?us-ascii?Q?2jtRK48O90ijCe8BU7VkAG0seYOHjIQVz8o4Xzd7575jvmZLvZgLaCTL2FXE?=
 =?us-ascii?Q?lkeSmfJCIyHrYcIl0zHX7+V1dxdErMPMvhvE3wXCblw8lo8d3n/1F/z/z06j?=
 =?us-ascii?Q?K81wbEK5YY6RXBWtRVa1byq9IbdAOenZFVZZR+iw+4QCXDq+TNRNnfK3xNtF?=
 =?us-ascii?Q?cHr9+9xSMX9feDIvFKokhqWCLTNesOzNbratrC2pO4BqSkU9TUFkB7F72S8N?=
 =?us-ascii?Q?LDzsBt41FSKewvnHLb8FR3uD1F8RIBRdxMYaPBIrOE6/StDyY0adf++iykfV?=
 =?us-ascii?Q?WD0zm/h287aG1ZIHAcrabfm65Fisvf4o5jDLoudG6+vCdIZwQaABDgYJNkx3?=
 =?us-ascii?Q?dCOk4+dduwwzJ1nDxL2W8GPEqMJmOkjszjalx7EnBB4uwxO3R7RSQ4JU3a97?=
 =?us-ascii?Q?7rqsb2Ky6wsljBzr/+d3gpUDDGuiljv+SDhuzrXMck8dUKC50064gmJaaNWf?=
 =?us-ascii?Q?xq6KmOiJnYf7gSW+PmXQBG7Hvngb9sfjefw8ztZMGIXJ+Jm84PyhyggcbXld?=
 =?us-ascii?Q?1/hyzKqL2xHiFGwJ7ZyqiKuo1Crz5x54Tp6WlXocReH0t4C/9YQ03Xh04jMZ?=
 =?us-ascii?Q?iJ+Ri0MUYgvozWlZEQ+l6fgDKMlPQCLXbKgqPbxClaZr3biaQRGxBypkaR74?=
 =?us-ascii?Q?CszIVk8bKW2OR6LBfTfcZGraR96ZcVUyHi5S5RgthZobDw+llj30hvOqCr9J?=
 =?us-ascii?Q?2WDxaRiU3JbBdPEyKbpK2OBDlmPlRyl+TCbWTWdMSRpLF7N43VBlWWZTPCMY?=
 =?us-ascii?Q?KmRbAPzu3XDnzqwOTq9ouq1SkmPlRSLQJWgwiqELnk0Gd35IFIXyLFDXCxBS?=
 =?us-ascii?Q?Qkcs0bvb5zjaev3c1ESmGAjJu6cPlogkPwz9TImm3tjTOQlmVU6ODQ3oUOvJ?=
 =?us-ascii?Q?5iJOVQuIO/YiWqPv5yWNsjX9YSd6CTod47d7LGj+MrLB6qrTEPom+5ZQ+AMz?=
 =?us-ascii?Q?0THLkLxsp27psjlGXx54ZODkUJZREaiKIotw0mwC3g83kYhSJpvh5E/P3W/G?=
 =?us-ascii?Q?i761vowaAaQLbuJqlMj2gZ35ZK3lJtuhREv8OTAqTmzc5ijbF/G9OcQztehJ?=
 =?us-ascii?Q?g3g6pHDnuVH+0UK5I9aQYyKWqNpG68P5Pg5ALCHPZxCpUQxvT3KZ857+PrmY?=
 =?us-ascii?Q?0AGcJA5K9/s68sAAccNZAEgwyn1um56cViS/HuDDmfCJ2hPc+I7YQ4tDZUeV?=
 =?us-ascii?Q?K2gvB/nFOrp/czbEg5Nn70FGblBHe1UXtLnzdqYM/K60lbfuYoixW8ni9b29?=
 =?us-ascii?Q?+01veGnWu6Lg/j7WIjIjla5S3eaiPVUhv9/a/Jq0gfYfUTE3aa1sUemZmbFM?=
 =?us-ascii?Q?agav5vNJmbCmmy0uPyP4mds=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b276dc4-b719-4491-6d04-08dce1ba3db7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:41:59.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OqZ4Op2eJMLyHcc7FgnL9Oe55wEKfPYfw2OhNz/wYgEmCTNqz3Lnegjo+6sgvzyZEu2DrcBmmcSLdZ178RiPCtYsAClw0gYuSvcVupnCoYgjYrYxRW9w2m91fw5rnAwn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7132
Message-ID-Hash: SXFNM7IRELVBNVLA4QE66SJFMPNTORZN
X-Message-ID-Hash: SXFNM7IRELVBNVLA4QE66SJFMPNTORZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXFNM7IRELVBNVLA4QE66SJFMPNTORZN/>
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
 sound/soc/soc-compress.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e692aa3b8b22..a0c55246f424 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -606,12 +606,19 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		return -ENOMEM;
 
 	if (rtd->dai_link->dynamic) {
+		int playback = 1;
+		int capture  = 1;
+
+		if (rtd->dai_link->capture_only)
+			playback = 0;
+		if (rtd->dai_link->playback_only)
+			capture = 0;
+
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
 		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -624,9 +631,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 
 		rtd->pcm = be_pcm;
 		rtd->fe_compr = 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
-- 
2.43.0

