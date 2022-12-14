Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70964C1D2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 02:24:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5BAC18D8;
	Wed, 14 Dec 2022 02:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5BAC18D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670981092;
	bh=7JSjEu285DxeL8jEB+//lgLw0/8gVz+dH7jMs/BkiYs=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QDmhf4wnBbHhTrO4AXvpurMZ88ooPchFi/hn0MXub2zQ8DJkl/7TVtz/tZKwEqqTC
	 +Vg8Pw4u/7U/MnC1BrlxZvxzsL3lj5EyF6+sEWyRhWn5KUdZg7dI7dgWI/IVuXBj1k
	 WjISeu1HmRF5H41urnCxWw39jB/z3vIopj2+g4J8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C1DAF804D6;
	Wed, 14 Dec 2022 02:23:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A83F4F804E2; Wed, 14 Dec 2022 02:23:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACE54F80537
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 02:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACE54F80537
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OuSfASQZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBsRhd9/hkuvywviP/Cvvl5eRKJgJO0NVV6fActB9CQKhahkx+/KyT/OZBp3jakx4bN0OwQUxjIz4w8pxKG5ucd/Y4S5Q7YtWgwzmo/cilOUiIhGgXBCXr4xPKJrSny6ad4ZxRcTExUvGgRcx0Ey04L29LfPYU5+MAP3SpWQn7XlyoFtjrDBCBXfso2HzaysVVBXqAQ7WgGrLcYYQ0fXVbf3iWoDpna+r8rRstjVp/mI20JjA4d6trM6LviR96GC4/UJUiQH+53ACFHgBf+sWmquS47ffhC/gEBYQDrkPP0Zv+V/XxJHZjpPuIpKPAnu/037l/G3PINM0k2E24mB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBrBD0c0L6UAQpfaXMg2aSYGMpAahGqn+zB/Tscfu7g=;
 b=ZYq7BurWWW4iUAKWC5KN+TZeUZ503yZ3olbydmQ0JpC+4NijsSEGPdxuR5aPPomUYoGOO5Nst2bccwtKhdMxwZ9KmMDOVkeV3Wo6BFTd+Z0Qu8k5b/50e5wpCuDq5hsWkNV0L6WEJ5litSE8szvu4MddTP2NOxpVYSjoYZ4uotffLs8H6eESpa9V9XqB5nrs4NQ9jVDOYDAxJZcU/Akr8fm0jps5NqbkAv0zAbM+qiehT/10MUHvo0RbKx+nE6zGzxswRcc8hPSTn6CBD/SWQSBlguEj2fwjfwofYJUhVkM596jifrLwFjn6kBV/wvXe9/BGNsKoKtZUBGgVet4EQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBrBD0c0L6UAQpfaXMg2aSYGMpAahGqn+zB/Tscfu7g=;
 b=OuSfASQZngXOT6Efw2UtsmR1qr+s1+sdM6fWYxmABUQQcoguJqg2f4T5M3Rcey2Yj7qXPLDBwHMx6hRT9P5ZCpY0RJ4e/pSvkZJi/p5iH5AQZO4jcKCJooKapWHtROKLkdOgG5EMuuPiJohi5t/v+TEok4wdD0SoS0g+HRORcE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9887.jpnprd01.prod.outlook.com (2603:1096:400:237::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 01:23:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:23:34 +0000
Message-ID: <87lenapyll.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/11] ASoC: dt-bindings: nvidia: use audio-graph-port.yaml
 ports
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Dec 2022 01:23:34 +0000
X-ClientProxiedBy: TYAPR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:404:14::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9887:EE_
X-MS-Office365-Filtering-Correlation-Id: 1439c89e-dcf5-4430-cdad-08dadd71d1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kFmCucAOTM6c3fWuHL2pq6ukc/sNlGKRQBV2AYIQO4psmv6+Bo68I+Wq2xMpe398YRazf6yirJw4zyo2PqtXMdVOfUH7zuOLkFmgiUCkFylZe/o/sF88GVKivE2mQjDJDYwU7kaYh6/6X65BW8stA9lZ2lBWcHLa4ZEooaCF6IpIrdRj/AG8445mQeNJVorYyZQCwUGC3FnlgSOjT3WjzWGlIQeqEQnJR//WK0Cjs9g1RNNhptHs5M2++V1Be+08/RIQLBeBhxvvWh9J7T2BFgMP3dOWtiHTE1e4OAGSVVLfc28imIQ/zujTFXMJhVsnMcvP17PhHZ5QCMMzS6d8OuGSMnS+dcJ4SArOo85bDmXhdwy87UMO/JLsPr5zseFlyef3wbPeWdIWUqwAJRxZDSWICaodVcRbo3F4UpRaQt43TXS/YhzjDw+v3nZjZAGrVmnL0Z8MguvzHECU8od6vwhS4Qm0MJ/4Oaqny3/xCgf5etW5qvCzfpIxHQR/pYG55hk2WdQX+072IJCRoWryGIta7HJ3HRJ2Ds0SwXCFew4acUenVRppTdXIDXbhSv5YoCfjIXyGmrhTcWjALMGr7UnKEarArkHT2Pr+C5CfqLPXDGv5Pe1mOhmXpW6CJ1zOhRtRNLJ+C94Fg9N1ENjKvFCqiofypN4kNeC7Ctq5perBP17zjoHXn8i2Xt7caq692fXKXrvpqqlyf65rl7oXnD8aCZvg2sFttXKGv/6iDw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(6506007)(83380400001)(41300700001)(478600001)(6486002)(2616005)(8676002)(66556008)(36756003)(4326008)(66476007)(66946007)(38350700002)(86362001)(38100700002)(2906002)(52116002)(26005)(6512007)(186003)(5660300002)(54906003)(110136005)(7416002)(316002)(8936002)(30864003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wUxr8lpwQnpmfBemIPj3kmeeRSomiaWG6Nt3SkvUxcFeDyMb69I/lmskhRYp?=
 =?us-ascii?Q?+e31gVlBWSS1mQ5dVbsCpHMuubVXy/qWQiS7UOadOr/mKO/DJVp6ud3XEuK/?=
 =?us-ascii?Q?VQkwzvOXTWtVizv/vBJ1nOMkjtZDvVTldJ5KevDRnH+jNuobQ1s7h7KCYIda?=
 =?us-ascii?Q?L9aO1KM2TdDE2dljtElQ0TNK5duGynOJ7M6UJeAzbZKLaWxHECqDW1Ribfe/?=
 =?us-ascii?Q?qxFy/tHEUfs4LN8UoSia4p6MgUnH3iU3WB+Gt/2xC4GqHZmz2vY4SdGffD9q?=
 =?us-ascii?Q?c1/7OqP+NX5TGudkkAQI1E7MZbdQOKhXk7QkSCau0rwnny9VkNhIGx5d2FWU?=
 =?us-ascii?Q?8q/Ej2r4PfEq7GhQHhB610xW0jN3KgfeaEo6V4MtpZqv90ijMYj1njIKWzmz?=
 =?us-ascii?Q?FuR2BIEoypQW5fz2EGx3jytVQsmpbWwOiqwP9rj8c0PowW0Yrv0ll/6VxL0x?=
 =?us-ascii?Q?G0NlMvlVoKzHQ6PNoHXf3vetW7KY2Q4ps6CFjV3E01gJK1aeRaNYfuVa/jtg?=
 =?us-ascii?Q?iR25Z3aKxmkfBnOxOYwYaZv5e8Uoo/E7M81hTmyS5gquKZFxwcIRrYWBVY4W?=
 =?us-ascii?Q?27Ur4w2EN1Xfe17N0rRwfoKjvIqIzSVmK4MkqdDWlTI8CdtMgPGwaxwes7Mr?=
 =?us-ascii?Q?0da7bRlHaW5TQ13Os+LN9gFbBweaK6r3Z8uI44xgfzynfpso1a2iVE3hXLsQ?=
 =?us-ascii?Q?3PlNiF+ii4pvuQEePPYfZ3nZ6cnbhuTurfDk24DIZHK7BA49Z66uA+ztmda8?=
 =?us-ascii?Q?WqbLrtDBTLCOyjUWNhCZXphivrO++BSP5ibtGMMk4wYCJ9WkVjKyuNA46nvi?=
 =?us-ascii?Q?FYcSkAG2BERfxYKf3IeUQrGUTK0BUNeUf6ai6JSBYsN34qAkHzOrLEPNYkN7?=
 =?us-ascii?Q?6PUG2zhO7+oluoUsV0JzZHtMJFLuvWftWHGF6W/SA+6aSq+FHZfo0cJDYfH3?=
 =?us-ascii?Q?DM0L+bNLXXi5cRuoaDVwrgA0W0bfTuF3WCOqYTa6X9LbFcVUgSgUJnCV2W8x?=
 =?us-ascii?Q?di4dPxXWC7Vs8nxNZDkBFAGzHgnKh/OPHT9Sz4jBgQA/SjA2gGCaudC/Hei1?=
 =?us-ascii?Q?s+OpIAYPBqqEN+/t3aPNNKuZKnRhATS1WRLFx0wWH+0BwdSIypwY+I0UzzeW?=
 =?us-ascii?Q?8pF2o8AHWd33rmGn52XtN+8ofhRg8LVeJ98WrQuPxo2bL/R1RitOkyuRjXJA?=
 =?us-ascii?Q?yK+0Z9AoDFaSv/h9ZH4TPUjO79gA1AKRaFiiDClVN1JFR7R/udh95hGI88tj?=
 =?us-ascii?Q?kWoiqO0XI1x6hSyoe0wNommEjPHynyM+2No/xg/g4emu2NitLZGZK5pPe5Y7?=
 =?us-ascii?Q?htYmsChdN6zWbRyeTHSEkOYYrrYnBghs1RQQ5NAXeVHVtk/ZrSljuRUgaj9i?=
 =?us-ascii?Q?hsDjhfauyJgcmoU9mUXYjLrsCrhacTXtQAQ9h7bTUfiAFpozFC6312KTUDSE?=
 =?us-ascii?Q?Mj/1h85o2fZJm/YK37Ep1sCAes7+VdTBiksHzLQkCkusq1lh9oOco1q51+cQ?=
 =?us-ascii?Q?aFSBH36aOk0sl2kFfWtN1AjyzgE/WmO2WpMr+E96E2q5njfoHgtWxj6CuyqR?=
 =?us-ascii?Q?nevvg+wufeGvLKX6HMs1LiEc//qdPizSob4tXbYVsOejt+S2qBScHHQkro8W?=
 =?us-ascii?Q?DVkTvY2oj9ky5YV6p4nCzIw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1439c89e-dcf5-4430-cdad-08dadd71d1d1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:23:34.8670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bf53CZTyFT12Y3KSH8Lf4ktZ1UBQW0UnNrmQM9Zzb4OCakLjKVZm7KQGicNdnSkvqQiiko/+ckf2KvZjsMJzeKzCBUTDh0rmolMy4vgc9KVpbyh+Ub8gTOETIxWAXP1O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9887
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

nvidia,xxx.yaml is using original ports schemas, but we can now
use audio-graph-port.yaml#/definitions/ports[-base] for it.
This patch switch to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/nvidia,tegra186-asrc.yaml  | 14 +++----------
 .../bindings/sound/nvidia,tegra186-dspk.yaml  | 21 ++++++-------------
 .../sound/nvidia,tegra210-admaif.yaml         |  7 +------
 .../bindings/sound/nvidia,tegra210-adx.yaml   | 14 +++----------
 .../bindings/sound/nvidia,tegra210-ahub.yaml  |  7 +------
 .../bindings/sound/nvidia,tegra210-amx.yaml   | 16 +++-----------
 .../bindings/sound/nvidia,tegra210-dmic.yaml  | 21 ++++++-------------
 .../bindings/sound/nvidia,tegra210-i2s.yaml   | 21 ++++++-------------
 .../bindings/sound/nvidia,tegra210-mixer.yaml | 14 +++----------
 .../bindings/sound/nvidia,tegra210-mvc.yaml   | 21 ++++++-------------
 .../bindings/sound/nvidia,tegra210-ope.yaml   | 21 ++++++-------------
 .../bindings/sound/nvidia,tegra210-sfc.yaml   | 21 ++++++-------------
 12 files changed, 50 insertions(+), 148 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
index d82415c21271..7ab8dd2fc813 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
@@ -45,23 +45,15 @@ properties:
     pattern: "^ASRC[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
+    $ref: audio-graph-port.yaml#/definitions/ports
     description: |
       ASRC has seven input ports and six output ports. Accordingly ACIF
       (Audio Client Interfaces) port nodes are defined to represent the
       ASRC inputs (port 0 to 6) and outputs (port 7 to 12). These are
       connected to corresponding ports on AHUB (Audio Hub). Additional
       input (port 6) is for receiving ratio information from estimator.
-
-    patternProperties:
-      '^port@[0-6]':
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: ASRC ACIF input ports
-      '^port@[7-9]|1[1-2]':
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: ASRC ACIF output ports
+      port@[0-6]  are ASRC ACIF input  ports
+      port@[7-12] are ASRC ACIF output ports
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index 3d538df878ea..6cfd36bf21e8 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -55,21 +55,12 @@ properties:
     pattern: "^DSPK[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    properties:
-      port@0:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          DSPK ACIF (Audio Client Interface) port connected to the
-          corresponding AHUB (Audio Hub) ACIF port.
-
-      port@1:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          DSPK DAP (Digital Audio Port) interface which can be connected
-          to external audio codec for playback.
+    $ref: audio-graph-port.yaml#/definitions/ports
+    description: |
+      port@0 is DSPK ACIF (Audio Client Interface) port connected to the
+      corresponding AHUB (Audio Hub) ACIF port.
+      port@1 is DSPK DAP (Digital Audio Port) interface which can be connected
+      to external audio codec for playback.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index 15ab40aeab1e..82141af47dce 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -40,7 +40,7 @@ properties:
   dma-names: true
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
+    $ref: audio-graph-port.yaml#/definitions/ports
     description: |
       Contains list of ACIF (Audio CIF) port nodes for ADMAIF channels.
       The number of port nodes depends on the number of ADMAIF channels
@@ -48,11 +48,6 @@ properties:
       in AHUB (Audio Hub). Each port is capable of data transfers in
       both directions.
 
-    patternProperties:
-      '^port@[0-9]':
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-
 if:
   properties:
     compatible:
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
index ea0dc0ece1bc..877ab4dea539 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
@@ -42,22 +42,14 @@ properties:
     pattern: "^ADX[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
+    $ref: audio-graph-port.yaml#/definitions/ports
     description: |
       ADX has one input and four outputs. Accordingly ACIF (Audio Client
       Interface) port nodes are defined to represent ADX input (port 0)
       and outputs (ports 1 to 4). These are connected to corresponding
       ports on AHUB (Audio Hub).
-    properties:
-      port@0:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: ADX ACIF input port
-    patternProperties:
-      '^port@[1-4]':
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: ADX ACIF output ports
+      port@0     is  ADX ACIF input  port
+      port@[1-4] are ADX ACIF output ports
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index 89f7805de274..a64cd893deb0 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -58,18 +58,13 @@ properties:
   ranges: true
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
+    $ref: audio-graph-port.yaml#/definitions/ports
     description: |
       Contains list of ACIF (Audio CIF) port nodes for AHUB (Audio Hub).
       These are connected to ACIF interfaces of AHUB clients. Thus the
       number of port nodes depend on the number of clients that AHUB may
       have depending on the SoC revision.
 
-    patternProperties:
-      '^port@[0-9]':
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-
 patternProperties:
   '^i2s@[0-9a-f]+$':
     type: object
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
index 1aff61f072bb..cd5ca38bef75 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
@@ -42,24 +42,14 @@ properties:
     pattern: "^AMX[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
+    $ref: audio-graph-port.yaml#/definitions/ports
     description: |
       AMX has four inputs and one output. Accordingly ACIF (Audio Client
       Interfaces) port nodes are defined to represent AMX inputs (port 0
       to 3) and output (port 4). These are connected to corresponding
       ports on AHUB (Audio Hub).
-
-    patternProperties:
-      '^port@[0-3]':
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: AMX ACIF input ports
-
-    properties:
-      port@4:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: AMX ACIF output port
+      port@[0-3] are AMX ACIF input  ports
+      port@4     is  AMX ACIF output port
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index 0f9d2b461e02..9166c685ac05 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -55,21 +55,12 @@ properties:
     pattern: "^DMIC[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    properties:
-      port@0:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          DMIC ACIF (Audio Client Interface) port connected to the
-          corresponding AHUB (Audio Hub) ACIF port.
-
-      port@1:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          DMIC DAP (Digital Audio Port) interface which can be connected
-          to external audio codec for capture.
+    $ref: audio-graph-port.yaml#/definitions/ports
+    description: |
+      port@0 is DMIC ACIF (Audio Client Interface) port connected to the
+      corresponding AHUB (Audio Hub) ACIF port.
+      port@1 is DMIC DAP (Digital Audio Port) interface which can be connected
+      to external audio codec for capture.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index 12cd17eede99..f8f71a453575 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -71,21 +71,12 @@ properties:
     pattern: "^I2S[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    properties:
-      port@0:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          I2S ACIF (Audio Client Interface) port connected to the
-          corresponding AHUB (Audio Hub) ACIF port.
-
-      port@1:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          I2S DAP (Digital Audio Port) interface which can be connected
-          to external audio codec for playback or capture.
+    $ref: audio-graph-port.yaml#/definitions/ports
+    description: |
+     port@0 is I2S ACIF (Audio Client Interface) port connected to the
+     corresponding AHUB (Audio Hub) ACIF port.
+     port@1 is I2S DAP (Digital Audio Port) interface which can be connected
+     to external audio codec for playback or capture.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
index 570b03282aeb..dd0ba9742c06 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
@@ -40,22 +40,14 @@ properties:
     pattern: "^MIXER[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
+    $ref: audio-graph-port.yaml#/definitions/ports
     description: |
       Mixer has ten inputs and five outputs. Accordingly ACIF (Audio
       Client Interfaces) port nodes are defined to represent Mixer
       inputs (port 0 to 9) and outputs (port 10 to 14). These are
       connected to corresponding ports on AHUB (Audio Hub).
-
-    patternProperties:
-      '^port@[0-9]':
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: Mixer ACIF input ports
-      '^port@[10-14]':
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: Mixer ACIF output ports
+      port@[0-9]   are Mixer ACIF input  ports
+      port@[10-14] are Mixer ACIF output ports
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
index 4aecbc847b98..773b00b081fb 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
@@ -43,21 +43,12 @@ properties:
     pattern: "^MVC[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    properties:
-      port@0:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          MVC ACIF (Audio Client Interface) input port. This is connected
-          to corresponding ACIF output port on AHUB (Audio Hub).
-
-      port@1:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          MVC ACIF output port. This is connected to corresponding ACIF
-          input port on AHUB.
+    $ref: audio-graph-port.yaml#/definitions/ports
+    description: |
+      port@0 is MVC ACIF (Audio Client Interface) input port. This is connected
+      to corresponding ACIF output port on AHUB (Audio Hub).
+      port@1 is MVC ACIF output port. This is connected to corresponding ACIF
+      input port on AHUB.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
index 9dc9ba590fa3..89dff2e961db 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
@@ -45,21 +45,12 @@ properties:
     pattern: "^OPE[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    properties:
-      port@0:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description:
-          OPE ACIF (Audio Client Interface) input port. This is connected
-          to corresponding ACIF output port on AHUB (Audio Hub).
-
-      port@1:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description:
-          OPE ACIF output port. This is connected to corresponding ACIF
-          input port on AHUB.
+    $ref: audio-graph-port.yaml#/definitions/ports
+    description: |
+      port@0 is OPE ACIF (Audio Client Interface) input port. This is connected
+      to corresponding ACIF output port on AHUB (Audio Hub).
+      port@1: is OPE ACIF output port. This is connected to corresponding ACIF
+      input port on AHUB.
 
 patternProperties:
   '^equalizer@[0-9a-f]+$':
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
index 694f890d6305..04c550863d88 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
@@ -40,21 +40,12 @@ properties:
     pattern: "^SFC[1-9]$"
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    properties:
-      port@0:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          SFC ACIF (Audio Client Interface) input port. This is connected
-          to corresponding ACIF output port on AHUB (Audio Hub).
-
-      port@1:
-        $ref: audio-graph-port.yaml#
-        unevaluatedProperties: false
-        description: |
-          SFC ACIF output port. This is connected to corresponding ACIF
-          input port on AHUB.
+    $ref: audio-graph-port.yaml#/definitions/ports
+    description: |
+      port@0 is SFC ACIF (Audio Client Interface) input port. This is connected
+      to corresponding ACIF output port on AHUB (Audio Hub).
+      port@1 is SFC ACIF output port. This is connected to corresponding ACIF
+      input port on AHUB.
 
 required:
   - compatible
-- 
2.25.1

