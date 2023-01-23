Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0786774D5
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 06:25:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72C1941F9;
	Mon, 23 Jan 2023 06:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72C1941F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674451509;
	bh=FCA2dQoVJe6bdXF4wvhglikvCFkBtNnMxHrSgLcO+W0=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Xb1mvy/3myvywFmAJbawhIB9QgZkqLHUbKeB+U/IcsCxJtSgoUZ49uNPErlHSiJ7f
	 eAEYD1fnnU4lO9d7EwQwBxqfNsprIEhmkuBhqy3b4P0l1kFbQSpUC9iCuS7YKuUcMD
	 n+ANaJZZg+8Q+tWviZRqPJAxFvCJBieCCiE5sxzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A820BF80515;
	Mon, 23 Jan 2023 06:23:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4357DF80542; Mon, 23 Jan 2023 06:23:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6189F80515
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 06:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6189F80515
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TDrbv7yG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFSKWIe25xA8QH9oR2R9J0QqZc46HD/EUlNk1vl3sran6thuL0ficaRhiPegbLIeLG/8BAFTwD4/yWxjXZpBVQg0wyRqZbtssfSV0KKgLLbp8MlSYw2DXwIhLmbl2OcCiVby/WzhEQn+OqQ1lfndtkOn8n5uV0gTZt9Z05Zs16dXhIayf7k2XoVi7rUKKvxrmxf83SyK48mS9gT+9BMZmH+uFIjjTzySd9w3ngjZKypml1gwZ/NBYYrXeqcZx87mQZc8oSEJQJtioDY4xIx/nyN/t9jK9weWXSL2J7J5/apQ7iVnxGKRCVFnaKIHqwG5m/dGagxBRx58xJckAdLKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4VgPyAXAOxVe9+USmVzBEf/JHaAuVjaJdtj5xIx0bY=;
 b=S8UNeSGWM0Aqp+WaZy8kgdT8qgMoPEk5YPw02lKKBm5ND+mAmshJwn/SK7pnjOpzFHaUipenCtWY+h2Mk36zW0o/WtTAkBp1+kq1xDR6Lqn6yinT6UaAZqtU2Z4UVrX/fU4nPsqsGcDv0NLrZQuOS5VQwlqxaZ3KMzAaK6sLHO2WI7pt+AND1QKTZCKsKI5RwIqTS0mZkTiSHlGqe7/gxLT17O25rwGlbZI9Cymh2EH+143Xu/JCm99y1wPj6q+MiPV9H33JleOlx7dB9Hylgp50SaxBsCcwLAngFjQYEijlu9z0i26A9IyCTmdaHt/k/yZn7xRmPbWaCQxYIo8bAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4VgPyAXAOxVe9+USmVzBEf/JHaAuVjaJdtj5xIx0bY=;
 b=TDrbv7yG75KElpDsyPB1DL3YeixGh8fSWTVEOQ2L7PLRIpMDP3993y0tu6HWCsfYyO4fmmIUvEuX0OCF+dkm7U8MEpdFyfbBV9fUZ70s28VFmfnqqBEXdFZUoGgHgMAFHAL01bMZDqyM07gIq4eYJANdrwCgcUQEDSq8TBdjLYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11546.jpnprd01.prod.outlook.com (2603:1096:400:38a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 05:23:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 05:23:43 +0000
Message-ID: <87r0vl7rj4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 01/11] ASoC: dt-bindings: audio-graph-port: use definitions
 for port/endpoint
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 05:23:43 +0000
X-ClientProxiedBy: TYCPR01CA0019.jpnprd01.prod.outlook.com (2603:1096:405::31)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11546:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6963c0-078e-47b6-1e7a-08dafd01fed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uwxp2IkxMgbYhUldKwoX+lOR4hLXvrPJzUBSmDhACxlm5O3xCR1ocWSXxZMKxea9Wkkzg1Oi0ryOnFqpFqBKqiNkO6zJUNJL5/q75u6ztkU14IwNF4XHo3N0dFouEjxcBFm0O/abGImrgG2ODvlyf6Pkw5TaocXpVzDwXBH/zZmconqTX4JVaGps3tq8NMx8z0JNnJlGu9s1Dz7SiMFqs+BAhfX2J7ZST6yIZQxGJRs0iS+8Sja5Hhi5AcKs+IhmiMdZq26X9ntlGV4SBvRe9UxrDGwxmcrj5Ofv2vgM9Iz/e3u8rAjvfpZRx+2dQWjmgHb+9nrNUdJEuydnk457rmPWrjKq9TLisNwLbQjkwINsFTN/lZ0sW5kWJQwcH5pwqaDnky6c19pQ+Ik8W3O+mNWOHoydnhOu6zu0VltBk/KmH1KTYhrzFPypFthfR+744YjM1B5EpUfdga0MRii7EK9r49dLYgmpL1UwHjjfchOSigK/0a421dkY70E6I2/n2VekxB7A9KJm+Gz0PUqzcR0amayNLuKTotrUlGF+RaZehe0oh64b+Ts9DHVw3ALLiPkFNKtp6q8knc9HQc8IMnJTovGFHji6HYYGic4bpTf2sdYagSd1+ci9rIdCp7scpEhSXTdGG7/wrW8v/YBl87L+ORuFbFQ/kz7BXFY5XUz35erXC3T+Fhl1i6wpj7LgQqom17bAE0HGhok6oFNN3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199015)(52116002)(54906003)(110136005)(316002)(41300700001)(8676002)(66556008)(4326008)(36756003)(66476007)(83380400001)(66946007)(86362001)(38100700002)(6486002)(478600001)(38350700002)(2616005)(26005)(6506007)(186003)(6512007)(2906002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EC831ykjAQkEHZDN0d+gNCPmVM8Yz3WAjqt/ZcmYgvdQSgicQBOe3d/Ddvi6?=
 =?us-ascii?Q?jagMAusByDUu5esI3EAsKkTTodn/Wqq2L4kWkT2ctXVIyxMB+Io8muqy+m7i?=
 =?us-ascii?Q?DWGid29KlNsk5I3MFAhY3QqPYg1Iz78B3fXUPZiiLde9SL8LzOzKZdKyFgwS?=
 =?us-ascii?Q?DViuln/0Y4WAn4v1x37I3lEPFSt32/OemCvpysDyQSa4bwuKLYflO4OC8J+D?=
 =?us-ascii?Q?3fel2U8mSGiPuMO0r6p143VLSBY+FDU1iS7WtenYWeesdMxT/AHGcapYf03h?=
 =?us-ascii?Q?Yy+DWegzU5ogOPZ3GxZD1RIDuEoOUXydLpaNgTmyxPzgUjAoAiSKkFaiXxgJ?=
 =?us-ascii?Q?e4T90MzAVmrzL2Rg4E5zoGBWkWGeLmc/82gAU6EAwMlbSf7Jy8Ns42nNFqKK?=
 =?us-ascii?Q?OWJNL8TjjgcmZEMd+ywlBMA/FJUoBh3Iy0X3vlYiSkoEJysL/vXI1jScNTSM?=
 =?us-ascii?Q?+YopnxwUWuYY3ToPbEccgqOH7jULcuPkqntXvh9e0ety1/eo3uSZzgIcVkD7?=
 =?us-ascii?Q?UBzgVzyc9vcrxDepowN3Ka/ZtYanItOqTLqhmVQY+oZUx7Vcb17yzub7TqUh?=
 =?us-ascii?Q?Ne5VgKNMdKIbXTPSIqGjN7ZqqlygXtTWBZGadm2dpbXIPczRE0CkTQUhUSt6?=
 =?us-ascii?Q?yvxyWu6Qn1fvAPLfpsu1yPM3yaMercwzw4RMF4CSvfImPEzmptpnG3j+Xii+?=
 =?us-ascii?Q?K5KTugOG/cUD7PXTBvvMbzI6Qxd4BiwiEO/pw8QlpmfpSES3KsW5hCKdf8Wk?=
 =?us-ascii?Q?Z4rhc8HB3kBJGo/rKLP0NGRGji4fSn53sN5hzF1HzfN8m4kzFvdPoQ0STNSu?=
 =?us-ascii?Q?2+isN1nPXpylrSJJ8xJ0eBxH67BWc08/A1As/mjjpnlRCqEWl5eVIlY5O6In?=
 =?us-ascii?Q?aYDmKeBOttdnGJt4I8c1Utdxk9bc4fX8YtupE2sOVmnUghJTpEXRJrLEez4+?=
 =?us-ascii?Q?gQnESBpKYTq8g+AucarWZmQLBjDtWZHT7UCdSoX7s4iHvG34bbnxL3Gw6lf7?=
 =?us-ascii?Q?8D/2JfTsYpgzfw7Fykh/a/eKY5ez/ilUFY3IL3IbFMg+lIT4pXoTJPztkVfq?=
 =?us-ascii?Q?o4GoobsSOFTDDqeL9LyJjVY3m8LOGL4yosi1GKuYvxzA6YSeMB8atFJrotZ2?=
 =?us-ascii?Q?aMn9lGg8W9GVFUuxkb7DYEM6H9Sf0yJN8zuY1hviV2QbwChct1UjWd/YPfer?=
 =?us-ascii?Q?ZyzsoublYFYqOogzVpbl5tbYJuq3KA9rnchSqbkvUKS7c2PhBBkdxDGQzBu8?=
 =?us-ascii?Q?IylUFNxl8kfF/p6H/t7wDTS/cejcg+d9RF202uCd0gm0w/DrDjZwlfEcAQrO?=
 =?us-ascii?Q?7FDLYba8ko5eNmqwVR/BK778oP3kvMjvOUWW4EVRENn6yP3bOR+oVZehN0sR?=
 =?us-ascii?Q?Lx6OOWyvLgxoNRV38k0j+CcsF6hhhbw9QJTmCx3PoCRwvgkphy+cqTCft6G1?=
 =?us-ascii?Q?re6gtQnxQMuaNo9MSSlINDSO3egvBwwMIj2tCT65IXVxlekQaIep/J4fTzv8?=
 =?us-ascii?Q?RJXvVOYOZYZILMFN006mNx49j24gdcJwj0nPhtNCg83KJqgu6p8BF3TEu/Jz?=
 =?us-ascii?Q?8Ns5wfs+Vvh0oiq6eY21eYAEnv1ken+vc+ICxODSfKOb6v+Gc9h0BVh4PtNJ?=
 =?us-ascii?Q?pD3140zEl3uJe6o7jk/su7I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6963c0-078e-47b6-1e7a-08dafd01fed1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 05:23:43.9508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4r+9im4oAeTbaZdvZI2aKoLy1tmCkTvNLSDYAYutE3cwLCkcJFNjz7Zv9IPznBTxDs4TPbyYAOJZ562Pp3hRGMw3w6k+h04ir0PvKAzZGcbRiPLR9YR516OGut8b6wu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11546
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

Audio Graph base driver might need to add its own properties.
In such case, having definitions for port/endpoint is easy to handle it.
This patch adds definitions for port/endpoint.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/audio-graph-port.yaml      | 39 +++++++++++--------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index f5b8b6d13077..fa66b73abcaf 100644
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

