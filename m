Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E843F4B83E7
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:25:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977101868;
	Wed, 16 Feb 2022 10:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977101868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003531;
	bh=pR1jtjsPamO76UOoGVtHbb3HwXNTSEvlnUvbLv9fTao=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TpBA/2baEExUwR+mhj7ftn+2A+gEEH6HUhZWHqxdAfYJ2yvD9S2XGPi//7JKgNdQs
	 7dwOMB8tKHsGwtv0iqOcpDTb351TiO5eWU5BOUB3DbhibgXzlhRoTteHWVFS53M+W9
	 N+BvnXttB2KHm5sizk+rIS9VC+RJxyBhgMhXuEYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CC3BF80526;
	Wed, 16 Feb 2022 10:23:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E6C9F8051C; Wed, 16 Feb 2022 10:23:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECECCF8051A
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 10:23:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECECCF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="pZ//tuFT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xn4Z/51x7trIfnwE+wfbD3T4CpLFIrR7CqMvgSk/yEqV8R8gkt4hSFNnIuxbLMPeHnD2GlceqAdJ4jgfk6zg+yEHokF4FJ55mRkjx9GiN8OGqOTxA5xz2/kcPA6jNM3ZgWY+kHsfzDYLj7o3OtHEVfJ4DsumoprrYW8T9XHZFNveESbzDW3bJyKr5EvHj1DcjZLhww89meddVeaSm857eGSnSQh++pc9qx6lT63iwAxmdTXMrRH0riOrZonZFhdwSvj0aa2IyaVa8QwyfTODhsgJu3o6Hx0ovGDlzmvWGRDV6caB8R+4D7FLvCRYmusAudXHW4KDig2IwjwNhIu7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBIXrRs4hoTmQa4hF6neHBVrZn3kq61KvLZc0kv2WHw=;
 b=D2ZlmBlmI5v6gVylYJIjNsLsGxvk3oiNT+DPCfBzvPmRpXrrtKe9ncpaqF43idswju7MtKFVsn5M/Xyt7WdScBPWfNpjULYfoSET0EiBSgF52Lj/i48Qo5aMD52IxK+eWJK2ilrNV3Xb6REfwReEcpDwhjZMBOWElmd3DI9949VqEVALtLJ2X1EsSW2Pm4IRFgviKwEs2fu/stOqhkPx9fRad0N3EHEhCzho7tTJ3KGuTZtSw8npgftmpYr6ROwvwD/SgpY3duhoDjMZuoTf55lRcqNpvvv9xj4yuFLfiZMZysnxamKHhxKHcXKd9dFH33h+UtfuuF+xkikGmz+W4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBIXrRs4hoTmQa4hF6neHBVrZn3kq61KvLZc0kv2WHw=;
 b=pZ//tuFTsXEYhhhPa6us55PEb2BfU0myxW9kprClFMYnob1G+GnnA6A2eJktDhnLr9yxlNPDZ+SZ2GtM+VWUntrb8mtDKQdC5ERMRb+xpgeF9Q167+w8OAMrABZKQ8ImKOzUdRJ1cP1hCgaFyR+IhIwK87OA2/tXi0CxQlPLwz1e4p0VXEN1rCW7WauQPT2XhKFfZ+y+dGW+3lJ+WhKtcbPxwHrU/svB32yp4wRPhKdu6gDfNrEzPJlAKKYYMWrWoko4lJzpFpbXJqGfi/wjRfWQgjLMI1zA0QbqE9ve4jmmhPjjy+lUGNmwc3ayVNVWFkAhnyudy9vEI58eD4oGFA==
Received: from MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::11)
 by BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 09:23:07 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::21) by MW4P221CA0006.outlook.office365.com
 (2603:10b6:303:8b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Wed, 16 Feb 2022 09:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 09:23:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Wed, 16 Feb 2022 09:23:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Wed, 16 Feb 2022
 01:23:01 -0800
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Wed, 16 Feb 2022 01:22:58 -0800
From: Mohan Kumar <mkumard@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <tiwai@suse.com>, <jonathanh@nvidia.com>,
 <spujar@nvidia.com>
Subject: [PATCH v3 4/6] dt-bindings: Add HDA support for Tegra234
Date: Wed, 16 Feb 2022 14:52:38 +0530
Message-ID: <20220216092240.26464-5-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216092240.26464-1-mkumard@nvidia.com>
References: <20220216092240.26464-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 327821b1-6b94-4209-9a80-08d9f12df0b6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5192:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5192D4866E4BD5E09E73FD35C1359@BL1PR12MB5192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gEnxc8BWKcRP+hrJC4cbBjPwsPkJN2zicupyvTfxAEwptUVk1KB2ezSY4vVoJuaRcGyu8AtmhU67SXmL0C0JNIK1VYNvIm+omby6DsS3xft2GBTaicrOendo4b35a9Uv1i7HHPphdgX9gmSDBhp7i8BPkT5iJJtSxkWPBa3ApqvEEShc2+BqccJCZrGv5nW2le3Y2PBKNCQtdiDTi38hCL7CJWf2QwiuX2NIzsVWBMgdXQu9QudGuZ5kwnD9xBinsa7DVU9KkLBvIxrPW5/AUes6SHI+yAQbuJAQdmey3z3MCdABRmwL4EIYjTce21V29l4JDhvjWHAVPWEEeqxY/K3fL6fH4oBhK2mjqRZoxcrLchhvuSCpKno9ogjYLvJkC62jIhnMQdAzXUt5xZvoO6yjst0qUw2I5Qd+BFvcSyp1nxow0v9pIKN9CIK0ZyGBA/45/65MHyMrCcQbvGgwRCBpWhS9kuCLUEIWRz3fka3MIiHZvk4w06D8vIVdp/IqFtkKpA/2rdtQlUA9LR9xcQ/VDqZqWAfKMuGKr/2QJRI5lAer86Eux9uZwu5CmuRc4WwJ1gPGu9r7ErKhkpD5r0qObFufx5JGTm1V+wYr66IyMct6Vldi0+zUll0e9Nbr2QUv+GHd9VP28ZC3n63Qm3bLzz//eYLxStfck5ucgM38uja/fawqHrk3qQpoQqKqw4EGjTsF5ofml6Ay1UYhNbeWq4Ysp9U2xWFc6wvL+WA=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(47076005)(316002)(54906003)(110136005)(356005)(6636002)(83380400001)(81166007)(36756003)(82310400004)(508600001)(5660300002)(70586007)(8936002)(336012)(7696005)(2906002)(8676002)(107886003)(1076003)(6666004)(26005)(186003)(70206006)(2616005)(86362001)(40460700003)(4326008)(426003)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:23:06.2863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327821b1-6b94-4209-9a80-08d9f12df0b6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192
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
index 2529e7ec0bf4..2ab651916127 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -64,4 +64,8 @@
 #define TEGRA234_CLK_PLLC4			237U
 /** @brief 32K input clock provided by PMIC */
 #define TEGRA234_CLK_CLK_32K			289U
+/** @brief CLK_RST_CONTROLLER_AZA2XBITCLK_OUT_SWITCH_DIVIDER switch divider output (aza_2xbitclk) */
+#define TEGRA234_CLK_AZA_2XBIT			457U
+/** @brief aza_2xbitclk / 2 (aza_bitclk) */
+#define TEGRA234_CLK_AZA_BIT			458U
 #endif
diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
index 2662f70c15c6..c42fe61fba5e 100644
--- a/include/dt-bindings/memory/tegra234-mc.h
+++ b/include/dt-bindings/memory/tegra234-mc.h
@@ -7,6 +7,8 @@
 #define TEGRA234_SID_INVALID		0x00
 #define TEGRA234_SID_PASSTHROUGH	0x7f
 
+/* NISO0 stream IDs */
+#define TEGRA234_SID_HDA		0x03
 
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
index ba390b86361d..178e73a687f0 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -10,6 +10,8 @@
  * @brief Identifiers for Resets controllable by firmware
  * @{
  */
+#define TEGRA234_RESET_HDA			20U
+#define TEGRA234_RESET_HDACODEC			21U
 #define TEGRA234_RESET_I2C1			24U
 #define TEGRA234_RESET_I2C2			29U
 #define TEGRA234_RESET_I2C3			30U
-- 
2.17.1

