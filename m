Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC31674DD3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF1E2E36;
	Fri, 20 Jan 2023 08:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF1E2E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198584;
	bh=KMNnPXtNME0Lt+8dIuUt43IyplJ2d1gAMHrfYq0Xy50=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I10J9HDKTOOSj0tIoj4wXwSqcy5ev7BpHsgygWZhiO6lJ55jRixqHjeBSABimFpau
	 YqVoy264swd0m51TDrsrY573ykZo2qE0SKZuBXjEi1Az+mAW8auhf0VAsoGWYhvc2W
	 YB2bt189YkE31jWVwpRArcxJlqyPQ9suQw0THQ1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D561F805F3;
	Fri, 20 Jan 2023 08:04:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0D2BF805F2; Fri, 20 Jan 2023 08:04:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2103.outbound.protection.outlook.com [40.107.114.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B24D8F80564
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:04:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B24D8F80564
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CFoZQ48r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2wGXUT+aMeaEihebH8wneWyY9VCDEMOzTmXWGn5bZGdoaZjgV2VWytuJaMK97xFxHr+AxO1nyZyrPm4c2S+pJU+KihE5OTekL+PKC6+HVeFPcaMCkJTq4v7F2aycB/BcT2PqfrZsk2RVpobMa+7CGb3k8Z0onZb4yhYSmylStQa/20znJ+XFD0zpMhNANW1k+opfpx03S7o1U/OJT76OkMqGnqpSo8blmmca/Hw9MvKyRQIbOGOd1W96XY7IXS21eLwogh+ssPPmIwPiScK5hBRqM6A7nIwjFvHOleEcuLQQpEFRrzxj3uP42rBUR626cLtpb7oDncR69wjmdWUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chw0QzF2b/Ks8lR8EJFH4gVfsy4H1ekqfDJA6ybtK40=;
 b=dUGcoKYFSXty7USJ7M+CDZnNtsy1EK+ByrZdcpYvFRE458WC5NCcyBcZr7/YBIRZehc9GuxAXsCuu9NKl/QTk4ugSuRMUsnYf0gK4UI5vw8UAVVaHv3JUa3T/TVFOR0g8Dcr/FO28WSyUKHJpobkanpMONHMsdiXZL2nxZ1qtzX7Yilut1g9/p0di2MlDltbaLxLEJYmQNfO5Jb8NiT79hQb4WOzdcvuoXty4xqL25rPpQsop3fgN6CMq8xu8sXbO8QvWg3StskyVsRn/BaPLpApAoANWw9qijfG+QzvWp7JIipC1qxw/JApZFGNyV7PFQGH6LvdhLSyQY1obPoObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chw0QzF2b/Ks8lR8EJFH4gVfsy4H1ekqfDJA6ybtK40=;
 b=CFoZQ48r/ozGZKOCza4Dt1H1E3LDdK3z+v+zmKWel9H1BUohZHmJ1Fwet698DfkAYs4XnzujgBCfCamX8TOXPcfHgOP01m5sB32jqG7WlxFyOh4JOiynH7xpuy3L6+VM/ki6d3cLuX4PxShdiVBB3ESGTIxZnRCRhRiDbQB0Z7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5825.jpnprd01.prod.outlook.com (2603:1096:604:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:04:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:04:14 +0000
Message-ID: <87a62dk7pt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 25/25] ASoC: soc-dai.h: cleanup Playback/Capture data for
 snd_soc_dai
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:04:14 +0000
X-ClientProxiedBy: TYCPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:1::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ac5f8c-a3ec-48f3-7e60-08dafab48a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7v7cqU6HGtC8zkBAbrIpAtUWvCqNIF/mvP/ph8knloiBWo5mpbWhnN6rol+PoxLhE2s7kKJmLnq6Cpss/uZrI24h6XNfrij2yA3tZHtDl0Fx7sm6g3M39NGGrGGs+/nGnHgtdfojJeFMF1z4QTW7l1rd8hWO5fuJgnKDcbMtKREC5hORscAfNDCfeqAdo399iIhpkCaM4TLk492BRVq/nsk90QWE9EOvLCvr9s4q8ff1sEdQmeFz34hMNowNVRZfcI0pYVdYEB9Js26C+kiH6p+S3Ih81a64sVw4VoCDK5tByHRtn586Bnw9SlKtoe8RgFu8opDPN0VzCz5HaJ7Df+NsfotqsoxPvrEyHqYHe7cER8pSoZ7aajD2zQnExicJl/SHaC/PqS1W2ujz5U3n4SquLIxcGV+wydLqSN2VpgYCwN2+m3eMb3XZUhiaeBD25byLgUEa7Ijiltw56q59XdJwxNcZtC+HlsDmxIv/+mUwO/EFQKX1BxB1bi8eO7sL9eILSPGnyLPce9OYtllXBl2PlwHujdR/jMh6JLhZSxU0Kxq+550OnjVuIvg+qb6/knO1goyGCQBEqu1rb2lA2iqnBg1M+nXil1I7D94LUbw5WOizjagtpBsvvDYJfKZ9qL976TZLk+ZdiqdPhUvPNc7nLEUSIPM5sq8ZeEv44G9KNSMSG0HZJOKkzlkiYkZTNi9Wr+ITRbDFKQMf5V0VDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(2616005)(36756003)(41300700001)(7416002)(5660300002)(8936002)(316002)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(26005)(186003)(6512007)(38350700002)(38100700002)(86362001)(2906002)(83380400001)(478600001)(6506007)(54906003)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vh1vXQEzgE7hqklW0mowS38R3pQpNzLpOXupt7YTiqP0HjlfNpnS/Lgo6Z6S?=
 =?us-ascii?Q?6hXRwOvUUibulBxjCRrieHNMPuRUAaT5MAp0AgZC/1DvEImFnwFp12dH5iZI?=
 =?us-ascii?Q?W0NO3llTqq1ZXb9d3bJtRvqOYuQbS2gHykqZdhPY/L/ZoLR0HbdtchqvQi3+?=
 =?us-ascii?Q?AtWEIuuMT99jW5iS9ICmcSQIis0AunIxWkrWck0ypr+ZAEBbqRfSlUfd4oz8?=
 =?us-ascii?Q?TJorK8V6a3ENhVtcPgDnbtdFD3i2BlS8MwA9trcNl/gYbSdL37hPlHA5+Ibg?=
 =?us-ascii?Q?rDwTYOwHEA4hXONI0nfcoxQuBkqbWWjGQ58Z5dHO1AfHGURBp9tR2niMcYRI?=
 =?us-ascii?Q?RMhbb8OfaKUX12xM5oFw7LEAbeBa2ghIjKmGkeGrSmsMbsTlJJwZWWZugk2G?=
 =?us-ascii?Q?9PutZtrKdswgogzUHxb0RtduD/zjVqZUZaeoWuqKgPlRzMumqxvz8bf+bh8y?=
 =?us-ascii?Q?70lGvz2sTqmMFRpPgI5pb4bUCG+DSlgaoFUScFMi0048Dgkxd8cm57Wqm+GQ?=
 =?us-ascii?Q?kxgsL0+juWwRYfdhNEEKamYIezoknxG6vFryvACrKt8wOJ8oilswvvoDGrWm?=
 =?us-ascii?Q?rFIrPcqguYUnd/E+H7QLfEcfLZ4peVrBDnBHpmE9CIN2MYqTfHDsDUJUl9ZG?=
 =?us-ascii?Q?WuQGQndmB4is34fodWAjDRR/9uw6AlMA+MHsWfoZau86c7ni9ts0ACp+69W7?=
 =?us-ascii?Q?6/21e4vm0h0zWCkDZEscMNCKNtZ9PBgG3d5IZUo7dFQbcReu6D6q8HgHHJib?=
 =?us-ascii?Q?Mfp7zRAowNIK5gYfhHCkmk6rbM+BmrGNtCdRPNBR1SnZryIoFQnmMvcaDYvo?=
 =?us-ascii?Q?FygsdYU5XBS1WsDQlFTqxr8SEIQm1emX+t1L5ePoD2hkPgIyphb1DB3OTWuT?=
 =?us-ascii?Q?6cY362Cc7mcxP7vF4NGhYRXj00OyD34ukcgP7shO191WyhnAlncD3FlXIwk3?=
 =?us-ascii?Q?umNvOkVhC5WJ5urHIIsdd09ZyiK+43uPN7Vu6+RWy7dcrcdEIh0tBeCtgbnZ?=
 =?us-ascii?Q?Z8gTWm40aXX5A7MO4Bz+DtSjZPnwAexbt7u/UsjCWXtCU5bMRz0233XieKYh?=
 =?us-ascii?Q?IfL2LEZW+vSaq1d6famSrS+MJPd3FV335z7r9+8By47lZeUDXfIxl9uUucmc?=
 =?us-ascii?Q?orP5J43tyLhOJdi75gwvmzwn2rKUDLwKtHdTlnzVWF7tqSQ+pODY5srDUrY5?=
 =?us-ascii?Q?RhxWeClwK7P8gfrs/RgNgc/+jv7Lz15bFEs/jVbb+gWZeS0i9mTAd58Mb/0Q?=
 =?us-ascii?Q?OpbRwp0pY6CD5JVRNe9ChnBtFyCnMWh4vx1qv70ZgQ0McFnpN6tnip1H3c+H?=
 =?us-ascii?Q?Kc/gKhONHjsAy0TRtcTWNCV6FST6BB0hZjtZVMKg8TW7lXLqLtVbG6xjuFJB?=
 =?us-ascii?Q?ISkxlYauw+yQWNt40iPb0K7k7qubM7nS3nSeZPSnAAtku22+x4HIFzY3a4ba?=
 =?us-ascii?Q?Ys5BExHGreITQ3g8e5uY+5KF6q0TQt4+FxQ48H2iq+8/F+RJoenEfkZtqoiT?=
 =?us-ascii?Q?Aw6q4B6kvShc6xSZ0KpdWrY4g+LWrHvVbBJrBGSGFQnZ95egWH6haPbBt/A7?=
 =?us-ascii?Q?x0/1TnB9IHgOIMmiHC51NDZmlzOy0UPe6fDMO7vvqxl/qI5G/u1uDv0IYFDM?=
 =?us-ascii?Q?N3yN1BVz226p9+TFZF3V/AM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ac5f8c-a3ec-48f3-7e60-08dafab48a28
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:04:14.6406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWKJvUcg0MNVbTGNigknXF376UytP0iKXZB5KVpoDR8/9TO5JIipKscBBOEBGAwdQPepF95V7+OQ5YvNeAp6sjzOhUsqOAHxkftSdaLNnzK4rNaQId5+gLVvyLpMSitO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5825
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current snd_soc_dai has data for Playback/Capture, but it is very
random. Someone is array (A), someone is playback/capture (B),
and someone is tx/rx (C);

	struct snd_soc_dai {
		...
(A)		unsigned int stream_active[SNDRV_PCM_STREAM_LAST + 1];

(B)		struct snd_soc_dapm_widget *playback_widget;
(B)		struct snd_soc_dapm_widget *capture_widget;

(B)		void *playback_dma_data;
(B)		void *capture_dma_data;

		...

(C)		unsigned int tx_mask;
(C)		unsigned int rx_mask;
	};

Because of it, the code was very complicated.
This patch creates new data structure to merge these into one,
and tidyup the code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 68 ++++++++++++++++-------------------------
 sound/soc/soc-dai.c     |  4 +--
 2 files changed, 28 insertions(+), 44 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 197dc1629708..e3906ecda740 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -423,6 +423,16 @@ struct snd_soc_dai_driver {
 	int remove_order;
 };
 
+/* for Playback/Capture */
+struct snd_soc_dai_stream {
+	struct snd_soc_dapm_widget *widget;
+
+	unsigned int active;	/* usage count */
+	unsigned int tdm_mask;	/* CODEC TDM slot masks and params (for fixup) */
+
+	void *dma_data;		/* DAI DMA data */
+};
+
 /*
  * Digital Audio Interface runtime data.
  *
@@ -437,14 +447,7 @@ struct snd_soc_dai {
 	struct snd_soc_dai_driver *driver;
 
 	/* DAI runtime info */
-	unsigned int stream_active[SNDRV_PCM_STREAM_LAST + 1]; /* usage count */
-
-	struct snd_soc_dapm_widget *playback_widget;
-	struct snd_soc_dapm_widget *capture_widget;
-
-	/* DAI DMA data */
-	void *playback_dma_data;
-	void *capture_dma_data;
+	struct snd_soc_dai_stream stream[SNDRV_PCM_STREAM_LAST + 1];
 
 	/* Symmetry data - only valid if symmetry is being enforced */
 	unsigned int rate;
@@ -454,10 +457,6 @@ struct snd_soc_dai {
 	/* parent platform/codec */
 	struct snd_soc_component *component;
 
-	/* CODEC TDM slot masks and params (for fixup) */
-	unsigned int tx_mask;
-	unsigned int rx_mask;
-
 	struct list_head list;
 
 	/* function mark */
@@ -482,8 +481,7 @@ snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 static inline
 struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int stream)
 {
-	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
-		dai->playback_widget : dai->capture_widget;
+	return dai->stream[stream].widget;
 }
 
 #define snd_soc_dai_set_widget_playback(dai, widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_PLAYBACK, widget)
@@ -491,10 +489,7 @@ struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int
 static inline
 void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
 {
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_widget = widget;
-	else
-		dai->capture_widget  = widget;
+	dai->stream[stream].widget = widget;
 }
 
 #define snd_soc_dai_dma_data_get_playback(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
@@ -502,8 +497,7 @@ void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_
 #define snd_soc_dai_get_dma_data(dai, ss)	snd_soc_dai_dma_data_get(dai, ss->stream)
 static inline void *snd_soc_dai_dma_data_get(const struct snd_soc_dai *dai, int stream)
 {
-	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
-		dai->playback_dma_data : dai->capture_dma_data;
+	return dai->stream[stream].dma_data;
 }
 
 #define snd_soc_dai_dma_data_set_playback(dai, data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_PLAYBACK, data)
@@ -511,34 +505,30 @@ static inline void *snd_soc_dai_dma_data_get(const struct snd_soc_dai *dai, int
 #define snd_soc_dai_set_dma_data(dai, ss, data)		snd_soc_dai_dma_data_set(dai, ss->stream, data)
 static inline void snd_soc_dai_dma_data_set(struct snd_soc_dai *dai, int stream, void *data)
 {
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = data;
-	else
-		dai->capture_dma_data = data;
+	dai->stream[stream].dma_data = data;
 }
 
-static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai,
-					     void *playback, void *capture)
+static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai, void *playback, void *capture)
 {
-	dai->playback_dma_data = playback;
-	dai->capture_dma_data = capture;
+	snd_soc_dai_dma_data_set_playback(dai, playback);
+	snd_soc_dai_dma_data_set_capture(dai,  capture);
 }
 
 static inline unsigned int snd_soc_dai_tdm_mask_get(struct snd_soc_dai *dai, int stream)
 {
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		return dai->tx_mask;
-	else
-		return dai->rx_mask;
+	return dai->stream[stream].tdm_mask;
 }
 
 static inline void snd_soc_dai_tdm_mask_set(struct snd_soc_dai *dai, int stream,
 					    unsigned int tdm_mask)
 {
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->tx_mask = tdm_mask;
-	else
-		dai->rx_mask = tdm_mask;
+	dai->stream[stream].tdm_mask = tdm_mask;
+}
+
+static inline unsigned int snd_soc_dai_stream_active(struct snd_soc_dai *dai, int stream)
+{
+	/* see snd_soc_dai_action() for setup */
+	return dai->stream[stream].active;
 }
 
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
@@ -593,10 +583,4 @@ static inline void *snd_soc_dai_get_stream(struct snd_soc_dai *dai,
 		return ERR_PTR(-ENOTSUPP);
 }
 
-static inline unsigned int
-snd_soc_dai_stream_active(struct snd_soc_dai *dai, int stream)
-{
-	return dai->stream_active[stream];
-}
-
 #endif
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index e01b87ea04d4..906819d441ba 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -514,7 +514,7 @@ void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
 {
 	/* see snd_soc_dai_stream_active() */
-	dai->stream_active[stream]	+= action;
+	dai->stream[stream].active	+= action;
 
 	/* see snd_soc_component_active() */
 	dai->component->active		+= action;
@@ -527,7 +527,7 @@ int snd_soc_dai_active(struct snd_soc_dai *dai)
 
 	active = 0;
 	for_each_pcm_streams(stream)
-		active += dai->stream_active[stream];
+		active += dai->stream[stream].active;
 
 	return active;
 }
-- 
2.25.1

