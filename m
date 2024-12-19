Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7AE9F7439
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:51:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EE2160220;
	Thu, 19 Dec 2024 06:50:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EE2160220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587467;
	bh=i/uNFLO7iK3jZnoU0aExPguER4FipoeYRt3NLWxrFgs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gh0EIa80yaUg2QSon5UguS+wkMNK6L6wxJPBY7fiAhsoaswRaZldeYwV8fnP2ELAa
	 gcocdEyDwFurs0ZBncedlETTTeLxp1hx7tcRwxypMUKjLb1O9yaz1Yi5gUZFpQm+ol
	 VRts/Q+Qh2hFEIKl2sGd9jTBvWMiIlXdbMTr5tUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0537FF805E4; Thu, 19 Dec 2024 06:50:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B3AEF805EC;
	Thu, 19 Dec 2024 06:50:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF627F8014C; Thu, 19 Dec 2024 06:50:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9D90F8014C
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D90F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BtO7OFtC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUaIX8mg72MOVwukflUOfcDMrscUYnk4+p/Knh9EfzXfZKkKtgD3Y+xQY3iAXw/cg37FCu8XebJqzpqcLB3w9JdtLEfOsyRj5MJaec4ocZZoyIRRBZ7fhhcewKACar6CllqIlfjV5zd1pi3HUubu8u/TMGgZkOOhAZTGKfUwfdVxWwQO4jyQKQxDZDvvLC8LvGfYecLoipyZNO7bpPIoDZFc7UMq86ZtHKlxz1rfWDxmfbr3Gk/o9hSBM7YdI3iT2IyhFfHcSymbaxVfu52nnplbijy26FGdPsceEvivCKyiRrD6iqp0rCXaas6ZZwQx/CdvzOzPJuAyrxgQYxKt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeLJ/EHMSN0S8/q2uF9mVb9XD4QOfDbOpmLKTwPMP+c=;
 b=eAjbK/mvsp71p+UnoJJr7pEaNUyWZ4i6QBHlyLx9XWwAmX1AZP9nd1mMPoAOwwV+kjby32CZX3tZFtQb5BL1i+WDPw7TBUS5q60Y9K9tDo21uqmP7X0JBDD5lDY1sukj8PaaUAEEuT4TFDoBGtMcohdWo+S85kQduNOeo1JNVgLXy14709H5YDdo4zRWYITmWwy/Y4KSA3n1heSBJJT5k5dwBrMBj1NRMYJnTRXkqBeIej8GOqeguzF0k+e+L+BJBLOt0E4aGfPx7Yq8tLxo4bJgdeh3PRCr7aqoxYcEvm3QJ1r3GlO+hfQeCEAapfdPkJwBTkxtkzHEHE4RaUzstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeLJ/EHMSN0S8/q2uF9mVb9XD4QOfDbOpmLKTwPMP+c=;
 b=BtO7OFtCY7snbTOdELd+W3oXB62ChTevPLsuvHRrHUzkNPLqXy7lzGw6Q3DIVAtrT+6sBHEXx5cAV3irXAjK3mLUZ8HPJhHYvjDH3u4fQk6DYtKoH/btjUMiHRfh62iaIc36jVl3yXEqeUsr3GKxtz8g0DcdFz59WtZbTCQO9KY=
Received: from SJ0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:a03:2c2::12)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 05:50:14 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::5a) by SJ0PR13CA0037.outlook.office365.com
 (2603:10b6:a03:2c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.8 via Frontend Transport; Thu,
 19 Dec 2024 05:50:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:50:13 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:50:10 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 03/21] ASoC: amd: acp70: add acp init and de-init functions
Date: Thu, 19 Dec 2024 11:18:39 +0530
Message-ID: <20241219054857.2070420-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e6830a-6a23-4323-c47b-08dd1ff1022b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/8E5pfk6x8cev8frBRcOAZ4pmJsLwgKrKkurBLOMifhw+JMFo1aN/dLKTxKu?=
 =?us-ascii?Q?VUsMBBcpGMPB+yHqiA4Uw5JAXj2GZDbiv1YwJeN+tkoWw27M+3VqusUCs2F+?=
 =?us-ascii?Q?ZKrO0HkGtN3oVUrgefhu8w/+GksKnDnaXvM0yeoqqPJv/n0hgEz2kLo2KvDu?=
 =?us-ascii?Q?5k3LDN4v8DMlmYeQrnA1BImYZJcF/48TeG8hmDR4JJuFY6m4v1YLCHSAb/EK?=
 =?us-ascii?Q?0+02YElKq4Mk12+pn9K+C6vWXo6m8SzSUqgri1T5gqMI1DfR/n8gstuOtSB4?=
 =?us-ascii?Q?ilk7KNBp/G66PeUGp09d1DckfiH8zoxn0wvpyvC0YFllIUUd/GzrJNLQg5Un?=
 =?us-ascii?Q?lmXOdqKXOzX0MRfT5q6SLGcdy2IEHTnz4+YdBfbgS/5zwZlsXeQnuWQSrcJF?=
 =?us-ascii?Q?bp4qV4ZG1cxxxJ6lk5SSAM3mxtsY1mNL/xWiEls32TxH14GgKyFeYWC5iE2c?=
 =?us-ascii?Q?Fj2AbFQv9SahDiGeEBHKbGw16bzp5wmujIfcvJYEO8rY0AASawvMIiUAkOOV?=
 =?us-ascii?Q?iN8aDNyTbxItDjFoQXHBsRnCmTWGWsE1hmDYKr/cww+Cn2/iOd+28nXeeHqD?=
 =?us-ascii?Q?VUxBBmcNmZzqd9q0mGESiaorN7XxtXzEaXRAhNkC7IeuyKWf53RfkBLZbhqY?=
 =?us-ascii?Q?Bn+j1mTsA7HYEps7jfWtOhG4x8eBFJBX1zm7s3aKYqGGFBd15JnItOx0hwFk?=
 =?us-ascii?Q?1Uu4lSoYujg267+Dif1EPBcZu/pPfC7zdglOWkuAbjuHBsru6tFuQSbWuXdn?=
 =?us-ascii?Q?P/nBxsMYdQHSmMKk66n0zFmkXAuQti7mveAww1REcRg3MZpTIEyXQITWpVaU?=
 =?us-ascii?Q?MLy0ikLN+z6APHoq0PVVb1i3LIr/jbMgKlHsCEoH6jdG/QojTTle58AXFeFb?=
 =?us-ascii?Q?fCO/Sr8DBLmvJsbtshpk9yIv8HYPUU6TQM/XH0Ru4O+yukwYjo6He/Cf4L80?=
 =?us-ascii?Q?Ws9hfArs1KAT22ERdez0I0OjkTKNNntmp9bQnhIanp/KDAmf8FGMDs5S4Wvy?=
 =?us-ascii?Q?Z9rOkQ9T9h8Ki2OZELIXMtm4o4KhZe2NvHCz7t4NbRIokp/5kceYh9RJ93KK?=
 =?us-ascii?Q?eiauVHyyBNJ7pvcTxrXR6kB/DiK3BLsxm8VnbRYf8mmtuVgiLVfYydprnJeT?=
 =?us-ascii?Q?2BsJozZ9Uisv51TFDDmLOm7UnC8O1uRV5DXJ2Ik6WmZXj6/ETEvvFuNThek7?=
 =?us-ascii?Q?Wm2hyVSlBP0tiuwE1tRi9oZS363/QE6bcZABn7YinOGRtzkcjdpUWGD0nN7t?=
 =?us-ascii?Q?G+tiDGpNN9pVr1ddi4MHmDKXMVxYbhiTh3e6KlDiqYSS2ko6F7eyvA5zQplH?=
 =?us-ascii?Q?8vK7gEPzMI8lBVY57nOlEiMPEw8IvVKvu4nnvIKm+G7jSj8w9cUwP3hpbD9q?=
 =?us-ascii?Q?qyF3lUiY2WfK47s62jUEMMcRQMFvVqeEdilS2UV1sp/e8t3Xfj0iQJQDtMNl?=
 =?us-ascii?Q?gFcu5ZyMyh6/JyLXnVQ4686JMChG8Y/S7BRnCHA0f/LXYVKU9kKlxMd+B9SE?=
 =?us-ascii?Q?gf3Ow4+S1L5l9k4=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:50:13.9386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34e6830a-6a23-4323-c47b-08dd1ff1022b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461
Message-ID-Hash: 5TCFJIHOBZMSXZM7K2J5D6O3P3XDWOD7
X-Message-ID-Hash: 5TCFJIHOBZMSXZM7K2J5D6O3P3XDWOD7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TCFJIHOBZMSXZM7K2J5D6O3P3XDWOD7/>
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

