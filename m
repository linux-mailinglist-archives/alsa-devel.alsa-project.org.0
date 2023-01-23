Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168796774E5
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 06:27:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D2D54206;
	Mon, 23 Jan 2023 06:26:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D2D54206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674451651;
	bh=jVCZwL46MYuWLWFAh4H910pzVkc6KBP08fchTNndpNI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nQnWX/hTA6PrXD9uJ4in/7k1Hr1nSGF0ysmhCFtyPuY78budu8BBtKn1q7+kp8Loq
	 TAC/+6Q93yRPftcX3R+P8IgeV7f5qDSgHzB/GxiSawKRZ9nkEB6d6YDVGWD2onzQ+a
	 nKurR5wr06Z0QJf4IqV25uL5G0Cwytwn32+kJlvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABEDF8055A;
	Mon, 23 Jan 2023 06:25:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DA5CF8055C; Mon, 23 Jan 2023 06:25:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34707F80542
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 06:25:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34707F80542
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VM5m3MIe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfQkQyM4p5Q/vwR3HJAbjGL6+RIzopTN1lL3aYs2p3r3EAkSAwhQcPSxvNVholJ+0aPKcQX+D9c0SRtyL6LGLvq/oMfspH8uEZVtLyfnYosLn3dpWehM/wq8O00Chr7v0bbu6ylq0nfPilA7B3J2RpZklCY24YBjuZqnLjd9maNcfjCd99Sg7ly+LIm11RbO1sekRml8qUtuUHZcRwTbMMvb1UhCOPmrDXUX+em+0G4SYwhhqQ17BYvyxEo5sWujrwcQQq0dpkxQC1EXtUYNw1FyOcegK1xPqffhg6tSM+4XrW/G00gxBLd5h+YDVPjDJFIX3En0GK0T3gTIKdetCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uUsIW+Z08UIyagnXS0GUsOsdli/f+B20mLongTSf34=;
 b=QHZQKsbUckLkb6NcsSOVGTwbpg+Ex4CksMLOvlgAU3MvqyzzOnDhi88gqvOhUOEMPiK9jvyBe8nR0QA4lShJ0wza/3rKCABrYVCQUyDx+QiqDX5znf0kTsqKXNWlwNYcKzVAaGKccJC3xOat1f5A+iosxWlc/oGsc5lPHi2xkbBhbxCMj2fQpF9SHNEFAq1AY0XcQI9h6K+x55MOPn26PRPt1fQYJceBwjVswBa5QMaqv/Bewxd00xmE+/SKtVH4MXasjCUUqFuBvCyVBdrgsE4Ji35dN0lmPFit4iShZyyi/djFFX9jk7XbQTUyJxs6oC9bTikD6YoRYoufxc5buw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uUsIW+Z08UIyagnXS0GUsOsdli/f+B20mLongTSf34=;
 b=VM5m3MIehT27eo7EFYjLZM0LqQ/wBjXV9e+DEK9Y3cF+7VPFsbH6kBOJ3QZp9uhFvvDyKDAb5w4euaB7amXoiFXWRHCsx7dmCNTyopDbzrCsV7rDnowV1xtNMI4Z78ZSrojMapzenqM/xciK0frSNkPNlf8H/F0Ct4bcdhpolmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB10497.jpnprd01.prod.outlook.com (2603:1096:400:2f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 05:25:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 05:25:41 +0000
Message-ID: <87k01d7rfv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 06/11] ASoC: dt-bindings: ti,
 pcm3168a: Convert to json-schema
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 05:25:41 +0000
X-ClientProxiedBy: TYCP301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB10497:EE_
X-MS-Office365-Filtering-Correlation-Id: 079884cb-460c-4a92-b4e7-08dafd0244bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OcRNsUhzjF0C6FHgDF4DC+LZHa8IcI3UOgy3D3e6SV5zWX6d0cAsde9UCI6J8l/g/mcOC61sLb+VDg9gB5OgWMezrtrS0yA2asbBio6OK6nh/AxyqN/0CekiMekJ2jg/yF3RhMXHR+5BuHnpy1hCO09fraZHSdkfxtlm7ksrtvyNnT18f8ZHXbfi1q4s5xGmsD9mjsBrv6kUPFycRK8cNJfiw35i+/QJAl6/cJ9DRVigLKrKALwoLIRKqQNY8xXiUIKqlFD6qlrsVqtVlsgnU0xRdRcjWxSNAFBbBRm7UknE+mqVU4tRbHPAL9Qt0Dx4DsQG3/d5XRejcmpXZKI3WRZzmqdkgHIS0T36zMPcqpmQxFziLNIM13hPGi9VqgsOeBwy6C6xk8FoJKrfCsMrqbJttc+7zHu/7iYwSHkAJtcOy5aG3okg1rHZRvROWAkWb3OYWaEHP9USw7WJ8RomcdZuDxlbUVwdkIc9FHm7NdmPdiJc2OyonSq0sx2CTchHmrp7ZuTW4NUDN/W1ky2Tew1d9Jxu52BOWEZ5MawrrGLkaYcrVtKJC2tbmi1edp9hdKlem/JTfv/eOhbP64CFaTSVLrpObSL8wzSfVSm0KE3hO2Zy2tKmEDmwYP+1MXFrHzEEjq6C9Oz9R7QoEFnaFsks5BI3+pOlfmIEmHdDYD8E+04GRvSUVaaQ3cS/KCQqYvHqpyLuigNNGz9Hbv1dcMK/zqWldY4HcmlwUB7X1q+lmVk3diruLL/NVZwnSqI2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199015)(86362001)(36756003)(316002)(54906003)(110136005)(8676002)(4326008)(66946007)(66556008)(66476007)(186003)(6512007)(478600001)(26005)(6506007)(2616005)(966005)(6486002)(52116002)(38350700002)(38100700002)(83380400001)(41300700001)(8936002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XhfrufyxT2n8ZIOvJV4hFnxuhKDsq49iNmABzIZAP7pADnwdRt6c7YBzl1hJ?=
 =?us-ascii?Q?VQBDpiHgNkKP7lnzppKaoHYKJQZSFqHEeOOhp8VhHUTyMtjFNit4LmTEDsKj?=
 =?us-ascii?Q?k9vhfevLM0cH9X2/iOw3n7jyoxw6b0SGy7YjO0oUi5fT8USFLUjqc8zc/SKk?=
 =?us-ascii?Q?/Qvz4jMaaw+HJxZBWzrfraPh3cABSYftaAKExyvVRkLhBQC4eGHDJu4GgQzS?=
 =?us-ascii?Q?lQfxWXUpR01mjJ28vBlIB0nI2KDNPubpjJObC/6Quw/NBcNYbghTJgZwyEWd?=
 =?us-ascii?Q?Ck0WGbxuo1hWkXF7JTw2Ls9h/baL7QgSxY040xfFPuOEXzhcbvWLG1VKka1Y?=
 =?us-ascii?Q?wjGFI8+VZ249hyYEuK5jYKXqxPD3itnSPvFxZOnRRJhTZFihFVvXtGYfLpUl?=
 =?us-ascii?Q?xgNsA8KsyuJ1Sb6asy/Zl0yEJs80gk3UAFbZhFdCq98sWhDv5Mx3WXe8dLLa?=
 =?us-ascii?Q?iclNqM1JVrK86zWZh1ecwr1vfaRDvPxrvH7qTD8sMjrAXy4+Z7lLq22GvFUB?=
 =?us-ascii?Q?ixdnyxqOztn4G33eGTgDbLlgU9fX/VNp72zJ82F8HHSp7zeV11zrRUObEi29?=
 =?us-ascii?Q?k6+OsltDHYEE2At+qbZkM1NdQM8nA0NS93S/TBsLHOup9Ay4U34WBSffVrMj?=
 =?us-ascii?Q?Rk3lTs4iAwLjK8N9hap3Ym0hZQgfEa9sS+6zlE5cVBHsUEN72NyDi8knp9R6?=
 =?us-ascii?Q?WwV4sSINTp7Uxb6SKdFtgynVPlBYRYiIBvx5HPkgx7VgYfIyC5WDAK2iNBm6?=
 =?us-ascii?Q?OzFfUibLM8sbxP76gvc9qwQYJuHWde5AhlCoiNFs4XK3Qts3PnVcafeFjHbe?=
 =?us-ascii?Q?XCGyS0Mw2vbRQ+CBHrEIL+CBgb/9LqKWHcAjVWkzr+W5NRiesSPNxIDM+BOQ?=
 =?us-ascii?Q?zEPTE0IRCvXz0/rlH+g0cI74kzL8wA/Fe1htHkvpFvyKx5KwzlB1Apbsz76c?=
 =?us-ascii?Q?V4JQikPVTrvBgqOXVnVlN/JNiNTLePLSHoykkzdJClLXJlORGnb88DBw1qMG?=
 =?us-ascii?Q?SjePfn6lqhAax86lHZHtfXrns7cCGIzxv7ygXNpnccK0rxLE65pUvPjwxSTp?=
 =?us-ascii?Q?ZaQwZE1tKc8EcmZjqjGekYGiGzWG2fDowUgQdsKnIAZr+h2F+S/z3K06/uqr?=
 =?us-ascii?Q?LH0+q3hJECkwdhvZOaQMUgat22gzbYxx8OYHEVDOxO0PxwRXVViA/+oyRJMV?=
 =?us-ascii?Q?VHCUdAWcDfzYEZQf7XZt0f1OzueBuIYa9msSbyKFI6mCW75uQZ/qE38tWAml?=
 =?us-ascii?Q?UVlwEhQIk+wUG7qwPNHwp4c0HMt5FmDokIhFrtcpzUsVFlohHtPwhoWpXniP?=
 =?us-ascii?Q?DCM491ASewKDWIPi+0DFf6MP+KWl0vjh8Hs+sT8b61YT7JOcqXHCSlh4D0oh?=
 =?us-ascii?Q?iVOmgURs8Yd7ow+f2NffYnn2eiWUUrm2EMHF1NImFQNcZ7kZI0pW/YQAYBrI?=
 =?us-ascii?Q?/gWRDOweGdYX53gVL2AfZcgb0q6vkv2nb1Bg+aP+iEtoa2RsJrcsKheeQnA+?=
 =?us-ascii?Q?3WdVlCIvYxN4TrxcgogQpKtBw0e6q3zDETT1w64nstL8RAhNsxcNP8+kQhH7?=
 =?us-ascii?Q?/UfIN+RQN5JYQW8dkb2x5MktLA0tugfnLjTzqMVjXDpqYn71Z/mF09Z35TK4?=
 =?us-ascii?Q?rnS9mwBApsRNxRlIvANOFWg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079884cb-460c-4a92-b4e7-08dafd0244bd
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 05:25:41.3110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iN7eVcx5kHCiGCIzgFOt2/vXNF+wOpaYhoXhdMMJu20pFmZIYrDruL49L+qkosTm9g6SnUmmz+OlxMntbRcaEJSAKRh/dpOeCmRfMM+rCNMv3tijBy5JjZhlHQhyiCZs
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
documentation to json-schema.

Add missing properties.
Drop unneeded pinctrl properties from example.

Link: https://lore.kernel.org/r/cover.1669980383.git.geert+renesas@glider.be
Link: https://lore.kernel.org/r/87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ---------
 .../bindings/sound/ti,pcm3168a.yaml           | 107 ++++++++++++++++++
 2 files changed, 107 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
deleted file mode 100644
index a02ecaab5183..000000000000
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
index 000000000000..b6a4360ab845
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

