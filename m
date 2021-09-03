Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C05640037B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5106A18CD;
	Fri,  3 Sep 2021 18:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5106A18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630687041;
	bh=PswvQEF9ztGDqHbdZ5Rr0IyG1twEhYv4Uhq5GoXw0aQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enDjQNolxPHjbUZuTCcU4rlk4ZTmLY+0RDwYPCfmNuQn7PmteXC0l/O6ESx82k5ja
	 Rf+2EHoXIP3NAjoid5NUEpnFGOIZV/oNNa2Tb4HBAFB7E0YKdpRt6h+QJLOGFSXXLi
	 zaqRifWiRJYJElkjRlTGb+D4YrB+ZWhAHvN8ft2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB964F80227;
	Fri,  3 Sep 2021 18:35:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46468F804E4; Fri,  3 Sep 2021 18:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6DD7F80227
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6DD7F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="gLQbFJTw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xrs/qeloCj42gP4cwRDlACp1iQoQApEdtQ6tUzuH5wCOjEnTvbJkzy1mOBwLw3RxO/0DM251ViQ4P9hu2mz16bn1R0FJtAHimTg5Fj5Cuqssetjv4E66pthQoYRExBkaKBiJWGs1mPGzLhA3O5Uyb1ENFFi8QE8BrCMeBragjaktfZtR/xeyLb/HVqft96N8axsokbf8PLUxnEqtvVmHIEsDPsjjudcIsfThBzzh+TMqWy/u8zr4BiDdsAY54Cpq+bmeQWba/NXhnT6zTqTWFdRqHUjWIsLmlYQiR215PQMnmgzR1yiNSg/MKuVaN8IbbnXFqf/O+zxSjB7bAjYr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=siDDMZ120Ho8zahfFLCbBT7OscYDarjEywFdTbaqIIo=;
 b=EERXtl++8UYlNPyFVRu1ZAspemD9U717VtRoXvGL/RAAcg0j7JC3RAEIsZzXAVVUwpVh277qQCLVSl1CV+zRcyKAWjwl4TQPatI9//GJTqU9JbkdCxANKeMVgghf+GP+SvIN0wFCSGS6A6CzzuUuaXYCJWx0hSiDbGerSQVeUUuJ7bBBP2yOFBM4Pw1SRH52wG/OCUBJjWIUb8SlTecQcTs15sp4Jr7Qlm+/TpRydhASpDDqzM02LW6RxJUOxHCXCUPwrXwCHO2LlPLcy+0FnXakdAFFV+wTq3RtcKYA+3q+rDq3x+5XCIF/qj1NxJf8goOEhMZvG4I2hYvKYUIkvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siDDMZ120Ho8zahfFLCbBT7OscYDarjEywFdTbaqIIo=;
 b=gLQbFJTwFhgGShzcqXDVc8KVibcTc1DxlLZGiCPV8NQT/DRhPzzJM7rA42yzU8Ms7TGieJI8JUijBKidNxep00t8CsBKeOkK/ImnmWwk56SZJLHiA1QPA3qrl6W1WDHOLz2x8ZT93CjVdacVWoVfkM3IZkJVyA2o361u/u/eApqsOHOvvPYV26WHtm7J1w/qthWZsoCEriCj5MxpJj7ahEywiS7aOuh3VoOBDpnqd0Abb6pTGgnJUCiosrdECkhzk7ZSW2mTkBlLa2iQ6kbk2GOt2wN13wB2NB/XTi7w1ipS6BSxya2ho4Fd2I+KjAZulqNkRn11GH+f9PRtIPQt9g==
Received: from MW2PR2101CA0019.namprd21.prod.outlook.com (2603:10b6:302:1::32)
 by DM5PR12MB2440.namprd12.prod.outlook.com (2603:10b6:4:b6::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 16:35:31 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::4a) by MW2PR2101CA0019.outlook.office365.com
 (2603:10b6:302:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.1 via Frontend
 Transport; Fri, 3 Sep 2021 16:35:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 16:35:29 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 09:35:28 -0700
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 3 Sep 2021 09:35:25 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>
Subject: [PATCH v3 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
Date: Fri, 3 Sep 2021 22:05:17 +0530
Message-ID: <1630686919-19495-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f45ee354-f038-493b-5af5-08d96ef8d79d
X-MS-TrafficTypeDiagnostic: DM5PR12MB2440:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2440459619E8EEE510434A58A7CF9@DM5PR12MB2440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygRp+RJcBItbIcKxU5rw4h4LnqNymAxcD2lpqxgKRTEAgBaz9VcX/ygq02JPZ+qWtE4hy1GlKoWnQr9yjaxviSw/PEKbpFyxDm1I9dSt1zIAmAPnItx0Ch/v3GOR/vhzBS8fU6gI0a426HYoL0/iJTm9UY6imxGPs1vCxl5lzDLganLbYnvTqpwaH5o282Itwke4qcbZVEiaBg5grKhxvSedwhabke9qEgDGKXwL+DrPGG+EB3WE89si7LI3vo008g+cH5tQ8D1LjM3J8Q+bPDiMzQJ/4w/a0/xXRhAyslhkazh7WZ2wDEmbjSgVADImTEuyQQxjzz2OKtat9ykQwLEW7SpqtSWASl2EhlznH4Er4ZaO3Glxp47UNiyM13LZnnDUHzyG1/h69QcxUbAyTTXgjLde3wLYUffOHkR9TIe2yMSGf9xFnhvO3Q0Vfg7F3o4uIeFc6OhJ5rO9KFRt7xlqtd4qGMsGZxrj2baDK2AEFsdQRU3brcLC71komoyRb+a7zfZf3jsiWDsjDGE1GorrEe9ZI2T/z5Fh7z/AcnJ8uaKCcxk8dBWmcSW3YpeKFMdI0UsbPmQ0kE9XmgboAy0fblPEnooVkI2/AECSQE0KrNyRjKA/7HZh7bA/TBOZU+hqrSy22OcSC7jB33sZtRFOgof+KlUWRl+Jw5bsrDOiZ2ywUymekD+rkfa9LAz+2us19UQxHnb0mhZ98raR2jcyyeooKYozmJSNjdZU7TOgiev6UuKLyyvAkTtf96NKVj9UNGNZD5KMfwqMQyGyemzPfbYVfV1Uxnbl7z2eczBlOa2qnzSAdg7sMdAisPpS
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(36840700001)(82740400003)(8676002)(336012)(7696005)(356005)(7636003)(426003)(82310400003)(6666004)(26005)(186003)(36860700001)(54906003)(5660300002)(70206006)(110136005)(7416002)(70586007)(86362001)(2616005)(4326008)(36756003)(316002)(8936002)(478600001)(47076005)(966005)(2906002)(107886003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 16:35:29.6875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f45ee354-f038-493b-5af5-08d96ef8d79d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2440
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

The 'sound-name-prefix' is used to prepend suitable strings to a
component widgets or controls. This is helpful when there are
multiple instances of the same component. Add relevant json-schema
and is inspired from sound-name-prefix.txt documentation.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/sound/name-prefix.yaml      | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml

diff --git a/Documentation/devicetree/bindings/sound/name-prefix.yaml b/Documentation/devicetree/bindings/sound/name-prefix.yaml
new file mode 100644
index 00000000..2fe57f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/name-prefix.yaml
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/name-prefix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Component sound name prefix
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  sound-name-prefix:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Card implementing the routing property define the connection between
+      audio components as list of string pair. Component using the same
+      sink/source names may use this property to prepend the name of their
+      sinks/sources with the provided string.
+
+additionalProperties: true
-- 
2.7.4

