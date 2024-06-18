Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF990C047
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 02:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98F35DF6;
	Tue, 18 Jun 2024 02:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98F35DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718669736;
	bh=vfjXb1gFaDvWqP83SrHVLGs8YsaIKFu1XslPwSpmFHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jv8OKv5e5rHGfYO0LuKz8TeU4D1SlNCxWb8DoLQ/H4sRpnoTF+OxRu+sejXDI5FMd
	 Yb92p+VrXrGHMi76lSEtzf8Bz+mADEsWxfOwKKCw98tTZzZhwjA5njTKnlBeMxkHqn
	 uHfyQIfzrhdbKE0ZUJ6duRwCV1u9/s0LmpLUShdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D936F80600; Tue, 18 Jun 2024 02:14:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E036DF805EE;
	Tue, 18 Jun 2024 02:14:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EFE1F80266; Tue, 18 Jun 2024 02:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDDE0F8023A
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 02:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDDE0F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=cebgOdkk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV8ztQvkmR0VvPbTWa0XQ8EihmdwRG1eXqd3fYFZZCzaN+Aw9xMUugR2Tsq0LbuqwKHSPO5in3nVEKDwKy7o2HUjwY9RQQj7nrrJwqS4WBaPonZwnaAcU/jBAWA9seMaWEmWbt9mk7n3+7BSKwTjKABBwtQnNIP8guOWBtSe3VgRudetT4ki2FqaJ6/tTkOKs0iwo3jSoTmGJ3oEk0MnTZgKLUDov2j5R3dwJI3qRbvat+xv8uTVRoIlefqcyTpuK4PazL63zTpQOBoC33UAaXULelVYv7/IBPYB/1pwycySKxSAjI+9OjRQPWssY2b5c0FpvkLqcqF7hEKR7ImLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lH7tV4aOaw8eFN+gl1lheWyyEhVYlsnTnT4y6VWzzCs=;
 b=WlyE0FsVbYHsFox4ZxgQZekO/zPT6rvEYEe7jWo5+QjeLX8HfZIG7xhovMntMfzkes4YhOaSCIjgm6E5+mLHBdknF/nwlb4KECpCVpGPxRPipzjywIgAGjSTLqvsIl4YxwOsnoXBcYYqEq3B+S2VopdamOSdqXL8hGSQ2yuAm8RKP8BTCrQlMiq1dPkLMGZhFs3J3G1Vc74n4z1smbI9UcfnmKMJp58rC8fO/SapKxmTJcF+zMLwFx6iZe1toFWPvfdRE75IO2l0hxo6EufUS23rxP/wM1O20MoaTuG5M4Sy3/VxrroBAUKnwoaTSbMIOwbuyt4wlf+OtsdLLoEy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lH7tV4aOaw8eFN+gl1lheWyyEhVYlsnTnT4y6VWzzCs=;
 b=cebgOdkkjaAZs7tNWFjH64sqoFm0c9JLoQhxUxzRSam8HTC2LeYda3GXq/QhFcRPN4dJFy2dPu7OKvraCf8HZzQ9sq3GwpXPULRm9N6F5kp4M5OSDTYE0GbrH8TGwMjEd5CUeSs+M1jVpWL2K6ZEzUKmre6prU7kZHd0cuETSJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6362.jpnprd01.prod.outlook.com
 (2603:1096:400:a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 00:08:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:08:41 +0000
Message-ID: <87o77z3yeu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: dt-bindings: rename ak4375.yaml to
 asahi-kasei,ak4375.yaml
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org
In-Reply-To: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
References: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Jun 2024 00:08:41 +0000
X-ClientProxiedBy: TYCP286CA0357.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7640ac-8117-4dcc-22c0-08dc8f2acf9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|376011|366013|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mGydWvlLU/Q1j4h4h8smoxjj2tgdBCv2w429kEDX7PLanACp8alDrvYXjn3b?=
 =?us-ascii?Q?ai0CBl6P0Lw6xOnH7zvFFa3H3GZf4ftuCakREQS6ktRYilJsuGcRM/c6/I0P?=
 =?us-ascii?Q?W289cH8oMESOHzPz8y5cAHDAEpSXs7KOLoXgCJHNVxlHa9yYMVSrxLIRFlIy?=
 =?us-ascii?Q?Fh8JH7n/JyCpHvkXFshpLVdGb3g3pmM6yz8FKZ4Kz3D8XE7tkzgBSfyy6qJW?=
 =?us-ascii?Q?lGTu40FJ21DFz76llEHEFT/A5uhsGkXvRwUWBV3/TU+EyumRnvWyHdUrEFeK?=
 =?us-ascii?Q?hNNqiKd5E2X28G4rwOgq62VhGhDdWpIINo50tafcNfb/ls8hZ5ZmLVZJsjeO?=
 =?us-ascii?Q?axEpH6rehB5kVB5ViNagZpeKhuHFQidP4iIQQRvAXODXcOfApsk0FvKcQSIx?=
 =?us-ascii?Q?t8KfJl2olIn3d/qxaeHzG+s1qcTjlWyPK15Yk8Yb+gE9/6KsU5uFGcIxepNT?=
 =?us-ascii?Q?UK9/RYapskJSLD8SGKK3Js1yJTRWqCr3ajO3F+DNnM7dZJMMwl74JG+A6C9/?=
 =?us-ascii?Q?+gh416/sAvu+Xrq2xd9Pq71lD3L6WDV1+CxEoJngaPcz1DLGSuxo4ufksXPc?=
 =?us-ascii?Q?Ug7jO7RxGaTQ6kOd/qfqBmQkm9jxYcfypHYXrvm5XIFhbck3DHKap5WvyPGW?=
 =?us-ascii?Q?L8joFcMQbdNSqrGuL5NVt2wgd4Gl87AuT2HjDUXD2QGVd03H68fcJam+ZPNE?=
 =?us-ascii?Q?6w8fDUu69/SFQ+tdKhKj+xchzYRnWWQiT6oApiFoR8qKeTVTjcsSdsqXOiWS?=
 =?us-ascii?Q?APNakOvPYLvTzc3EDg4eEuHXxtsMD6moB1aPB/oID1u3z5XW5mW4w4FPv4iN?=
 =?us-ascii?Q?4XIJxkVTWPFwvtGweyl45h6QYjqyfo2urTqlNqAv0GhV2dKTi9gFn1nlDcJl?=
 =?us-ascii?Q?chtUsTHfpjbsWgTcCahSbtrfUVNi5qHsUcRoHWBB9+FVR3cpZQ/c+mh4ndkF?=
 =?us-ascii?Q?MHjphXKSwu1UJJ/7Mtcm1f19ZkgC8CdF/otLEgPYzTjV8ykv/8Q+CqcVxVoX?=
 =?us-ascii?Q?eZUzenli2gtYIPOYaIGChb5kMSA1PK+W0eKPjpMDLO6LaLBwckYvggUCAbzG?=
 =?us-ascii?Q?s1nnIhGYhM8rGa0tX4IyHmC4N7uM31xUfSNAdwR3dqk2qHYNZ9E6zKElYSaP?=
 =?us-ascii?Q?TQgsqHGG0NjTD0kxVnZZqxAjMALKUF3HdzW1IGNBBRR4KcC/Xq9BNIyRymA+?=
 =?us-ascii?Q?oK8ckWOzOrY6DfTQKM54KiAXdoSLqXa/p6ba548kPiqMsUEDUnUkuKrLSanT?=
 =?us-ascii?Q?EZpwQw9VkXoaRDq7iv7cAEqJ7N9tr4heIQ2Kab/Bp90fa9VucQHcVN4NYK/Z?=
 =?us-ascii?Q?WZor5+WKjfyZGHUrjrXq18+E?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(366013)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KxXc0zao9gbGoT7F7ByxvPNdh7QSi+h+3/IvmODSKfjwYycItLID+SHzdp+O?=
 =?us-ascii?Q?WH1YTvOe8IGPPWIGFsTUnXRFY1cpO/4wuZrlvLUULXsYH3JVX/vLpmlOBfos?=
 =?us-ascii?Q?c+gyrErZmF9wlIKIMDiVVmkKVvBrUX+y9/ZTX6uHOilbZRPqw/51uprKG8Ed?=
 =?us-ascii?Q?OwD6sZxblc7sxtZUBX9JcPepwvzzm3Y8EBfe07iDM+yFwy5ZtTeKt90r5ewA?=
 =?us-ascii?Q?l5jBeL7j6oZM0dXuzPDrJ6jEjd45Jfc95/KcYIhRu0Gi2Vh3Z5pUKgiHvgCY?=
 =?us-ascii?Q?RVu/Cy9EkSiqDkMwPSX4DvoEbbNPVPw2XpkcB2rGZnhaBkR9ClRqw92K+6Sl?=
 =?us-ascii?Q?kAMXsh5dua2qu7TaizX6ByGskNdPKDYBAqpkW1DY45XIgM4pMtyyGjpm3H3r?=
 =?us-ascii?Q?Ze/aHck4qA3Zv433pasvmF9w2Sncnc+T6189q/EnnAyzJln5yUBXx7Yf9rGW?=
 =?us-ascii?Q?nOey30A6+FRd41s4XgSPV85ojUplbxQ9sRD0lDYNlG/LyrdNWmhMlXIzdZ5O?=
 =?us-ascii?Q?z/rPKrTDblPJIlfr3gB/LZ8riBCBR8iuT0cat4YYEr67Fz7J2u5v2hi28ICv?=
 =?us-ascii?Q?ySBmIy3XB0uW3eI1hgJonvI9Z4d/6JWac3ajeOOmCfjuqqAUkfbW0/QI0RZk?=
 =?us-ascii?Q?Z6TtenyUwInkT6DmPMx7zQ+F4I73q+xlHnWUkKuksIEp87hubSJTT8GvqNlY?=
 =?us-ascii?Q?TmC3EZBvcq9S9tyIGs3hGDdug9HaZ39QeK8A/wt61FFrWIRrb8qfMklTk5GG?=
 =?us-ascii?Q?92VSYf54UHGY0E7BJtoMKa0BaFOEK7dn3umNG6f67/I/4nLxElRdOiK6bXWE?=
 =?us-ascii?Q?HQWl35chwHKKxkDOhPksbBkecum0G1Oiqn5qI++itYfIXZvr/Jwqu3FrNw5p?=
 =?us-ascii?Q?m19iujlgHz2lz30/n+Ck+lcO2DAD5y00zGzLW15zH8UP3jscTLqYJAMv9Iwd?=
 =?us-ascii?Q?ZUwQj4BkAS6+zyPgAWunGDBhFmPzoEl98GpAGIlJYLMC1q78P0H8tyd6duUJ?=
 =?us-ascii?Q?vvxt1lRYNB+48v30TvulOHuUeUJlQuV+bzrMp06wfD6bVyEtmEKROJZ2fZ9M?=
 =?us-ascii?Q?dkXKvxmEwjugfEhxBYd6Ac8Vx9lBPbvzsQ4P0JzD3oUP1ZcJ45kg1Om3n81I?=
 =?us-ascii?Q?eSs+jzsbsKGAz4qG9WX8gESWXMa+K7E6pdDGW0JYhyiOD59cWtTIuGlqGxW4?=
 =?us-ascii?Q?eec+Eh9xtAyX435X85EFAbjNlBmAkkrWpbGqt5TzWQlLjmd9KGY1XH6lobqZ?=
 =?us-ascii?Q?A/kU/8daZJaaGRE84POZthLPXj2sk+yKugm1/NbvBiOjWkSkHHvUdhgHVgtR?=
 =?us-ascii?Q?j3XlMI74GMGdNnT7y7LiodLTfGezG+T9KJNDJ+hNEZwxZTAnN7eBMVT6kGPi?=
 =?us-ascii?Q?FCqB1K9VNzEn9aYF5QS8/NA0dBghF6yPoGAz82/7/6n9BJ8RIussp/+62BxI?=
 =?us-ascii?Q?0mi4+JRuseyzX8HzBPTnZ0cKwWSV4cn3b2wZGLD0KpgyFAHzJaSEKohehYlw?=
 =?us-ascii?Q?Dht6uQV9uv+pcTGODc+dvOJlVMxaxfJ+7tv8GlbNiTmIiFj3eBpKv612Ex2J?=
 =?us-ascii?Q?WAOUZYbXZNjwzOoyeg5bFtwXfEl/hePLqa4JLDsexHE2LLF344X4YK6e56ov?=
 =?us-ascii?Q?VqPxntwpsE7kVFQYDZC+fH0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc7640ac-8117-4dcc-22c0-08dc8f2acf9e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:08:41.5426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m6ZBOP0gMCbNmYKqY6ufINh91qY9NxV+pav3DNpdyk8Lby8oW1okM9UelKD33ssPURksEHQ2tF3hPOdHmOQbldRjvuQMAnbuEi0V/X4XmW/7YGQWfPzt/P+tiDkqM/ad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6362
Message-ID-Hash: OJMJSWD2MOJWE3XZMDMWM3R35KEPXQF7
X-Message-ID-Hash: OJMJSWD2MOJWE3XZMDMWM3R35KEPXQF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OJMJSWD2MOJWE3XZMDMWM3R35KEPXQF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/{ak4375.yaml => asahi-kasei,ak4375.yaml}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/sound/{ak4375.yaml => asahi-kasei,ak4375.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/sound/ak4375.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4375.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/sound/ak4375.yaml
rename to Documentation/devicetree/bindings/sound/asahi-kasei,ak4375.yaml
index 587598e122c6..bc07fcba535b 100644
--- a/Documentation/devicetree/bindings/sound/ak4375.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4375.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/ak4375.yaml#
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4375.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: AK4375 DAC and headphones amplifier
-- 
2.43.0

