Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189DC27C0FE
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 11:23:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6BB9188C;
	Tue, 29 Sep 2020 11:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6BB9188C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601371389;
	bh=EXRtnD85RLpz5LRv7TD27JC3sVJGaEwLUx1vdCVegqA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QD4Mm2BtSCac3SUN+dcaTxKj4yt0TM/tnxhRICwhigtkcRtbYDPUImM66vef+ax8V
	 p4DEKxjkZmmxT4hZRaFZxmpgiT6+dJi0OV8IbNBUg4KXiYghs9XEnP4Q/5RiCc61mn
	 Obrd5r4mmvRxUhO1l+DghJQBGPyYSz7l796QSeF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EF81F802E0;
	Tue, 29 Sep 2020 11:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5472F802C3; Tue, 29 Sep 2020 11:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDC4DF800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 11:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC4DF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="GWTbQV1t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJiJ34h3jA6T57+ao7s+FEqX8M775nOp+7IDw+uEapc5o2aKC3vG2QofpYaB90l2PfRWzS+4bgVjl8ugTeLJyHeGrCZDT8ZKfgS7g2ZYBIAj4QuF3LXqIcvXbg/vwzW6G1VYn4PQlEiP+8atJDnk/jIY7Hmeme4XQjZbiPM6iIqA1BOGomo/p3gilCSXEkxQx5gjQa4KJKpd0I3wiT5+rynpwPhcXKyaHrXVG2Y/hYdkFZ8cM405IKrLuoLMqiXqb4cUNY1wmZGt052bkWgiLZgy6qVw+rRL0P/SJ3NkxaRXZ8UMQXqerGmPU4Sm26oMUveMsz6iyi92aDxZizu6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNiJax0QLjM78wUbXKwzY6w1aZBNGq+Rsq4aqvMBrVE=;
 b=fQ1CL5MNPmss6rYAtc02nrkAXh3ZagQ9tW/MEifG6QvDhQgNXuQsC6JcXaKOrfpVksUQKdI71riSKxhHSzploj1uQO9W+IhKsXsw7m1d7DWebNhtYlj+zvNBcLc/zX52/mzgp3Hi9Bog8Xk72QGonBS2rAYFdcZSq+jsOBUV1imbvI7WZqTwKPNYMb4yPQgb8epyDRyNCgdTUP7NnjHEN9jEH7AVGwfw0DYUxxsNZS7+WPiwMR7i0UlMUiaFCdj/5dCaEPndkIrlDIpeqaHbx3o1FUZqYRoQfQrL65NSrIQeQf6W4qg6pbrfH89MGsuznwgrREiiVDcUirQp8EapWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNiJax0QLjM78wUbXKwzY6w1aZBNGq+Rsq4aqvMBrVE=;
 b=GWTbQV1twl75qQnIYDVwZV0XUZ637gEgIgto6biV8OIH6Pb7eWWiP/aGCDte4F73piqjk4IpxpZomAhW6m/NztAP9ZLqoer2HacJn0KUTmzACBu1OnaU0i1rsC1CLILdVdYvRikikI5cey6I4AA1iNuYXNeD0txWWv8osxQUgL8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB4078.eurprd04.prod.outlook.com
 (2603:10a6:803:4e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 09:19:59 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 09:19:59 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Date: Tue, 29 Sep 2020 12:19:27 +0300
Message-Id: <1601371167-32239-3-git-send-email-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601371167-32239-1-git-send-email-viorel.suman@oss.nxp.com>
References: <1601371167-32239-1-git-send-email-viorel.suman@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:208::42)
 To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-116.ea.freescale.net (83.217.231.2) by
 AM0PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:208::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3412.22 via Frontend Transport; Tue, 29 Sep 2020 09:19:57 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eac94021-844d-4d7d-6198-08d86458d69c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4078:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4078B640595F87BC916B6324D3320@VI1PR04MB4078.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R9dncesucQUk9t1yvA2KrPRdh705lxpDQDL5F+nb0ZUIxrlgshf+jWS7yFla6Y8x6x5lrp2HtxWWzk7dCtZXkYV9HUTPCwpFET39zqtD56NYp52m8wQ0lhnjGkXtu3kjMFWUujcAPLRikkaT411VKcHRLifnhAZmDuVhNMeZnm483yDTOcfA5eUWHScb2R1czpVh01xsnUfbj23ca4U9PldRLrmkUTtIDTFePE14fSWRLkQ5cb9ms2jXPVq2KOnusV9iuMLRUp4y+m3KQLHVueVNUxlPlggMFdJdLOWHUolaDc1cPqM8SNdlykYzZfG+qZfPDcaqi9F2qhwOAjXav/5dXZ4AJk/KtlRvrHmIwC8psbgXL8r5h9a1+Q+KOxygb67Bneczr8h+Yqmm1eRujlo/V9RndFqftUE+5GnBvj9JtwkCTCrQpmzMiOEHVy51AoTaGLmkkVHzR+1aRS8ynbc1oNBlCNBDe6IvJmh5E484PgwmHI7qKvH/IQbuVK59
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(66556008)(66476007)(186003)(66946007)(7416002)(26005)(2906002)(16526019)(6512007)(5660300002)(966005)(8676002)(6486002)(956004)(316002)(2616005)(86362001)(478600001)(54906003)(110136005)(6506007)(8936002)(83380400001)(52116002)(6666004)(4326008)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hFQ9/d/sYd62Skm3Y7WaF8RwOV/qEidt39xkCy/46QbMsgr2i6+qotCIqcPOqtPc9lQBeINcoKY8vBrZkS0GjfJGzX4jHcJK5Ce/3W0Fmp6FQOTAm7zTee1aUjJCRBIAOAl4uQjIf7SAm3V1zsyK0Z3tEP413lCvn4m1RWbTPonff+Aw/encrvEXlBGIf/Bm981ee7X7Vpg+/n2x+rGWL1+Qz2OiZG1D8Aiaf8Xn3XrYD9LLWmGjduQWyXfxH+N1KlXr5PSfs3zg2N225vtMeTyW4cdK7lI1+iEnpr5APPuWZ3TG3kQIEKabsn6gBdkLqRvoKFlKc7IRaIhE/Pr77u+qIrUKRCVzfMwaskiG/wyezgmRu3HoVDWsVkyDvO3NMMUX1eqJC8yjqsZM1Z6prnzowZvFF6xxV+4YzrumSGCCGxiqYQP+pEwuGjus4UoaZI/gd7d6w7PaB/vfIJTntHydlfrDRyXsar/l2U0of6kI5GPyS7DOm+1r7lPxdaojAjnqgYnxPcdLAj1I2lUawpsY/vfSW8H2phygTDSuQPuoVimmvi80Nw7l8AIOKtbS+RSYLaAs9cjZR61YRHfHMAhYCH837Y3x8mFVj+PV+kfvHqgf1Nt6WYSkgxE99RPGomAsetR44cc6rp3Io+ZS/Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac94021-844d-4d7d-6198-08d86458d69c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 09:19:59.5716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPjuqaknNhAj22TfvoCGFyNG04VErN1Vrg1ursgRPvSYbREQAUIfkeAKeSkCXQMaa8JPusBb0KefYDxZhJg2OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4078
Cc: Viorel Suman <viorel.suman@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
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

From: Viorel Suman <viorel.suman@nxp.com>

XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 .../devicetree/bindings/sound/fsl,xcvr.yaml        | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
new file mode 100644
index 00000000..8abab2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,xcvr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Audio Transceiver (XCVR) Controller
+
+maintainers:
+  - Viorel Suman <viorel.suman@nxp.com>
+
+properties:
+  $nodename:
+    pattern: "^xcvr@.*"
+
+  compatible:
+    const: fsl,imx8mp-xcvr
+
+  reg:
+    items:
+      - description: 20K RAM for code and data
+      - description: registers space
+      - description: RX FIFO address
+      - description: TX FIFO address
+
+  reg-names:
+    items:
+      - const: ram
+      - const: regs
+      - const: rxfifo
+      - const: txfifo
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: PHY clock
+      - description: SPBA clock
+      - description: PLL clock
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: phy
+      - const: spba
+      - const: pll_ipg
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: imx/xcvr/xcvr-imx8mp.bin
+    description: |
+      Should contain the name of the default firmware image
+      file located on the firmware search path
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - firmware-name
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/reset/imx8mp-reset.h>
+
+    xcvr: xcvr@30cc0000 {
+           compatible = "fsl,imx8mp-xcvr";
+           reg = <0x30cc0000 0x800>,
+                 <0x30cc0800 0x400>,
+                 <0x30cc0c00 0x080>,
+                 <0x30cc0e00 0x080>;
+           reg-names = "ram", "regs", "rxfifo", "txfifo";
+           interrupts = <0x0 128 IRQ_TYPE_LEVEL_HIGH>;
+           clocks = <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_IPG>,
+                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_PHY>,
+                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_SPBA2_ROOT>,
+                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_AUDPLL_ROOT>;
+           clock-names = "ipg", "phy", "spba", "pll_ipg";
+           dmas = <&sdma2 30 2 0>, <&sdma2 31 2 0>;
+           dma-names = "rx", "tx";
+           firmware-name = "imx/xcvr/xcvr-imx8mp.bin";
+           resets = <&audiomix_reset 0>;
+    };
-- 
2.7.4

