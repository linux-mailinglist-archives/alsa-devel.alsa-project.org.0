Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE4333201
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 00:43:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C4917A3;
	Wed, 10 Mar 2021 00:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C4917A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615333435;
	bh=H3fvorXHAcnZaVaBinVM0NCPYQj8H18tGNX/HIGrmiU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Me3GWxCicA8pXtrkw7hu5t5gee76gOjwXv9R7U8Ejf5JwL59RtUzpsNglYOWRuig5
	 ZJ2tSRKagi0NJuPotj14+phArI6h7speq6y82Yo8ra36WrGmqjxKUs9eCHHhDuJ5w/
	 p3gOpOkN3OMymQaRwiyErrCDr1gYXPmOjv3w0e+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB38CF80256;
	Wed, 10 Mar 2021 00:42:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 727C6F80227; Wed, 10 Mar 2021 00:42:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2056.outbound.protection.outlook.com [40.92.42.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8E6DF80166
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 00:42:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8E6DF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="nBrQ7eDU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP7I8YovyErpkuVDnNYfVI2T/XQFG4BKB00IRO/LTBGj3oo9rBxgl1QZQXE0XqtZG3tmAwkzv95D/BbvJF/pHGd3vUvywVpMl+AaL7jnd6B17jqEw2i/JTPXdGD5Tmmn6r85IoeifON6LBxhEalj38H7WsCLo2RnKxVQOfd7TiIAkPtMMANSDLLLM+2QOFUOdw2c1WJw1o/lRj7QksJ5VK+uFY49xswLzr430Y77zpVDKK+v5yCa6e9nJkLqSyzXsDPIQPN/vijwZL51s99Ehp2Ld4eL5hSeCCylQwd9MzpSVDFVZ4WRafvykTZRpLw4TIYfV4vIPxjTJYCZn0ROHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D98bALHrPcYl91YWYiaDFRAHKIMfroTeVwa4Rmnin8=;
 b=babnysMLsxCqBjapmyNO0iZv/t/bOLaMd/Xg2h1rlFTqUokGYvg4UF+5Bn0FBudMNkzUbsree8dhomjy4bYu5dTIqkGjnhgzQ2dxhKFZNXScf4qY0H7lpOjsGAJACNr+cd70YTBX9jWdy4sMmA+tFFwGH8gcfJ05lB1MrruddeFzm23v4nA3I9wl7sKqZaum0VkXXIvtTjig9tLqpF15+XdYTOggd4caCgFUlq1N5FHPPIKYl249q8CwLW5cQiWAgpD6CZ0LhF7DxgOyBMnG7yPGXVN3zsoSD2qM1nn4xdsLSalBHQIJgU3UYyqlbwDY7Tp8mn8RxXNQ3XxQdtcumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D98bALHrPcYl91YWYiaDFRAHKIMfroTeVwa4Rmnin8=;
 b=nBrQ7eDU7TczX9Kmwiv00LpGFU2yDp3G4y/TKKt23G+xfa1kjj9/CQlRrIHIl0gP1m19NxreMW2YP7pvhMH1YVtUbAhLcHxHPvaJZQSX+mgEF7wf5y/5UaV5Ct/U0itrIyeq3XxeDgeA4jLS5jVOu3seV0tKfKi9QQmtoXrGivjNYl4OEE0rzojHxFovnRDdnrQhTITHZjnNZeFN74OdTbPmDNHSfzcFzZ6bzAn2PygIqKXDjUv7zHcJoDGc4LpB89l9k7Gl/N+G8g3sSPxPp4QvmR/lTly+6V3LTQsBnei77ImkY82p5b86GNRyfjGtM3kSOTBf4YszKdxDNoxilg==
Received: from BN7NAM10FT057.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::43) by
 BN7NAM10HT046.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::452)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.25; Tue, 9 Mar
 2021 23:42:04 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e8f::4a) by BN7NAM10FT057.mail.protection.outlook.com
 (2a01:111:e400:7e8f::403) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.30 via Frontend
 Transport; Tue, 9 Mar 2021 23:42:04 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:AA1CB13D7B16A1F6B88C1E08438319D7CF5612797BFE734277E79567C20337D8;
 UpperCasedChecksum:D3423DEAB6AD39B532BDBB311FC4E91426E80DC9C531450C447E4B6ACC363480;
 SizeAsReceived:7301; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 23:42:04 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Add audio driver for rk817 upstream
Date: Tue,  9 Mar 2021 17:41:54 -0600
Message-ID: <SN6PR06MB53424379B5FC1BB3710B59F4A5929@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [M7mb2MspjVTVIDcsx2dl6Sz7T6fDtCSL]
X-ClientProxiedBy: SN4PR0501CA0043.namprd05.prod.outlook.com
 (2603:10b6:803:41::20) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210309234154.11908-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0043.namprd05.prod.outlook.com (2603:10b6:803:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.13 via Frontend
 Transport; Tue, 9 Mar 2021 23:42:03 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f3ea4161-a324-4812-7e10-08d8e354f146
X-MS-Exchange-SLBlob-MailProps: 0RSV28T7LqRGHyL5lh14aYhslbDhJ5a/+wDKBnujF3ilfo7iRFQdCq/pvA8H4HrK67le2rw2YBJ9RlsDlH2sJrtmjHgvU+g4QyxsywxvuijFrfMldjdrxUvuZQJUZ2iZSTosNNgzPzbabUK75AXGZYSlz83BUOIiAP04P4bv8MaUfpTEyQ2SfdFtknrn4jAImikRBKbFe9mu/u5onuGnaof0YDeFUKclzBJO1+qYUdNUnkwZd7kWaPIJe0F78Cv0mxFwINw83eEVSOb88me+Gryb94L9sI0QbP2z3IU2BIXWOaz4hCNX8fty01KcrlY4TvkELRlvLI8gX7TkA/9K+3Y+wqScQ4E1YYFkHzAEpsw5vLGkSHbn8zSGxJ/Y9E9y7UnyzgWVmmAsc8pwVqfG6sFpK9J2PYtqeQdRmCnj3TtoAQWXnf3HRg49tG0SZ/DpWVL7T707Yyl7Gsc+2yxBLaKJ0Lsoc1Ze7QMr/O+ygWfIN8ZDJhxFl0cWZvg+mLuUcap6v3UYtf2f1aW0JmaG2HyuL5R0KRD6UXzV0jSUK81Qxa0D8f3siQhykTt3QinesANq/yGFDn6LWSybBLjS4IZzTAvV9/IgKc5Zufyrx3ERgDEQrz22qUs7GgSvI7lMXIJXeIhokBrCesKV182s/8ep420MpXTvZcp+6oaPER1th5QCBcEoJ4A3zh5pCeiF
X-MS-TrafficTypeDiagnostic: BN7NAM10HT046:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1vsZUXFCLL377BRWsfMh9EXwopjjpDApNxLED13GBB7I9UDfS3p1MZT+MKRRAJwCtMFw6RtSI7sULYjBv+VWw3D7w8tkwT7AC4rkWXiRhseBTgkWZ/dkogoQgfPLk+f9sjzSs2JdwWNGv0J10L9XlYWNEbOHk0nVwLD5+MYTDX79fuJDxz3fOwyzWkzm7sVyLhOszqggiJ4dtUG5yPc0nqaLpTvyYXh47cAm3ds2EIQys4XrEaaXSXgZlm6n5+1FYgR5jAVEkT3ne3KTg2sY8JyYIeRW1X5YItcnGHdpZMRkBGFkAs4cQDOPLbCcAY7dSyagbqMRSy7Z9rWJ/5o0PVyUqnLHb0cxX6RdV6vV+O1++ww9BMZ/OOY8dssraXhhDbHH8AewgyouK5FiJLhD1A==
X-MS-Exchange-AntiSpam-MessageData: eYIsk/vA3q03PzqJ2eG6PYn7XfAUx4yxdWSrOBXRFLWuB8sG/xTsXkXoaKubWLuEHWiib1Y2eSP/gUc4i5C8Cs124VtW84ZO4g14s/seTI8n49x9MRv1sG/LM3HjEX3gQLRJU2kes6Wj0DwbG2rwvA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ea4161-a324-4812-7e10-08d8e354f146
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 23:42:04.2429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT057.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT046
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

I'm wondering if you all can help me.  I'm trying to get the rk817
codec driver working from Rockchip's BSP kernel sources (GPL per
the license) and I'm struggling with a few parts. The first part
is I'm not sure if I have my audio paths set up correctly. For example
the sinks I have set up are for HPOL and HPOR, and the source is for
MIC. While this does work (audio output seems fine) I'm having issues
with the GPIO to detect headphone insertion. When I insert headphones
I expect the audio to output to the headphones, and when I remove
headphones I expect the audio to output to a speaker. Right now I
have to manually change the output between the different paths.
Additionally, while the codec "technically" has dual channel inputs
for the microphone, I'm only using the L channel. Should I have a
stereo mixer? Note that I'm using the simple-audio-card to set my
paths, widgets, and the gpio pin. They all work, just not seamlessly
together.

Basically, I'm wanting to know if and how I should set up my audio
paths for the speaker and headphones, they use mostly the same pins
and only really differ in setting the external amp settings.
Additionally, once I set up my paths how do I ensure that the GPIO
events will result in switching between the speaker/headphone path?

Any help you can provide is appreciated. This is my first attempt at
something of this magnitude (for me it's a big step), even if it's
just trying to facilitate in getting a vendor's code ready for upstream.

Thank you.

---
 drivers/mfd/rk808.c            |    6 +
 sound/soc/codecs/Kconfig       |    6 +
 sound/soc/codecs/Makefile      |    2 +
 sound/soc/codecs/rk817_codec.c | 1148 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/rk817_codec.h |  197 ++++++
 5 files changed, 1359 insertions(+)
 create mode 100644 sound/soc/codecs/rk817_codec.c
 create mode 100644 sound/soc/codecs/rk817_codec.h

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
index 000000000000..973e2f7562f8
--- /dev/null
+++ b/sound/soc/codecs/rk817_codec.c
@@ -0,0 +1,1148 @@
+/*
+ * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
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
+/*
+ * DDAC L/R volume setting
+ * 0db~-95db,0.375db/step,for example:
+ * 0: 0dB
+ * 0x0a: -3.75dB
+ * 0x7d: -46dB
+ * 0xff: -95dB
+ */
+#define OUT_VOLUME	(0x03)
+
+/*
+ * DADC L/R volume setting
+ * 0db~-95db,0.375db/step,for example:
+ * 0: 0dB
+ * 0x0a: -3.75dB
+ * 0x7d: -46dB
+ * 0xff: -95dB
+ */
+#define CAPTURE_VOLUME	(0x03)
+
+#define CODEC_SET_SPK 1
+#define CODEC_SET_HP 2
+
+struct rk817_codec_priv {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	struct rk808 *rk817;
+	struct clk *mclk;
+
+	unsigned int stereo_sysclk;
+	unsigned int rate;
+
+	unsigned int spk_volume;
+	unsigned int hp_volume;
+	unsigned int capture_volume;
+
+	bool mic_in_differential;
+	bool pdmdata_out_enable;
+	bool use_ext_amplifier;
+	bool adc_for_loopback;
+
+	long int playback_path;
+	long int capture_path;
+
+	struct gpio_desc *spk_ctl_gpio;
+	struct gpio_desc *hp_ctl_gpio;
+	int spk_mute_delay;
+	int hp_mute_delay;
+};
+
+static const struct reg_default rk817_reg_defaults[] = {
+	{ RK817_CODEC_DTOP_VUCTL, 0x003 },
+	{ RK817_CODEC_DTOP_VUCTIME, 0x00 },
+	{ RK817_CODEC_DTOP_LPT_SRST, 0x00 },
+	{ RK817_CODEC_DTOP_DIGEN_CLKE, 0x00 },
+	{ RK817_CODEC_AREF_RTCFG0, 0x00 },
+	{ RK817_CODEC_AREF_RTCFG1, 0x06 },
+	{ RK817_CODEC_AADC_CFG0, 0xc8 },
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
+static const DECLARE_TLV_DB_MINMAX(rk817_vol_tlv, -9500, -675);
+
+static const struct snd_kcontrol_new rk817_dac_controls[] = {
+	SOC_DOUBLE_R_RANGE_TLV("Playback Volume", RK817_CODEC_DDAC_VOLL,
+		RK817_CODEC_DDAC_VOLR, 0, 0x12, 0xff, 1, rk817_vol_tlv),
+	SOC_DOUBLE_R("Record Volume", RK817_CODEC_DADC_VOLL, RK817_CODEC_DADC_VOLR,
+		0, 0xFF, 1)
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
+static int rk817_codec_ctl_gpio(struct rk817_codec_priv *rk817,
+				int gpio, int level)
+{
+	if ((gpio & CODEC_SET_SPK) &&
+	    rk817->spk_ctl_gpio) {
+		gpiod_set_value(rk817->spk_ctl_gpio, level);
+		msleep(rk817->spk_mute_delay);
+	}
+
+	if ((gpio & CODEC_SET_HP) &&
+	    rk817->hp_ctl_gpio) {
+		gpiod_set_value(rk817->hp_ctl_gpio, level);
+		msleep(rk817->hp_mute_delay);
+	}
+
+	return 0;
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
+		if (rk817->pdmdata_out_enable)
+			snd_soc_component_update_bits(component,
+						      RK817_CODEC_DI2S_CKM,
+						      PDM_EN_MASK,
+						      PDM_EN_ENABLE);
+
+		snd_soc_component_write(component, RK817_CODEC_DADC_VOLL,
+					rk817->capture_volume);
+		snd_soc_component_write(component, RK817_CODEC_DADC_VOLR,
+					rk817->capture_volume);
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
+					      DACMT_ENABLE, DACMT_ENABLE);
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
+	long int pre_path;
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
+		if (!rk817->use_ext_amplifier) {
+			/* power on dac ibias/l/r */
+			snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+						PWD_DACBIAS_ON | PWD_DACD_ON |
+						PWD_DACL_DOWN | PWD_DACR_DOWN);
+			/* CLASS D mode, combine LR channels */
+			snd_soc_component_write(component,
+						RK817_CODEC_DDAC_MUTE_MIXCTL,
+						0x10);
+			/* CLASS D enable */
+			snd_soc_component_write(component,
+						RK817_CODEC_ACLASSD_CFG1,
+						0xa5);
+			/* restart CLASS D, OCPP/N */
+			snd_soc_component_write(component,
+						RK817_CODEC_ACLASSD_CFG2,
+						0xf7);
+		} else {
+			/* HP_CP_EN , CP 2.3V */
+			snd_soc_component_write(component, RK817_CODEC_AHP_CP,
+						0x11);
+			/* power on HP two stage opamp ,HP amplitude 0db */
+			snd_soc_component_write(component, RK817_CODEC_AHP_CFG0,
+						0x80);
+			/* power on dac ibias/l/r */
+			snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+						PWD_DACBIAS_ON | PWD_DACD_DOWN |
+						PWD_DACL_ON | PWD_DACR_ON);
+			snd_soc_component_update_bits(component,
+						      RK817_CODEC_DDAC_MUTE_MIXCTL,
+						      DACMT_ENABLE, DACMT_DISABLE);
+		}
+		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLL,
+					rk817->spk_volume);
+		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLR,
+					rk817->spk_volume);
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
+		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLL,
+					rk817->hp_volume);
+		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLR,
+					rk817->hp_volume);
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
+		if (!rk817->use_ext_amplifier) {
+			/* CLASS D mode, combine LR channels */
+			snd_soc_component_write(component,
+						RK817_CODEC_DDAC_MUTE_MIXCTL,
+						0x10);
+			/* CLASS D enable */
+			snd_soc_component_write(component,
+						RK817_CODEC_ACLASSD_CFG1,
+						0xa5);
+			/* restart CLASS D, OCPP/N */
+			snd_soc_component_write(component,
+						RK817_CODEC_ACLASSD_CFG2,
+						0xf7);
+		}
+
+		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLL,
+					rk817->hp_volume);
+		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLR,
+					rk817->hp_volume);
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
+	dev_dbg(component->dev, "%s:capture_path %ld\n", __func__, rk817->capture_path);
+	ucontrol->value.integer.value[0] = rk817->capture_path;
+	return 0;
+}
+
+static int rk817_capture_path_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+	long int pre_path;
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
+		if (rk817->adc_for_loopback) {
+			/* don't need to gain when adc use for loopback */
+			snd_soc_component_update_bits(component,
+						      RK817_CODEC_AMIC_CFG0,
+						      0xf,
+						      0x0);
+			snd_soc_component_write(component,
+						RK817_CODEC_DMIC_PGA_GAIN,
+						0x66);
+			snd_soc_component_write(component,
+						RK817_CODEC_DADC_VOLL,
+						0x00);
+			snd_soc_component_write(component,
+						RK817_CODEC_DADC_VOLR,
+						0x00);
+			break;
+		}
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
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	if (mute)
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DDAC_MUTE_MIXCTL,
+					      DACMT_ENABLE, DACMT_ENABLE);
+	else
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DDAC_MUTE_MIXCTL,
+					      DACMT_ENABLE, DACMT_DISABLE);
+
+	if (mute) {
+		rk817_codec_ctl_gpio(rk817, CODEC_SET_SPK, 0);
+		rk817_codec_ctl_gpio(rk817, CODEC_SET_HP, 0);
+	} else {
+		switch (rk817->playback_path) {
+		case SPK_PATH:
+			rk817_codec_ctl_gpio(rk817, CODEC_SET_SPK, 1);
+			rk817_codec_ctl_gpio(rk817, CODEC_SET_HP, 0);
+			break;
+		case HP_PATH:
+			rk817_codec_ctl_gpio(rk817, CODEC_SET_SPK, 0);
+			rk817_codec_ctl_gpio(rk817, CODEC_SET_HP, 1);
+			break;
+		case SPK_HP:
+			rk817_codec_ctl_gpio(rk817, CODEC_SET_SPK, 1);
+			rk817_codec_ctl_gpio(rk817, CODEC_SET_HP, 1);
+			break;
+		default:
+			break;
+		}
+	}
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
+		.id = RK817_HIFI,
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
+		if (!rk817->use_ext_amplifier) {
+			/* power on dac ibias/l/r */
+			snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+				      PWD_DACBIAS_ON | PWD_DACD_ON |
+				      PWD_DACL_ON | PWD_DACR_ON);
+			/* CLASS D mode */
+			snd_soc_component_write(component, RK817_CODEC_DDAC_MUTE_MIXCTL, 0x10);
+			/* CLASS D enable */
+			snd_soc_component_write(component, RK817_CODEC_ACLASSD_CFG1, 0xa5);
+			/* restart CLASS D, OCPP/N */
+			snd_soc_component_write(component, RK817_CODEC_ACLASSD_CFG2, 0xc4);
+		} else {
+			/* HP_CP_EN , CP 2.3V */
+			snd_soc_component_write(component, RK817_CODEC_AHP_CP, 0x11);
+			/* power on HP two stage opamp ,HP amplitude 0db */
+			snd_soc_component_write(component, RK817_CODEC_AHP_CFG0, 0x80);
+			/* power on dac ibias/l/r */
+			snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
+					  PWD_DACBIAS_ON | PWD_DACD_DOWN |
+					  PWD_DACL_ON | PWD_DACR_ON);
+			snd_soc_component_update_bits(component, RK817_CODEC_DDAC_MUTE_MIXCTL,
+						DACMT_ENABLE, DACMT_DISABLE);
+		}
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
+				    DACMT_ENABLE, DACMT_DISABLE);
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
+		if (!rk817->use_ext_amplifier) {
+			/* CLASS D mode */
+			snd_soc_component_write(component, RK817_CODEC_DDAC_MUTE_MIXCTL, 0x10);
+			/* CLASS D enable */
+			snd_soc_component_write(component, RK817_CODEC_ACLASSD_CFG1, 0xa5);
+			/* restart CLASS D, OCPP/N */
+			snd_soc_component_write(component, RK817_CODEC_ACLASSD_CFG2, 0xc4);
+		}
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
+	int ret;
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
+	rk817->hp_ctl_gpio = devm_gpiod_get_optional(dev, "hp-ctl",
+						  GPIOD_OUT_LOW);
+
+	rk817->spk_ctl_gpio = devm_gpiod_get_optional(dev, "spk-ctl",
+						  GPIOD_OUT_LOW);
+
+	ret = of_property_read_u32(node, "spk-mute-delay-ms",
+				   &rk817->spk_mute_delay);
+	if (ret < 0) {
+		rk817->spk_mute_delay = 0;
+	}
+
+	ret = of_property_read_u32(node, "hp-mute-delay-ms",
+				   &rk817->hp_mute_delay);
+	if (ret < 0) {
+		rk817->hp_mute_delay = 0;
+	}
+
+	ret = of_property_read_u32(node, "spk-volume", &rk817->spk_volume);
+	if (ret < 0) {
+		rk817->spk_volume = OUT_VOLUME;
+	}
+	if (rk817->spk_volume < 3)
+		rk817->spk_volume = 3;
+
+	ret = of_property_read_u32(node, "hp-volume",
+				   &rk817->hp_volume);
+	if (ret < 0) {
+		rk817->hp_volume = OUT_VOLUME;
+	}
+	if (rk817->hp_volume < 3)
+		rk817->hp_volume = 3;
+
+	ret = of_property_read_u32(node, "capture-volume",
+				   &rk817->capture_volume);
+	if (ret < 0) {
+		rk817->capture_volume = CAPTURE_VOLUME;
+	}
+
+	rk817->mic_in_differential =
+			of_property_read_bool(node, "mic-in-differential");
+
+	rk817->pdmdata_out_enable =
+			of_property_read_bool(node, "pdmdata-out-enable");
+
+	rk817->use_ext_amplifier =
+			of_property_read_bool(node, "use-ext-amplifier");
+
+	rk817->adc_for_loopback =
+			of_property_read_bool(node, "adc-for-loopback");
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
+static int rk817_platform_remove(struct platform_device *pdev)
+{
+	snd_soc_unregister_component(&pdev->dev);
+
+	return 0;
+}
+
+static void rk817_platform_shutdown(struct platform_device *pdev)
+{
+	struct rk817_codec_priv *rk817 = dev_get_drvdata(&pdev->dev);
+
+	if (rk817 && rk817->component)
+		rk817_codec_power_down(rk817->component, RK817_CODEC_ALL);
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
+	.remove = rk817_platform_remove,
+	.shutdown = rk817_platform_shutdown,
+};
+
+module_platform_driver(rk817_codec_driver);
+
+MODULE_DESCRIPTION("ASoC RK817 codec driver");
+MODULE_AUTHOR("binyuan <kevan.lan@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rk817_codec.h b/sound/soc/codecs/rk817_codec.h
new file mode 100644
index 000000000000..3f13eade80b3
--- /dev/null
+++ b/sound/soc/codecs/rk817_codec.h
@@ -0,0 +1,197 @@
+/*
+ * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
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
+#define ADC_DIG_CLK_SFT			4
+#define ADC_DIG_CLK_DIS			(0x0 << 4)
+#define ADC_DIG_CLK_EN			(0xf << 4)
+
+#define DAC_DIG_CLK_MASK		(0xf << 0)
+#define DAC_DIG_CLK_SFT			0
+#define DAC_DIG_CLK_DIS			(0x0 << 0)
+#define DAC_DIG_CLK_EN			(0xf << 0)
+
+/* RK817_CODEC_APLL_CFG5 */
+#define PLL_PW_DOWN			(0x01 << 0)
+#define PLL_PW_UP			(0x00 << 0)
+
+/* RK817_CODEC_DI2S_CKM */
+#define PDM_EN_MASK			(0x1 << 3)
+#define PDM_EN_SFT			3
+#define PDM_EN_DISABLE			(0x0 << 3)
+#define PDM_EN_ENABLE			(0x1 << 3)
+
+#define SCK_EN_ENABLE			(0x1 << 2)
+#define SCK_EN_DISABLE			(0x0 << 2)
+
+#define RK817_I2S_MODE_MASK		(0x1 << 0)
+#define RK817_I2S_MODE_SFT		0
+#define RK817_I2S_MODE_MST		(0x1 << 0)
+#define RK817_I2S_MODE_SLV		(0x0 << 0)
+
+/* RK817_CODEC_DDAC_MUTE_MIXCTL */
+#define DACMT_ENABLE			(0x1 << 0)
+#define DACMT_DISABLE			(0x0 << 0)
+
+/* RK817_CODEC_DI2S_RXCR2 */
+#define VDW_RX_24BITS			(0x17)
+#define VDW_RX_16BITS			(0x0f)
+/* RK817_CODEC_DI2S_TXCR2 */
+#define VDW_TX_24BITS			(0x17)
+#define VDW_TX_16BITS			(0x0f)
+
+/* RK817_CODEC_AHP_CFG1 */
+#define HP_ANTIPOP_ENABLE		(0x1 << 4)
+#define HP_ANTIPOP_DISABLE		(0x0 << 4)
+
+/* RK817_CODEC_ADAC_CFG1 */
+#define PWD_DACBIAS_MASK		(0x1 << 3)
+#define PWD_DACBIAS_SFT			3
+#define PWD_DACBIAS_DOWN		(0x1 << 3)
+#define PWD_DACBIAS_ON			(0x0 << 3)
+
+#define PWD_DACD_MASK			(0x1 << 2)
+#define PWD_DACD_SFT			2
+#define PWD_DACD_DOWN			(0x1 << 2)
+#define PWD_DACD_ON			(0x0 << 2)
+
+#define PWD_DACL_MASK			(0x1 << 1)
+#define PWD_DACL_SFT			1
+#define PWD_DACL_DOWN			(0x1 << 1)
+#define PWD_DACL_ON			(0x0 << 1)
+
+#define PWD_DACR_MASK			(0x1 << 0)
+#define PWD_DACR_SFT			0
+#define PWD_DACR_DOWN			(0x1 << 0)
+#define PWD_DACR_ON			(0x0 << 0)
+
+/* RK817_CODEC_AADC_CFG0 */
+#define ADC_L_PWD_MASK			(0x1 << 7)
+#define ADC_L_PWD_SFT			7
+#define ADC_L_PWD_DIS			(0x0 << 7)
+#define ADC_L_PWD_EN			(0x1 << 7)
+
+#define ADC_R_PWD_MASK			(0x1 << 6)
+#define ADC_R_PWD_SFT			6
+#define ADC_R_PWD_DIS			(0x0 << 6)
+#define ADC_R_PWD_EN			(0x1 << 6)
+
+/* RK817_CODEC_AMIC_CFG0 */
+#define MIC_DIFF_MASK			(0x1 << 7)
+#define MIC_DIFF_SFT			7
+#define MIC_DIFF_DIS			(0x0 << 7)
+#define MIC_DIFF_EN			(0x1 << 7)
+
+#define PWD_PGA_L_MASK			(0x1 << 5)
+#define PWD_PGA_L_SFT			5
+#define PWD_PGA_L_DIS			(0x0 << 5)
+#define PWD_PGA_L_EN			(0x1 << 5)
+
+#define PWD_PGA_R_MASK			(0x1 << 4)
+#define PWD_PGA_R_SFT			4
+#define PWD_PGA_R_DIS			(0x0 << 4)
+#define PWD_PGA_R_EN			(0x1 << 4)
+
+enum {
+	RK817_HIFI,
+};
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
+struct rk817_init_bit_typ {
+	unsigned int reg;
+	unsigned int power_bit;
+	unsigned int init_bit;
+};
+
+#endif /* __RK817_CODEC_H__ */
-- 
2.25.1

