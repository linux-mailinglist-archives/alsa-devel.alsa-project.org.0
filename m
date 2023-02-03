Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DF7688C6E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 02:24:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 602BA1E3;
	Fri,  3 Feb 2023 02:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 602BA1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675387443;
	bh=iJLEnVB5s59TnsrBqpwjZElE5PE+4Q23BMEhFzSr8wQ=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FLaM3d14yrNJgeymnlw1r+T5BkX+HBc+eKbnyYVNRqMNHW0JHrg13jN/BGatSFfut
	 huDfKZMBqlZa1JG5hDdzUVKGgP5BAfL+FzRhvKoc57CHmSejHIXsquLQ5WFbHRGvUJ
	 xx0JOSFySdEFbjxoBsenZvyKNVqbF0pe3qvhhyFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1EEDF80169;
	Fri,  3 Feb 2023 02:23:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1544DF804C2; Fri,  3 Feb 2023 02:23:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::724])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23C71F80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 02:22:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C71F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AsNjfo6N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuP9DY3MoNqzys9ZW+EaIso7FmfBsfRkk+Y9wKKRMt7SfqKMEt7DhWTgx8IybTCSEu6pOfo0Jt0NhPoeRIwrjRGDdFodYSaAOFwOeqwe43Rk7agEzMMBhOT+94zyWJDe2/9C+tkFlapxV3ZT1l5PhOb6OM0FiC+VWu6q17WqwzMJaLm/uOhmicUleLernwGlOum+/31l+RllvD4IO6xkUBpaD+vnqzOSObPjCMnI4InH2RpUUSqz5sOFer08xcnpF505Fii33BZ1RTgT4wFdEkRdaSC0GJBuKbdgsaXln7IUXF/C1sm9piVdzrTSefKfeO8eRoj04idcp6Ei9QUjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJyboJAOwTZlQ724itRhzRTmgScbaosF3rGpjm9bTwg=;
 b=ZRoGz9Ohq6YoygxurBFuZI58SFmMbQHX7K7Tx5tU3NJNb8ccRWNd1rQrE6UQRezb0YXBfSm9bMug8852tVWFgEYEZU3DlKw7ob6EXyXITKRcJuDu8bhs/QKha3pOViBv4s4Ueo0iqeQHCORA5uu0MUacRp/7n5G+nJM/b9dhu+5B4NUFTc4lE5+M2TDxoZCiQiw83gPnpZ7bO/WZQ6kN1aWjaC6LQC43GwpnPDbS/mJJPtoHtL3yblUgXwLed9+i93aAHERxTVp3OYyZFrhz8HOC/B+WVnPwd/LuKm17e9oVy4dGVgvc6BQGLsyfvAsTW0XhT5ogNqLWtO85ieUvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJyboJAOwTZlQ724itRhzRTmgScbaosF3rGpjm9bTwg=;
 b=AsNjfo6NLPjUr1ZOXisy616kc2TWPZ89LIOKq1yi5hC+yBWpKk1XLprN5NsaO7HdZYZCOBDnMR2F6H6lOPu8CphuEl7fnyVqWtUduXj06EKphYFfG6WD4ipVrD+E4mTXoucmgEZSJvk78MrLZs40biuzSWarCsSVTw1aB+ZuEC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11121.jpnprd01.prod.outlook.com (2603:1096:400:362::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Fri, 3 Feb
 2023 01:22:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Fri, 3 Feb 2023
 01:22:47 +0000
Message-ID: <87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: renesas: adjust to R-Car Gen4
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Feb 2023 01:22:47 +0000
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11121:EE_
X-MS-Office365-Filtering-Correlation-Id: f06fd344-b5de-4968-9902-08db058528aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0hRfVI6iqKc9dhg5e0R7+3bD/2HvSZDfzgRiDtnFIrwqXpK24YQwLSSwoyOdavojjMeWW2lx6L40Ex+n1Mqt7OJ7AW0gauYXtzRsJpu2iJL283fcfdpHVuhr0SD0GDfDfgTTkkkGc+Obcvuwg8eFd26OPOTK0xntK9zaiUSZ1f/3bMM3YJ0wTwnb+lTsykOsxu6vE1ltjSkDJCpmjs93MOhmgnPfOHiIYCkJ8d8j0BOLtVJfEPvlrcVI86qMnTnlodrMgl0zV+2ViJDj+vsSYV8Pw9PG2Nqo2kqADF/s778KQp6EZ42wRjKNJ7RcFz8LJ5PbWf/z4OP8S3QGumUOWHeIvFmFa4ZR1rocKMBFbU7edh2dJLQL2Qhd1g7aNCFSBj81IpWno+OFEM7uCnw2j0ZenE9Y8pFGH6SPYw2W2ozX6UNskxOnN+2BjDVTTF2vaGQkQiGXxGs8bfEyLA/o2d/dPUOzXchodEKzmIRzLCmrsuPHx5ZlVWyWBXctnPcKGRECJXuSQMsw89S+qTCcF2hABjQ0pgbv1HLkPUmCe37Cp/S+EJ+656O3h5AFo/0eSVd330meMnKpg/t4dIYd9sXYs1sOTDXvqawpUQ9tA9Av/YP89mnWsfMEyJRDXTFqoFGNYDU9+rP6f2U3gw6ndP6pjn30amTPO3cJXJZyipKff+HBSeYLrjfEaI0NGEAduDKug+Uh7MLfAoD0NatUXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199018)(2906002)(41300700001)(26005)(66476007)(5660300002)(8936002)(8676002)(4326008)(86362001)(316002)(110136005)(478600001)(6486002)(52116002)(36756003)(2616005)(6506007)(186003)(38100700002)(38350700002)(6512007)(66556008)(66946007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9osGdMMtCU9jplZKQaJmHEExTSJuwp4l5X778N1sv2i34qAe9FZ6j19XFhxX?=
 =?us-ascii?Q?STccZKRwHVQY1rXFVBW8NhEY38AfWikLB969sAT1SST//LiAhQK9+doM4nFU?=
 =?us-ascii?Q?ahhLFzJ6xJFXBPcwueWZUYVu0fnLqeUOJts8Je4WnB2HoZ8RrfQu/JhC+0dd?=
 =?us-ascii?Q?Jk75CKf4pfTyZFbE30GsLM6XwSI+jVJV2t1q0u7xUcuQyM+jbryoNMI+OgzJ?=
 =?us-ascii?Q?YOLgeJaZxzfw0mMUBE60zGpCSWnzlWApaG2PUzE/2BhxhnP7A6K8A9oQ+NTt?=
 =?us-ascii?Q?vVqYMDpy4D4oowElW6grszlJDBWJfFN9Q6zQu62tDBv4cCD1H1FQvgJKCinc?=
 =?us-ascii?Q?QA7jfwWqOV5DZyGFA3wAmsf1mXSNOpn48qjJJGdPiu3rEOlK+eRbVDv212H6?=
 =?us-ascii?Q?AKXynZlAKgM/rYy+5Krl8y3zF+BRz4lbFpwFGWUFTOmwLUS7rfbAmDIlYfhy?=
 =?us-ascii?Q?rgWbXkCzmoJkDRiRcVyaAestRUSQQsY687aJhTnN2JJSyRYgRiEkbIYjgkiH?=
 =?us-ascii?Q?tHjgKbxs1M4gQS1e0gwdlQ4HxTFT+DgntmfqWoJqQeURKThiSq2HJFmiHxYT?=
 =?us-ascii?Q?wIT2kvidpTgru3mRqwvRtQVhFRIzU+AQ6TELZuyz0VQFfoDdlcXo7EWWapcP?=
 =?us-ascii?Q?NkeMnxYAw+nQdF8E5A9xlqo/UVtQI9IKcn6aIXnejTF4XEs7bnDdkNPDKaDY?=
 =?us-ascii?Q?RvdPvum5zl233gziDBfXZmtjeg6+Ouvr5uZ/6Fc07imU38w2sPjbDfmiMBWL?=
 =?us-ascii?Q?Tif5UxhiJ9HfunQjEjf7dlSQ78zDX8hMhS8RxGzBKXMoW3K51go6niYGmeDk?=
 =?us-ascii?Q?Wr6JKilaSCe8gPD7D0p880KEGB21WwNBtNoLW8GYa1Tr2VAfenNA1sXgA+Iw?=
 =?us-ascii?Q?elog5UwjJeDykd5W+sBxToqPkaN1rDUISmfAloUv9OqwN3k8EkXvXxW68QTp?=
 =?us-ascii?Q?C6xxt4tVyLNZleC0+TWMEDp6B9/EvuYjsXP0UxeCHVSwT/ojaYClUBwwx/0M?=
 =?us-ascii?Q?oDU9Zfrd6adCuXKO1jeTE7H+j88Z5WAhZT0Al2S358SN4AVtof6XFfcaQxyP?=
 =?us-ascii?Q?iY9XSVqLkO3eVpgsEwSRZIOKfODFXjAQ1Tv0L1kh1o8JdxtI+x6MJJ9NM2ni?=
 =?us-ascii?Q?3/U4EPcN0ettUfGARGgxYbGbtAsANyzi5HL69gis5+lO5/gKL/rKxmgfgErL?=
 =?us-ascii?Q?dxkS5KPndXoC42BSWIJ8/tDVEfUvzzg3bimf4/Y3joPc1yTfU9KSBO4rYjWJ?=
 =?us-ascii?Q?d6uQjrvbfThEoIYEJDB+rwoDmsAh5n4YGhkVbglhhUvEK3OD8otVXT1Kfcj9?=
 =?us-ascii?Q?goPwlV2wGgRNkrObXzWTFW7iu38gkvxTk5YHKqbPJuopFlv5en1+e+4HkAa9?=
 =?us-ascii?Q?5y1V5cZG5aHL8v1h87HZ8lvQinv4vOM6ARyvcSqq+5FIHMA3FfZ+NjDAiUbG?=
 =?us-ascii?Q?mXfTP5lhxLKw7jk34+V3eq4/H5IcjEXbDfeZh+9mFId6waoTQSH3CFkl2cBs?=
 =?us-ascii?Q?e9/HyVtpeXfID9tGXJ18dPHGJMrQr6tTz2YBLaf8L+2mHEjNyi0Abx55iyqJ?=
 =?us-ascii?Q?VrimWZZdZwwQhuSZ0+8rdDqUrvucrd5puwbg89EPo0sp8rrEMrw+okaBZJYT?=
 =?us-ascii?Q?M0xq6jFI+oC4UGLujm205lc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06fd344-b5de-4968-9902-08db058528aa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 01:22:47.5990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peyYwgyDydbpv5HKMuDjDDKhMENBgBVcweBr6+qesIJNVVc+4wjDXvMvPz57gDx6j/gDpgTCTj8ItsUuXW4MHHtYzYCaFIHKzSqUk9gwfQ3u5uUSC0nbF7IFA2LQCdjG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11121
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

R-Car Gen4 is not compatible with Gen3, this patch adjusts
to R-Car Gen4.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
The "required" with if - then - else on "rcar_sound,ssi" is
always match to "then" even though it is checking "renesas,rcar_sound-gen4" or not.
Why ?? Is it my fault ??

 .../bindings/sound/renesas,rsnd.yaml          | 62 ++++++++++++++-----
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index d106de00c6b2..9a88b1c34e72 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -106,7 +106,9 @@ properties:
     items:
       oneOf:
         - const: ssi-all
+        - const: clkin
         - pattern: '^ssi\.[0-9]$'
+        - pattern: '^ssiu\.[0-9]$'
         - pattern: '^src\.[0-9]$'
         - pattern: '^mix\.[0-1]$'
         - pattern: '^ctu\.[0-1]$'
@@ -254,10 +256,20 @@ properties:
           no-busif:
             description: BUSIF is not used when [mem -> SSI] via DMA case
             $ref: /schemas/types.yaml#/definitions/flag
-        required:
-          - interrupts
-          - dmas
-          - dma-names
+        allOf:
+          - if:
+              properties:
+                compatible:
+                  contains:
+                    const: renesas,rcar_sound-gen4
+            then:
+              required:
+                - interrupts
+            else:
+              required:
+                - interrupts
+                - dmas
+                - dma-names
     additionalProperties: false
 
   # For DAI base
@@ -307,18 +319,36 @@ allOf:
               - ssi
               - adg
     else:
-      properties:
-        reg:
-          maxItems: 5
-        reg-names:
-          maxItems: 5
-          items:
-            enum:
-              - scu
-              - adg
-              - ssiu
-              - ssi
-              - audmapp
+      if:
+        properties:
+          compatible:
+            contains:
+              const: renesas,rcar_sound-gen4
+      then:
+        properties:
+          reg:
+            maxItems: 4
+          reg-names:
+            maxItems: 4
+            items:
+              enum:
+                - adg
+                - ssiu
+                - ssi
+                - sdmc
+      else:
+        properties:
+          reg:
+            maxItems: 5
+          reg-names:
+            maxItems: 5
+            items:
+              enum:
+                - scu
+                - adg
+                - ssiu
+                - ssi
+                - audmapp
 
 unevaluatedProperties: false
 
-- 
2.25.1

