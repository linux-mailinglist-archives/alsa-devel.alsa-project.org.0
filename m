Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E913B76C1D9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:04:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D12314E;
	Wed,  2 Aug 2023 03:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D12314E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938247;
	bh=T/JYhbmvi6JEIwMO8uqAO8+4/7EKoe3F36kpr7sBrO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GpAYfYiBRc8MvGLqeMV6zDCdnSZF8rpbNUmp9blWESQASc9saBQQs8ofxbtBM2cP/
	 /+G4e6B+G1ABWwMvWndqFPmpIyshDx0vcvuRVUttTgXiRpxGl0eNOnHvWd8lpgDMru
	 EgYzy0Ty4/prrjUTdFi9O9svPAw8KgKgA+ZzlsEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F544F805C9; Wed,  2 Aug 2023 02:58:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41346F805BF;
	Wed,  2 Aug 2023 02:58:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9689F80686; Wed,  2 Aug 2023 02:58:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10E0BF80683
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E0BF80683
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NqOpMb4/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQhLNCLAfYYDdrjPznWWNmx+4eRz3Kx9M21SA+IuR9YPLQxWRxHmPIo5+30sJAtZyMrgZfviHG041jMQUThKelSWqtNqliHmkkgyX1O3Gkt4eaGy98eJ2uf1MS5dVppScadJtWqogjw5rCTJQIfuhsMaFleGRIOySdXdv/ilq9Wwvs62Q1CPqqFQjSjKmsxUoWB5cexp8MwHqLGhGYFjdHA90fCRVU2J5yw/Gy+fFXrSJi50H6ksP73i1EqY2TFL8k5+lOkw6BN620rz0+Adfwrl1yc1O3KWilCWxuYQA9eBQRwaxrPXEOIN7Da9ZGmTdiEbDuYvtpnhTn5Xz+q7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmdMINNXf7yZVGeNQRgMRAOzqUBW5RKk5UUksA8gCUI=;
 b=GU3CkT2TCNAsUQweN8QypxJQuGQAQyzWDpNvx3xx/bGYzh+kh0t+e8mY3mmq5I/9jvBu51K2NNSt+rM0lkpxXgfrnEQvDN5WvBxNjdBKTuYe04Vu6p73bcr2FvSbj9u2ENtF1JK7GtHNnfj1MlM+VD8LeN5EthbDY3+W7ywFCpumHiUIZGSjku03HLnca8bP7EGTZV4wXGdFl3NUJeesRFiaWFhsMLdaGGxp4XdidA0uCFkWz7Zka0Qa+uH+qF2pGoz4tTiZc4aYHn0KdPD2nnoWBpfwNiYJNjT+DnZXMx4aDY+7Vf6IHuh/axh2NCVkwVdTeQC2ZbrBRp0W+1i9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmdMINNXf7yZVGeNQRgMRAOzqUBW5RKk5UUksA8gCUI=;
 b=NqOpMb4/0AVNM1V1sjbnyvi30QKAt72ukYiXxvODr/aqUx46v747G81Z+jXy034llfQ0A2Cc7IGkL5Qqz7PqL1FuLuGQ55O0JynFRaqnbjBaeBH3Y/P3cEXPH6znKh18aF1I0PbaQp+OicG+tP6oJEeBDE8xKPg98uhTlBsCxE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8689.jpnprd01.prod.outlook.com (2603:1096:400:18d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:58:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:58:46 +0000
Message-ID: <87r0oms1iy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 38/38] ASoC: soc-dai.h: remove unused call back functions
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:58:46 +0000
X-ClientProxiedBy: TY2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:404:42::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 1468268c-ff55-4a8d-f9a7-08db92f3a005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sT1JEYijaJnL6pvu8X/LwhH1VSqE7XdfEfx6fAlABHvJw1a7ivu+ypRgHLuon5NRwdWTruVJMD4ypMXR1LUdPF180NiyQvSdafcn/1UqaC7lPo/c4AUTRjSuFSKhZybq8/diK209s6wZEsQtPkwS6mpGjG/DJDV39NjtAIl0Xi2IUhQ9NYkFFXalQWenhKaJVpoWgN/KUnm/zMO6viRjRwkYtSH6dyhzIMhfpbVDt9OdcIKwlOpjCaQLT5wnxCUoOU4N0tR7+zWPleS30cS0hvuZQ1UvpNyER8MigbMoRVszCtey7VhBY+65YJSLIRUbPgTIyc4JQgMiCSvY3v/zfGtxW1CYonMBIglolaJIXPxmWKQ9ai9jHwIPucoVnJrOO7wFcXjtjZtsnvMj6Bw2H5UnbNso+730vsH7nX3diNHPSW9CRguOPnRSsG8VK9/ZeGzKOLYRvugYJoXB+ZrocYHuetgU/bxOUkrmtleUMm8MaZ2cLLMkzbgGHBRDZoWugBEUcZC+0M70TP9qGlW/J3KE6xH1Fe6VNHm6H9ASgs7jV1mhkrRwXA8GUQ89Xv+t/SynhS5wS8WPhHboayaGLiSI9SOwi9kK2CLnimJH5AfTNLX//BRyP8reYd6NOzz+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(2906002)(5660300002)(2616005)(86362001)(478600001)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TZVUDrkCIOpaJRrFKQqhNBgg58QG5sfHMiqdylz9XUVOQRIwkLlnpARCnfbQ?=
 =?us-ascii?Q?Sg/z/iLxK29IAfqqTrIw2xLPAa84INwPAiLhmWHpQwQcTtWUPGzS0qNFCqZ4?=
 =?us-ascii?Q?d0xr8rQG9RPqDy6GHdFb+pQuth15a/PP5eRGwciCFUBgdv2/7kyjiG554Gf8?=
 =?us-ascii?Q?M90u3k6mHtlKzzNuTfTZKDmMB8mu1nc90GNBmHgQ4aW95oeewlTeBOSiViPM?=
 =?us-ascii?Q?ejY6ukW6GYNWP7ILCfWNzexujiNNYZEzT/ge21y5g2GwHsNgMvrZihH7HDoA?=
 =?us-ascii?Q?f3hUSGJjvBKWv42jsA4lnUTVa9n3Ek3zyOeg9rW12KwPr/tv8X0UdkrJcVXq?=
 =?us-ascii?Q?eZiJjVYAzmohggY+0+aXdDlUK8C8aKnQEkXKpNYLb+21x827leC4V0+kyTzE?=
 =?us-ascii?Q?qVPjdu9m+IY7yfrOj63U1FBjCdj9U0N+xrYdGssS4NLtquB99r+mXDaVX7sI?=
 =?us-ascii?Q?OaDGEHeW8zLmN1sg4DgwWJt3hoYwhTacc30HVbEi98ibAReFaGsLXq4Xwz1Z?=
 =?us-ascii?Q?+C9LOtvlD5lxgUD4RCcMNM4XbuCDc5AjY83VVm2p702u6HvT6bdIXUt2QU5e?=
 =?us-ascii?Q?sDRLVJJOEAW7ymQE7neuhAktYNh+FFEtMuxFSS/1oCdeg8zJEW+bt258H930?=
 =?us-ascii?Q?XxWoq3UOr5aeB6zySb1B3DKk4rmwB+sOPo9DHLEo4rC4IyNrHJ9vL10jKAY9?=
 =?us-ascii?Q?QcmUAsZ5WAgt1sb772odH97ZafYIykzUrEb4YFq6AZNBX2YONCeOCbM8FFsN?=
 =?us-ascii?Q?iykuurH1ArlzleMJKCjT0SoUFM93ck2HjM8MKAZBBbDRfjtCZ4/N+hXp4jDo?=
 =?us-ascii?Q?zCKAK0OcX26IEzyX4oToDND3sl4Qd0vRS+SLzv8+91nM4Uhqyp3CYhc3mRp4?=
 =?us-ascii?Q?cFsY69iX/Y6JL6Ceaqd9pJQ+TMUpGKIDkdiPsgR0BPYpctG5HmI+xTNEOicx?=
 =?us-ascii?Q?wSePFuWc6uW9GPJa6QcIjdQWE/X9vgEM0Gfbg0xXBLNYiXIsqy5pq/gWGAqN?=
 =?us-ascii?Q?/PHTRhBQJn5MDhpnkMwaknmWPVmQvmMSK4DjWYC1FaNeEFgj06w4RmeKjaam?=
 =?us-ascii?Q?eFVoem6XLu4qCECxsygwH1H/xgADA/s45mujV1P0snxh4O4aPvvxB7WjECTn?=
 =?us-ascii?Q?i04xhra/TuLuZRB4RRQ3m5JWs++CD4pTjaOGpCZRXYEGo07mKhnt2/lW2iFz?=
 =?us-ascii?Q?9bKruCsCdKndGgeAN5v42i6ePTE75EmOGfUapnF+4xuLdKA1CeLjXkdv37f2?=
 =?us-ascii?Q?pFre3Si8bb++c5YY2XU4J0DTolicjsF1FIO68S3v+OGR/w9Ns7/1BLngYMcp?=
 =?us-ascii?Q?HXBZ7CGWGXZqktkJivQeAWACIhED8fvoUiJkl/MEz4o9lBur9i9XSZUJr2TE?=
 =?us-ascii?Q?E2yBajowPKsMLnG+81Op+sZA6WItn0oqcisU4NjGhTtFOaHixPAf09Qt/nGj?=
 =?us-ascii?Q?HfbeA6RcMhH081LTDjum2j9b3egIxOzhlafVO5dQQC7hSsdwCjnHDL4Y+CH/?=
 =?us-ascii?Q?V6ep4QiSEd/WNt8yhytRtbGdxFLpjotLf6Gg+FTNKecBtP0XSI5J9jlTvn9h?=
 =?us-ascii?Q?4HbGcVIz5W3Pl8qpQWRr5MifxIOrmgqH9HPdUfYkf38MvRhD7/iLyuR4aoNk?=
 =?us-ascii?Q?arWCUq7ZX27NYFzSSJKCHBs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1468268c-ff55-4a8d-f9a7-08db92f3a005
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:58:46.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hBwzSGBaCou9gOclU2txjYMaakslENAwK9mbH9NeAt3PooADQI/YK6JZdkbJ6l5bl/Q9TIBYZbrR5ASguVNb5scC13K0OXzHqgFRV1CsYi5Di/04AWsQgEN9IXfjHDZI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8689
Message-ID-Hash: YTBMHL6EM23ZMABPB6PZDCECACEWF3H7
X-Message-ID-Hash: YTBMHL6EM23ZMABPB6PZDCECACEWF3H7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YTBMHL6EM23ZMABPB6PZDCECACEWF3H7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now, all drivers are using ops call backs.
Let's remove unused other call back functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 13 -------------
 sound/soc/soc-core.c    | 25 -------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 85f897fea21a..5fcfba47d98c 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -414,15 +414,6 @@ struct snd_soc_dai_driver {
 	struct snd_soc_dobj dobj;
 	struct of_phandle_args *dai_args;
 
-	/* DAI driver callbacks */
-	int (*probe)(struct snd_soc_dai *dai);
-	int (*remove)(struct snd_soc_dai *dai);
-	/* compress dai */
-	int (*compress_new)(struct snd_soc_pcm_runtime *rtd, int num);
-	/* Optional Callback used at pcm creation*/
-	int (*pcm_new)(struct snd_soc_pcm_runtime *rtd,
-		       struct snd_soc_dai *dai);
-
 	/* ops */
 	const struct snd_soc_dai_ops *ops;
 	const struct snd_soc_cdai_ops *cops;
@@ -433,10 +424,6 @@ struct snd_soc_dai_driver {
 	unsigned int symmetric_rate:1;
 	unsigned int symmetric_channels:1;
 	unsigned int symmetric_sample_bits:1;
-
-	/* probe ordering - for components with runtime dependencies */
-	int probe_order;
-	int remove_order;
 };
 
 /* for Playback/Capture */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7dbf37e0ba2f..a5b96c17633a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2510,7 +2510,6 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 {
 	struct device *dev = component->dev;
 	struct snd_soc_dai *dai;
-	struct snd_soc_dai_ops *ops; /* REMOVE ME */
 
 	lockdep_assert_held(&client_mutex);
 
@@ -2539,30 +2538,6 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	if (!dai->name)
 		return NULL;
 
-	/* REMOVE ME */
-	if (dai_drv->probe		||
-	    dai_drv->remove		||
-	    dai_drv->compress_new	||
-	    dai_drv->pcm_new		||
-	    dai_drv->probe_order	||
-	    dai_drv->remove_order) {
-
-		ops = devm_kzalloc(dev, sizeof(struct snd_soc_dai_ops), GFP_KERNEL);
-		if (!ops)
-			return NULL;
-		if (dai_drv->ops)
-			memcpy(ops, dai_drv->ops, sizeof(struct snd_soc_dai_ops));
-
-		ops->probe		= dai_drv->probe;
-		ops->remove		= dai_drv->remove;
-		ops->compress_new	= dai_drv->compress_new;
-		ops->pcm_new		= dai_drv->pcm_new;
-		ops->probe_order	= dai_drv->probe_order;
-		ops->remove_order	= dai_drv->remove_order;
-
-		dai_drv->ops = ops;
-	}
-
 	dai->component = component;
 	dai->dev = dev;
 	dai->driver = dai_drv;
-- 
2.25.1

