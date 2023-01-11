Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 852DD6650FF
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:13:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46AC8DC05;
	Wed, 11 Jan 2023 02:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46AC8DC05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399599;
	bh=ACTIFyJwxtDybilWV8JD/R3njQGVBb0DVZOz3g9kHYU=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lqjMXADvkq8mdprj9iepOzAeZhCJwKg6bPJvT+u9S113sOKgiuSo5t+1PSnp7xaKb
	 CD0yiSF2lJTLQYpiOGRRxFkKDXJ30m6KoMiiar10sWxczbiDjCUow1i54C31EMieFa
	 3yeiQfXFjZgNAITIzXACsMTCDMWg2R7vyi8fj5sQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F2CF8019B;
	Wed, 11 Jan 2023 02:12:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FF33F80533; Wed, 11 Jan 2023 02:12:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2119.outbound.protection.outlook.com [40.107.114.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC8B7F8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:12:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC8B7F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=M09v4Ql8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8Q1+ZrYZayRFc0HlxDTkww79RBG4xK53n+/KSs9t8ioSVfhoywqJ/LKgyPDQvgb/3y/6pPPCl7Q//ZU5SlSs3463515NHuoKVu8621QFhTlrPJPHAtiqRxfI3ffLa5Z/sSC509vGQ+l/qh5vQ1HeOJk8ThPNEM+OxmQ4G45B4AJRw08bsdjEXeaHTEC9QFsvJ8dKm4K6oHPMhE0RyTlfwgELG15KfgaTfU7mj0xVuBOqxuDBE4MlvxYNcwToGOrId03uwNNWfMA+AiDsK+cmwAW7UrKv7xvFMZThHGRvZbapviu4OljjsDv/v5ytqBblU2a96PYJWLnd3wPS13OHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsfXneXi3tnYfAajAmJWSMmQeiVa31g6EPfmLXIBPwk=;
 b=lnQv0G+64mJwxsrM99zcIOGEgUiJtmWKaQXa16qgVySHWlN5CVmFcDI5n0wRiDJRh4lI9kKhLTGq5IWSsLp3NVbleEeDMIlrlXyR1e+/LxqWmicShRNWLOVVNyylaij88LPdIwyc2XRzWWUV+mFoWgzGwEVis9Mh7n0/YbUFrBRKk4yPLixe4tHzN165jD30P7Jfi914jrvV7CdW2WROEEASHpzvYmnhSXuPeu6E3HqxyLm3j64mw6JfR2c7YHz2J0Nb+Bh8dsclWNDyl9h1e4uJ/axLB1zmGsjJogVV/QT/eMzuxPOBykiRklpBzaV1ePJFk8e2gku1Kmw9a4/ajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsfXneXi3tnYfAajAmJWSMmQeiVa31g6EPfmLXIBPwk=;
 b=M09v4Ql8IijfhUcYVFWEcB7UUxE85TuLxD5zs/z+6As7+3H0mIwBkt5yVMDnR1JFQxDjKckyXG0k66VC6zW06dGdqDbnHlQD1bSkUdr+PhO+TGGbE6U5XVbfSSUW7N8u5AJxadcp+smUCyf1MMslTy9ICVax8skNKYQxLmDLusQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11030.jpnprd01.prod.outlook.com (2603:1096:400:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:12:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:12:18 +0000
Message-ID: <87r0w1ho26.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/10] ASoC: dt-bindings: renesas,
 rsnd: add missing playback/capture
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:12:18 +0000
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f87063-881d-4ae6-e884-08daf370e24b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFTAV0Q/rao2MBAnCiS8tV1NzqCk91QqBCrsn8sxuoR8cGjbnkM5xXSmdG/sNbQ/D8uVgso8XNrIQwVxnoGRMu3fVL/3YlVENZ5GWL9vrkovmKVJ13GWWMLuJ3TwqkOc3E/hXNaANEDR9ahZXOgx4iZWr8z5nUzlBeFquelSYZpzVnetAz8l34P30l5YSlZ57s9B8kKbHk6cJ3Z4fMHp4GBTgzdBG3FO4r4opmkEqLKyaIEJvFU/nEBTAPlNn3yLyP1l7E62FaOhdnddE/DxBkWQHbjra01U/igi6ZKKm9BmuKBdaHvET84ypPuhI6I2Q4mwCJyzAzeOXztnoJPKJ7ymgWW1OfCU+7zsuNe8sZlHN5Lm6HRkw9286EJN29DHtCBDwU+KYNalEULO//CQ55/HhcJ8ZCTutPFpRLX5+AWJ4Mf9syuxHexWnz69hKG6+iga09L8pahx5/roJt9jF+SxfirLyKKNT5uRNZLM2bmkrRIexconz0rznQtc7rF5FBk+7t4n3MC4tmwWSeSzci7EcSF+I1tAjzWEXTVaE3fvjBKXOMmE9vfFzToYn71IiwCs3S++Tz7qQbnMaKniKeQwHMWkLTdfNKsPMBBLgXZN7kSmufK8woARToOlcBCkOVUPmbPFkzQZeFloPZki50lFzGT4RurSGqoEv7YzXUCzZuXIfNAE2E1j8vwFLwycK6o6Dk5HTcx439Z2+SM28A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(6486002)(6506007)(478600001)(26005)(186003)(52116002)(316002)(2616005)(110136005)(54906003)(2906002)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(8936002)(6512007)(5660300002)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8awCU6Qweh9uVhFsOnVts1k2+aSEbXo79mxicufk5TQx+1AEz4AEOvg1A2fG?=
 =?us-ascii?Q?FZz5Df6Hxt36+7+OAudIVmqTSA4U6ZVaLvXj9UXnASebrSwCun10tfk6v0tE?=
 =?us-ascii?Q?PvANAMuAMAsR+lsiXo+YJwCXt7/h6oH/jzTrOGeT65xkCwNRqOy369239rq/?=
 =?us-ascii?Q?oWtuOGHdX3DWUzNHFvGS+xhUQOruERHPcILsE1ILxK4GD/EcCrzRsCzalenU?=
 =?us-ascii?Q?eMRi/dSdjAvtxkL6Az1ikvxkQpxxRglK29vWYjT93LEK0LXl1P2z8b/+cHZu?=
 =?us-ascii?Q?N/4CVBYVsx/kBe7EhvlhC30Fr6QDS9f4PD7Cq1ZGx2FdAQoJzvAek9qTns9x?=
 =?us-ascii?Q?vFVht/jxeTwFxvrOYmdrLetC1RmZ/4G0ZEIkTrhOgnC2+pOeJwWupSFawdEx?=
 =?us-ascii?Q?ShctpTmEjA1lG553sPrzzBs7mSF9hoFypD9/DFQ2uIWFTER5d55CKOX6J5Cb?=
 =?us-ascii?Q?4j8qQ5tzgUSX/NxVXqz8frPMtsR/qly28gsD/RjI7Wlw+h5abBf2Cl41ukhM?=
 =?us-ascii?Q?AuGvto+U6kn2mGwSXiEs/NPAWAHcLYLHbWPxk1ujLidVeu+27FS7NeQMEwOo?=
 =?us-ascii?Q?ccVr0Ww9LfNroPd5S7TPKOQvilSu6b5m78NQZvDFI+2jLiBRahPgI56dYOu3?=
 =?us-ascii?Q?rtGGJFO8jrmmnYZaUSYBeE9EtQVR5Wthh8UBgg9/fILYejuurzi6RDpj4q6+?=
 =?us-ascii?Q?47IYphvHukOe7Oajf944yCBWoVeQ6a7Dl21S/TqAQ26ENTf154nStU2hdUFv?=
 =?us-ascii?Q?mF/4Aiev1KYhg8kEC50YmZQ4iFt0iDikSbyqE0ywUJoPm9iRuA5XJAJ9y7s6?=
 =?us-ascii?Q?D71wi/bkDQNWoPv9QlOgYWXeGdJ44AnFNAILAoDKtNN6eQ6QVwQUiFa3aqhm?=
 =?us-ascii?Q?KLY0g9DLKHcU7z5PuWSphBeCKYMmEEfYW67oC82rjbX3UXG4Kx7YLegj6Mfj?=
 =?us-ascii?Q?PYaiBgBGDKuAbebET0hDtx1ssHg+mfb/D+G8LejBAZoLRNXTOQPTIRuiBNkX?=
 =?us-ascii?Q?WJMAmtIfbtn3FgH46QK6Q6vV9kHQn7wEE/tYvae1lfLsGuPGry7DBhoYg+hz?=
 =?us-ascii?Q?aqXmx1f34j9YaLQdCQEksZpQ2csXemOh2E5I9w8bN3n9YFwoWsHDGwj0FQQL?=
 =?us-ascii?Q?j9wLYg0F53uS4jRjAm7/bSryv/zof4rfywQa2vqiutmsk0vA/JV9JXvcVXYE?=
 =?us-ascii?Q?oCl2EW7OuSYPZNqi7L5vB5oGwAGTCsfcRoj87dLqjKfmXF/IvmPUfWmgmtpQ?=
 =?us-ascii?Q?FW/lCfdeE5NRi5rEQuIdgijgVzTR2cxaRht2g/NkI7HDdqs2diHhLmUOSnDL?=
 =?us-ascii?Q?SeS5ka0Vy/M0/Wv7wDmUhc6A/i+b8iDsT3+GVk0JxXSsPh05DVQi3kWMn+0N?=
 =?us-ascii?Q?r3ThoSbTbhmDwzTNglPMjMkZRNy99i1VIFhu8M1GW1y4Wid4BvfMrl8ngL14?=
 =?us-ascii?Q?g9vQmOG8B/mV4qQj0ceAheYeGLr1pqZXn2nEtQ1+zE/GWfakj1TePv/rYFee?=
 =?us-ascii?Q?FGXLBoR5LAOwm9w0QlrGdY4gU9PgX39KJI+Q8JN8F0aap0ayxRDWbMvcXicR?=
 =?us-ascii?Q?Xwnxj8DgB6vWfFGO9c9aGl001dw7Mpd95swMx+4hBIKLnBB3l/kO1HQ2ffVI?=
 =?us-ascii?Q?8bIxvD5hv0qypKZ4PTK8AUg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f87063-881d-4ae6-e884-08daf370e24b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:12:18.5796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Bs/upV94psyjWD+CJ/Q1LZHs2dl6N5PbpAoA7rixEqI4D4+IyTO0G4hjmNyca8kSEmvuTv4q34RT/lCd8ui7Po7fnJvdM7wQWwqN8JUNTlIHRpuCjAxJcfZvIUPHmHM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11030
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
index cb90463c72973..6ea8dd74932c2 100644
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

