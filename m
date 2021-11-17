Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0D45440E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:44:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E9A1852;
	Wed, 17 Nov 2021 10:43:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E9A1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142252;
	bh=dc6hSE2mynOP9p1gEVAnoHi2YtNzKfD8PlI/atIKshM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hEd78bcDDkBmdaN5/ABuwIOS0MEo0mUz2+7nHOpJ5ppG55fn6tywn+OcIXL08J2u+
	 zaqWP/YLYNU2Sy6QXXLQOnXKV0JF8/JsHQk/M9iCimhlrXntrbuvuUq8KhZPAV6WLH
	 S4gGZiCkjEyONj39tXaTvNs6PikS4HLJIUaO7YkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D73CCF80579;
	Wed, 17 Nov 2021 10:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01253F80511; Wed, 17 Nov 2021 10:38:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15EBAF804F2
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15EBAF804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="g/wJomUE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdHXcVl9FYGmpN8iW6jO0QS4vSnKbE2BAWPMXZYkR9DTCePK7A0VQn5bFhFyBfQSqv8vZQAkPXBbG8cVamIkFvj5m3/gpvj+scxmFA9/0FTVXoX21GWhqJ47Batm/Ve5lCXeG9QI6gQuGSHBH1nwxcPrv+ZbTJXORSrDsbsve7G7SNOE8wHY+ikb/P+TWdtljDxffQuzEhRpOTwKu8Dd6u+YEdmZMawHbN/ovcPMdZ2Wp9MNMTMEXm1ONHTJgrUYKBSY1OSRF18oDROdsLCVW0X14TA8UGBbVaf5O6umEbNkxig4t6REuDBcvqVDEGZDb+VhnLEnxOIw78zSfDlmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gwhM+p/Qh9MxUQBcZKdscXRpH21CmBKxMOedlU7EjA=;
 b=bRbyiZB4zo+iiA2ZOvobCT4YuuQRckQqNhBfDYKKZ6Q/beDppzOFlFtBgP7xXzgrPNOllMqxE4ESB6hEEqHQWMQkXDQP4kCXSgj8MHYSz+UN+zKLpwCTQZpQMgPlA+jrVj8f36OUUGqZE3sbpcEZptbqjfJ0u1BNvOWlCT/MkhjYaoWlttmCbTxv4W22WI76bZjeQw4emcPEbj5HJID6wPa5seeUzhNDVS8kgqK+DAFrHaUfKEkQcfnz9+wOohRJodxYimuHmUA9OWPZycBsB5VN7gqc+33j41CDs52gwM9m7/nmbKwXI5KPoP8wtf0eIw/JQNgmX9FUJiN7xlt1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gwhM+p/Qh9MxUQBcZKdscXRpH21CmBKxMOedlU7EjA=;
 b=g/wJomUEZvGVvq1KrA4zHF8ROxW53k8M+Jo+ipNQUQENeUA5EEW5/Z6ATnQeUxHK3u+QZXUR531nOlLVLabQr0S27LJrnUNdZMdkWEdNmMkrORfqEUuah3FP1JxJBXnV4ehD5J26yl8ZFH4thkWClrBJDu3E2x/KnaPqSfJ7eH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3039.eurprd04.prod.outlook.com (2603:10a6:802:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 17 Nov
 2021 09:38:24 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:24 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 11/21] ASoC: SOF: topology: Add support for AMD ACP DAIs
Date: Wed, 17 Nov 2021 11:37:24 +0200
Message-Id: <20211117093734.17407-12-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ca7d98a-2e1b-4779-8d95-08d9a9ae0025
X-MS-TrafficTypeDiagnostic: VI1PR04MB3039:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB30399B3DEFAC358627F46799B89A9@VI1PR04MB3039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xaqcBDat9FgOb1agwmUzW8V0TZ4gGmgsPQhIbmrOZD8PdtJUESSSZ0f1af2Eel19cPcI3/Awwr3E9oIJLkMI3XCXUjz931gChD4qN25fzZyLw1U+ZGsP3qYAMdtI5pZPE3vVbIFFsxUzkzlo2whDhh4IO3ex1llKBqO2XElrYkr7sOcYKznEyU/fRXA39xKpc18YAKtyvNouO+H2c1fyLO2DeJYBmLedoV+0h6dZiaps78jY4OSnwjYVWl0JCbW4GFA0wP1GlUwp2Fbd9WBnUKPYg+keWTJUoI0hof8pAB6+Aa4LZ+SoK80+oE+ql4J9eMvGeuyYhW0uz+MFRzinI7BUwdHC/uDeYc4qTVz3UAt/RmL4aOebugP/8C+o8yMIeG3oANxQ7IsPDu80zyA+geyPFnNEo2QQXkgA0QeyBOh8q8/R65V2ImQoM9zeuW8AiBT9LbXUQeRr5DjuVTUaRU2FErgRFJz8VOPdbqjdYR0rDmfC33Md034E+vqvSvge7N6vo/oA3phbe+pz/22mWl8ygBf6CiVfkJy3pIirVjAanBQDEufxSb4XQg5WVNyUCgheCCbBPg3iLe4pLraEpU335NhDiM5r2MakbNNfFmv17cCNEvt33pYLjheGJzRrM6KLC4SFjocnAi1xq9y8yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(186003)(44832011)(52116002)(6486002)(5660300002)(66556008)(6512007)(6506007)(4326008)(7416002)(2616005)(8936002)(8676002)(1076003)(2906002)(66946007)(83380400001)(508600001)(86362001)(316002)(38100700002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DvI8s5bdm3Olj1ByBm0//mbZRntLjj/HYT6GlZF4XcjDdu7duG6+/ameNYuK?=
 =?us-ascii?Q?z/+FGywlWPeZWZRTiRJL/Fiz+sH0coPd/ncBpI9D7XaEQibCTCX7FAHFnUKr?=
 =?us-ascii?Q?6MyeO6l68IiZuJbrM+T5wDF06xTErlT9YbN5xVfPFj+uVNkQrhiFvXZRfKUy?=
 =?us-ascii?Q?IZ0hIszpmEjpMjJr6svJMqULnLdeuKzwsKh0DIwnnRlWDig1cbw8hDZ78TI/?=
 =?us-ascii?Q?BseJPfl1MQbF6uIaRqA8M2O8mBaESQO8Lj2G9Ch2NvzyTP5Oal1Ct+3W76J9?=
 =?us-ascii?Q?KN+/Gb/1Uiwjh4sUmU4W5LzgWEWk7C+z4wgGv7hYkTEBXYlXSljIwvazEt+J?=
 =?us-ascii?Q?I3co6hTHRiLx1JhOwVA0K8Vkups2cUDL9Xc8Uiams2AeKF1j34j2UzP8g38i?=
 =?us-ascii?Q?kMurvJW7Xkbscf84rMaK1z7sxY0gybK629MeU29o2Xxf/SJvqQJX8BnDkMd0?=
 =?us-ascii?Q?GjkjDSRILxmrX9wsg8A5K3t9klJYRcRqAaHwbNe5BidmImEBqWceIrL2QGKu?=
 =?us-ascii?Q?Ws/AeUTr3eQCcwSzCgh1GQ/tOZoZoPoEH+9tSn9YS9dN2VGH6l6jT47jPw1X?=
 =?us-ascii?Q?A1+ZkKKpsNdKWM7bFjm0cekdwdCJ1rbwlaNOxLHxfuRg9rpPWhVuR5abccDZ?=
 =?us-ascii?Q?fQmBBJ7KUW6Mqbr4+U71BXEIxtD8XIlwlpGsNDhiCuQDcejFmiqcHYb8+qEO?=
 =?us-ascii?Q?dnDb97sTyG57sIIoMuokTzROgxeqCt1nQpP1rhAzKaHTpZ98xn7dO+cgRAaM?=
 =?us-ascii?Q?ZmUkT4jRLP5ZPoovfL6SiTd9mzDWi6DERHK/9+bj3JRnxgFhF7g2F4GEVmNn?=
 =?us-ascii?Q?kWIJsIMOc9rKoildt8HgpT8VrVk5EZOjIG690a1RlfiXKgQtT2EMK231L9IY?=
 =?us-ascii?Q?7mHG4UARN0KLISG/on3gPgRXSPXK6/2MTnJQfRNVBo9bP4PIsaVHBYVrVFxJ?=
 =?us-ascii?Q?lT7lIW3sj5a2PElp/2AqgGAUm3gZipARsVw4MqFSf0ebt5dcu/L4E7LC7pCE?=
 =?us-ascii?Q?6+oBX2wbC8UiBGgSW1/DOKtcFyr3wTDdmJZqLUEcmH9RBE6WHcqRq+RE39Dg?=
 =?us-ascii?Q?XWqyfE/X5WYDMJts1dScTQflSwXPpB4Tyz1SxYLk5JI6GmlE6GGVGKTgmsaN?=
 =?us-ascii?Q?go0mphrmRYWM1Asx4FGUEq/UIv7b2AlQvZITHRk42G/m7dNLe/1ODJk2ysbh?=
 =?us-ascii?Q?6NJka1Y2WT9lKG67Goyzw3Fj6+dRb3BEb0f7ZZ4kKxtBG6uh2LKSZjpE/blG?=
 =?us-ascii?Q?aaBaIWgkm4nd0THELPL49AYwzB/8+iWgbRzLKXrKBHAzNBNSnOpJPxIGE9wG?=
 =?us-ascii?Q?90jaMWw+yilYYVH5/GNkojtVDqlCl5Tsa9rt/Qr+rNZUsnAXroi81HxT7WlN?=
 =?us-ascii?Q?oVQqVRmPX5fYdRMkUamRJer8SH0kQs5zXlr+NJoR9+wSjT2wwposR94z5OlC?=
 =?us-ascii?Q?a2Uc8qv7MVDDnXzDT92U1Pl2uGGFMi89NEgrWJ2c0YlUGywrl6gpAc6zfnBn?=
 =?us-ascii?Q?2NDWRItoitcq+E7Q6VmbZnRDFfHH/5UB7B0HpgekLmNOmvrGUtR47ur7glVi?=
 =?us-ascii?Q?YsfNhjs8wGUNM2YtmEjJmYLWr2dhZIrJXQTVe0CUuFyrv6jEsrWXgj4S9rK1?=
 =?us-ascii?Q?nxpB7dRTLD2D7RgVOJgN0TyovsqLHkBQSZv6Buf66azQD/As29+Z9V+PXa62?=
 =?us-ascii?Q?A1hmYkw3vLdO5+eItwMXEPgcBUOqRTzgkrmj/Fudz6mG8KNL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca7d98a-2e1b-4779-8d95-08d9a9ae0025
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:24.3579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTidUK08MVGs0n22NVaTM/ri6q0H8M80/d+iTAmgpAVtW5J6uIRT4D/TC7R7rM5RMILFqliF4zT9J2fn3djt/w==
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

Add new sof dais and config to pass topology file configuration
to SOF firmware running on ACP's DSP core. ACP firmware support
I2S_BT, I2S_SP and DMIC controller hence add three new dais to
the list of supported sof_dais

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/sound/sof/dai-amd.h |  21 +++++++
 include/sound/sof/dai.h     |   7 +++
 sound/soc/sof/pcm.c         |  36 ++++++++++++
 sound/soc/sof/topology.c    | 109 ++++++++++++++++++++++++++++++++++++
 4 files changed, 173 insertions(+)
 create mode 100644 include/sound/sof/dai-amd.h

diff --git a/include/sound/sof/dai-amd.h b/include/sound/sof/dai-amd.h
new file mode 100644
index 000000000000..90d09dbdd709
--- /dev/null
+++ b/include/sound/sof/dai-amd.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license. When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2021 Advanced Micro Devices, Inc.. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_DAI_AMD_H__
+#define __INCLUDE_SOUND_SOF_DAI_AMD_H__
+
+#include <sound/sof/header.h>
+
+/* ACP Configuration Request - SOF_IPC_DAI_AMD_CONFIG */
+struct sof_ipc_dai_acp_params {
+	struct sof_ipc_hdr hdr;
+
+	uint32_t fsync_rate;    /* FSYNC frequency in Hz */
+	uint32_t tdm_slots;
+} __packed;
+#endif
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 9625f47557b8..3782127a7095 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -12,6 +12,7 @@
 #include <sound/sof/header.h>
 #include <sound/sof/dai-intel.h>
 #include <sound/sof/dai-imx.h>
+#include <sound/sof/dai-amd.h>
 
 /*
  * DAI Configuration.
@@ -66,6 +67,9 @@ enum sof_ipc_dai_type {
 	SOF_DAI_INTEL_ALH,		/**< Intel ALH  */
 	SOF_DAI_IMX_SAI,		/**< i.MX SAI */
 	SOF_DAI_IMX_ESAI,		/**< i.MX ESAI */
+	SOF_DAI_AMD_BT,			/**< AMD ACP BT*/
+	SOF_DAI_AMD_SP,			/**< AMD ACP SP */
+	SOF_DAI_AMD_DMIC,		/**< AMD ACP DMIC */
 };
 
 /* general purpose DAI configuration */
@@ -90,6 +94,9 @@ struct sof_ipc_dai_config {
 		struct sof_ipc_dai_alh_params alh;
 		struct sof_ipc_dai_esai_params esai;
 		struct sof_ipc_dai_sai_params sai;
+		struct sof_ipc_dai_acp_params acpbt;
+		struct sof_ipc_dai_acp_params acpsp;
+		struct sof_ipc_dai_acp_params acpdmic;
 	};
 } __packed;
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index fa0bfcd2474e..8d313c9862cb 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -826,6 +826,42 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 			"channels_min: %d channels_max: %d\n",
 			channels->min, channels->max);
 		break;
+	case SOF_DAI_AMD_BT:
+		rate->min = dai->dai_config->acpbt.fsync_rate;
+		rate->max = dai->dai_config->acpbt.fsync_rate;
+		channels->min = dai->dai_config->acpbt.tdm_slots;
+		channels->max = dai->dai_config->acpbt.tdm_slots;
+
+		dev_dbg(component->dev,
+			"AMD_BT rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev,
+			"AMD_BT channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_AMD_SP:
+		rate->min = dai->dai_config->acpsp.fsync_rate;
+		rate->max = dai->dai_config->acpsp.fsync_rate;
+		channels->min = dai->dai_config->acpsp.tdm_slots;
+		channels->max = dai->dai_config->acpsp.tdm_slots;
+
+		dev_dbg(component->dev,
+			"AMD_SP rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev,
+			"AMD_SP channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_AMD_DMIC:
+		rate->min = dai->dai_config->acpdmic.fsync_rate;
+		rate->max = dai->dai_config->acpdmic.fsync_rate;
+		channels->min = dai->dai_config->acpdmic.tdm_slots;
+		channels->max = dai->dai_config->acpdmic.tdm_slots;
+
+		dev_dbg(component->dev,
+			"AMD_DMIC rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev,
+			"AMD_DMIC channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
 	default:
 		dev_err(component->dev, "error: invalid DAI type %d\n",
 			dai->dai_config->type);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index bb9e62bbe5db..72e671c15a34 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -376,6 +376,9 @@ static const struct sof_dai_types sof_dais[] = {
 	{"ALH", SOF_DAI_INTEL_ALH},
 	{"SAI", SOF_DAI_IMX_SAI},
 	{"ESAI", SOF_DAI_IMX_ESAI},
+	{"ACP", SOF_DAI_AMD_BT},
+	{"ACPSP", SOF_DAI_AMD_SP},
+	{"ACPDMIC", SOF_DAI_AMD_DMIC},
 };
 
 static enum sof_ipc_dai_type find_dai(const char *name)
@@ -2992,6 +2995,102 @@ static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+static int sof_link_acp_dmic_load(struct snd_soc_component *scomp, int index,
+				  struct snd_soc_dai_link *link,
+				  struct snd_soc_tplg_link_config *cfg,
+				  struct snd_soc_tplg_hw_config *hw_config,
+				  struct sof_ipc_dai_config *config)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	u32 size = sizeof(*config);
+	int ret;
+
+       /* handle master/slave and inverted clocks */
+	sof_dai_set_format(hw_config, config);
+
+	/* init IPC */
+	memset(&config->acpdmic, 0, sizeof(struct sof_ipc_dai_acp_params));
+	config->hdr.size = size;
+
+	config->acpdmic.fsync_rate = le32_to_cpu(hw_config->fsync_rate);
+	config->acpdmic.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
+
+	dev_info(scomp->dev, "ACP_DMIC config ACP%d channel %d rate %d\n",
+		 config->dai_index, config->acpdmic.tdm_slots,
+		 config->acpdmic.fsync_rate);
+
+	/* set config for all DAI's with name matching the link name */
+	ret = sof_set_dai_config(sdev, size, link, config);
+	if (ret < 0)
+		dev_err(scomp->dev, "ACP_DMIC failed to save DAI config for ACP%d\n",
+			config->dai_index);
+	return ret;
+}
+
+static int sof_link_acp_bt_load(struct snd_soc_component *scomp, int index,
+				struct snd_soc_dai_link *link,
+				struct snd_soc_tplg_link_config *cfg,
+				struct snd_soc_tplg_hw_config *hw_config,
+				struct sof_ipc_dai_config *config)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	u32 size = sizeof(*config);
+	int ret;
+
+	/* handle master/slave and inverted clocks */
+	sof_dai_set_format(hw_config, config);
+
+	/* init IPC */
+	memset(&config->acpbt, 0, sizeof(struct sof_ipc_dai_acp_params));
+	config->hdr.size = size;
+
+	config->acpbt.fsync_rate = le32_to_cpu(hw_config->fsync_rate);
+	config->acpbt.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
+
+	dev_info(scomp->dev, "ACP_BT config ACP%d channel %d rate %d\n",
+		 config->dai_index, config->acpbt.tdm_slots,
+		 config->acpbt.fsync_rate);
+
+	/* set config for all DAI's with name matching the link name */
+	ret = sof_set_dai_config(sdev, size, link, config);
+	if (ret < 0)
+		dev_err(scomp->dev, "ACP_BT failed to save DAI config for ACP%d\n",
+			config->dai_index);
+	return ret;
+}
+
+static int sof_link_acp_sp_load(struct snd_soc_component *scomp, int index,
+				struct snd_soc_dai_link *link,
+				struct snd_soc_tplg_link_config *cfg,
+				struct snd_soc_tplg_hw_config *hw_config,
+				struct sof_ipc_dai_config *config)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	u32 size = sizeof(*config);
+	int ret;
+
+	/* handle master/slave and inverted clocks */
+	sof_dai_set_format(hw_config, config);
+
+	/* init IPC */
+	memset(&config->acpsp, 0, sizeof(struct sof_ipc_dai_acp_params));
+	config->hdr.size = size;
+
+	config->acpsp.fsync_rate = le32_to_cpu(hw_config->fsync_rate);
+	config->acpsp.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
+
+	dev_info(scomp->dev, "ACP_SP config ACP%d channel %d rate %d\n",
+		 config->dai_index, config->acpsp.tdm_slots,
+		 config->acpsp.fsync_rate);
+
+	/* set config for all DAI's with name matching the link name */
+	ret = sof_set_dai_config(sdev, size, link, config);
+	if (ret < 0)
+		dev_err(scomp->dev, "ACP_SP failed to save DAI config for ACP%d\n",
+			config->dai_index);
+	return ret;
+}
+
 static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 			      struct snd_soc_dai_link *link,
 			      struct snd_soc_tplg_link_config *cfg,
@@ -3277,6 +3376,16 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	case SOF_DAI_IMX_ESAI:
 		ret = sof_link_esai_load(scomp, index, link, cfg, hw_config + curr_conf, config);
 		break;
+	case SOF_DAI_AMD_BT:
+		ret = sof_link_acp_bt_load(scomp, index, link, cfg, hw_config + curr_conf, config);
+		break;
+	case SOF_DAI_AMD_SP:
+		ret = sof_link_acp_sp_load(scomp, index, link, cfg, hw_config + curr_conf, config);
+		break;
+	case SOF_DAI_AMD_DMIC:
+		ret = sof_link_acp_dmic_load(scomp, index, link, cfg, hw_config + curr_conf,
+					     config);
+		break;
 	default:
 		dev_err(scomp->dev, "error: invalid DAI type %d\n", common_config.type);
 		ret = -EINVAL;
-- 
2.27.0

