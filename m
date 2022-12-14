Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210164C1C2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 02:23:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB95918C5;
	Wed, 14 Dec 2022 02:22:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB95918C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670981010;
	bh=tPRbuBaNy31WbHToDhLseWQV8y68ePJ9Pea2X2xN/JE=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DOfN3UqQAFvlgZ2PxrRI2ED2Y1zlKCuQ+l9fKIub0VuvkWt4Jcp4v4/NjCARgislZ
	 O54JYRTYpvRXDVCrmLxKU5PpMEWR/sAQGc8E7F3dsAxcj+Ix0nys2bsOF5t9nPDdPw
	 mu0RqBhFP2JTFi9jjfSWQ0dDrrKXA7bJ5EzhFLAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 404BFF80539;
	Wed, 14 Dec 2022 02:22:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B602F80536; Wed, 14 Dec 2022 02:22:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0022F80535
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 02:22:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0022F80535
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jKOn/2s7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgSLH9NlsIkNYwkCCQ/Sm759JeMNCKdtZXhHyMyQv/R9Lth+4a14B7pYe+4biGYQqzzf/Bh3AMxSw9s7xlUztSIOc+8QQbtAxOHf0PLD5Sgj560KiU2SqSc8bVK8VgSDHhl4XEX26A9j6vle9M6FbH/goCe0XfwKnPTBLXYS01OSiXlVxeTq/q4pzLTl512CWfxosnx93m0uzWWzHaXMKQbLHfwRrgPE8Uopg2pZxi4wnVtbVkS5uOqE+o4T5c37LIKgkHrsD7E10XTXK2KVStISVBT9bG/ulsBLOT9Nnff3RqmGUftLieol/RCIhPTGA5+qqDjdv3koE8UD/sb5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBZZDzYAtiw5TWEHiD1uLd5gcaae5a1PX/OLjrYafgc=;
 b=NgHqU0GAis+tnCQ9YruBYDk6zNPI0yh4iCZsVamAVOBSo8EgR3NVK34H8I2SwkoQ2aR5cDIDQfwj2ZcAsViK/J8OueotMAK7pxlk/eTVWn1RD7mxd+u7CLgzqmF/+oRpNmGFsnDFZFH8MnwUiIg7sy9wUGh/hMIaVbK0Lz/mDTwNRhqEO4C6AqzoGtjiXR/I+hDBEod09GnrATXfRwVELCWlH4aBah5AKjtHYrOxBLZRF6gDkcYEJu/h57ngOzOP8plbSipngU0mygedDUmNwW/60HRm5ynyeWZUK39vEqJ69TyA67bS4QUAhz6UXGJcNSo7EGGiMyY8SM6N7wKYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBZZDzYAtiw5TWEHiD1uLd5gcaae5a1PX/OLjrYafgc=;
 b=jKOn/2s7F+14/MiuFeoJdsrJjTI1B9WPiczp3AaXiGj54usrCcHCUacgmVMwPOO2ec11ZGpxFH/BiMv1TiBGCuqHhKJbZs+NxVh9UNaZHTFblA3iqosRiPN8otLKBTKV9RtLSH0RVtEK7OKAL1IBaU6MbsIIfwXImbvP1tc7j3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9898.jpnprd01.prod.outlook.com (2603:1096:604:1ee::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:22:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:22:13 +0000
Message-ID: <87sfhipynv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/11] ASoC: dt-bindings: audio-graph-port: add
 definitions/ports
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Dec 2022 01:22:13 +0000
X-ClientProxiedBy: TYCPR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:4::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd06f04-59bc-42ec-bb38-08dadd71a146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qT9ASS1kr9gzGJ0xGI/0ywZhSnRo1LvyVPmCvFRECjpjZZdB8e63xPU7aeWgwwnCCC2LtA6dEJPCEf9U2L4Bb1GLD2upv25njPhvZzHf3xfxf/TLvTP/xTYTtd12iRDoFwcH8Q9ZO7pTUZVDNF2o1dpfPISkGfkYhS15lbKHt4SBibZxiPauyRnFeQvpKwqyUpFWHwj5NiXBUET2TInBKfHuRQipVPiSJQaM0FiExYfyuI8NhGERcFm+Pao3H4aYZm1C/3u4id6Ra3T8KxbW5IFQiJw99S8c6ndtgIe0GpjCZVlp1XkHoqCiSOt8yCmEDDtoiBbIlVCt0C8L2SwIb88XQO0beu9z4eOsrWDszW5FzJfGnSG+TbmrG+cfMBFG2DS8xmFmBj/lZhc2R414hg18nlSEumgfgILelp7AypY1TsJbaerfBzQFwNxw9WC2aX257iAnIwR179pxVMaHJ7EFFaHbjBaXeV7UyjqbuX7ZpYMcznW59dtdE3oWp70Lp2IIRd00pW58YRIlpj54fa2a4uUXmpk/jm0LStSFtJ0X3i1/UZCpDEC9uCl8j7lvGcuGOfhbk0qm6Ms0Kfwuys4AD7fvIoqD5J905+JQAbh4+wlezCdMocSOLgKcgiX81Zr+i4sJacV0ZneWLNczwULhUiI3zN9VRTgER/vGwVu4MjSJm7pRfusaEJoJwMdMuUs2viquVmNfyVC9eI6eMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199015)(110136005)(316002)(66476007)(54906003)(5660300002)(8936002)(7416002)(41300700001)(8676002)(26005)(66946007)(66556008)(52116002)(6506007)(4326008)(6512007)(86362001)(36756003)(186003)(2616005)(6486002)(478600001)(2906002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FVWPNvSUpBiBcBkOCfX3I3/y6OKCnWOQRP7HvBm85QRhGWHDUOm20ElT/Kn6?=
 =?us-ascii?Q?tjsIr8Cuwq2ilvwL17PrZc9aqRPpwhLCn+9RHZPK08EGw8sTnsDGGCeXq7ck?=
 =?us-ascii?Q?OnGG8Bcbu2VpodmlF1Rm6sw5Q5oSsRavkckqE39wCaTi813/eC+P29waSAWE?=
 =?us-ascii?Q?nChWlq+v9axTZENnFZhsRcvzZgwbT7UjmnczP1wtbYk1Me8R3z6RDLGjp2xk?=
 =?us-ascii?Q?nttwuJ2p1aVbUrRMEP4zYB2U2X5H04gyrkpx7VNSxaxV8U4k8vjuAzrnWY8K?=
 =?us-ascii?Q?Js18qg8iOCdW0v884ZGL0/vPi0t9+oEmxM9OdVkx88BQri9JBEXAlV1i6FwA?=
 =?us-ascii?Q?ASEqP1oTaneYhHtRAxvWPhpu9SdLfBKKKmAdUDdUmRr6Ad09Qjcg/CgKJiOZ?=
 =?us-ascii?Q?Th39SBzY3+r+XjzjQ46bQm490CJKi3rqMgy35k2AeOOaTeXI/vj0aPa0IgaJ?=
 =?us-ascii?Q?meonDwLnKqktxWaKKdUOwOaI2WNaAQ2mMQSPYuF2RfFmVdM4LAPO1JK7U9JX?=
 =?us-ascii?Q?VDoo8ypbVk5N1s/Gn37nlWIy5niOy+43f4/nk/7v4NVjbfiJJL6QUx/a9c76?=
 =?us-ascii?Q?J4TU39hFGnGVQkgLlslc1uqESBE/nly5ny3a0a6y5GK2ECfcisl7raH3gUO5?=
 =?us-ascii?Q?9GP6khTxIGHW4kID8ijELn06s106E4SPlHDhCYtZOU+WeYes7+Ue73bFRLR/?=
 =?us-ascii?Q?5HHHpEZAsoD5UEfxFuzOBMKjpWEC5hiK+vq+ipbWl+mUe+kA5kfhsNbWmfOA?=
 =?us-ascii?Q?8+5zeJE1/tLjcp9kzs34rdohlyKK1syr9YlFdTeqMKlprnyXD0ouJJq5PtPI?=
 =?us-ascii?Q?oOA6vLUGr1bXesDCh5GulRCyL1IFX/CR+HHnme9/ubK5xhUK3tpp/cbDZnWX?=
 =?us-ascii?Q?O6n3tNPhL1so9jYTYVXgDQjecC78KgOIHixKWxif5kKDWjrLX60eM/iNnt7+?=
 =?us-ascii?Q?GDyN8KSPDP1Zh4ldGayB+0Nrg2g4YRqNlWGdArJnrPRgnxgkYOjTdqbPGemq?=
 =?us-ascii?Q?R6ABHh3rFfHyIL5NzNZwpj+uQ4DGbKid/HC2IWLCPyztQaNdk0y7/u/L6d/Z?=
 =?us-ascii?Q?suOVUqFCiPmvRXPhH/FoGnRSzqYycsSJGCfsV9hoYn9AprRCjTkzfL+1vctR?=
 =?us-ascii?Q?kl/OK36uZTvH/89ua4wWwLmLYGci9FxyXR4Pgesy+nbpKNa9ttINx3/BSx3Q?=
 =?us-ascii?Q?ZFCmSdK1EUFlTiWq5HILazXbdec+9r8kjr3yQxNSMZaByeYva25C+rNcq15N?=
 =?us-ascii?Q?rTCaXCJ4uo3pHNxeAKE6o+YSH74MT2LX7XBzvlQK66d3R25CjZDDprfLfXoG?=
 =?us-ascii?Q?7z3j33uX6RiUzaoi5hUayg96DIyZliGjy2Gbj2EBIMD09rykvSd43hsQf8V6?=
 =?us-ascii?Q?RuB0Gfes2IbrC02WYH4zrOtizae11Tn51UWmlrSvLHw44nF9cnlQq39Nw0QG?=
 =?us-ascii?Q?Ej0wtDplbh5XkaT6j9XU7pmoszyFSZpjhO7Q0eewDRKC4KwykeOnoTIw0j/x?=
 =?us-ascii?Q?xc4B0B8LhqFagCF0nTMGMRbtk5PJb14KjsXtGU23RRonEmTearJDcY1eMKKX?=
 =?us-ascii?Q?yzBVIPzoi+elXaqyMIEFixX2XOPScTCwN3ByEtJU8a0Ww+Fy1xXvNW3kIZTb?=
 =?us-ascii?Q?P6G0DZeosr/Pdn6EMdB8Uds=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd06f04-59bc-42ec-bb38-08dadd71a146
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:22:13.4250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jgm+apXO3q1axoKvKJXEbIV4a+b5AE8dlqcZQcWDK+o5Ywo8LXZdxK+mbwYwB0zeKHDpoCfHqqnDmFyOqH+ctelW0Ed2QO7Kj8fRqA27Axzri3fea6zaMgUfXjYJtY+F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9898
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

Audio Graph user needs "ports" not only "port".
This patch adds new "ports" on audio-graph-port to use it easily.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 56d47dcab490..273da5a76b8a 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -97,6 +97,18 @@ definitions:
               minimum: 1
               maximum: 64
 
+  ports:
+    $ref: "#/definitions/port-base"
+    unevaluatedProperties: false
+    patternProperties:
+      "^port(@[0-9a-f]+)?$":
+        $ref: "#/definitions/port-base"
+        unevaluatedProperties: false
+        patternProperties:
+          "^endpoint(@[0-9a-f]+)?":
+            $ref: "#/definitions/endpoint-base"
+            unevaluatedProperties: false
+
 allOf:
   - $ref: "#/definitions/port-base"
 
-- 
2.25.1

