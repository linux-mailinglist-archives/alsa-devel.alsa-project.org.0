Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 348454E8DCC
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 08:09:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28911697;
	Mon, 28 Mar 2022 08:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28911697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648447776;
	bh=QHWN3QbyzGiu5qe2fWTWkkhW6wj24O5pbeA73pEIzAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQr5tKQsQR4dWYZOIapaCDsKDtsZejBUbEBmfTN0pqHj+albHQxWTnzK3rIRikFVi
	 I+TGO/Qo5IpVisgrTfM0UkICwMDcK0vl6S8efUDQlPc29+18nBTtdyk+sRk3SB+rxB
	 KUZsjD4cmofrOYRdH8BEQo8PSZKDAH+ySksF0NyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58668F80533;
	Mon, 28 Mar 2022 08:07:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBF4CF8052E; Mon, 28 Mar 2022 08:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::624])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14622F8051D
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 08:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14622F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="kCZsRqjD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD59qXI09PS33EBXkFDomcLsmB8IBG/rUT6PdGwgrEL7g9KVpyUOrMTXRtdWxTv5OhV9ocis6/z/Sp+eSHwoQtj/MvEyUnVGyeayS2OUUVXwEerhQLDzbiwP/6PIV0a50TDhsoCZnPeFxzkszB8pjNpM/V0iIJuEI97AGg1ThBNhhYnv6ZmS+QgcAuCB3LsbgsvIL1E3A0QZTqd2GHZ+3AIVMD5RI0DxPoW7xsU1XBmGww4VgOlXzwYEo5ha6gOgkKAJpohMFykt/r2c0AuhA4ne9d77QJnEJggpAtVemMkj8BU8hBm5cYnavVDAIHTxOvH4l+kFU5/d4T+wAGQTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvBL2G1yjeV6OA5thnvh+CqEDiFd6WmrNsoTXXT5OBw=;
 b=CRAVZZ2zgnHpI4G02zI8i3McF/wl1G9Vm8s1YYccs7Uyc4QDNdIQHCvoJVl/gwlmLUG0x87aYb+kM9F9Y+OaxqPz6Df74mxW2MbrEXvrPPIfUW7gdhKF1HIlaBYlP3NYSJ0rncfHBBOpNVRTQS0KNJvKdc5ZxwzwSoNd6wAuLIZ2enu0WaoUgs9nmUCyBxkZBwjT+dLmvcbipVctcC9RIYwd23Mr6wfyfwoiBtosypPif/u9beEpkzRCNI73BBXDRG/1Tr1nGFfFjox1Sm4+dgG+voNk6GfS69MMD2T/OBcyl1A/YNYDtOc8+7WQsghrYqpXBvsrX8N8mQwFgH7jPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvBL2G1yjeV6OA5thnvh+CqEDiFd6WmrNsoTXXT5OBw=;
 b=kCZsRqjDnVJtgVolanesyMZatxoSfWgWqXwy6ZxTv6MHHAPi893oYIjbVUjXYnQJQKeN4pKXdrJdyndrx/kgUO96QvE4D/8DDVEbqJkTdiezEP+7hU+0uKrQtCWGk/0gdMvFubeHq0LxsYAcFjNuMsruvrPltxgXJJr5YndO/jfmEPPUVyyQAhCMpJg+0EviYgLCJE8ejI2rKUiXoPKeNZpjMeCq3rGCdfavz/Gwwc8zHepSrZhtM6F8SSU/xBhFLivnHJc+qVapXvxP6lbAADsQeANHH7srEJZD2su5IUgdkyrfjUO9mROrflolpsniuNsaPDXDy0MlYdn2G6W3DA==
Received: from DS7PR05CA0098.namprd05.prod.outlook.com (2603:10b6:8:56::8) by
 DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Mon, 28 Mar 2022 06:06:57 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::d9) by DS7PR05CA0098.outlook.office365.com
 (2603:10b6:8:56::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Mon, 28 Mar 2022 06:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 06:06:56 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 28 Mar 2022 06:06:55 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 27 Mar
 2022 23:06:55 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Sun, 27 Mar 2022 23:06:51 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 5/6] arm64: tegra: Add ASRC device on Tegra186 and later
Date: Mon, 28 Mar 2022 11:35:25 +0530
Message-ID: <1648447526-14523-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648447526-14523-1-git-send-email-spujar@nvidia.com>
References: <1648447526-14523-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eecba8e2-4248-451c-b104-08da108129cb
X-MS-TrafficTypeDiagnostic: DM4PR12MB5103:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB51038DC662D5318CD50D1CD1A71D9@DM4PR12MB5103.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEMCgvMCvaZNenSmsYrvxH7NHvRdgfUljMRSWUUZRShI948992oQ5XiULCNkhY+ivs2DBrVAz51ipq3Hka7SwHp3RnTtmDHoiLY3zKH5AHJrkP05TXuNOZ6Z2NjHu11NOkPuGvpmAyMKuzVHFF1sRDac7aUISLxqxjdlD9BpKHICGgK3GqcoeNo2E3MLGZcPMLyghCfyRhxW+CLq0q2NVz1is9/m3Ac7inToeLTY8yeM38BddalZhwkwa9pz8bUxzU1M3E5SBiBMLHkYuJJ1rRg3n058y5HvmBCKCwx++medqaO1z9ucOVskMy2Zb4L+TVhmXjua7dO1ur4JpSKsyXUY0rgYzwmCa/SADRtCECnDpA9ZbEk8UqFMkGNWyqt7ta7Z08gOntkFp3+PSuG/veNXpxMM3a4IPcimblCZ5JzNmOQIomy8D22Bv1x9L5ilhXuc6JfQOZTL3oIbA776ImZ3ibNQlcGaqW/9Tu7sbQy+iCAVaeGp7HEtu4puiDhLyw+2LBBitJGZ5LQAYphJTJgl67AGHYBl1SHGSx80EnQNVEyhvIL7kKAe7rbl/uVEw/fEigKCcGmKjgEvxNivViu+XiSs+LpQvzSFPF5AJfRgfCp99hj9jWWvHq62oROpXlnsejBpN+rExUy/Nmqc7KE+KAsBKndtjbEQ9qgRMDYA1vn7yvElxLy+lqtPKWn38l0WiaFmUbYwjX3gSKVbLw==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(7696005)(5660300002)(82310400004)(4326008)(83380400001)(6666004)(36756003)(2906002)(107886003)(47076005)(110136005)(7416002)(8936002)(54906003)(26005)(336012)(186003)(40460700003)(426003)(508600001)(86362001)(36860700001)(316002)(2616005)(70586007)(81166007)(356005)(8676002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 06:06:56.3137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eecba8e2-4248-451c-b104-08da108129cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5103
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 catalin.marinas@arm.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, will@kernel.org,
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

Asynchronous Sample Rate Converter (ASRC) is a client of AHUB and is
present on Tegra186 and later generations of Tegra SoC. Add this device
on the relevant SoC DTSI files.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 7 +++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 8 ++++++++
 3 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index e9b40f5..2e7faa1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -516,6 +516,13 @@
 				sound-name-prefix = "MIXER1";
 				status = "disabled";
 			};
+
+			tegra_asrc: asrc@2910000 {
+				compatible = "nvidia,tegra186-asrc";
+				reg = <0x2910000 0x2000>;
+				sound-name-prefix = "ASRC1";
+				status = "disabled";
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 751ebe5..4306181 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -569,6 +569,14 @@
 					sound-name-prefix = "MIXER1";
 					status = "disabled";
 				};
+
+				tegra_asrc: asrc@2910000 {
+					compatible = "nvidia,tegra194-asrc",
+						     "nvidia,tegra186-asrc";
+					reg = <0x2910000 0x2000>;
+					sound-name-prefix = "ASRC1";
+					status = "disabled";
+				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index aaace60..0a6ff6d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -378,6 +378,14 @@
 					iommus = <&smmu_niso0 TEGRA234_SID_APE>;
 					status = "disabled";
 				};
+
+				tegra_asrc: asrc@2910000 {
+					compatible = "nvidia,tegra234-asrc",
+						     "nvidia,tegra186-asrc";
+					reg = <0x2910000 0x2000>;
+					sound-name-prefix = "ASRC1";
+					status = "disabled";
+				};
 			};
 
 			adma: dma-controller@2930000 {
-- 
2.7.4

