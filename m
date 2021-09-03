Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC253FFF18
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 804FF17AB;
	Fri,  3 Sep 2021 13:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 804FF17AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630668254;
	bh=4fIhknWPcdfzRb1YxDhRn1KMGVk75RICNajYaHCn9L0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6V/9/y2JMPUSc0lwifCquivc3IaQjy0utDuWLAGoFJoQzmg7fHFdNWNn7MnScMjM
	 V4lIyyARp6ZmSkUQaLJLOinxi8gdz4XZzirwsr3reG1dPxe4/kknfepQuU27Xf2VWv
	 KX03xe2cBJTKFQSUJm/r+GdQ/8lw6HLdoY8DHNmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BF38F804F1;
	Fri,  3 Sep 2021 13:21:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E5D1F804F2; Fri,  3 Sep 2021 13:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 519ECF800B5
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 519ECF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cLZbS6Zy"
Received: by mail-wr1-x432.google.com with SMTP id m9so7755568wrb.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 04:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFfdu/uODk0jypkXS1Nm9oV0W5uq3YCcN5TeP0tadKo=;
 b=cLZbS6ZyPBklwHVy0+W1Dps/Kkd6l+YyUIWXYiA03M+Kv0NuhQof4uCIZRX2uh3Zwv
 SGip9RaesQT26w/M7xHJGuaD0O/w5lKdfoULD914gmsL50dTkDbgoHnk4kezdPunIZ60
 LX6KwF/NR0oq2JZ0WFlPjHYc4O54zVOqv7h+4DajqwyTy2skXXnWFm/rBVbPX+GmPg/1
 ClmyQUopvY7NB399KIcB1+npLTrH3x5SigFPQJ5SEQEsv1EFGuCybMoGITkT/z4/xxb9
 OFXPgBuBsopE0/qUsUZUqvC7n0w9SnHoKvuvADyjMssDZ+5GDxgmooVR74zaN86Xig49
 aj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFfdu/uODk0jypkXS1Nm9oV0W5uq3YCcN5TeP0tadKo=;
 b=M7sxsRAiCOXMXR82PpfUiMJNak1ELdBJVF7vGhKOkTVTN+oZKCzlOPjus0Y5HJBIPk
 bG7EkbTTMgAHzOIb+PkTP1FRg+Bb4yxgy1hW8doPEI1VP1AQ2GkvMtfy2jfjTqsYogln
 0F9BlBBdoG1QEftaY0n8yH1f8jAbIod/OM3qpg/ZZ9syi8sSlkLffzmoWQX1ZzgI6vyG
 183zo7KAYbHvO8gIGWvVWR2NPMkdu7iaCu88crZFme8MZ1yZuHhV1jA6NdHSc8pbrYDp
 kZr7uJRJwoK1Ew6UBlFBdyEY0uXk7quS3vK5Xg1j9dJk7lLurha4TDwLqiP8CV2D+/qP
 IX6Q==
X-Gm-Message-State: AOAM5339zGjcNPh9K9jwItw1IlF9zMmAq9ycrLPVVPZTAmfaVLvizaGQ
 L7rvc8hueCdqPcyrHI0gVHZJVA==
X-Google-Smtp-Source: ABdhPJwPoSR+ArZ1m87w5nb8uWAkDzTTH2I7JjCJJW89vIWftugxzATo3vhK7vMu3aXjUcurWw+POg==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr3477506wra.245.1630668098367; 
 Fri, 03 Sep 2021 04:21:38 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f20sm3881877wmb.32.2021.09.03.04.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:21:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v5 05/21] soc: qcom: apr: Add GPR support
Date: Fri,  3 Sep 2021 12:20:16 +0100
Message-Id: <20210903112032.25834-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
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
 drivers/soc/qcom/apr.c       | 168 +++++++++++++++++++++++++++++++++--
 include/linux/soc/qcom/apr.h |  58 ++++++++++++
 3 files changed, 228 insertions(+), 6 deletions(-)

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
index 16990dc96688..1e46690e9fc7 100644
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
 
-	return adrv->probe(adev);
+	ret = adrv->probe(adev);
+	if (!ret)
+		adev->svc.callback = adrv->gpr_callback;
+
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
@@ -448,10 +597,16 @@ static int apr_probe(struct rpmsg_device *rpdev)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(dev->of_node, "qcom,domain", &apr->dest_domain_id);
-	if (ret) /* try deprecated apr-domain property */
-		ret = of_property_read_u32(dev->of_node, "qcom,apr-domain",
-					   &apr->dest_domain_id);
-	apr->type = PR_TYPE_APR;
+
+	if (of_device_is_compatible(dev->of_node, "qcom,gpr")) {
+		apr->type = PR_TYPE_GPR;
+	} else {
+		if (ret) /* try deprecated apr-domain property */
+			ret = of_property_read_u32(dev->of_node, "qcom,apr-domain",
+						   &apr->dest_domain_id);
+		apr->type = PR_TYPE_APR;
+	}
+
 	if (ret) {
 		dev_err(dev, "Domain ID not specified in DT\n");
 		return ret;
@@ -536,6 +691,7 @@ EXPORT_SYMBOL_GPL(apr_driver_unregister);
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

