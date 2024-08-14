Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C129952A80
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E5672C18;
	Thu, 15 Aug 2024 10:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E5672C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710676;
	bh=0eW5/0A54rZn827gGRoCFpuivp868uxQfv5GOuTdBJo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nn6R+4KuA74sYnFnT4Ac819Cf8hMD1rWK5E0/DfxWmTodgMGpZBEWUnZUwtr/KS2U
	 SUzqBMR+5Ga9W3BAH44COh0dtd60sGUficehHwyt3kl11U5pEQVRJxjrgV5LCaSfYM
	 skCZ/ehUXfMsbaRInZhiPzO6CWsPipTR//02YUZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 070FBF80633; Thu, 15 Aug 2024 10:28:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38121F80649;
	Thu, 15 Aug 2024 10:28:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB9A3F80423; Wed, 14 Aug 2024 19:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D2BFF8016E
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 19:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D2BFF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=JzSkSj8r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M043JeuD9Qp2S7Qf4fqVoUZk4vnsh8sk4JaO0yjRTkQidS+DY5YckAWZiSFKG9ixbWHPeaD0+6lFh17Z7sIdCZpqT6YBcOXtn0ZGKjqwdPL3E55mKVpVEYYEzsLg6eSex5NUK90Jy/ZBsrOcqyIshvpYYYf2ntjGJcDEIIlYqrgsC5e1dgayFtNrcGqe4m32q1Ls9p1hnwInNsXG0ddfywznBnNN6bJLM+h/EYR4M9/6YD2YeNqataCCU3yJQEgD9XZlpf/yX/WAv+1Sf0e7h1r2oyTJqMDSCw8xmKeh1Y6tB75GewT3cRrjAYfALzKvLN4X0zkhiCZbbj3Pmh8hqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5JXNjpzd7XUMHS+yGJOaSyc0oXZz1i3uhuD7A95bAQ=;
 b=mjG3bp9qvceeHalwViM231YX50fqxFSs3etHzEAIF5nlKApZdJVgs9ObDHBt94ea2DMeKLK7Lpx/eUIDMugZ70AhUPf2uBDAaJiLiN4m3LMLM1yOHCKL/VaWejWX7aW6a8fG4LNUOZfoPlNTDIH0AktiJGWmWHKfZCijeuS1aoiEoslze51Ig9Qar1M/Xjwd5HDUfs4fBIq15HOQGzCno/Wn8Yz2WcJCnZg2/+9BYyQvmVIO09w6bqviWxMjMvu7l9qQ3dck2HZrG3TBsjr/nfGMUFM6Jl4cD38m2cHEU+oIvVoLtzbWaaaOqxE6fgyVPZaVaVp9eQtbqkMgK3G+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5JXNjpzd7XUMHS+yGJOaSyc0oXZz1i3uhuD7A95bAQ=;
 b=JzSkSj8rlGAaa71/HDdUCRDcdLKYLoFCCGp0aG0TuxCQeDPOMBExHgkaxX22BDzoAEmNweExmJ94FKXbmNgIXv2MPuG38RlzKVrGeRKa5UcQ47e+SXu4JJf9Ti6rM8E4fP4Lv9ZIJU6drxrFD8jui+No40lmxZoC5bvYr+2ZGEBwq257aB8qRO1qtRWkYDMMJRvo+8o0LEoWDEBJBVzPGyJD4nhL3mkN2e+OQTNck1dlKBd9pJ0scOGiCQdzVDIoTyHpyyGpLWfesaaKA9oUhxrJP7B1GTmzxiIJFi0qfocSCcuAd6Tcd7q04uk6QpZVCAMpg9Ja9XeKEKDQKh0adg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10961.eurprd04.prod.outlook.com (2603:10a6:102:492::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 17:51:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 17:51:42 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	alsa-devel@alsa-project.org (moderated list:TEXAS INSTRUMENTS AUDIO
 (ASoC/HDA) DRIVERS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] ASoC: dt-bindings: Convert tpa6130a2.txt to yaml
Date: Wed, 14 Aug 2024 13:51:28 -0400
Message-Id: <20240814175129.4027097-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10961:EE_
X-MS-Office365-Filtering-Correlation-Id: 598a665a-f7ad-46c2-f03c-08dcbc89c1d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	lgJsk9VglvT799jQlVSa6aEwL5KkX+yK4V7J0AyG1v9NkZ9cXvRGl105lvFy30F/VtxuoRY0PrMCV0heprF/ts1nDoXgpNzat/qsCOcBKQvjCsZuspc3Kpue7i1+e2yYgHqXoONFkRJNt+6hiIiBuTMwNu6mrrhkdC2/fd468SpZClJfYyaUrOo6p5gU/yIqNPpBPJXfftYmz9ixXibaTuPgqQCKc7iOFVEHyfiXFgHYIcBoeU63fxcrvEKbAm17ONlbjUzbycWLtxUgwNBAtExsrcOfIdUJd/4csINVe+2O0ZzKSxeKgOJQ0PAQVNv1VH7+xWCylB+oIKF5DRBt8w1qUv353CG9y8z0FkvNVJqzqBa7CUtOq4cL+6JGXMTSeliqbH0wQ27LXa8/BPVxYD92bFUWSlGX3/vkIwBGX/bIjF1KHDWx0NuBoH8SuhOFXDEAe4D0/AZc++scdokOU+rHSoowhHqfvBy7S5RytEF2kQHnBhPE4ebiU8hJZQC1ayhIdoQF7aFcmEncD3MXkC3GKeh7AIiKw0z6lM4nOeRbc1kSoeklUbwux7wmel0jGf9CU6VOZlHhS1a/9C8w4nsbg5Eltm3/5mINvZ507tAFZnPfLmGXFcO5snFwQy7+UmlS/jel8hSV3zbCHHAbx4fOJbZZyLwOTsdXsHkg7Cj6Vl4rqw+YXqC157OaoSOj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CB6s+kxSnEqdf/w5d8IEA1iWKxtoFDvUZLsNhQC2thVNR6Rm4HUfWTfIvta6?=
 =?us-ascii?Q?sSLy22yrqZh/Mftqu/nFzfU2plJxy0IgJFepNfe1PNzQQ7wUncZkRuOrnxD9?=
 =?us-ascii?Q?IcaAlplYDBJLwWvHC36IRts9FW87OZGD/yX5rhyvBl9/01qLs1rGl/aoQnN+?=
 =?us-ascii?Q?FaCk2TmLVUKLZCsRNbaKQYgItHOI/b7YVVWsRF+muNOid+7XaL72UAnW8R/M?=
 =?us-ascii?Q?8PPrNi+kc8ENXPWxBzGDfo3ctKhrk/9Itw6jBi88wgrv834sPk17VLihQf8W?=
 =?us-ascii?Q?Y8eP0VRhZPXijbBFICl1R1903uhftf/xysqM339iUlBpDd/2AgtGoTOHKjQ4?=
 =?us-ascii?Q?o7j9mRgVaGyA/zu1OMujdty3P17J7pqxfBh4fjwf/sxMccDWpY1QJPWxRKqO?=
 =?us-ascii?Q?a0rDQOBeinHTrZSePZZ0/JJr+VFbFbSsyC5KThFRG4O/tLFgSgJwuFnOH/5/?=
 =?us-ascii?Q?bBrlNgnO03gfNvyLtPRHdmldD/san/FSZ3u6WEhBMhIR+fcfUaj+sXGFEpvI?=
 =?us-ascii?Q?vQDoT2nwEhbk4J/nv33MNaGVVSYOqDchnnyXWVqYqgHtQ/PxByIsbRNwho6V?=
 =?us-ascii?Q?Vr9auLSxG5fqjMSJq4MP7O+1lhskNdnrlN3AvzAhplAaez+zh7sD4W5EsRI3?=
 =?us-ascii?Q?Vu/LzPOF3o09b6prMFcDucFQLDrcdvLTEdHP3GU8qDYhLM7CIcmHcJmgYgrE?=
 =?us-ascii?Q?cOYbC2oeiqfXYF71tksWfYavVQlIYjBxLkt0pMQs5z+reR3/urW4fx8tfqam?=
 =?us-ascii?Q?SeroCknSXYW5bojwZb+2vJE1TOSDNAca7nLivDfs6ea2BBifFjWa8Z1hbjf9?=
 =?us-ascii?Q?Eboc68HGWw6Qr5q+CKEQi/64FzMYxVYTjeQ3AWaMEurIhaNZeczkN/fTbLrU?=
 =?us-ascii?Q?3yJ64pVyRmkzzAEpcnBvy0ynVahIcqd/KCGL3OLRnFurrSQJvhfHF8Mupq62?=
 =?us-ascii?Q?a8Lc6qNksM7OqBj7nFyrGUVH70iZ5kChFZpsohrHktessTriASnBxCSMIIHO?=
 =?us-ascii?Q?izScfLPFNAU2qpMXA8mlyYu1n/Ke/CxmKtao1Ik0hItrKdVw+Yy3C7u+hNIr?=
 =?us-ascii?Q?sXl4Z7IgoIiSh/hPyR0pjmUtBcCHObAL3BWmOCC86+t3TP2P07SGQ//THQFR?=
 =?us-ascii?Q?3Y/n9asoxZbyn1yDqZItyuELeB+JtuShs7BUtJrSJ9GlQetVnm8iUIb8azRa?=
 =?us-ascii?Q?gGSqFcoxcHQju6Eu2JzL1iZlSlldpMb5U1iuu8kdkT1hiKIYGxcS0CsTYvuH?=
 =?us-ascii?Q?Z9ks9OgpAYF3jIwlGRWJTByHuSM/A9SqKlmeGmgq6pQv47TsqJ8CImXv484I?=
 =?us-ascii?Q?VjZjljWphv/ksHr5fSjC8IXox3wesHn0wIpNR4b97VlGaeJSwObCfsZvqUMM?=
 =?us-ascii?Q?aBGbce/WnHu+/WajTboTXC3iJIR0RMbzVJl2NtQ648rceNYU+j8JQzXlcmev?=
 =?us-ascii?Q?KwX6unZZoT0t6IOwundUJDDy5Lgqs+6cRm9eK0AQwLQMcr2Zo12CWgShKs0g?=
 =?us-ascii?Q?SKikbzSJyBfwPSpVoIlOLHAbzZ3TpiNYEHQoBmGnOIgPF7Q5AuYy7JLQibRb?=
 =?us-ascii?Q?Jxatc+t6xL97i/YSHEHOOkZvFH0cmBkQsNLCknha?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 598a665a-f7ad-46c2-f03c-08dcbc89c1d0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 17:51:42.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GFwV1MceCqQ/4SrLtgDfGc4gNaLxkdH86WJrDMLw2PZergursN5QxqclO+/vWOOwHoJtwoUVovO8FdQIOjwozA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10961
X-MailFrom: frank.li@nxp.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3FCECL52GXXYBW7FZ3DTVTR4AIZMWQYO
X-Message-ID-Hash: 3FCECL52GXXYBW7FZ3DTVTR4AIZMWQYO
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:27:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FCECL52GXXYBW7FZ3DTVTR4AIZMWQYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert binding doc tpa6130a2.txt to yaml format.
Additional change:
  - add ref to dai-common.yaml
  - add i2c node in example

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a20000/amp@60:
	failed to match any schema with compatible: ['ti,tpa6130a2']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/sound/ti,tpa6130a2.yaml          | 55 +++++++++++++++++++
 .../devicetree/bindings/sound/tpa6130a2.txt   | 27 ---------
 2 files changed, 55 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tpa6130a2.txt

diff --git a/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml b/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
new file mode 100644
index 0000000000000..a42bf9bde6940
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tpa6130a2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - tpa6130a2 Codec module
+
+maintainers:
+  - Sebastian Reichel <sre@kernel.org>
+
+description:
+  Stereo, analog input headphone amplifier
+
+properties:
+  compatible:
+    enum:
+      - ti,tpa6130a2
+      - ti,tpa6140a2
+
+  reg:
+    maxItems: 1
+
+  Vdd-supply:
+    description: power supply regulator
+
+  power-gpio:
+    description: gpio pin to power the device
+
+required:
+  - compatible
+  - reg
+  - Vdd-supply
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@60 {
+            compatible = "ti,tpa6130a2";
+            reg = <0x60>;
+            Vdd-supply = <&vmmc2>;
+            power-gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
+       };
+    };
+
diff --git a/Documentation/devicetree/bindings/sound/tpa6130a2.txt b/Documentation/devicetree/bindings/sound/tpa6130a2.txt
deleted file mode 100644
index 6dfa740e4b2d8..0000000000000
--- a/Documentation/devicetree/bindings/sound/tpa6130a2.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Texas Instruments - tpa6130a2 Codec module
-
-The tpa6130a2 serial control bus communicates through I2C protocols
-
-Required properties:
-
-- compatible - "string" - One of:
-    "ti,tpa6130a2" - TPA6130A2
-    "ti,tpa6140a2" - TPA6140A2
-
-
-- reg - <int> -  I2C slave address
-
-- Vdd-supply - <phandle> - power supply regulator
-
-Optional properties:
-
-- power-gpio - gpio pin to power the device
-
-Example:
-
-tpa6130a2: tpa6130a2@60 {
-	compatible = "ti,tpa6130a2";
-	reg = <0x60>;
-	Vdd-supply = <&vmmc2>;
-	power-gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
-};
-- 
2.34.1

