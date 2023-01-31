Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A8A6821C7
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:02:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ADD2EB9;
	Tue, 31 Jan 2023 03:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ADD2EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130550;
	bh=Bo5E4GtHSRpqPfe4tOUvV9vkSStDRiyyMRxslML06aI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RY3wWTSCcm+E0Qlng5u00VxyuUANnah8YTChLLQhgkoGpXs+RrAoLX9zx0kzoHzVY
	 z5UsGHdqncoQIIbkoFukCuPFr57thiaiHN/NglTXR8/TjElYuKzlqxqUnP9CUmpUNf
	 Xk4hGze6srTnwTIL0ZiotC7Y/XsR9imec/02YpBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B34DF8057E;
	Tue, 31 Jan 2023 03:00:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D07F5F8057E; Tue, 31 Jan 2023 03:00:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2107.outbound.protection.outlook.com [40.107.255.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD46BF80563
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD46BF80563
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WETJgS0s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7RrxFxs8lrIgdZIbTPV9Qwqm010J6NwgmXGxApmVVH1bqNsOKgIR78HtOU+9/LuC4NQRHcq63N50I54I2NNnObzwW4hBA90UqUqgz3eilJEd0vv4Xf2amoip+K8sLNSEeCqpY2FoCkeFV5iWRTL3U1ziiNZs3sWcGPENLjDfqv5fekX+g0nEXkk+Y1522VbaFXsAmJir3+gFXmmCxiNIx3TqjRpg7g/wnQfKm9kzJyDX7e6Z03fc+pZtFDQRMWArwKwYD8eCUh4lx4OBSuBWIDojrq+aEqTR8zFoY00cZDyriz+S7kgREdM6TxRe7MYmre8+BfyhY4zMfxwdrOeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m04DCurg0rGZ94uhOWyx+cLkrC1ER9W672+pQzbW4R8=;
 b=SzQV/ATDRyMsmyz+nHg9Ut0tUFSigUl4IA+XBXxUP0N5Lkp1HKv3+Hq1YCbRKI5+7kBcrYnW9eWA3bYVYX3YWcmWGAbSveaOA0kMuJeF1t0cVAYnXQU2KVbmfqP65OkEvY13eHOYB0TI4TlXFGHtkUXVAnGKjHKwJxcgUqFzdq61ixjgFab63b3Bd2VX8AUa7UFf2wMdblg2+RYvus3UxOtpBMyFwpgNBWBXoVXS4PxX/9tBDusOdSohEtp3RUDAIMD07BbluGbm8XNFWwijMkVRBD9Ys17XajYMZ9EZsHDX9iqStxgkkjaJHgx7CUX0A0qqVcDql1XPxhcalAO8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m04DCurg0rGZ94uhOWyx+cLkrC1ER9W672+pQzbW4R8=;
 b=WETJgS0stan8sM1eSfHWjWYT1BZSHnYutMqwRvE/yMI3Yw6/atvekrOsMY2Z4GQQ7f0vfBc5zf0rWKh63eQwuIQQsdgXls2mGSXbQE1CG/wk1QJ9+vlS24hzxi2WnSCfKJJ6is88I8ka1VXiUuA9wLf0G+h9AuvN0jxNGFFn4Uo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8196.jpnprd01.prod.outlook.com (2603:1096:604:176::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:00:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:00:16 +0000
Message-ID: <87zg9zea4w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 09/25] ASoC: rt: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:00:16 +0000
X-ClientProxiedBy: TY2PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:404:a::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: b9601e8f-4562-41de-5c17-08db032ee5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J6vV1bS889AncJcjptXJNcv9ziuZDnsL0mLpZy4dbeGTVRIILH6e5d4bh5dpnbreD3xgeSF4EgfQgnkiDYNE7CCv2RleV3Z0oiSk4FEuQiLNitrcgkFMOnsKm7kabXAIF6ge/j5AFUpN6OsFAN5wp1ME638YFRUhWmFMEgPYtyWRlVBr/98DVsdNvX/UH7yJhq91qZ3EIL72dRJGQbQWCtU0x9o8oOkNfusRpElRHM3gsA/fcFjAGye388S+12HEoDXQ/zN5aET9DB2g7ODAlIx66gCCfi7/ey3bn1JJGgbPQhKgtLPu++BfYKF7QXYrwKP6iDNF6Jbs1DvlH973GNKKlWUrVBz3U1s57BwO8lsbVEyZGi+WJhupNjbWlZftBOMWBfaYCkcorsmv/VS/WG1YdBugO32CxwO//NUghMkgTu45waWKGByXJcBlZN0qEuymzMu+BwPo8orCX3ExiPz2rT+av5ZZlrpxPYPbb/pgA6clWLEUHv3/iZDovUyODbOrTB7Jz+SS+RLZ2QAWASy6xiD/DF9kbUpakTxa7AprsLaN5rlRvNqVnGIjPWHzqQXVi+nw9k+Ip6FtZuT5H5YqiVfVScYRFd6tYHpleldhOH8U84Ag74lwF62y+Tm9Oana5r0goTi4F6XDeft7S/Txzez4lBxBkZ7/H0RoqQT7AKSVDdCn7rBiNS8ENuPNlb5XfqMx7I+FSHxwp+0yhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(8936002)(2906002)(6916009)(38100700002)(4326008)(38350700002)(36756003)(478600001)(5660300002)(30864003)(186003)(6486002)(6506007)(52116002)(26005)(6512007)(2616005)(86362001)(41300700001)(83380400001)(66556008)(8676002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P9WpVtAzm4Okq/e1jQZDzL6zxjSX08J4a6Bt7meqLvL7ZPmcP2NPr4+P6xay?=
 =?us-ascii?Q?IJKRQioADNlk6yj3+zLVQHWmSJBoSW2MNCw0aL6idwJ7saF33Bs0vctssGnp?=
 =?us-ascii?Q?jgzobDtvgqStHLQBObBygga/KNfhWvtgSciMMoWuF+UIGR4jtSoU12e37JyF?=
 =?us-ascii?Q?ze4YzLr5aUuv8OhHR5aCxXBxFKmYj0YDPk+USD4/D4UbZbpDwSwZft/9Doba?=
 =?us-ascii?Q?ECdqL+35w8Umv3TvxqRmczAiEWn329ci0uPTsXHhNRnze/eUwcm8ZBdvrtDE?=
 =?us-ascii?Q?TK/W9ZBZiAuXT+1apJSZRxOQzhcuip8sbEnnevHx9lQmC6C/33wPpOSHqmDJ?=
 =?us-ascii?Q?adk3XrqdVAPXDnJNmElKU7fGeCnLKvcQB5DejsSsDGKsjBOcOiESrlgc1Lxq?=
 =?us-ascii?Q?mXTNtCFI69nwLEp+fLPy1sP2xtlTNn+VAkaz7Kx74IG1T4naF9VEf6r4LSKj?=
 =?us-ascii?Q?jjM6w1rE+hv/Xqri9L0h2ohne+RvWsud39FyAYlO0f5NRbHO8ybw5R9zX+ur?=
 =?us-ascii?Q?r+WUAmEuecj3tI91ZqenGEEFzds2S2z1s8+Z+kLSboxbJRpk6EX2SWK8R5U7?=
 =?us-ascii?Q?08b9eAL4Ldu6sEIym+rGC0+EiY8euqx0K0ycKFHZIDxGJAhY4q6TYu3K+3iZ?=
 =?us-ascii?Q?12fcAnd8gXhDHNXQQdrt78GqOircO9ruHt9jKW5NS8F+Xx+vLR3T/XykUqXj?=
 =?us-ascii?Q?JPL0d6CMcV7khS0+1EnI0NyKnHZEdkMNyh6gJtrgL1E76C6mcAALqCa0/Ujm?=
 =?us-ascii?Q?ezBJBhT/GXenKTSDAej8Xt/UArL2fi1uK4l64iSeoKtiXvC/Ojmt3Nt1jBDJ?=
 =?us-ascii?Q?nbIf02x7OJyY2HWbyttXITNMvR60kGtJO+uy+mN607FuJFVZT/RUARWKcNO6?=
 =?us-ascii?Q?ub9TXU8rDxGzqR2MPDE25bYNZMH12mcqcqp1EV8yYmwxvpqBaJAG3vk+S1/z?=
 =?us-ascii?Q?/x++XSph3ok0kF5njfmDpPKT9C5zANpuOPdzSDZ18eEsXKOC3p39YfpzdFqR?=
 =?us-ascii?Q?BuRvXRh5xOHIqJVKs5JtfVeCI53Iwwn3UyQ6XriufDXFugbDaXDY5DWd+2F9?=
 =?us-ascii?Q?PGkeTDUxrKCoHNjUcVpINoRkN1x5Gx9jWm0CtovkgpulKKWq7BTow1zGzmI9?=
 =?us-ascii?Q?ibvTIeSgtSMcmbaTYu5AKyRwCLzMgwdjwB1SCF4pReAym5eXrXMLBw94/K5+?=
 =?us-ascii?Q?jaa9Lgv9NKHpBO/+/8DriFKennFTO1Hv8xYjbkflIx6iu+DFwq2mmv791IKz?=
 =?us-ascii?Q?6hAM0CL82yyTyNmktnUxlosOFYpL0aWD/wc/3ZQktGB1/GjaTKWBSNj40Vtd?=
 =?us-ascii?Q?mYobaTN0PPNbgKPgUIJ59lKKxCteN5RV3+lfYl+/ryAZUkzSfxZ86cBCaQfa?=
 =?us-ascii?Q?+C353jGm4AmCi9qTyGEO56Dhp9i7bu4n0K00G62JJ9+wlvzmz6rdurIPF8Fz?=
 =?us-ascii?Q?Xv2ssq5aBI6G7BNqTiarG/1ZVO3XYuYsxUk0fY8nDpTRCOCwkFC2P4Tw4ZWM?=
 =?us-ascii?Q?aHBvoxSsZgLXmN/ZlCuxN35pZnBLPSReMtToG+t6yzQOY0oH13gSOPy9jQzN?=
 =?us-ascii?Q?Vt0ZkuPN+juPxFJmLjQa4Ip9raqsFoy10w4HPyMDbXvWXa25wdncrSiRQKaZ?=
 =?us-ascii?Q?BKtH/7e2VNPeyztIieEsX8Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9601e8f-4562-41de-5c17-08db032ee5be
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:00:16.2768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/QzP+vaIicc8/T0eAiOXXqQ6ffZDjUidb6HomPXG25riyDrbeJdiZ8/SiveCkLpfBjCn6XY3G+naqMKMLjE1y3RK0V6GONMgZlf18uupVHLzTWXuzQsoOE7ByCq/oYI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8196
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

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1308-sdw.c | 5 +----
 sound/soc/codecs/rt1316-sdw.c | 5 +----
 sound/soc/codecs/rt1318-sdw.c | 5 +----
 sound/soc/codecs/rt5645.c     | 2 +-
 sound/soc/codecs/rt5665.c     | 4 ++--
 sound/soc/codecs/rt5668.c     | 4 ++--
 sound/soc/codecs/rt5682-sdw.c | 5 +----
 sound/soc/codecs/rt5682.c     | 4 ++--
 sound/soc/codecs/rt5682s.c    | 4 ++--
 sound/soc/codecs/rt700.c      | 7 ++-----
 sound/soc/codecs/rt711-sdca.c | 7 ++-----
 sound/soc/codecs/rt711.c      | 7 ++-----
 sound/soc/codecs/rt715-sdca.c | 5 +----
 sound/soc/codecs/rt715.c      | 5 +----
 14 files changed, 21 insertions(+), 48 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index ca2790d63b71..45544b530d3d 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -508,10 +508,7 @@ static int rt1308_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index e6294cc7a995..6dbb59f51426 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -507,10 +507,7 @@ static int rt1316_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index f85f5ab2c6d0..b51da098e20b 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -575,10 +575,7 @@ static int rt1318_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 620ecbfa4a7a..7c7cbb6362ea 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3157,7 +3157,7 @@ static int rt5645_jack_detect(struct snd_soc_component *component, int jack_inse
 		snd_soc_dapm_force_enable_pin(dapm, "LDO2");
 		snd_soc_dapm_force_enable_pin(dapm, "Mic Det Power");
 		snd_soc_dapm_sync(dapm);
-		if (!dapm->card->instantiated) {
+		if (!snd_soc_card_is_instantiated(dapm->card)) {
 			/* Power up necessary bits for JD if dapm is
 			   not ready yet */
 			regmap_update_bits(rt5645->regmap, RT5645_PWR_ANLG1,
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 6e66cc218fa8..17afaef85c77 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1298,7 +1298,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	while (!rt5665->component->card->instantiated) {
+	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
 		pr_debug("%s\n", __func__);
 		usleep_range(10000, 15000);
 	}
@@ -4748,7 +4748,7 @@ static void rt5665_calibrate_handler(struct work_struct *work)
 	struct rt5665_priv *rt5665 = container_of(work, struct rt5665_priv,
 		calibrate_work.work);
 
-	while (!rt5665->component->card->instantiated) {
+	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
 		pr_debug("%s\n", __func__);
 		usleep_range(10000, 15000);
 	}
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index beb0951ff680..ecf3b0527dbe 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -1022,8 +1022,8 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		container_of(work, struct rt5668_priv, jack_detect_work.work);
 	int val, btn_type;
 
-	if (!rt5668->component || !rt5668->component->card ||
-	    !rt5668->component->card->instantiated) {
+	if (!rt5668->component ||
+	    !snd_soc_card_is_instantiated(rt5668->component->card)) {
 		/* card not yet ready, try later */
 		mod_delayed_work(system_power_efficient_wq,
 				 &rt5668->jack_detect_work, msecs_to_jiffies(15));
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index d8a573dcb771..5f80a5d59b65 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -107,10 +107,7 @@ static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7e3eb65afe16..f6c798b65c08 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1094,8 +1094,8 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_dapm_context *dapm;
 	int val, btn_type;
 
-	if (!rt5682->component || !rt5682->component->card ||
-	    !rt5682->component->card->instantiated) {
+	if (!rt5682->component ||
+	    !snd_soc_card_is_instantiated(rt5682->component->card)) {
 		/* card not yet ready, try later */
 		mod_delayed_work(system_power_efficient_wq,
 				 &rt5682->jack_detect_work, msecs_to_jiffies(15));
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index f5e5dbc3b0f0..77dc62219bb8 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -834,8 +834,8 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_dapm_context *dapm;
 	int val, btn_type;
 
-	if (!rt5682s->component || !rt5682s->component->card ||
-	    !rt5682s->component->card->instantiated) {
+	if (!rt5682s->component ||
+	    !snd_soc_card_is_instantiated(rt5682s->component->card)) {
 		/* card not yet ready, try later */
 		mod_delayed_work(system_power_efficient_wq,
 				 &rt5682s->jack_detect_work, msecs_to_jiffies(15));
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 6534c9b51442..659ce26e9f3b 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -163,7 +163,7 @@ static void rt700_jack_detect_handler(struct work_struct *work)
 	if (!rt700->hs_jack)
 		return;
 
-	if (!rt700->component->card || !rt700->component->card->instantiated)
+	if (!snd_soc_card_is_instantiated(rt700->component->card))
 		return;
 
 	reg = RT700_VERB_GET_PIN_SENSE | RT700_HP_OUT;
@@ -887,10 +887,7 @@ static int rt700_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 7cdf184d380b..c65abe812a4c 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -295,7 +295,7 @@ static void rt711_sdca_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card || !rt711->component->card->instantiated)
+	if (!snd_soc_card_is_instantiated(rt711->component->card))
 		return;
 
 	/* SDW_SCP_SDCA_INT_SDCA_0 is used for jack detection */
@@ -1249,10 +1249,7 @@ static int rt711_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 78e1da9b0738..862f50950565 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -243,7 +243,7 @@ static void rt711_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card || !rt711->component->card->instantiated)
+	if (!snd_soc_card_is_instantiated(rt711->component->card))
 		return;
 
 	if (pm_runtime_status_suspended(rt711->slave->dev.parent)) {
@@ -976,10 +976,7 @@ static int rt711_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 1fca7a3f46ea..920510365fd7 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -793,10 +793,7 @@ static int rt715_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 1a2036ccfbac..c6dd9df7be45 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -777,10 +777,7 @@ static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
-- 
2.25.1

