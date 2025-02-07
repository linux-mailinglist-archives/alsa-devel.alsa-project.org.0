Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3263AA2BB66
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:30:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 837A460215;
	Fri,  7 Feb 2025 07:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 837A460215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909843;
	bh=Gf7bEHG/CMU/TB+h1cgdIPi29n74wBNxnyJUAuuezDw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UEchQ4nRvI2Iu06ygZ5wxyF6A6JUyKAaYvhGHE7XTx7afdODq+YO0T8qM1YzmxKJT
	 Hlt/tQibXXlZLGAfk2HLeScOocPrPxnrXOr1L/TBo4KY1GWPLQsblZkfF7gUCrf4oK
	 aNkJ3leUdKCZR0h6sM5XQtAge9YDYstE9VUC+mr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEF4DF80676; Fri,  7 Feb 2025 07:29:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6535AF8065E;
	Fri,  7 Feb 2025 07:29:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E44B0F8061F; Fri,  7 Feb 2025 07:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0AE7F805DA
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:28:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0AE7F805DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ONmeFXJc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hh1lCQsqtq41m1WYld3VUhBtD0lhPqzlJ2nkrC0ieJxIOWICeCTAlf4pBb078lOOe4Cz1M4bXIRPuK37hYftTIXsyOt3BLUiUkC7vFPMnOKUr4YtKtXd0j9Gals9JfpAVDbF/0r6VUC78G13SnJqOH22q0557Kzk7QHe+8HkDyI9IlE47YnCZd07WljbuS+83BI+hO0RuLKHxXUHBIVTLXDaRvfKTfN71m9BQiEHs3OgMYwC8uEa3sPqHHFWI3jk0mF4P4HtZt+yqW9wn99DVV95Y0RDKhRcLF8WY64hg9xAhLWsijVjMgYSo4jNHEUwA5NPLBosTBKlgoD5Al2hQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUvtiW809Q5jTxtwb7JHhDmnRLq60R7x08pFNmhX5zA=;
 b=gseqTJnKi/SwHmzHg9KQ3VIQSU+EijzDHBqGYIPsgR/bx5zcM5vvFqzK4TrYmgmh1QwcHvzHCZoZhGfA+3S8yZ50qUWSedoEaD0c3CMo4mTQFAl+adyY+kqmnRSomkpTnBP3LlAcDai/71XPtVd6Bt3ofVPpSuRcGLbJskrm+pyhuPFCrsSQySvX/YCvYrnEeWolVNqvqEOBwMyNJpZnPqsnk2kFfvMNjJrRthXw7QVxlagm6hycFEiusMOqwKemVxBdtvhFluzfv1PhCebThOwqPQBZLs9tf9OauaDJ3N1I5YmL1QLfeQkrK7c5ggN3DXoaJLMbayKQfFd1MaZg/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUvtiW809Q5jTxtwb7JHhDmnRLq60R7x08pFNmhX5zA=;
 b=ONmeFXJcor7YhM2UV5plVK/dNMkyC1YpDolLnk9gZRq2SvFnBcva3I7CWFDl2YyQU8YVrBOCiuHK0qtE5OS2pezT1Rs2rYZ3QoT4pajdQZEqdFeDEKwUebVeTc6u/PBAuXM8uzN9DQpzCX5dvJqw4eqeNZdA1WXrqmQ3Ovn2Cic=
Received: from BN9PR03CA0937.namprd03.prod.outlook.com (2603:10b6:408:108::12)
 by LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 06:28:55 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::2c) by BN9PR03CA0937.outlook.office365.com
 (2603:10b6:408:108::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.20 via Frontend Transport; Fri,
 7 Feb 2025 06:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:28:55 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:28:51 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 05/25] ASoC: amd: ps: add callback to read acp pin
 configuration
Date: Fri, 7 Feb 2025 11:57:59 +0530
Message-ID: <20250207062819.1527184-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|LV2PR12MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 175de39d-1f26-4bd1-bfad-08dd4740b286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VNW1Ep81Cgnmgy0R17X3DrtNMT2B0lo/RY9bQLw/+FNFBx1fy3lFcsiPr0Oq?=
 =?us-ascii?Q?5au53hRZ3icGxfKTTVshW6cnonyXv8RfXoIclr6uVAaY7NHkTB4Pp6mIbzaI?=
 =?us-ascii?Q?K8zrV8A5xO5inTNoqZf4kJY2uJx0GvvwZs12mf1htyo/PAkKW6t1Xos15iFY?=
 =?us-ascii?Q?e3ROV715X+YBA7BgLG1x480cGyUR8M0RL4NaYl10ntrpqRx6k4G3E3fipJrp?=
 =?us-ascii?Q?wTHyzFtK2xsgw8g44lmrrovZecpJIkWEjNAV+H1f6DIubxnz0ixSX+0ewwMV?=
 =?us-ascii?Q?UGaTbQk8EK2nmnNBn8HLKVPPpyqAk7dFAQ51mDnfX5827QUiVZVgsSma8msA?=
 =?us-ascii?Q?AAKdLbxLGRH8NJYQwhF8OJLenpPczbLXQXDiWYhUare98BH0AOyrkgZ7cWEN?=
 =?us-ascii?Q?N4Q+dABY7gK+M/FgKjm8RDGWmhQHF0ZBz74hp/KZhxrFo2C7bAvsnLvyfXaE?=
 =?us-ascii?Q?b7IjHIsgXk9fdYwUhLYgPEPxuSNx4ULViAsOi6wHAxs5cc1rIf5eSPe7ClFS?=
 =?us-ascii?Q?cuKHEhsKSGpZfyDWCZt4sETQhtP0B762n/ng0uRDpZ8DjARIIRBUNmZpSjyH?=
 =?us-ascii?Q?I3SpSC5ETf1YZYOLdQuz8Y0tRnUjAraz77XXz+Uw8v+eimvwYb3+QMbdNpgK?=
 =?us-ascii?Q?8H+lYcPW3DYBfJV6V69e+JZWAr9ofYfd3K3QWavKiXJMBptfZvQ5dXsU9B7u?=
 =?us-ascii?Q?BN7a4ZcrClWyiXKWeVpMdv1grPu4SdjgFFQOo+FX1f1P4GqxDy0jiKOmGElL?=
 =?us-ascii?Q?YjV8Z7is1bewzlV71C9cLDzuWWSAqmbOCh6SQlvJx4G5OVqm4Z3d2b1bt1kz?=
 =?us-ascii?Q?CS3qn0R443bzBNiXa/B/8Cbtq8WGkYV6N5KWPwXTUh4RBQwhSXm99npfxVnK?=
 =?us-ascii?Q?cZlicwpOkQ5TAwt04F5zinCE447lZj61Fa5HEBW2u/72br6RmpwW+qRTDMhN?=
 =?us-ascii?Q?OQHqnq9K7IAb2qzaRJ1bQNIdEB6EZsWlkz8l0g07T/P3mjpSCGPJ/h3ytbB2?=
 =?us-ascii?Q?4D+bq015X2+jNcVZMBTF1xD+FWDhiKuHxWKJwG0tzQypjxJSqJf6UKP6aGVv?=
 =?us-ascii?Q?B3DiqkH7FTqUfxmIaATjLQYeG5V9DsKtzhINLyqy1Wd0rb1HBlm6d3jZwDrU?=
 =?us-ascii?Q?VEoIrk+ShfsVwfR3tfl1S1XWoOetgkCfqw1aWnT4PlkRQ6MORdaGy/2IOt5t?=
 =?us-ascii?Q?yX6+9Wf25GlJ0EXw36HmOJe7+MWIo5ZIo72ppi4Pt9DyhKB26DGHmeRvl92I?=
 =?us-ascii?Q?iNq1DmHxvGF7yap4kTzoVAYK6Mbv+Myn/aV+IEeaSZ6QJ2iwFqa/loUD5DRv?=
 =?us-ascii?Q?/lF92FuacG5XEI86twNHadKcMmXYCAZ6hKP0tYDK2ZkGWvB0vZo/NoWsYX53?=
 =?us-ascii?Q?2ABt1q1OmopKPe8mvYEqwKbbJOMafTHYVSHsH0B9m1+ftJzV1Tax5a8gIxnD?=
 =?us-ascii?Q?rI5i+o6PqyDmdZ+o24er5voXqozTbshV5S7sQXDYEEkvdDnXpQud9WPYf1+H?=
 =?us-ascii?Q?aHQ7VHKpz0iQs34=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:28:55.4195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 175de39d-1f26-4bd1-bfad-08dd4740b286
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846
Message-ID-Hash: 255TNH2DONYZIJKLFKBABSOPH3XYQ4O3
X-Message-ID-Hash: 255TNH2DONYZIJKLFKBABSOPH3XYQ4O3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/255TNH2DONYZIJKLFKBABSOPH3XYQ4O3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pci driver callback to read acp pin configuration for
ACP6.3 platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h     |  8 ++++++++
 sound/soc/amd/ps/pci-ps.c    | 26 +-------------------------
 sound/soc/amd/ps/ps-common.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 4e3f7eaac040..a918a988e4d8 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -221,6 +221,7 @@ struct acp63_dev_data;
  * struct acp_hw_ops - ACP PCI driver platform specific ops
  * @acp_init: ACP initialization
  * @acp_deinit: ACP de-initialization
+ * @acp_get_config: function to read the acp pin configuration
  * acp_suspend: ACP system level suspend callback
  * acp_resume: ACP system level resume callback
  * acp_suspend_runtime: ACP runtime suspend callback
@@ -229,6 +230,7 @@ struct acp63_dev_data;
 struct acp_hw_ops {
 	int (*acp_init)(void __iomem *acp_base, struct device *dev);
 	int (*acp_deinit)(void __iomem *acp_base, struct device *dev);
+	void (*acp_get_config)(struct pci_dev *pci, struct acp63_dev_data *acp_data);
 	int (*acp_suspend)(struct device *dev);
 	int (*acp_resume)(struct device *dev);
 	int (*acp_suspend_runtime)(struct device *dev);
@@ -303,6 +305,12 @@ static inline int acp_hw_deinit(struct acp63_dev_data *adata, struct device *dev
 	return -EOPNOTSUPP;
 }
 
+static inline void acp_hw_get_config(struct pci_dev *pci, struct acp63_dev_data *adata)
+{
+	if (adata && adata->hw_ops && adata->hw_ops->acp_get_config)
+		ACP_HW_OPS(adata, acp_get_config)(pci, adata);
+}
+
 static inline int acp_hw_suspend(struct device *dev)
 {
 	struct acp63_dev_data *adata = dev_get_drvdata(dev);
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index a37fb6172958..96399acf906c 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -299,7 +299,6 @@ static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *a
 	const union acpi_object *obj;
 	acpi_handle handle;
 	acpi_integer dmic_status;
-	u32 config;
 	bool is_dmic_dev = false;
 	bool is_sdw_dev = false;
 	bool wov_en, dmic_en;
@@ -309,30 +308,7 @@ static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *a
 	wov_en = true;
 	dmic_en = false;
 
-	config = readl(acp_data->acp63_base + ACP_PIN_CONFIG);
-	switch (config) {
-	case ACP_CONFIG_4:
-	case ACP_CONFIG_5:
-	case ACP_CONFIG_10:
-	case ACP_CONFIG_11:
-		acp_data->is_pdm_config = true;
-		break;
-	case ACP_CONFIG_2:
-	case ACP_CONFIG_3:
-		acp_data->is_sdw_config = true;
-		break;
-	case ACP_CONFIG_6:
-	case ACP_CONFIG_7:
-	case ACP_CONFIG_12:
-	case ACP_CONFIG_8:
-	case ACP_CONFIG_13:
-	case ACP_CONFIG_14:
-		acp_data->is_pdm_config = true;
-		acp_data->is_sdw_config = true;
-		break;
-	default:
-		break;
-	}
+	acp_hw_get_config(pci, acp_data);
 
 	if (acp_data->is_pdm_config) {
 		pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_DMIC_ADDR, 0);
diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
index 7643f321be37..30e9e5fe034b 100644
--- a/sound/soc/amd/ps/ps-common.c
+++ b/sound/soc/amd/ps/ps-common.c
@@ -12,6 +12,7 @@
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
@@ -98,6 +99,37 @@ static int acp63_deinit(void __iomem *acp_base, struct device *dev)
 	return 0;
 }
 
+static void acp63_get_config(struct pci_dev *pci, struct acp63_dev_data *acp_data)
+{
+	u32 config;
+
+	config = readl(acp_data->acp63_base + ACP_PIN_CONFIG);
+	dev_dbg(&pci->dev, "ACP config value: %d\n", config);
+	switch (config) {
+	case ACP_CONFIG_4:
+	case ACP_CONFIG_5:
+	case ACP_CONFIG_10:
+	case ACP_CONFIG_11:
+		acp_data->is_pdm_config = true;
+		break;
+	case ACP_CONFIG_2:
+	case ACP_CONFIG_3:
+		acp_data->is_sdw_config = true;
+		break;
+	case ACP_CONFIG_6:
+	case ACP_CONFIG_7:
+	case ACP_CONFIG_12:
+	case ACP_CONFIG_8:
+	case ACP_CONFIG_13:
+	case ACP_CONFIG_14:
+		acp_data->is_pdm_config = true;
+		acp_data->is_sdw_config = true;
+		break;
+	default:
+		break;
+	}
+}
+
 static bool check_acp_sdw_enable_status(struct acp63_dev_data *adata)
 {
 	u32 sdw0_en, sdw1_en;
@@ -183,6 +215,7 @@ void acp63_hw_init_ops(struct acp_hw_ops *hw_ops)
 {
 	hw_ops->acp_init = acp63_init;
 	hw_ops->acp_deinit = acp63_deinit;
+	hw_ops->acp_get_config = acp63_get_config;
 	hw_ops->acp_suspend = snd_acp63_suspend;
 	hw_ops->acp_resume = snd_acp63_resume;
 	hw_ops->acp_suspend_runtime = snd_acp63_suspend;
-- 
2.34.1

