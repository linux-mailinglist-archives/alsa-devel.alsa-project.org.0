Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B72844B06B5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 07:54:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58F9B183E;
	Thu, 10 Feb 2022 07:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58F9B183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644476058;
	bh=mFmkcaou9XsAd/+XrH9TXxfL4fpvv0DXoE6J7SADlcw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fZcgEiW3YnNL853Z6EM2DRDNgREBCCKJi/12hPjycW4/SQ37z32/u56DkaNHjIEqu
	 chEaaijM2m2CC5il+9it0YsYNYiTbMO+2IGYO1Pti9urBXuyB4w8Q2JdXR08IrO846
	 ctFSpqPleVdC8LmFu1gwq7U2u4wHFbfwvp6JCgV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26712F80537;
	Thu, 10 Feb 2022 07:51:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FF5BF80536; Thu, 10 Feb 2022 07:51:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2A90F80527
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 07:51:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2A90F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="TrpS6dtu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLW3RoaYHbF8i7hwpswasVhagoq6M297280KCYMLeS0lQHCoYoVeqZTPWYUWirMPdzlZOEP9YImycDwsM9noPs7Dfrs164ix9EiNx6IK8ny+tJBmcM8z0mSLf4J9WiqAqZpm/cdtji6Oo4wcCWrk81/+8502AKj28JzhlvgbZ5lRGJspDNnlicKFRASfoGj05//h99xlP9DN4DaoleON5rA4tF3j4QJQvrD9M0xRWfjKG9jnQ1jgn5MYTt8H4GGS9VBW/D6+w4BfivUUEzHJejeJcOOsNdWLIIMcRYtzZnY51PD4XjwLP8jXGvqQOo9LeJUjk1RGmDOfOWNHZB0YPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUUVQhfwConrFnRXbg04vsbA9foJPiCYRG+HjVc343Q=;
 b=m9xcPw1HYnMgt/XK9ZGM3Mbpklpof+LFLDQPwTWKXFnpETzfzWVkGGyXjIr+JtruV9eN+cE8FxHyoc6LyQE0sK/ZqKUr85fbfwvY8Jgy3E3KQFc/ahKeI/Dq7KLGK7GQ3IgiN98RYRakS68F+JdoAF+qyVAkShEEdR3oeD6ML5U++Z78MO8o2CrruWj667KTWeVt+eSvcD7GW8sjgFQ0A/CbudjWZr97CsWAAl8uiG7BEJpIPcg9+y9szQcZIhU9u5UaJkF5t6+P5KHozOgATkvHdamg66zC+H+h8cO2MCgxA3gHPidxEwg1OyReYXtjFRmbcSuuVFw3+6jeEHTHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUUVQhfwConrFnRXbg04vsbA9foJPiCYRG+HjVc343Q=;
 b=TrpS6dtunzLFzUwhpLnDE1VXdi+gz9lZRu3bEdOl3rrt1RpOtLxcPqEN6ArEDm0DelqOynD+ABTQv7OiYRBegatzv6siKYZRETIqye2rCMB+0T7DBJaEJIQJ8sTeR2hCiTAgWpZdBmmSsYhnnPHCg62fr7NUpaFK/VYzSZWb9MobmMBIdRndYTY8bdMRp/iLbhmd+n175stFpTG9OclgERGpSKsQzBMbOrm0RRCgJNSdXNyyGcQT43nN00cPQXXHFLkEMjwB4nlvs+7Xeo8c/SwS+HJPeODTW33YpVA97Jw5c/zALT7TlBMcB1ApF17AhK6inESqszXFGrMuywhYFg==
Received: from DM5PR10CA0008.namprd10.prod.outlook.com (2603:10b6:4:2::18) by
 CY4PR12MB1734.namprd12.prod.outlook.com (2603:10b6:903:121::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 06:51:29 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::a8) by DM5PR10CA0008.outlook.office365.com
 (2603:10b6:4:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 10 Feb 2022 06:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 06:51:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 06:51:28 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Wed, 9 Feb 2022
 22:51:27 -0800
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Wed, 9 Feb 2022 22:51:24 -0800
From: Mohan Kumar <mkumard@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <tiwai@suse.com>, <jonathanh@nvidia.com>,
 <spujar@nvidia.com>
Subject: [PATCH v2 6/6] arm64: tegra: Add hda dts node for Tegra234
Date: Thu, 10 Feb 2022 12:20:57 +0530
Message-ID: <20220210065057.13555-7-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210065057.13555-1-mkumard@nvidia.com>
References: <20220210065057.13555-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b5d74e6-0d01-4e2f-8939-08d9ec61c3bb
X-MS-TrafficTypeDiagnostic: CY4PR12MB1734:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1734CE6B572B1EFC26936CE2C12F9@CY4PR12MB1734.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjT2Rv7+z2hYq9iLnKt1qoqMQwxHbLNt3RUpjuBQkTsMnJ4EC7Pn24wt5VGQCgYQRv8xROWOJ41pO0kL+DxOkSGqzusQ+qXHKaeGuzlHs/xnt3qKyLRSlc4QQov5y/Ggw59RJ3ns/mDvVAcugzA9PVUkjf8JUUv5uvQY6nLeAVm05xnjrAJQY7P7tGUvKaRZPEVmhkw0ctVP4CN7vD+d4fT3/qwP3OwPLliRPGXDEHbA6r8evX6i1xD5RDZ5FGFV1pSyx5VG+9Bkkzyiu7Kn1W6B27RkPlXef5zWjmv11gVU/tYdwcDRhnWxgzhwdclFEEPiRhLC4FEWshvSXTehy7wcayWUVuuWShXwwHU/h+FKLjH7/jf8nJISw7jAEh/q2I1E+n+gBiUOu5YICGXLxmyfz4fTpsQShCSaTlPMgiofXjhTBgZO3MUyn9JeyULohA5QEi9dNhikjZYNmpYPtUFC6bpeO8Xap2HTWY8g7ret7HFj/YxuaVzNawqWDr6ed6bes/fubXlobMD48++hVy7CpKNERP+9AyQ5VAqXmOqv5GtA1OyfeEZQvxa/quRPp9xFctmw7KA8CNstTVbbmd9mIt8PCdlXr1iW071ZhDhAr5NywD7AA9qHp94/Ly0Zi3ClKzq8zNzry+PBfLTpG5NfGWclEZlAbyuIGtTCJqTFz08SJZn6oT9c0wAuyokyvEK66lfsoTFTbAdRKsyY7FG6192W84mRpzks23Ybo+8=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(86362001)(26005)(6666004)(47076005)(2906002)(7696005)(5660300002)(107886003)(83380400001)(2616005)(36860700001)(36756003)(186003)(82310400004)(110136005)(356005)(1076003)(426003)(8676002)(8936002)(336012)(70586007)(316002)(70206006)(81166007)(40460700003)(54906003)(6636002)(4326008)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 06:51:28.8060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5d74e6-0d01-4e2f-8939-08d9ec61c3bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1734
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

Add HDA dts node for Tegra234 chip and for AGX orin platform.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts  |  6 ++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi       | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index efbbb878ba5a..792e4a8b272b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -21,4 +21,10 @@
 	serial {
 		status = "okay";
 	};
+
+	bus@0 {
+		hda@3510000 {
+			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 6b6f15804a1a..d39d41968ffb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 #include <dt-bindings/memory/tegra234-mc.h>
+#include <dt-bindings/power/tegra234-powergate.h>
 #include <dt-bindings/reset/tegra234-reset.h>
 
 / {
@@ -261,6 +262,23 @@
 			#interrupt-cells = <3>;
 			interrupt-controller;
 		};
+
+		hda@3510000 {
+			compatible = "nvidia,tegra234-hda", "nvidia,tegra30-hda";
+			reg = <0x3510000 0x10000>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA234_CLK_AZA_BIT>,
+				 <&bpmp TEGRA234_CLK_AZA_2XBIT>;
+			clock-names = "hda", "hda2codec_2x";
+			resets = <&bpmp TEGRA234_RESET_HDA>,
+				 <&bpmp TEGRA234_RESET_HDACODEC>;
+			reset-names = "hda", "hda2codec_2x";
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_DISP>;
+			interconnects = <&mc TEGRA234_MEMORY_CLIENT_HDAR &emc>,
+					<&mc TEGRA234_MEMORY_CLIENT_HDAW &emc>;
+			interconnect-names = "dma-mem", "write";
+			status = "disabled";
+		};
 	};
 
 	sram@40000000 {
-- 
2.17.1

