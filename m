Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052126FD70E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:33:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15915105E;
	Wed, 10 May 2023 08:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15915105E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700410;
	bh=xUvh+PRl/XdMVBeVeCBd3bv7Ap8clPKGRiK9O1aBMR8=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=HyodaMY8xnre4XJ6iv3B7IXR2vOZuLmYpwYk2wN/6jwVXCCJ6/YXEy5yKSyG8Icr1
	 4t+GvWM4xIot92WY9duqzMFnbxPxbk1CIvmuJhLrSq6oLFZLGSsAYoUKPKaiy+Imba
	 OlDU/db4jwpfk9E5C10DD+UrndV+SBuvtajHW9a4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA04F804B1;
	Wed, 10 May 2023 08:32:20 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 2/7] ASoC: Add Google Chameleon v3 codec driver
Date: Mon,  8 May 2023 13:30:32 +0200
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/25YO4ROYTGXA6B3PWLRU7EQIZBQT5KMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168370033806.26.12147904079723720510@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FFABF80551; Mon,  8 May 2023 13:31:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AC34F80087
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 13:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AC34F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=Q2+7zx5X
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ac81d2bfbcso47019981fa.3
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1683545457; x=1686137457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2cwSVPDrISRaMS+TiPqbK95SQtfCrrQXRWy9POwydI=;
        b=Q2+7zx5XBPX3Qle9Q5F5A+ArjF579cSfettt8OHLU3QE6XyugWzozq1wny9taFV8uN
         7eMWkicsNrluXd//3cLjKPfUYIL0bxqmab+qgzL0c/S58nIQFU/rMk4VnOUQ+ppeC9HP
         1JBMZwQGh7I2FyDmhvypzj2l8+4I7O+aDA4y2/O4kTn3QalHGaitRma6drTzEljdKlUP
         EfBMVQeJIG5QID8hBfI3h+cvHTfyPSkYFBCykz+DsE7PjGB2m1wRabnKS54dzv4iHR3w
         9TfmmfaVmglmCH6+MGtFyA5Fj7ucnOGzCcxnPEc9N5DeQUv8PmgYobPJzorgk7sZqL3W
         tZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545457; x=1686137457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2cwSVPDrISRaMS+TiPqbK95SQtfCrrQXRWy9POwydI=;
        b=KYHKwQnaFTiu2ATbzE6kkoJ/NH9Kbvp6g9cPMYkLVRkaZUczDUKF8SG5uxOnYPmGxl
         FQjPL0nUVYkDcwA3ghCFcdXFKY7+TbDJ4i9ypWb7JyyTBXzE/oJC5Q6eOYSfUing2OMu
         YBY9DOJkSZNCNN3OtBzPi5HdscZU5PA3CNhGZK3HGkdcXn1D+jp7vXmS5L/Oxn1fZXDc
         UvXUZlzuLZERkZ2aVDVcv7YQnLR/V+tiu56B91yEmPsgJPUvcyGZ6pHjA44E8U09YfM8
         nKaypqd/8vtFAFAhsMZR8MSGSAxsDwH9guDol+zFDEZJoXk8RBG+9uY+Isjfuf24Vcb5
         2F1g==
X-Gm-Message-State: AC+VfDy8yEFkUPFmNEoR5kNZlhyQuJkAzPHUZ0WG5KhJnmOBr+zT/1Au
	Fc9PwkgTR7N0z5x8mStcFY9w5ueUNv6JHDBW6Do=
X-Google-Smtp-Source: 
 ACHHUZ6JsQ8xU/b2e4ZdMXFrq9+Cq/sYpLOJ81BdGrWzqI6ZiNx1yFtr5xGyQd0JPhRjQmMVMNJloA==
X-Received: by 2002:a2e:99da:0:b0:2a7:6e85:e287 with SMTP id
 l26-20020a2e99da000000b002a76e85e287mr3071975ljj.45.1683545456984;
        Mon, 08 May 2023 04:30:56 -0700 (PDT)
Received: from panikiel.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a2e2408000000b002a8b9353338sm1144406ljk.117.2023.05.08.04.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:30:56 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 2/7] ASoC: Add Google Chameleon v3 codec driver
Date: Mon,  8 May 2023 13:30:32 +0200
Message-ID: <20230508113037.137627-3-pan@semihalf.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 25YO4ROYTGXA6B3PWLRU7EQIZBQT5KMR
X-Message-ID-Hash: 25YO4ROYTGXA6B3PWLRU7EQIZBQT5KMR
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:16 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/25YO4ROYTGXA6B3PWLRU7EQIZBQT5KMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add driver for the codec IP present on Google Chameleon v3

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 sound/soc/codecs/Kconfig      |  8 +++++++
 sound/soc/codecs/Makefile     |  2 ++
 sound/soc/codecs/chv3-codec.c | 41 +++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 sound/soc/codecs/chv3-codec.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 79d2362ad055..f8f15e96ade5 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -57,6 +57,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_AW88395
 	imply SND_SOC_BT_SCO
 	imply SND_SOC_BD28623
+	imply SND_SOC_CHV3_CODEC
 	imply SND_SOC_CQ0093VC
 	imply SND_SOC_CROS_EC_CODEC
 	imply SND_SOC_CS35L32
@@ -643,6 +644,13 @@ config SND_SOC_BD28623
 config SND_SOC_BT_SCO
 	tristate "Dummy BT SCO codec driver"
 
+config SND_SOC_CHV3_CODEC
+	tristate "Google Chameleon v3 codec driver"
+	help
+	  Enable support for the Google Chameleon v3 audio codec.
+	  This codec does not have a control interface, it always outputs
+	  8 channel S32_LE audio.
+
 config SND_SOC_CPCAP
 	tristate "Motorola CPCAP codec"
 	depends on MFD_CPCAP || COMPILE_TEST
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 5cdbae88e6e3..8cee836f4831 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -51,6 +51,7 @@ snd-soc-aw88395-objs := aw88395/aw88395.o \
 			aw88395/aw88395_device.o
 snd-soc-bd28623-objs := bd28623.o
 snd-soc-bt-sco-objs := bt-sco.o
+snd-soc-chv3-codec-objs := chv3-codec.o
 snd-soc-cpcap-objs := cpcap.o
 snd-soc-cq93vc-objs := cq93vc.o
 snd-soc-cros-ec-codec-objs := cros_ec_codec.o
@@ -425,6 +426,7 @@ obj-$(CONFIG_SND_SOC_AW88395_LIB) += snd-soc-aw88395-lib.o
 obj-$(CONFIG_SND_SOC_AW88395)	+=snd-soc-aw88395.o
 obj-$(CONFIG_SND_SOC_BD28623)	+= snd-soc-bd28623.o
 obj-$(CONFIG_SND_SOC_BT_SCO)	+= snd-soc-bt-sco.o
+obj-$(CONFIG_SND_SOC_CHV3_CODEC) += snd-soc-chv3-codec.o
 obj-$(CONFIG_SND_SOC_CQ0093VC) += snd-soc-cq93vc.o
 obj-$(CONFIG_SND_SOC_CPCAP)	+= snd-soc-cpcap.o
 obj-$(CONFIG_SND_SOC_CROS_EC_CODEC)	+= snd-soc-cros-ec-codec.o
diff --git a/sound/soc/codecs/chv3-codec.c b/sound/soc/codecs/chv3-codec.c
new file mode 100644
index 000000000000..ab99effa6874
--- /dev/null
+++ b/sound/soc/codecs/chv3-codec.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/module.h>
+#include <sound/soc.h>
+
+static struct snd_soc_dai_driver chv3_codec_dai = {
+	.name = "chv3-codec-hifi",
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 8,
+		.channels_max = 8,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	},
+};
+
+static const struct snd_soc_component_driver soc_component_dev_chv3_codec = {
+};
+
+static int chv3_codec_probe(struct platform_device *pdev)
+{
+	return devm_snd_soc_register_component(&pdev->dev,
+		&soc_component_dev_chv3_codec, &chv3_codec_dai, 1);
+}
+
+static const struct of_device_id chv3_codec_of_match[] = {
+	{ .compatible = "google,chv3-codec", },
+	{ }
+};
+
+static struct platform_driver chv3_codec_platform_driver = {
+	.driver = {
+		.name = "chv3-codec",
+		.of_match_table = chv3_codec_of_match,
+	},
+	.probe = chv3_codec_probe,
+};
+module_platform_driver(chv3_codec_platform_driver);
+
+MODULE_DESCRIPTION("ASoC Chameleon v3 codec driver");
+MODULE_AUTHOR("Pawel Anikiel <pan@semihalf.com>");
+MODULE_LICENSE("GPL");
-- 
2.40.1.521.gf1e218fcd8-goog

