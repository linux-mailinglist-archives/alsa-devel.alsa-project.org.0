Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42E582C3C0
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 17:38:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B6F9F54;
	Fri, 12 Jan 2024 17:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B6F9F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705077514;
	bh=EA2o6X7d8PhaR6wiEEwiZT7TQEvaF0J/BPNAqd6Z2ZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kWIc2GYIh6J6yDpSqSfS/xgybKukOUhqIfay3IjSQETfkpP9PZOE5SwKQsfhpVsxE
	 hrCVxwxstqajaAjl3eJ0uo1Okd+3ll8sG/b+lBSXLNlpdMtrgNx8rmO0vbCalZplVl
	 Y+uDt4l3fsY3LaqUFJvqA4L2920sS3xHx49IckbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C308F80672; Fri, 12 Jan 2024 17:37:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A420F80639;
	Fri, 12 Jan 2024 17:37:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3F69F80254; Fri, 12 Jan 2024 17:36:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A032F8003A
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 17:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A032F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EhPHI5H+
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e68ca8e27so2799685e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Jan 2024 08:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705077390; x=1705682190;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tAwGTFBvrjSR+D7qo0JkBwlnmAMUSdISzHDQJb3VJ8=;
        b=EhPHI5H+W9cQP6qaGYOAXUCA+6pDedSy8K3KMYM0siYckh6zGFGwNjxHzdIy9Pt3mn
         ujL14N/ZD6fP4ihzPIlO2424crlFqlZ3m5NKrLyJyfVVZ5s1Nh33/YLSGV0ydosy0Gg5
         ieNqbbpfFWe08T7nGXd/ag80ncsrlbnT98XVJ22n9A+ED/twZtO6P0//+VwaPUcozGD0
         DJ+nSWvnzXIdM6gC1Vc0jvxCVoQCili4cGkROivS5+iTPkKlhETlk64vI7NDd84k03yi
         UIiSojVvFyYhc5s+pGGOmOyJdFc3inkmiUa4N/3YkGlISTg8woIxofTUPzpeHKL6U3/y
         Mwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077390; x=1705682190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tAwGTFBvrjSR+D7qo0JkBwlnmAMUSdISzHDQJb3VJ8=;
        b=lCoUW7EJn8e50fekDs1/O0Au5eIT9JcsGOb9SGXQMXHGOG/+p7s3aW2ZHO+TWDeXkW
         UBQS0L1NKDJayMaJiPBHJPsIZ8K5Z27Z38cVmRU2lWQuxpT/ega3F5ASjBEekDXJq2Pl
         AUOy2i3OYEhEjjQeNXLCUQPVAAWIo3SkyFwQyjcW8ZslcSl77dccQwsDcABhdrgDus/r
         uIrgKcvi75lof3WBl3golHOlnrYsMxj+iWbPDyLMpPESz2j8y9I+Ci5SS2lALg1cjy7q
         a8nMzD29zoBu/Gll4JKuHulYOoUzeGhw/y+BOs6Ha7wEY0mRw2wn1n1LNBepHVGNJcb4
         Qgeg==
X-Gm-Message-State: AOJu0Yx7ZWJjO7iU5QtMqv7ZdYwf4Xhh9vwYyu+GZNIUOKS5G7kkk4Mz
	a2Lz2JlBe6+XFav12IHEMS8/wIUTQt3mcQ==
X-Google-Smtp-Source: 
 AGHT+IHwVLaqmPFUtKT7wAZTbrdSc8zyHUbK1fQIZbWvd0QlBC1T6c9jlGWVdUy5gdVHgvbYuB/lxQ==
X-Received: by 2002:a05:600c:1c25:b0:40e:4613:daae with SMTP id
 j37-20020a05600c1c2500b0040e4613daaemr1033231wms.30.1705077389852;
        Fri, 12 Jan 2024 08:36:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 bd16-20020a05600c1f1000b0040e5a93ae53sm6573195wmb.22.2024.01.12.08.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:36:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
Date: Fri, 12 Jan 2024 17:36:08 +0100
Message-Id: <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HGAUEY6DTDWGM4NONWN4SS3ROOLNQOAU
X-Message-ID-Hash: HGAUEY6DTDWGM4NONWN4SS3ROOLNQOAU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGAUEY6DTDWGM4NONWN4SS3ROOLNQOAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Packham <chris.packham@alliedtelesis.co.nz>

Some hardware designs with multiple PCA954x devices use a reset GPIO
connected to all the muxes. Support this configuration by making use of
the reset controller framework which can deal with the shared reset
GPIOs. Fall back to the old GPIO descriptor method if the reset
controller framework is not enabled.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20240108041913.7078-1-chris.packham@alliedtelesis.co.nz
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If previous patches are fine, then this commit is independent and could
be taken via I2C.

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 2219062104fb..1702e8d49b91 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -49,6 +49,7 @@
 #include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/mux/mux.h>
@@ -102,6 +103,9 @@ struct pca954x {
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
 	struct regulator *supply;
+
+	struct gpio_desc *reset_gpio;
+	struct reset_control *reset_cont;
 };
 
 /* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
@@ -477,6 +481,35 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 	return ret;
 }
 
+static int pca954x_get_reset(struct device *dev, struct pca954x *data)
+{
+	data->reset_cont = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(data->reset_cont))
+		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
+				     "Failed to get reset\n");
+	else if (data->reset_cont)
+		return 0;
+
+	/*
+	 * fallback to legacy reset-gpios
+	 */
+	data->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(data->reset_gpio)) {
+		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
+				     "Failed to get reset gpio");
+	}
+
+	return 0;
+}
+
+static void pca954x_reset_deassert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_deassert(data->reset_cont);
+	else
+		gpiod_set_value_cansleep(data->reset_gpio, 0);
+}
+
 /*
  * I2C init/probing/exit functions
  */
@@ -485,7 +518,6 @@ static int pca954x_probe(struct i2c_client *client)
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
-	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
 	int num;
@@ -513,15 +545,13 @@ static int pca954x_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret,
 				     "Failed to enable vdd supply\n");
 
-	/* Reset the mux if a reset GPIO is specified. */
-	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio)) {
-		ret = PTR_ERR(gpio);
+	ret = pca954x_get_reset(dev, data);
+	if (ret)
 		goto fail_cleanup;
-	}
-	if (gpio) {
+
+	if (data->reset_cont || data->reset_gpio) {
 		udelay(1);
-		gpiod_set_value_cansleep(gpio, 0);
+		pca954x_reset_deassert(data);
 		/* Give the chip some time to recover. */
 		udelay(1);
 	}
-- 
2.34.1

