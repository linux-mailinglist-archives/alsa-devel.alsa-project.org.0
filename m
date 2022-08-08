Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE1E58C2D9
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 07:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0166F886;
	Mon,  8 Aug 2022 07:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0166F886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659936580;
	bh=1EuNNBWfwLA+T23YQNuYyqw3r/oMydPFM7lvJQUqKFA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sswYbZJ9dQVc0bLkDXOfI0TKWLp11JlgCMG/95+NGKUWOYE9aYKDnWBGshg/2LXt+
	 D0K5ce4wx6S5WmqRxg9GJT008K8+rVGrTy+IShebYXsVhBD4xvTSBSoG5ajVzN6RMu
	 +6zTIx366lgfhMOVwEWtR1y8+sdFbbn7/S1UzqKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E331CF80430;
	Mon,  8 Aug 2022 07:28:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24E8CF80553; Mon,  8 Aug 2022 07:28:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53059F80430
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 07:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53059F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="qImlC+Lt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScmQY0K6jweRy1KKdJ7IMurtByAWHD8fCXOX8lsHYGfZlPkWoypMx5fRbqlNsCUVRNMvf5C5c4Y+MQ2AnbdY8MYFzlgxaApyRcaH95+tTRTmTmMwJWv6XP6aOgSnmM8+VLRhdmvxnGaVgO6D7hyXpfPI9ZpuVJ0E0uboqbrwtg3cedhrfgYVsULRSFWh4lyGbsoqp3IHdpjjlc8qeEdf3IH2WIKfqzEbvTXN5YYroCnrHs9NZFPSGgdJjqjgHq5JB4hATAC3PK11PAqZzx12K0mG35PZLFKV4V+6sLq5JtQZ7YZorobCzgJzLJwyjEnwwsvz0n4/ho/2x7zeCGuFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQRihwPB5Tsz2nWsKiF5E11gspYY2vrRUD2myAvBqLQ=;
 b=Rmpu5VWyaPhD5Nl6C3lkWf32HMeIuGykB8u10aOus9p/RRVq/K5uR4h0xgQTqarfWsjQU8ym7puroR0nQuWwhJz3JukfnwGLfKE0+UartWclShwnDMbFST6Zsqssrwvo6J0ZfbPwbPHuGNwKAPLnqxz7a/EPpGxi3Ifv96uCgHaYiCMkVIQBB2MR2eSF5uXesYLDI6mgPkgmXl22Se3KEyPPbPyV3OTzJXFALPv6Yp41A8XLWNTOOF/pEzgJIuETRt3C6lJSYHBr7TZwhraLhIOZYc/RMPodNY+ngkuuNN7hE5GRb6vo+GTFRaWlvx/IOOmuHoihmYTPfVWzBQgcwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=renesas.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQRihwPB5Tsz2nWsKiF5E11gspYY2vrRUD2myAvBqLQ=;
 b=qImlC+LtfIzWZCT24JmpVjtNinQzjGdiQcZ6q4VHCNfDJQLk2bZ7skHvk/mJR+KT4Un4Lv4We8MAjwTYQ3KLE0x0tB/6EmtjJ5ts0vPiKdQi7i5gT+gMTXHUT6NJ62a+CLlOOATYu2Cpb6IkKF63C/ewpqdTB6caSGpFILynVGZ36rjqoI+L7Jszb1nfvRktQ7TjfsWMbpDQDEMyNH1c3DIaCZToH7sV+5R+7Sim5Tf5jJPauWJAmzTLIFiQhIXgxpjGxGKR2X01rOE5bayjl8Qgo97JIbpKbsi3Ddr1qKWSqz7YmtlbbVwUdnWds7TxRCmQeGc0tEkBatOHEXWxRg==
Received: from DM6PR21CA0022.namprd21.prod.outlook.com (2603:10b6:5:174::32)
 by DS7PR12MB6024.namprd12.prod.outlook.com (2603:10b6:8:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 8 Aug
 2022 05:27:50 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::11) by DM6PR21CA0022.outlook.office365.com
 (2603:10b6:5:174::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.7 via Frontend
 Transport; Mon, 8 Aug 2022 05:27:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5504.14 via Frontend Transport; Mon, 8 Aug 2022 05:27:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 8 Aug 2022 05:27:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Sun, 7 Aug 2022
 22:27:49 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.26 via Frontend Transport;
 Sun, 7 Aug 2022 22:27:46 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/3] ASoC: dt-bindings: Add sample format conversion
Date: Mon, 8 Aug 2022 10:57:31 +0530
Message-ID: <1659936452-2254-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659936452-2254-1-git-send-email-spujar@nvidia.com>
References: <1659936452-2254-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98b6e753-84ee-4d9a-484a-08da78febcaf
X-MS-TrafficTypeDiagnostic: DS7PR12MB6024:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24TNSGA7bgiJCPegu5FPuhHMGXyc6+hwIw7dV/BzYRkU9DbhTpzaMMvjQa68NwYXzclwXOkWSR3+Au641Cw3PzmZxzFodbY8A2lySuuki7vQfj0ygcUwnJX6Bmv7U237GvTL8VK86/kuvWeVKtLWvscbssNm8jS8kyIGPg98g/tc6UYOiPtl0OX4kjYaYQGugXdNU1BuBow7zlgOgWdY01PL46iZ+pdKjaSXUtpFjm96kcwJwS9IojAeTMiklmng323u5EFTKbzCyVioOc2ksBbYvXFHitosuZ7BSw2fcZdBBXHDgFgk1n+NxluY20oyPDNK1ZjJ2gWFZRp/quGZY6vkc2ZA7ztS3hPYCwzzlIeb4oaizQVIotFZnJHh+fJp3VnR41eV3Cs4I8b0D2t7CTNczGTxvC1ZR+rflRxBAFiWZjAeKX9hwfrAl/nfWtIARfEkQQzLSYvckGnARHhCoG1BNkm4d1visjxOkzvEDPdsnns7VWp5w6Tg6m54FKf05AXcDEkwmPVAcBqEEsDx8uTk8NPt0wq5dOm/TdCr6rQs8isgHbnq55ox/ZMW+UXABLa8Jmgbra6kJ/oUw4bOo5WyX5nb0fAuGYvwJ/IHspUEf+gcaUZ4F46xrJdNMuAyhNr6i3FcJ+Es0KYbvAsPjMHfiN6kUMRO+f6zD57nFDoiL5htAR712D2GhrSjiNB+7fDLiWoqQF77jOrDFZIHRDu4PQAyTR1k02o+oUKqAe4Gx9xmqhmCGsjcZ4bDi8zGsFzD8vtgBBvR+n1P3b66Zg6g1QRbuSwROf0jYQA4wXIcHXvBFREQF7oOd6w4WvIIWHf6DHImw8vVM+Vd/sSreA==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(40470700004)(46966006)(41300700001)(36756003)(2616005)(107886003)(6666004)(7696005)(82310400005)(186003)(2906002)(26005)(36860700001)(478600001)(40460700003)(4326008)(336012)(426003)(47076005)(54906003)(110136005)(81166007)(40480700001)(8936002)(82740400003)(7416002)(316002)(5660300002)(8676002)(70586007)(70206006)(356005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 05:27:50.7726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b6e753-84ee-4d9a-484a-08da78febcaf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6024
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

Presently "convert-channels" and "convert-rate" DT bindings are available
for channel and rate fixups respectively.

Similarly add "convert-sample-format" binding to fixup DAI sample format
as well. This is added to audio-graph-card based bindings.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml |  4 ++++
 Documentation/devicetree/bindings/sound/audio-graph.yaml      |  2 ++
 Documentation/devicetree/bindings/sound/dai-params.yaml       | 10 ++++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index fa3931b..7ff7a4a 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -22,6 +22,8 @@ properties:
     $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
   convert-channels:
     $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
+  convert-sample-format:
+    $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
 
 patternProperties:
   "^endpoint(@[0-9a-f]+)?":
@@ -67,6 +69,8 @@ patternProperties:
         $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
       convert-channels:
         $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
+      convert-sample-format:
+        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
 
       dai-tdm-slot-width-map:
         description: Mapping of sample widths to slot widths. For hardware
diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index ffee5c9..aaa99c2 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -30,6 +30,8 @@ properties:
     $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
   convert-channels:
     $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
+  convert-sample-format:
+    $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
 
   pa-gpios:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/dai-params.yaml b/Documentation/devicetree/bindings/sound/dai-params.yaml
index f1421a0..f5fb71f 100644
--- a/Documentation/devicetree/bindings/sound/dai-params.yaml
+++ b/Documentation/devicetree/bindings/sound/dai-params.yaml
@@ -19,6 +19,16 @@ $defs:
     minimum: 1
     maximum: 32
 
+  dai-sample-format:
+    description: Audio sample format used by DAI
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - s8
+      - s16_le
+      - s24_le
+      - s24_3le
+      - s32_le
+
   dai-sample-rate:
     description: Audio sample rate used by DAI
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.7.4

