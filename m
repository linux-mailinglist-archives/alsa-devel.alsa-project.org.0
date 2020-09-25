Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC34278F1D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 18:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78F2718F4;
	Fri, 25 Sep 2020 18:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78F2718F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601052711;
	bh=9/glAxDIrsWjuNXdKv6lI+F0DPhWMZjpATf92Ws/f4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PnFcH72nt2bpKwzmtYth7/ScCAUklTgL2+OQS7hMW/1tXke57yBmRaqWQupIogXHH
	 8xT1erxeD8JPAxoe8KckmklGK1N1l8t/DaBuw2/XmN+8Jn2eSXNRz8d25+jIsejrWV
	 yfiCfTDDvcWRK+sfU+lFs+/tVJIYc2UeOn/86snw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB1B8F802C4;
	Fri, 25 Sep 2020 18:49:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45FE5F80254; Fri, 25 Sep 2020 18:49:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B03FF80171
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 18:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B03FF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Dzn6BomX"
Received: by mail-wr1-x444.google.com with SMTP id o5so4279202wrn.13
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 09:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ssju2WyDh5j0zn3FxJ2qEeLRsDGQouz5zG8/DyJr+lg=;
 b=Dzn6BomXQuuqwu3kVz3HW4HYjLiPHh1aPVbOzCQ5eMeP17ZUB7G+mzMUI5Q9/d8H5h
 uBKJ6Q+5/bBdz+OoxUXwamCFnPFrwgu4ad9ZSx1CFgy1kCNCfj3JY3LXk2R0RrHzuMeM
 lWHk+++DMbaDyqNL4vUFDw3KsCxvWyZ+kU81EnEsZXaYKYWMl8xhhz00oJm5KlfM2qtO
 eY5NQXnlfPXmTCa70WJEzQbEbwOG37iF8tvkXOqITxcGKdr7+4df9D7ic8UUvbSbtCB4
 1uWCnXgyAjn3x0rqBPdQ7BQZQsq8xDT5RNpC6/ggkU8bxnOpCTKSbtHe4X3esZfbjWpH
 DfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ssju2WyDh5j0zn3FxJ2qEeLRsDGQouz5zG8/DyJr+lg=;
 b=aY7jnvv7+kR9x4lHo583H1QmnGZVkpTt5MO0v8HeK7VTMpcjXSD2fAw6dlMUzp0JRm
 N+hj1u2jTyJUCw7dE7a2XYEleLu3nARBFzFeCj42revJs0lOsYAwJ1SdAgJXJy+YFDoL
 i8i3xbwSnWNTTHZ+QZNzE+4aHWji0GWqaC0YpiNDKgTE4jZwvU5XdaypyVz3wK5tUqEO
 xUTszM60asIVUV8/YFJjljl5ZcksSbnRYqLPgcC8xsbzMjpVXhT8VHMngmpIdAmjtEKp
 USWxIyJbefQ3kxhl/VydiEletAAFNXjOOGcu7OVuJ+UbQfw3B/GJ6gif4QWHOh2S1lGn
 c+uQ==
X-Gm-Message-State: AOAM532ERYbxa7/iPGd9bZylQru7tSqydDgWOlpSRjhnHqT+vb4vzw9R
 3stvHIqQn3y3Zb2059fMVRdBpAdLoRxElg==
X-Google-Smtp-Source: ABdhPJzF6a15K9ycGmVQMoYUKXDCxa73oBO2AW6MOErQWnTaGG1fXrd/DW0LDyQxA24LHKih8B4Vkg==
X-Received: by 2002:adf:ec4d:: with SMTP id w13mr5667896wrn.334.1601052547018; 
 Fri, 25 Sep 2020 09:49:07 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id a5sm3604247wrp.37.2020.09.25.09.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 09:49:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/2] regmap: add support to regmap_field_bulk_alloc/free
 apis
Date: Fri, 25 Sep 2020 17:48:55 +0100
Message-Id: <20200925164856.10315-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925164856.10315-1-srinivas.kandagatla@linaro.org>
References: <20200925164856.10315-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, srivasam@codeaurora.org, lgirdwood@gmail.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, tiwai@suse.com,
 rohitkr@codeaurora.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

Usage of regmap_field_alloc becomes much overhead when number of fields
exceed more than 3.
QCOM LPASS driver has extensively converted to use regmap_fields.

Using new bulk api to allocate fields makes it much more cleaner code to read!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 drivers/base/regmap/regmap.c | 100 +++++++++++++++++++++++++++++++++++
 include/linux/regmap.h       |  11 ++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index aec3f26bf711..8d6aedce666d 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1270,6 +1270,106 @@ struct regmap_field *devm_regmap_field_alloc(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_regmap_field_alloc);
 
+
+/**
+ * regmap_field_bulk_alloc() - Allocate and initialise a bulk register field.
+ *
+ * @regmap: regmap bank in which this register field is located.
+ * @rm_field: regmap register fields within the bank.
+ * @reg_field: Register fields within the bank.
+ * @num_fields: Number of register fields.
+ *
+ * The return value will be an -ENOMEM on error or zero for success.
+ * Newly allocated regmap_fields should be freed by calling
+ * regmap_field_bulk_free()
+ */
+int regmap_field_bulk_alloc(struct regmap *regmap,
+			    struct regmap_field **rm_field,
+			    struct reg_field *reg_field,
+			    int num_fields)
+{
+	struct regmap_field *rf;
+	int i;
+
+	rf = kcalloc(num_fields, sizeof(*rf), GFP_KERNEL);
+	if (!rf)
+		return -ENOMEM;
+
+	for (i = 0; i < num_fields; i++) {
+		regmap_field_init(&rf[i], regmap, reg_field[i]);
+		rm_field[i] = &rf[i];
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(regmap_field_bulk_alloc);
+
+/**
+ * devm_regmap_field_bulk_alloc() - Allocate and initialise a bulk register
+ * fields.
+ *
+ * @dev: Device that will be interacted with
+ * @regmap: regmap bank in which this register field is located.
+ * @rm_field: regmap register fields within the bank.
+ * @reg_field: Register fields within the bank.
+ * @num_fields: Number of register fields.
+ *
+ * The return value will be an -ENOMEM on error or zero for success.
+ * Newly allocated regmap_fields will be automatically freed by the
+ * device management code.
+ */
+int devm_regmap_field_bulk_alloc(struct device *dev,
+				 struct regmap *regmap,
+				 struct regmap_field **rm_field,
+				 struct reg_field *reg_field,
+				 int num_fields)
+{
+	struct regmap_field *rf;
+	int i;
+
+	rf = devm_kcalloc(dev, num_fields, sizeof(*rf), GFP_KERNEL);
+	if (!rf)
+		return -ENOMEM;
+
+	for (i = 0; i < num_fields; i++) {
+		regmap_field_init(&rf[i], regmap, reg_field[i]);
+		rm_field[i] = &rf[i];
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_regmap_field_bulk_alloc);
+
+/**
+ * regmap_field_bulk_free() - Free register field allocated using
+ *                       regmap_field_bulk_alloc.
+ *
+ * @field: regmap fields which should be freed.
+ */
+void regmap_field_bulk_free(struct regmap_field *field)
+{
+	kfree(field);
+}
+EXPORT_SYMBOL_GPL(regmap_field_bulk_free);
+
+/**
+ * devm_regmap_field_bulk_free() - Free a bulk register field allocated using
+ *                            devm_regmap_field_bulk_alloc.
+ *
+ * @dev: Device that will be interacted with
+ * @field: regmap field which should be freed.
+ *
+ * Free register field allocated using devm_regmap_field_bulk_alloc(). Usually
+ * drivers need not call this function, as the memory allocated via devm
+ * will be freed as per device-driver life-cycle.
+ */
+void devm_regmap_field_bulk_free(struct device *dev,
+				 struct regmap_field *field)
+{
+	devm_kfree(dev, field);
+}
+EXPORT_SYMBOL_GPL(devm_regmap_field_bulk_free);
+
 /**
  * devm_regmap_field_free() - Free a register field allocated using
  *                            devm_regmap_field_alloc.
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 0c49d59168b5..a35ec0a0d6e0 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1189,6 +1189,17 @@ struct regmap_field *devm_regmap_field_alloc(struct device *dev,
 		struct regmap *regmap, struct reg_field reg_field);
 void devm_regmap_field_free(struct device *dev,	struct regmap_field *field);
 
+int regmap_field_bulk_alloc(struct regmap *regmap,
+			     struct regmap_field **rm_field,
+			     struct reg_field *reg_field,
+			     int num_fields);
+void regmap_field_bulk_free(struct regmap_field *field);
+int devm_regmap_field_bulk_alloc(struct device *dev, struct regmap *regmap,
+				 struct regmap_field **field,
+				 struct reg_field *reg_field, int num_fields);
+void devm_regmap_field_bulk_free(struct device *dev,
+				 struct regmap_field *field);
+
 int regmap_field_read(struct regmap_field *field, unsigned int *val);
 int regmap_field_update_bits_base(struct regmap_field *field,
 				  unsigned int mask, unsigned int val,
-- 
2.21.0

