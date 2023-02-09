Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D168FC9D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 02:23:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD7982A;
	Thu,  9 Feb 2023 02:22:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD7982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675905802;
	bh=qUG1WkfO8Um2d7HbhdSM4/3TgcuHOaz+3QiTo0YsX0c=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i4NLq5leyeelme/wXcOcWGBOavCCjuClJtQtO84oPYMSa10/U2nQC88qEm+alDxM0
	 8glr9PsOuGzWNp49tcuptFK1dbd1aUAv9aKsKbItIapfWaMwNfq1+gAFOpvZvjiTxE
	 eIfVWdigVlybBHG2W0RUxQ4dBTUQO5AxuKq+La8k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55143F8051F;
	Thu,  9 Feb 2023 02:22:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEE6AF80525; Thu,  9 Feb 2023 02:22:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6E0FF8018A
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 02:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E0FF8018A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=a5nlfZQz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMRNDLmCtSagWwduOPTdrzbuR6GbITS1RwMa5rXn3m6wKWi0U42/qSEz4JUEiM8Cre+0zTwUmKftQpGkJ+kzk5VyrXCHw28HgTFYfGZae2zZbKX1RsOTMJ8Ym8unc4OgTTx5FrHhxqYb+VRvvXkpnBk5dk4EU+5jXTtOT8rhnmW6+dpfm4xtJBQsdL/Dvqj7n6UwkUB+Zs7ZeoH5ypoBMoEcB+ojutR4v3B+/N22TgIQvNiXtyeVt/DnO8nLTl2LHNgKdr7EZOO7eiuQtwnRHnRKw1zqafT/t+4jAJ3RAvelgK9pJzDM4xaz8NEKOZwc5fiz3gfyGECa3SiiiFBirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrSo8udG+2kn7OfJLipWP66csy+elDjv8prh87shQxQ=;
 b=NqrYCva5ObmPtcsQNzVINdBGphJGpbE3r/tsqY7dfhIGP0YaMfF5Sb/JeLcMib603RcmpNEl4McTv8UzvvTx51MvcFKMCeLReuEDpdWxw1gU4YTuqwZgdhFBeQnMYU8K2e5z98v2/tfaJNHgcgNmzFDXW8CGp2TL4qT8OAqDS9Ot96i+//p9Bx/jRvJPTZsG6m5rY/RwB64hpSixaOtQSSbfOi5CnRMNLEfzbLXksmy3FvL0CDuTFh7RXY4vH13tCPveSKB/kBezBt22ZoIF5B2uBL49EHYfoLVubagkJ0E+eFWHOHx7RFPHsbpraIhzebnRRbKhsMwBheBCXpop5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrSo8udG+2kn7OfJLipWP66csy+elDjv8prh87shQxQ=;
 b=a5nlfZQzfnsvDoCW1HqRGfY7TvxvLu7bFxM3Vx2c9TawXt/BXm3FGHRtNYd4V/xFPrKRgPerK2ko3YYvwCMFnfLi8akO487ZLSGp6h63LBbX0GsFiGSj2sCDwvKHH9gdoiiE6FzNrtHnU3COkbGpIruvJxa//Yeib4VzQIi+ja4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10476.jpnprd01.prod.outlook.com (2603:1096:400:304::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Thu, 9 Feb
 2023 01:22:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6086.018; Thu, 9 Feb 2023
 01:22:00 +0000
Message-ID: <87v8kbbpl4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car Gen4
 support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Feb 2023 01:22:00 +0000
X-ClientProxiedBy: TYCPR01CA0024.jpnprd01.prod.outlook.com (2603:1096:405::36)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10476:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f19f85-59ff-4b53-c407-08db0a3c0aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EH9/P/RzYDZD3VdUp9tOI+mCROtsO1UARfN0pY7P3rgwNxZ8JSjp+M5cobbYId8FRuT9sAUrRufa5zwHR2zj3Mfz7+6OV7EwSW6kKzI48IohH7S2++gEDzcpzCiHyCRHqSgXpysPPHnjhYD9724YwRfT/PbGMEO3JuILgMZY2asVs/NWMDljhwxl6QRkyrxQS+YJcL7Iy1H+9z2Y8aVc5g/ine2VVubgMBeeJiqgf3+uafaQCVIqsyMgbBav5pV4Kqi3aa/FYqiaZajycnM59GqkQV8i9F0fGXBrmzrNQq06WqYN2pbM2t5hdmlNXhywjSOtS+ZIEWd9s7KgCpltm5dsEAtRXFvtnqpWw2pbHOlhG1MSZ4VEIHTkfSmHudUzmxTRpv+x57jsnOrQ+TZQoplNGlYMpTZhZm4r2CiDjeYXnd9sHhwpvSmOXIuZ55OkE6jrlwavVUtNkL2gGyDnaIOEso//ZmH6u9VYfOHSga053NFlZdmTNrgvBiiUISNt8WBWBsO4u5FdwdoMDJgCg89Umjkq9ArCezCrCo7ruwXFcLWZb8e0gH+R0HEM/S6kexjQn+a+S79zQbaTLUsER27vZ3A/r7Rtpj1EcticXMq2jsm0G36BDxlHMbe8jJYgmGc89tzn2iBufd/wmQpYFkWx4wUOkrcsy6//lKcN1tC3joKiQ+m2uzSjEmql2OwoLdL4Ld4Tx0fwZcQ2qwjiQBME2TKGly+UZfIKFfyX65/bcJiRQuvjs/q8a9SCPj+r+KNzHc4Qg0q9QCeIR/Xf1A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199018)(2906002)(36756003)(8936002)(5660300002)(41300700001)(83380400001)(2616005)(66476007)(66556008)(66946007)(4326008)(316002)(38100700002)(6512007)(86362001)(110136005)(186003)(6506007)(54906003)(478600001)(26005)(6486002)(52116002)(966005)(8676002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ErkLDDFa5PcfKOa4OzcbHm9t7AegWtNRzMzTRGciPLR0osJ1FZ27dRjE9NAL?=
 =?us-ascii?Q?3iAQ7v3hwDsnVFoUOd/D3jvPcW/wX0XTh9fm098M4GTes5dISa9g1Wd74ND1?=
 =?us-ascii?Q?ueFQKmdLDCHlJWJrxLWqn7cm+fBm52dUPfppzXJfKoARCgHn0X8mhi9ngnOq?=
 =?us-ascii?Q?H57vhSNb2BlkNKrlhvDgygBAYPIYPzvmyam097rJ2+zwAenSQ3hQtjPBb6mj?=
 =?us-ascii?Q?Uu6nGKdx2Ywtqr03JYvKL9qP5HF81f9Kktoy0mZXg0ppp96h7c+kBCR6Dph7?=
 =?us-ascii?Q?vv6rlx8HrjGDiMtBBZc8YloLFX9tM0j4Io0KKnWjR2vAy3OKhHFooyU4Kmj/?=
 =?us-ascii?Q?6YD5B0BP2jfQgdoDh4O7rALDb7z7O+Qab0Fku1ERdQDa2ZArF3ELGiMregri?=
 =?us-ascii?Q?rSd3zwJpvyDC2yICvnO4msP8mOwmf9NkFH+9FwyY4KwqaePqdnbE2T8G6lp4?=
 =?us-ascii?Q?pevLM5/4N3KCyQF2i5Yd9R4ChgfPdY9fmq3lPn+ud0015FkL9NohN+DFyyX0?=
 =?us-ascii?Q?kqxGGlQVLA+enFuDaZBliOn6iTiouTCZR9F41GhGRxABcvF3hDbDUP4+qWkQ?=
 =?us-ascii?Q?DJf7MOkvVLPzfIn2N2o2eRwHoPlOjg7FNNTMHPwwRV07i6iq2YC/FOspFXog?=
 =?us-ascii?Q?prERTezSIeuMEHa3j1a6RKp1rHXYO/ioU0H5Cx03hMTnX8RVbvpOhGpE4Ofx?=
 =?us-ascii?Q?eXcHeCVWIzybSrFnurWeg/Ltf4pWXUmEgr7v0tzpDevo2EAKT0WCwjuc8Rx6?=
 =?us-ascii?Q?AEf3Tw85XSHJWQTFDQk/mpXZFTMuUI//WxSANtuRZE/xSS5lgwtZu2pALPDY?=
 =?us-ascii?Q?rF+I1xvu+DTZ1DljEvNG+/57ADQNvfUWff1mFZvWnbyxtZysKlc5rpjuWFmQ?=
 =?us-ascii?Q?GDZ0HcvXInonu+5gFwfPn2kJa3FheipJzxVd9hQAvlPtLmKK1p9ZI4ykOZBM?=
 =?us-ascii?Q?hF/v4BGFP4/XsSqXgNhkHQHIAHCAzYUeL2GILttfo22gPyPwxl3rX0SzXKSa?=
 =?us-ascii?Q?JYFznpL163NkrY8XdHnTlky+gYnkPMq5FDJvMk76+ohOd1vGjZJoP7QxDAzf?=
 =?us-ascii?Q?x9DT9zRb9vS8mfB1SnRuDrJypFvWrONxK6gjyMWNmeXhEs3TsaCUvqu4rWal?=
 =?us-ascii?Q?kk52i36L65PyRwLuKoQ/bbGeYAvgRe8a8IAD543HfSh96v5jKxQub6UP4082?=
 =?us-ascii?Q?WlZKKByqB2T2/KAaeG4Lox3JlALQTcNZx9i1sDu+RDK/a3mfJXwFIDIV60GT?=
 =?us-ascii?Q?yvsMkzalljpeSWsyeMTBPp7j9wxWYAyEAmZ2I8TWOTPPb05AWbfHZdUyx3BJ?=
 =?us-ascii?Q?WFDGyOCNG6lD5mfjdrz1o0g51pJTMEkRbbhCGNkqHx6vsx7oJW8yVd4SkYI7?=
 =?us-ascii?Q?pexY0PPOvaFUYHvvpwDBhXaswOfSaoHVbGUs18gGjlBTLiymGJtK9uinalwR?=
 =?us-ascii?Q?68iloi2BLUqkz18U10vHidj/lExCG1a4xeZvv4MjQQddPYhpiT/bmdW0+7hv?=
 =?us-ascii?Q?lIZ4OwE/Ht/qsOecMa0suHJs6aC4ynXWL8cwyh7ABc5CtgYzeFxFhxn4il8C?=
 =?us-ascii?Q?hwAt8djzHlBLEs12k6+oK0wKDm1dFM4MkmtE+BGpkZjNqZBwGCA5FHf9skBj?=
 =?us-ascii?Q?Nqjl9vrs40WOhXDcDpwHxU0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d3f19f85-59ff-4b53-c407-08db0a3c0aff
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 01:22:00.7062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 41RsnXQZg74bboMCh3qBFzeHo0zsUjXciFEIw8NDirXygV1V0kuxCvXqeZXAe1Hat+/6wFJO5pFTst0lbXtSeJxbiwlRzHGRpSrrzQM3JF2qTZsiKRh8ZJDxWRK8+Qs/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10476
Message-ID-Hash: JDF2NZRK7TUFZKRIWZFQABLWBIVXT6TI
X-Message-ID-Hash: JDF2NZRK7TUFZKRIWZFQABLWBIVXT6TI
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDF2NZRK7TUFZKRIWZFQABLWBIVXT6TI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

There are no compatible for "reg/reg-names" and "clock-name"
between previous R-Car series and R-Car Gen4.

"reg/reg-names" needs 3 categorize (for Gen1, for Gen2/Gen3, for Gen4),
therefore, use 3 if-then to avoid nested if-then-else.

Move "clock-name" property to under allOf to use if-then-else.

Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/renesas,rsnd.yaml          | 80 +++++++++++++++----
 1 file changed, 65 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 12ccf29338d9..5fd6435f4873 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -99,20 +99,6 @@ properties:
     minItems: 1
     maxItems: 31
 
-  clock-names:
-    description: List of necessary clock names.
-    minItems: 1
-    maxItems: 31
-    items:
-      oneOf:
-        - const: ssi-all
-        - pattern: '^ssi\.[0-9]$'
-        - pattern: '^src\.[0-9]$'
-        - pattern: '^mix\.[0-1]$'
-        - pattern: '^ctu\.[0-1]$'
-        - pattern: '^dvc\.[0-1]$'
-        - pattern: '^clk_(a|b|c|i)$'
-
   ports:
     $ref: audio-graph-port.yaml#/definitions/port-base
     unevaluatedProperties: false
@@ -288,6 +274,11 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+
+  #--------------------
+  # reg/reg-names
+  #--------------------
+  # for Gen1
   - if:
       properties:
         compatible:
@@ -303,7 +294,15 @@ allOf:
               - scu
               - ssi
               - adg
-    else:
+  # for Gen2/Gen3
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar_sound-gen2
+              - renesas,rcar_sound-gen3
+    then:
       properties:
         reg:
           minItems: 5
@@ -315,6 +314,57 @@ allOf:
               - ssiu
               - ssi
               - audmapp
+  # for Gen4
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rcar_sound-gen4
+    then:
+      properties:
+        reg:
+          maxItems: 4
+        reg-names:
+          items:
+            enum:
+              - adg
+              - ssiu
+              - ssi
+              - sdmc
+
+  #--------------------
+  # clock-names
+  #--------------------
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rcar_sound-gen4
+    then:
+      properties:
+        clock-names:
+          description: List of necessary clock names.
+          maxItems: 3
+          items:
+            enum:
+              - ssi.0
+              - ssiu.0
+              - clkin
+    else:
+      properties:
+        clock-names:
+          description: List of necessary clock names.
+          minItems: 1
+          maxItems: 31
+          items:
+            oneOf:
+              - const: ssi-all
+              - pattern: '^ssi\.[0-9]$'
+              - pattern: '^src\.[0-9]$'
+              - pattern: '^mix\.[0-1]$'
+              - pattern: '^ctu\.[0-1]$'
+              - pattern: '^dvc\.[0-1]$'
+              - pattern: '^clk_(a|b|c|i)$'
 
 unevaluatedProperties: false
 
-- 
2.25.1

