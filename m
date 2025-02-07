Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E037A2BB64
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:30:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFEE9601E7;
	Fri,  7 Feb 2025 07:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFEE9601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909827;
	bh=V2LUQ6h0wzCCaSs4Ip98dMXlJpoHEIy3cjIDAudEctM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gJjNzkb4UGke2H1wTJ+84XjM92IqFhmqLPUgJbpVv/uY6Q7QDNzVAeyEOr3qF/GsX
	 GYdOKNsY50Yg9BvqVszE1bHJkRa7L1opJlF0ZRafwU5vkb08ipxdHlu+eK4+EVk+DH
	 YK0y8Nye0bxWfRtHQGDdhkBaTIwnb2Xp6T7guUJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B3A8F80634; Fri,  7 Feb 2025 07:29:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A26DF80633;
	Fri,  7 Feb 2025 07:29:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AB8EF8061E; Fri,  7 Feb 2025 07:28:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 826DDF805DA
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 826DDF805DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lWoGdbhu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJNaXt+HPdrKS9mY5lr7lcwx98PPB+A0ivWwS2AWW1uZt2SXIRKftat6PoI4y7wLI0yPxQtcp9UZVviWTuzNVkWeAlbBQvD8vxL6AD98vZ/NtdcOlJIr1jIuZbLYcHyaIcZzWrlq0dodPW/PT3Do+pyFR0Na5lZni+eIdDxedxn8CZGfCGfASbpknIlX7XKbBiSOesqi4ccuFManZHITFIUWyY/oj6/DyLzwucvpoUm+GQ4sR6rVogxfWWvsMYRZe4f4SXo/5V2JD90kIJ1bLMg33v97i925oiZ2u7KWInff5wYnMBJHw/FFSRIGUjS/DCcq0qWCsfmEjME56aEhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fx1dli4Mz237zc52sFYv3MGB7z41PA3KAPTU6i+Fq08=;
 b=PenZCWCcSmiYfYLPuOMbaSmgqJWxJGMFQ3iCl9PbIPiaUddKteNGi/vbtn20tBVC/gzKofludDk3jK/QIwgqWj+Hwuob9hAavlg9gOPzdTLxdToDWRJnqkWHlavxMeLqrKrfcT6amZbYIBou+y0+zgRJ1P2PMWrvNUGWK05ByDrd/GGKBCEWILdp36kQ3lV4uQuzkVnaF6yFkUbd1pertdMkCMVp966xSGo9RugJ0FDeVgCOFoPRWHs4LbiBkHXUOtr5D0XHIXKjM5B064/G8iJ20wjnWn9piKBHgdp7W3ix6fCyAw0lTz9091F/e8Qa4yaJVUxSzdHEuV3ZdnJNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fx1dli4Mz237zc52sFYv3MGB7z41PA3KAPTU6i+Fq08=;
 b=lWoGdbhuibby8FCTyBY0y3syiuT+CRYgS5fBh4eIxn8umAK63B45jazPTp/ouZVv8KEcXXdeKYB5iUb3LzWoYY0ftQNFkO7A4goQFLRddKGfVH8oZrpPZA9cLHh2KkA4X1mUywfkHZmQbd4T1TK7oo/W3ZkM0VFn0LyR7gqKKOg=
Received: from BN9PR03CA0934.namprd03.prod.outlook.com (2603:10b6:408:108::9)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Fri, 7 Feb
 2025 06:28:47 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::aa) by BN9PR03CA0934.outlook.office365.com
 (2603:10b6:408:108::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.29 via Frontend Transport; Fri,
 7 Feb 2025 06:28:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:28:47 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:28:43 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 03/25] ASoC: amd: ps: add acp pci driver hw_ops for acp6.3
 platform
Date: Fri, 7 Feb 2025 11:57:57 +0530
Message-ID: <20250207062819.1527184-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b517c0-def0-4ea4-45a6-08dd4740addc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?o2zP55nMuh/1ELmqcHAE3RJcqCGwBni1oeSJm1dU/YJL0MuO4WY6H9gXhfgh?=
 =?us-ascii?Q?gl17XW7OQry59mrRBkxqIWEOvDGmN4PtG2l8S46JgfTPloNBVAwyPwQoo75t?=
 =?us-ascii?Q?0oces9QeOcv8wOi/aKxLtGyFGnP19C3BmX/xa9BR89Mgl582m0zUI0p/LJDg?=
 =?us-ascii?Q?zGPoRSqaJdCtAZOG4yuOyk6uLsdHRWYkRiZJBTBXSZ2tRw66mwJUc7xjsS/e?=
 =?us-ascii?Q?y3L2fWGr2RYuD8ox8zinExxeTnUqzvDBfXBEgz0NhlYV+aHKW43d6BDOETqZ?=
 =?us-ascii?Q?mPNfeKWNmfw6A6HGdnCUsV/aQXd5hfVMRh3co9VH7bH94BNSXm/+YPJDuHRF?=
 =?us-ascii?Q?P2a+RxydvxdzIjFZuSYHjupCGl9AlINd+WypG6vcQshS8Fz5KYiY4eZg3Ccn?=
 =?us-ascii?Q?QI/EinqsuriWydgNEe69HiJ3MfBde9Qqyk1goKZiP38ZM67ySQoN3kcSpCVG?=
 =?us-ascii?Q?/owCCDxUJTQ2dbP0VPOiN2leMU8aX2Q7bXQkrLwSd+JETBWKPHdcztiMVSc7?=
 =?us-ascii?Q?9i1QxLNjODZHNHrwVvFNnCCoLxGUQWhT2djDGapGGi86+pVEPjV1rAOv3/+6?=
 =?us-ascii?Q?Atd7QO7gDzYyKzwR0jQNx3eMXgMoQJDCXxs594Zr0GQpbi+moj02ElXbRbMn?=
 =?us-ascii?Q?AkEF42zymRQu0O48am0DGsjcSkFxbQQC8kNCXWuHpn4kO/tZn5DAKsa5f4DM?=
 =?us-ascii?Q?C0xAJGS7O+Z3RQVcruw479+sQJd3brLxe8lkYyMNqCWhRq25PojtdwlD3bII?=
 =?us-ascii?Q?2EAHs/ixp54rus+BzqoPh30UMCKftc3tvSo3X4FrmmKRuw1RAWq3dnH0YCbf?=
 =?us-ascii?Q?L8nCOy8kv/YtID8Hbj7n+HFsfTCaRstjDhwqSiSuB1dOPCq1KKFmpharjz3w?=
 =?us-ascii?Q?lsX2jArmmezOP6xptIPboM7zKhbB5EPbbIzpXS0qsZg7qC/xsGHPNtGdKBYk?=
 =?us-ascii?Q?bKZQaUYzelrdHTWC+QoKJVgjzu5iHP2Jl8P6rQb4PZe6NA+ar6b8ilkbNYAr?=
 =?us-ascii?Q?X4aJNqy4cM5F19xS0Ijk76UF+tU0ItV9DSeP6ZBHdRmroAsMmt4ldMOq9wNF?=
 =?us-ascii?Q?/qNwdj4NKbTELXWzqXf8OPJNFKa3raGsADIbFKPfQEsx8SLFm05uHNvq6eBA?=
 =?us-ascii?Q?qm+6K1nfXNyExfbgzWbUy2uwPAay97gUSzxGMViAQicVU0+896IFX2BnrH6y?=
 =?us-ascii?Q?4Qhk7yJKK+g6CtctgRFjMLzULJd2Zh64ltB92qxJdPBksGxj634YvocOPSti?=
 =?us-ascii?Q?BEVlUebfihTMm7OyNRJ0YxaNMz1rmOEFgNtup9LCdY7B5+kyYymISH2vckqi?=
 =?us-ascii?Q?ufo2bA96WUccg2EDBx436oRNTCWPpHOoLFtp8e+Sb9Mzpnwl265Qb7P9xqjN?=
 =?us-ascii?Q?+7BcPhbTsQK4HcWdmc5/VjlpFAlkgdSklTTxHdk4rwTJYLN0c43spX/SD+pm?=
 =?us-ascii?Q?MQQ3jcD7/dWagxRoNw0uR2oFBY6Sql+bVBx7nTjF4I9NL/y/r8dPKC+swiOC?=
 =?us-ascii?Q?jrQ/qj17AV8BrXQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:28:47.6070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9b517c0-def0-4ea4-45a6-08dd4740addc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880
Message-ID-Hash: Q67FQDBAKSSMVIUH52IQEI5HOWORMHGD
X-Message-ID-Hash: Q67FQDBAKSSMVIUH52IQEI5HOWORMHGD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q67FQDBAKSSMVIUH52IQEI5HOWORMHGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ACP6.3 platform specific PCI driver hw_ops for acp init/de-init
sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/Makefile    |   2 +-
 sound/soc/amd/ps/acp63.h     |  32 ++++++++++
 sound/soc/amd/ps/pci-ps.c    | 118 +++++++++--------------------------
 sound/soc/amd/ps/ps-common.c | 104 ++++++++++++++++++++++++++++++
 4 files changed, 167 insertions(+), 89 deletions(-)
 create mode 100644 sound/soc/amd/ps/ps-common.c

diff --git a/sound/soc/amd/ps/Makefile b/sound/soc/amd/ps/Makefile
index b5efb1c5382c..778ee4726389 100644
--- a/sound/soc/amd/ps/Makefile
+++ b/sound/soc/amd/ps/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Pink Sardine platform Support
-snd-pci-ps-y := pci-ps.o
+snd-pci-ps-y := pci-ps.o ps-common.o
 snd-ps-pdm-dma-y := ps-pdm-dma.o
 snd-soc-ps-mach-y := ps-mach.o
 snd-ps-sdw-dma-y := ps-sdw-dma.o
diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 8f3a597f658b..ec22a7dad6ac 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -130,6 +130,8 @@
 #define SDW_MAX_BUFFER (SDW_PLAYBACK_MAX_PERIOD_SIZE * SDW_PLAYBACK_MAX_NUM_PERIODS)
 #define SDW_MIN_BUFFER SDW_MAX_BUFFER
 
+#define ACP_HW_OPS(acp_data, cb)	((acp_data)->hw_ops->cb)
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
@@ -213,10 +215,23 @@ struct sdw_dma_ring_buf_reg {
 	u32 pos_high_reg;
 };
 
+struct acp63_dev_data;
+
+/**
+ * struct acp_hw_ops - ACP PCI driver platform specific ops
+ * @acp_init: ACP initialization
+ * @acp_deinit: ACP de-initialization
+ */
+struct acp_hw_ops {
+	int (*acp_init)(void __iomem *acp_base, struct device *dev);
+	int (*acp_deinit)(void __iomem *acp_base, struct device *dev);
+};
+
 /**
  * struct acp63_dev_data - acp pci driver context
  * @acp63_base: acp mmio base
  * @res: resource
+ * @hw_ops: ACP pci driver platform-specific ops
  * @pdm_dev: ACP PDM controller platform device
  * @dmic_codec: platform device for DMIC Codec
  * sdw_dma_dev: platform device for SoundWire DMA controller
@@ -242,6 +257,7 @@ struct sdw_dma_ring_buf_reg {
 struct acp63_dev_data {
 	void __iomem *acp63_base;
 	struct resource *res;
+	struct acp_hw_ops *hw_ops;
 	struct platform_device *pdm_dev;
 	struct platform_device *dmic_codec_dev;
 	struct platform_device *sdw_dma_dev;
@@ -263,4 +279,20 @@ struct acp63_dev_data {
 	u16 acp63_sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
 };
 
+void acp63_hw_init_ops(struct acp_hw_ops *hw_ops);
+
+static inline int acp_hw_init(struct acp63_dev_data *adata, struct device *dev)
+{
+	if (adata && adata->hw_ops && adata->hw_ops->acp_init)
+		return ACP_HW_OPS(adata, acp_init)(adata->acp63_base, dev);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_deinit(struct acp63_dev_data *adata, struct device *dev)
+{
+	if (adata && adata->hw_ops && adata->hw_ops->acp_deinit)
+		return ACP_HW_OPS(adata, acp_deinit)(adata->acp63_base, dev);
+	return -EOPNOTSUPP;
+}
+
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 9cc66a807ad9..120bab1844bb 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -21,87 +21,6 @@
 
 #include "acp63.h"
 
-static int acp63_power_on(void __iomem *acp_base)
-{
-	u32 val;
-
-	val = readl(acp_base + ACP_PGFSM_STATUS);
-
-	if (!val)
-		return val;
-
-	if ((val & ACP63_PGFSM_STATUS_MASK) != ACP63_POWER_ON_IN_PROGRESS)
-		writel(ACP63_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
-
-	return readl_poll_timeout(acp_base + ACP_PGFSM_STATUS, val, !val, DELAY_US, ACP63_TIMEOUT);
-}
-
-static int acp63_reset(void __iomem *acp_base)
-{
-	u32 val;
-	int ret;
-
-	writel(1, acp_base + ACP_SOFT_RESET);
-
-	ret = readl_poll_timeout(acp_base + ACP_SOFT_RESET, val,
-				 val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK,
-				 DELAY_US, ACP63_TIMEOUT);
-	if (ret)
-		return ret;
-
-	writel(0, acp_base + ACP_SOFT_RESET);
-
-	return readl_poll_timeout(acp_base + ACP_SOFT_RESET, val, !val, DELAY_US, ACP63_TIMEOUT);
-}
-
-static void acp63_enable_interrupts(void __iomem *acp_base)
-{
-	writel(1, acp_base + ACP_EXTERNAL_INTR_ENB);
-	writel(ACP_ERROR_IRQ, acp_base + ACP_EXTERNAL_INTR_CNTL);
-}
-
-static void acp63_disable_interrupts(void __iomem *acp_base)
-{
-	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base + ACP_EXTERNAL_INTR_STAT);
-	writel(0, acp_base + ACP_EXTERNAL_INTR_CNTL);
-	writel(0, acp_base + ACP_EXTERNAL_INTR_ENB);
-}
-
-static int acp63_init(void __iomem *acp_base, struct device *dev)
-{
-	int ret;
-
-	ret = acp63_power_on(acp_base);
-	if (ret) {
-		dev_err(dev, "ACP power on failed\n");
-		return ret;
-	}
-	writel(0x01, acp_base + ACP_CONTROL);
-	ret = acp63_reset(acp_base);
-	if (ret) {
-		dev_err(dev, "ACP reset failed\n");
-		return ret;
-	}
-	acp63_enable_interrupts(acp_base);
-	writel(0, acp_base + ACP_ZSC_DSP_CTRL);
-	return 0;
-}
-
-static int acp63_deinit(void __iomem *acp_base, struct device *dev)
-{
-	int ret;
-
-	acp63_disable_interrupts(acp_base);
-	ret = acp63_reset(acp_base);
-	if (ret) {
-		dev_err(dev, "ACP reset failed\n");
-		return ret;
-	}
-	writel(0, acp_base + ACP_CONTROL);
-	writel(1, acp_base + ACP_ZSC_DSP_CTRL);
-	return 0;
-}
-
 static irqreturn_t acp63_irq_thread(int irq, void *context)
 {
 	struct sdw_dma_dev_data *sdw_data;
@@ -540,11 +459,29 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
 unregister_pdm_dev:
 		platform_device_unregister(adata->pdm_dev);
 de_init:
-	if (acp63_deinit(adata->acp63_base, &pci->dev))
+	if (acp_hw_deinit(adata, &pci->dev))
 		dev_err(&pci->dev, "ACP de-init failed\n");
 	return ret;
 }
 
+static int acp_hw_init_ops(struct acp63_dev_data *adata, struct pci_dev *pci)
+{
+	adata->hw_ops = devm_kzalloc(&pci->dev, sizeof(struct acp_hw_ops),
+				     GFP_KERNEL);
+	if (!adata->hw_ops)
+		return -ENOMEM;
+
+	switch (adata->acp_rev) {
+	case ACP63_PCI_REV:
+		acp63_hw_init_ops(adata->hw_ops);
+		break;
+	default:
+		dev_err(&pci->dev, "ACP device not found\n");
+		return -ENODEV;
+	}
+	return 0;
+}
+
 static int snd_acp63_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -598,7 +535,12 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
 	mutex_init(&adata->acp_lock);
-	ret = acp63_init(adata->acp63_base, &pci->dev);
+	ret = acp_hw_init_ops(adata, pci);
+	if (ret) {
+		dev_err(&pci->dev, "ACP hw ops init failed\n");
+		goto release_regions;
+	}
+	ret = acp_hw_init(adata, &pci->dev);
 	if (ret)
 		goto release_regions;
 	ret = devm_request_threaded_irq(&pci->dev, pci->irq, acp63_irq_handler,
@@ -632,7 +574,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	pm_runtime_allow(&pci->dev);
 	return 0;
 de_init:
-	if (acp63_deinit(adata->acp63_base, &pci->dev))
+	if (acp_hw_deinit(adata, &pci->dev))
 		dev_err(&pci->dev, "ACP de-init failed\n");
 release_regions:
 	pci_release_regions(pci);
@@ -677,7 +619,7 @@ static int __maybe_unused snd_acp63_suspend(struct device *dev)
 			return 0;
 		}
 	}
-	ret = acp63_deinit(adata->acp63_base, dev);
+	ret = acp_hw_deinit(adata, dev);
 	if (ret)
 		dev_err(dev, "ACP de-init failed\n");
 
@@ -694,7 +636,7 @@ static int __maybe_unused snd_acp63_runtime_resume(struct device *dev)
 		writel(0, adata->acp63_base + ACP_ZSC_DSP_CTRL);
 		return 0;
 	}
-	ret = acp63_init(adata->acp63_base, dev);
+	ret = acp_hw_init(adata, dev);
 	if (ret) {
 		dev_err(dev, "ACP init failed\n");
 		return ret;
@@ -716,7 +658,7 @@ static int __maybe_unused snd_acp63_resume(struct device *dev)
 		return 0;
 	}
 
-	ret = acp63_init(adata->acp63_base, dev);
+	ret = acp_hw_deinit(adata, dev);
 	if (ret)
 		dev_err(dev, "ACP init failed\n");
 
@@ -744,7 +686,7 @@ static void snd_acp63_remove(struct pci_dev *pci)
 	}
 	if (adata->mach_dev)
 		platform_device_unregister(adata->mach_dev);
-	ret = acp63_deinit(adata->acp63_base, &pci->dev);
+	ret = acp_hw_deinit(adata, &pci->dev);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
 	pm_runtime_forbid(&pci->dev);
diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
new file mode 100644
index 000000000000..771249a76537
--- /dev/null
+++ b/sound/soc/amd/ps/ps-common.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AMD ACP PCI driver callback routines for ACP6.3, ACP7.0 & ACP7.1
+ * platforms.
+ *
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ * Authors: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/platform_device.h>
+
+#include "acp63.h"
+
+static int acp63_power_on(void __iomem *acp_base)
+{
+	u32 val;
+
+	val = readl(acp_base + ACP_PGFSM_STATUS);
+
+	if (!val)
+		return val;
+
+	if ((val & ACP63_PGFSM_STATUS_MASK) != ACP63_POWER_ON_IN_PROGRESS)
+		writel(ACP63_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
+
+	return readl_poll_timeout(acp_base + ACP_PGFSM_STATUS, val, !val, DELAY_US, ACP63_TIMEOUT);
+}
+
+static int acp63_reset(void __iomem *acp_base)
+{
+	u32 val;
+	int ret;
+
+	writel(1, acp_base + ACP_SOFT_RESET);
+
+	ret = readl_poll_timeout(acp_base + ACP_SOFT_RESET, val,
+				 val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK,
+				 DELAY_US, ACP63_TIMEOUT);
+	if (ret)
+		return ret;
+
+	writel(0, acp_base + ACP_SOFT_RESET);
+
+	return readl_poll_timeout(acp_base + ACP_SOFT_RESET, val, !val, DELAY_US, ACP63_TIMEOUT);
+}
+
+static void acp63_enable_interrupts(void __iomem *acp_base)
+{
+	writel(1, acp_base + ACP_EXTERNAL_INTR_ENB);
+	writel(ACP_ERROR_IRQ, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static void acp63_disable_interrupts(void __iomem *acp_base)
+{
+	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base + ACP_EXTERNAL_INTR_STAT);
+	writel(0, acp_base + ACP_EXTERNAL_INTR_CNTL);
+	writel(0, acp_base + ACP_EXTERNAL_INTR_ENB);
+}
+
+static int acp63_init(void __iomem *acp_base, struct device *dev)
+{
+	int ret;
+
+	ret = acp63_power_on(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP power on failed\n");
+		return ret;
+	}
+	writel(0x01, acp_base + ACP_CONTROL);
+	ret = acp63_reset(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP reset failed\n");
+		return ret;
+	}
+	acp63_enable_interrupts(acp_base);
+	writel(0, acp_base + ACP_ZSC_DSP_CTRL);
+	return 0;
+}
+
+static int acp63_deinit(void __iomem *acp_base, struct device *dev)
+{
+	int ret;
+
+	acp63_disable_interrupts(acp_base);
+	ret = acp63_reset(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP reset failed\n");
+		return ret;
+	}
+	writel(0, acp_base + ACP_CONTROL);
+	writel(1, acp_base + ACP_ZSC_DSP_CTRL);
+	return 0;
+}
+
+void acp63_hw_init_ops(struct acp_hw_ops *hw_ops)
+{
+	hw_ops->acp_init = acp63_init;
+	hw_ops->acp_deinit = acp63_deinit;
+}
-- 
2.34.1

