Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81C90FF79
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 10:52:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5E3DF9;
	Thu, 20 Jun 2024 10:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5E3DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718873526;
	bh=D7OEHiuwtCmqscXQl50KmY2kl3bSEyKNKVR8ivbxxAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V9k/Bc4urUi902a87UfWyCw0uQ4g4sQEJ5hj+YScA08dUc3YWCHc5x164Fpzm6zKx
	 cIwDQUw3NTGiV0m7POFEMesFeau+HoRMwXjHygKM5/WghMQLVrHwAQ9JTXUrGZG2yl
	 NQveNlloxhGgxKH7WUb2hwt74IPKrXWjHDgnH3cg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1E27F8068A; Thu, 20 Jun 2024 10:50:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFDEFF8065E;
	Thu, 20 Jun 2024 10:50:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A35E9F80236; Thu, 20 Jun 2024 10:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DCCFF80578
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 10:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DCCFF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jGNmymnm
Received: by mail.gandi.net (Postfix) with ESMTPA id 3FE7820013;
	Thu, 20 Jun 2024 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718872998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whVnLEA8ZlMjzaDgw2XCJrm9u7TT3FhF+CXLz0Vls7M=;
	b=jGNmymnmfvAR6A9q/BlIf7N42FT7M+vILYHL1nny2UG+6idM7bZWmfTdX0lHc3JWpACMxI
	/mdk64X8GVSIgLjV3LZVF+cgYYl0+WqPlujHKbZCV+bp/rKuFM7R21vJqkh841XhCDdFvK
	7bn28mjEptskNmS+oFjKyw0JHrXkzzvHS6AKmGzjESGZbrJEccVCmnPk3ZdXH5Fk6PiziB
	SHTv+aBeFgQFgl/khW1AH9M/UG/DStZqz2SzolNy9bNImKcmlAdJ3TvmHgTZ0MFnFPaNzD
	x7GVpoCOYOs0PpvFKOTK8gizo2QRP1qg9oBGFD56fZRkAfOADZMeoCqb+p6fkg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 07/10] soc: fsl: cpm1: qmc: Introduce functions to get a
 channel from a phandle list
Date: Thu, 20 Jun 2024 10:42:54 +0200
Message-ID: <20240620084300.397853-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240620084300.397853-1-herve.codina@bootlin.com>
References: <20240620084300.397853-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: SCUVMKJVD4GHCBDAOWL3LU4NMDY3EWZI
X-Message-ID-Hash: SCUVMKJVD4GHCBDAOWL3LU4NMDY3EWZI
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCUVMKJVD4GHCBDAOWL3LU4NMDY3EWZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

qmc_chan_get_byphandle() and the resource managed version retrieve a
channel from a simple phandle.

Extend the API and introduce qmc_chan_get_byphandles_index() and the
resource managed version in order to retrieve a channel from a phandle
list using the provided index to identify the phandle in the list.

Also update qmc_chan_get_byphandle() and the resource managed version to
use qmc_chan_get_byphandles_index() and so avoid code duplication.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 19 +++++++++++--------
 include/soc/fsl/qe/qmc.h | 25 ++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index f498db9abe35..e23d60018400 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1777,13 +1777,15 @@ static struct qmc_chan *qmc_chan_get_from_qmc(struct device_node *qmc_np, unsign
 	return qmc_chan;
 }
 
-struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name)
+struct qmc_chan *qmc_chan_get_byphandles_index(struct device_node *np,
+					       const char *phandles_name,
+					       int index)
 {
 	struct of_phandle_args out_args;
 	struct qmc_chan *qmc_chan;
 	int ret;
 
-	ret = of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0,
+	ret = of_parse_phandle_with_fixed_args(np, phandles_name, 1, index,
 					       &out_args);
 	if (ret < 0)
 		return ERR_PTR(ret);
@@ -1797,7 +1799,7 @@ struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phan
 	of_node_put(out_args.np);
 	return qmc_chan;
 }
-EXPORT_SYMBOL(qmc_chan_get_byphandle);
+EXPORT_SYMBOL(qmc_chan_get_byphandles_index);
 
 struct qmc_chan *qmc_chan_get_bychild(struct device_node *np)
 {
@@ -1827,9 +1829,10 @@ static void devm_qmc_chan_release(struct device *dev, void *res)
 	qmc_chan_put(*qmc_chan);
 }
 
-struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev,
-					     struct device_node *np,
-					     const char *phandle_name)
+struct qmc_chan *devm_qmc_chan_get_byphandles_index(struct device *dev,
+						    struct device_node *np,
+						    const char *phandles_name,
+						    int index)
 {
 	struct qmc_chan *qmc_chan;
 	struct qmc_chan **dr;
@@ -1838,7 +1841,7 @@ struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev,
 	if (!dr)
 		return ERR_PTR(-ENOMEM);
 
-	qmc_chan = qmc_chan_get_byphandle(np, phandle_name);
+	qmc_chan = qmc_chan_get_byphandles_index(np, phandles_name, index);
 	if (!IS_ERR(qmc_chan)) {
 		*dr = qmc_chan;
 		devres_add(dev, dr);
@@ -1848,7 +1851,7 @@ struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev,
 
 	return qmc_chan;
 }
-EXPORT_SYMBOL(devm_qmc_chan_get_byphandle);
+EXPORT_SYMBOL(devm_qmc_chan_get_byphandles_index);
 
 struct qmc_chan *devm_qmc_chan_get_bychild(struct device *dev,
 					   struct device_node *np)
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 2a333fc1ea81..0fa7205145ce 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -16,11 +16,30 @@ struct device_node;
 struct device;
 struct qmc_chan;
 
-struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name);
+struct qmc_chan *qmc_chan_get_byphandles_index(struct device_node *np,
+					       const char *phandles_name,
+					       int index);
+struct qmc_chan *devm_qmc_chan_get_byphandles_index(struct device *dev,
+						    struct device_node *np,
+						    const char *phandles_name,
+						    int index);
+
+static inline struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np,
+						      const char *phandle_name)
+{
+	return qmc_chan_get_byphandles_index(np, phandle_name, 0);
+}
+
+static inline struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev,
+							   struct device_node *np,
+							   const char *phandle_name)
+{
+	return devm_qmc_chan_get_byphandles_index(dev, np, phandle_name, 0);
+}
+
 struct qmc_chan *qmc_chan_get_bychild(struct device_node *np);
 void qmc_chan_put(struct qmc_chan *chan);
-struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev, struct device_node *np,
-					     const char *phandle_name);
+
 struct qmc_chan *devm_qmc_chan_get_bychild(struct device *dev, struct device_node *np);
 
 enum qmc_mode {
-- 
2.45.0

