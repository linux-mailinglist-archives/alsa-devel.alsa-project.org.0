Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1E498B1E7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:45:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355C2B65;
	Tue,  1 Oct 2024 03:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355C2B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727747136;
	bh=xb40GE4ajuBx0Q+Lh6Rs3kC93iVnTmUTeCWComJQmyY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q6Z6JOmbX46OSSW2XX67adf1CGyPwgri5cSOVxfgRMvrsJIFU1VxfqQhCBx7vG0Pp
	 +/1c41Rh0C3103Mki57XgYMduG7CqPWZarCBxv3iutYlgISxLeZpOR7OrXB/Uynn7N
	 VHVd2KVBeIsk7ccV3ejbRm4DXoCqfGBpPiNuP9mU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8BB9F80798; Tue,  1 Oct 2024 03:42:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19E54F807D0;
	Tue,  1 Oct 2024 03:42:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A294F80722; Tue,  1 Oct 2024 03:42:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 58118F80765
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58118F80765
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UnLw2XjN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tubCZQaZCCa6MWRGU3zdKqqud8rPz/JQe1lr/bDfUAxTQKihhs/A8lclaPBeAbOJE9gUnxQhrPd94eG8i9z3/91tHmwTywjcmtD+Pu5l73ghRaV4z1NKggwM8CcSrGZSPS3Fvy94rC41VdSk7bIZIhBqiHQVwOPkaqFMlU7wKEj+qQorLUouXm8lnKNGHx2/QK1u5Tz5ordaH5qHOhKY9thVRlSjyiM9FlvM8QW3zUdj0VtlapIWDsqYVPv5IE1VCPwBgcpHNm86h8EKZm8t6jnYzMLpl1alRiVGMiY0IFKVK6V3XF0WLCT0Qtmcztc6QcIUN52WPcC7kCISdTrbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8k3g/Pk3Ze3aGPoPh8cjDldyCPXvXbnICn1bCHpVcg=;
 b=mkiEmWY3ntagoDXpF76II0LOgMPlE32rSHE8o2MFEZfCa19OB8sn6ukM7jc+RVDrfnEKH7YVnkSnkYj7QpOeD+Zebb/oqBfKy85z9u9G++P7AqCo+z9Bwcnwlizw2A3asqMJ8w1NGLj0nJ6x4bjfO5GnO4HmSZ0Qg5lBHE1B2FrmJvq1WZqnZDwpZxY3MXzUXojQqb+ATiJqzLB22nLjoo7dyHivrNf/uZcLvN7odw7n8telQBlYjqSjmE9Dy9b+9ZH0sAAIKod9UgfSGAp+jtUUbbAJtbSxNaqIkqsK/u0JWtJgwe5xKUUyZXf8AYdjrEoMoNQjsHFKY+7ZFwYZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8k3g/Pk3Ze3aGPoPh8cjDldyCPXvXbnICn1bCHpVcg=;
 b=UnLw2XjNfndxMUarn4Y/BIcanJJK1NY6YRLS1JHH/jlDcZGlQKtTrErWematmGcEqE9Mq+HgshzyfX4moZpLpKn0zy4KtbUKikKbZIU8wQwovCaQ9EEXLfR6EQQenaJAJH9gUOq+38O7m/SDRIQaOMF0I3DiNvIW38+FmalSisc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6629.jpnprd01.prod.outlook.com
 (2603:1096:604:fd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:42:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:42:26 +0000
Message-ID: <87frpgvbsu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 13/13] ASoC: soc-pcm: merge DPCM and non-DPCM validation
 check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:42:26 +0000
X-ClientProxiedBy: TYCP301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee35897-efa0-4b9e-c588-08dce1ba4d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?R6qPIxNumPuNOnmNML5F81XEQLceJVjrFbX8iHrLLjisjIvioaxHIbD/k28V?=
 =?us-ascii?Q?niLyrcbdAEDs3F6yNdixULn8GVf2znTUZpNFtlxkdQFZ+tqJNB/dzw/uSwEQ?=
 =?us-ascii?Q?SZaMPT/cMWJuL4D3PYnFR6uO6WHLRl6O7ghXAw322p110azhhbVUHVMAEl/r?=
 =?us-ascii?Q?WPM0QhawDLEDxy74yBjCPJzXQjgs2ezK+npSPSYWRa2pTOW5BYzd7q0BW5pT?=
 =?us-ascii?Q?VzXhCnYHpwEQ4fl73oKYeS50nDk+DF4G2U0y5swm8uKaI1XEYe2bmuR/RTEo?=
 =?us-ascii?Q?AoS4uiIViOXxv2bxMxjYmMCzVCMNHknwNHlleB75d6FmG7FXiSHV2IGsubaT?=
 =?us-ascii?Q?mKlTzgFsx3gzfAn1UGDebgkl8OI7cfTZGbaWMjCfvTMESYg0KZ5Zl6Y6YPqP?=
 =?us-ascii?Q?fdGUxJ6hXQJlJAbDCg+GExAsNyLx/zHcoLjCXZmEP74zha9U6usvdBQ9ddHM?=
 =?us-ascii?Q?gOlNWXXLlzUZJbCRVqWSM1chQ75ge3X7HXNgzJJ0WrKW5O9UXChLvarExC5d?=
 =?us-ascii?Q?RN/EeMLNl7tKrowzsXzEsA+7Bvnsphor3p2KcqEnaUuXxZJOIedCIoEmf49N?=
 =?us-ascii?Q?0J1yCfhdSoeJig8GRXedNc6PHSa3AUT9CS8W9ObzDmRC6QXp17Li7K1pFecj?=
 =?us-ascii?Q?r+Td2ZY28ehQzt/DHZSaz4rJNxjTuMukxWwGu18Ldz+jFrjBSnPJ1zvcew36?=
 =?us-ascii?Q?77hy0a8d2QeUY6YgQewoRvqrkhc1hOKdshB3yd6uvIHbcmzlA6fVsJbvH5hi?=
 =?us-ascii?Q?LkyZlcEOJ+6z0hQUZqqw0mrTHcf7hIaT06B8uHqdI5bxTDtUuwV4qKhpxhgE?=
 =?us-ascii?Q?qconLPZF6Fa0n0XLOXOoSH3D4YRF43R0GtFhkeEAF5wFXcQybvzYft6toFBG?=
 =?us-ascii?Q?oKPYmFrlJBVKpDdIenPwxyC7w5qGv3fO/GI8G0Vm4kg2jFRHRR2Uaqkn43+O?=
 =?us-ascii?Q?DAMBd2pkip7MYu1hbydxDiXahAN/D3miLXooZob65rFfaCrp23Jbmdj5yrTI?=
 =?us-ascii?Q?2Zv4oIr7X4RRjYbQ6B7KUqQhndyw3FcmFA+czZb1ZDbUBNSQvsoxXyluUdfK?=
 =?us-ascii?Q?rbdf2GQdpJpcCY8ZKX/J9d8V3hDdWAd8wqFo9UEShdmx/+jqW5N9VzcuMseW?=
 =?us-ascii?Q?ygpn5cX2nuGOTZgTUjYKJ/co5LsByAoElZxCTmfTOcnolJkHqBAKsm3iU3SA?=
 =?us-ascii?Q?iV5nFYdI09R4R+LE1scgKwXyKws7TLYaf5rNbMxhL/4B6tPlsMInGscDBXRz?=
 =?us-ascii?Q?8sqnvyMXez7oLOM3uyuz66mnOAaztpZd5SUYf9ZGwi8U8UA5x85XzvcBidfS?=
 =?us-ascii?Q?jZyBCiPmAlIheYrDQkYRDAqGW4sDKF/lvoBrUDWzzBIsZw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?shp6pnBSM12oDBNt8VLqHtCzrbKHJ/PyqU9OlTO3TTiE7Re4Bz5fcb3OY4VB?=
 =?us-ascii?Q?t0vRrXMA+B+RM2ySxfdrAzxrPFhPEFu2frEWMdr6RFUS9jsCF+ttusYqMtGE?=
 =?us-ascii?Q?W4ElAFIfwMxUX+TjcwJJJWjESniV2bQ8lVuDTFbq/j9RqbPYDQkoX45hbptU?=
 =?us-ascii?Q?jBKP5n92y6hSXJj7OoRa32PrF/hzkVAMEJBf+uF7WUCTPvWasP9j4IGK4HKD?=
 =?us-ascii?Q?rrKjcT4KhMlTTf+l/BxDChiENIz4pWKV3K7a8ZjoEgzHLl0ZzqiMfEBX89jv?=
 =?us-ascii?Q?P8rJQnmZNJkEbkf64OPzOutjIp4SJl1cn7w+CMBB/yyXKHAhBtg9topKR6YB?=
 =?us-ascii?Q?lMuKd+n529hhyiKRhLW++34kPjCgh2Fh1yWto0bGBqGtO4C77QctLGU+mYJQ?=
 =?us-ascii?Q?v5y2m5DCcL+oJbS3Mz4+jZwgQ69p+ZOVLzf+hFZ3aDDCa+kzCV/GLwiSBZgF?=
 =?us-ascii?Q?QITpYlvvkb0s7u04QNOyA6ixGh9ztnvYLsd4+0LwpbB5q8bhyEeATcbn6ZhN?=
 =?us-ascii?Q?C4SwuUTXwxo+vY5nPkVf57kcQGksJBZyadUZ0SBwkBKjJnx3EwOSKcwAI2QM?=
 =?us-ascii?Q?IE4L525wf/oyWUhopsIiN4qmLFI75/iqnVsl6NJh65FJKyGYX/HO7XIshNUq?=
 =?us-ascii?Q?K88uif1eVm194Q3/x3taBXe6HKCWhroqJmal3j51QNlpKgCVtt3rmUrra+E0?=
 =?us-ascii?Q?VC2HnFMOBJX0XWCKe3IjZq7KRI7+11ZkGU5dktp9UgRHtAjPNZ0rXHeXYHwR?=
 =?us-ascii?Q?RWQ6EGqZABCRUPrDP3WnF57vzNoKx0rQeelwngaFZumuvRhV+yjsSuz1IN3K?=
 =?us-ascii?Q?NDYclSLp0Nam3MLjXY/nPXItZ115mIPX99TxwNXrvg0QfHH+Av69xiXirWDR?=
 =?us-ascii?Q?4I8A2kVpNwr+jsQoK41WXrYi86SAKY2+b5ualqil/UiRucBPH5ShXpxRf9FE?=
 =?us-ascii?Q?EIqQ6vIhy7zS4/LpnSJVXRLcF+GEg+iSWW6RYrp3NKByRd3ciQZ77PFGT70j?=
 =?us-ascii?Q?TcBzmFHnQunZvlyf23oN8XrmxA1n/5ayOuSr08Zb2pOWVEvUiyxnkuHmCuSi?=
 =?us-ascii?Q?qb3GayQstG0WMjHvflXkIO5+I4mDiVMoy3kV9jC1oXIbRw+qT2yMPwBAA89F?=
 =?us-ascii?Q?auVEz9atO96R1xdWbUUBLlO1Uqg5OU1TDbHCAkn8TYyboxpp7MMZRJtvaW1w?=
 =?us-ascii?Q?JwtcfIYiuvnaFo8KplhvayCRdLfsEavSoA/e533qOcjpW1RDAih7ykKivVp8?=
 =?us-ascii?Q?xY5CajVgC1NdpLUXShH4blebXuim0KATx1n/WO1pMYpqt2575H+d5nDrcnbd?=
 =?us-ascii?Q?KRV652FCg5luCcAcGhXNOP5u/H47CcJda4fbPwbV7jRbV9+Ow8L9WTjvP5im?=
 =?us-ascii?Q?WcAQSSja4H62b802JdvxpIIPLAto39hD2PZ/C84sxFiyOSmI7EYGsfXcnwL4?=
 =?us-ascii?Q?F/o5t3GefQOllQTp1ssLAUBNn6dM8ol0Nh6qsiNyFS65qDDlva6rHbyMJWKy?=
 =?us-ascii?Q?jFUvMX3C/6R1cQpWbm7fIcsTXg98yIqiErBdf0zkEhNnXX0HqWDN5jOVTQDk?=
 =?us-ascii?Q?9yhbwtx6JTASRPMu09KjqThEOHy4mff+dMoKC7yi43pqrHkMh0d7Htbi7RdJ?=
 =?us-ascii?Q?fL3PpgLrbWdNRPN329aYXqs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ee35897-efa0-4b9e-c588-08dce1ba4d91
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:42:26.2450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 I8zCzA+vt/pwwyWBANv7Cf3K7LRl8+xPWfx9/yeoXHaE2mS804s6C++NlyOTejiT/7NPw+D3qJISZiu0y+rtlkBMOzAcBth1a9HujIrdrxmN1md4IvumLlbMZUdg6xos
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6629
Message-ID-Hash: YTQ2DQEOLFBJPOPMHB7WNIDIFPSHLSAX
X-Message-ID-Hash: YTQ2DQEOLFBJPOPMHB7WNIDIFPSHLSAX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YTQ2DQEOLFBJPOPMHB7WNIDIFPSHLSAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DPCM and non-DPCM validation check are very similar. The big difference
is that DPCM doesn't check Codec validation. This is historical reason.
It should be checked, but it breaks existing driver/behavior.

Anyway, if we uses dummy DAI as Codec when DPCM case, there is no
difference between DPCM and non-DPCM. Let's merge these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 62 +++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 27810f6f8630..76cfb6b11544 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2838,7 +2838,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai_link_ch_map *ch_maps;
+	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
+	int cpu_capture;
+	int cpu_playback;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2848,40 +2852,38 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	if (dai_link->dynamic || dai_link->no_pcm) {
-
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-
-			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
-				has_playback = 1;
-
-			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
-				has_capture = 1;
-		}
-
-	} else {
-		struct snd_soc_dai *codec_dai;
+	/* Adapt stream for codec2codec links */
+	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
+	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		/* Adapt stream for codec2codec links */
-		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	/*
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_rtd_ch_maps(rtd, i, ch_maps) {
+		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 		/*
-		 * see
-		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 * FIXME
+		 *
+		 * DPCM Codec has been no checked before.
+		 * It should be checked, but it breaks compatibility.
+		 *
+		 * For example there is a case that CPU have loopback capabilities which is used
+		 * for tests on boards where the Codec has no capture capabilities. In this case,
+		 * Codec capture validation check will be fail, but system should allow capture
+		 * capabilities. We have no solution for it today.
 		 */
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
-		}
+		if (dai_link->dynamic || dai_link->no_pcm)
+			codec_dai = dummy_dai;
+
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+			has_playback = 1;
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+			has_capture = 1;
 	}
 
 	if (dai_link->playback_only)
-- 
2.43.0

