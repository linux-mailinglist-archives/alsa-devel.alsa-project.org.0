Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8077A16A57
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:07:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289256026F;
	Mon, 20 Jan 2025 11:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289256026F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367623;
	bh=yD9E4bbFm0L1Z1snOpyYXmvLHcAWF4uXykVvkdZXnn4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iLgNuAhDCWroCpa+ElA0aCMJKsMc2ghdvr+3btDsBHy5IvWLI2OD/jtYS3e9vTJRm
	 l6uIdgvMlMLBPA4q4V+2lWT0Y12rdBQdoBZlhVzi9HHzY/6M4+eQKXqyoW2Tzoytlp
	 tZkGX3SSG8lbXm+8w4bRMs3kIuBjI+jLTqJ0Pr4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61753F8069F; Mon, 20 Jan 2025 11:05:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 191C2F8069F;
	Mon, 20 Jan 2025 11:05:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C226F80675; Mon, 20 Jan 2025 11:02:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8319F80679
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8319F80679
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PQctmzWZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud5S+GYw674GWowW3YNn1IIaTdjR+d85ZSTUBDobuVz4rY9G+d49eUc2G/l3LM38+3O6mcSKkfWv1DwkFhnehYsSZe2/vO78dVL3/zI1IFNF1QhHEOCCmoTnut+h3To8YQkzx03qFPGjWdEY45nUdaOPNSRsOMVF/m93Vgs9QA/yfXDJfhfaK8IHZyQD4RLYHji+A9/Trc/eMXgiv0+gK3yYwqhmmUDRrl77GaRLbGoZ5RmHXMG8lsYcu1Cx5A3vqSqU/t3Wwp+POld0CzHjK82AeiKekvKUpujFrNSIIgi0BtqUyow93oBlKpYgsRC7jU3Bd8ub72V/gwkawf2ypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+G6Jq/DXmbX5YsdnPvyBIJIuh8iGMe9V18CXCnMlaY=;
 b=sSkwWMOalyHVlDOtGuoV5i9iKs4lWt1yB62L3g9QPjsnhSGNVe3jErlueBDVasn4dNmZEq3TkvWZhS7hyAMWexoS9+GeNSTuZKpyR6micuuhn3SZ1lN3+VFlWpYL/aC/AR8T/4+gnECLL17VpZAJoeiJWAVjH6K+zgH+W1yv2Vw4ipoWeKROtxHW/9Xq9bXatZwKWb8nMK8R82CcJbQFQyFWOrZNsnwt21g/LFnmAxJDs8zXuX6VzWuYAREk8NnyCOA1yKDD0FaxyEsCaJuusc55zbMhjsXY45rd9IPm37Qq2zMfNGgydE1er0OA5sv3ZcGhxZq52K9MWOFabnhPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+G6Jq/DXmbX5YsdnPvyBIJIuh8iGMe9V18CXCnMlaY=;
 b=PQctmzWZPMqLewGkyQgRK55z/84y/dT65u23LAPfPPJOJjnOrpSh8BAtv++pLEgpg5tf0MDPPf0EYRt2iB4hPgJGXPIUxqPj+ainfPAlJHP5ID14MK9Mq86v0DC/UYM6Qwqmtym21YLuhg19B8rN5csxIc+gWD/oMbySbwSksJw=
Received: from CH0PR13CA0006.namprd13.prod.outlook.com (2603:10b6:610:b1::11)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:02:38 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::a1) by CH0PR13CA0006.outlook.office365.com
 (2603:10b6:610:b1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Mon,
 20 Jan 2025 10:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:37 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:34 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 15/23] ASoC: amd: acp70: add acp driver pm ops support
Date: Mon, 20 Jan 2025 15:31:22 +0530
Message-ID: <20250120100130.3710412-16-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 4738b81f-e91f-48ba-e841-08dd393991d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p4rlcjjJTd+c4LS6SSsijejpxfyjZoRd6F4S1Y8BFjc47R0/VlPFCXvsiul0?=
 =?us-ascii?Q?wEVicjXWaNi7+X4JXVY5lfYEVj9fut3XruEUsxPkgCgOWhgwp28y44Qclt2G?=
 =?us-ascii?Q?NWZn1kkf8y4WsAgBwPwF7IQrBdu0/eZz+q9+15KJQnoocjTeHmDdSiaSUq1L?=
 =?us-ascii?Q?YvByqqdvlgv+uhrulISQiSCbAsn4gfv2g8mQpzNA216MKlRgsif0dbET0KgS?=
 =?us-ascii?Q?gM5Md5wiYUWsn/ZL9oB5GMsnjv+djewSiCe/4ktieV2kx//ODMELy1FlJiv+?=
 =?us-ascii?Q?HkdeHn1noVCO3nn9UAK7KeyfqBYUnh6ehkh0M+UnHQmLFC5Ee1owqmXidIJg?=
 =?us-ascii?Q?oMOAAq6kZc4ek9ANsLCE1ehlnln6DR+T0lUys7PO2tqcV9KfYEBuyL3WYIVG?=
 =?us-ascii?Q?5FeN/M/gZwHwXR14/BLIsKtIOduPJqofWrchlIpHLnTOrjl7FRRMgRH6pwuw?=
 =?us-ascii?Q?7/hYGREqUqRpzs8FaEEwB4BpjjnUfRKk5+tYiXSMGo1aA2JyZ7kBc4wFvovG?=
 =?us-ascii?Q?VbftaMZs+OwCCvK4OOE+V15S2/e+HPmI3Mp9Xby9WWcqVNJXtvW3Y3k72MEv?=
 =?us-ascii?Q?VVskTF15KLDy4La22Fe3iBkeZXrxD5WUqMpoqdBtRxc6pL3T8kHU4k5nsmrE?=
 =?us-ascii?Q?iaWR2Jc8TuJIDrcHgLo+e885lPB1peHew6a6baSWwDfDP9e8JvAIJqClsyMM?=
 =?us-ascii?Q?95k5NbyWUtvGMqlR/np+WPg4Qrgq5XxYy6+DnFauv0T9ws9NkSdvtvSwjdg+?=
 =?us-ascii?Q?i02Z4K8RmS339So0BB8dbJjzrmG9sjujcjPTM9sKCZgw7gO17mwjkZSKWSR8?=
 =?us-ascii?Q?NXLE7+R/DqxE09xZRdNLmw5CEhF7WJU2oszNbW541OOVd+R4vcl6FSeDLlvE?=
 =?us-ascii?Q?0mM3UdcD1Qzt+qEO3LdIvcTfkzsjiq1cYRe7zDpufpUksUqM0hJrZQW6vifZ?=
 =?us-ascii?Q?LV8G1RAYl0dmoHh8461TCOCLP1g5z3nY05BQ2ytEeE4mzMO49W5A7ejXT96H?=
 =?us-ascii?Q?qr6RU1Il5OMXUuedkIEWRdPlAy8U7kUN4btW7mMZOqilP+RmygzyIJHueWEx?=
 =?us-ascii?Q?1e+EZMqzcKp+QysSL9LNjtU1E4o2fVrvMQhXGVNLluhh/yrauK8uTITp+4g5?=
 =?us-ascii?Q?LWC4c0V5PWhsiVWxglNMZaCicMuQnagcsJbgHjK6MUC3EYgAMdkOs14XUMWn?=
 =?us-ascii?Q?6MkG+uj3eia62szWtRbxQ8LZYiWmNbJazEvHX2hM0qZbTcYhXJA1FVZ835+2?=
 =?us-ascii?Q?nqX7PMSq1H1yhtJsMrzefGQX3v8Sy6ccZvoQE/wljkQC2ipi2s/Dv1cxSvAz?=
 =?us-ascii?Q?LkOMdYK9UYwjUSP/Xzw/PfbOqxGY3TbOjgFmuSOMZbV3i1qQRuBmq4T5X+MJ?=
 =?us-ascii?Q?/tm4K8jsRBDTdXyR+8FPoEifmX/WFmtpaKJ1KRTQeYS9dZPRDewJUxzpZ+BP?=
 =?us-ascii?Q?DmkFGqJz4ZYZqKlY92HNEcZrs8J3DnOO/erVp6LNuMgCAe/qT1TflXDVUZAI?=
 =?us-ascii?Q?mrDwTdEkAGtC4PY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:37.8527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4738b81f-e91f-48ba-e841-08dd393991d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
Message-ID-Hash: UOELP6I6OFDBLOLDGH7DBP6R73FHRCZ3
X-Message-ID-Hash: UOELP6I6OFDBLOLDGH7DBP6R73FHRCZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOELP6I6OFDBLOLDGH7DBP6R73FHRCZ3/>
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
 sound/soc/amd/acp70/acp70.h     |  2 +
 sound/soc/amd/acp70/pci-acp70.c | 81 +++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index 1d8e670264fc..c3b3b6c38902 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -247,6 +247,7 @@ struct sdw_dma_dev_data {
  * @is_pdm_dev: flag set to true when ACP PDM controller exists
  * @is_pdm_config: flat set to true when PDM configuration is selected from BIOS
  * @is_sdw_config: flag set to true when SDW configuration is selected from BIOS
+ * @sdw_en_stat: flag set to true when any one of the SoundWire manager instance is enabled
  */
 
 struct acp70_dev_data {
@@ -268,6 +269,7 @@ struct acp70_dev_data {
 	bool is_pdm_dev;
 	bool is_pdm_config;
 	bool is_sdw_config;
+	bool sdw_en_stat;
 };
 
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index e732a680c092..9b298ddb097c 100644
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
@@ -566,6 +571,77 @@ static int snd_acp70_probe(struct pci_dev *pci,
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
+static int __maybe_unused snd_acp70_suspend(struct device *dev)
+{
+	struct acp70_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
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
+
+	if (adata->sdw_en_stat) {
+		writel(0x1, adata->acp70_base + ACP_PME_EN);
+		return 0;
+	}
+
+	ret = acp70_init(adata->acp70_base, dev);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int __maybe_unused snd_acp70_resume(struct device *dev)
+{
+	struct acp70_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+
+	if (adata->sdw_en_stat) {
+		writel(0x1, adata->acp70_base + ACP_PME_EN);
+		return 0;
+	}
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
@@ -583,6 +659,8 @@ static void snd_acp70_remove(struct pci_dev *pci)
 	ret = acp70_deinit(adata->acp70_base, &pci->dev);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -600,6 +678,9 @@ static struct pci_driver ps_acp70_driver  = {
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

