Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6183FDFBB
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 18:21:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F51F177B;
	Wed,  1 Sep 2021 18:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F51F177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630513302;
	bh=U3PYIsFZwV85MBTSjPf/Go3fsPgmjyhH0kF9YaE0Tsg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oHYTjeJyP3nOt2L60z90ZYuDQQtXIhxiakO5cH91xWeuuvTk/EoQas7Xk/NegDfbi
	 2fzEOVT3gJvFFcQp6ikZvPUp8U7jbYRqWrTRTnFc1JDShqAyClPhM9barTNtyuIxA/
	 db2BSCo8qeWTT8JHvAAJUEz5BoyohbNLW7a/CUCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F6BF804ED;
	Wed,  1 Sep 2021 18:19:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26F9CF80227; Wed,  1 Sep 2021 18:19:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92BEDF80227
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 18:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92BEDF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="Udtdh6g6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogUFgVs5K32hfva8oCgtB7YeHqfpv6IxhcFcLvzKIJJpQw7X8F0IhXyNQkQNT+z22gQmXQCN+D2zdKjf+5gr4jIYe064Drh/OLp1saIRn6fkqtc2vi0CE3X9hK/tN/i4NChQ5x5Qp0cqN0UIUa79QLwRKqY5esO3zEYeNAKQE5P2sb+7IQl5RCJe8kyNLHZsPMv82AA4tF3N4L3tTqjSm5u8yMElF0gfVtWNxPRO23Fe0Z+GdPEvuwF6zj67aHXrTUP+vHC4KBw8RfwpO3nflFQ2kYeeOv7fmeGNGA6Xj6dU2MoGndVC+/rpfGsb1C8r8/vuJ/9NtvS0arHY+67+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1Urvh8W8+anFYE68EZtDdgvfgkRCfVLsazXYK9B2FTY=;
 b=HRnywTrG0KZQg7ph5/WQoYrK2WJlJ4FEJ17GYzilybwF2AUZAvx/OZF5oa28TuB0M2Ku5/UgP6OxhxeCsD+shjZVHiaV5eumlcso/qdXPIgUQsQLc0mcK1auBjVYPED8isQpkpW9A1jruv2KrggRI8D/8jEKsy2fuZXmOGD9nE94KCpyowMuzSNIOuYG+Ik4G3VQoZrUFTbeuhqgzZgotRZB0lFxarvBQS9TgMU5bId+P2UK4kaVDWqjOTqSor3Vf98vY5rjl+dMQ/OpDIfIYgR9DTVJFMUX6co39LtPAU6/AmkfpOUcXwW6bmImaLXmhKdTpxIEBDrZQFZGBosVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Urvh8W8+anFYE68EZtDdgvfgkRCfVLsazXYK9B2FTY=;
 b=Udtdh6g6sdnSwmadhBXIwN0a+C50g36ZOQMR+mqOipluL2ITFFywCKZ1ymmm2D/7NW3/7pOcKj1b72nQajt7R7rd7xA/PkNN/3ekrKIPbQvJsc8ODG5NJda4uTrW4WfuupA0PB3chO356zQfviUYarixApHU6NkEoV8pEfm8IgBRs3DFTAAkJOZJdhAbOalBYlsHG8bDi5c8d660NXuL8A0mRTsARVAVS1utFzZNvB8BL0NVqpNrRVYAaf9KrRsrHAZJx2hvqmbL0T13+xjzNEX8VyhVgXuJm53s2QIiFSLnFy/8V6tybQc6YYqrGKKIB9Fbn8Rt+RDV8rq5lWkqSg==
Received: from DM5PR12CA0006.namprd12.prod.outlook.com (2603:10b6:4:1::16) by
 SJ0PR12MB5422.namprd12.prod.outlook.com (2603:10b6:a03:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 16:19:37 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::ba) by DM5PR12CA0006.outlook.office365.com
 (2603:10b6:4:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 16:19:37 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 16:19:35 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:31 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>
Subject: [PATCH 2/3] ASoC: Use schema reference for sound-name-prefix
Date: Wed, 1 Sep 2021 21:48:30 +0530
Message-ID: <1630513111-18776-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
References: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d0baa88-7ea5-44d0-81ca-08d96d644b06
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5422:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB54228234853B72BA83372599A7CD9@SJ0PR12MB5422.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBulZXeALw7kEAcX1oVHP5undEbeG8AEV5lAi59qdqpAR0AU/sTaS4W/kxk0FyybARRWGyG+W0SaglVnyB/abfwKlBaKClsOPpfl+R3F5y9dEHJe8f+ZOjzVIZZNUtzO083KeWrCVXdqriOjnkOu3WXGHSIHWcQAG3JPQ7f0y+U8sLt3pRgwqVq2gQx6XaBFq90mQ/fCaAzEX5b1dVneHPkTjpj+BiHTI01trNKxcwTzjzpcztB+BiaKBdlfioyux6xr/I7ZcIgh9c4JaT0mrfGAQeUOCl+oVnwXIdIcW2UqoVsZAz+N/q9F7Ym81vQtN3of2pWCFtVsjFn/md6BjcGr1mbGzuQwkkrCyFzDNLDi6vIXDg4Ymy91gyJPnwsZLp11bulOmcXZhIE1L1vAzUncn04XqQJ4gDuo1WO4BZLeCiG1MLz44OZ3M/2uMTslYsjRc/a7gO85+8/Bpb3aHfhjZSCpkN/utAIgdXej+mz9J0fWqS+SXsfAd2JIDMAu5r6YJ/luttvr3eL+KvjGkaEfoSE0LUWyjBkdkiadPtb5tLXL+ByvSAdzsGU3zr9QPA2fshs50AOT9uaSHOecZxFqyOmt69U+Gu7hn50P5yqzQkpki7rJ0XCAcf08WX3DdwiNluozOYHwQZraNfnbIgmq28eo8yR1Mcp2gDFLvTaIXlveDqqSa3JMrpcjgiZIDdkxrg8isyckuuKWKCHnRw==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(36840700001)(5660300002)(82310400003)(8936002)(4326008)(8676002)(36756003)(2906002)(7416002)(336012)(70206006)(426003)(110136005)(478600001)(47076005)(70586007)(54906003)(86362001)(7636003)(36906005)(7696005)(36860700001)(356005)(2616005)(82740400003)(83380400001)(26005)(316002)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 16:19:37.1402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0baa88-7ea5-44d0-81ca-08d96d644b06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5422
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, bardliao@realtek.com,
 aleandre.belloni@bootlin.com, jbrunet@baylibre.com
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
Cc: bardliao@realtek.com
Cc: Alexandre Belloni <aleandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml | 7 +------
 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml | 7 +------
 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml  | 7 +------
 Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml          | 5 +----
 Documentation/devicetree/bindings/sound/rt5659.txt                | 2 +-
 Documentation/devicetree/bindings/sound/simple-audio-mux.yaml     | 5 +----
 6 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index 5f6b37c..ae04a11 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -48,12 +48,7 @@ properties:
 
   sound-name-prefix:
     pattern: "^DSPK[1-9]$"
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
-      available instances on a Tegra SoC.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index fd275a5..0f9f449 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -49,12 +49,7 @@ properties:
 
   sound-name-prefix:
     pattern: "^DMIC[1-9]$"
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-      The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
-      on the maximum available instances on a Tegra SoC.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index 6337070..a830b58 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -65,12 +65,7 @@ properties:
 
   sound-name-prefix:
     pattern: "^I2S[1-9]$"
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-      The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
-      on the maximum available instances on a Tegra SoC.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
index ffb8fcf..c93b10c 100644
--- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
@@ -22,10 +22,7 @@ properties:
     const: 0
 
   sound-name-prefix:
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
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
index 5986d1f..5333682 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
@@ -22,10 +22,7 @@ properties:
       GPIOs used to select the input line.
 
   sound-name-prefix:
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
 required:
   - compatible
-- 
2.7.4

