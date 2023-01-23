Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 446F86774E7
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 06:28:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430DD41F2;
	Mon, 23 Jan 2023 06:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430DD41F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674451684;
	bh=XzVmlTotdZvrFRR2cR0jhkBbQ9k2VoafYV9hBNQQSLQ=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MxTq12p/gEnL2690UOLHF1O5qiCnT5zPPowjmbcQqaK660miKCFWfb/t3mTw7S0Pu
	 +kNB2PtPOsamy27nI7Vg4Dc4BV5BwH8b43YgpFZgyAQT3tQtveqCv9GhBReBYLG7v9
	 6vPXlN0fl1UiNCIhqD2UyZWnGJwfy4rAdq4BYKro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A533FF80578;
	Mon, 23 Jan 2023 06:26:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D639F8057D; Mon, 23 Jan 2023 06:25:59 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DE2EF80571
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 06:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DE2EF80571
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MP06OFNB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF37z8+fQ3CNMAJZV7ANts8PuwRQ4CuVNnuAnEnoWRHz0b5A4jl6B8GsEqc1iJLB9HqE6B17XrTBCc05E49M/C1YuHlbnwEelYw4dinzFsyFWibRtI1EuVftKacv3OiLao6rsT6QYYEL+yHK75/F4I/rexgLtHI5ENAY5jAFlFRsQWMpbHfAB8r4LlTYtOMYP7FEEKHgqB2JqnFPZLjYxk6NasddE28N90KSQy4sJnjKV4CjOlnBJtXu2A0rHYYY5XUhww1nyKzjXAm7HD8xgswoAlUE7pGuSiFsO7omMkblmWimEtHzhx31WDpM/6M4ZMr+zp0vVfkAiHra3iOo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbciS5pk8QNYCSqvId0FDb3waNk8CsY/UaCY6+rPYbk=;
 b=oRYOMjz4n3jqtJW2YPTtf2giW8sQscJ/+q+/IyXItSJzQLVy+0XDsigjeLLIcLaIovQZH4aAfDJxN/OaU0pXmYalGEvhif2Q1UJkBOfBl9i7njQfq1CGu+46H1jO9HZ0OkzFGWpcjKNKRG8Cj4y4Jxr55F7bMwWDRe3ZaHWqiPf5JKFwSI7WcrvE6aMK7Iwdo06XQQlKpkejv70np07vU43j4AsatuI1jHnkU9V/HOcjnBGVgqcaGOWMfjajYI+akjgcvOE1BXdyaE5Vokln6kuwwEER9ODjxYNAE0lQtmevgA3q3cgEViwdM7Q4b54yL8gAMjRiLMiRGCHXRJpEQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbciS5pk8QNYCSqvId0FDb3waNk8CsY/UaCY6+rPYbk=;
 b=MP06OFNBFh6nNFWer2IYg9aOz4CK3QLYNcN+iOajmy8WqLajEZmjfVN8vY2QRY1Yy+G5JHMPrJyxigyFk3O4ECeqjMxsjcDxOGD1sWLzfLLq3EmNopU64yyVAD6Dpp0WUG2Ribo3jK4p2COq4LHwR+YNH4qC9BehJ1NjbYTUwro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB10497.jpnprd01.prod.outlook.com (2603:1096:400:2f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 05:25:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 05:25:53 +0000
Message-ID: <87h6wh7rfj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 08/11] ASoC: dt-bindings: renesas,
 rsnd: add missing playback/capture
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 05:25:52 +0000
X-ClientProxiedBy: TYAPR01CA0017.jpnprd01.prod.outlook.com (2603:1096:404::29)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB10497:EE_
X-MS-Office365-Filtering-Correlation-Id: e464804b-9a9b-4b77-cebb-08dafd024bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j61liSrl40I7+NN0+jvOFVPy7HzY9wYNbKmOQIaFAiWiK7dNTPZsqxz6dPe7XT4aCY5PwTOoiRePQsm7s6KhILOfLIUXjoCri4peuldomer2uoEq/TOf8vmRMI8gxz1I9UbWz2wSeEeU4jPZsQcqFyc+Z/azHkfnYXDDQF1XRJQpw0/Tbp5WzNMIKNUZ9GO2aJz/8qtf0eeXB3aEliPtpFxKRv7qdX7SbguylJHJbNeQIBOwqFn15XcES6FybAX1ZZvCtnmgQo/jULgCQRHylWW0xPtaIya8edmTe98p+ojnK9bY2S/m9m92Ob9R2eeRmkSU3zTk1QR2uzhLkiRazfggfNI0rtcCZoGicx2jKIcm7FXHBiHv/LoWLdUTR/gaNdXg9G5LxL21bDo5kyLtw6kl8CtpVOSrz8Y4kItnGQe493QrCjndd0M2VEcSGFOuRqg/5L/WLz3MIpDvo21ZimFZsxwjiXaqQM4Z8o7LmYVbZX0LBE+B3Z+eqqCyLv8wTv1C8MiE1XcHHtX9/IEUUyMj7q9vezng+glynyi7rgRh2Sjp+GQXIFKgen3YCCDu90Ww2RSR7Wzs6bU6I811tTho47LOeKdYxKWKz+wyAWgghXjEBXsLiO0+ZZhpfcpkQpIoAC78iH6K2xZKZVzodg7tBqXhTw8nDhewCpRfjtriiurUR6Uvu8mQls9j2VlBieeR2MMNWGChBTkijuhrKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199015)(86362001)(36756003)(316002)(54906003)(110136005)(8676002)(4326008)(66946007)(66556008)(66476007)(186003)(6512007)(478600001)(26005)(6506007)(2616005)(6486002)(52116002)(38350700002)(38100700002)(83380400001)(41300700001)(8936002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2jEixni2wn+yJCkHfTEvS9DNytnmBmKACVPKwato3DGRDxCA9jjnmaxHyqCf?=
 =?us-ascii?Q?4Vw8kpyFDeSB6yUtYHgPF9Il+kzCjfm6dP5/HQpvc3Q6H4EnLlGkswPlo6rM?=
 =?us-ascii?Q?GZfQO0nqnmDfrzhdofG7scza57c4+iL7zUvfXacrqyNh+CD20hl8GVxySzdq?=
 =?us-ascii?Q?bB038+a2mcXM5ZmlFkaXOMTIGp3X4HB4iOEXZIHzPm7Ky6x76WCqSj0aPrJW?=
 =?us-ascii?Q?pPvs0NFEXL+aXo238a6shpOYwcZQRNPVDAJckY+7Pfi51yjq64/qh2XSBncS?=
 =?us-ascii?Q?b+/B/F3PF201P3QCDegEDE1t5txoAttGZZpk8CHYjE7mn2v2iz2AyU/th2mG?=
 =?us-ascii?Q?B90MSyxMA2ZDpf3pxDZAD8OsWFv+9YdjkwCFqjfEcY8jiuS6jGk/6uX0hhqt?=
 =?us-ascii?Q?pUs060bhgwKxwCTHp1J1kOY/RMQLlpxiZ/sFMj6aHZwQtJWP8XgHcVbeBYhl?=
 =?us-ascii?Q?/jzoObnc+2QgwEpVbOk5f+S6H4a0VcpUx6bb+IDl/eQ+ibfkmO6xukvK6s/E?=
 =?us-ascii?Q?l1eywrFRVbXZuo2G76NlQ1inWBmVw4Stc9e/mltRHj7l9Ksyh3eNC/8SXE1A?=
 =?us-ascii?Q?tUSQyvq+jxkwDfmslg215bQCvomDeuYZ7+R8is54/tQdYPDiIkZeCN09hTEN?=
 =?us-ascii?Q?psXj79a6z94QV6msYtevs+73K6HDbDSyhDyOiW/x/fuxlLg/GKlAgJcobF0T?=
 =?us-ascii?Q?y3icR6JT4D1ROFQaDsVZfg92njhIb2S9TLeYaT0FIC8RZ5dXFJcjzne7hCWi?=
 =?us-ascii?Q?xJrZdQRpuTxudB0/qy6xqx65KUL5gqE6tTml2JOKsmZuSFNql95AvuHxYNA6?=
 =?us-ascii?Q?1geYHRMtqe+HJKSWPTBryz5toQi+ST32b9q1pc8saMeZkDEX6W2Q43NeZpN+?=
 =?us-ascii?Q?M4LZx4cQlT1h7cxy5q2jvlCvpjlPDEshh0XznYb4LCUxjs3QiIlfXSW7P3vH?=
 =?us-ascii?Q?NX15c9ONQn0JlHxOSqdwUtY2SjtI1Zfkme29+0a7fBuBZV+Eo8EGPKP/578h?=
 =?us-ascii?Q?nFlW8r+Zkcb9Jx8E6yLg+Q2m426WeCtvL9n0JSWC2KRYOtIa3Mv2dkFeJVFs?=
 =?us-ascii?Q?Rlksb8Tk+a74RcCEhkTI+u2hznMuRIHpNWRy9d40ubuAVBFKdAx2lxhHr/lO?=
 =?us-ascii?Q?afAlDDRdYKZuMhRtKkIi4BAPH1iqpoNizoANx1yMqBUneUzcg+fS7JR8/Aov?=
 =?us-ascii?Q?O2OiY9I3OB+4BiN8AAKa1TN3sAs+tILeVUznlwAom0BNTWyJRFaSoeZGQS3N?=
 =?us-ascii?Q?Ig+kHRnNLqyyo+hTUqS7thsZLxCrdLQg+XpTUlA7D+U1XcPKtN1mqF2JAeUe?=
 =?us-ascii?Q?WnTPNvX20s8AkOucVpm8LqLVlcD9t4VEPJgHht3PVfvUw1GwgOR8Q0b9cME5?=
 =?us-ascii?Q?qxCIYKdTTPHUoMEExi0yRsF3OaDVqlgWtWC3qXhrYBAtOZNZhbmtzRuVoSU3?=
 =?us-ascii?Q?2f6IHv0GAdfTPE8sypbG/HMKjmH2hlDAWQaOon+YKIAW7u+LZOkN/JELKlJJ?=
 =?us-ascii?Q?hWhc4o2BgEngqcNPtvs96M3+jrCUjRfuZBbJFTSnBVVb+kb/0eNcQDda0kaX?=
 =?us-ascii?Q?xrwYYHdgi9hQfPG9qi575E65WZm4a2X0KV1oVFEz3l3w7ysmjej7lX5Y/TaQ?=
 =?us-ascii?Q?id0kApRTK4dW4AgkjOo7KWM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e464804b-9a9b-4b77-cebb-08dafd024bc8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 05:25:53.1746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIVXsvdU9LaRi/+qBPOrFE3cTpPUxNQuVIWe6HsuRs+BxP0mhsI+N+ESgHk95e+rwpOUHexQ2tPpEoq5TFHosKNJeHYEUzflQZEAvJ0Irtyodvc/Nd6CCa00T9Bu8UKL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10497
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

renesas,rsnd.yaml is possible to use ports/port/endpoint if it is using
Audio Graph Card/Card2 for sound. The schema is defined under
audio-graph-port.yaml.

rsnd driver needs "playback/capture" property under endpoint, but it is not
defined in audio-graph-port.yaml. This patch adds missing "playback/capture"
properties under endpoint.

Without this patch, we will get below warning

${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('playback', 'capture' were unexpected)
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/renesas,rsnd.yaml          | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index cb90463c7297..6ea8dd74932c 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -113,15 +113,34 @@ properties:
         - pattern: '^clk_(a|b|c|i)$'
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/ports
+    $ref: audio-graph-port.yaml#/definitions/port-base
+    unevaluatedProperties: false
     patternProperties:
       '^port(@[0-9a-f]+)?$':
-        $ref: audio-graph-port.yaml#
+        $ref: audio-graph-port.yaml#/definitions/port-base
         unevaluatedProperties: false
+        patternProperties:
+          "^endpoint(@[0-9a-f]+)?":
+            $ref: audio-graph-port.yaml#/definitions/endpoint-base
+            properties:
+              playback:
+                $ref: /schemas/types.yaml#/definitions/phandle-array
+              capture:
+                $ref: /schemas/types.yaml#/definitions/phandle-array
+            unevaluatedProperties: false
 
   port:
-    $ref: audio-graph-port.yaml#
+    $ref: audio-graph-port.yaml#/definitions/port-base
     unevaluatedProperties: false
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?":
+        $ref: audio-graph-port.yaml#/definitions/endpoint-base
+        properties:
+          playback:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+          capture:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+        unevaluatedProperties: false
 
   rcar_sound,dvc:
     description: DVC subnode.
-- 
2.25.1

