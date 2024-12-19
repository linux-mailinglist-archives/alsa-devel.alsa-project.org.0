Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A120E9F7437
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:50:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F3476023C;
	Thu, 19 Dec 2024 06:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F3476023C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587447;
	bh=Q5aNoNoauKXY4uHDq9Qe4dllz1SyJPFBHOrMplBc084=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LYHwnA1d4rhYaHRxFvWpddaA8TRQkmhZQMMgJeJkoiOZDWYMuduvxHtjYXfxBFKZE
	 1RstktHZFnTxL/K26kwdV/RTud2AEJ8Ygn7XOnOioxJ2Xg3jbfLtGEKnqVKgFPqgeZ
	 Y+r68r89zkoWEXCWhm+n/xr1eyPK1htK94AYz07g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57BECF805C2; Thu, 19 Dec 2024 06:50:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10428F805BA;
	Thu, 19 Dec 2024 06:50:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FF39F804FC; Thu, 19 Dec 2024 06:50:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AE11F8014C
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AE11F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zGAY3eD2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLaMQi3XxWpeDyoxUqkWrd7BPgNV+Uaux9BmeDwfV8AnzJvPGGfYXroKW0lqK2esmxcCYrP/DGcPvKryf+2Vikaw9s8EK5eZFPBd9AJ++ruTt7n1BADJ58Hb1DXgJAmdmVToHgcc4Hx5MSKVI0GdP4r9RfU3w1EEBV0f7ujrADLvNfz/2+jsN3Jm8tOhRi5GaH9HgwomDPUVAHEDsVariBd5R6Fj2hqjBgQ9HTk/vmDQaRN8vpAPHp5xfkJdQ5JpI5OUWZPbBD+cSWqRRfQvXfkYUnBcDLG9fe+yM47J8yFFMsMu5JZfv8ThPnPO/PMboD1gLtVps6WMOXtypwLeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2d4RrV6LRK8gp/01u9Ug0u3GqsFw/mlkJXCD6vAyb0=;
 b=P/kR28q4N2PGX0kdngFnvzipPOwRqjxoAn3gRBU14j+ZoiCXEvXNhu4aZIHkCx9sTgqIBY8VmnPSxV6oNtVzHjO6559qV1WstqdBhhoXQ4uzwwjs1Xn8vNdYn8k/b8086kuI61D6gqC4DdaVAVsIe4gbURXulbwCNRKtF/NIMMfryc+hDUcBkvsFBAa0zdWNItMZeXsGIMo0lNXx+DEpkHthE26NtNFJopFs+E8F206Ygw1k9tlDfgUigdCJRpgMZBekNuZRMFnUSgObh96H2eyRbCs6wZ2M9uH6ouQmnMN2Wp88umhqi0ub6mSzYCTGISGIQqVIeqYDIXJ5DTa2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2d4RrV6LRK8gp/01u9Ug0u3GqsFw/mlkJXCD6vAyb0=;
 b=zGAY3eD2zGFEdN49EUHjBEzvDOGQ1RBeky/Fg89wmak10Q99+987h946lvqQ6hejlhH/0qlAsK444q7APdlT0OG1t9FxY+pAxpvUShQP9PQl/TKnP3dh1IJN1NkPwVUdUoDpPdScX/y36jazoT9BaIE7yQoYj9nMOhWmL9OMpEg=
Received: from CH0PR03CA0299.namprd03.prod.outlook.com (2603:10b6:610:e6::34)
 by CH2PR12MB9494.namprd12.prod.outlook.com (2603:10b6:610:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:50:12 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::10) by CH0PR03CA0299.outlook.office365.com
 (2603:10b6:610:e6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:50:12 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:49:21 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 02/21] ASoC: amd: acp70: add acp pci driver for ACP7.0 and
 ACP7.1 platforms
Date: Thu, 19 Dec 2024 11:18:38 +0530
Message-ID: <20241219054857.2070420-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|CH2PR12MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: af7ff5f8-fb3d-4dc8-1995-08dd1ff10138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z9MRR9kP4aQyVJs+T73jKsMPLPe7xmIRd8MNWJL7McueFd4ewevw1qlJu9t0?=
 =?us-ascii?Q?Hr6Gh0LEVRTpHpRPDVFWH0+kPBB7I7VsBBJbilR1Op+vGUkjLdbxR1u9lEj3?=
 =?us-ascii?Q?nRiaj+lTeyTCRvgXqgy/caZZ/t+FOg02pRhsd657l19uaUbMAaJ+VnwKT3b6?=
 =?us-ascii?Q?QvZ6/T4A9AtONomEFXhKZgtP57pu2m+BTKE60hBWo1Dqo0GaQXWBgTovYwxc?=
 =?us-ascii?Q?ww4P6+GUM5KvF+JS/J3vhe7me1Az7ICUN/U1kxEqD+z+HEMF0mWZWpgKV0Y4?=
 =?us-ascii?Q?wlD1TZA98Ip8JaXQOOXqI/viHLAwye5QKP+zinPlYoo3H5UOusnRdcuKy/LR?=
 =?us-ascii?Q?aAr1UKVUXiAP/cXwyPGOKbewwXQ8AdveHzjzuio3/kliSuB44bS2GYhEmEvZ?=
 =?us-ascii?Q?aMW6iaywdqL7rO6pqxxdjqPkMQyxImr+e2cic8OGMiTDVsDZW71hmxoCzUmA?=
 =?us-ascii?Q?uacS8JVKHpQrz6HBNjIGsnWVHq7dhAw8kETp4KMloagUVaNbOSrdgUkjv+J9?=
 =?us-ascii?Q?EYXPVDW01lUdSCt/+CYlWNDxfCInR81+Xkm6VUGgpIFb1dOZAXqJBeevrdOB?=
 =?us-ascii?Q?skpCIdN/0qp2ZrPsqhbfMn2yuW4tNCmsBM6TDRdi99ejwV8UGUaILz62zD1z?=
 =?us-ascii?Q?LdggXsqi8DfmFb85sPg2yRz0xEpHmWHnFEIPOjQn/q2D356+H+GYOE4FZc4N?=
 =?us-ascii?Q?Gp+RipLH67sOcbpMMhPgPHxAEBEtff46N2TDfpL9l5fOC3+wwQewuPbtFL6l?=
 =?us-ascii?Q?1Sl4062o8qhe5ijqHvcM5SEbYRhDJGKObnik2I1poO33ZBBYJgT3vIm7+CfO?=
 =?us-ascii?Q?T2bP+02NR6uSmQBXJ3xqsFi8D/9uOuFL1N71QQyRlrzfRjnwh2U5ZKWZXTIm?=
 =?us-ascii?Q?Awd6qGs/j98JiD+5Jh3So2wPOYh51iyJ+fDocDAt0rVhRJ0Q/U1OR8OrRm9U?=
 =?us-ascii?Q?cck9SI6Ch31RypLabakD4MpAhaVvpru89uhcLvCTzIHD5tJz6DqQG1bu0ejw?=
 =?us-ascii?Q?uL5WsFYttBDEZjQpioWhaUgqj3Co5DkcO+haUkdc3TuX2Hi4QeczFP/dUBjl?=
 =?us-ascii?Q?mhou8xeM7byiZcU9oOuLRuwadYyZWr+WNpGgX9BjqMVRYj4GWhnV46ot/SeE?=
 =?us-ascii?Q?P7+YCt7EleDKnzKhyTiidu0EEzHTOwpw8bbPeZ2EK6AUaVVfZvp747tcrRfj?=
 =?us-ascii?Q?4aZIfRuXLf2d8Fi67mXSdf842l4WuWpXEORa3qclvPY7umrouDNHnDsirUXv?=
 =?us-ascii?Q?W7kSDpzn7q2BjVcHFse5Mn0MLdC3bdM0/6/TtUppnHZehtM7/srG+A9YFKGK?=
 =?us-ascii?Q?E3GU1hzDD5XnIw9g9z1Atl61i70jTEvfS+vO3371ibsmzXqy8Jud1HtNippe?=
 =?us-ascii?Q?ySP3A8uW9RXQ1g5kVcJAJc9LmpU//+J0P5/PRNoAmhCidjJlJqPIYyeXGaGa?=
 =?us-ascii?Q?uq2s5+9EO64JWQEeOJ3MZ++pSVCMiIhji0MXcmmYL8OtEXUhb2RgNCpo52po?=
 =?us-ascii?Q?8RkEYtbq5xQ6FQk=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:50:12.3887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 af7ff5f8-fb3d-4dc8-1995-08dd1ff10138
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9494
Message-ID-Hash: W646FBBJHFLPWUA4RRBZCAHKP45OEWPP
X-Message-ID-Hash: W646FBBJHFLPWUA4RRBZCAHKP45OEWPP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W646FBBJHFLPWUA4RRBZCAHKP45OEWPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ACP is a PCI audio device.
This patch adds common PCI driver to bind to this device and get PCI
resources for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |  33 +++++++++++
 sound/soc/amd/acp70/pci-acp70.c | 100 ++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 sound/soc/amd/acp70/acp70.h
 create mode 100644 sound/soc/amd/acp70/pci-acp70.c

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
new file mode 100644
index 000000000000..28a46f0c2026
--- /dev/null
+++ b/sound/soc/amd/acp70/acp70.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ACP 7.0 platform Common header file
+ *
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <sound/acp70_chip_offset_byte.h>
+
+#define ACP_DEVICE_ID		0x15E2
+#define ACP70_REG_START		0x1240000
+#define ACP70_REG_END		0x125C000
+#define ACP70_PCI_REV		0x70
+#define ACP71_PCI_REV		0x71
+
+/**
+ * struct acp70_dev_data - acp pci driver context
+ * @acp70_base: acp mmio base
+ * @acp_lock: used to protect acp common registers
+ * @addr: pci ioremap address
+ * @reg_range: ACP reigister range
+ * @acp_rev : ACP PCI revision id
+ */
+
+struct acp70_dev_data {
+	void __iomem *acp70_base;
+	struct mutex acp_lock; /* protect shared registers */
+	u32 addr;
+	u32 reg_range;
+	u32 acp_rev;
+};
+
+int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
new file mode 100644
index 000000000000..23e47f619bd7
--- /dev/null
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AMD common ACP PCI driver for ACP7.0 & ACP7.1 platforms
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include "../mach-config.h"
+
+#include "acp70.h"
+
+static int snd_acp70_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
+{
+	struct acp70_dev_data *adata;
+	u32 addr, flag;
+	int ret;
+
+	/* Return if acp config flag is defined */
+	flag = snd_amd_acp_find_config(pci);
+	if (flag)
+		return -ENODEV;
+
+	/* Pink Sardine device check */
+	switch (pci->revision) {
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		break;
+	default:
+		dev_dbg(&pci->dev, "acp70 pci device not found\n");
+		return -ENODEV;
+	}
+	if (pci_enable_device(pci)) {
+		dev_err(&pci->dev, "pci_enable_device failed\n");
+		return -ENODEV;
+	}
+
+	ret = pci_request_regions(pci, "AMD ACP6.2 audio");
+	if (ret < 0) {
+		dev_err(&pci->dev, "pci_request_regions failed\n");
+		goto disable_pci;
+	}
+	adata = devm_kzalloc(&pci->dev, sizeof(struct acp70_dev_data),
+			     GFP_KERNEL);
+	if (!adata) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+
+	addr = pci_resource_start(pci, 0);
+	adata->acp70_base = devm_ioremap(&pci->dev, addr,
+					 pci_resource_len(pci, 0));
+	if (!adata->acp70_base) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+	adata->addr = addr;
+	adata->reg_range = ACP70_REG_END - ACP70_REG_START;
+	adata->acp_rev = pci->revision;
+	pci_set_master(pci);
+	pci_set_drvdata(pci, adata);
+	mutex_init(&adata->acp_lock);
+	return 0;
+release_regions:
+	pci_release_regions(pci);
+disable_pci:
+	pci_disable_device(pci);
+
+	return ret;
+}
+
+static void snd_acp70_remove(struct pci_dev *pci)
+{
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+}
+
+static const struct pci_device_id snd_acp70_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
+	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
+	.class_mask = 0xffffff },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, snd_acp70_ids);
+
+static struct pci_driver ps_acp70_driver  = {
+	.name = KBUILD_MODNAME,
+	.id_table = snd_acp70_ids,
+	.probe = snd_acp70_probe,
+	.remove = snd_acp70_remove,
+};
+
+module_pci_driver(ps_acp70_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP7.0 PCI driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

