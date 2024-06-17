Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154490A0ED
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 02:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2A4A93A;
	Mon, 17 Jun 2024 02:32:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2A4A93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718584333;
	bh=39bjgCLia31D8eqo6ZZikTzLLxIc6+Dupd15MExt5GE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lOireuFu0NsahnYyBOtBtyocx3wcP8UonC1NUJ7HzPr0VJ6P+WfH7rAksR4uMCQTw
	 vF+6qCLgVgTInLTsp5mhcVmDvKnf3f5bfY8ZYGBxSZQeriZPmFr3eV2adN1TNXkC+R
	 SoMjiwMPFI6R1xNJH3HLu9EezJhnmhPJl5Xw4tZ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 195B2F805F1; Mon, 17 Jun 2024 02:31:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B890F805AA;
	Mon, 17 Jun 2024 02:31:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A93CF80266; Mon, 17 Jun 2024 02:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5BA5F801EB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 02:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5BA5F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jSewL8aZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSngYI4KRSknA3s3pxQfBbBY2fnLk3qUhwkaJCWMs1lDtQgZSqzti6M+6GpK7US1zm4MdJIYvLpokJ1BhJM3ccoOZ/XIos44Db0wWa7VwqE4OdLXCkM+S0MLm3yrygH4IZeIcQBHUt9J3fSVmnGlI3NeuOJ5xKQXUcCNHHIMOKm/QwHIipMQWKSreoxQ6g4G0NQ04jCmqGs0Td4UzkUKAra9i8oCp+8yeWugmDlmSa5Llk6PlSChc+y1Dd7ydIVdfQ4uKhLmPpR2f4lkOXhOO9QDH0ct7kCYmEOIKAZNWT+1R9Ip7aMBLzja+JtPr5OescxQazCD9u20Kl+wf4Qffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nARcZ/6rxsJW1ouFkbUpULQREQb+U4ly8ibYiEze1u4=;
 b=T/j+qKERFeOOF8tn0XicEtDUlsHHIt3vjryHbB1h1hMfESDr8K/eFElkaTviBgXDGxcTd/pgPSaST92QjALOebZdLTSPVEWRmIKHnaDD2622cGZMH8+YHLBU603AbK+9UnpOxbuox8iQsL9GLmbObWxtC6vckUrppxMFyabJW2kl76qfE+bM21lVh/6F7GRBq36kgNu21gdUH8DrpaP3LSrZzOa792NvORBKASYhXa/GLcz5DoSEXgjFBS/vnn6+89D43/1rD83L/0mwGQO+PX4eJj1+CxYrrz5DdJiSwW1PeZ1p+ulm6errPYvkM6shmyl02aXWYZArn8oNpuOatg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nARcZ/6rxsJW1ouFkbUpULQREQb+U4ly8ibYiEze1u4=;
 b=jSewL8aZqpCh0eAWLjIk/IWmqFnS7pFidvQiAhewIz9rfk12mNqm+laAj9aaVhsOiNPtIjI1PFjcmSkKtHKGZxwXygbKJsdGuF5KZ9OdlYVtC1+x5ssCWAgBsbrd6abH4GUyenZqusWv11FygBjfuT1bk5IkAsqQIwW+yd6UKjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8383.jpnprd01.prod.outlook.com
 (2603:1096:604:192::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:30:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:30:47 +0000
Message-ID: <874j9stnpk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: ak4619: Add initial DT binding
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <877ceotnrg.wl-kuninori.morimoto.gx@renesas.com>
References: <877ceotnrg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:30:47 +0000
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: a667d2b6-1f97-42d4-40cc-08dc8e64bb9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|1800799021|366013|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2+fGJCM1UHGc+SqMASr0Oh03M8rNj2N7ok/9iflmHrIGZKA0EtoBXUAvL3x1?=
 =?us-ascii?Q?VkY5tcUdiy1RPltUj1m/Mlom7ufaTiePImOka4Pe+tEE15sUV6WoC0X0zemf?=
 =?us-ascii?Q?sW/8DT9La1G2IkVPPE8V6gozOsYqTCNa4Qn3p9zF8w/xL39esqzgt+aNFkIX?=
 =?us-ascii?Q?NZwRKs3tpp10loJQ2K4cB1sN0zJmo0fExtId5K2aAzSt3qXmt10xW97gnSSn?=
 =?us-ascii?Q?SwnHXAZSouRZS996827a4RYV1CXoAtpAlI4PEjGVWM44cERz75tLO+uqmVAk?=
 =?us-ascii?Q?zN6YYu6AVxgqcCjwPAZpznRkuwqc9YvAVECNuZZwHgndzHlXk/5BUO14PZ4t?=
 =?us-ascii?Q?/wODdwxOO9gdNnpYf8tbMeAns78VpzzoUrocdxVE/Kt7Xitdxds7bktbMgqC?=
 =?us-ascii?Q?BJTHHfiZuY3FSOpiPut30vo/J0DJ4SFkqiA3QNqvCEuqp1S1lo+N4SgV1FqF?=
 =?us-ascii?Q?JoL9cHItnkF6sgMG57IlpHzFtLcsyGU4GjRelZicXRGnI9kchrNMGuUEbtY5?=
 =?us-ascii?Q?aAnYcMLxjchSj3Bl6KD4dmm8Yd6ozZtxo3p3vWV25DdiO4mF6bw+f78yERz8?=
 =?us-ascii?Q?u9crnzDrCTeIGd5dsmyH1w52JSNlvXfMevM5IbuySD82/YtQghVnuq7UitIa?=
 =?us-ascii?Q?xDv3k0dRU1bOrJ73FHH5N3Vm84j+PZe+tAb+Swa+u8ddUClf8SF+O9aDpTYX?=
 =?us-ascii?Q?Q3+P0lD/eBFscq3VgQ2SPx2PA1T3+cLX41vHNvS2Hc+51Zp6eMig1bjxppSB?=
 =?us-ascii?Q?XDV/eK3BNb68LExrfzQ3M0b6Pd0oYhRGHDOsoT3NpW3ruRbya0/OJqmI/lB4?=
 =?us-ascii?Q?+g1trph2IsQFfCDtiofbhpQde0s88BKAAP5C2RGG688RnVxloWTHCdt76BRZ?=
 =?us-ascii?Q?t2PkITZQ1J2/RUfQDpsIj0cL+yBxVFVsLEaiVJNSZZl3NmhXx25GB+LVNV5h?=
 =?us-ascii?Q?oK0fGLByVV3Psk+iOW7mCRoQl3L3bsLcwpkUVluJA5UV/onjYPVvC0hQOBwA?=
 =?us-ascii?Q?N0IYXbX4WJtvJ/MGDQL3qF9vx2nVF+/ZjPCZSEkS14vorS0iJ4P9/FLDShE8?=
 =?us-ascii?Q?9YZWpbO5zuXlRhpFb1xZiyqCg015PL6PcJbhRpH1ayV/jsPf6uNxlVG/G6O3?=
 =?us-ascii?Q?1JQCmKgKKmVDynA7kK+m312Px9meoNWM/DozCf4KWW87eAlW/FYcH9jzhfwC?=
 =?us-ascii?Q?KMqcTB5zBnL6zELmjluytGil7KSKWL6Tng4ZxuhUFhI3QA+FmDhobJZ7GmEW?=
 =?us-ascii?Q?8HuV4cU+HMsKFGrOTK6oCQdkzo4zzLeaaxkyxLfq7xPfsFwQRTaFlK1w+Zng?=
 =?us-ascii?Q?gOM50JZEnJHb4rq+noWA+smx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(1800799021)(366013)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P9HY3jpYzQUz0t9NnsybDN0qA2eTfnepV5BFdNItMgn4upntCw8ymeu08qDw?=
 =?us-ascii?Q?RNnCTP0m9PgWWWWvlNVlRSHT0f5gUIcfdZudXT9z0/zlex1nLWLBTgUToEvJ?=
 =?us-ascii?Q?bAgGcnqouPoc0gdicy635OUw1wplIJApBLozDtECPhXraytTvCxIqo2Va5zR?=
 =?us-ascii?Q?YGWNZ0q5B9MUFDU4H47MWSnHtoLfQ1nNrXVPumJpuL4jh1NdRdjJeuyhko5l?=
 =?us-ascii?Q?Bn6RAAjkT/KvBy97w7pnIfQiHTh/hID4A/734/0wzkpyHVf8NHy7ES6OyMX6?=
 =?us-ascii?Q?Uoha2FzhwtWXE9Cx4K2oROOuLdPws/3iYknp0ft5d2HNKcdYHrrgLhh7320G?=
 =?us-ascii?Q?xTbtTu39RcP+ZwWQ74WMunRay1w8dLGtYGLP7XNmh2+3TTWfV8BP+wY1P9Rk?=
 =?us-ascii?Q?juQHY1ZDLor4llb59A1acngmHrPuWQZF/3MIfOfPk+pUMJTVoU1QlUXCdstM?=
 =?us-ascii?Q?RKQMEUUrfQYuQA81MB5XG7mbI1nIuULslPGrjEN1fNn/rUkHnFeJhPQyV403?=
 =?us-ascii?Q?w6vwO2jjnVvNirpNFkg6I38TwmeSWov5y5B+yOdgHiSXYvuIMV7UU2ei2l+3?=
 =?us-ascii?Q?+IGjgPQ5EFthcPj3/X0iizDfLzh5POyH2ne8hel/QJL2+dUR5Vj10NWuAVU1?=
 =?us-ascii?Q?3SPsk+NSqnSviqg12hX/DUrcZtrx2KpXkSwD0LzHPNFhfzgudmsAc3Ql44wB?=
 =?us-ascii?Q?nCZb+4zJPJCz6UlUBwS/x0ZE6IqSVXt0juKyThOeu6LILXXsHPB4ke1vpp6r?=
 =?us-ascii?Q?fVzU2/lDMZurZuBRQxibGhKvmouIkfkyQgbe+MsF4/h0Z31JQ12/mKkiQouQ?=
 =?us-ascii?Q?Uu6+4/uq8kJmm2KAgIkOUiYZYRPgS/4r0EngrfT1Ho+WO7szr639Fn1GOI7r?=
 =?us-ascii?Q?hlU7dJU15DMNXOHIArLNZyDnEWbGZvXHzeWGnjZR94GGHhCRYQ0o4A1gE9AV?=
 =?us-ascii?Q?GB0GOZOQkqxHcd2KxtcxHXs/dFWsu7iGFuckgjnKKYg5taDNZWd6/gw5YwPh?=
 =?us-ascii?Q?znJc7bE9mA9FS7SYtgBmNtmkYjF8QamHy/Beqhso7pVaXhJSp5dnOkIYmVJA?=
 =?us-ascii?Q?DWR2Z7KD2GnD8s6olWj/73dr9mkm+oXXBFdQvdmzBCKa8AVBd94v01vBpZf8?=
 =?us-ascii?Q?BUPmP+u859MIJKP/0lF4Hm4gNY1ZlI5VqUIlsTkGsta+uhan23UnEkWjseyi?=
 =?us-ascii?Q?9Dcvx0QsMcZNXlKYv67YV6vRaJg2d/w+pnpTvIQnTF86pL4s+cV5HGPE37oV?=
 =?us-ascii?Q?qXuQfXXz+/WbQTYgrK1ABbE+Zqz/N6x+tFI/wvvQy0yB54Wx3qHdE9MmWeAz?=
 =?us-ascii?Q?tyxrpoOQvSlEBt7MSo9jqCOJ0f0O1mGlCYXpPjEtNWl6/LPomuiCw5wmyKhT?=
 =?us-ascii?Q?c6vlxwvLHg/zxmmw4f54Jp1htiY88zY1CHBHvsX2Zv+Ngdi9XEZDjf/m49wo?=
 =?us-ascii?Q?yY3h5fKsY04hGy7H5Kg/vQy78MrHeH1Cjo6udC/pUD5Dj/hHD+5YQubZ+ObA?=
 =?us-ascii?Q?ivkcEIkwuc3rMcnnS+p0gmRPIFhOpga+u13f+C1ddAxH/AKFiM/phhJII+SD?=
 =?us-ascii?Q?whwJ5iaR36cYxnswuPmI8UU4b9iVIj/TXqBPSyQ1L4SUtu6B7ufV1qaJ5W48?=
 =?us-ascii?Q?/vYkok4PwiSiW0QCLffw1M4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a667d2b6-1f97-42d4-40cc-08dc8e64bb9a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:30:47.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tJkquEMxT21BN0E4PIpho4rFrS8fKcAuGfcgv6/OBBOLHAkPlb6XXHnCOLF3NWj8Fx/iPu/7HkJaJneHQRORkFMnmQNHz3OrR4v5gR1PmbR2h3WKVk/tBjt+9fOA3H6R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8383
Message-ID-Hash: 536FXAGEJW4TYPK447RSYYG4YQJX72JV
X-Message-ID-Hash: 536FXAGEJW4TYPK447RSYYG4YQJX72JV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/536FXAGEJW4TYPK447RSYYG4YQJX72JV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch add ak4619 DT binding

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/ak4619.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ak4619.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak4619.yaml b/Documentation/devicetree/bindings/sound/ak4619.yaml
new file mode 100644
index 0000000000000..b6afc008f745e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ak4619.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ak4619.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AK4619 I2C transmitter
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+  - Khanh Le <khanh.le.xr@renesas.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: asahi-kasei,ak4619
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  ports:
+    $ref: audio-graph-port.yaml#/definitions/ports
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        ak4619: codec@10 {
+            compatible = "asahi-kasei,ak4619";
+            reg = <0x10>;
+        };
+    };
-- 
2.43.0

