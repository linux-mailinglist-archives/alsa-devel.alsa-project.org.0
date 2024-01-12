Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4782C3BA
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 17:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AF1C14E3;
	Fri, 12 Jan 2024 17:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AF1C14E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705077486;
	bh=tT7fUAjGEkwF8f/AQ950JmBx7mOx/ZmQ/E/+96omoCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AZdQtoVDZvbn6QnHfjb4XYGXM8F1qtWgjLen8l9z5xpyVE7+B3N+bYcmVXPXRcgWV
	 Ewzp4yv8t/1dMbbeTkOYRNjpoCmRrMMvcJ9mSygA6VsBfDh3wgTB6vZ5eNOP65NGAr
	 x6VileGTw1BXZjfa3Mm8S+FIRKQGFfDtjwKdk6ow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C84D9F80605; Fri, 12 Jan 2024 17:36:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A515F8060B;
	Fri, 12 Jan 2024 17:36:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EB99F805AA; Fri, 12 Jan 2024 17:36:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEC1CF8014B
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 17:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC1CF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FJfCqYBs
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3373a30af67so5738681f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Jan 2024 08:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705077384; x=1705682184;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyDDK8wz61UD70/QcPoYFZCJBphOvhD/N3TrrEWzs04=;
        b=FJfCqYBsTba8QXUyd4sBO9HWylagJWE13tzCP8HWVpjSuXfI11AJLohzOCA3LmYis+
         6vspDgZCDLJZy7ck/AABm+L4KTLN3RXNqBch+YleSItUi0DVc2AEVKcUg8Ynzv4bqGTZ
         0vaVJDIao3sP5A+JK+9vCkg1w3cEQA/EIKLeNOLevX002quyY1aCh+ZXDhDiT4/sAlbK
         rWyXCBn/CUpqULbKPlMnI8uA30PO3GrNL/tbzq656eR70ascGQL/qf5PJxXw3KQzt5tg
         +SwyPUiXWHYQVL2Yiicq3U24JUgFLgZUyWRWubDKRjcvYu31FvzPLHKeunR+BzZ40/cp
         W7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077384; x=1705682184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyDDK8wz61UD70/QcPoYFZCJBphOvhD/N3TrrEWzs04=;
        b=RVI1Zl5tGYT3cg7K2nFwYlxNPDtM6LrVFKhvhzf08QNgCO1Oz9a2VJeOQOhHZt+fvn
         TMZUrOeWeFW684dCNgPl3ug0G9Dd6vg5DmfvgBNFAv9Sl3hkozSjNTB+uR/vaVs4XTSm
         JGEL+WieNlUpok3ZFUHUxl1OUKXJYfNkI8YcHUDdBhaIvqnSD25+CRu1uvWr7zyfdJil
         NES9V9Di98n3TrhVToIWVonoiysf3X/L5buBgytZCfcKRo/2OWRuK6SZs3HBMMCy/Axp
         6kM17hBYSri8idm+cWY1yxNmARMaDMoK4zONbQbB1SlDOt6ff8MF+nrOZWlGJEj2Jxys
         JR0A==
X-Gm-Message-State: AOJu0Ywpphdfla1R4qtxtvoQ3eSQc6uMLRfCqQ2yv2FA/jFbQoJNfbh5
	DY6DcAlTA+dojpAT0HuXed/9pSWcRc99SQ==
X-Google-Smtp-Source: 
 AGHT+IGEtagzyP6drrDLBlZnlLyowYqGdeb19qv3F3VvjNm8psBxiXd75pZIKMI2UaFmdHtv32z/4Q==
X-Received: by 2002:a7b:c5cb:0:b0:40e:4921:5038 with SMTP id
 n11-20020a7bc5cb000000b0040e49215038mr648930wmk.91.1705077384525;
        Fri, 12 Jan 2024 08:36:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 bd16-20020a05600c1f1000b0040e5a93ae53sm6573195wmb.22.2024.01.12.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:36:24 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for shared
 reset-gpios
Date: Fri, 12 Jan 2024 17:36:05 +0100
Message-Id: <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GTEJLMFGXWQ7OGAMSE4DQDHV5ML2UHWS
X-Message-ID-Hash: GTEJLMFGXWQ7OGAMSE4DQDHV5ML2UHWS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTEJLMFGXWQ7OGAMSE4DQDHV5ML2UHWS/>
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
 drivers/reset/core.c             | 227 +++++++++++++++++++++++++++++--
 include/linux/reset-controller.h |   4 +
 2 files changed, 217 insertions(+), 14 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 4d5a78d3c085..86e33a703ad2 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -10,9 +10,13 @@
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
@@ -23,6 +27,11 @@ static LIST_HEAD(reset_controller_list);
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
@@ -63,6 +72,16 @@ struct reset_control_array {
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
@@ -813,13 +832,183 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 	kref_put(&rstc->refcnt, __reset_control_release);
 }
 
+static bool __reset_gpios_args_match(const struct of_phandle_args *a1,
+				     const struct of_phandle_args *a2)
+{
+	unsigned int i;
+
+	if (!a2)
+		return false;
+
+	if (a1->args_count != a2->args_count)
+		return false;
+
+	for (i = 0; i < a1->args_count; i++)
+		if (a1->args[i] != a2->args[i])
+			return false;
+
+	return true;
+}
+
+static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
+					 unsigned int gpio,
+					 unsigned int of_flags)
+{
+	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
+	char *label __free(kfree) = NULL;
+	unsigned int lookup_flags;
+
+	/*
+	 * Later we map GPIO flags between OF and Linux, however not all
+	 * constants from include/dt-bindings/gpio/gpio.h and
+	 * include/linux/gpio/machine.h match each other.
+	 */
+	if (of_flags > GPIO_ACTIVE_LOW) {
+		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
+			of_flags, gpio);
+		return -EINVAL;
+	}
+
+	gdev = gpio_device_find_by_fwnode(of_fwnode_handle(np));
+	if (!gdev)
+		return -EPROBE_DEFER;
+
+	label = kstrdup(gpio_device_get_label(gdev), GFP_KERNEL);
+	if (!label)
+		return -EINVAL;
+
+	/* Size: one lookup entry plus sentinel */
+	lookup = kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
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
+	gpiod_add_lookup_table(no_free_ptr(lookup));
+
+	return 0;
+}
+
+/*
+ * @reset_args:	phandle to the GPIO provider with all the args like GPIO number
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
+			if (__reset_gpios_args_match(args, &rgpio_dev->of_args))
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
+	/*
+	 * Not freed in normal path, persisent subsystem data (which is assumed
+	 * also in the reset-gpio driver).
+	 */
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
+	struct reset_controller_dev *r, *rcdev;
+
+	lockdep_assert_held(&reset_list_mutex);
+
+	rcdev = NULL;
+	list_for_each_entry(r, &reset_controller_list, list) {
+		if (args->np == r->of_node) {
+			if (gpio_fallback) {
+				if (__reset_gpios_args_match(args, r->of_args)) {
+					rcdev = r;
+					break;
+				}
+			} else {
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
+	struct of_phandle_args args = {0};
+	bool gpio_fallback = false;
 	struct reset_control *rstc;
-	struct reset_controller_dev *r, *rcdev;
-	struct of_phandle_args args;
+	struct reset_controller_dev *rcdev;
 	int rstc_id;
 	int ret;
 
@@ -839,39 +1028,49 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 					 index, &args);
 	if (ret == -EINVAL)
 		return ERR_PTR(ret);
-	if (ret)
-		return optional ? NULL : ERR_PTR(ret);
+	if (ret) {
+		/*
+		 * There can be only one reset-gpio for regular devices, so
+		 * don't bother with GPIO index.
+		 */
+		ret = of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
+						 0, &args);
+		if (ret)
+			return optional ? NULL : ERR_PTR(ret);
 
-	mutex_lock(&reset_list_mutex);
-	rcdev = NULL;
-	list_for_each_entry(r, &reset_controller_list, list) {
-		if (args.np == r->of_node) {
-			rcdev = r;
-			break;
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
index 0fa4f60e1186..e064473215de 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -61,6 +61,9 @@ struct reset_control_lookup {
  * @dev: corresponding driver model device struct
  * @of_node: corresponding device tree node as phandle target
  * @of_reset_n_cells: number of cells in reset line specifiers
+ * TODO: of_args have of_node, so we have here duplication
+ * @of_args: for reset-gpios controllers: corresponding phandle args with GPIO
+ *           number complementing of_node
  * @of_xlate: translation function to translate from specifier as found in the
  *            device tree to id as given to the reset control ops, defaults
  *            to :c:func:`of_reset_simple_xlate`.
@@ -74,6 +77,7 @@ struct reset_controller_dev {
 	struct device *dev;
 	struct device_node *of_node;
 	int of_reset_n_cells;
+	const struct of_phandle_args *of_args;
 	int (*of_xlate)(struct reset_controller_dev *rcdev,
 			const struct of_phandle_args *reset_spec);
 	unsigned int nr_resets;
-- 
2.34.1

