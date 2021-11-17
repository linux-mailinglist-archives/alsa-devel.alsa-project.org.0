Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70034543F1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:40:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77A27185B;
	Wed, 17 Nov 2021 10:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77A27185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142027;
	bh=+OFKOxkIQMnrB2Jp24B2LFWr2aJmMcuVP0PZvRmWvvE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CjNZiK1PIByge16Ls1soY3V064TXPbgIKKsZPADQsYarf8KXYeyeVlWJGrIM1XwzR
	 R++wIGOsCXpGDNu+A6uH9Yh5pNHokR7Rl9rSd70XfGTkbGrQdkUMJqTIDezo10KopZ
	 pLX7Fq72Nhsf5P6Fv+4F/CrafdAWcfjjRAPG3LLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D325F804F3;
	Wed, 17 Nov 2021 10:38:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 689F8F804BB; Wed, 17 Nov 2021 10:38:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D392F8020D
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D392F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="eSA15jq+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYTAf7C7GGl1xH+Y269mLApb3apoOtmDu7VrAhwVYiWI264Oy4dyBl4Eubv/z9U8tSHYZxW4D7LK3UQJm4DiTe0OaDhyO70GfOc7qDbbZ8Dpb7tQvdwby4nVpe6eZwV04f/XF4vP75mVsN5HCZfZVM4TdixyTIpsvl+0Aema0Z5NA77sdCS6HQg0EzCEQ1JqzayQeWGPhcEf19Gd8QnEjCWFZt53ySPAtBPSTBH2sOF5CAskObcS4PW7wkUd6C1PV6c/lkIYdFvhXs6EdZ9cjYUD06BXw3n9fXNd3IdKS1uez1aiNN3Xgv1y4zVN0SEfNEnQRS0eEWNNZkayq5taQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SQtkRTR8criD+o3nbzDMRFdBeLReV2MJHMMi1lIszc=;
 b=V98aV9gSTUEU1M5UXFpbTGRdkADSaezuftI8quxyMWj+goIQOXnsKGiBVpYalxI0/wXt99RX/hSzseVGAIBANYYgfE2KvWPYPimldGnKBsnoLLfqEH3YvlTpHv0TMfrApjtUiJaIj5fhreHZoxoceZA24gQiVyuIjqCwJGabM8pnPX9wZLiqceSUW2fE/AWeVKmM2KqliEXxIiCBGAKLbLGur9Ub5SqLR0EXQ2R0CFLk+UeU8rREZLq3I3sTGQN5rolaj663X6FMxrj0qfe0EjFVcXMJf1CPDhBNWtKkn/DjuJgpjnqXC4uHMfQmyECP+li9j7R+jqx2cE9R1m0d5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SQtkRTR8criD+o3nbzDMRFdBeLReV2MJHMMi1lIszc=;
 b=eSA15jq+m8sayMrezYYRXq6gUI7FilhVAO1nXHZ3d+q0GEWWJJXD39NPz6692Sx37L5EW2968AyrKMiiTllN8QoZzhGW5gQpUJMhmyJTLmGBFVaCDpSn7YDjELzTuomE+pY6faDmauI/0qIRdYR+YTw7u3uCY4PFl2OnQ2djz4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 09:38:09 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:09 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 03/21] ASoC: SOF: amd: Add fw loader and renoir dsp ops to
 load firmware
Date: Wed, 17 Nov 2021 11:37:16 +0200
Message-Id: <20211117093734.17407-4-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e3a6d6e-3106-4273-4cc4-08d9a9adf72a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5807B5A0FCFFC5C251F49124B89A9@VI1PR04MB5807.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHFRhCc7XTceA19Jol4MMeWoDAAMSVudzd4NZr0Uoev/hKHS8x6OF8HaHWUE5lQRN9RNc7IhivUeF0S9Z4fVocabvQ2dq2PYoso3Kso9JKpIU2LmoTDgos3uQwneMw0EyV+BK6wAPayW627DlPpE/P+L0YarVUW+MWcWV1A8caJmgOLwxnYgnRmMUKgwkt+3Zf+UDDOSWSK3h7/MkZBF9WDYSb4SIuhK6e/6kHer4siHaCuArke+zpgTwCfsZf2i5kqrbgeD/pApDz2MNqVPdO24KRt+ZShAjRvQO78O2rTreAnpLz3Pl5c3NyjoRhCUZm5EsehbknFPMous+aLwPE0OiC6sBUBF8jJXVhyR3aw/ubTs6J3dSyLZv7GAd2BVOQHOcGUoM6OM19rRyfkvdpgZTPAx3qdd4io4i/7M6NwgsHhwjVwdgdIJii9009gOKd9lJ6I9JpcEBm/qPzAZOMRO7l3xK6d55h2LAfAlaMGG0ifx4NfSCf2rnk8r6pXmk3Ep9btGA1OVrH7kjl4FO+3nxbWajfg0RPF3HdMTwL6V8kvzA0GBDnIfQ2MEHfeeVLmgebcnRUFGz58IHAFEfGspoZXwOTf3E6xpheCOk+q1ARKBnjteJhzDaLpPYkE/Gn1aCet3/ws1xSc4cUjLCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(5660300002)(508600001)(52116002)(86362001)(8676002)(54906003)(8936002)(66946007)(186003)(6512007)(2906002)(6666004)(6486002)(7416002)(6506007)(1076003)(2616005)(66556008)(66476007)(44832011)(83380400001)(38100700002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UziMQVqiKB5clcesK5+dXrGcBOvF/ndvUXhRrEXNvp5LlSKfbhwrfPWB1IrT?=
 =?us-ascii?Q?tur4IT+/l9VQ2uOt/bZFsaRw241NZjgizPXVXCIVu1032+Zc10YSnJT/dztD?=
 =?us-ascii?Q?nu8WvkSsciYu0PyHDbUd4GP1Jc0uwFB8ltfEuv6aNH92mf/1SAaE7r2VTDol?=
 =?us-ascii?Q?DIGqRLBXjSs5imG0fEadlFJjBZG8jqUd0yRwfKTeiAM5NKVyDClr7e9UAaJB?=
 =?us-ascii?Q?ET9SuytX4ilPSm0vcOiscco5jfxDXTrHqsS/NoqAL4c32WzqoJinVf3qidFO?=
 =?us-ascii?Q?QEjWi66N/npju7kNfU5K3qpoY40+Dxs1Us2sjEIKbqBY7emrYEHZH/0BbTm3?=
 =?us-ascii?Q?/mvFT+FtvX3HZLZ3r8vGNQ24ehcfmemfTORH7wwgClPIvLphQcofUleqR0Py?=
 =?us-ascii?Q?mW6fjjIcWpMM6wiTff5z7KeQKfGe7AU7R/MRyvQRMKB56yWU9JPIGaDGdqyw?=
 =?us-ascii?Q?HMb6rAOz5qdC5P38A1yb9tjor+h77WAFhXlt9MDKtfXIQDlub1COS9P8O9kZ?=
 =?us-ascii?Q?lL/oSz7jzh2bsvEjT3HmF6XClN8bGyYLEnn01rdgu1iuIfx0GvHW9a25pmg2?=
 =?us-ascii?Q?vM+sticAirUZ8C6n1v6byyQr2Qy12hf3w5LanNscjmVhfi2F7qHukCguYwjN?=
 =?us-ascii?Q?tXB6MSJKYQKVst7CJbTntd0JSFx8AKXsVU6p7GDSlIMXai+sfk5ldNeqxzry?=
 =?us-ascii?Q?jOCrKfHHxItZMtPIWgkS/G3EVydwTnBV8MO7JA6biNjD7QeTqUpWKtAMf6Xh?=
 =?us-ascii?Q?5SDLoZbwnx7/DI0Hdij1/g1XmKv8sOVMJUXqTSHDlPXWFNw/48FG0UwbKVs8?=
 =?us-ascii?Q?LGqUU4COWlHygxsYRi+koN5cUM156/ZaVfjtNuKhUF1drOq/xxL3GiWwEkLJ?=
 =?us-ascii?Q?I14eGAj3zoCLhdeehykOyAxwDt0jIepIsTtnmicyOI8l/Sv5d+nAJFiHBkxM?=
 =?us-ascii?Q?WGaDhJZk9WyMhMXBTv/yR+2MUQc+0j9OTgaR+3l2I9DHgfpoByW49LQSml6B?=
 =?us-ascii?Q?xA5SnYMf+9X9wmGEjBeOfATizJ9+M/kgXrJvo5Y10yt0WIEYjDTWEIxRwrk4?=
 =?us-ascii?Q?F4xFVxJEBMRIZ3VbfBkuLv1IH6PMD4LAl3ElSJxjcdAYPo4pPMiPHVo1za4J?=
 =?us-ascii?Q?vxi80in2nUwkbF8ZqqKP8TSanSQ3IEyIN5dmQCfkRY9CFSGnyLOVo0iHVi6x?=
 =?us-ascii?Q?046Hu++amnwuxyNl7rvp8El/svKRvoLEDLcWoeJXNDH+umcHqmX9NscEuvKP?=
 =?us-ascii?Q?dl+oVbinQyLfCzArk4in8hSg6eWSP3zYh/ubnY5vvGmY2Z/DWii2TMnmevuf?=
 =?us-ascii?Q?f67x10HCjKv638bWenNwXqvLbmHdwjto/9IYCvqKpSGdMPDPeXU5rIx0v6XC?=
 =?us-ascii?Q?D7CFhcf0pqusfVEbgwjPpcBd2BKNJ/bsV7jC4/NE2A9fKLNM4bKOK5dPzVid?=
 =?us-ascii?Q?Ff+lZSF4rkbaGOlSs59Q+Lbn98Umx8MTu9/D1wy6PRsBLm7orMQo6zPmCClm?=
 =?us-ascii?Q?0nLcVABlSymjKRSRauz+xC9v0VupDsZSg5aHiy5u9+qkVsEoakjWPt7f0c0Q?=
 =?us-ascii?Q?OtD+gy3rqrbbBqZkOdEDYpNCUulLbTeCuf0kds2EaeIPUdU0+xznS3kQICCE?=
 =?us-ascii?Q?y3Jzh6D8Cs9xXkz7EcLQAUOQ70aj/Agdu9rgMPT89TIRMk9Lf5CyIQ6yGebj?=
 =?us-ascii?Q?gf8QmkN1zbY9DeTzXwnnhyosX2zVJ3wSfUeoLJ75oFzGigRK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3a6d6e-3106-4273-4cc4-08d9a9adf72a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:09.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yZgMX0bmmdx4ogHhNzOiA0L7erokEZWgTHcv5vagxbw7nozYCHRtflmME0kTn/HeMqyLZpFX231qZi7NsMjag==
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

Add acp-loader module with ops callback to load and run firmware
on ACP DSP block on Renoir platform.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/Makefile         |   2 +-
 sound/soc/sof/amd/acp-dsp-offset.h |   3 +
 sound/soc/sof/amd/acp-loader.c     | 199 +++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.h            |  27 ++++
 sound/soc/sof/amd/renoir.c         |  15 +++
 5 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/amd/acp-loader.c

diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
index ac2ecd21be5f..031fb9493876 100644
--- a/sound/soc/sof/amd/Makefile
+++ b/sound/soc/sof/amd/Makefile
@@ -4,7 +4,7 @@
 #
 # Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
 
-snd-sof-amd-acp-objs := acp.o
+snd-sof-amd-acp-objs := acp.o acp-loader.o
 snd-sof-amd-renoir-objs := renoir.o
 
 obj-$(CONFIG_SND_SOC_SOF_AMD_COMMON) += snd-sof-amd-acp.o
diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index bfb02390b414..f4bc7e9abafb 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -24,6 +24,9 @@
 #define ACP_DMA_CH_GROUP			0xEC
 #define ACP_DMA_CH_RST_STS			0xF0
 
+/* Registers from ACP_DSP_0 block */
+#define ACP_DSP0_RUNSTALL			0x414
+
 /* Registers from ACP_AXI2AXIATU block */
 #define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1		0xC00
 #define ACPAXI2AXI_ATU_BASE_ADDR_GRP_1		0xC04
diff --git a/sound/soc/sof/amd/acp-loader.c b/sound/soc/sof/amd/acp-loader.c
new file mode 100644
index 000000000000..2dc15ae38155
--- /dev/null
+++ b/sound/soc/sof/amd/acp-loader.c
@@ -0,0 +1,199 @@
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
+ * Hardware interface for ACP DSP Firmware binaries loader
+ */
+
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "../ops.h"
+#include "acp-dsp-offset.h"
+#include "acp.h"
+
+#define FW_BIN		0
+#define FW_DATA_BIN	1
+
+#define FW_BIN_PTE_OFFSET	0x00
+#define FW_DATA_BIN_PTE_OFFSET	0x08
+
+#define ACP_DSP_RUN	0x00
+
+int acp_dsp_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
+		       u32 offset, void *dest, size_t size)
+{
+	switch (blk_type) {
+	case SOF_FW_BLK_TYPE_SRAM:
+		offset = offset - ACP_SCRATCH_MEMORY_ADDRESS;
+		memcpy_from_scratch(sdev, offset, dest, size);
+		break;
+	default:
+		dev_err(sdev->dev, "bad blk type 0x%x\n", blk_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_dsp_block_read, SND_SOC_SOF_AMD_COMMON);
+
+int acp_dsp_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
+			u32 offset, void *src, size_t size)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	struct acp_dev_data *adata;
+	void *dest;
+	u32 dma_size, page_count;
+	unsigned int size_fw;
+
+	adata = sdev->pdata->hw_pdata;
+
+	switch (blk_type) {
+	case SOF_FW_BLK_TYPE_IRAM:
+		if (!adata->bin_buf) {
+			size_fw = plat_data->fw->size;
+			page_count = PAGE_ALIGN(size_fw) >> PAGE_SHIFT;
+			dma_size = page_count * ACP_PAGE_SIZE;
+			adata->bin_buf = dma_alloc_coherent(&pci->dev, dma_size,
+							    &adata->sha_dma_addr,
+							    GFP_ATOMIC);
+			if (!adata->bin_buf)
+				return -ENOMEM;
+		}
+		adata->fw_bin_size = size + offset;
+		dest = adata->bin_buf + offset;
+		break;
+	case SOF_FW_BLK_TYPE_DRAM:
+		if (!adata->data_buf) {
+			adata->data_buf = dma_alloc_coherent(&pci->dev,
+							     ACP_DEFAULT_DRAM_LENGTH,
+							     &adata->dma_addr,
+							     GFP_ATOMIC);
+			if (!adata->data_buf)
+				return -ENOMEM;
+		}
+		dest = adata->data_buf + offset;
+		adata->fw_data_bin_size = size + offset;
+		break;
+	case SOF_FW_BLK_TYPE_SRAM:
+		offset = offset - ACP_SCRATCH_MEMORY_ADDRESS;
+		memcpy_to_scratch(sdev, offset, src, size);
+		return 0;
+	default:
+		dev_err(sdev->dev, "bad blk type 0x%x\n", blk_type);
+		return -EINVAL;
+	}
+
+	memcpy(dest, src, size);
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_dsp_block_write, SND_SOC_SOF_AMD_COMMON);
+
+int acp_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+{
+	return type;
+}
+EXPORT_SYMBOL_NS(acp_get_bar_index, SND_SOC_SOF_AMD_COMMON);
+
+static void configure_pte_for_fw_loading(int type, int num_pages, struct acp_dev_data *adata)
+{
+	struct snd_sof_dev *sdev;
+	unsigned int low, high;
+	dma_addr_t addr;
+	u16 page_idx;
+	u32 offset;
+
+	sdev = adata->dev;
+
+	switch (type) {
+	case FW_BIN:
+		offset = FW_BIN_PTE_OFFSET;
+		addr = adata->sha_dma_addr;
+		break;
+	case FW_DATA_BIN:
+		offset = adata->fw_bin_page_count * 8;
+		addr = adata->dma_addr;
+		break;
+	default:
+		dev_err(sdev->dev, "Invalid data type %x\n", type);
+		return;
+	}
+
+	for (page_idx = 0; page_idx < num_pages; page_idx++) {
+		low = lower_32_bits(addr);
+		high = upper_32_bits(addr);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + offset, low);
+		high |= BIT(31);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + offset + 4, high);
+		offset += 8;
+		addr += PAGE_SIZE;
+	}
+}
+
+/* pre fw run operations */
+int acp_dsp_pre_fw_run(struct snd_sof_dev *sdev)
+{
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	struct acp_dev_data *adata;
+	unsigned int src_addr, size_fw;
+	u32 page_count, dma_size;
+	int ret;
+
+	adata = sdev->pdata->hw_pdata;
+	size_fw = adata->fw_bin_size;
+
+	page_count = PAGE_ALIGN(size_fw) >> PAGE_SHIFT;
+	adata->fw_bin_page_count = page_count;
+
+	configure_pte_for_fw_loading(FW_BIN, page_count, adata);
+	ret = configure_and_run_sha_dma(adata, adata->bin_buf, ACP_SYSTEM_MEMORY_WINDOW,
+					ACP_IRAM_BASE_ADDRESS, size_fw);
+	if (ret < 0) {
+		dev_err(sdev->dev, "SHA DMA transfer failed status: %d\n", ret);
+		return ret;
+	}
+	configure_pte_for_fw_loading(FW_DATA_BIN, ACP_DRAM_PAGE_COUNT, adata);
+
+	src_addr = ACP_SYSTEM_MEMORY_WINDOW + page_count * ACP_PAGE_SIZE;
+	ret = configure_and_run_dma(adata, src_addr, ACP_DATA_RAM_BASE_ADDRESS,
+				    adata->fw_data_bin_size);
+	if (ret < 0) {
+		dev_err(sdev->dev, "acp dma configuration failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = acp_dma_status(adata, 0);
+	if (ret < 0)
+		dev_err(sdev->dev, "acp dma transfer status: %d\n", ret);
+
+	/* Free memory once DMA is complete */
+	dma_size =  (PAGE_ALIGN(plat_data->fw->size) >> PAGE_SHIFT) * ACP_PAGE_SIZE;
+	dma_free_coherent(&pci->dev, dma_size, adata->bin_buf, adata->sha_dma_addr);
+	dma_free_coherent(&pci->dev, ACP_DEFAULT_DRAM_LENGTH, adata->data_buf, adata->dma_addr);
+	adata->bin_buf = NULL;
+	adata->data_buf = NULL;
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(acp_dsp_pre_fw_run, SND_SOC_SOF_AMD_COMMON);
+
+int acp_sof_dsp_run(struct snd_sof_dev *sdev)
+{
+	int val;
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DSP0_RUNSTALL, ACP_DSP_RUN);
+	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DSP0_RUNSTALL);
+	dev_dbg(sdev->dev, "ACP_DSP0_RUNSTALL : 0x%0x\n", val);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_sof_dsp_run, SND_SOC_SOF_AMD_COMMON);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index ff01d0ef67ef..e755a31374c6 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -11,6 +11,8 @@
 #ifndef __SOF_AMD_ACP_H
 #define __SOF_AMD_ACP_H
 
+#include "../sof-priv.h"
+
 #define ACP_DSP_BAR	0
 
 #define ACP_REG_POLL_INTERVAL                   500
@@ -39,6 +41,13 @@
 #define ACP_MAX_DESC				128
 #define ACPBUS_REG_BASE_OFFSET			ACP_DMA_CNTL_0
 
+#define ACP_DEFAULT_DRAM_LENGTH			0x00080000
+#define ACP_SCRATCH_MEMORY_ADDRESS		0x02050000
+#define ACP_SYSTEM_MEMORY_WINDOW		0x4000000
+#define ACP_IRAM_BASE_ADDRESS			0x000000
+#define ACP_DATA_RAM_BASE_ADDRESS		0x01000000
+#define ACP_DRAM_PAGE_COUNT			128
+
 struct  acp_atu_grp_pte {
 	u32 low;
 	u32 high;
@@ -106,6 +115,13 @@ struct  scratch_reg_conf {
 /* Common device data struct for ACP devices */
 struct acp_dev_data {
 	struct snd_sof_dev  *dev;
+	unsigned int fw_bin_size;
+	unsigned int fw_data_bin_size;
+	u32 fw_bin_page_count;
+	dma_addr_t sha_dma_addr;
+	u8 *bin_buf;
+	dma_addr_t dma_addr;
+	u8 *data_buf;
 	struct dma_descriptor dscr_info[ACP_MAX_DESC];
 };
 
@@ -123,5 +139,16 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 int amd_sof_acp_probe(struct snd_sof_dev *sdev);
 int amd_sof_acp_remove(struct snd_sof_dev *sdev);
 
+/* DSP Loader callbacks */
+int acp_sof_dsp_run(struct snd_sof_dev *sdev);
+int acp_dsp_pre_fw_run(struct snd_sof_dev *sdev);
+int acp_get_bar_index(struct snd_sof_dev *sdev, u32 type);
+
+/* Block IO callbacks */
+int acp_dsp_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
+			u32 offset, void *src, size_t size);
+int acp_dsp_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
+		       u32 offset, void *dest, size_t size);
+
 extern const struct snd_sof_dsp_ops sof_renoir_ops;
 #endif
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 3d1dc6c2fa9b..bca80784b322 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -26,6 +26,21 @@ const struct snd_sof_dsp_ops sof_renoir_ops = {
 	/* Register IO */
 	.write			= sof_io_write,
 	.read			= sof_io_read,
+
+	/* Block IO */
+	.block_read		= acp_dsp_block_read,
+	.block_write		= acp_dsp_block_write,
+
+	/* Module loading */
+	.load_module		= snd_sof_parse_module_memcpy,
+
+	/*Firmware loading */
+	.load_firmware		= snd_sof_load_firmware_memcpy,
+	.pre_fw_run		= acp_dsp_pre_fw_run,
+	.get_bar_index		= acp_get_bar_index,
+
+	/* DSP core boot */
+	.run			= acp_sof_dsp_run,
 };
 EXPORT_SYMBOL(sof_renoir_ops);
 
-- 
2.27.0

