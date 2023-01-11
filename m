Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7676650E8
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:09:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B07A90AC;
	Wed, 11 Jan 2023 02:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B07A90AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399366;
	bh=u68BLaNkMbOv6tVxbSybtd62QTtu6XxbFJGTZK7cFSM=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tAkL5Z2pqROCg28FDWigl0l4njVJGSOJ687yrdvkRBmUVdJiPSmzsNBZuxwjkzVMp
	 SMpvZJAjYZeCK/igMq+R2vG8Jb6ocncHtImiq9bjGcu2CCMXgCEIXkhxU7ADQzD2Ri
	 XCIYpKQQcJkNiMmT+JrTcMYRG//N+vsa/W/1Yukk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4EE9F804DD;
	Wed, 11 Jan 2023 02:08:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A2ECF80549; Wed, 11 Jan 2023 02:08:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9836DF80544
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:08:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9836DF80544
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FCHT3MkR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9cW70k9YK8QamEFudMxmhleGPiOCebLTR0WVR2WwLg3w3miqyLNZ316SV7kNhLoi2J/1P+rSlkfmqM9ZE/SYSkk/LOWuE45VYbY6G52QYdhxR3nW88pb6OsVK7JUTFpjRf2HysWYygiIAlUjYTZNiAW/CRsChYZdIGF31iGw7WVrbPs/wsd7ne99VmmITKrh3J8MTkqaFJneERBx48WZBWXvi20Kiv6hNNVFxFnRWnRRGVaHEwjbZvfNfq0Fsi5fUzZ3wGyw7XtVfCJ3C8hVUNgLqCaGOGK/7QK/c4yfj8eE3KhHPqxLnDkVMPVHB0DlZJAOnnRbBZ1cel62YNphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpzF8+fS8UpMehVlspcEvom6qEwYTt0TDSZVUZyrf1w=;
 b=m/3Rqm+S+tA60FIVRWhknvJoRJB3DwR8uJ+LrLD1Xla5FH7FEFMgDwIKeeI01Uvk4W5X9co5zPL7wVuW8CbgwL9vMwVl1HJJSZKJGNOWvoNNU+C9oZYwtDcqKTXcFUc9/rGo2CYh4CTNKoNJvAuqMT4zrsmfESnB51ivqBw5vuhmYULchKcGKO6ri/79C04YcGSNnZfI0tRcFDV+fHX+usiryeNrneGjWF0NeQqbXxXjh/JwySU6MgiAYzVHX7NaMduQuob+Mehy68vY7QjQ32axq6GaD+/JSE3GA7SDRNJvq2ZQ/t/cqmxw8g4OmRpahk6iLxEed4NelVqyvlAJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpzF8+fS8UpMehVlspcEvom6qEwYTt0TDSZVUZyrf1w=;
 b=FCHT3MkRb87LcGI9AEY7ZLcPTHvoWeGaSv1PbqURRWgUc/zG5TnRe8HI8YXs3ab8vYx0mk2BRJwaMEP15VCsYKFXefcvtV0e/4xhfAYHT0BzyFm6n3oY7bDtHLh4Qd3lymG8L4/uSJA93qu7sXKRCuxrkxxbzYz69ssSvI/gRDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5970.jpnprd01.prod.outlook.com (2603:1096:604:c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:08:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:08:24 +0000
Message-ID: <871qo1j2t4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/10] ASoC: dt-bindings: audio-graph-port: use definitions
 for port/endpoint
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:08:24 +0000
X-ClientProxiedBy: TY2PR02CA0065.apcprd02.prod.outlook.com
 (2603:1096:404:e2::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: d14cf40e-5593-4a0c-dee3-08daf37056a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZmNOfkV5vaE2tESwkHtcWnNXd2MfRgIBoWjOz9JGotxT0/Xfs4P8BEKUM5PTcN1KHawq5F7abv0406as3QRLUTJaBu7OoklOw6Dmya4lfvqmg4O9ujFPijyTflETK3jNIhYZbP0cpMd3AWOS/XirIXYTHAb1SAbkcNc55fnDA2xy0bsV70NF7wGVbTW9EIxwsjbLgkvBhaPjdRp0j9Hr4arfDHpzeEEpIADwA8gyEhUbe5oyHXlxZizBooQw1H0ivPGSR61159QBCiHwP88TxgAuwSuuPP/+ViSwMPxjv2HcwauvOUdwDTXbj5dypz5J/g0LOUzfy+78GYtzAkNy4HW5EpWIvzcvRU88DIXAiZgVd5Xiu15CL+dRbPqt1DSm40YLxHkY+gGYITWStt2vOGT5L9XVMG5ITQyF6t2sAwbO4xjHvESHg4DrzlcBwuZOV60AVWU2wFjagWDOZP9jouPWAXsCr5Sah+XjfoXGqaiFyeoLJD3XlDcol8VK/9r3wE+ToIr1mWC7S7yp0SAEwwVAaPgqXzTEMeQUG47RETLKngzTsxr7konieQ48mV3wqZFgP6Cpt5KTctCBq/5lbXfnXtMccKkyciLuwygqzTXeUFr968q0cGF+zQIkOSvEF4O1nOqZIvIv31kncBmuXbsRARu9WCp/3NNKAASVerottCCsvK3UY+VLFQM7lZJvcdRB28r8C91sM5BHayFbTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(52116002)(2906002)(41300700001)(54906003)(6506007)(316002)(26005)(186003)(6512007)(2616005)(83380400001)(66556008)(86362001)(8936002)(66946007)(8676002)(4326008)(66476007)(5660300002)(110136005)(6486002)(478600001)(38100700002)(38350700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1kfHWXBC4r0pmPJ66Jf9Nse1blRljqUrx/gQ8NnS7EFfJUCtyK6mWsce6AEL?=
 =?us-ascii?Q?Hu3My/MF2xiWhsqHVlPKHo/epxH5RXQgA+MZo74iTPPbgI8GIFzcGOHAwcW4?=
 =?us-ascii?Q?1eGYD1pAECHc8MPOKPZcWznPsW3n7JIg8Kh5jtsEfJMc9xjgLbPI4MxJqTHG?=
 =?us-ascii?Q?+f7Z8pKeANcJVlquv/fdOGDlTfdOu/UIbFVYZdMWzfP2Zjb6rq5/U/CiCR/u?=
 =?us-ascii?Q?pyxEnZoewKPACPOYBCZVe3eaa0nP0k9n3PXSM3dhlzUBrZcB3srDdnshjnll?=
 =?us-ascii?Q?rRo5DVmjvUtz98NCKz+jaVI6tM4L7/36fwECh5gGGqm3B2JJyV/tILpQQeqw?=
 =?us-ascii?Q?diBZFy3nNX0PD4g1X8a0t25kJGGDKByDNf1TC0cbUK5vQ3KKrKj67+iAkYOf?=
 =?us-ascii?Q?Cm1Gqwypd654SXpVrAw/Ved++AlioRFzmq7biFHQ25ZtjiNMc3g9qrrvWPC7?=
 =?us-ascii?Q?IHB395FUytXZOnhoxnvrW+QeLpP+bGlA2na3mK9polrlx43jve6pS2xH27jZ?=
 =?us-ascii?Q?Jdg2cZvkd2ghcmV8cLm2vItPFItGPzHeX5k92pIyeWRVYW1+avLZxk0VwZKF?=
 =?us-ascii?Q?dUrS1f1n+B9P/6mxyGzwOLmEG7X5WY6ro0hEXDkCaDenFcX0jeOltJRrnKJ7?=
 =?us-ascii?Q?pYJSEHUtXiHi8i7kukX/GZ6WMrHousTzjq5709D4hJiK+UU/TbupjeXVsX6v?=
 =?us-ascii?Q?od00FC/C0KBuVVQVuHkao5qie6UL0fVizswQDpEqzY1Jxspps4RSSMGACxsv?=
 =?us-ascii?Q?G+9PQ4a0CXGYhbvGGjnm7i63uyJsEkRKKl9OCpsm3zqNSLF5PEKfBW96QR3s?=
 =?us-ascii?Q?EYVO8NVA23WM9ptdmMr52JaqeY/zrJ5TgUqy/gjx4IWabs0aDEXcVQy30FS5?=
 =?us-ascii?Q?Su0F78Yx3XM0RCvqF6PHRMS15Z3C6+L9eoSF9mnozf4pHwqIXxCsBztngiwC?=
 =?us-ascii?Q?6n/qXwH/8BwBXCZzmuU6u2UYxwDFVyTAdQ0OXIiVotu+0kOHalkqN+rxPgks?=
 =?us-ascii?Q?0/aOyQBhTi5ntZ9E3zaZT96ENtD0TiD2U4GetYPCAemiiBRle73IFmzBW5a8?=
 =?us-ascii?Q?SYYK733VCI8F2ihiRHwfZhj+nSkFFq9lVmMxel8HWfzSpH2m0RXjJbjVUiLI?=
 =?us-ascii?Q?DYBcwPE3clMlY/7ISneLzHCRDAoJo4HK7d/DmrIqtogoSaRVx1H22NKNcI2t?=
 =?us-ascii?Q?+9oDGpzEI+3Wno7Hzfz5wDrcf84bJoPqeGNo0eaXg6UFtPpDXBp1chvVy3Rx?=
 =?us-ascii?Q?NEbB2euukHcjaLZcyu0jnCZwSGDRIW+36k12RHbsbXAPGbYO3tfaBxdehkFh?=
 =?us-ascii?Q?Q8BLRFZ+bnewsL3Q2P05yil5QmErxOwW6Pv9joTkmYgo2qJM9nmresRSLQC/?=
 =?us-ascii?Q?2ftUlRsK7aDS4Xsp1IBjdySZPEsRsFbAkD8zx61AAVCevx845vUF1ta3pwSj?=
 =?us-ascii?Q?HZv10Y0tz3c5glH8yDTyjTVt/1DjgmZJoYyHAujLUWzTXiiJSIgodpsybXax?=
 =?us-ascii?Q?tJjEm15aNM8xdZVj4+bEazkBLe7p9rqBgzR1Y7ocEsFomZ5L8G6quG6aDdVr?=
 =?us-ascii?Q?/Gz9gI9aGxKXx+qYysx8mm3COorbqI42uJkqir/GPrUGE4Vb83Zxmr4xKq5x?=
 =?us-ascii?Q?IfkJn2FAWZpsI70CDUbEeGA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14cf40e-5593-4a0c-dee3-08daf37056a9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:08:24.3300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ca5f4E3YYS/zE8cf4qXPOXkZdmOqo2oMQJzzQWN42XqAN4jNs7XE+MBOlRioJExZUoTy9Xco1d8h6ZigPL73M+vtdXQoE7u4IX0nzFz2gZv5vFqmuOXr4iHBYuW5Ntmr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5970
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
index f5b8b6d13077c..fa66b73abcaf2 100644
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

