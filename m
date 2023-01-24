Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7C678E19
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:16:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFFAE9A;
	Tue, 24 Jan 2023 03:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFFAE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526593;
	bh=hZ4qmIsNr1IYsGbCqfC71T9AvkAFMeaLktbP8HlCfzk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VaeTOKqiBvIGd6eZH7ekRbv1SfnCWwy2eWq7BF00hNh5vkQy4lPqu4bSWv0HODy9j
	 daz3Z8KX88aCzfNWeYJ3RTVSIonUmWXYMNfpjy6l0gKwZIoddnbvjtR9LJ36+td055
	 r8XLVLbN6cy4NDviFX3q50XTD94k52CHI6VkzfCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8907F80163;
	Tue, 24 Jan 2023 03:15:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9699EF8027D; Tue, 24 Jan 2023 03:15:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02D5EF80163
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D5EF80163
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fYp5VZpo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTY8oHeuH14Lofi6cc9Zln7uMX0v2ER+eH9XWcHG6idoWOBfuQ20/QzOv3bVaWc7mbQYSSxsc6B/0UAzHRplw9Fup+0oB/sUDQRCrKcnxGi2wFLOYOeEjrJaNipb15GciMsIcL16wJmRP8GYsJoA8qCVxcWB2k6+bkpVnbH6opRJ67PGCGX1T05y/HyqJLVH5F/A8JFynAzFNZws4wzhsq+STu+6okU4lAP3dyEegAmdtO0rdGS6xToOnExBrYpAtHraTl0fGK3lYU3MTLrt3/jSRPEmNDkjixLKUcsfPEeKC3Fvxw0HFhHjcXAaADq74OodNLkvnEWCNOx6DPv8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrHPqV5fcL32FYcfzRLgfjorM6eh7YfLrn6q4GN93jo=;
 b=IwcZK+egA2r2Vp+cR+eIj7fM2zCDyjGFiMNfDKu6JG/GAZLicFn6L8CaJCiSI6tW9CdR+zvzmjScDkLM12qyQO7rEsTyjy66lEmGEnEiFcvf4DFHjjeepTZ0KOlPLx+U/cUFnWrF64tXGg4bPxQXUiPtNjiyyOB4+gI9sORzO5bvMU9u2XjktrJ7vgLRg5CAcahGDd1H3mAKsBbVGcoYenw4DtY3fv4JdanHAFzv+c/vWcxLqPQWVFjHZJ5FRxj5ekk30B6uk/IMghGS8uNNxwUFsr6Rz67Y0J9SeOhBiJVk7g/7LLwpKSLnmOoJdmqUaeD6saDXqklVmfsrVjUNjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrHPqV5fcL32FYcfzRLgfjorM6eh7YfLrn6q4GN93jo=;
 b=fYp5VZpoGnzItAFkcyyTjQCYllzEwJKOAeOl2gQSa9FYmHjUWbih2XCfP9EXhJmRoWyVe9zkop29an6rwpSeNahKRtjzrDtwgnZdVhzCTgAXQ8dHw8p0jAMXP12Rrht1xnEEP8dwUVVxaq3E7V6kMa+BRZ+olcXTJqNodSzNLAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5391.jpnprd01.prod.outlook.com (2603:1096:404:8021::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:15:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:15:27 +0000
Message-ID: <877cxcu18p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 19/25] ASoC: ti: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:15:25 +0000
X-ClientProxiedBy: ME3PR01CA0053.ausprd01.prod.outlook.com
 (2603:10c6:220:f7::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: e83202b0-5d90-4902-6dbb-08dafdb0dbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5cFIYEnbRVAJ/TW4xvRKlAywG71pEp/7XjLa2EW2+5cNBUmzlcV8+1t0oLVXE9rdQq7PUwtwGUBPXERkCO7H7L7uWfhWyDuJZJBYe8XVzufZeKMb0FJs9Rt1DurbthzoBjiDpc5bF/3JvLX2i8NQEDzkSoJqIaeMfU1vcegF+uFKq3ca2IUrRk2iQfNH42SYMxtQg1nLUvdK0arNKdYF+fHcN7D8fOT8t4vH2qXQiVC/M9gh+bVnPutYNDJkKcLIGq6qs4WWDWyTqKJz48/x2LXaiqnRhejEm2QOlK2VqOz51qcjYoRxXXfUU0ygYsJiUMYErxrRiP3c+YUU3S9dz5Hp+9o+ygSkd0ZKZsQwl+0SjWWY/LgHzA4AMD6kCn+WYv3u9R8pd2q0OCeSyefODyhRVSIKhug29HrQvsyxnBwp8EYkpNIkKUjARccF7deH5XKib66RHSS78XAc9+/ffbBlsXYTU2GnLhbs8A+1VMNCZhfwZDBMfOiLtPdTPc4vMdISA7mwosQhC5mMsVn53UvdzKASmdS7Wz8y2B4Q3M6IVdfPy+rW/1XbaBs7KtOLFhSn/0RixIQy1BjMI0FteCydPdBg+dCY715LWatxU8pXFNPBx5xqtkBUCbDlPqqT2Ly3L6Ub/Y9R80j44C9JwJFsWYXtEX4emZBCsFnKzktjpuoveXue5SP62xr8nJvggl3/ZR0Z2tDJn01/51anTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199015)(36756003)(86362001)(2906002)(38350700002)(38100700002)(5660300002)(8936002)(83380400001)(4326008)(41300700001)(66476007)(6486002)(478600001)(52116002)(6512007)(6916009)(8676002)(186003)(26005)(6506007)(2616005)(316002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yADhYTueNWT0mNAe+7y7slpwyurMl5cvG5pZuhf7BYuO8kOILuls/tt0nnmu?=
 =?us-ascii?Q?KE01HS2zIbs8EdHtuza9JHMr3HLN+VMDJ4Srq5XfeqDwI6tiXTzFleXXz6Ma?=
 =?us-ascii?Q?Ct/2Zx8OqJeYuieb9VUlESr88y3AUP7yntjh39teXATNFJRa4Oam7oyFD3D7?=
 =?us-ascii?Q?upUDRl2HcVL6tXprZoTA4pcat7jtdj94IK31R7cnEYeh4P/ruXjD+LOGYKhQ?=
 =?us-ascii?Q?P2xs0rrhRQKSxDhw06go7V+HOa1Q4UZewQG2ItlCx7yBwusBmSDMHJVzVj6C?=
 =?us-ascii?Q?a8uzA98VZx1Se/otiERXtzrfit0q3iZcKUlBp3E/c+1DK6f3IZxX4E0UTaFp?=
 =?us-ascii?Q?xFuGTfcXQK/f/WHRFRS6vnTct2UuEWNAIBekKfD+4KUEnFVmfNzCZ7Xut6U8?=
 =?us-ascii?Q?LlH6Du0LnbkP5UxDu33yuBU7cy4LH+IQ5DNUsk1zW5Gnf8W4rrOepFnbXmhl?=
 =?us-ascii?Q?4Xfe8jdoQhcoW3jQ+0RJnonCl+P0V/KE5i5WKcjI/gyFkn6dr9xpCh4EvT5Q?=
 =?us-ascii?Q?xlQwL58zUBLZ9h+8H2xwvhA6iFTOoD1KZTrxKvMMnt692Q/ax49N9TXb0tWp?=
 =?us-ascii?Q?l+00hYd03H1OJCDOgOfvnjlmWJsRJCfgimt1GcR8UUY++X2FViBYvxagCzQK?=
 =?us-ascii?Q?nwdIyTKn7AFWO4jJY25CJth+7f9i6wuwJ2unaxSJ+/f3Q950fPaFzB1Lkwmd?=
 =?us-ascii?Q?uBE5UCdlAM11BVKVPVW8vHtf3RwZbZ6t7Z5FMDv1/MrEqGAOIC8IgDsjnao+?=
 =?us-ascii?Q?7Cbm7AsN7YR2OrxehNG7HnMsN9uro8qlmuZvZqhnTLMDrHoExorL3JVAqItw?=
 =?us-ascii?Q?5esJ+3pNoBGrHxdFNOZb0NdiW645eg0ib6tIIjMiki7egcvqDOwf8NKMLhRw?=
 =?us-ascii?Q?3hUM1CuQm8v02TZEhRbzTJ3BPimIPDR+qNNyL13mHY1lmML7El9pg+vDaFJF?=
 =?us-ascii?Q?RdAfRAa0B0N8AwqFmT7GEWgYieWlhbvZDSlbZPLzwLeUAw2GQGZALzOG33Ux?=
 =?us-ascii?Q?25jEBIquxsG30IMAkmgmQHHSo3kF+Jtws/ALONV42WfxXrFj6FNbFSF0f+DZ?=
 =?us-ascii?Q?CAz0grhlmY92vxV0DlhPPo8vO8ldTquiE+TU4tWiFOPmekTIT9bKvgAVrud8?=
 =?us-ascii?Q?HFBhFKDWaFjaaPypfXb66ohTSVAQCyyLvnqqsOIP06s3X69QO/Hc+nLWZkxM?=
 =?us-ascii?Q?0JChGGBPA15iKUy2b9JS2giziaf1bCQ/4KqEcMre3pNJn+qKCRM97JiiIkBb?=
 =?us-ascii?Q?nHG+1smeZprm0qs1s3DwiLZKPUAekZuoiZ6VLRvSCOA5+NrydDfopteQEeT6?=
 =?us-ascii?Q?huYOrCCJxG8LNbggwMuf8nRQDq17gkXseoLDh+wqNrswxGbuP+grslY9TH7C?=
 =?us-ascii?Q?1lXtHGTBBPeOTx8G0/TcJUBS5n869gQne34Tz0CAsn7crG2gUr27PvZhhDwb?=
 =?us-ascii?Q?+2FIlGO5YqDAGH8cRiAVjGiHJyhXbUF5XdWWGOkgw+EcanTTOl+u6aZ2U5Ef?=
 =?us-ascii?Q?aiIRGMO0wvC4JV50irImF4fKNcmQaGvf93lP4bfasPCirr6N+3udjMMkLaeV?=
 =?us-ascii?Q?Yj96Xd3tlqh2Mf8Tnmdsuz0vBi/r6RO3B+kGj2CF0iekAOe6nd34WhRDgV82?=
 =?us-ascii?Q?UZ+9HG8iySjkz39P5Gk0wz0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83202b0-5d90-4902-6dbb-08dafdb0dbd7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:15:27.2946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBIX0x1JdWcZZ/DfUDy4NhqskWsqkrADTFYu1AYr7Sok/jWAwaEMq/hjUD0F9EUv+lzFClxJZKGsJiRbYMQFp7URW7jNTY5IhoBqAaBhnZTfzV5jofvb40Wg0pJrd5x5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5391
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
Cc: alsa-devel@alsa-project.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/davinci-i2s.c   | 5 +++--
 sound/soc/ti/davinci-mcasp.c | 5 +++--
 sound/soc/ti/davinci-vcif.c  | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index e6e77a5f3c1e..3ccd0cfca008 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -614,9 +614,10 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	dai->playback_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-	dai->capture_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+	for_each_pcm_streams(stream)
+		snd_soc_dai_dma_data_set(dai, stream, &dev->dma_data[stream]);
 
 	return 0;
 }
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index f5ac2ab77f5b..578254549d2d 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1699,9 +1699,10 @@ static void davinci_mcasp_init_iec958_status(struct davinci_mcasp *mcasp)
 static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	dai->playback_dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-	dai->capture_dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+	for_each_pcm_streams(stream)
+		snd_soc_dai_dma_data_set(dai, stream, &mcasp->dma_data[stream]);
 
 	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE) {
 		davinci_mcasp_init_iec958_status(mcasp);
diff --git a/sound/soc/ti/davinci-vcif.c b/sound/soc/ti/davinci-vcif.c
index 36fa97e2b9e2..fc16b3b8f71a 100644
--- a/sound/soc/ti/davinci-vcif.c
+++ b/sound/soc/ti/davinci-vcif.c
@@ -161,9 +161,10 @@ static const struct snd_soc_dai_ops davinci_vcif_dai_ops = {
 static int davinci_vcif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_vcif_dev *dev = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	dai->playback_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-	dai->capture_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+	for_each_pcm_streams(stream)
+		snd_soc_dai_dma_data_set(dai, stream, &dev->dma_data[stream]);
 
 	return 0;
 }
-- 
2.25.1

