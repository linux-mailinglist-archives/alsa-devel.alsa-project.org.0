Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003BA16A42
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:04:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2019A6021A;
	Mon, 20 Jan 2025 11:04:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2019A6021A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367459;
	bh=pZxyzs+yWYfURoTFOPzSu9IKab8VYnt9tTdZFjID9IU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MbIxhGagn1q/+I+91d6s7AEEzUYSPib+9as7ktUf685UWgGrr2RrxCX4CQG9CDyia
	 RBWsLl8fcb7SG/dm7VFKzEJoiY1LJ9YYSsaY6US0SbTFg+3j6nbGZQkmMW9jeCpuaA
	 qKJoj/ThKRlndnFkELn95N2sV5z2sB4ahp1z6iKo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B94C5F805C6; Mon, 20 Jan 2025 11:03:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB04F80675;
	Mon, 20 Jan 2025 11:03:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8531BF80482; Mon, 20 Jan 2025 11:02:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7453F800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7453F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Crwln5Z3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhVB2YcY9aOzcqIXEGshcfqD/UP8vXJTaXEwqSaj6PBvFAFqzBdhrFICf0QE7YFoGy4QpoNpcHReKJz8BEuqpDDeFw2j6T4PFhFzJ9mWnpDRCSf3zt+J9qx+s3oV03Y1cEx0tmfOYyY2jz9tktchBvUnXz7+4b6IfID4tZ3JH9ZagfaDofdtsHQCoVOGfRnQLwSnCHHNNiDhC7VdbHwfzLh12QecXsZN9hK4iDodaSf+Y4nUgQGrDZqmRa5yEBwy+S0/ssNIhl9Fi5MIEGMO8PKkdYUEjEntt/7pWQlWrS7PCn1bh4fmbv12ZyJR8MlTTGXI4YCvZplOTtjBNyVDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEhqxSgAduKTKDB5AlWM28D9+7w6wKmLNowtJ8E+DrY=;
 b=tnM9+j55YMPNjrswIAMsYcRYpBxTLncgpN2CznkggkFWwPXhur3nWM4Jppx25bY6BeYBzVrULmE6q3mYgMp6OG+Bj4j4l/M4SCi5bfwbuL4qGkozJoRoallgTK7ksW2299Mp9kgFssBWeXE5rETpxz8mWNXQslDv2pMeuQhrKfSR/7ThLfcWhwDpOpJ3xO1D7Q3vqijUpcCcSDVBd77fRxJbMCBkJhRiMxg+CNODrs0C+R0da5u6209QtU9+zfY25gFpRQVW6VuVDzsOdE5AILdwDeSlehdTdUSJ8CCoach1dN9lHVQ8yzbDdVl6RusbJFo+yK00yGwKtNcoHWI8Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEhqxSgAduKTKDB5AlWM28D9+7w6wKmLNowtJ8E+DrY=;
 b=Crwln5Z3mqt7Lyga1/JnDIG3gP7Ou8lryyiFAqq7CQU0+P5+BGwOWMMIwUuOikh31ydpFTnf8jq7SjM77Qswmqh54jcHqmCNrXpb1EaGfXT8C9hQT4Uy97Q86Pc7G19rDAi4IX8JWBrOQejNzS5gN4W1svXKsbMjzDnZgNmt0Jc=
Received: from CH2PR14CA0021.namprd14.prod.outlook.com (2603:10b6:610:60::31)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:02:03 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::c4) by CH2PR14CA0021.outlook.office365.com
 (2603:10b6:610:60::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:03 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:01:59 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 05/23] ASoC: amd: acp70: create platform devices for acp
 child nodes
Date: Mon, 20 Jan 2025 15:31:12 +0530
Message-ID: <20250120100130.3710412-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fab65a-31cf-4186-6d62-08dd39397d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kiOZO7CIBXXpbcIX/MONJfe+WV16mWy4ISLMlIcXRII790LVAxlal3dCuegD?=
 =?us-ascii?Q?kSSoew3M6gSOm2ynxWeOcpMjAHuyxp+NP1Y4GlwbcQDo7MWf82nMBVPLm5yN?=
 =?us-ascii?Q?dqeK6vDahyNnEbzcTzRD7LERUQZDJNIg1IXEhEeU91aTJQXPqYXsLa5PdsHV?=
 =?us-ascii?Q?GxvZMFNrIIaOFpMcTTTXsUZvAS6lk3zGcaDqAUxTe8jufNyC81B2usTAVPzX?=
 =?us-ascii?Q?+s/U4IlU8YxaiQDUEzgFARtdgo4ZLAwyclacLaS5yhWwuGElwSNs/PngkpZP?=
 =?us-ascii?Q?GZsugLWt0zdRSRctyAkUnYcPbwi4Ark4KR7wWBZ1+O+xfYFQTFbGhKDiS7Dv?=
 =?us-ascii?Q?iZ+2kV+feov5Izld4bgcgbU41EzLmSC+03/iP+uUDwnBmPLxc5EpQIVGnXFZ?=
 =?us-ascii?Q?mY+5zuKJ2fx8QcK5xnV5rBT1i8cEnGIYz0DXw4PrwCxmSyAYiOMcP1TUibBv?=
 =?us-ascii?Q?7OHB4lLVlhJbpDNDXbfD+wJea48ETRBza5I737/V1YZ1ik86chf+r45xhawz?=
 =?us-ascii?Q?k1ma0ezJwQQZAX3hB+oZEXKNNpYdo88NK2xYXMfSc+g1AJVQs8g/LfzttLQC?=
 =?us-ascii?Q?PqYHKok+XccKrCRd6g8VU8fZ2AX8xa2xVCnmE0N8JFQsvDWjVRENELzlyMMp?=
 =?us-ascii?Q?1neOWvLmbnog1PLgrs1NFGVDrQ0wrj+JQE93ownAAJhVLeoY1S3pHnJs4jlD?=
 =?us-ascii?Q?jcCRqARQ8HmwlcxNyIoimB6+LLB7NdCEriUQ9kMQ3ruqyYFEk/7BCD9CjBhw?=
 =?us-ascii?Q?i6x0GPVnsO9VovDcnlZh8dW7Ngs0rFVHq1hOmE45YQMupJQcz6ePWY2D+UXy?=
 =?us-ascii?Q?AIZpRV7gLc7BvjpjQkcmsRq9gqqk2o/rdSgNsVf1bq//CCc6HH49iDtNWnp1?=
 =?us-ascii?Q?UKruM6MY033KNoGxzWEi70cwKOa5NkN0j1KKvVzGdj49ZK8ahxr10vnR36kR?=
 =?us-ascii?Q?L3ZjnTtR+VwE1CyHqZtIK70Bm3Doib0M6TWKwQpT+6a5OaYtqkO0y2GaNy7H?=
 =?us-ascii?Q?ldAY5TKE9t5m/Sv2/W8ro8IKnb16tsfVqzNEBcE76OhJg0GPKSwf591G4Vft?=
 =?us-ascii?Q?qDtvvexmUaO+nEyB+4VI7LxDK/1pwQNkyF0+QFAmt+XCZvoRmPuVJQceWF/l?=
 =?us-ascii?Q?GQsr4ymtZLfgYg+jYaKnb5TNiYtyne0yegRnD9dO5MHWahw3kELxHrlq3PVz?=
 =?us-ascii?Q?IqA/GlApYTC9SzMbgPavRsTxotRv1i3lSzwIHzFUldNgFse05chsN6ZoExtP?=
 =?us-ascii?Q?XeFlP1IYfJ5u8RGpiKLHZqrjiq3WHh2gq+lLicxTpNxI5TvOf2lyQW5GJWts?=
 =?us-ascii?Q?zsBL74WaPcaNrYM5P11em4/Vh8IV42y8KRZ6NXifK5fKCOdJKDG/D5Dzeoi+?=
 =?us-ascii?Q?ZzMoebVYxU90jvd2W/LgKVJbyiC/27/r32KTS14guTT4SYOOAj/gb174td/W?=
 =?us-ascii?Q?ucdXfxZyxUCSXKI/lzY0RHhElKrSqAYtW5D0FBEKEjH04nM7p4UOSNEeqzEL?=
 =?us-ascii?Q?X5Dox63IJ0CyiSg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:03.3293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7fab65a-31cf-4186-6d62-08dd39397d47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308
Message-ID-Hash: XXV6BHDF3TCWWBQ2KQSJNT6B5KOGWZRT
X-Message-ID-Hash: XXV6BHDF3TCWWBQ2KQSJNT6B5KOGWZRT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXV6BHDF3TCWWBQ2KQSJNT6B5KOGWZRT/>
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
 sound/soc/amd/acp70/pci-acp70.c | 156 ++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+)

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
index 24710ff2c124..a6812fa269b1 100644
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
@@ -189,6 +233,101 @@ static int get_acp70_device_config(struct pci_dev *pci, struct acp70_dev_data *a
 	return 0;
 }
 
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
@@ -250,8 +389,16 @@ static int snd_acp70_probe(struct pci_dev *pci,
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
@@ -266,6 +413,14 @@ static void snd_acp70_remove(struct pci_dev *pci)
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
@@ -292,5 +447,6 @@ module_pci_driver(ps_acp70_driver);
 
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_DESCRIPTION("AMD ACP7.0 PCI driver");
+MODULE_IMPORT_NS("SOUNDWIRE_AMD_INIT");
 MODULE_IMPORT_NS("SND_AMD_SOUNDWIRE_ACPI");
 MODULE_LICENSE("GPL");
-- 
2.34.1

