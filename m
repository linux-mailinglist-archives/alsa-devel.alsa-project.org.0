Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93316A16A3C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:03:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08E26601E1;
	Mon, 20 Jan 2025 11:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08E26601E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367405;
	bh=i/uNFLO7iK3jZnoU0aExPguER4FipoeYRt3NLWxrFgs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PjEaR2se1fCMznVpDgpIBuxDiTkZ0DrWiq53SfobAu0NRPp1uALWQgRtQe/U7XnXc
	 IGRRuQaNHbbKYLPmc+AeH1wLfwThDXFogyE3aNJg98w4Gzf8htQY5xQnFMqbrGD21j
	 6os2CmBkvqbXl6vChyKB5Zu7YbBUwX9LRBYYJQ/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67590F805FC; Mon, 20 Jan 2025 11:02:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 343DCF80600;
	Mon, 20 Jan 2025 11:02:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DB33F80424; Mon, 20 Jan 2025 11:02:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95D6BF80482
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95D6BF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2Hfmp4UX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2VGF1UwPiYg4Mw03PiGSqdenMR7oegueLBvACHjEmvt3CxS9L7/5Z04XZ/mjifpeqKJjmo6h3Fbk2KkgbEyN/0jiuVVDcdUUZ9OeNQynot8gUFoFi46R70T3NdcHPlcXOg3oBjKqpsoBUj0TB8ab+5qo0vrNrINfYWWJfCe+qWo9uQwtjC0AC5ah8yEgqQvKw8w4JJ/ayDe+eR2XseMA4q8ISe8gTvDMqS+Dp4W9aYuI3/SL0CZfCguAv+BEZBLfHDIvAszleYFW7ClTxWcglcQ+Xc15doRnLklU1VG7RCK5XYEMCTaslJPyH+pe5AbkxO76sIxcR0Z30E7ByoVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeLJ/EHMSN0S8/q2uF9mVb9XD4QOfDbOpmLKTwPMP+c=;
 b=FRoG5NcMDG4StyolfW75hidO7ted5siyQWrJ3bbmBAF/MQbgVKJfF4hb9qgntNnOe9sKpgm4jlFVcvB40idTI2ACeNYsqHJkw/ufFh1C4bJh2o4Ah+xeOKFSV/GBtY1Mg0LRakC2fyTsJKBxNqgxpC6dokgIP8z/NChLcdLdFiAPVyHy3cirBZlZqSss80n5sV3QjEIu6onjlEWbGPbchfPD7DTzp7otXgGMXWMaGmjBHXeMCFZKvThjKKbK0TW3VxHBARRdGOLoh6FMMrIoQQHhBXYq7yupVZRV56FUhrc8dXdJs9RC50TKEOfLQNccJoJ2HPAbTgZKp0moUIoZ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeLJ/EHMSN0S8/q2uF9mVb9XD4QOfDbOpmLKTwPMP+c=;
 b=2Hfmp4UXX44feDI7yt84mX3qgp3Ho56ANbYX0WcZ4/2qPK/PA/RUibUV4NFdZvQUWq5huY/nQPObkZa0y+zDSnn7sqR66jNmMC22WtrFFcuvBymhlh6u++XGF5YMIJ3i3taEtg0i1DGqYSXo4SDN9EEXDDwGz4+YGU9AkyVXk3U=
Received: from CH0P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::26)
 by DM6PR12MB4332.namprd12.prod.outlook.com (2603:10b6:5:21e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:01:57 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::65) by CH0P221CA0042.outlook.office365.com
 (2603:10b6:610:11d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:01:56 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:01:53 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 03/23] ASoC: amd: acp70: add acp init and de-init functions
Date: Mon, 20 Jan 2025 15:31:10 +0530
Message-ID: <20250120100130.3710412-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|DM6PR12MB4332:EE_
X-MS-Office365-Filtering-Correlation-Id: 668c870b-fd50-4ca3-c01f-08dd3939794a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z9KQS2+w3tUXxBg7VhsfDZm5fj7Ru0ZZiOhmLnkO0zk26UC9sAFe+Wcwk+KZ?=
 =?us-ascii?Q?jTKiKnTX3mtbcTePMmGy70LVypswDoRL6jEdDep0S5mMwc3GQyGyeRCaW39B?=
 =?us-ascii?Q?ZDkgkqpB2ShGdeZnZ0PEXn02yBpTFmWAClG/LijbXTYrrdvw0aAH7ZLv9t8m?=
 =?us-ascii?Q?4HuUTwMY9vNo/awriQkxc8s1Hly4RFBcPfGPYEjKBQl0DLW7ky6OCEt/OB7x?=
 =?us-ascii?Q?enVnSPAD3HQDM8/J3o8bx6wYRf9Jx5YIZQbTtdrTagSlG/89AZgiFfjE4EOU?=
 =?us-ascii?Q?knJpqjrF1u4wAIQTfGcUY4uPM7izxk9ewCX5kGvDpBjrSDGl4PiHb2XxCJao?=
 =?us-ascii?Q?n6GzfNu027SU9uHnwUhdLyd5ZzCeF4T7S42+DofhaUSpUwsxUaSunE24Uqza?=
 =?us-ascii?Q?/MesiopKKs/5ilwfVQkEeOOMp4VRWNTzVrQ4pMrjX09q6Ne3PX5KOzbgBDzP?=
 =?us-ascii?Q?q2zhFYp45ryivQ5pOFTU70pnZ5a4PuzG/6WwoHGtjumoP27xNHDaVAoRhlT3?=
 =?us-ascii?Q?fFDSGO4/4ORb13NszODeVvrtvSVLWk4uZm/aXjP5zwaPBVgPBAqfSDgV1Usw?=
 =?us-ascii?Q?Z2KeoAJP2t4+Tz9uo9NXNYoyKhz8jEllevvMOnPcf0wKgNQMFrR3zmihI82h?=
 =?us-ascii?Q?kXMuRbQ2aA4KJDMQa4NQI0LOE+b7kFlgErisEXnSk5++zYslQvzWfM/NwKTw?=
 =?us-ascii?Q?0uTQyRJQPXPkreXaLvtWS3xE5j3mWmWaIyGwhus5yMLm30SydXSA3D5NzKBI?=
 =?us-ascii?Q?7ke+WSju0KASkzl3RCz/P3O+rWlqfVYPqrFvq42wW3W1LhLbHCFC+jffBf/w?=
 =?us-ascii?Q?xTk06UyhP0C96mjADBWE0tvzNS4F5p/OtGOOS0/Sksn6Vt4VurgGHmK7m12w?=
 =?us-ascii?Q?7iEF4bptFe0J/un6zP+bJUQ/tLkpkFkwww1j8ag+k+T8g1Q9vaGG6TPe8X+f?=
 =?us-ascii?Q?KEzuCA8a5A9nzBXW6DCqIrRAhpMQ6pIXYVv0MQl4YDJi5wB+Ba+yOlHrXqx8?=
 =?us-ascii?Q?Biih5nn4u29wwCkcRfPg4dOYg6GliYtQgDcWnlQDLqDewA5COF5PHl3wQ73n?=
 =?us-ascii?Q?Ukj3PCaxV9wweIHofzf0nvDLOWAo3IEO8PzZAwhAAQJzDej5YpbmEvxBZhgG?=
 =?us-ascii?Q?DY972a0puc0VaqddtJ/xnIyQsmTKZTn3Tmw6bf34jum/vSiBPzrJsLOLm0Co?=
 =?us-ascii?Q?8FnQurQYPOC59R6zxQ5WdibaO5joiXS3u3rY7ixBQS3eaQmLH0BY5T7N80Tl?=
 =?us-ascii?Q?ryS8spR3MKpb24i63vntMcGdqOcPp04ci+9CttsTRAqwr1iMinlkkcdI0b+2?=
 =?us-ascii?Q?TZhkn/O+DsIp6h1jJZPhIrxnT7SgmPnzFFjGspylH6v2oj5wrIVe5XjwY+B2?=
 =?us-ascii?Q?jzHmSSmDbH/53FsLiOBILeEkIGP1qvHqlMdBji8ozdLWdDFdoaMIXTdr9ivX?=
 =?us-ascii?Q?dDopk07f9yrTcZfeV/5LbYeYOc4A+Ro7MdPp8y3pHsIrw9ief2UCrbUJvK8m?=
 =?us-ascii?Q?FWbo6zQ2BTiF+Co=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:01:56.6558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 668c870b-fd50-4ca3-c01f-08dd3939794a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4332
Message-ID-Hash: GLYV4EXLXPS6I26SK2S3EWUAMWDFM473
X-Message-ID-Hash: GLYV4EXLXPS6I26SK2S3EWUAMWDFM473
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLYV4EXLXPS6I26SK2S3EWUAMWDFM473/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp init and deinit functions for ACP7.0 platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     | 15 ++++++
 sound/soc/amd/acp70/pci-acp70.c | 92 +++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index 28a46f0c2026..b6f0f75de91d 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -12,6 +12,21 @@
 #define ACP70_REG_END		0x125C000
 #define ACP70_PCI_REV		0x70
 #define ACP71_PCI_REV		0x71
+#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
+#define ACP_PGFSM_CNTL_POWER_ON_MASK		0x1F
+#define ACP_PGFSM_CNTL_POWER_OFF_MASK		0
+#define ACP_PGFSM_STATUS_MASK			0xFF
+#define ACP_POWERED_ON				0
+#define ACP_POWER_ON_IN_PROGRESS		1
+#define ACP_POWERED_OFF				2
+#define ACP_POWER_OFF_IN_PROGRESS		3
+#define DELAY_US	5
+#define ACP_COUNTER	20000
+/* time in ms for acp timeout */
+#define ACP_TIMEOUT	2000
+
+#define ACP_EXT_INTR_STAT_CLEAR_MASK	0xFFFFFFFF
+#define ACP_ERROR_IRQ			BIT(29)
 
 /**
  * struct acp70_dev_data - acp pci driver context
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index 23e47f619bd7..a98407fa2cd2 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -5,13 +5,94 @@
  * Copyright 2024 Advanced Micro Devices, Inc.
  */
 
+#include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include "../mach-config.h"
 
 #include "acp70.h"
 
+static int acp70_power_on(void __iomem *acp_base)
+{
+	u32 val = 0;
+
+	val = readl(acp_base + ACP_PGFSM_STATUS);
+
+	if (!val)
+		return 0;
+	if (val & ACP_PGFSM_STATUS_MASK)
+		writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
+
+	return readl_poll_timeout(acp_base + ACP_PGFSM_STATUS, val, !val, DELAY_US, ACP_TIMEOUT);
+}
+
+static int acp70_reset(void __iomem *acp_base)
+{
+	u32 val;
+	int ret;
+
+	writel(1, acp_base + ACP_SOFT_RESET);
+
+	ret = readl_poll_timeout(acp_base + ACP_SOFT_RESET, val,
+				 val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK,
+				 DELAY_US, ACP_TIMEOUT);
+	if (ret)
+		return ret;
+
+	writel(0, acp_base + ACP_SOFT_RESET);
+
+	return readl_poll_timeout(acp_base + ACP_SOFT_RESET, val, !val, DELAY_US, ACP_TIMEOUT);
+}
+
+static void acp70_enable_interrupts(void __iomem *acp_base)
+{
+	writel(1, acp_base + ACP_EXTERNAL_INTR_ENB);
+	writel(ACP_ERROR_IRQ, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static void acp70_disable_interrupts(void __iomem *acp_base)
+{
+	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base + ACP_EXTERNAL_INTR_STAT);
+	writel(0, acp_base + ACP_EXTERNAL_INTR_CNTL);
+	writel(0, acp_base + ACP_EXTERNAL_INTR_ENB);
+}
+
+static int acp70_init(void __iomem *acp_base, struct device *dev)
+{
+	int ret;
+
+	ret = acp70_power_on(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP power on failed\n");
+		return ret;
+	}
+	writel(0x01, acp_base + ACP_CONTROL);
+	ret = acp70_reset(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP reset failed\n");
+		return ret;
+	}
+	writel(0, acp_base + ACP_ZSC_DSP_CTRL);
+	acp70_enable_interrupts(acp_base);
+	return 0;
+}
+
+static int acp70_deinit(void __iomem *acp_base, struct device *dev)
+{
+	int ret;
+
+	acp70_disable_interrupts(acp_base);
+	ret = acp70_reset(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP reset failed\n");
+		return ret;
+	}
+	writel(0x01, acp_base + ACP_ZSC_DSP_CTRL);
+	return 0;
+}
+
 static int snd_acp70_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -63,6 +144,10 @@ static int snd_acp70_probe(struct pci_dev *pci,
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
 	mutex_init(&adata->acp_lock);
+	ret = acp70_init(adata->acp70_base, &pci->dev);
+	if (ret)
+		goto release_regions;
+
 	return 0;
 release_regions:
 	pci_release_regions(pci);
@@ -74,6 +159,13 @@ static int snd_acp70_probe(struct pci_dev *pci,
 
 static void snd_acp70_remove(struct pci_dev *pci)
 {
+	struct acp70_dev_data *adata;
+	int ret;
+
+	adata = pci_get_drvdata(pci);
+	ret = acp70_deinit(adata->acp70_base, &pci->dev);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
-- 
2.34.1

