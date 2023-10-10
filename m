Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500B7BF02E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 03:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C552BFC9;
	Tue, 10 Oct 2023 03:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C552BFC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696900982;
	bh=L5Jmjh9ai6L1JtXf0jW8HC+6Zrhjv1W3vIt4KhkgJqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=exmn+3p5npry6g/tW/15EJs2yTgUv2QAqedHYW7WlvgAbgcm83n4l0TODL/eC5256
	 3hpoWBL0RfdCw5gCnY2bhRi4rGDgFMjUdvRFrxYxAT/WmZ6lEKEqdzo+O2xfWNNtXz
	 ofhyAROSqKNv2wrU9IS7dbLIKyxlQDFBLFuT2O+U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4839CF80570; Tue, 10 Oct 2023 03:21:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97521F80568;
	Tue, 10 Oct 2023 03:21:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D84CEF80570; Tue, 10 Oct 2023 03:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6434F8055A
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 03:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6434F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=f0fBBucj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5VSdQ6NYjd4rS4MccYYxTqYGrpnOqql+wBkPg6g8L+CSi0OzqtjfeaisVmBW9UeyyORUwsM4SGYLHAYqt0pYyrdV/rj3gJ62qMYgnJMdIWUp62UXre5DwvTukL92lfY9th3SD3TcWFhcR9VHKdmLm04fNwMtTYAekETW+cdhirmq+EGuIbB1wHLuvkybOalZhQi1V/EdqtfyOK08OKbPSVaLDRBmYTY/AVIGoR1GAzi4HaNxjepywYh4K9I6uQaQ+T5eU/FvfbHprujfLpZ1T7WaItQxLL7+QQpc4ZEQvxMIhkiWnpyQwRk12AV49DeS7yujpFEA5AyrHQRCbyWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvi/Xqlub49eq/S1qDEly4Ntmkr5dYeWqCEMTmNYWXI=;
 b=COHZTbCTf8V5Kd3W+4xBi8GWbNNZmI2HpPLKemR7Pig2q56fbI8RRhbuSgTgp8W1hmNfXC1yECUMWFqIm4H+LSzy7nVSbJlvapq3lteVDA8GLm6Dlj7T1thQYI5UsEVnSnlyPWjhaiYqpfIl920WeAKW8cVGSeTGs9UMcfkMC7btH7QslcltPb3Z/zgO9c6youRSr/VJw8GsH1MpscyEUMCk9YCUCsnQL5a7tFl79N9eRCTniHTnHUexarr72MN41fMQbKcFtmbU3NjI0nt5IPE1uK7G2xs412A62JgtksmfZRr3Oa8P3yWW16HnIJfqh67dKPfAjWH6nbDN2gB3yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvi/Xqlub49eq/S1qDEly4Ntmkr5dYeWqCEMTmNYWXI=;
 b=f0fBBucjaFQuqdkNi2puUH3bbLKLCozWUAUbtxSQpzF1G1psrF5XfQStFmlmaRGFT3BM6en+v9rsqpkGyKgNyEJ7SvFW1TJsxxFhHchk1E2xtrj3j9rTQhIEt96s1lO/9+AJdpS3pMFgQiVEdb2L+OS12fw8uLq3Jy9sYEKOm1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9647.jpnprd01.prod.outlook.com (2603:1096:400:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 01:21:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 01:21:17 +0000
Message-ID: <87a5sr8e7n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] ASoC: makes CPU/Codec channel connection map more generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Oct 2023 01:21:17 +0000
X-ClientProxiedBy: TYCP286CA0245.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e017db-c956-4015-486a-08dbc92f33dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DjqFoITDS4rW9Myn4EfBUw85tADTmQIDnDbOl/6kfvIe5u6kfRZMfDqCJURbOiK/WkeksfEovQ2HpsrLuliLn8gS5n8eQqSyGrXpaVAjs9R3tWkI1FDluY6bgtTbqEQsxbSHzBiTFMqrufz3nPbS57uzE8Ktdu1ifdMPBPY4fS/zPZddOyyiHHRfqWaTc31PLHq2Kj8nIaTHNUI4vHV6XN7nsM8MOnxIUsTcs3EmCzxFaNg2Wku2hiCk6fxurGMLxAjrUOxwaLjBej2OS2fXpkT4+SerUW6339rcWnhCQEYsv7pkp8wqS+wUnQgZAwky8RnIjZs2HAKfEQ2c8Bw79DHe4c7AdCfaS7vOTudY2/T7XscRQgUy8/hVJpKnTpPMYXjbQ2iTG6qYGwIX2g6fe+nDmy99NUafeH5n2qasvGJXJwf+p8VElxXTYH94qVMuOXdIWv5GLOa+7rELDpYNa4Kf2zqc8Ey9Y9sUWNFWfpYj2E7trwsFZVdPoyNC3jUWR8RyJrWZ5KPaoHkRS6YwVy+WPx00LEjy1a8L5XwTx01wLuJx3hegmk6Bx0Xtnlj6gnxEo9vYUofxNJkO0w3LniK5YO8a0T0eMhof2MhLqlnx3qSRkWnwBIPrHR27hvIB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(38350700002)(36756003)(6512007)(26005)(2616005)(5660300002)(8936002)(8676002)(4326008)(41300700001)(316002)(110136005)(66946007)(66476007)(66556008)(6486002)(52116002)(6506007)(966005)(2906002)(478600001)(30864003)(86362001)(83380400001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u57ZDkevhKql1PocW/zvF5C9puXq+8yKMMMxV46K+h4k2dNNAQc3uS+yUUxi?=
 =?us-ascii?Q?xdal77621VBG2/kNpIRcMPPPCp+MAXj5b/zlU0IDQocLNqmyaWIKyNnj07wX?=
 =?us-ascii?Q?Z8CQrhGvCTP3+PqYUhJbzDcf4sSFim5i2q1KJyCXPB0KfsyF/A8dOGl04ctq?=
 =?us-ascii?Q?Vady8iRE+7a6EeUDQyfTi8a27O6us3FTZtD5HXqiirPdaMVyebEF6uul4Trf?=
 =?us-ascii?Q?nYlqSOGudAu5udpTepiF+PpXMrlBpneOruV3V4Sk5SDrER9LtiYAjFP4r8yn?=
 =?us-ascii?Q?SCQX5XW7wFXjVjiK/Exk2rVa0NoCa0ShM5TXaAf4wboJjha7jgnWHHL00yAa?=
 =?us-ascii?Q?2u0VGNSX2nGu7/3LbZlX3ZohJ/394ldo4pdEGHMRvQ5v7NhEAgtHVyIsnBAX?=
 =?us-ascii?Q?hFgE8/fUMW39BCDDv2aXkU3AbPBNJ4WWVaZfg6/eIgoD3bxSoeVu3TZKskvg?=
 =?us-ascii?Q?TxASAWO57qpIWAv3PCjxfbyXDNOv7Lq3TfGLzqgNZNSn42jsoQBXE8gaZcfA?=
 =?us-ascii?Q?ZFuT0Qi+F1GKOUUwf5z4WE0yTMcPmU9i7TFSg7DVLyfwxS0Amv0RYQF5bPHE?=
 =?us-ascii?Q?4ahHglzP3z0wFYMdgW4yq/h1qhINOxZx6wsua4+gZAaf6Nduw87IQD44+IdU?=
 =?us-ascii?Q?2DLUYfntBSyYODg4IbP1gJ1eU9+LWA9DFFWcG1/muYy5LW6Vq5d/gare2e/C?=
 =?us-ascii?Q?rawJNiNcOGcBgIUfvQklRRgO6+pp8GR0Y7ZcUR8wJI+rRi6x/qSuq+D+zNMV?=
 =?us-ascii?Q?tSdKxg1ULLdhGr93O76TMW95gnwvBG6DmuHjT93NqMYXsEuOc7sNm6lON9b+?=
 =?us-ascii?Q?PQcizMb/RPnODAfgGnuKc9KnynEncxLB9PYZZWU5GV01LXht/ZpJz5Zv/UC7?=
 =?us-ascii?Q?S33vAEjV7c+Yne7JSxfV4qN+Z/guB/sxQERJCOsjCNy9RjoEs0/9uWQYF5rI?=
 =?us-ascii?Q?PbnesRbe/ggPgC1nMGvH6+U50/CxpQlkQP6khs08XVQnTu+MaNGgpzWgrqxf?=
 =?us-ascii?Q?IcJcuZyrMVzeCH4ihQDRrRHnivEyPB6rIahS22mmmvFDAsYZp+QWHKsq12iN?=
 =?us-ascii?Q?uLrxXBHRjXiwpmnuonhdhCJK0agBrvsWN2k8lhsBXRcCZpC6KbL23WMsizJx?=
 =?us-ascii?Q?taR4feRIkP0LAWpWPx14UulPtxb2dp2Otdhvb24uIMy7ECnY25Q6/HxxTLGj?=
 =?us-ascii?Q?qr/omUlTB2GLB/JZvKcdlh7M+ezFYt5qVEgH55+B1YXFsy++oi6/7vwsZRoB?=
 =?us-ascii?Q?iEF8knl7OqNy53dB13aAStAGwMNQd1ppVzGTsIXPxj8ktHJu19v4HRUmSns3?=
 =?us-ascii?Q?UK+10RYH1jaQ3aOb/c6OejR4jJt5E6QZjZkam0t35E2cC7U7/LiRhDnzRsxM?=
 =?us-ascii?Q?VDrzyzQ6vSlQORNbZn9ObyaDFNLOXWdswhmrY1ItYL0glvWd50QANEpN+awg?=
 =?us-ascii?Q?YsFN3YjclgylziWtozYJqGf03mq9+3XECbIcxeSnVk7WgWABpDoBV3xY6iY+?=
 =?us-ascii?Q?xLTzDwIR/xl9RSXTOhHjyOKNc6IDPUkWxz71fWgbsXWtmijl89OqvWXc+bNr?=
 =?us-ascii?Q?NkkyL77iZSqBFS5XkVFa6UlD0hm4dwsFrjsfzO1GxvnjPXreNvre9URu/fMt?=
 =?us-ascii?Q?ZkDyWnqn37eYIzG6OcJIVWQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 50e017db-c956-4015-486a-08dbc92f33dc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 01:21:17.5966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QCBc46Y0mn9vTz+8tl6U8x1YU0puCzaaKmMwarO1YTlUGQEJoAC5XRoq+Cn9VT+yGW3NIQa06xz1lBsfzl6rqxoPtgAKaDnpdrPPbXSMVHNsgfRHRug+CryItPjLEuNw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9647
Message-ID-Hash: 6J7VP7M373TPXNRSPBOUY36XZX3TLQPX
X-Message-ID-Hash: 6J7VP7M373TPXNRSPBOUY36XZX3TLQPX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6J7VP7M373TPXNRSPBOUY36XZX3TLQPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
but it is used for CPU < Codec case only. We want to use it for any case.

By this patch, not only N:M connection, but all existing connection
(1:1, 1:N, N:N) will use same connection mapping.
Because it will use default mapping, no conversion patch is needed
to exising CPU/Codec drivers.

More over, CPU:Codec = M:N (M > N) also supported in the same time.

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h              | 48 ++++++++++++++++--
 sound/soc/intel/boards/sof_sdw.c | 14 +++---
 sound/soc/soc-core.c             | 83 ++++++++++++++++++++++++++++++++
 sound/soc/soc-dapm.c             | 47 +++++++-----------
 sound/soc/soc-pcm.c              | 73 +++++++++++++++-------------
 5 files changed, 191 insertions(+), 74 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 63b57f58cc569..13f1158df2b1e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -655,8 +655,50 @@ struct snd_soc_dai_link_component {
 	struct of_phandle_args *dai_args;
 };
 
-struct snd_soc_dai_link_codec_ch_map {
-	unsigned int connected_cpu_id;
+/*
+ * [dai_link->ch_maps Image sample]
+ *
+ * CPU0 <---> Codec0
+ *
+ *	.ch_maps is from CPU
+ *
+ *	.num_cpus   = 1;
+ *	.num_codecs = 1;
+ *	.connected_node = [0];
+ *
+ * CPU0 <---> Codec_x
+ * CPU1 <---> Codec_y
+ * CPU2 <---> Codec_z
+ *
+ *	.ch_maps is from CPU
+ *
+ *	.num_cpus   = 3;
+ *	.num_codecs = 3;
+ *	.connected_node = [x, y, z];
+ *
+ * CPU0 <---> Codec_x
+ * CPU1 <-+-> Codec_y
+ * CPU2 <-/
+ *
+ *	.ch_maps is from CPU
+ *
+ *	.num_cpus   = 3;
+ *	.num_codecs = 2;
+ *	.connected_node = [x, y, y];
+ *
+ *
+ * CPU_x <---> Codec0
+ * CPU_y <-+-> Codec1
+ *	   \-> Codec2
+ *
+ *	.ch_maps is from Codec
+ *
+ *	.num_cpus   = 2;
+ *	.num_codecs = 3;
+ *	.connected_node = [x, y, y];
+ */
+struct snd_soc_dai_link_ch_map {
+	unsigned int connected_node;
 	unsigned int ch_mask;
 };
 
@@ -688,7 +730,7 @@ struct snd_soc_dai_link {
 	struct snd_soc_dai_link_component *codecs;
 	unsigned int num_codecs;
 
-	struct snd_soc_dai_link_codec_ch_map *codec_ch_maps;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 226a74a4c340f..7927b729866d9 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -579,7 +579,7 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	int i;
 	int j;
 
-	if (!rtd->dai_link->codec_ch_maps)
+	if (!rtd->dai_link->ch_maps)
 		return 0;
 
 	/* Identical data will be sent to all codecs in playback */
@@ -607,9 +607,9 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	 */
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id != i)
+			if (rtd->dai_link->ch_maps[j].connected_node != i)
 				continue;
-			rtd->dai_link->codec_ch_maps[j].ch_mask = ch_mask << (j * step);
+			rtd->dai_link->ch_maps[j].ch_mask = ch_mask << (j * step);
 		}
 	}
 	return 0;
@@ -1350,7 +1350,7 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
-static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps,
+static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 			    int codec_num, int cpu_num)
 {
 	int step;
@@ -1358,7 +1358,7 @@ static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_m
 
 	step = codec_num / cpu_num;
 	for (i = 0; i < codec_num; i++)
-		sdw_codec_ch_maps[i].connected_cpu_id = i / step;
+		sdw_codec_ch_maps[i].connected_node = i / step;
 }
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
@@ -1453,7 +1453,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		*ignore_pch_dmic = true;
 
 	for_each_pcm_streams(stream) {
-		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
+		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1530,7 +1530,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		dai_links[*link_index].nonatomic = true;
 
 		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
-		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
+		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c305e94762c39..a4bb4c29331cf 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1824,6 +1824,84 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
 EXPORT_SYMBOL_GPL(snd_soc_set_dmi_name);
 #endif /* CONFIG_DMI */
 
+#define MAX_DEFAULT_CONNECTION_MAP_SIZE 7
+static struct snd_soc_dai_link_ch_map default_connction_map1[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
+	{ .connected_node = 0 },
+	{ .connected_node = 1 },
+	{ .connected_node = 2 },
+	{ .connected_node = 3 },
+	{ .connected_node = 4 },
+	{ .connected_node = 5 },
+	{ .connected_node = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_connction_map2[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+};
+
+static int snd_soc_compensate_connection_map(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i, j, n, max;
+
+	/*
+	 * dai_link->ch_maps indicates how CPU/Codec are connected.
+	 * It will be a map seen from a larger number of DAI.
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_card_prelinks(card, i, dai_link) {
+
+		/* it should have ch_maps if connection was N:M */
+		if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
+		    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
+			dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
+				dai_link->name);
+			return -EINVAL;
+		}
+
+		/* do nothing if it has own maps */
+		if (dai_link->ch_maps)
+			goto sanity_check;
+
+		/* check default map size */
+		if (dai_link->num_cpus   > MAX_DEFAULT_CONNECTION_MAP_SIZE ||
+		    dai_link->num_codecs > MAX_DEFAULT_CONNECTION_MAP_SIZE) {
+			dev_err(card->dev, "soc-core.c needs update default_connction_maps");
+			return -EINVAL;
+		}
+
+		/* Compensate missing map for ... */
+		if (dai_link->num_cpus == dai_link->num_codecs)
+			dai_link->ch_maps = default_connction_map1; /* for 1:1 or N:N */
+		else
+			dai_link->ch_maps = default_connction_map2; /* for 1:N or N:1 */
+
+sanity_check:
+		if (dai_link->num_cpus >= dai_link->num_codecs) {
+			n   = dai_link->num_cpus;
+			max = dai_link->num_codecs;
+		} else {
+			n   = dai_link->num_codecs;
+			max = dai_link->num_cpus;
+		}
+
+		for (j = 0; j < n; j++)
+			if (dai_link->ch_maps[j].connected_node >= max) {
+				dev_err(card->dev, "strange connected_node (%d) was added to ch_maps",
+					dai_link->ch_maps[j].connected_node);
+				return -EINVAL;
+			}
+	}
+
+	return 0;
+}
+
 static void soc_check_tplg_fes(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
@@ -2030,6 +2108,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	snd_soc_dapm_init(&card->dapm, card, NULL);
 
+	/* for keeping compatibility */
+	ret = snd_soc_compensate_connection_map(card);
+	if (ret < 0)
+		goto probe_end;
+
 	/* check whether any platform is ignore machine FE and using topology */
 	soc_check_tplg_fes(card);
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2512aadf95f71..3c7c2b16bd64a 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4426,6 +4426,7 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
@@ -4438,39 +4439,25 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->dynamic)
 			continue;
 
-		if (rtd->dai_link->num_cpus == 1) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, 0));
-		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, i));
-		} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-			int cpu_id;
-
-			if (!rtd->dai_link->codec_ch_maps) {
-				dev_err(card->dev, "%s: no codec channel mapping table provided\n",
-					__func__);
-				continue;
-			}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		/* .ch_map is from CPU */
+		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				codec_dai = snd_soc_rtd_to_codec(rtd, rtd->dai_link->ch_maps[i].connected_node);
 
+				dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
+			}
+		}
+		/* .ch_map is from Codec */
+		else {
 			for_each_rtd_codec_dais(rtd, i, codec_dai) {
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				if (cpu_id >= rtd->dai_link->num_cpus) {
-					dev_err(card->dev,
-						"%s: dai_link %s cpu_id %d too large, num_cpus is %d\n",
-						__func__, rtd->dai_link->name, cpu_id,
-						rtd->dai_link->num_cpus);
-					continue;
-				}
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, cpu_id));
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, rtd->dai_link->ch_maps[i].connected_node);
+
+				dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
 			}
-		} else {
-			dev_err(card->dev,
-				"%s: codec number %d < cpu number %d is not supported\n",
-				__func__, rtd->dai_link->num_codecs, rtd->dai_link->num_cpus);
 		}
 	}
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8c168dc553f65..0bfff2ea111d7 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1043,7 +1043,6 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		unsigned int ch_mask = 0;
-		int j;
 
 		/*
 		 * Skip CPUs which don't support the current stream
@@ -1055,22 +1054,28 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		/* copy params for each cpu */
 		tmp_params = *params;
 
-		if (!rtd->dai_link->codec_ch_maps)
-			goto hw_params;
 		/*
 		 * construct cpu channel mask by combining ch_mask of each
 		 * codec which maps to the cpu.
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
 		 */
-		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
-				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
+		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
+			/* .ch_map is from CPU */
+			ch_mask = rtd->dai_link->ch_maps[i].ch_mask;
+		} else {
+			int j;
+
+			/* .ch_map is from Codec */
+			for_each_rtd_codec_dais(rtd, j, codec_dai)
+				if (rtd->dai_link->ch_maps[j].connected_node == i)
+					ch_mask |= rtd->dai_link->ch_maps[j].ch_mask;
 		}
 
 		/* fixup cpu channel number */
 		if (ch_mask)
 			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
-hw_params:
 		ret = snd_soc_dai_hw_params(cpu_dai, substream, &tmp_params);
 		if (ret < 0)
 			goto out;
@@ -2824,36 +2829,36 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus == 1) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
-			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-				int cpu_id;
-
-				if (!rtd->dai_link->codec_ch_maps) {
-					dev_err(rtd->card->dev, "%s: no codec channel mapping table provided\n",
-						__func__);
-					return -EINVAL;
-				}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		/* .ch_map is from CPU */
+		if (dai_link->num_cpus >= dai_link->num_codecs) {
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				codec_dai = snd_soc_rtd_to_codec(rtd, dai_link->ch_maps[i].connected_node);
 
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
-			} else {
-				dev_err(rtd->card->dev,
-					"%s codec number %d < cpu number %d is not supported\n",
-					__func__, rtd->dai_link->num_codecs,
-					rtd->dai_link->num_cpus);
-				return -EINVAL;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+					has_playback = 1;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+					has_capture = 1;
 			}
+		}
+		/* .ch_map is from Codec */
+		else {
+			for_each_rtd_codec_dais(rtd, i, codec_dai) {
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, dai_link->ch_maps[i].connected_node);
+
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+					has_playback = 1;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+					has_capture = 1;
 
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
+			}
 		}
 	}
 
-- 
2.25.1

