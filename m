Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0866EA16A3E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:03:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725106022A;
	Mon, 20 Jan 2025 11:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725106022A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367419;
	bh=lctzDdqvDqXjzyauX+iSXlf28Tpyo8P++ZSy8fgZjaI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NIeliAPzxbbaugBLOuOHczOC1JCx5tnY6VLNtThc7FDSWE/7OiDsukdbU1jIS/W+m
	 8kZWpjWWcJxVUhnj4RvlP/nsd2YFoDjoow3NVBg6Aroz3XDNXGnIvU3uU2XTtonIXy
	 BMhZAr6H6Zr1f0kEay4yJD6uf36r897XZrkdxvnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1376BF8061F; Mon, 20 Jan 2025 11:02:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF7D9F8061E;
	Mon, 20 Jan 2025 11:02:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67A99F80482; Mon, 20 Jan 2025 11:02:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEBC9F8007E
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEBC9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IkacFDu5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WY23CQSCVT8ujwah0ftJwYBPeFMx4xjSkkjWWhh8im+ALssZN0SIhZiYn43y5joROY0gpbEe82naI+/iuwsDejEPhyHsedYyfu7O2l39ManYg2ZF2YAtHdqQKXUCaBtR/hBX9Rw2D2O3f38IM1cBU5bFvw1d+OmHXdCXBekqH8MEr18xqcBP85DI+MABCHZ3+BozclprCmkC4SRu5G0C/pKoFwiEQa0Fh0yM4WWKwRaRzqa/C2AnuYXVHREopF2Wh1xOwulxeuxZc1smji1aXTSLcMI5tXytqD5m7Zj40fcdBQIQwpa1umCJS8GWdn5UGbjjWGN+TzMNLAG6KL5ljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUhihi7qBvJ5AqSgyiZsLmMdmCeWk6E1j3NyV/k5nto=;
 b=yWpThgdyHEULsNL/uDScemY0aJwyvcGyq+8swQlSHxHzf07YgQ7UwF0hfWUIxWYQTm42jAi1q3lMO9+vvKUvkrRG7OXqwI1vOb6cHuY0l8RxgJLEu4Pkw3Q9v7dZqB0r3vM6+P04uQL0iiVDAmKcg+6jUqyMveQlbFz1qV6VwgUjGu40xbtJe6K/hX3UuP6vQaHzM1C2r9O6R8Bw7yBWkOuXqbSU1RMKlHBKRxtudoSgHpoxz18qxoHRUbfa4zGeItB7ayfNg1TVXJlrwLDqmZ6kzzSoy+3yOjypPXji33R5wZUnrTrQs++CYKx4Kixq4wE6xRGqnXan0DWzaEyK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUhihi7qBvJ5AqSgyiZsLmMdmCeWk6E1j3NyV/k5nto=;
 b=IkacFDu549FoaCvXiOjNeKL+Tt2utdRwV0MfrjYKG1C02Ia6f60dzipgzXxq5bi3HRZjfQSRctsGAdpiQSp8fyz1kNk8+bnUoylJYImrrI5n9I7VGvtTSA8VkWp73sZdu0jp9sNqybIixVEWDQdoLLf+I0VZUCC15mC770DUhjg=
Received: from CH0P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::14)
 by MN2PR12MB4422.namprd12.prod.outlook.com (2603:10b6:208:265::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:02:00 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::95) by CH0P223CA0004.outlook.office365.com
 (2603:10b6:610:116::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:01:59 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:01:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 04/23] ASoC: amd: acp70: add logic for scanning acp child
 devices
Date: Mon, 20 Jan 2025 15:31:11 +0530
Message-ID: <20250120100130.3710412-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|MN2PR12MB4422:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a2a66e-2432-45cb-af22-08dd39397b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nmSX2Jq0vdee5Gu3Uz1Lx0CRbcjzgGiywrPkX6I52h6mOmkdYtcsIw9AryAg?=
 =?us-ascii?Q?i7oLlyxmWE5zivAwMr/t/o67hEGt2+Nemu3fLDQ8c94XuYFFSQ7oE8pbYpmM?=
 =?us-ascii?Q?6tDgiqg2QvHDPEF37KFhKVT591XoqOKwWnQ4pfWjGW3muA1wkGaHInNlP+gb?=
 =?us-ascii?Q?TMtpV9D6NSxfzbnFajuUPUNPxR5hTizP8sxfhDtRkL2dUqFT8Unveuno7VDa?=
 =?us-ascii?Q?TwVDKEhHSkh737emfTWqBtlfYzrRBkarg8v8ocGZfkgz6qzN7p1boTCQbHPa?=
 =?us-ascii?Q?DsqkWb129no2G2+/bXXtwtq4GsZ3bCdCOzB3De2Q/zocN5BUzTeds4HRy7Z5?=
 =?us-ascii?Q?nSvMs/NYlj5WhVmfrYIKyZu+Vf2odD938XvxMrUUEA5tF63afHFSSLCrcJgn?=
 =?us-ascii?Q?3sRRFKX32ZVlh9v8v61XRwjup0UR0/GlSpJPZma4Cxq/emGXAE395/fAoKro?=
 =?us-ascii?Q?GRLOQqDOxR4imUN6efEsS8ob+4/amcuc9jl3vd3wk/O12AdkKYtaMSXA95b/?=
 =?us-ascii?Q?09dUtUPR6lyyQWXgVJxYqo8FORz4IkfTNge7e7ri8nNgoFf0gmqSM5a55LuQ?=
 =?us-ascii?Q?5i1PpbRQB5EIpfhwq2mOH/3G5cXjmdOhqe9Gz20kuA59G1gfeAybaBzuzv8N?=
 =?us-ascii?Q?B4jIJDyn4e7HqxbbW0215ILHNO12E8mgv5pjL+74AKXvDSJOXXLwquWcVosV?=
 =?us-ascii?Q?x39B8P8APxq1u5gNTnZbrC4ZiaotU4Gfg5EwyMXgsT3hiemH7hDmhsf4fiAy?=
 =?us-ascii?Q?aiLAA7+e0MsElBgsBBRbAclAXjGKWObO3zpgp9f/XP9WTat/g2+bG6sJmMPq?=
 =?us-ascii?Q?/4GdN9MA1/fcln+oAuMtIAfTUyJPBY7g+qfuZku5R94Ct+HIFnde7Le9Y7G6?=
 =?us-ascii?Q?/aXtgRPjSYeD12XPqypTjf2+CgVE7HR8BFTpCazcdb9tyLBPWzCNjt0DA8/U?=
 =?us-ascii?Q?AA5kUkaNFgG9obWx9pV0DuaVoO+YuQwFKvXXs85eGVYgpNrWnNyjtXa1+RN4?=
 =?us-ascii?Q?tt56/WN3bHWmczhGRvxHpwGiMP21qUlX99L/9IaH6pBNNdN1ebgUDH5c1Q4b?=
 =?us-ascii?Q?MgGeUd6Nr3lnTLLMaoL0Z9Pyn6Bg9rgsC5crN2z3/q8iazPfElzRyhWLUmWQ?=
 =?us-ascii?Q?Zb17yhTJCCUx2eSxqYKSxl3YbfUdIfnT6+q912CdIKN5RLLbAo1JqHCk6Bfg?=
 =?us-ascii?Q?gFMF+HV96ylCDWN04VAsKT87qvWDrt4HRDecuyn3CZNvR+wL/E2S5f0JGQ3U?=
 =?us-ascii?Q?uVbQpDlVVrBvsCgla6s42MtpGkLVCMsBbQ16UVxPmqBcfpVgoG3ehbzD92vy?=
 =?us-ascii?Q?JZ/jdOqChoCthpuflzdcbO6WwY/4S49q8gIO5H1Tz+0j8JaHbtfnV2uny99Y?=
 =?us-ascii?Q?ansc49ijE0H/ZhgyoclA2RMd50aXCjyW6+IbFwxZOf1jpfrhBiF/Wfu1gwtP?=
 =?us-ascii?Q?roRdZ5sDe5raGLmu75eRnkPIx00x6+jWuSMeQ5rq2R77FzK+NbGjsg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:01:59.9952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 69a2a66e-2432-45cb-af22-08dd39397b4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4422
Message-ID-Hash: 4YVDKE4HZYUCPN6WG6B5W6I7HTZTKPNQ
X-Message-ID-Hash: 4YVDKE4HZYUCPN6WG6B5W6I7HTZTKPNQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YVDKE4HZYUCPN6WG6B5W6I7HTZTKPNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Based on acp pin configuration, add logic for scanning child devices
under acp pci device acpi scope.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |  43 +++++++++++++
 sound/soc/amd/acp70/pci-acp70.c | 104 ++++++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index b6f0f75de91d..1b20de75876a 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Advanced Micro Devices, Inc. All rights reserved.
  */
 
+#include <linux/soundwire/sdw_amd.h>
 #include <sound/acp70_chip_offset_byte.h>
 
 #define ACP_DEVICE_ID		0x15E2
@@ -28,21 +29,63 @@
 #define ACP_EXT_INTR_STAT_CLEAR_MASK	0xFFFFFFFF
 #define ACP_ERROR_IRQ			BIT(29)
 
+#define ACP_DMIC_DEV			2
+#define ACP70_DMIC_ADDR			2
+#define ACP70_SDW_ADDR			5
+#define AMD_SDW_MAX_MANAGERS		2
+
+enum acp_config {
+	ACP_CONFIG_0 = 0,
+	ACP_CONFIG_1,
+	ACP_CONFIG_2,
+	ACP_CONFIG_3,
+	ACP_CONFIG_4,
+	ACP_CONFIG_5,
+	ACP_CONFIG_6,
+	ACP_CONFIG_7,
+	ACP_CONFIG_8,
+	ACP_CONFIG_9,
+	ACP_CONFIG_10,
+	ACP_CONFIG_11,
+	ACP_CONFIG_12,
+	ACP_CONFIG_13,
+	ACP_CONFIG_14,
+	ACP_CONFIG_15,
+	ACP_CONFIG_16,
+	ACP_CONFIG_17,
+	ACP_CONFIG_18,
+	ACP_CONFIG_19,
+	ACP_CONFIG_20,
+};
+
 /**
  * struct acp70_dev_data - acp pci driver context
  * @acp70_base: acp mmio base
  * @acp_lock: used to protect acp common registers
+ * @info: SoundWire AMD information found in ACPI tables
+ * @sdw: SoundWire context for all SoundWire manager instances
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
  * @acp_rev : ACP PCI revision id
+ * @is_sdw_dev: flag set to true when any SoundWire manager instances are available
+ * @is_pdm_dev: flag set to true when ACP PDM controller exists
+ * @is_pdm_config: flat set to true when PDM configuration is selected from BIOS
+ * @is_sdw_config: flag set to true when SDW configuration is selected from BIOS
  */
 
 struct acp70_dev_data {
 	void __iomem *acp70_base;
 	struct mutex acp_lock; /* protect shared registers */
+	struct sdw_amd_acpi_info info;
+	/* sdw context allocated by SoundWire driver */
+	struct sdw_amd_ctx *sdw;
 	u32 addr;
 	u32 reg_range;
 	u32 acp_rev;
+	bool is_sdw_dev;
+	bool is_pdm_dev;
+	bool is_pdm_config;
+	bool is_sdw_config;
 };
 
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index a98407fa2cd2..24710ff2c124 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -5,6 +5,8 @@
  * Copyright 2024 Advanced Micro Devices, Inc.
  */
 
+#include <linux/acpi.h>
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -93,6 +95,100 @@ static int acp70_deinit(void __iomem *acp_base, struct device *dev)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_AMD_SOUNDWIRE)
+static int acp_scan_sdw_devices(struct device *dev, u64 addr)
+{
+	struct acpi_device *sdw_dev;
+	struct acp70_dev_data *acp_data;
+
+	acp_data = dev_get_drvdata(dev);
+	if (!addr)
+		return -ENODEV;
+
+	sdw_dev = acpi_find_child_device(ACPI_COMPANION(dev), addr, 0);
+	if (!sdw_dev) {
+		pr_err("%s No SoundWire devices found\n", __func__);
+		return -ENODEV;
+	}
+
+	acp_data->info.handle = sdw_dev->handle;
+	acp_data->info.count = AMD_SDW_MAX_MANAGERS;
+	return amd_sdw_scan_controller(&acp_data->info);
+}
+#else
+static int acp_scan_sdw_devices(struct device *dev, u64 addr)
+{
+	return 0;
+}
+#endif
+
+static int get_acp70_device_config(struct pci_dev *pci, struct acp70_dev_data *acp_data)
+{
+	struct acpi_device *pdm_dev;
+	const union acpi_object *obj;
+	u32 config;
+	int ret;
+	bool is_dmic_dev = false;
+	bool is_sdw_dev = false;
+
+	config = readl(acp_data->acp70_base + ACP_PIN_CONFIG);
+	dev_dbg(&pci->dev, "ACP_PIN_CONFIG:0x%x\n", config);
+	switch (config) {
+	case ACP_CONFIG_4:
+	case ACP_CONFIG_5:
+	case ACP_CONFIG_10:
+	case ACP_CONFIG_11:
+	case ACP_CONFIG_20:
+		acp_data->is_pdm_config = true;
+		break;
+	case ACP_CONFIG_2:
+	case ACP_CONFIG_3:
+	case ACP_CONFIG_16:
+		acp_data->is_sdw_config = true;
+		break;
+	case ACP_CONFIG_6:
+	case ACP_CONFIG_7:
+	case ACP_CONFIG_12:
+	case ACP_CONFIG_8:
+	case ACP_CONFIG_13:
+	case ACP_CONFIG_14:
+	case ACP_CONFIG_17:
+	case ACP_CONFIG_18:
+	case ACP_CONFIG_19:
+		acp_data->is_pdm_config = true;
+		acp_data->is_sdw_config = true;
+		break;
+	default:
+		break;
+	}
+
+	if (acp_data->is_pdm_config) {
+		pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP70_DMIC_ADDR, 0);
+		if (pdm_dev) {
+			/* is_dmic_dev flag will be set when ACP PDM controller device exists */
+			if (!acpi_dev_get_property(pdm_dev, "acp-audio-device-type",
+						   ACPI_TYPE_INTEGER, &obj) &&
+						   obj->integer.value == ACP_DMIC_DEV)
+				is_dmic_dev = true;
+		}
+	}
+
+	if (acp_data->is_sdw_config) {
+		ret = acp_scan_sdw_devices(&pci->dev, ACP70_SDW_ADDR);
+		if (!ret && acp_data->info.link_mask)
+			is_sdw_dev = true;
+	}
+
+	acp_data->is_pdm_dev = is_dmic_dev;
+	acp_data->is_sdw_dev = is_sdw_dev;
+	dev_dbg(&pci->dev, "is_pdm_dev:%d is_sdw_dev:%d\n", is_dmic_dev, is_sdw_dev);
+	if (!is_dmic_dev && !is_sdw_dev) {
+		dev_dbg(&pci->dev, "No PDM or SoundWire manager devices found\n");
+		return -ENODEV;
+	}
+	return 0;
+}
+
 static int snd_acp70_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -148,6 +244,13 @@ static int snd_acp70_probe(struct pci_dev *pci,
 	if (ret)
 		goto release_regions;
 
+	ret = get_acp70_device_config(pci, adata);
+	/* ACP PCI driver probe should be continued even PDM or SoundWire Devices are not found */
+	if (ret) {
+		dev_dbg(&pci->dev, "get acp device config failed:%d\n", ret);
+		goto skip_pdev_creation;
+	}
+skip_pdev_creation:
 	return 0;
 release_regions:
 	pci_release_regions(pci);
@@ -189,4 +292,5 @@ module_pci_driver(ps_acp70_driver);
 
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_DESCRIPTION("AMD ACP7.0 PCI driver");
+MODULE_IMPORT_NS("SND_AMD_SOUNDWIRE_ACPI");
 MODULE_LICENSE("GPL");
-- 
2.34.1

