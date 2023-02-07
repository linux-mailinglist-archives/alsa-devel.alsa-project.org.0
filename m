Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC2868CBC7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 02:14:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2854D210;
	Tue,  7 Feb 2023 02:13:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2854D210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675732459;
	bh=56jhDpr0iyVevLgp5dFaJYry6XjQzlJ0lkR1kosXqmk=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AT+2kBgM/G4TRwFLWp4bwGNJMthufB2+ug0FPQJQqY+YszcPoCu9VRDnvA6Df25M8
	 yc1OgHmFRLgqaEMagSsNb07cjuRQNMCzo4oK4xzobiMlhJnc0l13GWpCyG81kb9sEy
	 RsuzXGN/q7kaYYLcyxY49sqw3eLwh0S6BeNZnyuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 155F6F804FF;
	Tue,  7 Feb 2023 02:13:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81CBEF804FF; Tue,  7 Feb 2023 02:13:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA25F80543
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 02:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA25F80543
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=R42AGVYv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4m2ES8XxJ9YkwCm9x5ES/kentJ+jSwQxP1sNKRhwn5HEE7Zm+BTCmsQwrZVCSl2isHrCCVYKA2oCl4AbCXvh4EwXl3LFz2297RqUB6ADu385yLAxBY2LysTwB9ZzwZagzsYYdXYpBr8gxTBeCJCzM4q1nsHR+RE6MjJMxrOflMOqx6cWFzdVZjMepaWoHwE14RsXEK1mOx65ai1zJK6pE7zIJCSWO2vNrO2LbaK6wKYTqig5/nWtC1zRKgAX6UgrBbDTwRJKhNOm3QjMKq4xYokPXwoH2lwAXB9pK9pbAzsUJSmYUvrDTYi4QOOYkigAhf/c7NDFXkVNvHclxmU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bp2rQ7+3wxvjhH5SupJEbllbd6+3Z/j6z+fz8LdNweI=;
 b=NpGBzwL4jMMySlzQByOIcyeQPlH2F+zMZW9/A90xfvnsqWBaez0pAQZWGJaLLD3X49mC37xAGxR5Q4jEjS8Ql5UuRJFjFOBtgA54uqUfQvrmIll1a+ur3Bizq/v5Z5sfGPcZoP8L9E7NPsSoExB4rdcKtIb4hTh/fT+sZ1bUKHulYGsJXHhAQBIJvtAPf6F0rokWLg5u1j4MMKMovpFjAYnlFlb8hfAil23DaWEYjbUrcYgUff5Dhk+Vd2wM1jtbt4lwNH/oXq6KuiQ2UyIdpF29hlCZ/UG/lpdhWIFxIpbVcpFHi7N690UZAsUVw+2KeYzVkAHgne9JleNbMWyjlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bp2rQ7+3wxvjhH5SupJEbllbd6+3Z/j6z+fz8LdNweI=;
 b=R42AGVYvOVDL3f+KTcJMPCTQxaR1ciBWH4BuEh3WkdisnjbylGmqyFm9kby6RjD283wMwbKPmdNF8I/a6PwFEevyzRIyx3RAt1r+gOgbkNf4Yh+B5GziQbsUPeSqTl0lVE6k0I4AjIYqMwb84p6WjTSAq2bGtde9l8FREQXyRmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11511.jpnprd01.prod.outlook.com (2603:1096:400:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Tue, 7 Feb
 2023 01:12:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6064.035; Tue, 7 Feb 2023
 01:12:57 +0000
Message-ID: <87o7q6uvl3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH RFC 2/2] ASoC: dt-bindings: renesas,
 rsnd.yaml: adjust to R-Car Gen4
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
In-Reply-To: <87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 Feb 2023 01:12:57 +0000
X-ClientProxiedBy: TY2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:404:a6::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11511:EE_
X-MS-Office365-Filtering-Correlation-Id: 55935fa9-065e-4492-7c89-08db08a87295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uMlDOQs5YywBxAsjmH6WmTjkpGfnjUd20+a6D9IStzY4m6/8EHnjE4QJZVReFPEnZYOqH8SoRGIzO3VfUv9L1AyLbaJ//HK8yR2IuHt74uKsuEQ9XUdup8HVj0tZfX9VO3L3PQyhnZdwvYdOzOMYZNpXuTrNchZ05av4voKsObr7CF/yS0eMXSDNWPmjuEMvnzOqS6FdetduUiC1Qwb+xP3Tr5AkgmGdBEXFuzFugMvl5j9GX4IJvgnZNXhKqn0qzGBuH2DzDGHKuIplj6HfsF/7AgHva3mHhaqTUZhunfmxEdB7iQWPIWJTtdSsC9sCj0RHV4fUu2xOT0t20kq1MycZqcoT6Po8DkDO7di945wd9wrYH5HRMkii+TkBjLDZSWv84e230MmmB6dYugbUW+aJuUU3AjJcRfMKgCO2FXDrgdPjsQRkDvGzYkcJzYcd1u8IXGff9RReQrxma6WLMqJznow/VMGES0CKbfVfvsz8De74D/k5zc6/cI2BUzlCezmNiFTPwtdoHPN47r4PjvzOo7fml9hFmV9NdD8xmcOPoUGxquxqO/ZyAGmTQ7MxY87RTtTeqY+pC5r8rH+Ng7hiiitDGAfZm/UoR1i1/AEz9ekgylq+oX9ImbUn8Xi39sTgAapN424pTXlqyb7J1yKEmWydBfftreZtqLaHoRZKCHMPVQvEek6PLigBaVdszf9QYaxmovhf/i3RpPmlbx3v71QWOKG39hSe4eiUvNSFJTlcLd/ku8yCWfNckENDwCfBc3cO072G8YIQF7vweQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199018)(6512007)(26005)(186003)(478600001)(2906002)(52116002)(8676002)(66946007)(83380400001)(66556008)(110136005)(316002)(6506007)(66476007)(966005)(2616005)(6486002)(41300700001)(8936002)(5660300002)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+H4jsnE3ZJc/VHIF50qoFXTb3xkjJwxfACundXr5sXdA4RoKL6McXhDuUaCN?=
 =?us-ascii?Q?rB2tCkIG0l38LGZI48Ji0we8jH0WZKhf09D/sP2m3o6D8liyg+L6iSLpEj/1?=
 =?us-ascii?Q?o3TXEUA5SJGz/CRRKFYsLFuDiUb9fRaq0w++Bz1heE/vv9wps4ijQEbTMTyA?=
 =?us-ascii?Q?T5aWDpYDzOLXuH6V5kiug0PDGpNC0fwSe9IJZgppzzVcGghdkn20wfSBW8PS?=
 =?us-ascii?Q?OAIHVKz99sS7JR7rnjfhqun5DntdyaKIL0LKzQ2GBGgCtSRHzMmHEGZqSjlj?=
 =?us-ascii?Q?m8bynzTCizmTMR99brQnb6NDO+1IHNNygJQr+AiPsTc/Oz5C5YeiA6KC03GY?=
 =?us-ascii?Q?6G4Smg/UCDcu7fn2UBRM4nQUhlPyirTD1p0lNf3L1x90MVei6y6a1s+/1Tb9?=
 =?us-ascii?Q?wXX14C8E8vpw4WIbrD+aZDV0OPKVCSz7tT2XJlS4MDNRr4OMpfqCwcoJaW5F?=
 =?us-ascii?Q?77Pmg+cpC/pwhEzWk/wqakdm5ok3Q+ktUlRPfnnbSl932oB8Gyg2CCksXmuf?=
 =?us-ascii?Q?hJxRw2cV6eIXisk7smhhXEJKuNckfayPCR0xLsG0TRbVBQ8WsayayDa0zaTh?=
 =?us-ascii?Q?RxTOiuZ21JZ7cS7Y6VucPA7qmA3IMCrEvaufvt2NOs5vNxQuBAJZm+wah7Xv?=
 =?us-ascii?Q?bAbBspxAu8Jkx2/PfylSD/qVPm5AVxsKZ4t9NR1H9aw6HIqgWb/sSHZ9rQ7D?=
 =?us-ascii?Q?G1fZFovG8pVdpZrBiiwpCf8VUFoWhbVytGRYrBejrjC9w8il9FO0YqmM5BqQ?=
 =?us-ascii?Q?JoK+xJShbG1BoPjpspEB/ONM7b+R0BLAGyoUQw/EUxL31l/AwcxFmn48jsOQ?=
 =?us-ascii?Q?PDj5O1w/1daQtdhvQekNS7aLEtjzpgM2aqweTypGWVcT0PJY2Pj3iRkhlJQM?=
 =?us-ascii?Q?Dp58GP3ZtNsLUtZHKQsRWr0KilEG075oRt57WmodR7z/uZtAXV4Y5UC2VDmm?=
 =?us-ascii?Q?qknParejNVKeCOLWcabS/CHGQxwJPcIaYJ1QDiRJVrlHk0VtkleaWFhhfI//?=
 =?us-ascii?Q?+u01FeemuR/kvhk00qJjvUxOYLLr2s09ntwE53bAHiQswVPN0RhusqBr5U7C?=
 =?us-ascii?Q?EYsPjxpvnbIp0FePHuPrNrTU9qbhciiLHmgXkYOh9+/3KxC+92LQOwgvCqMn?=
 =?us-ascii?Q?JjgnJ0pc++O5l4z+fzlRMDtGDXGWjIGqX0H1BbbnVoGHrIgh7DkUj9pX//oZ?=
 =?us-ascii?Q?OxSIxXvCNbv+9tbGJ2TNo5Q/yga9dmUENOqiFyZKDkMzGGkWpS0PWbq97ev+?=
 =?us-ascii?Q?HXulZCUPGFhJzGsgxCOBVpnfzPjZ/Vjrx/NE5SvcSwVJz2nAeDzXFphodlIf?=
 =?us-ascii?Q?p99SFzCs5ekhsQMThY105qtC9n58Z/SUfIqG48Q+IuzmLZ3XP+QBZ4zQfdKV?=
 =?us-ascii?Q?pfrhV2OC/XSSmN+3ZAp0YLeqrhr2Ywv80cJVDqYMclNSDF+IBiDaEoTDwxhl?=
 =?us-ascii?Q?2T1b/QnOGN3ufzp5zlp9SJWH4MAPYjqwlG9w1y3fIGG3BLCEFfdc2w05BTHi?=
 =?us-ascii?Q?544a3PVeeYOAYNFIkVeHmRNBTu2J8lDruJlow1Lpy9HujUm+KIHKcf2Uoil+?=
 =?us-ascii?Q?AogeevojQETObWd8QD6VQS34W5qgycaIbqaHdm6uIbLOTBRqq66XiZuDtj8I?=
 =?us-ascii?Q?uHBneh7EWW8SonxAQNjgzd8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55935fa9-065e-4492-7c89-08db08a87295
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 01:12:57.3921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07Z4TjfC1kqUDzPl2ZNW37hXrgkE4WVjRst3ULC7voE680gj5IwpXYXOJ4RsuUdAY4Jf7tt+a8fgA4lHoha1HqJ9HsJFYkznb+307+tN7hhVH1YtpjTK1e3HifaExlbw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11511
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

R-Car Gen4 is not compatible with Gen3, this patch adjusts
to R-Car Gen4.

Link: https://lore.kernel.org/r/CAMuHMdW_QHmODAKvn_GwHHUWw-=z4Tdq0NkhdK2u2piG_YgB-Q@mail.gmail.com
Link: https://lore.kernel.org/r/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/renesas,rsnd.yaml          | 83 +++++++++++++++----
 1 file changed, 66 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 223f4859780f..77b82bddd04a 100644
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
@@ -256,8 +242,17 @@ properties:
             $ref: /schemas/types.yaml#/definitions/flag
         required:
           - interrupts
-          - dmas
-          - dma-names
+        allOf:
+          - if:
+              not:
+                properties:
+                  compatible:
+                    contains:
+                      const: renesas,rcar_sound-gen4
+            then:
+              required:
+                - dmas
+                - dma-names
     additionalProperties: false
 
   # For DAI base
@@ -305,7 +300,14 @@ allOf:
               - scu
               - ssi
               - adg
-    else:
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
@@ -317,6 +319,53 @@ allOf:
               - ssiu
               - ssi
               - audmapp
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rcar_sound-gen4
+    then:
+      properties:
+        reg:
+          minItems: 4
+        reg-names:
+          items:
+            enum:
+              - adg
+              - ssiu
+              - ssi
+              - sdmc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rcar_sound-gen4
+    then:
+      properties:
+        clock-names:
+          description: List of necessary clock names.
+          minItems: 3
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

