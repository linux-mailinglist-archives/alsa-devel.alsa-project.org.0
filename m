Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6954B9869D0
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D64F684D;
	Thu, 26 Sep 2024 01:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D64F684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307723;
	bh=G6O3FbFLkZiAkNzy3cz47yXID6ka4yLo1YV64oO7Gw0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u9Fr27OsaJg/0j7fI8IY15nRswATUyXdtr1xqc8jeCSdMkvxa8ypP5JL9CarDqlIS
	 15jokxp4bzPzV5OykD7f+J1hEO6exffuC6rsuNaxO3FK4pRwfpdx9bmQ61oxe+k/Fq
	 LNJedrfQDqXVLMW6p7S1uim2w3fkYMim/q80uJEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D87E3F80630; Thu, 26 Sep 2024 01:40:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D352F80641;
	Thu, 26 Sep 2024 01:40:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4449F805A9; Thu, 26 Sep 2024 01:40:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D58B2F80518
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D58B2F80518
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=N0BA0pSY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvOzUSM6GrFzpy/ovLbH9c0OA0XhuG5Enn+rlvGSGkWGaWMQjZj/IgJhLY0O/cm0wL3o86I0KJnkiCTcfYrtCLuLqB3Q6qogN4Lt6r2eCCcCnJPcIoB4SJo3j1SO9JliPNRaczUMGBDbjfz6EQz683cufS7LJWXYX0/9MUA7tpRZ6AEb+QxSpaqemKw1KDMtZ3zesjwW62NGsXeCG+Qov/8XKd1pEJs0KY7qoYZC2JgNmq/Uv21f94Sf3gyQF6BYc/J9NNVD4uhjVNU9Uh22vjEKV6s10nXUPQRUWqATrd9T+NWqzomS8HcQUf1PrDKioC5WjdVQV6F3axl6aOO4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFI9/tZ+iCX79zEhF0xVSCFczVQqTc/RxNEUXk7rTOM=;
 b=Ny7esTQ7AZ8Tsps+hiZMEALHbMR22hEbtqpz5oHRlXav7Gj/gV9wVEMDrygQV0s9yS4fJwTWF/LJA32oB6CB5ZCk8CMbpsg75URL7hsaOhLmtxqqW/SAbRYdiqQuJsfF5IJDj07FF4rl7a3gBbLuSVzn/lu90KxlIR5EcUKJMV1scmqMSi3W4NTNWAKhIIHYJkp4kQ1EnhYfaFpzn0JE111J9y8S1uEK73BXmBZmhGv3ufhN+bB26FS5oNmzTo+lWFnXxNoH5zLt0a0yQsGq2jBa04ubeTAIv43FCqhjWvZ45WUslRDzmcmVxIbfZO1mRBE6wSFk9orKV7lW0zjq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFI9/tZ+iCX79zEhF0xVSCFczVQqTc/RxNEUXk7rTOM=;
 b=N0BA0pSYJ2T6W4qqvP3T2bgWR9iEneWJQWMjSzOTKOFdFJTcrAlok4FfbXnHN4OFq4r30wc65BAe2SVxMW2VTNIlY7bU2jsgbc+rsYr4i0jzne1JBL7kYPsc7axjafMu/CQQ2/v0z5HmAdtqP9BrelcPgsbTQeifbSKxR/T2cFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5759.jpnprd01.prod.outlook.com
 (2603:1096:400:41::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 23:40:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:40:13 +0000
Message-ID: <87bk0b9uaq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/13] ASoC: soc-pcm: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:40:13 +0000
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: 8392c0c5-b6b7-4b4d-39f6-08dcddbb66e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K7Av2jK5wfLUaIaXEVQgfCFWyl3hoxyAoVsbGO0GGY6jnNy5KKvcEhOzYcud?=
 =?us-ascii?Q?aeiA5jrICJ7uSxOgdHsDAi3zBcrirJBHAljKCpJPKB9lu5EG+zoj/tPnWEvd?=
 =?us-ascii?Q?85OBAEBTOKHp+ijWt4K2Hbmo1dX0pQ1VlstvLv0zXzxClBq7EYDge4Cbru4m?=
 =?us-ascii?Q?DqFh8yix2U7WWFjx81YasF0azVdpWYpn6dWvhnke2v2LBbGN+oSoC3B69BWE?=
 =?us-ascii?Q?iybCGi0tbbSLkk2I8X23sfSqppz8ZaRlJ6r+M5oeoc2jXp5KPDYdvK4RYlli?=
 =?us-ascii?Q?JYl4/TmGs3VqR48yYvelj/oBCafdPii79Fgp9VgMBll7NQpHeGYipTUzs8IQ?=
 =?us-ascii?Q?UfBZP09HjZU2522UCvUaKVYgvAYpHEMFSA2xmfHp44qqd9z/aqp8Qdj6t1Ob?=
 =?us-ascii?Q?YQ3/nWxlibNbHk/qvXGdAvrLGhuAZO1yDMg8nrHts+SnwZMUmGTGGQaVT69i?=
 =?us-ascii?Q?CB/YCg+hYmICA45rLJ4FBy6h2Sv1024OcwPD9ttJZqnO65mjf2GGqyq0s1Sd?=
 =?us-ascii?Q?prT14rSmzx3yik7CR/gABJgWdWQeU+pbB5AzrV3aSKcwl7Jdqi7m+XzEYC9b?=
 =?us-ascii?Q?x7nsRn2++MrCt2b9XtRG4g67QJBsStMez0CkH6cgY3EtgBVUMIwZ6yERT7Lo?=
 =?us-ascii?Q?M3gO7GfqOAb7n7rC5h7OT8fkYuttyPInzB2yCGW89dOtF3U11IuCcWcl3uku?=
 =?us-ascii?Q?gky8sQZLVFyCrGfOPY2+KpP0XVIJqE8N3hnYHE9aquVkcpjuvUtBpSDfX2fl?=
 =?us-ascii?Q?I30NETuyRnuUt7oBDvLFOts3AN1OpEqoVIERZXsATVgiMr/rmh2u1sFqpAik?=
 =?us-ascii?Q?IBopfqACirCVhsk5WHtBlLM4g0w/voFJw0oY6WyrT5+OhJKRpo+sDN1C/Llh?=
 =?us-ascii?Q?mpsGs6MxDA0F1KIsffKyvQsI4A0dK9LNAok/vSkc+X6iuzE572SneWcPqmLr?=
 =?us-ascii?Q?n+3Lu9LLlnNvK6N/b1HY/DjzFf5rhg89l6RhwJoU6ImCsjSA80jBW97qwNPW?=
 =?us-ascii?Q?kT7YjSYR27F2dv3I5Kj5rmfqLFNtnAcHNrSutvERHettZAOnvNEVi5MLdD5d?=
 =?us-ascii?Q?v01fZeMV92yjL2aSzzqqATiLl86S7cNs+qGPiNHfrx21zuKbCPowri2RBxCK?=
 =?us-ascii?Q?XuUip/eSeCl1g5UUlcefQXBghH7dXSNre2cZc3C20vMaWpzEbZBgcqOFcFb0?=
 =?us-ascii?Q?Gzil6wjqYk71byOMPD9a9Frk3fXp4tENMaZFpVA3OC7L0XHgUUPTzAeNN5xD?=
 =?us-ascii?Q?kHUYI2VC5imiAT/ofPprEYHjku6Rsr1dIUEJqWzjQwE+W4pUadhdPqx4J99Z?=
 =?us-ascii?Q?VFow153gvOpj5dg+l6yyDye6GJrIfesU4K7TINExaXhkow=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4y/hgieXCenN3eEC7MOowx55l8fpUCXQT1wW+bRY5fyRnnUovqD2SVPotDPK?=
 =?us-ascii?Q?YpOEa3Y5hBW3o6KQzHiNlNe6mWShPyLtDg0HpyS+dk26iFEiLdt7BomviDtW?=
 =?us-ascii?Q?wClqkSIDuX0jYkunXv/k4Z4nVmustIzuldnVsEET/S6qzSCauBPEI1jvytxY?=
 =?us-ascii?Q?nwQKbi2iMci0mmKC1TO2etCX2XBwtgILqIN+p0JI7+NyIhpc6XhbygjyMpK3?=
 =?us-ascii?Q?hy+sztIrvEFhUMTDdKjPHtm3vsubjVrs20ZNxV60YfGCwAm5y9DP9ZqROz4c?=
 =?us-ascii?Q?DsI/jCNaBF6ITXGNHl+lyIylyAxQ0ulqH34JZqpdEA+XXbNHD2KFfxvdpBkN?=
 =?us-ascii?Q?bobWL+u4M/w0le3EbviNG5uTPxWPX3+qpLGysJt1Lqe6LmDWWm5mO6J8mp9r?=
 =?us-ascii?Q?dxETY4NtXZBcDL0ihiJ+94RiFvoaLtJ4NTQd6lOsfVqLn7JOU/Me5k5WMNPO?=
 =?us-ascii?Q?cyUFMqK1FuZQoetQNGGiMt3MUDixa32Os0IvfDEhksH5NwqbtAAAPx1QEdKN?=
 =?us-ascii?Q?b2dL2VEFI9WXJiuyqRcluI9pkFL4Sl/0Y+nBk9E4aCOm49Vt2iecgzv7gMkg?=
 =?us-ascii?Q?3xmCtcYIqxc3ZqBaH9MGtITS3FknzgS7tZsrhdjSRMQg4tpU4lk/bCbaFjXL?=
 =?us-ascii?Q?flteyUeEOOO/515FILH3CsnaSGt+FxO8+dPg8GxiEMBhKp0LSaojQRXrL4lM?=
 =?us-ascii?Q?Lwdn+ikG6tczSOhWx9wSXI4UEvxXmLgZhzO7/AZhueZArW+aOuQzyJGO9t1V?=
 =?us-ascii?Q?zS1nOiHohjJ8iEnD+X6BacGODNwTe8kPWWGi4LYNh4kgx22tTQd0S3g/LmyO?=
 =?us-ascii?Q?D35OLm7054HqvpBQjm6ILdomehcQuwhVGNaTQf38CKudb2Lic89vpB3EBlay?=
 =?us-ascii?Q?SYpYDawreLPikh4mJ+dqCthUBGTlqgDHY+RVizJnl3EDI0fYvL4BaUAivDFb?=
 =?us-ascii?Q?MFc0y8SXdJhbjHoMG2xgBQ01qwJgWJvK4lNxYkxyyB5L5ILRodhlyih6gQgX?=
 =?us-ascii?Q?7tuH2sskrGXRlLufEtD0m+ljZZCzmVQPsbQ/FNSl5JXeyhDoJjye3jF+qkUW?=
 =?us-ascii?Q?iuOxbrtXr3PKWhlwKNn0j7l7MXOzt0oMUz8iFqEdjht/cr3m8HOSQJZYRqJx?=
 =?us-ascii?Q?YRIEvCM4bX60BBtZgoihOfi9LCCLykw8eGgWs6sFap5WvvE8vELvxYnm9fzR?=
 =?us-ascii?Q?ynRqn1Tc5mvW6GC1VBzwjOqvcSoYSdRU7qcwUJAKrkAc3dlbyhtpKTa5OTP5?=
 =?us-ascii?Q?O53GT3n+pbECHs3yxhsGATgJU9Kqm0+2elUl2XkFdNz6Dn6SBPlHci5zTULX?=
 =?us-ascii?Q?SfLJ3CB2+P40aP+mRgcOxE0ry/XSxw2wK3cEhYbKBkr1RCN/tUT22YW2uE17?=
 =?us-ascii?Q?c6NRQcdFFr/NP9zLCvXW+haIC8aBj2vkGbAsYrnt168RnmTseH2/ehRhO+8P?=
 =?us-ascii?Q?C+VLUaTCD4rcxvABOtIKrQHhy7xj8Xd6LLRoxKvy3FTMOHXFxVp7pqwiGsYl?=
 =?us-ascii?Q?aFaCvE9PelNSfCAP912oG6VrxIa0dbOSx1LUqyyGGatnRjoJKir/G1AO9SZn?=
 =?us-ascii?Q?U768SAndnspktIxy0gj3d3Ny+fmLHciY8n9ReTaVlEHkh5F9C261weuFokwX?=
 =?us-ascii?Q?gFlMQuyxTwIjnJvgH2kNUiE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8392c0c5-b6b7-4b4d-39f6-08dcddbb66e6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:40:13.5812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 x+ElTokUVnlcmKY6tp66cvUTrVKpLLvtrQvkCQ5ANGdQtHldVABY9PppsX7f7xKF5pYQto3cD43codPDgFFqRRbBDqKfhiPbFJzabjyxQbuiB1WcQVf1LCH5yhpjcwvK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5759
Message-ID-Hash: XKOXPHHJLG5X4Z73ZXYL36RDM6ZXNDQM
X-Message-ID-Hash: XKOXPHHJLG5X4Z73ZXYL36RDM6ZXNDQM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKOXPHHJLG5X4Z73ZXYL36RDM6ZXNDQM/>
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

