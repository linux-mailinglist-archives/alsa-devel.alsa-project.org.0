Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6F4E8DC6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 08:08:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1608F168B;
	Mon, 28 Mar 2022 08:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1608F168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648447709;
	bh=MXVUkKL6zqmOeVQwt4GbXOSezBvloYwvaj2x/+Ep4vk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EgNQV0Y2ef777mWD+7K/If0FvEWuO7JhCuzjbosKw18MwpZ+Y/idl6AWMQZF2ZRbl
	 l0e9nFU2kBUc37BOgeoOBU+S6pKF1odjzIYD8RmpJxEBEC++bouLQBWuUi4+nrEDMd
	 qlmWMUfobiLPeJ8GkRpo7Tqtp8XrICKNNe1RwE84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 818A6F80271;
	Mon, 28 Mar 2022 08:06:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F6C1F800CB; Mon, 28 Mar 2022 08:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C855F800CB
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 08:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C855F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="rurmFezf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiePL8vqzVsHarnACoeqT5r2HLy+svdHatIBgUXVQL5T0ZFzTAlvuxVPYU28okkfb6Xsy/1k2ozYPXbonvNxt/dC4+Wikzh8IMfjvGPSysz38fC7QaoPC/ypfmby3Zy1wp2dgq4K6TsKfkGKtR6UTxrYSdeOGi3MDj/2xSSVITpDGUulpzsW4wxwLwYbAXEY8oXIcHZTvusajwEoyDdr0yvJcUZ2i4dpRZYIRCdqBTwv3g1MUYsHl+ecLs1N/yWGix6UAaIZGaADdEN9ZMQT+6vq6KuKz2ZMI71qdHL/Rs3lGbbupySyQ0TOxUlgT7U5PYa+XpbF3/QXcL1o/Ba5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kaSMl4l3yOuOYqRVKCvJZQR+BIGjkX2obubDkXDwxA=;
 b=BbcrUcwESLXk40oukx2L9LJp9k0Y5EGP5RDHaeCNY0bzkabtdQE46iXO3DazcbWlaeMxuKnppRjVM1rZw1ZM4JXZRQ8K2LI7holOLTY40J/6/rMGoaM1llRYAAg4Li7epn6XeaHdngdMqTHPsi/pAuglA4fDijdMuYxVv0DCZBZ0xxAClk0UyXvtTGpPcSQVgMdOa2fs2ElFlGp3+31jsbubQFlhdKKIyictHreBAI0Th4J4u9bnKbmRGTgQ6fBWbDU7Seh8Y7u7hlXQm0M+9R+BDpCIP2mZYn8U7pXABdjhi5ZYPyRHaL0KfujO79cZr10KRdMsJLnxaQOZGgVXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kaSMl4l3yOuOYqRVKCvJZQR+BIGjkX2obubDkXDwxA=;
 b=rurmFezfzBHEgbnpOxbGQN/MtR99Fz0W9GvsLouIehL3WIWGe4eqr3MRVMdclKyRwuQhurjR3Ji8AMx1lzu+7skXHu32JN7A4zfbt8CVJEBzN3+iiiosrDS9/9pU72juhCueI1qAHxE822q3e/B3HFYYg8dUDsv97AX3Slb+FD06l9wjx+pWuk/dCpMEz59A9aAe4mnVB3EsGrFctP7sb0BzeKjgfEIIyuC38V8wwURvxYNFFvF1wrF/VeMY6eJUTmWZvpVH17e3yrqq9itGB+B3TGj4wo/iuKsxv4Hznlb/TtmCDNQmcG5aDMebA3EJtHaNd9JOfYtc3ZXY4IVP1g==
Received: from DM6PR03CA0096.namprd03.prod.outlook.com (2603:10b6:5:333::29)
 by LV2PR12MB5847.namprd12.prod.outlook.com (2603:10b6:408:174::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 06:06:40 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::b4) by DM6PR03CA0096.outlook.office365.com
 (2603:10b6:5:333::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Mon, 28 Mar 2022 06:06:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 06:06:39 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 28 Mar 2022 06:06:37 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 27 Mar
 2022 23:06:36 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Sun, 27 Mar 2022 23:06:33 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 1/6] ASoC: tegra: Add binding doc for ASRC module
Date: Mon, 28 Mar 2022 11:35:21 +0530
Message-ID: <1648447526-14523-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648447526-14523-1-git-send-email-spujar@nvidia.com>
References: <1648447526-14523-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2b56818-a87e-4671-996d-08da10811f78
X-MS-TrafficTypeDiagnostic: LV2PR12MB5847:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB5847750DD636CDC6CCA96101A71D9@LV2PR12MB5847.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3V/emu1nuDrs7gOQ7//yud8BJLmGZ54QD4hegEUeTwWqW/tHMSC0C9n+gcY757jK/jEUCMk5SW+Cgz0qNzXH34Ug7hpMN7HJcRApGUObejQxRtU/Jhokxpl8p73ym5/3eBtW3noLNo3zvwGNAp0zCQYUGSVYztBjJPkC2dYljF2mChPQ4pfdcAML+39Mc8swuWmX8ftP1vC7BIoqcJRocC9egyoU5Tde1iKECd+IuLTCEvXAJz0bEpUiQotn82/5dE1IRHwiIiVZztk/jUt1SVIUx7e/3+U4p2sw5zlonWOrmmyKucysVY6u2Q3Y68fAQP7LB1dnZkEoSLN0uqtDg7QoXGV8onnccR2teAwKW1n9x4DruBJa78SfxrtStcuFwAByXLewUESc9ScjroRHMveJ8OBwHwoxr+0Jc3tIc0kst700IKBVE+gnmoEPcSK89wVI3ML6m6MUJeZUK3VHW+/WnfP6NB3UE1ewxRDoGQfS4NirygnuoAnnyE+2upPL0n8dIcbJZB/reXNWKNaxSf9DTeJfDoB/iTROtTuhX3zOXgmNGvLBa5E6vEFvAxW5R5LcB4cxbAnvOvDkgwzEo8zBOASKn5c8OdFAdFhSj0QJ6qq2Uq1EAO04nQtE+cNo8Kix0OCIaaqOGEgWLR8GjA8Yox0FUxFlVyuILCHBbZMqStwLsDeDz16rmS9z/2uKhgDSGIuUdkS7g/87GuqAUtZQeL9PLVHFncpFTlElr9NbBG3qe4Y5qo7mwm5rdFuEege6nU/gsYx7W6ZpMe282kYulgHXw7fY/2w6GJnDUyAf3WvXLIzvO7GX61oJgdmHjYRJa94lWMlwqZK/QI7H/Q==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(70586007)(966005)(81166007)(47076005)(508600001)(40460700003)(36756003)(36860700001)(2906002)(107886003)(82310400004)(4326008)(70206006)(426003)(8676002)(6666004)(54906003)(336012)(186003)(26005)(316002)(7696005)(356005)(8936002)(86362001)(5660300002)(110136005)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 06:06:39.0075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b56818-a87e-4671-996d-08da10811f78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5847
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

This patch adds YAML schema for DT bindings of Asynchronous Sample Rate
Converter (ASRC) module. It will be registered as an ASoC component and
can be plugged into an audio path as per need via ALSA mixer controls.
The bindings are applicable on Tegra186 and later where the ASRC device
is present.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../bindings/sound/nvidia,tegra186-asrc.yaml       | 81 ++++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |  4 ++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
new file mode 100644
index 0000000..520d0d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra186-asrc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra186 ASRC Device Tree Bindings
+
+description: |
+  Asynchronous Sample Rate Converter (ASRC) converts the sampling frequency
+  of the input signal from one frequency to another. It can handle over a
+  wide range of sample rate ratios (freq_in/freq_out) from 1:24 to 24:1.
+  ASRC has two modes of operation. One where ratio can be programmed in SW
+  and the other where it gets the information from ratio estimator module.
+
+  It supports  sample rate conversions in the range of 8 to 192 kHz and
+  supports 6 streams upto 12 total channels. The input data size can be
+  16, 24 and 32 bits.
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
+    pattern: "^asrc@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra186-asrc
+      - items:
+          - enum:
+              - nvidia,tegra234-asrc
+              - nvidia,tegra194-asrc
+          - const: nvidia,tegra186-asrc
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix:
+    pattern: "^ASRC[1-9]$"
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      ASRC has seven input ports and six output ports. Accordingly ACIF
+      (Audio Client Interfaces) port nodes are defined to represent the
+      ASRC inputs (port 0 to 6) and outputs (port 7 to 12). These are
+      connected to corresponding ports on AHUB (Audio Hub). Additional
+      input (port 6) is for receiving ratio information from estimator.
+
+    patternProperties:
+      '^port@[0-6]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: ASRC ACIF input ports
+      '^port@[7-9]|1[1-2]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: ASRC ACIF output ports
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
+    asrc@2910000 {
+        compatible = "nvidia,tegra186-asrc";
+        reg = <0x2910000 0x2000>;
+        sound-name-prefix = "ASRC1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index 4727f1e..6df6f85 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -106,6 +106,10 @@ patternProperties:
     type: object
     $ref: nvidia,tegra210-mixer.yaml#
 
+  '^asrc@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra186-asrc.yaml#
+
 required:
   - compatible
   - reg
-- 
2.7.4

