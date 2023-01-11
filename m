Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC446650FA
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65054D321;
	Wed, 11 Jan 2023 02:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65054D321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399553;
	bh=IpD2FIYm/AW9CfKYfWVSs5q+ljlEO2R0z+TvwAsGwXc=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=blYwWa7R6wDCpJcuyjYSRdR6mHnSWJ0DGBr5D2vkwXjzEX51Fd7TNOJQ8gGcOcNui
	 WseoO7UWbC9rpkTIheGu793Epng0mw6VqsuFuAm+vxC4BLrJijk7ZZwfFMQQF5G+mI
	 8q5qIjlZplnOLwnxR+1o3IODXaKPrrXnROmo9qBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C391EF804BD;
	Wed, 11 Jan 2023 02:11:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12ED4F804DD; Wed, 11 Jan 2023 02:11:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90832F804BD
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90832F804BD
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mJ85hrlC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuoATj9weTRGEpCHSfd2vzeFqIW+ZYYGL96cteb+kr/Vg9yYYljMG6awR3StvVAGtVhYxGFUpU+jo7Uz0AKzgUAy4sBzTLXsGEKbgtutUFg45wWRUQFYJk40985hBi8aol+lLYc0e3uCkbqLBPwEu8Na3fh7rnT2xb7XmNu1dozgy4+nbnb7nI1Mp6QHIRDaogol/lJGFISS2nzlBeS09Yf6sNkSZ6DM33xoUjNxAQ1r256r31RyzxVJlRriK/erIgqC5oTAN9h58sSQnaQ0RIZ4mlEI38MNs0Cst1/8Wdt412ri5IyK4t+F8LqrTtFhqGgqNh3SRLIVVMANcLqszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyoJXVoylJ/Y6E+FO1lTr3MUhEMth+0PSOZoY8kywR8=;
 b=KNkjluzxRzYzPa8CkJ9Jvrzi2PQ1kFykZkOvVwJV1fllMunKL+suuK1yWwegYz8rJanRqNq9iIgtJXvNmqdnW+cyWCU3tOyTgobd5Y3dd/6by8b2IJ5ZvRq+xaEl7wU23OrajouYnrjuya5nMsAZsgBo2o+gCsHU3dLEXiwRBpf3HUoLZbX41DV7KAVTbcvrodatYcI/qR1mBRNkE6PXu/5zWVWO3jrP/txTxarjfdosBLqfs0LxLw4Pr/5A/v/+UvFazhz9a3WIH5o6bVwBquG9CU3/hfZEKut9a/wIJh82vSOK/EDmXyYj6U3aZGarkqW5r8Dt0U8dZCC6nH9xQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyoJXVoylJ/Y6E+FO1lTr3MUhEMth+0PSOZoY8kywR8=;
 b=mJ85hrlCB7BvlTROJbR04fNSoV+W3XUVcvQdwIomgRDqzAEgPpcOZe7j2XPv8himtVxBtGuxUk5MPpUonDnUH7YWZMQ8GZNdjyk69EoBZmxA1NH0kACAEfZUUoYfG/yLkI8FvX0Lo5GNMop8cc/KukmxPdSTZy9txe3/XJeivWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11030.jpnprd01.prod.outlook.com (2603:1096:400:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:11:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:11:35 +0000
Message-ID: <87tu0xho3d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/10] ASoC: dt-bindings: ti,
 pcm3168a: Convert to json-schema
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:11:35 +0000
X-ClientProxiedBy: TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: de54d37a-12a5-4a37-131e-08daf370c883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xmJa2nz4n8ijdzZvo8GqlKMO/OVlOndBP8Kt63kupOiwtg7BEnymNDNjVSMxpWvDIl//z/G6gwYHD+BX0ZIWgkI8wioXfZ/euj5ZMJUdTXaBGN6BA6tWpkdSVRpK/+Jf56a9QeHl565UA2h3/Qppj5ChJJKwy9AzCfMVpH/AEn3mS8mGCtwENAeHP4qmewvHWiGdeXnsQzpdPTWlYLp6KZwAnKNAX/ozk2E5bYrLlxglBufnpewMoTLfxJiF/1hnwryT5q2J/WGAZBpN2zOHGbvmtK7+xyv+cuxQgsoi0K4OJayMV9PFlShxOUOd+f/I0wL55SD5HQZ8Zjh1eE0CjtO07rfMZDlcUV+bdzWwvHgVvmZRlwsFwyv0kWSWwuXkCEXauyFiXOhG6ADSuQ15OIyiIqHGEv3PW2Dx6AKScMPY18454aCqqqog7A0+MTbwLLm77MYxk1mGOEJBVLFJImUaSmtHfCe458iJ6pfanI66KPHvsZpk4jSDCybaCQYThGLd+EL8g1AA2QsJLpBilRief/BEcbHpwilouDUyhdFQG7Gm5rpo7QcnmA2qnKbTSYgDUpPaXPWie3QYu9DD4veUHRiAAsy/60WXKeQzGbvpDpqOacctKrdawzaadD0uCRx5QF6sOz2GdPszRGlTbo46yyclRTR1CIQm8I44OCfothZJb84nPNle8oYE+yPlZlxKF6Rhz7yC0vuMmaBIfD4w0c+6V3K51GXgTOJcyu8oeqw2+DT8RUTndj13LzjB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(6486002)(966005)(6506007)(478600001)(26005)(186003)(52116002)(316002)(2616005)(110136005)(54906003)(2906002)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(8936002)(6512007)(5660300002)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YWJTk5x3KcD08+8FyazdI/KGeSeKwDxokZjWlBYkrlg/UDsf9Y3LkuXfIm8Z?=
 =?us-ascii?Q?bmCrJNVECM0ypj2JL3kOVfHnC7ulwJH5iEGSphoDutEd4bfaSLMENvwoeMJS?=
 =?us-ascii?Q?vNn+HKulHr/fSh5bU+sWCyV9C7RG+20QPC8gGnRkMIyiy6rdL8b/LgrcbInt?=
 =?us-ascii?Q?bm1l3Ji3FxqXnsVTD8cW2V6GRXg43Xc4zWksg2TcipQMVV73InlHEOuh6zp0?=
 =?us-ascii?Q?aPTepcr2/0Sld3aoUzyRdVBywSJlTC/5jO9f5mn2a3sYqpzxar7vbPVnMvS2?=
 =?us-ascii?Q?6stgwNvg55CelZZkX4mqEPfvNLxxvf9V9HokqGpaF4GQ+cXXDxgY+Vob869I?=
 =?us-ascii?Q?igfVrQ4CtrBgysNKwQpDqMrBAlknzO/K/3XvhOanNvYik8H18Ey4rpVm5x1+?=
 =?us-ascii?Q?ms/Ub0Ik1mq/pm47RzxqCZ4eJBMAipXFME9Sw+1iFZMHNvWQtRs711vK+ZhE?=
 =?us-ascii?Q?S27Nv7EoscIgRFSuBHHmzo972xFUm/kQ0UD/IZndheqBRqH3mmCIgq0A3h7Y?=
 =?us-ascii?Q?YRL/34KFs7DFQrMd3CcTdYjPVwe54IDWTy7yGewVgzTOOk9rV3TL02mKb3xY?=
 =?us-ascii?Q?vwLuntCUlcNNNBpX3z6okNEDB7fEn5/9UyGjwTl6QfHh2faUXwoc2gtseDS4?=
 =?us-ascii?Q?CXDRD28cxRt4ud01veIH9/rUG8CPMZqR5ueBSqYBbmhCFIKUyb8xbZCGFqSi?=
 =?us-ascii?Q?RserbYYOnvSTg/6qf2yShVlyWMHTSoc7ERM00ccURU/xT3RoutOVItYxKqph?=
 =?us-ascii?Q?xz5KmehOSbkRVBJzAMQfXMrluVPKhYZ4YrIPLdUSqfwodgQbhDQzJT9jgBaR?=
 =?us-ascii?Q?b3RibO8bi3uvd3Uz/UhuiyBYG7iGVTer2XOjluQuvZwoiOz4ZV1gLuI42NbB?=
 =?us-ascii?Q?FnKeakhg+2Sj/WdUGRWgw1YyKXUUtHQBlCtb8O71zWoxsEX1Q58kLGfJu1G1?=
 =?us-ascii?Q?1A7pSpvSC+KqCaQWMkHMD/Dxbll8JxLypfA8vN6K0zJyOWDDXIS+VP9zWBP3?=
 =?us-ascii?Q?Lr+1H/Cy0LzYlgX4kB5/c0+K+cD6s06qHs1RzL+hhlrTm6Ym4RqypsD2c24M?=
 =?us-ascii?Q?iq17NO5+wzzuhql7lRR+FnzAcLoOIZdjpqPA7hwI2b7ddKGNdVjJiNJb2h/G?=
 =?us-ascii?Q?mBzfH7nbwkjmgllWjDw8YpDVpsQUwbor4UGUW5rrJK9GGJ3c3+di6pIdlu86?=
 =?us-ascii?Q?yH9YdP8V4qWtIStcBZ4My6IBlilqJO8aOoMszqzwILd3qesRhjUsE9sIAftG?=
 =?us-ascii?Q?KC/G51dQUOp6DaosrJ1w4eEaBZEFeSHbQXoPrxWfpFBjfzscv/2gZ00tEa/E?=
 =?us-ascii?Q?ApbkwNN5TU075riC3QbzJIWOXm9vQ+IKhdAwHQv9iFBedVCDLvSVSujVFYCk?=
 =?us-ascii?Q?rXF4qVfx3KiwFDAkOFcHdXpYKwDum8weQl3PvzlCEsBLpfdPW/FpqGNDBNGB?=
 =?us-ascii?Q?xthIid3cV5eqjkVBJdWEJpomieMu2UsytquCtKJ4Df8zJaxhMYMUUNB0P8Fj?=
 =?us-ascii?Q?Cy5LnmoR4Y5CqmOvBoRjgqs5nV+6wQNOhRIKkbISf7OYf1C4MR2s9XDVIuIF?=
 =?us-ascii?Q?0DpN2GTFeJwslLHoQauuhMnWbGs75CfQxApj2WYrGlrei/mOVIZcI0FBL/sF?=
 =?us-ascii?Q?yI4MYz155JOpmQTYN1CgoJs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de54d37a-12a5-4a37-131e-08daf370c883
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:11:35.3061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NrOR+c0J5IC7IjIcE1iBl/E7PhlDL2QiloNJUFMEw8bkYoqVGxBFm3PgWOtZeUL6sv2048AQdHfohFbTkQQ7jbIyH/hiA6Ewn/C9ZbvT/MtjwVw1Xh31yAFEhOjoDgA
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
documentation to json-schema.

Add missing properties.
Drop unneeded pinctrl properties from example.

Link: https://lore.kernel.org/r/cover.1669980383.git.geert+renesas@glider.be
Link: https://lore.kernel.org/r/87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ---------
 .../bindings/sound/ti,pcm3168a.yaml           | 107 ++++++++++++++++++
 2 files changed, 107 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
deleted file mode 100644
index a02ecaab51832..0000000000000
--- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Texas Instruments pcm3168a DT bindings
-
-This driver supports both SPI and I2C bus access for this codec
-
-Required properties:
-
-  - compatible: "ti,pcm3168a"
-
-  - clocks : Contains an entry for each entry in clock-names
-
-  - clock-names : Includes the following entries:
-	"scki"	The system clock
-
-  - VDD1-supply : Digital power supply regulator 1 (+3.3V)
-
-  - VDD2-supply : Digital power supply regulator 2 (+3.3V)
-
-  - VCCAD1-supply : ADC power supply regulator 1 (+5V)
-
-  - VCCAD2-supply : ADC power supply regulator 2 (+5V)
-
-  - VCCDA1-supply : DAC power supply regulator 1 (+5V)
-
-  - VCCDA2-supply : DAC power supply regulator 2 (+5V)
-
-For required properties on SPI/I2C, consult SPI/I2C device tree documentation
-
-Optional properties:
-
-  - reset-gpios : Optional reset gpio line connected to RST pin of the codec.
-		  The RST line is low active:
-		  RST = low: device power-down
-		  RST = high: device is enabled
-
-Examples:
-
-i2c0: i2c0@0 {
-
-	...
-
-	pcm3168a: audio-codec@44 {
-		compatible = "ti,pcm3168a";
-		reg = <0x44>;
-		reset-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
-		clocks = <&clk_core CLK_AUDIO>;
-		clock-names = "scki";
-		VDD1-supply = <&supply3v3>;
-		VDD2-supply = <&supply3v3>;
-		VCCAD1-supply = <&supply5v0>;
-		VCCAD2-supply = <&supply5v0>;
-		VCCDA1-supply = <&supply5v0>;
-		VCCDA2-supply = <&supply5v0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&dac_clk_pin>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
new file mode 100644
index 0000000000000..b6a4360ab845d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,pcm3168a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PCM3168A Audio Codec
+
+maintainers:
+  - Damien Horsley <Damien.Horsley@imgtec.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+
+description:
+  The Texas Instruments PCM3168A is a 24-bit Multi-channel Audio CODEC with
+  96/192kHz sampling rate, supporting both SPI and I2C bus access.
+
+properties:
+  compatible:
+    const: ti,pcm3168a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System clock input
+
+  clock-names:
+    items:
+      - const: scki
+
+  reset-gpios:
+    items:
+      - description: |
+          GPIO line connected to the active-low RST pin of the codec.
+            RST = low: device power-down
+            RST = high: device is enabled
+
+  "#sound-dai-cells":
+    enum: [0, 1]
+
+  VDD1-supply:
+    description: Digital power supply regulator 1 (+3.3V)
+
+  VDD2-supply:
+    description: Digital power supply regulator 2 (+3.3V)
+
+  VCCAD1-supply:
+    description: ADC power supply regulator 1 (+5V)
+
+  VCCAD2-supply:
+    description: ADC power supply regulator 2 (+5V)
+
+  VCCDA1-supply:
+    description: DAC power supply regulator 1 (+5V)
+
+  VCCDA2-supply:
+    description: DAC power supply regulator 2 (+5V)
+
+  ports:
+    $ref: audio-graph-port.yaml#/definitions/port-base
+    properties:
+      port@0:
+        $ref: audio-graph-port.yaml#
+        description: Audio input port.
+
+      port@1:
+        $ref: audio-graph-port.yaml#
+        description: Audio output port.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - VDD1-supply
+  - VDD2-supply
+  - VCCAD1-supply
+  - VCCAD2-supply
+  - VCCDA1-supply
+  - VCCDA2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pcm3168a: audio-codec@44 {
+            compatible = "ti,pcm3168a";
+            reg = <0x44>;
+            reset-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
+            clocks = <&clk_core 42>;
+            clock-names = "scki";
+            VDD1-supply = <&supply3v3>;
+            VDD2-supply = <&supply3v3>;
+            VCCAD1-supply = <&supply5v0>;
+            VCCAD2-supply = <&supply5v0>;
+            VCCDA1-supply = <&supply5v0>;
+            VCCDA2-supply = <&supply5v0>;
+        };
+    };
-- 
2.25.1

