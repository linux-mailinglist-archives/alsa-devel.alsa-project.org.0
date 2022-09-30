Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1115F0544
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 08:47:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FDC1651;
	Fri, 30 Sep 2022 08:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FDC1651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664520452;
	bh=t8Fu/mfhXK7yyo58qYF4jaBoWo4FKqmXSOBZZZKtUR4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TfO0lR1M0eax14YKsy+brfvfjeDzvwbonU9iWWHYtyMbQjcTSlf22LJqAJavVrYRP
	 H2AtRj4dOru0aFq1F0HzlN2uNk0/HeC6sXmLXDFpCmxOyTCYKENkQazLDcOymWv384
	 qaYnDom3Yi3Zbl2s7wxA0ngJt1X/jOWoq80cuSJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F330F80095;
	Fri, 30 Sep 2022 08:46:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66820F8053B; Fri, 30 Sep 2022 08:46:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5491CF80095
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 08:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5491CF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="bsflZLXM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyKiWxxV0uQZqh+dlaBKPxdDxy6pXFY/Ei0d88+K9GX5ukVI4gS8mxMvdYDvc6VYVLAuH+kWPEpkGSKd/FzMeSfPWwg8w0NyDcudzvBppP07Q1ubCbWgBCFyxDv/7oAGlSjY/fEl9acehV3FFjDA0wd5LjVFeop4/NEhQkv1V0QuT4Xm+J0AS2Z7IFAIbb7ekRw2ZP0sHMLUFWDbzOMtD9dpOeQpXswteQgG6yeNWtZyWGtIBDc/R50QC7u6UGadnR9fYU3TvGKVStMZd/jpzSrNSGanQlhLM11+ULZE0GWy9jf3SrXkvViw9VfSHS1cef80fOCOeC4q1rAZpc7dLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOuZ6ulSnbx4D4POUFKxiguyOpmud1L/Mh28NlVpbFY=;
 b=cLDgx8DRub55cJaiYHsb6AT03TU4vJCKWi6ixUUJ+3mi7lsTTdT3iX8Fcv8A5/zTyFLMAVrEn+z9Fvj8yujfE09gaUUPR2KhNSNhKXvUnHkZ37hws8UCu3j1ROiO7NIo1hAcrP+fIsI95yv3SSmhAXu8B1FIDztcREL5BNIH0RxxAjHowlfTNYi/M7owSsm0XMNrg3+Os6ZoK8Y96KujQQfH+wSsCTQikgEa9emN4JVvDQXKN27zFZMviK8HrrPzNwp6x76EVsCpe6RNiI4rsxZCQVBY72NN/GPq7obmk6Q+5JSnH/nbhnjJL3H/payuEUx2jHOmAZucpJFW8GhR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOuZ6ulSnbx4D4POUFKxiguyOpmud1L/Mh28NlVpbFY=;
 b=bsflZLXMkrr/MexvI0aAsVyRO9f4sgFirTLpj5kH0X7h16w7BaVCAnczsG8b1fTf5COKEpKnoVGUIElnWUXRCM2rJYrn0IjKP0+Y9wREEITz+mNCbV0Saf0meoBDdQlLkeQBlM8lh8m63v4sw2bkzbWd4D6u+MX3pdSBcb268fU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:46:04 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:46:04 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a property to assign
 the rpmsg channel
Date: Fri, 30 Sep 2022 14:44:35 +0800
Message-Id: <20220930064441.2548505-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930064441.2548505-1-chancel.liu@nxp.com>
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: d9217a00-e835-484e-55db-08daa2af7222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2XscgOHX8ZwJhB0wjFF9LhLuzj4AM27MyIE2kDIFIDWEzYtjpupE/SyPraKIPHROMWjkxHp0OPgwzIwGWWnhDLkdG91JS/hTQgQ64D5HLS675WxEpmLi+T/OfF7jt/OUHbexWWGcmBmxaWjpu+YGGYqmTcg2bfpIWj7BtN6KVVEGSpeb5R3OKOd6+uqzE66u+5hQph0m/g5aZMsh0JaYNr0S7KsdQ6PcV9TUdVYMwbhrqR7QpRXyhXjnTzrLOXey2hgUL8r1KvWd53P456r1ya70XuXzXBezywnPvGI/YeT+qiAbH5lugL9/uALVXJF5AwsEzAXDd8GQU7ENmMechbm2y0vnzxHT8zdOTFucdq5Xo+ZsWlj3Gfw+7mQgKUAYJbmeeoD04x3rUHcnKjVb4CPc0OL9eh7tolXZMFvLtkBFNz+4QumrkitL+B0EO72xX01Pb/ttR178YWosraIwEhj5xy/V4sC0p3/PP4jS+10Inhp8L7Bda8K2+G06tHcaRNZQ+JosJIPEIQaHaDtdJmRIGUSxiM5mkD4Q6qbpHKRSIqJpt227xqhaHgKTKtZT7SK+0qwG5C5enH7Lbk9HHDkulTO0lJKYNlpCFxpN3yF/AKUA4TP7PLZ4Ad0Maoqtaoa+8P7rjKmxQ4mdP2hMQ0Vq/woqOljrUxsrvb1aExpYV6z7pU6ScqD+IrGzecVSFDFNf5TuIS64SEHzqFgw6XNzhdYkkpToV+bCmrGzdttqP1uOvR5fDb0p+JuFQ/8XHOEAR9Pxz2cxtn5TjJiWy5QV7lpgcynHGX3M8FaG9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4222.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(7416002)(44832011)(5660300002)(66476007)(66556008)(66946007)(316002)(6506007)(41300700001)(4326008)(52116002)(6512007)(26005)(6666004)(36756003)(8936002)(8676002)(86362001)(2906002)(2616005)(186003)(1076003)(38350700002)(38100700002)(921005)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wR3lhwMF9BjH3YavrracLBQmHJrr7vfW+fWnEt4G0d1o1du1uEzd7A5+L7C+?=
 =?us-ascii?Q?zHTGel2wB2YUYoHvHzjCVi+ViH4LjN6yR2JMw8k5gPhlVpqH89kHy0klyE59?=
 =?us-ascii?Q?e8ROUkO1Rn4wKqLW73sOZkbJVwMOmzvNzGkpu1jeZ3xpi1WuXMhWTCR+WCKU?=
 =?us-ascii?Q?MfZeKSPoyMC3SCiyVpwotNf++OiFMmdrnmXwRME9FHtWKK/jNSO6l2+FJGYN?=
 =?us-ascii?Q?98Z5rCMNYQfam+nMgIdVifBWjJvdNknuVBoKEsutdaiLEm57uVbULI2eXwYd?=
 =?us-ascii?Q?+a6O++qP49Ik4S8XlKNjg/9E2F5MvAwpseZe7rMYSOAeeW/F1+FheGN5bZlJ?=
 =?us-ascii?Q?jrWbg4rPTXF6MGOxLaanIlEgkKcTzI6F06PzVk0+10I0y+2QHVRWpm36gPBc?=
 =?us-ascii?Q?IlNiiPmY2ktzBGG7U6RnRHVdXHB2ARvgPEZGA5fxaK83bLjvQ9kCtdGpHzJu?=
 =?us-ascii?Q?VLnueeNJpFCS0h461wdp/iGyml7vf0h3EPBEO0Sgr+2UIymBNvv5QJaeB8gk?=
 =?us-ascii?Q?6zRvKblUj718bMBiUVLWhBOkN8c+vfXALKcC9lyt8H3J9FJhoHCib1m08tV9?=
 =?us-ascii?Q?JAwbaFySBC206ZJ1Suif7+4arOGWcJrDfl1yPPG78JsKXp5NA3U5GKCZzxeq?=
 =?us-ascii?Q?4htLrz6r0uC3U3OJqauKZFh/QPvZBb6oRfGbbwWykZ/PgSih7El5u2zBmYtq?=
 =?us-ascii?Q?W/mZJ+fXgZ1o+CHMrhqpBybSPypGIWj+HWJky18BVjc0UJ+ytmaKJyQVRyWc?=
 =?us-ascii?Q?DAuY6i6zdx7LHZRCo40HJ28ICiEt/B8+grcX0pH77mXxi5ynbjMy02Slx+oT?=
 =?us-ascii?Q?6t/Fv1BIrx2Ggrd8W9B7yri0a8lxvJ9rMzQazv4UxYBz74GXqsVZJWNUDcjD?=
 =?us-ascii?Q?IEE+3sxrRXkadUUfJtFPyn3ej2zka/aRJiGIZbS/NSCty0k2u9dUwxXCibqq?=
 =?us-ascii?Q?uOgxb4QszmctWx9wBJBTxQCQkPQAAFXlGuzjgmnFm30Y9/Dwm+wclOm8dC0o?=
 =?us-ascii?Q?1RkEBiNi/uV1y2z+KdOT+mGVWoZ5TVSYvrT8aETJXRs5g0HlJOp1/qufaZCY?=
 =?us-ascii?Q?fAbf95YmsEV415/w3BIlheY8L8jwycAkObKJUvTyDkyEtesn2HD/YW7V9wki?=
 =?us-ascii?Q?75s9tHYCUex7c3ieCvcdlj20VkuCU6XEbYL5Thwf63JRDak+Y6Tw5FOx39fF?=
 =?us-ascii?Q?qAxtKWkeBCW8FjHODRlFu7+0lwkwoUuHy0Fllhmk5fMZyVTizBEi7P3X0ebX?=
 =?us-ascii?Q?Z4chewQsQ/f/6XWjvIvnUFBBJUCEQrF3ESdIIaHMzvak8G+mgU4DjEX+dyg8?=
 =?us-ascii?Q?hrEK3thWCNCd/g3z/wVW5QVvvt2cHehVdJy89ub6TA4SVH+wrrGjNo10dPg9?=
 =?us-ascii?Q?eWwWFBEtIPbzehYRCFQE0cULtg2d/zprM7JkbmyDw+isaL690Usf9RAIEqRl?=
 =?us-ascii?Q?H4W6KzoXM9RoP+JYw/6dnz2y7EAThMXBjTHyWfG45wMh+MAlX53B7+d1AF0K?=
 =?us-ascii?Q?fx7bxZjEqdU3t+//b+H/3a3NgB2+Z61+e0N9tDU7fHbxsMPARJRjYvpjxy6k?=
 =?us-ascii?Q?wVBal8ymtVg/O5+WkiKsiauq3f7hn/jQAh761Fd9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9217a00-e835-484e-55db-08daa2af7222
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:46:04.6206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NHrNQQgghpcv0mH4dABJm3+bKyEmygKXEMsNoypQfX7qP4K0HsRMOVJ2FtE9bFvCmFXwq6yFaYDznpV/kn1YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640
Cc: Chancel Liu <chancel.liu@nxp.com>
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

Add a string property to assign the rpmsg channel this sound card sits
on. This property can be omitted if there is only one sound card and it
sits on "rpmsg-audio-channel".

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index d370c98a62c7..e847611a85f7 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 description: |
   fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
-  are SAI, DMA controlled by Cortex M core. What we see from Linux
-  side is a device which provides audio service by rpmsg channel.
+  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
+  Linux side is a device which provides audio service by rpmsg channel.
+  We can create different sound cards which access different hardwares
+  such as SAI, MICFIL, .etc through building rpmsg channels between
+  Cortex-A and Cortex-M.
 
 properties:
   compatible:
@@ -85,6 +88,16 @@ properties:
       This is a boolean property. If present, the receiving function
       will be enabled.
 
+  fsl,rpmsg-channel-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      A string property to assign rpmsg channel this sound card sits on.
+      This property can be omitted if there is only one sound card and it sits
+      on "rpmsg-audio-channel".
+    enum:
+      - rpmsg-audio-channel
+      - rpmsg-micfil-channel
+
 required:
   - compatible
   - model
@@ -107,3 +120,22 @@ examples:
                  <&clk IMX8MN_AUDIO_PLL2_OUT>;
         clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
     };
+
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
+    rpmsg_micfil: audio-controller {
+        compatible = "fsl,imx8mm-rpmsg-audio";
+        model = "micfil-audio";
+        fsl,rpmsg-channel-name = "rpmsg-micfil-channel";
+        fsl,enable-lpa;
+        fsl,rpmsg-in;
+        clocks = <&clk IMX8MM_CLK_PDM_IPG>,
+                 <&clk IMX8MM_CLK_PDM_ROOT>,
+                 <&clk IMX8MM_CLK_SDMA3_ROOT>,
+                 <&clk IMX8MM_AUDIO_PLL1_OUT>,
+                 <&clk IMX8MM_AUDIO_PLL2_OUT>;
+        clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
+    };
+
+...
-- 
2.25.1

