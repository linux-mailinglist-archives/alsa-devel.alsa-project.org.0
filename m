Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E279C4B840D
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:26:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A42B822;
	Wed, 16 Feb 2022 10:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A42B822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003561;
	bh=KA3uFHCdVe4O18mIzZg6KX+QH5Up6qo8aMwCDSwzegs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u8dcoUB5lVmsHWl0hamC5S22Ku3rJHQC+AC8LztLqo1B7ob44q2qiF9vzTBiYjjTX
	 v1/X7Ia61r9H7zyG5G3SxPQ/IXBvaKyslI8mMVAGWPs48TzRD2cGPsz1EKRPTeKVX3
	 BoNQfSkj1T0S/62DGXFv5c5zrZoax24E/5ZjO8TA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3958BF80537;
	Wed, 16 Feb 2022 10:23:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A44DAF80534; Wed, 16 Feb 2022 10:23:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::610])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3E25F8052D
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 10:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E25F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="FzZEKGeE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka1g/ZPb+v2LQitpeNcrBJU0k4PkNQD+IirugZPhwX/atgHqZ1RqE/jGTPASuK3x08LlP+Vsxy4gnYyMSTLZ3Vx/0PXTA2Rd2VoL83pxwhN4witXjhA1vXWdQB7A9GI7Z/9SBlDcwQ/7UJFGLdswljFIIEcoH+bz84YFOAWMBEmvADXElrxAgajF/2NZD5WHLzc8BJwz6Da0jC/+zUrue19KIdl9BMNoa1uC19xrdBI866JsKG3lbOCbE+d0Z/FLl3AC4aqdn2/WtO2RQO5TvPlU8/dB867V0FtAmf26riB95I3Z79XgxtOwyKAxDhI+BkuD/fHAInwPBH/ZAMA1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E3V/XFXAPpfQGael9rZzRGGmlMpTvUEZcL90X/5EMg=;
 b=oCvPZpQuhopWG6wegtTNz4kX7GxI5gH/DHmntN2ycDA/epqSBTM2fBWyHId2kSAwhGVKCAWeWPTGclUMVbJu5yao5b4+mQoms11cQl8QM0NKjQJzEyuQkvy1pQ4w+jfXy3vJ1vnBHh2+KOSGenUuVgKnzAt4heiJ1Kcz38OVOAqP61ynAPHV4cY57Hr1pdxLObIEnLAO/HQ7eneIsoIKpNU5WtUKWAH+PcKeuMoe5MqMz9z0ydMu0u/XuLHVE40cYm09p2zedbv1olPS7S0NtJAZWs94oTDYGAX2dJVqJacO2TYHoU198h/DMCY5TvbNm3bhPjSTcVrN5AG+3fEQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E3V/XFXAPpfQGael9rZzRGGmlMpTvUEZcL90X/5EMg=;
 b=FzZEKGeEinc8PYt4Cui+BKpo2AgUjwyAxczFCdVSVQG+P5xTGAWonKIdHAIBqwyxMeTeQcnFxWiiOUBTiD+5qb8tZC6uFNku4hTxihcp3KyNci5lUaoSkVlcfXVBKoK5E/yZnUojPirXlHEykiSQGiBzCXYTQkN6jUdmQ36tLUUUdy6jj3G+qZ5P6fxFunImVcfx09xCtjAxEBvc1W766Y2TCHn92/QTxXYBflfTgwcuFFdkAbEbfhP4ScHxd8Jna6O1MaGHbVoQe1TNUTD05+j5tZHsmHwe09cQjq5WmCL0yPudz9gRQVlL1AJbhNjU/EESTIl+FojlG1srFKwx4Q==
Received: from BN8PR04CA0061.namprd04.prod.outlook.com (2603:10b6:408:d4::35)
 by BL0PR12MB4609.namprd12.prod.outlook.com (2603:10b6:208:8d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 09:23:10 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::31) by BN8PR04CA0061.outlook.office365.com
 (2603:10b6:408:d4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14 via Frontend
 Transport; Wed, 16 Feb 2022 09:23:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 09:23:10 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Wed, 16 Feb 2022 09:23:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Wed, 16 Feb 2022
 01:23:09 -0800
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Wed, 16 Feb 2022 01:23:06 -0800
From: Mohan Kumar <mkumard@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <tiwai@suse.com>, <jonathanh@nvidia.com>,
 <spujar@nvidia.com>
Subject: [PATCH v3 6/6] arm64: tegra: Add hda dts node for Tegra234
Date: Wed, 16 Feb 2022 14:52:40 +0530
Message-ID: <20220216092240.26464-7-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216092240.26464-1-mkumard@nvidia.com>
References: <20220216092240.26464-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecb52475-d313-4424-1984-08d9f12df352
X-MS-TrafficTypeDiagnostic: BL0PR12MB4609:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4609502B835D465FC345557EC1359@BL0PR12MB4609.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDeWuZBIZRTRqEBozAi/VVaapbmcT/bNKsiLR4MsrHzQgJMwLZ5IZO9dqhyCVsqmHaUUOGuBsYyf+CrCejmW/mt1YNpItidtpmmREOBGUdfeOpjV6Jnttqq/9qMlxSpAkmSybvG3PY+gSwbvu8svZUXWbfYbddxd7Zusl8J0ZzNHfrDdOUyS6xD5YPA2nZKfiB6u39Zjqmm1HylC7LlLD8swutkv/sSidOTOJbzsn5QWVDY+e9LSrutPVngTutXwpqW1DKWMZxPpau52yMnujOuQfcxeYRbf4FSFhH/WEXa3Q3VOADdhkbAtq8eKSRPrXcjal9A5gEvcJmw/U7gEXz0P+RXNW+Q1OjEDyiY5ydoef9wQAVL/IhsSMCKLM6wtfuXTU7I4M/EVlXxtv3ixG1jPZ/6wLTzUy/fFuaBoBWFuSi8poMissuAA38pPvFXImt26F1f+D0BqS1R/MuQIGEA2iefzvcrfVcq/Ezme4RO1mWk12Xzmhg/gzh+Yox80PGkJrITCMTr1c+NqGwcxXqAN3RLoWVVOKSiVUFwscyYqMF4Jgko9MyEhxV9dBoW8wGrQ48cC+LDiF9dHSD0McAKSShMAInowwVUwDggO24ln4aOWRAO68X+E7gpH9PdtP6Tu5rX5bKxtl5Ze1iLSMBkZIJ+2h0e6LZmAseXJ0FtJQnjgpJ2UfZv2Y6mo7vTurD8knRoo0HfQWuguvfvqPjF1+XMWgCNq9NuLSbVhvto=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(186003)(8936002)(5660300002)(426003)(336012)(26005)(356005)(47076005)(7696005)(54906003)(110136005)(6636002)(36860700001)(2616005)(36756003)(4326008)(8676002)(86362001)(1076003)(6666004)(83380400001)(316002)(40460700003)(81166007)(70206006)(107886003)(508600001)(70586007)(82310400004)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:23:10.5671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb52475-d313-4424-1984-08d9f12df352
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4609
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
index cbebf1ee5958..a5271d33a458 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 #include <dt-bindings/memory/tegra234-mc.h>
+#include <dt-bindings/power/tegra234-powergate.h>
 #include <dt-bindings/reset/tegra234-reset.h>
 
 / {
@@ -394,6 +395,23 @@
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

