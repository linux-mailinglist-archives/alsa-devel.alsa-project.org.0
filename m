Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3A27F620B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 15:51:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8E84E96;
	Thu, 23 Nov 2023 15:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8E84E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700751091;
	bh=hR2jxszc9i4mAoCIMNEExFkSSG/t6QyU/NZKOiKBfl0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kyWjtGoouqQggWD/Ic45Tj4zclbWVmfDJiI5z/CubeQZtAZY7ErGKj/g9Kq6pJ5Iv
	 OG49qcsok4XXKPqO9Z8xUJ3F1JUzBm9tN8VNDGDHKTUnchCYT23Pv7rgPhfDaAatLT
	 Gpc/urbYUyHZK4v1xtkvCw+wcoCoH8VGm4tKorLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2F81F8057B; Thu, 23 Nov 2023 15:49:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C855F8057B;
	Thu, 23 Nov 2023 15:49:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98623F8065A; Thu, 23 Nov 2023 15:49:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5711F80310
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 15:49:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5711F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EpkYhTaW
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b2c8e91afso6440985e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Nov 2023 06:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700750966; x=1701355766;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZJb2zIrSJ8v3P/6Bjl4RgbM/9JfHf6iAqKJeOq/ZYY=;
        b=EpkYhTaWEHrcOhsA9I5ls6zM9FNIfisjVdyPMTR+t5LluLj1Hc08fVHLLjRwMc/T2p
         VWMwpQnqAnAkFiUBFgl62YiWCwUck2gyPxvTvymPeMEcLaow6DT2UrGZsdU8wnbcRC8T
         se4y+MJf7klEONL5WbPghZI+3ysDOTMjhPN0jxEY8x7g4DGY8xxc7oWx1QYVhE8n+V4d
         yBqJwt4tqMqqWnz/ddOAtnf87PKzi+p8xzheIreKRZgy5mQ6tlI3xmLLL2XPkj4TMTON
         oCRv0PMqpHwAVqBNuzoVOn9vScDyjl5xkV+cqw0kxO7zI1FPj0HBCqEeBiTJRztquzvn
         Bq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750966; x=1701355766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZJb2zIrSJ8v3P/6Bjl4RgbM/9JfHf6iAqKJeOq/ZYY=;
        b=pQDiSUXCXjpW0t+xWPQb0eYE1pVnmll/tiVwGhw9JEXpeOeoFKehGZXNwb3QDMa2IF
         B8b+wAZS7Ne1eh8V8cwjjbhCj95h/jBhDrKiZZe+EedC3YBPKkFWHS1hxGmHj0bA3GzO
         zcBZuhLU/PUfSn6yaSFmydRWKE4rDWOfhp1zy+NR/vgBnZmDuk4UBP0NVwjMrngyM/hw
         WNMf7cKGUljnZNwC0W2YN31kPfOUfQ9AhpN9qk+ROK10IfUmwmz0wOo5/bFO6a5JkKEK
         JEUXw4MNje4Omw2UrWir9ozDc6ZxvMT9Crpsxc8k2XfY7Ntm/ENHhgUKtHOE2d0iDHO+
         0Irg==
X-Gm-Message-State: AOJu0YwGvt449NZQvUJGr6TJ5fjFHb/oD/Xz4wYlbugTBn1fV7adMHUW
	1pE0bvUxKnViSKmTf0H8LvITXg==
X-Google-Smtp-Source: 
 AGHT+IFetn0vXarmYGLnfF1WB3GERAs34m+qQkJ0z9yWb/bPyZ0X6HwU6xdzIDd3DIj6MUtLZcwuEA==
X-Received: by 2002:a05:600c:4f52:b0:40a:28b1:70f8 with SMTP id
 m18-20020a05600c4f5200b0040a28b170f8mr4233025wmq.21.1700750965634;
        Thu, 23 Nov 2023 06:49:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c458400b004094d4292aesm2256135wmo.18.2023.11.23.06.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:49:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Nov 2023 15:49:15 +0100
Subject: [PATCH 5/5] ASoC: codecs: Add WCD939x Codec driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
In-Reply-To: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=129825;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hR2jxszc9i4mAoCIMNEExFkSSG/t6QyU/NZKOiKBfl0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlX2Zu0cYAhA1H/GXr8vFuWWlo3tHmqpthD+OhE7Lc
 05rkLueJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZV9mbgAKCRB33NvayMhJ0RyhD/
 9zxyMFd0mvIbuYdjSnTKvuelkwlO3qGs6kIalGVf8t+nebrz+JqEA905MAU6y1I1rWxHWrOPM/tDyc
 s4kwpRIpReHSIj6TCf+S8AjH4vPGyM6udwXBA6EOBxUZsHgOjyTCGMruCqg70XIOuLGYzdgoUN5H0k
 7Mw1Abuh0D5EZLQFvTq1fJWHW3IT8XtSrz/ZMBPyLc8Cy7OeVv03iwB6AlEgqi0R9tSyWrTUByUFGq
 HaSAX/7TILn6o3LTvqm/QGQMNSxDceZ4uUlVT4Ze06qG7vPMzbE5WfR1KmDPZ2G1x8+X4m5F0pbDqY
 LyjWaERntoWbiSnVJKAK2l9kwnjVFK1lSP5LPIS+SKYvmAXpHIDqkygk9KJyaIsppbjihcRUMvCc/B
 tFYpOwCYUhwxLR1Rxl/maGaSioozBBn8vCczs8lzHtTU8gW/+u8mgMC1VVCxOAUgkgG/BNNC7P6L1T
 kkdgoUDlElByM1zTffSdKkS2/1zOC5++7qmcH8dinnTIIDR1b8HbdV2AxXzjG6W0Et2g3vIyfo/tOr
 M6BpjlKle8FmEb01gnP98yPcRpiocSc/86Ks6q9bi1ERE9qhToQzwDj5km3CIa41USbAGsvXPcgp2L
 IxgOekiSMaCSECey62iwSQQOPpzkXdAOBRjE2h26YEmdCZ1+KIIR7lm6Is+A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: VMMOCK6SJYHY2QW4MP3HYI7KCZI6Q25Y
X-Message-ID-Hash: VMMOCK6SJYHY2QW4MP3HYI7KCZI6Q25Y
X-MailFrom: neil.armstrong@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMMOCK6SJYHY2QW4MP3HYI7KCZI6Q25Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the main WCD9390/WCD9395 Audio Codec driver to support:
- 4 ADC inputs for up to 5 Analog Microphones
- 4 DMIC inputs for up to 8 Digital Microphones
- 4 Microphone BIAS
- Stereo Headphone output
- Mono EAR output
- MBHC engine for Headset Detection

It makes usage of the generic MBHC and CLSH generic code and
the USB Type-C mux and switch helpers to gather USB-C Events
in order to properly setup Headset Detection mechanism
when connected behind the separate USB-C Mux subsystem.

WCD9390/WCD9395 supports a PCM path for Playback instead
of the actually implemented PDM playback, it will be
implemented later.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/codecs/Kconfig       |    8 +
 sound/soc/codecs/Makefile      |    6 +
 sound/soc/codecs/wcd-clsh-v2.h |    1 +
 sound/soc/codecs/wcd939x.c     | 3635 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 3650 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 1a29b38d4cb9..31f26eb2f833 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2056,8 +2056,16 @@ config SND_SOC_WCD938X_SDW
 	  The WCD9380/9385 is a audio codec IC Integrated in
 	  Qualcomm SoCs like SM8250.
 
+config SND_SOC_WCD939X
+	depends on SND_SOC_WCD939X_SDW
+	tristate
+	depends on SOUNDWIRE || !SOUNDWIRE
+	select SND_SOC_WCD_CLASSH
+
 config SND_SOC_WCD939X_SDW
 	tristate "WCD9390/WCD9395 Codec - SDW"
+	select SND_SOC_WCD939X
+	select SND_SOC_WCD_MBHC
 	select REGMAP_IRQ
 	depends on SOUNDWIRE
 	select REGMAP_SOUNDWIRE
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index c63e4c274ed4..4fba9fbb6516 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -312,6 +312,7 @@ snd-soc-wcd9335-objs := wcd9335.o
 snd-soc-wcd934x-objs := wcd934x.o
 snd-soc-wcd938x-objs := wcd938x.o
 snd-soc-wcd938x-sdw-objs := wcd938x-sdw.o
+snd-soc-wcd939x-objs := wcd939x.o
 snd-soc-wcd939x-sdw-objs := wcd939x-sdw.o
 snd-soc-wl1273-objs := wl1273.o
 snd-soc-wm-adsp-objs := wm_adsp.o
@@ -702,6 +703,11 @@ ifdef CONFIG_SND_SOC_WCD938X_SDW
 # avoid link failure by forcing sdw code built-in when needed
 obj-$(CONFIG_SND_SOC_WCD938X) += snd-soc-wcd938x-sdw.o
 endif
+obj-$(CONFIG_SND_SOC_WCD939X)	+= snd-soc-wcd939x.o
+ifdef CONFIG_SND_SOC_WCD939X_SDW
+# avoid link failure by forcing sdw code built-in when needed
+obj-$(CONFIG_SND_SOC_WCD939X) += snd-soc-wcd939x-sdw.o
+endif
 obj-$(CONFIG_SND_SOC_WL1273)	+= snd-soc-wl1273.o
 obj-$(CONFIG_SND_SOC_WM0010)	+= snd-soc-wm0010.o
 obj-$(CONFIG_SND_SOC_WM1250_EV1) += snd-soc-wm1250-ev1.o
diff --git a/sound/soc/codecs/wcd-clsh-v2.h b/sound/soc/codecs/wcd-clsh-v2.h
index 4e3653058275..eeb9bc5b01e2 100644
--- a/sound/soc/codecs/wcd-clsh-v2.h
+++ b/sound/soc/codecs/wcd-clsh-v2.h
@@ -47,6 +47,7 @@ enum wcd_codec_version {
 	/* New CLSH after this */
 	WCD937X  = 2,
 	WCD938X  = 3,
+	WCD939X  = 4,
 };
 struct wcd_clsh_ctrl;
 
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
new file mode 100644
index 000000000000..47af08e6c0c8
--- /dev/null
+++ b/sound/soc/codecs/wcd939x.c
@@ -0,0 +1,3635 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/pm_runtime.h>
+#include <linux/component.h>
+#include <sound/tlv.h>
+#include <linux/of_gpio.h>
+#include <linux/of_graph.h>
+#include <linux/of.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_altmode.h>
+
+#include "wcd-clsh-v2.h"
+#include "wcd-mbhc-v2.h"
+#include "wcd939x.h"
+
+#define WCD939X_MAX_MICBIAS		(4)
+#define WCD939X_MAX_SUPPLY		(4)
+#define WCD939X_MBHC_MAX_BUTTONS	(8)
+#define TX_ADC_MAX			(4)
+#define WCD_MBHC_HS_V_MAX		1600
+
+enum {
+	WCD939X_VERSION_1_0 = 0,
+	WCD939X_VERSION_1_1,
+	WCD939X_VERSION_2_0,
+};
+
+#define WCD939X_RATES_MASK (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+			    SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+			    SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000 |\
+			    SNDRV_PCM_RATE_384000)
+/* Fractional Rates */
+#define WCD939X_FRAC_RATES_MASK (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_88200 |\
+				 SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800)
+#define WCD939X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S24_3LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+/* Convert from vout ctl to micbias voltage in mV */
+#define WCD_VOUT_CTL_TO_MICB(v)		(1000 + (v) * 50)
+#define SWR_CLK_RATE_0P6MHZ		(600000)
+#define SWR_CLK_RATE_1P2MHZ		(1200000)
+#define SWR_CLK_RATE_2P4MHZ		(2400000)
+#define SWR_CLK_RATE_4P8MHZ		(4800000)
+#define SWR_CLK_RATE_9P6MHZ		(9600000)
+#define SWR_CLK_RATE_11P2896MHZ		(1128960)
+
+#define ADC_MODE_VAL_HIFI		0x01
+#define ADC_MODE_VAL_LO_HIF		0x02
+#define ADC_MODE_VAL_NORMAL		0x03
+#define ADC_MODE_VAL_LP			0x05
+#define ADC_MODE_VAL_ULP1		0x09
+#define ADC_MODE_VAL_ULP2		0x0B
+
+/* Z value defined in milliohm */
+#define WCD939X_ZDET_VAL_32		(32000)
+#define WCD939X_ZDET_VAL_400		(400000)
+#define WCD939X_ZDET_VAL_1200		(1200000)
+#define WCD939X_ZDET_VAL_100K		(100000000)
+
+/* Z floating defined in ohms */
+#define WCD939X_ZDET_FLOATING_IMPEDANCE	(0x0FFFFFFE)
+#define WCD939X_ZDET_NUM_MEASUREMENTS	(900)
+#define WCD939X_MBHC_GET_C1(c)		(((c) & 0xC000) >> 14)
+#define WCD939X_MBHC_GET_X1(x)		((x) & 0x3FFF)
+
+/* Z value compared in milliOhm */
+#define WCD939X_MBHC_IS_SECOND_RAMP_REQUIRED(z) false
+#define WCD939X_ANA_MBHC_ZDET_CONST	(1018 * 1024)
+
+enum {
+	WCD9390 = 0,
+	WCD9395 = 5,
+};
+
+enum {
+	/* INTR_CTRL_INT_MASK_0 */
+	WCD939X_IRQ_MBHC_BUTTON_PRESS_DET = 0,
+	WCD939X_IRQ_MBHC_BUTTON_RELEASE_DET,
+	WCD939X_IRQ_MBHC_ELECT_INS_REM_DET,
+	WCD939X_IRQ_MBHC_ELECT_INS_REM_LEG_DET,
+	WCD939X_IRQ_MBHC_SW_DET,
+	WCD939X_IRQ_HPHR_OCP_INT,
+	WCD939X_IRQ_HPHR_CNP_INT,
+	WCD939X_IRQ_HPHL_OCP_INT,
+
+	/* INTR_CTRL_INT_MASK_1 */
+	WCD939X_IRQ_HPHL_CNP_INT,
+	WCD939X_IRQ_EAR_CNP_INT,
+	WCD939X_IRQ_EAR_SCD_INT,
+	WCD939X_IRQ_HPHL_PDM_WD_INT,
+	WCD939X_IRQ_HPHR_PDM_WD_INT,
+	WCD939X_IRQ_EAR_PDM_WD_INT,
+
+	/* INTR_CTRL_INT_MASK_2 */
+	WCD939X_IRQ_MBHC_MOISTURE_INT,
+	WCD939X_IRQ_HPHL_SURGE_DET_INT,
+	WCD939X_IRQ_HPHR_SURGE_DET_INT,
+	WCD939X_NUM_IRQS,
+};
+
+enum {
+	WCD_ADC1 = 0,
+	WCD_ADC2,
+	WCD_ADC3,
+	WCD_ADC4,
+	HPH_PA_DELAY,
+};
+
+enum {
+	ADC_MODE_INVALID = 0,
+	ADC_MODE_HIFI,
+	ADC_MODE_LO_HIF,
+	ADC_MODE_NORMAL,
+	ADC_MODE_LP,
+	ADC_MODE_ULP1,
+	ADC_MODE_ULP2,
+};
+
+enum {
+	AIF1_PB = 0,
+	AIF1_CAP,
+	NUM_CODEC_DAIS,
+};
+
+static u8 tx_mode_bit[] = {
+	[ADC_MODE_INVALID] = 0x00,
+	[ADC_MODE_HIFI] = 0x01,
+	[ADC_MODE_LO_HIF] = 0x02,
+	[ADC_MODE_NORMAL] = 0x04,
+	[ADC_MODE_LP] = 0x08,
+	[ADC_MODE_ULP1] = 0x10,
+	[ADC_MODE_ULP2] = 0x20,
+};
+
+struct wcd939x_priv {
+	struct sdw_slave *tx_sdw_dev;
+	struct wcd939x_sdw_priv *sdw_priv[NUM_CODEC_DAIS];
+	struct device *txdev;
+	struct device *rxdev;
+	struct device_node *rxnode, *txnode;
+	struct regmap *regmap;
+	struct snd_soc_component *component;
+	/* micb setup lock */
+	struct mutex micb_lock;
+	/* typec handling */
+	bool typec_analog_mux;
+	struct typec_mux_dev *typec_mux;
+	struct typec_switch_dev *typec_sw;
+	enum typec_orientation typec_orientation;
+	unsigned long typec_mode;
+	struct typec_switch *typec_switch;
+	/* mbhc module */
+	struct wcd_mbhc *wcd_mbhc;
+	struct wcd_mbhc_config mbhc_cfg;
+	struct wcd_mbhc_intr intr_ids;
+	struct wcd_clsh_ctrl *clsh_info;
+	struct irq_domain *virq;
+	struct regmap_irq_chip *wcd_regmap_irq_chip;
+	struct regmap_irq_chip_data *irq_chip;
+	struct regulator_bulk_data supplies[WCD939X_MAX_SUPPLY];
+	struct snd_soc_jack *jack;
+	unsigned long status_mask;
+	s32 micb_ref[WCD939X_MAX_MICBIAS];
+	s32 pullup_ref[WCD939X_MAX_MICBIAS];
+	u32 hph_mode;
+	u32 tx_mode[TX_ADC_MAX];
+	int variant;
+	int reset_gpio;
+	u32 micb1_mv;
+	u32 micb2_mv;
+	u32 micb3_mv;
+	u32 micb4_mv;
+	int hphr_pdm_wd_int;
+	int hphl_pdm_wd_int;
+	int ear_pdm_wd_int;
+	bool comp1_enable;
+	bool comp2_enable;
+	bool ldoh;
+};
+
+static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
+static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
+
+struct wcd939x_mbhc_zdet_param {
+	u16 ldo_ctl;
+	u16 noff;
+	u16 nshift;
+	u16 btn5;
+	u16 btn6;
+	u16 btn7;
+};
+
+static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD939X_ANA_MBHC_MECH, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD939X_ANA_MBHC_MECH, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD939X_ANA_MBHC_MECH, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_MIC_CLAMP_CTL, WCD939X_MBHC_NEW_PLUG_DETECT_CTL, 0x30),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_DETECTION_TYPE, WCD939X_ANA_MBHC_ELECT, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_CTRL, WCD939X_MBHC_NEW_INT_MECH_DET_CURRENT, 0x1F),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, WCD939X_ANA_MBHC_MECH, 0x04),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PLUG_TYPE, WCD939X_ANA_MBHC_MECH, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_GND_PLUG_TYPE, WCD939X_ANA_MBHC_MECH, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_SW_HPH_LP_100K_TO_GND, WCD939X_ANA_MBHC_MECH, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_SCHMT_ISRC, WCD939X_ANA_MBHC_ELECT, 0x06),
+	WCD_MBHC_FIELD(WCD_MBHC_FSM_EN, WCD939X_ANA_MBHC_ELECT, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_INSREM_DBNC, WCD939X_MBHC_NEW_PLUG_DETECT_CTL, 0x0F),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_DBNC, WCD939X_MBHC_NEW_CTL_1, 0x03),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_VREF, WCD939X_MBHC_NEW_CTL_2, 0x03),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_COMP_RESULT, WCD939X_ANA_MBHC_RESULT_3, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_IN2P_CLAMP_STATE, WCD939X_ANA_MBHC_RESULT_3, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_MIC_SCHMT_RESULT, WCD939X_ANA_MBHC_RESULT_3, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_SCHMT_RESULT, WCD939X_ANA_MBHC_RESULT_3, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_SCHMT_RESULT, WCD939X_ANA_MBHC_RESULT_3, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_OCP_FSM_EN, WCD939X_HPH_OCP_CTL, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_RESULT, WCD939X_ANA_MBHC_RESULT_3, 0x07),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_ISRC_CTL, WCD939X_ANA_MBHC_ELECT, 0x70),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_RESULT, WCD939X_ANA_MBHC_RESULT_3, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_MICB_CTRL, WCD939X_ANA_MICB2, 0xC0),
+	WCD_MBHC_FIELD(WCD_MBHC_HPH_CNP_WG_TIME, WCD939X_HPH_CNP_WG_TIME, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_PA_EN, WCD939X_ANA_HPH, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PA_EN, WCD939X_ANA_HPH, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPH_PA_EN, WCD939X_ANA_HPH, 0xC0),
+	WCD_MBHC_FIELD(WCD_MBHC_SWCH_LEVEL_REMOVE, WCD939X_ANA_MBHC_RESULT_3, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_ANC_DET_EN, WCD939X_MBHC_CTL_BCS, 0x02),
+	WCD_MBHC_FIELD(WCD_MBHC_FSM_STATUS, WCD939X_MBHC_NEW_FSM_STATUS, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_MUX_CTL, WCD939X_MBHC_NEW_CTL_2, 0x70),
+	WCD_MBHC_FIELD(WCD_MBHC_MOISTURE_STATUS, WCD939X_MBHC_NEW_FSM_STATUS, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_GND, WCD939X_HPH_PA_CTL2, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_GND, WCD939X_HPH_PA_CTL2, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_DET_EN, WCD939X_HPH_L_TEST, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_DET_EN, WCD939X_HPH_R_TEST, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_STATUS, WCD939X_DIGITAL_INTR_STATUS_0, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_STATUS, WCD939X_DIGITAL_INTR_STATUS_0, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_EN, WCD939X_MBHC_NEW_CTL_1, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_COMPLETE, WCD939X_MBHC_NEW_FSM_STATUS, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_TIMEOUT, WCD939X_MBHC_NEW_FSM_STATUS, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_RESULT, WCD939X_MBHC_NEW_ADC_RESULT, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_MICB2_VOUT, WCD939X_ANA_MICB2, 0x3F),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_MODE, WCD939X_MBHC_NEW_CTL_1, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_DETECTION_DONE, WCD939X_MBHC_NEW_CTL_1, 0x04),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_ISRC_EN, WCD939X_ANA_MBHC_ZDET, 0x02),
+};
+
+static const struct regmap_irq wcd939x_irqs[WCD939X_NUM_IRQS] = {
+	REGMAP_IRQ_REG(WCD939X_IRQ_MBHC_BUTTON_PRESS_DET, 0, 0x01),
+	REGMAP_IRQ_REG(WCD939X_IRQ_MBHC_BUTTON_RELEASE_DET, 0, 0x02),
+	REGMAP_IRQ_REG(WCD939X_IRQ_MBHC_ELECT_INS_REM_DET, 0, 0x04),
+	REGMAP_IRQ_REG(WCD939X_IRQ_MBHC_ELECT_INS_REM_LEG_DET, 0, 0x08),
+	REGMAP_IRQ_REG(WCD939X_IRQ_MBHC_SW_DET, 0, 0x10),
+	REGMAP_IRQ_REG(WCD939X_IRQ_HPHR_OCP_INT, 0, 0x20),
+	REGMAP_IRQ_REG(WCD939X_IRQ_HPHR_CNP_INT, 0, 0x40),
+	REGMAP_IRQ_REG(WCD939X_IRQ_HPHL_OCP_INT, 0, 0x80),
+	REGMAP_IRQ_REG(WCD939X_IRQ_HPHL_CNP_INT, 1, 0x01),
+	REGMAP_IRQ_REG(WCD939X_IRQ_EAR_CNP_INT, 1, 0x02),
+	REGMAP_IRQ_REG(WCD939X_IRQ_EAR_SCD_INT, 1, 0x04),
+	REGMAP_IRQ_REG(WCD939X_IRQ_HPHL_PDM_WD_INT, 1, 0x20),
+	REGMAP_IRQ_REG(WCD939X_IRQ_HPHR_PDM_WD_INT, 1, 0x40),
+	REGMAP_IRQ_REG(WCD939X_IRQ_EAR_PDM_WD_INT, 1, 0x80),
+	REGMAP_IRQ_REG(WCD939X_IRQ_MBHC_MOISTURE_INT, 2, 0x02),
+	REGMAP_IRQ_REG(WCD939X_IRQ_HPHL_SURGE_DET_INT, 2, 0x04),
+	REGMAP_IRQ_REG(WCD939X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
+};
+
+static struct regmap_irq_chip wcd939x_regmap_irq_chip = {
+	.name = "wcd939x",
+	.irqs = wcd939x_irqs,
+	.num_irqs = ARRAY_SIZE(wcd939x_irqs),
+	.num_regs = 3,
+	.status_base = WCD939X_DIGITAL_INTR_STATUS_0,
+	.mask_base = WCD939X_DIGITAL_INTR_MASK_0,
+	.ack_base = WCD939X_DIGITAL_INTR_CLEAR_0,
+	.use_ack = 1,
+	.runtime_pm = true,
+	.irq_drv_data = NULL,
+};
+
+static int wcd939x_get_clk_rate(int mode)
+{
+	int rate;
+
+	switch (mode) {
+	case ADC_MODE_ULP2:
+		rate = SWR_CLK_RATE_0P6MHZ;
+		break;
+	case ADC_MODE_ULP1:
+		rate = SWR_CLK_RATE_1P2MHZ;
+		break;
+	case ADC_MODE_LP:
+		rate = SWR_CLK_RATE_4P8MHZ;
+		break;
+	case ADC_MODE_NORMAL:
+	case ADC_MODE_LO_HIF:
+	case ADC_MODE_HIFI:
+	case ADC_MODE_INVALID:
+	default:
+		rate = SWR_CLK_RATE_9P6MHZ;
+		break;
+	}
+
+	return rate;
+}
+
+static int wcd939x_set_swr_clk_rate(struct snd_soc_component *component, int rate, int bank)
+{
+	u8 mask = (bank ? 0xF0 : 0x0F);
+	u8 val = 0;
+
+	switch (rate) {
+	case SWR_CLK_RATE_0P6MHZ:
+		val = 6;
+		break;
+	case SWR_CLK_RATE_1P2MHZ:
+		val = 5;
+		break;
+	case SWR_CLK_RATE_2P4MHZ:
+		val = 3;
+		break;
+	case SWR_CLK_RATE_4P8MHZ:
+		val = 1;
+		break;
+	case SWR_CLK_RATE_9P6MHZ:
+	default:
+		val = 0;
+		break;
+	}
+
+	snd_soc_component_write_field(component, WCD939X_DIGITAL_SWR_TX_CLK_RATE, mask, val);
+
+	return 0;
+}
+
+static int wcd939x_io_init(struct snd_soc_component *component)
+{
+	snd_soc_component_write_field(component, WCD939X_ANA_BIAS,
+				      WCD939X_BIAS_ANALOG_BIAS_EN, 1);
+	snd_soc_component_write_field(component, WCD939X_ANA_BIAS,
+				      WCD939X_BIAS_PRECHRG_EN, 1);
+
+	/* 10 msec delay as per HW requirement */
+	usleep_range(10000, 10010);
+	snd_soc_component_write_field(component, WCD939X_ANA_BIAS,
+				      WCD939X_BIAS_PRECHRG_EN, 0);
+
+	snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+				      WCD939X_RDAC_HD2_CTL_L_HD2_RES_DIV_CTL_L, 0x15);
+	snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_RDAC_HD2_CTL_R,
+				      WCD939X_RDAC_HD2_CTL_R_HD2_RES_DIV_CTL_R, 0x15);
+	snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_DMIC_CTL,
+				      WCD939X_CDC_DMIC_CTL_CLK_SCALE_EN, 1);
+
+	snd_soc_component_write_field(component, WCD939X_TX_COM_NEW_INT_FE_ICTRL_STG2CASC_ULP,
+				      WCD939X_FE_ICTRL_STG2CASC_ULP_ICTRL_SCBIAS_ULP0P6M, 1);
+	snd_soc_component_write_field(component, WCD939X_TX_COM_NEW_INT_FE_ICTRL_STG2CASC_ULP,
+				      WCD939X_FE_ICTRL_STG2CASC_ULP_VALUE, 4);
+
+	snd_soc_component_write_field(component, WCD939X_TX_COM_NEW_INT_FE_ICTRL_STG2MAIN_ULP,
+				      WCD939X_FE_ICTRL_STG2MAIN_ULP_VALUE, 8);
+
+	snd_soc_component_write_field(component, WCD939X_MICB1_TEST_CTL_1,
+				      WCD939X_TEST_CTL_1_NOISE_FILT_RES_VAL, 7);
+	snd_soc_component_write_field(component, WCD939X_MICB2_TEST_CTL_1,
+				      WCD939X_TEST_CTL_1_NOISE_FILT_RES_VAL, 7);
+	snd_soc_component_write_field(component, WCD939X_MICB3_TEST_CTL_1,
+				      WCD939X_TEST_CTL_1_NOISE_FILT_RES_VAL, 7);
+	snd_soc_component_write_field(component, WCD939X_MICB4_TEST_CTL_1,
+				      WCD939X_TEST_CTL_1_NOISE_FILT_RES_VAL, 7);
+	snd_soc_component_write_field(component, WCD939X_TX_3_4_TEST_BLK_EN2,
+				      WCD939X_TEST_BLK_EN2_TXFE2_MBHC_CLKRST_EN, 0);
+
+	snd_soc_component_write_field(component, WCD939X_HPH_SURGE_EN,
+				      WCD939X_EN_EN_SURGE_PROTECTION_HPHL, 0);
+	snd_soc_component_write_field(component, WCD939X_HPH_SURGE_EN,
+				      WCD939X_EN_EN_SURGE_PROTECTION_HPHR, 0);
+
+	snd_soc_component_write_field(component, WCD939X_HPH_OCP_CTL,
+				      WCD939X_OCP_CTL_OCP_FSM_EN, 1);
+	snd_soc_component_write_field(component, WCD939X_HPH_OCP_CTL,
+				      WCD939X_OCP_CTL_SCD_OP_EN, 1);
+
+	snd_soc_component_write(component, WCD939X_E_CFG0,
+				WCD939X_CFG0_IDLE_STEREO |
+				WCD939X_CFG0_AUTO_DISABLE_ANC);
+
+	return 0;
+}
+
+static int wcd939x_sdw_connect_port(struct wcd939x_sdw_ch_info *ch_info,
+				    struct sdw_port_config *port_config,
+				    u8 enable)
+{
+	u8 ch_mask, port_num;
+
+	port_num = ch_info->port_num;
+	ch_mask = ch_info->ch_mask;
+
+	port_config->num = port_num;
+
+	if (enable)
+		port_config->ch_mask |= ch_mask;
+	else
+		port_config->ch_mask &= ~ch_mask;
+
+	return 0;
+}
+
+static int wcd939x_connect_port(struct wcd939x_sdw_priv *wcd, u8 port_num, u8 ch_id, u8 enable)
+{
+	return wcd939x_sdw_connect_port(&wcd->ch_info[ch_id],
+					&wcd->port_config[port_num - 1],
+					enable);
+}
+
+static int wcd939x_codec_enable_rxclk(struct snd_soc_dapm_widget *w,
+				      struct snd_kcontrol *kcontrol,
+				      int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component, WCD939X_ANA_RX_SUPPLIES,
+					      WCD939X_RX_SUPPLIES_RX_BIAS_ENABLE, 1);
+
+		/* Analog path clock controls */
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_RX_CLK_EN, 1);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_RX_DIV2_CLK_EN, 1);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_RX_DIV4_CLK_EN, 1);
+
+		/* Digital path clock controls */
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+					      WCD939X_CDC_DIG_CLK_CTL_RXD0_CLK_EN, 1);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+					      WCD939X_CDC_DIG_CLK_CTL_RXD1_CLK_EN, 1);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+					      WCD939X_CDC_DIG_CLK_CTL_RXD2_CLK_EN, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, WCD939X_ANA_RX_SUPPLIES,
+					      WCD939X_RX_SUPPLIES_VNEG_EN, 0);
+		snd_soc_component_write_field(component, WCD939X_ANA_RX_SUPPLIES,
+					      WCD939X_RX_SUPPLIES_VPOS_EN, 0);
+
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+					      WCD939X_CDC_DIG_CLK_CTL_RXD2_CLK_EN, 0);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+					      WCD939X_CDC_DIG_CLK_CTL_RXD1_CLK_EN, 0);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+					      WCD939X_CDC_DIG_CLK_CTL_RXD0_CLK_EN, 0);
+
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_RX_DIV4_CLK_EN, 0);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_RX_DIV2_CLK_EN, 0);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_RX_CLK_EN, 0);
+
+		snd_soc_component_write_field(component, WCD939X_ANA_RX_SUPPLIES,
+					      WCD939X_RX_SUPPLIES_RX_BIAS_ENABLE, 0);
+
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component, WCD939X_HPH_RDAC_CLK_CTL1,
+					      WCD939X_RDAC_CLK_CTL1_OPAMP_CHOP_CLK_EN, 0);
+
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_HPH_GAIN_CTL,
+					      WCD939X_CDC_HPH_GAIN_CTL_HPHL_RX_EN, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+					      WCD939X_RDAC_HD2_CTL_L_HD2_RES_DIV_CTL_L, 0x1D);
+		if (wcd939x->comp1_enable) {
+			snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_COMP_CTL_0,
+						      WCD939X_CDC_COMP_CTL_0_HPHL_COMP_EN, 1);
+			 /* 5msec compander delay as per HW requirement */
+			if (!wcd939x->comp2_enable ||
+			    (snd_soc_component_read(component,
+						    WCD939X_DIGITAL_CDC_COMP_CTL_0) & 1))
+				usleep_range(5000, 5010);
+
+			snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_TIMER1,
+						      WCD939X_TIMER1_AUTOCHOP_TIMER_CTL_EN, 0);
+		} else {
+			snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_COMP_CTL_0,
+						      WCD939X_CDC_COMP_CTL_0_HPHL_COMP_EN, 0);
+			snd_soc_component_write_field(component, WCD939X_HPH_L_EN,
+						      WCD939X_L_EN_GAIN_SOURCE_SEL, 1);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+					      WCD939X_RDAC_HD2_CTL_L_HD2_RES_DIV_CTL_L, 1);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_HPH_GAIN_CTL,
+					      WCD939X_CDC_HPH_GAIN_CTL_HPHL_RX_EN, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	dev_dbg(component->dev, "%s wname: %s event: %d\n", __func__,
+		w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component, WCD939X_HPH_RDAC_CLK_CTL1,
+					      WCD939X_RDAC_CLK_CTL1_OPAMP_CHOP_CLK_EN, 0);
+
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_HPH_GAIN_CTL,
+					      WCD939X_CDC_HPH_GAIN_CTL_HPHR_RX_EN, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_RDAC_HD2_CTL_R,
+					      WCD939X_RDAC_HD2_CTL_R_HD2_RES_DIV_CTL_R, 0x1D);
+		if (wcd939x->comp2_enable) {
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_COMP_CTL_0,
+						      WCD939X_CDC_COMP_CTL_0_HPHR_COMP_EN, 1);
+			/* 5msec compander delay as per HW requirement */
+			if (!wcd939x->comp1_enable ||
+			    (snd_soc_component_read(component,
+						    WCD939X_DIGITAL_CDC_COMP_CTL_0) & 0x02))
+				usleep_range(5000, 5010);
+			snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_TIMER1,
+						      WCD939X_TIMER1_AUTOCHOP_TIMER_CTL_EN, 0);
+		} else {
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_COMP_CTL_0,
+						      WCD939X_CDC_COMP_CTL_0_HPHR_COMP_EN, 0);
+			snd_soc_component_write_field(component, WCD939X_HPH_R_EN,
+						      WCD939X_R_EN_GAIN_SOURCE_SEL, 1);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_RDAC_HD2_CTL_R,
+					      WCD939X_RDAC_HD2_CTL_R_HD2_RES_DIV_CTL_R, 1);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_HPH_GAIN_CTL,
+					      WCD939X_CDC_HPH_GAIN_CTL_HPHR_RX_EN, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol,
+				       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_EAR_GAIN_CTL,
+					      WCD939X_CDC_EAR_GAIN_CTL_EAR_EN, 1);
+
+		snd_soc_component_write_field(component, WCD939X_EAR_DAC_CON,
+					      WCD939X_DAC_CON_DAC_SAMPLE_EDGE_SEL, 0);
+
+		/* 5 msec delay as per HW requirement */
+		usleep_range(5000, 5010);
+		wcd_clsh_ctrl_set_state(wcd939x->clsh_info, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_EAR, CLS_AB_HIFI);
+
+		snd_soc_component_write_field(component, WCD939X_FLYBACK_VNEG_CTRL_4,
+					      WCD939X_VNEG_CTRL_4_ILIM_SEL, 0xD);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, WCD939X_EAR_DAC_CON,
+					      WCD939X_DAC_CON_DAC_SAMPLE_EDGE_SEL, 1);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd939x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (wcd939x->ldoh)
+			snd_soc_component_write_field(component, WCD939X_LDOH_MODE,
+						      WCD939X_MODE_LDOH_EN, 1);
+
+		wcd_clsh_ctrl_set_state(wcd939x->clsh_info, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHR, hph_mode);
+		wcd_clsh_set_hph_mode(wcd939x->clsh_info, CLS_H_HIFI);
+
+		if (hph_mode == CLS_H_LP || hph_mode == CLS_H_LOHIFI || hph_mode == CLS_H_ULP)
+			snd_soc_component_write_field(component,
+					WCD939X_HPH_REFBUFF_LP_CTL,
+					WCD939X_REFBUFF_LP_CTL_PREREF_FILT_BYPASS, 1);
+		if (hph_mode == CLS_H_LOHIFI)
+			snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+						       WCD939X_HPH_PWR_LEVEL, 0);
+
+		snd_soc_component_write_field(component, WCD939X_FLYBACK_VNEG_CTRL_4,
+					      WCD939X_VNEG_CTRL_4_ILIM_SEL, 0xD);
+		snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+					      WCD939X_HPH_HPHR_REF_ENABLE, 1);
+
+		if ((snd_soc_component_read(component, WCD939X_ANA_HPH) & 0x30) == 0x30)
+			usleep_range(2500, 2600); /* 2.5msec delay as per HW requirement */
+
+		set_bit(HPH_PA_DELAY, &wcd939x->status_mask);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_PDM_WD_CTL1,
+					      WCD939X_PDM_WD_CTL1_PDM_WD_EN, 3);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (test_bit(HPH_PA_DELAY, &wcd939x->status_mask)) {
+			if (!wcd939x->comp2_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+
+			if (hph_mode == CLS_H_LP || hph_mode == CLS_H_LOHIFI ||
+			    hph_mode == CLS_H_ULP)
+				snd_soc_component_write_field(component,
+						WCD939X_HPH_REFBUFF_LP_CTL,
+						WCD939X_REFBUFF_LP_CTL_PREREF_FILT_BYPASS, 0);
+			clear_bit(HPH_PA_DELAY, &wcd939x->status_mask);
+		}
+		snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_TIMER1,
+					      WCD939X_TIMER1_AUTOCHOP_TIMER_CTL_EN, 1);
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI ||
+		    hph_mode == CLS_AB_LP || hph_mode == CLS_AB_LOHIFI)
+			snd_soc_component_write_field(component, WCD939X_ANA_RX_SUPPLIES,
+						      WCD939X_RX_SUPPLIES_REGULATOR_MODE, 1);
+
+		enable_irq(wcd939x->hphr_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd939x->hphr_pdm_wd_int);
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (!wcd939x->comp2_enable)
+			usleep_range(20000, 20100);
+		else
+			usleep_range(7000, 7100);
+
+		snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+					      WCD939X_HPH_HPHR_ENABLE, 0);
+
+		wcd_mbhc_event_notify(wcd939x->wcd_mbhc,
+				      WCD_EVENT_PRE_HPHR_PA_OFF);
+		set_bit(HPH_PA_DELAY, &wcd939x->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (test_bit(HPH_PA_DELAY, &wcd939x->status_mask)) {
+			if (!wcd939x->comp2_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+			clear_bit(HPH_PA_DELAY, &wcd939x->status_mask);
+		}
+		wcd_mbhc_event_notify(wcd939x->wcd_mbhc,
+				      WCD_EVENT_POST_HPHR_PA_OFF);
+
+		snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+					      WCD939X_HPH_HPHR_REF_ENABLE, 0);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_PDM_WD_CTL1,
+					      WCD939X_PDM_WD_CTL1_PDM_WD_EN, 0);
+
+		wcd_clsh_ctrl_set_state(wcd939x->clsh_info, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHR, hph_mode);
+		if (wcd939x->ldoh)
+			snd_soc_component_write_field(component, WCD939X_LDOH_MODE,
+						      WCD939X_MODE_LDOH_EN, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd939x->hph_mode;
+
+	dev_dbg(component->dev, "%s wname: %s event: %d\n", __func__,
+		w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (wcd939x->ldoh)
+			snd_soc_component_write_field(component, WCD939X_LDOH_MODE,
+						      WCD939X_MODE_LDOH_EN, 1);
+		wcd_clsh_ctrl_set_state(wcd939x->clsh_info, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHL, hph_mode);
+		wcd_clsh_set_hph_mode(wcd939x->clsh_info, CLS_H_HIFI);
+
+		if (hph_mode == CLS_H_LP || hph_mode == CLS_H_LOHIFI || hph_mode == CLS_H_ULP)
+			snd_soc_component_write_field(component,
+						WCD939X_HPH_REFBUFF_LP_CTL,
+						WCD939X_REFBUFF_LP_CTL_PREREF_FILT_BYPASS, 1);
+		if (hph_mode == CLS_H_LOHIFI)
+			snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+						       WCD939X_HPH_PWR_LEVEL, 0);
+
+		snd_soc_component_write_field(component, WCD939X_FLYBACK_VNEG_CTRL_4,
+					      WCD939X_VNEG_CTRL_4_ILIM_SEL, 0xD);
+		snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+					      WCD939X_HPH_HPHL_REF_ENABLE, 1);
+
+		if ((snd_soc_component_read(component, WCD939X_ANA_HPH) & 0x30) == 0x30)
+			usleep_range(2500, 2600); /* 2.5msec delay as per HW requirement */
+
+		set_bit(HPH_PA_DELAY, &wcd939x->status_mask);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_PDM_WD_CTL0,
+					      WCD939X_PDM_WD_CTL0_PDM_WD_EN, 3);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (test_bit(HPH_PA_DELAY, &wcd939x->status_mask)) {
+			if (!wcd939x->comp1_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+			if (hph_mode == CLS_H_LP || hph_mode == CLS_H_LOHIFI ||
+			    hph_mode == CLS_H_ULP)
+				snd_soc_component_write_field(component,
+						WCD939X_HPH_REFBUFF_LP_CTL,
+						WCD939X_REFBUFF_LP_CTL_PREREF_FILT_BYPASS, 0);
+			clear_bit(HPH_PA_DELAY, &wcd939x->status_mask);
+		}
+		snd_soc_component_write_field(component, WCD939X_HPH_NEW_INT_TIMER1,
+					      WCD939X_TIMER1_AUTOCHOP_TIMER_CTL_EN, 1);
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI ||
+		    hph_mode == CLS_AB_LP || hph_mode == CLS_AB_LOHIFI)
+			snd_soc_component_write_field(component, WCD939X_ANA_RX_SUPPLIES,
+						      WCD939X_RX_SUPPLIES_REGULATOR_MODE, 1);
+		enable_irq(wcd939x->hphl_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd939x->hphl_pdm_wd_int);
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (!wcd939x->comp1_enable)
+			usleep_range(20000, 20100);
+		else
+			usleep_range(7000, 7100);
+		snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+					      WCD939X_HPH_HPHL_ENABLE, 0);
+		wcd_mbhc_event_notify(wcd939x->wcd_mbhc, WCD_EVENT_PRE_HPHL_PA_OFF);
+		set_bit(HPH_PA_DELAY, &wcd939x->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * 7ms sleep is required if compander is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is required.
+		 */
+		if (test_bit(HPH_PA_DELAY, &wcd939x->status_mask)) {
+			if (!wcd939x->comp1_enable)
+				usleep_range(21000, 21100);
+			else
+				usleep_range(7000, 7100);
+			clear_bit(HPH_PA_DELAY, &wcd939x->status_mask);
+		}
+		wcd_mbhc_event_notify(wcd939x->wcd_mbhc,
+				      WCD_EVENT_POST_HPHL_PA_OFF);
+		snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+					      WCD939X_HPH_HPHL_REF_ENABLE, 0);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_PDM_WD_CTL0,
+					      WCD939X_PDM_WD_CTL0_PDM_WD_EN, 0);
+		wcd_clsh_ctrl_set_state(wcd939x->clsh_info, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHL, hph_mode);
+		if (wcd939x->ldoh)
+			snd_soc_component_write_field(component, WCD939X_LDOH_MODE,
+						      WCD939X_MODE_LDOH_EN, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/*
+		 * Enable watchdog interrupt for HPHL
+		 */
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_PDM_WD_CTL0,
+					      WCD939X_PDM_WD_CTL0_PDM_WD_EN, 3);
+		/* For EAR, use CLASS_AB regulator mode */
+		snd_soc_component_write_field(component, WCD939X_ANA_RX_SUPPLIES,
+					      WCD939X_RX_SUPPLIES_REGULATOR_MODE, 1);
+		snd_soc_component_write_field(component, WCD939X_ANA_EAR_COMPANDER_CTL,
+					      WCD939X_EAR_COMPANDER_CTL_GAIN_OVRD_REG, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* 6 msec delay as per HW requirement */
+		usleep_range(6000, 6010);
+		enable_irq(wcd939x->ear_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd939x->ear_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, WCD939X_ANA_EAR_COMPANDER_CTL,
+					      WCD939X_EAR_COMPANDER_CTL_GAIN_OVRD_REG, 0);
+		/* 7 msec delay as per HW requirement */
+		usleep_range(7000, 7010);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_PDM_WD_CTL0,
+					      WCD939X_PDM_WD_CTL0_PDM_WD_EN, 0);
+		wcd_clsh_ctrl_set_state(wcd939x->clsh_info, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_EAR, CLS_AB_HIFI);
+		break;
+	}
+
+	return 0;
+}
+
+/* TX Controls */
+
+static int wcd939x_codec_enable_dmic(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kcontrol,
+				     int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 dmic_clk_reg, dmic_clk_en_reg;
+	u8 dmic_ctl_shift = 0;
+	u8 dmic_clk_mask = 0;
+	u16 dmic2_left_en = 0;
+
+	switch (w->shift) {
+	case 0:
+	case 1:
+		dmic_clk_reg = WCD939X_DIGITAL_CDC_DMIC_RATE_1_2;
+		dmic_clk_en_reg = WCD939X_DIGITAL_CDC_DMIC1_CTL;
+		dmic_clk_mask = GENMASK(3, 0);
+		dmic_ctl_shift = 0;
+		break;
+	case 2:
+		dmic2_left_en = WCD939X_DIGITAL_CDC_DMIC2_CTL;
+		fallthrough;
+	case 3:
+		dmic_clk_reg = WCD939X_DIGITAL_CDC_DMIC_RATE_1_2;
+		dmic_clk_en_reg = WCD939X_DIGITAL_CDC_DMIC2_CTL;
+		dmic_clk_mask = GENMASK(7, 4);
+		dmic_ctl_shift = 1;
+		break;
+	case 4:
+	case 5:
+		dmic_clk_reg = WCD939X_DIGITAL_CDC_DMIC_RATE_3_4;
+		dmic_clk_en_reg = WCD939X_DIGITAL_CDC_DMIC3_CTL;
+		dmic_clk_mask = GENMASK(3, 0);
+		dmic_ctl_shift = 2;
+		break;
+	case 6:
+	case 7:
+		dmic_clk_reg = WCD939X_DIGITAL_CDC_DMIC_RATE_3_4;
+		dmic_clk_en_reg = WCD939X_DIGITAL_CDC_DMIC4_CTL;
+		dmic_clk_mask = GENMASK(7, 4);
+		dmic_ctl_shift = 3;
+		break;
+	default:
+		dev_err(component->dev, "%s: Invalid DMIC Selection\n", __func__);
+		return -EINVAL;
+	};
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_AMIC_CTL,
+					      BIT(dmic_ctl_shift), 0);
+		/* 250us sleep as per HW requirement */
+		usleep_range(250, 260);
+		if (dmic2_left_en)
+			snd_soc_component_write_field(component, dmic2_left_en, BIT(7), 1);
+		/* Setting DMIC clock rate to 2.4MHz */
+		snd_soc_component_write_field(component, dmic_clk_reg, dmic_clk_mask, 3);
+		snd_soc_component_write_field(component, dmic_clk_en_reg, BIT(3), 1);
+		/* enable clock scaling */
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_DMIC_CTL,
+					      WCD939X_CDC_DMIC_CTL_CLK_SCALE_EN, 1);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_DMIC_CTL,
+					      WCD939X_CDC_DMIC_CTL_DMIC_DIV_BAK_EN, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_AMIC_CTL,
+					      BIT(dmic_ctl_shift), 1);
+		if (dmic2_left_en)
+			snd_soc_component_write_field(component, dmic2_left_en, BIT(7), 0);
+		snd_soc_component_write_field(component, dmic_clk_en_reg, BIT(3), 0);
+		break;
+	}
+	return 0;
+}
+
+static int wcd939x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	int bank;
+	int rate;
+
+	bank = (wcd939x_swr_get_current_bank(wcd939x->sdw_priv[AIF1_CAP]->sdev)) ? 0 : 1;
+	bank = bank ? 0 : 1;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (strnstr(w->name, "ADC", sizeof("ADC"))) {
+			int i = 0, mode = 0;
+
+			if (test_bit(WCD_ADC1, &wcd939x->status_mask))
+				mode |= tx_mode_bit[wcd939x->tx_mode[WCD_ADC1]];
+			if (test_bit(WCD_ADC2, &wcd939x->status_mask))
+				mode |= tx_mode_bit[wcd939x->tx_mode[WCD_ADC2]];
+			if (test_bit(WCD_ADC3, &wcd939x->status_mask))
+				mode |= tx_mode_bit[wcd939x->tx_mode[WCD_ADC3]];
+			if (test_bit(WCD_ADC4, &wcd939x->status_mask))
+				mode |= tx_mode_bit[wcd939x->tx_mode[WCD_ADC4]];
+
+			if (mode != 0) {
+				for (i = 0; i < ADC_MODE_ULP2; i++) {
+					if (mode & (1 << i)) {
+						i++;
+						break;
+					}
+				}
+			}
+			rate = wcd939x_get_clk_rate(i);
+			wcd939x_set_swr_clk_rate(component, rate, bank);
+			/* Copy clk settings to active bank */
+			wcd939x_set_swr_clk_rate(component, rate, !bank);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (strnstr(w->name, "ADC", sizeof("ADC"))) {
+			rate = wcd939x_get_clk_rate(ADC_MODE_INVALID);
+			wcd939x_set_swr_clk_rate(component, rate, !bank);
+			wcd939x_set_swr_clk_rate(component, rate, bank);
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_get_adc_mode(int val)
+{
+	int ret = 0;
+
+	switch (val) {
+	case ADC_MODE_INVALID:
+		ret = ADC_MODE_VAL_NORMAL;
+		break;
+	case ADC_MODE_HIFI:
+		ret = ADC_MODE_VAL_HIFI;
+		break;
+	case ADC_MODE_LO_HIF:
+		ret = ADC_MODE_VAL_LO_HIF;
+		break;
+	case ADC_MODE_NORMAL:
+		ret = ADC_MODE_VAL_NORMAL;
+		break;
+	case ADC_MODE_LP:
+		ret = ADC_MODE_VAL_LP;
+		break;
+	case ADC_MODE_ULP1:
+		ret = ADC_MODE_VAL_ULP1;
+		break;
+	case ADC_MODE_ULP2:
+		ret = ADC_MODE_VAL_ULP2;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static int wcd939x_codec_enable_adc(struct snd_soc_dapm_widget *w,
+				    struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_TX_CLK_EN, 1);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_TX_DIV2_CLK_EN, 1);
+		set_bit(w->shift, &wcd939x->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_TX_DIV2_CLK_EN, 0);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+					      WCD939X_CDC_ANA_CLK_CTL_ANA_TX_CLK_EN, 0);
+		clear_bit(w->shift, &wcd939x->status_mask);
+		break;
+	}
+
+	return 0;
+}
+
+static void wcd939x_tx_channel_config(struct snd_soc_component *component,
+				      int channel, int mode)
+{
+	int reg, mask;
+
+	switch (channel) {
+	case 0:
+		reg = WCD939X_ANA_TX_CH2;
+		mask = WCD939X_TX_CH2_HPF1_INIT;
+		break;
+	case 1:
+		reg = WCD939X_ANA_TX_CH2;
+		mask = WCD939X_TX_CH2_HPF2_INIT;
+		break;
+	case 2:
+		reg = WCD939X_ANA_TX_CH4;
+		mask = WCD939X_TX_CH4_HPF3_INIT;
+		break;
+	case 3:
+		reg = WCD939X_ANA_TX_CH4;
+		mask = WCD939X_TX_CH4_HPF4_INIT;
+		break;
+	default:
+		return;
+	}
+
+	snd_soc_component_write_field(component, reg, mask, mode);
+}
+
+static int wcd939x_adc_enable_req(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	int mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_REQ_CTL,
+					      WCD939X_CDC_REQ_CTL_FS_RATE_4P8, 1);
+		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_REQ_CTL,
+					      WCD939X_CDC_REQ_CTL_NO_NOTCH, 0);
+
+		wcd939x_tx_channel_config(component, w->shift, 1);
+		mode = wcd939x_get_adc_mode(wcd939x->tx_mode[w->shift]);
+		if (mode < 0) {
+			dev_info(component->dev, "Invalid ADC mode\n");
+			return -EINVAL;
+		}
+		switch (w->shift) {
+		case 0:
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_TX_ANA_MODE_0_1,
+						      WCD939X_CDC_TX_ANA_MODE_0_1_TXD0_MODE,
+						      mode);
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						      WCD939X_CDC_DIG_CLK_CTL_TXD0_CLK_EN, 1);
+			break;
+		case 1:
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_TX_ANA_MODE_0_1,
+						      WCD939X_CDC_TX_ANA_MODE_0_1_TXD1_MODE,
+						      mode);
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						      WCD939X_CDC_DIG_CLK_CTL_TXD1_CLK_EN, 1);
+			break;
+		case 2:
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_TX_ANA_MODE_2_3,
+						      WCD939X_CDC_TX_ANA_MODE_2_3_TXD2_MODE,
+						      mode);
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						      WCD939X_CDC_DIG_CLK_CTL_TXD2_CLK_EN, 1);
+			break;
+		case 3:
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_TX_ANA_MODE_2_3,
+						      WCD939X_CDC_TX_ANA_MODE_2_3_TXD3_MODE,
+						      mode);
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						      WCD939X_CDC_DIG_CLK_CTL_TXD3_CLK_EN, 1);
+			break;
+		default:
+			break;
+		}
+
+		wcd939x_tx_channel_config(component, w->shift, 0);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		switch (w->shift) {
+		case 0:
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_TX_ANA_MODE_0_1,
+						      WCD939X_CDC_TX_ANA_MODE_0_1_TXD0_MODE, 0);
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						      WCD939X_CDC_DIG_CLK_CTL_TXD0_CLK_EN, 0);
+			break;
+		case 1:
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_TX_ANA_MODE_0_1,
+						      WCD939X_CDC_TX_ANA_MODE_0_1_TXD1_MODE, 0);
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						      WCD939X_CDC_DIG_CLK_CTL_TXD1_CLK_EN, 0);
+			break;
+		case 2:
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_TX_ANA_MODE_2_3,
+						      WCD939X_CDC_TX_ANA_MODE_2_3_TXD2_MODE, 0);
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						      WCD939X_CDC_DIG_CLK_CTL_TXD2_CLK_EN, 0);
+			break;
+		case 3:
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_TX_ANA_MODE_2_3,
+						      WCD939X_CDC_TX_ANA_MODE_2_3_TXD3_MODE, 0);
+			snd_soc_component_write_field(component,
+						      WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						      WCD939X_CDC_DIG_CLK_CTL_TXD3_CLK_EN, 0);
+			break;
+		default:
+			break;
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_micbias_control(struct snd_soc_component *component,
+				   int micb_num, int req, bool is_dapm)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	int micb_index = micb_num - 1;
+	u16 micb_reg;
+	u16 micb_field;
+
+	switch (micb_num) {
+	case MIC_BIAS_1:
+		micb_reg = WCD939X_ANA_MICB1;
+		micb_field = WCD939X_MICB1_ENABLE;
+		break;
+	case MIC_BIAS_2:
+		micb_reg = WCD939X_ANA_MICB2;
+		micb_field = WCD939X_MICB2_ENABLE;
+		break;
+	case MIC_BIAS_3:
+		micb_reg = WCD939X_ANA_MICB3;
+		micb_field = WCD939X_MICB3_ENABLE;
+		break;
+	case MIC_BIAS_4:
+		micb_reg = WCD939X_ANA_MICB4;
+		micb_field = WCD939X_MICB4_ENABLE;
+		break;
+	default:
+		dev_err(component->dev, "%s: Invalid micbias number: %d\n",
+			__func__, micb_num);
+		return -EINVAL;
+	};
+
+	switch (req) {
+	case MICB_PULLUP_ENABLE:
+		wcd939x->pullup_ref[micb_index]++;
+		if (wcd939x->pullup_ref[micb_index] == 1 &&
+		    wcd939x->micb_ref[micb_index] == 0)
+			snd_soc_component_write_field(component, micb_reg, micb_field, 2);
+		break;
+	case MICB_PULLUP_DISABLE:
+		if (wcd939x->pullup_ref[micb_index] > 0)
+			wcd939x->pullup_ref[micb_index]--;
+		if (wcd939x->pullup_ref[micb_index] == 0 &&
+		    wcd939x->micb_ref[micb_index] == 0)
+			snd_soc_component_write_field(component, micb_reg, micb_field, 0);
+		break;
+	case MICB_ENABLE:
+		wcd939x->micb_ref[micb_index]++;
+		if (wcd939x->micb_ref[micb_index] == 1) {
+			snd_soc_component_write_field(component,
+						WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						WCD939X_CDC_DIG_CLK_CTL_TXD3_CLK_EN, 1);
+			snd_soc_component_write_field(component,
+						WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						WCD939X_CDC_DIG_CLK_CTL_TXD2_CLK_EN, 1);
+			snd_soc_component_write_field(component,
+						WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						WCD939X_CDC_DIG_CLK_CTL_TXD1_CLK_EN, 1);
+			snd_soc_component_write_field(component,
+						WCD939X_DIGITAL_CDC_DIG_CLK_CTL,
+						WCD939X_CDC_DIG_CLK_CTL_TXD0_CLK_EN, 1);
+			snd_soc_component_write_field(component,
+						WCD939X_DIGITAL_CDC_ANA_CLK_CTL,
+						WCD939X_CDC_ANA_CLK_CTL_ANA_TX_DIV2_CLK_EN, 1);
+			snd_soc_component_write_field(component,
+						WCD939X_DIGITAL_CDC_ANA_TX_CLK_CTL,
+						WCD939X_CDC_ANA_TX_CLK_CTL_ANA_TXSCBIAS_CLK_EN, 1);
+			snd_soc_component_write_field(component,
+						WCD939X_MICB1_TEST_CTL_2,
+						WCD939X_TEST_CTL_2_IBIAS_LDO_DRIVER, 1);
+			snd_soc_component_write_field(component,
+						WCD939X_MICB2_TEST_CTL_2,
+						WCD939X_TEST_CTL_2_IBIAS_LDO_DRIVER, 1);
+			snd_soc_component_write_field(component,
+						WCD939X_MICB3_TEST_CTL_2,
+						WCD939X_TEST_CTL_2_IBIAS_LDO_DRIVER, 1);
+			snd_soc_component_write_field(component,
+						WCD939X_MICB4_TEST_CTL_2,
+						WCD939X_TEST_CTL_2_IBIAS_LDO_DRIVER, 1);
+			snd_soc_component_write_field(component, micb_reg, micb_field, 1);
+			if (micb_num == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd939x->wcd_mbhc,
+						      WCD_EVENT_POST_MICBIAS_2_ON);
+		}
+		if (micb_num == MIC_BIAS_2 && is_dapm)
+			wcd_mbhc_event_notify(wcd939x->wcd_mbhc,
+					      WCD_EVENT_POST_DAPM_MICBIAS_2_ON);
+		break;
+	case MICB_DISABLE:
+		if (wcd939x->micb_ref[micb_index] > 0)
+			wcd939x->micb_ref[micb_index]--;
+
+		if (wcd939x->micb_ref[micb_index] == 0 &&
+		    wcd939x->pullup_ref[micb_index] > 0)
+			snd_soc_component_write_field(component, micb_reg, micb_field, 2);
+		else if (wcd939x->micb_ref[micb_index] == 0 &&
+			 wcd939x->pullup_ref[micb_index] == 0) {
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd939x->wcd_mbhc,
+						      WCD_EVENT_PRE_MICBIAS_2_OFF);
+
+			snd_soc_component_write_field(component, micb_reg, micb_field, 0);
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd939x->wcd_mbhc,
+						      WCD_EVENT_POST_MICBIAS_2_OFF);
+		}
+		if (is_dapm && micb_num  == MIC_BIAS_2)
+			wcd_mbhc_event_notify(wcd939x->wcd_mbhc,
+					      WCD_EVENT_POST_DAPM_MICBIAS_2_OFF);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	int micb_num = w->shift;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd939x_micbias_control(component, micb_num, MICB_ENABLE, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* 1 msec delay as per HW requirement */
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd939x_micbias_control(component, micb_num, MICB_DISABLE, true);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
+					       struct snd_kcontrol *kcontrol,
+					       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	int micb_num = w->shift;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd939x_micbias_control(component, micb_num,
+					MICB_PULLUP_ENABLE, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* 1 msec delay as per HW requirement */
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd939x_micbias_control(component, micb_num,
+					MICB_PULLUP_DISABLE, true);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd939x_tx_mode_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int path = e->shift_l;
+
+	ucontrol->value.enumerated.item[0] = wcd939x->tx_mode[path];
+
+	return 0;
+}
+
+static int wcd939x_tx_mode_put(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int path = e->shift_l;
+
+	if (wcd939x->tx_mode[path] == ucontrol->value.enumerated.item[0])
+		return 0;
+
+	wcd939x->tx_mode[path] = ucontrol->value.enumerated.item[0];
+
+	return 1;
+}
+
+/* RX Controls */
+
+static int wcd939x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wcd939x->hph_mode;
+
+	return 0;
+}
+
+static int wcd939x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	u32 mode_val;
+
+	mode_val = ucontrol->value.enumerated.item[0];
+
+	if (wcd939x->variant == WCD9390) {
+		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
+			dev_info(component->dev, "%s: Invalid HPH Mode, default to CLS_H_ULP\n",
+				 __func__);
+			mode_val = CLS_H_ULP;
+		}
+	}
+	if (mode_val == CLS_H_NORMAL) {
+		dev_info(component->dev, "%s: Invalid HPH Mode, default to class_AB\n",
+			 __func__);
+		mode_val = CLS_H_ULP;
+	}
+
+	wcd939x->hph_mode = mode_val;
+
+	return 1;
+}
+
+static int wcd939x_ear_pa_gain_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	unsigned int reg;
+
+	reg = snd_soc_component_read(component, WCD939X_ANA_EAR_COMPANDER_CTL);
+
+	ucontrol->value.integer.value[0] = FIELD_GET(WCD939X_EAR_COMPANDER_CTL_EAR_GAIN,
+						     reg);
+	return 0;
+}
+
+static int wcd939x_ear_pa_gain_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+
+	snd_soc_component_write_field(component, WCD939X_ANA_EAR_COMPANDER_CTL,
+				      WCD939X_EAR_COMPANDER_CTL_EAR_GAIN,
+				      ucontrol->value.integer.value[0]);
+
+	return 1;
+}
+
+static int wcd939x_get_compander(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc;
+	bool hphr;
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+
+	if (hphr)
+		ucontrol->value.integer.value[0] = wcd939x->comp2_enable;
+	else
+		ucontrol->value.integer.value[0] = wcd939x->comp1_enable;
+
+	return 0;
+}
+
+static int wcd939x_set_compander(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	struct wcd939x_sdw_priv *wcd;
+	int value = ucontrol->value.integer.value[0];
+	int portidx;
+	struct soc_mixer_control *mc;
+	bool hphr;
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+
+	wcd = wcd939x->sdw_priv[AIF1_PB];
+
+	if (hphr)
+		wcd939x->comp2_enable = value;
+	else
+		wcd939x->comp1_enable = value;
+
+	portidx = wcd->ch_info[mc->reg].port_num;
+
+	if (value)
+		wcd939x_connect_port(wcd, portidx, mc->reg, true);
+	else
+		wcd939x_connect_port(wcd, portidx, mc->reg, false);
+
+	return 1;
+}
+
+static int wcd939x_ldoh_get(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wcd939x->ldoh;
+
+	return 0;
+}
+
+static int wcd939x_ldoh_put(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	if (wcd939x->ldoh == ucontrol->value.integer.value[0])
+		return 0;
+
+	wcd939x->ldoh = ucontrol->value.integer.value[0];
+
+	return 1;
+}
+
+const char * const tx_master_ch_text[] = {
+	"ZERO", "SWRM_PCM_OUT", "SWRM_TX1_CH1", "SWRM_TX1_CH2", "SWRM_TX1_CH3",
+	"SWRM_TX1_CH4", "SWRM_TX2_CH1", "SWRM_TX2_CH2", "SWRM_TX2_CH3",
+	"SWRM_TX2_CH4", "SWRM_TX3_CH1", "SWRM_TX3_CH2", "SWRM_TX3_CH3",
+	"SWRM_TX3_CH4", "SWRM_PCM_IN",
+};
+
+const struct soc_enum tx_master_ch_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(tx_master_ch_text),
+			    tx_master_ch_text);
+
+static const char * const tx_mode_mux_text_wcd9390[] = {
+	"ADC_INVALID", "ADC_HIFI", "ADC_LO_HIF", "ADC_NORMAL", "ADC_LP",
+};
+
+static const struct soc_enum tx0_mode_mux_enum_wcd9390 =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tx_mode_mux_text_wcd9390),
+			tx_mode_mux_text_wcd9390);
+
+static const struct soc_enum tx1_mode_mux_enum_wcd9390 =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 1, ARRAY_SIZE(tx_mode_mux_text_wcd9390),
+			tx_mode_mux_text_wcd9390);
+
+static const struct soc_enum tx2_mode_mux_enum_wcd9390 =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 2, ARRAY_SIZE(tx_mode_mux_text_wcd9390),
+			tx_mode_mux_text_wcd9390);
+
+static const struct soc_enum tx3_mode_mux_enum_wcd9390 =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 3, ARRAY_SIZE(tx_mode_mux_text_wcd9390),
+			tx_mode_mux_text_wcd9390);
+
+static const char * const tx_mode_mux_text[] = {
+	"ADC_INVALID", "ADC_HIFI", "ADC_LO_HIF", "ADC_NORMAL", "ADC_LP",
+	"ADC_ULP1", "ADC_ULP2",
+};
+
+static const struct soc_enum tx0_mode_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text);
+
+static const struct soc_enum tx1_mode_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 1, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text);
+
+static const struct soc_enum tx2_mode_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 2, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text);
+
+static const struct soc_enum tx3_mode_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 3, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text);
+
+static const char * const rx_hph_mode_mux_text_wcd9390[] = {
+	"CLS_H_INVALID", "CLS_H_INVALID_1", "CLS_H_LP", "CLS_AB",
+	"CLS_H_LOHIFI", "CLS_H_ULP", "CLS_H_INVALID_2", "CLS_AB_LP",
+	"CLS_AB_LOHIFI",
+};
+
+static const char * const wcd939x_ear_pa_gain_text[] = {
+	"G_6_DB", "G_4P5_DB", "G_3_DB", "G_1P5_DB", "G_0_DB",
+	"G_M1P5_DB", "G_M3_DB", "G_M4P5_DB",
+	"G_M6_DB", "G_7P5_DB", "G_M9_DB",
+	"G_M10P5_DB", "G_M12_DB", "G_M13P5_DB",
+	"G_M15_DB", "G_M16P5_DB", "G_M18_DB",
+};
+
+static const struct soc_enum rx_hph_mode_mux_enum_wcd9390 =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text_wcd9390),
+			    rx_hph_mode_mux_text_wcd9390);
+
+static SOC_ENUM_SINGLE_EXT_DECL(wcd939x_ear_pa_gain_enum,
+				wcd939x_ear_pa_gain_text);
+
+static const char * const rx_hph_mode_mux_text[] = {
+	"CLS_H_INVALID", "CLS_H_HIFI", "CLS_H_LP", "CLS_AB", "CLS_H_LOHIFI",
+	"CLS_H_ULP", "CLS_AB_HIFI", "CLS_AB_LP", "CLS_AB_LOHIFI",
+};
+
+static const struct soc_enum rx_hph_mode_mux_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text),
+			    rx_hph_mode_mux_text);
+
+static const struct snd_kcontrol_new wcd9390_snd_controls[] = {
+	SOC_ENUM_EXT("EAR PA GAIN", wcd939x_ear_pa_gain_enum,
+		     wcd939x_ear_pa_gain_get, wcd939x_ear_pa_gain_put),
+
+	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum_wcd9390,
+		     wcd939x_rx_hph_mode_get, wcd939x_rx_hph_mode_put),
+
+	SOC_ENUM_EXT("TX0 MODE", tx0_mode_mux_enum_wcd9390,
+		     wcd939x_tx_mode_get, wcd939x_tx_mode_put),
+	SOC_ENUM_EXT("TX1 MODE", tx1_mode_mux_enum_wcd9390,
+		     wcd939x_tx_mode_get, wcd939x_tx_mode_put),
+	SOC_ENUM_EXT("TX2 MODE", tx2_mode_mux_enum_wcd9390,
+		     wcd939x_tx_mode_get, wcd939x_tx_mode_put),
+	SOC_ENUM_EXT("TX3 MODE", tx3_mode_mux_enum_wcd9390,
+		     wcd939x_tx_mode_get, wcd939x_tx_mode_put),
+};
+
+static const struct snd_kcontrol_new wcd9395_snd_controls[] = {
+	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
+		     wcd939x_rx_hph_mode_get, wcd939x_rx_hph_mode_put),
+
+	SOC_ENUM_EXT("TX0 MODE", tx0_mode_mux_enum,
+		     wcd939x_tx_mode_get, wcd939x_tx_mode_put),
+	SOC_ENUM_EXT("TX1 MODE", tx1_mode_mux_enum,
+		     wcd939x_tx_mode_get, wcd939x_tx_mode_put),
+	SOC_ENUM_EXT("TX2 MODE", tx2_mode_mux_enum,
+		     wcd939x_tx_mode_get, wcd939x_tx_mode_put),
+	SOC_ENUM_EXT("TX3 MODE", tx3_mode_mux_enum,
+		     wcd939x_tx_mode_get, wcd939x_tx_mode_put),
+};
+
+static const struct snd_kcontrol_new adc1_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new adc2_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new adc3_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new adc4_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic1_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic2_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic3_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic4_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic5_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic6_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic7_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic8_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new ear_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new hphl_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new hphr_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const char * const adc1_mux_text[] = {
+	"CH1_AMIC_DISABLE", "CH1_AMIC1", "CH1_AMIC2", "CH1_AMIC3", "CH1_AMIC4", "CH1_AMIC5"
+};
+
+static const struct soc_enum adc1_enum =
+	SOC_ENUM_SINGLE(WCD939X_TX_NEW_CH12_MUX, 0,
+			ARRAY_SIZE(adc1_mux_text), adc1_mux_text);
+
+static const struct snd_kcontrol_new tx_adc1_mux =
+	SOC_DAPM_ENUM("ADC1 MUX Mux", adc1_enum);
+
+static const char * const adc2_mux_text[] = {
+	"CH2_AMIC_DISABLE", "CH2_AMIC1", "CH2_AMIC2", "CH2_AMIC3", "CH2_AMIC4", "CH2_AMIC5"
+};
+
+static const struct soc_enum adc2_enum =
+	SOC_ENUM_SINGLE(WCD939X_TX_NEW_CH12_MUX, 3,
+			ARRAY_SIZE(adc2_mux_text), adc2_mux_text);
+
+static const struct snd_kcontrol_new tx_adc2_mux =
+	SOC_DAPM_ENUM("ADC2 MUX Mux", adc2_enum);
+
+static const char * const adc3_mux_text[] = {
+	"CH3_AMIC_DISABLE", "CH3_AMIC1", "CH3_AMIC3", "CH3_AMIC4", "CH3_AMIC5"
+};
+
+static const struct soc_enum adc3_enum =
+	SOC_ENUM_SINGLE(WCD939X_TX_NEW_CH34_MUX, 0,
+			ARRAY_SIZE(adc3_mux_text), adc3_mux_text);
+
+static const struct snd_kcontrol_new tx_adc3_mux =
+	SOC_DAPM_ENUM("ADC3 MUX Mux", adc3_enum);
+
+static const char * const adc4_mux_text[] = {
+	"CH4_AMIC_DISABLE", "CH4_AMIC1", "CH4_AMIC3", "CH4_AMIC4", "CH4_AMIC5"
+};
+
+static const struct soc_enum adc4_enum =
+	SOC_ENUM_SINGLE(WCD939X_TX_NEW_CH34_MUX, 3,
+			ARRAY_SIZE(adc4_mux_text), adc4_mux_text);
+
+static const struct snd_kcontrol_new tx_adc4_mux =
+	SOC_DAPM_ENUM("ADC4 MUX Mux", adc4_enum);
+
+static const char * const rdac3_mux_text[] = {
+	"RX3", "RX1"
+};
+
+static const struct soc_enum rdac3_enum =
+	SOC_ENUM_SINGLE(WCD939X_DIGITAL_CDC_EAR_PATH_CTL, 0,
+			ARRAY_SIZE(rdac3_mux_text), rdac3_mux_text);
+
+static const struct snd_kcontrol_new rx_rdac3_mux =
+	SOC_DAPM_ENUM("RDAC3_MUX Mux", rdac3_enum);
+
+static int wcd939x_get_swr_port(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(comp);
+	struct wcd939x_sdw_priv *wcd;
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	int dai_id = mixer->shift;
+	int portidx, ch_idx = mixer->reg;
+
+	wcd = wcd939x->sdw_priv[dai_id];
+	portidx = wcd->ch_info[ch_idx].port_num;
+
+	ucontrol->value.integer.value[0] = wcd->port_enable[portidx];
+
+	return 0;
+}
+
+static const char *version_to_str(u32 version)
+{
+	switch (version) {
+	case WCD939X_VERSION_1_0:
+		return __stringify(WCD939X_1_0);
+	case WCD939X_VERSION_1_1:
+		return __stringify(WCD939X_1_1);
+	case WCD939X_VERSION_2_0:
+		return __stringify(WCD939X_2_0);
+	}
+	return NULL;
+}
+
+static int wcd939x_set_swr_port(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(comp);
+	struct wcd939x_sdw_priv *wcd;
+	int ch_idx = mixer->reg;
+	int portidx;
+	int dai_id = mixer->shift;
+	bool enable;
+
+	wcd = wcd939x->sdw_priv[dai_id];
+
+	portidx = wcd->ch_info[ch_idx].port_num;
+	if (ucontrol->value.integer.value[0])
+		enable = true;
+	else
+		enable = false;
+
+	wcd->port_enable[portidx] = enable;
+
+	wcd939x_connect_port(wcd, portidx, ch_idx, enable);
+
+	return 1;
+}
+
+/* MBHC Related */
+
+static void wcd939x_mbhc_clk_setup(struct snd_soc_component *component,
+				   bool enable)
+{
+	snd_soc_component_write_field(component, WCD939X_MBHC_NEW_CTL_1,
+				      WCD939X_CTL_1_RCO_EN, enable);
+}
+
+static void wcd939x_mbhc_mbhc_bias_control(struct snd_soc_component *component,
+					   bool enable)
+{
+	snd_soc_component_write_field(component, WCD939X_ANA_MBHC_ELECT,
+				      WCD939X_MBHC_ELECT_BIAS_EN, enable);
+}
+
+static void wcd939x_mbhc_program_btn_thr(struct snd_soc_component *component,
+					 int *btn_low, int *btn_high,
+					 int num_btn, bool is_micbias)
+{
+	int i, vth;
+
+	if (num_btn > WCD_MBHC_DEF_BUTTONS) {
+		dev_err(component->dev, "%s: invalid number of buttons: %d\n",
+			__func__, num_btn);
+		return;
+	}
+
+	for (i = 0; i < num_btn; i++) {
+		vth = ((btn_high[i] * 2) / 25) & 0x3F;
+		snd_soc_component_write_field(component, WCD939X_ANA_MBHC_BTN0 + i, 0xFC, vth);
+		dev_dbg(component->dev, "%s: btn_high[%d]: %d, vth: %d\n",
+			__func__, i, btn_high[i], vth);
+	}
+}
+
+static bool wcd939x_mbhc_micb_en_status(struct snd_soc_component *component, int micb_num)
+{
+	u8 val;
+
+	if (micb_num == MIC_BIAS_2) {
+		val = FIELD_GET(WCD939X_MICB2_ENABLE,
+				snd_soc_component_read(component, WCD939X_ANA_MICB2));
+		if (val == 1)
+			return true;
+	}
+
+	return false;
+}
+
+static void wcd939x_mbhc_hph_l_pull_up_control(struct snd_soc_component *component,
+					       int pull_up_cur)
+{
+	/* Default pull up current to 2uA */
+	if (pull_up_cur > HS_PULLUP_I_OFF || pull_up_cur < HS_PULLUP_I_3P0_UA ||
+	    pull_up_cur == HS_PULLUP_I_DEFAULT)
+		pull_up_cur = HS_PULLUP_I_2P0_UA;
+
+	dev_dbg(component->dev, "%s: HS pull up current:%d\n",
+		__func__, pull_up_cur);
+
+	snd_soc_component_write_field(component, WCD939X_MBHC_NEW_INT_MECH_DET_CURRENT,
+				      WCD939X_MECH_DET_CURRENT_HSDET_PULLUP_CTL, pull_up_cur);
+}
+
+static int wcd939x_mbhc_request_micbias(struct snd_soc_component *component,
+					int micb_num, int req)
+{
+	return wcd939x_micbias_control(component, micb_num, req, false);
+}
+
+static void wcd939x_mbhc_micb_ramp_control(struct snd_soc_component *component,
+					   bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, WCD939X_ANA_MICB2_RAMP,
+					      WCD939X_MICB2_RAMP_SHIFT_CTL, 3);
+		snd_soc_component_write_field(component, WCD939X_ANA_MICB2_RAMP,
+					      WCD939X_MICB2_RAMP_RAMP_ENABLE, 1);
+	} else {
+		snd_soc_component_write_field(component, WCD939X_ANA_MICB2_RAMP,
+					      WCD939X_MICB2_RAMP_RAMP_ENABLE, 0);
+		snd_soc_component_write_field(component, WCD939X_ANA_MICB2_RAMP,
+					      WCD939X_MICB2_RAMP_SHIFT_CTL, 0);
+	}
+}
+
+static int wcd939x_get_micb_vout_ctl_val(u32 micb_mv)
+{
+	/* min micbias voltage is 1V and maximum is 2.85V */
+	if (micb_mv < 1000 || micb_mv > 2850) {
+		pr_err("%s: unsupported micbias voltage\n", __func__);
+		return -EINVAL;
+	}
+
+	return (micb_mv - 1000) / 50;
+}
+
+static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
+					    int req_volt, int micb_num)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	int cur_vout_ctl, req_vout_ctl;
+	int micb_reg, micb_val, micb_en, micb_en_field, micb_vout_ctl_field;
+	int ret = 0;
+
+	switch (micb_num) {
+	case MIC_BIAS_1:
+		micb_reg = WCD939X_ANA_MICB1;
+		micb_en_field = WCD939X_MICB1_ENABLE;
+		micb_vout_ctl_field = WCD939X_MICB1_VOUT_CTL;
+		break;
+	case MIC_BIAS_2:
+		micb_reg = WCD939X_ANA_MICB2;
+		micb_en_field = WCD939X_MICB2_ENABLE;
+		micb_vout_ctl_field = WCD939X_MICB2_VOUT_CTL;
+		break;
+	case MIC_BIAS_3:
+		micb_reg = WCD939X_ANA_MICB3;
+		micb_en_field = WCD939X_MICB3_ENABLE;
+		micb_vout_ctl_field = WCD939X_MICB1_VOUT_CTL;
+		break;
+	case MIC_BIAS_4:
+		micb_reg = WCD939X_ANA_MICB4;
+		micb_en_field = WCD939X_MICB4_ENABLE;
+		micb_vout_ctl_field = WCD939X_MICB2_VOUT_CTL;
+		break;
+	default:
+		return -EINVAL;
+	}
+	mutex_lock(&wcd939x->micb_lock);
+
+	/*
+	 * If requested micbias voltage is same as current micbias
+	 * voltage, then just return. Otherwise, adjust voltage as
+	 * per requested value. If micbias is already enabled, then
+	 * to avoid slow micbias ramp-up or down enable pull-up
+	 * momentarily, change the micbias value and then re-enable
+	 * micbias.
+	 */
+	micb_val = snd_soc_component_read(component, micb_reg);
+	micb_en = (micb_val & micb_en_field) >> 6;
+	cur_vout_ctl = micb_val & micb_vout_ctl_field;
+
+	req_vout_ctl = wcd939x_get_micb_vout_ctl_val(req_volt);
+	if (req_vout_ctl < 0) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (cur_vout_ctl == req_vout_ctl) {
+		ret = 0;
+		goto exit;
+	}
+
+	dev_dbg(component->dev, "%s: micb_num: %d, cur_mv: %d, req_mv: %d, micb_en: %d\n",
+		__func__, micb_num, WCD_VOUT_CTL_TO_MICB(cur_vout_ctl),
+		 req_volt, micb_en);
+
+	if (micb_en == 0x1)
+		snd_soc_component_write_field(component, micb_reg, micb_en_field, 3);
+
+	snd_soc_component_write_field(component, micb_reg, micb_vout_ctl_field, req_vout_ctl);
+
+	if (micb_en == 0x1) {
+		snd_soc_component_write_field(component, micb_reg, micb_en_field, 1);
+		/*
+		 * Add 2ms delay as per HW requirement after enabling
+		 * micbias
+		 */
+		usleep_range(2000, 2100);
+	}
+exit:
+	mutex_unlock(&wcd939x->micb_lock);
+	return ret;
+}
+
+static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
+						int micb_num, bool req_en)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	int micb_mv;
+
+	if (micb_num != MIC_BIAS_2)
+		return -EINVAL;
+	/*
+	 * If device tree micbias level is already above the minimum
+	 * voltage needed to detect threshold microphone, then do
+	 * not change the micbias, just return.
+	 */
+	if (wcd939x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
+		return 0;
+
+	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd939x->micb2_mv;
+
+	return wcd939x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
+}
+
+static void wcd939x_mbhc_get_result_params(struct snd_soc_component *component,
+					   s16 *d1_a, u16 noff,
+						int32_t *zdet)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	int i;
+	int val, val1;
+	s16 c1;
+	s32 x1, d1;
+	s32 denom;
+	static const int mincode_param[] = {
+		3277, 1639, 820, 410, 205, 103, 52, 26
+	};
+
+	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MBHC_ZDET, 0x20, 0x20);
+	for (i = 0; i < WCD939X_ZDET_NUM_MEASUREMENTS; i++) {
+		regmap_read(wcd939x->regmap, WCD939X_ANA_MBHC_RESULT_2, &val);
+		if (val & 0x80)
+			break;
+	}
+	val = val << 0x8;
+	regmap_read(wcd939x->regmap, WCD939X_ANA_MBHC_RESULT_1, &val1);
+	val |= val1;
+	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MBHC_ZDET, 0x20, 0x00);
+	x1 = WCD939X_MBHC_GET_X1(val);
+	c1 = WCD939X_MBHC_GET_C1(val);
+	/* If ramp is not complete, give additional 5ms */
+	if (c1 < 2 && x1)
+		usleep_range(5000, 5050);
+
+	if (!c1 || !x1) {
+		dev_dbg(component->dev,
+			"%s: Impedance detect ramp error, c1=%d, x1=0x%x\n",
+			__func__, c1, x1);
+		goto ramp_down;
+	}
+	d1 = d1_a[c1];
+	denom = (x1 * d1) - (1 << (14 - noff));
+	if (denom > 0)
+		*zdet = (WCD939X_ANA_MBHC_ZDET_CONST * 1000) / denom;
+	else if (x1 < mincode_param[noff])
+		*zdet = WCD939X_ZDET_FLOATING_IMPEDANCE;
+
+	dev_dbg(component->dev, "%s: d1=%d, c1=%d, x1=0x%x, z_val=%d(milliOhm)\n",
+		__func__, d1, c1, x1, *zdet);
+ramp_down:
+	i = 0;
+	while (x1) {
+		regmap_read(wcd939x->regmap,
+			    WCD939X_ANA_MBHC_RESULT_1, &val);
+		regmap_read(wcd939x->regmap,
+			    WCD939X_ANA_MBHC_RESULT_2, &val1);
+		val = val << 0x08;
+		val |= val1;
+		x1 = WCD939X_MBHC_GET_X1(val);
+		i++;
+		if (i == WCD939X_ZDET_NUM_MEASUREMENTS)
+			break;
+	}
+}
+
+static void wcd939x_mbhc_zdet_ramp(struct snd_soc_component *component,
+				   struct wcd939x_mbhc_zdet_param *zdet_param,
+				   s32 *zl, int32_t *zr, s16 *d1_a)
+{
+	struct wcd939x_priv *wcd939x = dev_get_drvdata(component->dev);
+	s32 zdet = 0;
+
+	snd_soc_component_write_field(component, WCD939X_MBHC_NEW_ZDET_ANA_CTL,
+				      WCD939X_ZDET_ANA_CTL_MAXV_CTL, zdet_param->ldo_ctl);
+	snd_soc_component_update_bits(component, WCD939X_ANA_MBHC_BTN5, WCD939X_MBHC_BTN5_VTH,
+				      zdet_param->btn5);
+	snd_soc_component_update_bits(component, WCD939X_ANA_MBHC_BTN6, WCD939X_MBHC_BTN6_VTH,
+				      zdet_param->btn6);
+	snd_soc_component_update_bits(component, WCD939X_ANA_MBHC_BTN7, WCD939X_MBHC_BTN7_VTH,
+				      zdet_param->btn7);
+	snd_soc_component_write_field(component, WCD939X_MBHC_NEW_ZDET_ANA_CTL,
+				      WCD939X_ZDET_ANA_CTL_RANGE_CTL, zdet_param->noff);
+	snd_soc_component_write_field(component, WCD939X_MBHC_NEW_ZDET_RAMP_CTL,
+				      WCD939X_ZDET_RAMP_CTL_TIME_CTL, zdet_param->nshift);
+	snd_soc_component_write_field(component, WCD939X_MBHC_NEW_ZDET_RAMP_CTL,
+				      WCD939X_ZDET_RAMP_CTL_ACC1_MIN_CTL, 6); /*acc1_min_63 */
+
+	if (!zl)
+		goto z_right;
+	/* Start impedance measurement for HPH_L */
+	regmap_update_bits(wcd939x->regmap,
+			   WCD939X_ANA_MBHC_ZDET, 0x80, 0x80);
+	dev_dbg(component->dev, "%s: ramp for HPH_L, noff = %d\n",
+		__func__, zdet_param->noff);
+	wcd939x_mbhc_get_result_params(component, d1_a, zdet_param->noff, &zdet);
+	regmap_update_bits(wcd939x->regmap,
+			   WCD939X_ANA_MBHC_ZDET, 0x80, 0x00);
+
+	*zl = zdet;
+
+z_right:
+	if (!zr)
+		return;
+	/* Start impedance measurement for HPH_R */
+	regmap_update_bits(wcd939x->regmap,
+			   WCD939X_ANA_MBHC_ZDET, 0x40, 0x40);
+	dev_dbg(component->dev, "%s: ramp for HPH_R, noff = %d\n",
+		__func__, zdet_param->noff);
+	wcd939x_mbhc_get_result_params(component, d1_a, zdet_param->noff, &zdet);
+	regmap_update_bits(wcd939x->regmap,
+			   WCD939X_ANA_MBHC_ZDET, 0x40, 0x00);
+
+	*zr = zdet;
+}
+
+static void wcd939x_wcd_mbhc_qfuse_cal(struct snd_soc_component *component,
+				       s32 *z_val, int flag_l_r)
+{
+	s16 q1;
+	int q1_cal;
+
+	q1 = snd_soc_component_read(component, WCD939X_DIGITAL_EFUSE_REG_21 + flag_l_r);
+	if (q1 & 0x80)
+		q1_cal = (10000 - ((q1 & 0x7F) * 10));
+	else
+		q1_cal = (10000 + (q1 * 10));
+	if (q1_cal > 0)
+		*z_val = ((*z_val) * 10000) / q1_cal;
+}
+
+static void wcd939x_wcd_mbhc_calc_impedance(struct snd_soc_component *component,
+					    u32 *zl, uint32_t *zr)
+{
+	struct wcd939x_priv *wcd939x = dev_get_drvdata(component->dev);
+	s16 reg0, reg1, reg2, reg3, reg4;
+	s32 z1l, z1r, z1ls;
+	int z_mono, z_diff1, z_diff2;
+	bool is_fsm_disable = false;
+	struct wcd939x_mbhc_zdet_param zdet_param[] = {
+		{4, 0, 4, 0x08, 0x14, 0x18}, /* < 32ohm */
+		{4, 0, 6, 0x18, 0x60, 0x78}, /* 32ohm < Z < 400ohm */
+		{1, 4, 5, 0x18, 0x7C, 0x90}, /* 400ohm < Z < 1200ohm */
+		{1, 6, 7, 0x18, 0x7C, 0x90}, /* >1200ohm */
+	};
+	struct wcd939x_mbhc_zdet_param *zdet_param_ptr = NULL;
+	s16 d1_a[][4] = {
+		{0, 30, 90, 30},
+		{0, 30, 30, 6},
+		{0, 30, 30, 5},
+		{0, 30, 30, 5},
+	};
+	s16 *d1 = NULL;
+
+	reg0 = snd_soc_component_read(component, WCD939X_ANA_MBHC_BTN5);
+	reg1 = snd_soc_component_read(component, WCD939X_ANA_MBHC_BTN6);
+	reg2 = snd_soc_component_read(component, WCD939X_ANA_MBHC_BTN7);
+	reg3 = snd_soc_component_read(component, WCD939X_MBHC_CTL_CLK);
+	reg4 = snd_soc_component_read(component, WCD939X_MBHC_NEW_ZDET_ANA_CTL);
+
+	if (snd_soc_component_read(component, WCD939X_ANA_MBHC_ELECT) & 0x80) {
+		is_fsm_disable = true;
+		regmap_update_bits(wcd939x->regmap,
+				   WCD939X_ANA_MBHC_ELECT, 0x80, 0x00);
+	}
+
+	/* For NO-jack, disable L_DET_EN before Z-det measurements */
+	if (wcd939x->mbhc_cfg.hphl_swh)
+		regmap_update_bits(wcd939x->regmap,
+				   WCD939X_ANA_MBHC_MECH, 0x80, 0x00);
+
+	/* Turn off 100k pull down on HPHL */
+	regmap_update_bits(wcd939x->regmap,
+			   WCD939X_ANA_MBHC_MECH, 0x01, 0x00);
+
+	/* Disable surge protection before impedance detection.
+	 * This is done to give correct value for high impedance.
+	 */
+	regmap_update_bits(wcd939x->regmap,
+			   WCD939X_HPH_SURGE_EN, 0xC0, 0x00);
+	/* 1ms delay needed after disable surge protection */
+	usleep_range(1000, 1010);
+
+	/* First get impedance on Left */
+	d1 = d1_a[1];
+	zdet_param_ptr = &zdet_param[1];
+	wcd939x_mbhc_zdet_ramp(component, zdet_param_ptr, &z1l, NULL, d1);
+
+	if (!WCD939X_MBHC_IS_SECOND_RAMP_REQUIRED(z1l))
+		goto left_ch_impedance;
+
+	/* Second ramp for left ch */
+	if (z1l < WCD939X_ZDET_VAL_32) {
+		zdet_param_ptr = &zdet_param[0];
+		d1 = d1_a[0];
+	} else if (z1l > WCD939X_ZDET_VAL_400 && z1l <= WCD939X_ZDET_VAL_1200) {
+		zdet_param_ptr = &zdet_param[2];
+		d1 = d1_a[2];
+	} else if (z1l > WCD939X_ZDET_VAL_1200) {
+		zdet_param_ptr = &zdet_param[3];
+		d1 = d1_a[3];
+	}
+	wcd939x_mbhc_zdet_ramp(component, zdet_param_ptr, &z1l, NULL, d1);
+
+left_ch_impedance:
+	if (z1l == WCD939X_ZDET_FLOATING_IMPEDANCE || z1l > WCD939X_ZDET_VAL_100K) {
+		*zl = WCD939X_ZDET_FLOATING_IMPEDANCE;
+		zdet_param_ptr = &zdet_param[1];
+		d1 = d1_a[1];
+	} else {
+		*zl = z1l / 1000;
+		wcd939x_wcd_mbhc_qfuse_cal(component, zl, 0);
+	}
+	dev_dbg(component->dev, "%s: impedance on HPH_L = %d(ohms)\n",
+		__func__, *zl);
+
+	/* Start of right impedance ramp and calculation */
+	wcd939x_mbhc_zdet_ramp(component, zdet_param_ptr, NULL, &z1r, d1);
+	if (WCD939X_MBHC_IS_SECOND_RAMP_REQUIRED(z1r)) {
+		if ((z1r > WCD939X_ZDET_VAL_1200 && zdet_param_ptr->noff == 0x6) ||
+		    (*zl) != WCD939X_ZDET_FLOATING_IMPEDANCE)
+			goto right_ch_impedance;
+		/* Second ramp for right ch */
+		if (z1r < WCD939X_ZDET_VAL_32) {
+			zdet_param_ptr = &zdet_param[0];
+			d1 = d1_a[0];
+		} else if (z1r > WCD939X_ZDET_VAL_400 && z1r <= WCD939X_ZDET_VAL_1200) {
+			zdet_param_ptr = &zdet_param[2];
+			d1 = d1_a[2];
+		} else if (z1r > WCD939X_ZDET_VAL_1200) {
+			zdet_param_ptr = &zdet_param[3];
+			d1 = d1_a[3];
+		}
+		wcd939x_mbhc_zdet_ramp(component, zdet_param_ptr, NULL, &z1r, d1);
+	}
+right_ch_impedance:
+	if (z1r == WCD939X_ZDET_FLOATING_IMPEDANCE || z1r > WCD939X_ZDET_VAL_100K) {
+		*zr = WCD939X_ZDET_FLOATING_IMPEDANCE;
+	} else {
+		*zr = z1r / 1000;
+		wcd939x_wcd_mbhc_qfuse_cal(component, zr, 1);
+	}
+	dev_dbg(component->dev, "%s: impedance on HPH_R = %d(ohms)\n",
+		__func__, *zr);
+
+	/* Mono/stereo detection */
+	if (*zl == WCD939X_ZDET_FLOATING_IMPEDANCE &&
+	    *zr == WCD939X_ZDET_FLOATING_IMPEDANCE) {
+		dev_dbg(component->dev,
+			"%s: plug type is invalid or extension cable\n",
+			__func__);
+		goto zdet_complete;
+	}
+	if (*zl == WCD939X_ZDET_FLOATING_IMPEDANCE || *zr == WCD939X_ZDET_FLOATING_IMPEDANCE ||
+	    (*zl < WCD_MONO_HS_MIN_THR && *zr > WCD_MONO_HS_MIN_THR) ||
+	    (*zl > WCD_MONO_HS_MIN_THR && *zr < WCD_MONO_HS_MIN_THR)) {
+		dev_dbg(component->dev,
+			"%s: Mono plug type with one ch floating or shorted to GND\n",
+			__func__);
+		wcd_mbhc_set_hph_type(wcd939x->wcd_mbhc, WCD_MBHC_HPH_MONO);
+		goto zdet_complete;
+	}
+
+	snd_soc_component_write_field(component, WCD939X_HPH_R_ATEST,
+				      WCD939X_R_ATEST_HPH_GND_OVR, 1);
+	snd_soc_component_write_field(component, WCD939X_HPH_PA_CTL2,
+				      WCD939X_PA_CTL2_HPHPA_GND_R, 1);
+	wcd939x_mbhc_zdet_ramp(component, &zdet_param[1], &z1ls, NULL, d1);
+	snd_soc_component_write_field(component, WCD939X_HPH_PA_CTL2,
+				      WCD939X_PA_CTL2_HPHPA_GND_R, 0);
+	snd_soc_component_write_field(component, WCD939X_HPH_R_ATEST,
+				      WCD939X_R_ATEST_HPH_GND_OVR, 0);
+	z1ls /= 1000;
+	wcd939x_wcd_mbhc_qfuse_cal(component, &z1ls, 0);
+	/* Parallel of left Z and 9 ohm pull down resistor */
+	z_mono = ((*zl) * 9) / ((*zl) + 9);
+	z_diff1 = (z1ls > z_mono) ? (z1ls - z_mono) : (z_mono - z1ls);
+	z_diff2 = ((*zl) > z1ls) ? ((*zl) - z1ls) : (z1ls - (*zl));
+	if ((z_diff1 * (*zl + z1ls)) > (z_diff2 * (z1ls + z_mono))) {
+		dev_dbg(component->dev, "%s: stereo plug type detected\n",
+			__func__);
+		wcd_mbhc_set_hph_type(wcd939x->wcd_mbhc, WCD_MBHC_HPH_STEREO);
+	} else {
+		dev_dbg(component->dev, "%s: MONO plug type detected\n",
+			__func__);
+		wcd_mbhc_set_hph_type(wcd939x->wcd_mbhc, WCD_MBHC_HPH_MONO);
+	}
+
+	/* Enable surge protection again after impedance detection */
+	regmap_update_bits(wcd939x->regmap,
+			   WCD939X_HPH_SURGE_EN, 0xC0, 0xC0);
+zdet_complete:
+	snd_soc_component_write(component, WCD939X_ANA_MBHC_BTN5, reg0);
+	snd_soc_component_write(component, WCD939X_ANA_MBHC_BTN6, reg1);
+	snd_soc_component_write(component, WCD939X_ANA_MBHC_BTN7, reg2);
+	/* Turn on 100k pull down on HPHL */
+	regmap_update_bits(wcd939x->regmap,
+			   WCD939X_ANA_MBHC_MECH, 0x01, 0x01);
+
+	/* For NO-jack, re-enable L_DET_EN after Z-det measurements */
+	if (wcd939x->mbhc_cfg.hphl_swh)
+		regmap_update_bits(wcd939x->regmap,
+				   WCD939X_ANA_MBHC_MECH, 0x80, 0x80);
+
+	snd_soc_component_write(component, WCD939X_MBHC_NEW_ZDET_ANA_CTL, reg4);
+	snd_soc_component_write(component, WCD939X_MBHC_CTL_CLK, reg3);
+	if (is_fsm_disable)
+		regmap_update_bits(wcd939x->regmap,
+				   WCD939X_ANA_MBHC_ELECT, 0x80, 0x80);
+}
+
+static void wcd939x_mbhc_gnd_det_ctrl(struct snd_soc_component *component,
+				      bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, WCD939X_ANA_MBHC_MECH,
+					      WCD939X_MBHC_MECH_MECH_HS_G_PULLUP_COMP_EN, 1);
+		snd_soc_component_write_field(component, WCD939X_ANA_MBHC_MECH,
+					      WCD939X_MBHC_MECH_GND_DET_EN, 1);
+	} else {
+		snd_soc_component_write_field(component, WCD939X_ANA_MBHC_MECH,
+					      WCD939X_MBHC_MECH_GND_DET_EN, 0);
+		snd_soc_component_write_field(component, WCD939X_ANA_MBHC_MECH,
+					      WCD939X_MBHC_MECH_MECH_HS_G_PULLUP_COMP_EN, 0);
+	}
+}
+
+static void wcd939x_mbhc_hph_pull_down_ctrl(struct snd_soc_component *component,
+					    bool enable)
+{
+	snd_soc_component_write_field(component, WCD939X_HPH_PA_CTL2,
+				      WCD939X_PA_CTL2_HPHPA_GND_R, enable);
+	snd_soc_component_write_field(component, WCD939X_HPH_PA_CTL2,
+				      WCD939X_PA_CTL2_HPHPA_GND_L, enable);
+}
+
+static void wcd939x_mbhc_moisture_config(struct snd_soc_component *component)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	if (wcd939x->mbhc_cfg.moist_rref == R_OFF || wcd939x->typec_analog_mux) {
+		snd_soc_component_write_field(component, WCD939X_MBHC_NEW_CTL_2,
+					      WCD939X_CTL_2_M_RTH_CTL, R_OFF);
+		return;
+	}
+
+	/* Do not enable moisture detection if jack type is NC */
+	if (!wcd939x->mbhc_cfg.hphl_swh) {
+		dev_dbg(component->dev, "%s: disable moisture detection for NC\n",
+			__func__);
+		snd_soc_component_write_field(component, WCD939X_MBHC_NEW_CTL_2,
+					      WCD939X_CTL_2_M_RTH_CTL, R_OFF);
+		return;
+	}
+
+	snd_soc_component_write_field(component, WCD939X_MBHC_NEW_CTL_2,
+				      WCD939X_CTL_2_M_RTH_CTL, wcd939x->mbhc_cfg.moist_rref);
+}
+
+static void wcd939x_mbhc_moisture_detect_en(struct snd_soc_component *component, bool enable)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	if (enable)
+		snd_soc_component_write_field(component, WCD939X_MBHC_NEW_CTL_2,
+					      WCD939X_CTL_2_M_RTH_CTL,
+					      wcd939x->mbhc_cfg.moist_rref);
+	else
+		snd_soc_component_write_field(component, WCD939X_MBHC_NEW_CTL_2,
+					      WCD939X_CTL_2_M_RTH_CTL, R_OFF);
+}
+
+static bool wcd939x_mbhc_get_moisture_status(struct snd_soc_component *component)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	bool ret = false;
+
+	if (wcd939x->mbhc_cfg.moist_rref == R_OFF || wcd939x->typec_analog_mux) {
+		snd_soc_component_write_field(component, WCD939X_MBHC_NEW_CTL_2,
+					      WCD939X_CTL_2_M_RTH_CTL, R_OFF);
+		goto done;
+	}
+
+	/* Do not enable moisture detection if jack type is NC */
+	if (!wcd939x->mbhc_cfg.hphl_swh) {
+		dev_dbg(component->dev, "%s: disable moisture detection for NC\n",
+			__func__);
+		snd_soc_component_write_field(component, WCD939X_MBHC_NEW_CTL_2,
+					      WCD939X_CTL_2_M_RTH_CTL, R_OFF);
+		goto done;
+	}
+
+	/*
+	 * If moisture_en is already enabled, then skip to plug type
+	 * detection.
+	 */
+	if ((snd_soc_component_read(component, WCD939X_MBHC_NEW_CTL_2) & WCD939X_CTL_2_M_RTH_CTL))
+		goto done;
+
+	wcd939x_mbhc_moisture_detect_en(component, true);
+	/* Read moisture comparator status */
+	ret = ((snd_soc_component_read(component, WCD939X_MBHC_NEW_FSM_STATUS)
+				& 0x20) ? 0 : 1);
+
+done:
+	return ret;
+}
+
+static void wcd939x_mbhc_moisture_polling_ctrl(struct snd_soc_component *component,
+					       bool enable)
+{
+	snd_soc_component_write_field(component,
+				      WCD939X_MBHC_NEW_INT_MOISTURE_DET_POLLING_CTRL,
+				      WCD939X_MOISTURE_DET_POLLING_CTRL_MOIST_EN_POLLING, enable);
+}
+
+static const struct wcd_mbhc_cb mbhc_cb = {
+	.clk_setup = wcd939x_mbhc_clk_setup,
+	.mbhc_bias = wcd939x_mbhc_mbhc_bias_control,
+	.set_btn_thr = wcd939x_mbhc_program_btn_thr,
+	.micbias_enable_status = wcd939x_mbhc_micb_en_status,
+	.hph_pull_up_control_v2 = wcd939x_mbhc_hph_l_pull_up_control,
+	.mbhc_micbias_control = wcd939x_mbhc_request_micbias,
+	.mbhc_micb_ramp_control = wcd939x_mbhc_micb_ramp_control,
+	.mbhc_micb_ctrl_thr_mic = wcd939x_mbhc_micb_ctrl_threshold_mic,
+	.compute_impedance = wcd939x_wcd_mbhc_calc_impedance,
+	.mbhc_gnd_det_ctrl = wcd939x_mbhc_gnd_det_ctrl,
+	.hph_pull_down_ctrl = wcd939x_mbhc_hph_pull_down_ctrl,
+	.mbhc_moisture_config = wcd939x_mbhc_moisture_config,
+	.mbhc_get_moisture_status = wcd939x_mbhc_get_moisture_status,
+	.mbhc_moisture_polling_ctrl = wcd939x_mbhc_moisture_polling_ctrl,
+	.mbhc_moisture_detect_en = wcd939x_mbhc_moisture_detect_en,
+};
+
+static int wcd939x_get_hph_type(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wcd_mbhc_get_hph_type(wcd939x->wcd_mbhc);
+
+	return 0;
+}
+
+static int wcd939x_hph_impedance_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	u32 zl, zr;
+	bool hphr;
+	struct soc_mixer_control *mc;
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+	wcd_mbhc_get_impedance(wcd939x->wcd_mbhc, &zl, &zr);
+	dev_dbg(component->dev, "%s: zl=%u(ohms), zr=%u(ohms)\n", __func__, zl, zr);
+	ucontrol->value.integer.value[0] = hphr ? zr : zl;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new hph_type_detect_controls[] = {
+	SOC_SINGLE_EXT("HPH Type", 0, 0, UINT_MAX, 0,
+		       wcd939x_get_hph_type, NULL),
+};
+
+static const struct snd_kcontrol_new impedance_detect_controls[] = {
+	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, UINT_MAX, 0,
+		       wcd939x_hph_impedance_get, NULL),
+	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, UINT_MAX, 0,
+		       wcd939x_hph_impedance_get, NULL),
+};
+
+static int wcd939x_mbhc_init(struct snd_soc_component *component)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	struct wcd_mbhc_intr *intr_ids = &wcd939x->intr_ids;
+
+	intr_ids->mbhc_sw_intr = regmap_irq_get_virq(wcd939x->irq_chip,
+						     WCD939X_IRQ_MBHC_SW_DET);
+	intr_ids->mbhc_btn_press_intr = regmap_irq_get_virq(wcd939x->irq_chip,
+							    WCD939X_IRQ_MBHC_BUTTON_PRESS_DET);
+	intr_ids->mbhc_btn_release_intr = regmap_irq_get_virq(wcd939x->irq_chip,
+							      WCD939X_IRQ_MBHC_BUTTON_RELEASE_DET);
+	intr_ids->mbhc_hs_ins_intr = regmap_irq_get_virq(wcd939x->irq_chip,
+							 WCD939X_IRQ_MBHC_ELECT_INS_REM_LEG_DET);
+	intr_ids->mbhc_hs_rem_intr = regmap_irq_get_virq(wcd939x->irq_chip,
+							 WCD939X_IRQ_MBHC_ELECT_INS_REM_DET);
+	intr_ids->hph_left_ocp = regmap_irq_get_virq(wcd939x->irq_chip,
+						     WCD939X_IRQ_HPHL_OCP_INT);
+	intr_ids->hph_right_ocp = regmap_irq_get_virq(wcd939x->irq_chip,
+						      WCD939X_IRQ_HPHR_OCP_INT);
+
+	wcd939x->wcd_mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
+	if (IS_ERR(wcd939x->wcd_mbhc))
+		return PTR_ERR(wcd939x->wcd_mbhc);
+
+	snd_soc_add_component_controls(component, impedance_detect_controls,
+				       ARRAY_SIZE(impedance_detect_controls));
+	snd_soc_add_component_controls(component, hph_type_detect_controls,
+				       ARRAY_SIZE(hph_type_detect_controls));
+
+	return 0;
+}
+
+static void wcd939x_mbhc_deinit(struct snd_soc_component *component)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	wcd_mbhc_deinit(wcd939x->wcd_mbhc);
+}
+
+/* END MBHC */
+
+static const struct snd_kcontrol_new wcd939x_snd_controls[] = {
+	/* RX Path */
+	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD939X_COMP_L, 0, 1, 0,
+		       wcd939x_get_compander, wcd939x_set_compander),
+	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD939X_COMP_R, 1, 1, 0,
+		       wcd939x_get_compander, wcd939x_set_compander),
+	SOC_SINGLE_EXT("HPHL Switch", WCD939X_HPH_L, 0, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("HPHR Switch", WCD939X_HPH_R, 0, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("CLSH Switch", WCD939X_CLSH, 0, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("LO Switch", WCD939X_LO, 0, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_L Switch", WCD939X_DSD_L, 0, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_R Switch", WCD939X_DSD_R, 0, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_TLV("HPHL Volume", WCD939X_HPH_L_EN, 0, 20, 1, line_gain),
+	SOC_SINGLE_TLV("HPHR Volume", WCD939X_HPH_R_EN, 0, 20, 1, line_gain),
+	SOC_SINGLE_EXT("LDOH Enable Switch", SND_SOC_NOPM, 0, 1, 0,
+		       wcd939x_ldoh_get, wcd939x_ldoh_put),
+
+	/* TX Path */
+	SOC_SINGLE_EXT("ADC1 Switch", WCD939X_ADC1, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("ADC2 Switch", WCD939X_ADC2, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("ADC3 Switch", WCD939X_ADC3, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("ADC4 Switch", WCD939X_ADC4, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC0 Switch", WCD939X_DMIC0, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC1 Switch", WCD939X_DMIC1, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("MBHC Switch", WCD939X_MBHC, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC2 Switch", WCD939X_DMIC2, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC3 Switch", WCD939X_DMIC3, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC4 Switch", WCD939X_DMIC4, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC5 Switch", WCD939X_DMIC5, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC6 Switch", WCD939X_DMIC6, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC7 Switch", WCD939X_DMIC7, 1, 1, 0,
+		       wcd939x_get_swr_port, wcd939x_set_swr_port),
+	SOC_SINGLE_TLV("ADC1 Volume", WCD939X_ANA_TX_CH1, 0, 20, 0,
+		       analog_gain),
+	SOC_SINGLE_TLV("ADC2 Volume", WCD939X_ANA_TX_CH2, 0, 20, 0,
+		       analog_gain),
+	SOC_SINGLE_TLV("ADC3 Volume", WCD939X_ANA_TX_CH3, 0, 20, 0,
+		       analog_gain),
+	SOC_SINGLE_TLV("ADC4 Volume", WCD939X_ANA_TX_CH4, 0, 20, 0,
+		       analog_gain),
+};
+
+static const struct snd_soc_dapm_widget wcd939x_dapm_widgets[] = {
+	/*input widgets*/
+	SND_SOC_DAPM_INPUT("AMIC1"),
+	SND_SOC_DAPM_INPUT("AMIC2"),
+	SND_SOC_DAPM_INPUT("AMIC3"),
+	SND_SOC_DAPM_INPUT("AMIC4"),
+	SND_SOC_DAPM_INPUT("AMIC5"),
+
+	SND_SOC_DAPM_MIC("Analog Mic1", NULL),
+	SND_SOC_DAPM_MIC("Analog Mic2", NULL),
+	SND_SOC_DAPM_MIC("Analog Mic3", NULL),
+	SND_SOC_DAPM_MIC("Analog Mic4", NULL),
+	SND_SOC_DAPM_MIC("Analog Mic5", NULL),
+
+	/* TX widgets */
+	SND_SOC_DAPM_ADC_E("ADC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd939x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADC2", NULL, SND_SOC_NOPM, 1, 0,
+			   wcd939x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADC3", NULL, SND_SOC_NOPM, 2, 0,
+			   wcd939x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADC4", NULL, SND_SOC_NOPM, 3, 0,
+			   wcd939x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd939x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC2", NULL, SND_SOC_NOPM, 1, 0,
+			   wcd939x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC3", NULL, SND_SOC_NOPM, 2, 0,
+			   wcd939x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC4", NULL, SND_SOC_NOPM, 3, 0,
+			   wcd939x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC5", NULL, SND_SOC_NOPM, 4, 0,
+			   wcd939x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC6", NULL, SND_SOC_NOPM, 5, 0,
+			   wcd939x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC7", NULL, SND_SOC_NOPM, 6, 0,
+			   wcd939x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC8", NULL, SND_SOC_NOPM, 7, 0,
+			   wcd939x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER_E("ADC1 REQ", SND_SOC_NOPM, 0, 0, NULL, 0,
+			     wcd939x_adc_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC2 REQ", SND_SOC_NOPM, 1, 0, NULL, 0,
+			     wcd939x_adc_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC3 REQ", SND_SOC_NOPM, 2, 0, NULL, 0,
+			     wcd939x_adc_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC4 REQ", SND_SOC_NOPM, 3, 0, NULL, 0,
+			     wcd939x_adc_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("ADC1 MUX", SND_SOC_NOPM, 0, 0, &tx_adc1_mux),
+	SND_SOC_DAPM_MUX("ADC2 MUX", SND_SOC_NOPM, 0, 0, &tx_adc2_mux),
+	SND_SOC_DAPM_MUX("ADC3 MUX", SND_SOC_NOPM, 0, 0, &tx_adc3_mux),
+	SND_SOC_DAPM_MUX("ADC4 MUX", SND_SOC_NOPM, 0, 0, &tx_adc4_mux),
+
+	/* tx mixers */
+	SND_SOC_DAPM_MIXER_E("ADC1_MIXER", SND_SOC_NOPM, 0, 0,
+			     adc1_switch, ARRAY_SIZE(adc1_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC2_MIXER", SND_SOC_NOPM, 0, 0,
+			     adc2_switch, ARRAY_SIZE(adc2_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC3_MIXER", SND_SOC_NOPM, 0, 0,
+			     adc3_switch, ARRAY_SIZE(adc3_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC4_MIXER", SND_SOC_NOPM, 0, 0,
+			     adc4_switch, ARRAY_SIZE(adc4_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC1_MIXER", SND_SOC_NOPM, 0, 0,
+			     dmic1_switch, ARRAY_SIZE(dmic1_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC2_MIXER", SND_SOC_NOPM, 0, 0,
+			     dmic2_switch, ARRAY_SIZE(dmic2_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC3_MIXER", SND_SOC_NOPM, 0, 0,
+			     dmic3_switch, ARRAY_SIZE(dmic3_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC4_MIXER", SND_SOC_NOPM, 0, 0,
+			     dmic4_switch, ARRAY_SIZE(dmic4_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC5_MIXER", SND_SOC_NOPM, 0, 0,
+			     dmic5_switch, ARRAY_SIZE(dmic5_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC6_MIXER", SND_SOC_NOPM, 0, 0,
+			     dmic6_switch, ARRAY_SIZE(dmic6_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC7_MIXER", SND_SOC_NOPM, 0, 0,
+			     dmic7_switch, ARRAY_SIZE(dmic7_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC8_MIXER", SND_SOC_NOPM, 0, 0,
+			     dmic8_switch, ARRAY_SIZE(dmic8_switch), wcd939x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* micbias widgets */
+	SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
+			    wcd939x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
+			    wcd939x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
+			    wcd939x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS4", SND_SOC_NOPM, MIC_BIAS_4, 0,
+			    wcd939x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+
+	/* micbias pull up widgets */
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
+			    wcd939x_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
+			    wcd939x_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
+			    wcd939x_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS4", SND_SOC_NOPM, MIC_BIAS_4, 0,
+			    wcd939x_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+
+	/* output widgets tx */
+	SND_SOC_DAPM_OUTPUT("ADC1_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC2_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC3_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC4_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC1_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC2_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC3_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC4_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC5_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC6_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC7_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC8_OUTPUT"),
+
+	SND_SOC_DAPM_INPUT("IN1_HPHL"),
+	SND_SOC_DAPM_INPUT("IN2_HPHR"),
+	SND_SOC_DAPM_INPUT("IN3_EAR"),
+
+	/* rx widgets */
+	SND_SOC_DAPM_PGA_E("EAR PGA", WCD939X_ANA_EAR, 7, 0, NULL, 0,
+			   wcd939x_codec_enable_ear_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHL PGA", WCD939X_ANA_HPH, 7, 0, NULL, 0,
+			   wcd939x_codec_enable_hphl_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHR PGA", WCD939X_ANA_HPH, 6, 0, NULL, 0,
+			   wcd939x_codec_enable_hphr_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_DAC_E("RDAC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd939x_codec_hphl_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RDAC2", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd939x_codec_hphr_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RDAC3", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd939x_codec_ear_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("RDAC3_MUX", SND_SOC_NOPM, 0, 0, &rx_rdac3_mux),
+
+	SND_SOC_DAPM_SUPPLY("VDD_BUCK", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RXCLK", SND_SOC_NOPM, 0, 0,
+			    wcd939x_codec_enable_rxclk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("CLS_H_PORT", 1, SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MIXER_E("RX1", SND_SOC_NOPM, 0, 0, NULL, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER_E("RX2", SND_SOC_NOPM, 0, 0, NULL, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER_E("RX3", SND_SOC_NOPM, 0, 0, NULL, 0, NULL, 0),
+
+	/* rx mixer widgets */
+	SND_SOC_DAPM_MIXER("EAR_RDAC", SND_SOC_NOPM, 0, 0,
+			   ear_rdac_switch, ARRAY_SIZE(ear_rdac_switch)),
+	SND_SOC_DAPM_MIXER("HPHL_RDAC", SND_SOC_NOPM, 0, 0,
+			   hphl_rdac_switch, ARRAY_SIZE(hphl_rdac_switch)),
+	SND_SOC_DAPM_MIXER("HPHR_RDAC", SND_SOC_NOPM, 0, 0,
+			   hphr_rdac_switch, ARRAY_SIZE(hphr_rdac_switch)),
+
+	/* output widgets rx */
+	SND_SOC_DAPM_OUTPUT("EAR"),
+	SND_SOC_DAPM_OUTPUT("HPHL"),
+	SND_SOC_DAPM_OUTPUT("HPHR"),
+};
+
+static const struct snd_soc_dapm_route wcd939x_audio_map[] = {
+	/* TX Path */
+	{"ADC1_OUTPUT", NULL, "ADC1_MIXER"},
+	{"ADC1_MIXER", "Switch", "ADC1 REQ"},
+	{"ADC1 REQ", NULL, "ADC1"},
+	{"ADC1", NULL, "ADC1 MUX"},
+	{"ADC1 MUX", "CH1_AMIC1", "AMIC1"},
+	{"ADC1 MUX", "CH1_AMIC2", "AMIC2"},
+	{"ADC1 MUX", "CH1_AMIC3", "AMIC3"},
+	{"ADC1 MUX", "CH1_AMIC4", "AMIC4"},
+	{"ADC1 MUX", "CH1_AMIC5", "AMIC5"},
+
+	{"ADC2_OUTPUT", NULL, "ADC2_MIXER"},
+	{"ADC2_MIXER", "Switch", "ADC2 REQ"},
+	{"ADC2 REQ", NULL, "ADC2"},
+	{"ADC2", NULL, "ADC2 MUX"},
+	{"ADC2 MUX", "CH2_AMIC1", "AMIC1"},
+	{"ADC2 MUX", "CH2_AMIC2", "AMIC2"},
+	{"ADC2 MUX", "CH2_AMIC3", "AMIC3"},
+	{"ADC2 MUX", "CH2_AMIC4", "AMIC4"},
+	{"ADC2 MUX", "CH2_AMIC5", "AMIC5"},
+
+	{"ADC3_OUTPUT", NULL, "ADC3_MIXER"},
+	{"ADC3_MIXER", "Switch", "ADC3 REQ"},
+	{"ADC3 REQ", NULL, "ADC3"},
+	{"ADC3", NULL, "ADC3 MUX"},
+	{"ADC3 MUX", "CH3_AMIC1", "AMIC1"},
+	{"ADC3 MUX", "CH3_AMIC3", "AMIC3"},
+	{"ADC3 MUX", "CH3_AMIC4", "AMIC4"},
+	{"ADC3 MUX", "CH3_AMIC5", "AMIC5"},
+
+	{"ADC4_OUTPUT", NULL, "ADC4_MIXER"},
+	{"ADC4_MIXER", "Switch", "ADC4 REQ"},
+	{"ADC4 REQ", NULL, "ADC4"},
+	{"ADC4", NULL, "ADC4 MUX"},
+	{"ADC4 MUX", "CH4_AMIC1", "AMIC1"},
+	{"ADC4 MUX", "CH4_AMIC3", "AMIC3"},
+	{"ADC4 MUX", "CH4_AMIC4", "AMIC4"},
+	{"ADC4 MUX", "CH4_AMIC5", "AMIC5"},
+
+	{"DMIC1_OUTPUT", NULL, "DMIC1_MIXER"},
+	{"DMIC1_MIXER", "Switch", "DMIC1"},
+
+	{"DMIC2_OUTPUT", NULL, "DMIC2_MIXER"},
+	{"DMIC2_MIXER", "Switch", "DMIC2"},
+
+	{"DMIC3_OUTPUT", NULL, "DMIC3_MIXER"},
+	{"DMIC3_MIXER", "Switch", "DMIC3"},
+
+	{"DMIC4_OUTPUT", NULL, "DMIC4_MIXER"},
+	{"DMIC4_MIXER", "Switch", "DMIC4"},
+
+	{"DMIC5_OUTPUT", NULL, "DMIC5_MIXER"},
+	{"DMIC5_MIXER", "Switch", "DMIC5"},
+
+	{"DMIC6_OUTPUT", NULL, "DMIC6_MIXER"},
+	{"DMIC6_MIXER", "Switch", "DMIC6"},
+
+	{"DMIC7_OUTPUT", NULL, "DMIC7_MIXER"},
+	{"DMIC7_MIXER", "Switch", "DMIC7"},
+
+	{"DMIC8_OUTPUT", NULL, "DMIC8_MIXER"},
+	{"DMIC8_MIXER", "Switch", "DMIC8"},
+
+	/* RX Path */
+	{"IN1_HPHL", NULL, "VDD_BUCK"},
+	{"IN1_HPHL", NULL, "CLS_H_PORT"},
+
+	{"RX1", NULL, "IN1_HPHL"},
+	{"RX1", NULL, "RXCLK"},
+	{"RDAC1", NULL, "RX1"},
+	{"HPHL_RDAC", "Switch", "RDAC1"},
+	{"HPHL PGA", NULL, "HPHL_RDAC"},
+	{"HPHL", NULL, "HPHL PGA"},
+
+	{"IN2_HPHR", NULL, "VDD_BUCK"},
+	{"IN2_HPHR", NULL, "CLS_H_PORT"},
+	{"RX2", NULL, "IN2_HPHR"},
+	{"RDAC2", NULL, "RX2"},
+	{"RX2", NULL, "RXCLK"},
+	{"HPHR_RDAC", "Switch", "RDAC2"},
+	{"HPHR PGA", NULL, "HPHR_RDAC"},
+	{"HPHR", NULL, "HPHR PGA"},
+
+	{"IN3_EAR", NULL, "VDD_BUCK"},
+	{"RX3", NULL, "IN3_EAR"},
+	{"RX3", NULL, "RXCLK"},
+
+	{"RDAC3_MUX", "RX3", "RX3"},
+	{"RDAC3_MUX", "RX1", "RX1"},
+	{"RDAC3", NULL, "RDAC3_MUX"},
+	{"EAR_RDAC", "Switch", "RDAC3"},
+	{"EAR PGA", NULL, "EAR_RDAC"},
+	{"EAR", NULL, "EAR PGA"},
+};
+
+static int wcd939x_set_micbias_data(struct wcd939x_priv *wcd939x)
+{
+	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
+
+	/* set micbias voltage */
+	vout_ctl_1 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb1_mv);
+	vout_ctl_2 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb2_mv);
+	vout_ctl_3 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb3_mv);
+	vout_ctl_4 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb4_mv);
+	if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || vout_ctl_4 < 0)
+		return -EINVAL;
+
+	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB1, 0x3F, vout_ctl_1);
+	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB2, 0x3F, vout_ctl_2);
+	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB3, 0x3F, vout_ctl_3);
+	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB4, 0x3F, vout_ctl_4);
+
+	return 0;
+}
+
+static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
+{
+	return IRQ_HANDLED;
+}
+
+static struct irq_chip wcd_irq_chip = {
+	.name = "WCD939x",
+};
+
+static int wcd_irq_chip_map(struct irq_domain *irqd, unsigned int virq,
+			    irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(virq, &wcd_irq_chip, handle_simple_irq);
+	irq_set_nested_thread(virq, 1);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops wcd_domain_ops = {
+	.map = wcd_irq_chip_map,
+};
+
+static int wcd939x_irq_init(struct wcd939x_priv *wcd, struct device *dev)
+{
+	wcd->virq = irq_domain_add_linear(NULL, 1, &wcd_domain_ops, NULL);
+	if (!(wcd->virq)) {
+		dev_err(dev, "%s: Failed to add IRQ domain\n", __func__);
+		return -EINVAL;
+	}
+
+	return devm_regmap_add_irq_chip(dev, wcd->regmap,
+					irq_create_mapping(wcd->virq, 0),
+					IRQF_ONESHOT, 0, &wcd939x_regmap_irq_chip,
+					&wcd->irq_chip);
+}
+
+static int wcd939x_soc_codec_probe(struct snd_soc_component *component)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	struct sdw_slave *tx_sdw_dev = wcd939x->tx_sdw_dev;
+	struct device *dev = component->dev;
+	unsigned long time_left;
+	int ret, i;
+
+	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
+						msecs_to_jiffies(2000));
+	if (!time_left) {
+		dev_err(dev, "soundwire device init timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	snd_soc_component_init_regmap(component, wcd939x->regmap);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	wcd939x->variant = snd_soc_component_read_field(component,
+							WCD939X_DIGITAL_EFUSE_REG_0,
+							WCD939X_EFUSE_REG_0_WCD939X_ID);
+
+	wcd939x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD939X);
+	if (IS_ERR(wcd939x->clsh_info)) {
+		pm_runtime_put(dev);
+		return PTR_ERR(wcd939x->clsh_info);
+	}
+
+	wcd939x_io_init(component);
+
+	/* Set all interrupts as edge triggered */
+	for (i = 0; i < wcd939x_regmap_irq_chip.num_regs; i++) {
+		regmap_write(wcd939x->regmap,
+			     (WCD939X_DIGITAL_INTR_LEVEL_0 + i), 0);
+	}
+
+	pm_runtime_put(dev);
+
+	wcd939x->hphr_pdm_wd_int = regmap_irq_get_virq(wcd939x->irq_chip,
+						       WCD939X_IRQ_HPHR_PDM_WD_INT);
+	wcd939x->hphl_pdm_wd_int = regmap_irq_get_virq(wcd939x->irq_chip,
+						       WCD939X_IRQ_HPHL_PDM_WD_INT);
+	wcd939x->ear_pdm_wd_int = regmap_irq_get_virq(wcd939x->irq_chip,
+						      WCD939X_IRQ_EAR_PDM_WD_INT);
+
+	/* Request for watchdog interrupt */
+	ret = request_threaded_irq(wcd939x->hphr_pdm_wd_int, NULL, wcd939x_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "HPHR PDM WD INT", wcd939x);
+	if (ret) {
+		dev_err(dev, "Failed to request HPHR WD interrupt (%d)\n", ret);
+		goto err_free_clsh_ctrl;
+	}
+
+	ret = request_threaded_irq(wcd939x->hphl_pdm_wd_int, NULL, wcd939x_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "HPHL PDM WD INT", wcd939x);
+	if (ret) {
+		dev_err(dev, "Failed to request HPHL WD interrupt (%d)\n", ret);
+		goto err_free_hphr_pdm_wd_int;
+	}
+
+	ret = request_threaded_irq(wcd939x->ear_pdm_wd_int, NULL, wcd939x_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "AUX PDM WD INT", wcd939x);
+	if (ret) {
+		dev_err(dev, "Failed to request Aux WD interrupt (%d)\n", ret);
+		goto err_free_hphl_pdm_wd_int;
+	}
+
+	/* Disable watchdog interrupt for HPH and AUX */
+	disable_irq_nosync(wcd939x->hphr_pdm_wd_int);
+	disable_irq_nosync(wcd939x->hphl_pdm_wd_int);
+	disable_irq_nosync(wcd939x->ear_pdm_wd_int);
+
+	switch (wcd939x->variant) {
+	case WCD9390:
+		ret = snd_soc_add_component_controls(component, wcd9390_snd_controls,
+						     ARRAY_SIZE(wcd9390_snd_controls));
+		if (ret < 0) {
+			dev_err(component->dev,
+				"%s: Failed to add snd ctrls for variant: %d\n",
+				__func__, wcd939x->variant);
+			goto err_free_ear_pdm_wd_int;
+		}
+		break;
+	case WCD9395:
+		ret = snd_soc_add_component_controls(component, wcd9395_snd_controls,
+						     ARRAY_SIZE(wcd9395_snd_controls));
+		if (ret < 0) {
+			dev_err(component->dev,
+				"%s: Failed to add snd ctrls for variant: %d\n",
+				__func__, wcd939x->variant);
+			goto err_free_ear_pdm_wd_int;
+		}
+		break;
+	default:
+		break;
+	}
+
+	ret = wcd939x_mbhc_init(component);
+	if (ret) {
+		dev_err(component->dev,  "mbhc initialization failed\n");
+		goto err_free_ear_pdm_wd_int;
+	}
+
+	return 0;
+
+err_free_ear_pdm_wd_int:
+	free_irq(wcd939x->ear_pdm_wd_int, wcd939x);
+err_free_hphl_pdm_wd_int:
+	free_irq(wcd939x->hphl_pdm_wd_int, wcd939x);
+err_free_hphr_pdm_wd_int:
+	free_irq(wcd939x->hphr_pdm_wd_int, wcd939x);
+err_free_clsh_ctrl:
+	wcd_clsh_ctrl_free(wcd939x->clsh_info);
+
+	return ret;
+}
+
+static void wcd939x_soc_codec_remove(struct snd_soc_component *component)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	wcd939x_mbhc_deinit(component);
+
+	free_irq(wcd939x->ear_pdm_wd_int, wcd939x);
+	free_irq(wcd939x->hphl_pdm_wd_int, wcd939x);
+	free_irq(wcd939x->hphr_pdm_wd_int, wcd939x);
+
+	wcd_clsh_ctrl_free(wcd939x->clsh_info);
+}
+
+static int wcd939x_codec_set_jack(struct snd_soc_component *comp,
+				  struct snd_soc_jack *jack, void *data)
+{
+	struct wcd939x_priv *wcd = dev_get_drvdata(comp->dev);
+
+	if (jack)
+		return wcd_mbhc_start(wcd->wcd_mbhc, &wcd->mbhc_cfg, jack);
+
+	wcd_mbhc_stop(wcd->wcd_mbhc);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_wcd939x = {
+	.name = "wcd939x_codec",
+	.probe = wcd939x_soc_codec_probe,
+	.remove = wcd939x_soc_codec_remove,
+	.controls = wcd939x_snd_controls,
+	.num_controls = ARRAY_SIZE(wcd939x_snd_controls),
+	.dapm_widgets = wcd939x_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wcd939x_dapm_widgets),
+	.dapm_routes = wcd939x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wcd939x_audio_map),
+	.set_jack = wcd939x_codec_set_jack,
+	.endianness = 1,
+};
+
+/* Get USB-C plug orientation to provide swap event for MBHC */
+static int wcd939x_typec_switch_set(struct typec_switch_dev *sw,
+				    enum typec_orientation orientation)
+{
+	struct wcd939x_priv *wcd939x = typec_switch_get_drvdata(sw);
+
+	wcd939x->typec_orientation = orientation;
+
+	return 0;
+}
+
+static int wcd939x_typec_mux_set(struct typec_mux_dev *mux,
+				 struct typec_mux_state *state)
+{
+	struct wcd939x_priv *wcd939x = typec_mux_get_drvdata(mux);
+	unsigned int previous_mode = wcd939x->typec_mode;
+
+	if (!wcd939x->wcd_mbhc)
+		return -EINVAL;
+
+	if (wcd939x->typec_mode != state->mode) {
+		wcd939x->typec_mode = state->mode;
+
+		if (wcd939x->typec_mode == TYPEC_MODE_AUDIO)
+			return wcd_mbhc_typec_report_plug(wcd939x->wcd_mbhc);
+		else if (previous_mode == TYPEC_MODE_AUDIO)
+			return wcd_mbhc_typec_report_unplug(wcd939x->wcd_mbhc);
+	}
+
+	return 0;
+}
+
+static void wcd939x_dt_parse_micbias_info(struct device *dev, struct wcd939x_priv *wcd)
+{
+	struct device_node *np = dev->of_node;
+	u32 prop_val = 0;
+	int rc = 0;
+
+	rc = of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val);
+	if (!rc)
+		wcd->micb1_mv = prop_val / 1000;
+	else
+		dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
+
+	rc = of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val);
+	if (!rc)
+		wcd->micb2_mv = prop_val / 1000;
+	else
+		dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
+
+	rc = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
+	if (!rc)
+		wcd->micb3_mv = prop_val / 1000;
+	else
+		dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
+
+	rc = of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val);
+	if (!rc)
+		wcd->micb4_mv = prop_val / 1000;
+	else
+		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
+}
+
+static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component, bool active)
+{
+	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+
+	if (!wcd939x->typec_analog_mux || !wcd939x->typec_switch)
+		return -EINVAL;
+
+	/* Report inversion via Type Switch of USBSS */
+	return typec_switch_set(wcd939x->typec_switch,
+				wcd939x->typec_orientation == TYPEC_ORIENTATION_REVERSE ?
+					TYPEC_ORIENTATION_NORMAL : TYPEC_ORIENTATION_REVERSE);
+}
+
+static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device *dev)
+{
+	struct wcd_mbhc_config *cfg = &wcd939x->mbhc_cfg;
+	struct device_node *np;
+	int ret;
+
+	wcd939x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
+	if (wcd939x->reset_gpio < 0)
+		return dev_err_probe(dev, wcd939x->reset_gpio,
+				     "Failed to get reset gpio\n");
+
+	wcd939x->supplies[0].supply = "vdd-rxtx";
+	wcd939x->supplies[1].supply = "vdd-io";
+	wcd939x->supplies[2].supply = "vdd-buck";
+	wcd939x->supplies[3].supply = "vdd-mic-bias";
+
+	ret = regulator_bulk_get(dev, WCD939X_MAX_SUPPLY, wcd939x->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
+
+	ret = regulator_bulk_enable(WCD939X_MAX_SUPPLY, wcd939x->supplies);
+	if (ret) {
+		regulator_bulk_free(WCD939X_MAX_SUPPLY, wcd939x->supplies);
+		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
+	}
+
+	wcd939x_dt_parse_micbias_info(dev, wcd939x);
+
+	cfg->mbhc_micbias = MIC_BIAS_2;
+	cfg->anc_micbias = MIC_BIAS_2;
+	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
+	cfg->num_btn = WCD939X_MBHC_MAX_BUTTONS;
+	cfg->micb_mv = wcd939x->micb2_mv;
+	cfg->linein_th = 5000;
+	cfg->hs_thr = 1700;
+	cfg->hph_thr = 50;
+
+	wcd_dt_parse_mbhc_data(dev, cfg);
+
+	/*
+	 * Is node has a port and a valid remote endpoint
+	 * consider HP lines are connected to the USBSS part
+	 */
+	np = of_graph_get_remote_node(dev->of_node, 0, 0);
+	if (np) {
+		wcd939x->typec_analog_mux = true;
+		cfg->typec_analog_mux = true;
+		cfg->swap_gnd_mic = wcd939x_swap_gnd_mic;
+	}
+
+	return 0;
+}
+
+static int wcd939x_reset(struct wcd939x_priv *wcd939x)
+{
+	gpio_direction_output(wcd939x->reset_gpio, 0);
+	/* 20us sleep required after pulling the reset gpio to LOW */
+	usleep_range(20, 30);
+	gpio_set_value(wcd939x->reset_gpio, 1);
+	/* 20us sleep required after pulling the reset gpio to HIGH */
+	usleep_range(20, 30);
+
+	return 0;
+}
+
+static int wcd939x_codec_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct wcd939x_priv *wcd939x = dev_get_drvdata(dai->dev);
+	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[dai->id];
+
+	return wcd939x_sdw_hw_params(wcd, substream, params, dai);
+}
+
+static int wcd939x_codec_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct wcd939x_priv *wcd939x = dev_get_drvdata(dai->dev);
+	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[dai->id];
+
+	return wcd939x_sdw_free(wcd, substream, dai);
+}
+
+static int wcd939x_codec_set_sdw_stream(struct snd_soc_dai *dai,
+					void *stream, int direction)
+{
+	struct wcd939x_priv *wcd939x = dev_get_drvdata(dai->dev);
+	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[dai->id];
+
+	return wcd939x_sdw_set_sdw_stream(wcd, dai, stream, direction);
+}
+
+static const struct snd_soc_dai_ops wcd939x_sdw_dai_ops = {
+	.hw_params = wcd939x_codec_hw_params,
+	.hw_free = wcd939x_codec_free,
+	.set_stream = wcd939x_codec_set_sdw_stream,
+};
+
+static struct snd_soc_dai_driver wcd939x_dais[] = {
+	[0] = {
+		.name = "wcd939x-sdw-rx",
+		.playback = {
+			.stream_name = "WCD AIF1 Playback",
+			.rates = WCD939X_RATES_MASK | WCD939X_FRAC_RATES_MASK,
+			.formats = WCD939X_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &wcd939x_sdw_dai_ops,
+	},
+	[1] = {
+		.name = "wcd939x-sdw-tx",
+		.capture = {
+			.stream_name = "WCD AIF1 Capture",
+			.rates = WCD939X_RATES_MASK | WCD939X_FRAC_RATES_MASK,
+			.formats = WCD939X_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 384000,
+			.channels_min = 1,
+			.channels_max = 4,
+		},
+		.ops = &wcd939x_sdw_dai_ops,
+	},
+};
+
+static int wcd939x_bind(struct device *dev)
+{
+	struct wcd939x_priv *wcd939x = dev_get_drvdata(dev);
+	unsigned int version, id1, status1;
+	int ret;
+
+	/*
+	 * Get USBSS type-c switch to send gnd/mic swap events
+	 * typec_switch is fetched now to avoid a probe deadlock since
+	 * the USBSS depends on the typec_mux register in wcd939x_probe()
+	 */
+	if (wcd939x->typec_analog_mux) {
+		wcd939x->typec_switch = fwnode_typec_switch_get(dev->fwnode);
+		if (IS_ERR(wcd939x->typec_switch))
+			return dev_err_probe(dev, PTR_ERR(wcd939x->typec_switch),
+					     "failed to acquire orientation-switch\n");
+	}
+
+	ret = component_bind_all(dev, wcd939x);
+	if (ret) {
+		dev_err(dev, "%s: Slave bind failed, ret = %d\n",
+			__func__, ret);
+		goto err_put_typec_switch;
+	}
+
+	wcd939x->rxdev = wcd939x_sdw_device_get(wcd939x->rxnode);
+	if (!wcd939x->rxdev) {
+		dev_err(dev, "could not find slave with matching of node\n");
+		ret = -EINVAL;
+		goto err_unbind;
+	}
+	wcd939x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd939x->rxdev);
+	wcd939x->sdw_priv[AIF1_PB]->wcd939x = wcd939x;
+
+	wcd939x->txdev = wcd939x_sdw_device_get(wcd939x->txnode);
+	if (!wcd939x->txdev) {
+		dev_err(dev, "could not find txslave with matching of node\n");
+		ret = -EINVAL;
+		goto err_put_rxdev;
+	}
+	wcd939x->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd939x->txdev);
+	wcd939x->sdw_priv[AIF1_CAP]->wcd939x = wcd939x;
+	wcd939x->tx_sdw_dev = dev_to_sdw_dev(wcd939x->txdev);
+
+	/*
+	 * As TX is main CSR reg interface, which should not be suspended first.
+	 * explicitly add the dependency link
+	 */
+	if (!device_link_add(wcd939x->rxdev, wcd939x->txdev, DL_FLAG_STATELESS |
+			    DL_FLAG_PM_RUNTIME)) {
+		dev_err(dev, "could not devlink tx and rx\n");
+		ret = -EINVAL;
+		goto err_put_txdev;
+	}
+
+	if (!device_link_add(dev, wcd939x->txdev, DL_FLAG_STATELESS |
+					DL_FLAG_PM_RUNTIME)) {
+		dev_err(dev, "could not devlink wcd and tx\n");
+		ret = -EINVAL;
+		goto err_remove_rxtx_link;
+	}
+
+	if (!device_link_add(dev, wcd939x->rxdev, DL_FLAG_STATELESS |
+					DL_FLAG_PM_RUNTIME)) {
+		dev_err(dev, "could not devlink wcd and rx\n");
+		ret = -EINVAL;
+		goto err_remove_tx_link;
+	}
+
+	wcd939x->regmap = dev_get_regmap(&wcd939x->tx_sdw_dev->dev, NULL);
+	if (!wcd939x->regmap) {
+		dev_err(dev, "could not get TX device regmap\n");
+		ret = -EINVAL;
+		goto err_remove_rx_link;
+	}
+
+	ret = wcd939x_irq_init(wcd939x, dev);
+	if (ret) {
+		dev_err(dev, "%s: IRQ init failed: %d\n", __func__, ret);
+		goto err_remove_rx_link;
+	}
+
+	wcd939x->sdw_priv[AIF1_PB]->slave_irq = wcd939x->virq;
+	wcd939x->sdw_priv[AIF1_CAP]->slave_irq = wcd939x->virq;
+
+	ret = wcd939x_set_micbias_data(wcd939x);
+	if (ret < 0) {
+		dev_err(dev, "%s: bad micbias pdata\n", __func__);
+		goto err_remove_rx_link;
+	}
+
+	/* Check WCD9395 version */
+	regmap_read(wcd939x->regmap, WCD939X_DIGITAL_CHIP_ID1, &id1);
+	regmap_read(wcd939x->regmap, WCD939X_EAR_STATUS_REG_1, &status1);
+
+	if (id1 == 0)
+		version = ((status1 & 0x3) ? WCD939X_VERSION_1_1 : WCD939X_VERSION_1_0);
+	else if (id1 == 1)
+		version = WCD939X_VERSION_2_0;
+
+	dev_dbg(dev, "wcd939x version: %s\n", version_to_str(version));
+
+	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd939x,
+					 wcd939x_dais, ARRAY_SIZE(wcd939x_dais));
+	if (ret) {
+		dev_err(dev, "%s: Codec registration failed\n",
+			__func__);
+		goto err_remove_rx_link;
+	}
+
+	return 0;
+
+err_remove_rx_link:
+	device_link_remove(dev, wcd939x->rxdev);
+err_remove_tx_link:
+	device_link_remove(dev, wcd939x->txdev);
+err_remove_rxtx_link:
+	device_link_remove(wcd939x->rxdev, wcd939x->txdev);
+err_put_txdev:
+	put_device(wcd939x->txdev);
+err_put_rxdev:
+	put_device(wcd939x->rxdev);
+err_unbind:
+	component_unbind_all(dev, wcd939x);
+err_put_typec_switch:
+	if (wcd939x->typec_analog_mux)
+		typec_switch_put(wcd939x->typec_switch);
+
+	return ret;
+}
+
+static void wcd939x_unbind(struct device *dev)
+{
+	struct wcd939x_priv *wcd939x = dev_get_drvdata(dev);
+
+	snd_soc_unregister_component(dev);
+	device_link_remove(dev, wcd939x->txdev);
+	device_link_remove(dev, wcd939x->rxdev);
+	device_link_remove(wcd939x->rxdev, wcd939x->txdev);
+	put_device(wcd939x->txdev);
+	put_device(wcd939x->rxdev);
+	component_unbind_all(dev, wcd939x);
+}
+
+static const struct component_master_ops wcd939x_comp_ops = {
+	.bind   = wcd939x_bind,
+	.unbind = wcd939x_unbind,
+};
+
+static int wcd939x_add_slave_components(struct wcd939x_priv *wcd939x,
+					struct device *dev,
+					struct component_match **matchptr)
+{
+	struct device_node *np;
+
+	np = dev->of_node;
+
+	wcd939x->rxnode = of_parse_phandle(np, "qcom,rx-device", 0);
+	if (!wcd939x->rxnode) {
+		dev_err(dev, "%s: Rx-device node not defined\n", __func__);
+		return -ENODEV;
+	}
+
+	of_node_get(wcd939x->rxnode);
+	component_match_add_release(dev, matchptr, component_release_of,
+				    component_compare_of, wcd939x->rxnode);
+
+	wcd939x->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
+	if (!wcd939x->txnode) {
+		dev_err(dev, "%s: Tx-device node not defined\n", __func__);
+		return -ENODEV;
+	}
+	of_node_get(wcd939x->txnode);
+	component_match_add_release(dev, matchptr, component_release_of,
+				    component_compare_of, wcd939x->txnode);
+	return 0;
+}
+
+static int wcd939x_probe(struct platform_device *pdev)
+{
+	struct component_match *match = NULL;
+	struct wcd939x_priv *wcd939x = NULL;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	wcd939x = devm_kzalloc(dev, sizeof(struct wcd939x_priv),
+			       GFP_KERNEL);
+	if (!wcd939x)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, wcd939x);
+	mutex_init(&wcd939x->micb_lock);
+
+	ret = wcd939x_populate_dt_data(wcd939x, dev);
+	if (ret) {
+		dev_err(dev, "%s: Fail to obtain platform data\n", __func__);
+		return -EINVAL;
+	}
+
+	/*
+	 * Is USBSS is used to mux analog lines,
+	 * register a typec mux/switch to get typec events
+	 */
+	if (wcd939x->typec_analog_mux) {
+		struct typec_mux_desc mux_desc = {
+			.drvdata = wcd939x,
+			.fwnode = dev_fwnode(dev),
+			.set = wcd939x_typec_mux_set,
+		};
+		struct typec_switch_desc sw_desc = {
+			.drvdata = wcd939x,
+			.fwnode = dev_fwnode(dev),
+			.set = wcd939x_typec_switch_set,
+		};
+
+		wcd939x->typec_mux = typec_mux_register(dev, &mux_desc);
+		if (IS_ERR(wcd939x->typec_mux)) {
+			ret = dev_err_probe(dev, PTR_ERR(wcd939x->typec_mux),
+					    "failed to register typec mux\n");
+			goto err_disable_regulators;
+		}
+
+		wcd939x->typec_sw = typec_switch_register(dev, &sw_desc);
+		if (IS_ERR(wcd939x->typec_sw)) {
+			ret = dev_err_probe(dev, PTR_ERR(wcd939x->typec_sw),
+					    "failed to register typec switch\n");
+			goto err_unregister_typec_mux;
+		}
+	}
+
+	ret = wcd939x_add_slave_components(wcd939x, dev, &match);
+	if (ret)
+		goto err_unregister_typec_switch;
+
+	wcd939x_reset(wcd939x);
+
+	ret = component_master_add_with_match(dev, &wcd939x_comp_ops, match);
+	if (ret)
+		goto err_disable_regulators;
+
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_unregister_typec_mux:
+	if (wcd939x->typec_analog_mux)
+		typec_mux_unregister(wcd939x->typec_mux);
+
+err_unregister_typec_switch:
+	if (wcd939x->typec_analog_mux)
+		typec_switch_unregister(wcd939x->typec_sw);
+
+err_disable_regulators:
+	regulator_bulk_disable(WCD939X_MAX_SUPPLY, wcd939x->supplies);
+	regulator_bulk_free(WCD939X_MAX_SUPPLY, wcd939x->supplies);
+
+	return ret;
+}
+
+static void wcd939x_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct wcd939x_priv *wcd939x = dev_get_drvdata(dev);
+
+	component_master_del(dev, &wcd939x_comp_ops);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+
+	regulator_bulk_disable(WCD939X_MAX_SUPPLY, wcd939x->supplies);
+	regulator_bulk_free(WCD939X_MAX_SUPPLY, wcd939x->supplies);
+}
+
+#if defined(CONFIG_OF)
+static const struct of_device_id wcd939x_dt_match[] = {
+	{ .compatible = "qcom,wcd9390-codec" },
+	{ .compatible = "qcom,wcd9395-codec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, wcd939x_dt_match);
+#endif
+
+static struct platform_driver wcd939x_codec_driver = {
+	.probe = wcd939x_probe,
+	.remove_new = wcd939x_remove,
+	.driver = {
+		.name = "wcd939x_codec",
+		.of_match_table = of_match_ptr(wcd939x_dt_match),
+		.suppress_bind_attrs = true,
+	},
+};
+
+module_platform_driver(wcd939x_codec_driver);
+MODULE_DESCRIPTION("WCD939X Codec driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

