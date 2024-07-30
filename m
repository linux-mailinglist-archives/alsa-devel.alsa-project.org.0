Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647799403CE
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:34:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC1383E;
	Tue, 30 Jul 2024 03:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC1383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722303243;
	bh=TtDKbSNql/AqfF87YrEALkDtAxCQRolyOPwj1aiMlQE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d0Dt2gLcS6j0/njBJkSN33pOyOOYGcxVzPbyDB2umLQ83dR/yh2krFt9VwXnkmjBC
	 g56Kv0wGaa6OOtmvURDvOoubVjQhDoVmpYvqFSeFX+9v/4+ZTH5zP9QX5JMPExm4lA
	 t/+iKYl88tQByaXQjjIB3s7+AsIYk2Eod0789j/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACD59F805BB; Tue, 30 Jul 2024 03:33:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21311F805A9;
	Tue, 30 Jul 2024 03:33:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BF93F80448; Tue, 30 Jul 2024 03:33:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 26DFBF8007E
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26DFBF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LnxmQUm0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhjtxZVdpal/AmOsveFvMGKOArJmMm/Bn46WzGpgB1Bkc4JPn2FspfpydJBY7sVbvav06/AtavlmdvO18FOEgLBmUvBmijgZzl6NOq/joq1dNMEJ+NwKKMn9bmHgII+OdNdJH7hclv042fouEEPkb1fRlk+k99wDpMMvSHPR7TUr0Ct3VfqlxwkJEpAy1JiYAlzAbtOAVGouQLEUyw8cMQG+MlcldIIOfQbDa5/mbW0hYoxbjhoFdmu7/+CaEb608YqSkIVpWZHFop7FLJzbtrG5AgwhfIdtTyRn+/0QwEYc3CgNc5T7V1aeH5jt+AP4Ha8RjGLaEMbyMwt20J9vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5k4QMWimaRNAs6BGlCKrh1lMVMXlDZmUW4ASKTi1Tk=;
 b=x4z3I0erS+H2aCHcSVXU2crwxuUh+Tt/8X98IeCCEfWgRLIhKonxiIXcSr/o4zqkudAGZLhKtQ5SBRpcUEeiwvRQwLjyPHb0GVFcjEbjH2V3D5WsWEABHVm5ke2lAFxOJ3gvvaeim0f1wEhCAeyKeBYY4wQRIWKExNoD9yjlXaiDq3Zwq8gxvuPquXSwa35Py8sDXZmTiuZg3Ylq3oxfHynWzY1pRk3hKBqWHJubBMjzY9uxidX1EPOuULR6YVKVkGK9v+1gXMC0XoIifxb4OgRxD+1+RbWcPFxdCzmRW+t/8yLSQa5Bf7y0qZXORZ0AotKNxUDM1+nRuenSXzKANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5k4QMWimaRNAs6BGlCKrh1lMVMXlDZmUW4ASKTi1Tk=;
 b=LnxmQUm0xSMy672l6nNVA4WjpnDqGDlw4tfiSTzq5OQ4YsozNOfZ45j6XW1mOPHZSdtDv8k2wi8cM11fMD8eOz/YWOiKyZmBhqwQCP+vqLH36zyxSxLY0NaPJXIiwnNGmyJmpUGMucTjJSSZt2GiXMJ+d/0Lebk+Ow1aVQHrfqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7901.jpnprd01.prod.outlook.com
 (2603:1096:400:114::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 01:33:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:33:13 +0000
Message-ID: <87zfpzk6jq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx() to top
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <871q3bll5c.wl-kuninori.morimoto.gx@renesas.com>
References: <871q3bll5c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:33:13 +0000
X-ClientProxiedBy: TYCP301CA0067.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 041edb19-d137-4f65-39bd-08dcb0379455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S/uMVUfb2++HyGnOw627dSKV/6u/fQMvZVDZw5eUjR0IpotI5nzg3+Qyulih?=
 =?us-ascii?Q?fbt/fVhrQcQHT9Nu9UbwQX1/tBkTSnnr7UtoLcc5ifwyeLXedKshdrtf8vAl?=
 =?us-ascii?Q?eVRrfJyZkLmt+UMbG6Ls9ozc2A+XRaGsJL4q2A0mMWvHK59V6Jwthl7RQWII?=
 =?us-ascii?Q?wpeFnUhQ9+e0OozBbJxULPgMZGlJtOD+4qy8ce4D+CIK9zdqLmZqebkYiuZ4?=
 =?us-ascii?Q?Q/9H+OnDjrRZYz/J1ObtKrd3dxOyzXwsF8FwqV4j6eXJ0qrYcgySUzLoKWE/?=
 =?us-ascii?Q?eTNyUJCekBwMoXVLp9LxxmfRV3ZZ6ATkUvdMTlQTyo8MQ0hXIxQrXnoHQ7JQ?=
 =?us-ascii?Q?ukPOmqRioJgOARsJD7zmjGLO3dsy5yies2Yol5aaHexmSCS5yC5mZES402WQ?=
 =?us-ascii?Q?cI80Wtuq1fr9Gg5NgjmuIrGJXRNGRdj7F10SHkiV1uxf5NeOPIBm/+Qk963B?=
 =?us-ascii?Q?keLJeknG3ZRP4OvPmKItoF7EXQUvdGhI9UqUO040D14kmdg/iCsdUVFdKEau?=
 =?us-ascii?Q?0R6dyPgWkdANc1iRxHPW9pfaNa/utrFwyRWDuSt1mOjlHJB3L1MZmmzuBPin?=
 =?us-ascii?Q?LYZqHaTJwK96o1CloaGxXBsV0/5MZNrv3OZFBF9WaT+JoXugv4DRG0amOO0o?=
 =?us-ascii?Q?jS7v7th3l6hNuHUWQuZ7jkn/CjR5AcIiCJu4VHkgV+pwrAD+7PMAcUD6FpSb?=
 =?us-ascii?Q?4CSc92INvfceIPvtBXLtnG7iifB7rAe1RMqYZj8ahHQoe07OjOTvcIKSmAuA?=
 =?us-ascii?Q?iHCxUI87PiZ6CCpQvC7xqEgR+VtrtCsxNLyOjf1nDOL1ysiCKy7TnluMuO+8?=
 =?us-ascii?Q?ASj3w3ZzZdTTMOWho3zHNDCdeN5bOupXE+2xt/tG3HQTOh9/vsvWb9WvXVnB?=
 =?us-ascii?Q?xYrHcX7qSwo9zmUZ2HacnedJKCUdI3xxuWQoXg0Mhdq91L9PUsRmEi0SyQFg?=
 =?us-ascii?Q?ile+T0XTgv/i8EcAfF7/3b8jZRZpQOasjon/HG0VTpjtdUjTpw0wVz7pyBbI?=
 =?us-ascii?Q?4Mr7VMDATeIr0UbNKLVjHlE8QxNnXM0ocUnkAmjd7dLx4goqXY2QGWfsujIv?=
 =?us-ascii?Q?Y0lkhzqI7s9IPJ7BjIL0iG8Q5zJOWm5kKaGJTPBhCYHAwKAwRAd1meE5hJLa?=
 =?us-ascii?Q?695GCncnLQ8UpBiY0RMD/QPNl6enVTt6w5AlwdKuTamPxu6ipkxJZ6LPKWNj?=
 =?us-ascii?Q?TZRLPyc/eEJ5G5nrCV2Y/Vmbpt0oQ+35DDBd7uHwu07HnlpYhtICTGq6NkpT?=
 =?us-ascii?Q?UYoufrV+FJLsdVpOoGYc3Iahv550xf2LgoUlJED8N2qASrfuqj04tcKe7Nuz?=
 =?us-ascii?Q?lsyGP9DtNcazsRjbh1Dq/6ehiy18FrYeRoChn+PmIqvLPvX4xC8ESM5It+XD?=
 =?us-ascii?Q?Njj17GLNCllDktK86bXlCkmqly5Higehk2Wo1DuA6w6OiOOhnA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tOnhnkgX7dWiOReOru6thbB3D4Rv0Q3w2xBARXVroyMj/U2jBB2/E3qNnUub?=
 =?us-ascii?Q?kgbiEfsTRLcX/mxbl65adLmegiTNNd/M2qdCv4hGgiyAPXdWjeq6O6728kcy?=
 =?us-ascii?Q?1LXdrcfx8JW4w8BJQXn3gD8pXJqxAP3t45r68Ffu2xYi7VX4esk+fvyUOqbd?=
 =?us-ascii?Q?a9IkKAlLBqOCnB8KL12q3en6cMNS3lSfZLdjoE59nUQwsXCDBFNgqMPGpa46?=
 =?us-ascii?Q?Orbajdo0UyreIivxql8q0czkAAhwRi395tR5bs1Dc1Thtm3uOF35bBDJqXah?=
 =?us-ascii?Q?EcXHEYe3TS3lEwLcYKLFhUriVumcFiS5WyPJKusPl+Q02DnAsBHJRNqrENZr?=
 =?us-ascii?Q?kTm7f4LDOer6soJ3qjsFtJRNbf0aOvRcboAYLXHFvBwziwj93uD75mpFVKd9?=
 =?us-ascii?Q?MmJcxU3grozQyazEbJUxUEiV16F/SG9oCXO2RJ/5AugiqOwzKnFwWKJ9H2bO?=
 =?us-ascii?Q?M1RBQIYE6h4F/efS2Uv9QgiMdjiKQ14DKyoWyAbVSP4Q7FV56Yyw2l9SsDVA?=
 =?us-ascii?Q?K9XMnj+ksW+5JBNbgAJj9X+hTrhj5DFj8Z5vDnmwDYv5rIUuB1qxPKvkp5Dx?=
 =?us-ascii?Q?Yl3vGzTV04CB/VCk/5OfHp0bhVsxD/nLfRbGjyGJpmQBGMxkxmRF/0Q+CAva?=
 =?us-ascii?Q?L0YH6NZ8x4l9JjOSL09U21e0s9knJdisDpFlXRsknL/dJOUiIvdhYWAs6aeb?=
 =?us-ascii?Q?O9eT0bo9Kp6GLUu0GLBhwyj+X3xcWgQaB7ocDzNJQKfBNLZQ9dz8XY9xUqce?=
 =?us-ascii?Q?09meqpkYV8dWUj2RzEstJSEurIOAHf0sbwEhyqTPQdEbfx6da+6WSV8jtFts?=
 =?us-ascii?Q?oayWWgrbDWkCNwPJYzbehssHELq390QzOHAPJ4ukD68m0BEH7I1W4P+wH+T6?=
 =?us-ascii?Q?DNdBHiP+hHYxOP0MWIaC04gDY6pdtEVvkLKBXunYJPB7UrAz6iwtD8hZTV2U?=
 =?us-ascii?Q?xgbdlytbKkK5GTG7D/HQ5PWMrmZBiue/4ghwEqGB8oS/kXahRe7k4cXjbwAk?=
 =?us-ascii?Q?nVQIQElCbgfD2GNoNd7uBlolS/U4dw5ziPU1ZSR7vj71epwtLuaX9dzX8u/B?=
 =?us-ascii?Q?tPWLUB35JwYui1eBZxFBD45Jn16cSHweVvmVYW5L82ig0I8YwHdJsz7BF176?=
 =?us-ascii?Q?YHGqSLQ/5H3kUkv+MAaugbgY0g5couqAdy7EPGj+Nbn6fW1SieyJ/z39G71e?=
 =?us-ascii?Q?XizvNpczMB578fMloez0vpg2AODWfutSyijnikkmhPEW0zRg1wyWOvw+Iv1W?=
 =?us-ascii?Q?aNor4kkB0OHmRU+j7XCWnXfgGrhRLikKWtOwnzJgK0PJq140UVrjh//ImMqh?=
 =?us-ascii?Q?OLgXHKOxZOOnklc0fZFIegTcHzTfckO5YSCQLurVGnv17AekNwfvBytZkA4J?=
 =?us-ascii?Q?VrSJRVQYcIu/n+2VEcDI7YJOx0SwxT1e0H+fwChJGg3hMbUsgEMa5VTdnsWZ?=
 =?us-ascii?Q?BkUWkqFOgJL56DBRGA/3EcSNxUMCGWv48/FSUH9v7/lno4FsB6eKFc5Zpu46?=
 =?us-ascii?Q?RTIs4gt76pHbXARU5sTGMaDOp+UaDzaURh5dVnGJlUHocmYyUJVEA6Vy77z2?=
 =?us-ascii?Q?Pf6mGinh1Afy5JOmG3xW8f8wq0h77GJxhZrZN5o4k2drHgpjNBi5+7OOiLDP?=
 =?us-ascii?Q?UIqrFIrSjjklFDlUHAcUcj0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 041edb19-d137-4f65-39bd-08dcb0379455
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:33:13.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pDR3Kz9xhTH2O9DnLrbCqs0Gm6pPjy8MerDKsN9tZ9cqoigJcGlg25qNvNiK51h7Kwjt37b1VNEIcGRt5JLyBUhJPafd1+vUvTChMRaBxC9ng6LUlXtu0Ft2zMIHGBgl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7901
Message-ID-Hash: 23MJ3KYOYRG7SFBD5AGRQAZVH3OWNLMF
X-Message-ID-Hash: 23MJ3KYOYRG7SFBD5AGRQAZVH3OWNLMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23MJ3KYOYRG7SFBD5AGRQAZVH3OWNLMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch moves snd_soc_dpcm_can_be_xxx() functions to top of soc-pcm.c
This is prepare for cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 204 ++++++++++++++++++++++----------------------
 1 file changed, 102 insertions(+), 102 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 5646525ad7924..961fadc6fbf88 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -49,6 +49,108 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
+/* is the current PCM operation for this FE ? */
+int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
+{
+	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
+		return 1;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_can_update);
+
+/* is the current PCM operation for this BE ? */
+int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
+			       struct snd_soc_pcm_runtime *be, int stream)
+{
+	if ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE) ||
+	    ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_BE) &&
+	     be->dpcm[stream].runtime_update))
+		return 1;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_be_can_update);
+
+static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
+				    struct snd_soc_pcm_runtime *be,
+				    int stream,
+				    const enum snd_soc_dpcm_state *states,
+				    int num_states)
+{
+	struct snd_soc_dpcm *dpcm;
+	int state;
+	int ret = 1;
+	int i;
+
+	for_each_dpcm_fe(be, stream, dpcm) {
+
+		if (dpcm->fe == fe)
+			continue;
+
+		state = dpcm->fe->dpcm[stream].state;
+		for (i = 0; i < num_states; i++) {
+			if (state == states[i]) {
+				ret = 0;
+				break;
+			}
+		}
+	}
+
+	/* it's safe to do this BE DAI */
+	return ret;
+}
+
+/*
+ * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
+ * are not running, paused or suspended for the specified stream direction.
+ */
+int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+				  struct snd_soc_pcm_runtime *be, int stream)
+{
+	const enum snd_soc_dpcm_state state[] = {
+		SND_SOC_DPCM_STATE_START,
+		SND_SOC_DPCM_STATE_PAUSED,
+		SND_SOC_DPCM_STATE_SUSPEND,
+	};
+
+	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
+
+/*
+ * We can only change hw params a BE DAI if any of it's FE are not prepared,
+ * running, paused or suspended for the specified stream direction.
+ */
+int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
+			       struct snd_soc_pcm_runtime *be, int stream)
+{
+	const enum snd_soc_dpcm_state state[] = {
+		SND_SOC_DPCM_STATE_START,
+		SND_SOC_DPCM_STATE_PAUSED,
+		SND_SOC_DPCM_STATE_SUSPEND,
+		SND_SOC_DPCM_STATE_PREPARE,
+	};
+
+	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
+
+/*
+ * We can only prepare a BE DAI if any of it's FE are not prepared,
+ * running or paused for the specified stream direction.
+ */
+int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
+				 struct snd_soc_pcm_runtime *be, int stream)
+{
+	const enum snd_soc_dpcm_state state[] = {
+		SND_SOC_DPCM_STATE_START,
+		SND_SOC_DPCM_STATE_PAUSED,
+		SND_SOC_DPCM_STATE_PREPARE,
+	};
+
+	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_prepared);
+
 #define DPCM_MAX_BE_USERS	8
 
 static inline const char *soc_cpu_dai_name(struct snd_soc_pcm_runtime *rtd)
@@ -2960,27 +3062,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	return ret;
 }
 
-/* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
-{
-	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
-		return 1;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_can_update);
-
-/* is the current PCM operation for this BE ? */
-int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream)
-{
-	if ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE) ||
-	   ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_BE) &&
-		  be->dpcm[stream].runtime_update))
-		return 1;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_be_can_update);
-
 /* get the substream for this BE */
 struct snd_pcm_substream *
 	snd_soc_dpcm_get_substream(struct snd_soc_pcm_runtime *be, int stream)
@@ -2988,84 +3069,3 @@ struct snd_pcm_substream *
 	return be->pcm->streams[stream].substream;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
-
-static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
-				    struct snd_soc_pcm_runtime *be,
-				    int stream,
-				    const enum snd_soc_dpcm_state *states,
-				    int num_states)
-{
-	struct snd_soc_dpcm *dpcm;
-	int state;
-	int ret = 1;
-	int i;
-
-	for_each_dpcm_fe(be, stream, dpcm) {
-
-		if (dpcm->fe == fe)
-			continue;
-
-		state = dpcm->fe->dpcm[stream].state;
-		for (i = 0; i < num_states; i++) {
-			if (state == states[i]) {
-				ret = 0;
-				break;
-			}
-		}
-	}
-
-	/* it's safe to do this BE DAI */
-	return ret;
-}
-
-/*
- * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
- * are not running, paused or suspended for the specified stream direction.
- */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream)
-{
-	const enum snd_soc_dpcm_state state[] = {
-		SND_SOC_DPCM_STATE_START,
-		SND_SOC_DPCM_STATE_PAUSED,
-		SND_SOC_DPCM_STATE_SUSPEND,
-	};
-
-	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
-
-/*
- * We can only change hw params a BE DAI if any of it's FE are not prepared,
- * running, paused or suspended for the specified stream direction.
- */
-int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream)
-{
-	const enum snd_soc_dpcm_state state[] = {
-		SND_SOC_DPCM_STATE_START,
-		SND_SOC_DPCM_STATE_PAUSED,
-		SND_SOC_DPCM_STATE_SUSPEND,
-		SND_SOC_DPCM_STATE_PREPARE,
-	};
-
-	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
-
-/*
- * We can only prepare a BE DAI if any of it's FE are not prepared,
- * running or paused for the specified stream direction.
- */
-int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
-				 struct snd_soc_pcm_runtime *be, int stream)
-{
-	const enum snd_soc_dpcm_state state[] = {
-		SND_SOC_DPCM_STATE_START,
-		SND_SOC_DPCM_STATE_PAUSED,
-		SND_SOC_DPCM_STATE_PREPARE,
-	};
-
-	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_prepared);
-- 
2.43.0

