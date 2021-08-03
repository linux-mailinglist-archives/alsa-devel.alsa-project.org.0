Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7023DEE62
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 14:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E97EC178E;
	Tue,  3 Aug 2021 14:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E97EC178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995410;
	bh=jBBLQx4QnRHHh0B0dMoMwDaBBCR5W5b+q6SOsP37Az8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FsYBzJLv/45R2rPiTpH0DIyNV0XBxbbu1V6cH5sR07JYC0QorCi5GbcZ0W6YO/L71
	 y2oDFlSW1UrWFJLu+zcyNJ2r/x2UIkM9WrM2GeBJDfFJdpR/ZRkGPpG47ys6xwPaz/
	 5vVpO11EI70qvSEO2q1gKmu5VvbwCVBZzTB8kCw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C90EF804EB;
	Tue,  3 Aug 2021 14:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5651F804E6; Tue,  3 Aug 2021 14:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0888F802E8
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0888F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vu59bJLx"
Received: by mail-wr1-x42d.google.com with SMTP id j2so25136396wrx.9
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLJU3iAYpHPJp8lS22w8m+UFekXnz7GFoXrZ5s6wET0=;
 b=vu59bJLxdadZwcIgEeEVQAh5ChQXh37saxzzt7Dqa5ho20Po3yr9PSkwLzrQpqkzpC
 HPRVc4/rKV+kErCSFguat16kfqxSIvNxQLfNhI5VkH+88KNEOS1wJGM+kRTMEBzWVqxL
 7ONgOmq5oFpHCP4Nf3T2GsFmM+PtAA/Io5taKWlacXqxAEK7BNc2Z3WJblOmU33sx5LA
 25OF01IMsnJIky+UnVSdM3YMY5MdpY47ZhMOHXDpu4cAMhdAYl4v7ovLiKLzBNsUIjeO
 XY8+sQYiJrX8l1yYxcLRScU7lrKX2mf0POXEEAJIj/CF+EYQTm+c7lU9GgUXAtiVHVe4
 RdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aLJU3iAYpHPJp8lS22w8m+UFekXnz7GFoXrZ5s6wET0=;
 b=Qw0mh0z6EdnHl6xD7jb5+K0KoXIe0FFjVQXj9Pz/fEAPxVxkifiX9YggMCAhQoT6Ed
 4Ll0JV5UpOuBdJb5CXRT6wYfdL+2wcQ58C8t/qy1JZH04IqErnAx2XdFWB79TQE6jVdT
 HxF1SZKXn3K8v0LkyiqCpZTcdBWsuA+r+iHoPsInE3G2eEsBeRD2IcEi+mcN+ky+k0lU
 wEhnDDpL2kWhT3ZenO9UyZG4Ksg2VZVgx8fxdLst3YhEnueYqESGLjFwhls3YXv4Cin1
 ATTrEckF61Lwck3bPp1esUNx0RgZg5XrQ9LTcFmJ5Z6NhXEoyeRwLdh9R6Ary7RgIkwS
 oZJA==
X-Gm-Message-State: AOAM532gIoHEhshbXl2KVchOlxuW3gMfeuhDBhVCoMm+aYZdkEj1fwjK
 SK46CKixVslDZ/8PV6NWClsfWg==
X-Google-Smtp-Source: ABdhPJwdA+RbBREQS+XSWNPAdSKbwN6GJZ59Sixl2FQ0q2bWejVi5gmHJMyO3/7FuwgC7CYZwBfLtA==
X-Received: by 2002:a5d:4521:: with SMTP id j1mr22057097wra.44.1627995267654; 
 Tue, 03 Aug 2021 05:54:27 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 04/20] soc: qcom: apr: Add GPR support
Date: Tue,  3 Aug 2021 13:53:55 +0100
Message-Id: <20210803125411.28066-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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
 drivers/soc/qcom/Kconfig     |   8 ++
 drivers/soc/qcom/apr.c       | 164 ++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/apr.h |  58 +++++++++++++
 3 files changed, 226 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79b568f82a1c..0b6e6412c98e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -209,4 +209,12 @@ config QCOM_APR
 	  application processor and QDSP6. APR is
 	  used by audio driver to configure QDSP6
 	  ASM, ADM and AFE modules.
+
+config QCOM_GPR
+	tristate "Qualcomm GPR Bus (Generic Packet Router)"
+	select QCOM_APR
+	help
+          Enable GPR IPC protocol support between
+          application processor and QDSP6. GPR is
+          used by audio driver to configure QDSP6.
 endmenu
diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 1a81dcfc3ff3..d1e479786d1a 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -17,8 +17,13 @@
 
 enum {
 	PR_TYPE_APR = 0,
+	PR_TYPE_GPR,
 };
 
+/* Some random values tbh which does not collide with static modules */
+#define GPR_DYNAMIC_PORT_START	0x10000000
+#define GPR_DYNAMIC_PORT_END	0x20000000
+
 struct packet_router {
 	struct rpmsg_endpoint *ch;
 	struct device *dev;
@@ -69,6 +74,85 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt)
 }
 EXPORT_SYMBOL_GPL(apr_send_pkt);
 
+void gpr_free_port(gpr_port_t *port)
+{
+	struct packet_router *gpr = port->pr;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpr->svcs_lock, flags);
+	idr_remove(&gpr->svcs_idr, port->id);
+	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
+
+	kfree(port);
+}
+EXPORT_SYMBOL_GPL(gpr_free_port);
+
+gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
+				gpr_port_cb cb,	void *priv)
+{
+	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
+	gpr_port_t *port;
+	struct pkt_router_svc *svc;
+	int id;
+
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return ERR_PTR(-ENOMEM);
+
+	svc = port;
+	svc->callback = cb;
+	svc->pr = pr;
+	svc->priv = priv;
+	svc->dev = dev;
+	spin_lock_init(&svc->lock);
+
+	spin_lock(&pr->svcs_lock);
+	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
+			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
+	if (id < 0) {
+		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
+		kfree(port);
+		spin_unlock(&pr->svcs_lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	svc->id = id;
+	spin_unlock(&pr->svcs_lock);
+
+	dev_info(dev, "Adding GPR src port (%x)\n", svc->id);
+
+	return port;
+}
+EXPORT_SYMBOL_GPL(gpr_alloc_port);
+
+static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *pkt)
+{
+	struct packet_router *pr = svc->pr;
+	struct gpr_hdr *hdr;
+	unsigned long flags;
+	int ret;
+
+	hdr = &pkt->hdr;
+
+	spin_lock_irqsave(&svc->lock, flags);
+	ret = rpmsg_trysend(pr->ch, pkt, hdr->pkt_size);
+	spin_unlock_irqrestore(&svc->lock, flags);
+
+	return ret ? ret : hdr->pkt_size;
+}
+
+int gpr_send_pkt(struct apr_device *gdev, struct gpr_pkt *pkt)
+{
+	return pkt_router_send_svc_pkt(&gdev->svc, pkt);
+}
+EXPORT_SYMBOL_GPL(gpr_send_pkt);
+
+int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt)
+{
+	return pkt_router_send_svc_pkt(port, pkt);
+}
+EXPORT_SYMBOL_GPL(gpr_send_port_pkt);
+
 static void apr_dev_release(struct device *dev)
 {
 	struct apr_device *adev = to_apr_device(dev);
@@ -177,6 +261,59 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 	return 0;
 }
 
+static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf)
+{
+	uint16_t hdr_size, ver;
+	struct pkt_router_svc *svc = NULL;
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
+	spin_lock_irqsave(&gpr->svcs_lock, flags);
+	svc = idr_find(&gpr->svcs_idr, hdr->dest_port);
+	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
+
+	if (!svc) {
+		dev_err(gpr->dev, "GPR: Port(%x) is not registered\n",
+			hdr->dest_port);
+		return -EINVAL;
+	}
+
+	if (svc->callback)
+		svc->callback(&resp, svc->priv, 0);
+
+	return 0;
+}
+
 static void apr_rxwq(struct work_struct *work)
 {
 	struct packet_router *apr = container_of(work, struct packet_router, rx_work);
@@ -189,6 +326,9 @@ static void apr_rxwq(struct work_struct *work)
 			case PR_TYPE_APR:
 				apr_do_rx_callback(apr, abuf);
 				break;
+			case PR_TYPE_GPR:
+				gpr_do_rx_callback(apr, abuf);
+				break;
 			default:
 				break;
 			}
@@ -227,8 +367,13 @@ static int apr_device_probe(struct device *dev)
 {
 	struct apr_device *adev = to_apr_device(dev);
 	struct apr_driver *adrv = to_apr_driver(dev->driver);
+	int ret;
+
+	ret = adrv->probe(adev);
+	if (!ret)
+		adev->svc.callback = adrv->gpr_callback;
 
-	return adrv->probe(adev);
+	return ret;
 }
 
 static int apr_device_remove(struct device *dev)
@@ -301,6 +446,10 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 		dev_set_name(&adev->dev, "aprsvc:%s:%x:%x", adev->name,
 			     domain_id, svc_id);
 		break;
+	case PR_TYPE_GPR:
+		dev_set_name(&adev->dev, "gprsvc:%s:%x:%x", adev->name,
+			     domain_id, svc_id);
+		break;
 	default:
 		break;
 	}
@@ -318,7 +467,7 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 	of_property_read_string_index(np, "qcom,protection-domain",
 				      1, &adev->service_path);
 
-	dev_info(dev, "Adding APR dev: %s\n", dev_name(&adev->dev));
+	dev_info(dev, "Adding APR/GPR dev: %s\n", dev_name(&adev->dev));
 
 	ret = device_register(&adev->dev);
 	if (ret) {
@@ -447,8 +596,14 @@ static int apr_probe(struct rpmsg_device *rpdev)
 	if (!apr)
 		return -ENOMEM;
 
-	ret = of_property_read_u32(dev->of_node, "qcom,apr-domain", &apr->dest_domain_id);
-	apr->type = PR_TYPE_APR;
+	if (of_device_is_compatible(dev->of_node, "qcom,gpr")) {
+		ret = of_property_read_u32(dev->of_node, "qcom,gpr-domain", &apr->dest_domain_id);
+		apr->type = PR_TYPE_GPR;
+	} else {
+		ret = of_property_read_u32(dev->of_node, "qcom,apr-domain", &apr->dest_domain_id);
+		apr->type = PR_TYPE_APR;
+	}
+
 	if (ret) {
 		dev_err(dev, "Domain ID not specified in DT\n");
 		return ret;
@@ -533,6 +688,7 @@ EXPORT_SYMBOL_GPL(apr_driver_unregister);
 static const struct of_device_id pkt_router_of_match[] = {
 	{ .compatible = "qcom,apr"},
 	{ .compatible = "qcom,apr-v2"},
+	{ .compatible = "qcom,gpr"},
 	{}
 };
 MODULE_DEVICE_TABLE(of, pkt_router_of_match);
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 7bca213a3f83..a45373260128 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 #include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 extern struct bus_type aprbus;
 
@@ -75,19 +76,65 @@ struct apr_resp_pkt {
 	int payload_size;
 };
 
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
+#define GPR_HDR_SIZE			sizeof(struct gpr_hdr)
+#define GPR_PKT_VER			0x0
+#define GPR_PKT_HEADER_WORD_SIZE	((sizeof(struct gpr_pkt) + 3) >> 2)
+#define GPR_PKT_HEADER_BYTE_SIZE	(GPR_PKT_HEADER_WORD_SIZE << 2)
+
+#define GPR_BASIC_RSP_RESULT		0x02001005
+
+struct gpr_ibasic_rsp_result_t {
+	uint32_t opcode;
+	uint32_t status;
+};
+
+#define GPR_BASIC_EVT_ACCEPTED		0x02001006
+
+struct gpr_ibasic_rsp_accepted_t {
+	uint32_t opcode;
+};
+
 /* Bits 0 to 15 -- Minor version,  Bits 16 to 31 -- Major version */
 #define APR_SVC_MAJOR_VERSION(v)	((v >> 16) & 0xFF)
 #define APR_SVC_MINOR_VERSION(v)	(v & 0xFF)
 
+typedef int (*gpr_port_cb) (struct gpr_resp_pkt *d, void *priv, int op);
 struct packet_router;
 struct pkt_router_svc {
 	struct device *dev;
+	gpr_port_cb callback;
 	struct packet_router *pr;
 	spinlock_t lock;
 	int id;
 	void *priv;
 };
 
+typedef struct pkt_router_svc gpr_port_t;
+
 struct apr_device {
 	struct device	dev;
 	uint16_t	svc_id;
@@ -99,6 +146,8 @@ struct apr_device {
 	struct list_head node;
 };
 
+typedef struct apr_device gpr_device_t;
+
 #define to_apr_device(d) container_of(d, struct apr_device, dev)
 #define svc_to_apr_device(d) container_of(d, struct apr_device, svc)
 
@@ -107,10 +156,12 @@ struct apr_driver {
 	int	(*remove)(struct apr_device *sl);
 	int	(*callback)(struct apr_device *a,
 			    struct apr_resp_pkt *d);
+	int	(*gpr_callback)(struct gpr_resp_pkt *d, void *data, int op);
 	struct device_driver		driver;
 	const struct apr_device_id	*id_table;
 };
 
+typedef struct apr_driver gpr_driver_t;
 #define to_apr_driver(d) container_of(d, struct apr_driver, driver)
 
 /*
@@ -133,7 +184,14 @@ void apr_driver_unregister(struct apr_driver *drv);
 #define module_apr_driver(__apr_driver) \
 	module_driver(__apr_driver, apr_driver_register, \
 			apr_driver_unregister)
+#define module_gpr_driver(__gpr_driver) module_apr_driver(__gpr_driver)
 
 int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt);
 
+gpr_port_t *gpr_alloc_port(gpr_device_t *gdev, struct device *dev,
+				gpr_port_cb cb, void *priv);
+void gpr_free_port(gpr_port_t *port);
+int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt);
+int gpr_send_pkt(gpr_device_t *gdev, struct gpr_pkt *pkt);
+
 #endif /* __QCOM_APR_H_ */
-- 
2.21.0

