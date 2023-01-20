Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0620D677696
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 09:44:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185064202;
	Mon, 23 Jan 2023 09:43:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185064202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674463469;
	bh=iFCahi2D9P40IVzu0J8iR7GRiaq4eNVcCgXmDn/Q9tg=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pubfyJ70BMdyKbg3wVotSNxOkUQ3v57Q9Cd8e0mW3H0NLScB1PvwZJR16r6bpN4EQ
	 /ghv5cwrtiOeKxuhKE7Sosi1ljq5XdsG8oJ6r4sNFg2O5zi+EG3QaOag/PuSs9GWje
	 +Dglv5OmJhPZKbxWg0VtMVJ73eqc8I6V5mWZ7TbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6902EF80552;
	Mon, 23 Jan 2023 09:42:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B252BF8026D; Fri, 20 Jan 2023 07:53:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 559A0F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 559A0F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MxFgL8Oa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTiflxJq8Cq7po5GMuLCLVAjpgyNRjSFtesklaMgWObLWhPguZ9W57YVIlKCmTFyVaVf8QuEtLTi0iTzLUCVfC6miIh8foM/2aBAX7ggDNClXobsEgmMkwfWskBrKQc6Y96Qqm9Ppx5LuHivUMbyNAQinhrHjJnSc3stqHr4yxoIYqqCCDaAefmRd+u4wMdk2FJdo3XPsxEaRbywx0sMMumq22a5w0R1/08POFcdwA4EFGl1D1mQmoVT89Lmxhan+oT3POlnbA4cU1Vd6Xn1jGLB4uIUAYxJZISRynofnQt4eEw9ch0hzJ9Cp8gQx8tpB5DfgZcTT5WFur7pV5y1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ3wtJi6XO/fhWm38om37eJPH2PqZpdJ4xrVOUhjESo=;
 b=EpkRGlLyU1CPiTRRaelQETmlI5htt0lKszlpnpjolCgyeUuKV3QWsFrcJyTaZeBlk3jsTK6hGW9SXIEQ/wjuZ3DujjwFsgwCX1G38uhXHvOhEY/723AgfkfADB7+dZ4puc+hs8Y61ggT81jTwedBDiWtSHUSdIoRI8N7IFCuifUA2JdRwiBt/L2l+ywozHAlZ79HWc1aBIEzwTeqasL67q2/6tlx16nraN/YZ8pldwTx77TlsYgBiUerbRIyd/DH6vl38CtVEgbjYMQ3pO2L0DHvKO/ORNOHcZXgEEVeEd8wQ7efioh1WkQ1ozQ/pUsJtvLgRE9N2Ma/9bCfq7MqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ3wtJi6XO/fhWm38om37eJPH2PqZpdJ4xrVOUhjESo=;
 b=MxFgL8OaSDgADDqet4fA5nHSO18fCay2hwYHcWDe1UBltHxDdR+JWYuQF/sAyYLH2jWsNXUkOlpMJqStecc0iICmBesv5tRNzxZ/4epxhjCr/FQLdAckQCNLlhKTYwOeiLDfxnP2kYMF/q2NN+fuFlyGv6PnqBUvpva7W3DSw2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9638.jpnprd01.prod.outlook.com (2603:1096:604:1ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 06:52:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 06:52:56 +0000
Message-ID: <87fsc5lmt4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/25] ASoC: soc-dai.h: add snd_soc_dai_dma_data_set/get() for
 low level
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 06:52:55 +0000
X-ClientProxiedBy: TY2PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:404:e2::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc629d5-989a-4b3a-23ee-08dafab2f5eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6GJJ6TCtIOnGx7AkcSxPTDyTHf7Ba9lGhBZJd/Fyq+rkG7rRjH9JpplZIMWrOwJX1G2Mco6Jz4BBer9QfXEFM5y0jbPa4iXl7vQeqeunOk8MjPN8BjaP43pv4i+B8XBp0SAPDOuYj0KYC+hnkjIUa+rr8XS4KWTG2wY2v0XjfW8slUplTrZf02WVKPm1Q61W0OK4srQXBiDxv6P9eFtsmp+g9C7/mwJtBkP08AxMf19TpYHK8GpY1eEkVbE62inwpZD2NO7VXPsFn+5ZuDMrEP2fhaaN4tmbLS4YjVs96GQgGYJmBrT7PN4Aw98FfTK3oh3eDtibagRGJcaStzrEproLqh6zdslh4awmp9b+yRGAIw+fPabVSbJpii56hAP3wFnXOY2kzG4WOUDhnNq81mQoKLbA+KZ0YstsVHq9THv4DhCXGXAxNzClVxlHGyubRxLE0AXlZjEUgkE7NQVhQ93kF6GZU0XKOh5sJJcWCyAPYPDREiPYmoTKdTvd56ehQvwQ0KPalVbBfhKVxPOrph3our/z5mXm0kmdN8uwcUD5pty/oZ57BZuh3+X2JQUzWU88tqCavPavjqAFE41QAXLP9EQFIMLvTnuKxrne0LqC5dkcjF8oxKJzB2g4lBKPUzJbL15yv9kYg2d9SWGuC+QwKnsXvYCx1wzc4QS1KVOmVKODpscMLaWVcyxHrxZV/vFenYS6y+cJ7iF2ymFjyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199015)(2906002)(7416002)(7406005)(5660300002)(8936002)(66946007)(316002)(83380400001)(86362001)(66556008)(54906003)(41300700001)(36756003)(4326008)(66476007)(6916009)(8676002)(52116002)(2616005)(6486002)(6506007)(186003)(6512007)(26005)(38350700002)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TqP//wcCRWa3JVLjY8yePdqAj+rNCV6a95TNHVAllPkQNmZoOlcT9rFo91GS?=
 =?us-ascii?Q?759BuddV02neVzibv2h4zzeduZZwZr+Fi7p1XeiUjYxxMLfwSO8DtQpkRu8P?=
 =?us-ascii?Q?fRdG2tTwTKhC7/0P/g/yLJfJgkCqLjBeC9jHnlxjJXCVNjzBARXKX6AlOgdT?=
 =?us-ascii?Q?fmmCbJ98sVNcbYlBviJH7+KzVvJ1G4jd3/y52KrYhcxHzWGn8zR7AQ3o5jHP?=
 =?us-ascii?Q?WyljGUSlawFvrv2nGPEKVvqVPqkiy5O90RMQJurby4+VrDKV1RBMX8OqvDnY?=
 =?us-ascii?Q?Ww0aIQa9GWjjRMIiL5XX6EJpsGln+53b4lcbcbI/d7+ibBtbFm83l95cHO8+?=
 =?us-ascii?Q?80wG3xfWB0Psaa73JVHSDsAGFZDKtjzwEdwKpBaXPEBQN4tdFTAqmRnzs+wo?=
 =?us-ascii?Q?Ahenr4TheLKjgjUHX/OsaZMGcx9EGJKvXdC6rIREWkUCTZ+dl4UU0M9bJJm/?=
 =?us-ascii?Q?k+cXDkbXehS01e7+I324WYugXAOREAjF6HvRYY8ppU66vNucdlqwEIsHAB5C?=
 =?us-ascii?Q?OfQreGab+15r7RmOKZKlwKUzi5KdaPZmdukWsJ7hL6LVquVX8ttYsaExy9Yw?=
 =?us-ascii?Q?n1a9iH9kCuRgGBZewp+SG7ldkHNmw1stYJhDq7Xh2AVwYEb17sWuAgRhZENr?=
 =?us-ascii?Q?RlS+YtI9Tn7gXf25vHQzvNc/8DAhihQthzM/CIpVThGj3WGkp0D39m7Tn+Nm?=
 =?us-ascii?Q?z0Z//EjhiP1xumQ4TqZ6RWolmE2ky3yJ2vumKP7crjBvVxDie0E3YdzLEQgi?=
 =?us-ascii?Q?3AhqzNyAa/hKoeoDE7iQM8E5Uv3XGDBgiUswajjPqAOGSl2F5Lirkxq5md4Q?=
 =?us-ascii?Q?Y1NweYlBcyELEr/0mYXnNUDdIqnypaFJvpoQIPAmXuW6LFdMfUk0vM5H1g3t?=
 =?us-ascii?Q?FEvSYD86HgNPKsK/c29rh5Uij46Guc9MNi/AiHVrMj410QttMWhq3HNWTo2j?=
 =?us-ascii?Q?Fjodyd8MqraXPIPLyD/tK80n6MsQ3VGGrB4Lov1hHY2pOCQWu38j+jbjbKOQ?=
 =?us-ascii?Q?2oadaXHu5Yklzfr5rltl5eUCxGpB5sR8yZHf18/jH76CRkEJCxsP/s1qW7sU?=
 =?us-ascii?Q?ZLnnXfbSkZg+MyhU5Efn2j2QMR67XsRR9la5vQVIpv4nwjKNYiigiXKfIgFC?=
 =?us-ascii?Q?IVdAHPoQnVezCluD+c7/ujFoG8WpN6P2/36amlwz8f2jVsrutUZmOF0EIJSZ?=
 =?us-ascii?Q?dUgIhrcrFIqrvtWxJ4PFmwFYGu8yAMWgLa2d4EICT1imvWYpxwo4TUr9jsMP?=
 =?us-ascii?Q?eRChGdYFHnL4PI6tYJDeEWwFYDWKPgeHWKxiDLm3GoskYthRXBm6xLT6YC1A?=
 =?us-ascii?Q?hsOLOUHVcCGpzfY9AHMY58Wea3B0LieAkXXYpEzM34jO5PGwbPOjsK1Ddxpr?=
 =?us-ascii?Q?5yDAAzhLeOV2LDxcLHoiQ3GZUnBcegfZQvq5O2aZH135J6PB3fhye2YSBq/R?=
 =?us-ascii?Q?JAFZoGfIH10DrRYZmPy2WIE0+EcwbC9+0rhiU9GV/3Ghc2x6/XRzhrI6UTX8?=
 =?us-ascii?Q?SCR/0g/uI8aPVzmf2ffnHT0KEBGdANbkX4ROPXCOdaSDSVkqILBLKjgYkCQm?=
 =?us-ascii?Q?te8260F4JI/WqFsZkpBd3lwFuWrYdXZ0el8TrP7MBgkMvFKgJBVs/RBK6Rm0?=
 =?us-ascii?Q?P3M4zRgxtZ7bB/PeUpU5Ydg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc629d5-989a-4b3a-23ee-08dafab2f5eb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 06:52:56.4534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4+y3iiFHmD/QQanQ76bmx4O5W46EdD+rXL+FNJiAf+zkOMgMxxhXrw6heDt3N+lhVu0p8iUggThJ7xu/jkssTrzhbyxHicCiDo9/PV3zU5xeUog9D0h7nHPBjTJDbz3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9638
X-Mailman-Approved-At: Mon, 23 Jan 2023 09:42:43 +0100
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Chunxu Li <chunxu.li@mediatek.com>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>, Thierry Reding <thierry.reding@gmail.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Dmitry Osipenko <digetx@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski?= =?ISO-8859-2?Q?=22?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has snd_soc_dai_set/get_dma_data() which is assuming
struct snd_pcm_substream to get Playback/Capture direction.

But, many drivers want to use it not through snd_pcm_substream.
This patch adds more low level snd_soc_dai_dma_data_set/get() for it,
and previous functions will be macro for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index ea704d92deaa..f27b33dd97bd 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -493,18 +493,21 @@ void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_
 		dai->capture_widget  = widget;
 }
 
-static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
-					     const struct snd_pcm_substream *ss)
+#define snd_soc_dai_dma_data_get_playback(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_dma_data_get_capture(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_CAPTURE)
+#define snd_soc_dai_get_dma_data(dai, ss)	snd_soc_dai_dma_data_get(dai, ss->stream)
+static inline void *snd_soc_dai_dma_data_get(const struct snd_soc_dai *dai, int stream)
 {
-	return (ss->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
 		dai->playback_dma_data : dai->capture_dma_data;
 }
 
-static inline void snd_soc_dai_set_dma_data(struct snd_soc_dai *dai,
-					    const struct snd_pcm_substream *ss,
-					    void *data)
+#define snd_soc_dai_dma_data_set_playback(dai, data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_PLAYBACK, data)
+#define snd_soc_dai_dma_data_set_capture(dai,  data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_CAPTURE,  data)
+#define snd_soc_dai_set_dma_data(dai, ss, data)		snd_soc_dai_dma_data_set(dai, ss->stream, data)
+static inline void snd_soc_dai_dma_data_set(struct snd_soc_dai *dai, int stream, void *data)
 {
-	if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
 		dai->playback_dma_data = data;
 	else
 		dai->capture_dma_data = data;
-- 
2.25.1

