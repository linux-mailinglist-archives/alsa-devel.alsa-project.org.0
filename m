Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035EA278409
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 11:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D560186D;
	Fri, 25 Sep 2020 11:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D560186D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601026266;
	bh=eeYa8XoUJn6pNGbcmQB6MWOnUpL8hNgftcsGNDslVAI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=snYcs1URmssWTlN27j1zbAqfTeDGhMleuXO9kvkGS6MHASAuct8cbHz6RrY54OoiQ
	 S0Hrf6o87byD5xK8eRl8DXh4RFgNkH/faFiRvfToopRx/V765lGGaFW9WTbtRs8lUa
	 8E40x/Ulalycmd10wdci6wmTEEN0KIGPCdtY1Lqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51411F8028F;
	Fri, 25 Sep 2020 11:28:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DE7DF8028F; Fri, 25 Sep 2020 11:28:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A402F800F6
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 11:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A402F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OKYztN3e"
Received: by mail-wm1-x344.google.com with SMTP id y15so2516738wmi.0
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 02:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ILQ/IiRKb55ppcaOHIyXL34tMQjZIAgy+EvIz2zBiIc=;
 b=OKYztN3emZinZ60HG3Zaxg3pQkZM8kA1HxlbgRE5GQfuunViHAro6Z7Qm7QWUpGb6y
 8FF9VP4qNwZX4xi5uZzhr9ICXax2MvYohnmW6VlX0fDh45tB3Es2HX90yyDhbot9OFqn
 THbBv0tAzRvY/Swx6ic81ssAWbq1RPN9CVlU+M0W34WFFeUarHZMP0rXSurdxalCafWM
 KB2aG2JXbflkzuZyHocZjXNdvL0m5IyAZgynvGms0+w18tMFN2sKtXOjm6PmgN/TmnzW
 qOYe48Jp2GKuPReXYIQcpeJw9f2tMh8uj5CnNf02nDlAgkkOwTfthpPnu7p9YUerFbP2
 BMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ILQ/IiRKb55ppcaOHIyXL34tMQjZIAgy+EvIz2zBiIc=;
 b=I1ul+tre24n4h4loTBQPDWtIiLHYNNyzOoVHms1wZaElW+GhLMeJzZOLq7Q8iLwYS+
 hcZLuDO5vxAC4Bx9NP9EclXgyvwdaVtniTJvocFOH1nK9EW8XsPyNxbUy8Onj1h0MKMf
 zfJ6nDeGdg4QC+DBD724PNaj6hvus7+GDYuDb9rarUa12geGV8jfyaripl5g52qLV34P
 ALB2tfqw5qtUzlxV7yupWDMOpv8xzJBdVp3gz4kVJbrJvlDVsux6uPMvdnEQeS+BGKl0
 G0/pUlkmonT2Wv3VvRHtLgDGS2lBmtfTc+1XWC6/JmrpXG+Zqwp42XiJwVjLqMN6hoQ/
 uhmw==
X-Gm-Message-State: AOAM5310Kv9P6BHlKtZSzNrRrv3UAHFmeNkiXXovbR+kZ9KcEBtKyqAn
 kC0SeXFF8/ErbNbr8YPYBtnd5A==
X-Google-Smtp-Source: ABdhPJx34N2upgwLQ/YFcj2NxUHH/0r1UvLTJ42+7TN6qcD2mAk2/oh9pZZvU4i1CGwxzOHzGSF/mw==
X-Received: by 2002:a1c:5988:: with SMTP id n130mr2174411wmb.95.1601026114341; 
 Fri, 25 Sep 2020 02:28:34 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n2sm2366859wma.29.2020.09.25.02.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 02:28:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] regmap: add support to regmap_field_bulk_alloc/free apis
Date: Fri, 25 Sep 2020 10:28:03 +0100
Message-Id: <20200925092804.23536-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925092804.23536-1-srinivas.kandagatla@linaro.org>
References: <20200925092804.23536-1-srinivas.kandagatla@linaro.org>
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
QCOM LPASS driver has extensively converted to use regmap_fileds.

Using new bluk api to allocate fields makes it much more cleaner code to read!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 drivers/base/regmap/regmap.c | 100 +++++++++++++++++++++++++++++++++++
 include/linux/regmap.h       |  11 ++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index aec3f26bf711..271740a163ad 100644
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
+ * @rm_field: regmap register fileds with in the bank.
+ * @reg_field: Register fields with in the bank.
+ * @num_fields: Number of register fileds.
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
+ * @rm_field: regmap register fileds with in the bank.
+ * @reg_field: Register fields with in the bank.
+ * @num_fields: Number of register fileds.
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
+ * will be freed as per device-driver life-cyle.
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

