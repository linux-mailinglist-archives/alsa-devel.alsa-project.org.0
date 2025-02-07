Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE60BA2BB69
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:30:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B6CD601F8;
	Fri,  7 Feb 2025 07:30:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B6CD601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909854;
	bh=3A9Io0mjma91zazfjHKmG5s8qNf6QC8WcojVbya0nkg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WBKGH5RCS8oPIiHT2vlByp+t7j8wt8rUzUovP9xmFL5tuH0UDkKqFVF3rA+0Gkm5I
	 jAEKhvZuvc1wFPQJgkLRB9OfqWzRyOYQmK1c5UZ2eT2khuH6cnpOVQlh5INEpOITxq
	 INtXaz9uin/QPo2wyMUJ6PvXZi3VtgHZiq66I9sI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5F30F80694; Fri,  7 Feb 2025 07:29:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE0CF8068E;
	Fri,  7 Feb 2025 07:29:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 911B6F8061E; Fri,  7 Feb 2025 07:29:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6216DF8061D
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6216DF8061D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YZvmNlUC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUdKk4ZDFbss/MB9eMk6pUBdAw2xGP4IRBv5Ik+4XY2eeZ1pxMwMS3KREqcrz/tHiaUmr/hqOBk5VyiCwf1S+CjY3ue2QkrvzA7v35P58i9NMQofvoNHuJoBCbbrRkZXichYXNGyn9EQqTrsL06Nq08+7+XKj4qmN0SAsXd8cOMt/nkzB+/uhpJtyU6mIm0td96Z+IPV3ey2hvavFIpoWIIe7z0WEkxm5V06o7+aHihwoLf6Skv3OEk7cHEt9DlZ6Di2k9P7qArR2VSuYaH3Qy5S9h/M0fD3PfpiYa/e80fnp05UMDz+fb6VJEIC7yww0QqX9DPQk6BvUCa1aocIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WG+wLnHBkUeT29nxJSqeY8KwZGHu8gJEH4iKQM7qQgI=;
 b=RNJ8C1Y2knOZH+kYG4FkI1UMB/SZyH/2yaygvv5H8qZsrJlk+JpSdF1UnQoR3d/MyG9hLIgKLAKKuGW/RpsQHRhFFD0S8TV9Kgl+gDMCGwIAW7Dbb6h2xXt8i/rj/h0VolxnC2/J8R5/Dp9A1dPTOmG+dO/l8bj0oZ9zRrVZeSECQ1HttRLPhNckrxkU+7a6CnDZe98wNz6wBp9Dt1qaEG5LkUXEuL3NWGvkrAFIJvCHJgv/tA13mghExkwOemjc11x/knhIyPFuw8QzdseRZEiVwsCc8lsRdDLxLc4bKeP1FfMLP27Q6dMTwS1s8GTKY0FMm3Kkx7Lof7Pox6aFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG+wLnHBkUeT29nxJSqeY8KwZGHu8gJEH4iKQM7qQgI=;
 b=YZvmNlUC8Hk4DOEno0tiJ5ehg1c0r9lXDBsRmFEsqQD3IUNUZYXJjhm15b+hz2MrBS0FIu6t+pSumAVWSbebKzmMPYvomcn3ISk/uAn3410uq6AtHYfUEZZ5A188qcCEyeAUOBbxTQWpO2cW3TZvsE4S3/meoUZSftyceZdyFP8=
Received: from BLAPR03CA0132.namprd03.prod.outlook.com (2603:10b6:208:32e::17)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 06:28:52 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::d4) by BLAPR03CA0132.outlook.office365.com
 (2603:10b6:208:32e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 06:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:28:51 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:28:47 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 04/25] ASoC: amd: ps: add callback functions for acp pci
 driver pm ops
Date: Fri, 7 Feb 2025 11:57:58 +0530
Message-ID: <20250207062819.1527184-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: ca04765b-bd8b-4ad6-682f-08dd4740b02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mLmLRU2VCqsfBp26PNFUm2cvEe/YuguupDhBHLXhWvTj+v7X64APMpxYpC2O?=
 =?us-ascii?Q?IPkC7Xo/cat1exud+PPl6l51JqsFQdQ2i3ohR7dkxi/XIwL/9A5+rmj7iz0N?=
 =?us-ascii?Q?vTmodf9EnDcjo8Hd7mZVTFVH1R+CrumWoHhAeT1thCu0Jmq83PQyu4iNgV2/?=
 =?us-ascii?Q?zfpW5dZ4ZAIlT+0zRcKXVEn77BoGGXzpIskhgHBukYeWzBmOG7DQlz8AxkBu?=
 =?us-ascii?Q?9fneKSyMt+y9Henq2GxqLHjZfE0mr3Nblpg8+ZwuTJ/QF/dSWQXxy7SGJB5c?=
 =?us-ascii?Q?OnE6kQOU0dGDMMvlWlC4WnZ9Dq8rpc5m4SuZAOe2U0pIZ+g8xCMt0lFNRaNj?=
 =?us-ascii?Q?CtSdEH+NH3m556W9Y9PRx1rE8iCFPQLbJl4WeJYVl1Y72hP6iK2Tt4kQ8Vgu?=
 =?us-ascii?Q?cGYQV5z6n2/1WoNLajZFIfeQ4KgHVszazLN+vBQ7NWPcnX+1/vWbFg0c3BOf?=
 =?us-ascii?Q?tj/yOn0Osz+z6kwnPnPNLF8+du0+WidJTnaLHb4hE/lHyX49Iu2yOAjuZ3dY?=
 =?us-ascii?Q?VXHWcn4LqO8p3KgyKm3WbY2Rp6Vn65fmBUgJG5el13tXld1cqtS338wS5Xxc?=
 =?us-ascii?Q?Tqlj2UEok3q3ek73Lze0e409+HXdtWs/cYUeNCu7psYwAqWkKy2o0qtHQY5V?=
 =?us-ascii?Q?/IgdYl7sugZ4Cg9nhkIy2dFPa1O42F/ypVXTzjTqDGKaLGUKiYy7oXAiiJce?=
 =?us-ascii?Q?RT+n1gutgs1yQMOrEAzqpzsZ0e4fIqNAQZpCMBuJFXHWbvAZmRNoW7g5T6GC?=
 =?us-ascii?Q?4r8Nax9AM5ZmEukRZutim+LFdty7dHi6onzhMNxxL653+iFZb74R4HwVIURt?=
 =?us-ascii?Q?IR6xoVRNk2BY9puSM8IBWtnFhwGconwvcZPisXZU+ac9fcWXYm3bZRJehtcZ?=
 =?us-ascii?Q?iM3yPO1xCj3ceSRPyE0Yd1FDvau33XXQvnw3qZKj8QW4zyVqxu18uaThxSYL?=
 =?us-ascii?Q?o8/4jhxq8536mELXRWoMI/8DU8dhppfKfLF7joBN0fWbige+2iwyOVLLqnxZ?=
 =?us-ascii?Q?+ngZHgE70eOtI6xLCcpdq0+Tc6btWmwDlPh9KZ850DlnCqNSRCTMCCRMGoFr?=
 =?us-ascii?Q?YioAylkCY9nK2fQk4/bUp7MSL9kYXoiYAW93895VM5MLqO4GvFiugIqnAveE?=
 =?us-ascii?Q?qBn73pz9GSXD8dZ2KAvaLQDHPHjrKn5tgl+iRxpXfV+m+OuBpX/YGZ4bR5uZ?=
 =?us-ascii?Q?5bWifbM6tm6yh9kRn+8URHI2IYbvycMwHfKjJCjkZ3XcA4oNoyIP6nzSsKrS?=
 =?us-ascii?Q?x30V9D+Hwv8lkjxEfpvRwoNbI1CNgRBULcDs2HTsuX+u/kvnrnMOVjwDPwuC?=
 =?us-ascii?Q?NyBRBL3ii+JmrRxIPlbK2qtKfCWPxMyTgKjDP/uVy5YZa0ujXUAJtTNesmr5?=
 =?us-ascii?Q?W5/1nOisbK2Iz15TO6eM3Qa8E0oR5ES59v0BRtqBQ/7hPmKREvgBhYh5/6Pc?=
 =?us-ascii?Q?wYVFApJAda8cbT13hSuoiFZuvrpR9wxJlYDmh4e6forHTB351PsX8Uiy2wMO?=
 =?us-ascii?Q?zIn9SCiGqSkcteA=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:28:51.4901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca04765b-bd8b-4ad6-682f-08dd4740b02a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
Message-ID-Hash: 2QTMZ5HNAOAEXTGGXBDHJKLAZ7HTVNWV
X-Message-ID-Hash: 2QTMZ5HNAOAEXTGGXBDHJKLAZ7HTVNWV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2QTMZ5HNAOAEXTGGXBDHJKLAZ7HTVNWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp pci driver pm ops related callback functions for ACP6.3
platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h     | 44 ++++++++++++++++++
 sound/soc/amd/ps/pci-ps.c    | 82 ++++------------------------------
 sound/soc/amd/ps/ps-common.c | 86 ++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+), 74 deletions(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index ec22a7dad6ac..4e3f7eaac040 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -221,10 +221,18 @@ struct acp63_dev_data;
  * struct acp_hw_ops - ACP PCI driver platform specific ops
  * @acp_init: ACP initialization
  * @acp_deinit: ACP de-initialization
+ * acp_suspend: ACP system level suspend callback
+ * acp_resume: ACP system level resume callback
+ * acp_suspend_runtime: ACP runtime suspend callback
+ * acp_resume_runtime: ACP runtime resume callback
  */
 struct acp_hw_ops {
 	int (*acp_init)(void __iomem *acp_base, struct device *dev);
 	int (*acp_deinit)(void __iomem *acp_base, struct device *dev);
+	int (*acp_suspend)(struct device *dev);
+	int (*acp_resume)(struct device *dev);
+	int (*acp_suspend_runtime)(struct device *dev);
+	int (*acp_resume_runtime)(struct device *dev);
 };
 
 /**
@@ -295,4 +303,40 @@ static inline int acp_hw_deinit(struct acp63_dev_data *adata, struct device *dev
 	return -EOPNOTSUPP;
 }
 
+static inline int acp_hw_suspend(struct device *dev)
+{
+	struct acp63_dev_data *adata = dev_get_drvdata(dev);
+
+	if (adata && adata->hw_ops && adata->hw_ops->acp_suspend)
+		return ACP_HW_OPS(adata, acp_suspend)(dev);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_resume(struct device *dev)
+{
+	struct acp63_dev_data *adata = dev_get_drvdata(dev);
+
+	if (adata && adata->hw_ops && adata->hw_ops->acp_resume)
+		return ACP_HW_OPS(adata, acp_resume)(dev);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_suspend_runtime(struct device *dev)
+{
+	struct acp63_dev_data *adata = dev_get_drvdata(dev);
+
+	if (adata && adata->hw_ops && adata->hw_ops->acp_suspend_runtime)
+		return ACP_HW_OPS(adata, acp_suspend_runtime)(dev);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_runtime_resume(struct device *dev)
+{
+	struct acp63_dev_data *adata = dev_get_drvdata(dev);
+
+	if (adata && adata->hw_ops && adata->hw_ops->acp_resume_runtime)
+		return ACP_HW_OPS(adata, acp_resume_runtime)(dev);
+	return -EOPNOTSUPP;
+}
+
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 120bab1844bb..a37fb6172958 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -584,90 +584,24 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	return ret;
 }
 
-static bool check_acp_sdw_enable_status(struct acp63_dev_data *adata)
+static int __maybe_unused snd_acp_suspend(struct device *dev)
 {
-	u32 sdw0_en, sdw1_en;
-
-	sdw0_en = readl(adata->acp63_base + ACP_SW0_EN);
-	sdw1_en = readl(adata->acp63_base + ACP_SW1_EN);
-	return (sdw0_en || sdw1_en);
+	return acp_hw_suspend(dev);
 }
 
-static void handle_acp63_sdw_pme_event(struct acp63_dev_data *adata)
+static int __maybe_unused snd_acp_runtime_resume(struct device *dev)
 {
-	u32 val;
-
-	val = readl(adata->acp63_base + ACP_SW0_WAKE_EN);
-	if (val && adata->sdw->pdev[0])
-		pm_request_resume(&adata->sdw->pdev[0]->dev);
-
-	val = readl(adata->acp63_base + ACP_SW1_WAKE_EN);
-	if (val && adata->sdw->pdev[1])
-		pm_request_resume(&adata->sdw->pdev[1]->dev);
+	return acp_hw_runtime_resume(dev);
 }
 
-static int __maybe_unused snd_acp63_suspend(struct device *dev)
+static int __maybe_unused snd_acp_resume(struct device *dev)
 {
-	struct acp63_dev_data *adata;
-	int ret;
-
-	adata = dev_get_drvdata(dev);
-	if (adata->is_sdw_dev) {
-		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
-		if (adata->sdw_en_stat) {
-			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
-			return 0;
-		}
-	}
-	ret = acp_hw_deinit(adata, dev);
-	if (ret)
-		dev_err(dev, "ACP de-init failed\n");
-
-	return ret;
-}
-
-static int __maybe_unused snd_acp63_runtime_resume(struct device *dev)
-{
-	struct acp63_dev_data *adata;
-	int ret;
-
-	adata = dev_get_drvdata(dev);
-	if (adata->sdw_en_stat) {
-		writel(0, adata->acp63_base + ACP_ZSC_DSP_CTRL);
-		return 0;
-	}
-	ret = acp_hw_init(adata, dev);
-	if (ret) {
-		dev_err(dev, "ACP init failed\n");
-		return ret;
-	}
-
-	if (!adata->sdw_en_stat)
-		handle_acp63_sdw_pme_event(adata);
-	return 0;
-}
-
-static int __maybe_unused snd_acp63_resume(struct device *dev)
-{
-	struct acp63_dev_data *adata;
-	int ret;
-
-	adata = dev_get_drvdata(dev);
-	if (adata->sdw_en_stat) {
-		writel(0, adata->acp63_base + ACP_ZSC_DSP_CTRL);
-		return 0;
-	}
-
-	ret = acp_hw_deinit(adata, dev);
-	if (ret)
-		dev_err(dev, "ACP init failed\n");
-
-	return ret;
+	return acp_hw_resume(dev);
 }
 
 static const struct dev_pm_ops acp63_pm_ops = {
-	SET_RUNTIME_PM_OPS(snd_acp63_suspend, snd_acp63_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(snd_acp63_suspend, snd_acp63_resume)
+	SET_RUNTIME_PM_OPS(snd_acp_suspend, snd_acp_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(snd_acp_suspend, snd_acp_resume)
 };
 
 static void snd_acp63_remove(struct pci_dev *pci)
diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
index 771249a76537..7643f321be37 100644
--- a/sound/soc/amd/ps/ps-common.c
+++ b/sound/soc/amd/ps/ps-common.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include "acp63.h"
 
@@ -97,8 +98,93 @@ static int acp63_deinit(void __iomem *acp_base, struct device *dev)
 	return 0;
 }
 
+static bool check_acp_sdw_enable_status(struct acp63_dev_data *adata)
+{
+	u32 sdw0_en, sdw1_en;
+
+	sdw0_en = readl(adata->acp63_base + ACP_SW0_EN);
+	sdw1_en = readl(adata->acp63_base + ACP_SW1_EN);
+	return (sdw0_en || sdw1_en);
+}
+
+static void handle_acp63_sdw_pme_event(struct acp63_dev_data *adata)
+{
+	u32 val;
+
+	val = readl(adata->acp63_base + ACP_SW0_WAKE_EN);
+	if (val && adata->sdw->pdev[0])
+		pm_request_resume(&adata->sdw->pdev[0]->dev);
+
+	val = readl(adata->acp63_base + ACP_SW1_WAKE_EN);
+	if (val && adata->sdw->pdev[1])
+		pm_request_resume(&adata->sdw->pdev[1]->dev);
+}
+
+static int __maybe_unused snd_acp63_suspend(struct device *dev)
+{
+	struct acp63_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	if (adata->is_sdw_dev) {
+		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
+		if (adata->sdw_en_stat) {
+			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
+			return 0;
+		}
+	}
+	ret = acp_hw_deinit(adata, dev);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+
+	return ret;
+}
+
+static int __maybe_unused snd_acp63_runtime_resume(struct device *dev)
+{
+	struct acp63_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	if (adata->sdw_en_stat) {
+		writel(0, adata->acp63_base + ACP_ZSC_DSP_CTRL);
+		return 0;
+	}
+	ret = acp_hw_init(adata, dev);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+
+	if (!adata->sdw_en_stat)
+		handle_acp63_sdw_pme_event(adata);
+	return 0;
+}
+
+static int __maybe_unused snd_acp63_resume(struct device *dev)
+{
+	struct acp63_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	if (adata->sdw_en_stat) {
+		writel(0, adata->acp63_base + ACP_ZSC_DSP_CTRL);
+		return 0;
+	}
+
+	ret = acp_hw_init(adata, dev);
+	if (ret)
+		dev_err(dev, "ACP init failed\n");
+
+	return ret;
+}
+
 void acp63_hw_init_ops(struct acp_hw_ops *hw_ops)
 {
 	hw_ops->acp_init = acp63_init;
 	hw_ops->acp_deinit = acp63_deinit;
+	hw_ops->acp_suspend = snd_acp63_suspend;
+	hw_ops->acp_resume = snd_acp63_resume;
+	hw_ops->acp_suspend_runtime = snd_acp63_suspend;
+	hw_ops->acp_resume_runtime = snd_acp63_runtime_resume;
 }
-- 
2.34.1

