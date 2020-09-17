Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF72426D391
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 08:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E8B21681;
	Thu, 17 Sep 2020 08:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E8B21681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600323700;
	bh=+J6IrP7TGwfGQBevSWGkBP/kwQCu8swsbuMaCEcf4T8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ORD8ao4XtQ8QMq/hYNPcYjjXGDljIHr4YkyXZ5bEgjh5m1R9m5NAHF6GoMr4WX2BA
	 3IMHGyL8qjBcgm8D2N4t6gPbPVmCHl5Wxuwm78zdbEeQsqwCjnIuh8bAILcNaL5qNP
	 S9qzq5NTg+alpXF1K7q4xLj7gE60lpxgsedoTTTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B14EF802DD;
	Thu, 17 Sep 2020 08:18:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D700CF802DB; Thu, 17 Sep 2020 08:18:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32A84F8027C
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 08:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32A84F8027C
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 047DA1A0F4A;
 Thu, 17 Sep 2020 08:18:13 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4ECC31A0E24;
 Thu, 17 Sep 2020 08:18:08 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 756BE40318;
 Thu, 17 Sep 2020 08:18:02 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: [PATCH v2 2/3] ASoC: fsl_sai: Add fsl_sai_check_version function
Date: Thu, 17 Sep 2020 14:11:18 +0800
Message-Id: <1600323079-5317-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
References: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

fsl_sai_check_version can help to parse the version info
in VERID and PARAM registers.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 47 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h | 28 ++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 24ca528ca2be..738b4dda7847 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -946,6 +946,48 @@ static struct regmap_config fsl_sai_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static int fsl_sai_check_version(struct device *dev)
+{
+	struct fsl_sai *sai = dev_get_drvdata(dev);
+	unsigned char ofs = sai->soc_data->reg_offset;
+	unsigned int val;
+	int ret;
+
+	if (FSL_SAI_TCSR(ofs) == FSL_SAI_VERID)
+		return 0;
+
+	ret = regmap_read(sai->regmap, FSL_SAI_VERID, &val);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(dev, "VERID: 0x%016X\n", val);
+
+	sai->verid.major = (val & FSL_SAI_VERID_MAJOR_MASK) >>
+			   FSL_SAI_VERID_MAJOR_SHIFT;
+	sai->verid.minor = (val & FSL_SAI_VERID_MINOR_MASK) >>
+			   FSL_SAI_VERID_MINOR_SHIFT;
+	sai->verid.feature = val & FSL_SAI_VERID_FEATURE_MASK;
+
+	ret = regmap_read(sai->regmap, FSL_SAI_PARAM, &val);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(dev, "PARAM: 0x%016X\n", val);
+
+	/* Max slots per frame, power of 2 */
+	sai->param.slot_num = 1 <<
+		((val & FSL_SAI_PARAM_SPF_MASK) >> FSL_SAI_PARAM_SPF_SHIFT);
+
+	/* Words per fifo, power of 2 */
+	sai->param.fifo_depth = 1 <<
+		((val & FSL_SAI_PARAM_WPF_MASK) >> FSL_SAI_PARAM_WPF_SHIFT);
+
+	/* Number of datalines implemented */
+	sai->param.dataline = val & FSL_SAI_PARAM_DLN_MASK;
+
+	return 0;
+}
+
 static int fsl_sai_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1070,6 +1112,11 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sai);
 
+	/* Get sai version */
+	ret = fsl_sai_check_version(&pdev->dev);
+	if (ret < 0)
+		dev_warn(&pdev->dev, "Error reading SAI version: %d\n", ret);
+
 	pm_runtime_enable(&pdev->dev);
 	regcache_cache_only(sai->regmap, true);
 
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index d16fc4241f41..ba7425a9e217 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -223,6 +223,32 @@ struct fsl_sai_soc_data {
 	unsigned int reg_offset;
 };
 
+/**
+ * struct fsl_sai_verid - version id data
+ * @major: major version number
+ * @minor: minor version number
+ * @feature: feature specification number
+ *           0000000000000000b - Standard feature set
+ *           0000000000000000b - Standard feature set
+ */
+struct fsl_sai_verid {
+	u32 major;
+	u32 minor;
+	u32 feature;
+};
+
+/**
+ * struct fsl_sai_param - parameter data
+ * @slot_num: The maximum number of slots per frame
+ * @fifo_depth: The number of words in each FIFO (depth)
+ * @dataline: The number of datalines implemented
+ */
+struct fsl_sai_param {
+	u32 slot_num;
+	u32 fifo_depth;
+	u32 dataline;
+};
+
 struct fsl_sai {
 	struct platform_device *pdev;
 	struct regmap *regmap;
@@ -243,6 +269,8 @@ struct fsl_sai {
 	const struct fsl_sai_soc_data *soc_data;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	struct snd_dmaengine_dai_dma_data dma_params_tx;
+	struct fsl_sai_verid verid;
+	struct fsl_sai_param param;
 };
 
 #define TX 1
-- 
2.27.0

