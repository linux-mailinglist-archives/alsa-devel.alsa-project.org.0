Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95233DE45
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 20:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B8291887;
	Tue, 16 Mar 2021 20:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B8291887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615924564;
	bh=L94VT0HRF7xIGvGX+rqfWwi7lr85saSzRG05jYjLePs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J8PzOPurknw5cuBcz91sapLOIa/RqT3N6Phh9+gHk5pv6zY9dUxgRexiDyIoo7//z
	 JkjeOQl5H0AL2OdhT8PK23be+vdjGwk3YDwN6AohdF4hTtY3lPsvxS39FjjtT5XV7G
	 gJXQLAFxoMoIqfanaavI6Ujv23B62j6dmNrt7j1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44749F80171;
	Tue, 16 Mar 2021 20:54:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B57FF80163; Tue, 16 Mar 2021 20:54:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010028.outbound.protection.outlook.com [40.92.10.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A4A2F80137
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 20:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A4A2F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="jaM63+BF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZX2UydaKy2rvNS2LgFIh9eu1lnykYhl6TnSKLrdBvL6rf52PHlFkEOgovDgKTdjOfEbU8DTj7Oej5UO7YP5flUi046IyF5fLxgKtzTQZBSzs43zswE6DdAG59Qv50mrU70WXy/BlSnkB9KrEHkCttY7ecF0cGTy1gOBEhFFPiSPzMqT8eiNgC+T6zORm20RH9C6cgi6eU7d39hg00ccvHmOBkeCQBIURwWTCZriXYOTlY7JJbnzWWfsUWddM/Csvdfcg08fnMFh8Xom6Jp5fPh2sIuZu8T/uxGh0pQH6h4OExJywczfKUM24zF1b7/vRvSMGsSoBOYvJcPb5J+DyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o34YQZLowu8HxO9dPMLrleqG0NNBo/s3gyN+46d6Hdg=;
 b=Jx789RMsTMfEHj59EmMAudAY7jnfLycjqLBx5aMeAUrg+O5QPcRDW7hoNhr//a0qfpX6meWh0qcOLIwpjhCmiu74BULickDDWOQ7uQeNwJDPerHiIhRVPBIlAhCfw976k3mL7f937tShKZ72duX65wQu1dR1816nbENwODzxaoE2rRYmoOth/AFcS+MDcBWy98Ito7EY602b/5T8bv7lDNKiprFg0Vln1G2iSNwBKCqVyCgwoXx2SCuqa1S2ylCRAXfuF4HYUN6w9OOpEW2uGYj+dAeuTWw/MPfvrZSKSJzm+FhDw4+DmFwrrTNw+jAFmuDSctkF2daAuutYo2FkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o34YQZLowu8HxO9dPMLrleqG0NNBo/s3gyN+46d6Hdg=;
 b=jaM63+BFqufYXQG+5jjGbDaVi4grhyUdDSZgE1gSoXPfoVEFHGk69gTH9W3gRfB6qf6cqeUO4zOR4Kt9c/yEdTPJ2f6gR7+TD0+g9aPTxl22i69na4boocoUcBC6SeE3+QLVs7JZn+din1H6V9Kz7V3UlejnJnKkHWO7hh7l05wBM+Keau/ec+P/yK8N5MVotTj6L4KDZhbk9U3AfmAGxXAtWN1Xf0N5ygLtrn09MsVbSDonPytZiH25/r+ESzDesR/nA7yyMllZxCJ5mnDrRQBQHtcpf4CE6ZeZzSbIrlMKZNwuZ60eWudou9x6Wz0aAa8fln9j7XVVHKvhb735Dw==
Received: from BN3NAM04FT018.eop-NAM04.prod.protection.outlook.com
 (10.152.92.59) by BN3NAM04HT039.eop-NAM04.prod.protection.outlook.com
 (10.152.92.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 19:54:03 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e4e::46) by BN3NAM04FT018.mail.protection.outlook.com
 (2a01:111:e400:7e4e::162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Tue, 16 Mar 2021 19:54:03 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:AC5A2D6021EF67D4A7029BE507E82AD42D17C749EF1944D6D5161EC40DADD228;
 UpperCasedChecksum:12CAD615356BE29BA606465B744C78D3258577571E85E9892F7CC39809ED472E;
 SizeAsReceived:7387; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 19:54:03 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org
Subject: [PATCH] [RFCv3] ASoC: Add Rockchip rk817 audio CODEC support
Date: Tue, 16 Mar 2021 14:53:45 -0500
Message-ID: <SN6PR06MB53428DB202A47AE12C039742A56B9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [iv/efcbhgARRm8lRuZ9qs9Jip9+MLt/g]
X-ClientProxiedBy: SN4PR0501CA0150.namprd05.prod.outlook.com
 (2603:10b6:803:2c::28) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210316195345.21690-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0150.namprd05.prod.outlook.com (2603:10b6:803:2c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.14 via Frontend
 Transport; Tue, 16 Mar 2021 19:54:02 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2b6faca5-fb3c-4a57-3f21-08d8e8b53fc0
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?EshqxzMeuoTfMmMJVMjDGxxmu/YeTxBLuIu9dDwAfmikBRCio/pRu1ho5AWS?=
 =?us-ascii?Q?eDW0rAEoDpQATR1xlJujN0wK3i9z/4iq0f5xAdDOcJd2ggppa3zTIpZeP9VB?=
 =?us-ascii?Q?TeOnTRuUu7DM9/CwRs+cEgVww40UbsTwiAWt6d2wsXhwLc6jZ+iMf2Xef4xE?=
 =?us-ascii?Q?wTt+1ajGK8zWN12EnQ1LIvBQtsmv2q3EiP3B9WxJTYZUMc3q09fyDe8qZRrx?=
 =?us-ascii?Q?DPQOgJXP/D90qDozXC4JUkLP+NDDaBvHtATsE2vl5ZTTH3yTcC9dl690IkFP?=
 =?us-ascii?Q?8HNBW6jr8wB+6tFoT09NF9cDehlSKl0iqs+oVhjx0fj74qvu8ewqfMtbdvz4?=
 =?us-ascii?Q?DFPPQ2GEGqOSaCxD1j1kFakK1QCGoN2ljcYylj7djrswDaKDGDaRSB039Gmr?=
 =?us-ascii?Q?7+68Lox0auexjZ57vcNCOY/te4yB/qEsmVRveNGKjnz5vgaEpYDCBd4dUQRE?=
 =?us-ascii?Q?YYfVEvksU4PwxA7Q7GCuKukbXZvevBcPkNOKjaLMDKvSLwoHKokchcbDvX2g?=
 =?us-ascii?Q?vCu0BXoNe1pAzpHTFNmxQDzW7xzwirhX+X6hw2zcJ8auChTEfkEzFh8ibSWz?=
 =?us-ascii?Q?rLFqSlA6vW914n82keeytYviKgnLwInK/063SnxDIJt7CDep+CfZYAKZ7zXP?=
 =?us-ascii?Q?0H+eLTR0BA1u7Z2UjNAFMRKTSDG8QqAt53WyOd3GMsDUEOZ7gbEXXS1N4K86?=
 =?us-ascii?Q?yC39duA9Fv/YD2v0Y8u81ciztLcKeQ7IvbWaWE0A9rKhJ8PO/BigBYsKpPRx?=
 =?us-ascii?Q?fudcCUnjlOzxBRNAI1/a8OfR+GV6VLNqkGRIdH+nrZGVFFWxQWjLUozDJvFX?=
 =?us-ascii?Q?Mtggu29zKYmUIlBr/5TmzNRhGu0uyUB4UbMQu/E30ZCBdsgURoFXUofstuCP?=
 =?us-ascii?Q?ssTA/fEL7cZT1OzPeLoIrc4XHoRWC4E2DWLgzGmDMK7TG6AW08nkKRP4v069?=
 =?us-ascii?Q?w5LzNDw2Vw5NWn7yxx70qC+z93NvMgUWe3Q7zlMXMx6jEi+7f9IDqIRLKDq0?=
 =?us-ascii?Q?2eeEPL03Op38IrY+NwAUQazOr6tANRcCMYNrkKzU9A/n0QYYUWgQYHVQVw?=
 =?us-ascii?Q?=3D=3D?=
X-MS-TrafficTypeDiagnostic: BN3NAM04HT039:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gSBwOBD9xZmuJyooLKFM8KKQiXRutmcav0zY1A6iNjJulxuqRb7LfilOR7Bj70lOShpquSWFOQu2gGzOkRQtQjOkgvw68nutqUTuvY3bn1SmCtEqF1JJlpMN9IUGDK7wW2dg2HxGYQDuJi6zB/ZAjsVkFN4p1jujhnJ3zjhxPFlrGm9ihEZ4GaFNa+v3EszEnipZ0/R0BiQAxi1M0ZPSi9ipCQlJNLX/iIrjzR8DZ8ANbUUBWj/KswUT/laEsFZYDEPtmpbcGR6NDkFzMM1agmy6S+CNBJ883myc89qH1E5EIc0UffJgOzSeyukBhri6KK3iRmk54HwNII5R1Frd0+aRXjwQ539XtUxInP97kKBoMTvFjozNulQ+VE90ldEdyKYPkcySpTUpUpAENdrId873wONkXNDRotD20pYSDHY=
X-MS-Exchange-AntiSpam-MessageData: FQxCAZup0oAANhv+3SH/3HdsqXFSVClNISY1Ep+vklPe3qaMV+F41UPMgdwUchxm5eWiLtlNnQ2QbE2ohPtPTnJWabD/bFbEZt7PECkr3HVK3ZWJPBBjwyPvByHaItHV91ztsPRrV7UN5WNwYcqrVQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6faca5-fb3c-4a57-3f21-08d8e8b53fc0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 19:54:03.6988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN3NAM04FT018.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT039
Cc: Chris Morgan <macromorgan@hotmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for the Rockchip rk817 audio codec integrated into the
rk817 PMIC. This is based on the sources provided by Rockchip from
their BSP kernel. Would someone advise what they think the best way
to get the widgets set up properly would be? I'm still new to this
and I don't fully understand all the macros (the alsa-project.org
documentation only gets me so far).

Changes from v2: Switched to DAPM macros to set audio path.
Eliminated unnecessary register value sets.
Removed devicetree binding since device is present for every rk817 PMIC.
Updated binding documentation to yaml format.
Separated mfd changes to separate commit.

Notes: headphone detect works now, however speaker path does not
disable automatically when headphones are used.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/sound/rockchip,rk817-codec.yaml  |  60 ++
 sound/soc/codecs/Kconfig                      |   6 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/rk817_codec.c                | 675 ++++++++++++++++++
 sound/soc/codecs/rk817_codec.h                |  93 +++
 5 files changed, 834 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
 create mode 100644 sound/soc/codecs/rk817_codec.c
 create mode 100644 sound/soc/codecs/rk817_codec.h

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
new file mode 100644
index 000000000000..6bdfb917f76e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip-rk817.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip rk817 audio codec
+
+description:
+  The rk817 codec is an I2C codec integrated with every Rockchip
+  rk817 PMIC MFD.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk817-codec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: "mclk"
+
+  mic-in-differential:
+    description: the microphone is in differential mode.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+rk817: pmic@20 {
+	compatible = "rockchip,rk817";
+	reg = <0x20>;
+	interrupt-parent = <&gpio0>;
+	interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmic_int>;
+
+	........
+
+	rk817_codec: codec {
+			#sound-dai-cells = <0>;
+			compatible = "rockchip,rk817-codec";
+			clocks = <&cru SCLK_I2S_8CH_OUT>;
+			clock-names = "mclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s_8ch_mclk>;
+			mic-in-differential;
+			status = "okay";
+	};
+
+	........
+
+};
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e4cf14e66a51..d835145ad65e 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -155,6 +155,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_PCM512x_I2C
 	imply SND_SOC_PCM512x_SPI
 	imply SND_SOC_RK3328
+	imply SND_SOC_RK817
 	imply SND_SOC_RT274
 	imply SND_SOC_RT286
 	imply SND_SOC_RT298
@@ -1059,6 +1060,11 @@ config SND_SOC_RK3328
 	tristate "Rockchip RK3328 audio CODEC"
 	select REGMAP_MMIO
 
+config SND_SOC_RK817
+	tristate "Rockchip RK817 audio CODEC"
+	depends on MFD_RK808
+	select REGMAP_I2C
+
 config SND_SOC_RL6231
 	tristate
 	default y if SND_SOC_RT5514=y
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 81357dc62ea0..4e5e9b28775c 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -165,6 +165,7 @@ snd-soc-pcm512x-objs := pcm512x.o
 snd-soc-pcm512x-i2c-objs := pcm512x-i2c.o
 snd-soc-pcm512x-spi-objs := pcm512x-spi.o
 snd-soc-rk3328-objs := rk3328_codec.o
+snd-soc-rk817-objs := rk817_codec.o
 snd-soc-rl6231-objs := rl6231.o
 snd-soc-rl6347a-objs := rl6347a.o
 snd-soc-rt1011-objs := rt1011.o
@@ -479,6 +480,7 @@ obj-$(CONFIG_SND_SOC_PCM512x)	+= snd-soc-pcm512x.o
 obj-$(CONFIG_SND_SOC_PCM512x_I2C)	+= snd-soc-pcm512x-i2c.o
 obj-$(CONFIG_SND_SOC_PCM512x_SPI)	+= snd-soc-pcm512x-spi.o
 obj-$(CONFIG_SND_SOC_RK3328)	+= snd-soc-rk3328.o
+obj-$(CONFIG_SND_SOC_RK817)	+= snd-soc-rk817.o
 obj-$(CONFIG_SND_SOC_RL6231)	+= snd-soc-rl6231.o
 obj-$(CONFIG_SND_SOC_RL6347A)	+= snd-soc-rl6347a.o
 obj-$(CONFIG_SND_SOC_RT1011)	+= snd-soc-rt1011.o
diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
new file mode 100644
index 000000000000..469b013e1e63
--- /dev/null
+++ b/sound/soc/codecs/rk817_codec.c
@@ -0,0 +1,673 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// rk817 ALSA SoC Audio driver
+//
+// Copyright (c) 2018, Fuzhou Rockchip Electronics Co., Ltd All rights reserved.
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/mfd/rk808.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include "rk817_codec.h"
+
+struct rk817_codec_priv {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	struct rk808 *rk817;
+	struct clk *mclk;
+	unsigned int stereo_sysclk;
+	bool mic_in_differential;
+};
+
+static const struct reg_default rk817_reg_defaults[] = {
+	{ RK817_CODEC_DTOP_VUCTL, 0x03 },
+	{ RK817_CODEC_DTOP_VUCTIME, 0x00 },
+	{ RK817_CODEC_DTOP_LPT_SRST, 0x00 },
+	{ RK817_CODEC_DTOP_DIGEN_CLKE, 0x00 },
+	/* from vendor driver, CODEC_AREF_RTCFG0 not defined in data sheet */
+	{ RK817_CODEC_AREF_RTCFG0, 0x00 },
+	{ RK817_CODEC_AREF_RTCFG1, 0x06 },
+	{ RK817_CODEC_AADC_CFG0, 0xc8 },
+	/* from vendor driver, CODEC_AADC_CFG1 not defined in data sheet */
+	{ RK817_CODEC_AADC_CFG1, 0x00 },
+	{ RK817_CODEC_DADC_VOLL, 0x00 },
+	{ RK817_CODEC_DADC_VOLR, 0x00 },
+	{ RK817_CODEC_DADC_SR_ACL0, 0x00 },
+	{ RK817_CODEC_DADC_ALC1, 0x00 },
+	{ RK817_CODEC_DADC_ALC2, 0x00 },
+	{ RK817_CODEC_DADC_NG, 0x00 },
+	{ RK817_CODEC_DADC_HPF, 0x00 },
+	{ RK817_CODEC_DADC_RVOLL, 0xff },
+	{ RK817_CODEC_DADC_RVOLR, 0xff },
+	{ RK817_CODEC_AMIC_CFG0, 0x70 },
+	{ RK817_CODEC_AMIC_CFG1, 0x00 },
+	{ RK817_CODEC_DMIC_PGA_GAIN, 0x66 },
+	{ RK817_CODEC_DMIC_LMT1, 0x00 },
+	{ RK817_CODEC_DMIC_LMT2, 0x00 },
+	{ RK817_CODEC_DMIC_NG1, 0x00 },
+	{ RK817_CODEC_DMIC_NG2, 0x00 },
+	/* from vendor driver, CODEC_ADAC_CFG0 not defined in data sheet */
+	{ RK817_CODEC_ADAC_CFG0, 0x00 },
+	{ RK817_CODEC_ADAC_CFG1, 0x07 },
+	{ RK817_CODEC_DDAC_POPD_DACST, 0x82 },
+	{ RK817_CODEC_DDAC_VOLL, 0x00 },
+	{ RK817_CODEC_DDAC_VOLR, 0x00 },
+	{ RK817_CODEC_DDAC_SR_LMT0, 0x00 },
+	{ RK817_CODEC_DDAC_LMT1, 0x00 },
+	{ RK817_CODEC_DDAC_LMT2, 0x00 },
+	{ RK817_CODEC_DDAC_MUTE_MIXCTL, 0xa0 },
+	{ RK817_CODEC_DDAC_RVOLL, 0xff },
+	{ RK817_CODEC_DDAC_RVOLR, 0xff },
+	{ RK817_CODEC_AHP_ANTI0, 0x00 },
+	{ RK817_CODEC_AHP_ANTI1, 0x00 },
+	{ RK817_CODEC_AHP_CFG0, 0xe0 },
+	{ RK817_CODEC_AHP_CFG1, 0x1f },
+	{ RK817_CODEC_AHP_CP, 0x09 },
+	{ RK817_CODEC_ACLASSD_CFG1, 0x69 },
+	{ RK817_CODEC_ACLASSD_CFG2, 0x44 },
+	{ RK817_CODEC_APLL_CFG0, 0x04 },
+	{ RK817_CODEC_APLL_CFG1, 0x00 },
+	{ RK817_CODEC_APLL_CFG2, 0x30 },
+	{ RK817_CODEC_APLL_CFG3, 0x19 },
+	{ RK817_CODEC_APLL_CFG4, 0x65 },
+	{ RK817_CODEC_APLL_CFG5, 0x01 },
+	{ RK817_CODEC_DI2S_CKM, 0x01 },
+	{ RK817_CODEC_DI2S_RSD, 0x00 },
+	{ RK817_CODEC_DI2S_RXCR1, 0x00 },
+	{ RK817_CODEC_DI2S_RXCR2, 0x17 },
+	{ RK817_CODEC_DI2S_RXCMD_TSD, 0x00 },
+	{ RK817_CODEC_DI2S_TXCR1, 0x00 },
+	{ RK817_CODEC_DI2S_TXCR2, 0x17 },
+	{ RK817_CODEC_DI2S_TXCR3_TXCMD, 0x00 },
+};
+
+static bool rk817_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RK817_CODEC_DTOP_LPT_SRST:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rk817_codec_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RK817_CODEC_DTOP_VUCTL:
+	case RK817_CODEC_DTOP_VUCTIME:
+	case RK817_CODEC_DTOP_LPT_SRST:
+	case RK817_CODEC_DTOP_DIGEN_CLKE:
+	case RK817_CODEC_AREF_RTCFG0:
+	case RK817_CODEC_AREF_RTCFG1:
+	case RK817_CODEC_AADC_CFG0:
+	case RK817_CODEC_AADC_CFG1:
+	case RK817_CODEC_DADC_VOLL:
+	case RK817_CODEC_DADC_VOLR:
+	case RK817_CODEC_DADC_SR_ACL0:
+	case RK817_CODEC_DADC_ALC1:
+	case RK817_CODEC_DADC_ALC2:
+	case RK817_CODEC_DADC_NG:
+	case RK817_CODEC_DADC_HPF:
+	case RK817_CODEC_DADC_RVOLL:
+	case RK817_CODEC_DADC_RVOLR:
+	case RK817_CODEC_AMIC_CFG0:
+	case RK817_CODEC_AMIC_CFG1:
+	case RK817_CODEC_DMIC_PGA_GAIN:
+	case RK817_CODEC_DMIC_LMT1:
+	case RK817_CODEC_DMIC_LMT2:
+	case RK817_CODEC_DMIC_NG1:
+	case RK817_CODEC_DMIC_NG2:
+	case RK817_CODEC_ADAC_CFG0:
+	case RK817_CODEC_ADAC_CFG1:
+	case RK817_CODEC_DDAC_POPD_DACST:
+	case RK817_CODEC_DDAC_VOLL:
+	case RK817_CODEC_DDAC_VOLR:
+	case RK817_CODEC_DDAC_SR_LMT0:
+	case RK817_CODEC_DDAC_LMT1:
+	case RK817_CODEC_DDAC_LMT2:
+	case RK817_CODEC_DDAC_MUTE_MIXCTL:
+	case RK817_CODEC_DDAC_RVOLL:
+	case RK817_CODEC_DDAC_RVOLR:
+	case RK817_CODEC_AHP_ANTI0:
+	case RK817_CODEC_AHP_ANTI1:
+	case RK817_CODEC_AHP_CFG0:
+	case RK817_CODEC_AHP_CFG1:
+	case RK817_CODEC_AHP_CP:
+	case RK817_CODEC_ACLASSD_CFG1:
+	case RK817_CODEC_ACLASSD_CFG2:
+	case RK817_CODEC_APLL_CFG0:
+	case RK817_CODEC_APLL_CFG1:
+	case RK817_CODEC_APLL_CFG2:
+	case RK817_CODEC_APLL_CFG3:
+	case RK817_CODEC_APLL_CFG4:
+	case RK817_CODEC_APLL_CFG5:
+	case RK817_CODEC_DI2S_CKM:
+	case RK817_CODEC_DI2S_RSD:
+	case RK817_CODEC_DI2S_RXCR1:
+	case RK817_CODEC_DI2S_RXCR2:
+	case RK817_CODEC_DI2S_RXCMD_TSD:
+	case RK817_CODEC_DI2S_TXCR1:
+	case RK817_CODEC_DI2S_TXCR2:
+	case RK817_CODEC_DI2S_TXCR3_TXCMD:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/*
+ * This sets the codec up with the values defined in the default implementation including the APLL
+ * from the Rockchip vendor kernel. I do not know if these values are universal despite differing
+ * from the default values defined above and taken from the datasheet, or implementation specific.
+ * I don't have another implementation to compare from the Rockchip sources. Hard-coding this for
+ * now.
+ */
+
+static int rk817_init(struct snd_soc_component *component)
+{
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG1, 0x58);
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG2, 0x2d);
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG3, 0x0c);
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG4, 0xa5);
+	snd_soc_component_write(component, RK817_CODEC_DDAC_POPD_DACST, 0x02);
+	snd_soc_component_write(component, RK817_CODEC_DDAC_SR_LMT0, 0x02);
+	snd_soc_component_write(component, RK817_CODEC_DMIC_PGA_GAIN, 0x99);
+	snd_soc_component_write(component, RK817_CODEC_DADC_SR_ACL0, 0x02);
+	snd_soc_component_write(component, RK817_CODEC_DTOP_VUCTIME, 0xf4);
+	if (rk817->mic_in_differential) {
+		snd_soc_component_update_bits(component, RK817_CODEC_AMIC_CFG0, MIC_DIFF_MASK,
+					     MIC_DIFF_EN);
+	};
+	return 0;
+}
+
+/*
+ * DDAC/DADC L/R volume setting
+ * 0db~-95db,0.375db/step,for example:
+ * 0: 0dB
+ * 0x0a: -3.75dB
+ * 0x7d: -46dB
+ * 0xff: -95dB
+ */
+
+static const DECLARE_TLV_DB_MINMAX(rk817_vol_tlv, -9500, 0);
+
+static const struct snd_kcontrol_new rk817_dac_controls[] = {
+	SOC_DOUBLE_R_RANGE_TLV("Master Playback Volume", RK817_CODEC_DDAC_VOLL,
+		RK817_CODEC_DDAC_VOLR, 0, 0x00, 0xff, 1, rk817_vol_tlv),
+	SOC_DOUBLE_R_RANGE_TLV("Master Capture Volume", RK817_CODEC_DADC_VOLL,
+			      RK817_CODEC_DADC_VOLR, 0, 0x00, 0xff, 1, rk817_vol_tlv)
+};
+
+static const char *dac_mux_text[] = {
+	"HP",
+	"SPK",
+};
+
+static SOC_ENUM_SINGLE_VIRT_DECL(dac_enum, dac_mux_text);
+
+static const struct snd_kcontrol_new dac_mux =
+	SOC_DAPM_ENUM("Playback Mux", dac_enum);
+
+static const struct snd_soc_dapm_widget rk817_dapm_widgets[] = {
+
+	/* capture/playback common */
+	SND_SOC_DAPM_SUPPLY("LDO Regulator", RK817_CODEC_AREF_RTCFG1, 6, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("IBIAS Block", RK817_CODEC_AREF_RTCFG1, 2, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("VAvg Buffer", RK817_CODEC_AREF_RTCFG1, 1, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL Power", RK817_CODEC_APLL_CFG5, 0, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX1 Transfer Start", RK817_CODEC_DI2S_RXCMD_TSD, 5, 0, NULL, 0),
+
+	/* capture path common */
+	SND_SOC_DAPM_SUPPLY("ADC Clock", RK817_CODEC_DTOP_DIGEN_CLKE, 7, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX Clock", RK817_CODEC_DTOP_DIGEN_CLKE, 6, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC Channel Enable", RK817_CODEC_DTOP_DIGEN_CLKE, 5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX Channel Enable", RK817_CODEC_DTOP_DIGEN_CLKE, 4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MIC Power On", RK817_CODEC_AMIC_CFG0, 6, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX3 Transfer Start", RK817_CODEC_DI2S_TXCR3_TXCMD, 7, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX3 Right Justified", RK817_CODEC_DI2S_TXCR3_TXCMD, 3, 0, NULL, 0),
+
+	/* capture path L */
+	SND_SOC_DAPM_ADC("ADC L", "Capture", RK817_CODEC_AADC_CFG0, 7, 1),
+	SND_SOC_DAPM_SUPPLY("PGA L Power On", RK817_CODEC_AMIC_CFG0, 5, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Mic Boost L1", RK817_CODEC_AMIC_CFG0, 3, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Mic Boost L2", RK817_CODEC_AMIC_CFG0, 2, 0, NULL, 0),
+
+	/* capture path R */
+	SND_SOC_DAPM_ADC("ADC R", "Capture", RK817_CODEC_AADC_CFG0, 6, 1),
+	SND_SOC_DAPM_SUPPLY("PGA R Power On", RK817_CODEC_AMIC_CFG0, 4, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Mic Boost R1", RK817_CODEC_AMIC_CFG0, 3, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Mic Boost R2", RK817_CODEC_AMIC_CFG0, 3, 0, NULL, 0),
+
+	/* playback path common */
+	SND_SOC_DAPM_SUPPLY("DAC Clock", RK817_CODEC_DTOP_DIGEN_CLKE, 3, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S RX Clock", RK817_CODEC_DTOP_DIGEN_CLKE, 2, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC Channel Enable", RK817_CODEC_DTOP_DIGEN_CLKE, 1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S RX Channel Enable", RK817_CODEC_DTOP_DIGEN_CLKE, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC Bias", RK817_CODEC_ADAC_CFG1, 3, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC Mute Off", RK817_CODEC_DDAC_MUTE_MIXCTL, 0, 1, NULL, 0),
+
+	/* playback path speaker */
+	SND_SOC_DAPM_SUPPLY("Class D Mode", RK817_CODEC_DDAC_MUTE_MIXCTL, 4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("High Pass Filter", RK817_CODEC_DDAC_MUTE_MIXCTL, 7, 0, NULL, 0),
+	SND_SOC_DAPM_DAC("SPK DAC", "Playback", RK817_CODEC_ADAC_CFG1, 2, 1),
+	SND_SOC_DAPM_SUPPLY("Enable Class D", RK817_CODEC_ACLASSD_CFG1, 7, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Disable Class D Mute Ramp", RK817_CODEC_ACLASSD_CFG1, 6, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D Mute Rate 1", RK817_CODEC_ACLASSD_CFG1, 3, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D Mute Rate 2", RK817_CODEC_ACLASSD_CFG1, 2, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D OCPP 2", RK817_CODEC_ACLASSD_CFG2, 5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D OCPP 3", RK817_CODEC_ACLASSD_CFG2, 4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D OCPN 2", RK817_CODEC_ACLASSD_CFG2, 1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D OCPN 3", RK817_CODEC_ACLASSD_CFG2, 0, 0, NULL, 0),
+
+	/* playback path headphones */
+	SND_SOC_DAPM_SUPPLY("Headphone Charge Pump", RK817_CODEC_AHP_CP, 4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Headphone CP Discharge LDO", RK817_CODEC_AHP_CP, 3, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Headphone OStage", RK817_CODEC_AHP_CFG0, 6, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Headphone Pre Amp", RK817_CODEC_AHP_CFG0, 5, 1, NULL, 0),
+	SND_SOC_DAPM_DAC("DAC L", "Playback", RK817_CODEC_ADAC_CFG1, 1, 1),
+	SND_SOC_DAPM_DAC("DAC R", "Playback", RK817_CODEC_ADAC_CFG1, 0, 1),
+
+	/* Mux for input/output path selection */
+	SND_SOC_DAPM_MUX("Playback Mux", SND_SOC_NOPM, 1, 0, &dac_mux),
+
+	/* Pins for Simple Card Bindings */
+	SND_SOC_DAPM_INPUT("MICL"),
+	SND_SOC_DAPM_INPUT("MICR"),
+	SND_SOC_DAPM_OUTPUT("HPOL"),
+	SND_SOC_DAPM_OUTPUT("HPOR"),
+	SND_SOC_DAPM_OUTPUT("SPKO"),
+};
+
+static const struct snd_soc_dapm_route rk817_dapm_routes[] = {
+
+	/* capture path */
+	/* left mic */
+	{"ADC L", NULL, "LDO Regulator"},
+	{"ADC L", NULL, "IBIAS Block"},
+	{"ADC L", NULL, "VAvg Buffer"},
+	{"ADC L", NULL, "PLL Power"},
+	{"ADC L", NULL, "ADC Clock"},
+	{"ADC L", NULL, "I2S TX Clock"},
+	{"ADC L", NULL, "ADC Channel Enable"},
+	{"ADC L", NULL, "I2S TX Channel Enable"},
+	{"ADC L", NULL, "I2S TX1 Transfer Start"},
+	{"MICL", NULL, "MIC Power On"},
+	{"MICL", NULL, "PGA L Power On"},
+	{"MICL", NULL, "Mic Boost L1"},
+	{"MICL", NULL, "Mic Boost L2"},
+	{"MICL", NULL, "I2S TX3 Transfer Start"},
+	{"MICL", NULL, "I2S TX3 Right Justified"},
+	{"ADC L", NULL, "MICL"},
+
+	/* right mic */
+	{"ADC R", NULL, "LDO Regulator"},
+	{"ADC R", NULL, "IBIAS Block"},
+	{"ADC R", NULL, "VAvg Buffer"},
+	{"ADC R", NULL, "PLL Power"},
+	{"ADC R", NULL, "ADC Clock"},
+	{"ADC R", NULL, "I2S TX Clock"},
+	{"ADC R", NULL, "ADC Channel Enable"},
+	{"ADC R", NULL, "I2S TX Channel Enable"},
+	{"ADC R", NULL, "I2S TX1 Transfer Start"},
+	{"MICR", NULL, "MIC Power On"},
+	{"MICR", NULL, "PGA R Power On"},
+	{"MICR", NULL, "Mic Boost R1"},
+	{"MICR", NULL, "Mic Boost R2"},
+	{"MICR", NULL, "I2S TX3 Transfer Start"},
+	{"MICR", NULL, "I2S TX3 Right Justified"},
+	{"ADC R", NULL, "MICR"},
+
+	/* playback path */
+	/* speaker path */
+	{"SPK DAC", NULL, "LDO Regulator"},
+	{"SPK DAC", NULL, "IBIAS Block"},
+	{"SPK DAC", NULL, "VAvg Buffer"},
+	{"SPK DAC", NULL, "PLL Power"},
+	{"SPK DAC", NULL, "I2S TX1 Transfer Start"},
+	{"SPK DAC", NULL, "DAC Clock"},
+	{"SPK DAC", NULL, "I2S RX Clock"},
+	{"SPK DAC", NULL, "DAC Channel Enable"},
+	{"SPK DAC", NULL, "I2S RX Channel Enable"},
+	{"SPK DAC", NULL, "Class D Mode"},
+	{"SPK DAC", NULL, "DAC Bias"},
+	{"SPK DAC", NULL, "DAC Mute Off"},
+	{"SPK DAC", NULL, "Enable Class D"},
+	{"SPK DAC", NULL, "Disable Class D Mute Ramp"},
+	{"SPK DAC", NULL, "Class D Mute Rate 1"},
+	{"SPK DAC", NULL, "Class D Mute Rate 2"},
+	{"SPK DAC", NULL, "Class D OCPP 2"},
+	{"SPK DAC", NULL, "Class D OCPP 3"},
+	{"SPK DAC", NULL, "Class D OCPN 2"},
+	{"SPK DAC", NULL, "Class D OCPN 3"},
+	{"SPK DAC", NULL, "High Pass Filter"},
+
+	/* headphone path L */
+	{"DAC L", NULL, "LDO Regulator"},
+	{"DAC L", NULL, "IBIAS Block"},
+	{"DAC L", NULL, "VAvg Buffer"},
+	{"DAC L", NULL, "PLL Power"},
+	{"DAC L", NULL, "I2S TX1 Transfer Start"},
+	{"DAC L", NULL, "DAC Clock"},
+	{"DAC L", NULL, "I2S RX Clock"},
+	{"DAC L", NULL, "DAC Channel Enable"},
+	{"DAC L", NULL, "I2S RX Channel Enable"},
+	{"DAC L", NULL, "DAC Bias"},
+	{"DAC L", NULL, "DAC Mute Off"},
+	{"DAC L", NULL, "Headphone Charge Pump"},
+	{"DAC L", NULL, "Headphone CP Discharge LDO"},
+	{"DAC L", NULL, "Headphone OStage"},
+	{"DAC L", NULL, "Headphone Pre Amp"},
+
+	/* headphone path R */
+	{"DAC R", NULL, "LDO Regulator"},
+	{"DAC R", NULL, "IBIAS Block"},
+	{"DAC R", NULL, "VAvg Buffer"},
+	{"DAC R", NULL, "PLL Power"},
+	{"DAC R", NULL, "I2S TX1 Transfer Start"},
+	{"DAC R", NULL, "DAC Clock"},
+	{"DAC R", NULL, "I2S RX Clock"},
+	{"DAC R", NULL, "DAC Channel Enable"},
+	{"DAC R", NULL, "I2S RX Channel Enable"},
+	{"DAC R", NULL, "DAC Bias"},
+	{"DAC R", NULL, "DAC Mute Off"},
+	{"DAC R", NULL, "Headphone Charge Pump"},
+	{"DAC R", NULL, "Headphone CP Discharge LDO"},
+	{"DAC R", NULL, "Headphone OStage"},
+	{"DAC R", NULL, "Headphone Pre Amp"},
+
+	/* mux path for output selection */
+	{"Playback Mux", "HP", "DAC L"},
+	{"Playback Mux", "HP", "DAC R"},
+	{"Playback Mux", "SPK", "SPK DAC"},
+	{"SPKO", NULL, "Playback Mux"},
+	{"HPOL", NULL, "Playback Mux"},
+	{"HPOR", NULL, "Playback Mux"},
+};
+
+static int rk817_set_dai_sysclk(struct snd_soc_dai *codec_dai,
+				int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	rk817->stereo_sysclk = freq;
+
+	return 0;
+}
+
+static int rk817_set_dai_fmt(struct snd_soc_dai *codec_dai,
+			     unsigned int fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	unsigned int i2s_mst = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		i2s_mst |= RK817_I2S_MODE_SLV;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFM:
+		i2s_mst |= RK817_I2S_MODE_MST;
+		break;
+	default:
+		dev_err(component->dev, "%s : set master mask failed!\n", __func__);
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, RK817_CODEC_DI2S_CKM,
+				      RK817_I2S_MODE_MASK, i2s_mst);
+
+	return 0;
+}
+
+static int rk817_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		snd_soc_component_write(component, RK817_CODEC_DI2S_RXCR2,
+					VDW_RX_16BITS);
+		snd_soc_component_write(component, RK817_CODEC_DI2S_TXCR2,
+					VDW_TX_16BITS);
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_S32_LE:
+		snd_soc_component_write(component, RK817_CODEC_DI2S_RXCR2,
+					VDW_RX_24BITS);
+		snd_soc_component_write(component, RK817_CODEC_DI2S_TXCR2,
+					VDW_TX_24BITS);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rk817_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+
+	if (mute)
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DDAC_MUTE_MIXCTL,
+					      DACMT_MASK, DACMT_ENABLE);
+	else
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DDAC_MUTE_MIXCTL,
+					      DACMT_MASK, DACMT_DISABLE);
+
+	return 0;
+}
+
+#define RK817_PLAYBACK_RATES (SNDRV_PCM_RATE_8000 |\
+			      SNDRV_PCM_RATE_16000 |	\
+			      SNDRV_PCM_RATE_32000 |	\
+			      SNDRV_PCM_RATE_44100 |	\
+			      SNDRV_PCM_RATE_48000 |	\
+			      SNDRV_PCM_RATE_96000)
+
+#define RK817_CAPTURE_RATES (SNDRV_PCM_RATE_8000 |\
+			      SNDRV_PCM_RATE_16000 |	\
+			      SNDRV_PCM_RATE_32000 |	\
+			      SNDRV_PCM_RATE_44100 |	\
+			      SNDRV_PCM_RATE_48000 |	\
+			      SNDRV_PCM_RATE_96000)
+
+#define RK817_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			SNDRV_PCM_FMTBIT_S20_3LE |\
+			SNDRV_PCM_FMTBIT_S24_LE |\
+			SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_ops rk817_dai_ops = {
+	.hw_params	= rk817_hw_params,
+	.set_fmt	= rk817_set_dai_fmt,
+	.set_sysclk	= rk817_set_dai_sysclk,
+	.mute_stream	= rk817_digital_mute,
+	.no_capture_mute	= 1,
+};
+
+static struct snd_soc_dai_driver rk817_dai[] = {
+	{
+		.name = "rk817-hifi",
+		.playback = {
+			.stream_name = "Playback",
+			.channels_min = 2,
+			.channels_max = 8,
+			.rates = RK817_PLAYBACK_RATES,
+			.formats = RK817_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RK817_CAPTURE_RATES,
+			.formats = RK817_FORMATS,
+		},
+		.ops = &rk817_dai_ops,
+	},
+};
+
+static int rk817_probe(struct snd_soc_component *component)
+{
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_init_regmap(component, rk817->regmap);
+	rk817->component = component;
+
+	clk_prepare_enable(rk817->mclk);
+
+	snd_soc_component_write(component, RK817_CODEC_DTOP_LPT_SRST, 0x40);
+	rk817_init(component);
+
+	return 0;
+}
+
+static void rk817_remove(struct snd_soc_component *component)
+{
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_exit_regmap(component);
+	clk_disable_unprepare(rk817->mclk);
+	mdelay(10);
+
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
+	.probe = rk817_probe,
+	.remove = rk817_remove,
+	.idle_bias_on = 1,
+	.use_pmdown_time = 1,
+	.endianness = 1,
+	.non_legacy_dai_naming = 1,
+	.controls = rk817_dac_controls,
+	.num_controls = ARRAY_SIZE(rk817_dac_controls),
+	.dapm_routes = rk817_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(rk817_dapm_routes),
+	.dapm_widgets = rk817_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rk817_dapm_widgets),
+};
+
+static int rk817_codec_parse_dt_property(struct device *dev,
+					 struct rk817_codec_priv *rk817)
+{
+	struct device_node *node = dev->parent->of_node;
+
+	if (!node) {
+		dev_err(dev, "%s() dev->parent->of_node is NULL\n",
+			__func__);
+		return -ENODEV;
+	}
+
+	node = of_get_child_by_name(dev->parent->of_node, "codec");
+	if (!node) {
+		dev_err(dev, "%s() Can not get child: codec\n",
+			__func__);
+		return -ENODEV;
+	}
+
+	rk817->mic_in_differential =
+			of_property_read_bool(node, "mic-in-differential");
+
+	return 0;
+}
+
+static const struct regmap_config rk817_codec_regmap_config = {
+	.name = "rk817-codec",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_stride = 1,
+	.max_register = 0x4f,
+	.cache_type = REGCACHE_NONE,
+	.volatile_reg = rk817_volatile_register,
+	.writeable_reg = rk817_codec_register,
+	.readable_reg = rk817_codec_register,
+	.reg_defaults = rk817_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rk817_reg_defaults),
+};
+
+static int rk817_platform_probe(struct platform_device *pdev)
+{
+	struct rk808 *rk817 = dev_get_drvdata(pdev->dev.parent);
+	struct rk817_codec_priv *rk817_codec_data;
+	int ret;
+
+	if (!rk817) {
+		dev_err(&pdev->dev, "%s : rk817 is NULL\n", __func__);
+		return -EINVAL;
+	}
+
+	rk817_codec_data = devm_kzalloc(&pdev->dev,
+					sizeof(struct rk817_codec_priv),
+					GFP_KERNEL);
+	if (!rk817_codec_data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rk817_codec_data);
+
+	ret = rk817_codec_parse_dt_property(&pdev->dev, rk817_codec_data);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "%s() parse device tree property error %d\n",
+			__func__, ret);
+		goto err_;
+	}
+
+	rk817_codec_data->regmap = devm_regmap_init_i2c(rk817->i2c,
+					    &rk817_codec_regmap_config);
+	if (IS_ERR(rk817_codec_data->regmap)) {
+		ret = PTR_ERR(rk817_codec_data->regmap);
+		dev_err(&pdev->dev, "failed to allocate register map: %d\n",
+			ret);
+		goto err_;
+	}
+
+	rk817_codec_data->mclk = devm_clk_get(&pdev->dev, "mclk");
+	if (IS_ERR(rk817_codec_data->mclk)) {
+		dev_err(&pdev->dev, "Unable to get mclk\n");
+		ret = -ENXIO;
+		goto err_;
+	}
+
+	clk_prepare_enable(rk817_codec_data->mclk);
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_rk817,
+					      rk817_dai, ARRAY_SIZE(rk817_dai));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "%s() register codec error %d\n",
+			__func__, ret);
+		goto err_;
+	}
+
+	return 0;
+err_:
+
+	return ret;
+}
+
+MODULE_DEVICE_TABLE(of, rk817_codec_dt_ids);
+
+static struct platform_driver rk817_codec_driver = {
+	.driver = {
+		   .name = "rk817-codec",
+		   },
+	.probe = rk817_platform_probe,
+};
+
+module_platform_driver(rk817_codec_driver);
+
+MODULE_DESCRIPTION("ASoC RK817 codec driver");
+MODULE_AUTHOR("binyuan <kevan.lan@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rk817_codec.h b/sound/soc/codecs/rk817_codec.h
new file mode 100644
index 000000000000..831c80972f92
--- /dev/null
+++ b/sound/soc/codecs/rk817_codec.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * rk817 ALSA SoC Audio driver
+ *
+ */ Copyright (c) 2018, Fuzhou Rockchip Electronics Co., Ltd All rights reserved.
+
+#ifndef __RK817_CODEC_H__
+#define __RK817_CODEC_H__
+
+/* codec register */
+#define RK817_CODEC_BASE		0x0000
+
+#define RK817_CODEC_DTOP_VUCTL		(RK817_CODEC_BASE + 0x12)
+#define RK817_CODEC_DTOP_VUCTIME	(RK817_CODEC_BASE + 0x13)
+#define RK817_CODEC_DTOP_LPT_SRST	(RK817_CODEC_BASE + 0x14)
+#define RK817_CODEC_DTOP_DIGEN_CLKE	(RK817_CODEC_BASE + 0x15)
+#define RK817_CODEC_AREF_RTCFG0		(RK817_CODEC_BASE + 0x16)
+#define RK817_CODEC_AREF_RTCFG1		(RK817_CODEC_BASE + 0x17)
+#define RK817_CODEC_AADC_CFG0		(RK817_CODEC_BASE + 0x18)
+#define RK817_CODEC_AADC_CFG1		(RK817_CODEC_BASE + 0x19)
+#define RK817_CODEC_DADC_VOLL		(RK817_CODEC_BASE + 0x1a)
+#define RK817_CODEC_DADC_VOLR		(RK817_CODEC_BASE + 0x1b)
+#define RK817_CODEC_DADC_SR_ACL0	(RK817_CODEC_BASE + 0x1e)
+#define RK817_CODEC_DADC_ALC1		(RK817_CODEC_BASE + 0x1f)
+#define RK817_CODEC_DADC_ALC2		(RK817_CODEC_BASE + 0x20)
+#define RK817_CODEC_DADC_NG		(RK817_CODEC_BASE + 0x21)
+#define RK817_CODEC_DADC_HPF		(RK817_CODEC_BASE + 0x22)
+#define RK817_CODEC_DADC_RVOLL		(RK817_CODEC_BASE + 0x23)
+#define RK817_CODEC_DADC_RVOLR		(RK817_CODEC_BASE + 0x24)
+#define RK817_CODEC_AMIC_CFG0		(RK817_CODEC_BASE + 0x27)
+#define RK817_CODEC_AMIC_CFG1		(RK817_CODEC_BASE + 0x28)
+#define RK817_CODEC_DMIC_PGA_GAIN	(RK817_CODEC_BASE + 0x29)
+#define RK817_CODEC_DMIC_LMT1		(RK817_CODEC_BASE + 0x2a)
+#define RK817_CODEC_DMIC_LMT2		(RK817_CODEC_BASE + 0x2b)
+#define RK817_CODEC_DMIC_NG1		(RK817_CODEC_BASE + 0x2c)
+#define RK817_CODEC_DMIC_NG2		(RK817_CODEC_BASE + 0x2d)
+#define RK817_CODEC_ADAC_CFG0		(RK817_CODEC_BASE + 0x2e)
+#define RK817_CODEC_ADAC_CFG1		(RK817_CODEC_BASE + 0x2f)
+#define RK817_CODEC_DDAC_POPD_DACST	(RK817_CODEC_BASE + 0x30)
+#define RK817_CODEC_DDAC_VOLL		(RK817_CODEC_BASE + 0x31)
+#define RK817_CODEC_DDAC_VOLR		(RK817_CODEC_BASE + 0x32)
+#define RK817_CODEC_DDAC_SR_LMT0	(RK817_CODEC_BASE + 0x35)
+#define RK817_CODEC_DDAC_LMT1		(RK817_CODEC_BASE + 0x36)
+#define RK817_CODEC_DDAC_LMT2		(RK817_CODEC_BASE + 0x37)
+#define RK817_CODEC_DDAC_MUTE_MIXCTL	(RK817_CODEC_BASE + 0x38)
+#define RK817_CODEC_DDAC_RVOLL		(RK817_CODEC_BASE + 0x39)
+#define RK817_CODEC_DDAC_RVOLR		(RK817_CODEC_BASE + 0x3a)
+#define RK817_CODEC_AHP_ANTI0		(RK817_CODEC_BASE + 0x3b)
+#define RK817_CODEC_AHP_ANTI1		(RK817_CODEC_BASE + 0x3c)
+#define RK817_CODEC_AHP_CFG0		(RK817_CODEC_BASE + 0x3d)
+#define RK817_CODEC_AHP_CFG1		(RK817_CODEC_BASE + 0x3e)
+#define RK817_CODEC_AHP_CP		(RK817_CODEC_BASE + 0x3f)
+#define RK817_CODEC_ACLASSD_CFG1	(RK817_CODEC_BASE + 0x40)
+#define RK817_CODEC_ACLASSD_CFG2	(RK817_CODEC_BASE + 0x41)
+#define RK817_CODEC_APLL_CFG0		(RK817_CODEC_BASE + 0x42)
+#define RK817_CODEC_APLL_CFG1		(RK817_CODEC_BASE + 0x43)
+#define RK817_CODEC_APLL_CFG2		(RK817_CODEC_BASE + 0x44)
+#define RK817_CODEC_APLL_CFG3		(RK817_CODEC_BASE + 0x45)
+#define RK817_CODEC_APLL_CFG4		(RK817_CODEC_BASE + 0x46)
+#define RK817_CODEC_APLL_CFG5		(RK817_CODEC_BASE + 0x47)
+#define RK817_CODEC_DI2S_CKM		(RK817_CODEC_BASE + 0x48)
+#define RK817_CODEC_DI2S_RSD		(RK817_CODEC_BASE + 0x49)
+#define RK817_CODEC_DI2S_RXCR1		(RK817_CODEC_BASE + 0x4a)
+#define RK817_CODEC_DI2S_RXCR2		(RK817_CODEC_BASE + 0x4b)
+#define RK817_CODEC_DI2S_RXCMD_TSD	(RK817_CODEC_BASE + 0x4c)
+#define RK817_CODEC_DI2S_TXCR1		(RK817_CODEC_BASE + 0x4d)
+#define RK817_CODEC_DI2S_TXCR2		(RK817_CODEC_BASE + 0x4e)
+#define RK817_CODEC_DI2S_TXCR3_TXCMD	(RK817_CODEC_BASE + 0x4f)
+
+/* RK817_CODEC_DI2S_CKM */
+#define RK817_I2S_MODE_MASK		(0x1 << 0)
+#define RK817_I2S_MODE_MST		(0x1 << 0)
+#define RK817_I2S_MODE_SLV		(0x0 << 0)
+
+/* RK817_CODEC_DDAC_MUTE_MIXCTL */
+#define DACMT_MASK			(0x1 << 0)
+#define DACMT_ENABLE			(0x1 << 0)
+#define DACMT_DISABLE			(0x0 << 0)
+
+/* RK817_CODEC_DI2S_RXCR2 */
+#define VDW_RX_24BITS			(0x17)
+#define VDW_RX_16BITS			(0x0f)
+
+/* RK817_CODEC_DI2S_TXCR2 */
+#define VDW_TX_24BITS			(0x17)
+#define VDW_TX_16BITS			(0x0f)
+
+/* RK817_CODEC_AMIC_CFG0 */
+#define MIC_DIFF_MASK			(0x1 << 7)
+#define MIC_DIFF_DIS			(0x0 << 7)
+#define MIC_DIFF_EN			(0x1 << 7)
+
+#endif /* __RK817_CODEC_H__ */
-- 
2.25.1

