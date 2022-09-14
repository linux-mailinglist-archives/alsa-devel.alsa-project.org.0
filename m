Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0445B8684
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 12:40:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B80E1877;
	Wed, 14 Sep 2022 12:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B80E1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663152054;
	bh=na/RhMHgawEk8PazF9ZIXJJv4NOAh4kqBs8u4DFU7Zs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PZ7HDXIpKh2KGNB5xJnG816A1sa9eZe79ybld4fw1U99KazhrpIbEoVFaPOcNoh4o
	 4HhA7EP5cTlG9/ETGiyl49il6qbM5x8jjzPFc299ucZ0j+cUB+6IcpAsY94awqxlgS
	 +0ecn17QMswSMjzoil/wtT4K8joBqjpen5lN8biU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 737D9F804E6;
	Wed, 14 Sep 2022 12:39:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06F31F804E6; Wed, 14 Sep 2022 12:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2044.outbound.protection.outlook.com [40.107.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1871F8014B
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 12:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1871F8014B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpQIDsWSTfoh5jRzpaueIg6er+/0iGEApHgoFsr46zxhWXT2AO+BKK+N88+DPrkBVaO1oP3WHa8DbXYLDMH2zn+ZhKZkBcfE0DIoM0+pej0P2k/Zk4weCvqonyVtKSMN1w68xaTHbDSEFdYGPaQiKo1THvPWJngYzSffwUfe8Kg5NFAdQJmiQosVpmLRrORqqfyXYHrzd/11/uVifdxcsNloAQdUzMgKfG3nNidrY+G5WrxpR1C0+N7b+h87BDjyWM3USdTRz0kaW7dXs+RO+O2sl73YJ5P+zM78GKBm440qG9JH6SBt8UG7bgz9q8S0VSo5Tl7Bs6Wl55YJVKTX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3WbUdgtYpMp27alsJd9Y+nLSUhS2RcOiJPYepRNO4E=;
 b=YahoPLhNMQVZUmnOD44+XsOaFsEdfi0+8/Ca+w/e2hgNa8UnKjQirPBTPqWrPB7yOFTozLhKct77RW9E5I7/IPDvxihq+S3Y8/PvTxUlheOnmbSSb48A0nubJlVXgxHrukmtGIq/Zdk+pMcufrU/DVv7n61g03Hg0VRWrTZOtjj5UQ8mIWXSgCrZHjffBj2qGo+rYtpIxDXAb6YVqydE0/IjUkgZpn1lupa+n/tuSW7jm+wHNf+6T5p29Zx/3L9lnJdK9E4Yd9HqVJoIVB6ELfvglq1wIjBAOsucG/55CmJIjvs4TWZgv5pJxwY/qGOVhwNQkftUBZmIQlt/nY/WOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SLXP216MB0430.KORP216.PROD.OUTLOOK.COM (2603:1096:100:d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Wed, 14 Sep 2022 10:39:19 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:39:19 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Date: Wed, 14 Sep 2022 19:38:53 +0900
Message-Id: <20220914103854.11351-2-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914103854.11351-1-kiseok.jo@irondevice.com>
References: <20220914103854.11351-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0177.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::19) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SLXP216MB0430:EE_
X-MS-Office365-Filtering-Correlation-Id: 6547c9e7-18b9-4150-5d93-08da963d6105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +WozvaGWLFc9NJiiViQxo0g3gj7LMiIk8ahEnUeCxhvIPkE/HJESzGwkycTHfGePOOeDiIHIaU7OG7ktzq7A13K6fpWamp4eeFfoss2/IRil7B+2I+AAFJpaWjpMJZkgJTc3f2eL7j4yeuI4+8OTxZ4QsuU9esADfpfNIdnAvowcvV0PswJgo+igcqhCYtRzwCdHPqfDiVHrUZ5w5Do36Bb8hAljD48ma1A4h6BJo48CfMW6/WLMx9GOea1LzY50IYjmLPCWK+KqBKlniRRR2QomFAONVWliRJDdqYJQkUcqNuQjKHVQAHf9uNMdQDDiwWmCmEvdzUXv7Wdk9K8RZqSEJO/LxStVgXldJQoQ5AFkgrmzGefa1pQtmo8CKUnRWkiLdTxU419uL5aEN/XmuDga0eS/k2L7F5KrlCtwuiPutftIpitHab8krGZ+LSjE1KG4eP3bJ7teUiWp8ljM0SRDsG4StHAB0pyOD3U879STUwASH/+eSyO2LLr3WeYCZzRDMrns3Gku+h6oZKVK9OHcl527HuQzLSD0KMnhfCjbLYrLfeublLm/g6ZCuNm1lNcyG9kZWxHx8Cqkc4k+tuUmPRGKhu9SUhqSZktJaI76c1VldL/XpHp+RpmMjo2GVa89T3X0BwYeDg5S62PzqYOPJsayMdU8kkEtTmzNLH+XES3TPs4M5y31SQhiYhP7xfmK5478+Q/kpodEBq3zhAiRuwDNyZ6bg8bbNRAlGHQfON1R4evgr2W+yros8zB+HmYgWuYonnVy9NMGt8fbJ23TRsHB7nvCG6G8S+kRuCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39840400004)(396003)(376002)(346002)(451199015)(83380400001)(6512007)(4326008)(316002)(66946007)(2616005)(5660300002)(478600001)(38350700002)(6486002)(1076003)(38100700002)(44832011)(30864003)(66556008)(6506007)(107886003)(186003)(26005)(36756003)(6666004)(66476007)(41300700001)(8936002)(110136005)(2906002)(52116002)(86362001)(8676002)(2004002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X0ozV4rjeyiJGo5lCUNk7BTv5h989FM9UdTJcrUy8T3SAKUiJahpN/hhyhqV?=
 =?us-ascii?Q?ey5Bs6zLPSzwEr4Pqp+Hmd/QayggRuHB/riBFbPprrlxpSgC3yuxj9YUwDKb?=
 =?us-ascii?Q?WNie9WrfCy+nHK33+HIl+nAPgvw++sWZPnINAElL/wSFwzvjJIleen9/8M9x?=
 =?us-ascii?Q?ZNO22as2oig42JMa+BinUNzY/E3GGheH9y4ynHyiEHVhHUkkG0tuhkZLcwDI?=
 =?us-ascii?Q?HrU2wmTXHt+BcxbuP4/J+zB5vEFfIF8D7wy0KvuCKwM5DG/U9awQzyipkCwe?=
 =?us-ascii?Q?qHAX/QAZuTtsT9dQrc8V0HX7hurQcKnJ9tZS/jfooYLVId6VhbVUFtISxqF1?=
 =?us-ascii?Q?Bj24QgAb2nj6X6naOojlDpNvdkypAcit7cJd2cNTZbkejCG+G2hSfpHk2fMe?=
 =?us-ascii?Q?1RElAeakmVB4lJRkYwmybgb0/EcxBjI7Rk03PmDmwosiu3DQB1ogBwDnaVF8?=
 =?us-ascii?Q?BI2wnXsAfugNz9JRzSrqUJTMfw3ckxgs0KhuBSiyvo7jJm320F+WqwAuLt97?=
 =?us-ascii?Q?2MA+qFW3OYhDriEuLdkPPsDaq7OuNbCQSzVJzosRutv8vEqnXg2yD+bBuGq+?=
 =?us-ascii?Q?4N5OkLRTEdKD2oziHhNQFf34nielmdnK07+nVGJtDUW1gMkIE9gf1lxa/skl?=
 =?us-ascii?Q?xLhGJ/gVMu9w7TooCH1OInPxCwvf3Q0q3kZ04gUissU75AK0vw6TJhzJBOvh?=
 =?us-ascii?Q?zSjyEpzZ/Z8gRXxBIwLxyc5onvQyFYetwBRD/a464nJT3xwP954N/Dnj30UR?=
 =?us-ascii?Q?u1coMzm9GpzYanxKtQidd3jyMYifMCfy8fTw2eB6rVY0LT6A1xwJS8EGNz1I?=
 =?us-ascii?Q?RZahlYGWSoWpcvy6dyubGmrRGKNad3J5jNiPC+zDmv4CK5AS/Ll+56Dt7k0v?=
 =?us-ascii?Q?q7IfmQPRr/8qy4vQSlusdxwo7gT8+zaCe1OE2yS5QsJikgTpknB4N9jl7ClT?=
 =?us-ascii?Q?vm8XvNFkI6DlLofES+uGfc4E2CCKBYXi0T7hEPKgw55ZkEmaeLCOyyCV+vko?=
 =?us-ascii?Q?wmPHRvjtUHGsck1zU0nVUtq7d0vUMwtxbzIo2occAqU2K8WmgVs9inophdar?=
 =?us-ascii?Q?l7/Z4EygtQGQ0dRX97x52DmjpcYhxl5o+UVfWypA6g/uBrsspigpB3UjTHkb?=
 =?us-ascii?Q?l1OrBG2gAQRRbchGuNvzzchTPKmMKbr7hnjLcuuXryLkw93qElBC8NXQjv6T?=
 =?us-ascii?Q?qoHfI4fnXz0OTFutA/+9wsh1BQxsiHJtsIsYml7sdsu0OquwIYhcJC76I9KS?=
 =?us-ascii?Q?R0bOUcI83feoy1kHch+O1UzumyeeeH0FWoIE+Y1BolYLwsasXH0gFRD1rHyP?=
 =?us-ascii?Q?6e5eHRZcdVW80YCNsM/u86ejsY1Lvf1oPZWvZohrdBydQw8LDdXDqDlO4P1x?=
 =?us-ascii?Q?GGY3TjpP347qmrqBHXxKPh4YG372ZKH5HnTS5WE3DdBptQXk0qPFpwzIqy1f?=
 =?us-ascii?Q?1+072zz8seb78/H+WtOfHy31XZJvrjAwjCdXQSCzDt/2xHocPfdjwUq5vpSJ?=
 =?us-ascii?Q?F3bWZINld1GEzuxP9hCeILv7LD2+WmddI7qk6Aof2bC1fXviU+3OW2SG9gBf?=
 =?us-ascii?Q?5wYJdPOrKgA91M6ssBSEZbYII8N8KMvdJe27IuxW?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6547c9e7-18b9-4150-5d93-08da963d6105
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:39:19.6884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rP2p3toDzLk9QENUc5vt5MzjelHJzqhmt24vB1bVq9xI9XMchgwwNl+KlLsIkbVNNLntM9h/wNsWCq1WvPoGLoL4D1ff1g/qwymvnHXeUX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB0430
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
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

The Iron Device SMA1303 is a boosted Class-D audio amplifier.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reviewed-by: Gyuhwa Park <gyuhwa.park@irondevice.com>
---
 sound/soc/codecs/Kconfig   |    7 +
 sound/soc/codecs/Makefile  |    2 +
 sound/soc/codecs/sma1303.c | 2119 ++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/sma1303.h |  609 +++++++++++
 4 files changed, 2737 insertions(+)
 create mode 100644 sound/soc/codecs/sma1303.c
 create mode 100644 sound/soc/codecs/sma1303.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5926b33ba09e..770bdaf6f04b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -205,6 +205,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_SI476X
 	imply SND_SOC_SIMPLE_AMPLIFIER
 	imply SND_SOC_SIMPLE_MUX
+	imply SND_SOC_SMA1303
 	imply SND_SOC_SPDIF
 	imply SND_SOC_SRC4XXX_I2C
 	imply SND_SOC_SSM2305
@@ -1474,6 +1475,12 @@ config SND_SOC_SIMPLE_MUX
 	tristate "Simple Audio Mux"
 	depends on GPIOLIB
 
+config SND_SOC_SMA1303
+	tristate "Iron Device SMA1303 Audio Amplifier"
+	depends on I2C
+	help
+	  Enable support for Iron Device SMA1303 Boosted Class-D amplifier
+
 config SND_SOC_SPDIF
 	tristate "S/PDIF CODEC"
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 16a01635dd04..5d23277bcdf6 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -230,6 +230,7 @@ snd-soc-sigmadsp-objs := sigmadsp.o
 snd-soc-sigmadsp-i2c-objs := sigmadsp-i2c.o
 snd-soc-sigmadsp-regmap-objs := sigmadsp-regmap.o
 snd-soc-si476x-objs := si476x.o
+snd-soc-sma1303-objs := sma1303.o
 snd-soc-spdif-tx-objs := spdif_transmitter.o
 snd-soc-spdif-rx-objs := spdif_receiver.o
 snd-soc-src4xxx-objs := src4xxx.o
@@ -582,6 +583,7 @@ obj-$(CONFIG_SND_SOC_SIGMADSP)	+= snd-soc-sigmadsp.o
 obj-$(CONFIG_SND_SOC_SIGMADSP_I2C)	+= snd-soc-sigmadsp-i2c.o
 obj-$(CONFIG_SND_SOC_SIGMADSP_REGMAP)	+= snd-soc-sigmadsp-regmap.o
 obj-$(CONFIG_SND_SOC_SI476X)	+= snd-soc-si476x.o
+obj-$(CONFIG_SND_SOC_SMA1303)	+= snd-soc-sma1303.o
 obj-$(CONFIG_SND_SOC_SPDIF)	+= snd-soc-spdif-rx.o snd-soc-spdif-tx.o
 obj-$(CONFIG_SND_SOC_SRC4XXX)	+= snd-soc-src4xxx.o
 obj-$(CONFIG_SND_SOC_SRC4XXX_I2C)	+= snd-soc-src4xxx-i2c.o
diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
new file mode 100644
index 000000000000..03c969a4891e
--- /dev/null
+++ b/sound/soc/codecs/sma1303.c
@@ -0,0 +1,2119 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* sma1303.c -- sma1303 ALSA SoC Audio driver
+ *
+ * Copyright 2022 Iron Device Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/version.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <asm/div64.h>
+
+#include "sma1303.h"
+
+#define CHECK_PERIOD_TIME 1 /* sec per HZ */
+
+#define PLL_MATCH(_input_clk_name, _output_clk_name, _input_clk,\
+		_post_n, _n, _vco,  _p_cp)\
+{\
+	.input_clk_name		= _input_clk_name,\
+	.output_clk_name	= _output_clk_name,\
+	.input_clk		= _input_clk,\
+	.post_n			= _post_n,\
+	.n			= _n,\
+	.vco			= _vco,\
+	.p_cp		= _p_cp,\
+}
+
+enum sma1303_type {
+	SMA1303,
+};
+
+struct sma1303_pll_match {
+	char *input_clk_name;
+	char *output_clk_name;
+	unsigned int input_clk;
+	unsigned int post_n;
+	unsigned int n;
+	unsigned int vco;
+	unsigned int p_cp;
+};
+
+struct sma1303_priv {
+	enum sma1303_type devtype;
+	struct device *dev;
+	struct attribute_group *attr_grp;
+	struct kobject *kobj;
+	struct regmap *regmap;
+	struct sma1303_pll_match *pll_matches;
+	struct mutex lock;
+	struct delayed_work check_fault_work;
+	bool amp_power_status;
+	bool usage_status;
+	int num_of_pll_matches;
+	unsigned int sys_clk_id;
+	unsigned int init_vol;
+	unsigned int cur_vol;
+	unsigned int tdm_slot_rx;
+	unsigned int tdm_slot_tx;
+	unsigned int tsdw_cnt;
+	unsigned int format;
+	unsigned int rev_num;
+	unsigned int last_over_temp;
+	unsigned int last_ocp_val;
+	unsigned int last_bclk;
+	unsigned int frame_size;
+	unsigned int amp_mode;
+	long check_fault_period;
+	long check_fault_status;
+};
+
+static struct sma1303_pll_match sma1303_pll_matches[] = {
+PLL_MATCH("1.411MHz",  "24.595MHz", 1411200,  0x07, 0xF4, 0x8B, 0x03),
+PLL_MATCH("1.536MHz",  "24.576MHz", 1536000,  0x07, 0xE0, 0x8B, 0x03),
+PLL_MATCH("3.072MHz",  "24.576MHz", 3072000,  0x07, 0x70, 0x8B, 0x03),
+PLL_MATCH("6.144MHz",  "24.576MHz", 6144000,  0x07, 0x70, 0x8B, 0x07),
+PLL_MATCH("12.288MHz", "24.576MHz", 12288000, 0x07, 0x70, 0x8B, 0x0B),
+PLL_MATCH("19.2MHz",   "24.343MHz", 19200000, 0x07, 0x47, 0x8B, 0x0A),
+PLL_MATCH("24.576MHz", "24.576MHz", 24576000, 0x07, 0x70, 0x8B, 0x0F),
+};
+
+static int sma1303_startup(struct snd_soc_component *);
+static int sma1303_shutdown(struct snd_soc_component *);
+
+static const struct reg_default sma1303_reg_def[] = {
+	{ 0x00, 0x80 },
+	{ 0x01, 0x00 },
+	{ 0x02, 0x00 },
+	{ 0x03, 0x11 },
+	{ 0x04, 0x17 },
+	{ 0x09, 0x00 },
+	{ 0x0A, 0x31 },
+	{ 0x0B, 0x98 },
+	{ 0x0C, 0x84 },
+	{ 0x0D, 0x07 },
+	{ 0x0E, 0x3F },
+	{ 0x10, 0x00 },
+	{ 0x11, 0x00 },
+	{ 0x12, 0x00 },
+	{ 0x14, 0x5C },
+	{ 0x15, 0x01 },
+	{ 0x16, 0x0F },
+	{ 0x17, 0x0F },
+	{ 0x18, 0x0F },
+	{ 0x19, 0x00 },
+	{ 0x1A, 0x00 },
+	{ 0x1B, 0x00 },
+	{ 0x23, 0x19 },
+	{ 0x24, 0x00 },
+	{ 0x25, 0x00 },
+	{ 0x26, 0x04 },
+	{ 0x33, 0x00 },
+	{ 0x36, 0x92 },
+	{ 0x37, 0x27 },
+	{ 0x3B, 0x5A },
+	{ 0x3C, 0x20 },
+	{ 0x3D, 0x00 },
+	{ 0x3E, 0x03 },
+	{ 0x3F, 0x0C },
+	{ 0x8B, 0x07 },
+	{ 0x8C, 0x70 },
+	{ 0x8D, 0x8B },
+	{ 0x8E, 0x6F },
+	{ 0x8F, 0x03 },
+	{ 0x90, 0x26 },
+	{ 0x91, 0x42 },
+	{ 0x92, 0xE0 },
+	{ 0x94, 0x35 },
+	{ 0x95, 0x0C },
+	{ 0x96, 0x42 },
+	{ 0x97, 0x95 },
+	{ 0xA0, 0x00 },
+	{ 0xA1, 0x3B },
+	{ 0xA2, 0xC8 },
+	{ 0xA3, 0x28 },
+	{ 0xA4, 0x40 },
+	{ 0xA5, 0x01 },
+	{ 0xA6, 0x41 },
+	{ 0xA7, 0x00 },
+};
+
+static bool sma1303_readable_register(struct device *dev, unsigned int reg)
+{
+	bool result;
+
+	if (reg > SMA1303_FF_DEVICE_INDEX)
+		return false;
+
+	switch (reg) {
+	case SMA1303_00_SYSTEM_CTRL ... SMA1303_04_INPUT1_CTRL4:
+	case SMA1303_09_OUTPUT_CTRL ... SMA1303_0E_MUTE_VOL_CTRL:
+	case SMA1303_10_SYSTEM_CTRL1 ... SMA1303_12_SYSTEM_CTRL3:
+	case SMA1303_14_MODULATOR ... SMA1303_1B_BASS_SPK7:
+	case SMA1303_23_COMP_LIM1 ... SMA1303_26_COMP_LIM4:
+	case SMA1303_33_SDM_CTRL ... SMA1303_34_OTP_DATA1:
+	case SMA1303_36_PROTECTION  ... SMA1303_38_OTP_TRM0:
+	case SMA1303_3B_TEST1  ... SMA1303_3F_ATEST2:
+	case SMA1303_8B_PLL_POST_N ... SMA1303_92_FDPEC_CTRL:
+	case SMA1303_94_BOOST_CTRL1 ... SMA1303_97_BOOST_CTRL4:
+	case SMA1303_A0_PAD_CTRL0 ... SMA1303_A7_CLK_MON:
+	case SMA1303_FA_STATUS1 ... SMA1303_FB_STATUS2:
+		result = true;
+		break;
+	case SMA1303_FF_DEVICE_INDEX:
+		result = true;
+		break;
+	default:
+		result = false;
+	}
+	return result;
+}
+
+static bool sma1303_writeable_register(struct device *dev, unsigned int reg)
+{
+	bool result;
+
+	if (reg > SMA1303_FF_DEVICE_INDEX)
+		return false;
+
+	switch (reg) {
+	case SMA1303_00_SYSTEM_CTRL ... SMA1303_04_INPUT1_CTRL4:
+	case SMA1303_09_OUTPUT_CTRL ... SMA1303_0E_MUTE_VOL_CTRL:
+	case SMA1303_10_SYSTEM_CTRL1 ... SMA1303_12_SYSTEM_CTRL3:
+	case SMA1303_14_MODULATOR ... SMA1303_1B_BASS_SPK7:
+	case SMA1303_23_COMP_LIM1 ... SMA1303_26_COMP_LIM4:
+	case SMA1303_33_SDM_CTRL:
+	case SMA1303_36_PROTECTION  ... SMA1303_37_SLOPE_CTRL:
+	case SMA1303_3B_TEST1  ... SMA1303_3F_ATEST2:
+	case SMA1303_8B_PLL_POST_N ... SMA1303_92_FDPEC_CTRL:
+	case SMA1303_94_BOOST_CTRL1 ... SMA1303_97_BOOST_CTRL4:
+	case SMA1303_A0_PAD_CTRL0 ... SMA1303_A7_CLK_MON:
+		result = true;
+		break;
+	default:
+		result = false;
+	}
+	return result;
+}
+
+static bool sma1303_volatile_register(struct device *dev, unsigned int reg)
+{
+	bool result;
+
+	switch (reg) {
+	case SMA1303_FA_STATUS1 ... SMA1303_FB_STATUS2:
+		result = true;
+		break;
+	case SMA1303_FF_DEVICE_INDEX:
+		result = true;
+		break;
+	default:
+		result = false;
+	}
+	return result;
+}
+
+static const DECLARE_TLV_DB_SCALE(sma1303_spk_tlv, -6000, 50, 0);
+
+static int sma1303_regmap_write(struct regmap *map, struct device *dev,
+				unsigned int reg, unsigned int val)
+{
+	int ret = 0;
+
+	ret = regmap_write(map, reg, val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
+			       reg, ret);
+	}
+	return ret;
+}
+
+static int sma1303_regmap_update_bits(struct regmap *map, struct device *dev,
+		unsigned int reg, unsigned int mask, unsigned int val)
+{
+	int ret = 0;
+
+	ret = regmap_update_bits(map, reg, mask, val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
+			       reg, ret);
+	}
+	return ret;
+}
+
+static int bytes_ext_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol, int reg)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
+	unsigned int i, reg_val;
+	u8 *val;
+	int ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+	val = (u8 *)ucontrol->value.bytes.data;
+	for (i = 0; i < params->max; i++) {
+		ret = regmap_read(sma1303->regmap, reg + i, &reg_val);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"Failed to read, register: %x ret: %d\n",
+				reg + i, ret);
+			return ret;
+		}
+		if (sizeof(reg_val) > 2)
+			reg_val = cpu_to_le32(reg_val);
+		else
+			reg_val = cpu_to_le16(reg_val);
+		memcpy(val + i, &reg_val, sizeof(u8));
+	}
+
+	return 0;
+}
+
+static int bytes_ext_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol, int reg)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
+	void *data;
+	u8 *val;
+	int i, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+	data = kmemdup(ucontrol->value.bytes.data,
+			params->max, GFP_KERNEL | GFP_DMA);
+	if (!data)
+		return -ENOMEM;
+
+	val = (u8 *)data;
+	for (i = 0; i < params->max; i++) {
+		ret = sma1303_regmap_write(
+				sma1303->regmap, component->dev,
+				reg + i, *(val + i));
+		if (ret < 0) {
+			kfree(data);
+			return ret;
+		}
+	}
+	kfree(data);
+
+	return 0;
+}
+
+static int amp_usage_status_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+	ucontrol->value.integer.value[0] = sma1303->usage_status;
+
+	if (sma1303->usage_status)
+		dev_info(component->dev, "Amplifier Power Control Enabled\n");
+	else
+		dev_info(component->dev, "Amplifier Power Control Disabled\n");
+
+	return 0;
+}
+
+static int amp_usage_status_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	if ((sma1303->usage_status
+			!= ucontrol->value.integer.value[0])
+			&& (!ucontrol->value.integer.value[0])) {
+		dev_info(component->dev, "%s\n", "Force AMP Power Down");
+		ret = sma1303_shutdown(component);
+		if (ret < 0) {
+			ucontrol->value.integer.value[0]
+			       = sma1303->usage_status;
+			return ret;
+		}
+
+	}
+	sma1303->usage_status = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static const char * const sma1303_amp_mode_text[] = {
+	"1 Chip", "Mono on 2 chips", "Left in 2 chips", "Right in 2chips"};
+
+static const struct soc_enum sma1303_amp_mode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_amp_mode_text),
+			sma1303_amp_mode_text);
+static int sma1303_amp_mode_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+	ucontrol->value.integer.value[0] = sma1303->amp_mode;
+
+	switch (sma1303->amp_mode) {
+	case ONE_CHIP_SOLUTION:
+		dev_info(component->dev, "Amplifier 1 Chip Solution\n");
+		break;
+	case MONO_TWO_CHIP_SOLUTION:
+		dev_info(component->dev, "Amplifier Mono 2 Chips Solution\n");
+		break;
+	case LEFT_TWO_CHIP_SOLUTION:
+		dev_info(component->dev, "Amplifier Stereo(Left) 2 Chips Solution\n");
+		break;
+	case RIGHT_TWO_CHIP_SOLUTION:
+		dev_info(component->dev, "Amplifier Stereo(Right) 2 Chips Solution\n");
+		break;
+	default:
+		dev_err(component->dev, "Invalid Value");
+		return ret;
+	}
+	return 0;
+
+}
+
+static int sma1303_amp_mode_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return -1;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return -1;
+	}
+
+	sma1303->amp_mode = ucontrol->value.integer.value[0];
+
+	switch (sma1303->amp_mode) {
+	case ONE_CHIP_SOLUTION:
+	case MONO_TWO_CHIP_SOLUTION:
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				MONOMIX_MASK, MONOMIX_ON);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
+		break;
+	case LEFT_TWO_CHIP_SOLUTION:
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				MONOMIX_MASK, MONOMIX_OFF);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
+		break;
+	case RIGHT_TWO_CHIP_SOLUTION:
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				MONOMIX_MASK, MONOMIX_OFF);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				LR_DATA_SW_MASK, LR_DATA_SW_SWAP);
+		break;
+	default:
+		dev_err(component->dev, "Invalid Value");
+		ret += -1;
+	}
+
+	return ret;
+}
+
+static const char * const sma1303_outport_config_text[] = {
+	"Enable", "Disable"};
+
+static const struct soc_enum sma1303_outport_config_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_outport_config_text),
+			sma1303_outport_config_text);
+
+static int sma1303_outport_config_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = -1, data, val;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	ret = regmap_read(sma1303->regmap, SMA1303_09_OUTPUT_CTRL, &data);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"Failed to read, register: %x ret: %d\n",
+				SMA1303_09_OUTPUT_CTRL, ret);
+		return ret;
+	}
+
+	val = data & PORT_CONFIG_MASK;
+	switch (val) {
+	case INPUT_PORT_ONLY:
+		ucontrol->value.integer.value[0] = 1;
+		break;
+	case OUTPUT_PORT_ENABLE:
+		ucontrol->value.integer.value[0] = 0;
+		break;
+	default:
+		dev_err(component->dev,
+				"Invalid value, register: %x value: %d\n",
+					SMA1303_09_OUTPUT_CTRL, val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sma1303_outport_config_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int sel = (int)ucontrol->value.integer.value[0];
+	int val, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	switch (sel) {
+	case 0:
+		val = OUTPUT_PORT_ENABLE;
+		break;
+	case 1:
+		val = INPUT_PORT_ONLY;
+		break;
+	default:
+		dev_err(component->dev,
+				"Invalid value, register: %x\n",
+					SMA1303_09_OUTPUT_CTRL);
+		return ret;
+	}
+
+	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_09_OUTPUT_CTRL, PORT_CONFIG_MASK, val);
+}
+
+static const char * const sma1303_spkmute_text[] = {
+	"Unmute", "Mute"};
+
+static const struct soc_enum sma1303_spkmute_enum =
+	SOC_ENUM_SINGLE(SMA1303_0E_MUTE_VOL_CTRL, 0,
+			ARRAY_SIZE(sma1303_spkmute_text),
+			sma1303_spkmute_text);
+
+static const char * const sma1303_spkmode_text[] = {
+	"Off", "On"};
+
+static const struct soc_enum sma1303_spkmode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spkmode_text),
+	sma1303_spkmode_text);
+
+static int sma1303_spkmode_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int val, data, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	ret = regmap_read(sma1303->regmap, SMA1303_10_SYSTEM_CTRL1, &data);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"Failed to read, register: %x ret: %d\n",
+				SMA1303_10_SYSTEM_CTRL1, ret);
+		return ret;
+	}
+
+	val = data & SPK_MODE_MASK;
+	if (sma1303->amp_mode == ONE_CHIP_SOLUTION) {
+		switch (val) {
+		case SPK_OFF:
+			ucontrol->value.integer.value[0] = 0;
+			break;
+		case SPK_MONO:
+			ucontrol->value.integer.value[0] = 1;
+			break;
+		default:
+			dev_err(component->dev,
+				"Invalid value, register: %x\n",
+					SMA1303_10_SYSTEM_CTRL1);
+			return ret;
+		}
+	} else {
+		switch (val) {
+		case SPK_OFF:
+			ucontrol->value.integer.value[0] = 0;
+			break;
+		case SPK_STEREO:
+			ucontrol->value.integer.value[0] = 1;
+			break;
+		default:
+			dev_err(component->dev,
+				"Invalid value, register: %x\n",
+					SMA1303_10_SYSTEM_CTRL1);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int sma1303_spkmode_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int sel = (int)ucontrol->value.integer.value[0];
+	int val, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	switch (sel) {
+	case 0:
+		val = SPK_OFF;
+		break;
+	case 1:
+		if (sma1303->amp_mode == ONE_CHIP_SOLUTION)
+			val = SPK_MONO;
+		else
+			val = SPK_STEREO;
+		break;
+	default:
+		dev_err(component->dev,
+			"Invalid value, register: %x\n",
+				SMA1303_10_SYSTEM_CTRL1);
+		return ret;
+	}
+
+	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, val);
+}
+
+static int postscaler_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	return bytes_ext_get(kcontrol, ucontrol, SMA1303_90_POSTSCALER);
+}
+
+static int postscaler_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	return bytes_ext_put(kcontrol, ucontrol, SMA1303_90_POSTSCALER);
+}
+
+static const char * const sma1303_postscaler_config_text[] = {
+	"Enable", "Disable"};
+
+static const struct soc_enum sma1303_postscaler_config_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_postscaler_config_text),
+			sma1303_postscaler_config_text);
+
+static int sma1303_postscaler_config_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = -1, data, val;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	ret = regmap_read(sma1303->regmap, SMA1303_90_POSTSCALER, &data);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"Failed to read, register: %x ret: %d\n",
+				SMA1303_90_POSTSCALER, ret);
+		return ret;
+	}
+
+	val = data & BYP_POST_MASK;
+	switch (val) {
+	case BYP_POST_SCALER:
+		ucontrol->value.integer.value[0] = 1;
+		break;
+	case EN_POST_SCALER:
+		ucontrol->value.integer.value[0] = 0;
+		break;
+	default:
+		dev_err(component->dev,
+				"Invalid value, register: %x value: %d\n",
+					SMA1303_90_POSTSCALER, val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sma1303_postscaler_config_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int sel = (int)ucontrol->value.integer.value[0];
+	int val, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	switch (sel) {
+	case 0:
+		val = EN_POST_SCALER;
+		break;
+	case 1:
+		val = BYP_POST_SCALER;
+		break;
+	default:
+		dev_err(component->dev,
+				"Invalid value, register: %x\n",
+					SMA1303_90_POSTSCALER);
+		return ret;
+	}
+
+	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_90_POSTSCALER, BYP_POST_MASK, val);
+}
+
+static const char * const sma1303_o_format_text[] = {
+	"LJ", "I2S", "TDM"};
+
+static const struct soc_enum sma1303_o_format_enum =
+SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_o_format_text), sma1303_o_format_text);
+
+static int sma1303_o_format_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int val, data, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	ret = regmap_read(sma1303->regmap, SMA1303_A4_TOP_MAN3, &data);
+	val = data & O_FORMAT_MASK;
+	switch (val) {
+	case O_FMT_LJ:
+		ucontrol->value.integer.value[0] = 0;
+		break;
+	case O_FMT_I2S:
+		ucontrol->value.integer.value[0] = 1;
+		break;
+	case O_FMT_TDM:
+		ucontrol->value.integer.value[0] = 2;
+		break;
+	default:
+		dev_err(component->dev,
+			"Invalid value, register: %x\n",
+				SMA1303_A4_TOP_MAN3);
+		return ret;
+	}
+
+	return 0;
+}
+static int sma1303_o_format_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int sel = (int)ucontrol->value.integer.value[0];
+	int val, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	switch (sel) {
+	case 0:
+		val = O_FMT_LJ;
+		break;
+	case 1:
+		val = O_FMT_I2S;
+		break;
+	case 2:
+		val = O_FMT_TDM;
+		break;
+	default:
+		dev_err(component->dev,
+			"Invalid value, register: %x\n",
+				SMA1303_A4_TOP_MAN3);
+		return ret;
+	}
+
+	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_A4_TOP_MAN3, O_FORMAT_MASK, val);
+}
+
+static const char * const sma1303_sdo_source_texts[] = {
+	"Disable", "Format_C", "Mixer_Out", "After_DSP", "After_Post"};
+static const unsigned int sma1303_sdo_source_values[] = {
+	OUT_SEL_DISABLE,
+	FORMAT_CONVERTER,
+	MIXER_OUTPUT,
+	SPEAKER_PATH,
+	POSTSCALER_OUTPUT};
+static SOC_VALUE_ENUM_SINGLE_DECL(sma1303_sdo_source_enum,
+		SMA1303_09_OUTPUT_CTRL,
+		0, PORT_OUT_SEL_MASK,
+		sma1303_sdo_source_texts,
+		sma1303_sdo_source_values);
+static const struct snd_kcontrol_new sma1303_sdo_source_mux =
+	SOC_DAPM_ENUM("SDO Source", sma1303_sdo_source_enum);
+
+static const struct snd_kcontrol_new sma1303_snd_controls[] = {
+SOC_SINGLE_EXT("Amplifier Usage", SND_SOC_NOPM, 0, 1, 0,
+	amp_usage_status_get, amp_usage_status_put),
+SOC_ENUM_EXT("Amplifier Mode", sma1303_amp_mode_enum,
+	sma1303_amp_mode_get, sma1303_amp_mode_put),
+SOC_ENUM_EXT("Outport config", sma1303_outport_config_enum,
+	sma1303_outport_config_get, sma1303_outport_config_put),
+SOC_SINGLE_TLV("Speaker Volume", SMA1303_0A_SPK_VOL,
+		0, 167, 1, sma1303_spk_tlv),
+SOC_ENUM("Speaker Mute Switch", sma1303_spkmute_enum),
+SOC_ENUM_EXT("Speaker Output", sma1303_spkmode_enum,
+	sma1303_spkmode_get, sma1303_spkmode_put),
+SND_SOC_BYTES_EXT("Postscaler Set", 1,
+		postscaler_get, postscaler_put),
+SOC_ENUM_EXT("Postscaler Config", sma1303_postscaler_config_enum,
+	sma1303_postscaler_config_get, sma1303_postscaler_config_put),
+SOC_ENUM_EXT("Output Format", sma1303_o_format_enum,
+	sma1303_o_format_get, sma1303_o_format_put),
+};
+
+static int sma1303_startup(struct snd_soc_component *component)
+{
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	if (sma1303->amp_power_status) {
+		dev_info(component->dev, "%s : %s\n",
+			__func__, "Already AMP Power on");
+		return ret;
+	}
+
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_OPERATION2);
+
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_ON);
+
+	if (sma1303->amp_mode == ONE_CHIP_SOLUTION)
+		ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_MONO);
+	else
+		ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_STEREO);
+
+	if (sma1303->check_fault_status) {
+		if (sma1303->check_fault_period > 0)
+			queue_delayed_work(system_freezable_wq,
+				&sma1303->check_fault_work,
+					sma1303->check_fault_period * HZ);
+		else
+			queue_delayed_work(system_freezable_wq,
+				&sma1303->check_fault_work,
+					CHECK_PERIOD_TIME * HZ);
+	}
+
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_UNMUTE);
+
+	sma1303->amp_power_status = true;
+
+	return ret;
+}
+
+static int sma1303_shutdown(struct snd_soc_component *component)
+{
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	if (!(sma1303->amp_power_status)) {
+		dev_info(component->dev, "%s : %s\n",
+			__func__, "Already AMP Shutdown");
+		return ret;
+	}
+
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_MUTE);
+
+	cancel_delayed_work_sync(&sma1303->check_fault_work);
+
+	msleep(55);
+
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_OFF);
+
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_OFF);
+
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_PD2);
+
+	sma1303->amp_power_status = false;
+
+	return ret;
+}
+
+static int sma1303_clk_supply_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dev_info(component->dev, "%s : PRE_PMU\n", __func__);
+	break;
+
+	case SND_SOC_DAPM_POST_PMD:
+		dev_info(component->dev, "%s : POST_PMD\n", __func__);
+	break;
+	}
+
+	return 0;
+}
+
+static int sma1303_dac_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dev_info(component->dev, "%s : PRE_PMU\n", __func__);
+
+		if (sma1303->usage_status)
+			sma1303_startup(component);
+
+		break;
+
+	case SND_SOC_DAPM_POST_PMU:
+		dev_info(component->dev, "%s : POST_PMU\n", __func__);
+
+		break;
+
+	case SND_SOC_DAPM_PRE_PMD:
+		dev_info(component->dev, "%s : PRE_PMD\n", __func__);
+
+		sma1303_shutdown(component);
+
+		break;
+
+	case SND_SOC_DAPM_POST_PMD:
+		dev_info(component->dev, "%s : POST_PMD\n", __func__);
+
+		break;
+	}
+
+	return 0;
+}
+
+static int sma1303_dac_feedback_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dev_info(component->dev,
+				"%s : DAC feedback ON\n", __func__);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_09_OUTPUT_CTRL,
+				PORT_CONFIG_MASK|PORT_OUT_SEL_MASK,
+				OUTPUT_PORT_ENABLE|SPEAKER_PATH);
+
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A3_TOP_MAN2,
+				SDO_OUTPUT_MASK, NORMAL_OUT);
+		break;
+
+	case SND_SOC_DAPM_PRE_PMD:
+		dev_info(component->dev,
+				"%s : DAC feedback OFF\n", __func__);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_09_OUTPUT_CTRL,
+				PORT_OUT_SEL_MASK, OUT_SEL_DISABLE);
+
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A3_TOP_MAN2, SDO_OUTPUT_MASK,
+				HIGH_Z_OUT);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
+SND_SOC_DAPM_SUPPLY("CLK_SUPPLY", SND_SOC_NOPM, 0, 0, sma1303_clk_supply_event,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+SND_SOC_DAPM_DAC_E("DAC", "Playback", SND_SOC_NOPM, 0, 0, sma1303_dac_event,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+				SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+SND_SOC_DAPM_ADC_E("DAC_FEEDBACK", "Capture", SND_SOC_NOPM, 0, 0,
+				sma1303_dac_feedback_event,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+SND_SOC_DAPM_OUTPUT("SPK"),
+SND_SOC_DAPM_INPUT("SDO"),
+SND_SOC_DAPM_MUX("SDO Source", SND_SOC_NOPM, 0, 0, &sma1303_sdo_source_mux),
+};
+
+static const struct snd_soc_dapm_route sma1303_audio_map[] = {
+{"DAC", NULL, "CLK_SUPPLY"},
+{"SPK", NULL, "DAC"},
+{"SDO Source", "Disable", "SDO"},
+{"SDO Source", "Format_C", "SDO"},
+{"SDO Source", "Mixer_Out", "SDO"},
+{"SDO Source", "After_DSP", "SDO"},
+{"SDO Source", "After_Post", "SDO"},
+{"DAC_FEEDBACK", NULL, "SDO Source"},
+};
+
+static int sma1303_setup_pll(struct snd_soc_component *component,
+		unsigned int bclk)
+{
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+
+	int i = 0, ret = 0;
+
+	dev_info(component->dev, "%s : BCLK = %dHz\n",
+		__func__, bclk);
+
+	if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK) {
+		dev_info(component->dev, "%s : MCLK is not supported\n",
+		__func__);
+	} else if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
+		for (i = 0; i < sma1303->num_of_pll_matches; i++) {
+			if (sma1303->pll_matches[i].input_clk == bclk)
+				break;
+		}
+		if (i == sma1303->num_of_pll_matches) {
+			dev_info(component->dev, "%s : No matching value between pll table and SCK\n",
+					__func__);
+			return -EINVAL;
+		}
+
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A2_TOP_MAN1,
+				PLL_PD_MASK|PLL_REF_CLK_MASK,
+				PLL_OPERATION|PLL_SCK);
+	}
+
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_8B_PLL_POST_N,
+			sma1303->pll_matches[i].post_n);
+
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_8C_PLL_N,
+			sma1303->pll_matches[i].n);
+
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_8D_PLL_A_SETTING,
+			sma1303->pll_matches[i].vco);
+
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_8F_PLL_P_CP,
+			sma1303->pll_matches[i].p_cp);
+
+	return ret;
+}
+
+static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
+		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	unsigned int input_format = 0;
+	unsigned int bclk = 0;
+	int ret = 0;
+
+	if (sma1303->format == SND_SOC_DAIFMT_DSP_A)
+		bclk = params_rate(params) * sma1303->frame_size;
+	else
+		bclk = params_rate(params) * params_physical_width(params)
+			* params_channels(params);
+
+	dev_info(component->dev,
+			"%s : rate = %d : bit size = %d : channel = %d\n",
+			__func__, params_rate(params), params_width(params),
+			params_channels(params));
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+
+		if (sma1303->usage_status &&
+			(sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
+			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK)) {
+
+			if (sma1303->last_bclk != bclk) {
+				if (sma1303->amp_power_status) {
+					sma1303_shutdown(component);
+					sma1303_setup_pll(component, bclk);
+					sma1303_startup(component);
+				} else
+					sma1303_setup_pll(component, bclk);
+
+				sma1303->last_bclk = bclk;
+			}
+		}
+
+		switch (params_rate(params)) {
+		case 8000:
+		case 12000:
+		case 16000:
+		case 24000:
+		case 32000:
+		case 44100:
+		case 48000:
+		case 96000:
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A2_TOP_MAN1,
+				DAC_DN_CONV_MASK, DAC_DN_CONV_DISABLE);
+
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				LEFTPOL_MASK, LOW_FIRST_CH);
+		break;
+
+		case 192000:
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A2_TOP_MAN1,
+				DAC_DN_CONV_MASK, DAC_DN_CONV_ENABLE);
+
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				LEFTPOL_MASK, HIGH_FIRST_CH);
+		break;
+
+		default:
+			dev_err(component->dev, "%s not support rate : %d\n",
+				__func__, params_rate(params));
+
+			return -EINVAL;
+		}
+
+	} else {
+
+		switch (params_format(params)) {
+
+		case SNDRV_PCM_FORMAT_S16_LE:
+			dev_info(component->dev,
+				"%s set format SNDRV_PCM_FORMAT_S16_LE\n",
+				__func__);
+			ret += sma1303_regmap_update_bits(
+					sma1303->regmap, component->dev,
+					SMA1303_A4_TOP_MAN3,
+					SCK_RATE_MASK, SCK_32FS);
+			break;
+
+		case SNDRV_PCM_FORMAT_S24_LE:
+			dev_info(component->dev,
+				"%s set format SNDRV_PCM_FORMAT_S24_LE\n",
+				__func__);
+			ret += sma1303_regmap_update_bits(
+					sma1303->regmap, component->dev,
+					SMA1303_A4_TOP_MAN3,
+					SCK_RATE_MASK, SCK_64FS);
+			break;
+		case SNDRV_PCM_FORMAT_S32_LE:
+			dev_info(component->dev,
+				"%s set format SNDRV_PCM_FORMAT_S32_LE\n",
+				__func__);
+			ret += sma1303_regmap_update_bits(
+					sma1303->regmap, component->dev,
+					SMA1303_A4_TOP_MAN3,
+					SCK_RATE_MASK, SCK_64FS);
+			break;
+		default:
+			dev_err(component->dev,
+				"%s not support data bit : %d\n", __func__,
+						params_format(params));
+			return -EINVAL;
+		}
+	}
+
+	switch (params_width(params)) {
+	case 16:
+		switch (sma1303->format) {
+		case SND_SOC_DAIFMT_I2S:
+			input_format |= STANDARD_I2S;
+			break;
+		case SND_SOC_DAIFMT_LEFT_J:
+			input_format |= LJ;
+			break;
+		case SND_SOC_DAIFMT_RIGHT_J:
+			input_format |= RJ_16BIT;
+			break;
+		}
+		break;
+	case 24:
+	case 32:
+		switch (sma1303->format) {
+		case SND_SOC_DAIFMT_I2S:
+			input_format |= STANDARD_I2S;
+			break;
+		case SND_SOC_DAIFMT_LEFT_J:
+			input_format |= LJ;
+			break;
+		case SND_SOC_DAIFMT_RIGHT_J:
+			input_format |= RJ_24BIT;
+			break;
+		}
+		break;
+
+	default:
+		dev_err(component->dev,
+			"%s not support data bit : %d\n", __func__,
+					params_format(params));
+		return -EINVAL;
+	}
+
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_01_INPUT1_CTRL1,
+			I2S_MODE_MASK, input_format);
+	return ret;
+}
+
+static int sma1303_dai_set_sysclk_amp(struct snd_soc_dai *dai,
+				int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+
+	switch (clk_id) {
+	case SMA1303_EXTERNAL_CLOCK_19_2:
+		break;
+	case SMA1303_EXTERNAL_CLOCK_24_576:
+		break;
+	case SMA1303_PLL_CLKIN_MCLK:
+		break;
+	case SMA1303_PLL_CLKIN_BCLK:
+		break;
+	default:
+		dev_err(component->dev, "Invalid clk id: %d\n", clk_id);
+		return -EINVAL;
+	}
+	sma1303->sys_clk_id = clk_id;
+	return 0;
+}
+
+static int sma1303_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+		return ret;
+
+	if (!(sma1303->amp_power_status)) {
+		dev_info(component->dev, "%s : %s\n",
+			__func__, "Already AMP Shutdown");
+		return ret;
+	}
+
+	if (mute) {
+		dev_info(component->dev, "%s : %s\n", __func__, "MUTE");
+
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_0E_MUTE_VOL_CTRL,
+				SPK_MUTE_MASK, SPK_MUTE);
+	} else {
+		dev_info(component->dev, "%s : %s\n", __func__, "UNMUTE");
+
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_0E_MUTE_VOL_CTRL,
+				SPK_MUTE_MASK, SPK_UNMUTE);
+	}
+
+	return ret;
+}
+
+static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
+					unsigned int fmt)
+{
+	struct snd_soc_component *component  = dai->component;
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+
+	case SND_SOC_DAIFMT_CBS_CFS:
+		dev_info(component->dev,
+				"%s : %s\n", __func__, "I2S/TDM Device mode");
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				CONTROLLER_DEVICE_MASK, DEVICE_MODE);
+		break;
+
+	case SND_SOC_DAIFMT_CBM_CFM:
+		dev_info(component->dev,
+			"%s : %s\n", __func__, "I2S/TDM Controller mode");
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				CONTROLLER_DEVICE_MASK, CONTROLLER_MODE);
+		break;
+
+	default:
+		dev_err(component->dev,
+			"Unsupported Controller/Device : 0x%x\n", fmt);
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+
+	case SND_SOC_DAIFMT_I2S:
+	case SND_SOC_DAIFMT_RIGHT_J:
+	case SND_SOC_DAIFMT_LEFT_J:
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
+		sma1303->format = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
+		break;
+	default:
+		dev_err(component->dev,
+			"Unsupported Audio Interface Format : 0x%x\n", fmt);
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+
+	case SND_SOC_DAIFMT_IB_NF:
+		dev_info(component->dev, "%s : %s\n",
+			__func__, "Invert BCLK + Normal Frame");
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				SCK_RISING_MASK, SCK_RISING_EDGE);
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		dev_info(component->dev, "%s : %s\n",
+			__func__, "Invert BCLK + Invert Frame");
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				LEFTPOL_MASK|SCK_RISING_MASK,
+				HIGH_FIRST_CH|SCK_RISING_EDGE);
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		dev_info(component->dev, "%s : %s\n",
+			__func__, "Normal BCLK + Invert Frame");
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				LEFTPOL_MASK, HIGH_FIRST_CH);
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		dev_info(component->dev, "%s : %s\n",
+			__func__, "Normal BCLK + Normal Frame");
+		break;
+	default:
+		dev_err(component->dev,
+				"Unsupported Bit & Frameclock : 0x%x\n", fmt);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
+				unsigned int tx_mask, unsigned int rx_mask,
+				int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	dev_info(component->dev, "%s : slots = %d, slot_width - %d\n",
+			__func__, slots, slot_width);
+
+	sma1303->frame_size = slot_width * slots;
+
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A4_TOP_MAN3,
+			O_FORMAT_MASK, O_FMT_TDM);
+
+	switch (slot_width) {
+	case 16:
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A6_TDM2,
+			TDM_DL_MASK, TDM_DL_16);
+	break;
+	case 32:
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A6_TDM2,
+			TDM_DL_MASK, TDM_DL_32);
+	break;
+	default:
+	dev_err(component->dev, "%s not support TDM %d slot_width\n",
+				__func__, slot_width);
+	}
+
+	switch (slots) {
+	case 4:
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A6_TDM2,
+			TDM_N_SLOT_MASK, TDM_N_SLOT_4);
+	break;
+	case 8:
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A6_TDM2,
+			TDM_N_SLOT_MASK, TDM_N_SLOT_8);
+	break;
+	default:
+	dev_err(component->dev, "%s not support TDM %d slots\n",
+				__func__, slots);
+	}
+
+	if (sma1303->tdm_slot_rx < slots)
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A5_TDM1, TDM_SLOT1_RX_POS_MASK,
+				(sma1303->tdm_slot_rx) << 3);
+	else
+		dev_err(component->dev, "%s Incorrect tdm-slot-rx %d set\n",
+				__func__, sma1303->tdm_slot_rx);
+
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A5_TDM1,
+			TDM_CLK_POL_MASK, TDM_CLK_POL_RISE);
+
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A5_TDM1,
+			TDM_TX_MODE_MASK, TDM_TX_MONO);
+
+	if (sma1303->tdm_slot_tx < slots)
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A6_TDM2, TDM_SLOT1_TX_POS_MASK,
+				(sma1303->tdm_slot_tx) << 3);
+	else
+		dev_err(component->dev, "%s Incorrect tdm-slot-tx %d set\n",
+				__func__, sma1303->tdm_slot_tx);
+
+	return ret;
+}
+
+static const struct snd_soc_dai_ops sma1303_dai_ops_amp = {
+	.set_sysclk = sma1303_dai_set_sysclk_amp,
+	.set_fmt = sma1303_dai_set_fmt_amp,
+	.hw_params = sma1303_dai_hw_params_amp,
+	.mute_stream = sma1303_dai_mute,
+	.set_tdm_slot = sma1303_dai_set_tdm_slot,
+};
+
+#define SMA1303_RATES SNDRV_PCM_RATE_8000_192000
+#define SMA1303_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+		SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver sma1303_dai[] = {
+{
+	.name = "sma1303-amplifier",
+	.id = 0,
+	.playback = {
+	.stream_name = "Playback",
+	.channels_min = 1,
+	.channels_max = 2,
+	.rates = SMA1303_RATES,
+	.formats = SMA1303_FORMATS,
+	},
+	.capture = {
+	.stream_name = "Capture",
+	.channels_min = 1,
+	.channels_max = 2,
+	.rates = SMA1303_RATES,
+	.formats = SMA1303_FORMATS,
+	},
+	.ops = &sma1303_dai_ops_amp,
+}
+};
+
+static void sma1303_check_fault_worker(struct work_struct *work)
+{
+	struct sma1303_priv *sma1303 =
+		container_of(work, struct sma1303_priv, check_fault_work.work);
+	int ret = 0;
+	unsigned int over_temp, ocp_val, uvlo_val;
+
+	mutex_lock(&sma1303->lock);
+
+	if (sma1303->tsdw_cnt)
+		ret = regmap_read(sma1303->regmap,
+			SMA1303_0A_SPK_VOL, &sma1303->cur_vol);
+	else
+		ret = regmap_read(sma1303->regmap,
+			SMA1303_0A_SPK_VOL, &sma1303->init_vol);
+
+	if (ret != 0) {
+		dev_err(sma1303->dev,
+			"failed to read SMA1303_0A_SPK_VOL : %d\n", ret);
+		mutex_unlock(&sma1303->lock);
+		return;
+	}
+
+	ret = regmap_read(sma1303->regmap, SMA1303_FA_STATUS1, &over_temp);
+	if (ret != 0) {
+		dev_err(sma1303->dev,
+			"failed to read SMA1303_FA_STATUS1 : %d\n", ret);
+		mutex_unlock(&sma1303->lock);
+		return;
+	}
+
+	ret = regmap_read(sma1303->regmap, SMA1303_FB_STATUS2, &ocp_val);
+	if (ret != 0) {
+		dev_err(sma1303->dev,
+			"failed to read SMA1303_FB_STATUS2 : %d\n", ret);
+		mutex_unlock(&sma1303->lock);
+		return;
+	}
+
+	ret = regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &uvlo_val);
+	if (ret != 0) {
+		dev_err(sma1303->dev,
+			"failed to read SMA1303_FF_DEVICE_INDEX : %d\n", ret);
+		mutex_unlock(&sma1303->lock);
+		return;
+	}
+
+	if (~over_temp & OT1_OK_STATUS) {
+		dev_crit(sma1303->dev,
+			"%s : OT1(Over Temperature Level 1)\n", __func__);
+
+		if ((sma1303->cur_vol + 6) <= 0xFF)
+			sma1303_regmap_write(
+				sma1303->regmap, sma1303->dev,
+				SMA1303_0A_SPK_VOL, sma1303->cur_vol + 6);
+
+		sma1303->tsdw_cnt++;
+	} else if (sma1303->tsdw_cnt) {
+		sma1303_regmap_write(
+				sma1303->regmap, sma1303->dev,
+				SMA1303_0A_SPK_VOL, sma1303->init_vol);
+		sma1303->tsdw_cnt = 0;
+		sma1303->cur_vol = sma1303->init_vol;
+	}
+
+	if (~over_temp & OT2_OK_STATUS) {
+		dev_crit(sma1303->dev,
+			"%s : OT2(Over Temperature Level 2)\n", __func__);
+	}
+	if (ocp_val & OCP_SPK_STATUS) {
+		dev_crit(sma1303->dev,
+			"%s : OCP_SPK(Over Current Protect SPK)\n", __func__);
+	}
+	if (ocp_val & OCP_BST_STATUS) {
+		dev_crit(sma1303->dev,
+			"%s : OCP_BST(Over Current Protect Boost)\n", __func__);
+	}
+	if ((ocp_val & CLK_MON_STATUS) && (sma1303->amp_power_status)) {
+		dev_crit(sma1303->dev,
+			"%s : CLK_FAULT(No clock input)\n", __func__);
+	}
+	if (uvlo_val & UVLO_BST_STATUS) {
+		dev_crit(sma1303->dev,
+			"%s : UVLO(Under Voltage Lock Out)\n", __func__);
+	}
+
+	if ((over_temp != sma1303->last_over_temp) ||
+		(ocp_val != sma1303->last_ocp_val)) {
+
+		dev_crit(sma1303->dev, "Please check AMP status");
+		dev_info(sma1303->dev, "STATUS1=0x%02X : STATUS2=0x%02X\n",
+				over_temp, ocp_val);
+		sma1303->last_over_temp = over_temp;
+		sma1303->last_ocp_val = ocp_val;
+	}
+
+	if (sma1303->check_fault_status) {
+		if (sma1303->check_fault_period > 0)
+			queue_delayed_work(system_freezable_wq,
+				&sma1303->check_fault_work,
+					sma1303->check_fault_period * HZ);
+		else
+			queue_delayed_work(system_freezable_wq,
+				&sma1303->check_fault_work,
+					CHECK_PERIOD_TIME * HZ);
+	}
+
+	if (!(~over_temp & OT1_OK_STATUS) && !(~over_temp & OT2_OK_STATUS)
+			&& !(ocp_val & OCP_SPK_STATUS)
+			&& !(ocp_val & OCP_BST_STATUS)
+			&& !(ocp_val & CLK_MON_STATUS)
+			&& !(uvlo_val & UVLO_BST_STATUS)) {
+	}
+
+	mutex_unlock(&sma1303->lock);
+}
+
+#ifdef CONFIG_PM
+static int sma1303_suspend(struct snd_soc_component *component)
+{
+	return 0;
+}
+
+static int sma1303_resume(struct snd_soc_component *component)
+{
+	return 0;
+}
+#else
+#define sma1303_suspend NULL
+#define sma1303_resume NULL
+#endif
+
+static int sma1303_probe(struct snd_soc_component *component)
+{
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	char *dapm_widget_str = NULL;
+	int prefix_len = 0, str_max = 30, ret = 0, i = 0;
+	unsigned int status, otp_stat;
+
+	if (component->name_prefix != NULL) {
+		dev_info(component->dev, "%s : component name prefix - %s\n",
+			__func__, component->name_prefix);
+
+		prefix_len = strlen(component->name_prefix);
+		dapm_widget_str = kzalloc(prefix_len + str_max, GFP_KERNEL);
+
+		if (!dapm_widget_str) {
+			kfree(dapm_widget_str);
+			return -ENOMEM;
+		}
+
+		strcpy(dapm_widget_str, component->name_prefix);
+		strcat(dapm_widget_str, " Playback");
+
+		snd_soc_dapm_ignore_suspend(dapm, dapm_widget_str);
+
+		memset(dapm_widget_str + prefix_len, 0, str_max);
+
+		strcpy(dapm_widget_str, component->name_prefix);
+		strcat(dapm_widget_str, " SPK");
+
+		snd_soc_dapm_ignore_suspend(dapm, dapm_widget_str);
+
+		kfree(dapm_widget_str);
+	} else {
+		snd_soc_dapm_ignore_suspend(dapm, "Playback");
+		snd_soc_dapm_ignore_suspend(dapm, "SPK");
+	}
+
+	snd_soc_dapm_sync(dapm);
+
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_00_SYSTEM_CTRL,
+			RESETBYI2C_MASK, RESETBYI2C_RESET);
+
+	ret += regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &status);
+	if (ret < 0) {
+		dev_err(sma1303->dev,
+			"failed to read, register: %02X, ret: %d\n",
+				SMA1303_FF_DEVICE_INDEX, ret);
+		return ret;
+	}
+	sma1303->rev_num = status & REV_NUM_STATUS;
+	if (sma1303->rev_num == REV_NUM_TV0)
+		dev_info(component->dev, "SMA1303 Trimming Version 0\n");
+	else if (sma1303->rev_num == REV_NUM_TV1)
+		dev_info(component->dev, "SMA1303 Trimming Version 1\n");
+
+	ret += regmap_read(sma1303->regmap, SMA1303_FB_STATUS2, &otp_stat);
+	if (ret < 0)
+		dev_err(sma1303->dev,
+			"failed to read, register: %02X, ret: %d\n",
+				SMA1303_FF_DEVICE_INDEX, ret);
+
+	if (((sma1303->rev_num == REV_NUM_TV0) &&
+		((otp_stat & 0x0E) == OTP_STAT_OK_0)) ||
+		((sma1303->rev_num != REV_NUM_TV0) &&
+		((otp_stat & 0x0C) == OTP_STAT_OK_1)))
+		dev_info(component->dev, "SMA1303 OTP Status Successful\n");
+	else
+		dev_info(component->dev, "SMA1303 OTP Status Fail\n");
+
+	for (i = 0; i < (unsigned int)ARRAY_SIZE(sma1303_reg_def); i++)
+		ret += sma1303_regmap_write(
+				sma1303->regmap, component->dev,
+				sma1303_reg_def[i].reg,
+				sma1303_reg_def[i].def);
+
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_0A_SPK_VOL, sma1303->init_vol);
+
+	dev_info(component->dev,
+		"%s init_vol is 0x%x\n", __func__, sma1303->init_vol);
+
+	return ret;
+}
+
+static void sma1303_remove(struct snd_soc_component *component)
+{
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+
+	cancel_delayed_work_sync(&sma1303->check_fault_work);
+}
+
+static const struct snd_soc_component_driver sma1303_component = {
+	.probe = sma1303_probe,
+	.remove = sma1303_remove,
+	.suspend = sma1303_suspend,
+	.resume = sma1303_resume,
+	.controls = sma1303_snd_controls,
+	.num_controls = ARRAY_SIZE(sma1303_snd_controls),
+	.dapm_widgets = sma1303_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sma1303_dapm_widgets),
+	.dapm_routes = sma1303_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(sma1303_audio_map),
+};
+
+const struct regmap_config sma_i2c_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = SMA1303_FF_DEVICE_INDEX,
+	.readable_reg = sma1303_readable_register,
+	.writeable_reg = sma1303_writeable_register,
+	.volatile_reg = sma1303_volatile_register,
+
+	.cache_type = REGCACHE_NONE,
+	.reg_defaults = sma1303_reg_def,
+	.num_reg_defaults = ARRAY_SIZE(sma1303_reg_def),
+};
+
+static ssize_t check_fault_period_show(struct device *dev,
+	struct device_attribute *devattr, char *buf)
+{
+	struct sma1303_priv *sma1303 = dev_get_drvdata(dev);
+	int rc;
+
+	rc = (int)snprintf(buf, PAGE_SIZE,
+			"%ld\n", sma1303->check_fault_period);
+
+	return (ssize_t)rc;
+}
+
+static ssize_t check_fault_period_store(struct device *dev,
+	struct device_attribute *devattr, const char *buf, size_t count)
+{
+	struct sma1303_priv *sma1303 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = kstrtol(buf, 10, &sma1303->check_fault_period);
+
+	if (ret)
+		return -EINVAL;
+
+	return (ssize_t)count;
+}
+
+static DEVICE_ATTR_RW(check_fault_period);
+
+static ssize_t check_fault_status_show(struct device *dev,
+	struct device_attribute *devattr, char *buf)
+{
+	struct sma1303_priv *sma1303 = dev_get_drvdata(dev);
+	int rc;
+
+	rc = (int)snprintf(buf, PAGE_SIZE,
+			"%ld\n", sma1303->check_fault_status);
+
+	return (ssize_t)rc;
+}
+
+static ssize_t check_fault_status_store(struct device *dev,
+	struct device_attribute *devattr, const char *buf, size_t count)
+{
+	struct sma1303_priv *sma1303 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = kstrtol(buf, 10, &sma1303->check_fault_status);
+
+	if (ret)
+		return -EINVAL;
+
+	if (sma1303->check_fault_status) {
+		if (sma1303->check_fault_period > 0)
+			queue_delayed_work(system_freezable_wq,
+				&sma1303->check_fault_work,
+					sma1303->check_fault_period * HZ);
+		else
+			queue_delayed_work(system_freezable_wq,
+				&sma1303->check_fault_work,
+					CHECK_PERIOD_TIME * HZ);
+	}
+
+	return (ssize_t)count;
+}
+
+static DEVICE_ATTR_RW(check_fault_status);
+
+static struct attribute *sma1303_attr[] = {
+	&dev_attr_check_fault_period.attr,
+	&dev_attr_check_fault_status.attr,
+	NULL,
+};
+
+static struct attribute_group sma1303_attr_group = {
+	.attrs = sma1303_attr,
+};
+
+static int sma1303_i2c_probe(struct i2c_client *client,
+				const struct i2c_device_id *id)
+{
+	struct sma1303_priv *sma1303;
+	struct device_node *np = client->dev.of_node;
+	int ret;
+	u32 value;
+	unsigned int device_info;
+
+	dev_info(&client->dev, "%s is here. Driver version REV018\n", __func__);
+
+	sma1303 = devm_kzalloc(&client->dev, sizeof(struct sma1303_priv),
+							GFP_KERNEL);
+
+	if (!sma1303)
+		return -ENOMEM;
+
+	sma1303->regmap = devm_regmap_init_i2c(client, &sma_i2c_regmap);
+
+	if (IS_ERR(sma1303->regmap)) {
+		ret = PTR_ERR(sma1303->regmap);
+		dev_err(&client->dev,
+			"Failed to allocate register map: %d\n", ret);
+
+		devm_kfree(&client->dev, sma1303);
+
+		return ret;
+	}
+
+	if (np) {
+		if (!of_property_read_u32(np, "tdm-slot-rx", &value)) {
+			dev_info(&client->dev,
+				"tdm slot rx is '%d' from DT\n", value);
+			sma1303->tdm_slot_rx = value;
+		} else {
+			dev_info(&client->dev,
+				"Default setting of tdm slot rx is '0'\n");
+			sma1303->tdm_slot_rx = 0;
+		}
+		if (!of_property_read_u32(np, "tdm-slot-tx", &value)) {
+			dev_info(&client->dev,
+				"tdm slot tx is '%d' from DT\n", value);
+			sma1303->tdm_slot_tx = value;
+		} else {
+			dev_info(&client->dev,
+				"Default setting of tdm slot tx is '0'\n");
+			sma1303->tdm_slot_tx = 0;
+		}
+		if (!of_property_read_u32(np, "sys-clk-id", &value)) {
+			switch (value) {
+			case SMA1303_EXTERNAL_CLOCK_19_2:
+			case SMA1303_EXTERNAL_CLOCK_24_576:
+			case SMA1303_PLL_CLKIN_MCLK:
+				dev_info(&client->dev, "MCLK is not supported\n");
+				break;
+			case SMA1303_PLL_CLKIN_BCLK:
+				dev_info(&client->dev,
+				"Take an BCLK(SCK) and covert it to an internal PLL for use\n");
+				break;
+			default:
+				dev_err(&client->dev,
+					"Invalid sys-clk-id: %d\n", value);
+				return -EINVAL;
+			}
+			sma1303->sys_clk_id = value;
+		} else {
+			dev_info(&client->dev, "Use the internal PLL clock by default\n");
+			sma1303->sys_clk_id = SMA1303_PLL_CLKIN_BCLK;
+		}
+	} else {
+		dev_err(&client->dev,
+			"device node initialization error\n");
+		devm_kfree(&client->dev, sma1303);
+		return -ENODEV;
+	}
+
+	ret = regmap_read(sma1303->regmap,
+		SMA1303_FF_DEVICE_INDEX, &device_info);
+
+	if ((ret != 0) || ((device_info & 0xF8) != DEVICE_ID)) {
+		dev_err(&client->dev, "device initialization error (%d 0x%02X)",
+				ret, device_info);
+	}
+	dev_info(&client->dev, "chip version 0x%02X\n", device_info);
+
+	sma1303->last_over_temp = 0xC0;
+	sma1303->last_ocp_val = 0x0A;
+	sma1303->tsdw_cnt = 0;
+	sma1303->init_vol = 0x31;
+	sma1303->cur_vol = sma1303->init_vol;
+	sma1303->last_bclk = 0;
+
+	INIT_DELAYED_WORK(&sma1303->check_fault_work,
+		sma1303_check_fault_worker);
+
+	mutex_init(&sma1303->lock);
+	sma1303->check_fault_period = CHECK_PERIOD_TIME;
+
+	sma1303->devtype = id->driver_data;
+	sma1303->dev = &client->dev;
+	sma1303->kobj = &client->dev.kobj;
+
+	i2c_set_clientdata(client, sma1303);
+
+	sma1303->amp_mode = ONE_CHIP_SOLUTION;
+	sma1303->usage_status = true;
+	sma1303->amp_power_status = false;
+	sma1303->check_fault_status = true;
+	sma1303->pll_matches = sma1303_pll_matches;
+	sma1303->num_of_pll_matches =
+		ARRAY_SIZE(sma1303_pll_matches);
+
+	ret = devm_snd_soc_register_component(&client->dev,
+			&sma1303_component, sma1303_dai, 1);
+
+	if (ret) {
+		dev_err(&client->dev, "Failed to register component");
+		snd_soc_unregister_component(&client->dev);
+
+		if (sma1303)
+			devm_kfree(&client->dev, sma1303);
+
+		return ret;
+	}
+
+	sma1303->attr_grp = &sma1303_attr_group;
+	ret = sysfs_create_group(sma1303->kobj, sma1303->attr_grp);
+
+	if (ret) {
+		dev_err(&client->dev,
+			"failed to create attribute group [%d]\n", ret);
+		sma1303->attr_grp = NULL;
+	}
+
+	return ret;
+}
+
+static int sma1303_i2c_remove(struct i2c_client *client)
+{
+	struct sma1303_priv *sma1303 =
+		(struct sma1303_priv *) i2c_get_clientdata(client);
+
+	cancel_delayed_work_sync(&sma1303->check_fault_work);
+
+	snd_soc_unregister_component(&client->dev);
+
+	if (sma1303)
+		devm_kfree(&client->dev, sma1303);
+
+	return 0;
+}
+
+static const struct i2c_device_id sma1303_i2c_id[] = {
+	{"sma1303", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, sma1303_i2c_id);
+
+static const struct of_device_id sma1303_of_match[] = {
+	{ .compatible = "irondevice,sma1303", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sma1303_of_match);
+
+static struct i2c_driver sma1303_i2c_driver = {
+	.driver = {
+		.name = "sma1303",
+		.of_match_table = sma1303_of_match,
+	},
+	.probe = sma1303_i2c_probe,
+	.remove = sma1303_i2c_remove,
+	.id_table = sma1303_i2c_id,
+};
+
+static int __init sma1303_init(void)
+{
+	int ret;
+
+	ret = i2c_add_driver(&sma1303_i2c_driver);
+
+	if (ret)
+		pr_err("Failed to register sma1303 I2C driver: %d\n", ret);
+
+	return ret;
+}
+
+static void __exit sma1303_exit(void)
+{
+	i2c_del_driver(&sma1303_i2c_driver);
+}
+
+module_init(sma1303_init);
+module_exit(sma1303_exit);
+
+MODULE_DESCRIPTION("ALSA SoC SMA1303 driver");
+MODULE_AUTHOR("Gyuhwa Park, <gyuhwa.park@irondevice.com>");
+MODULE_AUTHOR("Kiseok Jo, <kiseok.jo@irondevice.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/sma1303.h b/sound/soc/codecs/sma1303.h
new file mode 100644
index 000000000000..d1fa2acaba85
--- /dev/null
+++ b/sound/soc/codecs/sma1303.h
@@ -0,0 +1,609 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * sma1303.h -- sma1303 ALSA SoC Audio driver
+ *
+ * Copyright 2022 Iron Device Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _SMA1303_H
+#define _SMA1303_H
+
+#define  SMA1303_I2C_ADDR_00		0x1e
+#define  SMA1303_I2C_ADDR_01		0x3e
+#define  SMA1303_I2C_ADDR_10		0x5e
+#define  SMA1303_I2C_ADDR_11		0x7e
+
+#define  SMA1303_EXTERNAL_CLOCK_19_2	0x00
+#define  SMA1303_EXTERNAL_CLOCK_24_576	0x01
+#define  SMA1303_PLL_CLKIN_MCLK		0x02
+#define  SMA1303_PLL_CLKIN_BCLK		0x03
+
+#define  ONE_CHIP_SOLUTION		0x00
+#define  MONO_TWO_CHIP_SOLUTION		0x01
+#define  LEFT_TWO_CHIP_SOLUTION		0x02
+#define  RIGHT_TWO_CHIP_SOLUTION	0x03
+
+/*
+ * SMA1303 Register Definition
+ */
+
+/* SMA1303 Register Addresses */
+#define  SMA1303_00_SYSTEM_CTRL		0x00
+#define  SMA1303_01_INPUT1_CTRL1	0x01
+#define  SMA1303_02_INPUT1_CTRL2	0x02
+#define  SMA1303_03_INPUT1_CTRL3	0x03
+#define  SMA1303_04_INPUT1_CTRL4	0x04
+/* 0x05 ~ 0x08 : Reserved */
+#define  SMA1303_09_OUTPUT_CTRL		0x09
+#define  SMA1303_0A_SPK_VOL		0x0a
+#define  SMA1303_0B_BST_TEST		0x0b
+#define  SMA1303_0C_BST_TEST1		0x0c
+#define  SMA1303_0D_SPK_TEST		0x0d
+#define  SMA1303_0E_MUTE_VOL_CTRL	0x0e
+/* 0x0F : Reserved */
+#define  SMA1303_10_SYSTEM_CTRL1	0x10
+#define  SMA1303_11_SYSTEM_CTRL2	0x11
+#define  SMA1303_12_SYSTEM_CTRL3	0x12
+/* 0x13 : Reserved */
+#define  SMA1303_14_MODULATOR		0x14
+#define  SMA1303_15_BASS_SPK1		0x15
+#define  SMA1303_16_BASS_SPK2		0x16
+#define  SMA1303_17_BASS_SPK3		0x17
+#define  SMA1303_18_BASS_SPK4		0x18
+#define  SMA1303_19_BASS_SPK5		0x19
+#define  SMA1303_1A_BASS_SPK6		0x1a
+#define  SMA1303_1B_BASS_SPK7		0x1b
+/* 0x1C ~ 0x22 : Reserved */
+#define  SMA1303_23_COMP_LIM1		0x23
+#define  SMA1303_24_COMP_LIM2		0x24
+#define  SMA1303_25_COMP_LIM3		0x25
+#define  SMA1303_26_COMP_LIM4		0x26
+/* 0x27 ~ 0x32 : Reserved */
+#define  SMA1303_33_SDM_CTRL		0x33
+#define  SMA1303_34_OTP_DATA1		0x34
+/* 0x35 : Reserved */
+#define  SMA1303_36_PROTECTION		0x36
+#define  SMA1303_37_SLOPE_CTRL		0x37
+#define  SMA1303_38_OTP_TRM0		0x38
+/* 0x39 ~ 0x3A : Reserved */
+#define  SMA1303_3B_TEST1		0x3b
+#define  SMA1303_3C_TEST2		0x3c
+#define  SMA1303_3D_TEST3		0x3d
+#define  SMA1303_3E_ATEST1		0x3e
+#define  SMA1303_3F_ATEST2		0x3f
+/* 0x40 ~ 0x8A : Reserved */
+#define	 SMA1303_8B_PLL_POST_N		0x8b
+#define	 SMA1303_8C_PLL_N		0x8c
+#define	 SMA1303_8D_PLL_A_SETTING	0x8d
+#define	 SMA1303_8E_PLL_CTRL		0x8e
+#define	 SMA1303_8F_PLL_P_CP		0x8f
+#define  SMA1303_90_POSTSCALER		0x90
+#define  SMA1303_91_CLASS_G_CTRL	0x91
+#define  SMA1303_92_FDPEC_CTRL		0x92
+/* 0x93 : Reserved */
+#define  SMA1303_94_BOOST_CTRL1		0x94
+#define  SMA1303_95_BOOST_CTRL2		0x95
+#define  SMA1303_96_BOOST_CTRL3		0x96
+#define  SMA1303_97_BOOST_CTRL4		0x97
+/* 0x98 ~ 0x9F : Reserved */
+#define  SMA1303_A0_PAD_CTRL0		0xa0
+#define  SMA1303_A1_PAD_CTRL1		0xa1
+#define	 SMA1303_A2_TOP_MAN1		0xa2
+#define	 SMA1303_A3_TOP_MAN2		0xa3
+#define	 SMA1303_A4_TOP_MAN3		0xa4
+#define  SMA1303_A5_TDM1		0xa5
+#define  SMA1303_A6_TDM2		0xa6
+#define  SMA1303_A7_CLK_MON		0xa7
+/* 0xA8 ~ 0xF9 : Reserved */
+#define	 SMA1303_FA_STATUS1		0xfa
+#define	 SMA1303_FB_STATUS2		0xfb
+/* 0xFC ~ 0xFE : Reserved */
+#define	 SMA1303_FF_DEVICE_INDEX	0xff
+
+/* SMA1303 Registers Bit Fields */
+
+/* SYSTEM_CTRL : 0x00 */
+#define RESETBYI2C_MASK (1<<1)
+#define RESETBYI2C_NORMAL (0<<1)
+#define RESETBYI2C_RESET (1<<1)
+
+#define POWER_MASK (1<<0)
+#define POWER_OFF (0<<0)
+#define POWER_ON (1<<0)
+
+/* INTPUT CTRL1 : 0x01 */
+#define CONTROLLER_DEVICE_MASK (1<<7)
+#define DEVICE_MODE	(0<<7)
+#define CONTROLLER_MODE	(1<<7)
+
+#define I2S_MODE_MASK	(7<<4)
+#define STANDARD_I2S	(0<<4)
+#define LJ		(1<<4)
+#define RJ_16BIT	(4<<4)
+#define RJ_18BIT	(5<<4)
+#define RJ_20BIT	(6<<4)
+#define RJ_24BIT	(7<<4)
+
+#define LEFTPOL_MASK	(1<<3)
+#define LOW_FIRST_CH	(0<<3)
+#define HIGH_FIRST_CH	(1<<3)
+
+#define SCK_RISING_MASK	(1<<2)
+#define SCK_FALLING_EDGE	(0<<2)
+#define SCK_RISING_EDGE	(1<<2)
+
+/* INTPUT CTRL2 : 0x02 */
+#define IMODE_MASK (3<<6)
+#define I2S	(0<<6)
+#define PCM_SHORT (1<<6)
+#define PCM_LONG (2<<6)
+
+#define RIGHT_FIRST_MASK (1<<5)
+#define LEFT_NORMAL (0<<5)
+#define RIGHT_INVERTED (1<<5)
+
+#define PCM_ALAW_MASK (1<<4)
+#define PCM_U_DECODING (0<<4)
+#define PCM_A_DECODING (1<<4)
+
+#define PCM_COMP_MASK (1<<3)
+#define PCM_LINEAR (0<<3)
+#define PCM_COMPANDING (1<<3)
+
+#define INPUTSEL_MASK (1<<2)
+#define PCM_8KHZ (0<<2)
+#define PCM_16KHZ (1<<2)
+
+#define PCM_STEREO_MASK (1<<1)
+#define PCM_MONO (0<<1)
+#define PCM_STEREO (1<<1)
+
+#define PCM_DL_MASK (1<<0)
+#define PCM_8BIT (0<<0)
+#define PCM_16BIT (1<<0)
+
+/* INTPUT CTRL3 : 0x03 */
+#define PCM_N_SLOT_MASK (15<<0)
+#define PCM_N_SLOT1 (0<<0)
+#define PCM_N_SLOT2 (1<<0)
+#define PCM_N_SLOT3 (2<<0)
+#define PCM_N_SLOT4 (3<<0)
+#define PCM_N_SLOT5 (4<<0)
+#define PCM_N_SLOT6 (5<<0)
+#define PCM_N_SLOT7 (6<<0)
+#define PCM_N_SLOT8 (7<<0)
+#define PCM_N_SLOT9 (8<<0)
+#define PCM_N_SLOT10 (9<<0)
+#define PCM_N_SLOT11 (10<<0)
+#define PCM_N_SLOT12 (11<<0)
+#define PCM_N_SLOT13 (12<<0)
+#define PCM_N_SLOT14 (13<<0)
+#define PCM_N_SLOT15 (14<<0)
+#define PCM_N_SLOT16 (15<<0)
+
+/* INTPUT CTRL4 : 0x04 */
+#define PCM1_SLOT_MASK (15<<4)
+#define PCM1_SLOT1 (0<<4)
+#define PCM1_SLOT2 (1<<4)
+#define PCM1_SLOT3 (2<<4)
+#define PCM1_SLOT4 (3<<4)
+#define PCM1_SLOT5 (4<<4)
+#define PCM1_SLOT6 (5<<4)
+#define PCM1_SLOT7 (6<<4)
+#define PCM1_SLOT8 (7<<4)
+#define PCM1_SLOT9 (8<<4)
+#define PCM1_SLOT10 (9<<4)
+#define PCM1_SLOT11 (10<<4)
+#define PCM1_SLOT12 (11<<4)
+#define PCM1_SLOT13 (12<<4)
+#define PCM1_SLOT14 (13<<4)
+#define PCM1_SLOT15 (14<<4)
+#define PCM1_SLOT16 (15<<4)
+
+#define PCM2_SLOT_MASK (15<<0)
+#define PCM2_SLOT1 (0<<0)
+#define PCM2_SLOT2 (1<<0)
+#define PCM2_SLOT3 (2<<0)
+#define PCM2_SLOT4 (3<<0)
+#define PCM2_SLOT5 (4<<0)
+#define PCM2_SLOT6 (5<<0)
+#define PCM2_SLOT7 (6<<0)
+#define PCM2_SLOT8 (7<<0)
+#define PCM2_SLOT9 (8<<0)
+#define PCM2_SLOT10 (9<<0)
+#define PCM2_SLOT11 (10<<0)
+#define PCM2_SLOT12 (11<<0)
+#define PCM2_SLOT13 (12<<0)
+#define PCM2_SLOT14 (13<<0)
+#define PCM2_SLOT15 (14<<0)
+#define PCM2_SLOT16 (15<<0)
+
+/* OUTPUT CTRL : 0x09 */
+#define PORT_CONFIG_MASK (3<<5)
+#define INPUT_PORT_ONLY (0<<5)
+#define OUTPUT_PORT_ENABLE (2<<5)
+
+#define PORT_OUT_SEL_MASK (7<<0)
+#define OUT_SEL_DISABLE (0<<0)
+#define FORMAT_CONVERTER (1<<0)
+#define MIXER_OUTPUT (2<<0)
+#define SPEAKER_PATH (3<<0)
+#define POSTSCALER_OUTPUT (4<<0)
+
+/* BST_TEST : 0x0B */
+#define BST_OFF_SLOPE_MASK (3<<6)
+#define BST_OFF_SLOPE_6_7ns (0<<6)
+#define BST_OFF_SLOPE_4_8ns (1<<6)
+#define BST_OFF_SLOPE_2_6ns (2<<6)
+#define BST_OFF_SLOPE_1_2ns (3<<6)
+
+#define OCP_TEST_MASK (1<<5)
+#define OCP_NORMAL_MODE (0<<5)
+#define OCP_TEST_MODE (1<<5)
+
+#define BST_FAST_LEBN_MASK (1<<4)
+#define BST_SHORT_LEB (0<<4)
+#define BST_LONG_LEB (1<<4)
+
+#define HIGH_PGAIN_MASK (1<<3)
+#define NORMAL_P_GAIN (0<<3)
+#define HIGH_P_GAIN (1<<3)
+
+#define VCOMP_MASK (1<<2)
+#define VCOMP_NORMAL_MODE (0<<2)
+#define VCOMP_V_MON_MODE (1<<2)
+
+#define PMOS_ON_MASK (1<<1)
+#define PMOS_NORMAL_MODE (0<<1)
+#define PMOS_TEST_MODE (1<<1)
+
+#define NMOS_ON_MASK (1<<0)
+#define NMOS_NORMAL_MODE (0<<0)
+#define NMOS_TEST_MODE (1<<0)
+
+/* BST_TEST1 : 0x0C */
+#define SET_OCP_H_MASK (3<<6)
+#define HIGH_OCP_4_5_LVL (0<<6)
+#define HIGH_OCP_3_2_LVL (1<<6)
+#define HIGH_OCP_2_1_LVL (2<<6)
+#define HIGH_OCP_0_9_LVL (3<<6)
+
+#define OCL_TEST_MASK (1<<5)
+#define OCL_NORMAL_MODE (0<<5)
+#define OCL_TEST_MODE (1<<5)
+
+#define LOOP_CHECK_MASK (1<<4)
+#define BST_LOOP_NORMAL_MODE (0<<4)
+#define BST_LOOP_CHECK_MODE (1<<4)
+
+#define EN_SH_PRT_MASK (1<<3)
+#define EN_SH_PRT_DISABLE (0<<3)
+#define EN_SH_PRT_ENABLE (1<<3)
+
+/* SPK_TEST : 0x0D */
+#define VREF_MON_MASK (1<<3)
+#define VREF_NORMAL_MODE (0<<3)
+#define VREF_V_MON_MODE (1<<3)
+
+#define SPK_OCP_DLYN_MASK (1<<2)
+#define SPK_OCP_LONG_DELAY (0<<2)
+#define SPK_OCP_NORMAL (1<<2)
+
+#define SPK_OFF_SLOPE_MASK (3<<0)
+#define SPK_OFF_SLOPE_SLOW (0<<0)
+#define SPK_OFF_SLOPE_FAST (3<<0)
+
+/* MUTE_VOL_CTRL : 0x0E */
+#define VOL_SLOPE_MASK (3<<6)
+#define VOL_SLOPE_OFF (0<<6)
+#define VOL_SLOPE_SLOW (1<<6)
+#define VOL_SLOPE_MID (2<<6)
+#define VOL_SLOPE_FAST (3<<6)
+
+#define MUTE_SLOPE_MASK (3<<4)
+#define MUTE_SLOPE_OFF (0<<4)
+#define MUTE_SLOPE_SLOW (1<<4)
+#define MUTE_SLOPE_MID (2<<4)
+#define MUTE_SLOPE_FAST (3<<4)
+
+#define SPK_MUTE_MASK (1<<0)
+#define SPK_UNMUTE (0<<0)
+#define SPK_MUTE (1<<0)
+
+/* SYSTEM_CTRL1 :0x10 */
+#define SPK_MODE_MASK (7<<2)
+#define SPK_OFF (0<<2)
+#define SPK_MONO (1<<2)
+#define SPK_STEREO (4<<2)
+
+/* SYSTEM_CTRL2 : 0x11 */
+#define SPK_BS_MASK (1<<6)
+#define SPK_BS_BYP (0<<6)
+#define SPK_BS_EN (1<<6)
+#define SPK_LIM_MASK (1<<5)
+#define SPK_LIM_BYP (0<<5)
+#define SPK_LIM_EN (1<<5)
+
+#define LR_DATA_SW_MASK (1<<4)
+#define LR_DATA_SW_NORMAL (0<<4)
+#define LR_DATA_SW_SWAP (1<<4)
+
+#define MONOMIX_MASK (1<<0)
+#define MONOMIX_OFF (0<<0)
+#define MONOMIX_ON (1<<0)
+
+/* SYSTEM_CTRL3 : 0x12 */
+#define INPUT_MASK (3<<6)
+#define INPUT_0_DB (0<<6)
+#define INPUT_M6_DB (1<<6)
+#define INPUT_M12_DB (2<<6)
+#define INPUT_INFI_DB (3<<6)
+#define INPUT_R_MASK (3<<4)
+#define INPUT_R_0_DB (0<<4)
+#define INPUT_R_M6_DB (1<<4)
+#define INPUT_R_M12_DB (2<<4)
+#define INPUT_R_INFI_DB (3<<4)
+
+/* Modulator : 0x14 */
+#define SPK_HYSFB_MASK (3<<6)
+#define HYSFB_625K (0<<6)
+#define HYSFB_414K (1<<6)
+#define HYSFB_297K (2<<6)
+#define HYSFB_226K (3<<6)
+#define SPK_BDELAY_MASK (63<<0)
+
+/* SDM CONTROL : 0x33 */
+#define SDM_Q_SEL_MASK (1<<2)
+#define QUART_SEL_1_DIV_4 (0<<2)
+#define QUART_SEL_1_DIV_8 (1<<2)
+
+/* OTP_DATA1 : 0x34 */
+#define OTP_LVL_MASK (1<<5)
+#define OTP_LVL_NORMAL (0<<5)
+#define OTP_LVL_LOW (1<<5)
+
+/* PROTECTION : 0x36 */
+#define EDGE_DIS_MASK (1<<7)
+#define EDGE_DIS_ENABLE (0<<7)
+#define EDGE_DIS_DISABLE (1<<7)
+
+#define SPK_OCP_DIS_MASK (1<<3)
+#define SPK_OCP_ENABLE (0<<3)
+#define SPK_OCP_DISABLE (1<<3)
+
+#define OCP_MODE_MASK (1<<2)
+#define AUTO_RECOVER (0<<2)
+#define SHUT_DOWN_PERMANENT (1<<2)
+
+#define OTP_MODE_MASK (3<<0)
+#define OTP_MODE_DISABLE (0<<0)
+#define IG_THR1_SHUT_THR2 (1<<0)
+#define REC_THR1_SHUT_THR2 (2<<0)
+#define SHUT_THR1_SHUT_THR2 (3<<0)
+
+/* TEST2 : 0x3C */
+#define SPK_HSDM_BP_MASK (1<<4)
+#define SPK_HSDM_ENABLE (0<<4)
+#define SPK_HSDM_BYPASS (1<<4)
+
+#define SDM_SYNC_DIS_MASK (1<<5)
+#define SDM_SYNC_NORMAL (0<<5)
+#define SDM_SYNC_DISABLE (1<<5)
+
+/* ATEST2 : 0x3F */
+#define SPK_OUT_FREQ_MASK (1<<2)
+#define SPK_OUT_FREQ_360K (0<<2)
+#define SPK_OUT_FREQ_410K (1<<2)
+
+#define LOW_POWER_MODE_MASK (1<<3)
+#define LOW_POWER_MODE_DISABLE (0<<3)
+#define LOW_POWER_MODE_ENABLE (1<<3)
+
+#define THERMAL_ADJUST_MASK (3<<5)
+#define THERMAL_150_110 (0<<5)
+#define THERMAL_160_120 (1<<5)
+#define THERMAL_140_100 (2<<5)
+
+#define FAST_OFF_DRIVE_SPK_MASK (1<<0)
+#define FAST_OFF_DRIVE_SPK_DISABLE (0<<0)
+#define FAST_OFF_DRIVE_SPK_ENABLE (1<<0)
+
+/* PLL_CTRL : 0x8E */
+#define TRM_LVL_MASK (1<<4)
+#define TRM_LVL_NORMAL (0<<4)
+#define TRM_LVL_LOW (1<<4)
+
+#define LOW_OCL_MODE_MASK (1<<3)
+#define LOW_OCL_MODE (0<<3)
+#define NORMAL_OCL_MODE (1<<3)
+
+#define PLL_PD2_MASK (7<<0)
+#define PLL_PD2 (7<<0)
+#define PLL_OPERATION2 (0<<0)
+
+/* POSTSCALER : 0x90 */
+#define BYP_POST_MASK (1<<0)
+#define EN_POST_SCALER (0<<0)
+#define BYP_POST_SCALER (1<<0)
+
+/* FDPEC CONTROL : 0x92 */
+#define FLT_VDD_GAIN_MASK (15<<4)
+#define FLT_VDD_GAIN_2P40 (0<<4)
+#define FLT_VDD_GAIN_2P45 (1<<4)
+#define FLT_VDD_GAIN_2P50 (2<<4)
+#define FLT_VDD_GAIN_2P55 (3<<4)
+#define FLT_VDD_GAIN_2P60 (4<<4)
+#define FLT_VDD_GAIN_2P65 (5<<4)
+#define FLT_VDD_GAIN_2P70 (6<<4)
+#define FLT_VDD_GAIN_2P75 (7<<4)
+#define FLT_VDD_GAIN_2P80 (8<<4)
+#define FLT_VDD_GAIN_2P85 (9<<4)
+#define FLT_VDD_GAIN_2P90 (10<<4)
+#define FLT_VDD_GAIN_2P95 (11<<4)
+#define FLT_VDD_GAIN_3P00 (12<<4)
+#define FLT_VDD_GAIN_3P05 (13<<4)
+#define FLT_VDD_GAIN_3P10 (14<<4)
+#define FLT_VDD_GAIN_3P15 (15<<4)
+
+#define DIS_FCHG_MASK (1<<2)
+#define EN_FAST_CHARGE (0<<2)
+#define DIS_FAST_CHARGE (1<<2)
+
+/* BOOST_CONTROL4 : 0x97 */
+#define TRM_VBST_MASK (7<<2)
+#define TRM_VBST_5P5 (0<<2)
+#define TRM_VBST_5P6 (1<<2)
+#define TRM_VBST_5P7 (2<<2)
+#define TRM_VBST_5P8 (3<<2)
+#define TRM_VBST_5P9 (4<<2)
+#define TRM_VBST_6P0 (5<<2)
+#define TRM_VBST_6P1 (6<<2)
+#define TRM_VBST_6P2 (7<<2)
+
+/* TOP_MAN1 : 0xA2 */
+#define PLL_LOCK_SKIP_MASK (1<<7)
+#define PLL_LOCK_ENABLE (0<<7)
+#define PLL_LOCK_DISABLE (1<<7)
+
+#define PLL_PD_MASK (1<<6)
+#define PLL_OPERATION (0<<6)
+#define PLL_PD (1<<6)
+
+#define PLL_DIV_MASK (3<<4)
+#define PLL_OUT (0<<4)
+#define PLL_OUT_2 (1<<4)
+#define PLL_OUT_4 (2<<4)
+#define PLL_OUT_8 (3<<4)
+
+#define PLL_REF_CLK_MASK (1<<3)
+#define PLL_REF_CLK1 (0<<3)
+#define PLL_SCK (1<<3)
+
+#define DAC_DN_CONV_MASK (1<<2)
+#define DAC_DN_CONV_DISABLE (0<<2)
+#define DAC_DN_CONV_ENABLE (1<<2)
+
+#define SDO_IO_MASK (1<<1)
+#define HIGH_Z_LRCK_H (0<<1)
+#define HIGH_Z_LRCK_L (1<<1)
+
+#define SDO_OUTPUT2_MASK (1<<0)
+#define SDO_NORMAL (0<<0)
+#define SDO_OUTPUT_ONLY (1<<0)
+
+/* TOP_MAN2 : 0xA3 */
+#define MON_OSC_PLL_MASK (1<<7)
+#define PLL_SDO (0<<7)
+#define PLL_OSC (1<<7)
+
+#define TEST_CLKO_EN_MASK (1<<6)
+#define NORMAL_SDO (0<<6)
+#define CLK_OUT_SDO (1<<6)
+
+#define SDO_OUTPUT_MASK (1<<3)
+#define NORMAL_OUT (0<<3)
+#define HIGH_Z_OUT (1<<3)
+
+#define CLOCK_MON_MASK (1<<1)
+#define CLOCK_MON (0<<1)
+#define CLOCK_NOT_MON (1<<1)
+
+#define OSC_PD_MASK (1<<0)
+#define NORMAL_OPERATION_OSC (0<<0)
+#define POWER_DOWN_OSC (1<<0)
+
+/* TOP_MAN3 0xA4 */
+#define O_FORMAT_MASK (7<<5)
+#define O_FMT_LJ (1<<5)
+#define O_FMT_I2S (2<<5)
+#define O_FMT_TDM (4<<5)
+
+#define SCK_RATE_MASK (1<<3)
+#define SCK_64FS (0<<3)
+#define SCK_32FS (2<<3)
+
+#define LRCK_POL_MASK (1<<0)
+#define L_VALID (0<<0)
+#define R_VALID (1<<0)
+
+/* TDM1 FORMAT : 0xA5 */
+#define TDM_CLK_POL_MASK (1<<7)
+#define TDM_CLK_POL_RISE (0<<7)
+#define TDM_CLK_POL_FALL (1<<7)
+
+#define TDM_TX_MODE_MASK (1<<6)
+#define TDM_TX_MONO (0<<6)
+#define TDM_TX_STEREO (1<<6)
+
+#define TDM_SLOT1_RX_POS_MASK (7<<3)
+#define TDM_SLOT1_RX_POS_0 (0<<3)
+#define TDM_SLOT1_RX_POS_1 (1<<3)
+#define TDM_SLOT1_RX_POS_2 (2<<3)
+#define TDM_SLOT1_RX_POS_3 (3<<3)
+#define TDM_SLOT1_RX_POS_4 (4<<3)
+#define TDM_SLOT1_RX_POS_5 (5<<3)
+#define TDM_SLOT1_RX_POS_6 (6<<3)
+#define TDM_SLOT1_RX_POS_7 (7<<3)
+
+#define TDM_SLOT2_RX_POS_MASK (7<<0)
+#define TDM_SLOT2_RX_POS_0 (0<<0)
+#define TDM_SLOT2_RX_POS_1 (1<<0)
+#define TDM_SLOT2_RX_POS_2 (2<<0)
+#define TDM_SLOT2_RX_POS_3 (3<<0)
+#define TDM_SLOT2_RX_POS_4 (4<<0)
+#define TDM_SLOT2_RX_POS_5 (5<<0)
+#define TDM_SLOT2_RX_POS_6 (6<<0)
+#define TDM_SLOT2_RX_POS_7 (7<<0)
+
+/* TDM2 FORMAT : 0xA6 */
+#define TDM_DL_MASK (1<<7)
+#define TDM_DL_16 (0<<7)
+#define TDM_DL_32 (1<<7)
+
+#define TDM_N_SLOT_MASK (1<<6)
+#define TDM_N_SLOT_4 (0<<6)
+#define TDM_N_SLOT_8 (1<<6)
+
+#define TDM_SLOT1_TX_POS_MASK (7<<3)
+#define TDM_SLOT1_TX_POS_0 (0<<3)
+#define TDM_SLOT1_TX_POS_1 (1<<3)
+#define TDM_SLOT1_TX_POS_2 (2<<3)
+#define TDM_SLOT1_TX_POS_3 (3<<3)
+#define TDM_SLOT1_TX_POS_4 (4<<3)
+#define TDM_SLOT1_TX_POS_5 (5<<3)
+#define TDM_SLOT1_TX_POS_6 (6<<3)
+#define TDM_SLOT1_TX_POS_7 (7<<3)
+
+#define TDM_SLOT2_TX_POS_MASK (7<<0)
+#define TDM_SLOT2_TX_POS_0 (0<<0)
+#define TDM_SLOT2_TX_POS_1 (1<<0)
+#define TDM_SLOT2_TX_POS_2 (2<<0)
+#define TDM_SLOT2_TX_POS_3 (3<<0)
+#define TDM_SLOT2_TX_POS_4 (4<<0)
+#define TDM_SLOT2_TX_POS_5 (5<<0)
+#define TDM_SLOT2_TX_POS_6 (6<<0)
+#define TDM_SLOT2_TX_POS_7 (7<<0)
+
+/* STATUS1 : 0xFA */
+#define OT1_OK_STATUS (1<<7)
+#define OT2_OK_STATUS (1<<6)
+
+/* STATUS2 : 0xFB */
+#define OCP_SPK_STATUS (1<<5)
+#define OCP_BST_STATUS (1<<4)
+#define OTP_STAT_OK_0 (5<<1)
+#define OTP_STAT_OK_1 (2<<2)
+
+#define CLK_MON_STATUS (1<<0)
+
+/* DEVICE_INFO : 0xFF */
+#define DEVICE_ID (2<<3)
+#define UVLO_BST_STATUS (1<<2)
+#define REV_NUM_STATUS (3<<0)
+#define REV_NUM_TV0 (0<<0)
+#define REV_NUM_TV1 (1<<0)
+
+#endif
-- 
2.30.2

