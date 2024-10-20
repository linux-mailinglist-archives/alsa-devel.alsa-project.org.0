Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4899A5792
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ABD5A4D;
	Mon, 21 Oct 2024 02:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ABD5A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468868;
	bh=n7fERorHze2JmC+6AyjZBH0qej2nC8phi50bjVYRW4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YNPg4QtTjoBOp6TC0tkpkeeXT44QTID3jq5r3w/OVGRXeRaysm2wZj5wenUlMTons
	 4N3VDHdHtZCg4IQ+ilIidg498TpTgTE3jED1W9g/Wl05V11EQEBiu4cRMijrE6u3EZ
	 SXs2FV9625vM65CbK7+IQbOuPhPVDN+9zz8FJpBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06562F80691; Mon, 21 Oct 2024 01:59:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05E71F8069C;
	Mon, 21 Oct 2024 01:59:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42057F80588; Mon, 21 Oct 2024 01:59:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D299F805A1
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D299F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=juHFNwzg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZv3n+1yaBCWYLfY6MEdGRPWclwKBriXGDhwL/H0g07ab/U1akCHYciqOGa04VwSqA/vIhiAdB7x3N9D2CaLeGWRdPW0OvNlvlcDEcMUWyuKomByPG/lGDVoqcnCKsWygrAjX4Y/MHV50KkKog20eSKB8YcnvdFdvNdjOCER1O1p1SzIgMq2QT8/dpv+/wo4sWZ7nEMnbt+To8NJy00oqHg+yhj20uQl0HcIP2P+1B356wtzUEawcb39Xi37EZn2r86cYYBOhurX83hcsXf0eE4LFFQiMMPRHOkelY4qdkBljxOavmTOVm7P8SdfHYDWWNMiHBYSt1m2IcAvG80hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQbtWGqjWwJrlbSHrPG6x4hwYFF+NyLgnSgjClQ7fyo=;
 b=guBSSIy9QrhlD391jhwdpOMZFDfZ7r1Mx+pyJBlZSPCfFc8c0/uokdzJPeLmL3JWulFwlyrCaRm+MTM4EIOQSJLh/s2E9Hghnro9uudt/mmOfXcYyZaF7VLDN9jCXJKxTtjDNyDM37qXhcMz2MPDSdBTxUg9F3Qrd02H7NubYmz+8ljKf9mgQOOwy9f9xqF9ythRPNrRPAwJ3wybkXTbDRHS/nq/uXBtbQTXTnDxAg2G1dWuA9iJytK/NL1wAX908Phleo12GXoGpQuyuBiztoSXsWjRPR/093hm8nVyn9UMxtt8o/ko1yarm0n2GltHC5X9KmQoTtyV7MjyGnlcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQbtWGqjWwJrlbSHrPG6x4hwYFF+NyLgnSgjClQ7fyo=;
 b=juHFNwzgv6zWf9FMDn823ubNwVWetjsR6F9rdxTUK62mWdwBVnknHR8ukpnDWxLgpJ8kPC6BMliqfi+W/FIDCCkiXWObPpTa+WsqxEgI1xrDUyDf5mzDoC3cMcqvmUFTkCRJFcPuRgy9yRmqP791NfbPPQKMtGZ4okHmANMWaUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:59:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:59:15 +0000
Message-ID: <87bjze9vhp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 07/13] ASoC: soc-core: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:59:14 +0000
X-ClientProxiedBy: TYAPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f9ba41-efaf-4382-49d5-08dcf163339a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?21N2EMTJWDHTmJQQXW7o+cYNLOMM0p5ZFSYs7hpho3L047dPqRdVWKIMc40L?=
 =?us-ascii?Q?ShAkKyAr1GDEdWr8jV2ggS1kMoYAZto8OcQnquN5CJ/XBTcryBRWl7QIR1Fi?=
 =?us-ascii?Q?5YZVugVPeUAYE8R4Gdi3MCoFfAfPMWXrjJgk0MlCRq2dBCmcw0hwM5LB3K/v?=
 =?us-ascii?Q?6ovI7Qw44DQZSuGneZd6T9lzgHKD7nnVn2PkXXd6ctOhoiBlzOPfAW6Nq02g?=
 =?us-ascii?Q?i3EoRq1zmj89TE94I6qmJeemN/C3qSwfQL7mwDSezBNiCtHtJqOkQTSzWRCm?=
 =?us-ascii?Q?6XqaEFDmuC1VHMXFcMh5L9Fzg3SaQXjIysJnY1GvKHZoFt3IEdjSnp8gcuk0?=
 =?us-ascii?Q?xukuJe89iMokwVcwB7GsJV1ycMfFa501SZLujY7LcZz5uTVGx4vcKaz9DyTk?=
 =?us-ascii?Q?kljiB2dU9Dw8OdJioJooPJp/4CCaRpXqE2BeBTv3B/zfEEToevDheCoFgJG3?=
 =?us-ascii?Q?gUVzp8nhxZpNjqeAEaGCimYGUBDxbbRYdy3a06qX/30ndecF/88TsT5XF45k?=
 =?us-ascii?Q?5OU+FJr1xJGYrHXNg07yDm4BO7A7H1+ndVd8Hv50nIyskUEQlKh5aPxNAmn9?=
 =?us-ascii?Q?fZBwzsWpiS+8VP4EDjaH5q5HxyWaFuZ5BS8452w6OV2ehGU3Lhu22x2Ophu3?=
 =?us-ascii?Q?o1XRljhIyQAmG+d/NI4D2woBA0FKVhnk6B8juCA9FXKvrBbCqAHiydOCaWAf?=
 =?us-ascii?Q?nHco46jpwuLmMN0XdTo4tmD2ULA+Ps0ZTR1E3e2nxA+5S1bSYDLyaTNfZZNU?=
 =?us-ascii?Q?Z1AB8AXAzr92ttGQ4As7Qx6z6MgEGYd4jCX82QxvYNRvLtyluX8/RWSdEQrC?=
 =?us-ascii?Q?/MfLnvSiqImsdKcIxxfDYpAev14J6aDZPjS14ePpfQhRQrxT5CqUytAPEOZY?=
 =?us-ascii?Q?LQpUvHXhpVojcHT9E4/Neorgi6EdNrP/u+1Iq6cwSoeSMX8/84hYTbUyigi0?=
 =?us-ascii?Q?07eDfWHVZgMCGXIg/InpAhClgR0FHpsew+b5ruueRLKZePGIowJQ8KQEsLmv?=
 =?us-ascii?Q?LOhgI+ADfyUFsCI4kEp9PE3q9yk10tS6xm+0SiQFRr62y2yuRgClZuZF7kKq?=
 =?us-ascii?Q?nr5cEBEhHIBRm2qVr0XxbcX8LGpsijWIf46+6Gtjdv7fNaHzvqCRX0AZ1s3q?=
 =?us-ascii?Q?1pe1EwMcRFFbHbFA4pgEAjqMqVqqXUxDlZs3yd6ohar1mGSuzuid55d3nysl?=
 =?us-ascii?Q?ffrACPzTVj2grFEIrU6arwcS6srypYCa3Q/hiUgxN70Ps+nkuAu79uGt0qdZ?=
 =?us-ascii?Q?TUE8524tCkHGlqcsTOkokvG1ID6leKbfdNoAoV34989vPw8LOdTLIBTYUTZh?=
 =?us-ascii?Q?EKkI8fpbQAssgVUHpWjw6ElRn6JB05GOVtZxibKv13U7QO+3oxsWvr/FjFMw?=
 =?us-ascii?Q?wHLgh7Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gpt3xP2hJZq/SfN5acDnG+ovH0an37BkOcHg/Iuv2zUw7wQatyRIN3Tf27qQ?=
 =?us-ascii?Q?JSTp1JzvIQKvO5+vlYmHZkZyBCJz8E1p6MvJe5x0tx5ELh0yKPJXdQ1nmd7b?=
 =?us-ascii?Q?wPirwNi7tra2vbKubEcN+ehscz5uWiEs7KQBJUfOsg/kgQ7mJr276KBbt3BU?=
 =?us-ascii?Q?Yn/rj7PwPDI+8OzQqON8SEiyjhX70Cte5i3hmkcYjLyCf0CVRnWrpmTpHH3F?=
 =?us-ascii?Q?AgXwnKne4xt1DDV7kEDXlbQ0jUXCfM5OvryH1hzVg3tFS7g389nYjniknZRW?=
 =?us-ascii?Q?pdAYbRLFhtBpUXrwunUzxluuOv09j22YPLk05PhVZCD7DB3DQwECsvsgnKEa?=
 =?us-ascii?Q?CBdoBSIjJIHKEP2md+YUSM6m4xFhwOlchwglx5lkI56oB0xb0zFQGM6uy00M?=
 =?us-ascii?Q?xb8/g8T//lP21TfOc9MfJwda+MHS144F1+++9jZ5WD9h/btmDjz2N3cxWTcG?=
 =?us-ascii?Q?m4X+sA2b7be2avZzGAKJnHGCcKdVRW0yKF3HtTarV4ZH/kdxVzWh6nvPpKx9?=
 =?us-ascii?Q?qZCgkssQ4KI48R75OUg0gjCax41VH56lOp/gXQ+u0s8Ddz8v+Jnfubqike93?=
 =?us-ascii?Q?y+XkY4yhyPcz9d5qRZx0U4CU8+OjICuitWV+f2RgkEgoYSnQVoqBGwKflfdz?=
 =?us-ascii?Q?SDHnCfjGOM3oME/sNFs0U3s4yH3BG1Zc4tVEOh9tE2/Zk21KPLSl6w1EHhjy?=
 =?us-ascii?Q?A3VHPrRzOrkYf+d1EnXZqjeoy/bvEPEaMD/4/+vaxaZofohHLMAvetlYSuVb?=
 =?us-ascii?Q?ztQY5P9JlqZigEg7IxDWpLMI0V0s3y7GpYKZPAMrg1UMYIzd+8YsVWtDRC5U?=
 =?us-ascii?Q?vwim6A4jF+PVDHecavClOQC2xGm6oyUL43cgVKNVzbcHyJ9gOFwAMM84OOFc?=
 =?us-ascii?Q?ok6QXyoyejTfPYB0/qWWHkgE3ggoNjee6zbyPAyrHQu1IOS/X5xGfBVWwPQ5?=
 =?us-ascii?Q?VGERV3m47eXt/EazZa4goKPXL9uZm9osweUA1viBPstZV+99vLBzzExMIu3r?=
 =?us-ascii?Q?We2AGQWKU48ahyNFhJq3kJfAMxZeUNpZFOeVKuGAwtvY+tK/wMKRWbmPjOXE?=
 =?us-ascii?Q?IQZaTgYZWmfr3Q5bByh3/4rhFbnH3SoQivbofF+DYF66t3xbVcV4mQ7NmAFo?=
 =?us-ascii?Q?NycF/T8+QPYmvm5HMKGFVeea9W6I1i0TJuQkNwIZQ/u8DBOoU8BAYDaTBa/s?=
 =?us-ascii?Q?i7/PRz7t7CCn2HBqqaC55w0FdkDhufjP03BfO8joft9QvGZdbu7bqAMrlDEo?=
 =?us-ascii?Q?XMHSkaQbFxgu4xen2cyskCZk0f8D5iL0vWid13A+J3CKVAYsMsr9JdLqbpD1?=
 =?us-ascii?Q?1D6LogUM1LINfEE1kzH7h8XnN4/zRSR74bDdjtvQrvTZ5scgXAozjnlsJ5mj?=
 =?us-ascii?Q?+P90eHypELpaMaG/zq0pgBWdcnMyiAkLN6VRjniEx5npTKUwpiST1aB/U+BN?=
 =?us-ascii?Q?Gjr5LpbcEQdYUB3g7DfmTlo/OrVtdWfLfXnWsdbwKE9kukApQK1N+EG9l2to?=
 =?us-ascii?Q?cEurKquVDXht8wWNEjolfazhu+pyLCQxoT8wcQSlLgO+vKAKHOhre3ve2ppg?=
 =?us-ascii?Q?F+DAwNhTwNmWeAXeExJvkeR2hL4lTKP9JoRl/NcyPwq0qQirNeSWIC/zA6C/?=
 =?us-ascii?Q?SVHDv9qLM+6QFP3udUJ3W+g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 75f9ba41-efaf-4382-49d5-08dcf163339a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:59:15.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JqOMOElzXLgrBNYm/XyuhO7mY1qVhsIZqoKX6Bkg6ZyzLkNDMU0yGvXFBG5rTxnW+3sYcEQZQTESUCLJeBLL3NFUJSkpEW2pLzedY3pStzODVztJEhPzk8XAY/HMvj4J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: C3HFLEXU3ODYFAVRYIL2S7PBWECMKHZB
X-Message-ID-Hash: C3HFLEXU3ODYFAVRYIL2S7PBWECMKHZB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3HFLEXU3ODYFAVRYIL2S7PBWECMKHZB/>
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

