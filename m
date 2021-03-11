Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A9A337B4F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 18:46:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1109F17E3;
	Thu, 11 Mar 2021 18:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1109F17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615484797;
	bh=EhlL56XR7JX03LW6kac6wFTAOjYkP8fYlAUPW+ZGQlE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPGfqJCldCFdSIqfqzJc2peqCk85iYckWqTmbndFT08xI39wd2rTiT+CBaUBUquLb
	 uvLZOBs/Fn3EkrguZln+UsoBJvaPnPPtcAqBLoN7LAuMHHjKBK8lFoTqDX4mJDATEv
	 vGhs5ymQeXxRKHYfxYoMef3jD10lv0L0T2B+i/70=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98FD1F804AB;
	Thu, 11 Mar 2021 18:43:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08F0EF8032B; Thu, 11 Mar 2021 18:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C3FDF80227
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 18:43:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C3FDF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sMbW3iAa"
Received: by mail-lf1-x130.google.com with SMTP id r3so32973045lfc.13
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 09:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lauIwrt96uAPmpkrgU4FkhkQ/MY42MuzLH07yJAIu60=;
 b=sMbW3iAares8fpIlDuMmc9YI74PfSXvdcJIvyXpnEOcIR4/3hvj8GpTS/RfVyTjrO1
 H9Ix8PjdZ1rGW+L77V/6Hc5zYwJx5CnY9O53HJv0Jnjd0EZOR76AGP2+zCBP3DTTEXSq
 mTFRs6mb6LgT+1QNRaoy+13EYTh1xMDLg4XNJ9E0Lw3fPQ4TMCfuw++a/Ehl4NxZq8fY
 4s++VB8f80cKYKx7TfrHjn+ZiUIab/F213Cfphr9X5zcSTbg6sikkUkfmfgsE0auED8I
 oVrYHUIEzGAa28kD4Mrr+vY8QcUl04WXfRL+u3ylQjROHlCDYIrOf7oqRTySxxYGU3bE
 7xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lauIwrt96uAPmpkrgU4FkhkQ/MY42MuzLH07yJAIu60=;
 b=eB/b2759LQGyIsOvQw9v0deAbn6XIdKkP+UlrbZEKkT8NXm+/GMf4QZaYjV0xZukZ3
 G1qOgUwNzh98DpOzv4n7TPdKiwxm0guLQyh1n0c80RFdO1corZFm0yJmr8Xy4qijP9lI
 Gr13Zx/YLYb/bZWGX8i0L1nwbnUJquc+tC/GHncwDkab154hOh1tgpSEsnWKQriwTU+l
 fbsmI7aQYmfO0KN9DQRtxp18A63SxUa9YVURTJESYl3evqt2ppF/3LafFWUVwYLCEit2
 1Ggc+FIT63slG4KSvGsnf9E1qVbe7tbLqPG6qS61qdtHz2StFPLb33Puqm6j4OvKa74F
 d8aw==
X-Gm-Message-State: AOAM530NEKcJ6bFzLK79kO25D1BPDkPwAZGMVWFffKY2sdOIssf3Dsta
 TyyFoCB4iqe8PZJi+I0P6TL4tOmdYmQ=
X-Google-Smtp-Source: ABdhPJwIIkynBE0lnQlCVlI1gW0xq8XCAS4IoguTr8qyqLBTSVgd1olLBmUQt8E7z0Qmiqfsy+uy4w==
X-Received: by 2002:a19:22cb:: with SMTP id i194mr2851771lfi.191.1615484595022; 
 Thu, 11 Mar 2021 09:43:15 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id g10sm1021245lfe.90.2021.03.11.09.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:43:14 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v3 4/5] reset: Add reset_control_bulk API
Date: Thu, 11 Mar 2021 20:43:01 +0300
Message-Id: <20210311174302.15430-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311174302.15430-1-digetx@gmail.com>
References: <20210311174302.15430-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: Philipp Zabel <p.zabel@pengutronix.de>

Follow the clock and regulator subsystems' lead and add a bulk API
for reset controls.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/reset/core.c  | 215 +++++++++++++++++++++++++++++
 include/linux/reset.h | 308 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 523 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index dbf881b586d9..71c1c8264b2d 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -358,6 +358,30 @@ int reset_control_reset(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_reset);
 
+/**
+ * reset_control_bulk_reset - reset the controlled devices in order
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset controls set
+ *
+ * Issue a reset on all provided reset controls, in order.
+ *
+ * See also: reset_control_reset()
+ */
+int reset_control_bulk_reset(int num_rstcs,
+			     struct reset_control_bulk_data *rstcs)
+{
+	int ret, i;
+
+	for (i = 0; i < num_rstcs; i++) {
+		ret = reset_control_reset(rstcs[i].rstc);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reset_control_bulk_reset);
+
 /**
  * reset_control_rearm - allow shared reset line to be re-triggered"
  * @rstc: reset controller
@@ -461,6 +485,36 @@ int reset_control_assert(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_assert);
 
+/**
+ * reset_control_bulk_assert - asserts the reset lines in order
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset controls set
+ *
+ * Assert the reset lines for all provided reset controls, in order.
+ * If an assertion fails, already asserted resets are deasserted again.
+ *
+ * See also: reset_control_assert()
+ */
+int reset_control_bulk_assert(int num_rstcs,
+			      struct reset_control_bulk_data *rstcs)
+{
+	int ret, i;
+
+	for (i = 0; i < num_rstcs; i++) {
+		ret = reset_control_assert(rstcs[i].rstc);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (i--)
+		reset_control_deassert(rstcs[i].rstc);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reset_control_bulk_assert);
+
 /**
  * reset_control_deassert - deasserts the reset line
  * @rstc: reset controller
@@ -511,6 +565,36 @@ int reset_control_deassert(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_deassert);
 
+/**
+ * reset_control_bulk_deassert - deasserts the reset lines in reverse order
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset controls set
+ *
+ * Deassert the reset lines for all provided reset controls, in reverse order.
+ * If a deassertion fails, already deasserted resets are asserted again.
+ *
+ * See also: reset_control_deassert()
+ */
+int reset_control_bulk_deassert(int num_rstcs,
+				struct reset_control_bulk_data *rstcs)
+{
+	int ret, i;
+
+	for (i = num_rstcs - 1; i >= 0; i--) {
+		ret = reset_control_deassert(rstcs[i].rstc);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (i < num_rstcs)
+		reset_control_assert(rstcs[i++].rstc);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reset_control_bulk_deassert);
+
 /**
  * reset_control_status - returns a negative errno if not supported, a
  * positive value if the reset line is asserted, or zero if the reset
@@ -588,6 +672,36 @@ int reset_control_acquire(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_acquire);
 
+/**
+ * reset_control_bulk_acquire - acquires reset controls for exclusive use
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset controls set
+ *
+ * This is used to explicitly acquire reset controls requested with
+ * reset_control_bulk_get_exclusive_release() for temporary exclusive use.
+ *
+ * See also: reset_control_acquire(), reset_control_bulk_release()
+ */
+int reset_control_bulk_acquire(int num_rstcs,
+			       struct reset_control_bulk_data *rstcs)
+{
+	int ret, i;
+
+	for (i = 0; i < num_rstcs; i++) {
+		ret = reset_control_acquire(rstcs[i].rstc);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (i--)
+		reset_control_release(rstcs[i].rstc);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reset_control_bulk_acquire);
+
 /**
  * reset_control_release() - releases exclusive access to a reset control
  * @rstc: reset control
@@ -610,6 +724,26 @@ void reset_control_release(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_release);
 
+/**
+ * reset_control_bulk_release() - releases exclusive access to reset controls
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset controls set
+ *
+ * Releases exclusive access right to reset controls previously obtained by a
+ * call to reset_control_bulk_acquire().
+ *
+ * See also: reset_control_release(), reset_control_bulk_acquire()
+ */
+void reset_control_bulk_release(int num_rstcs,
+				struct reset_control_bulk_data *rstcs)
+{
+	int i;
+
+	for (i = 0; i < num_rstcs; i++)
+		reset_control_release(rstcs[i].rstc);
+}
+EXPORT_SYMBOL_GPL(reset_control_bulk_release);
+
 static struct reset_control *__reset_control_get_internal(
 				struct reset_controller_dev *rcdev,
 				unsigned int index, bool shared, bool acquired)
@@ -814,6 +948,32 @@ struct reset_control *__reset_control_get(struct device *dev, const char *id,
 }
 EXPORT_SYMBOL_GPL(__reset_control_get);
 
+int __reset_control_bulk_get(struct device *dev, int num_rstcs,
+			     struct reset_control_bulk_data *rstcs,
+			     bool shared, bool optional, bool acquired)
+{
+	int ret, i;
+
+	for (i = 0; i < num_rstcs; i++) {
+		rstcs[i].rstc = __reset_control_get(dev, rstcs[i].id, 0,
+						    shared, optional, acquired);
+		if (IS_ERR(rstcs[i].rstc)) {
+			ret = PTR_ERR(rstcs[i].rstc);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	mutex_lock(&reset_list_mutex);
+	while (i--)
+		__reset_control_put_internal(rstcs[i].rstc);
+	mutex_unlock(&reset_list_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(__reset_control_bulk_get);
+
 static void reset_control_array_put(struct reset_control_array *resets)
 {
 	int i;
@@ -845,6 +1005,23 @@ void reset_control_put(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_put);
 
+/**
+ * reset_control_bulk_put - free the reset controllers
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset controls set
+ */
+void reset_control_bulk_put(int num_rstcs, struct reset_control_bulk_data *rstcs)
+{
+	mutex_lock(&reset_list_mutex);
+	while (num_rstcs--) {
+		if (IS_ERR_OR_NULL(rstcs[num_rstcs].rstc))
+			continue;
+		__reset_control_put_internal(rstcs[num_rstcs].rstc);
+	}
+	mutex_unlock(&reset_list_mutex);
+}
+EXPORT_SYMBOL_GPL(reset_control_bulk_put);
+
 static void devm_reset_control_release(struct device *dev, void *res)
 {
 	reset_control_put(*(struct reset_control **)res);
@@ -874,6 +1051,44 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(__devm_reset_control_get);
 
+struct reset_control_bulk_devres {
+	int num_rstcs;
+	struct reset_control_bulk_data *rstcs;
+};
+
+static void devm_reset_control_bulk_release(struct device *dev, void *res)
+{
+	struct reset_control_bulk_devres *devres = res;
+
+	reset_control_bulk_put(devres->num_rstcs, devres->rstcs);
+}
+
+int __devm_reset_control_bulk_get(struct device *dev, int num_rstcs,
+				  struct reset_control_bulk_data *rstcs,
+				  bool shared, bool optional, bool acquired)
+{
+	struct reset_control_bulk_devres *ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_reset_control_bulk_release, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = __reset_control_bulk_get(dev, num_rstcs, rstcs, shared, optional, acquired);
+	if (ret < 0) {
+		devres_free(ptr);
+		return ret;
+	}
+
+	ptr->num_rstcs = num_rstcs;
+	ptr->rstcs = rstcs;
+	devres_add(dev, ptr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__devm_reset_control_bulk_get);
+
 /**
  * __device_reset - find reset controller associated with the device
  *                  and perform reset
diff --git a/include/linux/reset.h b/include/linux/reset.h
index b9109efa2a5c..6a12c666e499 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -10,6 +10,21 @@ struct device;
 struct device_node;
 struct reset_control;
 
+/**
+ * struct reset_control_bulk_data - Data used for bulk reset control operations.
+ *
+ * @id: reset control consumer ID
+ * @rstc: struct reset_control * to store the associated reset control
+ *
+ * The reset APIs provide a series of reset_control_bulk_*() API calls as
+ * a convenience to consumers which require multiple reset controls.
+ * This structure is used to manage data for these calls.
+ */
+struct reset_control_bulk_data {
+	const char			*id;
+	struct reset_control		*rstc;
+};
+
 #ifdef CONFIG_RESET_CONTROLLER
 
 int reset_control_reset(struct reset_control *rstc);
@@ -20,17 +35,29 @@ int reset_control_status(struct reset_control *rstc);
 int reset_control_acquire(struct reset_control *rstc);
 void reset_control_release(struct reset_control *rstc);
 
+int reset_control_bulk_reset(int num_rstcs, struct reset_control_bulk_data *rstcs);
+int reset_control_bulk_assert(int num_rstcs, struct reset_control_bulk_data *rstcs);
+int reset_control_bulk_deassert(int num_rstcs, struct reset_control_bulk_data *rstcs);
+int reset_control_bulk_acquire(int num_rstcs, struct reset_control_bulk_data *rstcs);
+void reset_control_bulk_release(int num_rstcs, struct reset_control_bulk_data *rstcs);
+
 struct reset_control *__of_reset_control_get(struct device_node *node,
 				     const char *id, int index, bool shared,
 				     bool optional, bool acquired);
 struct reset_control *__reset_control_get(struct device *dev, const char *id,
 					  int index, bool shared,
 					  bool optional, bool acquired);
+int __reset_control_bulk_get(struct device *dev, int num_rstcs,
+			     struct reset_control_bulk_data *rstcs,
+			     bool shared, bool optional, bool acquired);
 void reset_control_put(struct reset_control *rstc);
 int __device_reset(struct device *dev, bool optional);
 struct reset_control *__devm_reset_control_get(struct device *dev,
 				     const char *id, int index, bool shared,
 				     bool optional, bool acquired);
+int __devm_reset_control_bulk_get(struct device *dev, int num_rstcs,
+				  struct reset_control_bulk_data *rstcs,
+				  bool shared, bool optional, bool acquired);
 
 struct reset_control *devm_reset_control_array_get(struct device *dev,
 						   bool shared, bool optional);
@@ -71,6 +98,35 @@ static inline void reset_control_release(struct reset_control *rstc)
 {
 }
 
+static inline int
+reset_control_bulk_reset(int num_rstcs, struct reset_control_bulk_data *rstcs)
+{
+	return 0;
+}
+
+static inline int
+reset_control_bulk_assert(int num_rstcs, struct reset_control_bulk_data *rstcs)
+{
+	return 0;
+}
+
+static inline int
+reset_control_bulk_deassert(int num_rstcs, struct reset_control_bulk_data *rstcs)
+{
+	return 0;
+}
+
+static inline int
+reset_control_bulk_acquire(int num_rstcs, struct reset_control_bulk_data *rstcs)
+{
+	return 0;
+}
+
+static inline void
+reset_control_bulk_release(int num_rstcs, struct reset_control_bulk_data *rstcs)
+{
+}
+
 static inline void reset_control_put(struct reset_control *rstc)
 {
 }
@@ -96,6 +152,14 @@ static inline struct reset_control *__reset_control_get(
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
 
+static inline int
+__reset_control_bulk_get(struct device *dev, int num_rstcs,
+			 struct reset_control_bulk_data *rstcs,
+			 bool shared, bool optional, bool acquired)
+{
+	return optional ? 0 : -EOPNOTSUPP;
+}
+
 static inline struct reset_control *__devm_reset_control_get(
 					struct device *dev, const char *id,
 					int index, bool shared, bool optional,
@@ -104,6 +168,14 @@ static inline struct reset_control *__devm_reset_control_get(
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
 
+static inline int
+__devm_reset_control_bulk_get(struct device *dev, int num_rstcs,
+			      struct reset_control_bulk_data *rstcs,
+			      bool shared, bool optional, bool acquired)
+{
+	return optional ? 0 : -EOPNOTSUPP;
+}
+
 static inline struct reset_control *
 devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
 {
@@ -155,6 +227,23 @@ __must_check reset_control_get_exclusive(struct device *dev, const char *id)
 	return __reset_control_get(dev, id, 0, false, false, true);
 }
 
+/**
+ * reset_control_bulk_get_exclusive - Lookup and obtain exclusive references to
+ *                                    multiple reset controllers.
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Fills the rstcs array with pointers to exclusive reset controls and
+ * returns 0, or an IS_ERR() condition containing errno.
+ */
+static inline int __must_check
+reset_control_bulk_get_exclusive(struct device *dev, int num_rstcs,
+				 struct reset_control_bulk_data *rstcs)
+{
+	return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
+}
+
 /**
  * reset_control_get_exclusive_released - Lookup and obtain a temoprarily
  *                                        exclusive reference to a reset
@@ -176,6 +265,48 @@ __must_check reset_control_get_exclusive_released(struct device *dev,
 	return __reset_control_get(dev, id, 0, false, false, false);
 }
 
+/**
+ * reset_control_bulk_get_exclusive_released - Lookup and obtain temporarily
+ *                                    exclusive references to multiple reset
+ *                                    controllers.
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Fills the rstcs array with pointers to exclusive reset controls and
+ * returns 0, or an IS_ERR() condition containing errno.
+ * reset-controls returned by this function must be acquired via
+ * reset_control_bulk_acquire() before they can be used and should be released
+ * via reset_control_bulk_release() afterwards.
+ */
+static inline int __must_check
+reset_control_bulk_get_exclusive_released(struct device *dev, int num_rstcs,
+					  struct reset_control_bulk_data *rstcs)
+{
+	return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, false);
+}
+
+/**
+ * reset_control_bulk_get_optional_exclusive_released - Lookup and obtain optional
+ *                                    temporarily exclusive references to multiple
+ *                                    reset controllers.
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Optional variant of reset_control_bulk_get_exclusive_released(). If the
+ * requested reset is not specified in the device tree, this function returns 0
+ * instead of an error and missing rtsc is set to NULL.
+ *
+ * See reset_control_bulk_get_exclusive_released() for more information.
+ */
+static inline int __must_check
+reset_control_bulk_get_optional_exclusive_released(struct device *dev, int num_rstcs,
+						   struct reset_control_bulk_data *rstcs)
+{
+	return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, false);
+}
+
 /**
  * reset_control_get_shared - Lookup and obtain a shared reference to a
  *                            reset controller.
@@ -204,6 +335,23 @@ static inline struct reset_control *reset_control_get_shared(
 	return __reset_control_get(dev, id, 0, true, false, false);
 }
 
+/**
+ * reset_control_bulk_get_shared - Lookup and obtain shared references to
+ *                                 multiple reset controllers.
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Fills the rstcs array with pointers to shared reset controls and
+ * returns 0, or an IS_ERR() condition containing errno.
+ */
+static inline int __must_check
+reset_control_bulk_get_shared(struct device *dev, int num_rstcs,
+			      struct reset_control_bulk_data *rstcs)
+{
+	return __reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, false);
+}
+
 /**
  * reset_control_get_optional_exclusive - optional reset_control_get_exclusive()
  * @dev: device to be reset by the controller
@@ -221,6 +369,26 @@ static inline struct reset_control *reset_control_get_optional_exclusive(
 	return __reset_control_get(dev, id, 0, false, true, true);
 }
 
+/**
+ * reset_control_bulk_get_optional_exclusive - optional
+ *                                             reset_control_bulk_get_exclusive()
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Optional variant of reset_control_bulk_get_exclusive(). If any of the
+ * requested resets are not specified in the device tree, this function sets
+ * them to NULL instead of returning an error.
+ *
+ * See reset_control_bulk_get_exclusive() for more information.
+ */
+static inline int __must_check
+reset_control_bulk_get_optional_exclusive(struct device *dev, int num_rstcs,
+					  struct reset_control_bulk_data *rstcs)
+{
+	return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, true);
+}
+
 /**
  * reset_control_get_optional_shared - optional reset_control_get_shared()
  * @dev: device to be reset by the controller
@@ -238,6 +406,26 @@ static inline struct reset_control *reset_control_get_optional_shared(
 	return __reset_control_get(dev, id, 0, true, true, false);
 }
 
+/**
+ * reset_control_bulk_get_optional_shared - optional
+ *                                             reset_control_bulk_get_shared()
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Optional variant of reset_control_bulk_get_shared(). If the requested resets
+ * are not specified in the device tree, this function sets them to NULL
+ * instead of returning an error.
+ *
+ * See reset_control_bulk_get_shared() for more information.
+ */
+static inline int __must_check
+reset_control_bulk_get_optional_shared(struct device *dev, int num_rstcs,
+				       struct reset_control_bulk_data *rstcs)
+{
+	return __reset_control_bulk_get(dev, num_rstcs, rstcs, true, true, false);
+}
+
 /**
  * of_reset_control_get_exclusive - Lookup and obtain an exclusive reference
  *                                  to a reset controller.
@@ -343,6 +531,26 @@ __must_check devm_reset_control_get_exclusive(struct device *dev,
 	return __devm_reset_control_get(dev, id, 0, false, false, true);
 }
 
+/**
+ * devm_reset_control_bulk_get_exclusive - resource managed
+ *                                         reset_control_bulk_get_exclusive()
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Managed reset_control_bulk_get_exclusive(). For reset controllers returned
+ * from this function, reset_control_put() is called automatically on driver
+ * detach.
+ *
+ * See reset_control_bulk_get_exclusive() for more information.
+ */
+static inline int __must_check
+devm_reset_control_bulk_get_exclusive(struct device *dev, int num_rstcs,
+				      struct reset_control_bulk_data *rstcs)
+{
+	return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
+}
+
 /**
  * devm_reset_control_get_exclusive_released - resource managed
  *                                             reset_control_get_exclusive_released()
@@ -362,6 +570,26 @@ __must_check devm_reset_control_get_exclusive_released(struct device *dev,
 	return __devm_reset_control_get(dev, id, 0, false, false, false);
 }
 
+/**
+ * devm_reset_control_bulk_get_exclusive_released - resource managed
+ *                                                  reset_control_bulk_get_exclusive_released()
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Managed reset_control_bulk_get_exclusive_released(). For reset controllers
+ * returned from this function, reset_control_put() is called automatically on
+ * driver detach.
+ *
+ * See reset_control_bulk_get_exclusive_released() for more information.
+ */
+static inline int __must_check
+devm_reset_control_bulk_get_exclusive_released(struct device *dev, int num_rstcs,
+					       struct reset_control_bulk_data *rstcs)
+{
+	return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, false);
+}
+
 /**
  * devm_reset_control_get_optional_exclusive_released - resource managed
  *                                                      reset_control_get_optional_exclusive_released()
@@ -381,6 +609,26 @@ __must_check devm_reset_control_get_optional_exclusive_released(struct device *d
 	return __devm_reset_control_get(dev, id, 0, false, true, false);
 }
 
+/**
+ * devm_reset_control_bulk_get_optional_exclusive_released - resource managed
+ *                                                           reset_control_bulk_optional_get_exclusive_released()
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Managed reset_control_bulk_optional_get_exclusive_released(). For reset
+ * controllers returned from this function, reset_control_put() is called
+ * automatically on driver detach.
+ *
+ * See reset_control_bulk_optional_get_exclusive_released() for more information.
+ */
+static inline int __must_check
+devm_reset_control_bulk_get_optional_exclusive_released(struct device *dev, int num_rstcs,
+							struct reset_control_bulk_data *rstcs)
+{
+	return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, false);
+}
+
 /**
  * devm_reset_control_get_shared - resource managed reset_control_get_shared()
  * @dev: device to be reset by the controller
@@ -396,6 +644,26 @@ static inline struct reset_control *devm_reset_control_get_shared(
 	return __devm_reset_control_get(dev, id, 0, true, false, false);
 }
 
+/**
+ * devm_reset_control_bulk_get_shared - resource managed
+ *                                      reset_control_bulk_get_shared()
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Managed reset_control_bulk_get_shared(). For reset controllers returned
+ * from this function, reset_control_put() is called automatically on driver
+ * detach.
+ *
+ * See reset_control_bulk_get_shared() for more information.
+ */
+static inline int __must_check
+devm_reset_control_bulk_get_shared(struct device *dev, int num_rstcs,
+				   struct reset_control_bulk_data *rstcs)
+{
+	return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, false);
+}
+
 /**
  * devm_reset_control_get_optional_exclusive - resource managed
  *                                             reset_control_get_optional_exclusive()
@@ -414,6 +682,26 @@ static inline struct reset_control *devm_reset_control_get_optional_exclusive(
 	return __devm_reset_control_get(dev, id, 0, false, true, true);
 }
 
+/**
+ * devm_reset_control_bulk_get_optional_exclusive - resource managed
+ *                                                  reset_control_bulk_get_optional_exclusive()
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Managed reset_control_bulk_get_optional_exclusive(). For reset controllers
+ * returned from this function, reset_control_put() is called automatically on
+ * driver detach.
+ *
+ * See reset_control_bulk_get_optional_exclusive() for more information.
+ */
+static inline int __must_check
+devm_reset_control_bulk_get_optional_exclusive(struct device *dev, int num_rstcs,
+					       struct reset_control_bulk_data *rstcs)
+{
+	return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, true);
+}
+
 /**
  * devm_reset_control_get_optional_shared - resource managed
  *                                          reset_control_get_optional_shared()
@@ -432,6 +720,26 @@ static inline struct reset_control *devm_reset_control_get_optional_shared(
 	return __devm_reset_control_get(dev, id, 0, true, true, false);
 }
 
+/**
+ * devm_reset_control_bulk_get_optional_shared - resource managed
+ *                                               reset_control_bulk_get_optional_shared()
+ * @dev: device to be reset by the controller
+ * @num_rstcs: number of entries in rstcs array
+ * @rstcs: array of struct reset_control_bulk_data with reset line names set
+ *
+ * Managed reset_control_bulk_get_optional_shared(). For reset controllers
+ * returned from this function, reset_control_put() is called automatically on
+ * driver detach.
+ *
+ * See reset_control_bulk_get_optional_shared() for more information.
+ */
+static inline int __must_check
+devm_reset_control_bulk_get_optional_shared(struct device *dev, int num_rstcs,
+					    struct reset_control_bulk_data *rstcs)
+{
+	return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, true, false);
+}
+
 /**
  * devm_reset_control_get_exclusive_by_index - resource managed
  *                                             reset_control_get_exclusive()
-- 
2.29.2

