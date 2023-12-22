Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5481CBA2
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 16:02:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42ADA850;
	Fri, 22 Dec 2023 16:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42ADA850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703257369;
	bh=ngfvi7phX0kDbuP/S+x15yZrwu2DHe2wK8HINhjtgos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rj3VJcX7XPVwU1ij3+14+ScszSnFqGI+Cx2AMuWhUt+ZBA2G/xwVUJ7lyvnKlaCX3
	 Td8n0+d3gu2XyPTuiNk3fGglXxmYtsBi/jhkXzhB6fu2aQyP1M82nXr5CD9FBi/yh5
	 7FWbRsCXJ9pgKHzIwFps6w27kuzo+19zQqWJKfKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76B86F805B1; Fri, 22 Dec 2023 16:02:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B804DF805BE;
	Fri, 22 Dec 2023 16:02:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C989F80567; Fri, 22 Dec 2023 16:02:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8B89F800D2
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 16:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B89F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FNbgCPOR
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5542ac8b982so1813406a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 22 Dec 2023 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703257304; x=1703862104;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIsLTUxJE1cxBBiiifVCcvawbyJ4lrohtOQb+rAqVac=;
        b=FNbgCPORliLH7NdRVMDC4Onu4gKIG6fsYUjufyB3GDJ81sQEVq7pROrPRjgTha1l8Y
         +i8DlMuD2v2Jjqy9p77krfTl7JlVy5S9yrZQ2zBCNnMoDjufq0dwSQRn6KyEO4xe2NwP
         YccCwnLK58ayvUGvCID9ZXt40GfL9v13XLCLYFECqJts5Tzkxd1wz3C5Vh9rHZE1srhO
         gVkQhVEjOE9zZhZHLKo0BRPhGMCrziLUbKKngKBEPuUZqVbdVcYrqszKr9wCBKyOlsP4
         2v1IM0rwUVW6RYgHMPQawQ+RzeMxfNb2WCTtykMvuqKRBWMjyAArzDMwN62bmHXEE9GY
         RSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257304; x=1703862104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIsLTUxJE1cxBBiiifVCcvawbyJ4lrohtOQb+rAqVac=;
        b=dW0EwFajUpc5sFiHvcmD4Xho+HL/q3gh5vcozo5MBArQHfu5Y1WmlTFPZIa/15Mml+
         y3s6mE6hQhVAiTi2N+d1p4CZwfNqc/aYU/CDWg9Vwh1POPSKjCJ4ho/RhWaZL1uy3QH7
         ASPzl0y7LGKihc5P/0lPPUE+pZ8TvH6PV4WNTqVfKNKtezwR4DAEYCwR4yOgfHHkenkP
         jeBxSIbJd9IZ0W7t5r+ALlHa+i70hxF5MU3UBuwCf5MdmK8Hd1OeZETMYOYqzBMlkmXU
         lu4EM5ijyA8r6DOfxtwLS8eE03hCWynIL5F2YOIBsPYyoZHnKtRrvCwehtLXnynLLmsB
         TmKA==
X-Gm-Message-State: AOJu0Yw4N2UMBbi6qYOZr8tKHYOe3CLLMzLUaNzFVd+avJU7dyf7UjJA
	nnGTNyQTN9npIBzBJb3NLvUNENSDOevNqA==
X-Google-Smtp-Source: 
 AGHT+IFOVAFE/3mSgxDg8r0BmeFffXjHPsKVAmnpzZGOR+G92xcuwjc1mM3+0AL59eOzOUdBtOOHBQ==
X-Received: by 2002:a17:906:eb51:b0:a26:858b:b76e with SMTP id
 mc17-20020a170906eb5100b00a26858bb76emr831943ejb.105.1703257304630;
        Fri, 22 Dec 2023 07:01:44 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id
 h1-20020a17090791c100b00a26af35c171sm1275671ejz.0.2023.12.22.07.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:01:44 -0800 (PST)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 1/4] reset: instantiate reset GPIO controller for shared
 reset-gpios
Date: Fri, 22 Dec 2023 16:01:30 +0100
Message-Id: <20231222150133.732662-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LRWNHCA2K4XEY5V4IO5EMNP4DZRMRVU5
X-Message-ID-Hash: LRWNHCA2K4XEY5V4IO5EMNP4DZRMRVU5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LRWNHCA2K4XEY5V4IO5EMNP4DZRMRVU5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Devices sharing a reset GPIO could use the reset framework for
coordinated handling of that shared GPIO line.  We have several cases of
such needs, at least for Devicetree-based platforms.

If Devicetree-based device requests a reset line which is missing but
there is a reset-gpios property, instantiate a new "reset-gpio" platform
device which will handle such reset line.  This allows seamless handling
of such shared reset-gpios without need of changing Devicetree binding [1].

The "reset-gpio" driver follows shortly.

Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/reset/core.c             | 70 +++++++++++++++++++++++++++-----
 include/linux/reset-controller.h |  2 +
 2 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 4d5a78d3c085..a1f0f515a7e0 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -10,9 +10,12 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/kref.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/acpi.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -813,13 +816,59 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 	kref_put(&rstc->refcnt, __reset_control_release);
 }
 
+static int __reset_add_reset_gpio_device(struct device_node *node,
+					 const struct gpio_desc **out)
+{
+	struct platform_device *pdev;
+	int gpio;
+
+	/* Don't care about deprecated '-gpio' suffix. */
+	gpio = of_get_named_gpio(node, "reset-gpios", 0);
+	if (!gpio_is_valid(gpio))
+		return gpio;
+
+	pdev = platform_device_register_data(NULL, "reset-gpio",
+					     PLATFORM_DEVID_AUTO, &node,
+					     sizeof(node));
+	if (!IS_ERR(pdev))
+		*out = gpio_to_desc(gpio);
+
+	return PTR_ERR_OR_ZERO(pdev);
+}
+
+static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_args *args,
+						       const void *cookie)
+{
+	struct reset_controller_dev *r, *rcdev;
+
+	lockdep_assert_held(&reset_list_mutex);
+
+	rcdev = NULL;
+	list_for_each_entry(r, &reset_controller_list, list) {
+		if (args && args->np) {
+			if (args->np == r->of_node) {
+				rcdev = r;
+				break;
+			}
+		} else if (cookie) {
+			if (cookie == r->cookie) {
+				rcdev = r;
+				break;
+			}
+		}
+	}
+
+	return rcdev;
+}
+
 struct reset_control *
 __of_reset_control_get(struct device_node *node, const char *id, int index,
 		       bool shared, bool optional, bool acquired)
 {
+	const struct gpio_desc *gpio = NULL;
+	struct of_phandle_args args = {0};
 	struct reset_control *rstc;
-	struct reset_controller_dev *r, *rcdev;
-	struct of_phandle_args args;
+	struct reset_controller_dev *rcdev;
 	int rstc_id;
 	int ret;
 
@@ -839,17 +888,16 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 					 index, &args);
 	if (ret == -EINVAL)
 		return ERR_PTR(ret);
-	if (ret)
-		return optional ? NULL : ERR_PTR(ret);
+	if (ret) {
+		ret = __reset_add_reset_gpio_device(node, &gpio);
+		if (ret)
+			return optional ? NULL : ERR_PTR(ret);
+
+		args.args_count = 1; /* reset-gpio has only one reset line */
+	}
 
 	mutex_lock(&reset_list_mutex);
-	rcdev = NULL;
-	list_for_each_entry(r, &reset_controller_list, list) {
-		if (args.np == r->of_node) {
-			rcdev = r;
-			break;
-		}
-	}
+	rcdev = __reset_find_rcdev(&args, gpio);
 
 	if (!rcdev) {
 		rstc = ERR_PTR(-EPROBE_DEFER);
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 0fa4f60e1186..c0a99a8ea29e 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -61,6 +61,7 @@ struct reset_control_lookup {
  * @dev: corresponding driver model device struct
  * @of_node: corresponding device tree node as phandle target
  * @of_reset_n_cells: number of cells in reset line specifiers
+ * @cookie: for reset-gpios controllers: corresponding GPIO instead of of_node
  * @of_xlate: translation function to translate from specifier as found in the
  *            device tree to id as given to the reset control ops, defaults
  *            to :c:func:`of_reset_simple_xlate`.
@@ -74,6 +75,7 @@ struct reset_controller_dev {
 	struct device *dev;
 	struct device_node *of_node;
 	int of_reset_n_cells;
+	const void *cookie;
 	int (*of_xlate)(struct reset_controller_dev *rcdev,
 			const struct of_phandle_args *reset_spec);
 	unsigned int nr_resets;
-- 
2.34.1

