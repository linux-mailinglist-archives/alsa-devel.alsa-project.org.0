Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B064C1C0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 02:23:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F91D189A;
	Wed, 14 Dec 2022 02:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F91D189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670980993;
	bh=4Knnpw152Ztl6RzOnTEr3QSgp4DHVI3jsuS71XQi3no=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=J1VtbW+eNqthvYNeGSAQcGXLHVoEkjQTLnvzucf7kg83LSCNmYtnZhXj4R7RfXPkj
	 W0099GbDLo37kkJoSGFioZ7Kffb+g9/6sGzNn1JdLZnEyn54jawVRRCic+AtWz10lk
	 yh4QogVj4EhkiIbXiP1dRcC9Jj8WyiJjgIi/azR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 872C1F804ED;
	Wed, 14 Dec 2022 02:22:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E8F6F8047D; Wed, 14 Dec 2022 02:22:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2111.outbound.protection.outlook.com [40.107.113.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2D96F8047D
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 02:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D96F8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=B+bDQQJI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzO5gIP8bVJqBA2YVVukCtNdeZAMg9I800SNEZUcrSQsLe/vbzFL7Sa2G1j3YUvhOGgYN3g/iALV6ifQLHgb2XNrGqauyvbYYhinEnYWMmCKV+k2DR81RW0rX+uR0dp1QroSu853RJLDf3cfG/3mp2oDe6mRlEmoTZKuj3VSC9dcwDSt8Ug3Q4Gvf5ayqwBn4fUhdo1AOTzhb1oEtFUbJV396vPKZY8Hneaj56MI9K4oQUtUqX9o4t0KQn0/80GfDYGYCdmMQCfilFjVVHX69H4c/xLsOtImmuJgZRItUyZTKeyHLj8lAcBCFnTeBc0q3L8cSHh+NdWM5Bfj3EQpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQI0IEn6Mv9OoQ35woUr7Tlg6AK4pMrAVpJD44yHP1U=;
 b=CnhvX8e3BeUaVmT7SLKw5WqJLiHdAyMIzMjNlZUEmWlWZcg0mRCOe5PWq+NyWtONiJkyoZqzNxcZ5QECgB3tmeZRjf1zMUs2OXq4Q7EDjOOEZL52EMyFRfXtxoRRwGVEMEmL+tb/RVDhFxjDLzX1TsU+q3HQ6i+J/4SbKJacVy37EQM8wiBzHZIQSlasg+sziHjsyKdD+nmbNlb11ub0+lxktNrrmFx7/QAx+8f3OlyqeNQLfLB76S1jP/73GAXa8rUwLPjcmOVpVYpj6pmgrFPwzBif+w+d5sGui7X8B0CsDipo5syI/hYMZdYDrrasx26G0M2aVcm6qfg9RWAwfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQI0IEn6Mv9OoQ35woUr7Tlg6AK4pMrAVpJD44yHP1U=;
 b=B+bDQQJIXFf7njTih07VBdGp3XWx1ziKEnadrVVoLLfIao7ij//AIi5qXS68fifARjcOGB3RqgbLxeZIq76ZqzQfyqjpg8o8/bzt4ab4R3AJI75rG7TM4d5Rm7XBonqrW8sUBFOPG5bBYgXR/Qe+Zm3BqLQ31hv39msVxpuq8gI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9940.jpnprd01.prod.outlook.com (2603:1096:400:1d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 01:22:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:22:05 +0000
Message-ID: <87tu1ypyo3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/11] ASoC: dt-bindings: audio-graph-port: use definitions
 for port/endpoint
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Dec 2022 01:22:04 +0000
X-ClientProxiedBy: TYCP286CA0211.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 79dc7f7c-4e90-4d05-cbe9-08dadd719c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2skATAJ7vYxTfHbG3M39BcR+UGW7HMlryk5vF/dp4ibl/ynReVDA9p19SyWgrTdvDatgPrEkHroDdcL9xtnsvn97V0KRyZ6Ox3z+7qlszhQ9VPfC3StYVAuyD+H4nR07Vtv3Rq6bCL26Eb3tRHd0i7gMbTlccTJFVmMyzXUoj0Aj4fGXkC9sRD6btwmdXUGkJfPCwTD/owiKd2BSYqN3OYOS15qOcFtNwWNFATR3nm9VqDgAHDN46XsispTQppznvWtm6Cu8tIvW7jGPaOtTe7zTG5E2Gcw3s7xiRD/t9AfC3xOp6Fsnx8BSSM26rOID8D3PkRtZlJN2YokbgZZWvBs5qVse03u65anRBag+vCHxyLjAliZEtEUnPZ/g43HvpZF6vtgDwrfepHd5Bb7IzFuVUBgzqEBt6PsmI+E3IAY8009gWfLp5HfRJYguNxtabrNji7aHJBhBMj/4+0h+6NQ0J4VTLts1Nm9lYyGrp6HE+MNaHIo/cSskcxZsWXvjM49TpCQuM8lI6I2ONo3siendSMzby635yD4Cpccw7zuc6gQb6MKc4QdbywtH7Xn/mmFwdRli4p+HPzzpAIOpGF0XvzCGM+HyANY3bRasFMAbncWjSNPaU7XnVFFGNV8TvbwCeFxfIU16tLcPUi4mCRASqfUjBjyDIbNA75EG86j9xZRucVziuTO00k28AngcAYVgXk45ujl9KE8yHgqOAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199015)(2906002)(8936002)(41300700001)(4326008)(66556008)(66946007)(8676002)(5660300002)(66476007)(7416002)(36756003)(2616005)(86362001)(52116002)(6512007)(478600001)(26005)(6486002)(186003)(316002)(110136005)(6506007)(54906003)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LV2roug+CzUz1H/+mCR95dqATC/zh7dxJ5YPfB4ziI7B4TgzsIqc0FZCfhZP?=
 =?us-ascii?Q?j9ZwTcAFPPfiGcqWof9IgWyhRkoMCJBNzguRRlAzJHU46jejW54piUdgtYtt?=
 =?us-ascii?Q?1YYl2BIAlXbxfJfpUikYKorct4Q7ippe/JwiCQ0G0870cfswSqr9HDY8kApa?=
 =?us-ascii?Q?6uTtW0Libw1MrRSB2VNcCtjK984UlyPu+EEDV+ddo2ejLSlAX4aoc31TMZkt?=
 =?us-ascii?Q?fD1jXyKiLBg0k+n8jSNj4ZEsW5/qbceoKKSS2MWiLJI8ffvakCgc5njAza0V?=
 =?us-ascii?Q?lR1K11aWwN9OaumhEkqjvK9qtkgnbUOXZrn/2ltwUzOvHbKaHamafe+cZvM7?=
 =?us-ascii?Q?i9GAC2qndW28b6baGIh5hhf2iwC6Xao870pytOyyWIURgrvfWApdVbcYkSYR?=
 =?us-ascii?Q?D2lk9bD6K0dgGo4yPAFhiaxwGkW66R8yn4nSjgIU+noewJFHs4JsBvvYGmVI?=
 =?us-ascii?Q?YM62O91pCDBKw/yutoXgRpoP36pEG3TFVtXBnszJ3Aqd0wUt9xJJ8XZyVYio?=
 =?us-ascii?Q?A0zvoGusOkh1lFUuH2/mo834CRtywiNLCeR0Lr5QDk5ha7giqYxNdKtsajMs?=
 =?us-ascii?Q?tFqTqSitCT/bIVQwJwEF+jTxd/jkjUHBzVdmUER3x9bcjdv37rz3Erd81Whf?=
 =?us-ascii?Q?1UIcaw1GTUUCMz1j/hiWo1bVyfsuNFs6n/48CaaZ4dzHTnMUmqCHPZXmubo2?=
 =?us-ascii?Q?2cRFvZUU/+yMbn64x+yGuLZv6aquLIs8fWqumSB4C4o/wNWH2xAEEE6VU38W?=
 =?us-ascii?Q?9/rj1S3c/o7r0VKqulEspDG7gTNYZZ5ofn4b0JbXbtIvKYwBDk7hwijQ+UGP?=
 =?us-ascii?Q?IxdY4Itc5AuHCzOK0UWBnJS/jmhEXSwSP+/+Iagot8oL35fWLPnDGeFyvOCV?=
 =?us-ascii?Q?WrNVoEmkB3QN2prIYapCECz7dQBa+ZMlUE7DXtN853+7Ih4TvVMBrZdyHHh+?=
 =?us-ascii?Q?woJQembyHauO8djykQmyNRWS5aUrsm02VpiwxgvH1lG76rb2IsovLgo3zQX7?=
 =?us-ascii?Q?5Z5Oemlc+Sc1CEUH8AwV4bLssdL0uCBSBT/+XJWP93fDjU1H2BTUbahDdU65?=
 =?us-ascii?Q?M3+qdQ5OGn40jaFxoHymCEXbpPn2q14pfvGtNUTfeWIy2BtnviEv+L+PIGTB?=
 =?us-ascii?Q?//U17lp4h0alYmpt0k+TjVUZDZv9ISi5mUDsAdaTrFunfnx9gJ6J2BG44SBS?=
 =?us-ascii?Q?RzZR9TEwxKrdvEd9jJMyt7/+QkMIQtRmyW8EfWKD+wdzztQPS6PWa+NkpUnW?=
 =?us-ascii?Q?GOdOHdsJOqm1z3dE6Cs+gD2xg0HKHvcm/IC91L+D8VibM1QXP8zmo2QNvKKd?=
 =?us-ascii?Q?yD5EoL7s45j/UNwDsJvm/qXKJfE2audA1ydXNI2lUjT3x8TUygp8lmGjhoUy?=
 =?us-ascii?Q?DDztsf/CdpL/91Q7VjnTN3GFj3mnq6LMQPTxPZQRpDWF8sziETrzG5GgtUKm?=
 =?us-ascii?Q?+kVXh6+0dLDhUHL9fJxQTzNQOxs5nX0F0RaMCDv7ZTmEJTUI+3GinnRW4HTc?=
 =?us-ascii?Q?Py1KWrXaheuBDA7YOKds7801w2t9PpDWUhBlRUMrUUAq3y1DpSivGHDxc8yh?=
 =?us-ascii?Q?qAGircn5V5dD1loa4ulGu8YttOVxBsdo6mDuniyu/6cUmO4GNhUUUTTffqd4?=
 =?us-ascii?Q?8oouk/T8UCGyO/lUoXb4kB4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dc7f7c-4e90-4d05-cbe9-08dadd719c64
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:22:05.2348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHfjf2xImZX2kQGRQblNM6G+4Gli4MZnj1/UPOC8+9CUn70ZDHLEGDZEpwQVBJe73xHItPD2w2XtalXBqZyY2BZZwBI1lByuBOCxdgTDwjq+A2fm65DyXltATJjz77P7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9940
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

Audio Graph base driver might need to add its own properties.
In such case, having definitions for port/endpoint is easy to handle it.
This patch adds definitions for port/endpoint.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/audio-graph-port.yaml      | 39 +++++++++++--------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 64654ceef208..56d47dcab490 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -11,25 +11,22 @@ maintainers:
 
 select: false
 
-allOf:
-  - $ref: /schemas/graph.yaml#/$defs/port-base
-
-properties:
-  prefix:
-    description: "device name prefix"
-    $ref: /schemas/types.yaml#/definitions/string
-  convert-rate:
-    $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
-  convert-channels:
-    $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
-  convert-sample-format:
-    $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
+definitions:
+  port-base:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    properties:
+      prefix:
+        description: "device name prefix"
+        $ref: /schemas/types.yaml#/definitions/string
+      convert-rate:
+        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
+      convert-channels:
+        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
+      convert-sample-format:
+        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
 
-patternProperties:
-  "^endpoint(@[0-9a-f]+)?":
+  endpoint-base:
     $ref: /schemas/graph.yaml#/$defs/endpoint-base
-    unevaluatedProperties: false
-
     properties:
       mclk-fs:
         description: |
@@ -100,4 +97,12 @@ patternProperties:
               minimum: 1
               maximum: 64
 
+allOf:
+  - $ref: "#/definitions/port-base"
+
+patternProperties:
+  "^endpoint(@[0-9a-f]+)?":
+    $ref: "#/definitions/endpoint-base"
+    unevaluatedProperties: false
+
 additionalProperties: true
-- 
2.25.1

