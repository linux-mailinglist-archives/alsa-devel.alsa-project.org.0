Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 595DE737910
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1352857;
	Wed, 21 Jun 2023 04:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1352857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314200;
	bh=fgIV9kTbkxCGTsMs/ElRg2JMf6gq7+7Pk0+9qbKqqW8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZpKYDmp7j5ty4rpheOu5XEmW3fp6s+2PAk/CK2oMtTP+ERdVH24K8D7RtMO7EQ/x0
	 i/qmF34iC1m7jo1c6l6uhcdpvwWw25UrtsX59Qer7D8xf03mQ6OZBXL9EXqUIwb8tL
	 axFzMd/91/oMXPwu+IvSrUZIHZZ8o3C64y7skQuI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A440F805E4; Wed, 21 Jun 2023 04:20:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3965AF8057D;
	Wed, 21 Jun 2023 04:20:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF834F80602; Wed, 21 Jun 2023 04:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04CFDF805E6
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04CFDF805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SScTIoQQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSoYAnJk5bdbLl6exwba5TIGUbw8bgRs0EzEiE1FWcrr5Yz4weCLRUkbNmuwm8YBzxfceyKeQtS0ndGI59kEE+PECRV5MMJhcCX1xN7bagvOXGMYOsh7YIW55/Y3bwzmsqhPvXpV1W6r273s62O7QwVlCcxSEdD7Q+Qi+8fWS7FNvywAoIW6O23rPyankUB3PWJdoInRpVVhziZ2bbkEoVq7Ywsxx7BU9B2CjNiZDC7LJK2k3D9Xpk1gvj4c15g+thmdvTsp5N1Dd+v8j9w+Fv7UORsRmA9AquOe4fZ+DOxeBNVE71nBNRFlJIQdorDWL+MYePbur1VYuD3w91bchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osE7+rHcFpL8iDZlKbNPdvvxY/980NiUFS0BABMvcuw=;
 b=Ha7/g1JyBI/oYdelmtJb0yj4sc8QZh8+6Vjh5AdflBhlsLeZpApQjBCtwI6/I1WPucYTb3j+hePPaBYMuxDp2NebI2iOt2OYCDAVFHKP7Mu1JMp7TfLwQqkzq0egmxzMglXxhM+mqxW05q7eeUtlJtXtMZtZyFKOWrZkBhpV7nlCnAv8swWEEoUGmOwR4AzmfUFeSmHApFGgGStoy9VExO58b9sx7qu6Pm4HSOE1go1uE7k9CuhFC3ZvzrOUY7H+pfkIitvD4+wt5nlFG0yZ742NeIr3aShEwoPDa1uRxA4PkxZqxZPiBf01c5F7marBWyU9UB8tNQ22WAKDlbLtBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osE7+rHcFpL8iDZlKbNPdvvxY/980NiUFS0BABMvcuw=;
 b=SScTIoQQTy0VjXcDcV4tMVaQW8AHXu9OLLGUs79ntsmFlKZmmBWIeHuTrb73kCZ/bSimojJO9cEJuywuVjVfnukS4Bk+i/lwkjM46doQGIpGiYIsjMkxPioIGEytKS/OWqojWp10LAkJTg6DgxvSAxvAqAj5rdQOgwr9udtgJJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8528.jpnprd01.prod.outlook.com (2603:1096:400:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 02:19:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:19:42 +0000
Message-ID: <878rcdblq9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/14] ASoC: dt-bindings: renesas,rsnd.yaml: add common
 port-def
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:19:42 +0000
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: 02063968-d133-429b-23d9-08db71fdf95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZWK9coJfN2h4FqMcNBLp0jeDeNJqmn9H4pzK/ZzH13kYvpo9VK3V5Rd5phSkLBuHneOEd49YkpAtuzKvc8SSjYTaRwcHFvlpfQLryI75nkJJz57N0C2qcI63UO+Zd0yjLIfJ2F15VoNQCGaDr467wQ/wT7rGPXDuLELGEa1mU4Fx2RR1lHSZz/tbcxg3BNDNZou+FgdoMC0VEO3ySbWF6jeH3s8UrXipao//r4/sHRT2gw5MrfrBx5TpuIp8VfqW9eLnCTHRvzaqTDfyEwimtVxQhxd23RxIdLNi2sTUxRNVLj6wmY1LBDzzlcBLLqki1DOf+CbgJf/uOQa/PIUqkKGFGyBya/RaXtEo6swcXfPQ6KCmTMdQB2u8TyTyBaXG0PKjxa6PCLA2mO/pn+RM+vTfZMbb043IBGFBtmxssiq61s0US1bdmr/Xm/Q+7x7zZY6htKRNzlEwKwuwrLYtU7u6iFtuCbsrH5Onaw2H7HuZ0s3zzOzSKSbD8zqHJjXUNuK+rzCo/Ntk7/XiRcxeuzmzEERLXYkUG9AQn/Vpopie6xpIsUsa84FmZ4HO6+eimhMotJ0EzPdE6s2UboZ0JgFFmoFsbr9gEHyol9DornDxMrA4g7lOfIclMbnK6Gfe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(66556008)(66476007)(6916009)(6486002)(66946007)(4326008)(186003)(5660300002)(2906002)(6512007)(36756003)(83380400001)(26005)(2616005)(316002)(38350700002)(38100700002)(41300700001)(6506007)(52116002)(8676002)(478600001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?csxrqJHaSTZ8tMFv5huHPTgAbQcokp79JAGAWmKhaVt3aH0vHw/PFgpUCVOz?=
 =?us-ascii?Q?TCujvPHIDpKEgpSF8qic87hjCSY6OGc4yBJQxgXWrumbhFOrp7exQODqSpq+?=
 =?us-ascii?Q?CQJBxT4N3UCf/R07eohRCs2iTRGuA2At4IxJPU+y9xikTx/Q5wudoYeQV0X0?=
 =?us-ascii?Q?nTdJsisABQGWL2CEKlzs0ibpKaMv8TUuVG9mYJx/vapVhia5l7rFk8z5p/Gq?=
 =?us-ascii?Q?8GPs0mEGlSgstccKMUPNJkLlfAMOaEnwWdqddkhaxaBcljukauPYqYVNn9IS?=
 =?us-ascii?Q?dcw8L4uHCTKlKa56xjdSMyEQ1149Ylh0NhUUpCZgGPIxuA2gk7zgF4h09nTs?=
 =?us-ascii?Q?9b12fYykVEtpNQg/neHs9O8Hx9OeZGZ6nL062s3dTK+Dc4IB/y10NO725smu?=
 =?us-ascii?Q?KoMUL56q1YXO6utLmaXwuBG/dn9Hg7LHfqRq8tAtrMW3V/flTmbBVFgphSqU?=
 =?us-ascii?Q?fNoLzX82F13vrOnMl8aVMVFBg66/YGZbVVvtbgjfcnZLfe4Ezb14jJbx6U8N?=
 =?us-ascii?Q?zA2f6W5m5d0WuWsN0MAOl1BAF7ptykiPakCkpxYudmnUpw39Yo5ruEqPLQjo?=
 =?us-ascii?Q?7zdWPhMYzTPz7FKxhBNLSiMs4bjqQhk3gTHHEcIUWDQI6YygdrcuqQ4MtOGe?=
 =?us-ascii?Q?tA5y6whfsiSor0h3hBP5WL3guQgFaP3guCOVoXeyz9JKHG6M2Z3f3jDz6mHR?=
 =?us-ascii?Q?SgeiG+6jy2o18XEZJ6SyuVBDZYjDTKFakJiChCpAmHoHxCDFXO/uB1VztumJ?=
 =?us-ascii?Q?uOv33JVF+zUuwZDHIuJSMN0HHgQUy4Nv1pJoG1sj1jc6HO7T+mYL5gl4Thr+?=
 =?us-ascii?Q?ssVkfGgJjLoolRrRq7r4KYXrbn4PuyddVv8AM+PKo60KUxFZrNVx2b67Yg0O?=
 =?us-ascii?Q?pTsimgUQIdmXJVqVPCMxamXXLzdx4snCe6Knw/Ki5I6rlNly3UU08H43JYuT?=
 =?us-ascii?Q?gD6zEUdcuF00EbX+Azp5qODRbac3e65S1yyChZ1YIIDzM6JSVXbPd0yJC3+/?=
 =?us-ascii?Q?SyvITT7t6NsN6A8JWuLKHVgNGnYfHYWDARAtTG7wwAKOiKqhF20JipuWqdLp?=
 =?us-ascii?Q?zcJ5tzQ2Yijw9X9PAoOrN/9K6tDW5lBPPkQ9Bd6BSsrmvDwdDkDd1eAZXFMq?=
 =?us-ascii?Q?mBTdldHCpCqwFFH3wwTfYs+suHD5QnMFLL6PePIPhs44UTsBQnufQqY8DcsJ?=
 =?us-ascii?Q?XHWUD0dzGH2E1oZJsBG/ABlBwyG6CsyvFSSthFM9NrvVkSbXhCpbfkuJlHCP?=
 =?us-ascii?Q?slaKY+a9ioFkkw3cVagd1KGdNClsNHe3X0/mgycnwexUv7gVP20kppJa3OZZ?=
 =?us-ascii?Q?zoVJwY4NpGsiew3Jn+FpmhewVDu0FVJCcL1iY7ej3i0zcYte4EPkyKu+Hj0J?=
 =?us-ascii?Q?Il4GACPbqFu4tvdhsIaoymsIkVMEI1TNFVo9TxDZ4fOOwcz5mximE+Y6nzo0?=
 =?us-ascii?Q?l3IRBJ/NWELYL70vQX9FzbcX12nM09swxg6gENzWXxjZOLdG5bM0rk/PWIit?=
 =?us-ascii?Q?WDZuhEZc0FaVz7R+R9IQLZn+e6hS5lvpQuKo8rTX/GGpLTyaaY3dCiCrq4Xr?=
 =?us-ascii?Q?rSNn9kskTt6FesFlK3kgSEjv414MCFsWi25Q4Kdf4vADMop6dWqr0O87V5St?=
 =?us-ascii?Q?v/aIiWqSrs6C2pHrTWRliPs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 02063968-d133-429b-23d9-08db71fdf95d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:19:42.8490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VRAVRWtizAeH7orQiV4jB/XRLRB4P1MDkbqESPBW6HXG2ozbQlMDgD0waiauJhVkJhb7Q2YVRVOUBrII8bDbOGz0f/DR4LMjBh1UqdXLMUBTxW1QT7600QSiQ1fO1/vZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8528
Message-ID-Hash: ZVVVECH7VL4BMDCXHXEFYNV2ZGDLZK2M
X-Message-ID-Hash: ZVVVECH7VL4BMDCXHXEFYNV2ZGDLZK2M
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVVVECH7VL4BMDCXHXEFYNV2ZGDLZK2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

renesas,rsnd uses both "ports" has "port", and these are very similar.
To avoid duplicated definitions, this patch adds common port-def.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/renesas,rsnd.yaml          | 38 ++++++++-----------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 8a821dec9526..d9808b130e8d 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -9,6 +9,20 @@ title: Renesas R-Car Sound Driver
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+definitions:
+  port-def:
+    $ref: audio-graph-port.yaml#/definitions/port-base
+    unevaluatedProperties: false
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?":
+        $ref: audio-graph-port.yaml#/definitions/endpoint-base
+        properties:
+          playback:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+          capture:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+        unevaluatedProperties: false
+
 properties:
 
   compatible:
@@ -108,30 +122,10 @@ properties:
     unevaluatedProperties: false
     patternProperties:
       '^port(@[0-9a-f]+)?$':
-        $ref: audio-graph-port.yaml#/definitions/port-base
-        unevaluatedProperties: false
-        patternProperties:
-          "^endpoint(@[0-9a-f]+)?":
-            $ref: audio-graph-port.yaml#/definitions/endpoint-base
-            properties:
-              playback:
-                $ref: /schemas/types.yaml#/definitions/phandle-array
-              capture:
-                $ref: /schemas/types.yaml#/definitions/phandle-array
-            unevaluatedProperties: false
+        $ref: "#/definitions/port-def"
 
   port:
-    $ref: audio-graph-port.yaml#/definitions/port-base
-    unevaluatedProperties: false
-    patternProperties:
-      "^endpoint(@[0-9a-f]+)?":
-        $ref: audio-graph-port.yaml#/definitions/endpoint-base
-        properties:
-          playback:
-            $ref: /schemas/types.yaml#/definitions/phandle-array
-          capture:
-            $ref: /schemas/types.yaml#/definitions/phandle-array
-        unevaluatedProperties: false
+    $ref: "#/definitions/port-def"
 
   rcar_sound,dvc:
     description: DVC subnode.
-- 
2.25.1

