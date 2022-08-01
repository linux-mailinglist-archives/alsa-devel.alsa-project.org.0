Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D8586E4D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:09:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44606E0E;
	Mon,  1 Aug 2022 18:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44606E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659370187;
	bh=TiJUW2VshZOE1g/imaJw3oSbqOF9sfBGC6MpWAhd5+8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CY/+k+q2tdsvCn+fNv25QG11vnVeuN44RTqbV6vs7j+JGC4QFVLv0Um5LW8aoPc5o
	 8g7IdPEBnuHKf8VfypMEhH3sBREC5jL3pMt6CgrhVGAEqCPHjVJ4w8Y6s7ZIoZ5pyC
	 QlgezrJHM8ZWy/DdxBkMGwvIMIn4SgcVYaNR87JE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0D21F80539;
	Mon,  1 Aug 2022 18:08:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EFE1F80543; Mon,  1 Aug 2022 18:08:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E5A7F80246
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E5A7F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="eoeFs4CH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFPvHrYGCOmu8/UOzOBqO0hramqDMd8g3y4yp1TInhj+GbsrLzk3SQNLTckZfjLfKiKDM1cacTKKKajlDkdssBSmjevbLxsGQvidWw4sgyzBMwyj1dF/lWah0CIeumiO/OBexrKwf8ECbKgjPFPMEEIGgxn6MEPQsZekQYiYW9O1Ql/K665F/skeAmVlZOxo7nAZ3C7juOmqADXibDRgHQjQNjyIJgTJm8qdSQa+oOy6fgXHWZi8Rkd6pwxSNLlfAykd6f44D5RXUCK96jmC6yVevehhx+5ngiwj91+JfSNfKYOQny3EkbPVUG8nqD4RrV8a7Fp0rOvk9TbNq1i2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJn2/y3pjA3KqyDdG8BjsB/xBYEtEzxQJb/xI+AsikE=;
 b=elUJDowmcLsG29HQUqzV+4Kzc4cI4EoQyLbVUjvuuKsGngn/Qu3jN3arcbm3oFC0Nity3TmEI8YIksjyFX7tlOfgNYJlL58xDCo3bjUImZ2z9TDg68MCzr9t3M5/LlyZeRdYAnqTa3nXNN1qdi8hLeKj3d4ai2s4dZgMCJy3oAqcQpKbHnS2aiNYuBCecu0B1m4Ej1W52pL5nGBaGt1MxWCIlmUoLsW/plDrDGd+ovcZhiq/DgXsJ1vDZRfSenLTAK6rplZEMGleOytNDNuWvpQMRcKQSfzC+lakTNNmxX7htVRUvCFA5h1GGnHIhQu9B+JxCmnIlPZfALk5wb+rcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=renesas.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJn2/y3pjA3KqyDdG8BjsB/xBYEtEzxQJb/xI+AsikE=;
 b=eoeFs4CHZXhOaoKTxuGQX4/L3efn8x7on0MeHURmxlcJvxN9w5a+vmeOFjoHNkmiZGBfIi1h2RSVRwKS9JVsy5ykLc+Dz/DKrv+32RCThpnJ5kpZXDhtu1Bj0RbXZIQNGtYrRAFGupx1PhYRxOyDBP45r7ICWXCWxBuhkwWjkktnVSEnI4wtnBcMBGsH9uRnvKNahM2o8CE0vodMuN3kCgI9PjSV6JHz4n69K7yXJCXEds+oR0OuMOx2sarUtHwMm4aR3rEJWadyqA6qcXKgLwO1OzXSAQJU9YwhOeRWwSVvuQqsxJFtqRNtM+Tk3Mf+j0Oi88cAQXo31wCH04ddUQ==
Received: from BN0PR04CA0057.namprd04.prod.outlook.com (2603:10b6:408:e8::32)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Mon, 1 Aug
 2022 16:08:15 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::f) by BN0PR04CA0057.outlook.office365.com
 (2603:10b6:408:e8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24 via Frontend
 Transport; Mon, 1 Aug 2022 16:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5482.10 via Frontend Transport; Mon, 1 Aug 2022 16:08:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 1 Aug 2022 16:08:10 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 1 Aug 2022 09:08:10 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Mon, 1 Aug 2022 09:08:07 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: Add schema for common DAI params
Date: Mon, 1 Aug 2022 21:37:30 +0530
Message-ID: <1659370052-18966-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
References: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f4a4069-9512-4f10-cd84-08da73d80a1d
X-MS-TrafficTypeDiagnostic: SA0PR12MB4415:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zvKd6exUM8/8UJ4okQ9VCZIDO4hOH1oNI7TWc4owuL6juDJc33R99/EvZngp?=
 =?us-ascii?Q?1Mo/Onrxb551Np1qPJaxOq/b7GI2ASdAHlwXcEZY2ugwklnjLYHL9CT8ryRV?=
 =?us-ascii?Q?Ockey8iTNqxI5yfKWNxfjscp3mmkr0/wySi7Vb0ETqxhF52Jb1ixW94/iVXf?=
 =?us-ascii?Q?9cJW1ISpW3MbEuhi5TigvtQPVcfqNKEu9SddLbsHI2knkyqXgJJc2dicsze4?=
 =?us-ascii?Q?RS4hoAG+vm7t3rVwzUVKjmdziIP/p2vfvbPD+guvg/XUeeagWtsej1iqXkGD?=
 =?us-ascii?Q?OTZsBGrYUfrKVvtLR3Eqmf24tqvVuGqNrjElrKbgvSKbjdZAxQjPjbzPe0tp?=
 =?us-ascii?Q?uOYmYGnoX6Cd4j3mMrh4WO0gMkzK0rCILKDK6z5Spdpxa895IsERbT8c+DnC?=
 =?us-ascii?Q?s3Inzyme8s27Pmu8X43+3u7ZIFj5vzyokkLq+6bR566g0qxARYO1vbc2GHg7?=
 =?us-ascii?Q?8rgyf/RW02K7sqjN3/VWMBbfl122GsTM7AO0V1q8E7GikZVqchtIoZ1fqJRv?=
 =?us-ascii?Q?sS/TufFq9JOQn9hrsThrjq7B2o47+Ku/U8cryGJZpRAStJjmv1IHCBjezNl+?=
 =?us-ascii?Q?kCNYBm1uJPDROhgpB6BrvnTW2IFNP8aU5I0ZASm7dcLKi5VNrSwGoePADhaA?=
 =?us-ascii?Q?Gm/9nwF8Jbc57Xz4KINWxNUUW/3bsOf52+HZmve7xGdTktG736cdE9inLkGw?=
 =?us-ascii?Q?l3Hp+sf9AYq8vuIGA1y3w0wom2E/N4PcDptv0zlc1j37lBzWhCiN2rmW9npy?=
 =?us-ascii?Q?s38MI+X3BY4nOdJCgQIfE8Z1RDMxjA0Xu3jOaUkeX++dhZM4Ya1CcCWyfTbt?=
 =?us-ascii?Q?twWT+UH7oLUga62/hdRAh/yZUO453ZXGUpqkmt3guRwGq24vX3tTXWTptoMe?=
 =?us-ascii?Q?dKE76WVDWe9CfXRVfmOj6iUFWF0yBV60cb8d4gcWmDvvMNP86wfxfOLFpmfi?=
 =?us-ascii?Q?U8aRJ6qAbLJkhRyHV+kV/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(346002)(40470700004)(46966006)(36840700001)(36860700001)(54906003)(316002)(41300700001)(7696005)(26005)(6666004)(86362001)(110136005)(82310400005)(40480700001)(36756003)(83380400001)(356005)(5660300002)(70206006)(70586007)(8676002)(4326008)(2906002)(2616005)(478600001)(336012)(966005)(107886003)(81166007)(8936002)(186003)(426003)(47076005)(40460700003)(82740400003)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 16:08:14.4170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4a4069-9512-4f10-cd84-08da73d80a1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415
Cc: Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

The "convert-channels" and "convert-rate" bindings are provided for both
simple-card and audio-graph-card. However these are separately defined in
their respective schemas. For any new binding addition, which is common to
both, there will be duplication.

Introduce a new schema to have common DAI params properties and these can
be re-used in other schemas wherever applicable.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/audio-graph-port.yaml           | 13 ++++------
 .../devicetree/bindings/sound/audio-graph.yaml     |  7 +++---
 .../devicetree/bindings/sound/dai-params.yaml      | 28 ++++++++++++++++++++++
 .../devicetree/bindings/sound/simple-card.yaml     | 16 ++++---------
 4 files changed, 40 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/dai-params.yaml

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 5c36867..30a644d9 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -19,11 +19,10 @@ properties:
     description: "device name prefix"
     $ref: /schemas/types.yaml#/definitions/string
   convert-rate:
-    description: CPU to Codec rate convert.
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
   convert-channels:
-    description: CPU to Codec rate channels.
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
+
 patternProperties:
   "^endpoint(@[0-9a-f]+)?":
     $ref: /schemas/graph.yaml#/$defs/endpoint-base
@@ -65,11 +64,9 @@ patternProperties:
             - msb
             - lsb
       convert-rate:
-        description: CPU to Codec rate convert.
-        $ref: /schemas/types.yaml#/definitions/uint32
+        $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
       convert-channels:
-        description: CPU to Codec rate channels.
-        $ref: /schemas/types.yaml#/definitions/uint32
+        $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
 
       dai-tdm-slot-width-map:
         description: Mapping of sample widths to slot widths. For hardware
diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index 4b46794..a9cd52e 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -27,11 +27,10 @@ properties:
     description: User specified audio sound widgets.
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
   convert-rate:
-    description: CPU to Codec rate convert.
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
   convert-channels:
-    description: CPU to Codec rate channels.
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
+
   pa-gpios:
     maxItems: 1
   hp-det-gpio:
diff --git a/Documentation/devicetree/bindings/sound/dai-params.yaml b/Documentation/devicetree/bindings/sound/dai-params.yaml
new file mode 100644
index 0000000..aae60cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/dai-params.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/dai-params.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Digital Audio Interface (DAI) Stream Parameters
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+
+select: false
+
+properties:
+
+  dai-channels:
+    description: Number of audio channels used by DAI
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 32
+
+  dai-sample-rate:
+    description: Audio sample rate used by DAI
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 8000
+    maximum: 192000
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index b261d49..ab03a2b 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -69,14 +69,6 @@ definitions:
       as amplifiers, to be added to the sound card.
     $ref: /schemas/types.yaml#/definitions/phandle-array
 
-  convert-rate:
-    description: CPU to Codec rate convert.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  convert-channels:
-    description: CPU to Codec rate channels.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
   prefix:
     description: "device name prefix"
     $ref: /schemas/types.yaml#/definitions/string
@@ -188,9 +180,9 @@ properties:
   simple-audio-card,aux-devs:
     $ref: "#/definitions/aux-devs"
   simple-audio-card,convert-rate:
-    $ref: "#/definitions/convert-rate"
+    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
   simple-audio-card,convert-channels:
-    $ref: "#/definitions/convert-channels"
+    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
   simple-audio-card,prefix:
     $ref: "#/definitions/prefix"
   simple-audio-card,pin-switches:
@@ -231,9 +223,9 @@ patternProperties:
       aux-devs:
         $ref: "#/definitions/aux-devs"
       convert-rate:
-        $ref: "#/definitions/convert-rate"
+        $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
       convert-channels:
-        $ref: "#/definitions/convert-channels"
+        $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
       prefix:
         $ref: "#/definitions/prefix"
       pin-switches:
-- 
2.7.4

