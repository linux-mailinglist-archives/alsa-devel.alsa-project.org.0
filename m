Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0802340037C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C88189C;
	Fri,  3 Sep 2021 18:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C88189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630687066;
	bh=6RLab2x7CTr+XaDOgyO9uJckviMC9NS/AKF2cz0cX+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KTOI1hjxonaZ+Wv1J/V7nDVrpVm4hkzFvGZb8dnH+99Fb83hy8dg8F2dot5evwqzN
	 cA1tsIAmkKloqHObjMZ7MokU0fZGg5VMvMsceVFWKnzbqI41oCmn3glcuDEdaXi4jF
	 JXdG47bX99uS8Iu+jONGmTghzX8LcQWInF+VDBSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 493C0F804EB;
	Fri,  3 Sep 2021 18:36:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03645F804E5; Fri,  3 Sep 2021 18:36:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2739AF804E6
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2739AF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="g9oCqiVW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnF8BvFWqI8PwN1Ghk+NchjHMu/6yhKZEyxZFsYoCmOzXggKh0JsULA9vtoGPYO9bhRVB7Vi3vG9fZpH5QkPWG8+AC8CABg5IKmIbohznnj8kcjaEO3guyHwx35rfHl8OXlOc1wcYKsFPPKnwG83NZR98SrwLMfpM67tEt2OH5rrSNViI7PO7lvvhYQd43ElVpGR8feKUVYS1TDpAFeGaBKN3aFxk3FrP+wpkXZ4rzwEE6Vn0gTzvnQnmQmj/oZwfdm1jYMDofCdsJv8zCvSBLoIh/VNjb36KsVHrF0tZ78tKyj5sjaMvvJWJ2nhXAfJ9gPBaELx6XLFtABIl1gKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VOdS3o914Ahkh9W0SAkcMbWEKCkegzEIkwSERoB7PfI=;
 b=kiPBYwK4RzD6MIRfa359DgKAhO+tRteZnddrxgxcxUdlRUSDi40qmxWfJExlLOhg5TZND8iqXNjxdLCd36YVrQi9Z12jIf4shgzZhW4boy6bsDtXheI5hLMQFRTVGu4VxqMNbS2ol9mMkImPa7DzDZFRwKQMgAfTP7sawxYnZBcCZILZxQ+lM9x6k+XmYneaU9tp3YQbfkWY5A+hL56bQERpxnBBhAf+kxXoThvM+3xFbY8P2XTY56ddDv2+GR4dRU03gClH93bSsdBbrooCzC6kaj+arYFTuwzyhi+dRSTyDUl5NvwLe83PcNjy4C6rVzWXg5OSMRgfBx7Tk1uOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOdS3o914Ahkh9W0SAkcMbWEKCkegzEIkwSERoB7PfI=;
 b=g9oCqiVW7aP08jt13QMAzltF8gvFy7dzly4Xe2dE5fyY3nuIotJbFtvbEfZIls7KW/BIm+bDcDqGUAeUIJLznN9AuSqs428GqDEnrqR84u8zHJSl8FO1tzTJUVuRQyAP/yF+l7LdvznFWc+3gw40O7Ra3Qn3gi9rklJq4wB3muufHQG8LZnfQmFzCmBroqZ2f7k+nfSzPalVVPVJ8URL4OYt3QTfV+y6MflnFM3miulyuTQ8K5R7tQ0gyxVzapiohy1+WRt+dnXGs/bm5TvI7Ploz5BOqUIyVdG+SFCRfuNeY6gSFkSmzlDiwCFyuWG8acuAn45oSRgJ3/3WrE85yg==
Received: from BN0PR03CA0055.namprd03.prod.outlook.com (2603:10b6:408:e7::30)
 by BY5PR12MB5000.namprd12.prod.outlook.com (2603:10b6:a03:1d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 16:36:17 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::3) by BN0PR03CA0055.outlook.office365.com
 (2603:10b6:408:e7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Fri, 3 Sep 2021 16:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 16:36:16 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 16:35:31 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 3 Sep 2021 09:35:29 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>
Subject: [PATCH v3 2/3] ASoC: Use schema reference for sound-name-prefix
Date: Fri, 3 Sep 2021 22:05:18 +0530
Message-ID: <1630686919-19495-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d75bbc5-2a2b-4271-7ad9-08d96ef8f360
X-MS-TrafficTypeDiagnostic: BY5PR12MB5000:
X-Microsoft-Antispam-PRVS: <BY5PR12MB50000F6E5E4D8419A7764BCBA7CF9@BY5PR12MB5000.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmqNzbIjO/aUTdbfcId5LQ9t/P0bDzYC7VZvUKqVFUxneK5zFblqTkD8+U/lC5cJM8NGu5q/+3K11ia/EeQgXv8/zKCx22Am8IEqwM/dTF481/vNUAgUmAVHjbJOZJzGCkGZ5cCztJdUYde7kpd9e5TKEYwGFd240bl7CqM5+WzXR3wsF35clsPcfmcWcmC0S7ygzkxcf0k7gB70bhLJVzqv8dhE6EBB92T2TNadobGBBZj1/9FutjmfUF0+3JX6uEx0TIDSjbQUOQqeyirB3+ENaOh70KjSp7IzXCwkVtMprCzc7dNMnLQ5Vmc+fDCuh855Oj/n76sc+caFSgHuF0mMGem5NwL/eKjdHW/8YFlf3/D0YYJh+HcJ6BOfL4/sBDOPgg+hABx8f5XVGLO/pfozgm6wb9sTWp0PDCbDdH5ll/WVpvNHAdIO5eJY3ltVH1E2IJBkV9bYHtEHy0zhYIVN4D0U/DiVb32r02qWvLK0KTATXlIFmoct2B+Z6UqcbA0kr3YLLaeYnS19s7f15YKwfWS/L3dshtDEdL4vL03JRoTj0U9SJGixWgobr4l0Kt8gksztHRJdXR2D3SGHCig4rTCPmMteMOua0UDKNM3shGwSgTq2Zy5vPubOf0B6vvT9qiH51ar81pTKgjbcBSroEBSE6C3E4d9X5IAI3sqNCim0dd88xpywwQqd0HVIiqRJIpdmPDfuwWOrZHVxQg==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(36756003)(2616005)(36860700001)(83380400001)(316002)(7416002)(86362001)(107886003)(2906002)(54906003)(110136005)(4326008)(336012)(186003)(356005)(26005)(6666004)(47076005)(8676002)(70206006)(82740400003)(7636003)(426003)(8936002)(7696005)(82310400003)(70586007)(5660300002)(478600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 16:36:16.2207 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d75bbc5-2a2b-4271-7ad9-08d96ef8f360
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5000
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, jbrunet@baylibre.com
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

Use schema reference for 'sound-name-prefix' property wherever
necessary.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/nvidia,tegra186-dspk.yaml          | 9 +++------
 .../devicetree/bindings/sound/nvidia,tegra210-dmic.yaml          | 9 +++------
 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml | 9 +++------
 Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml         | 9 +++------
 Documentation/devicetree/bindings/sound/rt5659.txt               | 2 +-
 Documentation/devicetree/bindings/sound/simple-audio-mux.yaml    | 9 +++------
 6 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index 5f6b37c..0912d3e 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   $nodename:
     pattern: "^dspk@[0-9a-f]*$"
@@ -48,12 +51,6 @@ properties:
 
   sound-name-prefix:
     pattern: "^DSPK[1-9]$"
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
-      available instances on a Tegra SoC.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index fd275a5..62db982 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -16,6 +16,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   $nodename:
     pattern: "^dmic@[0-9a-f]*$"
@@ -49,12 +52,6 @@ properties:
 
   sound-name-prefix:
     pattern: "^DMIC[1-9]$"
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-      The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
-      on the maximum available instances on a Tegra SoC.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index 6337070..f954be6 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -16,6 +16,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   $nodename:
     pattern: "^i2s@[0-9a-f]*$"
@@ -65,12 +68,6 @@ properties:
 
   sound-name-prefix:
     pattern: "^I2S[1-9]$"
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-      The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
-      on the maximum available instances on a Tegra SoC.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
index ffb8fcf..68e5ad2 100644
--- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
@@ -9,6 +9,9 @@ title: NXP/Goodix TFA989X (TFA1) Audio Amplifiers
 maintainers:
   - Stephan Gerhold <stephan@gerhold.net>
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   compatible:
     enum:
@@ -21,12 +24,6 @@ properties:
   '#sound-dai-cells':
     const: 0
 
-  sound-name-prefix:
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-
   vddd-supply:
     description: regulator phandle for the VDDD power supply.
 
diff --git a/Documentation/devicetree/bindings/sound/rt5659.txt b/Documentation/devicetree/bindings/sound/rt5659.txt
index c473df5..013f534 100644
--- a/Documentation/devicetree/bindings/sound/rt5659.txt
+++ b/Documentation/devicetree/bindings/sound/rt5659.txt
@@ -42,7 +42,7 @@ Optional properties:
 - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
 - realtek,reset-gpios : The GPIO that controls the CODEC's RESET pin.
 
-- sound-name-prefix: Please refer to name-prefix.txt
+- sound-name-prefix: Please refer to name-prefix.yaml
 
 - ports: A Codec may have a single or multiple I2S interfaces. These
   interfaces on Codec side can be described under 'ports' or 'port'.
diff --git a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
index 5986d1f..c597d9d 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
@@ -13,6 +13,9 @@ description: |
   Simple audio multiplexers are driven using gpios, allowing to select which of
   their input line is connected to the output line.
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   compatible:
     const: simple-audio-mux
@@ -21,12 +24,6 @@ properties:
     description: |
       GPIOs used to select the input line.
 
-  sound-name-prefix:
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-
 required:
   - compatible
   - mux-gpios
-- 
2.7.4

