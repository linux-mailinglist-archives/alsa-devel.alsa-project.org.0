Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C40445440F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:44:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC777186E;
	Wed, 17 Nov 2021 10:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC777186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142274;
	bh=pTH6kEQv/zj/K25KnXPTaWAkYJTbdWhj0MQBn3fefAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMoJSXgxpziPiE0wlg+8yqVQAUa4NMSv62AOgOc+5Qp1AWfZ1c+f9JO9p9WWkHPzE
	 Mh+PNY7wICWI9RFhXmb9kdtPhffYHAufvPO+E3tizrkZMIfkSlquqEmf/RJ8geo9Ds
	 Gf5hxurGLCc/sjEPjrOa42uZopPT8VFk/qHz/U4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24EBEF8057C;
	Wed, 17 Nov 2021 10:38:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5418EF80510; Wed, 17 Nov 2021 10:38:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 630B1F804FD
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 630B1F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="e8k2RDPf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtRx2u+5hYvhSZN9lYOaACVsNvbk3pclM6nEumAs5D20cqwgPx0jvAlpLW+oCkCKBwGRsYaBr7mGNB+N29+EBu/6GgFj3eeBVr46bGWVjWFjJZAKFOo3ipvG+qcyqjEvV/StCZPVODNlhipnKQxhLYJfYMUjAYyRjRHW1ZJJcNTFWhcrrzDrJvrMSgeVRJCyvV83BSVV4YweoU5gBwRyODp/o/b9sFuGBXJQDd1DwhBK6FhR0KmR9mDNjlONAve1LVT2FvNnDZ0YMIs2UBANxaVZpEB10vWVYPnZPUVG2/lKSL3KHGbyQGSpvXH5cx7+cyHSc2Pr8quheBvnufK/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHAp1DonNFQ+6pj6RVm34ZXbTZzInspElsG00tBCovs=;
 b=UhhZYfXH6oiNEyOQ9YgkZhqBJMQrlN5AupahLXBgzfaEtTEQa5R2g1ZdXC4+5Hvd89Su59dJ3HIKncznbj/+Ynp4QYDotwjIopYKf3TeHEPWnnYHqOajlCdF99yH/BFVoGmUVpHNCOpHEBwBm3CeP3IS4FzPVRcZmYNVKZoLR6O8JITKa+j8C5Ap0z5TH77JNA/0YTnIjO8H3r4ztU+vSBbJzhGWkazsZeSSmAjhvFGUMX4jLcKIXJM1z0AqEPSaCWjcqZgJJARSjyLiYKfVGH0GjKO+Wip4iXO+oJcCIsgrlqzQvK4z0dKK6AHVDAfs0f0o1yaQlZljwTXVWEZgdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHAp1DonNFQ+6pj6RVm34ZXbTZzInspElsG00tBCovs=;
 b=e8k2RDPfMYmABL5Sb0uxDtXEPz2N7ckAgGa+w3k5pwXoEudXcoiKFr4awQ6fLrnUvwksm9SBYVg1eJ88yDQxlMZLN3nhl2VLow4F7cEpJB8HRyhTZDZWhd3+9qjCW3/0AuWIChBII8fKZ/99AooBbO9oRj+i2BvpJa6p3b/gqnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3039.eurprd04.prod.outlook.com (2603:10a6:802:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 17 Nov
 2021 09:38:26 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:26 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 12/21] ASoC: SOF: amd: Add trace logger support
Date: Wed, 17 Nov 2021 11:37:25 +0200
Message-Id: <20211117093734.17407-13-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55a82735-97e9-4dfd-7b4d-08d9a9ae012a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3039:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB30399EEA124484EE8728677DB89A9@VI1PR04MB3039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 20B9q8AqbLp+wZ3o0xvZQ8oIPzMVn9En2hvYMycjyS9Lb/LO5b1HDYRvo153RatcrChs4wF/FfERq8206HtlHUKpfhbXiU5AjgMDb1AZE8/f5L7kEcE/akj29z7aV/7Oh5h7YJBi6WblN2CURoL/niglyXsZNla8E1mDX3tXGdWjlfhYkmSz5J0ANcvysWBW//iUrduBz5mSn/CGrDFEPbTcDEax2p1r14/9KYYEUQlEEYrPf8eRUn/r1/PB3/OeJ25GWu2uv/MxD/2aVKN/MVZPZGU53DT4WLj6/ibzYHsKQpAxo7JBAQI+CMgdfQ77fvdTMkYR3KHmzVCRGIrJ6i31oyx9P4DP1FgBSAoe4r2j+se6xTtHCHrybOnw1epKrKAGREVuywpuT8vIbLFf4pvmhz35+FqtwbBy0ffpWYJj55Vr3moMBWH4O9uYXVaMPFxNN7phLDzgCEqcsLDAkIR02ABPUHabPVMiK7LSGvffLmDwWGlnxmJMurTBFElZK6s5OSknvMm6nVWE5HX6p25huU8LGTVrBPMIy0Gvsy4FaYA0QJRkHhIe2/cMLjy1LyUN93WqhgtxPr4aCdhcPtNt/oAybOkV2UUlc106fadngPIeTpq80Yr+KCfMjoDanccNRotSvSSJL93oTa2s1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(186003)(44832011)(52116002)(6486002)(5660300002)(66556008)(6512007)(6506007)(4326008)(7416002)(2616005)(8936002)(8676002)(1076003)(2906002)(66946007)(83380400001)(508600001)(86362001)(316002)(38100700002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HBKmozfm8Qf5MTdz0tGcN50XKr3opQvIBoGgaiG5I8WuVhezqEU/RoDqd0v+?=
 =?us-ascii?Q?kiQ2C6oXCgDsJCeXdZKperhSZnOA4KWEbJh/JqH1+PBzBiOEmqLCPt9Kkinc?=
 =?us-ascii?Q?re5eZLMtjLYPSo8pL0ccxU6uSQBJDDuOigfBl9PLVg/e20+jKuLY7FAcYby0?=
 =?us-ascii?Q?p0upYp8z/YmFq/kgJbYLOeWqk5Y/NNvNZJAEVbfapRNSOtRqrGb39CQ8u/ok?=
 =?us-ascii?Q?B7FUVGtsbszQ8g1rXwHFsBko9Ck6lpAHVZlBZOH6xgIC+Gqak8jyEJdUcxAe?=
 =?us-ascii?Q?uJSDfYluhtzIdYAcwSjJVkHW6hp5kqHLZZAhYB94S6AVjzz/RQWY8ruJTYWe?=
 =?us-ascii?Q?7+t9r4rk1n/DIiwmza93QeYvKGAzC5oc8xqpZiJBIPXUVuIkRnY1AIa7KZGI?=
 =?us-ascii?Q?0+BdQEaE47mRj0EUHkixoPtlaaNGgU2ocZYDtH/D6pfkiFudWJh+tqWZLIUY?=
 =?us-ascii?Q?AgG0BakCzTfxXVWrue3xnby5gG4hB0mgfCFSKy6+55ejO4J7L6rsYgMn+D6C?=
 =?us-ascii?Q?Ctnlx6X2TnBT3hqnYoBuYH3MSqowtMUld9XEnh1L70BGlspTYouOwvA8gf2v?=
 =?us-ascii?Q?S7dZEWkXng1SJ88z6fXlrFm0yMKEnBE40D1Wc6iLekHJhT36myStmGmIQj3/?=
 =?us-ascii?Q?BS2a7iAC9CRqNMJtI2dw4iy1POppVhmiWwPt79wP9jXHIzefgtGZSDCimWBn?=
 =?us-ascii?Q?yzeyP8n2BIIpVfHwUKzW/I6fLtmuLdvUnQS7+cUdG7zpZWQrm2QM5iTrnFkg?=
 =?us-ascii?Q?KU5u4m8S2a5+I72Xbwsl7vGO16OZ8Rl4590ThZ7umcZNCuIRzYWWWgGioDEZ?=
 =?us-ascii?Q?hjnw+x7hAsJVseL+HE6lREQhAVipDRcyX1oQbSrcE+aIHwI0KE/P3Tf4Df31?=
 =?us-ascii?Q?rAYr8Tmr4b4QPKyAfUjk+rCZCsTjcoJNeUxIo+WwnR67/9bAIFxLqBWdB2Ii?=
 =?us-ascii?Q?YFmi6r8tzQPmg7MOhZoUeyDKCvF18qdAQDw8OkhEPgBcSktfdYcWqTZbifAR?=
 =?us-ascii?Q?SkLLFub762jiFyFIHNlvS2fcZsvTrFDgV8wDQITNafuK1DRBUy6JfwAybg8p?=
 =?us-ascii?Q?ye4J8bnInxWjcFixMkcXOgEH9IGwiPViWm9DdxBHON/jrFujNOHKqtPG2dzZ?=
 =?us-ascii?Q?zAV60Bm2Igvdwv7jN5+DbEfG5i1AJF4/0SFV+/ueZu3roX3sdhIxQ/q1kMu5?=
 =?us-ascii?Q?ol2xnG/RnlVN1yT1m6bHrRhM17sz9tXYAUb5/jY0AykrXlq9vXm312Fef1ZU?=
 =?us-ascii?Q?pIA7yxwZ1fG+CpBATEIwIW+QTZdy1w7d94D6aG53wNijpSPe8diw+hCl7kDn?=
 =?us-ascii?Q?+AOWYSxr1wWpYmh+i9WJ9xjrcH/iAjZ1PkQhDwZzrSqa4p1jNhuDDA4iexsV?=
 =?us-ascii?Q?m/e0JD1CCrXytkr+1FjzpJ0oEbBdu/XQRbDGy9UTwA7Kn98RgA/1j5mIjp6K?=
 =?us-ascii?Q?SEb+LxhjxtkIKyCgu+DsG0dkoFMUbdDqH7vscGRQa1gS7MSqrh/aO7ieeNhs?=
 =?us-ascii?Q?t89PY6qktJbiN4Dt2aZmvtnBh+eTFyCAS+dowYNMZx9hzJ4Fy8a16m+ktdWp?=
 =?us-ascii?Q?/M0WcjDphJMYvz7xI6/6FMcTXcaeTi1PpnE4eQzHljPnjzbyufFbMrJb4YZr?=
 =?us-ascii?Q?DN6cor29ez6Ok79VCCRf7ar9om/mpvkQgrnSnCc0WagIQAsl3v1ZXfIV8lOD?=
 =?us-ascii?Q?dSjAA958kz0MPCCDPDLS2UQUk0QOTEDuQPMmaTrTdkedJjX8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a82735-97e9-4dfd-7b4d-08d9a9ae012a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:25.9900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOU0ycEpY6MbAZCp/JEFYyVYvVQkkLJSiKmyFEGPeYd13MI4OCZmce9eR2GAtFxtNdWYrM98BwDzE/oyAHF3wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3039
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

From: V sujith kumar Reddy <vsreddy@amd.com>

Add trace support and configure trace stream for ACP firmware.

Signed-off-by: Vishnuvardhanrao Ravuapati <vishnuvardhanrao.ravulapati@amd.com>
Signed-off-by: V sujith kumar Reddy <vsreddy@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/Makefile    |  2 +-
 sound/soc/sof/amd/acp-trace.c | 84 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.h       |  5 +++
 sound/soc/sof/amd/renoir.c    |  4 ++
 4 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/amd/acp-trace.c

diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
index b27ce50014b8..7b9f1a0af3c8 100644
--- a/sound/soc/sof/amd/Makefile
+++ b/sound/soc/sof/amd/Makefile
@@ -4,7 +4,7 @@
 #
 # Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
 
-snd-sof-amd-acp-objs := acp.o acp-loader.o acp-ipc.o acp-pcm.o acp-stream.o
+snd-sof-amd-acp-objs := acp.o acp-loader.o acp-ipc.o acp-pcm.o acp-stream.o acp-trace.o
 snd-sof-amd-renoir-objs := pci-rn.o renoir.o
 
 obj-$(CONFIG_SND_SOC_SOF_AMD_COMMON) += snd-sof-amd-acp.o
diff --git a/sound/soc/sof/amd/acp-trace.c b/sound/soc/sof/amd/acp-trace.c
new file mode 100644
index 000000000000..fa4da8947186
--- /dev/null
+++ b/sound/soc/sof/amd/acp-trace.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+//
+// Authors: Vishnuvardhanrao Ravuapati <vishnuvardhanrao.ravulapati@amd.com>
+//	    V Sujith Kumar Reddy <Vsujithkumar.Reddy@amd.com>
+
+/*This file support Host TRACE Logger driver callback for SOF FW */
+
+#include "acp.h"
+
+#define ACP_LOGGER_STREAM	8
+#define NUM_PAGES		16
+
+int acp_sof_trace_release(struct snd_sof_dev *sdev)
+{
+	struct acp_dsp_stream *stream;
+	struct acp_dev_data *adata;
+	int ret;
+
+	adata = sdev->pdata->hw_pdata;
+	stream = adata->dtrace_stream;
+	ret = acp_dsp_stream_put(sdev, stream);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Failed to release trace stream\n");
+		return ret;
+	}
+
+	adata->dtrace_stream = NULL;
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_sof_trace_release, SND_SOC_SOF_AMD_COMMON);
+
+static int acp_sof_trace_prepare(struct snd_sof_dev *sdev,
+				 struct sof_ipc_dma_trace_params_ext *params)
+{
+	struct acp_dsp_stream *stream;
+	struct acp_dev_data *adata;
+	int ret;
+
+	adata = sdev->pdata->hw_pdata;
+	stream = adata->dtrace_stream;
+	stream->dmab = &sdev->dmatb;
+	stream->num_pages = NUM_PAGES;
+
+	ret = acp_dsp_stream_config(sdev, stream);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Failed to configure trace stream\n");
+		return ret;
+	}
+
+	params->buffer.phy_addr = stream->reg_offset;
+	params->stream_tag = stream->stream_tag;
+
+	return 0;
+}
+
+int acp_sof_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag)
+{
+	struct sof_ipc_dma_trace_params_ext *params;
+	struct acp_dsp_stream *stream;
+	struct acp_dev_data *adata;
+	int ret;
+
+	adata = sdev->pdata->hw_pdata;
+	stream = acp_dsp_stream_get(sdev, ACP_LOGGER_STREAM);
+	if (!stream)
+		return -ENODEV;
+
+	adata->dtrace_stream = stream;
+	params = container_of(stream_tag, struct sof_ipc_dma_trace_params_ext, stream_tag);
+	ret = acp_sof_trace_prepare(sdev, params);
+	if (ret < 0) {
+		acp_dsp_stream_put(sdev, stream);
+		return ret;
+	}
+
+	*stream_tag = stream->stream_tag;
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_sof_trace_init, SND_SOC_SOF_AMD_COMMON);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 5f6e9eff116a..fd923f72a01a 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -139,6 +139,7 @@ struct acp_dev_data {
 	u8 *data_buf;
 	struct dma_descriptor dscr_info[ACP_MAX_DESC];
 	struct acp_dsp_stream stream_buf[ACP_MAX_STREAM];
+	struct acp_dsp_stream *dtrace_stream;
 };
 
 void memcpy_to_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *src, size_t bytes);
@@ -197,4 +198,8 @@ extern const struct snd_sof_dsp_ops sof_renoir_ops;
 
 /* Machine configuration */
 int snd_amd_acp_find_config(struct pci_dev *pci);
+
+/* Trace */
+int acp_sof_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag);
+int acp_sof_trace_release(struct snd_sof_dev *sdev);
 #endif
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 3cd269bfe75d..43037109e130 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -173,6 +173,10 @@ const struct snd_sof_dsp_ops sof_renoir_ops = {
 	.machine_select		= amd_sof_machine_select,
 	.machine_register	= sof_machine_register,
 	.machine_unregister	= sof_machine_unregister,
+
+	/* Trace Logger */
+	.trace_init		= acp_sof_trace_init,
+	.trace_release		= acp_sof_trace_release,
 };
 EXPORT_SYMBOL(sof_renoir_ops);
 
-- 
2.27.0

