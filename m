Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EB08D13A3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:06:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DCF686F;
	Tue, 28 May 2024 07:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DCF686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872805;
	bh=RAj+toQ4SADLBgedd/PKIfprcwUVfMEMfxpH2eBRK94=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W3mDS/M/DhS9Ku7yCBt+BhGtb/Sg4wzSnu2slpN6udLR/byFez5XjzWxtlWrJPC7T
	 ogkGNQRAk8LoDnXMI46nzrcd3yrHJl8yLOrzf0CH0cD0A6erFPcJsfiBjEG63SmqcE
	 nS7Kr3c0OFd7KijoIXaKPRfV20rfBoTP9STD9f1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FC0EF80610; Tue, 28 May 2024 07:05:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 959FBF80607;
	Tue, 28 May 2024 07:05:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A21EF805F7; Tue, 28 May 2024 07:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C985DF800E9
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C985DF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IB1uZ2Ao
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c46nvD76dI7ssn0dsGeThKeqnyHU5Ug127FnCVyJasR0wmLrjMuRHRrG79PEeW3/8qbt4aAyz7VSe3mk0vXnVs9egWk19CBILj01oseLR/Ddv7iUmalww+mjfPRDHJbiQZzBmwx1O3iiYnF7BTY2zlEjeewxvtMdjWHFLSQpaNPl9QsClB0tlNUrltwlDTiPMDbIZGOZjwnZvS876OmyyvSIta2MJG+J0ZG3F9Ljv29xUMdZ3+t+RzmZD8GG+s76oljCU1xypIrWVxgwC9M4YrPv/LlYfF5fiLhUTkr40RNV1M+A1gAfO3+xS8//N/lzfJ2CWuNuRp8oEPQZgvK5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYDPWN70id/pqSZTV4B1QGwYc76mIj8P3Zxk5otIMjY=;
 b=WfVeziMdaeuwkBgrkSn1qTN/w+I4aI0s4SI7lBtbY6CW5UohKoO6vkNwRmvHTkeiNk8cR780bylWKw9kqtvwC9aproEyVvGbIGRTjIMVF+e3j1I3ajNqQm9KDXJkkdv9EqJjcT+CtW/AgN0Rqqv2YMbBGQH5GtExgyg5xFru01wPKuB6JXNYtkmuU64JjwXBUgggFOeJxMiPN0kznS94QIW3D6vH5z8MI8/stNj2nn8q7kwUL5pC5IPxwopdenqP0sjJYxA8Jgnig0fdNwJ4q/Bd1LeF3pa5vYcvuBDI1TOpQ9Lj052G61+1UyPgoUm8tfNQNHBrdAFGwoLfCoaxFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYDPWN70id/pqSZTV4B1QGwYc76mIj8P3Zxk5otIMjY=;
 b=IB1uZ2AoZArReyVBifcrMQU2FbgzWh0woq/WhWwypuqTAkiOV5jbJjME0SvPtwa7o+yIfxpzGBVG3qOjqSzqeeg5vXCgvrCpT/3OyIfNSeFhZYwDJb5l5Gw4hJL4Ou61V8s/ZRXtYWhyMhDKOnKUgRLxh5T20tfobVw3bunw3PY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:24 +0000
Message-ID: <877cfeh6gb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/11] ASoC: audio-graph-card2: remove ports node name check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:24 +0000
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2d678c-cd60-40d0-7e81-08dc7ed3c849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hX8mj8EIX3IlRb9bdTdQsqqGhUnFcGVlqVww8mA1s6WhPCTuKplClYrclTJZ?=
 =?us-ascii?Q?e/q64aipjJYJHewISpn/yOHHEsJeWK1ZqMm07XS4KmM4CV1H2AkEgzh5Im6u?=
 =?us-ascii?Q?RATmHYQ6dVGYE4lKqh02aaNAlQwgb0ijy908oXefUuXxdX0Ssofgd8Kjt+ym?=
 =?us-ascii?Q?X++jkYoQpswkdUSGu9g5V11z5NoDEEsBC34Wp+evE8gBpZIlVQ09sqxBwY65?=
 =?us-ascii?Q?44zeCKxHlNMTrAeEzMdbHF/0Cgc5cXlZhuihHn9kb+kaCz+2Qy/UN6NNZCMZ?=
 =?us-ascii?Q?rv6QLG34NTQa9QfIUT3lUhbJfsZJInEQFHHKZ3/umhPemazwUyoXfDO2cnZT?=
 =?us-ascii?Q?GKVv4TmMxDokKMZWotWoZr88kJAekDxX3no3d774CIQRt2i/H8GZKCTNcKZo?=
 =?us-ascii?Q?LVbarthJhoIXubZUpeArs3/C8YpX2pj7Ljb1/3W9xvdDicNPvDh13M6A58hF?=
 =?us-ascii?Q?CprAtY2pO4V4sxG3xvtN3WpwJ9IbEuGROhlk3RGq1hc1nr6wpth+CqHNSvlP?=
 =?us-ascii?Q?R/aTRg4tdGJTM1wCvE0G/+hRKxeEylojGrHzU3ZbmTBTFoOJpZNbKQVXlhNn?=
 =?us-ascii?Q?xzygikuSZhACtkzqLMCTqTjZuVwmu669kFDdroC5A8hkWUHrUpWsTb005KVf?=
 =?us-ascii?Q?S9OCuUQyROxzufdfXVKmYB9+duq5eRr1U9HcMeCO98MRZxLbX2lzZuN1LQua?=
 =?us-ascii?Q?q4TaEJ6wzoSXs8Bn+GFdJmpxoj19aTjVW1o7pbyHUZSm3Ev7CMRw31U0/DYY?=
 =?us-ascii?Q?oiGEJO4lqs8eHHc6dW8A4MUTbPrLVMlaOEyC0gKtL4VFoTUnf+MXBHNhDvIc?=
 =?us-ascii?Q?B4B+ZzQPcl3N6ABYtFBqaf0aOMdaQEuHle7w2UFqadP1u5kvuqS9WFZTTGpM?=
 =?us-ascii?Q?lC8SF5TwrsRXDewOISScj36+3Jk39baPmMKjJlCQDupmmUgXlSgf4ZBeDOnj?=
 =?us-ascii?Q?SYAcKv5hJcrxBOB//3icfdVq1524R6xbSj3twD0H6aQMp/P8Oc8jlnwuBfta?=
 =?us-ascii?Q?FFdGTXIh3wD9t4d3kYEDP7CnVFKgafhjP4L2F+6hKIf7xzX44j59Yr51R7eo?=
 =?us-ascii?Q?nDeVKeeIWtDia3f3MaY8A0sZbw5k6LqSjh6G742ts+zpndMXUOA8Ndn8TCtY?=
 =?us-ascii?Q?szHRw1l1MOMiWHOihHi9vty2B7xTB8Ze+S7dYuPQkdQ1ZMVlRKXPDoHeW/1v?=
 =?us-ascii?Q?PTb5Jpyk558zxZcUhUxUdfRpfWLGH8ebO+fX8VpNDCMQvVyhL6JQAP79cuk3?=
 =?us-ascii?Q?hmlUXa/yPFU6NuaWp5RWBhBPMYE9qRk/gWj2GsPkomq8Py53PB4oLpVYZhG2?=
 =?us-ascii?Q?/83uGOw3zJFxweSzzx1k8Obg+nl3zBGE4OsPA5QxFYjyMA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i6J/2KK0znUli36f8rjF/A+Wcv0ZUn6xPij7MhDkbWCYuTz0xv02cW56It2r?=
 =?us-ascii?Q?3m+s280W97FQySmyCfOmSir2rS+020NpgCJKbd+ie3QaoFjcsGSZ0dwzuT5I?=
 =?us-ascii?Q?n91bV/d/8dcmbpO6dVswW5FOtP4D6c/hSzdf1BA1eaud4qrSd6cGBDh9J0jd?=
 =?us-ascii?Q?P5Dt2oZ31Hd7YtdsthVAGuWpAAtWEGzAiD6BuH9nlX7re85KzkmgY9AYx2t1?=
 =?us-ascii?Q?XF9fUPGkgln12eq3zH75jPkxfZQCHHHRe/orvYhcMWQms1sbUxrrYerv29YG?=
 =?us-ascii?Q?uorzX3ZEbqVP4Dw+Mz3FJSFerlLaIyL2YEEGfU3bin2EFNANczesRcDtg3+4?=
 =?us-ascii?Q?UKc00ZXtOsKi9/pfqflWRnrEQYInpdlp5A1hLJ6m2u1l0x6hqKSfCxwjHyPC?=
 =?us-ascii?Q?0oXTDU8KG2Q9Gy4jkzHHuFKgImpLARm6Vi68LnQoFQSrbkqzR1/YW5ux/hQ5?=
 =?us-ascii?Q?AbRHQvHC5ba4Sdxr2s+QDqMAcjZtIZCZEhCYB5/B8hNbdpQmfnGk9G/IuEce?=
 =?us-ascii?Q?8bxzsbctGRGTTlJB0W3KwRl8DI5Tc5/5JJ50DFDKq2YmyPIMGnUSYnD/wtst?=
 =?us-ascii?Q?FVS1nb9tKI/NGI8Qqd60k+ojMsyroQY4oFZG5pQyd7JdmWcuXuuEspubX0wx?=
 =?us-ascii?Q?3FOfoDJaFoB9zff7Z9c20KFn8nLDe/qgLrW5rm6loZOWw+sDL95oiKac3Jhs?=
 =?us-ascii?Q?mVqcSzI/l/vxCf1mP9up0VSPNMfAIq3Z9P59h+fQ7NxBhXHtVyMelk0BCWgz?=
 =?us-ascii?Q?b03rWOdaFbKZo4AZW6pI+v7+N4AyC6fBkubR1tsQ4vXClRzPSgx9qGancbpc?=
 =?us-ascii?Q?3L6NAubUwYZPCKdIiI+p5+30CjbqPHGSdaLpi6eDPht09qD+vLTMvLhl2Jwy?=
 =?us-ascii?Q?e3yV0v7gJubNO7V/U4HFthGPRGZrKVu+reTDYHA4Y0Qxi0TBtd2kU/dAqo81?=
 =?us-ascii?Q?j90xsXCO4rm75871pnsl01IJjU0XE0nwCsxbx0gmelbi5e6RIX/Qwa0Am26w?=
 =?us-ascii?Q?Caud3lox9N7D33t9qXxRwPvsNxZPqYgz1On2IlcV5PtZq2X9AdI119aPShCp?=
 =?us-ascii?Q?PywrxsMRcczNoNyPrUaDc7TfAwTyZHWeG/zBlXUzicLarNUfqMCJbXWLOg/U?=
 =?us-ascii?Q?/QA2sIZQowi83CWSEO31y54ib8aCgFoW3jdE9p926khTqg6582B7RdK4C10I?=
 =?us-ascii?Q?85p+aeBkw9jPKXnfIh+VRP1jA85PVqfXcr4OcVUso5WRfuyZTMAAek1FcB/g?=
 =?us-ascii?Q?TZy7Qj95Rh1q+KV8sdxOJpe/t+6KnW5EwCPjONUyZDttfrEA91swsyh43bUg?=
 =?us-ascii?Q?sVl3lqx5zCIhxQmMfWk6mLqbb9FTaGwYEFhkM4tEYTEhWZQPmcSZgpn8XgNf?=
 =?us-ascii?Q?jTuecFi9u+uktVJo2tjMNO6lIhoBJZwbPkCsIJVoiLlpGo6C7+dSVHTbgk/H?=
 =?us-ascii?Q?VHvFXDCs2TYdKf+YQ4yHLt+mJ/AcRGgCUh1TYGUkJcUY0KhMbGIuIrh/eXs6?=
 =?us-ascii?Q?XItTjNQKZV078iAgvyee8ylxnGxphxPzHj/zHSntVPAcWCxxExg0eerGuFRa?=
 =?us-ascii?Q?H+dmWnTHABi9ZdwHz6hhb5C/BVsAsq8BRuFh6A3tlx5r3PZ+LThIi8Wxje8O?=
 =?us-ascii?Q?B7bKHW8GncfOBjbl1vFb+iw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ae2d678c-cd60-40d0-7e81-08dc7ed3c849
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:24.4091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Cl6Tyxu2U8ERpWuIuj5t9RIbMd+RyZi9S8tmWIkeiLtAS6TdfQizLSO/6PrDwAX5CxTO8l6SdR54BhVcYp0Dn6evaYpeyB1//tuSPbCsrutdFw0vvjTpoC+OKaiMPouR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: JL27J4YSR26GVDMB6FIDHERQ6ANV7AUH
X-Message-ID-Hash: JL27J4YSR26GVDMB6FIDHERQ6ANV7AUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JL27J4YSR26GVDMB6FIDHERQ6ANV7AUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current audio-graph-card2 is checking if the node name was "ports" or
not when parsing the property.

	if (of_node_name_eq(ports, "ports"))
		of_xxx(ports, ...);

Now, it is using new port_to_ports() which will be NULL if the node
doesn't have "ports", and each of_xxx functions will do nothing if
node was NULL.
Now we don't need to check ports node name. Let's remove and cleanup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 15 +++++++--------
 sound/soc/generic/simple-card-utils.c |  3 +++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 58123fbc29046..3029e8ebfa222 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -381,8 +381,7 @@ static void graph_parse_convert(struct device_node *ep,
 	struct device_node *ports = port_to_ports(port);
 	struct simple_util_data *adata = &props->adata;
 
-	if (of_node_name_eq(ports, "ports"))
-		simple_util_parse_convert(ports, NULL, adata);
+	simple_util_parse_convert(ports, NULL, adata);
 	simple_util_parse_convert(port, NULL, adata);
 	simple_util_parse_convert(ep,   NULL, adata);
 
@@ -396,8 +395,7 @@ static void graph_parse_mclk_fs(struct device_node *ep,
 	struct device_node *port	= ep_to_port(ep);
 	struct device_node *ports	= port_to_ports(port);
 
-	if (of_node_name_eq(ports, "ports"))
-		of_property_read_u32(ports, "mclk-fs", &props->mclk_fs);
+	of_property_read_u32(ports,	"mclk-fs", &props->mclk_fs);
 	of_property_read_u32(port,	"mclk-fs", &props->mclk_fs);
 	of_property_read_u32(ep,	"mclk-fs", &props->mclk_fs);
 
@@ -496,8 +494,7 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 		struct device_node *rport  = ep_to_port(ep);
 		struct device_node *rports = port_to_ports(rport);
 
-		if (of_node_name_eq(rports, "ports"))
-			snd_soc_of_parse_node_prefix(rports, cconf, codecs->of_node, "prefix");
+		snd_soc_of_parse_node_prefix(rports, cconf, codecs->of_node, "prefix");
 		snd_soc_of_parse_node_prefix(rport,  cconf, codecs->of_node, "prefix");
 
 		of_node_put(rport);
@@ -717,6 +714,9 @@ static void graph_parse_daifmt(struct device_node *node,
 {
 	unsigned int fmt;
 
+	if (!node)
+		return;
+
 	/*
 	 * see also above "daifmt" explanation
 	 * and samples.
@@ -798,8 +798,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 	 */
 	graph_parse_daifmt(ep,    &daifmt, &bit_frame);		/* (C) */
 	graph_parse_daifmt(port,  &daifmt, &bit_frame);		/* (B) */
-	if (of_node_name_eq(ports, "ports"))
-		graph_parse_daifmt(ports, &daifmt, &bit_frame);	/* (A) */
+	graph_parse_daifmt(ports, &daifmt, &bit_frame);		/* (A) */
 
 	/*
 	 * convert bit_frame
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 17718c58793d2..7ebf59a03e698 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -46,6 +46,9 @@ void simple_util_parse_convert(struct device_node *np,
 {
 	char prop[128];
 
+	if (!np)
+		return;
+
 	if (!prefix)
 		prefix = "";
 
-- 
2.43.0

