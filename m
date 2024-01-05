Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E282576A
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 17:00:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 823BEEB9;
	Fri,  5 Jan 2024 17:00:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 823BEEB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704470446;
	bh=bc+iXpdz9DbsJ3J2wS5bEwodgL6YbnpTsc8B/pGoOSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Guaf3DD2h9q+gNLNTd0nJXY/+hkOH+ROUETsF+43YxqvTPBobqlFBdam1qlif3oTx
	 HqR9TxziTL+t1t4btXwaTWH0LIPRV/8MswzLeVAByA3aQmukeEcerU5hsl622asLT8
	 HZT/9rzb/rub2+7lC2LQS0UG409h1dd1N3emq/yw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CBD0F805F0; Fri,  5 Jan 2024 16:59:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A237DF805E0;
	Fri,  5 Jan 2024 16:59:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DF1AF8058C; Fri,  5 Jan 2024 16:59:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF7E3F80496
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 16:59:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF7E3F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WczM9FPy
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so181104166b.0
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Jan 2024 07:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704470367; x=1705075167;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tTyPxtOHyPhs2m2q+fBlzqfN887mU2OuCBzVF3uVpc=;
        b=WczM9FPyrV8RfP9ekF8U0T2Ki+9ZueGAb2eyNUZ02HXuFRF9CH3AJywly5ZFnvbIN5
         NBrigWRb+NRmoSFVehFqQ8Lch1M2XjXvzjcZTKmiZQDbVEp0yBOxgLzrTZFjxq2NbAhU
         treY1iy1409EWfoKR8vf5G8+A39LV2liy4Chb930TfGx3pYnasxzfvzRLpH+Ezw6OTMT
         weyHn8MYU9NlmwO1h8RJTMhcvFcUjV0hjeBSTty1NAWJJNr9QULMrHHPJalnrDUWDHk2
         UTjfjj0hLUqZSwwJlf7z8t/+uSyzrgn8yywFHMluvM7EPsrQwiluHoPBhPPt46OjKeO0
         XQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470367; x=1705075167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tTyPxtOHyPhs2m2q+fBlzqfN887mU2OuCBzVF3uVpc=;
        b=IPv4IzW+bSIZJfVNKAlwraKzPldvaJi//7psPxrWd2m92VHEr/UfQ9jFQUiXFyAYER
         Unei/2Mdfj3VGZniP58tHFZ0Vsm0hIiiZsBdu1iffZMDBlm+uRVDQNaHk3pA/PspL9k2
         FaGoXVImoOWRG2rnvbLa3bMxfJ1eGRzH9GLqhPeSVM+AFYhykKasjyIdZm1Op6MSpGxy
         TnBREDBp+ePukwtXC1PSAtYIhhiNAqvldZErQgjMIdD4QQlxNMXZThRZ9Xuy7fVOI9r5
         KJ4LkwOTxb71bdGcmuUXBKMLBS7cKuNWHFLmwMbYq5cMxD6aNwrSl+8v0N6okA1StQX4
         2sVQ==
X-Gm-Message-State: AOJu0YzRfGU3ZARRVHmmSLnDBlLyUijmMdGhqGrd6u3Uov7b3pb06iJL
	Cv2xB7CD/Zz7m9hgjjTLdEdoTXpf4WHxXw==
X-Google-Smtp-Source: 
 AGHT+IEJllJOQYWFJfcK4fFNCU2+uk/9rAtZgBP1Rn9juMOU1AONaO8vekFgnIMLnJEdjkon7/9SEQ==
X-Received: by 2002:a17:907:98a:b0:a27:d9ef:8ab with SMTP id
 bf10-20020a170907098a00b00a27d9ef08abmr1310502ejc.2.1704470366902;
        Fri, 05 Jan 2024 07:59:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 su8-20020a17090703c800b00a29910a9366sm326024ejb.8.2024.01.05.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 07:59:26 -0800 (PST)
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
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v2 2/4] reset: Instantiate reset GPIO controller for shared
 reset-gpios
Date: Fri,  5 Jan 2024 16:59:16 +0100
Message-Id: <20240105155918.279657-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
References: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SM5PZCD7QHQXJNH2EPTL53H3TUCJHYZB
X-Message-ID-Hash: SM5PZCD7QHQXJNH2EPTL53H3TUCJHYZB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SM5PZCD7QHQXJNH2EPTL53H3TUCJHYZB/>
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

If Devicetree-based device requests a reset line, which is missing but
there is a reset-gpios property, instantiate a new "reset-gpio" platform
device which will handle such reset line.  This allows seamless handling
of such shared reset-gpios without need of changing Devicetree binding [1].

All newly registered "reset-gpio" platform devices will be stored on
their own list to avoid any duplicated devices.  The key to find each of
such platform device is the entire Devicetree GPIO specifier: phandle to
GPIO controller, GPIO number and GPIO flags.  If two devices have
conflicting "reset-gpios" property, e.g. with different ACTIVE_xxx
flags, this would spawn two separate "reset-gpio" devices, where the
second would fail probing on busy GPIO reques

Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1]
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/reset/core.c             | 176 ++++++++++++++++++++++++++++---
 include/linux/reset-controller.h |   4 +
 2 files changed, 167 insertions(+), 13 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 4d5a78d3c085..ec9b3ff419cf 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/acpi.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -23,6 +24,10 @@ static LIST_HEAD(reset_controller_list);
 static DEFINE_MUTEX(reset_lookup_mutex);
 static LIST_HEAD(reset_lookup_list);
 
+/* Protects reset_gpio_device_list */
+static DEFINE_MUTEX(reset_gpio_device_mutex);
+static LIST_HEAD(reset_gpio_device_list);
+
 /**
  * struct reset_control - a reset control
  * @rcdev: a pointer to the reset controller device
@@ -63,6 +68,16 @@ struct reset_control_array {
 	struct reset_control *rstc[] __counted_by(num_rstcs);
 };
 
+/**
+ * struct reset_gpio_device - ad-hoc created reset-gpio device
+ * @of_args: phandle to the reset controller with all the args like GPIO number
+ * @list: list entry for the reset_lookup_list
+ */
+struct reset_gpio_device {
+	struct of_phandle_args of_args;
+	struct list_head list;
+};
+
 static const char *rcdev_name(struct reset_controller_dev *rcdev)
 {
 	if (rcdev->dev)
@@ -813,13 +828,119 @@ static void __reset_control_put_internal(struct reset_control *rstc)
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
+			break;
+
+	/* All args matched? */
+	if (i == a1->args_count)
+		return true;
+
+	return false;
+}
+
+/*
+ * @node:	node of the device requesting reset
+ * @reset_args:	phandle to the reset controller with all the args like GPIO number
+ */
+static int __reset_add_reset_gpio_device(struct device_node *node,
+					 struct of_phandle_args *args)
+{
+	struct reset_gpio_device *rgpio_dev;
+	struct platform_device *pdev;
+	int ret;
+
+	lockdep_assert_not_held(&reset_list_mutex);
+
+	mutex_lock(&reset_gpio_device_mutex);
+
+	list_for_each_entry(rgpio_dev, &reset_gpio_device_list, list) {
+		if (args->np == rgpio_dev->of_args.np) {
+			if (__reset_gpios_args_match(args,
+						     &rgpio_dev->of_args)) {
+				ret = 0;
+				goto out_unlock;
+			}
+		}
+	}
+
+	/* Not freed in normal path, persisent subsyst data */
+	rgpio_dev = kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
+	if (!rgpio_dev) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	rgpio_dev->of_args = *args;
+	pdev = platform_device_register_data(NULL, "reset-gpio",
+					     PLATFORM_DEVID_AUTO, &node,
+					     sizeof(node));
+	ret = PTR_ERR_OR_ZERO(pdev);
+	if (!ret)
+		list_add(&rgpio_dev->list, &reset_gpio_device_list);
+	else
+		kfree(rgpio_dev);
+
+out_unlock:
+	mutex_unlock(&reset_gpio_device_mutex);
+
+	return ret;
+}
+
+static struct reset_controller_dev *__reset_find_rcdev(struct of_phandle_args *args,
+						       bool gpio_fallback,
+						       const void *cookie)
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
+					/*
+					 * Fake args (take first reset) and
+					 * args_count (to matcg reset-gpio
+					 * of_reset_n_cells) because reset-gpio
+					 * has only one reset and does not care
+					 * about reset of GPIO specifier.
+					 */
+					args->args[0] = 0;
+					args->args_count = 1;
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
 
@@ -839,21 +960,50 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
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
-		}
+		gpio_fallback = true;
 	}
 
+	mutex_lock(&reset_list_mutex);
+	rcdev = __reset_find_rcdev(&args, gpio_fallback, NULL);
+
 	if (!rcdev) {
-		rstc = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		if (gpio_fallback) {
+			/*
+			 * Registering reset-gpio device might cause immediate
+			 * bind, thus taking reset_list_mutex lock via
+			 * reset_controller_register().
+			 */
+			mutex_unlock(&reset_list_mutex);
+			ret = __reset_add_reset_gpio_device(node, &args);
+			mutex_lock(&reset_list_mutex);
+			if (ret) {
+				rstc = ERR_PTR(ret);
+				goto out;
+			}
+			/*
+			 * Success: reset-gpio could probe immediately, so
+			 * re-check the lookup.
+			 */
+			rcdev = __reset_find_rcdev(&args, gpio_fallback, NULL);
+			if (!rcdev) {
+				rstc = ERR_PTR(-EPROBE_DEFER);
+				goto out;
+			}
+			/* Success, rcdev is valid thus do not bail out */
+		} else {
+			rstc = ERR_PTR(-EPROBE_DEFER);
+			goto out;
+		}
 	}
 
 	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
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

