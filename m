Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE24B06B3
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 07:53:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEF511899;
	Thu, 10 Feb 2022 07:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEF511899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644476027;
	bh=Qwwz21CEqjxLSiXnKtaInT9WwpLEaweSwNkogJp0U+0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kT3mUWZHyfmF8dt35h1SCT6VyrtzYgpyR8qyIGPNp3ryqCGi6QY9jQKZAztgFvWXP
	 YXUXqdEfeC7JGTinYvPYm2PvoRSgZ/F8YakdgEb8/S1OLKwsToFgEESoaniJfIuVAl
	 L0xDWWFDeZ0AYsYlcMpEArJlN3JPp05WTTce4Clo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A846F80528;
	Thu, 10 Feb 2022 07:51:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75682F80528; Thu, 10 Feb 2022 07:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B84BF80519
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 07:51:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B84BF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="qqp8Lqhf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/PwgiS5o2S9W8C86XKfzGuLQHXU0Yy7c4BhlhBsIHvNT9zd34rDLJFXIOEDCLqLTJl1cDWzJuG/OWexWHJ7qeR39LzN9l2JLGqOLyHlHM46X6tcaSGA4yz8Ls75aPS25CDmfS5oHlJ6idAKqx43uRP9emx2Xi9XrKy3r3Gu0fq7ihDfjA2hY0NWZrmtI7hSAx2IfhmXrShAGLk6SnVWiqQDWH/pIc6f7+YK1SR/9OOdQ1zmK2sODmdo9hXFbONT9tUZrXp2SxzWjlPGga/OIu9WGbSmr99bLl7eqC4uOhv7v3F68NJZVt+ksN9Y7w8EwMvGja6Quvvsbvad4ZMnQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ8pWhBYxN4Z8njNSU7NHJbHmRMuwUbMwx09/TIKk9g=;
 b=l4CvUsE8/+15iZqgvC7XcGukmOSabkToGmwE3KT69XKVTYQ41UXdjnd22jCUfgrr5NfboylNQEWo+B0Kit+rKDnfi1PFpgIjFnciUBK3IlB/aq2Srh/CAIb36ZpY1JM4+6hbGOgXbY5YMmFAQB0ZyCpIhVFZ8++Ng8Zd7SwPjNoUvACQPTeiA5+59vUj83yLBeGu5Av87OwQjXB7HT/WveDDk/F/njbepKC3+WMIW+3MKB7n0Aju4AuaUXFj1ZSsskXyXlzv2yXQQXB2JojZ2dQFT0r8+Y2wAHy2E/sTdkSrCRDZTyNINEDQyaFBp0R1PLbOsDcVFsOGSr9OQozCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ8pWhBYxN4Z8njNSU7NHJbHmRMuwUbMwx09/TIKk9g=;
 b=qqp8LqhfNj+wHeHvK2B9ffXvqlO4K0Z6wHOxowIWzRlDmW619RwFtnFijk+wwoT6OhTEcWcMB9MBqjHxbB5FIyj9NDhy7SXSSgL4+/GKg8cH6GZeQR/UTNa9wFpSpUI6U9/kH68gRHyjQIonorw9UENjG+j1qI6v8e+qknp3jUiivqXjVPEzrryS2hm7KL5W7jQuRh+ciNVOfEWm3mBERGf6FmfKhpKmzDMYfFGxdexL+TciRd+L/iKjr0uQ/JpDb8XmncPF5VWx8asRQ6dkNhUBHEEI729lGKympLooUCc788kue8MZegWUrBePl1zJbl7skprRV/PVQdiogK13Dg==
Received: from DM6PR05CA0041.namprd05.prod.outlook.com (2603:10b6:5:335::10)
 by MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 10 Feb
 2022 06:51:21 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::bf) by DM6PR05CA0041.outlook.office365.com
 (2603:10b6:5:335::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 06:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 06:51:20 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 06:51:20 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Wed, 9 Feb 2022
 22:51:19 -0800
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Wed, 9 Feb 2022 22:51:16 -0800
From: Mohan Kumar <mkumard@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <tiwai@suse.com>, <jonathanh@nvidia.com>,
 <spujar@nvidia.com>
Subject: [PATCH v2 4/6] dt-bindings: Add HDA support for Tegra234
Date: Thu, 10 Feb 2022 12:20:55 +0530
Message-ID: <20220210065057.13555-5-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210065057.13555-1-mkumard@nvidia.com>
References: <20220210065057.13555-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6150b75-a42b-49f6-39ac-08d9ec61bef5
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4409037508BF8C352E2F11E7C12F9@MW3PR12MB4409.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uv8bbeCj9my/xAI6L/l0JZSZd4fYS1hX7APN6EQtxSSdeAJkFtxDFX7g8J5q3G/5HgDNh8XuEL7y1T/EJQcsICJIWtLMh+WWxBFN5Zt9igTQSPui/YtAPNIpvahgP/p9ExTKtu+PqVYlNr0ZkM/8dJRY1i+QBKzliuFQAinwb6v6+Cj0R9hMzo3Yi79JLv2icOpOsUB3n2ytIsBSwHUnVZ5rrCyLfevnYJKk5KjJwUqPJ3Frnl1u7RyOmSiVbZ+3HKwkdlpUNVRQFqFzvnXTBrBxeMNgf7F044fHaQvlFblSR3pJZztkgVt/a5oQLa65ibD1iD4ZWcYDmKbZPBZgFnYhdyY1iJ6HoYi3OOigIyjB2mFYxdpuvZ9aMTIdig+o2CmzOSAogY3NExGXXu9azsnyPvQrdqTGUu+VrLm6nF5EswUOkU1pKspMIA+f/hd7RzvO82lrM00QSaGnUppL/adaTKbiU3CljZowwE0L2XTMjOpdRgUL/P3eG82JY8w4or6mweXotFiJSdHEJnJ82MefbqvBXElq4javqhD0jJhsnDslCqbnpLtWlp8dUGo90aShuGbJVQSzYtfT9IdghkhXhEBuTtOYpLVNRI8vPYnfm87duVOwcTa99t5OacDHcyj5a1d8buDU4+vZlm9Gr45vBzDchoXlQR0Y6BqJvONUMTyj4Ef5kWtpbs8Y+QVIpQ8MyK2QxypeCIneFEML+gWnTV4ZWZKz3CXp8sLdxks=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(1076003)(426003)(336012)(186003)(26005)(107886003)(36756003)(8936002)(70586007)(4326008)(54906003)(6636002)(316002)(8676002)(70206006)(110136005)(7696005)(2906002)(508600001)(6666004)(82310400004)(40460700003)(5660300002)(356005)(83380400001)(81166007)(36860700001)(47076005)(86362001)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 06:51:20.8267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6150b75-a42b-49f6-39ac-08d9ec61bef5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4409
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mohan Kumar <mkumard@nvidia.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add hda clocks, memory ,power and reset binding entries
for Tegra234.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
 include/dt-bindings/memory/tegra234-mc.h       | 6 ++++++
 include/dt-bindings/power/tegra234-powergate.h | 9 +++++++++
 include/dt-bindings/reset/tegra234-reset.h     | 2 ++
 4 files changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/power/tegra234-powergate.h

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index 8d7e66e1b6ef..c014269b7245 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -30,5 +30,9 @@
 #define TEGRA234_CLK_PLLC4			237U
 /** @brief 32K input clock provided by PMIC */
 #define TEGRA234_CLK_CLK_32K			289U
+/** @brief CLK_RST_CONTROLLER_AZA2XBITCLK_OUT_SWITCH_DIVIDER switch divider output (aza_2xbitclk) */
+#define TEGRA234_CLK_AZA_2XBIT			457U
+/** @brief aza_2xbitclk / 2 (aza_bitclk) */
+#define TEGRA234_CLK_AZA_BIT			458U
 
 #endif
diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
index 2662f70c15c6..f538fc442cee 100644
--- a/include/dt-bindings/memory/tegra234-mc.h
+++ b/include/dt-bindings/memory/tegra234-mc.h
@@ -7,6 +7,8 @@
 #define TEGRA234_SID_INVALID		0x00
 #define TEGRA234_SID_PASSTHROUGH	0x7f
 
+/* NISO0 SMMU STREAM IDs */
+#define TEGRA234_SID_NISO0_HDA		0x03
 
 /* NISO1 stream IDs */
 #define TEGRA234_SID_SDMMC4	0x02
@@ -16,6 +18,10 @@
  * memory client IDs
  */
 
+/* High-definition audio (HDA) read clients */
+#define TEGRA234_MEMORY_CLIENT_HDAR 0x15
+/* High-definition audio (HDA) write clients */
+#define TEGRA234_MEMORY_CLIENT_HDAW 0x35
 /* sdmmcd memory read client */
 #define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
 /* sdmmcd memory write client */
diff --git a/include/dt-bindings/power/tegra234-powergate.h b/include/dt-bindings/power/tegra234-powergate.h
new file mode 100644
index 000000000000..3c5575a51296
--- /dev/null
+++ b/include/dt-bindings/power/tegra234-powergate.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __ABI_MACH_T234_POWERGATE_T234_H_
+#define __ABI_MACH_T234_POWERGATE_T234_H_
+
+#define TEGRA234_POWER_DOMAIN_DISP	3U
+
+#endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index 50e13bced642..2ab61c69a3d9 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -10,6 +10,8 @@
  * @brief Identifiers for Resets controllable by firmware
  * @{
  */
+#define TEGRA234_RESET_HDA			20U
+#define TEGRA234_RESET_HDACODEC			21U
 #define TEGRA234_RESET_SDMMC4			85U
 #define TEGRA234_RESET_UARTA			100U
 
-- 
2.17.1

