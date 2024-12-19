Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F49A9F7453
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:54:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99B776028A;
	Thu, 19 Dec 2024 06:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99B776028A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587681;
	bh=AB6y6aUGKAIcu/7XQQX9E2MkkO8GRA/yMdNiZrdQ8M0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uMyWAQY2+Z2J1ukaEeaclLkufMxSmJrhsVMQQolLiV6dSvxJPNN/409DOWV6hLoLO
	 klGEaTEhEiaszRumos2c7+hrBGi4//QrDEzHKmlozlciySGrcCF9WW/H5m3A4QhEJn
	 FYAVivBhrdw72Il2SZy1a0ysG0u2Qab6rxGrRrMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A566AF806F8; Thu, 19 Dec 2024 06:51:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13175F805B2;
	Thu, 19 Dec 2024 06:51:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8103F806F0; Thu, 19 Dec 2024 06:51:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8781FF806DE
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8781FF806DE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OaDVN5CG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMYVPucyyE/LOECddeDgqUIDAjEbal0kFl1fq/fvCqHH400Y0HAEYOJ+7CCzo/Uq7uNP9DFspx+03TPDTkrSWn+imwsL2N4eHpacGEySSrOtW/jDB7lzJ+gbX51LeNyfUVLBQ1t+4Y5HAj0xu4JaZOl/OOykXBWVItxI3we499dNgW+Ieihf92hBoaK3vcEBXhXri1PH24uKM4hfH/NWZrC3/Rg25HmC79PjefuO8v3Ugo6TPsLtFlC2vnTxNJ6ZeMVXkJS2ESIDJ9zVw0T27wHVFIrzbUPOP532v+Pe/krTiXburHl0CIvEvJ8/CY9wzkeNaVSwTtrAs4iU+Ywm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hV+Tox7gKmYWATNT5Lh70sD5S3ZwApVIAEgawlfLhPY=;
 b=enVTINtNsG3XeHwk8py6Q9OAGBfZgBK7wLoacU3nSs7FIKfy722G/9CmKFVdGeE2vfO+QVUASaFefxiQ28uW4Zft8OSlTpJYVkWsUg+qYIFdvgEKxc+AfrzMdwDOXaWBBbDpxSv0QWFlVB2q8SPOva0w2l3uUhrBooSM7LkI8rLMGZfvyNLnxAYaoh17WlF99rEPH0Rnu2g78H2XMxBL8ZwzICFWl5TRpYWkgDd9/rtxeMqlhsL06f76ZUP75cAHiIcUkT/qAIc6sJsjq1toPFRxWm+7/A7k41iwD/kV2wjzoVbNz+Ux2iKqhkhoAw4pr30XBgleh1OP6ZunHnpegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV+Tox7gKmYWATNT5Lh70sD5S3ZwApVIAEgawlfLhPY=;
 b=OaDVN5CGOWdrs3S09oNDdkcP5xNMNDOgRCzNVZMR3Y1uXQCGRucCLDOsvNEFPc1UHd2Z+xYze4aoksLxNgCjFvUjxZl8oya4ELEa3TXf1cEZTDbJtQ3rzQmSOcNU2KH9VZFRoVUv7pZAUOBcaAtB582dkxSYgKJ82yTexX5OmVw=
Received: from CH2PR18CA0056.namprd18.prod.outlook.com (2603:10b6:610:55::36)
 by MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:51:40 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::47) by CH2PR18CA0056.outlook.office365.com
 (2603:10b6:610:55::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Thu,
 19 Dec 2024 05:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:39 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:36 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 15/21] ASoC: amd: acp70: add acp driver pm ops support
Date: Thu, 19 Dec 2024 11:18:51 +0530
Message-ID: <20241219054857.2070420-16-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|MW4PR12MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f1d138-9ae0-4dba-6719-08dd1ff13563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lpzUXEugqxl1p8WS8kC2/2N1MhOUr5qKVBbAA3wSQcmuBG2QwNeFXs5tCE/5?=
 =?us-ascii?Q?oGhFSG+RNuvKEusSyUIi973RyQ5DWwCHTIM4du5/MCskfZiBpyEBR+lznq2k?=
 =?us-ascii?Q?vhF2hOvje9mfdSP01zzP5X83wcAiJg/oBLcQMBKDVdqO2GnD3VwKJXB47PIP?=
 =?us-ascii?Q?AbjgfZ7SRrBZ9doTvara8Wd421nAv6SRy4xHlHKgCVOufXWKb79E+q3q2+7y?=
 =?us-ascii?Q?oxywTUCZsj0LSrXdwX5X5GCxAFoPkfaLkKup6DzI3jK0WD6bEvku4GTTYZZq?=
 =?us-ascii?Q?9mfFRyBFp4LjBdKU2r+36+YhYLmBApIvDzYQOYBDCU3HHzID/GK2c3uKstQu?=
 =?us-ascii?Q?7nJ2yPYZQglov1CULQNIFs7LlQTr4/QG9A2YeX5qjkle5dfHLhim4qzPFVSh?=
 =?us-ascii?Q?gASBOncyPuhpbDr3L2Nm0sDZMiaQkgkFwGu2o9+pQ7/YrjHF9cdhcZd/M7o8?=
 =?us-ascii?Q?ia3pd5u55pkGQfW9c1habtHrXYLmHSBqaMdHMKXZPzPR8+ue4VgUiKPG0SeC?=
 =?us-ascii?Q?ZaBWz6YINe3u8n50ZXvjaH8HoQ2wVCeZ/NpO17aC7TfYbMAJrNEshfWgGev/?=
 =?us-ascii?Q?IprX+dwhYRcR4S9z1diySSvdhMrld6CjFjT8WpcSeXbFlX3ZXKSSvSA0sWr6?=
 =?us-ascii?Q?c1culizQBGC5Ilg870wpRjQJPWJfvGEEgTAQuhNpiunarJ4jQtNKZQT0KcE+?=
 =?us-ascii?Q?dkbxNVKn1g3jk+2B3nzLrcR+Bg0kmzUQHb2xdZlnc4iTd9jortXzadid9iEk?=
 =?us-ascii?Q?7XSsGm+fE7UimQFRCu71URoWNUq1K4kNnp3KlgEq1QbW262M7N9jdiPeBA4t?=
 =?us-ascii?Q?gnfqmGEEVqnvZvj71Acz1/r4KuxMnaQYPxlhKVyqsrIgbmyCKqIMLBxtxRSj?=
 =?us-ascii?Q?tsFrJ5oaMSFQ5x/SfzNJvngWRGtbI0h+UHZGFjIpNgXAzRe275qijc3T8Ckn?=
 =?us-ascii?Q?tQXyMDuWSMBAzKYEvEKsmD/wRtpyHG3M+yaeiabNdXFNUKZVoR4vyznbEx9N?=
 =?us-ascii?Q?90d0hrtRbb1/dzZhlslwgX57OTlZcoEonG5/MWx1ou6ElU8RFcNpc9M4MNvY?=
 =?us-ascii?Q?aOnlaTiPdZ9+BX6Y1VkilBJDrunxPm7gF4Gz7VeAh+BYcdYxFBkbASTOJHlS?=
 =?us-ascii?Q?NMbCxl4jGHlws0bz3ID/Bvpreq3+TLPkgHXEBGAcwcoc4RPr7W2Ivw6ge+23?=
 =?us-ascii?Q?aVJA2buTUu8zmaNgFf1TL8a+0Pw+pb6M4mZE/qWCs9E0OICiiEiUxEhHCXGT?=
 =?us-ascii?Q?0VcTcbSlUiXiREcQa7BSpaEsZ7Nk0Iehv67hId8SIqYafeLMLAEfswXuwEVG?=
 =?us-ascii?Q?E03gcBqrUEkPetJfQMihJ5zY1SmvrBLLerDu3CoM5ERwp6OPiOsM5m3krJZF?=
 =?us-ascii?Q?NvYOPCoMrWpgOOa6JxaWGPZaaEZGk2OukbjT2lCuRm7IlyWfrcxAHLdRrlem?=
 =?us-ascii?Q?62gEoiAhCR58pG6OO/k5wUcKJ9c9QxIfBxh9gqg4HCh8LoELelWRwaWliVbP?=
 =?us-ascii?Q?yICyFZ9QHiOWKng=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:39.8983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25f1d138-9ae0-4dba-6719-08dd1ff13563
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778
Message-ID-Hash: LCL2LWK3ZJDUDFLDOUN5HZ6ISMXXI4BJ
X-Message-ID-Hash: LCL2LWK3ZJDUDFLDOUN5HZ6ISMXXI4BJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCL2LWK3ZJDUDFLDOUN5HZ6ISMXXI4BJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pm ops support for ACP7.0 PCI driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |   4 ++
 sound/soc/amd/acp70/pci-acp70.c | 106 ++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index 1d8e670264fc..1b5661a86352 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -60,6 +60,8 @@
 
 #define ACP_SDW0_STAT			BIT(21)
 #define ACP_SDW1_STAT			BIT(2)
+#define ACP_SDW0_PME_STAT		BIT(26)
+#define ACP_SDW1_PME_STAT		BIT(27)
 #define ACP_ERROR_IRQ			BIT(29)
 
 #define ACP_AUDIO0_TX_THRESHOLD		0x1c
@@ -247,6 +249,7 @@ struct sdw_dma_dev_data {
  * @is_pdm_dev: flag set to true when ACP PDM controller exists
  * @is_pdm_config: flat set to true when PDM configuration is selected from BIOS
  * @is_sdw_config: flag set to true when SDW configuration is selected from BIOS
+ * @sdw_en_stat: flag set to true when any one of the SoundWire manager instance is enabled
  */
 
 struct acp70_dev_data {
@@ -268,6 +271,7 @@ struct acp70_dev_data {
 	bool is_pdm_dev;
 	bool is_pdm_config;
 	bool is_sdw_config;
+	bool sdw_en_stat;
 };
 
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index e732a680c092..3cca18612ef1 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -15,6 +15,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <sound/pcm_params.h>
+#include <linux/pm_runtime.h>
 #include "../mach-config.h"
 
 #include "acp70.h"
@@ -554,6 +555,10 @@ static int snd_acp70_probe(struct pci_dev *pci,
 		goto de_init;
 	}
 skip_pdev_creation:
+	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_allow(&pci->dev);
 	return 0;
 de_init:
 	if (acp70_deinit(adata->acp70_base, &pci->dev))
@@ -566,6 +571,102 @@ static int snd_acp70_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static bool check_acp_sdw_enable_status(struct acp70_dev_data *adata)
+{
+	u32 sdw0_en, sdw1_en;
+
+	sdw0_en = readl(adata->acp70_base + ACP_SW0_EN);
+	sdw1_en = readl(adata->acp70_base + ACP_SW1_EN);
+	return (sdw0_en || sdw1_en);
+}
+
+static void handle_acp70_sdw_pme_event(struct device *dev)
+{
+	struct amd_sdw_manager *amd_manager;
+	struct acp70_dev_data *adata;
+	u32 ext_intr_stat1;
+
+	adata = dev_get_drvdata(dev);
+	ext_intr_stat1 = readl(adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+	dev_dbg(dev, "ext_intr_stat1: 0x%x\n", ext_intr_stat1);
+	if (ext_intr_stat1 & ACP_SDW0_PME_STAT) {
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
+		if (amd_manager)
+			pm_request_resume(amd_manager->dev);
+	}
+
+	if (ext_intr_stat1 & ACP_SDW1_PME_STAT) {
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
+		if (amd_manager)
+			pm_request_resume(amd_manager->dev);
+	}
+}
+
+static int __maybe_unused snd_acp70_suspend(struct device *dev)
+{
+	struct acp70_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	writel(0x1, adata->acp70_base + ACP_PME_EN);
+	if (adata->is_sdw_dev) {
+		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
+		if (adata->sdw_en_stat)
+			return 0;
+	}
+	ret = acp70_deinit(adata->acp70_base, dev);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+
+	return ret;
+}
+
+static int __maybe_unused snd_acp70_runtime_resume(struct device *dev)
+{
+	struct acp70_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	writel(0x1, adata->acp70_base + ACP_PME_EN);
+
+	if (adata->sdw_en_stat)
+		return 0;
+
+	ret = acp70_init(adata->acp70_base, dev);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+
+	if (!adata->sdw_en_stat)
+		handle_acp70_sdw_pme_event(dev);
+
+	return 0;
+}
+
+static int __maybe_unused snd_acp70_resume(struct device *dev)
+{
+	struct acp70_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	writel(0x1, adata->acp70_base + ACP_PME_EN);
+
+	if (adata->sdw_en_stat)
+		return 0;
+
+	ret = acp70_init(adata->acp70_base, dev);
+	if (ret)
+		dev_err(dev, "ACP init failed\n");
+
+	return ret;
+}
+
+static const struct dev_pm_ops acp70_pm_ops = {
+	SET_RUNTIME_PM_OPS(snd_acp70_suspend, snd_acp70_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(snd_acp70_suspend, snd_acp70_resume)
+};
+
 static void snd_acp70_remove(struct pci_dev *pci)
 {
 	struct acp70_dev_data *adata;
@@ -583,6 +684,8 @@ static void snd_acp70_remove(struct pci_dev *pci)
 	ret = acp70_deinit(adata->acp70_base, &pci->dev);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -600,6 +703,9 @@ static struct pci_driver ps_acp70_driver  = {
 	.id_table = snd_acp70_ids,
 	.probe = snd_acp70_probe,
 	.remove = snd_acp70_remove,
+	.driver = {
+		.pm = &acp70_pm_ops,
+	}
 };
 
 module_pci_driver(ps_acp70_driver);
-- 
2.34.1

