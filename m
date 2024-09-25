Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B99869D9
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:42:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9B2F83E;
	Thu, 26 Sep 2024 01:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9B2F83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307755;
	bh=Vw2xYdXdckIo0v/pRr6zwYaapVl4vL3esBItTt93teM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uAI7OkCU7D2m9ltczk4tv/3B7vqay4Y22axR5lbyyr27UJie1Qrdo+7nXuMd1HxCr
	 diSpl+gX2Ot4rifUrG+y1q9F2d0AquDwop8SjmzYjv6qjhF0SuCMANgtF0IexLZTG2
	 kxIw2Z8E7G1pwXOwqItMf6aPvgnr5o3Vn60hcBrg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1F9DF80692; Thu, 26 Sep 2024 01:40:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A14F5F8068F;
	Thu, 26 Sep 2024 01:40:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7D3DF80689; Thu, 26 Sep 2024 01:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C350FF804FC
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C350FF804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GMcg39m8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyGc5zXINXG4J82nozvzon1rC2GhHNJ+zqS0DKfWVEwcTAArvTpIQYRvdabpUgSjxBvr/NhZAEzCKk8CeJe9yw/kaeVVhhgBQnw7bzOjElsdB0l9mJ1SMwzTOhAw5WmY+DdlIpfx0km8i9xhSgVznKBaEuEeVxzedm36ZtU1wQWXtkvv5AncV5NyK1vQdNAzneU9OEbiop1PYGvxQvslsp2r262ZzAmPoh0IdpLXK5Dx/pdbX1CGk+IF5xa2SwK0sbW+Ps7p/tM4q9sTjUgiodXpH8DwPi9tJudIMCNh/fxxe6u7zgNO5i+7uIj0E16U6h4zsEfXOEFjZvfN4PRRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOovbfK6vR/xOXcpsAN/tbbxAML/E0D1rQC/dk4nId0=;
 b=ax4kasyB/qPNqEPRicXUvZDcNQ/tOs6v+0e0D8OduCYoemKKQiyK/lAiHbFM8TP8rzS9pb4B5glZd2CZcX+RNTGYpicCBYz0pOzODI8AfyC+XbGxIvNiCip0ioyPX+QfcnE6azJbiLFLFDNEKjPqe52ynGqMzyxh9YVfW1SrWzF6oAELDV+3Iz8370pV984h5Wd3zD9XROW35qzroIsd+Uu7zvwXSCuO2IOdMa4MVBgw+eCHuJD35fwZEsfv+3AMVNvK2Cq8cWtD8DV2GSFCNx3EIf1cXUhTPJb6V1f4XW1IGb102wW7L06HELH8tNIrUkiY7yy55sVnRabx2j7nHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOovbfK6vR/xOXcpsAN/tbbxAML/E0D1rQC/dk4nId0=;
 b=GMcg39m8is6QC9ABzrLAmQZdL5l/x6fAqN/p877MV2UWB6+2qt0nC6ZIzodiGB/Nt4s0rsTE5FCVj7z1FI1JzhyoBPJRyaYOk6b6dWndqrHlEDjvOYX2Raf1uMfzRK5y9lR1dMePgDrvV5VP0u0CGaojJ2SULPhpsWt+UuKqS1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5759.jpnprd01.prod.outlook.com
 (2603:1096:400:41::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 23:40:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:40:25 +0000
Message-ID: <878qvf9uaf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/13] ASoC: soc-pcm: merge DPCM and non-DPCM validation check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:40:24 +0000
X-ClientProxiedBy: TY2PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:404:a::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: 258bd381-d3a1-451e-ce0e-08dcddbb6db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5zwjGjopT9qlzvaAT0UpJLp3r3SxMYxV+Pr/zXNIMqKTOSZ3UDU4kqakKgZG?=
 =?us-ascii?Q?c9YTpx5AoehI7ZWBFqu2HwUSzrLuI3GhvP/cwq6WL3YXCBk4UkrRKZ/hxgz3?=
 =?us-ascii?Q?waytufSw+JKD/r0n7Qdt5cUC6G+f+qWSbucGejM0QaILaYZFe5VVOtpIEBe7?=
 =?us-ascii?Q?a6iWAJAlsY/9M59LFXvkUnWHDO3IMkf9Eo6sFqpAKUII8lYata+d2LEdunMR?=
 =?us-ascii?Q?SIGYZA668s/MB8LqZBjcicV9g3pREhJi8jSMIAAR40MDuRmh7tk5ho8d7h5J?=
 =?us-ascii?Q?7IHHV1meFniQv7grwplAdJ7v62SVXLwDI+hnu8H0hgRXD8E1rGvUz336gFAS?=
 =?us-ascii?Q?Vc2+fyt+nofTJy+oHcYp0+NeFxj/AqxDzhZsYmirAJjwWoylMhdnJ1Be0nbE?=
 =?us-ascii?Q?+MQcqgNfEPYCJqjgT2ayJS9KMVxf1XcpE0fxDzDF2+vPFeMht2RWmDxrE1lg?=
 =?us-ascii?Q?YGyRSAZHMQeBApRVhI5RfcST4iXxPgq9Fwx5h6hoyfn9blPGqGv3zSHzj4xG?=
 =?us-ascii?Q?Pyu978ubZ9GIR9JQlgPf4ASXTWBsPRfscbaxXfh4Si9KX6GSvVUQG6qw179q?=
 =?us-ascii?Q?wwiMiU3F64rSIXNtDIdI/khNJFUsZtyTfvz2jk0Zcgd7tKXC/kK9W+R+BMTu?=
 =?us-ascii?Q?D5zVOO0EslWP90+1DiKzVoQsdonWfeqiWHTv7eUO0kFKlkOrcBHxV7LDk+wL?=
 =?us-ascii?Q?ejzau3MsY+mIauj2Z28MNOHkrejkeAooZVGYmx2BLIeWlAxn+mvSx6HAYIsk?=
 =?us-ascii?Q?u2D2ig3QNNqCVSxM2rIjBcEVPMF1iBrMKkcP5QSUsyXntDA+2UGkjVlcIJCK?=
 =?us-ascii?Q?FbUvtHG8ity9ZOYdqM8l833Hi3pd5x9xdbYg7KrwcUaUXy40ExB+xYhtYq1G?=
 =?us-ascii?Q?86+WgR5Rd2T61G8sqzjc1egppPm63D6sPimSedMLIWW1wl7kQgxoNsd19kT2?=
 =?us-ascii?Q?lrvwVuHOAdyDCKhYGfL+qpMsF1Zizd3XM/BZsG8s3sD00rIYTPGSOfGIVl6y?=
 =?us-ascii?Q?VEtj7w15pIDYaHUZSBgHRdp6W/jybChKYhx+19Eao0jjy67ZefiTa8c5TsY+?=
 =?us-ascii?Q?0+rQwrRzW5XJ1U9solxvVTOQjmhv0FMQcsqqDllxlmEB+QkY/p6VYt2KhLRV?=
 =?us-ascii?Q?nj3Dper7bWMV0ROJvRZpDTKnhwdysEZPqrOj3uw5eL72JewdS4Ly//y6wTDX?=
 =?us-ascii?Q?IoyDbFakXlLBTK7H42xpCV0tLbyIUjKacqma4idQW15jIkNhyMNZ62jLm93w?=
 =?us-ascii?Q?9UtrPmuVzTEio01TDnA0L7W0+kHZxRVaQV2bGrsb43G4esdZl7dlxLlZ0HAc?=
 =?us-ascii?Q?rA44huRqmoNF9dC74k9iV+eUXtJ52F4LNjz2uFuA3DeBFw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1xuS+qXtXyqkAHY0cGBt6pp1dxklwNVp4S7oL1d9dNzdJhKgBbmGK0GR9uTl?=
 =?us-ascii?Q?UnNbqveiVZ8XiQQdBnr4N8lvZhcffbj+9vz20zCRt99zVeEHmwvrCgblKMCn?=
 =?us-ascii?Q?LENzKNe5atXz+rMPbcsctUThqM0htL7TlB9wSuUeGZSSK2ZBB1a69UoXbDNR?=
 =?us-ascii?Q?/9o82IOYB27DwpwOHPMQycnTCF375p/w3wKE1gNQpf+y1Uu65mmXvQompcHL?=
 =?us-ascii?Q?Agz+SpIbPxoRaewi0x6QNj2Abb+fDqwPUzvj4W/3BEY3HCoscBw4xqQ6j/bj?=
 =?us-ascii?Q?2L7Z21aNbv8iiE3uZKweL4MNJ2MAnB7z81vMUSmKHeNe7VcRvHxWB29sHQRs?=
 =?us-ascii?Q?Gx4juwJF0DYuFFypR8IKdVlshw/rV6PuXDCYQKMCytNuOtTeloaYPdukfSfY?=
 =?us-ascii?Q?8QWmnza8XHL23GgKEbOff7j1XAqabYcMq00aVrzMiZmXIf884WC6woBomuW4?=
 =?us-ascii?Q?vA76sOYhlVm2ugm4Q+VuEagyas10hT2+peI/Zw4cgqpcsbEsvLrjg5NUbl4I?=
 =?us-ascii?Q?82ntd/jMc6oRr8S4sGFe7l7U5Ajm7ZW9VKvHJe116LZciCwWNnQfLiHUBTqx?=
 =?us-ascii?Q?+xiGDKwxdU1Cq9q8TdiRhK70QXFFA4ctK9igxQX81hdnSTiFtr7qv4usG3WZ?=
 =?us-ascii?Q?LsbgA/Aatv2w0AcRzyBLfP61KqjCFKyZPFqRNk3FlXE0xfgkJR4dUYGV7RK4?=
 =?us-ascii?Q?1Ae9hVBjOtuDg5Z5k74KUKmXXw3ax/tPtCCLsevfojdK5sTVtVWmq/WmO77R?=
 =?us-ascii?Q?XCzbmG7z0YovpAdtD54UDzkQmuLvn/9VLbmpjRcbUBEE7IgR+HsC2G+w88Xv?=
 =?us-ascii?Q?/Hq4wTZIBSEJkb9HkXbE6YMhNBLgTmxOiIyqSbJL+Iz8yXmslbM25f1GjFYF?=
 =?us-ascii?Q?hyX589RtpM2r7VZk3p4BnzkLE3cMa8CVKp9OnvdUxYRsgHO6tz3DATGSR9xA?=
 =?us-ascii?Q?rzR2vjMiHZHl2WBbiuqjB9IT8GUV1MUGuTX6yq4iogeo/C/x3lV+dUX/LVdJ?=
 =?us-ascii?Q?XEc1l1gedurH7V2uEag/henHyKBaV6YOIDqt8NYcPg4D0/z9BP18eHIjNI/6?=
 =?us-ascii?Q?3o+QxcEenv6jY6emMtQ3T+N+6WTbzBkJ3nPORNQucbzk7RIt33FNLXKPtGaC?=
 =?us-ascii?Q?cP05moemVW7XJWvNlmUcr3E+UltwaH9tKta7xbikpla+jzN7IUwoKv/P6NCA?=
 =?us-ascii?Q?2IYuzFdSAoI9AhAuaDsy/Q5SVk36c/diqGnx0v5dUpdPJNTr5EaPaIUs1t5n?=
 =?us-ascii?Q?vxk35x3WNeukJMrfVIxRurookAErwZCSqKuPP8CaxZakeFqc//asoKTQ9ntE?=
 =?us-ascii?Q?YiypYdazJXZJHFKiAEpzOqXeYmhKDJf5FIifCazVKsaNnxBkDUzKshAhFjt/?=
 =?us-ascii?Q?Yim0VO5yJCQVxHGDloaB4PjlCQktbw8i3ny3vleG1pjwl/6yqIrZzWkPf4Cl?=
 =?us-ascii?Q?QNdDyleud1236KwSVqXqjzcWN65lm4GADL65QeLZNaUfE1vPbwAj7Nfa1uMS?=
 =?us-ascii?Q?IUBZgm1mIATUi5qNI1klesooh6vNok2ZorK0A920B7DCwskJCMkBt7v2UNOJ?=
 =?us-ascii?Q?olZ4id8QpbA6dyY3Zb+/kKduMbIsVug8YBckWC0GALzOrSt+4QZTUtdl+kXL?=
 =?us-ascii?Q?QcF5mfIU7MYudxK1wnLs+t8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 258bd381-d3a1-451e-ce0e-08dcddbb6db6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:40:25.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jEvt+hwa+5Ug5vhg7tY5DS6avvLd7O7A7niLUMIanEn3xT6Ek3KdloNU+9uwZnf5SL5v+6An7PwQ3FWO1q3TlbyOs2T5oIAEHnLx3T76+6DdglBMxE30QV+zisWIWJcj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5759
Message-ID-Hash: P66LBWMSZJVYA7W2R46QBLARMWWXAQO3
X-Message-ID-Hash: P66LBWMSZJVYA7W2R46QBLARMWWXAQO3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P66LBWMSZJVYA7W2R46QBLARMWWXAQO3/>
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
index 27810f6f86302..76cfb6b115445 100644
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

