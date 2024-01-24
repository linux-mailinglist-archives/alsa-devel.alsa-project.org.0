Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1483A380
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 08:48:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EFBFB71;
	Wed, 24 Jan 2024 08:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EFBFB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706082519;
	bh=GryOK2WVcAShxcw9ALS3eyUBe11Jg8gdOpY4P9IFJC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DzaFv8TFRbgBQtN7LV3oXShyF2MtYjXo2mhF19HS21IyTJBV3SwLCyxmSB5SAhl2l
	 XcOVD2o4BK4V+3KLBao717sv2psa8UxQQbvmjwREKEYfzZX/l2MrADSPN7bzzwQL7+
	 lwmg4x3KAy8Gvi3OYdwaM9GRgkj2HsvlD/mktt8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 727D0F802E8; Wed, 24 Jan 2024 08:47:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69403F805FC;
	Wed, 24 Jan 2024 08:47:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94198F805D2; Wed, 24 Jan 2024 08:47:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59FC6F802BE
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 08:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FC6F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MMuI53Vr
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-559cef15db5so10882757a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 23:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706082340; x=1706687140;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbbgB2jGb5iix1JEFZ5ptTFKMdT0kRT1hLXtledxTNc=;
        b=MMuI53Vr5CZTUHQJ8hd2GLZFbtf0YhON1tN09S6pQN88vgp4tqrR53n6hlNnrrvPRz
         W9EwLavJjeZmn6sQmeTAh4QA5RpDE0t0i1OkAHRt+Cdmv8hiZ4X/PG0tVKBw7aEUaPPo
         MhXkl1b6OmT5zGydbHyei3+LPnBn4bKM5h+ELvtuQooC/pC3A8AinJYw1zFlNXPlXVie
         r8WaqnHX8kH2Y1eR6EC3mmsvCh0JMaXBd1uLeORcq7x6FzjU8RrRPfQnpDQdmK8tkwKB
         nUwcKTiOD+1L30mlZ5snJl4VxTynxH/Xk4XRCK6Sg0dxXd/uAz/vtxlLjZ0cWFX5UnQD
         NweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706082340; x=1706687140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbbgB2jGb5iix1JEFZ5ptTFKMdT0kRT1hLXtledxTNc=;
        b=wJ5AydamQWMnS6gPj2CyqrVRPhrjb0fjsuAn0j+uddCYUpaJUDJDzagulaQ1xxDo3M
         gy269MBkREK2nGFJaCDicxJm9LY1QMxBwQClopmladKuF+MHqOk8XxabExvpxL5wFP9v
         6Bf0QVF0ypcZmP79n+sqa5QTNp1gSgs49p8JOKaeuzxX7TMr1oKIRKh1nrO9gYJtkMSQ
         QUYdh0zDC8GglZE28jPpDKjpanG9tUiBz1t3DDL1pR63WLRa29DP58Xp6m24vefjNEr8
         UxiF71j3J9Y09RcUHdP9GIuwiGU6zDoGKrdEf76nu0KcAh2d1AwAbgiMw4WB+6lesxEF
         NfBg==
X-Gm-Message-State: AOJu0YwTg9SVei++T8KsB9mR2s6pT//G9OH82DTpNVEjEDMSV8tuL6zm
	f7vPjCpkfyL9MD3vaX5xZl4dRi81DNOwXAdqlv9dCm9HQhdBEBK4z6DrMIBA7z4=
X-Google-Smtp-Source: 
 AGHT+IEQkZ17Xxu4UhThSYaaYVmGQU1hlHS0XtEM/o5SerofGnKso07erFONxvp37r0P5aTqZTmUTw==
X-Received: by 2002:a05:6402:350e:b0:55c:a84b:ca58 with SMTP id
 b14-20020a056402350e00b0055ca84bca58mr1163018edd.18.1706082340480;
        Tue, 23 Jan 2024 23:45:40 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a056402100400b0055c8a30152bsm1306951edu.83.2024.01.23.23.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:45:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v5 4/6] reset: Instantiate reset GPIO controller for shared
 reset-gpios
Date: Wed, 24 Jan 2024 08:45:25 +0100
Message-Id: <20240124074527.48869-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NQILG3XSG4HERO77TEXRTYUK77QWIXDH
X-Message-ID-Hash: NQILG3XSG4HERO77TEXRTYUK77QWIXDH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQILG3XSG4HERO77TEXRTYUK77QWIXDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Devices sharing a reset GPIO could use the reset framework for
coordinated handling of that shared GPIO line.  We have several cases of
such needs, at least for Devicetree-based platforms.

If Devicetree-based device requests a reset line, while "resets"
Devicetree property is missing but there is a "reset-gpios" one,
instantiate a new "reset-gpio" platform device which will handle such
reset line.  This allows seamless handling of such shared reset-gpios
without need of changing Devicetree binding [1].

To avoid creating multiple "reset-gpio" platform devices, store the
Devicetree "reset-gpios" GPIO specifiers used for new devices on a
linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
controller, GPIO number and GPIO flags) is used to check if reset
controller for given GPIO was already registered.

If two devices have conflicting "reset-gpios" property, e.g. with
different ACTIVE_xxx flags, this would allow to spawn two separate
"reset-gpio" devices, where the second would fail probing on busy GPIO
request.

Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1]
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on previous of change.
---
 drivers/reset/core.c             | 215 +++++++++++++++++++++++++++++--
 include/linux/reset-controller.h |   4 +
 2 files changed, 206 insertions(+), 13 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 4d5a78d3c085..60a8a33c4419 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -5,14 +5,19 @@
  * Copyright 2013 Philipp Zabel, Pengutronix
  */
 #include <linux/atomic.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/kref.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/acpi.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -23,6 +28,11 @@ static LIST_HEAD(reset_controller_list);
 static DEFINE_MUTEX(reset_lookup_mutex);
 static LIST_HEAD(reset_lookup_list);
 
+/* Protects reset_gpio_lookup_list */
+static DEFINE_MUTEX(reset_gpio_lookup_mutex);
+static LIST_HEAD(reset_gpio_lookup_list);
+static DEFINE_IDA(reset_gpio_ida);
+
 /**
  * struct reset_control - a reset control
  * @rcdev: a pointer to the reset controller device
@@ -63,6 +73,16 @@ struct reset_control_array {
 	struct reset_control *rstc[] __counted_by(num_rstcs);
 };
 
+/**
+ * struct reset_gpio_lookup - lookup key for ad-hoc created reset-gpio devices
+ * @of_args: phandle to the reset controller with all the args like GPIO number
+ * @list: list entry for the reset_gpio_lookup_list
+ */
+struct reset_gpio_lookup {
+	struct of_phandle_args of_args;
+	struct list_head list;
+};
+
 static const char *rcdev_name(struct reset_controller_dev *rcdev)
 {
 	if (rcdev->dev)
@@ -71,6 +91,9 @@ static const char *rcdev_name(struct reset_controller_dev *rcdev)
 	if (rcdev->of_node)
 		return rcdev->of_node->full_name;
 
+	if (rcdev->of_args)
+		return rcdev->of_args->np->full_name;
+
 	return NULL;
 }
 
@@ -99,6 +122,9 @@ static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
  */
 int reset_controller_register(struct reset_controller_dev *rcdev)
 {
+	if (rcdev->of_node && rcdev->of_args)
+		return -EINVAL;
+
 	if (!rcdev->of_xlate) {
 		rcdev->of_reset_n_cells = 1;
 		rcdev->of_xlate = of_reset_simple_xlate;
@@ -813,12 +839,162 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 	kref_put(&rstc->refcnt, __reset_control_release);
 }
 
+static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
+					 unsigned int gpio,
+					 unsigned int of_flags)
+{
+	const struct fwnode_handle *fwnode = of_fwnode_handle(np);
+	unsigned int lookup_flags;
+	const char *label_tmp;
+
+	/*
+	 * Later we map GPIO flags between OF and Linux, however not all
+	 * constants from include/dt-bindings/gpio/gpio.h and
+	 * include/linux/gpio/machine.h match each other.
+	 */
+	if (of_flags > GPIO_ACTIVE_LOW) {
+		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
+		       of_flags, gpio);
+		return -EINVAL;
+	}
+
+	struct gpio_device *gdev __free(gpio_device_put) = gpio_device_find_by_fwnode(fwnode);
+	if (!gdev)
+		return -EPROBE_DEFER;
+
+	label_tmp = gpio_device_get_label(gdev);
+	if (!label_tmp)
+		return -EINVAL;
+
+	char *label __free(kfree) = kstrdup(label_tmp, GFP_KERNEL);
+	if (!label)
+		return -ENOMEM;
+
+	/* Size: one lookup entry plus sentinel */
+	struct gpiod_lookup_table *lookup __free(kfree) = kzalloc(struct_size(lookup, table, 2),
+								  GFP_KERNEL);
+	if (!lookup)
+		return -ENOMEM;
+
+	lookup->dev_id = kasprintf(GFP_KERNEL, "reset-gpio.%d", id);
+	if (!lookup->dev_id)
+		return -ENOMEM;
+
+	lookup_flags = GPIO_PERSISTENT;
+	lookup_flags |= of_flags & GPIO_ACTIVE_LOW;
+	lookup->table[0] = GPIO_LOOKUP(no_free_ptr(label), gpio, "reset",
+				       lookup_flags);
+
+	/* Not freed on success, because it is persisent subsystem data. */
+	gpiod_add_lookup_table(no_free_ptr(lookup));
+
+	return 0;
+}
+
+/*
+ * @args:	phandle to the GPIO provider with all the args like GPIO number
+ */
+static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
+{
+	struct reset_gpio_lookup *rgpio_dev;
+	struct platform_device *pdev;
+	int id, ret;
+
+	/*
+	 * Registering reset-gpio device might cause immediate
+	 * bind, resulting in its probe() registering new reset controller thus
+	 * taking reset_list_mutex lock via reset_controller_register().
+	 */
+	lockdep_assert_not_held(&reset_list_mutex);
+
+	mutex_lock(&reset_gpio_lookup_mutex);
+
+	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
+		if (args->np == rgpio_dev->of_args.np) {
+			if (of_phandle_args_equal(args, &rgpio_dev->of_args))
+				goto out; /* Already on the list, done */
+		}
+	}
+
+	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
+	if (id < 0) {
+		ret = id;
+		goto err_unlock;
+	}
+
+	/* Not freed on success, because it is persisent subsystem data. */
+	rgpio_dev = kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
+	if (!rgpio_dev) {
+		ret = -ENOMEM;
+		goto err_ida_free;
+	}
+
+	ret = __reset_add_reset_gpio_lookup(id, args->np, args->args[0],
+					    args->args[1]);
+	if (ret < 0)
+		goto err_kfree;
+
+	rgpio_dev->of_args = *args;
+	/*
+	 * We keep the device_node reference, but of_args.np is put at the end
+	 * of __of_reset_control_get(), so get it one more time.
+	 * Hold reference as long as rgpio_dev memory is valid.
+	 */
+	of_node_get(rgpio_dev->of_args.np);
+	pdev = platform_device_register_data(NULL, "reset-gpio", id,
+					     &rgpio_dev->of_args,
+					     sizeof(rgpio_dev->of_args));
+	ret = PTR_ERR_OR_ZERO(pdev);
+	if (ret)
+		goto err_put;
+
+	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
+
+out:
+	mutex_unlock(&reset_gpio_lookup_mutex);
+
+	return 0;
+
+err_put:
+	of_node_put(rgpio_dev->of_args.np);
+err_kfree:
+	kfree(rgpio_dev);
+err_ida_free:
+	ida_free(&reset_gpio_ida, id);
+err_unlock:
+	mutex_unlock(&reset_gpio_lookup_mutex);
+
+	return ret;
+}
+
+static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_args *args,
+						       bool gpio_fallback)
+{
+	struct reset_controller_dev *rcdev;
+
+	lockdep_assert_held(&reset_list_mutex);
+
+	list_for_each_entry(rcdev, &reset_controller_list, list) {
+		if (gpio_fallback) {
+			if (rcdev->of_args && of_phandle_args_equal(args,
+								    rcdev->of_args))
+				return rcdev;
+		} else {
+			if (args->np == rcdev->of_node)
+				return rcdev;
+		}
+	}
+
+	return NULL;
+}
+
 struct reset_control *
 __of_reset_control_get(struct device_node *node, const char *id, int index,
 		       bool shared, bool optional, bool acquired)
 {
+	bool gpio_fallback = false;
 	struct reset_control *rstc;
-	struct reset_controller_dev *r, *rcdev;
+	struct reset_controller_dev *rcdev;
 	struct of_phandle_args args;
 	int rstc_id;
 	int ret;
@@ -839,39 +1015,52 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 					 index, &args);
 	if (ret == -EINVAL)
 		return ERR_PTR(ret);
-	if (ret)
-		return optional ? NULL : ERR_PTR(ret);
+	if (ret) {
+		if (!IS_ENABLED(CONFIG_RESET_GPIO))
+			return optional ? NULL : ERR_PTR(ret);
 
-	mutex_lock(&reset_list_mutex);
-	rcdev = NULL;
-	list_for_each_entry(r, &reset_controller_list, list) {
-		if (args.np == r->of_node) {
-			rcdev = r;
-			break;
+		/*
+		 * There can be only one reset-gpio for regular devices, so
+		 * don't bother with the "reset-gpios" phandle index.
+		 */
+		ret = of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
+						 0, &args);
+		if (ret)
+			return optional ? NULL : ERR_PTR(ret);
+
+		gpio_fallback = true;
+
+		ret = __reset_add_reset_gpio_device(&args);
+		if (ret) {
+			rstc = ERR_PTR(ret);
+			goto out_put;
 		}
 	}
 
+	mutex_lock(&reset_list_mutex);
+	rcdev = __reset_find_rcdev(&args, gpio_fallback);
 	if (!rcdev) {
 		rstc = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		goto out_unlock;
 	}
 
 	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
 		rstc = ERR_PTR(-EINVAL);
-		goto out;
+		goto out_unlock;
 	}
 
 	rstc_id = rcdev->of_xlate(rcdev, &args);
 	if (rstc_id < 0) {
 		rstc = ERR_PTR(rstc_id);
-		goto out;
+		goto out_unlock;
 	}
 
 	/* reset_list_mutex also protects the rcdev's reset_control list */
 	rstc = __reset_control_get_internal(rcdev, rstc_id, shared, acquired);
 
-out:
+out_unlock:
 	mutex_unlock(&reset_list_mutex);
+out_put:
 	of_node_put(args.np);
 
 	return rstc;
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 0fa4f60e1186..357df16ede32 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -60,6 +60,9 @@ struct reset_control_lookup {
  * @reset_control_head: head of internal list of requested reset controls
  * @dev: corresponding driver model device struct
  * @of_node: corresponding device tree node as phandle target
+ * @of_args: for reset-gpios controllers: corresponding phandle args with
+ *           of_node and GPIO number complementing of_node; either this or
+ *           of_node should be present
  * @of_reset_n_cells: number of cells in reset line specifiers
  * @of_xlate: translation function to translate from specifier as found in the
  *            device tree to id as given to the reset control ops, defaults
@@ -73,6 +76,7 @@ struct reset_controller_dev {
 	struct list_head reset_control_head;
 	struct device *dev;
 	struct device_node *of_node;
+	const struct of_phandle_args *of_args;
 	int of_reset_n_cells;
 	int (*of_xlate)(struct reset_controller_dev *rcdev,
 			const struct of_phandle_args *reset_spec);
-- 
2.34.1

