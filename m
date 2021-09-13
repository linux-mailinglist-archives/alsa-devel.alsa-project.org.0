Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B734099CB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:45:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B469117C4;
	Mon, 13 Sep 2021 18:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B469117C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631551536;
	bh=kV4107kzQyepp2sEE24w7g1UhAfFpKUVYBGKLmH5Sgw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b175YF6qG997RVZbQqWZ4yMyIqm83xwsn4bPm9ghTnTFAtdhs/0wXnDzR6WO6DUk+
	 Ebxu08b0sYtxNW0lc6vYQndnhsxPy9NqZ60wXZsItqXTwlhcOeLKZuS4ZmJSUhwcdy
	 7M/Hms7ypslW7+gFY4+k5V/a0GZaXUXTj8D1hc1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B8E1F804FD;
	Mon, 13 Sep 2021 18:43:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 103D2F804FC; Mon, 13 Sep 2021 18:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D9BCF80132
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D9BCF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="SybMVfSa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dp1V7XEZpTdvkfEmzrkqTvgcc3MXFWXngcHEAG13VVcAi0Iw1K/Ru134rO796daOiwmVkuGo1fljx26zrN80fSuhveFkpfZwOszRrqg2YSkmnOCfIdaDAcZf/QHqHY9nLy5Xyt+V/xr6HkfAhUd81cbFkjg5NqK+SCCAb3hlpVh1wqnQEp79zAHLDG5cIZfl1tiA5w3nV5Z6ZvLu8wxWlkTGcoA5a88iSaxj20Srfj+8j9AoS0kmddPl8H42SpAsI5Nwlss0kjsuJNaMo16XQ103FZXUYTfaB7qbDgjZtNUGsH2sQQH1PyMhIY/drhPUspLRkcOhmRUdCKHgk41zlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=HB/6N5Hwoo1/j/ACf7AAcpN+BsoVW2ARz2r4FrFbFfY=;
 b=nvdBsGRKpxmYKEChWCIUmJBV5GJ0JEE8QwyHNBGvVJudqBsN5fvtyvYwodUKU1MKcrUyZnDfn71vI7aPLVRgtjnxcqd8YmiWdjgXS9jQFmLWLwhlcPgpsxJYOzYg3hv8xZqWijcPhA6JhDEHnY3QXV2Kv6/3bBu1KOaDwE4vtZuzT+dKuhu4UfjFFWQg1zb6ZLrY3ClOEb+rTANyw9bdziz+w8Pl71Ab4YPq0WPA/xbdaqogr0NlWzbGtnKRVxXBbqGZCcV0JC5Ry/hR7u+0mrfqxjsOwG6cSOA80IJ5yj5GQv5/Kkhy6UTyc4lWaMi1eWjTVZmhMyHvYD/GuVw2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB/6N5Hwoo1/j/ACf7AAcpN+BsoVW2ARz2r4FrFbFfY=;
 b=SybMVfSanSOLwTpkcOjQlrPJcy2c4HC6obrmkVp9SKBfKSE3SshbXI8GzFzZ/cD2Ey494oY6R6O9weIkZxKhkDdHfCM7bRXbTRftZRUN6lq3oSiq0UFN9yKWdjyVcs4aNHoykBYAYj0pCoMXh6kqCX1sIE8fuAx0y53FanwMb/8lY85UvE+lyAsKk6xfie5I+yvqL7cQbKG3qmJLDLabMEUBcKdrFRZTeyHVDA57itEvw3NRnGnrIUVw8W3GY0ZehzymBwFDO3ZYu4U15S0qo3EY/gQcIkffrleF9CNjOdndJBWY5WB3SSMFgMRGGCrUGadDy6ttcvkxzzmbOzU7gw==
Received: from DM6PR18CA0022.namprd18.prod.outlook.com (2603:10b6:5:15b::35)
 by MWHPR12MB1232.namprd12.prod.outlook.com (2603:10b6:300:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:43:01 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::f8) by DM6PR18CA0022.outlook.office365.com
 (2603:10b6:5:15b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:43:00 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 16:43:00 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:56 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/13] ASoC: dt-bindings: tegra: Few more Tegra210 AHUB
 modules
Date: Mon, 13 Sep 2021 22:12:12 +0530
Message-ID: <1631551342-25469-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4c7b204-08bf-4bda-d475-08d976d58ca5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1232:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1232BA114E074FFF0EA5CD0FA7D99@MWHPR12MB1232.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qp3r6w7i10UtCypyc5LBLver7EUJEkkzvAF+JEBPkaEEcRsIyHrkI8Okrk/9vIkbgqnZULbysNqoVV66uN+Q3VOFLJdVacrTeT0TM5m1nKaD7n2QgFU4S9rSBVeNkaXanMr0oglgLWIlsQphyqqTWdvmgyz7ZBIudvXoR044yJUKXkkGmu7/WrUGTDPOfSh52mbttzZ+1Kegpoqw5GVv884umVpDKfWqyqhKJ5qTr8iZch/ky9UEb7OBV3Gnmr/AfvqnLjMo3oPF+d+duC2GUePFMg8DJkZsHvMYasCFUk4vfqCzX4nIpl8cYKgFSUlNGOUBwbeK4jWRTbe6rGrdzA/VGK/zgi6e40mfXRYhotMLtFewYz0aB6z5/G39OU1Zyn1Ux0N9i9gAO3vteZll46bsQX34ODT2GXzSz8u2VyvOALcmeHlCj+H4gxJ1lMtSZI0Gwea/ib56RDh2z02oIVIyjQ5LmGKzqHkqnpC5VGk9yubilXJTkO54nKhspJQ95y4FoVWucx06djSQSDv/33C8R83XZWTw7vpePKY+3qK8JFsEsNpdBFXuIp53HQbVhE4FWPjdagSa+zTfTeMESVgH/+ilm0fi7Nw1KKZPv7HUAvsxzRpA2TEY66eeMuXZuuBdOTZvycWSz/XLyF3k2kHzvG53M2l4KHPQhyeKyI1zid2MBwXbrZ3iY1BsAUTD0QZ7Nk81RytvASvDLbrumtbvSRINOXrYluMDAsHwv7xXB1ZWknA7jQcWWGaPratUHkNji6/svsphm2C0WShSYOaLMxNgnUNP7Ixe01eAtEY9eDuiGC06uZtVL6kkmdJOt6e0mR+KGlAdiitAcXZikQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(46966006)(7636003)(4326008)(426003)(83380400001)(2616005)(82310400003)(30864003)(70206006)(478600001)(36860700001)(356005)(8936002)(966005)(2906002)(316002)(36906005)(7416002)(186003)(336012)(54906003)(7696005)(110136005)(86362001)(8676002)(26005)(36756003)(921005)(5660300002)(47076005)(70586007)(6666004)(107886003)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:43:00.7973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c7b204-08bf-4bda-d475-08d976d58ca5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1232
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
 .../bindings/sound/nvidia,tegra210-adx.yaml        | 76 ++++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       | 20 ++++++
 .../bindings/sound/nvidia,tegra210-amx.yaml        | 76 ++++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-mixer.yaml      | 74 +++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-mvc.yaml        | 76 ++++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-sfc.yaml        | 73 +++++++++++++++++++++
 6 files changed, 395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
new file mode 100644
index 00000000..c4ba12e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-adx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 ADX Device Tree Bindings
+
+description: |
+  The Audio Demultiplexer (ADX) block takes an input stream with up to
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
+allOf:
+  - $ref: name-prefix.yaml#
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
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      ADX has one input and four outputs. Accordingly ACIF (Audio Client
+      Interface) port nodes are defined to represent ADX input (port 0)
+      and outputs (ports 1 to 4). These are connected to corresponding
+      ports on AHUB (Audio Hub).
+    properties:
+      port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: ADX ACIF input port
+    patternProperties:
+      '^port@[1-4]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: ADX ACIF output ports
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
index 1118a94..df81d20 100644
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
+  '^amixer@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-mixer.yaml#
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
new file mode 100644
index 00000000..bb2111a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
@@ -0,0 +1,76 @@
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
+allOf:
+  - $ref: name-prefix.yaml#
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
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      AMX has four inputs and one output. Accordingly ACIF (Audio Client
+      Interfaces) port nodes are defined to represent AMX inputs (port 0
+      to 3) and output (port 4). These are connected to corresponding
+      ports on AHUB (Audio Hub).
+
+    patternProperties:
+      '^port@[0-3]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: AMX ACIF input ports
+
+    properties:
+      port@4:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: AMX ACIF output port
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
index 00000000..428f3c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
@@ -0,0 +1,74 @@
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
+allOf:
+  - $ref: name-prefix.yaml#
+
+properties:
+  $nodename:
+    pattern: "^amixer@[0-9a-f]*$"
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
+    pattern: "^MIXER[1-9]$"
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Mixer has ten inputs and five outputs. Accordingly ACIF (Audio
+      Client Interfaces) port nodes are defined to represent Mixer
+      inputs (port 0 to 9) and outputs (port 10 to 14). These are
+      connected to corresponding ports on AHUB (Audio Hub).
+
+    patternProperties:
+      '^port@[0-9]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: Mixer ACIF input ports
+      '^port@[10-14]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: Mixer ACIF output ports
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
+    amixer@702dbb00 {
+        compatible = "nvidia,tegra210-amixer";
+        reg = <0x702dbb00 0x800>;
+        sound-name-prefix = "MIXER1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
new file mode 100644
index 00000000..e2f5a85
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
@@ -0,0 +1,76 @@
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
+allOf:
+  - $ref: name-prefix.yaml#
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
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: |
+          MVC ACIF (Audio Client Interface) input port. This is connected
+          to corresponding ACIF output port on AHUB (Audio Hub).
+
+      port@1:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: |
+          MVC ACIF output port. This is connected to corresponding ACIF
+          input port on AHUB.
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
index 00000000..41ad6517
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
@@ -0,0 +1,73 @@
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
+allOf:
+  - $ref: name-prefix.yaml#
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
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: |
+          SFC ACIF (Audio Client Interface) input port. This is connected
+          to corresponding ACIF output port on AHUB (Audio Hub).
+
+      port@1:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: |
+          SFC ACIF output port. This is connected to corresponding ACIF
+          input port on AHUB.
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

