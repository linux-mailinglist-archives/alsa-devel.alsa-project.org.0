Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F28704543F6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:40:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E63C1865;
	Wed, 17 Nov 2021 10:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E63C1865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142054;
	bh=0plfYqZYZMZsQMN/TO6FjNkHPUkACe+HWDYHukne2LQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bv4WNaPcsQEH4DjU1Ezz9f89AZVryNZEAvtOZStO4ScNXGfOCsRy+lZcEPjAaKTpR
	 akVHOlCNSh6Tm/dvMrJTc8PB0fhU+wG95NLT7GhGTtZCUtBCAdxjREq2OPpBP57ymC
	 5dhZ2S5Zwar0FPzccFhITjwryTfjxjQudAXCLBIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA07BF804FE;
	Wed, 17 Nov 2021 10:38:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D17AF8049C; Wed, 17 Nov 2021 10:38:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2D26F800FA
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D26F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="FBGz0DM8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVc/kOCPHvPmItdXXIm56McRzjz+UiZ3yQWLZG/5iaMSHHevR/JlUMXgaj/MN953dsIfhb3JyDlbgl4Ly8Pry4T10B/NURkj0XAY+q/2EywOTQd85dRsS4g1YVHVsydnBR0CdPnD27iIgJm0jjQ2PQQ6Jy6zYzAgfr6hl64HJ1JfncUdCOXPMs7LIcJUxzwP1vGAxz0kQwSjuRpIZY6EEJ/rxBx9hmxGwSpXTTovxE/64YyCHWhuraD4lutaRdSWWQhT3jg0XGcSmavmvoUVauAM+PnpXRiB5aACr2mKM0sMWRbewQuhCy4tmcyLj0N8ksM4YvOJwVDzno6S73EAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPdlo+6pwsRBvInyTokAcfakh2ZqdIgg14lFc9xY4YM=;
 b=RhifbhqZwmBYwxudg4aQ6u2SBOmXU7bfh6mCG/x0SDUVQGBU15Smqh/8DUT4UyZw5mp6rCfgLPHCFCI2Gi0ZFBJDpxCsMLl7945ObnmXZYDTerzRRDbDaubZZd0s9y5rnunwIIYbDeJPHVqKLegFQm6sc1OVG0SR3T72RJ9Xg9H24i/6Z/z6MDBInFLDdRDainqRjq8jlsI2/xL5xo1InW5jJ9LGhhB9rNJ/sdYjZDgjMQAp7exmetK5WevXyPK4b+chGhjQWGFM3DPX5NQQt+7P2w8K748Gma2wWye9qYbx6wkAQ9DB515InluULFiGYf3lipijpeFbqiaFFS+xZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPdlo+6pwsRBvInyTokAcfakh2ZqdIgg14lFc9xY4YM=;
 b=FBGz0DM8O9E7tmiHuf4XYED8VptPCyXwp372DhDER/7v/wzXHbjhn/dULulmz/JjSstQtVoMEjtTKt/GrUq1e6fEmOILl2J+fw1xUe0b2Z/BuCE23VloS6g86jzWOVRzCR8669jfeHyty8j+1aokn5MoMlYSQ6q7uzvtLWxhfUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 09:38:11 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:11 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 04/21] ASoC: SOF: amd: Add IPC support for ACP IP block
Date: Wed, 17 Nov 2021 11:37:17 +0200
Message-Id: <20211117093734.17407-5-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f748bd21-8c50-40d8-6945-08d9a9adf83d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5807FEB62DB4D3017766223EB89A9@VI1PR04MB5807.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbewlODu9LxKCt/NYU+ODqhh3TPJfFh2ws2Xyb0UgA7lDXzuDpzfXEA308/2stj4eXKe7FM81MfOccMpeq/FJmanwQhwyhUGNtFXtUGAUs8fNOUBP+sHionbQoVi7+O/VhufLf+AsQU3t9nBStUL0dyyxpurBFgxKBfEQ7Nd2Nhu9vtEWsQ6Did6FK329kwlD9xxYTtk18AlHATzo2Ckms36LZ4rVCyT5rePZGWl0bLr8/M4Jd/IuLgHCA05N+ZVTjJWzJ6oieMF3z4BgMqjDdFJO2HLIcV+YN42mv4i3F5lmsgJqkz3zmjG+uHB6X+Ol2Zt4+opHbQSpvlz2VuJxiK96pcjV+M6+5I0b3Cj9JDYEKAz7MTjxjwmpdxLtEHWsqzr5IyKG2sxtaxvnsGhxeoST/AOH4gvIMGPKkHFt/MwqwEaPwhvLSi974d68CZIrLIgbJNkDIWMzTsdNA2+VdQGmWA1UbmbM4WJaSucDq3IHM01NLmvu3Z4vse2DrzHX2XillXz8somI+Wy0OqxqfIHQs/ABOPJG7A2hMyh0jxxrME68G7pxSCWHmR8oDW+SHB6ehyR/kBXFEYIB55WmrVRYxktixwXwXsBalxx5er+yBqtbBDR/ui4CcIiWJ88CpFWjjGLOLnz77DyIlP8Cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(5660300002)(508600001)(52116002)(86362001)(8676002)(54906003)(8936002)(66946007)(186003)(6512007)(2906002)(6666004)(6486002)(7416002)(6506007)(30864003)(1076003)(2616005)(66556008)(66476007)(44832011)(83380400001)(38100700002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YUDBYC290lVBfFCsbUPgNsYzIOIhix0Syk75ZH9YK7MmQq7Z5PpssajCTc7f?=
 =?us-ascii?Q?s4pxTa4oDZ8Xkv8oqmEsKfX/Bx6STssXyDpA2sGHw3G2ed0Gfbx0NMT4757s?=
 =?us-ascii?Q?zbwQmScJ6pxPf7tpN/sDe1M74Wee0D+E3o+4ppL9YA5VL1KTe2KlxtX3d5sG?=
 =?us-ascii?Q?kXaaQxKq+UN8a6b3MjNm2O7gnZYeu3sdnNefTQJGYCydwt4c/ueUZCGmWlSM?=
 =?us-ascii?Q?b+qOav8zdyoULtwHJvfSs2ITP9+NbfwKBdM3xm7qv4EqnBgXPIhVCddhkCh7?=
 =?us-ascii?Q?+dgfaLn+U6H2ue0IQaSFsfjwxlJ2bqt9GNwivbbn+LQHIIrBln+/JAKdZsma?=
 =?us-ascii?Q?6vQiF82d4A+Qh7oJA5Q5z+1u+c0MoZCwOuzV+ctPynN53T6Uycj6mjdHjWSP?=
 =?us-ascii?Q?N0aP3yGpZeAV4kIfbaSgKsdx2q6AU7SBo+LnzJx9lU1hKYg4zTDYtW+8jwkZ?=
 =?us-ascii?Q?iakMM6GEOHLIwa4YEayzeSETptnKbZ478XLagbsjcEKK/u37pYMnMI0/iDUi?=
 =?us-ascii?Q?7l6Ley+miccqFyUwrbQ6/pjDJQEueWg1ksYJU2fnfalNOe7xQ0IiJ8+84mQc?=
 =?us-ascii?Q?yGtnbVpeL15nCwokkOjFh6e+0iLV2KRJ8vFbNzNmP/gr3zy3H4WQgrg8krJw?=
 =?us-ascii?Q?zRreblBD2W2qNTGpT91GDLQpYe33vE1U6XpEVspOtbysXDeYE7BiL8cjdioY?=
 =?us-ascii?Q?HjhNKjFkBLhIF9p609Bn2Kr8G43wSjFWUzRWWtwvcRcf7chhc/oWWBIpESE8?=
 =?us-ascii?Q?erMeumMHWWlbJQVTtB99v1JicOFfy0PC8tIEwSsxDupsf+4vqUpZKPcKiE8j?=
 =?us-ascii?Q?44SZJ/QIYlUhs7pNpfBxAugC6/7hY8BOlnejmW0nW7nJ/cTXKp+iOHkuQysh?=
 =?us-ascii?Q?Iz8IYX7RAP/SwZWTB2QoUO+DDJruE1b+lbc8UaWacyEypowLQTgzfFl+q/sY?=
 =?us-ascii?Q?xyCDi533u/k8hmeUKG6mDZ3Yjk/vNb3LqYEdKK/vFj2zwQjeb5ks/WBEokxN?=
 =?us-ascii?Q?g1k0s8PvtiXJ55jFK6Jcb+c1l8ZGBOy2Xfwnbv4uHHUeMVclQmb2IeObPGnd?=
 =?us-ascii?Q?LwzmQ/Pe6ermj4qJwoOJRlnn6BeTSpXP85EtjWz/4OjEsPguyMaDSoG/Z12x?=
 =?us-ascii?Q?052N+NDG3JSvdOKhWi9ga86wmkfNUj66j7OWVDuaOjXGkij7egqyyWaKiO2u?=
 =?us-ascii?Q?8YOBh4texSpKT95w49OHWzb9su4Pi+RhtX/hi5y+QTQRbz7MfoOO1i8Pirdo?=
 =?us-ascii?Q?Ksf9KkhMKKskQPEPXT2yCBzsqKHbNRj2Nj/ul/C+ShZy9ohllP0HPefgJQ2o?=
 =?us-ascii?Q?9suAdLzcAlyACgtBosY3ZMNYyVGYr+t/0Ujn0ad9QE4jC6LVrNjLRsiCK6lg?=
 =?us-ascii?Q?6uqSmUUK/dYXJjD6z5OuqcbqoTDfMp4Aw6vKzxfCwYrxlvn/TfyIqA1JGeV+?=
 =?us-ascii?Q?fINgHlLtc6/xz2uNPskq+9dQnl7eOGwbleQ2E7n7QeggicFwqk/TtfzJawA+?=
 =?us-ascii?Q?bRIsQmsPb4EUBiTA0Ljx13s2f6af3utlhUtQsGdjiV6FNsP0qSg+HZkfwMfI?=
 =?us-ascii?Q?g9ObdA3Vz5IC/BwvOQb/Cw3yajODFiPr7UmlDW5KCFqcG28e2qKQFuEoHRPy?=
 =?us-ascii?Q?fM3LLjCbK/KEQFt41qmuSK84n3kDqTlzbXZhWf1PioD/9zP7Sfh5i5wVhJrK?=
 =?us-ascii?Q?Kha3eOpVa1qAR4i5G0GXgcFpOSSETBu1/K2h9srIFCGclti1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f748bd21-8c50-40d8-6945-08d9a9adf83d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:11.0645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXxQ5mjpAU2uc0hWkrq2in0aTd2GilJvE+7mrwa1wIQ8Dn5G+/nA0KGlhKW8KG+EsulfnDaYSEPyJyGTfc4aOQ==
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

Add IPC module for generic ACP block and exposed ops callback for
to synchronize SOF IPC message between host and DSP

Signed-off-by: Balakishore Pati <Balakishore.pati@amd.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/Makefile         |   2 +-
 sound/soc/sof/amd/acp-dsp-offset.h |   2 +
 sound/soc/sof/amd/acp-ipc.c        | 187 +++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.c            |  44 ++++++-
 sound/soc/sof/amd/acp.h            |  15 +++
 sound/soc/sof/amd/renoir.c         |   8 ++
 6 files changed, 256 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/amd/acp-ipc.c

diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
index 031fb9493876..29928b16002f 100644
--- a/sound/soc/sof/amd/Makefile
+++ b/sound/soc/sof/amd/Makefile
@@ -4,7 +4,7 @@
 #
 # Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
 
-snd-sof-amd-acp-objs := acp.o acp-loader.o
+snd-sof-amd-acp-objs := acp.o acp-loader.o acp-ipc.o
 snd-sof-amd-renoir-objs := renoir.o
 
 obj-$(CONFIG_SND_SOC_SOF_AMD_COMMON) += snd-sof-amd-acp.o
diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index f4bc7e9abafb..3a1c848020ca 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -53,6 +53,8 @@
 
 /* Registers from ACP_INTR block */
 #define ACP_DSP_SW_INTR_CNTL			0x1814
+#define ACP_DSP_SW_INTR_STAT                    0x1818
+#define ACP_SW_INTR_TRIG                        0x181C
 #define ACP_ERROR_STATUS			0x18C4
 
 /* Registers from ACP_SHA block */
diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
new file mode 100644
index 000000000000..e132223b4c66
--- /dev/null
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc.
+//
+// Authors: Balakishore Pati <Balakishore.pati@amd.com>
+//	    Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+
+/* ACP-specific SOF IPC code */
+
+#include <linux/module.h>
+#include "../ops.h"
+#include "acp.h"
+#include "acp-dsp-offset.h"
+
+void acp_mailbox_write(struct snd_sof_dev *sdev, u32 offset, void *message, size_t bytes)
+{
+	memcpy_to_scratch(sdev, offset, message, bytes);
+}
+EXPORT_SYMBOL_NS(acp_mailbox_write, SND_SOC_SOF_AMD_COMMON);
+
+void acp_mailbox_read(struct snd_sof_dev *sdev, u32 offset, void *message, size_t bytes)
+{
+	memcpy_from_scratch(sdev, offset, message, bytes);
+}
+EXPORT_SYMBOL_NS(acp_mailbox_read, SND_SOC_SOF_AMD_COMMON);
+
+static void acpbus_trigger_host_to_dsp_swintr(struct acp_dev_data *adata)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+	u32 swintr_trigger;
+
+	swintr_trigger = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SW_INTR_TRIG);
+	swintr_trigger |= 0x01;
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW_INTR_TRIG, swintr_trigger);
+}
+
+static void acp_ipc_host_msg_set(struct snd_sof_dev *sdev)
+{
+	unsigned int host_msg = offsetof(struct scratch_ipc_conf, sof_host_msg_write);
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + host_msg, 1);
+}
+
+static void acp_dsp_ipc_host_done(struct snd_sof_dev *sdev)
+{
+	unsigned int dsp_msg = offsetof(struct scratch_ipc_conf, sof_dsp_msg_write);
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_msg, 0);
+}
+
+static void acp_dsp_ipc_dsp_done(struct snd_sof_dev *sdev)
+{
+	unsigned int dsp_ack = offsetof(struct scratch_ipc_conf, sof_dsp_ack_write);
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_ack, 0);
+}
+
+int acp_sof_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+{
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
+	unsigned int offset = offsetof(struct scratch_ipc_conf, sof_in_box);
+
+	acp_mailbox_write(sdev, offset, msg->msg_data, msg->msg_size);
+	acp_ipc_host_msg_set(sdev);
+
+	/* Trigger host to dsp interrupt for the msg */
+	acpbus_trigger_host_to_dsp_swintr(adata);
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_sof_ipc_send_msg, SND_SOC_SOF_AMD_COMMON);
+
+static void acp_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg = sdev->msg;
+	struct sof_ipc_reply reply;
+	struct sof_ipc_cmd_hdr *hdr;
+	unsigned int offset = offsetof(struct scratch_ipc_conf, sof_in_box);
+	int ret = 0;
+
+       /*
+	* Sometimes, there is unexpected reply ipc arriving. The reply
+	* ipc belongs to none of the ipcs sent from driver.
+	* In this case, the driver must ignore the ipc.
+	*/
+	if (!msg) {
+		dev_warn(sdev->dev, "unexpected ipc interrupt raised!\n");
+		return;
+	}
+	hdr = msg->msg_data;
+	if (hdr->cmd == (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CTX_SAVE) ||
+	    hdr->cmd == (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_GATE)) {
+		/*
+		 * memory windows are powered off before sending IPC reply,
+		 * so we can't read the mailbox for CTX_SAVE and PM_GATE
+		 * replies.
+		 */
+		reply.error = 0;
+		reply.hdr.cmd = SOF_IPC_GLB_REPLY;
+		reply.hdr.size = sizeof(reply);
+		memcpy(msg->reply_data, &reply, sizeof(reply));
+		goto out;
+	}
+	/* get IPC reply from DSP in the mailbox */
+	acp_mailbox_read(sdev, offset, &reply, sizeof(reply));
+	if (reply.error < 0) {
+		memcpy(msg->reply_data, &reply, sizeof(reply));
+		ret = reply.error;
+	} else {
+		/* reply correct size ? */
+		if (reply.hdr.size != msg->reply_size &&
+		    !(reply.hdr.cmd & SOF_IPC_GLB_PROBE)) {
+			dev_err(sdev->dev, "reply expected %zu got %u bytes\n",
+				msg->reply_size, reply.hdr.size);
+			ret = -EINVAL;
+		}
+		/* read the message */
+		if (msg->reply_size > 0)
+			acp_mailbox_read(sdev, offset, msg->reply_data, msg->reply_size);
+	}
+out:
+	msg->reply_error = ret;
+}
+
+irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
+{
+	struct snd_sof_dev *sdev = context;
+	unsigned int dsp_msg_write = offsetof(struct scratch_ipc_conf, sof_dsp_msg_write);
+	unsigned int dsp_ack_write = offsetof(struct scratch_ipc_conf, sof_dsp_ack_write);
+	bool ipc_irq = false;
+	int dsp_msg, dsp_ack;
+
+	dsp_msg = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_msg_write);
+	if (dsp_msg) {
+		snd_sof_ipc_msgs_rx(sdev);
+		acp_dsp_ipc_host_done(sdev);
+		ipc_irq = true;
+	}
+
+	dsp_ack = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_ack_write);
+	if (dsp_ack) {
+		spin_lock_irq(&sdev->ipc_lock);
+		/* handle immediate reply from DSP core */
+		acp_dsp_ipc_get_reply(sdev);
+		snd_sof_ipc_reply(sdev, 0);
+		/* set the done bit */
+		acp_dsp_ipc_dsp_done(sdev);
+		spin_unlock_irq(&sdev->ipc_lock);
+		ipc_irq = true;
+	}
+
+	if (!ipc_irq)
+		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
+
+	return IRQ_HANDLED;
+}
+EXPORT_SYMBOL_NS(acp_sof_ipc_irq_thread, SND_SOC_SOF_AMD_COMMON);
+
+int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+			 void *p, size_t sz)
+{
+	unsigned int offset = offsetof(struct scratch_ipc_conf, sof_out_box);
+
+	if (!substream || !sdev->stream_box.size)
+		acp_mailbox_read(sdev, offset, p, sz);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_sof_ipc_msg_data, SND_SOC_SOF_AMD_COMMON);
+
+int acp_sof_ipc_pcm_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+			   const struct sof_ipc_pcm_params_reply *reply)
+{
+	/* TODO: Implement stream hw params to validate stream offset */
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_sof_ipc_pcm_params, SND_SOC_SOF_AMD_COMMON);
+
+int acp_sof_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return ACP_SCRATCH_MEMORY_ADDRESS;
+}
+EXPORT_SYMBOL_NS(acp_sof_ipc_get_mailbox_offset, SND_SOC_SOF_AMD_COMMON);
+
+MODULE_DESCRIPTION("AMD ACP sof-ipc driver");
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 3778f781f16a..43a57d15e3ca 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -233,6 +233,34 @@ static int acp_memory_init(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static irqreturn_t acp_irq_thread(int irq, void *context)
+{
+	struct snd_sof_dev *sdev = context;
+	unsigned int val;
+
+	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_STAT);
+	if (val & ACP_DSP_TO_HOST_IRQ) {
+		sof_ops(sdev)->irq_thread(irq, sdev);
+		val |= ACP_DSP_TO_HOST_IRQ;
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_STAT, val);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+};
+
+static irqreturn_t acp_irq_handler(int irq, void *dev_id)
+{
+	struct snd_sof_dev *sdev = dev_id;
+	unsigned int val;
+
+	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_STAT);
+	if (val)
+		return IRQ_WAKE_THREAD;
+
+	return IRQ_NONE;
+}
+
 static int acp_power_on(struct snd_sof_dev *sdev)
 {
 	unsigned int val;
@@ -318,9 +346,20 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 
 	sdev->pdata->hw_pdata = adata;
 
+	sdev->ipc_irq = pci->irq;
+	ret = request_threaded_irq(sdev->ipc_irq, acp_irq_handler, acp_irq_thread,
+				   IRQF_SHARED, "AudioDSP", sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to register IRQ %d\n",
+			sdev->ipc_irq);
+		return ret;
+	}
+
 	ret = acp_init(sdev);
-	if (ret < 0)
+	if (ret < 0) {
+		free_irq(sdev->ipc_irq, sdev);
 		return ret;
+	}
 
 	acp_memory_init(sdev);
 
@@ -330,6 +369,9 @@ EXPORT_SYMBOL_NS(amd_sof_acp_probe, SND_SOC_SOF_AMD_COMMON);
 
 int amd_sof_acp_remove(struct snd_sof_dev *sdev)
 {
+	if (sdev->ipc_irq)
+		free_irq(sdev->ipc_irq, sdev);
+
 	return acp_reset(sdev);
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_remove, SND_SOC_SOF_AMD_COMMON);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index e755a31374c6..ac8340119125 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -48,6 +48,8 @@
 #define ACP_DATA_RAM_BASE_ADDRESS		0x01000000
 #define ACP_DRAM_PAGE_COUNT			128
 
+#define ACP_DSP_TO_HOST_IRQ			0x04
+
 struct  acp_atu_grp_pte {
 	u32 low;
 	u32 high;
@@ -150,5 +152,18 @@ int acp_dsp_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_t
 int acp_dsp_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 		       u32 offset, void *dest, size_t size);
 
+/* IPC callbacks */
+irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context);
+int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+			 void *p, size_t sz);
+int acp_sof_ipc_send_msg(struct snd_sof_dev *sdev,
+			 struct snd_sof_ipc_msg *msg);
+int acp_sof_ipc_get_mailbox_offset(struct snd_sof_dev *sdev);
+int acp_sof_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id);
+int acp_sof_ipc_pcm_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+			   const struct sof_ipc_pcm_params_reply *reply);
+void acp_mailbox_write(struct snd_sof_dev *sdev, u32 offset, void *message, size_t bytes);
+void acp_mailbox_read(struct snd_sof_dev *sdev, u32 offset, void *message, size_t bytes);
+
 extern const struct snd_sof_dsp_ops sof_renoir_ops;
 #endif
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index bca80784b322..9d95ea66f867 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -41,6 +41,14 @@ const struct snd_sof_dsp_ops sof_renoir_ops = {
 
 	/* DSP core boot */
 	.run			= acp_sof_dsp_run,
+
+	/*IPC */
+	.send_msg		= acp_sof_ipc_send_msg,
+	.ipc_msg_data		= acp_sof_ipc_msg_data,
+	.ipc_pcm_params		= acp_sof_ipc_pcm_params,
+	.get_mailbox_offset	= acp_sof_ipc_get_mailbox_offset,
+	.irq_thread		= acp_sof_ipc_irq_thread,
+	.fw_ready		= sof_fw_ready,
 };
 EXPORT_SYMBOL(sof_renoir_ops);
 
-- 
2.27.0

