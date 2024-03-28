Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E19886554
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Mar 2024 03:58:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B3B62972;
	Fri, 22 Mar 2024 03:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B3B62972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711076317;
	bh=iLaf+MbJIICg6XmjDDYbMV33OID1Hw3+QnVDJIvq6lw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nPMZkuA8kGzjqTEPo5MUXKxBI7a/FQuUOq0AQhP4mk7MWZcnZosqlHmFcfiKL4i5I
	 wTUnOiUjPxHN9TIVyGbPRJplLzRfqCoQer/5xqPrKZxZ7/xnwiuv3sf1W1D2o4mSle
	 t6EQRd4hSc3S7AxtODxZzE66lCmdaQu8BUv4q47c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 754FAF805B6; Fri, 22 Mar 2024 03:57:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48B79F8057B;
	Fri, 22 Mar 2024 03:57:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2896FF804E7; Fri, 22 Mar 2024 03:54:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazhn150110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:dc00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67423F802DB
	for <alsa-devel@alsa-project.org>; Fri, 22 Mar 2024 03:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67423F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=eBEGQ011
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQNvd2k9VjylyR2uja9cxKXn71BsMJikccbIswq6COKr85mBef0KPgx5YDao6sb4slSeeIrrV8R7XH1BLSeVpE/9/OEkxMedwlJkYyo+dZtscVsA7BRn8XyoXWGwSOPr/Ev9BA1YQj7nLc+0FMiCqIqP7yTYEmVgTJVHVdUDqJLkF83fJ/kHG+R5CswvANMntHFH7Dhhk78uu8gw3ZRg6414LdCqBc+1PkQxhfjqEG/bOupNr/R+PJ6mC9GAeNLAaq3R03e0caqIXknwcFk4W9lQs8mYQLIsxDVEWVC8IEqDWhDY9C4NH/snOZodMYmaofd12Xuc/W2SlYP8pp071g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lZdRcJfCGLrgi6GJEPZBXTRfq/p1NUMtewkWc821fI=;
 b=CZM0ACwIgOJ/dCCXEj79M7Njg1As3vcILsPgktu5YKkFtGZOnnxKtOUKeHgW5+6ncPpTyAWu+LDJP1nQgoKlIJwkT0bA76Cn2GHwkUOmQSnjzpMTexkKS5id4Y7tD0Sz2Y4mH2EH9HjR7D3Esc34LoTWoGPS2sz0MF8Nn89jiLeRUAJNldkxfgn159UOYdDNO9thTnw37FuVDovGSUvITAgRK9m+8zIGDuae25Un6q9IUPZbaE3jaJ96cb7Ltek8JtTnMwAh4SzWfD4FmX3p6t+B/604nww/dmfft07LC6KsXiHk4hZY39DABg65WA+ruwAivK2BxR0pUCK8fs7Axg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lZdRcJfCGLrgi6GJEPZBXTRfq/p1NUMtewkWc821fI=;
 b=eBEGQ0117zQZyismWsSVkzJWTeCdENEU0RIPEAAd9CKyrzUTyDqJn4ZMlfl/BDmQaKBZHp3DPNVXbfh8Ue5MrPPFdjRFxrmWK02OzE+5WnnOsxqx/UyAKQJYcErYBrTWkrlhhu0k0TveFgSNJ0D4naz/Y6BqVjZ789nZBQW4Xs8=
Received: from PS2PR01CA0062.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::26) by TYZPR03MB7790.apcprd03.prod.outlook.com
 (2603:1096:400:45c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Fri, 22 Mar
 2024 02:54:10 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::4c) by PS2PR01CA0062.outlook.office365.com
 (2603:1096:300:57::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Fri, 22 Mar 2024 02:54:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 22 Mar 2024 02:54:10 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 22 Mar
 2024 10:54:09 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 22 Mar
 2024 10:54:09 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 22 Mar 2024 10:54:08 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v4 1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
Date: Fri, 22 Mar 2024 10:54:04 +0800
Message-ID: <20240322025405.3340064-2-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240322025405.3340064-1-wtli@nuvoton.com>
References: <20240322025405.3340064-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TYZPR03MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: ec68d08c-34fa-4bac-953e-08dc4a1b597d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PCeKrK+O6SOI4SK0rZXlRnN30fOoBNvhDpW+H/SJxR84HVXP7W8rRnUTqMLxgNU8eP+CKbH+r3f0HlQbEwDnmthqPfz8HbA7q91ix1KWndGbprIMalkQRb7r2L8KqzyE0At0DdMzwwcgbv1UkqR6vuGCycqs0WBuoK7K5hY1SWl0O8vOGBce2pqmrxa8rN9qqh2PK3OE3MZyijEQ82JbMeBb60iLb6qL+exg+rBdOOYfksJmzl7rBnMHyySw8G+6qVGxmlOCtxm06vPLKC1YAptPLK3WqZzNU0giFb8oANmQSSAUUVSGZ1aCDNvZkX191wdWLlBfMC1P/QqYFfHpH3xQb35EYUbG5OArdPcd9S+u39/DVVnxZjXAFhvKEWQjMHqM+CWVLmdRBOG6hHsUVnLpsMXHfHeiM49sweYV89VMDvGCxBsOxummQdOh3RwQEL0OXkCs3d5zaiwI/FOlttqvrR7LieHd1xgcZB03J4rdRG4jIMO1EIqV/EEtAItXSfLe9T7o9lwMZAGjJC8BVn3DDjAIHkOGmh9CxrxtaHmWgkqPDTmJwAGNVihRBd6C8irlkg2G3/6ukHStTZhTcg5gIyPfnIEXo5nGWBudqhKNer8KhQg8ZPfSQa+QqLBOdc9a68VM8ZbblmqnIONEVkXP3ibOcdedQZu0YLUAM3jLbZ2lo1E0PxKQ/TYhU2WAtfBkaSlf8QI8xVZYK2rlQA==
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(34020700007)(82310400014)(36860700004)(376005)(12100799054);DIR:OUT;SFP:1501;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 02:54:10.5430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ec68d08c-34fa-4bac-953e-08dc4a1b597d
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7790
Message-ID-Hash: QYVKJGEWCFBIWAGN455V423MTKH2CFNB
X-Message-ID-Hash: QYVKJGEWCFBIWAGN455V423MTKH2CFNB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYVKJGEWCFBIWAGN455V423MTKH2CFNB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a DT schema for describing nau8325 audio amplifiers. The key features
are as follows:
  - Low SPK_VDD Quiescent Current
  - Gain Setting with 2-wire interface
  - Powerful Stereo Class-D Amplifier
  - Low Output Noise
  - Low Current Shutdown Mode
  - Click-and Pop Suppression

More resources :
https://www.nuvoton.com/products/smart-home-audio/audio-amplifiers/class-d-series/nau8325yg/

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 .../bindings/sound/nuvoton,nau8325.yaml       | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
new file mode 100644
index 000000000000..6ded94c0e644
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
@@ -0,0 +1,90 @@
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
+      The vref impedance to be used in kohms. Middle of voltage enables
+      Tie-Off selection options. Due to the high impedance of the VREF
+      pin, it is important to use a low-leakage capacitor. Possible
+      values are 0, 1, 2, and 3 as per the below,
+
+      0 = Disable tie off resistance
+      1 = 25 kohms
+      2 = 125 kohms
+      3 = 2.5 kohms
+    enum: [ 0, 1, 2, 3 ]
+
+  nuvoton,dac-vref:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The dac vref to be used in voltage. DAC reference voltage setting. Can
+      be used for minor tuning of the output level. Possible values are 0, 1,
+      2, and 3 as per the below,
+
+      0 = VDDA
+      1 = VDDA * 1.5
+      2 = VDDA * 1.6
+      3 = VDDA * 1.7
+    enum: [ 0, 1, 2, 3 ]
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
+      FS range is from 8kHz to 96kHz. And also needs to detect the ratio
+      MCLK_SRC/LRCK of 256, 400 or 500, and needs to detect the BCLK
+      to make sure data is present. There needs to be at least 8 BCLK
+      cycles per Frame Sync.
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

