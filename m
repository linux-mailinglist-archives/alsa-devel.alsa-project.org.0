Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 484D59F743D
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:51:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73AF86021F;
	Thu, 19 Dec 2024 06:51:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73AF86021F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587499;
	bh=t4+PUfENaVtQVP9NBmULA8e2gLrXcG0Bz6KfjUpNU3o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W5IG87eVV+0qVqiyGZ64ox74OKMqNUIdha/vknEdLch+Vqhbk6rv0CLIiEGipeY2D
	 TfIPkh8TLghW5aFeMc9oPMMHdFIHWfLBUU78QV49N8B5PFcI3wC3rEqC9MJzKqC+Jh
	 8MoEWmJVVjFdIcIf8IsNbyeeeSznSEM7Bj7MrGdM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1D01F8061E; Thu, 19 Dec 2024 06:50:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E0E4F80631;
	Thu, 19 Dec 2024 06:50:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AE97F805C7; Thu, 19 Dec 2024 06:50:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::60c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEA72F800B0
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA72F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NyQ0nW+A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYL6YU1tsCSGzcvbd7TCt0WtRQLoKor1IJNaGbygLaSCKa8mJMJjh2EeTDuk3r4m0EUsKPlSuQxQQGMl9i10E7/7z7TmAo++B7xAkW7TO4nyJ//NEirGfde73fNQveGJGdG/lcxRvVDLOkcXA6/BesPvNlyJeYIgHpxAwvBE+ufR7E0BRiDRN0/GNmbQSJM2doWishrpLopkMUCireDnQwoQ24c7/XKpOTBqUOjJPOK804VTKfJrFsxgysdICZhAhqg4Jy2/GgS2Pdg3Lb1d84KVClK3CAJfb5OPA83aqWOljlC3eqTeD+YzFIih+eN1sZpyuuj1NrdtJDEERDOfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hh4cwBZN9BmivRU+JmhqehA6+UQLGL24LYv4/83Z8wU=;
 b=oRW6vzQGJkiYmMcAMr3hgAF7Ev6GWiBm8l+kEbL8bJfKco3k81tn8PczqFI8qqyMExCU6k6CSIp8hBbdf60zpPAzh02YpPQ04rs2T9PXK9Px6Om8iJz6LmH6Pey1fYxmJWlS1qZ7POJqqn30z+bwTF4QAd2EUjARpdt/Hpjdhw4oO/YOTOH+pRJHxGuhGolF2GPIOSgkylGGmB++uiv/0ib2FqiYdHW9jO0kAJ2EgsP4iGLRlRgfv3QKYSesikjvD5OGWtZ2KpFYZ8jpJAtIaxFT4pOKigybl6bG+8Iv3Xv7JQTj5FpInfbeM5oN2pSM7ybTHkKLKA6lt/p6XKVPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hh4cwBZN9BmivRU+JmhqehA6+UQLGL24LYv4/83Z8wU=;
 b=NyQ0nW+AsWR80DdOuBfebwE3TD0KG6VA64tbk3MHC8laNvLUom1Vqy3gGRusW+mi2bYALHzfZGvyKousnZ7YzzK4vo88VOIqPhgtG7/d0PfQQdQNm62IB4cHk6h4mZ/2rrSlP3z0wt/GD6fq//zgRV4tFUZxVWff+yEjjEcb5Pw=
Received: from CH2PR03CA0010.namprd03.prod.outlook.com (2603:10b6:610:59::20)
 by DM6PR12MB4234.namprd12.prod.outlook.com (2603:10b6:5:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:50:21 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::f0) by CH2PR03CA0010.outlook.office365.com
 (2603:10b6:610:59::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Thu,
 19 Dec 2024 05:50:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:50:20 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:50:17 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 05/21] ASoC: amd: acp70: create platform devices for acp child
 nodes
Date: Thu, 19 Dec 2024 11:18:41 +0530
Message-ID: <20241219054857.2070420-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|DM6PR12MB4234:EE_
X-MS-Office365-Filtering-Correlation-Id: 341e1f97-8812-41fd-5fc0-08dd1ff1064c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OY7+neKREXHMBuAmt/FBhlc65AgksW08/41lj4IdhSLpUc7nW8uFNyERkKQ6?=
 =?us-ascii?Q?cQcRIyVPWO1om6540pUXCK4p8wKknSiYv9ki03pvfTGTaTP/CxQ/jjgg7KsM?=
 =?us-ascii?Q?PVC1gPcpiwY4Yu1/3l0ZJFgYsP9pevtyb/yJZ5QXAK59w1UvCsiOw9xrr6QO?=
 =?us-ascii?Q?cv7S/MM6aIgydpxwLIVvs2AsdFkzXWZiA/k0R0ALWhgf9abdJ6nXvb1uACUS?=
 =?us-ascii?Q?yuB8c8pjIqtzcu3Hr+4AM0HTG/ZilcXZRqnOYH9UifkoIQi/Sw7B9tQIv3sH?=
 =?us-ascii?Q?V7ogYLexbSnhDdWD4SZ0dPbBKMoxJMQ5wwdDX5i8W7T7cfRtALmHpK8bNh57?=
 =?us-ascii?Q?dCFwhmA2GFZCZszIWhDuoT/Jev3l6kMpUiqP4vK66KYlP540IkDNxnS6WgfB?=
 =?us-ascii?Q?TyLumMMkWyTJ2wj4pCiDjb4/QRFkIWl9QrWwzl1pOAjM35eoCarUmhxAzV9Z?=
 =?us-ascii?Q?cNiXFcIlLT547mPcSx8v+xG6kfGEwOOwfRyC+rWsu4Ys7xnBiJbgAugfXQwd?=
 =?us-ascii?Q?tRTAvmcYu+aXm83JScSS6i8shIbnTxPXbD66oyc8z7iQfoBcVVo9+AqUItfc?=
 =?us-ascii?Q?zkl++qvh1lJoyhyGrAd5t+mfjui/dLcWg4amiONtP3cf1koWHEJLmKi2JBfv?=
 =?us-ascii?Q?bZoSTg89kCnE6asRYHCl7opHc+N6B/s9fbOiF2fe5doy9/dUdBdoDvJjmTIV?=
 =?us-ascii?Q?EhnTTTqq+xqNe+lUTgSMHQN4JOapAfb7EzCIuDKfYgCuyahwk1IynRMVG284?=
 =?us-ascii?Q?pbbU74/6VO8GgwHP9PL3+u9zfTXMJlodQ8W9f7zXBt2+pGmCmXl3dEg2tb7t?=
 =?us-ascii?Q?ZWDrCmYfjoihLUNzWNQJg94UmuuR7AanIuVbI8Gv6eVe+L5ijBGyYpXCv6Vf?=
 =?us-ascii?Q?oYRfiDqzrKEFIyqQTLCO+nCzAReA9+yuUxWSNY4qtRzD9EcXjCfi+oDFVrVH?=
 =?us-ascii?Q?gii3Um+UcvgiEaqm+/HZl5lkT/wJ6asfaXw1paHoI3e1FiiITUNbqCj6Z9LD?=
 =?us-ascii?Q?mjt1fBTRbiGk9UAwBiwpJ87jhSCQ6LUdJIEqk2Ada3nCzywkJr8W9eQEzBZj?=
 =?us-ascii?Q?KMNuqkQ+6KI34knJf5kipsJlLEIjuGkYzI7heVWrIiT44zEq8OqC4hyMx2Ky?=
 =?us-ascii?Q?X1IDBaFTJMUQFKXjx3f6xE8wGDNr3v5+aFt0iarHVYPbsbBpw2EgPFwmhyt0?=
 =?us-ascii?Q?t0uAyp9F07oD+UvQA7kmKSQI8C2aQF+5gWi7Kg4DbQW92AXataV7t6Qw72Wf?=
 =?us-ascii?Q?YjQCebn7ydlcc0rUD9YEIFGxAni1AKRstWi8WgOixwuEEcGxdBuGuVAG0s+F?=
 =?us-ascii?Q?JbRVVgF2rsNpLLVS3cpAV7pyK078ADAN+haBHKsoU4kVpF7paZICpc/PVh4l?=
 =?us-ascii?Q?n8b5JAmYQopIeah63uZxrcnA/wVtdh3Kb4mwxr4zrDaBXz3bUkhejEgLxOMP?=
 =?us-ascii?Q?4OC+9ao86ZIWvTAmiEemMOfLPN1IXQ57Y9sv59ZRAMfopVreVuNLTPdIIr6X?=
 =?us-ascii?Q?+s48660AhSJ2IPw=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:50:20.8945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 341e1f97-8812-41fd-5fc0-08dd1ff1064c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234
Message-ID-Hash: F3UYCC2CHLVXAU2K4REZK4SKDJGVPWBT
X-Message-ID-Hash: F3UYCC2CHLVXAU2K4REZK4SKDJGVPWBT
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3UYCC2CHLVXAU2K4REZK4SKDJGVPWBT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Create platform devices for ACP child nodes(ACP PDM controller,
DMIC codec, SoundWire DMA driver, SoundWire manager instances).

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |   8 ++
 sound/soc/amd/acp70/pci-acp70.c | 157 ++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index 1b20de75876a..68035fbf23d1 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -61,6 +61,10 @@ enum acp_config {
 /**
  * struct acp70_dev_data - acp pci driver context
  * @acp70_base: acp mmio base
+ * @res: resource
+ * @pdm_dev: ACP PDM controller platform device
+ * @dmic_codec: platform device for DMIC Codec
+ * sdw_dma_dev: platform device for SoundWire DMA controller
  * @acp_lock: used to protect acp common registers
  * @info: SoundWire AMD information found in ACPI tables
  * @sdw: SoundWire context for all SoundWire manager instances
@@ -75,6 +79,10 @@ enum acp_config {
 
 struct acp70_dev_data {
 	void __iomem *acp70_base;
+	struct resource *res;
+	struct platform_device *pdm_dev;
+	struct platform_device *dmic_codec_dev;
+	struct platform_device *sdw_dma_dev;
 	struct mutex acp_lock; /* protect shared registers */
 	struct sdw_amd_acpi_info info;
 	/* sdw context allocated by SoundWire driver */
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index d360dfc396ad..a6812fa269b1 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -12,6 +12,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include "../mach-config.h"
 
 #include "acp70.h"
@@ -115,11 +116,54 @@ static int acp_scan_sdw_devices(struct device *dev, u64 addr)
 	acp_data->info.count = AMD_SDW_MAX_MANAGERS;
 	return amd_sdw_scan_controller(&acp_data->info);
 }
+
+static int amd_sdw_probe(struct device *dev)
+{
+	struct acp70_dev_data *acp_data;
+	struct sdw_amd_res sdw_res;
+	int ret;
+
+	acp_data = dev_get_drvdata(dev);
+	memset(&sdw_res, 0, sizeof(sdw_res));
+	sdw_res.addr = acp_data->addr;
+	sdw_res.reg_range = acp_data->reg_range;
+	sdw_res.handle = acp_data->info.handle;
+	sdw_res.parent = dev;
+	sdw_res.dev = dev;
+	sdw_res.acp_lock = &acp_data->acp_lock;
+	sdw_res.count = acp_data->info.count;
+	sdw_res.mmio_base = acp_data->acp70_base;
+	sdw_res.link_mask = acp_data->info.link_mask;
+	sdw_res.acp_rev = acp_data->acp_rev;
+	ret = sdw_amd_probe(&sdw_res, &acp_data->sdw);
+	if (ret)
+		dev_err(dev, "error: SoundWire probe failed\n");
+	return ret;
+}
+
+static int amd_sdw_exit(struct acp70_dev_data *acp_data)
+{
+	if (acp_data->sdw)
+		sdw_amd_exit(acp_data->sdw);
+	acp_data->sdw = NULL;
+
+	return 0;
+}
 #else
 static int acp_scan_sdw_devices(struct device *dev, u64 addr)
 {
 	return 0;
 }
+
+static int amd_sdw_probe(struct device *dev)
+{
+	return 0;
+}
+
+static int amd_sdw_exit(struct acp70_dev_data *acp_data)
+{
+	return 0;
+}
 #endif
 
 static int get_acp70_device_config(struct pci_dev *pci, struct acp70_dev_data *acp_data)
@@ -188,6 +232,102 @@ static int get_acp70_device_config(struct pci_dev *pci, struct acp70_dev_data *a
 	}
 	return 0;
 }
+
+static void acp70_fill_platform_dev_info(struct platform_device_info *pdevinfo,
+					 struct device *parent,
+					 struct fwnode_handle *fw_node,
+					 char *name, unsigned int id,
+					 const struct resource *res,
+					 unsigned int num_res,
+					 const void *data,
+					 size_t size_data)
+{
+	pdevinfo->name = name;
+	pdevinfo->id = id;
+	pdevinfo->parent = parent;
+	pdevinfo->num_res = num_res;
+	pdevinfo->res = res;
+	pdevinfo->data = data;
+	pdevinfo->size_data = size_data;
+	pdevinfo->fwnode = fw_node;
+}
+
+static int create_acp70_platform_devs(struct pci_dev *pci, struct acp70_dev_data *adata, u32 addr)
+{
+	struct platform_device_info pdevinfo;
+	struct device *parent;
+	int ret;
+
+	parent = &pci->dev;
+
+	if (adata->is_sdw_dev || adata->is_pdm_dev) {
+		adata->res = devm_kzalloc(&pci->dev, sizeof(struct resource), GFP_KERNEL);
+		if (!adata->res) {
+			ret = -ENOMEM;
+			goto de_init;
+		}
+		adata->res->flags = IORESOURCE_MEM;
+		adata->res->start = addr;
+		adata->res->end = addr + (ACP70_REG_END - ACP70_REG_START);
+		memset(&pdevinfo, 0, sizeof(pdevinfo));
+	}
+
+	if (adata->is_pdm_dev && adata->is_pdm_config) {
+		acp70_fill_platform_dev_info(&pdevinfo, parent, NULL, "acp70_pdm_dma",
+					     0, adata->res, 1, NULL, 0);
+
+		adata->pdm_dev = platform_device_register_full(&pdevinfo);
+		if (IS_ERR(adata->pdm_dev)) {
+			dev_err(&pci->dev,
+				"cannot register %s device\n", pdevinfo.name);
+			ret = PTR_ERR(adata->pdm_dev);
+			goto de_init;
+		}
+		memset(&pdevinfo, 0, sizeof(pdevinfo));
+		acp70_fill_platform_dev_info(&pdevinfo, parent, NULL, "dmic-codec",
+					     0, NULL, 0, NULL, 0);
+		adata->dmic_codec_dev = platform_device_register_full(&pdevinfo);
+		if (IS_ERR(adata->dmic_codec_dev)) {
+			dev_err(&pci->dev,
+				"cannot register %s device\n", pdevinfo.name);
+			ret = PTR_ERR(adata->dmic_codec_dev);
+			goto unregister_pdm_dev;
+		}
+	}
+	if (adata->is_sdw_dev && adata->is_sdw_config) {
+		ret = amd_sdw_probe(&pci->dev);
+		if (ret) {
+			if (adata->is_pdm_dev)
+				goto unregister_dmic_codec_dev;
+			else
+				goto de_init;
+		}
+		memset(&pdevinfo, 0, sizeof(pdevinfo));
+		acp70_fill_platform_dev_info(&pdevinfo, parent, NULL, "amd_acp70_sdw_dma",
+					     0, adata->res, 1, NULL, 0);
+
+		adata->sdw_dma_dev = platform_device_register_full(&pdevinfo);
+		if (IS_ERR(adata->sdw_dma_dev)) {
+			dev_err(&pci->dev,
+				"cannot register %s device\n", pdevinfo.name);
+			ret = PTR_ERR(adata->sdw_dma_dev);
+			if (adata->is_pdm_dev)
+				goto unregister_dmic_codec_dev;
+			else
+				goto de_init;
+		}
+	}
+	return 0;
+unregister_dmic_codec_dev:
+		platform_device_unregister(adata->dmic_codec_dev);
+unregister_pdm_dev:
+		platform_device_unregister(adata->pdm_dev);
+de_init:
+	if (acp70_deinit(adata->acp70_base, &pci->dev))
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	return ret;
+}
+
 static int snd_acp70_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -249,8 +389,16 @@ static int snd_acp70_probe(struct pci_dev *pci,
 		dev_dbg(&pci->dev, "get acp device config failed:%d\n", ret);
 		goto skip_pdev_creation;
 	}
+	ret = create_acp70_platform_devs(pci, adata, addr);
+	if (ret < 0) {
+		dev_err(&pci->dev, "ACP platform devices creation failed\n");
+		goto de_init;
+	}
 skip_pdev_creation:
 	return 0;
+de_init:
+	if (acp70_deinit(adata->acp70_base, &pci->dev))
+		dev_err(&pci->dev, "ACP de-init failed\n");
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
@@ -265,6 +413,14 @@ static void snd_acp70_remove(struct pci_dev *pci)
 	int ret;
 
 	adata = pci_get_drvdata(pci);
+	if (adata->sdw) {
+		amd_sdw_exit(adata);
+		platform_device_unregister(adata->sdw_dma_dev);
+	}
+	if (adata->is_pdm_dev) {
+		platform_device_unregister(adata->pdm_dev);
+		platform_device_unregister(adata->dmic_codec_dev);
+	}
 	ret = acp70_deinit(adata->acp70_base, &pci->dev);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
@@ -291,5 +447,6 @@ module_pci_driver(ps_acp70_driver);
 
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_DESCRIPTION("AMD ACP7.0 PCI driver");
+MODULE_IMPORT_NS("SOUNDWIRE_AMD_INIT");
 MODULE_IMPORT_NS("SND_AMD_SOUNDWIRE_ACPI");
 MODULE_LICENSE("GPL");
-- 
2.34.1

