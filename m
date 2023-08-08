Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 210E5774EC8
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B079F857;
	Wed,  9 Aug 2023 00:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B079F857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535510;
	bh=hY/fA2x/HhYaBhZWeA5u2P4VdmnpWAV+wPiTVbf3nF0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=czRinAAo+tOMRU3OjYNtow1TMdakOeKsQ7wvCTCpFxnMlrAvVHAjKuO3Gy9/FU6Pr
	 kFsST0OjYdXVFkoSOPD/VeVTZOTMmgjCVQDHNFRZHsoW4I1WiNKYGvGSq0DCQMhp90
	 uX1RQeQoCbcDirAAiEurLboAiKj3nN6SXhtY+e+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1702EF805D8; Wed,  9 Aug 2023 00:56:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CBBDF805CA;
	Wed,  9 Aug 2023 00:56:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 455DDF805D5; Wed,  9 Aug 2023 00:56:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FEE9F805CA
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FEE9F805CA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ixvGdphs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHUZrhz/EqPjmGOym6ckztv/T7xssUpRWAxLRSYkFRPAfkBlWmLMu45pLj3Cyw6W0vZ4lZbQuZKBmhFAlMcUd2SdPk6pPAX2GztlYXFQAOc4CvI8gYnXtO1hnnj0DzkOPuXVeM5dYmS4Z6ffaVctcLG8RLnkA1VX1WSj5XkuRUP8x4U8Xfc0b6rlClb/58n8AvaBFB11wnBc1Y9/ZU8sfN/PzM5P/yfkpSkxCP8BsZnfpAECOGCgV6VDp8HcFfVd7j7I3IlK13pOWnSXYazH0lS3p3mPwF464SPoCxEVqGTelMEkloGLrcn4lFxKIvdLTxdhyq10VHWLa6vueq3Dxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u56ZyqAfHiphX/NxM2TPY+78jTH4MiJCCjb8MBFx+x8=;
 b=kCRrbpPeK2DafX5knxCoUvRBIZgh1wNczO04OdMS/cjIRtYasuHCzvhnMjQJNcWOQs9zzdNr90j6jcL91YdP9T5KulgpsMSHvXWau6n2mHqv91+wvUkSRDSroIYoynWflN5BzXs9n5d6qdpWhuEPFyIlkz1FmBa5rS2x4IJcZs9y4xVlpIa9B6a5Fzman1jBAdj6m9Bwk1rFf9uZLWVhHp+zwmJFuB3I0LLsRkrqfAsMgAr3kb4mqOcq7+IHvsl/ODukAtOdf4+j/tiBPxyuRe/PNrAziHBG/6rodU7cuJg2aR1zjphBSOl6oMzHsIiwmJkqKQsSJUmRn03Z1x3qUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u56ZyqAfHiphX/NxM2TPY+78jTH4MiJCCjb8MBFx+x8=;
 b=ixvGdphsRpvpVyJypqJNUnIln8PucNhgPUNZ3amCxIgyO5FRX4IC2ACJCqqQhbNWeV59kqZTmhZ9CUzWwKUgqA0x6jyLHoTi7+/ebMQZMIuTkXaXRA64TEiFYh298u7zcbT4z5h+aIOJPrm+lVu4dvUDM2wPLWaCR14x81902LQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:55:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:55:54 +0000
Message-ID: <87jzu5b0ue.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Chancel Liu <chancel.liu@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 09/39] ASoC: fsl: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:55:53 +0000
X-ClientProxiedBy: TYCPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 761a428f-786d-4231-aed7-08db98629ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xXVKSv0zTljjRs3B8/ezSjpFnrkM1R4as38xhbct8ERzvn2pIiHZ2ke7FxutOLxqI550CIVIZTXaQKqOB/YdYQnwEpYt3TitWdSSB5MMmrZ4gURy+ANGZaWRf17L6Iq3pr9IAjy2nSFA7YUQC2QJzGh58JGOoseOMDRmEjuq6YxLX9EUNPDEAGI7wvkjot2KbYq+Vj4qF1FPy5CwsEMmOr0oRUU+J8ZZXQhIczQP9tXJhjM4fhimA3R2ajZ0jPeaV62XlovqQBwoMhSWCdSrG9ZMW6bSPBE1EfTl6OWiDZ6+rpIS4TmHLbj+QVujvkz6LtyacvMh+5wXrVG5odUGqsGj6pUw6d/5JyuZ0NDGqTfB66uYFVoOIOyXqoBL1Tg9XvlJOx06IV2Yi5E2972ldDt62GKQjIM5tzEccLBNS7hjD6dbL+GZBB83LUgF3apH6dqxzaZ1nN9CdLFyUd+wyD53OomY+fwceGkOJmZptF8HfAkgvJjSz0v9I8J559pOMGmw8jmUi/0pGcs26f1zqPJE9Z3U3hI8ld/psoIUGXlHZESPLPC4szBZTjahEvQz3JJE4TjBoSAZ4Sswy/Y7cldxb8pQPQcgO9pr3KQAKOpr+Wq6cmjFJv2Udw6o+MQ+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(30864003)(316002)(2616005)(41300700001)(86362001)(5660300002)(7416002)(26005)(6506007)(8936002)(8676002)(110136005)(54906003)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c+fZ1APk6mOO7F1G7DI+85RgKsHkcnmCw9N72DNbbjUWvPqJaP2daLmo23wq?=
 =?us-ascii?Q?km5w0jSL8LSYEvDvbvVH5FgYfWLnMqL0MKH8USWuUHhTIvNPsdlw/1f2cuE6?=
 =?us-ascii?Q?Z8vNysvEf20U1cJ4kfEOe9zb3xXE1OA2wytteLvmhCgEbRqDmuQjV8/xn2Rx?=
 =?us-ascii?Q?4ZELxv311ljP3QDIm9Iuc6biREext6iPsOpKNXE3bdXNJbnfxJrVGpDqzixD?=
 =?us-ascii?Q?ueyC8Rd6OZkK0edCJnxngEZ+6a6Ou0lqnoFQZhnyAi3TKpqCmGZXc4PbYt31?=
 =?us-ascii?Q?LrBNb/yfm/9fsddCcJEshWaVGv1hk2YxqA+SYNGj/HQQ5dzUUe+ic4Go6kl6?=
 =?us-ascii?Q?N2pnqZZjlpkIli9WkY/2sD0bKEQPDU1ESY5NCoJ4okcoC7OmQBOqxQWbyhvU?=
 =?us-ascii?Q?Ij08uwuMVhvVNVpToscSJC6XMkhMGhG1Ly9Kd3K4IWUpOvLlyYlQ4mj8jweW?=
 =?us-ascii?Q?F8/OOvlHNnKyET1WbblwBCNU+ZJzC/RrQHPA5Vf4miFAwvb/fj3CFHZcpir1?=
 =?us-ascii?Q?qIHntgWB/itlgsp+te9tXYinc6DDS79V9cEU0K+qQkjPkocq5y6PGZ0hBx+V?=
 =?us-ascii?Q?OqWONIz8nzXyVhoa0NV6WGDYM7/PKB2ogLrTZqCeKs3UCrHaB933oKXrKwjK?=
 =?us-ascii?Q?aGymWh6StFpXPeOXpiGCDnsVYBkMsL1l2lDGhE6ppHqJ9+v8Rh7Upn0+m4B1?=
 =?us-ascii?Q?VVwjx8LwflC4gjcQNfDkY7HrE+2apTCGaDUy9D85i/LEqyorXieE4FnLWtzE?=
 =?us-ascii?Q?fimzN1T+rZO+qb0SI9W7W07SdtPKT+u/D4wvj27HZ/6vScKvnIxzccsSHHWh?=
 =?us-ascii?Q?MDiXoF8U9drIe9HHcNWMlg+z7uOdZlSDJIR5OFqrCi+0q4RyoqUskJ7tCPWI?=
 =?us-ascii?Q?ym7LhbLcmPudA26kLqMsFO9PNuYtKOViT883yvzehtoIgItAf5j65LsbEqaG?=
 =?us-ascii?Q?qRNV90gxz/H4pa9ixddP4jFfpdqm3x/8aEwh03Fjz5xopCj2z9DWUobOLH2A?=
 =?us-ascii?Q?c/ZydIvj/BGmvt8byq/hLicQkX1B8Qb9daD78VtGiPHzb+BMhdmawhfzJGcY?=
 =?us-ascii?Q?82NpGe0wn8zAA16QXVjK/MHh840KhSXonvFXcFgXa7Li8yM7JgR63lbTyuFi?=
 =?us-ascii?Q?gTviCgE3rubkzfQZ6Hl5g5IWs4CCkBEaomddq1tkniO08wFfIWU4LTrMVbI+?=
 =?us-ascii?Q?CaQUml6TZaiH1F5LNv/i2smSZJwIpPtUU+xfZWI4pJJy8u+bn0rviCup+2ny?=
 =?us-ascii?Q?6CeWQMY/uRW4CPxrbINV7p0BUv2sh7GzkfOwG89h414kZUcVGaZf009+A1Ed?=
 =?us-ascii?Q?F5NPW5FTiawjUM+7Gr0CCP5bgTLVNB/UcAaYpje/1y2UYl0ohlg1WW52/YwE?=
 =?us-ascii?Q?JANGylLaHEUXa2I7VYIyXoKr5TocDc0eERexwqQ+VJy7VnqfeR1yN5HuBlPk?=
 =?us-ascii?Q?JQGzDL/iDjU4ebC16vlalIFSXYnZkI1wt3Gr8E2izxUW6Z7StmKKQnHMKCVn?=
 =?us-ascii?Q?Im5QV+Nl+I6wODhBpCFYLzApwFEAlIFGz3DtCspAYShrXVaDIERY0FJvmPfs?=
 =?us-ascii?Q?GA3DDDW53Hhx8+okUhDGgK0vFfRRU8rZVp3EIo0BrRxXgEH9wuzNKa3+jNi8?=
 =?us-ascii?Q?WJ6WRgbNxD2m+gVLZY9iD8k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 761a428f-786d-4231-aed7-08db98629ea7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:55:54.0194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 njyWB7cJDGLExOpzjmxQJgudPSJmaAE/vl+pPP7VFnHcEfuhnmUn52bMDNhP7ifly6PEAIF2Sb0/zxk2Fwke436Z03pCMYBG22HwncsTkcKIeP7IFz54O33VwHKHoY4v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: 5HDJIDRGNLN2L3OMR7W567D2DFMAT5U4
X-Message-ID-Hash: 5HDJIDRGNLN2L3OMR7W567D2DFMAT5U4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5HDJIDRGNLN2L3OMR7W567D2DFMAT5U4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl_asrc.c    | 16 ++++++++--------
 sound/soc/fsl/fsl_aud2htx.c | 10 +++++-----
 sound/soc/fsl/fsl_easrc.c   | 16 ++++++++--------
 sound/soc/fsl/fsl_esai.c    | 20 ++++++++++----------
 sound/soc/fsl/fsl_micfil.c  | 14 +++++++-------
 sound/soc/fsl/fsl_sai.c     | 24 ++++++++++++------------
 sound/soc/fsl/fsl_spdif.c   | 17 ++++++++---------
 sound/soc/fsl/fsl_ssi.c     |  3 +--
 sound/soc/fsl/fsl_xcvr.c    | 16 ++++++++--------
 9 files changed, 67 insertions(+), 69 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index adb8a59de2bd..b793263291dc 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -780,13 +780,6 @@ static int fsl_asrc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_asrc_dai_ops = {
-	.startup      = fsl_asrc_dai_startup,
-	.hw_params    = fsl_asrc_dai_hw_params,
-	.hw_free      = fsl_asrc_dai_hw_free,
-	.trigger      = fsl_asrc_dai_trigger,
-};
-
 static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_asrc *asrc = snd_soc_dai_get_drvdata(dai);
@@ -797,12 +790,19 @@ static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_asrc_dai_ops = {
+	.probe		= fsl_asrc_dai_probe,
+	.startup	= fsl_asrc_dai_startup,
+	.hw_params	= fsl_asrc_dai_hw_params,
+	.hw_free	= fsl_asrc_dai_hw_free,
+	.trigger	= fsl_asrc_dai_trigger,
+};
+
 #define FSL_ASRC_FORMATS	(SNDRV_PCM_FMTBIT_S24_LE | \
 				 SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S24_3LE)
 
 static struct snd_soc_dai_driver fsl_asrc_dai = {
-	.probe = fsl_asrc_dai_probe,
 	.playback = {
 		.stream_name = "ASRC-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index 46b0c5dcc4a5..fc56f6ade368 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -49,10 +49,6 @@ static int fsl_aud2htx_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_aud2htx_dai_ops = {
-	.trigger	= fsl_aud2htx_trigger,
-};
-
 static int fsl_aud2htx_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_aud2htx *aud2htx = dev_get_drvdata(cpu_dai->dev);
@@ -84,8 +80,12 @@ static int fsl_aud2htx_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_aud2htx_dai_ops = {
+	.probe		= fsl_aud2htx_dai_probe,
+	.trigger	= fsl_aud2htx_trigger,
+};
+
 static struct snd_soc_dai_driver fsl_aud2htx_dai = {
-	.probe = fsl_aud2htx_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 670cbdb361b6..ba62995c909a 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1531,13 +1531,6 @@ static int fsl_easrc_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_easrc_dai_ops = {
-	.startup = fsl_easrc_startup,
-	.trigger = fsl_easrc_trigger,
-	.hw_params = fsl_easrc_hw_params,
-	.hw_free = fsl_easrc_hw_free,
-};
-
 static int fsl_easrc_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(cpu_dai->dev);
@@ -1548,8 +1541,15 @@ static int fsl_easrc_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_easrc_dai_ops = {
+	.probe		= fsl_easrc_dai_probe,
+	.startup	= fsl_easrc_startup,
+	.trigger	= fsl_easrc_trigger,
+	.hw_params	= fsl_easrc_hw_params,
+	.hw_free	= fsl_easrc_hw_free,
+};
+
 static struct snd_soc_dai_driver fsl_easrc_dai = {
-	.probe = fsl_easrc_dai_probe,
 	.playback = {
 		.stream_name = "ASRC-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 936f0cd4b06d..d0d8a01da9bd 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -785,15 +785,6 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
-	.startup = fsl_esai_startup,
-	.trigger = fsl_esai_trigger,
-	.hw_params = fsl_esai_hw_params,
-	.set_sysclk = fsl_esai_set_dai_sysclk,
-	.set_fmt = fsl_esai_set_dai_fmt,
-	.set_tdm_slot = fsl_esai_set_dai_tdm_slot,
-};
-
 static int fsl_esai_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
@@ -804,8 +795,17 @@ static int fsl_esai_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
+	.probe		= fsl_esai_dai_probe,
+	.startup	= fsl_esai_startup,
+	.trigger	= fsl_esai_trigger,
+	.hw_params	= fsl_esai_hw_params,
+	.set_sysclk	= fsl_esai_set_dai_sysclk,
+	.set_fmt	= fsl_esai_set_dai_fmt,
+	.set_tdm_slot	= fsl_esai_set_dai_tdm_slot,
+};
+
 static struct snd_soc_dai_driver fsl_esai_dai = {
-	.probe = fsl_esai_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index fe28b27e50d0..550bf4da36e5 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -717,12 +717,6 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
-	.startup = fsl_micfil_startup,
-	.trigger = fsl_micfil_trigger,
-	.hw_params = fsl_micfil_hw_params,
-};
-
 static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
@@ -760,8 +754,14 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
+	.probe		= fsl_micfil_dai_probe,
+	.startup	= fsl_micfil_startup,
+	.trigger	= fsl_micfil_trigger,
+	.hw_params	= fsl_micfil_hw_params,
+};
+
 static struct snd_soc_dai_driver fsl_micfil_dai = {
-	.probe = fsl_micfil_dai_probe,
 	.capture = {
 		.stream_name = "CPU-Capture",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index f7676d30c82f..1e4020fae05a 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -849,17 +849,6 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
-	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
-	.set_sysclk	= fsl_sai_set_dai_sysclk,
-	.set_fmt	= fsl_sai_set_dai_fmt,
-	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
-	.hw_params	= fsl_sai_hw_params,
-	.hw_free	= fsl_sai_hw_free,
-	.trigger	= fsl_sai_trigger,
-	.startup	= fsl_sai_startup,
-};
-
 static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = dev_get_drvdata(cpu_dai->dev);
@@ -885,6 +874,18 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
+	.probe		= fsl_sai_dai_probe,
+	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
+	.set_sysclk	= fsl_sai_set_dai_sysclk,
+	.set_fmt	= fsl_sai_set_dai_fmt,
+	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
+	.hw_params	= fsl_sai_hw_params,
+	.hw_free	= fsl_sai_hw_free,
+	.trigger	= fsl_sai_trigger,
+	.startup	= fsl_sai_startup,
+};
+
 static int fsl_sai_dai_resume(struct snd_soc_component *component)
 {
 	struct fsl_sai *sai = snd_soc_component_get_drvdata(component);
@@ -903,7 +904,6 @@ static int fsl_sai_dai_resume(struct snd_soc_component *component)
 }
 
 static struct snd_soc_dai_driver fsl_sai_dai_template = {
-	.probe = fsl_sai_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 95bb8b10494a..78d9dfbe6548 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -765,14 +765,6 @@ static int fsl_spdif_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops fsl_spdif_dai_ops = {
-	.startup = fsl_spdif_startup,
-	.hw_params = fsl_spdif_hw_params,
-	.trigger = fsl_spdif_trigger,
-	.shutdown = fsl_spdif_shutdown,
-};
-
-
 /*
  * FSL SPDIF IEC958 controller(mixer) functions
  *
@@ -1283,8 +1275,15 @@ static int fsl_spdif_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_spdif_dai_ops = {
+	.probe		= fsl_spdif_dai_probe,
+	.startup	= fsl_spdif_startup,
+	.hw_params	= fsl_spdif_hw_params,
+	.trigger	= fsl_spdif_trigger,
+	.shutdown	= fsl_spdif_shutdown,
+};
+
 static struct snd_soc_dai_driver fsl_spdif_dai = {
-	.probe = &fsl_spdif_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 2,
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 53ed3701b0b0..079ac04272b8 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1152,6 +1152,7 @@ static int fsl_ssi_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
+	.probe = fsl_ssi_dai_probe,
 	.startup = fsl_ssi_startup,
 	.shutdown = fsl_ssi_shutdown,
 	.hw_params = fsl_ssi_hw_params,
@@ -1162,7 +1163,6 @@ static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
 };
 
 static struct snd_soc_dai_driver fsl_ssi_dai_template = {
-	.probe = fsl_ssi_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
@@ -1187,7 +1187,6 @@ static const struct snd_soc_component_driver fsl_ssi_component = {
 
 static struct snd_soc_dai_driver fsl_ssi_ac97_dai = {
 	.symmetric_channels = 1,
-	.probe = fsl_ssi_dai_probe,
 	.playback = {
 		.stream_name = "CPU AC97 Playback",
 		.channels_min = 2,
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 318fe77683f5..fa0a15263c66 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -888,13 +888,6 @@ static struct snd_kcontrol_new fsl_xcvr_tx_ctls[] = {
 	},
 };
 
-static const struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
-	.prepare = fsl_xcvr_prepare,
-	.startup = fsl_xcvr_startup,
-	.shutdown = fsl_xcvr_shutdown,
-	.trigger = fsl_xcvr_trigger,
-};
-
 static int fsl_xcvr_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
@@ -915,8 +908,15 @@ static int fsl_xcvr_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
+	.probe		= fsl_xcvr_dai_probe,
+	.prepare	= fsl_xcvr_prepare,
+	.startup	= fsl_xcvr_startup,
+	.shutdown	= fsl_xcvr_shutdown,
+	.trigger	= fsl_xcvr_trigger,
+};
+
 static struct snd_soc_dai_driver fsl_xcvr_dai = {
-	.probe  = fsl_xcvr_dai_probe,
 	.ops = &fsl_xcvr_dai_ops,
 	.playback = {
 		.stream_name = "CPU-Playback",
-- 
2.25.1

