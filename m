Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDF066DD4B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:15:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A7DA641E;
	Tue, 17 Jan 2023 13:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A7DA641E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673957715;
	bh=r6oCh/ir4X+5F1PQ3w3dI9znniEmwXNhV9hUfc5WL3k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OsUb5yjeHnmV3wliB97WHgcrDqXTR90PRJSLUJca4p/Z1H4+fvx9+xoY/Paou7rKa
	 RFCPU7B0J5ewd8OXffD96iEChHg5JVjw6g5UBTKt3KY/kV2fEkHlaY6BZHI9Rhciab
	 NzqpCbjO+bQA5Rzaia89Cj3iwrm5NErsrSaETjAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13254F80552;
	Tue, 17 Jan 2023 13:13:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3B9FF8053C; Tue, 17 Jan 2023 13:13:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44CB5F8026D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44CB5F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=FB4QA8LI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dp7+2pfEmceQbbiv8OVk8ybL9JBjBo+Hx7GNMrOY0+olypBrd2rVGwmcbRyewOB3Yisa2Qqk/HXph6LHuwetmGnQ8o1rxf+Gyb4VQ3wPKOYjiHXMXwR/7vbQYmTmt2FNZzK3YxWnvvQ36ncTCA4KcUOAZSLmsHihbb1JUNo3DcYmj3R069G8sLDrJF05e/YVkQPN0B6JfGCZEr+Py3/KqdurT6LbAfSo8vN0XrrwhEvh3Qe+93pZVPjj8e387mNrNKmdSKdD+kKg0qSNx25/IawNpbsntVvdAns91wVraRR0vRud69fdb+AbcR432Lcqb/n+Agd/PWe70h3QSYk5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFBkJNu6zyKt1vYhb2aturuZ18OYnhjzeVueMXVKk/U=;
 b=gh/G8T5u5TFaK9xPgrkOhhSgzFtkFBDWpuQb9DH8g8dOF5PNyte4OiL2d+fz8J1Ip7WlzE8AU3LCg5oEJQqRQIgwM2T/QM2K+uqmsOpv17xybRslls/T+FxVsKmEUkStnuacFqCjCTjGxLDoDuXMk8TPZ3a9TTAbVtI9LnhT6m14C8MFupqwNCDzbUi29zDQM4RvtU+/HPL5t1dbq5Rob7IvDhBM7hXb9WN1f898zYmWFM2zoktDoNnhCYcjfE2RFMTHh48TypxoNfPF+HqbLninf2J/BPZAMJqxcuDEO1l2vzpxBtcg1LvYA8FikMhKILfiDs30unIBVGpRbaxKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFBkJNu6zyKt1vYhb2aturuZ18OYnhjzeVueMXVKk/U=;
 b=FB4QA8LIB2t604w5GIRQnq1XR2kwUFC2tyeyXDqni1P/d/lpql0fJvhZseNvpvBOU8t1G0XicYrs/1y2Sgg/YU0xTWx1QdMg4SlVmkQZgEpDxQSExpoNjfwGDni1Wst2St7n8pJBOmNZ0gsFRvjH846A85x/HVvH8ZvbqNu34GU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9373.eurprd04.prod.outlook.com (2603:10a6:102:2b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:13:28 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:13:27 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 3/4] ASoC: SOF: Add support for compress API for stream
 data/offset
Date: Tue, 17 Jan 2023 14:13:06 +0200
Message-Id: <20230117121307.200183-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117121307.200183-1-daniel.baluta@oss.nxp.com>
References: <20230117121307.200183-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::9) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PAXPR04MB9373:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a05b0d-d761-4ef1-5297-08daf8843d54
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +a+ccYNEXahaB9jyq3RelcYnhwzCYcEtQPVUl7jRz5g2ML25kGaoNA3VYGvn5PvsJaxl4Jg399+7FzKB5atD0uOOr5hbHPefYN5zVX4Tk4BRfNXH3ZW8wacZCjUG/6mLJo7BiPAb5HCp30ff8mi+788ioI7ITNL1U6LjODNCEB2gJy4MWHdxFQ3k88AiDYEeu2VEV29yCn9iGZ8vzsiOgU3t6R0r8o4z5g2eTidEpIGrK6Ww7fyX0BE+s9S3lYvglwphVq7hMwZuy6ZO+PiAOyXgYKdsLL8Q4esn4bPJMv87M6WX4pHG0ZpHy6cFtuEOVS9mEBppvM1CxbJbt1CDOS5nCGIDIpy1Pd6nNnp2ZX3423itO1dV7jtjww41r1w+Jxs/+ML/do33G2uVHR2Ex/P0/AiWiOFlzXvrxS3wUZvL8XkdO4ey9lBqoJuSrAFSM7US+C0KMJaRNlAPB0lE/a/XLsX3ruS7z6HwAhBm08csZJrqspyTJZ9iMWFGMKpKtXyTOurZRidnk7T+AW7K/aw0Wmzjt7Hjpzoldg09wjCqaaIy9z5kkaXLkxoX2HFHK5uYC/JBFFbtyP1u/v06hIq3C3a2VudScJntPz+q3Mo2lDxWxYmiC3k6AZZvAZIqj4PjI0V6NjiQvrscyvXsS7O7w8vZezVerZb6I/sg8yxbnVShrlCvqlNO43LEh5z0eotkWPEDovFEub0S0Djr/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(316002)(83380400001)(6916009)(8936002)(5660300002)(66556008)(66476007)(4326008)(41300700001)(66946007)(8676002)(2616005)(38350700002)(1076003)(38100700002)(86362001)(6512007)(6506007)(26005)(186003)(52116002)(6666004)(6486002)(478600001)(66899015)(2906002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5fR3EuPll+8KAXwk5yT9xe5ck/GNUhqYvGU07pkr0G15p4sNt+O//mO5hYRr?=
 =?us-ascii?Q?QQG5+85SyFybRpLrkSzNF2xk+aSntooGRs22d1FSAG6Qi4YOVIw3ERvMCW/a?=
 =?us-ascii?Q?UIdQq2AClzFo4Cz5hJNQw/12vWvbiR30VDZmXVlalvP7iQvRmd+TZUIdMI/f?=
 =?us-ascii?Q?lgBFr0zqgnA62CgsInltYTy1GS7LW9ESv8FdY8XWxBD3TAGRBooO3b4VsQTG?=
 =?us-ascii?Q?9g2Uq1cikhY7M1Ln6MZunHs7mYF/cNOrmN4ZfUHFi3z8nmm5SPr6kV48iyz2?=
 =?us-ascii?Q?0nn8yDGWASpne39rBFSrvTf9ou2wJDabeCJaXqElfTGR+d934tK0szOY9yOc?=
 =?us-ascii?Q?RBAQzRVLFbzRojFqqpVvipeUW9i/UAxNH54jrVcxX3MlxT0NjSIHc45ffnty?=
 =?us-ascii?Q?EjqkFmUtWMoUmZ7X9yEa8yzluza99ATYsVmyEoxeSoywlmYbTHSvyjMd3RLu?=
 =?us-ascii?Q?65smhOkR1AJTDEZ5oMcABflb3gJK3S14cCGkcjcSrjfQaLeXb95NJft663mX?=
 =?us-ascii?Q?NKXR1T8xdamvzcWsfYOIjZs1Ua/4IIlZrgORWwYMmceow4w6Pn1kLf+QXoYU?=
 =?us-ascii?Q?3jcyoDMCcrzv1PYozceMh55N/jK9H/k6WzudfdFaALc/ZDPTfOJAf9Va7P8M?=
 =?us-ascii?Q?91X630S+0sgr/MSnjVwwKZlnz6RlrqIJa4fRkCGCpEzP8ql1aiD0Qz5+tZuq?=
 =?us-ascii?Q?n62FeIV+O+SoAyH5wGdYns7v/0j3V1OyI+o4NnZJQIatF6K4so0WqAoTyG6v?=
 =?us-ascii?Q?cL0/JBaQ4WSGSryZQLGMeYw4yGu7z/54yyb4GD07Oe36CJSXbtDO35nGt3kX?=
 =?us-ascii?Q?NRyM4gUo7PSzIzWHOIT5d1gDIuOBZ8HAthSHcr6WM8n5n+qAPsQn2DABv2cs?=
 =?us-ascii?Q?GyGmpA2z0G6fz1/mgCDfq2FQQvx3/Sz6EjPe/CZCKrVprlEt1BE84al8NTBL?=
 =?us-ascii?Q?28JvukfZl/0DvwL4TeVu2Hz9VPYNMi/3bhwNXOJC+qRPY+zxUk/aRKEGGYTG?=
 =?us-ascii?Q?jz/tGKUr0wtjN/CS//Tr4k4quRUZ+FZKVY14GxBD6bP7ih/X7s/yFDZJepj1?=
 =?us-ascii?Q?ev2Qii9BF9ReFdtGkcBsxK8hsHrzK8+V7FRPRjgGWuU7rDf3sJ5tL3svPgxZ?=
 =?us-ascii?Q?0rR9ptoFEBA2wyBx2INEWaYrquRt0YMasIOLwu0QvZdVxXZ1is6FSKJPVNap?=
 =?us-ascii?Q?BB13Ltc6Ka7HklpZvWeFaBq6SpZocgVf1IyzcrWKhwmcZXVW4Z+Y7FDgrkpy?=
 =?us-ascii?Q?gyEnHpAVVqOkyo76COre48j+HtnEG/cqBC3rfq8573M/jHkZHKDIVxNps4Uz?=
 =?us-ascii?Q?imyfLXPvzxYJ3Wq940iK3wKuGAyzueIl5QSq5foXNKcsDGgZxLPe/PUmd4bM?=
 =?us-ascii?Q?mJVNOGqBHbLGZB9abRVdTlQSfNoOoGpvS7/ohDlbcqtTG6bd9Uw9HoNxgAWQ?=
 =?us-ascii?Q?q2h6DOq2jUX26vdYEv2cJBlt3iZCuNQzRNkERhNn1VhuL0c5nTvQUluRCiST?=
 =?us-ascii?Q?GJIZJjp9U0TX0GvQxukPQP8Ab55cBO1uRf5/n1S0Bd/GG00rmDeFjrqMlhIR?=
 =?us-ascii?Q?TvJW6rBzR685Z1Q1+GHgrvYMUukoCUQyaDnj3mi1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a05b0d-d761-4ef1-5297-08daf8843d54
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:13:27.6841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhLUU7XHVpP7fCMaopXXK2lN8DC0Dta4sTFrX/hxeJysbkwcB2tNecHa0MnSw0Kw+AZMAfZx9xmfAkCDW5xYDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9373
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
 Allen-KH.Cheng@mediatek.com, AjitKumar.Pandey@amd.com, lgirdwood@gmail.com,
 linux-imx@nxp.com, yc.hung@mediatek.com, Vsujithkumar.Reddy@amd.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

snd_sof_pcm_stream keeps information about both PCM (snd_pcm_substream)
and Compress (snd_compr_stream) streams.

When PCM substream pointer is NULL this means we are dealing with a
compress stream.

Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/sof-priv.h   |  1 +
 sound/soc/sof/stream-ipc.c | 48 ++++++++++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 95a6b301da49..86fc5c6a9c39 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -115,6 +115,7 @@ struct sof_compr_stream {
 	u32 sampling_rate;
 	u16 channels;
 	u16 sample_container_bytes;
+	size_t posn_offset;
 };
 
 struct snd_sof_dev;
diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index 872a49550672..216b454f6b94 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -33,14 +33,27 @@ int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 	if (!sps || !sdev->stream_box.size) {
 		snd_sof_dsp_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
 	} else {
-		struct snd_pcm_substream *substream = sps->substream;
-		struct sof_stream *stream = substream->runtime->private_data;
+		size_t posn_offset;
 
-		/* The stream might already be closed */
-		if (!stream)
-			return -ESTRPIPE;
+		if (sps->substream) {
+			struct sof_stream *stream = sps->substream->runtime->private_data;
 
-		snd_sof_dsp_mailbox_read(sdev, stream->posn_offset, p, sz);
+			/* The stream might already be closed */
+			if (!stream)
+				return -ESTRPIPE;
+
+			posn_offset = stream->posn_offset;
+		} else {
+
+			struct sof_compr_stream *sstream = sps->cstream->runtime->private_data;
+
+			if (!sstream)
+				return -ESTRPIPE;
+
+			posn_offset = sstream->posn_offset;
+		}
+
+		snd_sof_dsp_mailbox_read(sdev, posn_offset, p, sz);
 	}
 
 	return 0;
@@ -51,18 +64,29 @@ int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_sof_pcm_stream *sps,
 			       size_t posn_offset)
 {
-	struct snd_pcm_substream *substream = sps->substream;
-	struct sof_stream *stream = substream->runtime->private_data;
-
 	/* check if offset is overflow or it is not aligned */
 	if (posn_offset > sdev->stream_box.size ||
 	    posn_offset % sizeof(struct sof_ipc_stream_posn) != 0)
 		return -EINVAL;
 
-	stream->posn_offset = sdev->stream_box.offset + posn_offset;
+	posn_offset += sdev->stream_box.offset;
+
+	if (sps->substream) {
+		struct sof_stream *stream = sps->substream->runtime->private_data;
+
+		stream->posn_offset = posn_offset;
+		dev_dbg(sdev->dev, "pcm: stream dir %d, posn mailbox offset is %zu",
+			sps->substream->stream, posn_offset);
+	} else if (sps->cstream) {
+		struct sof_compr_stream *sstream = sps->cstream->runtime->private_data;
 
-	dev_dbg(sdev->dev, "pcm: stream dir %d, posn mailbox offset is %zu",
-		substream->stream, stream->posn_offset);
+		sstream->posn_offset = posn_offset;
+		dev_dbg(sdev->dev, "compr: stream dir %d, posn mailbox offset is %zu",
+			sps->cstream->direction, posn_offset);
+	} else {
+		dev_err(sdev->dev, "No stream opened");
+		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.25.1

