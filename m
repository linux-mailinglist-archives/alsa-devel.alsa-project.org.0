Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2685F33B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 09:42:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B896793A;
	Thu, 22 Feb 2024 09:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B896793A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708591345;
	bh=T5V/UwZCq1o8TASQElNrC9PYQxvvCjDp7o78hxA+N8E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UohPasNZ0CG/sqRnIZCK4XGI8iZm+g4O86HR42JceWQwJW+yDsQdVzctbzius3H8V
	 qLg5t9BbqYAFpKtk+2k9gMO+vtXNpHFHAaokMfyu4NSX5C/6LtfKsQCCgA/o4owoPh
	 4rmXIbh0yKY1daxHK2t9l5PNv0GRkjzmeb8HHKZc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E50D5F80589; Thu, 22 Feb 2024 09:41:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AE8FF805A0;
	Thu, 22 Feb 2024 09:41:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C629BF804B0; Thu, 22 Feb 2024 09:39:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88992F800ED
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 09:38:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88992F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=i8Ey668x
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8+xLa95hxW9ix/WLpE6qM+Q618JJXFB5ySVZVNNhK30hYuiSnasIhRTx+LAioDbt+CmJUIGkjnMBAA7VYCITZCk8K+Rs8EMe3R0s1ZlRCZFsBVbA9kce6en43FN+TOY5wKnLJRmYterwBDWXiC/lCuA+S4VqdVOiWKsSPtPahuXFM0+vFiz6dbVcFHG0ZppFonblekAqulmhkypVXC+Q7yD7BSe2AIbfGMv9DjpWwxh4iIJAhvtoSop1LkCt46YtjnnGkmtH+CgNZ+6guuGMSux5sfs6zdVPpwaEej/MFiXYI1DfiJL5S6MlFMnVJKbEtoTYishoaRC8q9GVtqKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGd6C6Bzsob5/3bEQUI9QrK9Uw4L+Yoqp5PYEkXkFwI=;
 b=Y7SFBqmxsRLkBiepuGKYcvREAZ9yvQftgkdDDTNwkB9xT+94do3s2I3ZE5DKimvb2Fy2SJ60y47zQLV6sSlZgpQh15uMluKL+6dF0nzfyv4yRr/7/7L2GIy2iCUxIyY6EyeHozjrrjmFEDYKluc8p1pPf1FWpsDTq9rdWmxJDcL5yxPpZwq4lCNFAgfsyEA6BNAJgLyjkLLNLj7elLpIB8IPIDLZw3Cenhw+E3jAgbTesvcDGveAjb5FGDSqcisA7e+61AsFWJu+2sI1S79Nb5BZ+5sMAFhPoAA6p9TskLKVqZYn7FQuswf8xzeNu7OkAliEW06kdKmsKC3zOMIqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGd6C6Bzsob5/3bEQUI9QrK9Uw4L+Yoqp5PYEkXkFwI=;
 b=i8Ey668xtNs3u+gMOy488kS8RnxD68kseM5yp69vZO83ZrBknZ7zb6TS4V8sRjnJJkyr4LL71jP4UKbPF8u+TZNvEpE7voNw+kOBV+IJZeGuGf3RICm80HO1NWN4SmX98BQjg0rMmJ38s+qaXlf5f+B3fQtymu01e5dMST1XASs=
Received: from SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14) by
 SEYPR03MB6904.apcprd03.prod.outlook.com (2603:1096:101:b1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.24; Thu, 22 Feb 2024 08:38:45 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:c6:cafe::a0) by SG2P153CA0045.outlook.office365.com
 (2603:1096:4:c6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.7 via Frontend
 Transport; Thu, 22 Feb 2024 08:38:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 08:38:44 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Thu, 22
 Feb 2024 16:38:42 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Thu, 22 Feb
 2024 16:38:42 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 22 Feb 2024 16:38:42 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
Date: Thu, 22 Feb 2024 16:38:24 +0800
Message-ID: <20240222083825.190854-2-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222083825.190854-1-wtli@nuvoton.com>
References: <20240222083825.190854-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|SEYPR03MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: f43d9ab8-65f3-4a6a-c6ed-08dc3381adfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	86E4Wz6EfgSD9VVhQdWjFt2L5eEmWFDR6bGZNxjNFt2UE30aM69GJfSZ7peYfk6FnNszQHg6FV9hp8hXE2q2A2DxsiPq0SNjN0Lj9sswhtjMWflu8LeEqxCCLiLroKfXg/lMjN2Pf7OhSieghMnrw8DamCBwAC0VOhe4pUIELCOCvekjoBu1ZD0SMwjmWB6QoWrH4lWeU4CYeOyrOvdlKqlDRhofCxH4jxNVcCyJAHLHZIwB4+IyWYwz75BgZIhg1Zq3m0QnwenX5cxPtGdSVd6KrLa1mCY5Vjsp/xKJ/kUTEKKBw6nQyS9k60NMjBgEI26X2nzTL0eFotj9h9zDlGYN0lwKntVyj+AeWGJHR1lum2mBZXS0Lp1OXgCybLhpmyIdwWuWsGNubh6qL5rDwXGZ9rQli3oc0Q0TqIBzMIINUIpG9hFivldl5nYIB3dbO1nQ0+KxlethIGUmCKlI9ES9lKTTRen+Q0dnlhEWYuYFdcqhmEMUSt4b9oakvTCX6oRGfZHc2rPCMk3ODBJiu0bgHKSnT2HxjxTRa0qC5KdRV33gcilpMsZmNSapXiX0y9thEADOrNP5myMClslCpzyJeUlJEZopHDn80LgMuUlI29BITDkknZwPlaFAyrOpZN2Fa25oR81T8vp8jjlLtw==
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 08:38:44.1652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f43d9ab8-65f3-4a6a-c6ed-08dc3381adfc
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6904
Message-ID-Hash: Y4J2I4GNRUULNJI4TBZVWLBNZZ5ZOEDP
X-Message-ID-Hash: Y4J2I4GNRUULNJI4TBZVWLBNZZ5ZOEDP
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4J2I4GNRUULNJI4TBZVWLBNZZ5ZOEDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Added a DT schema for describing nau8325 audio amplifiers.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 .../bindings/sound/nuvoton,nau8325.yaml       | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
new file mode 100644
index 000000000000..fc72baf0bb7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nuvoton,nau8325.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAU8325 audio Amplifier
+
+maintainers:
+  - Seven Lee <WTLI@nuvoton.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,nau8325
+
+  reg:
+    maxItems: 1
+
+  nuvoton,vref-impedance:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VREF impedance selection.
+    enum:
+      - 0 # Open
+      - 1 # 25kOhm
+      - 2 # 125kOhm
+      - 3 # 2.5kOhm
+    default: 2
+
+  nuvoton,dac-vref:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      DAC Reference Voltage Setting.
+    enum:
+      - VDDA
+      - VDDA*1.5/1.8V
+      - VDDA*1.6/1.8V
+      - VDDA*1.7/1.8V
+    default: 2
+
+  nuvoton,alc-enable:
+    description:
+      Enable digital automatic level control (ALC) function.
+    type: boolean
+
+  nuvoton,clock-detection-disable:
+    description:
+      When clock detection is enabled, it will detect whether MCLK
+      and FS are within the range. MCLK range is from 2.048MHz to 24.576MHz.
+      FS range is from 8kHz to 96kHz.
+    type: boolean
+
+  nuvoton,clock-det-data:
+    description:
+      Request clock detection to require 2048 non-zero samples before enabling
+      the audio paths. If set then non-zero samples is required, otherwise it
+      doesn't matter.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@21 {
+            compatible = "nuvoton,nau8325";
+            reg = <0x21>;
+            nuvoton,vref-impedance = <2>;
+            nuvoton,dac-vref = <2>;
+            nuvoton,alc-enable;
+            nuvoton,clock-det-data;
+        };
+    };
-- 
2.25.1

