Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDC27AAB66
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 10:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C11E96;
	Fri, 22 Sep 2023 10:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C11E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695369805;
	bh=mOfjTOE3CWyP3bmauR74phiOSf+Dz6WIXLBZsVqpoWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bzIfKR3ie8g0Noulq+4AqoHRYnJQQo5lVtK2zmKCd74kB2XpnfhFTrDifgMv9q6aN
	 vCVvb4zUpmW135jyzV+M5yTMHoPGKBrBXyiqTocxHr2V1poFpjiyqzC452ASx+I2LY
	 MYT2yREvO4VaQE7Lp9tUmxNXRXpn9Z1A4WcoOsmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C10A1F805D4; Fri, 22 Sep 2023 10:00:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2437F805D4;
	Fri, 22 Sep 2023 10:00:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB3DBF805DF; Fri, 22 Sep 2023 09:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62DE8F805C4
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 09:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62DE8F805C4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eM5ji/oK
Received: by mail.gandi.net (Postfix) with ESMTPA id 804A71BF204;
	Fri, 22 Sep 2023 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695369594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ACSV41BkWA0fKq39dfPL/AXLiyPkmOTVZUoZxLiKbNE=;
	b=eM5ji/oK2mtbgMmBhGUYdTj50HdURBVO614lILo24n57NzvRqlGSCQTKkH0IZgOODoVxjA
	vqCr7aBCGqOC6ZQ9KmuqCLKZyc2ndrkdYvR9bNzY7B45SAd/WRklrjCOQE8noLL6WHZ8Ia
	ugcnIp/Xc4ENj4i94MsG98GXpPWLxH0PrHnc5wmeQ0jX3SE2QWUZxItKU/1FfpS5BsdUu2
	89Wm0c55fEV58NS4sEiEPX0wVz2Dk0EgGyr+nGt0f7FikNkQuR8utMeY++PatFPXNq+Dif
	2o4dNOdOFiIqSmlAcvOkR3/0H6Id6iz6G+2UWwjVhFb/r19+9PUBLhh6uzKVag==
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
	Lee Jones <lee@kernel.org>,
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
Subject: [PATCH v6 09/30] soc: fsl: cpm1: qmc: Add support for child devices
Date: Fri, 22 Sep 2023 09:58:44 +0200
Message-ID: <20230922075913.422435-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922075913.422435-1-herve.codina@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: ZVNCF7P7ZTVBK7LKXZBBOS2J5TH7AEGL
X-Message-ID-Hash: ZVNCF7P7ZTVBK7LKXZBBOS2J5TH7AEGL
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

QMC child devices support is needed to avoid orphan DT nodes that use a
simple DT phandle to reference a QMC channel.

Allow to instantiate child devices and also extend the API to get the
qmc_chan using a child device.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 91 +++++++++++++++++++++++++++++++---------
 include/soc/fsl/qe/qmc.h |  2 +
 2 files changed, 73 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 459e0bbd723d..5da15a25600e 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1425,8 +1425,16 @@ static int qmc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qmc);
 
+	/* Populate channel related devices */
+	ret = devm_of_platform_populate(qmc->dev);
+	if (ret)
+		goto err_disable_txrx;
+
 	return 0;
 
+err_disable_txrx:
+	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, 0);
+
 err_disable_intr:
 	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
 
@@ -1467,26 +1475,16 @@ static struct platform_driver qmc_driver = {
 };
 module_platform_driver(qmc_driver);
 
-struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name)
+static struct qmc_chan *qmc_chan_get_from_qmc(struct device_node *qmc_np, unsigned int chan_index)
 {
-	struct of_phandle_args out_args;
 	struct platform_device *pdev;
 	struct qmc_chan *qmc_chan;
 	struct qmc *qmc;
-	int ret;
 
-	ret = of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0,
-					       &out_args);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	if (!of_match_node(qmc_driver.driver.of_match_table, out_args.np)) {
-		of_node_put(out_args.np);
+	if (!of_match_node(qmc_driver.driver.of_match_table, qmc_np))
 		return ERR_PTR(-EINVAL);
-	}
 
-	pdev = of_find_device_by_node(out_args.np);
-	of_node_put(out_args.np);
+	pdev = of_find_device_by_node(qmc_np);
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
 
@@ -1496,17 +1494,12 @@ struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phan
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	if (out_args.args_count != 1) {
+	if (chan_index >= ARRAY_SIZE(qmc->chans)) {
 		platform_device_put(pdev);
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (out_args.args[0] >= ARRAY_SIZE(qmc->chans)) {
-		platform_device_put(pdev);
-		return ERR_PTR(-EINVAL);
-	}
-
-	qmc_chan = qmc->chans[out_args.args[0]];
+	qmc_chan = qmc->chans[chan_index];
 	if (!qmc_chan) {
 		platform_device_put(pdev);
 		return ERR_PTR(-ENOENT);
@@ -1514,8 +1507,44 @@ struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phan
 
 	return qmc_chan;
 }
+
+struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name)
+{
+	struct of_phandle_args out_args;
+	struct qmc_chan *qmc_chan;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0,
+					       &out_args);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	if (out_args.args_count != 1) {
+		of_node_put(out_args.np);
+		return ERR_PTR(-EINVAL);
+	}
+
+	qmc_chan = qmc_chan_get_from_qmc(out_args.np, out_args.args[0]);
+	of_node_put(out_args.np);
+	return qmc_chan;
+}
 EXPORT_SYMBOL(qmc_chan_get_byphandle);
 
+struct qmc_chan *qmc_chan_get_bychild(struct device_node *np)
+{
+	struct device_node *qmc_np;
+	u32 chan_index;
+	int ret;
+
+	qmc_np = np->parent;
+	ret = of_property_read_u32(np, "reg", &chan_index);
+	if (ret)
+		return ERR_PTR(-EINVAL);
+
+	return qmc_chan_get_from_qmc(qmc_np, chan_index);
+}
+EXPORT_SYMBOL(qmc_chan_get_bychild);
+
 void qmc_chan_put(struct qmc_chan *chan)
 {
 	put_device(chan->qmc->dev);
@@ -1552,6 +1581,28 @@ struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev,
 }
 EXPORT_SYMBOL(devm_qmc_chan_get_byphandle);
 
+struct qmc_chan *devm_qmc_chan_get_bychild(struct device *dev,
+					   struct device_node *np)
+{
+	struct qmc_chan *qmc_chan;
+	struct qmc_chan **dr;
+
+	dr = devres_alloc(devm_qmc_chan_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	qmc_chan = qmc_chan_get_bychild(np);
+	if (!IS_ERR(qmc_chan)) {
+		*dr = qmc_chan;
+		devres_add(dev, dr);
+	} else {
+		devres_free(dr);
+	}
+
+	return qmc_chan;
+}
+EXPORT_SYMBOL(devm_qmc_chan_get_bychild);
+
 MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
 MODULE_DESCRIPTION("CPM QMC driver");
 MODULE_LICENSE("GPL");
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 6f1d6cebc9fe..166484bb4294 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -17,9 +17,11 @@ struct device;
 struct qmc_chan;
 
 struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name);
+struct qmc_chan *qmc_chan_get_bychild(struct device_node *np);
 void qmc_chan_put(struct qmc_chan *chan);
 struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev, struct device_node *np,
 					     const char *phandle_name);
+struct qmc_chan *devm_qmc_chan_get_bychild(struct device *dev, struct device_node *np);
 
 enum qmc_mode {
 	QMC_TRANSPARENT,
-- 
2.41.0

