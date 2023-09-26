Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA77AE5CC
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30910EAF;
	Tue, 26 Sep 2023 08:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30910EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709548;
	bh=fdem2BFplzcLUYI0ONlnz+Y0r1l17M3BA8JTlrrYrrY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rGe7wcXFWpag8HQBd2AGDuA1jIT9Qcyd7+4sKqQH0E0dqpQk3o4WySAi0Tt0A0RrT
	 2xNL3y09OniG9pMQHStGFLm2V5S/VSg7ZOtpYPMK12Ucjv1Ebm6tohyv3wUMkgYpcj
	 f5fgRw8HTIJpqFY6vwr3Sex4Zv0TJ/DQJIOyou38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B972F805F8; Tue, 26 Sep 2023 08:22:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7383BF80571;
	Tue, 26 Sep 2023 08:22:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB4BEF80600; Tue, 26 Sep 2023 08:22:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCE7BF80571
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCE7BF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XJg2HjH/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVsZRT01MFntz1ultU+rRN4bJZTTqHv4T5r4m2Ize7ixtkI4GYbOD9QSSFOpZD56opCkK/jNwawV3gi+HlNNfWyyxwO2a9lw9/MGj5uG0pBqtHKueAt7IKVVvMWIQYbDomVf0TcdAa4PPtYgLkSotEkjiAb6RJQ+zwvDpSqqoj6g7+xiU8vegFBaP25EW5JuEoMsWoHglGNvJOvy4SzsxF76J8l1jNNQh4PgvgItHMbYfqeXrgZNlgoOEHe1aW70EJ0rCCKXNbcIqFBIa9+skzvZtW3CelQLCYnpCPVGZnrLa1GQcmLcxbdheeA7e0Rrr7gckPODVPsX4zJZ5t4HnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NhSl7FqdQmI9Tx4a5bSUNdX6rKe6H84go9qUBobzgA=;
 b=N638/UKmkmkPJ59b/LbHx+IABIzk9vfC02Bx4uwm3Y7DG2rQeB0W7GH41CuqVq/XzFOkZ6uA8OqKqNy4TyzQMwMB0gPiVABFhTqMf6/uEqbGfdZvUhdDeVug1uRlQiacQVOI6kYeEuW6DW9gvN47Q1fLqf/ZU6luH90+T+deLH6FOrWeoETeLyvFwseNFmMwyRScgUI4vZIMSJPpiPFg0WehyEU7SIHtoP8xB35VXzjxdjyzS60/j3QXV8RqpX0fKt04xUKfuwXqRGmigII71Ay+yEKoj9pympHMVxcJordOiRHrOzH48XSYAEHJkSrZCjtKh+PeF+rQwak7L4gJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NhSl7FqdQmI9Tx4a5bSUNdX6rKe6H84go9qUBobzgA=;
 b=XJg2HjH/66M7290eyo3ReJMPc7Q+nk3ltK7hQnal+HDgHhzpE79Ifckdz5D0zM+YAMK0J8neJB6+t1fjtvPmZrSmr8acEoP3qUIbJu3soDZclkmCcH1iErbPGJJ6SSF1sejzJDmiscYToG1rpbNaXa+FjT523wdtYerd6DJJbB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:22:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:22:12 +0000
Message-ID: <87pm25h2ss.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Martin_Povi=C5=A1er=22?= <povik+lin@cutebit.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 17/54] ASoC: apple: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:22:12 +0000
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d149c79-5039-4879-8ab7-08dbbe58eba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X7jkjL9I61sbSC7R9z3ywCp11whYmmdFD1iLbrgqDECNN1ElKx9uNvt5bn09jenxLvYNQQ372zeqPK08ibCsZhb9jHrGslw0hehshouWxdm4nImFy39aaBjM8jhMrOM+28srppLXSaAIH6I0TOiJ2i4FXCaYZLGYen8v+N9xsv+X/olQ6ydL7H6+npGoZNK7wxVQipUoEwVVacXEVZbard/Z4BxZOW2tXbBPmR7ZQ0BRAv85btkbBZXj4DvApsQYaMMEph5Bq7KxzTMAykEfRr8BFGEf/tL5rJMTDudeIFq8ppX79kCUygdeVQw2DAQO4eljlxeE8HMAwS8iPQDrgAj+O+nziw1U6Jta7rO7Puq+6ahbNOVPCrFnixFSvwadIKsqebxFepgbMnviU04U3C4CdWvyhCExcMKroMTk+soAskM7XOnIf9HW1j7zHRzgpci/oTFG4kHHnerXL9G6vHnOhumpV4n+NkwOwohvfXsuYBsKQSaqxgXSUl0wVUO0i71OIWGz+miY+A54Q0FK+N6FpdL3wuLYO+/5h7+fnTH2kcDnvWVOoSR428omvzFeXPFwnfUUvIcGniOtk+kjOGwvf5hRqkci55RyeVNx7zjYjRQ6KtHLa4iL5aAzjXdHkPl2NnfdpvDEIRtCgsQvPJtYiSekRrefgEM93EEnUSo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(47660400002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(46800400005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BatQJVpWe/e34Lv842Sf2NyXCzreYq6kDKibP/+74dUpDlhkYRIFVqjUDXf6?=
 =?us-ascii?Q?gaM+cUUBLqixSamEAeCgrI19k0TahYpAISKvlNByfDilVqwBE7YIbWcBXJLU?=
 =?us-ascii?Q?/6UHGZjOvySGi6ijYXQsfVLRdFhTq16ocU+UPbtdG1jN3rB3mu4AYnHspO/O?=
 =?us-ascii?Q?ZK7VaP+jHWozfUD1UFdq9oqv4CfLb7q/UdE83eVQ3Z3B2kgG8QZaYMNPDhGZ?=
 =?us-ascii?Q?nOgNTaVJN5XLRFJGIFc6Xwyzcwrb4b/9gIqum9+QeWy1KcTteQqQv1FcYUAQ?=
 =?us-ascii?Q?I+0yzi5chpDaiJinlftTHm8jjY4mXTUe9H4+VOgJz4PauGPkoC9yRqr07v+D?=
 =?us-ascii?Q?4ozG4qJbz26TiKyglCnFMpCuvsvR5XM8iLra5t6z6DCac8TomWNYpG2ZOtVO?=
 =?us-ascii?Q?bjJX3Zua8ZUviW0iUBbmOZcI8Z04VxptWG9xIGXpF0Qx7RxV0J4aCNPU2ch/?=
 =?us-ascii?Q?/sRmBiQL+lvxQy4a1MmLu5tbOSph2WZWNL+riN0Hrsk9T55nrXvMCQJbTZOb?=
 =?us-ascii?Q?wQ9dpHDvClyezKW8uaO3r8kxcpzKYYD/DlVPLXpUMV1Ddl36+wuD13HElZgn?=
 =?us-ascii?Q?Ygv8x4hABICoZVXOz2yz+xOCUkVMNvpuHWbes8g5l7f6wjYYQH+T/RoX9Kp7?=
 =?us-ascii?Q?B9O5NYcEZmXxM+dzw5c6WsVuYa0gqhSkFj2Zk4SNtElpnb/fg71P1YBmDtcr?=
 =?us-ascii?Q?1MpEs20q5I/8vfto//+YBsJH6YhhNyrdEAChCdwNfKdr/MJ1uBCMpNcoRxwU?=
 =?us-ascii?Q?E8i+MK6tU9ZyfVFdeYCHYQUwXln6XBgXdB4D/NbtsYelbOrFM552PCxhB9ie?=
 =?us-ascii?Q?cPZ+mvCfzU7zrnDtm1/DHtn75fSNyLfhozQXlvAR/BFMc6TGF4NpAyH06glv?=
 =?us-ascii?Q?eRuyXP1Qcz2KX9irTvJbsx5N0NDKfsqZ8IDCVeYqpwiucC0SWy4QfDXtPUOt?=
 =?us-ascii?Q?W78P/p51IpDv1d+wYSQYJLp82UM4snhGIxGjbMqj8NFPttvAGi5jBJGldtVB?=
 =?us-ascii?Q?lBZwU/a8F4SUnc0vAlX9zq4u0eTtVeXrJBoQsOBRvL95lLMfGQ2SDHCUSzBP?=
 =?us-ascii?Q?U7S0xCJisCRQlQjEx1z0uUS29jWExcCx/L53abW6cn6ngk+WJXphynQ3dIje?=
 =?us-ascii?Q?XC3BjYHlg0dudOuN3GKer/28EwER8pEa9MiTolCx9vkgGpznvyJ0XsuoD3wc?=
 =?us-ascii?Q?9tv0BhBcbe8FDRCKc0qLCn+PQp+pcIW5R7pPN0CWpVfS8jijEhWr+RCSnHu9?=
 =?us-ascii?Q?yY6hfG0vmWCnv5XdeHa28YhANpMkBcfjGKsLnYFVFDEpYj/ha12eEbAvc95g?=
 =?us-ascii?Q?ixkQUSrUwxRKTvaWsQbITT52DEKtUcLYO3qkt7mlzvav2KcGTQeOyM9xc0bo?=
 =?us-ascii?Q?LJ+h0eLtRyBt1OAa802bWEqxAlFTPD4ITbpJGCCKx8odTlu8gVKHGNkh0N+C?=
 =?us-ascii?Q?upHNLt38FCAhU1I6DH2IVnysjssgtg7EaLdV8z5J8F711jTIpVAsz9NYvAQh?=
 =?us-ascii?Q?9iZrUxSGKRygWjKUJ9yUrdDBXIHMGVyfO4HhUO02Juzp09d+ZtBt3o+uvSm3?=
 =?us-ascii?Q?64qIaGnjqkcp4oxwq1qX7fhF2Wgzs1ul7Px7ybsvLRygpGkk9fc7rrj9eLJw?=
 =?us-ascii?Q?6MeKzJbo9sAWtV8Qr5rWI10=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d149c79-5039-4879-8ab7-08dbbe58eba0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:22:12.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8YqqmVipK7zfCGgBMc6RRIm3RLu/WfWzcJVqGXkSVrgFmMEBkr+uFePap2NPXbh9c2aEMjZE0jvpvxWSrImKH9kiKHlUQ9Co6qa0hykFCB+IrLfe9nMGCokQom8UHDP4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: JUM5O5Z5VI3Z6QHTZCSHDMK6XWGZZHLZ
X-Message-ID-Hash: JUM5O5Z5VI3Z6QHTZCSHDMK6XWGZZHLZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUM5O5Z5VI3Z6QHTZCSHDMK6XWGZZHLZ/>
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
 sound/soc/apple/mca.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index ce77934f3eef..9f64a9e74c54 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -546,7 +546,7 @@ static int mca_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 
 static int mca_fe_get_port(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dpcm *dpcm;
 
@@ -559,7 +559,7 @@ static int mca_fe_get_port(struct snd_pcm_substream *substream)
 	if (!be)
 		return -EINVAL;
 
-	return mca_dai_to_cluster(asoc_rtd_to_cpu(be, 0))->no;
+	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
 }
 
 static int mca_fe_hw_params(struct snd_pcm_substream *substream,
@@ -700,7 +700,7 @@ static bool mca_be_started(struct mca_cluster *cl)
 static int mca_be_startup(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *be = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_pcm_runtime *fe;
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	struct mca_cluster *fe_cl;
@@ -721,7 +721,7 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 	if (!fe)
 		return -EINVAL;
 
-	fe_cl = mca_dai_to_cluster(asoc_rtd_to_cpu(fe, 0));
+	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
 
 	if (mca_be_started(cl)) {
 		/*
@@ -811,8 +811,8 @@ static int mca_set_runtime_hwparams(struct snd_soc_component *component,
 static int mca_pcm_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct mca_cluster *cl = mca_dai_to_cluster(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct mca_cluster *cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(rtd, 0));
 	struct dma_chan *chan = cl->dma_chans[substream->stream];
 	int ret;
 
@@ -830,7 +830,7 @@ static int mca_hw_params(struct snd_soc_component *component,
 			 struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
 	struct dma_slave_config slave_config;
 	int ret;
@@ -857,7 +857,7 @@ static int mca_hw_params(struct snd_soc_component *component,
 static int mca_close(struct snd_soc_component *component,
 		     struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rtd->dai_link->no_pcm)
 		return 0;
@@ -868,7 +868,7 @@ static int mca_close(struct snd_soc_component *component,
 static int mca_trigger(struct snd_soc_component *component,
 		       struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rtd->dai_link->no_pcm)
 		return 0;
@@ -877,7 +877,7 @@ static int mca_trigger(struct snd_soc_component *component,
 	 * Before we do the PCM trigger proper, insert an opportunity
 	 * to reset the frontend's SERDES.
 	 */
-	mca_fe_early_trigger(substream, cmd, asoc_rtd_to_cpu(rtd, 0));
+	mca_fe_early_trigger(substream, cmd, snd_soc_rtd_to_cpu(rtd, 0));
 
 	return snd_dmaengine_pcm_trigger(substream, cmd);
 }
@@ -885,7 +885,7 @@ static int mca_trigger(struct snd_soc_component *component,
 static snd_pcm_uframes_t mca_pointer(struct snd_soc_component *component,
 				     struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rtd->dai_link->no_pcm)
 		return -ENOTSUPP;
@@ -911,7 +911,7 @@ static void mca_pcm_free(struct snd_soc_component *component,
 			 struct snd_pcm *pcm)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_chip(pcm);
-	struct mca_cluster *cl = mca_dai_to_cluster(asoc_rtd_to_cpu(rtd, 0));
+	struct mca_cluster *cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned int i;
 
 	if (rtd->dai_link->no_pcm)
@@ -933,7 +933,7 @@ static void mca_pcm_free(struct snd_soc_component *component,
 static int mca_pcm_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
 {
-	struct mca_cluster *cl = mca_dai_to_cluster(asoc_rtd_to_cpu(rtd, 0));
+	struct mca_cluster *cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned int i;
 
 	if (rtd->dai_link->no_pcm)
-- 
2.25.1

