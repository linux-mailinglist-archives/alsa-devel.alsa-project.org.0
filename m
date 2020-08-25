Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E37251E28
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 19:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52E611697;
	Tue, 25 Aug 2020 19:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52E611697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598376106;
	bh=8dIUuvYhu08ZazviGthau4LMxF+VKl0zaz5UUKyDXzU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=caKL6rB4GWaE8J29QyeerpN/cX8+2m54BAJJYhU5oiFr5+as4VyaMvLutZhdjqwIN
	 V7FTXunG+N6ChwNAFRoBFSMT1iljlRh9EUMQ9DO2oqOX383xOumGZqSCOngpVLJX2z
	 AqU0GiD0cOhsDtaos7m3Ws2PTJ9VQt0NPURX+eZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80C15F802E2;
	Tue, 25 Aug 2020 19:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE6F3F80299; Tue, 25 Aug 2020 19:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 420D3F80299
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 19:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 420D3F80299
IronPort-SDR: 81MIZHs0U/SAnyOYOnFrUVGzaSa1VbgbU6NB8hTXhBLnSGJMoXs1amvi20dzTZQSu/4DEmpbKQ
 /aBzGjimzPXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="135708967"
X-IronPort-AV: E=Sophos;i="5.76,353,1592895600"; d="scan'208";a="135708967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 10:17:19 -0700
IronPort-SDR: +hFkVjCk971nSTtraGipndM3/DfUPeUYGjAAPf9kDn1UpTytQViQ1aU8BNCXWoOHZzOE+IKHdn
 6+/HMLTrx41Q==
X-IronPort-AV: E=Sophos;i="5.76,353,1592895600"; d="scan'208";a="331478456"
Received: from bgarring-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.4.243])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 10:17:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] regmap: sdw: add support for SoundWire 1.2 MBQ
Date: Tue, 25 Aug 2020 12:16:56 -0500
Message-Id: <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

The SoundWire 1.1 specification only allowed for reads and writes of
bytes. The SoundWire 1.2 specification adds a new capability to
transfer "Multi-Byte Quantities" (MBQ) across the bus. The transfers
still happens one-byte-at-a-time, but the update is atomic.

For example when writing a 16-bit volume, the first byte transferred
is only taken into account when the second byte is successfully
transferred.

The mechanism is symmetrical for read and writes:
- On a read, the address of the last byte to be read is modified by
setting the MBQ bit
- On a write, the address of all but the last byte to be written are
modified by setting the MBQ bit. The address for the last byte relies
on the MBQ bit being cleared.

The current definitions for MBQ-based controls in the SDCA draft
standard are limited to 16 bits for volumes, so for now this is the
only supported format. An update will be provided if and when support
for 24-bit and 32-bit values is specified by the SDCA standard.

One possible objection is that this code could have been handled with
regmap-sdw.c. However this is a new spec addition not handled by every
SoundWire 1.1 and non-SDCA device, so there's no reason to load code
that will never be used.

Also in practice it's extremely unlikely that CONFIG_REGMAP would not
be selected with CONFIG_REGMAP_MBQ selected. However there's no
functional dependency between the two modules so they can be selected
separately.

Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/base/regmap/Kconfig          |   6 +-
 drivers/base/regmap/Makefile         |   1 +
 drivers/base/regmap/regmap-sdw-mbq.c | 102 +++++++++++++++++++++++++++
 include/linux/regmap.h               |  20 ++++++
 4 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/regmap/regmap-sdw-mbq.c

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index 1d1d26b0d279..4d14355e9930 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -4,7 +4,7 @@
 # subsystems should select the appropriate symbols.
 
 config REGMAP
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SCCB || REGMAP_I3C)
+	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUNDWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C)
 	select IRQ_DOMAIN if REGMAP_IRQ
 	bool
 
@@ -46,6 +46,10 @@ config REGMAP_SOUNDWIRE
 	tristate
 	depends on SOUNDWIRE
 
+config REGMAP_SOUNDWIRE_MBQ
+	tristate
+	depends on SOUNDWIRE
+
 config REGMAP_SCCB
 	tristate
 	depends on I2C
diff --git a/drivers/base/regmap/Makefile b/drivers/base/regmap/Makefile
index ff6c7d8ec1cd..23841535b250 100644
--- a/drivers/base/regmap/Makefile
+++ b/drivers/base/regmap/Makefile
@@ -15,5 +15,6 @@ obj-$(CONFIG_REGMAP_MMIO) += regmap-mmio.o
 obj-$(CONFIG_REGMAP_IRQ) += regmap-irq.o
 obj-$(CONFIG_REGMAP_W1) += regmap-w1.o
 obj-$(CONFIG_REGMAP_SOUNDWIRE) += regmap-sdw.o
+obj-$(CONFIG_REGMAP_SOUNDWIRE_MBQ) += regmap-sdw-mbq.o
 obj-$(CONFIG_REGMAP_SCCB) += regmap-sccb.o
 obj-$(CONFIG_REGMAP_I3C) += regmap-i3c.o
diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
new file mode 100644
index 000000000000..8f4aa691887c
--- /dev/null
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright(c) 2020 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include "internal.h"
+
+static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct device *dev = context;
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int ret;
+
+	ret = sdw_write(slave, SDW_SDCA_MBQ_CTL(reg), (val >> 8) & 0xff);
+	if (ret < 0)
+		return ret;
+
+	return sdw_write(slave, reg, val & 0xff);
+}
+
+static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct device *dev = context;
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int read0;
+	int read1;
+
+	read0 = sdw_read(slave, reg);
+	if (read0 < 0)
+		return read0;
+
+	read1 = sdw_read(slave, SDW_SDCA_MBQ_CTL(reg));
+	if (read1 < 0)
+		return read1;
+
+	*val = (read1 << 8) | read0;
+
+	return 0;
+}
+
+static struct regmap_bus regmap_sdw_mbq = {
+	.reg_read = regmap_sdw_mbq_read,
+	.reg_write = regmap_sdw_mbq_write,
+	.reg_format_endian_default = REGMAP_ENDIAN_LITTLE,
+	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
+};
+
+static int regmap_sdw_mbq_config_check(const struct regmap_config *config)
+{
+	/* MBQ-based controls are only 16-bits for now */
+	if (config->val_bits != 16)
+		return -EOPNOTSUPP;
+
+	/* Registers are 32 bits wide */
+	if (config->reg_bits != 32)
+		return -EOPNOTSUPP;
+
+	if (config->pad_bits != 0)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
+				     const struct regmap_config *config,
+				     struct lock_class_key *lock_key,
+				     const char *lock_name)
+{
+	int ret;
+
+	ret = regmap_sdw_mbq_config_check(config);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return __regmap_init(&sdw->dev, &regmap_sdw_mbq,
+			&sdw->dev, config, lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__regmap_init_sdw_mbq);
+
+struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
+					  const struct regmap_config *config,
+					  struct lock_class_key *lock_key,
+					  const char *lock_name)
+{
+	int ret;
+
+	ret = regmap_sdw_mbq_config_check(config);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return __devm_regmap_init(&sdw->dev, &regmap_sdw_mbq,
+			&sdw->dev, config, lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__devm_regmap_init_sdw_mbq);
+
+MODULE_DESCRIPTION("Regmap SoundWire Module");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 1970ed59d49f..506e2a97d381 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -567,6 +567,10 @@ struct regmap *__regmap_init_sdw(struct sdw_slave *sdw,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
+struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
+				     const struct regmap_config *config,
+				     struct lock_class_key *lock_key,
+				     const char *lock_name);
 
 struct regmap *__devm_regmap_init(struct device *dev,
 				  const struct regmap_bus *bus,
@@ -612,6 +616,10 @@ struct regmap *__devm_regmap_init_sdw(struct sdw_slave *sdw,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
+struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
+					  const struct regmap_config *config,
+					  struct lock_class_key *lock_key,
+					  const char *lock_name);
 struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
@@ -806,6 +814,18 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
 	__regmap_lockdep_wrapper(__regmap_init_sdw, #config,		\
 				sdw, config)
 
+/**
+ * regmap_init_sdw_mbq() - Initialise register map
+ *
+ * @sdw: Device that will be interacted with
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer to
+ * a struct regmap.
+ */
+#define regmap_init_sdw_mbq(sdw, config)					\
+	__regmap_lockdep_wrapper(__regmap_init_sdw_mbq, #config,		\
+				sdw, config)
 
 /**
  * devm_regmap_init() - Initialise managed register map
-- 
2.25.1

