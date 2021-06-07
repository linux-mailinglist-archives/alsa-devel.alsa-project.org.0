Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A220539E08B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 17:33:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27F151674;
	Mon,  7 Jun 2021 17:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27F151674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623079986;
	bh=W/54klP5seAxgDJ52zB6BGKjwrsx3QKtOPNYGIL0j/0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EDBV4wixx//huRnY7aPW2iZcrhJuECpxy5w9Rz4j3xmbJtbHUJ8AwSvA2UYTPfCoP
	 jfvB9ZhznOsaara/MGZr8mWkhsVIhaADTrkUB2zzbPupOPb2Yd5mcp1HN4h3njnH1M
	 dsBgp2KfcC4IWUvdNmTJ3S+TdLiFQO0Us9ITEza4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C180F804D6;
	Mon,  7 Jun 2021 17:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61C83F801EC; Mon,  7 Jun 2021 17:29:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E43B3F80212
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 17:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E43B3F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wacT53Bp"
Received: by mail-wm1-x334.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so272673wmq.3
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fi+lgkzJyzyN44ZmpOxGUoTme/W0RFyfLc8FFKN0BP0=;
 b=wacT53BplXQLr08Z7Ok4NBsQap9ghJ6LvG/6uNOl0gDkeG7dyhSKHWg/mdgxh7f2yJ
 EbuwDskXZ4QqKR9Kt9z75+Uycj5pk7aQZAKzYsKfKopSmL5r0tHGqhFLO0F7KHVxutM6
 FMD76kRBb8tfFzzk/5N8Y49pSsSI31LolA8pmU1pDRaoWtk5FaXoql0XErGDZNVesAft
 8ueA6fp4d0tRdgE/KolWFAhxtULmKMNyGSm/wypEnawvbS5n5bwl7ex1j3bxwbYfQJD8
 wczDDDa5eDaD0ufJCHorme3aJW5bzePlEBBTHxOTgZirz8ic9gYQmuHRfOMt5vaYu7nv
 a8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fi+lgkzJyzyN44ZmpOxGUoTme/W0RFyfLc8FFKN0BP0=;
 b=FtKt4Gk9NhSmRovp/Wk/QpA2BQ5tFcphsW8OsbTJEn+e4iVgUgY1aMyynSa/+G0J7r
 Fy7WCVyozzCA7Eu7KRxMswAbl448Ezrvb+CA3x4rECucxC+7s730tRXmF2OJKd1/tBtE
 5iEVR1WFjBxZUnTEeH/eBfV5eRb8BsbeXFvNyfYfjOHdlsUm+mGmqJ/uGrHl5hcNFAUE
 N/9F8JoRBYa8I43t7lUwWZvIH66IDUe+GgYsSVHMmQPDt/jYRy+57zEa14iltnZa09bJ
 2TENwX89kN7n9HFTFc8wuH05kkdpH4Z5gTk/rZBJFsmet8JNRrQSJKHeQh3yT6H3u5hy
 igJg==
X-Gm-Message-State: AOAM530mf1Nu87pRTisp3zSWmWjMgPphmizz+W4qiULDCwepnaFE/NZr
 ZMY2sxhJ+H/dRJbUjW6O8yacxA==
X-Google-Smtp-Source: ABdhPJwoGkRDBJpc8PQy3yX+NniyX6dDFoimp6p8Big9rY7ggUDpu1jEY5P8ft+bsZIB5H2z+mBmcQ==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr17744030wmh.180.1623079741790; 
 Mon, 07 Jun 2021 08:29:01 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q3sm16370170wrr.43.2021.06.07.08.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:29:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org
Subject: [RFC PATCH 02/13] soc: qcom: add gpr driver support
Date: Mon,  7 Jun 2021 16:28:25 +0100
Message-Id: <20210607152836.17154-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

Qualcomm Generic Packet router aka GPR is the IPC mechanism found
in AudioReach next generation signal processing framework to perform
command and response messages between various processors.

GPR has concepts of static and dynamic port, all static services like
APM (Audio Processing Manager), PRM (Proxy resource manager) have
fixed port numbers where as dynamic services like graphs have dynamic
port numbers which are allocated at runtime. All GPR packet messages
will have source and destination domain and port along with opcode
and payload.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soc/qcom/Kconfig           |   9 +
 drivers/soc/qcom/Makefile          |   1 +
 drivers/soc/qcom/gpr.c             | 487 +++++++++++++++++++++++++++++
 include/dt-bindings/soc/qcom,gpr.h |  18 ++
 include/linux/soc/qcom/gpr.h       | 127 ++++++++
 5 files changed, 642 insertions(+)
 create mode 100644 drivers/soc/qcom/gpr.c
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h
 create mode 100644 include/linux/soc/qcom/gpr.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79b568f82a1c..66eb4a3e4bae 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -209,4 +209,13 @@ config QCOM_APR
 	  application processor and QDSP6. APR is
 	  used by audio driver to configure QDSP6
 	  ASM, ADM and AFE modules.
+
+config QCOM_GPR
+	tristate "Qualcomm GPR Bus (Gecko Packet Router)"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on RPMSG
+	help
+          Enable GPR IPC protocol support between
+          application processor and QDSP6. GPR is
+          used by audio driver to configure QDSP6.
 endmenu
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ad675a6593d0..2e4c4fdac77a 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
 obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
 obj-$(CONFIG_QCOM_APR) += apr.o
+obj-$(CONFIG_QCOM_GPR) += gpr.o
 obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
diff --git a/drivers/soc/qcom/gpr.c b/drivers/soc/qcom/gpr.c
new file mode 100644
index 000000000000..7c0c0fe67d92
--- /dev/null
+++ b/drivers/soc/qcom/gpr.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021, Linaro Limited
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/spinlock.h>
+#include <linux/idr.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/of_device.h>
+#include <linux/soc/qcom/gpr.h>
+#include <linux/delay.h>
+#include <linux/rpmsg.h>
+#include <linux/of.h>
+
+/* Some random values tbh which does not collide with static modules */
+#define GPR_DYNAMIC_PORT_START	0x10000000
+#define GPR_DYNAMIC_PORT_END	0x20000000
+
+struct gpr_rx_buf {
+	struct list_head node;
+	int len;
+	uint8_t buf[];
+};
+
+struct gpr {
+	struct rpmsg_endpoint *ch;
+	struct device *dev;
+	spinlock_t ports_lock;
+	spinlock_t rx_lock;
+	struct idr ports_idr;
+	int dest_domain_id;
+	struct workqueue_struct *rxwq;
+	struct work_struct rx_work;
+	struct list_head rx_list;
+};
+
+struct gpr_pkt *gpr_alloc_pkt(struct gpr_port *port, int payload_size,
+			      uint32_t opcode, uint32_t token,
+			      uint32_t dest_port)
+{
+	int pkt_size = GPR_HDR_SIZE + payload_size;
+	struct gpr *gpr = port->gpr;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	p = kzalloc(pkt_size, GFP_KERNEL);
+	if (!p)
+		return ERR_PTR(-ENOMEM);
+
+	pkt = p;
+	pkt->hdr.version = GPR_PKT_VER;
+	pkt->hdr.hdr_size = GPR_PKT_HEADER_WORD_SIZE;
+	pkt->hdr.pkt_size = pkt_size;
+	pkt->hdr.dest_port = dest_port;
+	pkt->hdr.src_port = port->id;
+	pkt->hdr.dest_domain = gpr->dest_domain_id;
+	pkt->hdr.src_domain = GPR_DOMAIN_ID_APPS;
+	pkt->hdr.token = token;
+	pkt->hdr.opcode = opcode;
+
+	return pkt;
+}
+EXPORT_SYMBOL_GPL(gpr_alloc_pkt);
+
+void gpr_free_pkt(struct gpr_port *port, struct gpr_pkt *pkt)
+{
+	kfree(pkt);
+}
+EXPORT_SYMBOL_GPL(gpr_free_pkt);
+
+int gpr_send_port_pkt(struct gpr_port *port, struct gpr_pkt *pkt)
+{
+	struct gpr *gpr = port->gpr;
+	struct gpr_hdr *hdr;
+	unsigned long flags;
+	int ret;
+
+	hdr = &pkt->hdr;
+
+	spin_lock_irqsave(&port->lock, flags);
+	ret = rpmsg_trysend(gpr->ch, pkt, hdr->pkt_size);
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	return ret ? ret : hdr->pkt_size;
+}
+EXPORT_SYMBOL_GPL(gpr_send_port_pkt);
+
+static void gpr_dev_release(struct device *dev)
+{
+	struct gpr_device *gdev = to_gpr_device(dev);
+
+	kfree(gdev);
+}
+
+static int gpr_callback(struct rpmsg_device *rpdev, void *buf,
+			int len, void *priv, u32 addr)
+{
+	struct gpr *gpr = dev_get_drvdata(&rpdev->dev);
+	struct gpr_rx_buf *abuf;
+	unsigned long flags;
+
+	abuf = kzalloc(sizeof(*abuf) + len, GFP_ATOMIC);
+	if (!abuf)
+		return -ENOMEM;
+
+	abuf->len = len;
+	memcpy(abuf->buf, buf, len);
+
+	spin_lock_irqsave(&gpr->rx_lock, flags);
+	list_add_tail(&abuf->node, &gpr->rx_list);
+	spin_unlock_irqrestore(&gpr->rx_lock, flags);
+
+	queue_work(gpr->rxwq, &gpr->rx_work);
+
+	return 0;
+}
+
+static int gpr_do_rx_callback(struct gpr *gpr, struct gpr_rx_buf *abuf)
+{
+	uint16_t hdr_size, ver;
+	struct gpr_port *port = NULL;
+	struct gpr_resp_pkt resp;
+	struct gpr_hdr *hdr;
+	unsigned long flags;
+	void *buf = abuf->buf;
+	int len = abuf->len;
+
+	hdr = buf;
+	ver = hdr->version;
+	if (ver > GPR_PKT_VER + 1)
+		return -EINVAL;
+
+	hdr_size = hdr->hdr_size;
+	if (hdr_size < GPR_PKT_HEADER_WORD_SIZE) {
+		dev_err(gpr->dev, "GPR: Wrong hdr size:%d\n", hdr_size);
+		return -EINVAL;
+	}
+
+	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
+		dev_err(gpr->dev, "GPR: Wrong packet size\n");
+		return -EINVAL;
+	}
+
+	resp.hdr = *hdr;
+	resp.payload_size = hdr->pkt_size - (hdr_size * 4);
+
+	/*
+	 * NOTE: hdr_size is not same as GPR_HDR_SIZE as remote can include
+	 * optional headers in to gpr_hdr which should be ignored
+	 */
+	if (resp.payload_size > 0)
+		resp.payload = buf + (hdr_size *  4);
+
+
+	spin_lock_irqsave(&gpr->ports_lock, flags);
+	port = idr_find(&gpr->ports_idr, hdr->dest_port);
+	spin_unlock_irqrestore(&gpr->ports_lock, flags);
+
+	if (!port) {
+		dev_err(gpr->dev, "GPR: Port(%x) is not registered\n",
+			hdr->dest_port);
+		return -EINVAL;
+	}
+
+	if (port->callback)
+		port->callback(&resp, port->priv, 0);
+
+	return 0;
+}
+
+static void gpr_rxwq(struct work_struct *work)
+{
+	struct gpr *gpr = container_of(work, struct gpr, rx_work);
+	struct gpr_rx_buf *abuf, *b;
+	unsigned long flags;
+
+	if (!list_empty(&gpr->rx_list)) {
+		list_for_each_entry_safe(abuf, b, &gpr->rx_list, node) {
+			gpr_do_rx_callback(gpr, abuf);
+			spin_lock_irqsave(&gpr->rx_lock, flags);
+			list_del(&abuf->node);
+			spin_unlock_irqrestore(&gpr->rx_lock, flags);
+			kfree(abuf);
+		}
+	}
+}
+
+static int gpr_device_match(struct device *dev, struct device_driver *drv)
+{
+	/* Attempt an OF style match first */
+	if (of_driver_match_device(dev, drv))
+		return 1;
+
+	return 0;
+}
+
+static int gpr_device_probe(struct device *dev)
+{
+	struct gpr_device *gdev = to_gpr_device(dev);
+	struct gpr_driver *adrv = to_gpr_driver(dev->driver);
+	int ret;
+
+	ret = adrv->probe(gdev);
+	if (!ret)
+		gdev->port.callback = adrv->callback;
+
+	return ret;
+}
+
+static int gpr_device_remove(struct device *dev)
+{
+	struct gpr_device *gdev = to_gpr_device(dev);
+	struct gpr_driver *adrv;
+	struct gpr *gpr = dev_get_drvdata(gdev->dev.parent);
+
+	if (dev->driver) {
+		adrv = to_gpr_driver(dev->driver);
+		if (adrv->remove)
+			adrv->remove(gdev);
+		spin_lock(&gpr->ports_lock);
+		idr_remove(&gpr->ports_idr, gdev->port_id);
+		spin_unlock(&gpr->ports_lock);
+	}
+
+	return 0;
+}
+
+static int gpr_uevent(struct device *dev, struct kobj_uevent_env *env)
+{
+	struct gpr_device *gdev = to_gpr_device(dev);
+	int ret;
+
+	ret = of_device_uevent_modalias(dev, env);
+	if (ret != -ENODEV)
+		return ret;
+
+	return add_uevent_var(env, "MODALIAS=gpr:%s", gdev->name);
+}
+
+struct bus_type gprbus = {
+	.name		= "gprbus",
+	.match		= gpr_device_match,
+	.probe		= gpr_device_probe,
+	.uevent		= gpr_uevent,
+	.remove		= gpr_device_remove,
+};
+EXPORT_SYMBOL_GPL(gprbus);
+
+void gpr_free_port(struct gpr_port *port)
+{
+	struct gpr *gpr = port->gpr;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpr->ports_lock, flags);
+	idr_remove(&gpr->ports_idr, port->id);
+	spin_unlock_irqrestore(&gpr->ports_lock, flags);
+
+	kfree(port);
+}
+EXPORT_SYMBOL_GPL(gpr_free_port);
+
+struct gpr_port *gpr_alloc_port(struct gpr_device* gdev, struct device *dev,
+				gpr_port_cb cb,	void *priv)
+{
+	struct gpr *gpr = dev_get_drvdata(gdev->dev.parent);
+	struct gpr_port *port;
+	int id;
+
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return ERR_PTR(-ENOMEM);
+
+	port->callback = cb;
+	port->gpr = gpr;
+	port->priv = priv;
+	port->dev = dev;
+	spin_lock_init(&port->lock);
+
+	spin_lock(&gpr->ports_lock);
+	id = idr_alloc_cyclic(&gpr->ports_idr, port, GPR_DYNAMIC_PORT_START,
+			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
+	if (id < 0) {
+		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
+		kfree(port);
+		spin_unlock(&gpr->ports_lock);
+		return ERR_PTR(-ENOMEM);
+	}
+	port->id = id;
+	spin_unlock(&gpr->ports_lock);
+
+	dev_info(dev, "Adding GPR src port (%x)\n", port->id);
+
+	return port;
+}
+EXPORT_SYMBOL_GPL(gpr_alloc_port);
+
+static int gpr_add_device(struct device *dev, struct device_node *np,
+			  u32 port_id, u32 domain_id)
+{
+	struct gpr *gpr = dev_get_drvdata(dev);
+	struct gpr_device *gdev = NULL;
+	int ret;
+
+	gdev = kzalloc(sizeof(*gdev), GFP_KERNEL);
+	if (!gdev)
+		return -ENOMEM;
+
+	gdev->port_id = port_id;
+	gdev->domain_id = domain_id;
+	if (np)
+		snprintf(gdev->name, GPR_NAME_SIZE, "%pOFn", np);
+
+	dev_set_name(&gdev->dev, "gprport:%s:%x:%x", gdev->name,
+		     domain_id, port_id);
+
+	gdev->dev.bus = &gprbus;
+	gdev->dev.parent = dev;
+	gdev->dev.of_node = np;
+	gdev->dev.release = gpr_dev_release;
+	gdev->dev.driver = NULL;
+
+	gdev->port.gpr = gpr;
+	gdev->port.priv = gdev;
+	gdev->port.id = port_id;
+	spin_lock_init(&gdev->port.lock);
+
+	spin_lock(&gpr->ports_lock);
+	idr_alloc(&gpr->ports_idr, &gdev->port, port_id,
+		  port_id + 1, GFP_ATOMIC);
+	spin_unlock(&gpr->ports_lock);
+
+	dev_info(dev, "Adding GPR dev: %s\n", dev_name(&gdev->dev));
+
+	ret = device_register(&gdev->dev);
+	if (ret) {
+		dev_err(dev, "device_register failed: %d\n", ret);
+		put_device(&gdev->dev);
+	}
+
+	return ret;
+}
+
+static void of_register_gpr_devices(struct device *dev)
+{
+	struct gpr *gpr = dev_get_drvdata(dev);
+	struct device_node *node;
+
+	for_each_child_of_node(dev->of_node, node) {
+		u32 port_id;
+		u32 domain_id;
+
+		if (of_property_read_u32(node, "reg", &port_id))
+			continue;
+
+		domain_id = gpr->dest_domain_id;
+
+		if (gpr_add_device(dev, node, port_id, domain_id))
+			dev_err(dev, "Failed to add gpr %d port\n", port_id);
+	}
+}
+
+static int gpr_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct gpr *gpr;
+	int ret;
+
+	gpr = devm_kzalloc(dev, sizeof(*gpr), GFP_KERNEL);
+	if (!gpr)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(dev->of_node, "qcom,gpr-domain",
+				   &gpr->dest_domain_id);
+	if (ret) {
+		dev_err(dev, "GPR Domain ID not specified in DT\n");
+		return ret;
+	}
+
+	dev_set_drvdata(dev, gpr);
+	gpr->ch = rpdev->ept;
+	gpr->dev = dev;
+	gpr->rxwq = create_singlethread_workqueue("qcom_gpr_rx");
+	if (!gpr->rxwq) {
+		dev_err(gpr->dev, "Failed to start Rx WQ\n");
+		return -ENOMEM;
+	}
+	INIT_WORK(&gpr->rx_work, gpr_rxwq);
+
+	INIT_LIST_HEAD(&gpr->rx_list);
+	spin_lock_init(&gpr->rx_lock);
+	spin_lock_init(&gpr->ports_lock);
+	idr_init(&gpr->ports_idr);
+
+	of_register_gpr_devices(dev);
+
+	return 0;
+}
+
+static int gpr_remove_device(struct device *dev, void *null)
+{
+	struct gpr_device *gdev = to_gpr_device(dev);
+
+	device_unregister(&gdev->dev);
+
+	return 0;
+}
+
+static void gpr_remove(struct rpmsg_device *rpdev)
+{
+	struct gpr *gpr = dev_get_drvdata(&rpdev->dev);
+
+	device_for_each_child(&rpdev->dev, NULL, gpr_remove_device);
+	flush_workqueue(gpr->rxwq);
+	destroy_workqueue(gpr->rxwq);
+}
+
+/*
+ * __gpr_driver_register() - Client driver registration with gprbus
+ *
+ * @drv:Client driver to be associated with client-device.
+ * @owner: owning module/driver
+ *
+ * This API will register the client driver with the gprbus
+ * It is called from the driver's module-init function.
+ */
+int __gpr_driver_register(struct gpr_driver *drv, struct module *owner)
+{
+	drv->driver.bus = &gprbus;
+	drv->driver.owner = owner;
+
+	return driver_register(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(__gpr_driver_register);
+
+/*
+ * gpr_driver_unregister() - Undo effect of gpr_driver_register
+ *
+ * @drv: Client driver to be unregistered
+ */
+void gpr_driver_unregister(struct gpr_driver *drv)
+{
+	driver_unregister(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(gpr_driver_unregister);
+
+static const struct of_device_id gpr_of_match[] = {
+	{ .compatible = "qcom,gpr", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, gpr_of_match);
+
+static struct rpmsg_driver gpr_driver = {
+	.probe = gpr_probe,
+	.remove = gpr_remove,
+	.callback = gpr_callback,
+	.drv = {
+		.name = "qcom,gpr",
+		.of_match_table = gpr_of_match,
+	},
+};
+
+static int __init gpr_init(void)
+{
+	int ret;
+
+	ret = bus_register(&gprbus);
+	if (!ret)
+		ret = register_rpmsg_driver(&gpr_driver);
+	else
+		bus_unregister(&gprbus);
+
+	return ret;
+}
+
+static void __exit gpr_exit(void)
+{
+	bus_unregister(&gprbus);
+	unregister_rpmsg_driver(&gpr_driver);
+}
+
+subsys_initcall(gpr_init);
+module_exit(gpr_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm GPR Bus");
diff --git a/include/dt-bindings/soc/qcom,gpr.h b/include/dt-bindings/soc/qcom,gpr.h
new file mode 100644
index 000000000000..1c68906e079c
--- /dev/null
+++ b/include/dt-bindings/soc/qcom,gpr.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_BINDINGS_QCOM_GPR_H
+#define __DT_BINDINGS_QCOM_GPR_H
+
+/* DOMAINS */
+
+#define GPR_DOMAIN_ID_MODEM	1
+#define GPR_DOMAIN_ID_ADSP	2
+#define GPR_DOMAIN_ID_APPS	3
+
+/* Static Services */
+
+#define GPR_APM_MODULE_IID		1
+#define GPR_PRM_MODULE_IID		2
+#define GPR_AMDB_MODULE_IID		3
+#define GPR_VCPM_MODULE_IID		4
+
+#endif /* __DT_BINDINGS_QCOM_GPR_H */
diff --git a/include/linux/soc/qcom/gpr.h b/include/linux/soc/qcom/gpr.h
new file mode 100644
index 000000000000..05cbbc407a49
--- /dev/null
+++ b/include/linux/soc/qcom/gpr.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __QCOM_GPR_H_
+#define __QCOM_GPR_H_
+
+#include <linux/spinlock.h>
+#include <linux/device.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+
+#define APM_MODULE_INSTANCE_ID		GPR_APM_MODULE_IID
+#define PRM_MODULE_INSTANCE_ID		GPR_PRM_MODULE_IID
+#define AMDB_MODULE_INSTANCE_ID		GPR_AMDB_MODULE_IID
+#define VCPM_MODULE_INSTANCE_ID		GPR_VCPM_MODULE_IID
+
+struct gpr_hdr {
+	uint32_t version:4;
+	uint32_t hdr_size:4;
+	uint32_t pkt_size:24;
+	uint32_t dest_domain:8;
+	uint32_t src_domain:8;
+	uint32_t reserved:16;
+	uint32_t src_port;
+	uint32_t dest_port;
+	uint32_t token;
+	uint32_t opcode;
+} __packed;
+
+struct gpr_pkt {
+	struct gpr_hdr hdr;
+	uint32_t payload[0];
+};
+
+struct gpr_resp_pkt {
+	struct gpr_hdr hdr;
+	void *payload;
+	int payload_size;
+};
+
+#define GPR_HDR_SIZE sizeof(struct gpr_hdr)
+#define GPR_PKT_VER	0x0
+#define GPR_PKT_HEADER_WORD_SIZE	((sizeof(struct gpr_pkt) + 3) >> 2)
+#define GPR_PKT_HEADER_BYTE_SIZE	(GPR_PKT_HEADER_WORD_SIZE << 2)
+#define GPR_DOMAIN_ID_MODEM	1
+#define GPR_DOMAIN_ID_ADSP	2
+#define GPR_DOMAIN_ID_APPS	3
+
+#define GPR_BASIC_RSP_RESULT 0x02001005
+struct gpr_ibasic_rsp_result_t {
+	uint32_t opcode;
+	uint32_t status;
+};
+
+#define GPR_BASIC_EVT_ACCEPTED 0x02001006
+struct gpr_ibasic_rsp_accepted_t {
+	uint32_t opcode;
+};
+
+extern struct bus_type gprbus;
+typedef int (*gpr_port_cb) (struct gpr_resp_pkt *d, void *priv, int op);
+
+struct gpr_port {
+	struct device *dev;
+	gpr_port_cb callback;
+	struct gpr *gpr;
+	spinlock_t lock;
+	int id;
+	void *priv;
+};
+
+#define GPR_NAME_SIZE	128
+struct gpr_device {
+	struct device	dev;
+	uint16_t	port_id;
+	uint16_t	domain_id;
+	uint32_t	version;
+	char name[GPR_NAME_SIZE];
+	struct gpr_port port;
+};
+
+#define to_gpr_device(d) container_of(d, struct gpr_device, dev)
+
+struct gpr_driver {
+	int	(*probe)(struct gpr_device *sl);
+	int	(*remove)(struct gpr_device *sl);
+	int (*callback)(struct gpr_resp_pkt *d, void *data, int op);
+	struct device_driver		driver;
+};
+
+#define to_gpr_driver(d) container_of(d, struct gpr_driver, driver)
+
+/*
+ * use a macro to avoid include chaining to get THIS_MODULE
+ */
+#define gpr_driver_register(drv) __gpr_driver_register(drv, THIS_MODULE)
+
+int __gpr_driver_register(struct gpr_driver *drv, struct module *owner);
+void gpr_driver_unregister(struct gpr_driver *drv);
+
+/**
+ * module_gpr_driver() - Helper macro for registering a aprbus driver
+ * @__aprbus_driver: aprbus_driver struct
+ *
+ * Helper macro for aprbus drivers which do not do anything special in
+ * module init/exit. This eliminates a lot of boilerplate. Each module
+ * may only use this macro once, and calling it replaces module_init()
+ * and module_exit()
+ */
+#define module_gpr_driver(__gpr_driver) \
+	module_driver(__gpr_driver, gpr_driver_register, \
+			gpr_driver_unregister)
+
+struct gpr_port *gpr_alloc_port(struct gpr_device *gdev, struct device *dev,
+				gpr_port_cb cb, void *priv);
+void gpr_free_port(struct gpr_port *port);
+
+struct gpr_pkt *gpr_alloc_pkt(struct gpr_port *port, int payload_size,
+			      uint32_t opcode, uint32_t token,
+			      uint32_t dest_port);
+void gpr_free_pkt(struct gpr_port *port, struct gpr_pkt *pkt);
+
+int gpr_send_port_pkt(struct gpr_port *port, struct gpr_pkt *pkt);
+static inline int gpr_send_pkt(struct gpr_device *gdev, struct gpr_pkt *pkt)
+{
+	return gpr_send_port_pkt(&gdev->port, pkt);
+}
+
+#endif /* __QCOM_GPR_H_ */
-- 
2.21.0

