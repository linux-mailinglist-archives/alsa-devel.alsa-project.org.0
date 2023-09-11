Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C179B15F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:53:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8651E0D;
	Tue, 12 Sep 2023 01:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8651E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476432;
	bh=87SzP20zmipEkoAP5OamnfZ+RLk6+e/Bk8O/ksupX2I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IBQO9RePMiPuTHddc4gdIF4SgHRF2ILoWBJsnZ4JhtLAo95wmMPX68S8dZyfXEC9B
	 uA6jyr3eoZZHX/6sj050ozmu0UjhpTy3zb6SzUgcsqNij+I55CV5FeGUepLk2/vbru
	 srnVoxtH6jfYJYyTbfiyb7OjMIKosBl9a17PwatM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62CEDF805FC; Tue, 12 Sep 2023 01:50:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75870F805AB;
	Tue, 12 Sep 2023 01:50:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 089C3F8055A; Tue, 12 Sep 2023 01:50:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 93469F8056F
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93469F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JEV7oWWr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMJxyxe8PNkNivDPRihpmq2JNDfYkMVCx0NRkviT3Psfp0CAtfH9aOXeL5ApYvePNBWiTSOxh30sOArdl3MRzZNdrVqniBkLk9o/C0O668GxCJXIWc9pPg/P9IyXcEVD7zESTrTcpNt3tDhvrWctSkY19tcDEOA2hrn8ABkHGBkc73rFuHjr6v4xPrbH31Q4VyWwdW7ibdUZzfMSTkiHiMneYrDcRQUWdSz715b0kr8mC4fLgDqwZQttYkL3Ltbov3JWcTdD5ir2KNYzU2WwUnFAFShYmOUpwV8WF+Xl9KByQFd3xo5XyWBO68mh6elwYFthMP5VchfsE+7lNXgrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe7A/nGxBnjrPcnf0+hR5DQLCYwNtC2iPj2z/Ynflrg=;
 b=nTgFKNPkqr5uB/D1q96kgd3E8+Lo3LhMpidjHphe4oOQIFxgAH4g2ytSPv48UzkB1NwS/U6aVhrVrrtpSftjm/S0OLzAHeLZactmjmdP8tBB/gvJ4wjbsBdbhAcDqGZahEBOCMDpAOsTmrxfy8i7R27mnSBaIBUTs1+2oATSW9kmBoiOAB4RvIpnCwUmRw51NIRnTI/GbgnZ3uXT4RU2TglqExLJ7ZI9jHi0XtBV4afkoQiX0DSa73N+JpxI68rtQeADqqXIMMmdUokQBDnlvjkByrfbNpdYtuX4u1CK9HFau/Uw2qV73vHd/366uvzxvEvIM715kbdXcICSVB+fhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe7A/nGxBnjrPcnf0+hR5DQLCYwNtC2iPj2z/Ynflrg=;
 b=JEV7oWWrgZu7EvCRzpV4YchXCPZPeQ8UIm+UqOU5eHg0boRviAX/BM59jNnTmMxNNCj8wf7MVHZMpbEZ6lsCUnKG1c+BUsx+vZIcCT7kIZYdA1rYgDsDqW6goqzMuk7gbeQ/gRgJJoZejey2DslJq3yOSXoJRqKlwVkJ5KZCYgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:48:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:48:46 +0000
Message-ID: <87tts0qnj5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 16/54] ASoC: sprd: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:48:46 +0000
X-ClientProxiedBy: TYAPR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f3e7a8-b66a-4180-7f15-08dbb321a3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ouwDSCnYwdJLrfx7NeuCMnKWns7XUpvT4TNR2xKzkHmExnu8sSZkZnJSO+FWvKqQ+H+FkYZvSJlqahdhDnLTktT3aCCWxsOp9ioVhRHiQmxROEN4PRLYEm0V4g6Zcstiki/J/VebOGDjbtQqb7xqQ/Zn3b9SK4B+1PY/3sspJAGgNEuI5s2OZS0ib6Qf9JAtp72tHxLI3L4izm0BZ2WacriR9G4GjKVDKQwGs2+0uq/QXrfQcZ7S0m+N21N0pSX9kWAmElkOLq3n3JAJjFTcaMCLP0ABHC5PWxJAOwuI06UguiXNLOtsCuAC6FbIkI88DclLpsKOrQCoAVui1tAbe+lC+kBXHOlnA7VcEGPupzcVKKYTaDgBPjz2v0KjdxkOcPtp0zIzcDSIe1Z6nm7W/Nnn2nkxR5bdhmvA8iLWcXEdGVXg2TI67lb3hOqh2wqwueRIGKGo/MY9PkEUCcXMzXD4V/EHjFDka+SdtFA/LhQK8I5MQ5vJel/bjj+6oFtWi4usKhLlNTC5E3cXwTp+L/RQco9lGiZRuwm0z9V5E0XrDJlRkBS68dNitXnIpOsCBjFg+2ROe06afNRcTTU5S3T9IQQ/ZJ1AxGdjQjJc4lA2lI+Zfqg8o33KhKTA38UR1Vo8tFBoQ8pe36yntIXbg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LaN5RJk1JQ2s3BWv1XWBMwQlXAdwiBcVSEQ2uL4wlbhcJCW4skg/+jgst1hc?=
 =?us-ascii?Q?PotOlwb6wuGl0XK1MZFn8ZOieZs1UqA9tRFPTJLcri1K4H4u2HnX/kyCrOb+?=
 =?us-ascii?Q?lxzOP1N+HXr1IbJU5Rz6OeiYiAeJ86I9/Ns9I8m2M62t3Le0q1BqcIF5/agm?=
 =?us-ascii?Q?mBL6MBfOXDJf+wqN7x/lsKBY9Q0yfkWrBZ0apsYLzjrHeA3lPhKUVVSWkapO?=
 =?us-ascii?Q?v/Wtu5WAWa7KsD5xvT73y8JgvauXtXIX4XrRAOpfvGPgvgvdA+Ae5JrQApiD?=
 =?us-ascii?Q?1zjNquDD7Ok11SXXwfhOUvyuX9Wc9XPT23DgyMpS8TjPJC0xMSe8CiKT9mbw?=
 =?us-ascii?Q?Ntff8B4I0TdcWdaPjWdHfPT9ltl7g8TgUhnM770b59mZsSDFqZ6pIkNUHDia?=
 =?us-ascii?Q?12dMgQ8uJHP+Sdef9iS1e+AfnLVAeMv1F7j+EklDIZzZGE2fx62olKLeDvIC?=
 =?us-ascii?Q?F/6LecurpmmcIdB7zwvkJVIKSOq088b9a/gvDqQMhDnUkIWFPZ/l145M7Qac?=
 =?us-ascii?Q?EKTzeYQVfE9unaLqR9Xp37SYDJsHZCpgCueJ4dmZNe85EI13xwRErj8DrHp7?=
 =?us-ascii?Q?JStnaT1O5oK7x4fk2leNAFWH2fhYzeqEv6+1zPcikoTZqDqEGrx/zmme4RXg?=
 =?us-ascii?Q?j3XmdEJoUhwTBwn9ENzR2keZQPk/q/MigG7SQwFm/ODjgdfhzpaGa++8nJvc?=
 =?us-ascii?Q?hpcfHdb9HmBxj/MqC79AhxPvEAYGDAcR3OGi1eYYOUVmnAL3daC3zS3B7a/b?=
 =?us-ascii?Q?VrDymgz9i0c8/6fht8MRZpaXsiSBGIuCtj9jERzSrpt9u4J8M7yaZ+5ZZry0?=
 =?us-ascii?Q?CsYslGYKieeCrwhgsSUrMW7RXi98lZbT9v1Aygld9X1GJi/3ifq0Yn31iFCu?=
 =?us-ascii?Q?y7c5vwxbdP9imF7mNa2HuIxV1DMwILWX+VMohsPEvGKlp8GKbg4LnmL8Dc/P?=
 =?us-ascii?Q?bUKY8dsF3ar5oXdZmoNi2wiwzAwObQWHDPC+L83MEm8Q17I4ks8tsRQpfAY0?=
 =?us-ascii?Q?YIy92ESPr6plvv7PmJ6zPg8HhDAkDvtjfibX3sz2NEV7uZ/KlQK3wT2C6ZkY?=
 =?us-ascii?Q?Gy5/5pqXsEnkiht8nsQwHLegmGZdL32ZrYgeGWosrJ7eAobUf6tsOLQ+9N/g?=
 =?us-ascii?Q?nS3/2VJe/wTJmQ30HCBiL/8g2umEywl7OL5DJDDNusYhQO038BpLHW+qD2Ol?=
 =?us-ascii?Q?OqamYHvBsfPwk+YJiMxyhjDAcvCumfb6GgkwfWZ0NUhfQq9TKEjlzm8w1eW6?=
 =?us-ascii?Q?o2PXPp1LSKGk71F2B4jtYb7SU9xOYPZkOnENPPOf5wpF6haAFYSV3i8hDtnu?=
 =?us-ascii?Q?gXIGQRA6G5syPLosiVfYXJeZdTGZWyDKqkTcnnM2I8E6dLh6GvGAT/j9lMzy?=
 =?us-ascii?Q?F5dJsK8EBf/eaNsZ+0XSva8/aaM6dsVBNxoOLCwFBQptSp35gIDRyqiUJ6Rg?=
 =?us-ascii?Q?8I/TqAC63LkDhK2X+0VWho6yaKfUx0r94opLn6UUHYuXGyBmyYd/1xoTtg6l?=
 =?us-ascii?Q?ooiHPeBnLif4OJ1mZK3cw7CAdBBrsCijohhECKfksDmwRclX9wfYAilEEvDi?=
 =?us-ascii?Q?pI2MtxJZo39vkxtJROtPQvH21vfpO5RSt6SYVB8pzhc8QXjO2kaw0R5Rsxr0?=
 =?us-ascii?Q?1gUIBs3J+hQyPovL9pySxno=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 05f3e7a8-b66a-4180-7f15-08dbb321a3f1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:48:46.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QiMMMLxXACANi5ZAEDaIBc6m/awSiy/asPGEd+ujdjU8I43OAobe0BQWCtYH/gqfLxgOyHGeEEubBqKiKUi/ary8rPUNibZLrwTRJnewProGeT60ZeDDiiU8ohuSnXzQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: JWO4IJWJPOZAO3ZPSO2URQLOQX5IQCMI
X-Message-ID-Hash: JWO4IJWJPOZAO3ZPSO2URQLOQX5IQCMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWO4IJWJPOZAO3ZPSO2URQLOQX5IQCMI/>
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
 sound/soc/sprd/sprd-pcm-compress.c | 4 ++--
 sound/soc/sprd/sprd-pcm-dma.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index 6507c03cc80e8..6cfab8844d0f8 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -135,7 +135,7 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 	struct sprd_compr_stream *stream = runtime->private_data;
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct device *dev = component->dev;
-	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct sprd_pcm_dma_params *dma_params = data->dma_params;
 	struct sprd_compr_dma *dma = &stream->dma[channel];
 	struct dma_slave_config config = { };
@@ -318,7 +318,7 @@ static int sprd_platform_compr_open(struct snd_soc_component *component,
 	struct snd_compr_runtime *runtime = cstream->runtime;
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct device *dev = component->dev;
-	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct sprd_compr_stream *stream;
 	struct sprd_compr_callback cb;
 	int stream_id = cstream->direction, ret;
diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index 48d90616b23f2..d6b96cc2f7087 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -190,7 +190,7 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct sprd_pcm_dma_private *dma_private = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sprd_pcm_dma_params *dma_params;
 	size_t totsize = params_buffer_bytes(params);
 	size_t period = params_period_bytes(params);
@@ -200,7 +200,7 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 	unsigned long flags;
 	int ret, i, j, sg_num;
 
-	dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_params = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dma_params) {
 		dev_warn(component->dev, "no dma parameters setting\n");
 		dma_private->params = NULL;
-- 
2.25.1

