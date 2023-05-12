Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05B700821
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 14:32:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C8F41E9;
	Fri, 12 May 2023 14:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C8F41E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683894748;
	bh=b5pV8Jkw5llrvhWed/zMa+AT/bXX6J8PgXtcTJMsW/o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FBudQd47yPChd9wgtkrkgfnoQtL7TOBnLB9sU/4jDsYmP10qzLJzxxpY5bKSqcGhs
	 QAv/eCtOi/kIrzBsyxmqPhh+vk36VIEri0HVgofAmUspcUtZ+S1wy5Sz9nUUZOyKve
	 J6dAkBSTZPqMiGV01KEL/LwqfoZkCXAMgL+hOAVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 183C8F8055C; Fri, 12 May 2023 14:30:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B671BF80549;
	Fri, 12 May 2023 14:30:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F156EF80551; Fri, 12 May 2023 14:30:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A485F80534
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 14:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A485F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cdpts8Ph
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CCOUop001858;
	Fri, 12 May 2023 07:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ARr51imZ8cyQhc6OZS88JR0XpFuKtB3vmOhqiGHcUxg=;
 b=cdpts8PhrCp/+kcZiKgTfJwYmCwt9fQ68d8MfjEMY3BUP5KyVTGFaYTfO5bca+e/H2zE
 WiHOoESlvyfkEocIztAE49FkZ3xNhJL4ObrQIBR/HKygx1cAF1W2xgynLXUFFx1wpKJU
 XVG6QScByIgffoacx1khszbHDT+lRabyKWGaGP5Bb9Z+oLOdu++HUpwVvL67RZQpdJIj
 A9Xhv2GLu6V6ACB4nYpARZePeWhO+UH85efUZenHK/4jNsji37bOlneCNFoBYZCQOCa6
 Coi7SuAN3f3ffAh64FX5bciScV+Z4QbsxAmHDvVHn+Di75wa+Qy+WHY865m2VE0EdSuO uw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7nb5dqx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 07:28:41 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 07:28:38 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 12 May 2023 07:28:38 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2CC4411A8;
	Fri, 12 May 2023 12:28:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <maz@kernel.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 01/10] soundwire: bus: Allow SoundWire peripherals to register
 IRQ handlers
Date: Fri, 12 May 2023 13:28:29 +0100
Message-ID: <20230512122838.243002-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PsB7JmeZYld6DbIETXxL3qOzCKVqRuDJ
X-Proofpoint-GUID: PsB7JmeZYld6DbIETXxL3qOzCKVqRuDJ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FK3ZR5AAH425AHI4DKJFGPC5WZ6JL566
X-Message-ID-Hash: FK3ZR5AAH425AHI4DKJFGPC5WZ6JL566
X-MailFrom: prvs=0496644b8b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FK3ZR5AAH425AHI4DKJFGPC5WZ6JL566/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Currently the in-band alerts for SoundWire peripherals can only
be communicated to the driver through the interrupt_callback
function. This however is slightly inconvient for devices that wish to
share IRQ handling code between SoundWire and I2C/SPI, the later would
normally register an IRQ handler with the IRQ subsystem. However there
is no reason the SoundWire in-band IRQs can not also be communicated
as an actual IRQ to the driver.

Add support for SoundWire peripherals to register a normal IRQ handler
to receive SoundWire in-band alerts, allowing code to be shared across
control buses.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c       | 31 +++++++++++++++++++++++++++++++
 drivers/soundwire/bus_type.c  | 12 ++++++++++++
 include/linux/soundwire/sdw.h |  9 +++++++++
 3 files changed, 52 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 1ea6a64f8c4a5..30cd03757aafe 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -3,6 +3,7 @@
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
+#include <linux/irq.h>
 #include <linux/mod_devicetable.h>
 #include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -25,6 +26,23 @@ static int sdw_get_id(struct sdw_bus *bus)
 	return 0;
 }
 
+static int sdw_irq_map(struct irq_domain *h, unsigned int virq,
+		       irq_hw_number_t hw)
+{
+	struct sdw_bus *bus = h->host_data;
+
+	irq_set_chip_data(virq, bus);
+	irq_set_chip(virq, &bus->irq_chip);
+	irq_set_nested_thread(virq, 1);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops sdw_domain_ops = {
+	.map	= sdw_irq_map,
+};
+
 /**
  * sdw_bus_master_add() - add a bus Master instance
  * @bus: bus instance
@@ -142,6 +160,13 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	bus->params.curr_bank = SDW_BANK0;
 	bus->params.next_bank = SDW_BANK1;
 
+	bus->irq_chip.name = dev_name(bus->dev);
+	bus->domain = irq_domain_add_linear(NULL, SDW_MAX_DEVICES, &sdw_domain_ops, bus);
+	if (!bus->domain) {
+		dev_err(bus->dev, "Failed to add IRQ domain\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(sdw_bus_master_add);
@@ -178,6 +203,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
 void sdw_bus_master_delete(struct sdw_bus *bus)
 {
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+
+	irq_domain_remove(bus->domain);
+
 	sdw_master_device_del(bus);
 
 	sdw_bus_debugfs_exit(bus);
@@ -1711,6 +1739,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 				struct device *dev = &slave->dev;
 				struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
 
+				if (slave->prop.use_domain_irq && slave->irq)
+					handle_nested_irq(slave->irq);
+
 				if (drv->ops && drv->ops->interrupt_callback) {
 					slave_intr.sdca_cascade = sdca_cascade;
 					slave_intr.control_port = clear;
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 1f43ee848eac8..fafbc284e82da 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -122,6 +122,12 @@ static int sdw_drv_probe(struct device *dev)
 	if (drv->ops && drv->ops->read_prop)
 		drv->ops->read_prop(slave);
 
+	if (slave->prop.use_domain_irq) {
+		slave->irq = irq_create_mapping(slave->bus->domain, slave->dev_num);
+		if (!slave->irq)
+			dev_warn(dev, "Failed to map IRQ\n");
+	}
+
 	/* init the sysfs as we have properties now */
 	ret = sdw_slave_sysfs_init(slave);
 	if (ret < 0)
@@ -166,7 +172,13 @@ static int sdw_drv_remove(struct device *dev)
 	int ret = 0;
 
 	mutex_lock(&slave->sdw_dev_lock);
+
 	slave->probed = false;
+
+	if (slave->prop.use_domain_irq)
+		irq_dispose_mapping(irq_find_mapping(slave->bus->domain,
+						     slave->dev_num));
+
 	mutex_unlock(&slave->sdw_dev_lock);
 
 	if (drv->remove)
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ef645de13ae93..c3ab5e5f9cfa4 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -5,6 +5,8 @@
 #define __SOUNDWIRE_H
 
 #include <linux/bug.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/mod_devicetable.h>
 #include <linux/bitfield.h>
 
@@ -369,6 +371,7 @@ struct sdw_dpn_prop {
  * @clock_reg_supported: the Peripheral implements the clock base and scale
  * registers introduced with the SoundWire 1.2 specification. SDCA devices
  * do not need to set this boolean property as the registers are required.
+ * @use_domain_irq: call actual IRQ handler on slave, as well as callback
  */
 struct sdw_slave_prop {
 	u32 mipi_revision;
@@ -393,6 +396,7 @@ struct sdw_slave_prop {
 	u8 scp_int1_mask;
 	u32 quirks;
 	bool clock_reg_supported;
+	bool use_domain_irq;
 };
 
 #define SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY	BIT(0)
@@ -640,6 +644,7 @@ struct sdw_slave_ops {
  * struct sdw_slave - SoundWire Slave
  * @id: MIPI device ID
  * @dev: Linux device
+ * @irq: IRQ number
  * @status: Status reported by the Slave
  * @bus: Bus handle
  * @prop: Slave properties
@@ -669,6 +674,7 @@ struct sdw_slave_ops {
 struct sdw_slave {
 	struct sdw_slave_id id;
 	struct device dev;
+	int irq;
 	enum sdw_slave_status status;
 	struct sdw_bus *bus;
 	struct sdw_slave_prop prop;
@@ -883,6 +889,7 @@ struct sdw_master_ops {
  * is used to compute and program bus bandwidth, clock, frame shape,
  * transport and port parameters
  * @debugfs: Bus debugfs
+ * @domain: IRQ domain
  * @defer_msg: Defer message
  * @clk_stop_timeout: Clock stop timeout computed
  * @bank_switch_timeout: Bank switch timeout computed
@@ -916,6 +923,8 @@ struct sdw_bus {
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
+	struct irq_chip irq_chip;
+	struct irq_domain *domain;
 	struct sdw_defer defer_msg;
 	unsigned int clk_stop_timeout;
 	u32 bank_switch_timeout;
-- 
2.30.2

