Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9238FFA65
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 06:21:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6316684D;
	Fri,  7 Jun 2024 06:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6316684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717734084;
	bh=YSnyAUqi2t0pfwL+afcX6h+1HLqd0jkyBNfQk/NhmdA=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V6vldiO928W3X2raHQ50eFjLqUfGsouLV07TtjG8Wr5MlZTC/0HcT1GW+qmLhonwK
	 f+lFQIeGlhcVXmy/65xtwjWFTU37cZlPyjTEqvkRWaf71cIRC4g5Qga4ul10HU+NS2
	 8eXhez4stkqj65FpouPxWOwvCTXPFheM/G/uUicE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41DA6F805E1; Fri,  7 Jun 2024 06:20:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52993F805BB;
	Fri,  7 Jun 2024 06:20:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24D65F80518; Fri,  7 Jun 2024 06:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BCAFF80171
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 06:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BCAFF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=m75BgPQc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzTyz8RpvA0KM7DFXwxlx3VM66jDKh2TH7f105oYrvozYRhr2aLGtOUfyRZERsGk9U++WmeICeb/j6dPiXt8VqJfn6nlfAkFkbZOms00P5nPcf5TTfyfBFjjEG3MSlpxCcJzEcjU56eTHr4HZOq3s46Tu86gl9o+dB9Jb5y+wYT/QppjWURfkOVJugcv3RBa6ZP4nNfHQs/ciCTjNuAt676n/TShTUe7svb1HDuThzBBlutQBz/GifZ7YWxj5+8ofxJlaLGuJXAVj+Rdk54oyKLOIB20ZQTdw69l1q38du44xJitMiDu6/moQYgtCl54x1DA3XpQcDpKYuW62+J0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LZpH3ZwQGGr+kpFsgJk2r6RN4tHzbdtFMLtQoMpl9c=;
 b=kvBPCLf/q6IitGC7ytPeIg8e2Em3A/m8Mfij6pOP680/7p2om4wezwR4Ub3lU3R1ao5bxzy8tvIfgaiP5AP+SI9hTWlqC8QbRH3PWRBqV3WT88sb8ELzrjSu94rq6VUsDKCn5audfuZEuukfqzgGZf8ubti5FT5eHIWNrlHaofmClGQLCEz5jCkoDxqCjqDCiNZJB1s5OjEJ/cdsLuZymsyzhjzHzPrNwVlPg7FJpUBPKj65j34A2eZhXLJKH1qQGpQM45ifURCXMAHJUhGjLzhWUaxjpKHCsVQNBCjBdycJHFQGfh6xRAfB/9YugIbs/7X9FSpFSPSq2W8zSClQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LZpH3ZwQGGr+kpFsgJk2r6RN4tHzbdtFMLtQoMpl9c=;
 b=m75BgPQc7nbc4ldsljUU4MzjHHjieLVgXHkprfGadCee8X/+0ozMfblbwqPZvpQrPxK07JN0+M/vOWLnQXiSWY+XveNSlgvoXONQudaZ6+BcZNvOists1LMKDWZDKyygGB6dNDm4e4GCR/c628DL9kme8jr8nYBgRcECx9uKfcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8206.jpnprd01.prod.outlook.com
 (2603:1096:400:103::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 04:15:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 04:15:01 +0000
Message-ID: <87tti5s81m.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
References: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: audio-graph-port: add link-trigger-order
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Jun 2024 04:15:01 +0000
X-ClientProxiedBy: TYAPR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:404:15::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 495e593b-28a5-4794-d353-08dc86a866c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|1800799015|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5OwKn3MFLDCSrCdcwNQwt9z9lr6uze08odxI7sAdTl79o05QoH/9Jwk52YCy?=
 =?us-ascii?Q?P7U3DmpP4R8AsnFVyVhTTl5PUQ3l4cY1KGYWturPQuf97ZSOZOQ5rN7OHAOw?=
 =?us-ascii?Q?2R6YmyrA6C2hl4qBgG5+GxnwhcBkKpmujZGYywsE3R/+9PRlwMmja9ZlPbIT?=
 =?us-ascii?Q?ibSVpxwgCtp45YUljwl85+PTYHqjBlpzvtFfz5/9xUj5qdSFoVjua7zcDM6F?=
 =?us-ascii?Q?C5u9tB/nEghfXWnh37l4UYp7CCGybVEXrSogHFnK8UVlEbjV7PNAkJz6KCgA?=
 =?us-ascii?Q?fYJkf8imErtnBxAzbtk9QNLfZea1xKy08VE0kgemLOhrMajpemf8wXvk9Zlo?=
 =?us-ascii?Q?O41fOmzkNYJTKPznpo1+ZoeEcn89F/OteE6HA18iDj78Ywzfiyh0EdJEIon4?=
 =?us-ascii?Q?BEuOxCbWsPYPm5EhYUvng65nxOMfY10MjefzkO1GBG09P4vdmy22jKesE4CS?=
 =?us-ascii?Q?IsFBXAyEFKaWG08ZCn7/u+z2gN2Qd5R8svdsp+3RC31RuP1yp8Qh9Bbn2LSJ?=
 =?us-ascii?Q?lkWsPjqGxJQuo+vKLkWgF9veGIxbmd6x0/+hmIO4CzzWd/cACPOmlnf8IR4J?=
 =?us-ascii?Q?PUGkR97WP2AMfJSLNF3mQH4IyhhB/weZuiVh4fJ/d3ZzWHAjVA9FG709YmWw?=
 =?us-ascii?Q?y+cV2vR0Fg/Q5zlqkD4wmISf7UudZLosvdp+TL/0s9lACLyrB6RgTjx0qf+e?=
 =?us-ascii?Q?xpT0M2cN9gAHOAMfpWRiNg5R+5X84pYeYil13CpukMXSRDAghKFaBUsJrjDe?=
 =?us-ascii?Q?K78ET5GkomZsGCZoVzfIruVhmWSD2tReoutnJobxBRlYmrdSlSPsuofz0DzP?=
 =?us-ascii?Q?EjXUryBuil9FnoWTmOR5gbJ4Qyo0DQppn3H4TixxkEoZ3DPEYH6TZ2MX95Nt?=
 =?us-ascii?Q?64NAMsIz9wK10J331zLOnE9Osn2F2cpWcrAitdEQSs8udvx1cTJGnZsZM2LD?=
 =?us-ascii?Q?BEaviikBOWlbMPutrtP6m9Q9N8WuUn+uous/RF9nGOdNpqm2HKSz0VRuoeQu?=
 =?us-ascii?Q?9X8xjvF2r+EwBNhWGqio8aw7HfV+t8RaH4huT1fFf/77aw/4aFWZV2gmPIAi?=
 =?us-ascii?Q?U8gEpVP5amkklPia1ocz2JRrWQoDpNVR54RrwiRI0o24RPNrNGpkhxhjVLwq?=
 =?us-ascii?Q?C6J8WcNcE8BQT25XKNARvWgXexxPP3Uixaec84hNc5JAAGcamM7zqCVZWdMo?=
 =?us-ascii?Q?jP/3OqkGFDAsF/1DtL2OIcTE+wipPa/TPSYOYBJNcJmNqKecrPktTo2ehff7?=
 =?us-ascii?Q?swYhBUtFFc/t/P5e/XqfIWiPCcpa4CTRfXO5SdhFD5FEkLv5nYJiE2AzCdow?=
 =?us-ascii?Q?3kVsyn8+BN6ttsYFoyQ3K6Peu1bIiducBE9Jn7brsJN16YZ72fqj0cfFKwA6?=
 =?us-ascii?Q?fkAnhs4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9HbmK99r8vVOAULHHHzlUbz34GWJmMgRSR5q6nGD/QFk4MX+5C2c2AMH6uHK?=
 =?us-ascii?Q?f4i3ASGlPAYW9SeQb9VTZRJ87p44XQFvpC7SCfh4fzR3XkBit5gFwO5pBQN6?=
 =?us-ascii?Q?83cdHFEFEOK0UJNvdAY/YnTOZkqVjCys4pumdR+dRNYxVlFyw4YxV118xTjt?=
 =?us-ascii?Q?DNXTkVx/iSlMi5X/cxjPTQzLXZhanqXrj+5EjWuHyJb9YD6gLUwQKB/n2Y5E?=
 =?us-ascii?Q?NX68xjKINRr1XnhyfbAvBUuN8ZkvT1d4s1G2DmQbEtEMyqVjJpaHH3eVH20I?=
 =?us-ascii?Q?huulnTlFU0pohkx03waFw6AEziV6Bb+rVCFcOsSbVUrXbI9JgnVamvPMm3oV?=
 =?us-ascii?Q?7vH4eBTFYEGN36+EkvMBoLfWBiydoXWJMSgOIpyBKUDWXOQJYnDz5dngYv7C?=
 =?us-ascii?Q?3DfI2ZbpXopBCspWguDtQ5zSoXBcWhRpx7nYBICgfcTkNGb7QC0QvVyXVerC?=
 =?us-ascii?Q?uRGAuFkfHlBS/umleed4e1wLu9z65G2+VaXLMsuaWrvzKD7KEAz9ZxffexKG?=
 =?us-ascii?Q?YgZP+f/yGTPXJz3aPbAaCMmg+oJIwVnx7UL4Nvd8kcaKfCGhY+KcD9h/LRoL?=
 =?us-ascii?Q?6oPsR8epOKd9l3NdiNZixjfZYNBzz76nqhG5RBXOhTEFJpdajGMPalKSuoBs?=
 =?us-ascii?Q?H/GDlW0zQNkCKTzg0JWorMLsvOA9CcBWAMv5e0Jibm8oTgTvXgl/C/IGlYgr?=
 =?us-ascii?Q?EPP8mAYwzV2G0KdyBMpMStnYm1uYEyFw1xQy0UG1/umsOkJFm1rmAn59c6Wm?=
 =?us-ascii?Q?PK2DOCN6b0xKgXSJLNBC5uARnodiDYxOh+EQULPorEInswI89rMpVbOFo9fE?=
 =?us-ascii?Q?mmz5eXcGNln/5ANCob9brAr3jU6sv95JkI/Im/esNAKftiYUHAAfYc8ui/2m?=
 =?us-ascii?Q?mTcI9ywKC3jDzZ0+/F2iZI2iQfAhPfj0uRI73ZWjW8LRowBR1/iasYn6DBcs?=
 =?us-ascii?Q?HJXcuAcxY5UoHL9c9yts3YcwebHF1yxiS8RZygpib5cNXUGjoWAI2idkGHlD?=
 =?us-ascii?Q?yLODfIo4sQV+YKEqclx7T9m42wiRDLXrH8jtze+QxnO/NKCwjqn90Whm6oJg?=
 =?us-ascii?Q?nduRdzW2qMhVKIYKYXZo0BeMLUcojMkHE4ShXhMVDQlUPaSMYCLTtasqZiq8?=
 =?us-ascii?Q?DbEpkt0+4j6t7oNmQBKOAPWuyx+ZU7PvaTwQ8TwV9SttFVKlbTcwiHWd6Ry7?=
 =?us-ascii?Q?08f2VRbbBwhTj7PO5z3Y0GQrFu1HX4e5yT7VyqblTi7DNdJV6rVjNJ9rcWN8?=
 =?us-ascii?Q?nygtJCVTURZ5HtYB1fBSnTXR1hFYfh0lDd6mW7U2W121VT1z705OSehNdqqk?=
 =?us-ascii?Q?eSf9WszC/FBk7UuZ1vVjcAYMPAOkLwg7CLv9e4ft9iz+e4ACJ0qYJ/Vr4R0N?=
 =?us-ascii?Q?nu0CKhS1CL1RybvQ0iZm9fw+/nNfF6fqMCM1vakxMMeHdVcaX1szRcKwEDpr?=
 =?us-ascii?Q?RfJ3gkhpJu7kjqUKuLZtCyka/Ve4xBlI8DgqzruLg1pARH/T/RLQOKqgFUjD?=
 =?us-ascii?Q?Dc7ROTce3iBzULFP87B6Ax0Bg+NkV7kZF2CxPpes3wt2yg5SsQwEFyYIBU9Q?=
 =?us-ascii?Q?+Bdy4jQCbIajgobC1iw6htBLEEKZvl+XwsujgklszMFUXP8zCKOT5GSt3CXk?=
 =?us-ascii?Q?9ixiXoAGLSkiTK51IAgK3f4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 495e593b-28a5-4794-d353-08dc86a866c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 04:15:01.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PZQIdatu3zq2ImY69ntGIlt9kD/s+zGZx9Hy9JhawLw7JPxZn1z6GofrL+mJAldUhxBcMxlFued5n7nbEgXNngcm5GVZq5bCPwkjT5W4RkcPXUbv9he2WYLam64lzCUh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8206
Message-ID-Hash: DTSS5NBKHGOYVNMSS6BHZTBNFAEDRG73
X-Message-ID-Hash: DTSS5NBKHGOYVNMSS6BHZTBNFAEDRG73
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTSS5NBKHGOYVNMSS6BHZTBNFAEDRG73/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Sound Card might need special trigger ordering which is based on
CPU/Codec connection. It is already supported on ASoC, but Simple Audio
Card / Audio Graph Card still not support it. Let's support it.

Cc: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 28b27e7e45de6..d1cbfc5edd3ac 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -25,6 +25,15 @@ definitions:
       capture-only:
         description: port connection used only for capture
         $ref: /schemas/types.yaml#/definitions/flag
+      link-trigger-order:
+        description: trigger order for both start/stop
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+      link-trigger-order-start:
+        description: trigger order for start
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+      link-trigger-order-stop:
+        description: trigger order for stop
+        $ref: /schemas/types.yaml#/definitions/uint32-array
 
   endpoint-base:
     allOf:
-- 
2.43.0

