Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9083E44CB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 13:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1DAC1683;
	Mon,  9 Aug 2021 13:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1DAC1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628508375;
	bh=o9/vcpx0mZFCrd2CXPMV0OGXddgLmM6Nb4TIfiT9ukE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g289G4ArcUKM7bXU29arXDlQ95H8mdVhGBQzexWzSs1Hx+v4+8TtsLc+Xi4/9MdBM
	 HcPMYmimRfprOIacL/1XS4YeVgapyskVXiK9BZZEhJjITwR+TY3+kiL3T3irxucndf
	 zagUZiEPCC2NQP9uyapYrkMU/WfTsPzjiVO6VBfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CA1F804AE;
	Mon,  9 Aug 2021 13:24:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CB7EF804D2; Mon,  9 Aug 2021 13:24:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A05CF800C8
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 13:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A05CF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eu5pY9FW"
Received: by mail-wm1-x32f.google.com with SMTP id u1so334494wmm.0
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 04:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mb/A8OAZr4+46r37MNQU/DLrZcqFJMwc4nAMj4//Jjc=;
 b=eu5pY9FW/kHGAwMPLRK3n59MK4WTEMqa3CgufZuL1CIC3hBW+SdhNLofxLMxruFgiP
 sLKSj9vDhw1ewtY/q9u/Xaj8hx6X+e/gg4SB1hjNFcYr1c+OwQHSFbDploQSU/+VYF/+
 kJGrX6XHqGaawjWXza4g77YZGWIlPLLsTZXZ/bHXyYMRSRjNPaTWJoOwqUYJbcvpEyeH
 DTNtC5OsJzMZQpF2HQDpQ0rJmq/kqtD+cf0b2yTuzgERSb9dq20emqqBnk/Tqe8yqJ5Z
 q0fiWZgiZRvSyZEFF9oPNIlXLn7yZe1wI0ke/fhfB3+kz9Skse5/wN8Dv1qtTOilRVCN
 2vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mb/A8OAZr4+46r37MNQU/DLrZcqFJMwc4nAMj4//Jjc=;
 b=kbv0FzacZ2hisd7u527fOw01K5Ssp6KVM7zUecL1KdHV8MItt6Crmo6lqFy91pooRI
 dgA/TzMJ/20kt4Ro3fi5GDYCGGIgLawv5DH/OnU3prO9JlEmmRyVyd0NGLxUIdvdTzFI
 Saf8e6T8rYBv3QeceOCSGyRxnyp4FTnandWmMQC+hwfVIzFuNhy4QWtyUBF5kmPpE3kr
 CNtcbBtVqs6HQ0DowqsVRLOEYSi/NAEoSlpuQwjKxSqP3VB6+uEf5UH4iRVFrPhQpjB+
 OqKs8WNRg08l+ZM5LK7DKwrrKZ8S1rF9SKcTKzgOIhz4N0nI+P0sdqZeIzXlzfafyHPb
 mkdg==
X-Gm-Message-State: AOAM533upt4PlzFBzjqhybxgRmtgj/IXSNCizNX6Tfl2U0DV178bO4qr
 W0f1MMMOp8a3YznnenXpp3gnzA==
X-Google-Smtp-Source: ABdhPJysMWSa6q/wLlrOUuLGhaldjIu4tVnNDVSGXPu1XKzx3BTOHULU3b4x4hMthpB6UUXq1IngbA==
X-Received: by 2002:a1c:f306:: with SMTP id q6mr15854580wmq.129.1628508272036; 
 Mon, 09 Aug 2021 04:24:32 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b80sm7774900wmb.2.2021.08.09.04.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 04:24:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v4 02/20] soc: qcom: apr: make code more reuseable
Date: Mon,  9 Aug 2021 12:23:21 +0100
Message-Id: <20210809112339.8368-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
References: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
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

APR and other packet routers like GPR are pretty much same and
interact with other drivers in similar way.

Ex: GPR ports can be considered as APR services, only difference
is they are allocated dynamically.

Other difference is packet layout, which should not matter
with the apis abstracted. Apart from this the rest of the
functionality is pretty much identical across APR and GPR.

Make the apr code more reusable by abstracting it service level,
rather than device level so that we do not need to write
new drivers for other new packet routers like GPR.

This patch is in preparation to add GPR support to this driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soc/qcom/apr.c       | 124 +++++++++++++++++++++--------------
 include/linux/soc/qcom/apr.h |  12 +++-
 2 files changed, 86 insertions(+), 50 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 7abfc8c4fdc7..1a81dcfc3ff3 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -15,13 +15,18 @@
 #include <linux/rpmsg.h>
 #include <linux/of.h>
 
-struct apr {
+enum {
+	PR_TYPE_APR = 0,
+};
+
+struct packet_router {
 	struct rpmsg_endpoint *ch;
 	struct device *dev;
 	spinlock_t svcs_lock;
 	spinlock_t rx_lock;
 	struct idr svcs_idr;
 	int dest_domain_id;
+	int type;
 	struct pdr_handle *pdr;
 	struct workqueue_struct *rxwq;
 	struct work_struct rx_work;
@@ -44,21 +49,21 @@ struct apr_rx_buf {
  */
 int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt)
 {
-	struct apr *apr = dev_get_drvdata(adev->dev.parent);
+	struct packet_router *apr = dev_get_drvdata(adev->dev.parent);
 	struct apr_hdr *hdr;
 	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&adev->lock, flags);
+	spin_lock_irqsave(&adev->svc.lock, flags);
 
 	hdr = &pkt->hdr;
 	hdr->src_domain = APR_DOMAIN_APPS;
-	hdr->src_svc = adev->svc_id;
+	hdr->src_svc = adev->svc.id;
 	hdr->dest_domain = adev->domain_id;
-	hdr->dest_svc = adev->svc_id;
+	hdr->dest_svc = adev->svc.id;
 
 	ret = rpmsg_trysend(apr->ch, pkt, hdr->pkt_size);
-	spin_unlock_irqrestore(&adev->lock, flags);
+	spin_unlock_irqrestore(&adev->svc.lock, flags);
 
 	return ret ? ret : hdr->pkt_size;
 }
@@ -74,7 +79,7 @@ static void apr_dev_release(struct device *dev)
 static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 				  int len, void *priv, u32 addr)
 {
-	struct apr *apr = dev_get_drvdata(&rpdev->dev);
+	struct packet_router *apr = dev_get_drvdata(&rpdev->dev);
 	struct apr_rx_buf *abuf;
 	unsigned long flags;
 
@@ -100,11 +105,11 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 	return 0;
 }
 
-
-static int apr_do_rx_callback(struct apr *apr, struct apr_rx_buf *abuf)
+static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf)
 {
 	uint16_t hdr_size, msg_type, ver, svc_id;
-	struct apr_device *svc = NULL;
+	struct pkt_router_svc *svc;
+	struct apr_device *adev;
 	struct apr_driver *adrv = NULL;
 	struct apr_resp_pkt resp;
 	struct apr_hdr *hdr;
@@ -145,12 +150,15 @@ static int apr_do_rx_callback(struct apr *apr, struct apr_rx_buf *abuf)
 	svc_id = hdr->dest_svc;
 	spin_lock_irqsave(&apr->svcs_lock, flags);
 	svc = idr_find(&apr->svcs_idr, svc_id);
-	if (svc && svc->dev.driver)
-		adrv = to_apr_driver(svc->dev.driver);
+	if (svc && svc->dev->driver) {
+		adev = svc_to_apr_device(svc);
+		adrv = to_apr_driver(adev->dev.driver);
+	}
 	spin_unlock_irqrestore(&apr->svcs_lock, flags);
 
-	if (!adrv) {
-		dev_err(apr->dev, "APR: service is not registered\n");
+	if (!adrv || !adev) {
+		dev_err(apr->dev, "APR: service is not registered (%d)\n",
+			svc_id);
 		return -EINVAL;
 	}
 
@@ -164,20 +172,26 @@ static int apr_do_rx_callback(struct apr *apr, struct apr_rx_buf *abuf)
 	if (resp.payload_size > 0)
 		resp.payload = buf + hdr_size;
 
-	adrv->callback(svc, &resp);
+	adrv->callback(adev, &resp);
 
 	return 0;
 }
 
 static void apr_rxwq(struct work_struct *work)
 {
-	struct apr *apr = container_of(work, struct apr, rx_work);
+	struct packet_router *apr = container_of(work, struct packet_router, rx_work);
 	struct apr_rx_buf *abuf, *b;
 	unsigned long flags;
 
 	if (!list_empty(&apr->rx_list)) {
 		list_for_each_entry_safe(abuf, b, &apr->rx_list, node) {
-			apr_do_rx_callback(apr, abuf);
+			switch (apr->type) {
+			case PR_TYPE_APR:
+				apr_do_rx_callback(apr, abuf);
+				break;
+			default:
+				break;
+			}
 			spin_lock_irqsave(&apr->rx_lock, flags);
 			list_del(&abuf->node);
 			spin_unlock_irqrestore(&apr->rx_lock, flags);
@@ -201,7 +215,7 @@ static int apr_device_match(struct device *dev, struct device_driver *drv)
 
 	while (id->domain_id != 0 || id->svc_id != 0) {
 		if (id->domain_id == adev->domain_id &&
-		    id->svc_id == adev->svc_id)
+		    id->svc_id == adev->svc.id)
 			return 1;
 		id++;
 	}
@@ -221,14 +235,14 @@ static int apr_device_remove(struct device *dev)
 {
 	struct apr_device *adev = to_apr_device(dev);
 	struct apr_driver *adrv;
-	struct apr *apr = dev_get_drvdata(adev->dev.parent);
+	struct packet_router *apr = dev_get_drvdata(adev->dev.parent);
 
 	if (dev->driver) {
 		adrv = to_apr_driver(dev->driver);
 		if (adrv->remove)
 			adrv->remove(adev);
 		spin_lock(&apr->svcs_lock);
-		idr_remove(&apr->svcs_idr, adev->svc_id);
+		idr_remove(&apr->svcs_idr, adev->svc.id);
 		spin_unlock(&apr->svcs_lock);
 	}
 
@@ -257,28 +271,39 @@ struct bus_type aprbus = {
 EXPORT_SYMBOL_GPL(aprbus);
 
 static int apr_add_device(struct device *dev, struct device_node *np,
-			  const struct apr_device_id *id)
+			  u32 svc_id, u32 domain_id)
 {
-	struct apr *apr = dev_get_drvdata(dev);
+	struct packet_router *apr = dev_get_drvdata(dev);
 	struct apr_device *adev = NULL;
+	struct pkt_router_svc *svc;
 	int ret;
 
 	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
 	if (!adev)
 		return -ENOMEM;
 
-	spin_lock_init(&adev->lock);
+	adev->svc_id = svc_id;
+	svc = &adev->svc;
+
+	svc->id = svc_id;
+	svc->pr = apr;
+	svc->priv = adev;
+	svc->dev = dev;
+	spin_lock_init(&svc->lock);
+
+	adev->domain_id = domain_id;
 
-	adev->svc_id = id->svc_id;
-	adev->domain_id = id->domain_id;
-	adev->version = id->svc_version;
 	if (np)
 		snprintf(adev->name, APR_NAME_SIZE, "%pOFn", np);
-	else
-		strscpy(adev->name, id->name, APR_NAME_SIZE);
 
-	dev_set_name(&adev->dev, "aprsvc:%s:%x:%x", adev->name,
-		     id->domain_id, id->svc_id);
+	switch (apr->type) {
+	case PR_TYPE_APR:
+		dev_set_name(&adev->dev, "aprsvc:%s:%x:%x", adev->name,
+			     domain_id, svc_id);
+		break;
+	default:
+		break;
+	}
 
 	adev->dev.bus = &aprbus;
 	adev->dev.parent = dev;
@@ -287,8 +312,7 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 	adev->dev.driver = NULL;
 
 	spin_lock(&apr->svcs_lock);
-	idr_alloc(&apr->svcs_idr, adev, id->svc_id,
-		  id->svc_id + 1, GFP_ATOMIC);
+	idr_alloc(&apr->svcs_idr, svc, svc_id, svc_id + 1, GFP_ATOMIC);
 	spin_unlock(&apr->svcs_lock);
 
 	of_property_read_string_index(np, "qcom,protection-domain",
@@ -308,7 +332,7 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 static int of_apr_add_pd_lookups(struct device *dev)
 {
 	const char *service_name, *service_path;
-	struct apr *apr = dev_get_drvdata(dev);
+	struct packet_router *apr = dev_get_drvdata(dev);
 	struct device_node *node;
 	struct pdr_service *pds;
 	int ret;
@@ -338,13 +362,14 @@ static int of_apr_add_pd_lookups(struct device *dev)
 
 static void of_register_apr_devices(struct device *dev, const char *svc_path)
 {
-	struct apr *apr = dev_get_drvdata(dev);
+	struct packet_router *apr = dev_get_drvdata(dev);
 	struct device_node *node;
 	const char *service_path;
 	int ret;
 
 	for_each_child_of_node(dev->of_node, node) {
-		struct apr_device_id id = { {0} };
+		u32 svc_id;
+		u32 domain_id;
 
 		/*
 		 * This function is called with svc_path NULL during
@@ -374,13 +399,13 @@ static void of_register_apr_devices(struct device *dev, const char *svc_path)
 				continue;
 		}
 
-		if (of_property_read_u32(node, "reg", &id.svc_id))
+		if (of_property_read_u32(node, "reg", &svc_id))
 			continue;
 
-		id.domain_id = apr->dest_domain_id;
+		domain_id = apr->dest_domain_id;
 
-		if (apr_add_device(dev, node, &id))
-			dev_err(dev, "Failed to add apr %d svc\n", id.svc_id);
+		if (apr_add_device(dev, node, svc_id, domain_id))
+			dev_err(dev, "Failed to add apr %d svc\n", svc_id);
 	}
 }
 
@@ -400,7 +425,7 @@ static int apr_remove_device(struct device *dev, void *svc_path)
 
 static void apr_pd_status(int state, char *svc_path, void *priv)
 {
-	struct apr *apr = (struct apr *)priv;
+	struct packet_router *apr = (struct packet_router *)priv;
 
 	switch (state) {
 	case SERVREG_SERVICE_STATE_UP:
@@ -415,7 +440,7 @@ static void apr_pd_status(int state, char *svc_path, void *priv)
 static int apr_probe(struct rpmsg_device *rpdev)
 {
 	struct device *dev = &rpdev->dev;
-	struct apr *apr;
+	struct packet_router *apr;
 	int ret;
 
 	apr = devm_kzalloc(dev, sizeof(*apr), GFP_KERNEL);
@@ -423,8 +448,9 @@ static int apr_probe(struct rpmsg_device *rpdev)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(dev->of_node, "qcom,apr-domain", &apr->dest_domain_id);
+	apr->type = PR_TYPE_APR;
 	if (ret) {
-		dev_err(dev, "APR Domain ID not specified in DT\n");
+		dev_err(dev, "Domain ID not specified in DT\n");
 		return ret;
 	}
 
@@ -467,7 +493,7 @@ static int apr_probe(struct rpmsg_device *rpdev)
 
 static void apr_remove(struct rpmsg_device *rpdev)
 {
-	struct apr *apr = dev_get_drvdata(&rpdev->dev);
+	struct packet_router *apr = dev_get_drvdata(&rpdev->dev);
 
 	pdr_handle_release(apr->pdr);
 	device_for_each_child(&rpdev->dev, NULL, apr_remove_device);
@@ -504,20 +530,20 @@ void apr_driver_unregister(struct apr_driver *drv)
 }
 EXPORT_SYMBOL_GPL(apr_driver_unregister);
 
-static const struct of_device_id apr_of_match[] = {
+static const struct of_device_id pkt_router_of_match[] = {
 	{ .compatible = "qcom,apr"},
 	{ .compatible = "qcom,apr-v2"},
 	{}
 };
-MODULE_DEVICE_TABLE(of, apr_of_match);
+MODULE_DEVICE_TABLE(of, pkt_router_of_match);
 
-static struct rpmsg_driver apr_driver = {
+static struct rpmsg_driver packet_router_driver = {
 	.probe = apr_probe,
 	.remove = apr_remove,
 	.callback = apr_callback,
 	.drv = {
 		.name = "qcom,apr",
-		.of_match_table = apr_of_match,
+		.of_match_table = pkt_router_of_match,
 	},
 };
 
@@ -527,7 +553,7 @@ static int __init apr_init(void)
 
 	ret = bus_register(&aprbus);
 	if (!ret)
-		ret = register_rpmsg_driver(&apr_driver);
+		ret = register_rpmsg_driver(&packet_router_driver);
 	else
 		bus_unregister(&aprbus);
 
@@ -537,7 +563,7 @@ static int __init apr_init(void)
 static void __exit apr_exit(void)
 {
 	bus_unregister(&aprbus);
-	unregister_rpmsg_driver(&apr_driver);
+	unregister_rpmsg_driver(&packet_router_driver);
 }
 
 subsys_initcall(apr_init);
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 137f9f2ac4c3..7bca213a3f83 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -79,6 +79,15 @@ struct apr_resp_pkt {
 #define APR_SVC_MAJOR_VERSION(v)	((v >> 16) & 0xFF)
 #define APR_SVC_MINOR_VERSION(v)	(v & 0xFF)
 
+struct packet_router;
+struct pkt_router_svc {
+	struct device *dev;
+	struct packet_router *pr;
+	spinlock_t lock;
+	int id;
+	void *priv;
+};
+
 struct apr_device {
 	struct device	dev;
 	uint16_t	svc_id;
@@ -86,11 +95,12 @@ struct apr_device {
 	uint32_t	version;
 	char name[APR_NAME_SIZE];
 	const char *service_path;
-	spinlock_t	lock;
+	struct pkt_router_svc svc;
 	struct list_head node;
 };
 
 #define to_apr_device(d) container_of(d, struct apr_device, dev)
+#define svc_to_apr_device(d) container_of(d, struct apr_device, svc)
 
 struct apr_driver {
 	int	(*probe)(struct apr_device *sl);
-- 
2.21.0

