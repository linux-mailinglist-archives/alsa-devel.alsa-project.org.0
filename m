Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE013F9757
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 11:40:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F7116E1;
	Fri, 27 Aug 2021 11:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F7116E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630057258;
	bh=hfw5Zp0JgI2mabrCjmNJKsqL8LxvnMu+a3t+D7vOiFA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vTutM922GFRewGTtCROyQ2lRznkqr0g/dIY5F+jGND0lo1yOqyiKH5sLIcEk2Qoop
	 zts9Wf04jF4+hEJergvNPkAjQbeZMtONsodELiOWQ5ukFcuO+QMhBaJjAXGQMv3Efn
	 AfdhXxqTWhnTw1ZL7AwDOG/bluc4PSMbh11aZ01k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3676F804FB;
	Fri, 27 Aug 2021 11:38:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0414BF804FB; Fri, 27 Aug 2021 11:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC0A1F804F1
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 11:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC0A1F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="eVqa5aZU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlCrCXqZEbDpWYTnMf43+HvcevYGkV8DXwOSc4OzOaLcJikL+MAx8Ra0sd8ik027cLO67+yvAGFTdU4IqZXpRYxLK4NkcXDQPq8G8lYt9nWLUB5vw6DZMbFyfrjmdtB9yxoHyAZAVNMokhzNluFsJUtoG/1G9ZinbJ9B0RuiTBxrGFs1yuuQuhcK8BSiLl0t++f33XxFon3GrPDNQiRjdvkyzdqqP0+qLGTEQVopDRwwU+9tGGcBKTP3KNTX3NzGbtiOhUcU1LdvRGE+0JER4wMKZKDGEtcCXWajW50NNh5UAvzcsNZLCtA8coW2KSU2qQKnnkTPFTVh9mlE1wUkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka7b6mTibxbbN92ri4CP9uNahSNgQouiMfGnwoofXyk=;
 b=Bqby14+T8hclvRcSzKKpGj0OAibK04Mg8WeTJ2fvPq7My7NrGkIqClnL3X85xZE8SJgRZwTrReBblfK6Qf2mpX6xvnMhotv4/PHNxAxl5JyUtwSOAuUp7L35b0BGdDnKq9z3x3RUpUK0EKHkf1KvPxZnUDegIhbrmx16tfVg2JNCSFYmySeODXqKsuqiIsIXjD9nnsmMiqLx4ZlbL6kO8v733Rvn2O47KryjycMzq8oLeBnaeAi2c3DhapmkZxh/ZHNIFA0ItrGqbnmQXv6FuRue9dfW4/MGwNRAfubC0f/30+KwSx0/yRMFeSGM6Yo2aIYjxbOBX7AIi5NNUK4lIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka7b6mTibxbbN92ri4CP9uNahSNgQouiMfGnwoofXyk=;
 b=eVqa5aZU4IzzPC2qujzDwZqMMtMLyvbDpa3Bj6j2aWSxDy4SO+uuuQMgxI75eBnhEGcTpiek2izbcUWvGfgLwPKNl6ByWxKCXnb4wD7YgFNtSTM2zjidq7QExOS2CYyT7QmqsLXZqWnECU7CCl9VUHWH0QLbXlH1AYaBhbggadmVRnK3c0rW6xXPEF/jWCiRWPVFQh9j5OyOBJT7oQEWpA138PqchYV7/xHzsdFq4ZxTso8tp3YcgiuTU2q83IDy4dDufhejxva7YMqHH8Ee5hJRZMxKysSDRfZF+v7b1UmcG51o8udv5nzeiVdTsrJ8uuKlFJDZ+SFY7Fs6aybyoQ==
Received: from DM5PR19CA0015.namprd19.prod.outlook.com (2603:10b6:3:151::25)
 by BN6PR12MB1409.namprd12.prod.outlook.com (2603:10b6:404:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 09:38:23 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::55) by DM5PR19CA0015.outlook.office365.com
 (2603:10b6:3:151::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:21 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 09:38:20 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:17 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/13] ASoC: dt-bindings: tegra: Few more Tegra210 AHUB modules
Date: Fri, 27 Aug 2021 15:03:50 +0530
Message-ID: <1630056839-6562-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cd6953c-158b-4903-f37e-08d9693e68e5
X-MS-TrafficTypeDiagnostic: BN6PR12MB1409:
X-Microsoft-Antispam-PRVS: <BN6PR12MB14090CF2EE8226149D740FBAA7C89@BN6PR12MB1409.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3aWYnrg+RSI10SEbHRrqhLmlAp3KXwiRCOShgVn/9h0QhInREBqyG0viI8onu3oCBwUAyTvTPF/RkT7tWPxO5pXjV2P5Sf5FLaoXWgRfg/m3/c7clEgeESagx0tWZv9A/4po7iStazdXEwaaI7leBkbgR8q8Buuo9B/CwKVESKV+qksBP7YXQ2jkxyTwSuNHBXdkQUwVLvJQXWaqO4+M6HDrhG6zTW6yoLiQvdwmjSul0oUDIVCW63QHbT3UxV4YPqPdJXilE4uOfSGUyoM0jpgnUk1pVcGWuzJLzS2VQZYnAxwOSyzPZqKM180UM03XJd67o/xZrKUK8nxzAApaQscXB6hnj8QkXmsNc9zFo7vERPct5RW5Ov9tPN18dXqXI1w69jEW3TbWf0+trm8+fB7AKMP2zHBnsvJ2n2L4SOpbDhV6SPwux13vCgkmiL//efv06j8ZPhSZmyLOhGiN3KB+GL5aZ8eIM45XOmLt/3OJSIbX99hDp6VS0/l6xN51KYLeaDasrp1K5CaO8dVWFPIa1na9PBEBQahohAXmhjT/SpLKm0IM/koan2HYC7DSTjC9ZkS4yZuJ5JtlXzrLctkWy8qam03Evq2jg0dybEoLREMRl4dOOjpOFaaxWa9DVCIFCWvqg7/QZF2vYRT1aJK8dy6FskxXNbuaSX6IK33DbqBMPGNBbgYLoIq2hZ+GKbC7EesIsVkKLOXl60UrhFfUhe67Qq+oxTpYTNR9gpuq53E1J2bnWwp0Fhz+K0gkGfqDiaZsevOFdD3qjIvFW174HcQfIRaF62ZqSFbqr7w=
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966006)(36840700001)(5660300002)(8676002)(7416002)(8936002)(478600001)(426003)(7696005)(82310400003)(921005)(2616005)(36756003)(70586007)(70206006)(6666004)(86362001)(54906003)(316002)(2906002)(110136005)(82740400003)(107886003)(36906005)(26005)(4326008)(83380400001)(186003)(336012)(356005)(7636003)(30864003)(36860700001)(966005)(47076005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:21.6856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd6953c-158b-4903-f37e-08d9693e68e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1409
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sharadg@nvidia.com,
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

This patch adds YAML schema for DT bindings of few AHUB modules.
These devices will be registered as ASoC components and bindings
will be used on Tegra210 and later chips. The bindings for below
mentioned modules are added:

 * SFC (Sampling Frequency Converter)
 * MVC (Master Volume Control)
 * AMX (Audio Multiplexer)
 * ADX (Audio Demultiplexer)
 * Mixer

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org> 
---
 .../bindings/sound/nvidia,tegra210-adx.yaml        | 74 ++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       | 20 ++++++
 .../bindings/sound/nvidia,tegra210-amx.yaml        | 72 ++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-mixer.yaml      | 67 ++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-mvc.yaml        | 79 ++++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-sfc.yaml        | 76 +++++++++++++++++++++
 6 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
new file mode 100644
index 0000000..9950585
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-adx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 ADX Device Tree Bindings
+
+description: |
+  The Audio Demultiplexer (ADX) block takes an input stream with   up to
+  16 channels and demultiplexes it into four output streams of up to 16
+  channels each. A byte RAM helps to form output frames by any combination
+  of bytes from the input frame. Its design is identical to that of byte
+  RAM in the AMX except that the data flow direction is reversed.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Mohan Kumar <mkumard@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^adx@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra210-adx
+      - items:
+          - enum:
+              - nvidia,tegra194-adx
+              - nvidia,tegra186-adx
+          - const: nvidia,tegra210-adx
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix:
+    pattern: "^ADX[1-9]$"
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "ADX1" or "ADX2" ... "ADXx", where x depends on
+      the maximum available instances on a Tegra SoC.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      ADX has one input and four output. Accordingly ACIF (Audio Client
+      Interface) RX and TX port nodes are defined to represent ADX inputs
+      and output respectively. These are connected to corresponding ports
+      on AHUB.
+
+    patternProperties:
+      '^port@[0-9]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    adx@702d3800 {
+        compatible = "nvidia,tegra210-adx";
+        reg = <0x702d3800 0x100>;
+        sound-name-prefix = "ADX1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index 1118a94..4087eeb 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -85,6 +85,26 @@ patternProperties:
     type: object
     $ref: nvidia,tegra186-dspk.yaml#
 
+  '^mvc@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-mvc.yaml#
+
+  '^sfc@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-sfc.yaml#
+
+  '^amx@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-amx.yaml#
+
+  '^adx@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-adx.yaml#
+
+  '^mixer@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-mixer.yaml#
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
new file mode 100644
index 0000000..e6b365b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-amx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 AMX Device Tree Bindings
+
+description: |
+  The Audio Multiplexer (AMX) block can multiplex up to four input streams
+  each of which can have maximum 16 channels and generate an output stream
+  with maximum 16 channels. A byte RAM helps to form an output frame by
+  any combination of bytes from the input frames.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Mohan Kumar <mkumard@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^amx@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra210-amx
+      - items:
+          - const: nvidia,tegra186-amx
+          - const: nvidia,tegra210-amx
+      - const: nvidia,tegra194-amx
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix:
+    pattern: "^AMX[1-9]$"
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "AMX1" or "AMX2" ... "AMXx", where x depends on
+      the maximum available instances on a Tegra SoC.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      AMX has four inputs and one output. Accordingly ACIF (Audio Client
+      Interfaces) RX and TX port nodes are defined to represent AMX inputs
+      and output respectively. These are connected to corresponding ports
+      on AHUB.
+
+    patternProperties:
+      '^port@[0-9]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    amx@702d3000 {
+        compatible = "nvidia,tegra210-amx";
+        reg = <0x702d3000 0x100>;
+        sound-name-prefix = "AMX1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
new file mode 100644
index 0000000..0808355
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-mixer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 Mixer Device Tree Bindings
+
+description: |
+  The Mixer supports mixing of up to ten 7.1 audio input streams and
+  generate five outputs (each of which can be any combination of the
+  ten input streams).
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Mohan Kumar <mkumard@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^mixer@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra210-amixer
+      - items:
+          - enum:
+              - nvidia,tegra194-amixer
+              - nvidia,tegra186-amixer
+          - const: nvidia,tegra210-amixer
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix:
+    const: "MIXER"
+    $ref: /schemas/types.yaml#/definitions/string
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Mixer has ten inputs and five outputs. Accordingly ACIF (Audio Client
+      Interfaces) RX and TX port nodes are defined to represent MIXER inputs
+      and outputs respectively. These are connected to corresponding ports
+      on AHUB.
+
+    patternProperties:
+      '^port@[0-9]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    mixer@702dbb00 {
+        compatible = "nvidia,tegra210-amixer";
+        reg = <0x702dbb00 0x800>;
+        sound-name-prefix = "MIXER";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
new file mode 100644
index 0000000..7d81b11
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-mvc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 MVC Device Tree Bindings
+
+description: |
+  The Master Volume Control (MVC) provides gain or attenuation to a digital
+  signal path. It can be used in input or output signal path for per-stream
+  volume control or it can be used as master volume control. The MVC block
+  has one input and one output. The input digital stream can be mono or
+  multi-channel (up to 7.1 channels) stream. An independent mute control is
+  also included in the MVC block.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Mohan Kumar <mkumard@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^mvc@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra210-mvc
+      - items:
+          - enum:
+              - nvidia,tegra194-mvc
+              - nvidia,tegra186-mvc
+          - const: nvidia,tegra210-mvc
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix:
+    pattern: "^MVC[1-9]$"
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "MVC1" or "MVC2" ... "MVCx", where x depends on
+      the maximum available instances on a Tegra SoC.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: |
+          ACIF (Audio Client Interface) acting as MVC input (RX) port.
+          This is connected to corresponding ACIF port on AHUB.
+
+      port@1:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: |
+          ACIF (Audio Client Interface) acting as MVC output (TX) port.
+          This is connected to corresponding ACIF port on AHUB.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    mvc@702da000 {
+        compatible = "nvidia,tegra210-mvc";
+        reg = <0x702da000 0x200>;
+        sound-name-prefix = "MVC1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
new file mode 100644
index 0000000..5f05e2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-sfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 SFC Device Tree Bindings
+
+description: |
+  The Sampling Frequency Converter (SFC) converts the sampling frequency
+  of the input signal from one frequency to another. It supports sampling
+  frequency conversions of streams of up to two channels (stereo).
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Mohan Kumar <mkumard@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^sfc@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra210-sfc
+      - items:
+          - enum:
+              - nvidia,tegra194-sfc
+              - nvidia,tegra186-sfc
+          - const: nvidia,tegra210-sfc
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix:
+    pattern: "^SFC[1-9]$"
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "SFC1" or "SFC2" ... "SFCx", where x depends on
+      the maximum available instances on a Tegra SoC.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: |
+          ACIF (Audio Client Interface) acting as SFC input (RX) port.
+          This is connected to corresponding ACIF port on AHUB.
+
+      port@1:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: |
+          ACIF (Audio Client Interface) acting as SFC output (TX) port.
+          This is connected to corresponding ACIF port on AHUB.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    sfc@702d2000 {
+        compatible = "nvidia,tegra210-sfc";
+        reg = <0x702d2000 0x200>;
+        sound-name-prefix = "SFC1";
+    };
+
+...
-- 
2.7.4

