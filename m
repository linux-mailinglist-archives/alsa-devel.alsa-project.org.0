Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811727B1488
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 09:16:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCD011DF;
	Thu, 28 Sep 2023 09:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCD011DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695885415;
	bh=f+0vZ6TEtJ/nuBSo05pxDGCVDlKHkqMS7OWeCmOQl4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jZvGhuxEjdM9qDnHeYV84whBIMCZKRgTamM7lK0+eMpen64b0dMbZu5pK4UHgEECB
	 sHKzOW7OAg+JHf7O2iKJJGyUvidSPmxjvvKuRFT2gE2IeAx1FaOw2vl41W+6G/18gf
	 9+kjNN6o+hFU39eXPtY5HKGHY0M4upN9BtA4cP9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B92AF805C6; Thu, 28 Sep 2023 09:10:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21CB0F805A0;
	Thu, 28 Sep 2023 09:10:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 288F0F805A0; Thu, 28 Sep 2023 09:10:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCA6DF8057E
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 09:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA6DF8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KE/1CjxR
Received: by mail.gandi.net (Postfix) with ESMTPA id E074E20005;
	Thu, 28 Sep 2023 07:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695884912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1q4WS546KV+ClwUJxhBxpWXvfuOrtZpmbnCfB5Ik2qg=;
	b=KE/1CjxR/4rxy6sag2w32XtkiThK6qZOCozoS8u9HWYSXPGDxRlieHP7AY5ajx1aX3Hsv9
	S6pOHhwoUGdx2hWigHgaxa6RCLnSi4zM8QfjLT5BZwAvKbCVH5BsGECcIQsmEDHg1nsBzU
	NPMJXyCxkmZAEljdg4DyRYv0uxlr32jxOlLKAZrj7c0bwDUgvDHJdtrWphKoUKx095z9L1
	giU6txx3NcbtkB7CwO/mnLK0d8BnJvyvwyVJPyIe3eSzkn5D+9dS6XWvmJoKgt74l+iR2O
	4LFtBaIePdkR/XSo0W+eu1R+6xl+qIaa7ovQn+HrguAsATywuiGcmJoYyMWvPQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v7 24/30] net: wan: Add framer framework support
Date: Thu, 28 Sep 2023 09:06:42 +0200
Message-ID: <20230928070652.330429-25-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928070652.330429-1-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: KDOVVJGKPYCIJK3PYFX6P2OMEH6IQ3ET
X-Message-ID-Hash: KDOVVJGKPYCIJK3PYFX6P2OMEH6IQ3ET
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDOVVJGKPYCIJK3PYFX6P2OMEH6IQ3ET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A framer is a component in charge of an E1/T1 line interface.
Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
frames. It also provides information related to the E1/T1 line.

The framer framework provides a set of APIs for the framer drivers
(framer provider) to create/destroy a framer and APIs for the framer
users (framer consumer) to obtain a reference to the framer, and
use the framer.

This basic implementation provides a framer abstraction for:
 - power on/off the framer
 - get the framer status (line state)
 - be notified on framer status changes
 - get/set the framer configuration

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/net/wan/Kconfig                |   2 +
 drivers/net/wan/Makefile               |   2 +
 drivers/net/wan/framer/Kconfig         |  23 +
 drivers/net/wan/framer/Makefile        |   6 +
 drivers/net/wan/framer/framer-core.c   | 887 +++++++++++++++++++++++++
 include/linux/framer/framer-provider.h | 194 ++++++
 include/linux/framer/framer.h          | 205 ++++++
 7 files changed, 1319 insertions(+)
 create mode 100644 drivers/net/wan/framer/Kconfig
 create mode 100644 drivers/net/wan/framer/Makefile
 create mode 100644 drivers/net/wan/framer/framer-core.c
 create mode 100644 include/linux/framer/framer-provider.h
 create mode 100644 include/linux/framer/framer.h

diff --git a/drivers/net/wan/Kconfig b/drivers/net/wan/Kconfig
index 8de99f4b647b..31ab2136cdf1 100644
--- a/drivers/net/wan/Kconfig
+++ b/drivers/net/wan/Kconfig
@@ -95,6 +95,8 @@ config HDLC_X25
 comment "X.25/LAPB support is disabled"
 	depends on HDLC && (LAPB!=m || HDLC!=m) && LAPB!=y
 
+source "drivers/net/wan/framer/Kconfig"
+
 config PCI200SYN
 	tristate "Goramo PCI200SYN support"
 	depends on HDLC && PCI
diff --git a/drivers/net/wan/Makefile b/drivers/net/wan/Makefile
index f338f4830626..00e9b7ee1e01 100644
--- a/drivers/net/wan/Makefile
+++ b/drivers/net/wan/Makefile
@@ -14,6 +14,8 @@ obj-$(CONFIG_HDLC_FR)		+= hdlc_fr.o
 obj-$(CONFIG_HDLC_PPP)		+= hdlc_ppp.o
 obj-$(CONFIG_HDLC_X25)		+= hdlc_x25.o
 
+obj-y				+= framer/
+
 obj-$(CONFIG_FARSYNC)		+= farsync.o
 
 obj-$(CONFIG_LAPBETHER)		+= lapbether.o
diff --git a/drivers/net/wan/framer/Kconfig b/drivers/net/wan/framer/Kconfig
new file mode 100644
index 000000000000..37df9a96ab42
--- /dev/null
+++ b/drivers/net/wan/framer/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# FRAMER
+#
+
+menu "Framer Subsystem"
+
+config GENERIC_FRAMER
+	bool "Framer Core"
+	help
+	  Generic Framer support.
+	  A framer is a component in charge of an E1/T1 line interface.
+	  Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
+	  frames. It also provides information related to the E1/T1 line.
+	  Used with HDLC, the network can be reached through the E1/T1 line.
+
+	  This framework is designed to provide a generic interface for framer
+	  devices present in the kernel. This layer will have the generic
+	  API by which framer drivers can create framer using the framer
+	  framework and framer users can obtain reference to the framer.
+	  All the users of this framework should select this config.
+
+endmenu
diff --git a/drivers/net/wan/framer/Makefile b/drivers/net/wan/framer/Makefile
new file mode 100644
index 000000000000..78dbd8e563d0
--- /dev/null
+++ b/drivers/net/wan/framer/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the framer drivers.
+#
+
+obj-$(CONFIG_GENERIC_FRAMER)			+= framer-core.o
diff --git a/drivers/net/wan/framer/framer-core.c b/drivers/net/wan/framer/framer-core.c
new file mode 100644
index 000000000000..a8f34ba993e4
--- /dev/null
+++ b/drivers/net/wan/framer/framer-core.c
@@ -0,0 +1,887 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Generic Framer framework.
+ *
+ * Copyright 2023 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/device.h>
+#include <linux/framer/framer.h>
+#include <linux/framer/framer-provider.h>
+#include <linux/idr.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+static struct class *framer_class;
+static DEFINE_MUTEX(framer_provider_mutex);
+static LIST_HEAD(framer_provider_list);
+static DEFINE_IDA(framer_ida);
+
+#define dev_to_framer(a)	(container_of((a), struct framer, dev))
+
+int framer_pm_runtime_get(struct framer *framer)
+{
+	int ret;
+
+	if (!pm_runtime_enabled(&framer->dev))
+		return -EOPNOTSUPP;
+
+	ret = pm_runtime_get(&framer->dev);
+	if (ret < 0 && ret != -EINPROGRESS)
+		pm_runtime_put_noidle(&framer->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(framer_pm_runtime_get);
+
+int framer_pm_runtime_get_sync(struct framer *framer)
+{
+	int ret;
+
+	if (!pm_runtime_enabled(&framer->dev))
+		return -EOPNOTSUPP;
+
+	ret = pm_runtime_get_sync(&framer->dev);
+	if (ret < 0)
+		pm_runtime_put_sync(&framer->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(framer_pm_runtime_get_sync);
+
+int framer_pm_runtime_put(struct framer *framer)
+{
+	if (!pm_runtime_enabled(&framer->dev))
+		return -EOPNOTSUPP;
+
+	return pm_runtime_put(&framer->dev);
+}
+EXPORT_SYMBOL_GPL(framer_pm_runtime_put);
+
+int framer_pm_runtime_put_sync(struct framer *framer)
+{
+	if (!pm_runtime_enabled(&framer->dev))
+		return -EOPNOTSUPP;
+
+	return pm_runtime_put_sync(&framer->dev);
+}
+EXPORT_SYMBOL_GPL(framer_pm_runtime_put_sync);
+
+/**
+ * framer_init - framer internal initialization before framer operation
+ * @framer: the framer returned by framer_get()
+ *
+ * Used to allow framer's driver to perform framer internal initialization,
+ * such as PLL block powering, clock initialization or anything that's
+ * is required by the framer to perform the start of operation.
+ * Must be called before framer_power_on().
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int framer_init(struct framer *framer)
+{
+	bool start_polling = false;
+	int ret;
+
+	ret = framer_pm_runtime_get_sync(framer);
+	if (ret < 0 && ret != -EOPNOTSUPP)
+		return ret;
+	ret = 0; /* Override possible ret == -EOPNOTSUPP */
+
+	mutex_lock(&framer->mutex);
+	if (framer->power_count > framer->init_count)
+		dev_warn(&framer->dev, "framer_power_on was called before framer init\n");
+
+	if (framer->init_count == 0) {
+		if (framer->ops->init) {
+			ret = framer->ops->init(framer);
+			if (ret < 0) {
+				dev_err(&framer->dev, "framer init failed --> %d\n", ret);
+				goto out;
+			}
+		}
+		if (framer->ops->flags & FRAMER_FLAG_POLL_STATUS)
+			start_polling = true;
+	}
+	++framer->init_count;
+
+out:
+	mutex_unlock(&framer->mutex);
+
+	if (!ret && start_polling) {
+		ret = framer_get_status(framer, &framer->prev_status);
+		if (ret < 0) {
+			dev_warn(&framer->dev, "framer get status failed --> %d\n", ret);
+			/* Will be retried on polling_work */
+			ret = 0;
+		}
+		queue_delayed_work(system_power_efficient_wq, &framer->polling_work, 1 * HZ);
+	}
+
+	framer_pm_runtime_put(framer);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(framer_init);
+
+/**
+ * framer_exit - Framer internal un-initialization
+ * @framer: the framer returned by framer_get()
+ *
+ * Must be called after framer_power_off().
+ */
+int framer_exit(struct framer *framer)
+{
+	int ret;
+
+	ret = framer_pm_runtime_get_sync(framer);
+	if (ret < 0 && ret != -EOPNOTSUPP)
+		return ret;
+	ret = 0; /* Override possible ret == -EOPNOTSUPP */
+
+	mutex_lock(&framer->mutex);
+	--framer->init_count;
+	if (framer->init_count == 0) {
+		if (framer->ops->flags & FRAMER_FLAG_POLL_STATUS) {
+			mutex_unlock(&framer->mutex);
+			cancel_delayed_work_sync(&framer->polling_work);
+			mutex_lock(&framer->mutex);
+		}
+
+		if (framer->ops->exit)
+			framer->ops->exit(framer);
+	}
+
+	mutex_unlock(&framer->mutex);
+	framer_pm_runtime_put(framer);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(framer_exit);
+
+/**
+ * framer_power_on - Enable the framer and enter proper operation
+ * @framer: the framer returned by framer_get()
+ *
+ * Must be called after framer_init().
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int framer_power_on(struct framer *framer)
+{
+	int ret;
+
+	if (framer->pwr) {
+		ret = regulator_enable(framer->pwr);
+		if (ret)
+			return ret;
+	}
+
+	ret = framer_pm_runtime_get_sync(framer);
+	if (ret < 0 && ret != -EOPNOTSUPP)
+		goto err_pm_sync;
+
+	ret = 0; /* Override possible ret == -EOPNOTSUPP */
+
+	mutex_lock(&framer->mutex);
+	if (framer->power_count == 0 && framer->ops->power_on) {
+		ret = framer->ops->power_on(framer);
+		if (ret < 0) {
+			dev_err(&framer->dev, "framer poweron failed --> %d\n", ret);
+			goto err_pwr_on;
+		}
+	}
+	++framer->power_count;
+	mutex_unlock(&framer->mutex);
+	return 0;
+
+err_pwr_on:
+	mutex_unlock(&framer->mutex);
+	framer_pm_runtime_put_sync(framer);
+err_pm_sync:
+	if (framer->pwr)
+		regulator_disable(framer->pwr);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(framer_power_on);
+
+/**
+ * framer_power_off - Disable the framer.
+ * @framer: the framer returned by framer_get()
+ *
+ * Must be called before framer_exit().
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int framer_power_off(struct framer *framer)
+{
+	int ret;
+
+	mutex_lock(&framer->mutex);
+	if (framer->power_count == 1 && framer->ops->power_off) {
+		ret = framer->ops->power_off(framer);
+		if (ret < 0) {
+			dev_err(&framer->dev, "framer poweroff failed --> %d\n", ret);
+			mutex_unlock(&framer->mutex);
+			return ret;
+		}
+	}
+	--framer->power_count;
+	mutex_unlock(&framer->mutex);
+	framer_pm_runtime_put(framer);
+
+	if (framer->pwr)
+		regulator_disable(framer->pwr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(framer_power_off);
+
+/**
+ * framer_get_status() - Gets the framer status
+ * @framer: the framer returned by framer_get()
+ * @status: the status to retrieve
+ *
+ * Used to get the framer status. framer_init() must have been called
+ * on the framer.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int framer_get_status(struct framer *framer, struct framer_status *status)
+{
+	int ret;
+
+	if (!framer->ops->get_status)
+		return -EOPNOTSUPP;
+
+	/* Be sure to have known values (struct padding and future extensions) */
+	memset(status, 0, sizeof(*status));
+
+	mutex_lock(&framer->mutex);
+	ret = framer->ops->get_status(framer, status);
+	mutex_unlock(&framer->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(framer_get_status);
+
+/**
+ * framer_set_config() - Sets the framer configuration
+ * @framer: the framer returned by framer_get()
+ * @config: the configuration to set
+ *
+ * Used to set the framer configuration. framer_init() must have been called
+ * on the framer.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int framer_set_config(struct framer *framer, const struct framer_config *config)
+{
+	int ret;
+
+	if (!framer->ops->set_config)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&framer->mutex);
+	ret = framer->ops->set_config(framer, config);
+	mutex_unlock(&framer->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(framer_set_config);
+
+/**
+ * framer_get_config() - Gets the framer configuration
+ * @framer: the framer returned by framer_get()
+ * @config: the configuration to retrieve
+ *
+ * Used to get the framer configuration. framer_init() must have been called
+ * on the framer.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int framer_get_config(struct framer *framer, struct framer_config *config)
+{
+	int ret;
+
+	if (!framer->ops->get_config)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&framer->mutex);
+	ret = framer->ops->get_config(framer, config);
+	mutex_unlock(&framer->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(framer_get_config);
+
+static void framer_polling_work(struct work_struct *work)
+{
+	struct framer *framer = container_of(work, struct framer, polling_work.work);
+	struct framer_status status;
+	int ret;
+
+	ret = framer_get_status(framer, &status);
+	if (ret) {
+		dev_err(&framer->dev, "polling, get status failed (%d)\n", ret);
+		goto end;
+	}
+	if (memcmp(&framer->prev_status, &status, sizeof(status))) {
+		blocking_notifier_call_chain(&framer->notifier_list,
+					     FRAMER_EVENT_STATUS, NULL);
+		memcpy(&framer->prev_status, &status, sizeof(status));
+	}
+
+end:
+	/* Re-schedule task in 1 sec */
+	queue_delayed_work(system_power_efficient_wq, &framer->polling_work, 1 * HZ);
+}
+
+/**
+ * framer_notifier_register() - Registers a notifier
+ * @framer: the framer returned by framer_get()
+ * @nb: the notifier block to register
+ *
+ * Used to register a notifier block on framer events. framer_init() must have
+ * been called on the framer.
+ * The available framer events are present in enum framer_events.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int framer_notifier_register(struct framer *framer, struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&framer->notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(framer_notifier_register);
+
+/**
+ * framer_notifier_unregister() - Unregisters a notifier
+ * @framer: the framer returned by framer_get()
+ * @nb: the notifier block to unregister
+ *
+ * Used to unregister a notifier block. framer_init() must have
+ * been called on the framer.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int framer_notifier_unregister(struct framer *framer, struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&framer->notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(framer_notifier_unregister);
+
+static struct framer_provider *framer_provider_of_lookup(const struct device_node *node)
+{
+	struct framer_provider *framer_provider;
+
+	list_for_each_entry(framer_provider, &framer_provider_list, list) {
+		if (device_match_of_node(framer_provider->dev, node))
+			return framer_provider;
+	}
+
+	return ERR_PTR(-EPROBE_DEFER);
+}
+
+static struct framer *framer_of_get_from_provider(struct of_phandle_args *args)
+{
+	struct framer_provider *framer_provider;
+	struct framer *framer;
+
+	mutex_lock(&framer_provider_mutex);
+	framer_provider = framer_provider_of_lookup(args->np);
+	if (IS_ERR(framer_provider) || !try_module_get(framer_provider->owner)) {
+		framer = ERR_PTR(-EPROBE_DEFER);
+		goto end;
+	}
+
+	framer = framer_provider->of_xlate(framer_provider->dev, args);
+
+	module_put(framer_provider->owner);
+
+end:
+	mutex_unlock(&framer_provider_mutex);
+
+	return framer;
+}
+
+static struct framer *framer_of_get_byphandle(struct device_node *np, const char *propname,
+					      int index)
+{
+	struct of_phandle_args args;
+	struct framer *framer;
+	int ret;
+
+	ret = of_parse_phandle_with_optional_args(np, propname, "#framer-cells", index, &args);
+	if (ret)
+		return ERR_PTR(-ENODEV);
+
+	if (!of_device_is_available(args.np)) {
+		framer = ERR_PTR(-ENODEV);
+		goto out_node_put;
+	}
+
+	framer = framer_of_get_from_provider(&args);
+
+out_node_put:
+	of_node_put(args.np);
+
+	return framer;
+}
+
+static struct framer *framer_of_get_byparent(struct device_node *np, int index)
+{
+	struct of_phandle_args args;
+	struct framer *framer;
+
+	args.np = of_get_parent(np);
+	args.args_count = 1;
+	args.args[0] = index;
+
+	while (args.np) {
+		framer = framer_of_get_from_provider(&args);
+		if (IS_ERR(framer) && PTR_ERR(framer) != -EPROBE_DEFER) {
+			args.np = of_get_next_parent(args.np);
+			continue;
+		}
+		of_node_put(args.np);
+		return framer;
+	}
+
+	return ERR_PTR(-ENODEV);
+}
+
+/**
+ * framer_get() - lookup and obtain a reference to a framer.
+ * @dev: device that requests the framer
+ * @con_id: name of the framer from device's point of view
+ *
+ * Returns the framer driver, after getting a refcount to it; or
+ * -ENODEV if there is no such framer. The caller is responsible for
+ * calling framer_put() to release that count.
+ */
+struct framer *framer_get(struct device *dev, const char *con_id)
+{
+	struct framer *framer = ERR_PTR(-ENODEV);
+	struct device_link *link;
+	int ret;
+
+	if (dev->of_node) {
+		if (con_id)
+			framer = framer_of_get_byphandle(dev->of_node, con_id, 0);
+		else
+			framer = framer_of_get_byparent(dev->of_node, 0);
+	}
+
+	if (IS_ERR(framer))
+		return framer;
+
+	get_device(&framer->dev);
+
+	if (!try_module_get(framer->ops->owner)) {
+		ret = -EPROBE_DEFER;
+		goto err_put_device;
+	}
+
+	link = device_link_add(dev, &framer->dev, DL_FLAG_STATELESS);
+	if (!link) {
+		dev_err(dev, "failed to create device_link to %s\n", dev_name(&framer->dev));
+		ret = -EPROBE_DEFER;
+		goto err_module_put;
+	}
+
+	return framer;
+
+err_module_put:
+	module_put(framer->ops->owner);
+err_put_device:
+	put_device(&framer->dev);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(framer_get);
+
+/**
+ * framer_put() - release the framer
+ * @dev: device that wants to release this framer
+ * @framer: the framer returned by framer_get()
+ *
+ * Releases a refcount the caller received from framer_get().
+ */
+void framer_put(struct device *dev, struct framer *framer)
+{
+	device_link_remove(dev, &framer->dev);
+
+	module_put(framer->ops->owner);
+	put_device(&framer->dev);
+}
+EXPORT_SYMBOL_GPL(framer_put);
+
+static void devm_framer_put(struct device *dev, void *res)
+{
+	struct framer *framer = *(struct framer **)res;
+
+	framer_put(dev, framer);
+}
+
+/**
+ * devm_framer_get() - lookup and obtain a reference to a framer.
+ * @dev: device that requests this framer
+ * @con_id: name of the framer from device's point of view
+ *
+ * Gets the framer using framer_get(), and associates a device with it using
+ * devres. On driver detach, framer_put() function is invoked on the devres
+ * data, then, devres data is freed.
+ */
+struct framer *devm_framer_get(struct device *dev, const char *con_id)
+{
+	struct framer **ptr, *framer;
+
+	ptr = devres_alloc(devm_framer_put, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	framer = framer_get(dev, con_id);
+	if (!IS_ERR(framer)) {
+		*ptr = framer;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+		return framer;
+	}
+
+	return framer;
+}
+EXPORT_SYMBOL_GPL(devm_framer_get);
+
+/**
+ * devm_framer_optional_get() - lookup and obtain a reference to an optional
+ * framer.
+ * @dev: device that requests this framer
+ * @con_id: name of the framer from device's point of view
+ *
+ * Same as devm_framer_get() except that if the framer does not exist, it is not
+ * considered an error and -ENODEV will not be returned. Instead the NULL framer
+ * is returned.
+ */
+struct framer *devm_framer_optional_get(struct device *dev, const char *con_id)
+{
+	struct framer *framer = devm_framer_get(dev, con_id);
+
+	if (PTR_ERR(framer) == -ENODEV)
+		framer = NULL;
+
+	return framer;
+}
+EXPORT_SYMBOL_GPL(devm_framer_optional_get);
+
+static void framer_notify_status_work(struct work_struct *work)
+{
+	struct framer *framer = container_of(work, struct framer, notify_status_work);
+
+	blocking_notifier_call_chain(&framer->notifier_list, FRAMER_EVENT_STATUS, NULL);
+}
+
+void framer_notify_status_change(struct framer *framer)
+{
+	/* Can be called from atomic context -> just schedule a task to call
+	 * blocking notifiers
+	 */
+	queue_work(system_power_efficient_wq, &framer->notify_status_work);
+}
+EXPORT_SYMBOL_GPL(framer_notify_status_change);
+
+/**
+ * framer_create() - create a new framer
+ * @dev: device that is creating the new framer
+ * @node: device node of the framer. default to dev->of_node.
+ * @ops: function pointers for performing framer operations
+ *
+ * Called to create a framer using framer framework.
+ */
+struct framer *framer_create(struct device *dev, struct device_node *node,
+			     const struct framer_ops *ops)
+{
+	struct framer *framer;
+	int ret;
+	int id;
+
+	if (WARN_ON(!dev))
+		return ERR_PTR(-EINVAL);
+
+	/* get_status() is mandatory if the provider ask for polling status */
+	if (WARN_ON((ops->flags & FRAMER_FLAG_POLL_STATUS) && !ops->get_status))
+		return ERR_PTR(-EINVAL);
+
+	framer = kzalloc(sizeof(*framer), GFP_KERNEL);
+	if (!framer)
+		return ERR_PTR(-ENOMEM);
+
+	id = ida_alloc(&framer_ida, GFP_KERNEL);
+	if (id < 0) {
+		dev_err(dev, "unable to get id\n");
+		ret = id;
+		goto free_framer;
+	}
+
+	device_initialize(&framer->dev);
+	mutex_init(&framer->mutex);
+	INIT_WORK(&framer->notify_status_work, framer_notify_status_work);
+	INIT_DELAYED_WORK(&framer->polling_work, framer_polling_work);
+	BLOCKING_INIT_NOTIFIER_HEAD(&framer->notifier_list);
+
+	framer->dev.class = framer_class;
+	framer->dev.parent = dev;
+	framer->dev.of_node = node ? node : dev->of_node;
+	framer->id = id;
+	framer->ops = ops;
+
+	ret = dev_set_name(&framer->dev, "framer-%s.%d", dev_name(dev), id);
+	if (ret)
+		goto put_dev;
+
+	/* framer-supply */
+	framer->pwr = regulator_get_optional(&framer->dev, "framer");
+	if (IS_ERR(framer->pwr)) {
+		ret = PTR_ERR(framer->pwr);
+		if (ret == -EPROBE_DEFER)
+			goto put_dev;
+
+		framer->pwr = NULL;
+	}
+
+	ret = device_add(&framer->dev);
+	if (ret)
+		goto put_dev;
+
+	if (pm_runtime_enabled(dev)) {
+		pm_runtime_enable(&framer->dev);
+		pm_runtime_no_callbacks(&framer->dev);
+	}
+
+	return framer;
+
+put_dev:
+	put_device(&framer->dev);  /* calls framer_release() which frees resources */
+	return ERR_PTR(ret);
+
+free_framer:
+	kfree(framer);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(framer_create);
+
+/**
+ * framer_destroy() - destroy the framer
+ * @framer: the framer to be destroyed
+ *
+ * Called to destroy the framer.
+ */
+void framer_destroy(struct framer *framer)
+{
+	/* polling_work should already be stopped but if framer_exit() was not
+	 * called (bug), here it's the last time to do that ...
+	 */
+	cancel_delayed_work_sync(&framer->polling_work);
+	cancel_work_sync(&framer->notify_status_work);
+	pm_runtime_disable(&framer->dev);
+	device_unregister(&framer->dev); /* calls framer_release() which frees resources */
+}
+EXPORT_SYMBOL_GPL(framer_destroy);
+
+static void devm_framer_destroy(struct device *dev, void *res)
+{
+	struct framer *framer = *(struct framer **)res;
+
+	framer_destroy(framer);
+}
+
+/**
+ * devm_framer_create() - create a new framer
+ * @dev: device that is creating the new framer
+ * @node: device node of the framer
+ * @ops: function pointers for performing framer operations
+ *
+ * Creates a new framer device adding it to the framer class.
+ * While at that, it also associates the device with the framer using devres.
+ * On driver detach, release function is invoked on the devres data,
+ * then, devres data is freed.
+ */
+struct framer *devm_framer_create(struct device *dev, struct device_node *node,
+				  const struct framer_ops *ops)
+{
+	struct framer **ptr, *framer;
+
+	ptr = devres_alloc(devm_framer_destroy, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	framer = framer_create(dev, node, ops);
+	if (!IS_ERR(framer)) {
+		*ptr = framer;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return framer;
+}
+EXPORT_SYMBOL_GPL(devm_framer_create);
+
+/**
+ * framer_provider_simple_of_xlate() - returns the framer instance from framer provider
+ * @dev: the framer provider device
+ * @args: of_phandle_args (not used here)
+ *
+ * Intended to be used by framer provider for the common case where #framer-cells is
+ * 0. For other cases where #framer-cells is greater than '0', the framer provider
+ * should provide a custom of_xlate function that reads the *args* and returns
+ * the appropriate framer.
+ */
+struct framer *framer_provider_simple_of_xlate(struct device *dev, struct of_phandle_args *args)
+{
+	struct class_dev_iter iter;
+	struct framer *framer;
+
+	class_dev_iter_init(&iter, framer_class, NULL, NULL);
+	while ((dev = class_dev_iter_next(&iter))) {
+		framer = dev_to_framer(dev);
+		if (args->np != framer->dev.of_node)
+			continue;
+
+		class_dev_iter_exit(&iter);
+		return framer;
+	}
+
+	class_dev_iter_exit(&iter);
+	return ERR_PTR(-ENODEV);
+}
+EXPORT_SYMBOL_GPL(framer_provider_simple_of_xlate);
+
+/**
+ * __framer_provider_of_register() - create/register framer provider with the framework
+ * @dev: struct device of the framer provider
+ * @owner: the module owner containing of_xlate
+ * @of_xlate: function pointer to obtain framer instance from framer provider
+ *
+ * Creates struct framer_provider from dev and of_xlate function pointer.
+ * This is used in the case of dt boot for finding the framer instance from
+ * framer provider.
+ */
+struct framer_provider *
+__framer_provider_of_register(struct device *dev, struct module *owner,
+			      struct framer *(*of_xlate)(struct device *dev,
+							 struct of_phandle_args *args))
+{
+	struct framer_provider *framer_provider;
+
+	framer_provider = kzalloc(sizeof(*framer_provider), GFP_KERNEL);
+	if (!framer_provider)
+		return ERR_PTR(-ENOMEM);
+
+	framer_provider->dev = dev;
+	framer_provider->owner = owner;
+	framer_provider->of_xlate = of_xlate;
+
+	of_node_get(framer_provider->dev->of_node);
+
+	mutex_lock(&framer_provider_mutex);
+	list_add_tail(&framer_provider->list, &framer_provider_list);
+	mutex_unlock(&framer_provider_mutex);
+
+	return framer_provider;
+}
+EXPORT_SYMBOL_GPL(__framer_provider_of_register);
+
+/**
+ * framer_provider_of_unregister() - unregister framer provider from the framework
+ * @framer_provider: framer provider returned by framer_provider_of_register()
+ *
+ * Removes the framer_provider created using framer_provider_of_register().
+ */
+void framer_provider_of_unregister(struct framer_provider *framer_provider)
+{
+	mutex_lock(&framer_provider_mutex);
+	list_del(&framer_provider->list);
+	mutex_unlock(&framer_provider_mutex);
+
+	of_node_put(framer_provider->dev->of_node);
+	kfree(framer_provider);
+}
+EXPORT_SYMBOL_GPL(framer_provider_of_unregister);
+
+static void devm_framer_provider_of_unregister(struct device *dev, void *res)
+{
+	struct framer_provider *framer_provider = *(struct framer_provider **)res;
+
+	framer_provider_of_unregister(framer_provider);
+}
+
+/**
+ * __devm_framer_provider_of_register() - create/register framer provider with
+ * the framework
+ * @dev: struct device of the framer provider
+ * @owner: the module owner containing of_xlate
+ * @of_xlate: function pointer to obtain framer instance from framer provider
+ *
+ * Creates struct framer_provider from dev and of_xlate function pointer.
+ * This is used in the case of dt boot for finding the framer instance from
+ * framer provider. While at that, it also associates the device with the
+ * framer provider using devres. On driver detach, release function is invoked
+ * on the devres data, then, devres data is freed.
+ */
+struct framer_provider *
+__devm_framer_provider_of_register(struct device *dev, struct module *owner,
+				   struct framer *(*of_xlate)(struct device *dev,
+							      struct of_phandle_args *args))
+{
+	struct framer_provider **ptr, *framer_provider;
+
+	ptr = devres_alloc(devm_framer_provider_of_unregister, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	framer_provider = __framer_provider_of_register(dev, owner, of_xlate);
+	if (!IS_ERR(framer_provider)) {
+		*ptr = framer_provider;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return framer_provider;
+}
+EXPORT_SYMBOL_GPL(__devm_framer_provider_of_register);
+
+/**
+ * framer_release() - release the framer
+ * @dev: the dev member within framer
+ *
+ * When the last reference to the device is removed, it is called
+ * from the embedded kobject as release method.
+ */
+static void framer_release(struct device *dev)
+{
+	struct framer *framer;
+
+	framer = dev_to_framer(dev);
+	regulator_put(framer->pwr);
+	ida_free(&framer_ida, framer->id);
+	kfree(framer);
+}
+
+static int __init framer_core_init(void)
+{
+	framer_class = class_create("framer");
+	if (IS_ERR(framer_class)) {
+		pr_err("failed to create framer class (%pe)\n", framer_class);
+		return PTR_ERR(framer_class);
+	}
+
+	framer_class->dev_release = framer_release;
+
+	return 0;
+}
+device_initcall(framer_core_init);
diff --git a/include/linux/framer/framer-provider.h b/include/linux/framer/framer-provider.h
new file mode 100644
index 000000000000..782cd5fc83d5
--- /dev/null
+++ b/include/linux/framer/framer-provider.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Generic framer profider header file
+ *
+ * Copyright 2023 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#ifndef __DRIVERS_PROVIDER_FRAMER_H
+#define __DRIVERS_PROVIDER_FRAMER_H
+
+#include <linux/export.h>
+#include <linux/framer/framer.h>
+#include <linux/types.h>
+
+#define FRAMER_FLAG_POLL_STATUS  BIT(0)
+
+/**
+ * struct framer_ops - set of function pointers for performing framer operations
+ * @init: operation to be performed for initializing the framer
+ * @exit: operation to be performed while exiting
+ * @power_on: powering on the framer
+ * @power_off: powering off the framer
+ * @flags: OR-ed flags (FRAMER_FLAG_*) to ask for core functionality
+ *          - @FRAMER_FLAG_POLL_STATUS:
+ *            Ask the core to perform a polling to get the framer status and
+ *            notify consumers on change.
+ *            The framer should call @framer_notify_status_change() when it
+ *            detects a status change. This is usually done using interrupts.
+ *            If the framer cannot detect this change, it can ask the core for
+ *            a status polling. The core will call @get_status() periodically
+ *            and, on change detected, it will notify the consumer.
+ *            the @get_status()
+ * @owner: the module owner containing the ops
+ */
+struct framer_ops {
+	int	(*init)(struct framer *framer);
+	void	(*exit)(struct framer *framer);
+	int	(*power_on)(struct framer *framer);
+	int	(*power_off)(struct framer *framer);
+
+	/**
+	 * @get_status:
+	 *
+	 * Optional.
+	 *
+	 * Used to get the framer status. framer_init() must have
+	 * been called on the framer.
+	 *
+	 * Returns: 0 if successful, an negative error code otherwise
+	 */
+	int	(*get_status)(struct framer *framer, struct framer_status *status);
+
+	/**
+	 * @set_config:
+	 *
+	 * Optional.
+	 *
+	 * Used to set the framer configuration. framer_init() must have
+	 * been called on the framer.
+	 *
+	 * Returns: 0 if successful, an negative error code otherwise
+	 */
+	int	(*set_config)(struct framer *framer, const struct framer_config *config);
+
+	/**
+	 * @get_config:
+	 *
+	 * Optional.
+	 *
+	 * Used to get the framer configuration. framer_init() must have
+	 * been called on the framer.
+	 *
+	 * Returns: 0 if successful, an negative error code otherwise
+	 */
+	int	(*get_config)(struct framer *framer, struct framer_config *config);
+
+	u32 flags;
+	struct module *owner;
+};
+
+/**
+ * struct framer_provider - represents the framer provider
+ * @dev: framer provider device
+ * @children: can be used to override the default (dev->of_node) child node
+ * @owner: the module owner having of_xlate
+ * @list: to maintain a linked list of framer providers
+ * @of_xlate: function pointer to obtain framer instance from framer pointer
+ */
+struct framer_provider {
+	struct device		*dev;
+	struct module		*owner;
+	struct list_head	list;
+	struct framer * (*of_xlate)(struct device *dev,
+				    struct of_phandle_args *args);
+};
+
+static inline void framer_set_drvdata(struct framer *framer, void *data)
+{
+	dev_set_drvdata(&framer->dev, data);
+}
+
+static inline void *framer_get_drvdata(struct framer *framer)
+{
+	return dev_get_drvdata(&framer->dev);
+}
+
+#if IS_ENABLED(CONFIG_GENERIC_FRAMER)
+
+/* Create and destroy a framer */
+struct framer *framer_create(struct device *dev, struct device_node *node,
+			     const struct framer_ops *ops);
+void framer_destroy(struct framer *framer);
+
+/* devm version */
+struct framer *devm_framer_create(struct device *dev, struct device_node *node,
+				  const struct framer_ops *ops);
+
+struct framer *framer_provider_simple_of_xlate(struct device *dev,
+					       struct of_phandle_args *args);
+
+struct framer_provider *
+__framer_provider_of_register(struct device *dev, struct module *owner,
+			      struct framer *(*of_xlate)(struct device *dev,
+							 struct of_phandle_args *args));
+
+void framer_provider_of_unregister(struct framer_provider *framer_provider);
+
+struct framer_provider *
+__devm_framer_provider_of_register(struct device *dev, struct module *owner,
+				   struct framer *(*of_xlate)(struct device *dev,
+							      struct of_phandle_args *args));
+
+void framer_notify_status_change(struct framer *framer);
+
+#else /* IS_ENABLED(CONFIG_GENERIC_FRAMER) */
+
+static inline struct framer *framer_create(struct device *dev, struct device_node *node,
+					   const struct framer_ops *ops)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline void framer_destroy(struct framer *framer)
+{
+}
+
+/* devm version */
+static inline struct framer *devm_framer_create(struct device *dev, struct device_node *node,
+						const struct framer_ops *ops)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline struct framer *framer_provider_simple_of_xlate(struct device *dev,
+							     struct of_phandle_args *args)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline struct framer_provider *
+__framer_provider_of_register(struct device *dev, struct module *owner,
+			      struct framer *(*of_xlate)(struct device *dev,
+							 struct of_phandle_args *args))
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+void framer_provider_of_unregister(struct framer_provider *framer_provider)
+{
+}
+
+static inline struct framer_provider *
+__devm_framer_provider_of_register(struct device *dev, struct module *owner,
+				   struct framer *(*of_xlate)(struct device *dev,
+							      struct of_phandle_args *args))
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+void framer_notify_status_change(struct framer *framer)
+{
+}
+
+#endif /* IS_ENABLED(CONFIG_GENERIC_FRAMER) */
+
+#define framer_provider_of_register(dev, xlate)		\
+	__framer_provider_of_register((dev), THIS_MODULE, (xlate))
+
+#define devm_framer_provider_of_register(dev, xlate)	\
+	__devm_framer_provider_of_register((dev), THIS_MODULE, (xlate))
+
+#endif /* __DRIVERS_PROVIDER_FRAMER_H */
diff --git a/include/linux/framer/framer.h b/include/linux/framer/framer.h
new file mode 100644
index 000000000000..9a9b88962c29
--- /dev/null
+++ b/include/linux/framer/framer.h
@@ -0,0 +1,205 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Generic framer header file
+ *
+ * Copyright 2023 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#ifndef __DRIVERS_FRAMER_H
+#define __DRIVERS_FRAMER_H
+
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/device.h>
+#include <linux/workqueue.h>
+
+/**
+ * enum framer_iface - Framer interface
+ * @FRAMER_IFACE_E1: E1 interface
+ * @FRAMER_IFACE_T1: T1 interface
+ */
+enum framer_iface {
+	FRAMER_IFACE_E1,
+	FRAMER_IFACE_T1,
+};
+
+/**
+ * enum framer_clock_type - Framer clock type
+ * @FRAMER_CLOCK_EXT: External clock
+ * @FRAMER_CLOCK_INT: Internal clock
+ */
+enum framer_clock_type {
+	FRAMER_CLOCK_EXT,
+	FRAMER_CLOCK_INT,
+};
+
+/**
+ * struct framer_config - Framer configuration
+ * @iface: Framer line interface
+ * @clock_type: Framer clock type
+ * @line_clock_rate: Framer line clock rate
+ */
+struct framer_config {
+	enum framer_iface iface;
+	enum framer_clock_type clock_type;
+	unsigned long line_clock_rate;
+};
+
+/**
+ * struct framer_status - Framer status
+ * @link_is_on: Framer link state. true, the link is on, false, the link is off.
+ */
+struct framer_status {
+	bool link_is_on;
+};
+
+/**
+ * enum framer_event - Event available for notification
+ * @FRAMER_EVENT_STATUS: Event notified on framer_status changes
+ */
+enum framer_event {
+	FRAMER_EVENT_STATUS,
+};
+
+/**
+ * struct framer - represents the framer device
+ * @dev: framer device
+ * @id: id of the framer device
+ * @ops: function pointers for performing framer operations
+ * @mutex: mutex to protect framer_ops
+ * @init_count: used to protect when the framer is used by multiple consumers
+ * @power_count: used to protect when the framer is used by multiple consumers
+ * @pwr: power regulator associated with the framer
+ * @notify_status_work: work structure used for status notifications
+ * @notifier_list: notifier list used for notifications
+ * @polling_work: delayed work structure used for the polling task
+ * @prev_status: previous read status used by the polling task to detect changes
+ */
+struct framer {
+	struct device			dev;
+	int				id;
+	const struct framer_ops		*ops;
+	struct mutex			mutex;	/* Protect framer */
+	int				init_count;
+	int				power_count;
+	struct regulator		*pwr;
+	struct work_struct		notify_status_work;
+	struct blocking_notifier_head	notifier_list;
+	struct delayed_work		polling_work;
+	struct framer_status		prev_status;
+};
+
+#if IS_ENABLED(CONFIG_GENERIC_FRAMER)
+int framer_pm_runtime_get(struct framer *framer);
+int framer_pm_runtime_get_sync(struct framer *framer);
+int framer_pm_runtime_put(struct framer *framer);
+int framer_pm_runtime_put_sync(struct framer *framer);
+int framer_init(struct framer *framer);
+int framer_exit(struct framer *framer);
+int framer_power_on(struct framer *framer);
+int framer_power_off(struct framer *framer);
+int framer_get_status(struct framer *framer, struct framer_status *status);
+int framer_get_config(struct framer *framer, struct framer_config *config);
+int framer_set_config(struct framer *framer, const struct framer_config *config);
+int framer_notifier_register(struct framer *framer, struct notifier_block *nb);
+int framer_notifier_unregister(struct framer *framer, struct notifier_block *nb);
+
+struct framer *framer_get(struct device *dev, const char *con_id);
+void framer_put(struct device *dev, struct framer *framer);
+
+struct framer *devm_framer_get(struct device *dev, const char *con_id);
+struct framer *devm_framer_optional_get(struct device *dev, const char *con_id);
+#else
+static inline int framer_pm_runtime_get(struct framer *framer)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_pm_runtime_get_sync(struct framer *framer)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_pm_runtime_put(struct framer *framer)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_pm_runtime_put_sync(struct framer *framer)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_init(struct framer *framer)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_exit(struct framer *framer)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_power_on(struct framer *framer)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_power_off(struct framer *framer)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_get_status(struct framer *framer, struct framer_status *status)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_get_config(struct framer *framer, struct framer_config *config)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_set_config(struct framer *framer, const struct framer_config *config)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_notifier_register(struct framer *framer,
+					   struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
+
+static inline int framer_notifier_unregister(struct framer *framer,
+					     struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
+
+struct framer *framer_get(struct device *dev, const char *con_id)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+void framer_put(struct device *dev, struct framer *framer)
+{
+}
+
+static inline struct framer *devm_framer_get(struct device *dev, const char *con_id)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline struct framer *devm_framer_optional_get(struct device *dev, const char *con_id)
+{
+	return NULL;
+}
+
+#endif
+
+#endif /* __DRIVERS_FRAMER_H */
-- 
2.41.0

