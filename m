Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9A4535E49
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 12:29:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D9261735;
	Fri, 27 May 2022 12:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D9261735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653647345;
	bh=D9acvhc++zqU7ciR4lFkSBtzykliXbsOh2kiU1aD+74=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aF59yjOS9IEXSVwQxIq2YUZmOD0UESDYEY08qT2B6z5uGkw5dQb/RLZ7zwTeLzpxi
	 VK78vxwT1xXXVRgLGeEATjRXx3e9ZCKWjlwZ8BVywgm1Z2fw4365Tw7sFxdGAlE4b7
	 gHnuQEXBlRCBSX2B7VuS85R+k7/N1/r3qOFdy0yQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A40F80537;
	Fri, 27 May 2022 12:26:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1626F80535; Fri, 27 May 2022 12:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10BBEF80533
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 12:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10BBEF80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="KqXBhKdf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izwSGDnAlTZZs39UKUFRQ/232LFXZiQALv0oNmvff7KN8JG108PYUhH8voU9d4BRU2j1AWjqUpFj1bvEb/KtfAqJkjPbHsXDFTwxTbn3ASNDjo2XMsvyGYUtZkVquq2LCKdV7tOg86KI+/FLhH/XMVSrVo9Cj/GP1Wgf6ebxC2iCImhoVy0VI+OGF+QBDeX2V6ScMd205kphRdhjf3ss19ukv5lCr/rGNXGxcfPZzVJzaRdcjyHU/O45XSziVYxfjxmI0NQlZpw8DyUJLbt0opDPwDHrOQPVbfLfj1t9nOTOr+jm545i6kiTP17WWM2PWVH/L1165Qkj0l+g5HuvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpUJsrsFsHwh5PMan/qdCfzXz73LwMa3VQ8GHIjRWNw=;
 b=WxBKklIB92o6Z2ePY15GiktyCCT0J+MkXnQnMR5Gln9rTzDGTbntnUd+rJ0Hqe6KXP4m3nL+zZYBepTH/LGySqXju0Cb9srQYo0AFYfMV/u/3vMxBx2J/TBNVYznfk3g1kKkS0Ca+jgSqaSxWAVE7RtkipXjjox3TlltkJamQwqATe2keBQrWQV2+zbNerTggFSIvpmbp7/W+BLIS/VwDg4Ogl/qVX8X6/N84S2L7+eReHxLAJPnRcCIL9doj/pq7sEBREZPI1cH3qu+H+DwxJVY2spMEc378vG+aAFZ7IGIJ5Jm6jccyRoE1Dt+JPBpv/dna8UKbPmLOMb1aKqg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpUJsrsFsHwh5PMan/qdCfzXz73LwMa3VQ8GHIjRWNw=;
 b=KqXBhKdfmxItCUP46ESvh+FwKh5pRyEgbT1Lc3NnlPe8RFcgxiSsWB1FKS36NmNtU5T/3L/+bWPX9tK30IgGtO5XRzqHcYeQaZNl6Dr/HLDRfa6rnZfBcvZPIWMC9y4ge3hYZm/aAPGE2ZjcoSD4La8xZv+CKZJN6JbKJWQ01re8Ybf2h1mWrmvE+EbMTjl4XHsu2nohXdeaU6uVoz6HqXjpK8m8Fwpu/tAcZYgZLRDC4HtKZPD4lFgmnjyTt97h6T6K3Bj+e92JjAOOmg7XyKB17dLoF/ruhGpkoOY2S6BnNRTGH7Js8wfAb7zGha6+3ax+/Cu8crk20OexNjXDRQ==
Received: from BN6PR13CA0050.namprd13.prod.outlook.com (2603:10b6:404:11::12)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 10:26:45 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::95) by BN6PR13CA0050.outlook.office365.com
 (2603:10b6:404:11::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.6 via Frontend
 Transport; Fri, 27 May 2022 10:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Fri, 27 May 2022 10:26:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 27 May 2022 10:26:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 27 May
 2022 03:26:43 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Fri, 27 May 2022 03:26:39 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 5/6] arm64: tegra: Add OPE device on Tegra210 and later
Date: Fri, 27 May 2022 15:56:11 +0530
Message-ID: <1653647172-2569-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653647172-2569-1-git-send-email-spujar@nvidia.com>
References: <1653647172-2569-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be213c7a-0f1c-4062-2278-08da3fcb6617
X-MS-TrafficTypeDiagnostic: BL1PR12MB5897:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB58970EC0D869646618DB80B4A7D89@BL1PR12MB5897.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBBlrxUASXPDGfdV9vENUWnBAgn3qo+bJOydVtypIrLnLbWr4h8gR9U99+Uj4UlE5hlgtHFvyBlOjX3OYFkmQJvhVmKqAD+3fOnKVdKtl1/tBMf5R3QKMW72A1sf6H7EocPYq6JQerO4x30izmegcboUZbgiGguGwnn4xpYGEf00lb9iopBcqEdig56v5oXmEdgczrMUmtD+JdSQNjoFGc81CxF9t4O09nsAKBX6mLmx9aY5F90clwfJc0t0/A/m1+g+7avUTsrdhw3VqPV0xOAXd/k2prW7P/QywyBMc8S2KCZV5vo6ZcvbTDavNjf7X2tWxYUSdVUnZ+ku/w/38Ae54+qNsRrxTsgZzq/kkScfJzCM473NWmFuDg5KXeb1xUjPNEPWPSwUZ1Up61P36hI0qzy4qXvixoqwAsY2ywTcVxsf3MXGUc4tRf+jK51TG05nFnIbTiOIcVGfObQH7emj//cCSs+HAXLXU0I22Hr5FBWFTPNU04zD0qdlj4Arggt4VTIa+nTPmKmbWZayLgK36sFOVKpTzdqoJiC/gs/UuS4MqQtWPA0nN6FHSKDWT03NQNPnuHbAB8aRXWiLQgchsxh0gOu+vtyzqVs/ihgxVDnwFWghJSecEdlrZvZJZJvMZw6ij/eZwuRkDBmRigd8Cy1GEiRxAjVPI9/q15EoyPZzOb+ELF3YDQZYqkkGfJxmVUMVwYlzqqMRQDNzUg==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2906002)(86362001)(6666004)(316002)(4326008)(186003)(7696005)(8676002)(5660300002)(81166007)(8936002)(2616005)(107886003)(7416002)(36860700001)(40460700003)(54906003)(110136005)(356005)(83380400001)(82310400005)(26005)(36756003)(70206006)(336012)(47076005)(70586007)(426003)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 10:26:44.8331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be213c7a-0f1c-4062-2278-08da3fcb6617
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Output Processing Engine (OPE) is a client of AHUB and is present on
Tegra210 and later generations of Tegra SoC. Add this device on the
relevant SoC DTSI files.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 23 ++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 23 ++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 40 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 23 ++++++++++++++++++
 4 files changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 0e9afc3..cd8c4f3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -509,6 +509,29 @@
 				status = "disabled";
 			};
 
+			tegra_ope1: processing-engine@2908000 {
+				compatible = "nvidia,tegra186-ope",
+					     "nvidia,tegra210-ope";
+				reg = <0x2908000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+				sound-name-prefix = "OPE1";
+				status = "disabled";
+
+				equalizer@2908100 {
+					compatible = "nvidia,tegra186-peq",
+						     "nvidia,tegra210-peq";
+					reg = <0x2908100 0x100>;
+				};
+
+				dynamic-range-compressor@2908200 {
+					compatible = "nvidia,tegra186-mbdrc",
+						     "nvidia,tegra210-mbdrc";
+					reg = <0x2908200 0x200>;
+				};
+			};
+
 			tegra_amixer: amixer@290bb00 {
 				compatible = "nvidia,tegra186-amixer",
 					     "nvidia,tegra210-amixer";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index d1f8248..e65d1b0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -562,6 +562,29 @@
 					status = "disabled";
 				};
 
+				tegra_ope1: processing-engine@2908000 {
+					compatible = "nvidia,tegra194-ope",
+						     "nvidia,tegra210-ope";
+					reg = <0x2908000 0x100>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges;
+					sound-name-prefix = "OPE1";
+					status = "disabled";
+
+					equalizer@2908100 {
+						compatible = "nvidia,tegra194-peq",
+							     "nvidia,tegra210-peq";
+						reg = <0x2908100 0x100>;
+					};
+
+					dynamic-range-compressor@2908200 {
+						compatible = "nvidia,tegra194-mbdrc",
+							     "nvidia,tegra210-mbdrc";
+						reg = <0x2908200 0x200>;
+					};
+				};
+
 				tegra_amixer: amixer@290bb00 {
 					compatible = "nvidia,tegra194-amixer",
 						     "nvidia,tegra210-amixer";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 4f0e51f..04383a1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1723,6 +1723,46 @@
 				status = "disabled";
 			};
 
+			tegra_ope1: processing-engine@702d8000 {
+				compatible = "nvidia,tegra210-ope";
+				reg = <0x702d8000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+				sound-name-prefix = "OPE1";
+				status = "disabled";
+
+				equalizer@702d8100 {
+					compatible = "nvidia,tegra210-peq";
+					reg = <0x702d8100 0x100>;
+				};
+
+				dynamic-range-compressor@702d8200 {
+					compatible = "nvidia,tegra210-mbdrc";
+					reg = <0x702d8200 0x200>;
+				};
+			};
+
+			tegra_ope2: processing-engine@702d8400 {
+				compatible = "nvidia,tegra210-ope";
+				reg = <0x702d8400 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+				sound-name-prefix = "OPE2";
+				status = "disabled";
+
+				equalizer@702d8500 {
+					compatible = "nvidia,tegra210-peq";
+					reg = <0x702d8500 0x100>;
+				};
+
+				dynamic-range-compressor@702d8600 {
+					compatible = "nvidia,tegra210-mbdrc";
+					reg = <0x702d8600 0x200>;
+				};
+			};
+
 			tegra_amixer: amixer@702dbb00 {
 				compatible = "nvidia,tegra210-amixer";
 				reg = <0x702dbb00 0x800>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index cb3af53..7e07684 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -304,6 +304,29 @@
 					status = "disabled";
 				};
 
+				tegra_ope1: processing-engine@2908000 {
+					compatible = "nvidia,tegra234-ope",
+						     "nvidia,tegra210-ope";
+					reg = <0x2908000 0x100>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges;
+					sound-name-prefix = "OPE1";
+					status = "disabled";
+
+					equalizer@2908100 {
+						compatible = "nvidia,tegra234-peq",
+							     "nvidia,tegra210-peq";
+						reg = <0x2908100 0x100>;
+					};
+
+					dynamic-range-compressor@2908200 {
+						compatible = "nvidia,tegra234-mbdrc",
+							     "nvidia,tegra210-mbdrc";
+						reg = <0x2908200 0x200>;
+					};
+				};
+
 				tegra_mvc1: mvc@290a000 {
 					compatible = "nvidia,tegra234-mvc",
 						     "nvidia,tegra210-mvc";
-- 
2.7.4

