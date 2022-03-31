Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8282C4EDB54
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 16:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11D1C1AF0;
	Thu, 31 Mar 2022 16:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11D1C1AF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648735628;
	bh=QHWN3QbyzGiu5qe2fWTWkkhW6wj24O5pbeA73pEIzAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gmVZRQ7khaDD4ZqfbP9WQHB72gkJKHukbACHCgxaOj6H7g6ZY0pM+IuXbH8gAjEQn
	 zCY2tv+Ts/Y+lADhdYWS/sK3rwfzf2ArKtdHDrNaVjNrSCcYrRecuy2SMnDktm0BCH
	 uFENByghUcAS0qMJyfNrKoNNYVhr2vogXUwXdz2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2558F80536;
	Thu, 31 Mar 2022 16:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74C8EF80539; Thu, 31 Mar 2022 16:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D40DBF80537
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 16:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D40DBF80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="uFIRhD1I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNqQ7pGHB2M7juiOyYHBmTZJf4mQ1dVRcbh0T76Z7jPp+VAB4A0jrxes6HaHTjoL3u9saPVE3m5OJNO1Ut2hoUWQg85N4vIQCzZVbh3kASpexyz2NzcsqdYcjJMqUT3FXNbTRwxH7xiK3Mv0OTbkoo6vex8SbMWmiCtQeVjZFYxWwmcdcWwed2BJDEnEEKY+pGx00KPSx6Y3FpICoTZpc6H2bV9RM+6oNf95IHKSuF550bka+k4pg7BQIVT5xE52YI5Vm7fwfqVxUHr2xfYz+HFPN4vNtRi+Z+0kafWRBJvTR6bHLqzeKQbxBC4ptm2xzo44sWtGf63UiiivTVAPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvBL2G1yjeV6OA5thnvh+CqEDiFd6WmrNsoTXXT5OBw=;
 b=NK2E+Xbnuu5FZ+7vZhMR77w4AbF5MGAhcT6U+aROqzxFvKANy3JGKMn3gy3xMmOFEsc0pMdex1UMvxILFBlKYBzocDuOGHtBODntv4GIQa9I55RBP9oYlkJOmvjH85706IeZtEOel3Dry7fEiyc2WDPQLA3hUuVmbJL0ECTJ9Gz1B5TRaMb2C+/Y/WwkMPCdDZVlbM+3jrYRU5a2DHcwTVPZEEFcuC72Vg4yCRyHB6WLhKkFjH6w4Z/hv0QWoAE13Yz9YuN4sC0gGMao3P6Vo3ePMWOrp9C8RQwBEHxBRYsBeG2K0k2aMfopr/YvkzNsYf9gSUonpx8fWvw+U0f1DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvBL2G1yjeV6OA5thnvh+CqEDiFd6WmrNsoTXXT5OBw=;
 b=uFIRhD1Iyw5AdDKlNaU2D9jnlV4CGB5WdFNZTlgwHReyM4gY5r60QLaO2c0hIHfSL2CQL3GdTBqfOqP+2COZCYSCu7T758QHEMpAegEcuuORttZqmL4NWflD+PMjdcK10jf0ItU1vV3wxXEGdN/0MyuQq8gB8LFpz334Rh0meAG1sDo79Mb3B1lWLd351fqqRhdtG30kTn/EkjCudq4gZFKqjnzHJxAYzSWgq5649+9KAEA5wHmcB5kLHunCM8ReWOIMJ/2xyfW9RQQojjZRQnro83W6ygkyynbUaqYlJ16iuoHpbRiZt5945FuoSXYdmPrW06GmDM+LDy8nn2qDUA==
Received: from BN9PR03CA0089.namprd03.prod.outlook.com (2603:10b6:408:fc::34)
 by CY4PR12MB1926.namprd12.prod.outlook.com (2603:10b6:903:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Thu, 31 Mar
 2022 14:04:20 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::79) by BN9PR03CA0089.outlook.office365.com
 (2603:10b6:408:fc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23 via Frontend
 Transport; Thu, 31 Mar 2022 14:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 14:04:19 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 31 Mar 2022 14:04:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 31 Mar
 2022 07:04:07 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Thu, 31 Mar 2022 07:04:03 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 5/6] arm64: tegra: Add ASRC device on Tegra186 and later
Date: Thu, 31 Mar 2022 19:33:31 +0530
Message-ID: <1648735412-32220-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648735412-32220-1-git-send-email-spujar@nvidia.com>
References: <1648735412-32220-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bee82ce-5c26-494b-e424-08da131f5982
X-MS-TrafficTypeDiagnostic: CY4PR12MB1926:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1926C32A0F6E88A2D8FD9D11A7E19@CY4PR12MB1926.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vbkJywPlesf1eMtLW/rk/ba9Tu+uqFk5ZZpAWG8rMwNV5AtH3D3sEepFlYzPFIo9l4iQPQmd6QdbgoiiB3FktRwkRDoe+HY5FzoLTtjm617unUV9khJLqG8EbV9Y3h3u//W2GSHLKGTLnbjCny4evLZpBlZS+KphUOoHvn8gr/bG/Ziy3SZJPd0LjKDdavESFTIncG9SCiykBefuBY1yNDenRejAhg73MoPp3gJ3C8lY2j06wd1M7WsHmWdWfHzyx9wxmtWGF4OiAz0Xic7PO07KO7/kbXmXZVQKbAg5TsX8sqrcKGUfehNDuL6yfGAkCx7IoQgcYOO1336RAhiZrWSxjjHA/cylbYTxJmAXfHPeSK1h8oyZkf6OI8KtCz/INTwqKlhnOzG4cK5wc3OWbSk+15IzOtPqeTL8WGSJArlMeIt7kqybkhzv3v1rQGEoyOleaCbC4yj75erhx02KihzTJiz3pMs1uA+EkVI09KRL/OWzjN49NAKS7AOIPZwnSJEIyQ+xz6ehk06LmOoczffqWMGf2oZ/xZcsuX+5fa+1TP3N+87/coz9Cv5Dp8PT+KPiOx7VeI0XatNt1KU/aYY8uSm/32W/tApKG9AONtZMonXwQ38d1lFe5i+68dN2zAOLSJysO+fTKtmKwmxRJDxdpf9QAHmPh53KxCchkR79DWG0+F4LBpWYLCuSHtsvShj2cbqHLjIwvQQUA3gQbw==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(110136005)(356005)(54906003)(86362001)(82310400004)(4326008)(70586007)(70206006)(316002)(8936002)(8676002)(426003)(336012)(107886003)(2616005)(26005)(186003)(47076005)(5660300002)(36860700001)(83380400001)(6666004)(508600001)(40460700003)(81166007)(7696005)(36756003)(7416002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 14:04:19.1136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bee82ce-5c26-494b-e424-08da131f5982
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1926
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

