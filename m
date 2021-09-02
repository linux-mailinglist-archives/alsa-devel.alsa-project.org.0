Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A1D3FE8FC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 07:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C555C1715;
	Thu,  2 Sep 2021 07:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C555C1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630562206;
	bh=eI66bLKeqJp+ECRiOsOUkKw/nv0q8kX9PpzhiWPYSgw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=psN0/bXEHgB39mAEZdk6lHV2gZZyu1RCB/NILeVh/szyzbiaIrxG+1KshEfm3CfWf
	 czVtfbHcDFLl25HtYsUMwjBNSCs/TkKgmwOLwby4QneoXx8wfCrYMcJNMflO4zcSzN
	 4mMj+qSCvM/wVwA/vtLdVcckhkDb+WJOoskSi/30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94C2AF804ED;
	Thu,  2 Sep 2021 07:54:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87128F804EB; Thu,  2 Sep 2021 07:54:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2059.outbound.protection.outlook.com [40.107.101.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD71AF8020D
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 07:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD71AF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="AF7jV636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=il36AHhvj/HyLvWWMjL8APIQ93pJ9X5n3AadS6IrhfRcxIKky/oMQlET4BQaGpV09gzldhGiWvqOg2h3dxXHEZNr2lPWlBO/8gsDfuQMXuL6yglP07N0wLzDQLvS2PREpglKTpHshwgqlFddsTsPI/GPR/WUUuzKwJe0fVWpzZo2/AVirSnLOWOiArJKwVUqyQfPCDYmtzfMrtLO+SspcY0w3M4m3VYsz1TXgtDJYBMmAiVC0KG/rkc7AU9UwRo7WpywzC0rIHxi8+17vGNgt4VXTYROPi7oPAbT/JVuuPf2Pu262xeSUuSAvoMAy//aIsabDX6N23snvqnYzZRVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fCTPc3LqXdxcKmaQaDILUBFCelox8lFy0Qv4x+rz08=;
 b=AMQJ16S5hd7rPg1RaPuY+3KOChRajqfyXgG2zB+5ISTlo4ZburzL50pUd6sO2CI/LRD7IasT5hyc3WhF945WOfwg6Srf30ddVXlm9WS1E6eHpx0Cf5gHhU9mcRDSFabnN3+hwptaWpA3U1xGQmC9i7fvui1GOSUDbE5RJ6D3JOgneDcoCoDeL9SV8+KOz7j/5wpY8JHCi1estXAiR763fMe1Tyk7ZanHm4XMwkTTubav8SIyz0ilXgA+XCphEiSREkNqAJ7ad7mazZZXY2nesOPjdLFyvknWLVv7gJsIwRYvW62jw5ES2NWXXxVWwVXpDjMx7AmIPq0p40NL+G1bNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fCTPc3LqXdxcKmaQaDILUBFCelox8lFy0Qv4x+rz08=;
 b=AF7jV636hWl+a0IRI591sLboJvC1szHm146yqBHjmp7DUqSe38Zl2i4RVf4IVVrp/fClg+2gFi6cjgjptyaJYybBed6E6GrOi78rPffqXnJqZV/Rr8hutLajBzoioish+vikiz7Wk8FulTCW4buiS64Gh2ABWv9kiQidPQxMjmeAirzDBKSr4/27CYdtiWLMP+Yb9AObv+mI9TYwriGzU5g6ODmvJ+X73yYQTaiHW6YxbA0PEntXcTEIYFX55Rhrpnawju5dfMmZxLdyPHdFyh+23+Q2uZIbGqRRx32bJj7kaBQ+FuBSd8eIXKKjRXw9oiNquKrrhNvpzgw+ru1/lA==
Received: from CO2PR04CA0197.namprd04.prod.outlook.com (2603:10b6:104:5::27)
 by BL0PR12MB4946.namprd12.prod.outlook.com (2603:10b6:208:1c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 05:54:12 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::f) by CO2PR04CA0197.outlook.office365.com
 (2603:10b6:104:5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Thu, 2 Sep 2021 05:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 05:54:10 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 22:54:10 -0700
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 05:54:07 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>
Subject: [PATCH v2 2/3] ASoC: Use schema reference for sound-name-prefix
Date: Thu, 2 Sep 2021 11:23:52 +0530
Message-ID: <1630562033-13231-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e56fe3d4-6b41-4605-b133-08d96dd615ea
X-MS-TrafficTypeDiagnostic: BL0PR12MB4946:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49468C2E3ED09DC035E5A9F8A7CE9@BL0PR12MB4946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J6unvhItwx/sVlMFvKfnZ0SEj+te2leBUPz66l/tN14Toy7f5PiwLwk26Rz4MY0ws+tk89t1Bcn5H2DPnuYSOupVeT4hXaJXU9lPBwmlrgSrqAtr5JdAva2X9w9kWw57oqvCEfEyn/FXbTB9Y+7SOWQZ/Hm7UoKOh2lmq2Kskirv3DDD1HTn7SuegNB2Lzm4cbfPfDEa0ll1uMwN54r+9wLqUQ4z648jHgZqFIVZTuxJF1H0fLLq9ACv4XJ7gFIjjLjS6CghrBu86eB3yEnky9rnfAycJRumTndiYCTRyNvBIFnS8SsJmsX8z/ddt6DCMskg21vSYoFySjXdrzGj9VwtFXrgPG0Wi0yQxVcf3o2MO7DKq0MZenSMmtWmSMpMUZkgdlPjeqUOeDR65/OUTqRKkMhyl5dKsJ2+Ovueq7r2G+c84XwCCPfEGzM+Y2vP/Gk6ci8T/5CcQgl3L37dUdSgh8tU9RDhEL1i3vd8kv+mcLi8nQomfXWsKjkxLgiL1kx/NiMnrlTY6erLQMLlK+xOksWwGgyLjABxbd5J690Csdwz4J883Yz85WI78+i9ULGB2fJ3Ys+zc4V6yVwn8BLjrlZ3DPpyuLVUcEaBGgdjeRobkor4f18AU0LCktePOET17/7JcHenYrukevBZkYgKKRsw8b5OWYeNjxRnoKXjyXpugysjHOiGh4rPsvbcBNCe6sT28WXM0llfFv3QmA==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(8936002)(7416002)(82740400003)(36860700001)(83380400001)(107886003)(7696005)(70206006)(70586007)(7636003)(110136005)(36756003)(5660300002)(86362001)(478600001)(4326008)(186003)(2616005)(6666004)(8676002)(2906002)(26005)(47076005)(316002)(336012)(356005)(54906003)(82310400003)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 05:54:10.6667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e56fe3d4-6b41-4605-b133-08d96dd615ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4946
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

