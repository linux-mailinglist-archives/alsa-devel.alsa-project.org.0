Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1B79B377
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E8B9ECA;
	Tue, 12 Sep 2023 01:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E8B9ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476819;
	bh=EHwC66dwFM6mCrgdio4E3w4OAUdT3n9HIrnYYoAQoE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IFn+crekh1mtut7vNITkaJVksfiJ65EmUCWtasg6el9MHt9zf/up8KrlyTXucDA/O
	 PHFSeN53NTIp0OlZWCyPqQLYvYUZROOHBSTDthyUkorT/eNKnXJM4n31UT6BDfqc14
	 jXj3c+iLa89cLkDZtu4OyDNY5qcd+c41Ig2bLN7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 175B2F80716; Tue, 12 Sep 2023 01:52:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 542E7F8070E;
	Tue, 12 Sep 2023 01:52:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42BF4F80691; Tue, 12 Sep 2023 01:52:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A5C3F805F5
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A5C3F805F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aXfX1JQK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3Y6NXgmPJFEy7G3kT1N8Zq//ZgDzTIUpiaXwgDH5Q/OH8ZtLrDh5L55WDt8s4Ut9p/z9y+dB2++IDnJ26k2biBC/ijJFUM7CneLnr61Bop+FYKGHgcKOP/eQ7d7LpUTp85jnP7IyMdmZlEz39LTdXDz06BbXdsNrRDAGB0mcoP1m5atSbNnJc2DzW3dv8TboHRygHQVM46OmqDpWUhHMSUnEq6/7gdAIigyLETS9keJUTrkD0r9MnZNfjdQgVhMRWaRt8EvbM1ZOXi/4AucpSlkUes6uZAPOFgHGVodmKl9fY77SsXy85nxfTwE3wRuYSwvk5aIWuJQv0OsME8sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WduLbQvnPloeg5lZhn7QNhXfPURfu0qIavjiBsmLaWA=;
 b=lZ9U7kcpQD/Dd4bt+UA2b7xFfMKn8osG+79Ms4VuewrzF4HGW7oODL1gMFXy0ZYJe7fPFDD3doevbSxpmWbgIBhhDiT+RSDZ7lFY6W2BlsbPMzeTLel9XUL/yCA/Igj8han5Lb/d9fZlXfEP/BxlSj8odWZVbmB/tMtKFUolqhAhTRuh5uuTQ60ZBHpYzc4tEv6ZSyehmbqxo/n0Gp7O9pDbe5LtD4bZusiNGfo39Bm6Mf0C+vaLpq55/93bS8C4KDeL10tsEph/+/nEWCWNfJlhoX6JgD9Axqq/agLhOAI9xQt+fhOu8SlpTf/kfvXX/PgqbbF+FUOodG9wPSM96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WduLbQvnPloeg5lZhn7QNhXfPURfu0qIavjiBsmLaWA=;
 b=aXfX1JQKnCTQDYAwYggUIOUcy+5gWaoA0MQd559+nqLI0TGW4NJXRbH0uipt47DgAEBAS29IIpJH1q5r6hY9vOGDfDzbmhFvYjygYGfpjFqnltN6lyh5+kaaFIzqJzS4V8BAkxxvjai6UNREL+M783Jfcqr67DDBpZsaasSoChM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:51:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:51:14 +0000
Message-ID: <87sf7kp8um.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 42/54] ASoC: sof: intel: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:51:14 +0000
X-ClientProxiedBy: TY2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:404:f6::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f00f63-75a3-4be7-647b-08dbb321fbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wN259NoyRK2cxg4A8yYeKlAptxC6pBCBDRPFps9wRVLV9xdLGTAulZESALWVntmJcFFw3ExV5MtFMM6pRG1Rq6QvyEi2DiplwJ7Dwdh2JoqBfFQLyL9VWKGW4o+xSTKBMSBOxqenkhXKP00rOCZX9gDFRET49O4+dx+H6LN94W/+AUk0R77dKjuLm6RuiWILR0aIyz/QGvuZ98I22GUejwc5UDEWD8M+paNJPW0ngdQ0XmDII1Qe2q2tdfxkBerw4aGihfunLqMBd7uQG7p1msOHsXaiAEtoSz4YHSKjqYPk6JMG0YT3IBVeO++oDpQGBxxG+9RCSeyY8+BI21WUf4PWLm3+uUbz2q/sylMqbZgATc0zH6QXufPutjS5yBnX5EuvGxhRWpxWHaGkxdsRNy0kg6RaFjWNeAR3/mgkXHK/7UQokI/n5VTuDLJMcGaOz8KUTSdc6DS/SXpCnLRItqTOxn1IAABqex9C75BwjTzIJve7Mk6lgRYpOit8Vr+vBgMcEmu9xkMwGN/n7EMkVSZ/0G3+n94CHsXqeTqN9U56NUhrMRcT0R9IGjVSTHNfHC4S8jCu4R97MwtAvhpbUnbDCJ7FQfMg4FCE2Z9FMb7BbAcUz/HUdhHTEGhmUMMbF4Ijux74LEzfNRgPQ3+n/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(7416002)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6tran5hQ5VuxZgyuK0LQIBtSq8f99XFZUOTWDZvspux6afBQQfIC9ickqzRM?=
 =?us-ascii?Q?N6z8D0Stufx7SRAEdU0kK3HeJR/+WbLKgX2n6jRSBMMKZsbhVIzXUM5c/b8H?=
 =?us-ascii?Q?ChdRGSUBUgdtMJl93FTCFWFJLwIMvteQ6JlqkJ+idnRh+pKg7Ra77pczkrPP?=
 =?us-ascii?Q?T9gNO4Ezd6pq6Mz7Ffo8KrtaDCWCV4Bz2XyC/1GklJCmw60SGaF0p1/SsqNE?=
 =?us-ascii?Q?AbWpea0pB/G1LV4AxxrlzFVnje7a3ovpuvT4ev5bNiLrWGCDN7Cyfjzaoa5g?=
 =?us-ascii?Q?VolKhDrXMwTYThizYHF5CP9fqR1B3IDOC4OF3qiovZDvgR8lUqv4re/ZpqSR?=
 =?us-ascii?Q?TX10QJbNFnQ/S09rky0sPtOH/3qy9+d9GIXTkErxcOetPyblPrttZPy2KS9k?=
 =?us-ascii?Q?jWV7TiEUzOlwTLlgD1MM3l9B2lcI2gOTnDFaxKw26nVEHdEoomQIr9+6VY2u?=
 =?us-ascii?Q?YU9kyRynTzD0r9VB8lXxMDzWKRCP5A2TDf6vgnxyi0iTMwy1XclGiRlMPZS4?=
 =?us-ascii?Q?Sy3feybD1JMSUA5ohYZybPB87qc39xRiUWaT2hcETgqd0XrfrSFt8yUTMYxJ?=
 =?us-ascii?Q?BoA30dlx6XJmUvEttvqy/OHBt0eY+9fJIbUuMDqHVR+muzgbJl2N9ClmlGKa?=
 =?us-ascii?Q?e208M0SXm6NhylFP7ve4Bt+JbESjF5b6rEVeWvdKsRSPggxdvpLDCc3CHunN?=
 =?us-ascii?Q?hogSL+4k9cTZqpSuk30cZSDfhRE8kBpjIYm8JIdb9OsCLqVopQiRZ7cxrUzh?=
 =?us-ascii?Q?+1ftqIIHTfieNN+j8ej9UHZJ5bbZ+f/1ETcIUWRPx/264oXOsQFxU6nyIySL?=
 =?us-ascii?Q?UxNeu4+0akmwI/KUZoLx6geeYmqimavQfsST8BN/7JpeNn4W2byfk6jJQSo8?=
 =?us-ascii?Q?El47xJXqeO+O18k7MUQC8DjNF+iSsUrMUP08zq1YVpNPb4pjcvz9y8S3rHdH?=
 =?us-ascii?Q?m0Ojz1tbU/uXbwwoQveJztEYR3HNeKcCcrKWca1yafk2Oj1ptuCLbc+TBcX3?=
 =?us-ascii?Q?0Y/a7jx3WaxDJI/9ZBlKa1zN5Q4T0WfCrP20HVhHxpydXUbW12X9wdI5GQMc?=
 =?us-ascii?Q?WNX67tFrKTJDOm/jYn/s6LVSDmedqbqfi4a+P1afn6dEoXYtY7WOY+rJzpG2?=
 =?us-ascii?Q?aPNfCYzEP2JqQ7YTJj+mbpGW6KQcf4IA37BwWqtGidJbO0abtPd4SLHqZ48d?=
 =?us-ascii?Q?z+0ZJbktiWDtBC6yCnyoJy5YsggqwDYHlsh6j7afJO0hwqu8O51juXZJqaFA?=
 =?us-ascii?Q?XCm+Dmb7/CFN1NIT9ViNdrpUs9Dh1e5KwMUgItlDPBFtDoINGwQAxtODO0Er?=
 =?us-ascii?Q?t8yF1UwaQGpuppcGffgGZskTlC9r608cg+Xk266e/NxzqiXP+w+6L87jBi3U?=
 =?us-ascii?Q?ReGOBmTe+GoEHNVmHfxBj1DowP3pdjKBDRmZWnzCGTBbWJ3J3T7il9ZYxUy+?=
 =?us-ascii?Q?9J+/xC41IuK4P+9XOwm0De7Ujlp01j2+t8+JEljAOhmM9EXROgwR9PVuUrxY?=
 =?us-ascii?Q?gFAIy+iXk2fTwa9Ot0GaMSGgwraiRPXz9mQItyiDDghuwbbDngbP+1w/Imv7?=
 =?us-ascii?Q?/BR5FDOc5Fq4SOyJIJcsO3Wt8M0FLQkSvOyyPpvsHO4yAY7RPBNppxWfURrh?=
 =?us-ascii?Q?ADF6MlU5x7jaAI587ynmRcc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8f00f63-75a3-4be7-647b-08dbb321fbd3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:51:14.4482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ttTXwx1oGzNYo5c1kPm8bpA9eWE1uxwhOqDgAXoK70AAYEBGmfJfGXJyJbyvqCzx4W3PmSbWLLQ14rF5HRbyTG6l34lAthfVNl3BWQEiQ7CMFq+kNRxXLYWyoel6N4Hh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: AZH63W2O5CGZD5KRPTLAEWMJA5MH2V4S
X-Message-ID-Hash: AZH63W2O5CGZD5KRPTLAEWMJA5MH2V4S
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
Archived-At: <>
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
 sound/soc/sof/intel/hda-dai-ops.c | 22 +++++++++++-----------
 sound/soc/sof/intel/hda-dai.c     |  8 ++++----
 sound/soc/sof/intel/hda-pcm.c     |  4 ++--
 sound/soc/sof/intel/hda-stream.c  |  2 +-
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 494ced2b746e1..d8aabb313c1b0 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -43,7 +43,7 @@ static bool hda_check_fes(struct snd_soc_pcm_runtime *rtd,
 static struct hdac_ext_stream *
 hda_link_stream_assign(struct hdac_bus *bus, struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_intel_hda_stream *hda_stream;
 	const struct sof_intel_dsp_desc *chip;
 	struct snd_sof_dev *sdev;
@@ -145,12 +145,12 @@ static struct hdac_ext_stream *hda_assign_hext_stream(struct snd_sof_dev *sdev,
 						      struct snd_soc_dai *cpu_dai,
 						      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	struct hdac_ext_stream *hext_stream;
 
 	/* only allocate a stream_tag for the first DAI in the dailink */
-	dai = asoc_rtd_to_cpu(rtd, 0);
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
 	if (dai == cpu_dai)
 		hext_stream = hda_link_stream_assign(sof_to_bus(sdev), substream);
 	else
@@ -168,11 +168,11 @@ static void hda_release_hext_stream(struct snd_sof_dev *sdev, struct snd_soc_dai
 				    struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *hext_stream = hda_get_hext_stream(sdev, cpu_dai, substream);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 
 	/* only release a stream_tag for the first DAI in the dailink */
-	dai = asoc_rtd_to_cpu(rtd, 0);
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
 	if (dai == cpu_dai)
 		snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
@@ -193,8 +193,8 @@ static void hda_codec_dai_set_stream(struct snd_sof_dev *sdev,
 				     struct snd_pcm_substream *substream,
 				     struct hdac_stream *hstream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* set the hdac_stream in the codec dai */
 	snd_soc_dai_set_stream(codec_dai, hstream, substream->stream);
@@ -204,8 +204,8 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 					   struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int link_bps;
 	unsigned int format_val;
 
@@ -226,8 +226,8 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 static struct hdac_ext_link *hda_get_hlink(struct snd_sof_dev *sdev,
 					   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
 	return snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index f3cefd8660812..cdc523604a93d 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -316,7 +316,7 @@ static int __maybe_unused hda_dai_trigger(struct snd_pcm_substream *substream, i
 
 static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	return hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params, dai);
@@ -408,7 +408,7 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 static int non_hda_dai_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	return non_hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params, cpu_dai);
@@ -526,8 +526,8 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			struct snd_sof_dev *sdev;
 			struct snd_sof_dai *sdai;
 
-			rtd = asoc_substream_to_rtd(hext_stream->link_substream);
-			cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+			rtd = snd_soc_substream_to_rtd(hext_stream->link_substream);
+			cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 			w = snd_soc_dai_get_widget(cpu_dai, hdac_stream(hext_stream)->direction);
 			swidget = w->dobj.private;
 			sdev = widget_to_sdev(w);
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index f23c72cdff489..18f07364d2198 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -177,7 +177,7 @@ int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *scomp = sdev->component;
 	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
@@ -208,7 +208,7 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *scomp = sdev->component;
 	struct hdac_ext_stream *dsp_stream;
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 0b0087abcc50e..d0b70ac39ae87 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -38,7 +38,7 @@ static char *hda_hstream_dbg_get_stream_info_str(struct hdac_stream *hstream)
 	struct snd_soc_pcm_runtime *rtd;
 
 	if (hstream->substream)
-		rtd = asoc_substream_to_rtd(hstream->substream);
+		rtd = snd_soc_substream_to_rtd(hstream->substream);
 	else if (hstream->cstream)
 		rtd = hstream->cstream->private_data;
 	else
-- 
2.25.1

