Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9244066DD8A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:27:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE5E9674B;
	Tue, 17 Jan 2023 13:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE5E9674B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673958449;
	bh=qG2JN10RLEnwggy6bj1Hh3Cv/1h2LjpfGQha5cO/EYc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N7qeObyM7Fvwoh9sxOI0PtDvood8Zb5xa+LPqg6XjctySIkl/E+oxMGn7TC50mlql
	 vEj02BoY9W781zohHukkLSHS7mruC/xHyBpU1Pbv/oPnUPP4mRnc4nkC3Cg21Fp0Hw
	 s7kC0xBOtJN82Tb+AHU5G9iI5s86RjFxTSyTWmQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D457EF8022D;
	Tue, 17 Jan 2023 13:26:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46958F8047B; Tue, 17 Jan 2023 13:26:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23012F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:26:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23012F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=CaM1EM01
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBvTnQ4+PsR3ypRbBL8aemhp5w5fm403xwDudOWW/ulMA58QF4O/c+6P8xjWdPatP1fS3M0XMRetdxlPb23LLS5NuJnoptog6Vsh5RJYji2oZGf5eB3EUHQIoJgRGncxw8O8ejXZJxmAV5Pv2gKIxJ0WbQB7kzwEeC0fWC8hwc4UltBtAZ+YX80+wFULP/NWzYtOggDKHiPqka3YB9sBj7wKhQhuwGeKwx3rOwkFuln8cMQYHFHOBSDdfi5Ko27T9F/vYG+pTamzUvelKODptEmyPzGKVWcx2ZE2xWUoVFKcuuwAtXiMCEB936cnyba3e57qwkuFwJlRJoxbwHXRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIdISJzJISIW9gtCXwZ1cLhWL7FhAW7+e+xBRH/6suo=;
 b=HchXhmCK3juKnGzjkzLul2FeljnLWp3CCC+TBW1qLg+dYYPYTlS8lrfpav96tHj40s4gpCfjJSKYLtftK2dLod7MxbhvNaaF8KCcxV/wpzX3/cE/LEJKxT0fajgGsZkToI5EJqVK9sAmuNo+F2rTZJXVY8EhUqRn28Q0l0aTHHd5hsujBOCSlJdLTYzrFzxJNHRxNnYjEy2Z/wsoAExaYqIErM+yfJnrIL04Zthc6l+5FDG6pIwbz3OabBlK7h/+PU5RAxt0/eDvj3PHMsZ9q/VV0HB2R7G0hco4y0r1/IY3iarZo7bNoTsCpnD1RX95da0g3dGG4hzBAab6zzRESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIdISJzJISIW9gtCXwZ1cLhWL7FhAW7+e+xBRH/6suo=;
 b=CaM1EM01XDECaa1iN5lxDP4obiEq3uZRQ+yHMF+e9Lqwu8stk824raBvi6HGXakNin9IFiT9rTeO3G1X1wcuB4VtnI+RnoiiXaeLOOb3yhN/bHOdFREITvMWG+oZOuXhIcE/xc3MqyQJKEph2Bbc3y5mh5zS8qLT+V5tzgsgV+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9595.eurprd04.prod.outlook.com (2603:10a6:102:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:25:56 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:25:56 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 1/4 v2] ASoC: SOF: Prepare ipc_msg_data to be used with
 compress API
Date: Tue, 17 Jan 2023 14:25:30 +0200
Message-Id: <20230117122533.201708-2-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117122533.201708-1-daniel.baluta@oss.nxp.com>
References: <20230117122533.201708-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0133.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::30) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PAXPR04MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ab3806-f304-44de-aa0f-08daf885fbae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7cdRGirdoCuE2sr6DL1mSh+Hat8/7Ji3HqaZ8jo7wHPhyYwBxW8+djDxAmjKyP1Vvjl8qNmiXQUCqwiWNKX31wznt/lE/R+cSwdhpU3s6GzoVN7YFml5mK5p/CvlygqA+T5SsdBNFQR1zSGRUE9YIKulV9SUxJEwU4oVocQwXNU52eTyJ9Ikn3+DL0l5PTwWxmGoWGe/AEIErZCasT4noN10L8gCPOzrX4CWIC5WnO054S2uAtjamqAehSgZ3vb1qojDViJcBxYL645lSw8YE0cjqTZKPOyHZ3leGT1jqApEb3RSiTi+GzF2FNzfMMvJu+mU7iTyM8xmUKLnren4tMTUf8HMLYfA2DQgFjzXScWbeX/xLry96CmbEabWKGiqalpe0+uFZL9PugCxbOSFQie0eCJxermXnsu2qOAYZByJYnH6v/C21N8w52JlLMBnLt/PKsz6JHVlNrH1DWCEhTcXnPt4kCwgyXNNTRxba7mzM/JG3KmHw13e9UNPEb78mwUhZBGJc53rHUCnqotchVpnbnAEMvLaWpx1YMUUXnL5QlG60a90jK6G825k7ZlXQeJ7kUObNEoM2Zvkp/pqUX0EQXgU29zm8uUdD7tvg5oPzyIC/bI4FCaap+YNJrnQvYD7V6oCC35pdanIimWu/5h7e0oHz1ckSUiDm7mjKCxrctCunSM+6L/w3phCjP9KBiQhCtHms5Un3ri4vc1N4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(66476007)(66946007)(66556008)(41300700001)(2616005)(8676002)(6512007)(26005)(6916009)(186003)(4326008)(86362001)(5660300002)(83380400001)(38350700002)(8936002)(6666004)(478600001)(38100700002)(52116002)(316002)(1076003)(6506007)(2906002)(7416002)(6486002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3A3P1EMdgfuPCTDUb40nsmvOL8vc5NI7eJMvlWVlsLgJtiGGdwXfS61GdBGi?=
 =?us-ascii?Q?KDIpE7JpGOLUPMVGRN1mF2Lcmq1c+iIbEUvEsSwkZBR2ohu3CEDEH52LaBR1?=
 =?us-ascii?Q?bdUFu+7n3GjnTpch1+9H87kPmt3g9B9VUb1opfGQ5yXUEm1iOBBbol8kxwyl?=
 =?us-ascii?Q?hNLnFRK+2YCTtLSr3Sf1dWuD4JtAVtzvD4ygxNEz4glP0Yki9iK3HAII93EV?=
 =?us-ascii?Q?ogpk0vHNoCeuV3OoWhfKO5C1dFG0gIbNGOGAQnq/Vc22mSSR5/yy7a9IymZ8?=
 =?us-ascii?Q?S/RAs5aXTr785cBRIoVNy+dsNu65pYK5uPL+D+XcM46+YlvYXQvIwURjxW5I?=
 =?us-ascii?Q?qCC0PYs50mQ+LvcQ94qfKfWd1cw8xtwaa6jZzfhk8qM3/hPa7iQcTPKFOdi1?=
 =?us-ascii?Q?MpWyvE4kjl+4obKVpz8Zlo6mum0pheLjkyedAtyBzTp49fr6DaUihrVdgj+M?=
 =?us-ascii?Q?e6qvWsF/kKQSqwqbmlo6XCQ3cwCEiPcLcDtItTOxBUc1vZGPnrs1kssUgH6X?=
 =?us-ascii?Q?Afu5p802PXYzQ9lJ1vkSyTb5Sga//xvTl+Tc24wKgZx1iCbhGw0mW5j+C4Y4?=
 =?us-ascii?Q?mF8AvdvJko/WT2uElUmF93d4mg3Vu9+A7yPtvnBGVxjOd79aewZlOnRZi55i?=
 =?us-ascii?Q?+mkbtjnfklHXD98hRo8CbXjBXsnJ/laADqZcJD31PuQkkT9jLCHZ9HKDyViN?=
 =?us-ascii?Q?vSdtLCCerEyXEloUVw0e3YQXwKBWgr8R64M4ICffNsblRZ44ryFIl/zte7TQ?=
 =?us-ascii?Q?lHnXLzXy5xn3f+aktysPqtCabXcvgjRGFaUx9fFPtvRuyzs0iJ731c6oH1jb?=
 =?us-ascii?Q?a4wqeaOJvJGWeM0mpCFC+ZMxavCvYcH8eQQ3T0g8vx++gb+o4WgzapSo3v/T?=
 =?us-ascii?Q?bCopK78Uh7kULL+rR262LVP8cIpgPH86gPyvB4TTx9fWU4nuJTq2J0Ai57qo?=
 =?us-ascii?Q?8cOgUxuBQvhWrAJd7FblkwC3LJS5G1Ga9B/yVc8inGwdKu7kuMKVUT/tAaZl?=
 =?us-ascii?Q?JEjaO20/2qbuXb6mVVGvSqVhjFkBNkXj72ye8qx8+wzn0Rgovfc6BaR2kiOG?=
 =?us-ascii?Q?N8NVIu+j59NQ9rj3n6MuWZ8J4RsKM3DfZhTFQu2MM/zjF2mcMr7RjlFI6V5w?=
 =?us-ascii?Q?KPWbEihgwDgkXoRNYo3MHkale/98TaYsqboVuURZfDWezInSRpt4VqRYi7zO?=
 =?us-ascii?Q?Ye2BhkTA9N8BIRcJib80vKf0tVg6DaJ67acX6ojh1JRWnO57GuOAFbJ2XpRJ?=
 =?us-ascii?Q?uwf1paU5avQng5yLimQwduQoXnwNj99HLm1DuoS68x0YWhW3qFOKP6a+lxVh?=
 =?us-ascii?Q?QNj6FY0QK4rlOIoA3bj9xIJBCehO0Ni2OBMBRpICkRoY2NaunE/XxkPUsuwJ?=
 =?us-ascii?Q?ZHM+XJy+gc0+2x/ewQ8WTL1IJpInuDgHs+AEOPTUUhHthoJEby2I4aqB/vL/?=
 =?us-ascii?Q?jz/GdEbnJAdpnJQC76G0IcihBAYgtBAwzzT++e6UKcDlQ3vP54upB220xfDv?=
 =?us-ascii?Q?FnG9IA7aP038JRp0yY0ltSo5ZLdIFE9ab9xG8fXh+VjES/bZ4GXXrbHuQd91?=
 =?us-ascii?Q?Z9y/mpA6wvkqaJ1bP1eRA6ZJwXttvutdrwVX+65b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ab3806-f304-44de-aa0f-08daf885fbae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:25:56.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +L6DRGiIkHvUA4Jeh6WHYdB/V+hAKSrtvO5hKWPQe8gaL7cXYH1Qf9tH7j7JBhLRKrB4+IOf+VkF7BMXyKzTuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9595
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
Cc: kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org,
 Allen-KH.Cheng@mediatek.com, AjitKumar.Pandey@amd.com, lgirdwood@gmail.come,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-imx@nxp.com, yc.hung@mediatek.com, Vsujithkumar.Reddy@amd.com,
 peter.ujfalusi@linux.intel.com, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

Make second parameter of ipc_msg_data generic
in order to be able to support compressed streams.

This patch doesn't hold any functional change.

With this case we can use ipc_msg_data, to retrieve information from
DSP for both PCM/Compress API.

Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/acp-ipc.c            | 5 +++--
 sound/soc/sof/amd/acp.h                | 3 ++-
 sound/soc/sof/intel/hda-ipc.c          | 5 +++--
 sound/soc/sof/intel/hda.h              | 2 +-
 sound/soc/sof/ipc3.c                   | 4 ++--
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 sound/soc/sof/ops.h                    | 4 ++--
 sound/soc/sof/sof-priv.h               | 6 ++++--
 sound/soc/sof/stream-ipc.c             | 6 ++++--
 10 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index 5a02753c4610..1f614eff2a68 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -200,14 +200,15 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 }
 EXPORT_SYMBOL_NS(acp_sof_ipc_irq_thread, SND_SOC_SOF_AMD_COMMON);
 
-int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps,
 			 void *p, size_t sz)
 {
 	unsigned int offset = sdev->dsp_box.offset;
 
-	if (!substream || !sdev->stream_box.size) {
+	if (!sps || !sdev->stream_box.size) {
 		acp_mailbox_read(sdev, offset, p, sz);
 	} else {
+		struct snd_pcm_substream *substream = sps->substream;
 		struct acp_dsp_stream *stream = substream->runtime->private_data;
 
 		if (!stream)
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 4314094a97fd..d8cc2a92f1c0 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -12,6 +12,7 @@
 #define __SOF_AMD_ACP_H
 
 #include "../sof-priv.h"
+#include "../sof-audio.h"
 
 #define ACP_MAX_STREAM	8
 
@@ -211,7 +212,7 @@ int acp_dsp_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_ty
 
 /* IPC callbacks */
 irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context);
-int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps,
 			 void *p, size_t sz);
 int acp_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_pcm_substream *substream,
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index a7c454e03952..5705279d0707 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -361,12 +361,13 @@ int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 }
 
 int hda_ipc_msg_data(struct snd_sof_dev *sdev,
-		     struct snd_pcm_substream *substream,
+		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz)
 {
-	if (!substream || !sdev->stream_box.size) {
+	if (!sps || !sdev->stream_box.size) {
 		sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
 	} else {
+		struct snd_pcm_substream *substream = sps->substream;
 		struct hdac_stream *hstream = substream->runtime->private_data;
 		struct sof_intel_hda_stream *hda_stream;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index caccaf8fba9c..e6f1ff591332 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -656,7 +656,7 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 			       int enable, u32 size);
 
 int hda_ipc_msg_data(struct snd_sof_dev *sdev,
-		     struct snd_pcm_substream *substream,
+		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz);
 int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_pcm_substream *substream,
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 1fef4dcc0936..8e936353c1c0 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -847,7 +847,7 @@ static void ipc3_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 	}
 
 	stream = &spcm->stream[direction];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream, &posn, sizeof(posn));
 	if (ret < 0) {
 		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
 		return;
@@ -882,7 +882,7 @@ static void ipc3_xrun(struct snd_sof_dev *sdev, u32 msg_id)
 	}
 
 	stream = &spcm->stream[direction];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream, &posn, sizeof(posn));
 	if (ret < 0) {
 		dev_warn(sdev->dev, "failed to read overrun position: %d\n", ret);
 		return;
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index dbea604ebc04..597cb4476acb 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -494,7 +494,7 @@ static snd_pcm_uframes_t mt8186_pcm_pointer(struct snd_sof_dev *sdev,
 	}
 
 	stream = &spcm->stream[substream->stream];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream, &posn, sizeof(posn));
 	if (ret < 0) {
 		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
 		return 0;
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 5b04fec9c9c9..42bae574c87a 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -520,7 +520,7 @@ static snd_pcm_uframes_t mt8195_pcm_pointer(struct snd_sof_dev *sdev,
 	}
 
 	stream = &spcm->stream[substream->stream];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream, &posn, sizeof(posn));
 	if (ret < 0) {
 		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
 		return 0;
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index c52752250565..db92cd338467 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -472,10 +472,10 @@ static inline int snd_sof_load_firmware(struct snd_sof_dev *sdev)
 
 /* host DSP message data */
 static inline int snd_sof_ipc_msg_data(struct snd_sof_dev *sdev,
-				       struct snd_pcm_substream *substream,
+				       struct snd_sof_pcm_stream *sps,
 				       void *p, size_t sz)
 {
-	return sof_ops(sdev)->ipc_msg_data(sdev, substream, p, sz);
+	return sof_ops(sdev)->ipc_msg_data(sdev, sps, p, sz);
 }
 /* host side configuration of the stream's data offset in stream mailbox area */
 static inline int
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 752bf46c7bc9..39b015c59168 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -20,6 +20,8 @@
 #include <uapi/sound/sof/fw.h>
 #include <sound/sof/ext_manifest.h>
 
+struct snd_sof_pcm_stream;
+
 /* Flag definitions used in sof_core_debug (sof_debug module parameter) */
 #define SOF_DBG_ENABLE_TRACE	BIT(0)
 #define SOF_DBG_RETAIN_CTX	BIT(1)	/* prevent DSP D3 on FW exception */
@@ -247,7 +249,7 @@ struct snd_sof_dsp_ops {
 
 	/* host read DSP stream data */
 	int (*ipc_msg_data)(struct snd_sof_dev *sdev,
-			    struct snd_pcm_substream *substream,
+			    struct snd_sof_pcm_stream *sps,
 			    void *p, size_t sz); /* mandatory */
 
 	/* host side configuration of the stream's data offset in stream mailbox area */
@@ -761,7 +763,7 @@ int sof_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 		   u32 offset, void *dest, size_t size);
 
 int sof_ipc_msg_data(struct snd_sof_dev *sdev,
-		     struct snd_pcm_substream *substream,
+		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz);
 int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_pcm_substream *substream,
diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index 5f1ceeea893a..13e44501d442 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -19,6 +19,7 @@
 
 #include "ops.h"
 #include "sof-priv.h"
+#include "sof-audio.h"
 
 struct sof_stream {
 	size_t posn_offset;
@@ -26,12 +27,13 @@ struct sof_stream {
 
 /* Mailbox-based Generic IPC implementation */
 int sof_ipc_msg_data(struct snd_sof_dev *sdev,
-		     struct snd_pcm_substream *substream,
+		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz)
 {
-	if (!substream || !sdev->stream_box.size) {
+	if (!sps || !sdev->stream_box.size) {
 		snd_sof_dsp_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
 	} else {
+		struct snd_pcm_substream *substream = sps->substream;
 		struct sof_stream *stream = substream->runtime->private_data;
 
 		/* The stream might already be closed */
-- 
2.25.1

