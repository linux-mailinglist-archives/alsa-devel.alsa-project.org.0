Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D3152C10D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 May 2022 19:40:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E99301634;
	Wed, 18 May 2022 19:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E99301634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652895657;
	bh=w24nw/fG7p4TfKs+9QneaeKnuuQRPtPfz75egVw2L3s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lie4dKzbEoTsyy0At2+llOBTOYAYEyIJ6midiW/V5/1mG3t0zwFlPBpVWJw7for9L
	 h9oSKJ1VjfXEoEQVUwDITJxkEs4psIe69p5OwW0OPI5dgDt6m7ehKg67raFhH8IK6r
	 SgYqGUoOPZVXd1VXa+PP7/NBVFqJkZSx+kBMDPBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23825F8052D;
	Wed, 18 May 2022 19:38:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C79ACF80537; Wed, 18 May 2022 19:38:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E4AAF8052D
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 19:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E4AAF8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="SXcJ6/4H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la6SeZPG2soVDU4cmekEeHX7MK07F34/KniOG6t1xtZWrtRBZXw8TetC2WERYZslxmgZM/iEVUVttWBv2yK6NIGtwFUvcK5RX/eJGo1v882xW5ETip2fOvXACLh6OLr6ur+5uVrNYjVHvrWZ+ZWFzpAwk0Lqljj+/Susio6XHwtvJSsAI0ZGk3kyH9oDJ+ecu5/8UvX6jG4qtyvYRUD7OT4p2tNGe8brbO9GbJ0vm+D1QKWNfs0w6oESnWr6xyITbmOf7m7agLWYoBCcRdbDtRuuzymuilitcJM3PTM6m/zxf2CN46RC9GjJ5XWppJPRvxLzW8u43E4GnBvLqaQlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lY6uIOC1FkziTdNhHePCWyeeRJwJbGVvfqfDu2pQ5k=;
 b=fQAmTtGjmawn3Oq0op5yUlKBqFsQ1qZa+KSnsD1ZE6Ar+XgCEdMsI0GDhyVVm2qDRbem+kn8tk/gOZMav/K/KU5+2ZPOrhDLzgdQmDwRr2h4t3Ep5LEq0Bxrhrv6+2HhZgJn/XGdqeUM7HEgb5Y1Ow6fevYUAGsa0cwaolY83wvgWR5QZWyo2MMS3wJ+uZj5nvMVJkII4RIE5yGN91uIM02bdGayFyHTvH/1I1/ntHGcT8+szTAwlgXJXqxfZKF4PRnVO6DVwaHdw0Y+OEEO6R9cD0qGa3QtH3IxyyEToiEZ5SPl0WjpgZgTMTYfqliDS7kWSsxRjEZ09gwGL5t6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lY6uIOC1FkziTdNhHePCWyeeRJwJbGVvfqfDu2pQ5k=;
 b=SXcJ6/4HClckbwYMc/3YSRsLiAq9xuKbxwmJ21GfOWh3RrUJ4Iag3T3SGqnLULfAv2Nr6BF3FsXth7zJQSm2hGwR7Gdgr1IhidgF0I8WMxXLZ6XVFgiaf5KD3BrtRS432ZA3EbiXfjZtMBhlKshcMJ3+f51x2ETnJU0A9kCxf1oFUtjjoz4Fl/7KMOopUnVgkwztueqIg8YQnluENgTXMc5Z8oCGDsYfBLe+EkhUj38zBx70pp0ITC/6X8Aw66q5AIWSWaepjUEwdlKAJqEc07bDR8PR3LPM4SAjr3HbipFLxZddekGAtfYkilWB/lPo3HbY5uTo+K8nT9KOjPpOqw==
Received: from DM6PR03CA0074.namprd03.prod.outlook.com (2603:10b6:5:333::7) by
 MWHPR12MB1824.namprd12.prod.outlook.com (2603:10b6:300:113::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 17:38:35 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::87) by DM6PR03CA0074.outlook.office365.com
 (2603:10b6:5:333::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Wed, 18 May 2022 17:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 17:38:34 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 18 May 2022 17:38:34 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 18 May
 2022 10:38:33 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Wed, 18 May 2022 10:38:29 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 5/6] arm64: tegra: Add OPE device on Tegra210 and later
Date: Wed, 18 May 2022 23:06:11 +0530
Message-ID: <1652895372-29885-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652895372-29885-1-git-send-email-spujar@nvidia.com>
References: <1652895372-29885-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2c8e62b-cec4-40c8-919e-08da38f53bc5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1824:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB18247856C88034F9C6E27DBBA7D19@MWHPR12MB1824.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXg1o+CVO8W3+MhXsmhUoKpePwKvLNyEJUJL5KUtXvpceMSkmJ3UjjEZFzgCFzx9C1Gl9EspwzzpPnWuH6cbuEsRRG8dLX9oIzg0IncwYRgoQ6VPaHuEiTKCm4NFsEx/8E8apyxe0uBHGttSNEQGrsu8NGfIlCi9nw8ZgoNoxvsQtM4/KhiQ+mdYlPOcdrEer2hl7+yLubOsPAz9QIR5VQmDKOxDBVLfieD3onH8S+ecZd25YNef2vVejHRJziDNqPWsf5KdSqL6PRQth0J0xiFJwWudaGSHbcsxN1L0+ZGznAXLHRbG6921Jkxj4HjE51n0FNcvrim07DJZXu+eN4ZFsMtcSLB8HQuuNlilrG4RZhgnnHqzr8o1UsJ9/fONmK3NCXktXJvpdnHNcCezg7Ue9lGl6kUCCSsV4hrWas1Xl5RQNz3UyqhAJb2XTv4lGdJ7w+Zrec6Z1tL9EBUjqXzo8MPkxD6u9aj5pLSDbRBJsOiXjEaCn/4K3o2Tw5UNZY3zZz6HgvZNlECyqhE+uCOnhO76W9bb85juhaY00khRV7df2rx/ExYtRdDPqgWgByC0J/yiQCDh5+NMKs+LAXD2LIO0UbDE7TKy7xc2UALegel3RiM0LnjBCjTK4tsElatE032qTMCXW4VEDcNjTadHtHLZjinDT7k5tUrrLcHS+rgQ5R5TZpHrT6HeVt70BIgWUUbOkDv6gK3xGMldyQ==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(4326008)(36756003)(70586007)(8676002)(70206006)(508600001)(5660300002)(8936002)(7416002)(40460700003)(54906003)(2616005)(7696005)(26005)(107886003)(356005)(336012)(47076005)(426003)(83380400001)(81166007)(2906002)(6666004)(36860700001)(110136005)(186003)(86362001)(82310400005)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 17:38:34.6199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c8e62b-cec4-40c8-919e-08da38f53bc5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1824
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
index 0e9afc3..3adb839 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -509,6 +509,29 @@
 				status = "disabled";
 			};
 
+			tegra_ope1: ope@2908000 {
+				compatible = "nvidia,tegra186-ope",
+					     "nvidia,tegra210-ope";
+				reg = <0x2908000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+				sound-name-prefix = "OPE1";
+				status = "disabled";
+
+				peq@2908100 {
+					compatible = "nvidia,tegra186-peq",
+						     "nvidia,tegra210-peq";
+					reg = <0x2908100 0x100>;
+				};
+
+				mbdrc@2908200 {
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
index d1f8248..4df5590 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -562,6 +562,29 @@
 					status = "disabled";
 				};
 
+				tegra_ope1: ope@2908000 {
+					compatible = "nvidia,tegra194-ope",
+						     "nvidia,tegra210-ope";
+					reg = <0x2908000 0x100>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges;
+					sound-name-prefix = "OPE1";
+					status = "disabled";
+
+					peq@2908100 {
+						compatible = "nvidia,tegra194-peq",
+							     "nvidia,tegra210-peq";
+						reg = <0x2908100 0x100>;
+					};
+
+					mbdrc@2908200 {
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
index 4f0e51f..c528a91 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1723,6 +1723,46 @@
 				status = "disabled";
 			};
 
+			tegra_ope1: ope@702d8000 {
+				compatible = "nvidia,tegra210-ope";
+				reg = <0x702d8000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+				sound-name-prefix = "OPE1";
+				status = "disabled";
+
+				peq@702d8100 {
+					compatible = "nvidia,tegra210-peq";
+					reg = <0x702d8100 0x100>;
+				};
+
+				mbdrc@702d8200 {
+					compatible = "nvidia,tegra210-mbdrc";
+					reg = <0x702d8200 0x200>;
+				};
+			};
+
+			tegra_ope2: ope@702d8400 {
+				compatible = "nvidia,tegra210-ope";
+				reg = <0x702d8400 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+				sound-name-prefix = "OPE2";
+				status = "disabled";
+
+				peq@702d8500 {
+					compatible = "nvidia,tegra210-peq";
+					reg = <0x702d8500 0x100>;
+				};
+
+				mbdrc@702d8600 {
+					compatible = "nvidia,tegra210-mbdrc";
+					reg = <0x702d8600 0x200>;
+				};
+			};
+
 			tegra_amixer: amixer@702dbb00 {
 				compatible = "nvidia,tegra210-amixer";
 				reg = <0x702dbb00 0x800>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 82f9a77..966cd82 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -304,6 +304,29 @@
 					status = "disabled";
 				};
 
+				tegra_ope1: ope@2908000 {
+					compatible = "nvidia,tegra234-ope",
+						     "nvidia,tegra210-ope";
+					reg = <0x2908000 0x100>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges;
+					sound-name-prefix = "OPE1";
+					status = "disabled";
+
+					peq@2908100 {
+						compatible = "nvidia,tegra234-peq",
+							     "nvidia,tegra210-peq";
+						reg = <0x2908100 0x100>;
+					};
+
+					mbdrc@2908200 {
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

