Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035DA6821E5
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:07:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44DF3EE7;
	Tue, 31 Jan 2023 03:06:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44DF3EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130820;
	bh=DqVeTXKXcPs08cYrnDAfKNz0u8s/17iD0wXY44mdbpI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=URfUQe0590yfj4csGTCz4poQEOsNo4XongT6BvdjPsHDfRjahr+dWvIR1zRp+PkZm
	 VYNrCzlAD3SOkWWjwOsg7PKxP59GaekDjrKIxbCrO3WVBHNQA7Zix3dJyaOx/6LnFP
	 s64HuQCPL4rMND5kKKQgx58oEk1fBjB2I/mwE6I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5427EF80551;
	Tue, 31 Jan 2023 03:02:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAE4CF805E6; Tue, 31 Jan 2023 03:02:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2091.outbound.protection.outlook.com [40.107.215.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0258BF8058C
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:02:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0258BF8058C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AVoZd+gX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNanKT+UtoDEtThRhSZTcJUviMW3aMb2eTZNDlN9uEqxCSEqn5XzvTLJ2kL3fg7s2zjo1oQUBMIrqFqOi3hMyWk1ldMAJgebpCd5Jv3NTSo0J9XH/5hdopUyGygowAiWgiDmELPvunCBivNnwse/Lesd18R2UV1voV2PVbHmprht66C7uW6K0rephVe49HJVtQrD81nHMfr8zF7kEffpgyjowXScyrVDpuSh4EDjmmFiYRGbVs4BNFMgt87DqqPb8INa6qdjKbr0OJz7sBUzkZ6828sTKQbH753CsvGTQVlHm9oUJz84+SgwyfHepEG+wKyltedUvT05JRgYuXTiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVMsoh3ErVqYgiv+oQeiaV4zpyJky2+omTZ2rTxvPEo=;
 b=NNw5zP1oYQmyVym9KQd557y5mOqkkHeB9wPYvLKg4cIzz2fxkSMXKS9toj1mCD1ZfDLQFumaQ7WaYGD7CxNTtwvyhzqnk2+CI5YRSPRZcfqrQFt53Pj1uy+EfbsTAqreQYpld3yMl6fOmSdcfroHLd2mV5SlGY635UJzWJiCuYNzDT8OIBXwFCHAMFbWwV1ExWilmtjKB3brhWa2b5ew3SzDWbc3CbCXNSKuks+//m6CItMgv2zDSe9eL5bWrHD6B5Erbz8LO/+jPJh1FHqAPM43lqdxoFpVHYPzeE/BcwPAOeWSvXPX9RYFkCh7sCWa0/ISMf/MFLjvwGvIWQhMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVMsoh3ErVqYgiv+oQeiaV4zpyJky2+omTZ2rTxvPEo=;
 b=AVoZd+gXWdWXFvKW/jWNBxsnZvoghWchlOEEL8JEVuuQVbnjtH3JgSIcFipeJfUYomM346Ng9nfscUqJAgnuWOVbOMDAxZMc07yBAyTCzLe0wwSoA4xVRzXN9y3xqQOcl4wezeT1U1/jl95SdfqcoYQqIZBQjefbJU2DL55vPRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8464.jpnprd01.prod.outlook.com (2603:1096:400:173::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:02:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:02:04 +0000
Message-ID: <87cz6vea1v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 25/25] ASoC: soc-dai.h: cleanup Playback/Capture data for
 snd_soc_dai
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:02:04 +0000
X-ClientProxiedBy: TY2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:404:e2::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa93292-6ed1-4a76-f8c4-08db032f266b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Npt1zvccPppBGddoeoufbyzEA7TwPYipYiJx+BFcHz0mT4pN0Jv+TDDVSs4usgSa6IDZwFKqkKtFs4O8KZkmCOG6Oxz2ExMJEz+BnLecKQTOXOwh/L8UO+IP5R++GyunyzX1ep0eTT0Mgc5ld/3rfG98dMqBO9hmZMwX6PTq94Vq5PLKx4A2Cfr+fTlJsJaXtEBCo5CQaqbXCuMqHyH48jwUo6PKQTEqqT4SCL1d7K2g3bF4+VBfzP8D3h3lnHMwWJw3ByYCMqwIESb9lJ7Hz0OMlYpvX9+uIRo2EYQH47oQg+1yuxjNGfyItILeF79fSyub9+jqaW1C+DUB9jlwSHjJbofl3GDUIExrRweTn0GokXgXmcFSFOMw9P6iKK9Ie9hrCiesFhi4NY8KpMRySzAoDXwkmtC0CZ40HhmutmL9nLE2oj/hz2r6fVjHOaqVo5JbteWTvO+J9BKOLwIay8JnDqiNMgd0ClkPPg6lFPGHzniEPB0R6hDZcS+LTU/5zYeIpV5sA0ULRveiVWxj6b+DfHo4idp6P7rqdx0IGdEJOENxe4ePM9EY5FnU716OYAsuF1mZJZmGSjIw8ZRsoBoYvcXToqG7xkkeQ3CNjWTBxqMVC1CmtWBygP4uyxGFwHlpjAVTXHgJ7OH7JxXu+YPvSvZBJv31GdPiozr+mkj+skjagqVgsq31LZ9lIhsbLGUhNBt80OGB3qAtwa2KQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(2906002)(83380400001)(316002)(2616005)(8676002)(478600001)(52116002)(6486002)(6506007)(6512007)(26005)(186003)(6916009)(86362001)(66556008)(66476007)(5660300002)(8936002)(41300700001)(4326008)(66946007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ic6bcQ/EISzwk0+4Tas82d4hQsu9GIRIqOruEYh8XpadyrNRGzv33VC4cIXZ?=
 =?us-ascii?Q?XltEZ7gvpk+XkZVI3XR8xdLcAdWhdw9rTGCnw/WhuZ0TrhBeAqVTlbG2385E?=
 =?us-ascii?Q?V5QZf4SjhPotBIBlqMma9ioOKEB0WW3TbqVyk7HZVtmFQcJNdYOx450S5WJv?=
 =?us-ascii?Q?4OlSP7qeu1FG74faWdVqheezxVYRVIUIo1eCsThDjVlHkP5boXviSSisN+ox?=
 =?us-ascii?Q?+5n9t1dbpvbVk3qd8J3XTq4/FJSByuAvptAomXAsoOlBHhTxOGIxZ+4fZJz9?=
 =?us-ascii?Q?1GwODuyJD5L54Wi1bCWi52JN5bRgu+4iuZStGdgCE4EK8N1y7rLlSk5+caHX?=
 =?us-ascii?Q?1guqCKQzu1wnvDuPrjaj3X37+nqmronlL27Nb4fZkEpUPuGNoFcjMVHaTBke?=
 =?us-ascii?Q?Za3KxixZ3G2pSqKHy/l9xC/74JbyfmQHdcSmB1kKPOy5YH7ZthB2oeLTuI2r?=
 =?us-ascii?Q?VTMI3mcOo1IYkorUupOSyrKL5PkDEy535XPlUeUw5g7SnnF7c6c9hhmFWRTM?=
 =?us-ascii?Q?Nh66zrAclM1NPiZODiazRNl3n/4yY+GVjs64gf+CTorjH/7Ty37tw7ccHnah?=
 =?us-ascii?Q?ZymKohsq8vhG08WffE21Igd+qEzUrrYiG06HE1kFt9iWxIBB0Rlrax+2iJij?=
 =?us-ascii?Q?vqbL6iFTdzDLjDAnWa6RyHUPxw+9R6+oAbd9TgJAWeMgD2DwPrC2trUCUf2I?=
 =?us-ascii?Q?2lmHoIsihm32I1MdDcevSRuzMvKi2JFGevS2II4y0Gvua4Uu8Oioq89SxtTj?=
 =?us-ascii?Q?lsoGc2NO6cMALKPpU0U6JUx2o9ucsMVuBCwZys04+4mGtyyGU5i4v6lhtU8l?=
 =?us-ascii?Q?QmSQ/wQS3PH4I5Df/51wb2KWO4H3dE4znv8Iun89z8NW2hDW3xn/5nGCoYyK?=
 =?us-ascii?Q?YlPSMMPVeMog6jPIDb/ITwbbFr8YkFTV6xWsu6nHSZ9PCGPFF2M1ZODVZPmA?=
 =?us-ascii?Q?RPfkEnvfMmRQS+MHtjkyKGTG5ZvTcl541pg+8PGK3cCGyQLMWdtInENihgg1?=
 =?us-ascii?Q?e9wArtUDpVeAXTSn/mZOkSoEDmZc/zG6WdJAANxhlM/urK2PPG1u6ZdP6Pph?=
 =?us-ascii?Q?ZAE/DQC0MoE3+GBY0v+p9tIasJYc3YYRTYx+2nQEdd3qm2pY7vBwmZGxp/xw?=
 =?us-ascii?Q?m5BY7kVkoQk4NnA29YjQV+7V9LxqlPV0qHeMOUQgl1dryOLS4IeGkJ+epilZ?=
 =?us-ascii?Q?3FWaVJkvlgCdDXWj2XKwtfE83TltUWlor5LQRFDyP4PQZAwOrk1luOmSX6Zi?=
 =?us-ascii?Q?uyXs1LK1uQqqtHnipRznxsKrhy8aO0KlMdmN1Ly7lrNUCjOm9w+cFwVpD7Li?=
 =?us-ascii?Q?H3s+M8MahXVR/Xv+B4/zJn5rARhsAMGAO8feC5WPqMPJHVvFxuE9UXDF9/10?=
 =?us-ascii?Q?/Vfjey1wS1FDWyCjfRJ9Z+qziUuQtMh1VU/iw0+mp0A78erXORSGeDZE0Gvy?=
 =?us-ascii?Q?orcDLMP8HiU58zEUF12GhvVCw8w1N3l0zBYPbnZM0m3ZMrP00VJ0QDNObAOa?=
 =?us-ascii?Q?eL2ZjAByAcNFyTlV4WZA+fBMooYwsY5bk1kzvSXY/z9V1PSo9KncT1PH3FcZ?=
 =?us-ascii?Q?teZpR1J3OM/+Lx7P+7Qe+TvGULMB8BrAojWrUHEaipiE9ci/I7mBPbe/fUVT?=
 =?us-ascii?Q?SoQNKh5YmpvsTsBRXnZxcs4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa93292-6ed1-4a76-f8c4-08db032f266b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:02:04.7107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBDDIuZYhD+mN/ukdK0cej0Xv5oTHa4WtQmFEP4gNXLj9/lfjRfgPzNjEm13T1Djp1ZimX+SN2TxClRFH/uB6DIIWtaRCXwv7wG4SChIeL6g4G715sSizrdZe5W4hQIm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8464
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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
index 69f534f0d4bf..0119afbd01fc 100644
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

