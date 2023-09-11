Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F1B79B156
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:52:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C495E7B;
	Tue, 12 Sep 2023 01:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C495E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476332;
	bh=d+IUoRymcNcIRUe0F0RMqNLEGUtYBfXCcckKSE2cblE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CfCciEyIR+OUDddywTaiE/dSFWMCtQDQxloTvwnXxLl5givoRWGoa/Yb0yS804Ody
	 FyD7Rx/EYNGCnnqETuh+2Xls/BJiEl0/5NWIamz2aLQAbBcoPtICfWCbcN9qbBvtXN
	 9WqWDXMM1FV4IWdXq4PAOc1jm5b2qRep7UJqxlLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E706FF80602; Tue, 12 Sep 2023 01:48:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 831E8F80608;
	Tue, 12 Sep 2023 01:48:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66378F8060A; Tue, 12 Sep 2023 01:48:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 304CDF80602
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 304CDF80602
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DpIOwtD5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdWb/c/e96CUFm7YMvIzo0eUQ1IlhJFtV04LWA7TRPekIb/KHLtJEDBnpJy7ib8kK03ESgwK7ZuVBjCuWSdbkykrr9kpJgt2BTfHxm0w0XCwYyGnLZnMHs12RcnHr6PvjNSjTnOBYJF//4z+MmdElaVJ0rJhgbrf4kkHVzlpTsezm5X3V4WpVT5P65vCPnWoPRxqkjq2eSBA2LatQTUZTyi9AAHP/tIgNA3cOBzetAkqAwSScdmB13OJ6CoZvLfogknrWu0UIOC3cGuclFsf0iC3GPJcKfXhgVuau46BBsnn83ROOctnof5aGPrRMaceEiuKfnyXrTIagJAeB+2bqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zsqiBesuLXi7+iW6HRwRaiu2J77FkEu/AkxvXFst8o=;
 b=kLB0YOmLX2w5xl0ZicaolXk4qgAylN09o0L6NqA2uMZrrkCXQOCvLMbT7TwjenCs/DQFRqslXkRgfF1WS7gy76BoEOlhX4VXk8pxDY26CeIfoSMDIdvmjzVZO2pGrV5W2CGsck87ycBtsLr4Q8tClCvmJRxL8QP6tqraqFMP/9dF11FHn3xrC34YNHZQQ5BfPwrOm+EGR16qtwgybf0C0sWgMiMnNCa/mN40kdQxUMmT6vvMO3ppVUTd+ArBxzzoLYWxa4aEci7FQoq4Wjwpnd2/ckYrDEi0OMOufrpPk7xf6xXA6QDvQqYiRNTI42qyGTP+IvccEEz4EyM+vzIHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zsqiBesuLXi7+iW6HRwRaiu2J77FkEu/AkxvXFst8o=;
 b=DpIOwtD5OfPVeM5URoF3n/BujTTWzxkbHrZJ1alheKfzg9O4IjiuclhHh1MAhz3LWksX3Rngx9J2AS0w6CyY0oDoyqdRtyGK9poTRiDVxO0RV2VcAsOjSPT5yG2qjZ+Tf1cGrpPTGDKwzMjFjnVMaoT+71I5aXFggHWTsY4pIrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:48:33 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:48:33 +0000
Message-ID: <87wmwwqnji.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 14/54] ASoC: au1x: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:48:33 +0000
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0511cc-3316-471a-d6bd-08dbb3219c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NFZPeUoZX4fHHaNTzpbwWS4EfiwXR+ynqcHqATlQdUaF372SA0S0xIsc/zGGArqhohKEzoQP0adEQqEs3uMqXE8QXXTliUMETSgYSQ0Fsq6AunDR+rsknZ0RNW8s4VS4pIKbRmIk5pQ3EsBQCZLLCwPn1nEyZgLE8+eBySqEW3D+fGX44tK77iHFu/ski0O6LI3JKq3xj0h3m8TFTtILRZQjebqVGU/BByhVyhlUMYevj6JqHjvxRX8JuEtKSptPt0dk0k1oBATqlGkf/wa+xbyqDTYwupvC1BGoM2vttft76WjDR0hGrQIz6HGLv3IE0c65f7/0FhZbTEVCVPwfHJMEG/inSykLx5NzlTthQeYwUyA0y5nKYlXzxuKyxdyigsRV8UqFP6KKOg23fTDZvfsibifJ0gnO6Pgfbz2xqmc00bKjI0jn+KqX2X2AJzJX1Xx59dMideGfkJ7d5whmvW0hgB/NZX9u9tyfMYsqigGBI5GqV6t8ACLl5fCeHWLhYk+gL0xwzshutnxJNc9BMKbyToCR+FILKkXPRdRoF3hjeQt1FKUGUteLSuFH7upZyKokMxI7AEKHrK8F7QU/2kj1hsO45yfG9uG8EHinT+guHjuBAbP6PTB0OLfbcGF8SLb7BQNROYIlR+ouZjkdFo9fHZjT/EEWyGPyqeRTaME=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(32563001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zOZyQdYOeK7iJqeSfLPtsxCH/BpXGz0lgh8ZUbv4ygD4ys+fxbSJeAduHlr/?=
 =?us-ascii?Q?C0BfbqgaQWFnNXxjhjFHcuh96GRbr2jdYNREBdBRRFc10x/I55ymFvDqBpzm?=
 =?us-ascii?Q?MwMqC5UrMTKl1tAqEgCDQKgOtr0kK72ZOq2X+YFCVp7urbTio4OTwJ9G9Xna?=
 =?us-ascii?Q?E+ZdrrQyejRpnE0l9BhK5o3LeRhZtdWf5QVeBCFN69xc6fgZTXyvOTgMJG4R?=
 =?us-ascii?Q?q7o1ANOiwEQB3ITOE1nDLeCSoJkaadL9ZGJA0UuVL9vahz8vTb7DtEQk/upo?=
 =?us-ascii?Q?i/UeHQIa2ijcMbipOTPHugq6pcysBY5Pdr+hdSKGNwyo4kcDwXTi715gb7YM?=
 =?us-ascii?Q?MmvYR2tRXA92NdmYrS9N9u2IzXBh1atSpWHH+5fKIaZShQqtT/Tjw2dBTbKP?=
 =?us-ascii?Q?5u3+2Tra9ZdybmFFir2/SPbhJmaG4Ukjm/9Q29i7qXRSSm/T3NZfvh2QoD7X?=
 =?us-ascii?Q?OJHEoFFFsNh/MQMb0W+CZjizL9F1PFsquo5P9MFA/Pk2NYiQUK2A4WqyoMEI?=
 =?us-ascii?Q?kj/cZeNPkXQUZLcvU+A6/jjJ4qV4+YtmKpW10TGT7wGJc6/erMiZEPZtvXj0?=
 =?us-ascii?Q?uCzK1IO3NF7+bOYiLCkr52k9r4qGtOMwRUCAZy5A2ATWHzWprlLbPHquZ3D9?=
 =?us-ascii?Q?XuDUMl/jUWw5zTaHHconjWdF8Nu+BCb3egpLpbRTIKEk9n3xJlhBxDLGCNf9?=
 =?us-ascii?Q?+tkGdc4xBJKotW4kFhQDR61sen6SJ5p3hV59NAslP4H7x9X6O9RyrDPTT2wg?=
 =?us-ascii?Q?GmTIzvOg7rAEVS1swuMmi2o5ykN/PQZIRpRwEfIuaPOkcEM+ZQSV8dgE16xE?=
 =?us-ascii?Q?3NShT0YpRYJyaLMQ4XJVxfT9fYys75mU79ep2uuVP0bwE1e1nVtwqDm0xYGc?=
 =?us-ascii?Q?+sOKPCSXHIHx1k0ccZlX8VGeadout/d/m2uTAj9Ti9NTfd2YzR14hr9HMQH+?=
 =?us-ascii?Q?tLXUjuw6smb35+6/wHglTnRxwLd7doNiXBCe9p8SJuCf4EW9wsyFpcQueugj?=
 =?us-ascii?Q?t4x7AdnkLOE/vrpyYJX2W2PJgpinbaKa4Tq/yUoUKBuhYbkSpgEz3WeLc8Ap?=
 =?us-ascii?Q?8q6RAkifp3/xuKGPgy62N1xhigQLenWUi5c+c81bHrmfSUXJueI9vcj6qAPR?=
 =?us-ascii?Q?CBZVX+5KMke6ZZ8abkQtdNwAjZLiEid97F8gn2Wcz3IuN+jm+S2c6gXlW54v?=
 =?us-ascii?Q?1hIDqKj6h+u0B3i6Gwt6Ugqkv6oBhCaDtgQ5SfmpPA6MceDda5L0OqyJ72Ss?=
 =?us-ascii?Q?Or9pcYBHLXOMqp9oQLvNlubs4EP98nzLbqPFq6uDN/p98WTi935q7CqP6ALN?=
 =?us-ascii?Q?gC1hxC8elPAok/VENGrLZfJZguhkEodp14nYSZQYHHL6pKjBU+VxJFnYCx7L?=
 =?us-ascii?Q?FtLFUkS5/rE07/YhuFru7nCetWqmgfX9uZbMj+xuPvh8YcpiRKdAWBOTW8S1?=
 =?us-ascii?Q?j2hEOh47wAbqmN8DmlHQ4c3BGfZoLGY2ZfMTtJW3tVjh28p//CD4Pdg+Q2KI?=
 =?us-ascii?Q?q8924757yIaVdJNdurjH3SLnYCauPSwUxBkn6fXZ9kPuhgOQDzFLLxP37bUi?=
 =?us-ascii?Q?M5bZOeQ6gE59QCuwVY7/GYSeGLaL+0sHO7Dya8QIzbpllQGSMvYA2fMHjT6p?=
 =?us-ascii?Q?N4vR+qYF+LmgIWs8T2rK1q8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c0511cc-3316-471a-d6bd-08dbb3219c10
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:48:33.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eKd7xK0q62AjEfm0A4LJxKnpY21MhHJXCuARMuqpFjcK6QvkcjwbvocJugg8N+Zdaz2+gaYscbVX698tZaj1RonK3nOmPUPqeUoCH3VJL/hcRJNNfELRgnqfSvKw8Gcy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: 5PBP6NXFQXAB5RW7MWE6W6DXLXR5A2XR
X-Message-ID-Hash: 5PBP6NXFQXAB5RW7MWE6W6DXLXR5A2XR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PBP6NXFQXAB5RW7MWE6W6DXLXR5A2XR/>
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
 sound/soc/au1x/db1200.c   | 4 ++--
 sound/soc/au1x/dbdma2.c   | 4 ++--
 sound/soc/au1x/dma.c      | 4 ++--
 sound/soc/au1x/psc-ac97.c | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/au1x/db1200.c b/sound/soc/au1x/db1200.c
index 400eaf9f8b140..83a75a38705b4 100644
--- a/sound/soc/au1x/db1200.c
+++ b/sound/soc/au1x/db1200.c
@@ -94,8 +94,8 @@ static struct snd_soc_card db1550_ac97_machine = {
 
 static int db1200_i2s_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* WM8731 has its own 12MHz crystal */
 	snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL,
diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index 3d67e27fada9e..ea01d6490cec0 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -278,10 +278,10 @@ static int au1xpsc_pcm_open(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
 	struct au1xpsc_audio_dmadata *pcd = to_dmadata(substream, component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int stype = substream->stream, *dmaids;
 
-	dmaids = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dmaids = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dmaids)
 		return -ENODEV;	/* whoa, has ordering changed? */
 
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index 7f5be90c9ed10..d2fdebd8881bb 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -191,11 +191,11 @@ static int alchemy_pcm_open(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
 	struct alchemy_pcm_ctx *ctx = ss_to_ctx(substream, component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int *dmaids, s = substream->stream;
 	char *name;
 
-	dmaids = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dmaids = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dmaids)
 		return -ENODEV;	/* whoa, has ordering changed? */
 
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 5d50ebc2bdd56..1727eeb12b64e 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -58,7 +58,7 @@ static struct au1xpsc_audio_data *au1xpsc_ac97_workdata;
 static inline struct au1xpsc_audio_data *ac97_to_pscdata(struct snd_ac97 *x)
 {
 	struct snd_soc_card *c = x->bus->card->private_data;
-	return snd_soc_dai_get_drvdata(c->asoc_rtd_to_cpu(rtd, 0));
+	return snd_soc_dai_get_drvdata(c->snd_soc_rtd_to_cpu(rtd, 0));
 }
 
 #else
-- 
2.25.1

