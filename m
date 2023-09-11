Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D176C79B15E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13A59F6;
	Tue, 12 Sep 2023 01:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13A59F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476412;
	bh=cm6kZOK94Kqntzhy1Wn0ZKs5OKKccazDZViOmZ/K51E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TNCAyjo2ILqOqY5lYI6bU5WOX74TYLjdIf6visb4odKFpvt9pgXnvCFvNyUTcRbFU
	 k8X/qisOTEf45VTPqQ10bg6YJCm1+tJO3ilzXcgzMkzE9JK+lQQ1OmEXViHPf8yqpO
	 5cpG4y0etgTyArW76vsCBTy5srKoLsh1LjL3SOTw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74B7DF8057C; Tue, 12 Sep 2023 01:50:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2C3BF8057C;
	Tue, 12 Sep 2023 01:50:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0533CF805E0; Tue, 12 Sep 2023 01:50:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A5AEF80578
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A5AEF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CAIhyDrk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obdxKJ0zR/2iRrmX2eq1ALCAfgf90K651TZDlw7tR2uDmw5Eba49o36WQBJiva393TrnaRPgckUYgjOMMbYeorPZgGvLAyF50fvfasiag9zbQQxVYtOxiy3mbthLX5eX3NRmo9rWjKnJZ7ARakafd5SI2G/BvIYbkN4GGPPFhsQuF7PLimAbxN142fdCFMR/wI01g/9P7FT2SDAkHdzlhbZEJ4YTUNQWV6/qh0pkJA5MTeno/ZNJUvQe2ubpWowA2YDHNpZ5AjtpvjBUG26uVMCEVfT7ipC+DEnD7MNAru0Dd6+alZMKCKoBtFVTJuSksLjppkwr45cthxUFLYP6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEmrwCdAvX4BKcNpTjYbu2cqnnR6iBgDAu+mhxqSmFo=;
 b=HOp5IQKXzowe2ziPlPVHRf5uf7uM5owb6baepY1L42S3eQa5gPMU1bU6+L9RqK49Tn6XzQw9EpsIev0gWRW6bUJ6OKCiJV5oh6vQvo87ZxrPPC8YNOMFmZb2c4WrQ0Q6swiVWDozMpXY0TtewhDN0keD/0YmX0y+e5iYQ0MChWI94Lx8SYISydGvGEOtLUq5qZiJYb/UFdgJRVElHX8WosNvicSOfHd4Y840tDviwiIMYeE6Rd0BIW/hGpNbqXYnH+ATEIB4lKc6dAbJver+GP8+4HQBwlMmqw3u48e2Dsla52A/y/kqGn5BcwZctYqtv6ZiE9o4Exixi4TOSZVGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEmrwCdAvX4BKcNpTjYbu2cqnnR6iBgDAu+mhxqSmFo=;
 b=CAIhyDrkVHB/LKvOCybi0nv7KthCqgwubST0zdy0zeBNkK7Z87gVrD2t6UzaSDJyXwrakOuex51wSWyK0AeGXKlVR5g1aftkici9E0R/ujmtBx57DYER9DPUzoXvUuo7IlF/diVwPvtm7xZP+W7Gs0Ooy+llYlBXkYCfYq91jic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:48:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:48:52 +0000
Message-ID: <87sf7kqnj0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Martin_Povi=C5=A1er=22?= <povik+lin@cutebit.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, asahi@lists.linux.dev
Subject: [PATCH 17/54] ASoC: apple: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:48:52 +0000
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: bfacacd4-15d8-4de3-8230-08dbb321a725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GCyMRU3pemVeckJn7Qu8WYmrUtgFsMgtbmmOv55pOMlrPvgCegw9VxbWzohGtkvuYD/NMopltL+YUqUIOtETGtypfgyz5s3xlZEZmvj5bR0HHknqLlINWpqlQ27cYtUTG5YxVplTqtWVPbCXHrFK9NSJh/A+PHDdxe5n8JEo0HOXQIhHuaxMUijdET5pIROWLlL8OQI53dc3tbdYVxYoAiVlD+IlEPrU31EZLG84A7oQinilH7wE+cjjBhKbYtYN/m+IfR5RfNoG9DMY8XLVSOKWIGfxTG1jgJJwIuVIqKW0s/eNKmtFbsW2PeOluQ0l0qL2jQpgf3tMZygK9D10ARWzNA1heaicpzRQ0+BHjwOlkbNsMhJTeFZq5XPmsUxNo09SQSQjqXAyfdNZH0J1rU+Gq34nw+wZ9V9YczkygjnHR9wDfYDzAtDXS+sRt+o4Xx1KKfqRi2WA54fhA3fN//GEtbbldwx+qLLmxwmxfNoivaSmxAMAUQz26MI1bEQfhmmwjD7u0+xBcGK1yRoCTiWxTIuRdyfY3egFK1LNEhJfuMUF/v/1THfVdg6hfv0tVPBePIirtg+1gKJJ2np4JDnMOV0J3eDHVK1aat3gvkv8La0Unk4llZkmQz6GF9V7g5VNDgBOYUunRa8z9QAJHK8+6Zv+679dWn1jtFJtD2U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(47660400002)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(46800400005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J4xi4IADM5yq0/OJnWFAsghlaveGMZrie+eXQsy3VcvlYTcCb3GG74g3COXp?=
 =?us-ascii?Q?mNR43624187tqS88j8uu0KG+TMUOatQWJzacTrjwH8W9oPBsMNW7Mv1vkH+s?=
 =?us-ascii?Q?Zs4CMdTlDrZRZs2egunkWQdpIGw7gVabcuUX1XAulx34gR+VJPzhmLdarRK1?=
 =?us-ascii?Q?KLMIHBDN79fDfJeH+6gT+QzjlAunf1I1iFnGm+9R0UeDTfdWtELGNZJVwcxx?=
 =?us-ascii?Q?3XDr3g5vyWLg7CCesDEBcoNBx5+ENWzcxW/itcmiSjLvUCMe2vdH96f1mYPk?=
 =?us-ascii?Q?oYCpEsSt6tmdPE1vKCAuth5cFj1aGCmpxAzZ05eQV4bAR60f8l7usDV1BvG6?=
 =?us-ascii?Q?xrNrtxPjDhp1B63reNjWatk0hVa4Gxfu86qSFqaa48bj8HOCPadhfeHGlcuP?=
 =?us-ascii?Q?ypdqRqwhIFh8sOArbo7dcFGjVUZpIxZ8/qH6xVM7uxfLBRU4nkUVHx+/duVb?=
 =?us-ascii?Q?gKD/NPvA9PeWQ8qthAOsXimoGb9yxVfH3S2qVtww1J8s8OiGJrLZ+7+ai6/U?=
 =?us-ascii?Q?mF7sI5IGDfjAlmHkcKkwxtaZKtDP2M/tnJlN6YSDlbxjnK+cmOFYUOg5U7Np?=
 =?us-ascii?Q?f9jfSPbSUPA5EZ2YHGrzi4qB5O/0aw40ggfNt/VzJg7a7t32GAB/nWI1CSeU?=
 =?us-ascii?Q?QEFpVgsUej+lnzomaZpyrZs2dEw+NvYnMMxpZCaygm7fPwDnWdJ9SfSqzXnU?=
 =?us-ascii?Q?I5Mlnmpj93xNVExCIYDiY5Id7o/BDctDLB8hSZTLt2LUAsfj6q73+XUlZLze?=
 =?us-ascii?Q?+p2jPKQFD5xYwGz8cS4ZSMBSOGN5Ema6RTOtKCEG8UJ4mdHF/XDWPxiQLjFO?=
 =?us-ascii?Q?+ArGrfz5Fgk5PuMrhSXxq5/KPowBf9Lwbohc0i6NdT/3yWrW3CQS2Ib4NB2O?=
 =?us-ascii?Q?Rjmv7AzB3b1AiqP61sH3GNppf9NC9XW0VUwgX0qCx5b0AVfFRPAeTInTMiIA?=
 =?us-ascii?Q?EUvHcid3Kw3/Xx4pwZcwgmOx6AHEY15pZTEeGDcnqUwR79Mt8iCt3pKyodF1?=
 =?us-ascii?Q?L0+g56Lojf+tS/ReYsy12Pw5yqxsilaCnRQpmszDgzBpiIvDzMjWLRtUvT8k?=
 =?us-ascii?Q?B6v73HeMlcx8Y3zZPEN4z26y0kwUgUb2NXu/i08iBd6PWjlMyMOxErVqN2Aj?=
 =?us-ascii?Q?X3ygtSMfw7LzyPwv2bEpNWExOI/DFey7kqcWn8/5odhptaKbSPAr+ahYJ7tG?=
 =?us-ascii?Q?XiUSJbm9ChDJfaCjrOx3JEHzl65zo2wMjILOcpge0ftWGRlrWgjOr5kqET8l?=
 =?us-ascii?Q?x9zZ3eH+BjLwZdm04MQWWxKROBb6XJxMjyocAF9grvbBwIFORSH4TPgZEdtO?=
 =?us-ascii?Q?nFBSyQRwaoyUlJlXA9o326Mz4ajWO7LdAhqfIvmSlgz60U5oB/SNx9lF0MSH?=
 =?us-ascii?Q?Lnuv3Si0DsQZJUvJWQRvZKr/pDbelL/c7aFM2SgAcriI2CZDA6yIK0d67yOf?=
 =?us-ascii?Q?7US92zb60dD6xF8+f1pGhotacnBwfHi7ruUA69UWh971pzk0roLUaBvZNoOV?=
 =?us-ascii?Q?W0szv9BVT/0i05IjsXkehNQ9kxlWQKVjWqUDMMPHYNyQV75z5yqo7PrUIdo+?=
 =?us-ascii?Q?gHvaQaJ1F9JhV1hyla1kESZYK8Rvr7A5v9NWvLvGAUUJ34fhc0gIQWY4ZY8K?=
 =?us-ascii?Q?31iWKxfkpPKM/ttqRFodfW0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bfacacd4-15d8-4de3-8230-08dbb321a725
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:48:52.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /2CAkQ5fR9MkvwxY2ZlYEIgiDUDG6EfGH0XoaJR+/wGizcPwwi6rMpT2bZvkEj/mM0/gEOMU9Fqz1BzSRQnUEIK/bS0a5eMNTScHXqStbyD3EZ98LWoRuCNRLTm6/eDu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: JPZ47OADWLCYPLV66P3OP3DSD7WCTBJE
X-Message-ID-Hash: JPZ47OADWLCYPLV66P3OP3DSD7WCTBJE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPZ47OADWLCYPLV66P3OP3DSD7WCTBJE/>
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
index ce77934f3eef3..9f64a9e74c541 100644
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

