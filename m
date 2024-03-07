Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C2287704C
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:18:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ECB8E72;
	Sat,  9 Mar 2024 11:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ECB8E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979479;
	bh=0TmxaoFrOUwESujiuNXOQeTB7hf91kOhWAXK8/ggd74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mmCtnWTbNbxX1eDQEYC+vZnT6QpkUeL1PjUBfjtTcsj2GYwBVNyOvwZWzkfrPYttr
	 Pm/EMfQBcgGy3OwHzh0Btao87FilrGwFRzwTJydthXDihVCLhfPAH9LPRk7S9GWHI7
	 OLiIxA7XosqMnTOTfFmsxcZTfqElbUzDu5jYzM38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E0DFF80C6F; Sat,  9 Mar 2024 11:13:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13397F80C81;
	Sat,  9 Mar 2024 11:13:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B06B1F8024E; Thu,  7 Mar 2024 04:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on20724.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4440:2::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E7CEF80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 04:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E7CEF80087
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1vP+YoF06kREx7WA6At6K/sIkcs74hp6rTSv1n+I8ReGkC9k2KHZA6HswxzV/EUL8u6p2UOLrLIeuV19MQWpW85rp+R3oweebvCdMvgsPtN38hWmcGUJyk44ai+TCCuBzfaC4c8WBSynNeHyHbMHxZBrDstB0P0AFfgv6sGCK/9prR5op8D7ApE4rdyfHNVp1j5ibUyzG548StTXdmhCiYn4n7cwRdptK4fY1tjKHsLWpsxms4LOoQEWQ1+OTESDodnLtwwh5pj33My/PMRHn+x3r81kNPu+JHsaBG9+7ictz2b8+TvM2bvHQe1irX52czWuOcrzsKKHHaWIMhSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fjdkcP/9ZVpN3OxoIzHr4U6YgfZEhR9yeTz1PhIvWc=;
 b=ApuKnXIUi9zZv5E6E52BIBOmaWEEjvxpIai+WaKzWw3zQHW76es8NK/eC3/W4w0tpHP3PwMjUkG7k8AnJ+vGM6OXMJon+SFCypa1z9UddFPbEPmV5rXzXZF8KqV2RLDCFIB/jjUO+M3e1WMjlhXY8HHwiMjDB6FUxEa6ltPStifvwOLRdtrsL4+uAv4pyUULqzhL4m3LCP+brEmhA+X5Fg1E0HTL+DlXJvSLBCz2afQ7wN/YwTRN8UP7nc2Od4GpI6D/JE+j/oKomabVC90mHWT9tuUvQVg5i257sdkQrMweijxb2JbgWYXmigXkzyBQDdf5ykx8PtThcnzw74haIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB0969.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 7 Mar
 2024 03:37:17 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::20e3:6cc0:b982:ae95]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::20e3:6cc0:b982:ae95%3])
 with mapi id 15.20.7316.039; Thu, 7 Mar 2024 03:37:17 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: ASoC: Add PDM controller for the StarFive
 JH8100 SoC
Date: Thu,  7 Mar 2024 11:37:07 +0800
Message-Id: <20240307033708.139535-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307033708.139535-1-xingyu.wu@starfivetech.com>
References: <20240307033708.139535-1-xingyu.wu@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::22) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB0969:EE_
X-MS-Office365-Filtering-Correlation-Id: 8878b222-d2b2-47e5-cb98-08dc3e57e2fe
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EkwvPKjKGck1hVBBO2FekHVfiZpNDQAARADZ3HC9kQ/ekdNGjrjwfaQirWXpWo9JtaQdan/wTCzXeFbchA73T35FKZ0fTIMF+ajeoaurr27bvqdvYU4ur1MlrmjW003FQM6I4GqEum3AiK66F+qZKUOW5vmlcGnwDSiPEcklRKR35fMetZThtomc+Hz9JBd28gFxnD2RMkw1vGnxITQYXBR7uDuH/QpmPAJjbR56GyGsg9MXnYD9mfJdT9jvkjpHeXltEQ7KIbVJ+brdv8RZCPeejYVi3V+MT7RcZ3uuYF3gs5NrgEJQPPH2AzEgTsC2H0j9FJPuSE/cx1yyubX38JlolXGWLjPFa2ZxcqFp/rakPsVcid9AUmb+/g+VXeigFg01txqp7z8S21odpb9tT+hFbic7+higxvlaRuglkZoPcmaFfQlBo/5JWzcNeSnvlMH+4xb+aOZ1cApiO+eHIj1+uJJ8k9hdmYrUcO8NiP44KfgW517MD3QvtmdWaMiLagb8vjHXG6BF0XF3ARtjL7T9aC3jsz8fnuldj5zOHAXmF2iSI3w4uGaMBeN5UpFrNRpiKQpe6ckgn3IVvaO8m++j2rRecswVGNibtUx1Mf2ZQQYysHSKfEvEkN5Wlufx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MSTtV76fBz3s35sCHYXr7MoK/ZqkI0HQyfXT7WaQLMEshYbp0gY282tmuL5Z?=
 =?us-ascii?Q?wBD0aTptHCZoroUE4CwADWS247xgFJehQJwgJ1BqDa5b80CMOeIadCoVkZ5U?=
 =?us-ascii?Q?Bi3iD1PEpQrDcoNki7bXZIcq+PX8hTGh+DvRsk3Q5ks5sqt8A0i1tFj3949y?=
 =?us-ascii?Q?SxJ1MawN/9hqA6KlHyQTJOSdZD3opRcSziyooQP459mU3TENBacaN3XefLvr?=
 =?us-ascii?Q?AGSCgD3t1nSkTcX4RGhpcIzxhLbCzQGjmesWH23umkGgpID/Db2Etkh1IGzf?=
 =?us-ascii?Q?3vZuLbvdQm3oAONguWSJzr5n+49n+EfmcDNh1QmB4iASvdcQbBlYelwuxv3E?=
 =?us-ascii?Q?2OQk+BQZeRREHn6A3x780A1X6TXIa+pmXkptx4n7BfgcF1qN1zmPqeI3Pwuy?=
 =?us-ascii?Q?i3ntNmf/Sf217qxgyRHarfnNfmGKo/D2Mz++nkkXl/m51c0C8BH7n3x97RMC?=
 =?us-ascii?Q?1dq6pq/5Syf229j6BT59KGdrgJEhuGTg7b5a3Rwiydo64wbCA0QhDW6SI0qF?=
 =?us-ascii?Q?04SPUmE6PDc3IiqOjdlxiWK2EOoc9TwDVGK95+iTbZiNXi8iDpgHAsa0+kRn?=
 =?us-ascii?Q?eBH5PRI/4yXT9WPShmk3Kt4MJxP0nNtrz1umlQupBe9Wy/ggulsl/Lv1kASk?=
 =?us-ascii?Q?4655MpbJzU59pCh8UUpW0bEbz1GqLEyJ6lsq2ovho7movXDyDOL5KSAeSZ7v?=
 =?us-ascii?Q?LeKvX/xBShw+xlXX+ZlZ4qHDE7LeCj8jrqga0x1HIGI2Pbz//p3AQeR3Zjrn?=
 =?us-ascii?Q?G24x+Ql+JmgoAf0FoVNE5KX6mkVusXekfUAXeTVPx5AqXYeejSg+pzIHovTA?=
 =?us-ascii?Q?yDbAzwiRGCK/6Q0NDJGEaR5kes9P2or4oEm3sPt9adIE2YQqi3y58RNN/8yX?=
 =?us-ascii?Q?tMiOV7VYs79kaIMBk6Ajno59pfutFxK0rhbCpYxNpIoRtMcdhvdekaSBTIwZ?=
 =?us-ascii?Q?5EvXvo1mmJT/8ZLfUWl+P3p/cttFR6OY2wyxDvyBQAZUJAINVRPWqSuoDV+P?=
 =?us-ascii?Q?erxUVAfp5ZBmURp4935dUcd96VP3Wlb1iWt7VF7LpoEahlf3IYB1+PoJfck4?=
 =?us-ascii?Q?ZEgWMM0V2zzBDaHI+Nos6VF32Kchy1JRrhSlJBJS79EbtOO7CL0HOMX2G22z?=
 =?us-ascii?Q?99kgyczSJ8MHkkuo6yJFajjDvQWvDIZNMh8WQTq/NQ7ftfZWnRi+59dDWjcl?=
 =?us-ascii?Q?7i8FKLuCg/CXwDtfyiCtpQynE5olvByrk8AgjUqEs58SlkoN1n7SRCdqifTB?=
 =?us-ascii?Q?QXK3PbZ8SiKxReZR2Jb1kz9+m/gbO6JU57S7xz5LIsrfANpq4aGQvgfkdCzd?=
 =?us-ascii?Q?c2/1jZcwzLF1o67R81YExGYQuNvaQq1+voj3sdkecC+cBxkiz/d88TMYngQx?=
 =?us-ascii?Q?hRXSVZ447D3xFJKl4i/LPw4AMh0c9oHFOrc1Y86oOgsTeT5yfo1kjDL51GFN?=
 =?us-ascii?Q?Im78b6uiHhR43l7N4b/4yvTyp8PYXb11LxGcakGoq2Xt6uQ6KVKKBBIkuxmU?=
 =?us-ascii?Q?MWgO96buE9pzT3sQTMoIZht0spelczU9bP0BJsmakG8QzXpRYkMx/d4nXB3A?=
 =?us-ascii?Q?Wn4wko3v8MKfszs4aHkY1TjMNSiW7VLuI4aWUaqUucLJrW6abqtRgvpTVVOv?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8878b222-d2b2-47e5-cb98-08dc3e57e2fe
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 03:37:17.2936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Qi+uxF+FJo4Ed2w68poVnUK9W1rtaKe0m27dQVK8UcGsB96gwMlhCgHyaZgrq1PRd4xdTn7rN1dw3WzSWw5hycEDOzBUqWZCBE7o4MxdZKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0969
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2OERMSZMLNSY4VML2SLPJJ6X3LDFNWSB
X-Message-ID-Hash: 2OERMSZMLNSY4VML2SLPJJ6X3LDFNWSB
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:11:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OERMSZMLNSY4VML2SLPJJ6X3LDFNWSB/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for the PDM controller for the StarFive JH8100 SoC.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/sound/starfive,jh8100-pdm.yaml   | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml

diff --git a/Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml b/Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml
new file mode 100644
index 000000000000..a91b47d39ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/starfive,jh8100-pdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH8100 PDM controller
+
+description: |
+  The Pulse Density Modulation (PDM) controller is a digital PDM out
+  microphone interface controller and decoder that supports both
+  mono/stereo PDM format, and an Inter-IC Sound (I2S) transmitter that
+  outputs standard stereo audio data to another device. The I2S transmitter
+  can be configured to operate either a master or a slave (default mode).
+  The PDM controller includes two PDM modules, each PDM module can drive
+  one bitstream sampling clock and two bitstream coming data with sampling
+  clock rising and falling edge.
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+  - Walker Chen <walker.chen@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh8100-pdm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DMIC output clock
+      - description: Main ICG clock
+
+  clock-names:
+    items:
+      - const: dmic
+      - const: icg
+
+  resets:
+    maxItems: 1
+
+  starfive,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Register Controller sys_syscon_ne node.
+          - description: PDM source enabled control offset of SYS_SYSCON_NE register.
+          - description: PDM source enabled control mask
+    description:
+      The phandle to System Register Controller syscon node and the PDM source
+      from I2S enabled control offset and mask of SYS_SYSCON_NE register.
+
+  starfive,pdm-modulex:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      The module x will be using in PDM controller. Default use module 0.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - starfive,syscon
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pdm@12250000 {
+      compatible = "starfive,jh8100-pdm";
+      reg = <0x12250000 0x1000>;
+      clocks = <&syscrg_ne 142>,
+               <&syscrg_ne 171>;
+      clock-names = "dmic", "icg";
+      resets = <&syscrg_ne 44>;
+      starfive,syscon = <&sys_syscon_ne 0xC 0xFF>;
+      #sound-dai-cells = <0>;
+    };
-- 
2.25.1

