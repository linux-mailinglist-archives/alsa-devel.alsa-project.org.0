Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BBF8C9E29
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E2D614F;
	Mon, 20 May 2024 15:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E2D614F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716211783;
	bh=P1QTXWHPbu5gQmDd7c8edEaPzzs3pyfYI80ZSxiOZ6s=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Z8XJNp85/9P14WcE7UQEXk1nxp7AuwsVXiuuNqjRGDYxsz07dyvSsu0Mh6Na9zLgQ
	 dIGqjiUGX1vMF+iUe3ebnNzBuFHGMfvf5T6SgloIsPqkUUpLqPWDJCJS5YecMgZdde
	 RRMY5q3NiU9fI9IEuTSdQ8L7Y3M+hqNDXOCCIfC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01609F80617; Mon, 20 May 2024 15:28:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F89FF80615;
	Mon, 20 May 2024 15:28:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD3DDF805B4; Mon, 20 May 2024 14:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32E4EF805B3
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32E4EF805B3
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 867301A0FAF;
	Fri, 17 May 2024 12:05:36 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EA3551A0FB1;
	Fri, 17 May 2024 12:05:35 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5559D181D0FF;
	Fri, 17 May 2024 18:05:34 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] ASoC: fsl_mqs: Add i.MX95 platform support
Date: Fri, 17 May 2024 17:45:46 +0800
Message-Id: <1715939146-13031-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715939146-13031-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715939146-13031-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: SVIEDSMHLVVDV4IXGQYYYT7SQ254KJYG
X-Message-ID-Hash: SVIEDSMHLVVDV4IXGQYYYT7SQ254KJYG
X-MailFrom: shengjiu.wang@nxp.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On i.MX95 there are two MQS instances, so "fsl,mqs-ctrl"
need to be used to distinguish them. Only can list the
settings of one instance in soc data.

As "fsl,mqs-ctrl" is optional, if this property does not exist,
the driver will use soc data to configure the MQS module.

On i.MX95 one instance in wakeup-mix is supported by this
commit, another instance in always-on-mix is not supported,
which depends on System Manager function readiness, but it
can also benefit from the new property.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 106 ++++++++++++++++++++++++++++++++--------
 1 file changed, 86 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 60929c36a0e3..3d69ac5736c8 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -28,10 +28,16 @@
 #define MQS_CLK_DIV_MASK		(0xFF << 0)
 #define MQS_CLK_DIV_SHIFT		(0)
 
+enum reg_type {
+	TYPE_REG_OWN,  /* module own register space */
+	TYPE_REG_GPR,  /* register in GPR space */
+	TYPE_REG_SM,   /* System Manager controls the register */
+};
+
 /**
  * struct fsl_mqs_soc_data - soc specific data
  *
- * @use_gpr: control register is in General Purpose Register group
+ * @type: control register space type
  * @ctrl_off: control register offset
  * @en_mask: enable bit mask
  * @en_shift: enable bit shift
@@ -43,7 +49,7 @@
  * @div_shift: clock divider bit shift
  */
 struct fsl_mqs_soc_data {
-	bool use_gpr;
+	enum reg_type type;
 	int  ctrl_off;
 	int  en_mask;
 	int  en_shift;
@@ -60,7 +66,7 @@ struct fsl_mqs {
 	struct regmap *regmap;
 	struct clk *mclk;
 	struct clk *ipg;
-	const struct fsl_mqs_soc_data *soc;
+	struct fsl_mqs_soc_data soc;
 
 	unsigned int reg_mqs_ctrl;
 };
@@ -90,11 +96,11 @@ static int fsl_mqs_hw_params(struct snd_pcm_substream *substream,
 	res = mclk_rate % (32 * lrclk * 2 * 8);
 
 	if (res == 0 && div > 0 && div <= 256) {
-		regmap_update_bits(mqs_priv->regmap, mqs_priv->soc->ctrl_off,
-				   mqs_priv->soc->div_mask,
-				   (div - 1) << mqs_priv->soc->div_shift);
-		regmap_update_bits(mqs_priv->regmap, mqs_priv->soc->ctrl_off,
-				   mqs_priv->soc->osr_mask, 0);
+		regmap_update_bits(mqs_priv->regmap, mqs_priv->soc.ctrl_off,
+				   mqs_priv->soc.div_mask,
+				   (div - 1) << mqs_priv->soc.div_shift);
+		regmap_update_bits(mqs_priv->regmap, mqs_priv->soc.ctrl_off,
+				   mqs_priv->soc.osr_mask, 0);
 	} else {
 		dev_err(component->dev, "can't get proper divider\n");
 	}
@@ -135,9 +141,9 @@ static int fsl_mqs_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct fsl_mqs *mqs_priv = snd_soc_component_get_drvdata(component);
 
-	regmap_update_bits(mqs_priv->regmap, mqs_priv->soc->ctrl_off,
-			   mqs_priv->soc->en_mask,
-			   1 << mqs_priv->soc->en_shift);
+	regmap_update_bits(mqs_priv->regmap, mqs_priv->soc.ctrl_off,
+			   mqs_priv->soc.en_mask,
+			   1 << mqs_priv->soc.en_shift);
 	return 0;
 }
 
@@ -147,8 +153,8 @@ static void fsl_mqs_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct fsl_mqs *mqs_priv = snd_soc_component_get_drvdata(component);
 
-	regmap_update_bits(mqs_priv->regmap, mqs_priv->soc->ctrl_off,
-			   mqs_priv->soc->en_mask, 0);
+	regmap_update_bits(mqs_priv->regmap, mqs_priv->soc.ctrl_off,
+			   mqs_priv->soc.en_mask, 0);
 }
 
 static const struct snd_soc_component_driver soc_codec_fsl_mqs = {
@@ -182,9 +188,50 @@ static const struct regmap_config fsl_mqs_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
+static int fsl_mqs_set_soc_data_from_of(struct device_node *np,
+					struct fsl_mqs_soc_data *soc)
+{
+	char *propname = "fsl,mqs-ctrl";
+	int elems, index;
+	int ret;
+
+	elems = of_property_count_u32_elems(np, propname);
+	if (elems == 6) {
+		index = 0;
+
+		ret = of_property_read_u32_index(np, propname, index++, &soc->type);
+		if (ret)
+			return -EINVAL;
+
+		ret = of_property_read_u32_index(np, propname, index++, &soc->ctrl_off);
+		if (ret)
+			return -EINVAL;
+		ret = of_property_read_u32_index(np, propname, index++, &soc->en_shift);
+		if (ret)
+			return -EINVAL;
+		ret = of_property_read_u32_index(np, propname, index++, &soc->rst_shift);
+		if (ret)
+			return -EINVAL;
+		ret = of_property_read_u32_index(np, propname, index++, &soc->osr_shift);
+		if (ret)
+			return -EINVAL;
+		ret = of_property_read_u32_index(np, propname, index++, &soc->div_shift);
+		if (ret)
+			return -EINVAL;
+
+		soc->en_mask  = 1 << soc->en_shift;
+		soc->rst_mask = 1 << soc->rst_shift;
+		soc->osr_mask = 1 << soc->osr_shift;
+		soc->div_mask = 0xFF << soc->div_shift;
+	}
+
+	return 0;
+}
+
 static int fsl_mqs_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	const struct fsl_mqs_soc_data *soc_data;
 	struct device_node *gpr_np = NULL;
 	struct fsl_mqs *mqs_priv;
 	void __iomem *regs;
@@ -198,9 +245,14 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 	 * But in i.MX8QM/i.MX8QXP the control register is moved
 	 * to its own domain.
 	 */
-	mqs_priv->soc = of_device_get_match_data(&pdev->dev);
+	soc_data = of_device_get_match_data(&pdev->dev);
+	mqs_priv->soc = *soc_data;
+
+	ret = fsl_mqs_set_soc_data_from_of(np, &mqs_priv->soc);
+	if (ret)
+		return ret;
 
-	if (mqs_priv->soc->use_gpr) {
+	if (mqs_priv->soc.type == TYPE_REG_GPR) {
 		gpr_np = of_parse_phandle(np, "gpr", 0);
 		if (!gpr_np) {
 			dev_err(&pdev->dev, "failed to get gpr node by phandle\n");
@@ -278,7 +330,7 @@ static int fsl_mqs_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	regmap_write(mqs_priv->regmap, mqs_priv->soc->ctrl_off, mqs_priv->reg_mqs_ctrl);
+	regmap_write(mqs_priv->regmap, mqs_priv->soc.ctrl_off, mqs_priv->reg_mqs_ctrl);
 	return 0;
 }
 
@@ -286,7 +338,7 @@ static int fsl_mqs_runtime_suspend(struct device *dev)
 {
 	struct fsl_mqs *mqs_priv = dev_get_drvdata(dev);
 
-	regmap_read(mqs_priv->regmap, mqs_priv->soc->ctrl_off, &mqs_priv->reg_mqs_ctrl);
+	regmap_read(mqs_priv->regmap, mqs_priv->soc.ctrl_off, &mqs_priv->reg_mqs_ctrl);
 
 	clk_disable_unprepare(mqs_priv->mclk);
 	clk_disable_unprepare(mqs_priv->ipg);
@@ -304,7 +356,7 @@ static const struct dev_pm_ops fsl_mqs_pm_ops = {
 };
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx8qm_data = {
-	.use_gpr = false,
+	.type = TYPE_REG_OWN,
 	.ctrl_off = REG_MQS_CTRL,
 	.en_mask  = MQS_EN_MASK,
 	.en_shift = MQS_EN_SHIFT,
@@ -317,7 +369,7 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx8qm_data = {
 };
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx6sx_data = {
-	.use_gpr = true,
+	.type = TYPE_REG_GPR,
 	.ctrl_off = IOMUXC_GPR2,
 	.en_mask  = IMX6SX_GPR2_MQS_EN_MASK,
 	.en_shift = IMX6SX_GPR2_MQS_EN_SHIFT,
@@ -330,7 +382,7 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx6sx_data = {
 };
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx93_data = {
-	.use_gpr = true,
+	.type = TYPE_REG_GPR,
 	.ctrl_off = 0x20,
 	.en_mask  = BIT(1),
 	.en_shift = 1,
@@ -342,10 +394,24 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx93_data = {
 	.div_shift = 8,
 };
 
+static const struct fsl_mqs_soc_data fsl_mqs_imx95_data = {
+	.type = TYPE_REG_GPR,
+	.ctrl_off = 0x0,
+	.en_mask  = BIT(2),
+	.en_shift = 2,
+	.rst_mask = BIT(3),
+	.rst_shift = 3,
+	.osr_mask = BIT(4),
+	.osr_shift = 4,
+	.div_mask = GENMASK(16, 9),
+	.div_shift = 9,
+};
+
 static const struct of_device_id fsl_mqs_dt_ids[] = {
 	{ .compatible = "fsl,imx8qm-mqs", .data = &fsl_mqs_imx8qm_data },
 	{ .compatible = "fsl,imx6sx-mqs", .data = &fsl_mqs_imx6sx_data },
 	{ .compatible = "fsl,imx93-mqs", .data = &fsl_mqs_imx93_data },
+	{ .compatible = "fsl,imx95-mqs", .data = &fsl_mqs_imx95_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_mqs_dt_ids);
-- 
2.34.1

