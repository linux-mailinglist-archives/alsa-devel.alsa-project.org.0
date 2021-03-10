Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 998643367FB
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 00:46:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1308416FD;
	Thu, 11 Mar 2021 00:45:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1308416FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615419988;
	bh=G/bFx8EtsmR+F+VE5ZjCyu52QdxRwnbaqP0H72ixtNU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ej6kTS3RuaGSWy/+Nu2r4FVVnNn2G7UM1mE8RJDZq93i2cxPvO+er9tunnGfQHGPo
	 +00lgz/2Yteo6CIt+qu3nHmHZeUuRZCPGvMNM5aiT73lcmG+st3lwa/aC5OFUKT6OH
	 4AM6VVorqJOstLo3eMU+jwDVGd7zGrNBsCxh4HRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9227CF8012F;
	Thu, 11 Mar 2021 00:44:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 879B3F801D8; Thu, 11 Mar 2021 00:44:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2081c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::81c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08AE7F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 00:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08AE7F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="LYU8bixs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSod1XFHG7NEtNuNWb0F02VgEm/0EGl91JivCTgwH1C/QUTG3R0IwN4oMjZ3vbUvO50k+0IXzthE1a7IeSkRmThve9/mTcAtQQYi2mjiiZz513bdsxA9CavpJ5GukY8CaS9jGeQVBS1rsz7lz5ci/oom3Y8l+crvRAlNnswGqt8JaVxEjf0zFrN8kfkcbvL4JMh8m42PLr9qHTIDzLNwu2U/vhyvA9UPR9WYcbG7KendTbNwkbW5G6JYo+sT+m9yyEuv6it3TZSuXsviI923DGNvwIrxl6g8mOgwGgQsE25R+GbHsxYUNk/qVVZcEpHqGOj2F5Iu2jEsPpYGMr4CFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYJ0VfTvGTQ3cxZ2gtrEpJx7c9R1RugQbJaCcUOu0To=;
 b=YG0SNtLc04fBRKRH58yB4snmMUGuemwTIUy9a1CZ7uYzb6c1X+MKxtGak3gnG9qQU91/gAwn/IkxMAlCbZhDdp1/UsMToA69PRs4ZlPdqpwJm2VhPr3XnnSUE+WR9t9uOac21XjRHhz1SgkP5WsPOcxvfQIFGD20Cgmn7QjIaSLhmvJR2+3k3NmwOTXBhuMNbv2RGS5nlyTrFBZk+dfHh8al0O2M28fNhoUnjkJCXmQ/vp4enxIc0Kya3Nu7JnA4AQq6QIeSc16FhIQCY3LB/yRBtQWsI4u3qvfklHQ1eV3lD0itViCeQu8jZNARwPpJ1E7ItMxN+9VQv4poUePKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYJ0VfTvGTQ3cxZ2gtrEpJx7c9R1RugQbJaCcUOu0To=;
 b=LYU8bixsYeh5k6QxLlUijDTOtT+kMy/nGKR3VJPOd8vSsbF018qC2cUWMPMRizSquUzrfE8dLVQ8TbzyDqw1+BYYFv37FdA9XV3xuMkHsu/AA1PT44/dHRwsVn102CRRdxv8lYVesVuzcajxUhW4BqyjEKDfwCH02SlKSoWBDDwSYAudOdfvCzZHLLRSxtNRzxAkCFr+Vn5edXIfPGHkSA+3FLjlbsS6knokiAag6VjrPkeIFpVpqCFuHBNS1uE45tkV2DEaCFAELEGxzAgkz7ICgztooyQpooPHxoa139vJcSuIAii/3yJipvttbwPBV+YqJvJYwG400u/y+uQNvw==
Received: from MW2NAM10FT055.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e87::4e) by
 MW2NAM10HT127.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e87::368)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.25; Wed, 10 Mar
 2021 23:44:26 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e87::4b) by MW2NAM10FT055.mail.protection.outlook.com
 (2a01:111:e400:7e87::341) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Wed, 10 Mar 2021 23:44:26 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:7AB1910815D32E33E945A9E0B9905039CE04C8A453904252F9F276D65C372C8B;
 UpperCasedChecksum:791D0E66B4BC98A1A68F7902E7742DCBC592C4D9F132CFF34795D9CB28FE3F68;
 SizeAsReceived:7378; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 23:44:26 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org
Subject: [RFCv2] ASoC: Add Rockchip rk817 audio CODEC support
Date: Wed, 10 Mar 2021 17:44:16 -0600
Message-ID: <SN6PR06MB53425EF2BAED66E61C22EA9EA5919@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [V8mYFB2+F9EjkEoIS7cUzoKAfhFxU8i/]
X-ClientProxiedBy: SN4PR0501CA0039.namprd05.prod.outlook.com
 (2603:10b6:803:41::16) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210310234416.5893-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0039.namprd05.prod.outlook.com (2603:10b6:803:41::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.16 via Frontend
 Transport; Wed, 10 Mar 2021 23:44:25 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4b39005e-9c8b-4a61-a1d2-08d8e41e7009
X-MS-Exchange-SLBlob-MailProps: 7MJMDUNTCtx7XwBk+gZlyKjNAwrXBaWbDSGhPLxkztNbOwK7eCGl2vVS4m5V4j+JB8Nv4d39LP2wfj4wlp/iWpJpLN8LrGcj5hdbObj2LTBB1j1t6L4NPU8Y+OSDNilm/m5QBJjRK+lDPjlavDdCFNdyMT+3ilMKo5uKihkRI62gumJumSBct9XTZ64Qf8bGExx7Zk1qsyL+LAGnzt+NPO4D2IATdqJSN+n673kZunPqs7qElXiyiB2owyJZbq7uSRuFF9bySeCVMnvXxN6V19SyiEVXPrmUwFlQbW0STxXGS+2FK1sxGzun52Dn+XC1+r3/jh7txPcMVOClPTCPyjuusZoR8VNfJMmkXTu+F5mfK2XqMX9VlX4UJmiLA0rRxJc5KQJxOc0uE8xdEWEorOIAt8UL1H2W/j7ZQ6c6eKORU3MfXHHlq+4VSlA/e2h8tlQrGgWDhwpzspDW+PdHraLbAM53gUDjcbeVhtizjcPqJT5PEDjZrcLrlx518XOx/ZDmRootSfozgvpZEsNbnxAoduFFR8C0o/agKWme2nAjn7YOVjEf7oiJLpVy6sNNWAS6/xwjGFKbL8Vn2GLtcwx0d2j7tmbpq6Nzyo0gu6pDrnciCBSjy8TE/ScS6qozPfMeH+bMpufT4in5Ysow3xGsUOZI8pWRaLKjVGRlumCWdanjd4D5QxGW3Umbb81wwpbCcqGroZqFv5N8MJxIIm6LrkYG28WXNYzmza33Pny+ArtebS/E/A==
X-MS-TrafficTypeDiagnostic: MW2NAM10HT127:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RgpbEtIRaUJJPpLlt0fsh/wmFkPPaQo6aQwEWwgJvZtoUt2y9VtdFBcJ7xjoa/R7NDiIpgH63UUDWBQh7OKTiOePQFC+VnxE6x/cSHZ5aJQrYh9A3maDKIveokjGpksjXL6CbBQanqIAptrSMr9aFGbPskYwjgj7SABoxXQvrlM0FYpLqPKyC/4WU09hpYjjXMRj+YpiyP5e08R/8nD7sUGhlanC1rvXOBvzADSBO+DoBaR7ZBv1MqqTyntWx0wveNdEzIRI6HVai96NHop/SeilLNH1Ffk+38/OKNU60UfjpbqRh2k2myxapjGEyKULXI032h2k9qJooQ4JCAdc3WwZ6+2AmkrvKWTYfyAjDagsIusFrkGabzOATpPlV27ak0lWNlMkSfOzn5vaj9fbPA==
X-MS-Exchange-AntiSpam-MessageData: Q5FMrNPTjbyoV/sBhwmBU5viEqb9+8Y00t1IFYLEd6UvKcatSnAaHeqa+VbTOsrX9tuvtPl+4zmlthou49hrYueQ4tfTxvooE+/3MCLB4Iwn/wwG3PutDuvl65YyHBNYSW4fdVEGBQn9xO4eU5dqDA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b39005e-9c8b-4a61-a1d2-08d8e41e7009
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 23:44:26.0222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM10FT055.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2NAM10HT127
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

TODO: Get HP detect working, see if I can improve the audio path
widgets.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/sound/rockchip,rk817-codec.txt   |  39 +
 drivers/mfd/rk808.c                           |   6 +
 sound/soc/codecs/Kconfig                      |   6 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/rk817_codec.c                | 946 ++++++++++++++++++
 sound/soc/codecs/rk817_codec.h                | 142 +++
 6 files changed, 1141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk817-codec.txt
 create mode 100644 sound/soc/codecs/rk817_codec.c
 create mode 100644 sound/soc/codecs/rk817_codec.h

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.txt b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.txt
new file mode 100644
index 000000000000..6d4e05440dae
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.txt
@@ -0,0 +1,39 @@
+* Rockchip rk817 codec
+
+Required properties:
+
+- compatible: "rockchip,rk817-codec"
+- clocks: a list of phandle + clock-specifer pairs, one for each entry in clock-names.
+- clock-names: should be "mclk".
+
+Optional properties:
+
+- mic-in-differential:
+  Boolean. Indicate MIC input are differential, rather than single-ended.
+
+Example for rk817 codec:
+
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
diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index ad923dd4e007..adb8a7da29db 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -163,6 +163,12 @@ static const struct mfd_cell rk817s[] = {
 		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
 		.resources = &rk817_rtc_resources[0],
 	},
+#ifdef CONFIG_SND_SOC_RK817
+	{
+		.name = "rk817-codec",
+		.of_compatible = "rockchip,rk817-codec",
+	},
+#endif
 };
 
 static const struct mfd_cell rk818s[] = {
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
index 000000000000..285c3bc9ce5d
--- /dev/null
+++ b/sound/soc/codecs/rk817_codec.c
@@ -0,0 +1,946 @@
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
+/* For route */
+#define RK817_CODEC_PLAYBACK	1
+#define RK817_CODEC_CAPTURE	2
+#define RK817_CODEC_ALL	(RK817_CODEC_PLAYBACK |\
+	RK817_CODEC_CAPTURE)
+
+struct rk817_codec_priv {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	struct rk808 *rk817;
+	struct clk *mclk;
+
+	unsigned int stereo_sysclk;
+
+	bool mic_in_differential;
+
+	int playback_path;
+	int capture_path;
+};
+
+static const struct reg_default rk817_reg_defaults[] = {
+	{ RK817_CODEC_DTOP_VUCTL, 0x03 },
+	{ RK817_CODEC_DTOP_VUCTIME, 0x00 },
+	{ RK817_CODEC_DTOP_LPT_SRST, 0x00 },
+	{ RK817_CODEC_DTOP_DIGEN_CLKE, 0x00 },
+	/* CODEC_AREF_RTCFG0 not defined in data sheet */
+	{ RK817_CODEC_AREF_RTCFG0, 0x00 },
+	{ RK817_CODEC_AREF_RTCFG1, 0x06 },
+	{ RK817_CODEC_AADC_CFG0, 0xc8 },
+	/* CODEC_AADC_CFG1 not defined in data sheet */
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
+	/* CODEC_ADAC_CFG0 not defined in data sheet */
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
+/*
+ * DDAC L/R volume setting
+ * 0db~-95db,0.375db/step,for example:
+ * 0: 0dB
+ * 0x0a: -3.75dB
+ * 0x7d: -46dB
+ * 0xff: -95dB
+ *
+ * DADC L/R volume setting
+ * 0db~-95db,0.375db/step,for example:
+ * 0: 0dB
+ * 0x0a: -3.75dB
+ * 0x7d: -46dB
+ * 0xff: -95dB
+ */
+
+static const DECLARE_TLV_DB_MINMAX(rk817_dacvol_tlv, -9500, 0);
+
+static const DECLARE_TLV_DB_MINMAX(rk817_adcvol_tlv, -9500, 0);
+
+static const struct snd_kcontrol_new rk817_dac_controls[] = {
+	SOC_DOUBLE_R_RANGE_TLV("Playback Volume", RK817_CODEC_DDAC_VOLL,
+		RK817_CODEC_DDAC_VOLR, 0, 0x00, 0xff, 1, rk817_dacvol_tlv),
+	SOC_DOUBLE_R_RANGE_TLV("Capture Volume", RK817_CODEC_DADC_VOLL, RK817_CODEC_DADC_VOLR,
+		0, 0x00, 0xff, 1, rk817_adcvol_tlv)
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
+static int rk817_reset(struct snd_soc_component *component)
+{
+	snd_soc_component_write(component, RK817_CODEC_DTOP_LPT_SRST, 0x40);
+	snd_soc_component_write(component, RK817_CODEC_DDAC_POPD_DACST, 0x02);
+	snd_soc_component_write(component, RK817_CODEC_DTOP_DIGEN_CLKE, 0x0f);
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG0, 0x04);
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG1, 0x58);
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG2, 0x2d);
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG3, 0x0c);
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG4, 0xa5);
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG5, 0x00);
+	snd_soc_component_write(component, RK817_CODEC_DTOP_DIGEN_CLKE, 0x00);
+
+	return 0;
+}
+
+static struct rk817_reg_val_typ playback_power_up_list[] = {
+	{RK817_CODEC_AREF_RTCFG1, 0x40},
+	{RK817_CODEC_DDAC_POPD_DACST, 0x02},
+	{RK817_CODEC_DDAC_SR_LMT0, 0x02},
+	/* APLL */
+	{RK817_CODEC_APLL_CFG0, 0x04},
+	{RK817_CODEC_APLL_CFG1, 0x58},
+	{RK817_CODEC_APLL_CFG2, 0x2d},
+	{RK817_CODEC_APLL_CFG3, 0x0c},
+	{RK817_CODEC_APLL_CFG4, 0xa5},
+	{RK817_CODEC_APLL_CFG5, 0x00},
+
+	{RK817_CODEC_DI2S_RXCMD_TSD, 0x00},
+	{RK817_CODEC_DI2S_RSD, 0x00},
+	{RK817_CODEC_DI2S_RXCR1, 0x00},
+	{RK817_CODEC_DI2S_RXCMD_TSD, 0x20},
+	{RK817_CODEC_DTOP_VUCTIME, 0xf4},
+	{RK817_CODEC_DDAC_MUTE_MIXCTL, 0x00},
+
+	{RK817_CODEC_DDAC_VOLL, 0x0a},
+	{RK817_CODEC_DDAC_VOLR, 0x0a},
+};
+
+#define RK817_CODEC_PLAYBACK_POWER_UP_LIST_LEN \
+	ARRAY_SIZE(playback_power_up_list)
+
+static struct rk817_reg_val_typ playback_power_down_list[] = {
+	{RK817_CODEC_DDAC_MUTE_MIXCTL, 0x01},
+	{RK817_CODEC_ADAC_CFG1, 0x0f},
+	/* HP */
+	{RK817_CODEC_AHP_CFG0, 0xe0},
+	{RK817_CODEC_AHP_CP, 0x09},
+	/* SPK */
+	{RK817_CODEC_ACLASSD_CFG1, 0x69},
+};
+
+#define RK817_CODEC_PLAYBACK_POWER_DOWN_LIST_LEN \
+	ARRAY_SIZE(playback_power_down_list)
+
+static struct rk817_reg_val_typ capture_power_up_list[] = {
+	{RK817_CODEC_AREF_RTCFG1, 0x40},
+	{RK817_CODEC_DDAC_SR_LMT0, 0x02},
+	{RK817_CODEC_DADC_SR_ACL0, 0x02},
+
+	{RK817_CODEC_APLL_CFG0, 0x04},
+	{RK817_CODEC_APLL_CFG1, 0x58},
+	{RK817_CODEC_APLL_CFG2, 0x2d},
+	{RK817_CODEC_APLL_CFG3, 0x0c},
+	{RK817_CODEC_APLL_CFG4, 0xa5},
+	{RK817_CODEC_APLL_CFG5, 0x00},
+
+	{RK817_CODEC_DI2S_RSD, 0x00},
+	{RK817_CODEC_DI2S_RXCR1, 0x00},
+	{RK817_CODEC_DI2S_RXCMD_TSD, 0x20},
+	{RK817_CODEC_DTOP_VUCTIME, 0xf4},
+
+	{RK817_CODEC_DDAC_MUTE_MIXCTL, 0x00},
+	{RK817_CODEC_AADC_CFG0, 0x08},
+	{RK817_CODEC_AMIC_CFG0, 0x0f},
+	{RK817_CODEC_DI2S_TXCR3_TXCMD, 0x88},
+	{RK817_CODEC_DDAC_POPD_DACST, 0x02},
+	/* 0x29: -18db to 27db */
+	{RK817_CODEC_DMIC_PGA_GAIN, 0x99},
+};
+
+#define RK817_CODEC_CAPTURE_POWER_UP_LIST_LEN \
+	ARRAY_SIZE(capture_power_up_list)
+
+static struct rk817_reg_val_typ capture_power_down_list[] = {
+	{RK817_CODEC_AADC_CFG0, 0xc8},
+	{RK817_CODEC_AMIC_CFG0, 0x70},
+};
+
+#define RK817_CODEC_CAPTURE_POWER_DOWN_LIST_LEN \
+	ARRAY_SIZE(capture_power_down_list)
+
+static int rk817_codec_power_up(struct snd_soc_component *component, int type)
+{
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+	int i;
+
+	if (type & RK817_CODEC_PLAYBACK) {
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DTOP_DIGEN_CLKE,
+					      DAC_DIG_CLK_MASK, DAC_DIG_CLK_EN);
+		for (i = 0; i < RK817_CODEC_PLAYBACK_POWER_UP_LIST_LEN; i++) {
+			snd_soc_component_write(component,
+						playback_power_up_list[i].reg,
+						playback_power_up_list[i].value);
+		}
+	}
+
+	if (type & RK817_CODEC_CAPTURE) {
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DTOP_DIGEN_CLKE,
+					      ADC_DIG_CLK_MASK,
+					      ADC_DIG_CLK_EN);
+		for (i = 0; i < RK817_CODEC_CAPTURE_POWER_UP_LIST_LEN; i++) {
+			snd_soc_component_write(component,
+						capture_power_up_list[i].reg,
+						capture_power_up_list[i].value);
+		}
+
+		if (rk817->mic_in_differential)
+			snd_soc_component_update_bits(component,
+						      RK817_CODEC_AMIC_CFG0,
+						      MIC_DIFF_MASK, MIC_DIFF_EN);
+		else
+			snd_soc_component_update_bits(component,
+						      RK817_CODEC_AMIC_CFG0,
+						      MIC_DIFF_MASK,
+						      MIC_DIFF_DIS);
+
+	}
+
+	return 0;
+}
+
+static int rk817_codec_power_down(struct snd_soc_component *component, int type)
+{
+	int i;
+
+	/* mute output for pop noise */
+	if (type & RK817_CODEC_PLAYBACK) {
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DDAC_MUTE_MIXCTL,
+					      DACMT_MASK, DACMT_ENABLE);
+	}
+
+	if (type & RK817_CODEC_CAPTURE) {
+		for (i = 0; i < RK817_CODEC_CAPTURE_POWER_DOWN_LIST_LEN; i++) {
+			snd_soc_component_write(component,
+						capture_power_down_list[i].reg,
+						capture_power_down_list[i].value);
+		}
+		snd_soc_component_update_bits(component, RK817_CODEC_DTOP_DIGEN_CLKE,
+					      ADC_DIG_CLK_MASK, ADC_DIG_CLK_DIS);
+	}
+
+	if (type & RK817_CODEC_PLAYBACK) {
+		for (i = 0; i < RK817_CODEC_PLAYBACK_POWER_DOWN_LIST_LEN; i++) {
+			snd_soc_component_write(component,
+						playback_power_down_list[i].reg,
+						playback_power_down_list[i].value);
+		}
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DTOP_DIGEN_CLKE,
+					      DAC_DIG_CLK_MASK, DAC_DIG_CLK_DIS);
+	}
+
+	if (type == RK817_CODEC_ALL) {
+		for (i = 0; i < RK817_CODEC_PLAYBACK_POWER_DOWN_LIST_LEN; i++) {
+			snd_soc_component_write(component,
+						playback_power_down_list[i].reg,
+						playback_power_down_list[i].value);
+		}
+		for (i = 0; i < RK817_CODEC_CAPTURE_POWER_DOWN_LIST_LEN; i++) {
+			snd_soc_component_write(component,
+						capture_power_down_list[i].reg,
+						capture_power_down_list[i].value);
+		}
+		snd_soc_component_write(component, RK817_CODEC_DTOP_DIGEN_CLKE, 0x00);
+		snd_soc_component_write(component, RK817_CODEC_APLL_CFG5, 0x01);
+		snd_soc_component_write(component, RK817_CODEC_AREF_RTCFG1, 0x06);
+	}
+
+	return 0;
+}
+
+/* For tiny alsa playback/capture path*/
+static const char * const rk817_playback_path_mode[] = {
+	"OFF", "SPK", "HP", "SPK_HP"};
+
+static const char * const rk817_capture_path_mode[] = {
+	"MIC OFF", "MIC"};
+
+static SOC_ENUM_SINGLE_DECL(rk817_playback_path_type,
+	0, 0, rk817_playback_path_mode);
+
+static SOC_ENUM_SINGLE_DECL(rk817_capture_path_type,
+	0, 0, rk817_capture_path_mode);
+
+static int rk817_playback_path_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rk817->playback_path;
+
+	return 0;
+}
+
+static int rk817_playback_path_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+	int pre_path;
+
+	if (rk817->playback_path == ucontrol->value.integer.value[0]) {
+		return 0;
+	}
+
+	pre_path = rk817->playback_path;
+	rk817->playback_path = ucontrol->value.integer.value[0];
+
+	if (rk817->playback_path != OFF)
+		clk_prepare_enable(rk817->mclk);
+	else
+		clk_disable_unprepare(rk817->mclk);
+
+	switch (rk817->playback_path) {
+	case OFF:
+		if (pre_path != OFF && pre_path != HP_PATH) {
+			rk817_codec_power_down(component, RK817_CODEC_PLAYBACK);
+			if (rk817->capture_path == 0)
+				rk817_codec_power_down(component, RK817_CODEC_ALL);
+		}
+		break;
+	case SPK_PATH:
+		if (pre_path == OFF)
+			rk817_codec_power_up(component, RK817_CODEC_PLAYBACK);
+
+		/* power on dac ibias/l/r */
+		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+					PWD_DACBIAS_ON | PWD_DACD_ON |
+					PWD_DACL_DOWN | PWD_DACR_DOWN);
+		/* CLASS D mode, combine LR channels */
+		snd_soc_component_write(component,
+					RK817_CODEC_DDAC_MUTE_MIXCTL,
+					0x10);
+		/* CLASS D enable */
+		snd_soc_component_write(component,
+					RK817_CODEC_ACLASSD_CFG1,
+					0xa5);
+		/* restart CLASS D, OCPP/N */
+		snd_soc_component_write(component,
+					RK817_CODEC_ACLASSD_CFG2,
+					0xf7);
+		break;
+	case HP_PATH:
+		if (pre_path == OFF)
+			rk817_codec_power_up(component, RK817_CODEC_PLAYBACK);
+		/* HP_CP_EN , CP 2.3V */
+		snd_soc_component_write(component, RK817_CODEC_AHP_CP, 0x11);
+		/* power on HP two stage opamp ,HP amplitude 0db */
+		snd_soc_component_write(component, RK817_CODEC_AHP_CFG0, 0x80);
+		/* power on dac ibias/l/r */
+		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+					PWD_DACBIAS_ON | PWD_DACD_DOWN |
+					PWD_DACL_ON | PWD_DACR_ON);
+		/* CLASS D mode disable, split LR channels */
+		snd_soc_component_write(component,
+					RK817_CODEC_DDAC_MUTE_MIXCTL,
+					0x00);
+
+		break;
+	case SPK_HP:
+		if (pre_path == OFF)
+			rk817_codec_power_up(component, RK817_CODEC_PLAYBACK);
+
+		/* HP_CP_EN , CP 2.3V  */
+		snd_soc_component_write(component, RK817_CODEC_AHP_CP, 0x11);
+		/* power on HP two stage opamp ,HP amplitude 0db */
+		snd_soc_component_write(component, RK817_CODEC_AHP_CFG0, 0x80);
+
+		/* power on dac ibias/l/r */
+		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+					PWD_DACBIAS_ON | PWD_DACD_ON |
+					PWD_DACL_ON | PWD_DACR_ON);
+
+		/* CLASS D mode, combine LR channels */
+		snd_soc_component_write(component,
+					RK817_CODEC_DDAC_MUTE_MIXCTL,
+					0x10);
+		/* CLASS D enable */
+		snd_soc_component_write(component,
+					RK817_CODEC_ACLASSD_CFG1,
+					0xa5);
+		/* restart CLASS D, OCPP/N */
+		snd_soc_component_write(component,
+					RK817_CODEC_ACLASSD_CFG2,
+					0xf7);
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rk817_capture_path_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	dev_dbg(component->dev, "%s:capture_path %d\n", __func__, rk817->capture_path);
+	ucontrol->value.integer.value[0] = rk817->capture_path;
+	return 0;
+}
+
+static int rk817_capture_path_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+	int pre_path;
+
+	if (rk817->capture_path == ucontrol->value.integer.value[0]) {
+		dev_dbg(component->dev, "%s:capture_path is not changed!\n",
+			__func__);
+		return 0;
+	}
+
+	pre_path = rk817->capture_path;
+	rk817->capture_path = ucontrol->value.integer.value[0];
+
+	if (rk817->capture_path != MIC_OFF)
+		clk_prepare_enable(rk817->mclk);
+	else
+		clk_disable_unprepare(rk817->mclk);
+
+	switch (rk817->capture_path) {
+	case MIC_OFF:
+		if (pre_path != MIC_OFF)
+			rk817_codec_power_down(component, RK817_CODEC_CAPTURE);
+		break;
+	case MIC:
+		if (pre_path == MIC_OFF)
+			rk817_codec_power_up(component, RK817_CODEC_CAPTURE);
+
+		if (!rk817->mic_in_differential) {
+			snd_soc_component_write(component,
+						RK817_CODEC_DADC_VOLR,
+						0xff);
+			snd_soc_component_update_bits(component,
+						      RK817_CODEC_AADC_CFG0,
+						      ADC_R_PWD_MASK,
+						      ADC_R_PWD_EN);
+			snd_soc_component_update_bits(component,
+						      RK817_CODEC_AMIC_CFG0,
+						      PWD_PGA_R_MASK,
+						      PWD_PGA_R_EN);
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct snd_kcontrol_new rk817_snd_path_controls[] = {
+	SOC_ENUM_EXT("Playback Path", rk817_playback_path_type,
+		     rk817_playback_path_get, rk817_playback_path_put),
+
+	SOC_ENUM_EXT("Capture Path", rk817_capture_path_type,
+		     rk817_capture_path_get, rk817_capture_path_put),
+};
+
+static const struct snd_soc_dapm_widget rk817_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("MIC"),
+	SND_SOC_DAPM_OUTPUT("HPOL"),
+	SND_SOC_DAPM_OUTPUT("HPOR"),
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
+static int rk817_suspend(struct snd_soc_component *component)
+{
+	rk817_codec_power_down(component, RK817_CODEC_ALL);
+	return 0;
+}
+
+static int rk817_resume(struct snd_soc_component *component)
+{
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	rk817_codec_power_up(component, RK817_CODEC_ALL);
+
+	switch (rk817->playback_path) {
+	case OFF:
+		break;
+	case SPK_PATH:
+		/* power on dac ibias/l/r */
+		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+			      PWD_DACBIAS_ON | PWD_DACD_ON |
+			      PWD_DACL_ON | PWD_DACR_ON);
+		/* CLASS D mode */
+		snd_soc_component_write(component, RK817_CODEC_DDAC_MUTE_MIXCTL, 0x10);
+		/* CLASS D enable */
+		snd_soc_component_write(component, RK817_CODEC_ACLASSD_CFG1, 0xa5);
+		/* restart CLASS D, OCPP/N */
+		snd_soc_component_write(component, RK817_CODEC_ACLASSD_CFG2, 0xc4);
+		break;
+	case HP_PATH:
+		/* HP_CP_EN , CP 2.3V */
+		snd_soc_component_write(component, RK817_CODEC_AHP_CP, 0x11);
+		/* power on HP two stage opamp ,HP amplitude 0db */
+		snd_soc_component_write(component, RK817_CODEC_AHP_CFG0, 0x80);
+		/* power on dac ibias/l/r */
+		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+			      PWD_DACBIAS_ON | PWD_DACD_DOWN |
+			      PWD_DACL_ON | PWD_DACR_ON);
+		snd_soc_component_update_bits(component, RK817_CODEC_DDAC_MUTE_MIXCTL,
+				    DACMT_MASK, DACMT_DISABLE);
+		break;
+	case SPK_HP:
+		/* HP_CP_EN , CP 2.3V  */
+		snd_soc_component_write(component, RK817_CODEC_AHP_CP, 0x11);
+		/* power on HP two stage opamp ,HP amplitude 0db */
+		snd_soc_component_write(component, RK817_CODEC_AHP_CFG0, 0x80);
+
+		/* power on dac ibias/l/r */
+		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+			      PWD_DACBIAS_ON | PWD_DACD_ON |
+			      PWD_DACL_ON | PWD_DACR_ON);
+
+		/* CLASS D mode */
+		snd_soc_component_write(component, RK817_CODEC_DDAC_MUTE_MIXCTL, 0x10);
+		/* CLASS D enable */
+		snd_soc_component_write(component, RK817_CODEC_ACLASSD_CFG1, 0xa5);
+		/* restart CLASS D, OCPP/N */
+		snd_soc_component_write(component, RK817_CODEC_ACLASSD_CFG2, 0xc4);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rk817_probe(struct snd_soc_component *component)
+{
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+
+	if (!rk817) {
+		dev_err(component->dev, "%s : rk817 priv is NULL!\n",
+			__func__);
+		return -EINVAL;
+	}
+	snd_soc_component_init_regmap(component, rk817->regmap);
+	rk817->component = component;
+	rk817->playback_path = OFF;
+	rk817->capture_path = MIC_OFF;
+
+	rk817_reset(component);
+	snd_soc_add_component_controls(component, rk817_snd_path_controls,
+				       ARRAY_SIZE(rk817_snd_path_controls));
+
+	snd_soc_dapm_new_controls(dapm, rk817_dapm_widgets,
+                ARRAY_SIZE(rk817_dapm_widgets));
+	return 0;
+}
+
+/* power down chip */
+static void rk817_remove(struct snd_soc_component *component)
+{
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	if (!rk817) {
+		dev_err(component->dev, "%s : rk817 is NULL\n", __func__);
+		return;
+	}
+
+	rk817_codec_power_down(component, RK817_CODEC_ALL);
+	snd_soc_component_exit_regmap(component);
+	mdelay(10);
+
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
+	.probe = rk817_probe,
+	.remove = rk817_remove,
+	.suspend = rk817_suspend,
+	.resume = rk817_resume,
+	.idle_bias_on = 1,
+	.use_pmdown_time = 1,
+	.endianness = 1,
+	.non_legacy_dai_naming = 1,
+	.controls = rk817_dac_controls,
+	.num_controls = ARRAY_SIZE(rk817_dac_controls),
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
+static const struct of_device_id rk817_codec_dt_ids[] = {
+	{ .compatible = "rockchip,rk817-codec" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rk817_codec_dt_ids);
+
+static struct platform_driver rk817_codec_driver = {
+	.driver = {
+		   .name = "rk817-codec",
+		   .of_match_table = rk817_codec_dt_ids,
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
index 000000000000..5350f7100d67
--- /dev/null
+++ b/sound/soc/codecs/rk817_codec.h
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// rk817 ALSA SoC Audio driver
+//
+// Copyright (c) 2018, Fuzhou Rockchip Electronics Co., Ltd All rights reserved.
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
+/* RK817_CODEC_DTOP_DIGEN_CLKE */
+#define ADC_DIG_CLK_MASK		(0xf << 4)
+#define ADC_DIG_CLK_DIS			(0x0 << 4)
+#define ADC_DIG_CLK_EN			(0xf << 4)
+
+#define DAC_DIG_CLK_MASK		(0xf << 0)
+#define DAC_DIG_CLK_DIS			(0x0 << 0)
+#define DAC_DIG_CLK_EN			(0xf << 0)
+
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
+/* RK817_CODEC_ADAC_CFG1 */
+#define PWD_DACBIAS_MASK		(0x1 << 3)
+#define PWD_DACBIAS_DOWN		(0x1 << 3)
+#define PWD_DACBIAS_ON			(0x0 << 3)
+#define PWD_DACD_MASK			(0x1 << 2)
+#define PWD_DACD_DOWN			(0x1 << 2)
+#define PWD_DACD_ON			(0x0 << 2)
+#define PWD_DACL_MASK			(0x1 << 1)
+#define PWD_DACL_DOWN			(0x1 << 1)
+#define PWD_DACL_ON			(0x0 << 1)
+#define PWD_DACR_MASK			(0x1 << 0)
+#define PWD_DACR_DOWN			(0x1 << 0)
+#define PWD_DACR_ON			(0x0 << 0)
+
+/* RK817_CODEC_AADC_CFG0 */
+#define ADC_R_PWD_MASK			(0x1 << 6)
+#define ADC_R_PWD_DIS			(0x0 << 6)
+#define ADC_R_PWD_EN			(0x1 << 6)
+
+/* RK817_CODEC_AMIC_CFG0 */
+#define MIC_DIFF_MASK			(0x1 << 7)
+#define MIC_DIFF_DIS			(0x0 << 7)
+#define MIC_DIFF_EN			(0x1 << 7)
+
+/* RK817_CODEC_AMIC_CFG0 */
+#define PWD_PGA_R_MASK			(0x1 << 4)
+#define PWD_PGA_R_DIS			(0x0 << 4)
+#define PWD_PGA_R_EN			(0x1 << 4)
+
+enum {
+	OFF,
+	SPK_PATH,
+	HP_PATH,
+	SPK_HP,
+};
+
+enum {
+	MIC_OFF,
+	MIC,
+};
+
+struct rk817_reg_val_typ {
+	unsigned int reg;
+	unsigned int value;
+};
+
+#endif /* __RK817_CODEC_H__ */
-- 
2.25.1

