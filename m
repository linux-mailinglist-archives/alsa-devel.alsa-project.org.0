Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D99AC7AE5C7
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15420EA4;
	Tue, 26 Sep 2023 08:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15420EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709516;
	bh=qJpRATjFrwybw0jghZAqM4+Rr3yxOZJxQAqgyT3TYH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ksP28+p1fPIYRR9y7fBwOQ45MzIKZp9iR1WhyfwwrTtwo6gn+Vt41cKYKUAmXccdK
	 Qt9HpVZumaVV9zfQf1MrLuP4Wh7X/N+2EGpxEXoZIY5unG9//Q/Od+nILyMn6yIiRz
	 acMFllG6GfFMeJx6SfhQ9GCk5H3S2C8IfPRcXT2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EA6DF80568; Tue, 26 Sep 2023 08:22:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEE9AF8057B;
	Tue, 26 Sep 2023 08:22:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA2CBF80587; Tue, 26 Sep 2023 08:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E2D3F805F0
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E2D3F805F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VHFIS8xU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7rLUmITTN67LSe1ai/Oe5ZbxKOVaOSnx4qFCvEexEgLjCVxVLPgcACAQf1RixVpm1ZSQJOwfQtBWsA/PtsJxnxmP/rx7kndW5o276YMLqaxczTyyxL/3eE68zZf1Jmt33dyYUj7AnW4tPBwOCZd5JhY4lsgG1iiN7rT15oYADbG3esk/7n6jtUSpCIeEkg09F31vu+kDlMVBTD8kHTe7OX6Dh9FIIxVOXjUYB2Wc0Ve1CjyJxHeIJgGy6KtEKQAj6Qf1RcjzqtWS+NfyHsn/FHPhx5b1yQrIcLZXG5v8wguqbAyRZmzL0BnBUx0rmnRIE0ep6rTHYd9UlbdmF6oYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j67jq0f4VANwv4rmXjFdZQF9/V5fIQ3UwL1WYVaIffU=;
 b=dDL88gsE8UPdLzRoIA+4+e3NB3iaZRY9sCdTKgefDdwT4F5bp17f+O+Qh6PTWAYpXBpX9OFtkL5TnOlEk9ck4em5+XvvhgT9IaGcCy3t0TrI/ArjTNXTOyz3SH3CIAyunUcKsaaBoJ/dCDPNhm28dMv2ewjqwdw4lpLOZUXNagDA9FNHmBxnayM0GVN8nf9yirw3UDHJi7WYtyQN5sq/ZdwtI07d5T8Js9+tLtWudJ0ybx2sdIAQw51I5yNFJIN6Fl2PE/3g1Hus0tvQSeSP5h8k1jsU/tNudw1dJLMuW/8GmjYMANF186iZvyanZYcO8Yb2YjuUJxsxQYQoHWSPZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j67jq0f4VANwv4rmXjFdZQF9/V5fIQ3UwL1WYVaIffU=;
 b=VHFIS8xU9RGrdQ8oYFR0isQo2+ivfmzIvWUUjKe6/IEQLI4TwGUCKCWdktkctyn6MH2zoWR4o0B+5VYVUlRUXZ6xwNK9fZUKUvOZfoyoFG0MAAEUifd6ohkIn+p7qC0ElFDjgKniL7eW/OJkZnYyZylsMbsvr9daOTIL/finYhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:21:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:21:57 +0000
Message-ID: <87sf71h2t6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 15/54] ASoC: qcom: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:21:57 +0000
X-ClientProxiedBy: TY2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:404:a6::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd08a9d-208f-4ab5-bbf0-08dbbe58e2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oOApj6mI3wEb1FwitnXPoVtbCs/cyXVyVK59w5jDw4NC5H5RUBaNBF0P0LbVjbRuTQCGnG/eBk+2oa5F2L29HKBzzjOKfSgxYBtbkbhzoHBUU2FP3wmoCDhAIjSF3oyr5+L1pgtUhhQ1BE0UXTQ6u0ypqlM46KjrIWF3K3oQEQ/veHvQeINJt2UldNSxqKyojuFCj//AB2amA5OnpUX1XF2sHzF9gCnjvbg+wzaHi2z5QkTH3AsuJh2/W965rtFqYZhJurU+eSMFOwDh8cxSqGqJ+305L259DWe6HogNcwiBWIotUt6jejMb9riN5kWudH8CPa7MveBsEvOLzAJdLTzugaWfs8KjSCvxvcex1KmNk3mG0DmddDRs+zbBfgucFVwWIpaHEzpA30mI+7og1YaUUUGSYZc2EtSTFFZrYD3yyn7SuEwhvrG7dg8xRzNNyod0m+BNzJ9FPu9ZrmZ5cXULS7b8Ebw/ZOF4FuPQyvXD25CscEPJaAsSVtPX54+ZAK2ibbjr6I0rNEhB75h3bubAnb4li+RSxtuHEy2UkN8cYQj8AurSXJi3hKT7D6ZydHyKKIxB3L8H1Eeym8E+KV6szLDMEsnpgIlkqD2D/317yV3qD7DGFxqDVqpLs4m0vbcL3pWUXDoYv+6c+JLS5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(30864003)(41300700001)(21314003)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FqpBS6a+veRC+F9qelJJvelVRI2PBR5s/XhBaUv1wJd+6Efp2GdfYz8NpBtb?=
 =?us-ascii?Q?CAY083pCho0aoF472DG+8JdG6uSmXsgsHqDfl/jJvqCYO3eTv8cymuKFxnXH?=
 =?us-ascii?Q?TeZN8G8NdlIZ9b4s56qThMPmuLbd4wLGFrRHGhbucxbrqgRMNAeTQmf96WF/?=
 =?us-ascii?Q?ykriammb+rRRivCxOW7O9ZQoupC4Ky9wkvlkJCnS4fMluul//3E5nL1RNrz2?=
 =?us-ascii?Q?NhsgJtR+XkyV4I1zVOG3fU7S5Mq7eHJV6Kdr5KYMnNL05C6QLuXM53o6kyC5?=
 =?us-ascii?Q?YfI4rGo1GYLiRqkTh3NuQQWqKjKrOFOVsvrTZjnHCpKaAZPgIPQdy1oX54Lt?=
 =?us-ascii?Q?ern6ENzZfTp8vLdOlPuM9hUUVb9fEUcOG6UbELjxkI1EAC+CQzAI1fSdiZtF?=
 =?us-ascii?Q?5D8oL9G3i8sY/MEFEibTvviuwg99VRUjHsoCQT6E+Y2bbPLbG1NvCejlTSZE?=
 =?us-ascii?Q?8TUZDKmYrZAk1LtdKzY96v5uR6eo4+5FAujLbyVT1ueLbz5jjw10DFcNohkd?=
 =?us-ascii?Q?FzOZSTAIr0zT4pYb5dcdqKRVR7lgTnJDrWO9FEwqQjTEdlYVQ8eNi/qnQ8lh?=
 =?us-ascii?Q?qS3nQ6RXuyKQyoLZqV09HvvV+HDU8IPpmlHHkidfXdCsbdSaC4EVtmeqSuEh?=
 =?us-ascii?Q?pTQ51putXh788VPfMhPvhMqQaV7S12EYhfkO1+xaw1eHcSKHlEzKpmpyOVIa?=
 =?us-ascii?Q?BvwZ4VJYTH73DFQlSha8p8u658Ro17ZeVkKfpsxjAqzGswv64/EDRLvZLuFI?=
 =?us-ascii?Q?6Mypxiucf56JdDe6xMQ3+Qd/KvVqhMZcuYd4rGDi8toWcC4yRsWllUMwDF9F?=
 =?us-ascii?Q?R4/+S1Z26nRLdELa66w3tBugBCi+leBhEJS4Oj7NDYea5o6yZ0dMCNgl9e4h?=
 =?us-ascii?Q?+RCtYuorl06VLXGNt7SeA+riAPGXqAoGMG72NaQFrK1WgY55+A8ccoPolW1C?=
 =?us-ascii?Q?EhKP7qNqo6ZOFsMY28emz26LKy43ftc+tU0M6QrMGSKG4JbniIgGAfNIJcN7?=
 =?us-ascii?Q?o/nugqkAES/9ClR9mhonPdC+nlBkA35uPI8CiADFRiaiQWKIWChQgdPOaxrD?=
 =?us-ascii?Q?IVKL1gh/xHffKZCH0PnlO0A5tZRRRL0Zllvj1REH9SdWJgaT7gTVC1XO6SDC?=
 =?us-ascii?Q?hlj0oIc7ownBDnp+8HEt5gJqdNdTwUb4nt9kRBdbLXb0c23/nKZc7m9Cwuip?=
 =?us-ascii?Q?Tlh799YWEidZEO+Ft7+TUH2HtlyOTHwRtKhq/haQ2n6gHHeKXC1HzpG7iI39?=
 =?us-ascii?Q?JFjlDsZj0/rjCOkv9WJHwTKLrQQS4dmE293kieZC+j5lDv+i7NPs99AJUcr3?=
 =?us-ascii?Q?nWWvxpyX+ZlI8SOMtobvCHmNO8hPo0Qx7MPnK1iTlPHqHHBgOnHBLiFyxrfM?=
 =?us-ascii?Q?S+0p6zsOMzf/RhJHNRxNWOhVWdkW9JMel0oyHktJumxcFh3IRLLfEpEt8AAz?=
 =?us-ascii?Q?s32o5qeBebSPpRjs5YYfC+xNcOEesLgnDc3MDYLKlS3ij9ssxBeLPe7IccYm?=
 =?us-ascii?Q?aQHbh1nBfjNaf7NsiOCG1JR3FFlr6sbeq8qCVbo4xzkP+yplUXK+MeFgTkJS?=
 =?us-ascii?Q?3tHXOuiLkn6k5rinIJQyA2Zqp6FAvJ6UbP4IyleAk9fqdtsRSrqo1KiD70BM?=
 =?us-ascii?Q?nsvi8AZuEf1HBmAKdaqLrUk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4cd08a9d-208f-4ab5-bbf0-08dbbe58e2eb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:21:57.7963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mR4jT780srUUyeCswjX3xJV4To7/uafft/UNw+yQ8b1NkpLkFaWVEu4TX6rYH+cvsiorMvSVMZrBBt7f0f7ixYJ6aUdpAQuCYC1MCLkkgfjS3t9QX0MiD/RUo6PiWxIL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: N6PWIR4RQ35CCC2DL4SB5VADMXSAVCSQ
X-Message-ID-Hash: N6PWIR4RQ35CCC2DL4SB5VADMXSAVCSQ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6PWIR4RQ35CCC2DL4SB5VADMXSAVCSQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/apq8016_sbc.c     |  8 ++---
 sound/soc/qcom/apq8096.c         |  8 ++---
 sound/soc/qcom/common.c          |  6 ++--
 sound/soc/qcom/lpass-cdc-dma.c   | 16 +++++-----
 sound/soc/qcom/lpass-platform.c  | 50 ++++++++++++++++----------------
 sound/soc/qcom/qdsp6/q6apm-dai.c |  4 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 10 +++----
 sound/soc/qcom/qdsp6/q6routing.c |  4 +--
 sound/soc/qcom/sc7180.c          | 18 ++++++------
 sound/soc/qcom/sc7280.c          | 26 ++++++++---------
 sound/soc/qcom/sc8280xp.c        |  8 ++---
 sound/soc/qcom/sdm845.c          | 36 +++++++++++------------
 sound/soc/qcom/sdw.c             |  6 ++--
 sound/soc/qcom/sm8250.c          | 10 +++----
 sound/soc/qcom/storm.c           |  4 +--
 15 files changed, 107 insertions(+), 107 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 6de533d45e7d..ff9f6a1c95df 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -147,7 +147,7 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 
 static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	return apq8016_dai_init(rtd, cpu_dai->id);
 }
@@ -183,7 +183,7 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 
 static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
 	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
@@ -194,7 +194,7 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int mi2s, ret;
 
 	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
@@ -215,7 +215,7 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int mi2s, ret;
 
 	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index 5d07b38f6d72..cddeb47dbcf2 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -30,9 +30,9 @@ static int apq8096_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int msm_snd_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0;
@@ -66,7 +66,7 @@ static const struct snd_soc_ops apq8096_ops = {
 
 static int apq8096_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/*
 	 * Codec SLIMBUS configuration
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index e2d8c41945fa..f2d1e3009cd2 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -138,7 +138,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			}
 		} else {
 			/* DPCM frontend */
-			link->codecs	 = &asoc_dummy_dlc;
+			link->codecs	 = &snd_soc_dummy_dlc;
 			link->num_codecs = 1;
 			link->dynamic = 1;
 		}
@@ -189,8 +189,8 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	int rval, i;
 
diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 31b9f1c22bee..8221e2cbe35c 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -32,8 +32,8 @@ enum codec_dma_interfaces {
 static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
 				      struct lpaif_dmactl **dmactl, int *id)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -122,8 +122,8 @@ static int __lpass_get_codec_dma_intf_type(int dai_id)
 static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
 					    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpaif_dmactl *dmactl = NULL;
 	struct device *dev = soc_runtime->dev;
 	int ret, id, codec_intf;
@@ -171,7 +171,7 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
@@ -194,7 +194,7 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
 				      struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
@@ -214,7 +214,7 @@ static int lpass_cdc_dma_daiops_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params,
 				      struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct lpaif_dmactl *dmactl = NULL;
 	unsigned int ret, regval;
 	unsigned int channels = params_channels(params);
@@ -257,7 +257,7 @@ static int lpass_cdc_dma_daiops_hw_params(struct snd_pcm_substream *substream,
 static int lpass_cdc_dma_daiops_trigger(struct snd_pcm_substream *substream,
 				    int cmd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct lpaif_dmactl *dmactl;
 	int ret = 0, id;
 
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 990d7c33f90f..73e3d39bd24c 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -192,8 +192,8 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpass_variant *v = drvdata->variant;
 	int ret, dma_ch, dir = substream->stream;
@@ -284,8 +284,8 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 				       struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpass_variant *v = drvdata->variant;
 	struct lpass_pcm_data *data;
@@ -321,8 +321,8 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_substream *substream,
 				     struct snd_soc_component *component)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpaif_dmactl *dmactl = NULL;
 
@@ -353,8 +353,8 @@ static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_subst
 static int __lpass_get_id(const struct snd_pcm_substream *substream,
 				     struct snd_soc_component *component)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -388,8 +388,8 @@ static int __lpass_get_id(const struct snd_pcm_substream *substream,
 static struct regmap *__lpass_get_regmap_handle(const struct snd_pcm_substream *substream,
 				     struct snd_soc_component *component)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct regmap *map = NULL;
 
@@ -416,8 +416,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 					   struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -569,8 +569,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -597,8 +597,8 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -660,8 +660,8 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream,
 					 int cmd)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -859,8 +859,8 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
 		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -911,8 +911,8 @@ static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream,
 				      struct vm_area_struct *vma)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	unsigned int dai_id = cpu_dai->driver->id;
 
 	if (is_cdc_dma_port(dai_id))
@@ -926,8 +926,8 @@ static irqreturn_t lpass_dma_interrupt_handler(
 			struct lpass_data *drvdata,
 			int chan, u32 interrupts)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_variant *v = drvdata->variant;
 	irqreturn_t ret = IRQ_NONE;
 	int rv;
@@ -1169,7 +1169,7 @@ static int lpass_platform_pcm_new(struct snd_soc_component *component,
 				  struct snd_soc_pcm_runtime *soc_runtime)
 {
 	struct snd_pcm *pcm = soc_runtime->pcm;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	unsigned int dai_id = cpu_dai->driver->id;
 
 	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c90db6daabbd..739856a00017 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -332,7 +332,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_prtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
 	struct device *dev = component->dev;
 	struct q6apm_dai_data *pdata;
 	struct q6apm_dai_rtd *prtd;
@@ -478,7 +478,7 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 				struct snd_compr_stream *stream)
 {
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd;
 	struct q6apm_dai_data *pdata;
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index fe0666e9fd23..5e14cd0a38de 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -218,7 +218,7 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_prtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_prtd = snd_soc_substream_to_rtd(substream);
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 	struct q6asm_dai_data *pdata;
 	struct device *dev = component->dev;
@@ -350,8 +350,8 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_prtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_prtd, 0);
+	struct snd_soc_pcm_runtime *soc_prtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
 	struct q6asm_dai_rtd *prtd;
 	struct q6asm_dai_data *pdata;
 	struct device *dev = component->dev;
@@ -443,7 +443,7 @@ static int q6asm_dai_close(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_prtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_prtd = snd_soc_substream_to_rtd(substream);
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 
 	if (prtd->audio_client) {
@@ -603,7 +603,7 @@ static int q6asm_dai_compr_open(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
 	struct snd_compr_runtime *runtime = stream->runtime;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct q6asm_dai_data *pdata;
 	struct device *dev = component->dev;
 	struct q6asm_dai_rtd *prtd;
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index bba07899f8fc..c583faae3a3e 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1048,9 +1048,9 @@ static int routing_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct msm_routing_data *data = dev_get_drvdata(component->dev);
-	unsigned int be_id = asoc_rtd_to_cpu(rtd, 0)->id;
+	unsigned int be_id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct session_data *session;
 	int path_type;
 
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 57c5f35dfcc5..d1fd40e3f7a9 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -57,7 +57,7 @@ static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_jack *jack;
 	int rval;
@@ -93,7 +93,7 @@ static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_jack *jack;
 	int rval;
@@ -117,7 +117,7 @@ static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -139,8 +139,8 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
 	if (!strcmp(codec_dai->name, "rt5682-aif1")) {
@@ -225,7 +225,7 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -249,7 +249,7 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 
 static int sc7180_adau7002_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -269,8 +269,8 @@ static int sc7180_adau7002_init(struct snd_soc_pcm_runtime *rtd)
 static int sc7180_adau7002_snd_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	switch (cpu_dai->id) {
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index 43010e4e2242..c23df4c8f341 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -58,8 +58,8 @@ static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_jack *jack;
 	int rval, i;
@@ -115,7 +115,7 @@ static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_jack *jack;
 	int rval;
@@ -137,8 +137,8 @@ static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -176,7 +176,7 @@ static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sc7280_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -205,7 +205,7 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
-	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime;
 	int i;
@@ -236,7 +236,7 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 	int ret;
@@ -267,7 +267,7 @@ static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
 static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case LPASS_CDC_DMA_RX0:
@@ -287,7 +287,7 @@ static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	switch (cpu_dai->id) {
@@ -313,7 +313,7 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -338,8 +338,8 @@ static int sc7280_snd_startup(struct snd_pcm_substream *substream)
 	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret = 0;
 
 	switch (cpu_dai->id) {
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 14d9fea33d16..cfb9c8dbd599 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -34,7 +34,7 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_interval *rate = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
@@ -62,7 +62,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 
 	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
@@ -71,7 +71,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
@@ -83,7 +83,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	return qcom_snd_sdw_hw_free(substream, sruntime,
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 29d23fe5dfa2..25b964dea6c5 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -58,8 +58,8 @@ static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
 static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
@@ -98,8 +98,8 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 	int channels, slot_width;
@@ -183,9 +183,9 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 static int sdm845_snd_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret = 0;
 
 	switch (cpu_dai->id) {
@@ -233,8 +233,8 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *link = rtd->dai_link;
 	struct snd_jack *jack;
@@ -331,11 +331,11 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 {
 	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int j;
 	int ret;
 
@@ -421,10 +421,10 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 
 static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX:
@@ -467,9 +467,9 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 
 static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 	int ret;
 
@@ -506,9 +506,9 @@ static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
 
 static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	if (sruntime && data->stream_prepared[cpu_dai->id]) {
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 1a41419c7eb8..ce89c0a33ef0 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -12,7 +12,7 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	if (!sruntime)
@@ -64,7 +64,7 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 	int i;
 
@@ -93,7 +93,7 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *sruntime, bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 9626a9ef78c2..6558bf2e14e8 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -51,8 +51,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case TERTIARY_MI2S_RX:
@@ -73,7 +73,7 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 
 	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
@@ -82,7 +82,7 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
 static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
@@ -94,7 +94,7 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	return qcom_snd_sdw_hw_free(substream, sruntime,
diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
index 80c9cf2f254a..553165f11d30 100644
--- a/sound/soc/qcom/storm.c
+++ b/sound/soc/qcom/storm.c
@@ -19,7 +19,7 @@
 static int storm_ops_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = soc_runtime->card;
 	snd_pcm_format_t format = params_format(params);
 	unsigned int rate = params_rate(params);
@@ -39,7 +39,7 @@ static int storm_ops_hw_params(struct snd_pcm_substream *substream,
 	 */
 	sysclk_freq = rate * bitwidth * 2 * STORM_SYSCLK_MULT;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(soc_runtime, 0), 0, sysclk_freq, 0);
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(soc_runtime, 0), 0, sysclk_freq, 0);
 	if (ret) {
 		dev_err(card->dev, "error setting sysclk to %u: %d\n",
 			sysclk_freq, ret);
-- 
2.25.1

