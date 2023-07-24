Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BB975E5DC
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 02:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B12183B;
	Mon, 24 Jul 2023 02:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B12183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690158590;
	bh=fgIV9kTbkxCGTsMs/ElRg2JMf6gq7+7Pk0+9qbKqqW8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QGDMgW54Iq70Pk6Tu31qEgMgZVrdxQ8KciSb1W/LhbCQaMqB3Xhl1G/FUJZ1Z1O7Q
	 d0/JHVdF4mL/cvbkE8WC6EXnGla7ef2RwdnxcqEDqlYFdl3kzObAyDFo2NZjl7v5FA
	 3hpYbp+8v/vVr5dH2Q9uY09v+WER9sT/JmbEpqjE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4BE9F805A0; Mon, 24 Jul 2023 02:27:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C17F8058C;
	Mon, 24 Jul 2023 02:27:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B340F800D2; Mon, 24 Jul 2023 02:22:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B136F8019B
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 02:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B136F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AvXIexof
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCTWq4pJJF9f8yBOFuYm4O2WCjDcRadRywi2mFvsNEdUjEquk5BHXrJwwFuBR8cvdHDCWTDNGdQJaZB7MSYFT+KMwlIBRxcxt/WlLATGBl1LqOje53HEohCnRCOJsvlE+PDLL3U72da+x3BzP/5KxGRXhZVv3MKWPjaLP3ilKOZh7DbPD+/4vN4DL9+CCdq1lBc0laRlNOLi3DgS6J0t1u7yrh/+4SEBE4zfarKqunnbA40W50/9vmqtO/We4T7Kog+bNdSj4G/mmWJm/QvJ55EwyBGeRomkL6Y3k7saUrrg7HKiW7bfL7N8P6g1mZxW7E3CarVV8cQJ/R5anNhLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osE7+rHcFpL8iDZlKbNPdvvxY/980NiUFS0BABMvcuw=;
 b=Upb+Om31toUmmym7qU9hcVxNZpUN5yH4c46Vn5SPPs5T5V5gVokQcI1juPaT4oHndyml5NOyMPZRWJKU+bxr+Wjf2k7JQ8e8Er6kzfJ7YbGy9YT7GF61KmZyCCQY5UflU/chcMzKl4r9mzNNz6D0PTjpKhchZRfp8/3vfYhSNZPMK5J1jDPhI3unMJ8Hvji4M9EEP1K3NYxLiwMxLTgLGLdL/d7GcfA8WeA11M/c3xGjnpYeCgOBKlRapMDofHM6eOTm6wOlw3EoiH12PDkJMNPl755R9Kq7EOHTbYy3lcI6mn1mKnovtzidOrLT/pg6QWjk+VLSgzTYErQqip8XkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osE7+rHcFpL8iDZlKbNPdvvxY/980NiUFS0BABMvcuw=;
 b=AvXIexofEXW0m3Qv8n57PXn2Yrg079gT14eH3CizoV2LhJZ8tUZ/4M/ByWPF0OYQxQj/5qWwYa8WsPMI7SIqlBILXW6ETFc6NUTRrpFg+5Hq1PoJT//dMzvtdgBYZUvTV1xp1YAU4wXBTqFicHWjZvepwa0a2oGa9pdaJPkhtlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11420.jpnprd01.prod.outlook.com (2603:1096:604:234::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 00:21:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 00:21:57 +0000
Message-ID: <87sf9eb1ln.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: dt-bindings: renesas,rsnd.yaml: add common port-def
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
In-Reply-To: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jul 2023 00:21:56 +0000
X-ClientProxiedBy: TYCPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11420:EE_
X-MS-Office365-Filtering-Correlation-Id: b4055512-2962-4cee-01a1-08db8bdbfd33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/Yzf50EfqGSFh3lpogs69v6/T/GBPiY98a6vnzOgOnmp8Rg1fytjjY83MIVSZR76POkJWOlkXn89f/Ir/1byv1yijiEvV4pxSg+M2Y+wlsGZoPvW+t79GZfzzgQm/XxK4FH67MIfH0z+dBkgvbWiIHugzrgGiraYaeCIjl0isbBk06hsTY0zWN2QRGeRjO+UnJLuSoPbFayPdPZzpqGDuWx6PKsabMSiJwvHdXhoCRwsHwnx2s2qfVZm4Z2WLxND7k4rItG+pwFB1RxSlad2zgivUFW9g9oQyWCwJOUbBpQG1NKPGMlbtOXBUEYyNxXS7FveV/iuzCAoAcEXgueeJ9geTfKGZCAGDo6FW+wIUVlnOmo8UzrAWqBZYzo75L1n5z12ZeWLHc+e4KDnPGJAO2CqBTROdDFVi6ppAIhOHCfwjNfPFlokhJPGedDlbQ81oquLxyW9L421Bus4ntDHGWzPllqEQuXapzB0NhiHkqssxz/tqiEYM00cMk1Xn/y07e1C7jz1jW5Zq33x5n/i0IqGr3Gzc9mLGOV7F3yXS7/cShHDhwl2MYSSqpkEKf31SU2TjGugFk0FtNLqUlkvhL+bhCMTQLrpSVC+XlUw2skbsi5emtYVLxIQSXoDdbxt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(2906002)(38350700002)(38100700002)(6512007)(83380400001)(186003)(2616005)(26005)(6506007)(5660300002)(86362001)(8936002)(8676002)(36756003)(478600001)(6486002)(52116002)(4326008)(66476007)(66556008)(66946007)(41300700001)(316002)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pYXIsQdhBbKlndfJ7EDTZzYjsOORlrUQbZRVeuB+66wtZhLel1MAqiFA6Q/G?=
 =?us-ascii?Q?zvyqLdK0rzPhx92rjhQGnnDcanzqDo84wnpKXmRwdWWKpJdUa0Gyiy/709Gl?=
 =?us-ascii?Q?CcjiDrEUhMg5LMMFe56Ld444hhry9d2M5FaqnhTTzMEO5HgJACD/8rNxIVci?=
 =?us-ascii?Q?ISAZERrBRi36km5fVcM134dwfBoNx3l/HJrEY7khyjVTXOVUyTTIdMy/OYao?=
 =?us-ascii?Q?crOA5Z4gIrGC1E3rwzaINIhgqTB+VthPkU/6++sF508WNgri730CUx49f4jX?=
 =?us-ascii?Q?O0RpP9GvIG/Mk6WlVizu/IDsJxIzW3A8AvxNQccaHP1rY9YhEpREJ9SKQPJ4?=
 =?us-ascii?Q?oOgylAJ4I6pUzttMtTRUnllXJlf3m32KGsL2rxIYPr6Sqkhwx9XHGMdxItfN?=
 =?us-ascii?Q?Xi2kIOJpSlvrasBTU7dQNB9cmzeyRpdT9RVDho6ufGIBJdaGUuL+z/u/XZzQ?=
 =?us-ascii?Q?oIOdaLUSP21qtrCf23GM4QLKgmbleP5XEQZxxxG+VnmkxYBaJRX4jCg7jDQL?=
 =?us-ascii?Q?Id+rzx2CcoK8vWOYSLalN4fIplpQhx9j9j+TugSGZjRbV9Iuqg3ezxkvwRqh?=
 =?us-ascii?Q?fTouMDMUZHBfHfCNV4GeEv7ohuMOGiYoYCK5IzG0e3sjLD5FaYtLGv1gHoac?=
 =?us-ascii?Q?X4hQ5EIctbIE14Hwaf6rxOGWUSTDVv67U60hwImo0z49vjpFw4SvF84FPLFC?=
 =?us-ascii?Q?SPDO3Sj7RpV3XIAbdIuPwoAsf7opiBJ/ZeJZyWMWbdkEcvYXCKI8mhIcHtj2?=
 =?us-ascii?Q?vxgMMZHVsLmy9rYEveKPftpIRHz3g9p5QIBO+ql6JVdrdlc+vhrEKvkbMRHT?=
 =?us-ascii?Q?7Me0gCa7v3JkQSZz1v7LfEODX1HQ1oOQrACjzW0XntHDsgNiWmUscklPjsD9?=
 =?us-ascii?Q?Odp2yd5gIRG8ER29T90oHI9JINEDJBfzUb0m87+yk+ApQtbGylBanUQPa83H?=
 =?us-ascii?Q?nHC6RxeWddJnMyMIlmTGGkPaAehFUpPAlei7y8FKSayU5BHiKIY2p0gGncrL?=
 =?us-ascii?Q?rZ5eXQY8MWCl9ax39gSg6JSMiTMbHgZ4RtdfolwA1/vArYhtrAaM3NCzMfEs?=
 =?us-ascii?Q?d/3gg1yIjaqG3XsBBv66eVi7rVwSxQGvG6eQDj/hkIUkIAe8GEM8k20QFUhF?=
 =?us-ascii?Q?UvuYINA9eVjWVYlTCdnssbOiSiGkZMsHhqKTqf2cpyp/x7vxcEtCWaYseJU+?=
 =?us-ascii?Q?eVLExtohSan44eSRUq6obnK5GB6CyPjDGO6A+f5r3mAUih8Q3Yd9DFcEP7Lp?=
 =?us-ascii?Q?kpCrpS7kTM2u4GCRoQUZIC9c+wOnwdkPvZpu/XyoD6mMWS8FPjJOUFvM5Dsa?=
 =?us-ascii?Q?wpJu1V+Ne0Zq00Yz3s4gEW4ROSWDJFnn1hXXO5ClBe0IORRvWnZpDaSHeuXa?=
 =?us-ascii?Q?3ZADN64Asr4YNpJw+Iq8qdZz10NvwgSvMOHsQl2wYoGf+r33EKzeiQRhUV+j?=
 =?us-ascii?Q?rtC7vhsTZdriVnzqhUFHJekzQi/E66b69YwrHhfoCgH/c1SA27L7QTXvhVOw?=
 =?us-ascii?Q?lyaNSUM9U4fGR6NlSCVtX28VTFsRcPEpfl0+Y1gojFlpCLzLP+q0KBxD3wQ1?=
 =?us-ascii?Q?VoZgUtny01uQYI2LlvBjZ8SsuEv9Mg+LaFtbV9ngCjxppvDyOaQ84Sg8uSHk?=
 =?us-ascii?Q?8Y8lgBX/ZjBQuDR2itSAVsU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b4055512-2962-4cee-01a1-08db8bdbfd33
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 00:21:56.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U0eTUOyFYrNCrDO2RuWl1x6CKHwJ2M4j2Mp5OF93Hoz0oREv3Dmcm+MJsFKCE/s953D26+xjcsBcQGB1YJh8EtfhxLwwebkNhYqwut4s0Z9BOEeGybdKFe1eCZ/czULz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11420
Message-ID-Hash: C6LECBXCFF6IADQLLZ2I5Y3YRGQ4RWLJ
X-Message-ID-Hash: C6LECBXCFF6IADQLLZ2I5Y3YRGQ4RWLJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6LECBXCFF6IADQLLZ2I5Y3YRGQ4RWLJ/>
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

