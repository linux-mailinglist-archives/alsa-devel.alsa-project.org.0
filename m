Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DD8812F5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:08:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33BA02BD6;
	Wed, 20 Mar 2024 15:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33BA02BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943718;
	bh=16LkaMVQjCpJl8zqW1vwIwrFuu4Zi7OcZ7n6oCsg1s8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZkJ36FllFyRr3rYr/IkIYsvkIOphzLsgRaJeEL9brSg6AsmT0NcMpcwNRQn+URMLX
	 +n563awTWEM/niJvikQXgMyVychLwEYHwQw0K25+icRF6xeFNtKtLDq+ajdyPTbt7E
	 EXuUgFNytlf5wtxP8w4DeSNq4H8LxWVfxd6565tc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4CF8F8980D; Wed, 20 Mar 2024 15:01:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42673F8981A;
	Wed, 20 Mar 2024 15:01:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 893A2F80088; Wed, 20 Mar 2024 10:03:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2071d.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4420:2::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF160F8025F
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 10:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF160F8025F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/0vGPp2ye6cIkIQjdzFlIkNxHM8LPZ6bClC63yYtCstYEpALVlnEUvupiPm8KRMi4/V3wx1vrxr5B+WiwOu/LJT2JIVPGF5JHynPTlycNw8T4949iHi/U7Et8JyscgCOinLc6n7hrDf4V9H9QO2zRWK/KmbBA2p77X5iKUFQD1GAZQE6deIcwTK0Qhr9w/4A9jVsOPPfgIrYBpyZp+7qAFLzC8GAnIhhttrLNaAYGYugmaDGfSv8oNF2qu42+ks4YEoeY12+lXAi0feq1p+HYAMDApySbBQd+4xffheiF7/knZEJvytxLM0EW4YIRUSd1XyBLhQ02weOnj3z+mOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUnp63uX2IlWyIYjX9VDAfgrtwnH9Ay0YFeKpI+xb1Y=;
 b=Jep54uEEgYtj2Dkc0NT4aBNO4FpQIcRgdM33exqqTqE7q3kVjzgxh2zvtZwNpM4kYmvj0m2n5Vd9eqnENUY0OQjHMeBHNQqRJ19wE7AYQ8fcmNnvEGdBfTVjSs60bmJWbCBJ+hqCppCtf3gekH9ads8NO7fnr0MfIbab2PXatTpyvCg8CMa81B7yI1zVF37y+ne01RicW9kyQ9nYbzf8PkroSoFsf+1ZdctHPbn7kOvARAtDc2Xu39/bxBrAsycKXPEEeS5TwFwyIa8lBjgxaru+0Pnyf6nKLQujZzzuauKpopqRvd4cU65lK14ZCBYe3IXQZEm/O0z84MzRCDL2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1034.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Wed, 20 Mar
 2024 09:02:47 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::7d98:f313:525d:fea6]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::7d98:f313:525d:fea6%6])
 with mapi id 15.20.7386.022; Wed, 20 Mar 2024 09:02:47 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Add bindings for Cadence I2S-MC
 controller
Date: Wed, 20 Mar 2024 17:02:38 +0800
Message-Id: <20240320090239.168743-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240320090239.168743-1-xingyu.wu@starfivetech.com>
References: <20240320090239.168743-1-xingyu.wu@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB1034:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3ed185-51f4-4976-8be4-08dc48bc832a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FZGm4AguKFgiNLAkOEpPkVP8gpeHuY3IVXC2dw+ZAF/qpao77zvew7z4kJHcL9FZe3T+kvO5Uji4tUqpamjqnG4UwIN7mz6+Kg5fqQV7cgJPoN6Iyet8QbJwuLwN1TJ9JdggsoFBVTV7N2n0/3DXSxSr9EQkzJDHRj0GpoR6uiEz3OEOLk703FcIGUntiCCr1d+3KBMVJVetOBKcE6PjNhu+I6zb020jwbLAwnBru6bat28mWtkK19yn3AzEg0BPbVPxSI3YT4gUjVTiyAsaP0tvKloozhyAhDywjjaTgRGX5D8oSq3jj6WbYJ7Om7oGNDrF3z7UJuY3EqXvSO2WEj7iWX1VWA6eoYRr4I8WU4L7yNQSDcCeQI4RSl8AHq4UT/1LFvASFaZ49CISRuwbvTnlQbXrM73KyiyXD5ThAZhkgVx8mV31OD23ulXTBwe6Fxqn1Pkilr1iYLVGIDdilz7i4r4/xrBM2t1KSHx16SqvX18+1ztwpyBkBnY4QG99eaG4cgKCvE3qTl7vhv3ZXsAxOcqOF8jK1PE3X0Mfi1FcsSJ1tIlxROGcyebCyD9WsKzzk/kDXSk6tJp8st0YKeuBelgNxxKdZ1rHDTs1uL4zkkvp+niU/1y1LtnV271L
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1lOZFHuQ1fQrUT1LeSh7QyAxf/6hPWyYgLbi32sb+Opec0hk9Pid1dFvITFR?=
 =?us-ascii?Q?N1j/d4gd+6sNyMdCwvGqGx0UkkAqf2RPwi+WAu4pMOd6uha2pjbT4KD5dipR?=
 =?us-ascii?Q?SD/qKPon6UQ9u/yZpOyVAdnXTrzzjYdtSUCMPZNXFZz34mACbz92MPVPf4ei?=
 =?us-ascii?Q?FNoE98vHgx3pMKT0O0k87EgimL9NOrf+/xIhRrSCUROKn63G8QCRglRbTb0d?=
 =?us-ascii?Q?qpHlgDDW5rXwQHEkQqMS43d+myfzN9zejNuzccUMMI13+jwAToNO57+Aflel?=
 =?us-ascii?Q?0cuZsM14AF2ZmXSFWb7gpKcZj/jVhfJtmrLRSbniEGqxzSEiJ+mQKeqGeHfZ?=
 =?us-ascii?Q?3JogHh9m0tvVgwb4ZwuIdzp+Tmh89MCW7g5txU/xHI3+pI2LzS4IMwDeJTjS?=
 =?us-ascii?Q?0I8NUF4mS+dnDogqDwi1rQ1Xe1Qr8N6IBaIkR+1+X+BU2ROlxujYWxNHp1ck?=
 =?us-ascii?Q?UWvuLHtE+1hEKm3b8hhrhaTnNgLJ1ldTSMJPC/FGwaXiUA0Ny6T7V9OwBqRk?=
 =?us-ascii?Q?4tDxiJ+Xpb+uyX9agJrV2eKfDs1V7DhfqKuR3jEaDXxSeSaywPyafIVYOY3b?=
 =?us-ascii?Q?QZXf48LeeoJbNGUogFqNZMwKyME58nd7XwRnL9vkFE446anwkGY8aKoLisUx?=
 =?us-ascii?Q?vOdzluwAkVpyGO4Muwa4iRznSJVLN68F/tXZmHyWhVIgsokpHy3jztX/ExrN?=
 =?us-ascii?Q?5KXdrd5vHgByiOg36J2HqXsHSUcZMAnUHNo12hwbekzwc8z6MvcjsPASTnbr?=
 =?us-ascii?Q?mBb/NXa6VJgmfvA4Ni+YXJtI/QH/BcvCKUFq2hKUY5A8yzUzgjD8ZhWxbpKb?=
 =?us-ascii?Q?7uSosjEPaKsfJCg6Dn5BLORs+CJuhLT1IYweDgTKquI2iv8Eo6E23ir4GOqx?=
 =?us-ascii?Q?rUetWLIwzKHNMDalsCkwLSViKKX1pHxVjNbNXFcJ3TfQ2Y53BRgnoIQKO3po?=
 =?us-ascii?Q?ij/bZdkKdzOWki3H/5I93sC5rVxnT70FoNnOntbfBtCuhuE28O/vMmeFh/x9?=
 =?us-ascii?Q?JLWSe53zTE9H2GJVMqAGwhO3m/raGwG+R5c1mPm3xI7sl4TyQ8ROncS6DV8L?=
 =?us-ascii?Q?Y41f7qfvMuvOweQvmdQlYm2WrMBWY7x16jOmHTA3DDZUDBpnGc45AUBeJm4q?=
 =?us-ascii?Q?JBDz6BSc31ZRJvqvM/75j3KKT/ZABF21PLryBPQ6EwWUGGG4Vca/00pl17Sv?=
 =?us-ascii?Q?+axcQYdNj0WL/lP0S1gJ5k7sOFuAsgvskEAedHZIGAo5hgLb/FKDjwoQ+mnM?=
 =?us-ascii?Q?PQa+Wi56MBXNr99LeadTsMih8bePzqKPJnMcIofF59QJ/UVzFP0PKfspO9Gn?=
 =?us-ascii?Q?bb5OZO9XbmZD0APaHlJqd+PLKJvHCzyOy/5vRoACTs+fwY2Q9Y59WixdQKi4?=
 =?us-ascii?Q?F1IqUUr6MdUFI/RzzVn7wDbCkFtxr77Gg4bc9Cm6ZWkQmXhH7Jc31qIyL5da?=
 =?us-ascii?Q?St+Y3pIeE4tTm2XdTKnF+03BWjDjD0fn+NQKnRV8gLVbUmjUsAC/hNZykYi+?=
 =?us-ascii?Q?FPnDc4uS4zxZGgVmnPwHzZPXqmGAUkbgkJmxzdjrZmaA1J+fP94NLMH8K14x?=
 =?us-ascii?Q?GT45bMP79VniY8tQ0hCOYN4vb9MjrWNQUggCoPp9TTefqpDQ34Uya+4Br6ge?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b3ed185-51f4-4976-8be4-08dc48bc832a
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 09:02:47.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oqjJ2HEhnNsc9ruKJZznFO5NeFJza5OqUJBSfdnIIXRDPZr5PYlPKQLCVnf7neM7kA8UMI2ySKdN0XC9VdnNcQNQq5ENacOEJnAoaw3iL/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1034
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OOEONR7SOL4KPFFKUDBICKEM42J64MRP
X-Message-ID-Hash: OOEONR7SOL4KPFFKUDBICKEM42J64MRP
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOEONR7SOL4KPFFKUDBICKEM42J64MRP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for the Multi-Channel I2S controller of Cadence.

The Multi-Channel I2S (I2S-MC) implements a function of the
8-channel I2S bus interfasce. Each channel can become receiver
or transmitter. Four I2S instances are used on the StarFive
JH8100 SoC. One instance of them is limited to 2 channels, two
instance are limited to 4 channels, and the other one can use
most 8 channels. Add a unique property about
'starfive,i2s-max-channels' to distinguish each instance.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/sound/cdns,i2s-mc.yaml           | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,i2s-mc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cdns,i2s-mc.yaml b/Documentation/devicetree/bindings/sound/cdns,i2s-mc.yaml
new file mode 100644
index 000000000000..0a1b0122a246
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cdns,i2s-mc.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cdns,i2s-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence multi-channel I2S controller
+
+description:
+  The Cadence I2S Controller implements a function of the multi-channel
+  (up to 8-channel) bus. It combines functions of a transmitter and a receiver.
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+properties:
+  compatible:
+    enum:
+      - cdns,i2s-mc
+      - starfive,jh8100-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      The interrupt line number for the I2S controller. Add this
+      parameter if the I2S controller that you are using does not
+      using DMA.
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bit clock
+      - description: Main ICG clock
+      - description: Inner master clock
+
+  clock-names:
+    items:
+      - const: bclk
+      - const: icg
+      - const: mclk_inner
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: TX DMA Channel
+      - description: RX DMA Channel
+    minItems: 1
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+    minItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh8100-i2s
+    then:
+      properties:
+        starfive,i2s-max-channels:
+          description:
+            Number of I2S max stereo channels supported on the StarFive
+            JH8100 SoC.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [2, 4, 8]
+      required:
+        - starfive,i2s-max-channels
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+oneOf:
+  - required:
+      - dmas
+      - dma-names
+  - required:
+      - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2s@122b0000 {
+      compatible = "cdns,i2s-mc";
+      reg = <0x122b0000 0x1000>;
+      clocks = <&syscrg_ne 133>,
+               <&syscrg_ne 170>,
+               <&syscrg 50>;
+      clock-names = "bclk", "icg",
+                    "mclk_inner";
+      resets = <&syscrg_ne 43>;
+      dmas = <&dma 7>, <&dma 6>;
+      dma-names = "tx", "rx";
+      #sound-dai-cells = <0>;
+    };
-- 
2.25.1

