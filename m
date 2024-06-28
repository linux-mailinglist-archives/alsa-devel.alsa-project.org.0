Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 294FB91BC60
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 12:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EBD022AF;
	Fri, 28 Jun 2024 12:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EBD022AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719569559;
	bh=t0oThzO9Q8Q8Ygu8zNE+tB4uDDaXPUAD51K7NJR7FOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oamYRzs1xZ7wp0FOl4YCFcUu1v3kdUN3YXCQyWsiIZW8IHwL4vtVlnoSFc8nQUJHe
	 ryOzzN1Lhr3+f9YQ+KJBsj3XMNgYUQxevsQe39FJBIQZxsPY/8RK2IyjL2F2gbQFIj
	 RovVrR6+5quCLvlA9o3/Iw+/PsyUHhprsawcLeHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D272EF805DA; Fri, 28 Jun 2024 12:11:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4AA7F805CA;
	Fri, 28 Jun 2024 12:11:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9EEBF804F2; Fri, 28 Jun 2024 12:11:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADFAEF8013D
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 12:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADFAEF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u5PmsYat
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so5459791fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719569492; x=1720174292;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rcUCvATOk6PUaPwOA0D72nSVujkGGCzYAuhpl2nZXU=;
        b=u5PmsYatkI3sThb2dPn2PM0NEX3dlB0nT/Frtf4vAVXiSX19OvwnH0UtyXxLCbAoWg
         NvUGto59nnd6cUYtkkAWYWXJ25GXqGN2MMUYkz0rtbaNac3fHG/XW2ocoeD2TNtaxKCw
         LHV6ZSCHymOhR42XOdhrH+Tp57Xb5AcDgH0bcnmad7WiXqTmz42M21NYb+Vx58hlKRKv
         xRzs5y6b4KdZMFiKKlZNd5SulVwz0XK/MdMd3syos9KSBxpkkdcKbgZQFybmVX52LAKL
         rlo/ok+IgJ5ng49epMVS1kjX9StdMVnBM46wiQlDvDHgeCWVsKjsxRCK6x5Zeypo7DvO
         le6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719569492; x=1720174292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rcUCvATOk6PUaPwOA0D72nSVujkGGCzYAuhpl2nZXU=;
        b=AFVEw47APuaSzUPLRO0hrxBGZQiVoC1wecOSzuMTWWfx+X0G5zaGRsDcXIVMHPIzJx
         hKRoo8crHKGxZSfNSDPQj8OMVzPUpPCpzKhGqeJM1YbRYxPlUh6zudCK4+4O6+jSfPoD
         R4QlaZDTva6EqdkoVKakZYcu6pa3jIl9kRMikt3CgiTB3Chb/wOL/zI3+C+KG5+ApLY9
         4l50RqGWHyPxIAkHFr6zOpU/g/uTY/r3XfyQVyvkxh9B9jSjNryhabHXMId0MjXztJRf
         VXraoTlPpCT40oahxG6ksmssL4WiWctXxb3MULwwxXjDxu1hptew1P+yIvrXJ3LIjH7I
         yxiA==
X-Gm-Message-State: AOJu0YxLKKccCrpK/K5Yg1tJNQidF1S308XfX0x2FoR/cq+VQeSo/lL5
	AOydr7wO98OtugL66G/M4ywUA2NR+W7pH/AxLiNuYBahT53VYqopuGM0PHKAOT8=
X-Google-Smtp-Source: 
 AGHT+IGv+fN5oMBLkD52ryRZ8LfY0cXbKJU+4r6OFmL14KG93AcvWuOhqCYyA9visl1sjhxLli+LsA==
X-Received: by 2002:a2e:3018:0:b0:2ec:588d:7eb4 with SMTP id
 38308e7fff4ca-2ec5b30bd1fmr121706111fa.15.1719569492424;
        Fri, 28 Jun 2024 03:11:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c15f8sm27024605e9.47.2024.06.28.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:11:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Jun 2024 12:10:55 +0200
Subject: [PATCH v2 1/5] ASoC: codecs: lpass-rx-macro: Simplify with
 cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-1-e9741143e485@linaro.org>
References: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
In-Reply-To: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t0oThzO9Q8Q8Ygu8zNE+tB4uDDaXPUAD51K7NJR7FOs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfow9491/AvVpxy9ctPQeIOel+kU6a2WiOiqlU
 6zfSOJQXdWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn6MPQAKCRDBN2bmhouD
 1y+dEACR1q3XmwV+WuYCly6WpPMyPcQz2N3xgpPi4saLYSobA8Gm/tUVbxMUqk/lL7Y/26lB8Un
 ffGLBUsDsO1Q/MY10YVArp/OE6gTvSRxBKElY03d1vTInfeu9gG8e9z/XQ2uSIUV1O6LN31pt3+
 q4PpGqn4FBoH0vFc7i5AToHTHN8+/by4ppLJ3+gj2oWSiCLeoJhpL33hgZ0h1+DeUubgbeapgGY
 +TB0H/Tf20+Ghb1T5bssPfLYLLSiI2A6NANsDVkRRjTixkL8HTLxbeCII/hw+jEx6Lw/PUw4q1I
 DKREVV3B2rmI7OcAZY3RHJxjEATN1oAd2eCruzV1WrM1fnv4BaAp1Crb4oaFqhn4dOY0cTYJbWK
 T8PcUeLRUQMn0EQKsZ+huVovLod8Kxa2bKCC/YOrcyusPtfdZVS98rsv+iqu81BLuftRJ/FFNrb
 Xg5I3lc4pIGtDI1FILl+s4y0P2bKuwbEoGy74n6XGDyMXTbJCi8KFUQ4kszI+sJNpg+s4C23bG4
 T77l4e+XF9d4YPs7d0kWa+Bcr2/qCFq6XnOUFdU7IvDzUqTRzTDyiJBT/vx5Noek4kaM//IBctS
 RRdjZm7RCqrOUahDN1rs+VV+V64eiw+bwy/A7jD7vH+9FlqPfyia8yNpRp2YrqQmB9DdODaxq/Y
 SMEiOpDlwyu9Y+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: NPLI6C6FJ2XAOQGYGAA6JAHNSX7LZHOW
X-Message-ID-Hash: NPLI6C6FJ2XAOQGYGAA6JAHNSX7LZHOW
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPLI6C6FJ2XAOQGYGAA6JAHNSX7LZHOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the default register values array with scoped/cleanup.h to
reduce number of error paths and make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Dmitry's Rb tag, because of major change devm->cleanup.h.
---
 sound/soc/codecs/lpass-rx-macro.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index d47c49c90de3..4cf030760d74 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -3764,7 +3765,6 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 
 static int rx_macro_probe(struct platform_device *pdev)
 {
-	struct reg_default *reg_defaults;
 	struct device *dev = &pdev->dev;
 	kernel_ulong_t flags;
 	struct rx_macro *rx;
@@ -3809,6 +3809,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 	rx->codec_version = lpass_macro_get_codec_version();
+	struct reg_default *reg_defaults __free(kfree) = NULL;
+
 	switch (rx->codec_version) {
 	case LPASS_CODEC_VERSION_1_0:
 	case LPASS_CODEC_VERSION_1_1:
@@ -3853,7 +3855,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
 	if (IS_ERR(rx->regmap)) {
 		ret = PTR_ERR(rx->regmap);
-		goto err_ver;
+		goto err;
 	}
 
 	dev_set_drvdata(dev, rx);
@@ -3866,7 +3868,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(rx->macro);
 	if (ret)
-		goto err_ver;
+		goto err;
 
 	ret = clk_prepare_enable(rx->dcodec);
 	if (ret)
@@ -3912,7 +3914,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
-	kfree(reg_defaults);
 	return 0;
 
 err_clkout:
@@ -3925,8 +3926,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_disable_unprepare(rx->dcodec);
 err_dcodec:
 	clk_disable_unprepare(rx->macro);
-err_ver:
-	kfree(reg_defaults);
 err:
 	lpass_macro_pds_exit(rx->pds);
 

-- 
2.43.0

