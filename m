Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4F67C29D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 03:01:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C9EA207;
	Thu, 26 Jan 2023 03:00:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C9EA207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674698479;
	bh=QAFK2/OGrzQvtJe4kLCFbb0eorBXpcd0AU0IWFPUpfo=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jyEfuIvj3n5MP85/FsJDVwgk4XtD8h9x9xTu3L5CMA/9ODAU/2Fn6SGBzWEiQVzrz
	 Ff/YdUGOkH32PjnrUz+4CDdoXl9w3ItVjQILv6K7HGgQmW0KQ4Igm6Cq5EVtdy46jy
	 hdfRB4jOzLH1Eay0pei9oFeniaCESWClm0vdNXsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 625B9F80163;
	Thu, 26 Jan 2023 03:00:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B03BFF80424; Thu, 26 Jan 2023 03:00:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2096.outbound.protection.outlook.com [40.107.255.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C57A1F80163
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 03:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C57A1F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kqzeFXf6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOUraXoGcHmb9mXWF+bKDlHcpsfubn7/7u4gPHMcOVQrP8K7zpIXvCUynsCxfkGlaV/i7nrS2NXZVZBV7/jWekk1joCNk4kxJq6/E/yiKeeAd7wy37hrnJ5BAkZ4d9/5VklI/drVtmvDC4geum65YPHkJnKpB4bSD49LvvanXaNxk2Ws3jcMq911Fgnx59q3qaAXUiBsxioLPDEAipzKYef+wuciaqVRdfWFooE68I/5Qs4niz0+qwLwn+07F3LU6wOUj6r6KLiH1b3dV/CPq+LUVZvrRK/nlxmpbJeJIprD3A3KbDaXkm/T0Aqx17dl8QihxFigCYE5yL65XV+g0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYrmBJqpEpvx4B6JntZACiEW0Ne0DktWyhh/1w2+ZFQ=;
 b=nPjgOkA91iH0h9tJYUmNJ4LSnu7Ts+iM4VfCO/V3G1cs/Xhp+QfScKdgeag02BtzlUxKTxWVVLV3Dxrwt/JZY4s0lBNMhJSe7KYsMhD16ka5beAd3BZ02SPMuHxMXl0YQLTtMRycAbcWVxgtFcPZaGm2ZuTmZBMwSr47mi0n52zaCQhI0T4E7/WV+Q0WYXqC7WRXlUTeuvkfpesMyZ8m8gciU4vyzjarrwp+KKAgaaIgJzl/WmNpGxaXnauaEBh1Qq67xWq4j5VulmlJvuiJriFXbpNz1JtJf++i0hgK9847rzKVbOFOa649oPE77Q4Ip7d/QlwniFiozQP1FJX0MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYrmBJqpEpvx4B6JntZACiEW0Ne0DktWyhh/1w2+ZFQ=;
 b=kqzeFXf6vxyU7iDiPvGpCROYJb+ATE9Y9jf320IJaL0BukRiLsz4BKWz3Llvilma0TonZDpe7Jl6L7e6PS0Jp1lroucM48IfJiv+W8lWaCXSFfYhT4Y9qKvEGBdHwAFxGhGw6DoPWg8bmBYcTlM1CT8/lwRYB3QAo+PCAudr/LU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10102.jpnprd01.prod.outlook.com (2603:1096:400:1ee::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 02:00:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 02:00:00 +0000
Message-ID: <87zga6t5r4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: renesas: add R8A779G0 V4H
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jan 2023 01:59:59 +0000
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10102:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed50cc7-c3c3-4287-a103-08daff410803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdxsJNLqGjeymufT1PuNs3ZvyZegPhBlvgScEDP9ilRGt8F7iOPxH53iDnrhOfZfzsYWf1wgcVEpWFm+8pw5GBs9tPNEmWC8+GUDreyTi/B+QckZlgwDL7fsrOeE928/qIWooilCnkB1vVnPb3XT+lWbCU+syqbIFp4a6s9p/+fLibVdZ2o00IHXr9xhY9k9AaOAzc9wxtRPd+ifVNoFC/+/BhKcjpxx+xDOaln427GzQZP8cLWGc1VLa6Lqj2TCkKx9akhWs5qo8LL6TSsGOZ+ZtzGSDuEKJ6Zryqyj98NVlR0iMoQjm22lxY4pQR7kVtBgnoydtu8w+mIewhF2L2IeVLhbYuDdVDRa1wu/Xpy7iqIQsG1Yg2MujF9mOAE1cwS4aUtM3bLP0rgopuhkS4VfF3RO8Xy53Zar44DOxGHJ6W6FLZtxi7q7j56O5YvyzhD86kDedT+rbe7OgIiHiyZz6HtayFufftA1z1QjzRrOdiSnmBStaZFXWMvJ8SEHJGKxa3TJcKWRLz2l2dJoE0P8z6wv27xV2CVHlTWIvy2ZT8YyMgGb5y4EtIvazHvmOek1VoScE1ALPxisd9So1pN/XCELr1HUqNpzyxJARaCSdjuWVNfV/prYv/joI918ApKv2F9oD8Cjf63i4KjbJ6AOySbtr5T51bWQ7qSDxIEBVqMRSnc2Tv5duK2zm45o5AI7OpaSi1khNfcm8JAhKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199018)(66476007)(66556008)(8936002)(41300700001)(4744005)(36756003)(5660300002)(2906002)(66946007)(8676002)(110136005)(478600001)(4326008)(52116002)(6486002)(38350700002)(38100700002)(86362001)(2616005)(316002)(186003)(26005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K6IuGElJ2X59f2jYjznQB4fWf/HVCd2H1qVRf22oG+tcfXLzI/oSiQ4bufA5?=
 =?us-ascii?Q?CGNDpGwyxtIBdiLvm/ZX65jIu88SJh6xQZ/JbUYJ2JfqS2p/nXPO77gXzu3W?=
 =?us-ascii?Q?QrkWcRfPrsx+8xDhJHrqVNprmahpBXOxkL7e+8EM1MzcLeHk/PjBuFeTQnaU?=
 =?us-ascii?Q?Ac++DtunPiO6y6iClCpAdivCuxMhroAhvURtHk4m3A8rlIicACtkyND2B8F9?=
 =?us-ascii?Q?sDBTQwiRFHkgVR9jES8PcrPjyM+IaFDmnRBE743y+FIehVmpL2YlK1GpsRcA?=
 =?us-ascii?Q?3BCuPhqN1EODje/gpGxavgHjl3NxAKmgM+jC7eF2Y6mQsfLmSLGVLrAL/quK?=
 =?us-ascii?Q?PERiwYEW9hP8+Sx/t8+9OBwRn/KbdYGF3wO0S28RT0EYxWjbvNSwkA+vvsdS?=
 =?us-ascii?Q?5oHonJu3r8lu+WR2lpjmCGfWnWpMetK8FExmHX5wSnd1WgibtBTKQjeTxaQf?=
 =?us-ascii?Q?4ugFyzHN04EEIOSY84nMibNKAqVi+gllkqisBS3yOY9zXvLLf+RqNWG3O5/7?=
 =?us-ascii?Q?Kmf06VjxkTY9K7otGHH+h7nKCsF4QGqsgmwvFkwzb1KRewS+Hl6gkt+BzKVa?=
 =?us-ascii?Q?S9DHWEOyu5lE74oAMjEr903Q47PjDjZ2z5mTSPxZLUqR9jdWN2CdRK9jxC/p?=
 =?us-ascii?Q?r4OBDDRGdXHQmeY2GJf9/uH2TmPWKJ5pJMSikOGYl6v6bId8lmXF9Ve74IRV?=
 =?us-ascii?Q?5wiXCgOOdbvaYb9hX+oabBQTB69IXrEYO0pmgLor6C77E6aNI9keRurSuVnF?=
 =?us-ascii?Q?1nMvbdrnZMfWuCsco1bULSkDiur/5loYWKpkAQayjqiv0Wx11HXXhwZrXmTl?=
 =?us-ascii?Q?jlo4xpP1L3oxAfT8VYHP6J2u6mcp6gd5xe9qDWGlB042OPG6CfCEO4SRevVu?=
 =?us-ascii?Q?nWjkdz+IIU6BbE5cpZa6+MTO3Q8yabYlt7FF45KegVYwgA+rgPUvJWVMK4Oh?=
 =?us-ascii?Q?/BVEqtPn4Tl/ihzGtvxxQCFTcPcdYhz3QOJV7/lXY2ICwHibEGigcewG955q?=
 =?us-ascii?Q?D3P4EO3TFfzRj5BdNsowWKrENMhnyI+V446l2cMQUlOFY0EADECaCO8vANyf?=
 =?us-ascii?Q?yI2K9zDEI/G/HajeWl9eg2OHm9OzMRMzgaQXjQGJBrW3Lxar6kvkoWiHPY8u?=
 =?us-ascii?Q?S/mdjb9U1riqOZKlHA5lg69uW0R2wu7r0cmFLgA/Q855FfyK1LUEzrrRila1?=
 =?us-ascii?Q?zeRMQwFW4hc+xBUceISyLUuToDi3CJpcDY6fS6fJdZc19WjGtW17jaMZEHVV?=
 =?us-ascii?Q?JJA4dkEyb2S5YTlre5Dg8j8YjdnphzWoi6cH1tSIJ0Sfr4bdZGeztPFJ+3V2?=
 =?us-ascii?Q?279EjZNq1UYAIHLSXxsc9VFSsio0Ct1WoZRkZW0hjaAko2bHRP/Rb520LS7t?=
 =?us-ascii?Q?EtUU/dCyHkyjJxpJNMyimvQiwUNc5ta4PcwlPaln14VzFenuaAEPb0Wwugma?=
 =?us-ascii?Q?W4M7wgkAMWqcjlVH3X3e42/ArwmVrlIFO0qK9SmYJn/X6zWGawu9Vr++/nvz?=
 =?us-ascii?Q?+lW1mHVVogmkTg7voOuEPxO4359jGxDQe5RDQqMb/BRAInn1oIl9ZaDyNZzP?=
 =?us-ascii?Q?FR4l8PYjyF076Cv2sgmmwC7aqyw+quceHbkqdt2KoAKvCcSgkgeuORIddomX?=
 =?us-ascii?Q?WqeUTr9LM6lFE8TX2/Hob9I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed50cc7-c3c3-4287-a103-08daff410803
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:00:00.0008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+Koh81dEQhA5dMTCVZrtwUGj//y5lvq0SVUgE6gSuF0jNYuNpglsTjGMThAiJwYXYGBwSlwpqkWBmU427DFvVuxvOiyfXw/6SjMSg0+4n403LI7YnCOpLyXXqF9Cl+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10102
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

Document R-Car V4H (R8A779G0), and R-Car Gen4 SoC bindings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/renesas,rsnd.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 679a246dd666..5319abdda8a2 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -49,12 +49,21 @@ properties:
               - renesas,rcar_sound-r8a77995  # R-Car D3
           - enum:
               - renesas,rcar_sound-gen3
+
+      # for Gen4 SoC
+      - items:
+          - enum:
+              - renesas,rcar_sound-r8a779g0  # R-Car V4H
+          - enum:
+              - renesas,rcar_sound-gen4
+
       # for Generic
       - items:
           - enum:
               - renesas,rcar_sound-gen1
               - renesas,rcar_sound-gen2
               - renesas,rcar_sound-gen3
+              - renesas,rcar_sound-gen4
 
   reg:
     minItems: 1
-- 
2.25.1

