Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C69C693C17
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 03:14:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7625682A;
	Mon, 13 Feb 2023 03:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7625682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676254489;
	bh=cBA/vKvQfR+7UtJVyQwrtuMJ9YKuyF4pBjAJLWgmlJ8=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MEoNmm5W6uKiex3miLILprxrCGfaowx5DozcGzLsZVHie5Wo1Z18ehdVWG2F4gZ+h
	 WesVH2ydnm00Oc6RSh5UFxrs4vzcVh8/iwZ9hBmer93pBtg7plmKRBKNZNjUopmmOb
	 CAYuIGd757pnJm+QeW+7ERhAh5/gzvjl2CgyqJ+g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 514D7F804DA;
	Mon, 13 Feb 2023 03:13:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5FBDF804F2; Mon, 13 Feb 2023 03:13:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 894E8F804D6
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 03:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 894E8F804D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dRFwIG7a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoS8TRf7q41vhla7KDv8cSEj2pyVvHryJRzCQe1WkEW4nc2j3mQCx3I2JXshlpJp36mBtMvPPGGbCWd3CgDF/rAYgF24sQBreSL9Dbs15yKdSE5Wv6MwfipLWE//Ts3uQcfyoqXPvbSr8dScwxTgSzlAkzgy5fTBCoMqYMt2GbWhIZ81jCjgvuua7/wrONCX4W29n5hldZ+mu2LdMCDGi13v0GzyUrPaGa/FW+rVyGyNeVgNMCEA0rdPyQ2WER7AMNSqqDsfuWZrutyhaDuouIDuTNgK4dgjdffd47n7zsaJoxTWWd3mhVTX2jFnSKipa1AHbKdat4JakSvB8UW9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znoWXWDVk6h++oepW6CX9GuIrCqMPajejJWuSAn2i+I=;
 b=KExUQeaZWFysKoHR04X9+m+lbODg47GjPTgGZsEeKyRsEKHHlGLWOwCQLF3MhaKlAxhj0BUWE5LsYGLg2sLPqub+pBqQnK+ty8q4I8qs/TFh6sBzSf5CW4QcmAp6LzFaV9Q3bZ+bc1EXQCGrAyTbw/xvOWWPp/zpjgNckbNt01rOTLpkg3DY3y4cZ1yM6P3YrXtdqZ2mCQ9byCvUs2ZUmk4pxfJ0PAFQk68l0u6AqXxiwrid9IUtJi/RntBplHZrLNBnQtR+5zkSBjTpLeC6JbZZb+IkZTlHq0YRLTq2HdSpgjD9vI9ykRWxJF7K2ot78EA+lsCkyBbJhTU8nBi5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znoWXWDVk6h++oepW6CX9GuIrCqMPajejJWuSAn2i+I=;
 b=dRFwIG7adH+g0zdtrw5r80knkVzxEpPDs2AnHADxeNqNp6hYO3uUgoyb72tt0GjsyCpt56X3ExY+PRDl1Ud+sKIRl29i0dz8VVt6HI7T4e95hwahYLlqR9uJ/EE/hj4FgN+ncK+3zQP177x/AL3lMqXQOkNIcZWQYhoDuQVg2kI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5370.jpnprd01.prod.outlook.com (2603:1096:404:8038::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 02:13:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%2]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 02:13:06 +0000
Message-ID: <87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car Gen4
 support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Feb 2023 02:13:06 +0000
X-ClientProxiedBy: TY2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:404:42::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b1e301-d8aa-45ae-8c28-08db0d67d87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JdP1GrC5wVjO92PpNBu/z7ERydpmI7BDW5UcLpUCJ2QuDnefuYwdmA/n9RdVXK+X0IRgxAHG+b03qI/kEZwn68CiDW6W1AFJNkN5UUQLSqiuFqIPFXy+kQrokbpGl2eDNnVnK50NU0BFER1u4iJIJPFUUte0L2BpO2+2fszNwwRPxjTXb1u0yv/CMbVfVUwGPTftYdSP01rrfoq86o5IRipsJ1Wno+pASJ1ksjF9OQ3l4eXwYc6+p3hvSPBanSP/dn5sbD+IdHUqgElSZvy6Isze7DTITnZcslXIDvptya8jsULfqSY3wXp9jJdZZj53TD9CQ+3gtd4/XkQCDuWJrRF/KjmWzKoH+qttBnCHvVlafBuwbMTtBCJ4ZVNzBi7FRwYQPruru86lnh83TqQAlbO/zVX7gzF+YC25lAWUeHNGQTSLqdx4sGdI0FA3EsgNipWIOn57ass73E+/LN7QfL5yaDMTt1utbPHSwYWUePooh/xFs+dIVRtpwZ69u0CdU8QQB2ci/xHfLLBOtyCN7VxmA/6ObTsI5xY9wywMt/wFAJdlEOnRDm3HORJv8fZzM5FItEcexe+BLPOgHeK3QZOowj7Sgv9RaQl+fpB+kiP8vXx01ahrttJRg/10ViqorKiCbpsmvO1/MrpFnLgM+AqGBQHqF5Pxak8cxV8XxJE27QnZP8hqPyi6dxSyQof0L+v6HWxE4JQGgHie2OAnp+BA9B3AJSb7G16Rmr1pScvlJxHFmo4IJi8dSN8IcQd4Uh7r30DWoL6zxEgVCUHJtw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199018)(2906002)(36756003)(6506007)(52116002)(966005)(83380400001)(6486002)(26005)(186003)(6512007)(2616005)(478600001)(38350700002)(66556008)(66946007)(4326008)(8676002)(66476007)(86362001)(316002)(41300700001)(5660300002)(8936002)(38100700002)(54906003)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uz7lFujyGexSsjMRYwXaIWkxPtZTkw/NUX87U6kSDT/QDN3E7HMf/BTuofNY?=
 =?us-ascii?Q?SJ5eM50ho+lqTqvNuJud6FI1RTSCM3ktcWPyd+AM3KF5w/HgMKsjWclwF8R2?=
 =?us-ascii?Q?U1RWfHuw6KfliDFFiFyauPbaf+9lfCzwEJwXwSh7oaWLWcciNUikdEhGebPW?=
 =?us-ascii?Q?jx5bW3t93ZzsS5aGxpDPRwnzC+2GuY1NlgfDFud1IBiFzdHME5jXdxokbOV5?=
 =?us-ascii?Q?vyKKt98IqBPwwCWe1VBQ0p+h4iBUsgQn/45Tc9wYfdGz5ZFLatoikCG/Hnki?=
 =?us-ascii?Q?ZynCD6/7skt3AdNIcR8n5FXVUXLv4fwfjKTGSvNCPBi0KpizIPQtVXVRPBCQ?=
 =?us-ascii?Q?17h2v6a96OlNOMjm2ID0hDjn3cyiWMY4cICKJ/Zo3mvY4Jh2cwcK1dp3thM/?=
 =?us-ascii?Q?RGdNWdzNypvVlK5H865OHH230l+3j0nZhew7X9K9aJKvtDEea/K53QhONNrp?=
 =?us-ascii?Q?EKMOZ2OaPcx7RgfasH557Y4EnjB40KKV+ORZJM742OX4S059rorfUfHBQSf4?=
 =?us-ascii?Q?m4iMumWpeiS9bAFDHVVccM7CkQ5ft9Cmw9sax6syNkpVGKHJHAYlvvvq9Ery?=
 =?us-ascii?Q?XkRH1XFl1XDvci/mvGcFIynnsd28/YO8kSmGcfai48Wp27axhjtImIXF/cVR?=
 =?us-ascii?Q?nT4veq+Y/HRdvy0zcS08nMKb+we2pYlX6cKp6Yu9PiBrXzf0sQfzLxtsDR8d?=
 =?us-ascii?Q?RL+OQCY9bKV6lj4OJC03wb4OVXuGqQn5HQf8dZfMLTlYxD9AFCz23TmVMj41?=
 =?us-ascii?Q?/DChi2KiwrLfgowsshv+D0mRbp6EANVSdT0h3SuLnRpbBFkWAR6ldDEfeQcl?=
 =?us-ascii?Q?zCUTrIba6i4j19UYeYLU5ySn6Ywrup2k+CC4BcxyffdwYSBILSvlhMP9U4pP?=
 =?us-ascii?Q?FQkxj7o0euzjhw4gkuZ2YW+wySffCHZS0ohI9eGXNaoNgL/0HByS9r+7vCFs?=
 =?us-ascii?Q?75GoKuXSZcVXW/NmqkAUD/cWhDJIbRgKeSpiD3Jh3umKIk159uX1HM2S1svC?=
 =?us-ascii?Q?DvFc+xdLKX5zna+ZpPMooUQoyIio4Hhhmc6QrEB/qyZ7uos2KmXaxxkYzQZO?=
 =?us-ascii?Q?wawjL4r83pz+AZUEH8xXfqKMOsWMIR1dfwqQnbIFaGSV4qRZ8CA334uPBIUt?=
 =?us-ascii?Q?aSJ2pKscDL3muzajE4yB/6Nbmmlhn70LGAx1QdUVfltd6tNPqmaQSn5Q7xDA?=
 =?us-ascii?Q?3yRUGNA4ZE5hBCEDyLXJh+pjBVegW1vHsjn8VDQk6MhCvAh8MzbcfaNdo2pc?=
 =?us-ascii?Q?UbcpsAsogtcUp2LsX9tzmv/xMUu0KI20+nkZDbVDJ+OmlbCWaYKCtHymqpFs?=
 =?us-ascii?Q?V7IdUnIO16agH+Bp3tCzALebnfRNR8WVWHNXrxE6OpVnxAwTseqDd0uq8ydR?=
 =?us-ascii?Q?I2DJKwGoWR6NjH3ozNS0V5y8yKQsknB9Wc5ju0V63ITs8iAlCWjcNNV+bNml?=
 =?us-ascii?Q?rEElg/74SYmI4pXgFPm+aoTGPL7uomioEmc/xo9AuLKDTl1AUnexfoxqNFnE?=
 =?us-ascii?Q?f4t9aPwAEG5GNKf+iWS/KTgl0TW0BpntAWKHgvj+OKXsVRUUGmGXQEtw3OTj?=
 =?us-ascii?Q?1zEBPAXqe79gpJK2d56LW1+6H3Z1TIZcwWPD0TPFcIkbT4TnmFGgm7Gh9l2i?=
 =?us-ascii?Q?HE2m34uDAI5wnLBD6PeOzqk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 95b1e301-d8aa-45ae-8c28-08db0d67d87c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 02:13:06.8671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7hCVRJmJKdi1/1rgp9sDx8/aJ45x05Hqwf5gf6HQxyDHndnFfsfE6apnb8Ze+fKQydGov5MZdhzIeV3UhFoKSPO6Ciy++lqQVIjNTSlfUubR9NAzo6H3G+CGP01awAQV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5370
Message-ID-Hash: QRDQD4IDFLZA5H2YBQEMB2Z7OVTTJCQ3
X-Message-ID-Hash: QRDQD4IDFLZA5H2YBQEMB2Z7OVTTJCQ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRDQD4IDFLZA5H2YBQEMB2Z7OVTTJCQ3/>
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

Move "clock-name" detail properties to under allOf to use if-then-else
for Gen4 or others.

Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com/#r
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/renesas,rsnd.yaml          | 76 ++++++++++++++++---
 1 file changed, 64 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 12ccf29338d9..55e5213b90a1 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -101,17 +101,7 @@ properties:
 
   clock-names:
     description: List of necessary clock names.
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
+    # details are defined below
 
   ports:
     $ref: audio-graph-port.yaml#/definitions/port-base
@@ -288,6 +278,11 @@ required:
 
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
@@ -303,7 +298,15 @@ allOf:
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
@@ -315,6 +318,55 @@ allOf:
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
+          maxItems: 3
+          items:
+            enum:
+              - ssi.0
+              - ssiu.0
+              - clkin
+    else:
+      properties:
+        clock-names:
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

