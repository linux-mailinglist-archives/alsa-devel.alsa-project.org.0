Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CBB17BB6D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 12:16:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DC1F820;
	Fri,  6 Mar 2020 12:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DC1F820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583493418;
	bh=RX4c8wwmhw1YO71SHmF3kO0jSWirJZQV6qAjPW7YDQs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDhHvxXQtTA/lHHrtr+sP/ositqwGCe6yUpWQLamPkD8uJVn9sUPak/XRbPywaUH/
	 cPcPdUMQcfiZ9d44zO8Dc4RxGJ6dByYvPUiBB9r/yGpvH4Mxe+M1rpm6SiGig98Y0h
	 RtpXQYkr0hQU4t5IV1ezEwlm7N4yJqDnYvwIVFYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 043A3F8028B;
	Fri,  6 Mar 2020 12:14:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C181F80229; Fri,  6 Mar 2020 12:14:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70082.outbound.protection.outlook.com [40.107.7.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 360F6F80126;
 Fri,  6 Mar 2020 12:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 360F6F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="gj5gjLuS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP9xKJeJpeaPijZ+GxjOmwi0d6jt35BVp5riCXIS6ccZTSBXIxAKlAkFy5pOfpcEwC/wqtDXzevRG/rYEBFQi1tE9tRUCBZRxw/qE/BIHzxuDiEC8Tu0vuRWuU5n3EqoP2VtoFClnEjuc9sqGrHPyuY0Qy++7kPfB2FDHd+PqTWuRYcRlzX63VAAqLV4nZk+YXlh9jRkkYyuNO6bRQ+Hb2tr7i2cUhujI8/TjN0FJACtmUbtI/SFvQW6BEkd68lelZ5GnT8dDVYq/25grxRwOyWpqfQcLpBBAWfowdS07NOoBME70aoavFp9YLt/eR7QHfmppG5otQ4KYZB1BnvVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8+3V7iMb9OSo4m3pJoUvP5KFzRWC6DXF4HZJ4qbBHA=;
 b=HVw2fKj+l+qt84HG6yBP5OP06IpJnY8q0FZHYLI7KkHFVWZtM4Eik8PadEze6VS/l7iZeWybxfPTCrRYmzc9W9QKpnShXePbpw3PRgT0lH8/WmsYRcDpDqUTzjnejiMnhjsT5Cua/1bbY+tlIvEBfIRTBg33GLhm3nynFLN64amG+LRWjckMgjeka4xhpyHBPaMGLvAXdSJhMnlSaXkUxo+njMseyYw2FiDGgshmiUmEjommVw9XipAW6wGTLmFB05ZX1P+snKZXoWZhYoSyLoAFbOIHePBcy8biudW3cOKSpfYVJ65xADj+hyhYGSruoFz2fl0x95lwCnpOge0wDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8+3V7iMb9OSo4m3pJoUvP5KFzRWC6DXF4HZJ4qbBHA=;
 b=gj5gjLuSaoESZCKbc0hRG94+lepFoujMOq+L1KxJfCn9sJxE0wGlBRzO4hMV48zmXxI9y6Jqt95FKpt8IEevtB/OH0K6TL69tP2gWKp6hvoS6YDKhG7wCKhhqIFDlrSKi9x4AQ/Z2UpSFHXqy192MPRwmLAVNyl0hKqy79rWnj0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB2830.eurprd04.prod.outlook.com (10.175.21.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Fri, 6 Mar 2020 11:14:19 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0%7]) with mapi id 15.20.2793.013; Fri, 6 Mar 2020
 11:14:19 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, peter.ujfalusi@ti.com,
 broonie@kernel.org, linux-imx@nxp.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: sound: Add FSL CPU DAI bindings
Date: Fri,  6 Mar 2020 13:13:52 +0200
Message-Id: <20200306111353.12906-2-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306111353.12906-1-daniel.baluta@oss.nxp.com>
References: <20200306111353.12906-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0039.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::16) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM0PR02CA0039.eurprd02.prod.outlook.com (2603:10a6:208:d2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Fri, 6 Mar 2020 11:14:18 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d1209482-6846-43ce-475a-08d7c1bf83dd
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2830:|VI1PR0402MB2830:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2830A4EB8E77E654D9589665B8E30@VI1PR0402MB2830.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(966005)(26005)(44832011)(6506007)(7416002)(186003)(956004)(16526019)(8936002)(81156014)(66946007)(66476007)(6486002)(2616005)(316002)(2906002)(81166006)(8676002)(66556008)(478600001)(5660300002)(6512007)(4326008)(6666004)(1076003)(86362001)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2830;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M9oh7IkDmWw8kg3YdgBojOdA5B3/kDsuXZKYBdV/Qsz4kt1dj4FbabewQ7mxSZh4io3FVaI1YXSLqu2JLTh1TbLjLeWEhFXf2fiBixtZkh2ExioRR8FxD/Z3u5CFrkqVTLB8EYEcpmadsUzfLk3jBLCT+T9SKCuGcHSFYH8Hl2Fw1cCCz0F3trocy1flHkF2pl4UWJ4kki4U6nBHojIZ9wmctNrpgRIz6dWPF0vr8tMtK9qmtQiUb3U93+OllbDWQ7KOQhmZUVeZuJXwUoghND+ozUMlQ3gJjvrzWKtWsu7WGbLRB2y/Phu9F3xTAnSdVZnLCETM101bk+wMjr0GH8OTqURtXGPWxPVPDlPkZ6gHkpyyl5ABWjqLjL9BAlLicQeYhBVHwfW8nMWpkmbbhk1wYD3/e0l+bhw27f479knK3/IWz2wYEZHwyVFhPmysrK1M5kxKTUNtmOIhnizsxNs6Az5HYnui0ynLMSAkXuQcBGHv71jsAcxYF4le0d0IJld4BApsnQ2kjPwF9YHnew==
X-MS-Exchange-AntiSpam-MessageData: +2vMXuXUsmQgEcOwFRD98bpqLKHmrMtsben155sq6/YjzMLjtFZ9U26YnONBJuGVCp0NeTFv2p4uZnviCoH2O00cpS6dXm/7PB7zo3dTxImxr2u8zqPzvrPvQbc2hmt6Kg7UproMUzvgvV80NbQP/Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1209482-6846-43ce-475a-08d7c1bf83dd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 11:14:19.4244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVZXx/a+Ez6OOysUBGwjxU48Cn3GgwRdQC8P3SzKptnss5gBAFStrxm7PDBLrusBwHzlDrkSLRommNgiuHY35A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2830
Cc: Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, shengjiu.wang@nxp.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

From: Daniel Baluta <daniel.baluta@nxp.com>

Add dt bindings for he Generic FSL CPU DAI.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../devicetree/bindings/sound/fsl,dai.yaml    | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,dai.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,dai.yaml b/Documentation/devicetree/bindings/sound/fsl,dai.yaml
new file mode 100644
index 000000000000..e6426af67d30
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,dai.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,dai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic CPU FSL DAI driver for resource management
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+description: |
+  On platforms with a DSP we need to split the resource handling between
+  Application Processor (AP) and DSP. On platforms where the DSP doesn't
+  have an easy access to resources, the AP will take care of
+  configuring them. Resources handled by this generic driver are: clocks,
+  power domains, pinctrl.
+
+properties:
+  '#sound-dai-cells':
+    const: 0
+
+  compatible:
+    enum:
+      - fsl,esai-dai
+      - fsl,sai-dai
+
+  clocks:
+    oneOf:
+      - items: # for ESAI
+          - description: Core clock used to access registers.
+          - description: ESAI baud clock for ESAI controller used to derive
+                         HCK, SCK and FS.
+          - description: The system clock derived from ahb clock used to derive
+                         HCK, SCK and FS.
+          - description: SPBA clock is required when ESAI is placed as a bus
+                         slave of the SP Bus and when two or more bus masters
+                         (CPU, DMA or DSP) try to access it. This property is
+                         optional depending on SoC design.
+      - items: # for SAI
+          - description: Bus clock for accessing registers
+          - description: Master clock 0 for providing bit clock and frame clock
+          - description: Master clock 1 for providing bit clock and frame clock
+          - description: Master clock 2 for providing bit clock and frame clock
+          - description: Master clock 3 for providing bit clock and frame clock
+
+  clock-names:
+    oneOf:
+      - items: # for ESAI
+          - const: core
+          - const: extal
+          - const: fsys
+          - const: spba
+      - items: # for SAI
+          - const: bus
+          - const: mclk0
+          - const: mclk1
+          - const: mclk2
+          - const: mclk3
+
+  pinctrl-0:
+    description: Should specify pin control groups used for this controller.
+
+  pinctrl-names:
+    const: default
+
+  power-domains:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    description:
+      List of phandles and PM domain specifiers, as defined by bindings of the
+      PM domain provider.
+
+  fsl,dai-index:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: Physical DAI index, must match the index from topology file
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - fsl,dai-index
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-clock.h>
+    esai0_port: esai-port {
+         #sound-dai-cells = <0>;
+        compatible = "fsl,esai-dai";
+
+        fsl,dai-index = <0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_esai0>;
+
+        clocks = <&esai0_lpcg 1>, <&esai0_lpcg 0>,  <&esai0_lpcg 1>,
+            <&clk_dummy>;
+        clock-names = "core", "extal", "fsys", "spba";
+    };
-- 
2.17.1

