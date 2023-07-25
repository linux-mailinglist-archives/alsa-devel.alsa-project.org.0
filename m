Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFAC7610D3
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 12:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1DA150C;
	Tue, 25 Jul 2023 12:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1DA150C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690280853;
	bh=ZxWJ7ooQIxprSViCz148t6tDSrxPcGhqcl9y0HPWGUU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IWl8F7HMHUbe7HO0+4Xbynr7Gb/Ah6kaDaQU/a7GdI4qA1jt3WkvAMvX51OoKFr8a
	 G2uIvuRhwbcJwXZpaMOeyyLKXexwWQLdSqtEXnfWUGuRpmdnqI9u5nwX5Dw10UBUY5
	 6UUkJKdV+t9y2y7pa64wjByaDJJkZZMKnUFcdef4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3536F805A9; Tue, 25 Jul 2023 12:25:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC3AF80587;
	Tue, 25 Jul 2023 12:25:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEEF1F80588; Tue, 25 Jul 2023 12:25:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8B90F80558
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 12:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8B90F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=iGH7cSGM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36P5SPLE027052;
	Tue, 25 Jul 2023 05:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=CshdLb8jQ/rwztZ7BESOGhW4XrI7hsyk5YWhhoXUyi8=; b=
	iGH7cSGMtLTQTAieuzFJ0mDFy45bOGFYbyGl3jWbPDO28lApVNYbXigF0KHm+hCW
	Ch9ShWBv7HGEATDx9vywuMipmQg1hwzH/1PkpF2qk+emsvmCBiDidQlDr9itVAjD
	4ZpL0NDG/x0JxpwLdJ4owq9JkCCogKqAwhJ0RrGZoP82ILsEQJDAXljlNc7Dyaih
	eGINEgqRLbslb7IoNNiubiKiTg44oUZOVHZREIdIAN3FuOF101nn96uppOmzD4mN
	2z32U2lDukJrzHc+waNpmTHlhvHOFOVCLkmA1lNeNepCbdtDd6N9pLx9eYk6virV
	YRlXpwRJmCO66gHT81wnvw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s0cgxu6yu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 05:25:35 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 11:25:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 25 Jul 2023 11:25:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 545B63560;
	Tue, 25 Jul 2023 10:25:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <lee@kernel.org>, <vkoul@kernel.org>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <linus.walleij@linaro.org>,
        <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 1/6] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Date: Tue, 25 Jul 2023 11:25:27 +0100
Message-ID: <20230725102532.2567580-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230725102532.2567580-1-ckeepax@opensource.cirrus.com>
References: <20230725102532.2567580-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7tLH2kBVQCbsKgzV5gsZxElkaaDogXsY
X-Proofpoint-GUID: 7tLH2kBVQCbsKgzV5gsZxElkaaDogXsY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FENHPFCZPDUBH7NZXVP7C7NMCCIBR6XD
X-Message-ID-Hash: FENHPFCZPDUBH7NZXVP7C7NMCCIBR6XD
X-MailFrom: prvs=2570f46236=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FENHPFCZPDUBH7NZXVP7C7NMCCIBR6XD/>
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
control buses. Note that we allow users to use both the
interrupt_callback and the IRQ handler, this is useful for devices which
must clear additional chip specific SoundWire registers that are not a
part of the normal IRQ flow, or the SoundWire specification.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v5.

Thanks,
Charles

 drivers/soundwire/bus.c       | 32 ++++++++++++++++++++++++++++++++
 drivers/soundwire/bus_type.c  | 12 ++++++++++++
 include/linux/soundwire/sdw.h |  9 +++++++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index dba920ec88f6f..cf55386256f3f 100644
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
@@ -151,6 +169,14 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	bus->params.curr_bank = SDW_BANK0;
 	bus->params.next_bank = SDW_BANK1;
 
+	bus->irq_chip.name = dev_name(bus->dev);
+	bus->domain = irq_domain_create_linear(fwnode, SDW_MAX_DEVICES,
+					       &sdw_domain_ops, bus);
+	if (!bus->domain) {
+		dev_err(bus->dev, "Failed to add IRQ domain\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(sdw_bus_master_add);
@@ -187,6 +213,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
 void sdw_bus_master_delete(struct sdw_bus *bus)
 {
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+
+	irq_domain_remove(bus->domain);
+
 	sdw_master_device_del(bus);
 
 	sdw_bus_debugfs_exit(bus);
@@ -1725,6 +1754,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
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
index f523ceabd0596..8923387a7405b 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -6,6 +6,8 @@
 
 #include <linux/bug.h>
 #include <linux/lockdep_types.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/mod_devicetable.h>
 #include <linux/bitfield.h>
 
@@ -370,6 +372,7 @@ struct sdw_dpn_prop {
  * @clock_reg_supported: the Peripheral implements the clock base and scale
  * registers introduced with the SoundWire 1.2 specification. SDCA devices
  * do not need to set this boolean property as the registers are required.
+ * @use_domain_irq: call actual IRQ handler on slave, as well as callback
  */
 struct sdw_slave_prop {
 	u32 mipi_revision;
@@ -394,6 +397,7 @@ struct sdw_slave_prop {
 	u8 scp_int1_mask;
 	u32 quirks;
 	bool clock_reg_supported;
+	bool use_domain_irq;
 };
 
 #define SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY	BIT(0)
@@ -641,6 +645,7 @@ struct sdw_slave_ops {
  * struct sdw_slave - SoundWire Slave
  * @id: MIPI device ID
  * @dev: Linux device
+ * @irq: IRQ number
  * @status: Status reported by the Slave
  * @bus: Bus handle
  * @prop: Slave properties
@@ -670,6 +675,7 @@ struct sdw_slave_ops {
 struct sdw_slave {
 	struct sdw_slave_id id;
 	struct device dev;
+	int irq;
 	enum sdw_slave_status status;
 	struct sdw_bus *bus;
 	struct sdw_slave_prop prop;
@@ -885,6 +891,7 @@ struct sdw_master_ops {
  * is used to compute and program bus bandwidth, clock, frame shape,
  * transport and port parameters
  * @debugfs: Bus debugfs
+ * @domain: IRQ domain
  * @defer_msg: Defer message
  * @clk_stop_timeout: Clock stop timeout computed
  * @bank_switch_timeout: Bank switch timeout computed
@@ -920,6 +927,8 @@ struct sdw_bus {
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

