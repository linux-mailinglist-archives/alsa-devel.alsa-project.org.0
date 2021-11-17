Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5184543FA
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BECF183B;
	Wed, 17 Nov 2021 10:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BECF183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142089;
	bh=Rdg+k5vHvWRnO61fUio+Qu01+Be0oO5HbPtMgY/G6+4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBzZTdHQ4cUrGY9IATc7P8df8Cp5UYKJGoDMFUqtVX2jCdBK13Daa2ALm551wJmIk
	 7/wUEWMeO/JX3p4k640fL/krfY5vBpeCIqgH2EmbFzzX6OGecLb8Y2maByRBsAG/9f
	 SFeRG8BUPdPNg7pigE4RRju0zBJRT90lZYTg9mek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D2DDF80518;
	Wed, 17 Nov 2021 10:38:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F560F804BD; Wed, 17 Nov 2021 10:38:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B5FBF8016C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5FBF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="BzJr9Izu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ft4FWtSkAIFYkOqVGbZM0EqMtUC3I3KR+f8vz1STMAU4OvGnHwvliYtAdwVe24CXDnvJMYrxr5f1x9fTlDYfH0QXV1/WVXbt4wpGBbSlSsCqrVUno7qGZPLR8eL3zJxngNO5wleTlt0fQQB0v1USUVFKwQB1s5GQFs3AGiKFK3hbImiwMWAklp+NtkTgzTkFXFyi+9dMmD9BThgiDQlpqBn31c0IU6l7K5FQtqe/NFhmLjGGAJsG2mPOxIQhvRqLqRLNSeKfDyXnprL4LOcgodaUuCUHn31aGjhz8O3N19tjHEp4iHj2zi4iICTIimOzeoRtovsKYW9AoBCSyu5/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4qRUmATwCb+HVITmZk8a5kV43TQ8HJCX1OlKEbFy+A=;
 b=gWHQXmUIo/wN8yHrcRgbTgQjbwQ3VmbaC6Liaik7RlAHhhz7MQOOTwu8/4wNIBdBwcxpNpy3N1HslUuYOWz85BVwZLshClcClkEMsZosp/m+oYkgRuIpa7FCfj5AYW74JOmrAMiYcKksV+TlXqvO8nTblnWErrAzuMYivNd9wTWldH91vIHmsRBYxqjoH0+BbuZaRjhVwy9PCmTL6dtyPhBxKGz2ZPUoXHNCxBKeW9ReBl03sjQazpuXDpm/vN2Y3K/1SSQDPwUMjAJ9tIiCMABBm5QBC/jxmfEZxTBeA2wQMRAQ+ZjepGv4ZHiWczPtZWiJOb88C1CQIAXVVTU8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4qRUmATwCb+HVITmZk8a5kV43TQ8HJCX1OlKEbFy+A=;
 b=BzJr9IzuBlf+VeUgDJWACIctUycmpRA+URA2iIL8nWZ9Mhz2DTWd8O2NiAuJLJhhvV/t1PmkdR/uMuNIssPGMJPqV6vsyO4BnV20OYa09DmMc/eUyidtYwkqtVybhY7+1BNRBoaxk1Wv9FqAny3dunSzBFoAabQqMhwZSCCtotQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 09:38:14 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:14 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 06/21] ASoC: SOF: amd: Add PCM stream callback for Renoir dai's
Date: Wed, 17 Nov 2021 11:37:19 +0200
Message-Id: <20211117093734.17407-7-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc7299ad-3495-464c-06b5-08d9a9adfa5a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5807BAB865C074AFB9032983B89A9@VI1PR04MB5807.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zree7ayPcWzKGjTz5e1RIaP/AgVxO1HuTXMhEbzUO0sleas2fv2N/3EUpmrTUkpo8kjKYYwQGVFFPyalGxPMLtiDD1HhsQ7laL+42nQ0BkxFOyo2W6Ub70Me56Nd7EnahEoOPCKI1ppCjynHUJ35RzQxgcYZtWQGWIXlVeJUBRmDZpH6N6gcgUwimm3/43Pcf/Xzir83/OqntwqNL3I+U7W0Ri7VZbInDn/01yCY0PgDZBaHhe1KO5tPSoEqCLSqKbGwDYOLbpP7IUlziR8coSih3RhwRT41qn2M1bsJFwckFwYUO8bvSSiCuErzdO/hctZfsTd0AHZQYV/1LMcvFTOuzVpowVcEh0BL4HM4CWv0b2d11VYIV7z8iM47X3cbT07M7CYznstWI8Ap0ZoCVWh/40qLDJQy/w5qJfzN+zkqJyJoTjYQg7PkCyknKeJ+Sps5NW1XBis+EWr9R4+x4KQaD32oGwor8ReZlUCG23s9untNtget0rXNDeVdvKVibgQRRWNQJ16Vk6qG8AhODyMYr1Zs9+K2PZnwPYeB0/EkexK9ITZj2VtFBHuZIHKMsGYnzn4mVdZ2Flr5PjogFQlmarWgn6RBiakzT1EfzLP2BjDeoOJWQdhCCuyXqmbfd+hCVmxq4Yk+MySKidIesA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(5660300002)(508600001)(52116002)(86362001)(8676002)(54906003)(8936002)(66946007)(186003)(6512007)(2906002)(6486002)(7416002)(6506007)(30864003)(1076003)(2616005)(66556008)(66476007)(44832011)(83380400001)(38100700002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mrH0KFGyFOzKUQ5k7AJa5ksV3QQbDYOzcSPLLj/8QC2OfoFHia+rH8If+N2O?=
 =?us-ascii?Q?wZb/ZN7dzR02rDHNYyG6ZZLFpI0dVb20F+h2BYIGFxP8flC2FkMiJp4ZlBZd?=
 =?us-ascii?Q?ihWzda6zsn7d6ubi5wBiZHUTWS4ShTB6NC1ZjkjCCXv3WujT2sWeTlVEFqkk?=
 =?us-ascii?Q?1nGyOKRM3hToh5vwUg2Gm/J7Kr6jAY9QyTOTqRGiHqzV8d6m9tqeYy2dv2kf?=
 =?us-ascii?Q?LdsKPqtTTGieLGju0tJQeL4CEIReZxaJcVBhBvpxGUp9P42WYCK/xm4okC//?=
 =?us-ascii?Q?VAo5HhLthz9jFTAcbyui6nk5xN+fgjEQPaJLiGb1GNGf/sFTawJH81gKwChG?=
 =?us-ascii?Q?Bo5AL3Pyg8kSD2ddlxVISbbWxYHBeD4oRoq4wV3z0W8E1cus0nRr5fGwRIJf?=
 =?us-ascii?Q?5BJWNuK/GM67kJ5VcSjIBGYmm55wQ1GZsYbm4UonP/PmeMzfeYsoxhryrPsP?=
 =?us-ascii?Q?7SF7W6pfoE7QIHr3lMX3VPaNMO9+iLf2nfxj5KuXlTdQ6Ca+bROp77Fi0DnF?=
 =?us-ascii?Q?GtumiDlHFsgctvVCtqe3diQzirJlcHLU9GptJbm8W4Nh5hjuZF7XFrweQo5z?=
 =?us-ascii?Q?zJeoO+oObhCFuy+E9wdhr1EVlp6EklGv940EvD54SE1obEQAS0+1Kxh5gf9q?=
 =?us-ascii?Q?K2Zer8+4JTmOk17IX1ojnQ1gRI4b2oTFeRssXMuR9qh75OCNYW9Upy+Rxb8D?=
 =?us-ascii?Q?M+kP7/DiF/l7kn3+BAvVdApZRSk75MbDou51kE3GpISByrFqM7e8+Sf5zWwZ?=
 =?us-ascii?Q?/eOZ2+GZtWnJKV4nmwqRaTkC/+GoKGa29FYPH1JfA97CyONRp4+dZ+GpOwpy?=
 =?us-ascii?Q?y4Ri9Yoo7HNPHTukd1D+6R0aK0P7KW12XVS7AY+tByjFV0CBkn+xFsCxzC/A?=
 =?us-ascii?Q?exixDPpG+0rgua0cX732Bh8J9TXm2bg+LwRziz4xybxKZDK1ypilEshpJhKo?=
 =?us-ascii?Q?lAO+Dm4uwN7zjb6GTTHMXd5DlP3arr/Zy1tRGl5EjpYnkXFr0gzHq0F+ajlD?=
 =?us-ascii?Q?7xl+pG+FBjm9UWaih+lMY+SC39zhhnIFr4kJeRIRuy3VmCN+uXVns2P980Jg?=
 =?us-ascii?Q?Yo8VQ3stkILrLBaP7Tpc8H71Fb03WtbULjKPM/bR2Q0sKXJEH8Y7QMql+Cge?=
 =?us-ascii?Q?AZV2OBMAqnacF5E5AxbnujCTUj3gNoBIegxQeG5HlYH0I7vQPrdXe5VeBzJK?=
 =?us-ascii?Q?sUEbTuKB9apzLuI0amgvy3L61q5KQccIjpd/99jG4lBy6CemuFk/efBLeLFO?=
 =?us-ascii?Q?q9ozgYymyIIqJ6HNFMu4NJjS/9GgOsd7Z0TON6XHyScYRorEecsbucvzatkf?=
 =?us-ascii?Q?8IOoBT0WJcrGp2Mjr75cI+95pjpRYPVWe+ZHsSWzftfHxZte294tKTWq5Hos?=
 =?us-ascii?Q?V866oH2FUnmlOtTDezAA40XiozosEQ+03XtYYHuWIno2yM2xaVVR+eIg3/ua?=
 =?us-ascii?Q?QUqIDx5PZ35FTluCOKboIM59+FCzCFAnsigqVTK8geQwezllYSbpHuP7iYJF?=
 =?us-ascii?Q?ET+QrlPDiuzmwYDsXksAAks91eHbIUAIrk4JNev9BYrBkrhWdj3kYDQgiOEP?=
 =?us-ascii?Q?N2Dblnwxd3sgtSH/8OckM9lvPkyTo5lwSF80XZt9OJRSKzu1cMb0Kvfc1Tee?=
 =?us-ascii?Q?6qncOCe2iywQe5ixIh4vwbwJASvMaPwjp+9HZr1mHYLfrk+CTeA+Bh36/kfz?=
 =?us-ascii?Q?jYVBbTMg6Jj+V6QoxVnQap99krCWhSDDHqlI84YB0KDoZNdt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7299ad-3495-464c-06b5-08d9a9adfa5a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:14.7114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BK5xY9q8JSSPHKBwYP+MH1wtlN4m0JQJ19qlXs9KuwAqk04V+4o2VeO50ZKjQCJtt19NUTfswCcWhgrE3dP/VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5807
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

Add module to support ALSA pcm stream configurations for ACP I2S
and DMIC endpoints

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/Makefile     |   2 +-
 sound/soc/sof/amd/acp-pcm.c    |  82 +++++++++++++++
 sound/soc/sof/amd/acp-stream.c | 181 +++++++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.c        |   2 +
 sound/soc/sof/amd/acp.h        |  28 +++++
 sound/soc/sof/amd/renoir.c     |  11 ++
 6 files changed, 305 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/amd/acp-pcm.c
 create mode 100644 sound/soc/sof/amd/acp-stream.c

diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
index 29928b16002f..7b88db9c5fb7 100644
--- a/sound/soc/sof/amd/Makefile
+++ b/sound/soc/sof/amd/Makefile
@@ -4,7 +4,7 @@
 #
 # Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
 
-snd-sof-amd-acp-objs := acp.o acp-loader.o acp-ipc.o
+snd-sof-amd-acp-objs := acp.o acp-loader.o acp-ipc.o acp-pcm.o acp-stream.o
 snd-sof-amd-renoir-objs := renoir.o
 
 obj-$(CONFIG_SND_SOC_SOF_AMD_COMMON) += snd-sof-amd-acp.o
diff --git a/sound/soc/sof/amd/acp-pcm.c b/sound/soc/sof/amd/acp-pcm.c
new file mode 100644
index 000000000000..5b23830cb1f3
--- /dev/null
+++ b/sound/soc/sof/amd/acp-pcm.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+
+/*
+ * PCM interface for generic AMD audio ACP DSP block
+ */
+#include <sound/pcm_params.h>
+
+#include "../ops.h"
+#include "acp.h"
+#include "acp-dsp-offset.h"
+
+int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+		      struct snd_pcm_hw_params *params, struct sof_ipc_stream_params *ipc_params)
+{
+	struct acp_dsp_stream *stream = substream->runtime->private_data;
+	unsigned int buf_offset, index;
+	u32 size;
+	int ret;
+
+	size = ipc_params->buffer.size;
+	stream->num_pages = ipc_params->buffer.pages;
+	stream->dmab = substream->runtime->dma_buffer_p;
+
+	ret = acp_dsp_stream_config(sdev, stream);
+	if (ret < 0) {
+		dev_err(sdev->dev, "stream configuration failed\n");
+		return ret;
+	}
+
+	ipc_params->buffer.phy_addr = stream->reg_offset;
+	ipc_params->stream_tag = stream->stream_tag;
+
+	/* write buffer size of stream in scratch memory */
+
+	buf_offset = offsetof(struct scratch_reg_conf, buf_size);
+	index = stream->stream_tag - 1;
+	buf_offset = buf_offset + index * 4;
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + buf_offset, size);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_pcm_hw_params, SND_SOC_SOF_AMD_COMMON);
+
+int acp_pcm_open(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
+{
+	struct acp_dsp_stream *stream;
+
+	stream = acp_dsp_stream_get(sdev, 0);
+	if (!stream)
+		return -ENODEV;
+
+	substream->runtime->private_data = stream;
+	stream->substream = substream;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_pcm_open, SND_SOC_SOF_AMD_COMMON);
+
+int acp_pcm_close(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
+{
+	struct acp_dsp_stream *stream;
+
+	stream = substream->runtime->private_data;
+	if (!stream) {
+		dev_err(sdev->dev, "No open stream\n");
+		return -EINVAL;
+	}
+
+	stream->substream = NULL;
+	substream->runtime->private_data = NULL;
+
+	return acp_dsp_stream_put(sdev, stream);
+}
+EXPORT_SYMBOL_NS(acp_pcm_close, SND_SOC_SOF_AMD_COMMON);
diff --git a/sound/soc/sof/amd/acp-stream.c b/sound/soc/sof/amd/acp-stream.c
new file mode 100644
index 000000000000..f2837bfbdb20
--- /dev/null
+++ b/sound/soc/sof/amd/acp-stream.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+
+/*
+ * Hardware interface for generic AMD audio DSP ACP IP
+ */
+
+#include "../ops.h"
+#include "acp-dsp-offset.h"
+#include "acp.h"
+
+#define PTE_GRP1_OFFSET		0x00000000
+#define PTE_GRP2_OFFSET		0x00800000
+#define PTE_GRP3_OFFSET		0x01000000
+#define PTE_GRP4_OFFSET		0x01800000
+#define PTE_GRP5_OFFSET		0x02000000
+#define PTE_GRP6_OFFSET		0x02800000
+#define PTE_GRP7_OFFSET		0x03000000
+#define PTE_GRP8_OFFSET		0x03800000
+
+int acp_dsp_stream_config(struct snd_sof_dev *sdev, struct acp_dsp_stream *stream)
+{
+	unsigned int pte_reg, pte_size, phy_addr_offset, index;
+	int stream_tag = stream->stream_tag;
+	u32 low, high, offset, reg_val;
+	dma_addr_t addr;
+	int page_idx;
+
+	switch (stream_tag) {
+	case 1:
+		pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_1;
+		pte_size = ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1;
+		offset = offsetof(struct scratch_reg_conf, grp1_pte);
+		stream->reg_offset = PTE_GRP1_OFFSET;
+		break;
+	case 2:
+		pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_2;
+		pte_size = ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2;
+		offset = offsetof(struct scratch_reg_conf, grp2_pte);
+		stream->reg_offset = PTE_GRP2_OFFSET;
+		break;
+	case 3:
+		pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_3;
+		pte_size = ACPAXI2AXI_ATU_PAGE_SIZE_GRP_3;
+		offset = offsetof(struct scratch_reg_conf, grp3_pte);
+		stream->reg_offset = PTE_GRP3_OFFSET;
+		break;
+	case 4:
+		pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_4;
+		pte_size = ACPAXI2AXI_ATU_PAGE_SIZE_GRP_4;
+		offset = offsetof(struct scratch_reg_conf, grp4_pte);
+		stream->reg_offset = PTE_GRP4_OFFSET;
+		break;
+	case 5:
+		pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_5;
+		pte_size = ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5;
+		offset = offsetof(struct scratch_reg_conf, grp5_pte);
+		stream->reg_offset = PTE_GRP5_OFFSET;
+		break;
+	case 6:
+		pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_6;
+		pte_size = ACPAXI2AXI_ATU_PAGE_SIZE_GRP_6;
+		offset = offsetof(struct scratch_reg_conf, grp6_pte);
+		stream->reg_offset = PTE_GRP6_OFFSET;
+		break;
+	case 7:
+		pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_7;
+		pte_size = ACPAXI2AXI_ATU_PAGE_SIZE_GRP_7;
+		offset = offsetof(struct scratch_reg_conf, grp7_pte);
+		stream->reg_offset = PTE_GRP7_OFFSET;
+		break;
+	case 8:
+		pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_8;
+		pte_size = ACPAXI2AXI_ATU_PAGE_SIZE_GRP_8;
+		offset = offsetof(struct scratch_reg_conf, grp8_pte);
+		stream->reg_offset = PTE_GRP8_OFFSET;
+		break;
+	default:
+		dev_err(sdev->dev, "Invalid stream tag %d\n", stream_tag);
+		return -EINVAL;
+	}
+
+	/* write phy_addr in scratch memory */
+
+	phy_addr_offset = offsetof(struct scratch_reg_conf, reg_offset);
+	index = stream_tag - 1;
+	phy_addr_offset = phy_addr_offset + index * 4;
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 +
+			  phy_addr_offset, stream->reg_offset);
+
+	/* Group Enable */
+	reg_val = ACP_SRAM_PTE_OFFSET + offset;
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, pte_reg, reg_val | BIT(31));
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, pte_size, PAGE_SIZE_4K_ENABLE);
+
+	for (page_idx = 0; page_idx < stream->num_pages; page_idx++) {
+		addr = snd_sgbuf_get_addr(stream->dmab, page_idx * PAGE_SIZE);
+
+		/* Load the low address of page int ACP SRAM through SRBM */
+		low = lower_32_bits(addr);
+		high = upper_32_bits(addr);
+
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + offset, low);
+
+		high |= BIT(31);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + offset + 4, high);
+		/* Move to next physically contiguous page */
+		offset += 8;
+	}
+
+	return 0;
+}
+
+struct acp_dsp_stream *acp_dsp_stream_get(struct snd_sof_dev *sdev, int tag)
+{
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
+	struct acp_dsp_stream *stream = adata->stream_buf;
+	int i;
+
+	for (i = 0; i < ACP_MAX_STREAM; i++, stream++) {
+		if (stream->active)
+			continue;
+
+		/* return stream if tag not specified*/
+		if (!tag) {
+			stream->active = 1;
+			return stream;
+		}
+
+		/* check if this is the requested stream tag */
+		if (stream->stream_tag == tag) {
+			stream->active = 1;
+			return stream;
+		}
+	}
+
+	dev_err(sdev->dev, "stream %d active or no inactive stream\n", tag);
+	return NULL;
+}
+EXPORT_SYMBOL_NS(acp_dsp_stream_get, SND_SOC_SOF_AMD_COMMON);
+
+int acp_dsp_stream_put(struct snd_sof_dev *sdev,
+		       struct acp_dsp_stream *acp_stream)
+{
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
+	struct acp_dsp_stream *stream = adata->stream_buf;
+	int i;
+
+	/* Free an active stream */
+	for (i = 0; i < ACP_MAX_STREAM; i++, stream++) {
+		if (stream == acp_stream) {
+			stream->active = 0;
+			return 0;
+		}
+	}
+
+	dev_err(sdev->dev, "Cannot find active stream tag %d\n", acp_stream->stream_tag);
+	return -EINVAL;
+}
+EXPORT_SYMBOL_NS(acp_dsp_stream_put, SND_SOC_SOF_AMD_COMMON);
+
+int acp_dsp_stream_init(struct snd_sof_dev *sdev)
+{
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
+	int i;
+
+	for (i = 0; i < ACP_MAX_STREAM; i++) {
+		adata->stream_buf[i].sdev = sdev;
+		adata->stream_buf[i].active = 0;
+		adata->stream_buf[i].stream_tag = i + 1;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_dsp_stream_init, SND_SOC_SOF_AMD_COMMON);
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 43a57d15e3ca..74ede28aa8d8 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -363,6 +363,8 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 
 	acp_memory_init(sdev);
 
+	acp_dsp_stream_init(sdev);
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_probe, SND_SOC_SOF_AMD_COMMON);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index ac8340119125..36d000c3f792 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -13,6 +13,8 @@
 
 #include "../sof-priv.h"
 
+#define ACP_MAX_STREAM	8
+
 #define ACP_DSP_BAR	0
 
 #define ACP_REG_POLL_INTERVAL                   500
@@ -114,6 +116,17 @@ struct  scratch_reg_conf {
 	unsigned int    reserve[];
 };
 
+struct acp_dsp_stream {
+	struct list_head list;
+	struct snd_sof_dev *sdev;
+	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer *dmab;
+	int num_pages;
+	int stream_tag;
+	int active;
+	unsigned int reg_offset;
+};
+
 /* Common device data struct for ACP devices */
 struct acp_dev_data {
 	struct snd_sof_dev  *dev;
@@ -125,6 +138,7 @@ struct acp_dev_data {
 	dma_addr_t dma_addr;
 	u8 *data_buf;
 	struct dma_descriptor dscr_info[ACP_MAX_DESC];
+	struct acp_dsp_stream stream_buf[ACP_MAX_STREAM];
 };
 
 void memcpy_to_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *src, size_t bytes);
@@ -165,5 +179,19 @@ int acp_sof_ipc_pcm_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *s
 void acp_mailbox_write(struct snd_sof_dev *sdev, u32 offset, void *message, size_t bytes);
 void acp_mailbox_read(struct snd_sof_dev *sdev, u32 offset, void *message, size_t bytes);
 
+/* ACP - DSP  stream callbacks */
+int acp_dsp_stream_config(struct snd_sof_dev *sdev, struct acp_dsp_stream *stream);
+int acp_dsp_stream_init(struct snd_sof_dev *sdev);
+struct acp_dsp_stream *acp_dsp_stream_get(struct snd_sof_dev *sdev, int tag);
+int acp_dsp_stream_put(struct snd_sof_dev *sdev, struct acp_dsp_stream *acp_stream);
+
+/*
+ * DSP PCM Operations.
+ */
+int acp_pcm_open(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream);
+int acp_pcm_close(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream);
+int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+		      struct snd_pcm_hw_params *params, struct sof_ipc_stream_params *ipc_params);
+
 extern const struct snd_sof_dsp_ops sof_renoir_ops;
 #endif
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index ca5582b3f82d..0241c5dce156 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -140,6 +140,17 @@ const struct snd_sof_dsp_ops sof_renoir_ops = {
 	/* DAI drivers */
 	.drv			= renoir_sof_dai,
 	.num_drv		= ARRAY_SIZE(renoir_sof_dai),
+
+	/* stream callbacks */
+	.pcm_open		= acp_pcm_open,
+	.pcm_close		= acp_pcm_close,
+	.pcm_hw_params		= acp_pcm_hw_params,
+
+	.hw_info		= SNDRV_PCM_INFO_MMAP |
+				  SNDRV_PCM_INFO_MMAP_VALID |
+				  SNDRV_PCM_INFO_INTERLEAVED |
+				  SNDRV_PCM_INFO_PAUSE |
+				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 EXPORT_SYMBOL(sof_renoir_ops);
 
-- 
2.27.0

