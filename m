Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFAA6650EF
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:11:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7265E900B;
	Wed, 11 Jan 2023 02:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7265E900B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399461;
	bh=c6QBCMJICV/GVlk0aAkdltcAbFBIf7u3vTHJ8qOWnLg=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iwkw5v5mZ2uaJHHfO3jzm2KX9BkMw1y2ZGruwvs62721wNw97Qik/AoOQkffn1H3e
	 gP8d8mrAlaum2fhv9wEn42DQTg7e4AqNN8+Z4rJqeY7WR8Ls560+FgFxU6fSFDOO7B
	 Io8tBYuyoW+UjXFw53vBQO3XscmGXvUEVjX1Wsr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8484F804C1;
	Wed, 11 Jan 2023 02:10:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52E22F8019B; Wed, 11 Jan 2023 02:10:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35FC3F8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:09:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35FC3F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pgObnP1T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfudu1w7pZF1Q/77sSt4Llwn1OC16sCHH4ugf5YZJ4TwKUsMbpPB3QemdlZRIN9OQrt09N0SJorMStNwyn/sbEbnDihP9EsjsGfp+XSkeLJnz7nqqKzWyJ86gufsIRMhpsLrG7kEHcFMJXYDeUOxFf5hx4kcsjK6tkN6JgV6AAij3VrGKUxZaQSJ0/cbGU3mVG4avtpc73N+uL9sR9YXQl9p1FjC6RpsCC1QjNScJDm3icMPoxhQ8G4bqDqF/7xNiN3qTAgT1WeSSCHtq9mtbCdzVgVRvWfVJVYzbBigEs0hk+ta7BbhEc+6XsAaqktQz7Rl9tMwIm38pVcuROdeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgZpq3kBZU6YoO05fFA0NXtiZa0rjJGLIG4sdxr49So=;
 b=hKjTA7bqhBh0DWEx3UzVi/szgitZ5cEBosTI2xCnvxkXqfKo00ku8EGWcj8FmCvp7hYo97WM+tcuXMT+SjmSWwRM6eKXH9j7FHyJBr+qBH9K59D1UOWxV/M2k63n6n10cauW7W5fNIPpieY105B1bZkVeSeBrKETeQOi5pYhmAT5BIL+L5+irkGnBJ8lNanUvh7FnBRaXxRQuAGdlPLqQdR9rR59zj46J+Csv7DapHcJRlPLgi/Hq5e+nZMzQqs3uwiwy/cw4LOg+M7EuXo3FBinVVEZnOCIkdffy1HqWQpELfetykPGd3OD4IXJiV97cmD7SUYOas21/0pyx2M6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgZpq3kBZU6YoO05fFA0NXtiZa0rjJGLIG4sdxr49So=;
 b=pgObnP1TGYGxX8FotxKwLWLtqFaevvgxkWQULbQvcE3kiMIdRlGX3upOBxeJ17ArdZBHRTJCcf9er/Kzoat09T9f8mqTu9RF9uEBkKPGw1lBz6Uv2JpdOQexDb9+YYNYcLDYfJGZNw1uuC9KYOH3+GRpDuFPTlLRCHCABuJ7Cjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11030.jpnprd01.prod.outlook.com (2603:1096:400:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:09:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:09:52 +0000
Message-ID: <87zgapho68.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/10] ASoC: dt-bindings: audio-graph-port: add
 definitions/ports
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:09:52 +0000
X-ClientProxiedBy: TYCPR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:405:1::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8b3655-53ee-4045-ee7e-08daf3708b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0K4olDpTI2FH7p0zwJZcnL2hLuHDJpKaznZi2hf6NEP4FYdV7poC7oHPFupR+y6XWlzB8Z6NQLXx0F5t/TswoxYC/blKzcH+GERrwQCVLi5V+4yj2QgCfWKjgDoKsnY1B0n3K/FVghtMQR5LsIMO6yK+AInxZ4MmMoo9zq6277MJnZnL4moP3Rmfp7FuY+jNjnktpNusLOGMCEto4CT2CXsbOsGI1FF70ZjO41sHcwfZ+uqGsfXWWWkw4yC0zZ3z7kB7CQ7ew2leZ82FgrchUo5VIwBr1oZnvegPzZVrhmIRpicpd2gV039qjnm9hMiIbT4Yx7w8HgDI56Qq0jbUUCTBC5j2i6O+myUeq0817SoyX1u1TGhIfrOdM6017moGfbW8KKe/8MafENJvtfQvYAHSQ/K9Ex/Kn1vLybQWkMkE/Bbl58ui2eRhWglWeQfhvnCpxApI6o0+ZL3ETXXwcj6TJl7NSM8LGscAMfMK+JXyHmlBp2bd2ERtbtrO7x12VemDEyRv12bVSsNmD0pWOKZD3JvyzFiyyg16n366q5LF8w7O+p5DnCa0KLXYWnZLIi54VlgixleEQ3KFx+2Lp0lbj3Q12ONyH82fX5ew2IQqt4eQWl58DfTgBHPzTgP+bz4mbUksDN/Yo4KWxELOLOOklbXlvq6l551LvoYeqIxfixkZymrGmTON+boaxoMAox02JI5LQvcMpZJDLTW5LLusrD0CGBXRSpYXRsOxCnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(6486002)(966005)(6506007)(478600001)(26005)(186003)(52116002)(316002)(2616005)(110136005)(54906003)(2906002)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(8936002)(6512007)(5660300002)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MaUsSiDlEcc6PQ6rJzYLWQtQae8Gj9+YqEJ88Sfdd4xzT2r6PzhqRUBkSgx4?=
 =?us-ascii?Q?WjhGYugeSo002LvBBgqoAiWOGulETkkWh3HFGce6yIcOByNCIVKfAk1rVgWE?=
 =?us-ascii?Q?wXJ6YvAiKQGy0DEgJ38XOwn7r2fzFO6VE0JTasNnX6kwoh61xrSEWCIIMbqt?=
 =?us-ascii?Q?bI1Rb/p3jFcQHjynAUGNEO22pUXIxbhz5bgidIho5DhcSV5KP0B7uqMLTmdq?=
 =?us-ascii?Q?WjA1lyusnGQAiHtfy0qqtk5Xv595cT+mJPCIkOgfchR/xki6gEHDI+e3rWC0?=
 =?us-ascii?Q?0uzEa9bt5dP2X/uVNZoPSQbn9xxDEDjAQMf3rx5PH2YKGAGsXtb8mHu4eb0L?=
 =?us-ascii?Q?tpPmo2cC0N5+WuF8P3thZYVNaZAsCqfAucCQmtlxBNwoUkyMLtnl3yqYHk8l?=
 =?us-ascii?Q?CmDxL12H9qemNLWbUvYq5ur775sK73fLILwuX8ftsxCTxKmnCkjEFlbEUU8f?=
 =?us-ascii?Q?m51uLwwMCWqfr/g7swyFu+0r3bE35gBmPn1B9SRriz3uhz5zX3e47n52/h6l?=
 =?us-ascii?Q?WYxUurT3N3TvyI++Y54RToqlyhm0UmsfPM1NsfiDBGvM4PxPbvQ4y7hqHZ6a?=
 =?us-ascii?Q?LJynHuKqd+t7yZSHsDUUonL8W0i37s0ucapsXD0xA8/4qKh/kRMn5ANIJPg3?=
 =?us-ascii?Q?8TgSD933R03t2mX7el73EzASPgG6nf6QH6zfvCJ95pp8Jbjrm3vblLv/NprX?=
 =?us-ascii?Q?SGbG2WUEZTElkFqxyEKIuO2J6b20Cf+Z4n8e8wsTEolk/UUaJQ3FuLXO+p5t?=
 =?us-ascii?Q?yEhWm3pfOVxqCDBhl6K+lCqmHETXvG63Bg6g6VqoW/c/aJJ4/qLymq57S3/O?=
 =?us-ascii?Q?61pUEaWUWRsxpyXPJAWvjW4dECyCoIeWV+b2DJQT7Vg/DjKYiivq5Bh2VSwz?=
 =?us-ascii?Q?YifeTgH37Gq7mdVZGfxcmaI4Y+CtFVl9gnez7xq2y+4ri2uWNG58BuD4izDL?=
 =?us-ascii?Q?wMgv9ubCHFEoI3+IzguBCkmVFkaDJqklJIiMjglAryKxp2BuyygEXBguHyMJ?=
 =?us-ascii?Q?Vd3ihtYqPd7/fzO/tbr/dpRskZyjjuCMb/EBV8kMG1IUCwkn13en1MX2cIGL?=
 =?us-ascii?Q?O5tQBWAWt0iI2jVDyffMOa8mxIshv7p934u51xYKg1C6G9CbAyA0bJFI9ZpN?=
 =?us-ascii?Q?X+pecHq+rMxnt76zEecJhliIquNTkF3XSL7cRcDFugOh9K9xcSiSSGe9/TBP?=
 =?us-ascii?Q?0lj0RZ+Zce1oigglw6by3es3AwE1QpPSwk6eUS6973TmJb5Mq+hTvPpeB945?=
 =?us-ascii?Q?TF0YOIZBmqUNLoB+Q0MuHd3SN9VMK8z2mOvZl30I7+tYhxDRIRoq1me0aMjq?=
 =?us-ascii?Q?5MOI/u3kDVnaEE8ifRAth/YlLjWyb6lCYbZv691i2MtL/s78nEECoPBmG4JT?=
 =?us-ascii?Q?y+/Vpxg7/cAJJVyxn7bdt0Q/K4uqvzf/l3aJlVDQj21mnD9Gk/mhvZQbvvKm?=
 =?us-ascii?Q?2Xrj4MWY2d3M9n1aeaQsCK/VcXoEA601OD1aKVbdxhOECQPk030jWDpsiN9i?=
 =?us-ascii?Q?YzLCP0SwE8KI+Ad9wcpk8pJ7HA4PmS6t/K5iWX3l5MzBfhFqYSpyxZ6fBbQ2?=
 =?us-ascii?Q?0+1Sy8pDsOTLWorL/Fa4kmZMHd8aoEtJza9XunKmfmwvgTGPknApaqtpI2w9?=
 =?us-ascii?Q?9+yu05++inQGlwtyQn1rSlc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8b3655-53ee-4045-ee7e-08daf3708b35
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:09:52.4738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6a94Dz+Skb+l9BQmo46PuSr1ZdYxzLpt1YswRYyW9E6iA7LweJ1sIgQz7ad6sqXCCAIvsDDqplquTWQ0sbwJvW8ejqwELSL1DCr0txorkriI9qkHuGJZFo1ZzhJ9kih
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

Audio Graph user needs "ports" not only "port".
This patch adds standard "ports" as definitions to use it easily.

If user needs standard "ports", it can use

   ports:
     $ref: audio-graph-port.yaml#/definitions/ports

If user want to use custom ports, it can re-use
audio-graph-port.yaml#/definitions/port-base"
audio-graph-port.yaml#/definitions/endpoint-base"

https://lore.kernel.org/r/87sfhipynv.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index fa66b73abcaf2..6fcf7f567424d 100644
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

