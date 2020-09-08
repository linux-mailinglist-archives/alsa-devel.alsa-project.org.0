Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF0261818
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8603E16DD;
	Tue,  8 Sep 2020 19:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8603E16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599587328;
	bh=MS2mxTDOg5a1xPI16Clbd8fXMV/SwXcC7C04977OGIg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mesvDpQrjBQkfUJZdiEWMKS76W1PTmVvNHmoEqsOkOhI147SCYeXziwrjexOR7iqO
	 MkgbOwQvHpFwP+pA8RgygJUowr3jkKQ3O969xBATjzVscHyWV/7l7NKpvCZX9HkN/J
	 2pO+4Q5FbW0mzWvP709wCifMTk4Sws5hG9T/UQ+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE742F802E9;
	Tue,  8 Sep 2020 19:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 882C5F802DB; Tue,  8 Sep 2020 19:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from a27-11.smtp-out.us-west-2.amazonses.com
 (a27-11.smtp-out.us-west-2.amazonses.com [54.240.27.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AFF8F802DB
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AFF8F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="DGPSkNQe"; 
 dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com
 header.b="WUNzx7lw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599587097;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=MS2mxTDOg5a1xPI16Clbd8fXMV/SwXcC7C04977OGIg=;
 b=DGPSkNQe8VYrXOsi5N/fL1gEI9AiT58KLp2QES/4eWN2nmT//CbnHS6VRPDnvo+a
 3x9f5+OeG+fFKW5FVpUDLtiRbvvrY8fnY1ktmLkJYSAMRjSa/WP7J6eQduLjfGTTEy5
 qC67dPYi52qACGWAPsmFZOpyaNGVRRd00beVa718=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599587097;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=MS2mxTDOg5a1xPI16Clbd8fXMV/SwXcC7C04977OGIg=;
 b=WUNzx7lwhq3qsnO+4ov2qZBJnyZsr4BzKv8L8gPTKUHOEu8HyenjkD6KFdowz97b
 ql4j0/JuTXmETO2U5nf/0M2EtIV37fhuNQ9d8h2Hq2ndRmoFtrGWUDCRqT5mzUircWV
 r7lcI6YuQrWqUOVcPURcWqQdGQhawfVvsmueuuOM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B977C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] ASoC: qcom: Optimise lpass variant structure
Date: Tue, 8 Sep 2020 17:44:57 +0000
Message-ID: <010101746ed21cf4-9cdcaf51-a7ab-432d-9944-6c2fcae3c675-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
References: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
X-SES-Outgoing: 2020.09.08-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>
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

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

lpass variant structure in audio driver has I2S and HDMI register fields,
which are used exclusively. To optimize memory, replace with union to
select either I2S or HDMI register fields.

Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
---
 sound/soc/qcom/lpass-apq8016.c   |  24 ++++----
 sound/soc/qcom/lpass-cpu.c       |  27 +++++----
 sound/soc/qcom/lpass-hdmi.c      |  57 +++++++++----------
 sound/soc/qcom/lpass-hdmi.h      |  24 ++++----
 sound/soc/qcom/lpass-ipq806x.c   |  24 ++++----
 sound/soc/qcom/lpass-lpaif-reg.h |   3 +-
 sound/soc/qcom/lpass-sc7180.c    | 115 ++++++++++++++++++++-------------------
 sound/soc/qcom/lpass.h           | 107 ++++++++++++++++++++----------------
 8 files changed, 201 insertions(+), 180 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 5c8ae22..eb3ad12 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -228,9 +228,9 @@ static int apq8016_lpass_exit(struct platform_device *pdev)
 
 
 static struct lpass_variant apq8016_data = {
-	.i2sctrl_reg_base	= 0x1000,
-	.i2sctrl_reg_stride	= 0x1000,
-	.i2s_ports		= 4,
+	.intf.i2s_intf.i2sctrl_reg_base	= 0x1000,
+	.intf.i2s_intf.i2sctrl_reg_stride	= 0x1000,
+	.intf.i2s_intf.i2s_ports		= 4,
 	.irq_reg_base		= 0x6000,
 	.irq_reg_stride		= 0x1000,
 	.irq_ports		= 3,
@@ -242,15 +242,15 @@ static struct lpass_variant apq8016_data = {
 	.wrdma_reg_stride	= 0x1000,
 	.wrdma_channel_start	= 5,
 	.wrdma_channels		= 2,
-	.loopback		= REG_FIELD_ID(0x1000, 15, 15, 4, 0x1000),
-	.spken			= REG_FIELD_ID(0x1000, 14, 14, 4, 0x1000),
-	.spkmode		= REG_FIELD_ID(0x1000, 10, 13, 4, 0x1000),
-	.spkmono		= REG_FIELD_ID(0x1000, 9, 9, 4, 0x1000),
-	.micen			= REG_FIELD_ID(0x1000, 8, 8, 4, 0x1000),
-	.micmode		= REG_FIELD_ID(0x1000, 4, 7, 4, 0x1000),
-	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 4, 0x1000),
-	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 4, 0x1000),
-	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 4, 0x1000),
+	.intf.i2s_intf.loopback		= REG_FIELD_ID(0x1000, 15, 15, 4, 0x1000),
+	.intf.i2s_intf.spken			= REG_FIELD_ID(0x1000, 14, 14, 4, 0x1000),
+	.intf.i2s_intf.spkmode		= REG_FIELD_ID(0x1000, 10, 13, 4, 0x1000),
+	.intf.i2s_intf.spkmono		= REG_FIELD_ID(0x1000, 9, 9, 4, 0x1000),
+	.intf.i2s_intf.micen			= REG_FIELD_ID(0x1000, 8, 8, 4, 0x1000),
+	.intf.i2s_intf.micmode		= REG_FIELD_ID(0x1000, 4, 7, 4, 0x1000),
+	.intf.i2s_intf.micmono		= REG_FIELD_ID(0x1000, 3, 3, 4, 0x1000),
+	.intf.i2s_intf.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 4, 0x1000),
+	.intf.i2s_intf.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 4, 0x1000),
 
 	.rdma_dyncclk		= REG_FIELD_ID(0x8400, 12, 12, 2, 0x1000),
 	.rdma_bursten		= REG_FIELD_ID(0x8400, 11, 11, 2, 0x1000),
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 566d79a..58620b2 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -34,16 +34,17 @@ static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 	struct lpass_variant *v = drvdata->variant;
-
-	i2sctl->loopback = devm_regmap_field_alloc(dev, map, v->loopback);
-	i2sctl->spken = devm_regmap_field_alloc(dev, map, v->spken);
-	i2sctl->spkmode = devm_regmap_field_alloc(dev, map, v->spkmode);
-	i2sctl->spkmono = devm_regmap_field_alloc(dev, map, v->spkmono);
-	i2sctl->micen = devm_regmap_field_alloc(dev, map, v->micen);
-	i2sctl->micmode = devm_regmap_field_alloc(dev, map, v->micmode);
-	i2sctl->micmono = devm_regmap_field_alloc(dev, map, v->micmono);
-	i2sctl->wssrc = devm_regmap_field_alloc(dev, map, v->wssrc);
-	i2sctl->bitwidth = devm_regmap_field_alloc(dev, map, v->bitwidth);
+	struct lpass_i2s_rsrc *irsrc = &v->intf.i2s_intf;
+
+	i2sctl->loopback = devm_regmap_field_alloc(dev, map, irsrc->loopback);
+	i2sctl->spken = devm_regmap_field_alloc(dev, map, irsrc->spken);
+	i2sctl->spkmode = devm_regmap_field_alloc(dev, map, irsrc->spkmode);
+	i2sctl->spkmono = devm_regmap_field_alloc(dev, map, irsrc->spkmono);
+	i2sctl->micen = devm_regmap_field_alloc(dev, map, irsrc->micen);
+	i2sctl->micmode = devm_regmap_field_alloc(dev, map, irsrc->micmode);
+	i2sctl->micmono = devm_regmap_field_alloc(dev, map, irsrc->micmono);
+	i2sctl->wssrc = devm_regmap_field_alloc(dev, map, irsrc->wssrc);
+	i2sctl->bitwidth = devm_regmap_field_alloc(dev, map, irsrc->bitwidth);
 
 	if (IS_ERR(i2sctl->loopback) || IS_ERR(i2sctl->spken) ||
 	    IS_ERR(i2sctl->spkmode) || IS_ERR(i2sctl->spkmono) ||
@@ -363,9 +364,10 @@ static bool lpass_cpu_regmap_writeable(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 	struct lpass_variant *v = drvdata->variant;
+	struct lpass_i2s_rsrc *irsrc = &v->intf.i2s_intf;
 	int i;
 
-	for (i = 0; i < v->i2s_ports; ++i)
+	for (i = 0; i < irsrc->i2s_ports; ++i)
 		if (reg == LPAIF_I2SCTL_REG(v, i))
 			return true;
 
@@ -405,9 +407,10 @@ static bool lpass_cpu_regmap_readable(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 	struct lpass_variant *v = drvdata->variant;
+	struct lpass_i2s_rsrc *irsrc = &v->intf.i2s_intf;
 	int i;
 
-	for (i = 0; i < v->i2s_ports; ++i)
+	for (i = 0; i < irsrc->i2s_ports; ++i)
 		if (reg == LPAIF_I2SCTL_REG(v, i))
 			return true;
 
diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
index 7e18113..b0270e2 100644
--- a/sound/soc/qcom/lpass-hdmi.c
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -25,6 +25,7 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 	struct lpass_variant *v = drvdata->variant;
+	struct lpass_hdmi_rsrc *hdmi_rsrc = &v->intf.hdmi_intf;
 	unsigned int i;
 	struct lpass_hdmi_tx_ctl *tx_ctl;
 	struct lpass_hdmitx_legacy *legacy;
@@ -43,9 +44,9 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 
 	tx_ctl = drvdata->tx_ctl;
 	tx_ctl->soft_reset = devm_regmap_field_alloc(dev, map,
-				v->soft_reset);
+				hdmi_rsrc->soft_reset);
 	tx_ctl->force_reset = devm_regmap_field_alloc(dev, map,
-				v->force_reset);
+				hdmi_rsrc->force_reset);
 	if (IS_ERR(tx_ctl->soft_reset) || IS_ERR(tx_ctl->force_reset))
 		return -EINVAL;
 
@@ -56,7 +57,7 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 
 	legacy = drvdata->legacy;
 	legacy->legacy_en = devm_regmap_field_alloc(dev, map,
-				v->legacy_en);
+				hdmi_rsrc->legacy_en);
 	if (IS_ERR(legacy->legacy_en))
 		return -EINVAL;
 
@@ -67,9 +68,9 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 
 	vbit_ctl = drvdata->vbit_ctl;
 	vbit_ctl->replace_vbit = devm_regmap_field_alloc(dev, map,
-					v->replace_vbit);
+					hdmi_rsrc->replace_vbit);
 	vbit_ctl->vbit_stream = devm_regmap_field_alloc(dev, map,
-					v->vbit_stream);
+					hdmi_rsrc->vbit_stream);
 	if (IS_ERR(vbit_ctl->replace_vbit) || IS_ERR(vbit_ctl->vbit_stream))
 		return -EINVAL;
 
@@ -80,7 +81,7 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 		return -ENOMEM;
 
 	tx_parity = drvdata->tx_parity;
-	tx_parity->calc_en = devm_regmap_field_alloc(dev, map, v->calc_en);
+	tx_parity->calc_en = devm_regmap_field_alloc(dev, map, hdmi_rsrc->calc_en);
 
 	if (IS_ERR(tx_parity->calc_en))
 		return -EINVAL;
@@ -92,19 +93,19 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 		return -ENOMEM;
 
 	meta_ctl = drvdata->meta_ctl;
-	meta_ctl->mute = devm_regmap_field_alloc(dev, map, v->mute);
+	meta_ctl->mute = devm_regmap_field_alloc(dev, map, hdmi_rsrc->mute);
 	meta_ctl->as_sdp_cc = devm_regmap_field_alloc(dev, map,
-						v->as_sdp_cc);
+						hdmi_rsrc->as_sdp_cc);
 	meta_ctl->as_sdp_ct = devm_regmap_field_alloc(dev, map,
-						v->as_sdp_ct);
+						hdmi_rsrc->as_sdp_ct);
 	meta_ctl->aif_db4 = devm_regmap_field_alloc(dev, map,
-						v->aif_db4);
+						hdmi_rsrc->aif_db4);
 	meta_ctl->frequency = devm_regmap_field_alloc(dev, map,
-						v->frequency);
+						hdmi_rsrc->frequency);
 	meta_ctl->mst_index = devm_regmap_field_alloc(dev, map,
-						v->mst_index);
+						hdmi_rsrc->mst_index);
 	meta_ctl->dptx_index = devm_regmap_field_alloc(dev, map,
-						v->dptx_index);
+						hdmi_rsrc->dptx_index);
 
 	if (IS_ERR(meta_ctl->mute) || IS_ERR(meta_ctl->as_sdp_cc) ||
 		IS_ERR(meta_ctl->as_sdp_ct) || IS_ERR(meta_ctl->aif_db4) ||
@@ -119,23 +120,23 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 
 	sstream_ctl = drvdata->sstream_ctl;
 	sstream_ctl->sstream_en = devm_regmap_field_alloc(dev, map,
-						v->sstream_en);
+						hdmi_rsrc->sstream_en);
 	sstream_ctl->dma_sel = devm_regmap_field_alloc(dev, map,
-						v->dma_sel);
+						hdmi_rsrc->dma_sel);
 	sstream_ctl->auto_bbit_en = devm_regmap_field_alloc(dev, map,
-						v->auto_bbit_en);
+						hdmi_rsrc->auto_bbit_en);
 	sstream_ctl->layout = devm_regmap_field_alloc(dev, map,
-						v->layout);
+						hdmi_rsrc->layout);
 	sstream_ctl->layout_sp = devm_regmap_field_alloc(dev, map,
-						v->layout_sp);
+						hdmi_rsrc->layout_sp);
 	sstream_ctl->dp_audio = devm_regmap_field_alloc(dev, map,
-						v->dp_audio);
+						hdmi_rsrc->dp_audio);
 	sstream_ctl->set_sp_on_en = devm_regmap_field_alloc(dev, map,
-						v->set_sp_on_en);
+						hdmi_rsrc->set_sp_on_en);
 	sstream_ctl->dp_staffing_en = devm_regmap_field_alloc(dev, map,
-						v->dp_staffing_en);
+						hdmi_rsrc->dp_staffing_en);
 	sstream_ctl->dp_sp_b_hw_en = devm_regmap_field_alloc(dev, map,
-						v->dp_sp_b_hw_en);
+						hdmi_rsrc->dp_sp_b_hw_en);
 
 	if (IS_ERR(sstream_ctl->sstream_en) || IS_ERR(sstream_ctl->dma_sel) ||
 		IS_ERR(sstream_ctl->auto_bbit_en) ||
@@ -155,7 +156,7 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 		ch_msb = drvdata->ch_msb[i];
 
 		ch_msb->msb_bits = devm_regmap_field_alloc(dev, map,
-							v->msb_bits);
+							hdmi_rsrc->msb_bits);
 		if (IS_ERR(ch_msb->msb_bits))
 			return -EINVAL;
 
@@ -166,7 +167,7 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 
 		ch_lsb = drvdata->ch_lsb[i];
 		ch_lsb->lsb_bits = devm_regmap_field_alloc(dev, map,
-					v->lsb_bits);
+					hdmi_rsrc->lsb_bits);
 		if (IS_ERR(ch_lsb->lsb_bits))
 			return -EINVAL;
 
@@ -178,13 +179,13 @@ int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 
 		hdmi_tx_dmactl = drvdata->hdmi_tx_dmactl[i];
 		hdmi_tx_dmactl->use_hw_chs = devm_regmap_field_alloc(dev, map,
-						v->use_hw_chs);
+						hdmi_rsrc->use_hw_chs);
 		hdmi_tx_dmactl->use_hw_usr = devm_regmap_field_alloc(dev, map,
-						v->use_hw_usr);
+						hdmi_rsrc->use_hw_usr);
 		hdmi_tx_dmactl->hw_chs_sel = devm_regmap_field_alloc(dev, map,
-						v->hw_chs_sel);
+						hdmi_rsrc->hw_chs_sel);
 		hdmi_tx_dmactl->hw_usr_sel = devm_regmap_field_alloc(dev, map,
-						v->hw_usr_sel);
+						hdmi_rsrc->hw_usr_sel);
 		if (IS_ERR(hdmi_tx_dmactl->use_hw_chs) ||
 			IS_ERR(hdmi_tx_dmactl->use_hw_usr) ||
 			IS_ERR(hdmi_tx_dmactl->hw_chs_sel) ||
diff --git a/sound/soc/qcom/lpass-hdmi.h b/sound/soc/qcom/lpass-hdmi.h
index f91f322..0866e82 100644
--- a/sound/soc/qcom/lpass-hdmi.h
+++ b/sound/soc/qcom/lpass-hdmi.h
@@ -49,27 +49,27 @@
 
 
 #define LPASS_HDMI_TX_CTL_ADDR(v) \
-		(v->hdmi_tx_ctl_addr)
+		(v->intf.hdmi_intf.hdmi_tx_ctl_addr)
 
 #define LPASS_HDMI_TX_LEGACY_ADDR(v) \
-		(v->hdmi_legacy_addr)
+		(v->intf.hdmi_intf.hdmi_legacy_addr)
 #define LPASS_HDMI_TX_VBIT_CTL_ADDR(v) \
-		(v->hdmi_vbit_addr)
+		(v->intf.hdmi_intf.hdmi_vbit_addr)
 #define LPASS_HDMI_TX_CH_LSB_ADDR(v, port) \
-		(v->hdmi_ch_lsb_addr + \
-		v->ch_stride * (port))
+		(v->intf.hdmi_intf.hdmi_ch_lsb_addr + \
+		v->intf.hdmi_intf.ch_stride * (port))
 #define LPASS_HDMI_TX_CH_MSB_ADDR(v, port) \
-		(v->hdmi_ch_msb_addr + \
-		v->ch_stride * (port))
+		(v->intf.hdmi_intf.hdmi_ch_msb_addr + \
+		v->intf.hdmi_intf.ch_stride * (port))
 #define LPASS_HDMI_TX_DMA_ADDR(v, port) \
-		(v->hdmi_dmactl_addr + \
-		v->hdmi_dma_stride * (port))
+		(v->intf.hdmi_intf.hdmi_dmactl_addr + \
+		v->intf.hdmi_intf.hdmi_dma_stride * (port))
 #define LPASS_HDMI_TX_PARITY_ADDR(v) \
-		(v->hdmi_parity_addr)
+		(v->intf.hdmi_intf.hdmi_parity_addr)
 #define LPASS_HDMI_TX_DP_ADDR(v) \
-		(v->hdmi_DP_addr)
+		(v->intf.hdmi_intf.hdmi_DP_addr)
 #define LPASS_HDMI_TX_SSTREAM_ADDR(v) \
-		(v->hdmi_sstream_addr)
+		(v->intf.hdmi_intf.hdmi_sstream_addr)
 
 struct lpass_sstream_ctl {
 	struct regmap_field *sstream_en;
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index 72f09b3..525d89b 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -110,9 +110,9 @@ static int ipq806x_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
 }
 
 static struct lpass_variant ipq806x_data = {
-	.i2sctrl_reg_base	= 0x0010,
-	.i2sctrl_reg_stride	= 0x04,
-	.i2s_ports		= 5,
+	.intf.i2s_intf.i2sctrl_reg_base	= 0x0010,
+	.intf.i2s_intf.i2sctrl_reg_stride	= 0x04,
+	.intf.i2s_intf.i2s_ports		= 5,
 	.irq_reg_base		= 0x3000,
 	.irq_reg_stride		= 0x1000,
 	.irq_ports		= 3,
@@ -123,15 +123,15 @@ static struct lpass_variant ipq806x_data = {
 	.wrdma_reg_stride	= 0x1000,
 	.wrdma_channel_start	= 5,
 	.wrdma_channels		= 4,
-	.loopback		= REG_FIELD_ID(0x0010, 15, 15, 5, 0x4),
-	.spken			= REG_FIELD_ID(0x0010, 14, 14, 5, 0x4),
-	.spkmode		= REG_FIELD_ID(0x0010, 10, 13, 5, 0x4),
-	.spkmono		= REG_FIELD_ID(0x0010, 9, 9, 5, 0x4),
-	.micen			= REG_FIELD_ID(0x0010, 8, 8, 5, 0x4),
-	.micmode		= REG_FIELD_ID(0x0010, 4, 7, 5, 0x4),
-	.micmono		= REG_FIELD_ID(0x0010, 3, 3, 5, 0x4),
-	.wssrc			= REG_FIELD_ID(0x0010, 2, 2, 5, 0x4),
-	.bitwidth		= REG_FIELD_ID(0x0010, 0, 0, 5, 0x4),
+	.intf.i2s_intf.loopback		= REG_FIELD_ID(0x0010, 15, 15, 5, 0x4),
+	.intf.i2s_intf.spken			= REG_FIELD_ID(0x0010, 14, 14, 5, 0x4),
+	.intf.i2s_intf.spkmode		= REG_FIELD_ID(0x0010, 10, 13, 5, 0x4),
+	.intf.i2s_intf.spkmono		= REG_FIELD_ID(0x0010, 9, 9, 5, 0x4),
+	.intf.i2s_intf.micen			= REG_FIELD_ID(0x0010, 8, 8, 5, 0x4),
+	.intf.i2s_intf.micmode		= REG_FIELD_ID(0x0010, 4, 7, 5, 0x4),
+	.intf.i2s_intf.micmono		= REG_FIELD_ID(0x0010, 3, 3, 5, 0x4),
+	.intf.i2s_intf.wssrc			= REG_FIELD_ID(0x0010, 2, 2, 5, 0x4),
+	.intf.i2s_intf.bitwidth		= REG_FIELD_ID(0x0010, 0, 0, 5, 0x4),
 
 	.rdma_dyncclk		= REG_FIELD_ID(0x6000, 12, 12, 4, 0x1000),
 	.rdma_bursten		= REG_FIELD_ID(0x6000, 11, 11, 4, 0x1000),
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index ecf9be1..c74c348 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -9,7 +9,8 @@
 /* LPAIF I2S */
 
 #define LPAIF_I2SCTL_REG_ADDR(v, addr, port) \
-	(v->i2sctrl_reg_base + (addr) + v->i2sctrl_reg_stride * (port))
+	(v->intf.i2s_intf.i2sctrl_reg_base + (addr) + \
+	v->intf.i2s_intf.i2sctrl_reg_stride * (port))
 
 #define LPAIF_I2SCTL_REG(v, port)	LPAIF_I2SCTL_REG_ADDR(v, 0x0, (port))
 
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 34db061..13f2ab0 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -177,9 +177,9 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
 }
 
 static struct lpass_variant sc7180_data = {
-	.i2sctrl_reg_base	= 0x1000,
-	.i2sctrl_reg_stride	= 0x1000,
-	.i2s_ports		= 3,
+	.intf.i2s_intf.i2sctrl_reg_base	= 0x1000,
+	.intf.i2s_intf.i2sctrl_reg_stride	= 0x1000,
+	.intf.i2s_intf.i2s_ports		= 3,
 	.irq_reg_base		= 0x9000,
 	.irq_reg_stride		= 0x1000,
 	.irq_ports		= 3,
@@ -192,20 +192,20 @@ static struct lpass_variant sc7180_data = {
 	.wrdma_channel_start	= 5,
 	.wrdma_channels		= 4,
 
-	.loopback		= REG_FIELD_ID(0x1000, 17, 17, 3, 0x1000),
-	.spken			= REG_FIELD_ID(0x1000, 16, 16, 3, 0x1000),
-	.spkmode		= REG_FIELD_ID(0x1000, 11, 15, 3, 0x1000),
-	.spkmono		= REG_FIELD_ID(0x1000, 10, 10, 3, 0x1000),
-	.micen			= REG_FIELD_ID(0x1000, 9, 9, 3, 0x1000),
-	.micmode		= REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
-	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
-	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
-	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 3, 0x1000),
+	.intf.i2s_intf.loopback	= REG_FIELD_ID(0x1000, 17, 17, 3, 0x1000),
+	.intf.i2s_intf.spken	= REG_FIELD_ID(0x1000, 16, 16, 3, 0x1000),
+	.intf.i2s_intf.spkmode	= REG_FIELD_ID(0x1000, 11, 15, 3, 0x1000),
+	.intf.i2s_intf.spkmono	= REG_FIELD_ID(0x1000, 10, 10, 3, 0x1000),
+	.intf.i2s_intf.micen	= REG_FIELD_ID(0x1000, 9, 9, 3, 0x1000),
+	.intf.i2s_intf.micmode	= REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
+	.intf.i2s_intf.micmono	= REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
+	.intf.i2s_intf.wssrc	= REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
+	.intf.i2s_intf.bitwidth	= REG_FIELD_ID(0x1000, 0, 0, 3, 0x1000),
 
 	.rdma_dyncclk		= REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
 	.rdma_bursten		= REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
 	.rdma_wpscnt		= REG_FIELD_ID(0xC000, 16, 19, 5, 0x1000),
-	.rdma_intf		= REG_FIELD_ID(0xC000, 12, 15, 5, 0x1000),
+	.rdma_intf			= REG_FIELD_ID(0xC000, 12, 15, 5, 0x1000),
 	.rdma_fifowm		= REG_FIELD_ID(0xC000, 1, 5, 5, 0x1000),
 	.rdma_enable		= REG_FIELD_ID(0xC000, 0, 0, 5, 0x1000),
 
@@ -238,18 +238,19 @@ static struct lpass_variant sc7180_data = {
 	.free_dma_channel	= sc7180_lpass_free_dma_channel,
 };
 
+
 static const struct lpass_variant sc7180_hdmi_data = {
-	.hdmi_tx_ctl_addr	= 0x1000,
-	.hdmi_legacy_addr	= 0x1008,
-	.hdmi_vbit_addr		= 0x610c0,
-	.hdmi_ch_lsb_addr	= 0x61048,
-	.hdmi_ch_msb_addr	= 0x6104c,
-	.ch_stride		= 0x8,
-	.hdmi_parity_addr	= 0x61034,
-	.hdmi_dmactl_addr	= 0x61038,
-	.hdmi_dma_stride	= 0x4,
-	.hdmi_DP_addr		= 0x610c8,
-	.hdmi_sstream_addr	= 0x6101c,
+	.intf.hdmi_intf.hdmi_tx_ctl_addr	= 0x1000,
+	.intf.hdmi_intf.hdmi_legacy_addr	= 0x1008,
+	.intf.hdmi_intf.hdmi_vbit_addr		= 0x610c0,
+	.intf.hdmi_intf.hdmi_ch_lsb_addr	= 0x61048,
+	.intf.hdmi_intf.hdmi_ch_msb_addr	= 0x6104c,
+	.intf.hdmi_intf.ch_stride		= 0x8,
+	.intf.hdmi_intf.hdmi_parity_addr	= 0x61034,
+	.intf.hdmi_intf.hdmi_dmactl_addr	= 0x61038,
+	.intf.hdmi_intf.hdmi_dma_stride	= 0x4,
+	.intf.hdmi_intf.hdmi_DP_addr		= 0x610c8,
+	.intf.hdmi_intf.hdmi_sstream_addr	= 0x6101c,
 	.irq_reg_base		= 0x63000,
 	.irq_ports		= 1,
 	.rdma_reg_base		= 0x64000,
@@ -265,39 +266,39 @@ static const struct lpass_variant sc7180_hdmi_data = {
 	.rdma_fifowm		= REG_FIELD_ID(0x64000, 1, 5, 4, 0x1000),
 	.rdma_enable		= REG_FIELD_ID(0x64000, 0, 0, 4, 0x1000),
 
-	.sstream_en		= REG_FIELD(0x6101c, 0, 0),
-	.dma_sel			= REG_FIELD(0x6101c, 1, 2),
-	.auto_bbit_en	= REG_FIELD(0x6101c, 3, 3),
-	.layout			= REG_FIELD(0x6101c, 4, 4),
-	.layout_sp		= REG_FIELD(0x6101c, 5, 8),
-	.set_sp_on_en	= REG_FIELD(0x6101c, 10, 10),
-	.dp_audio		= REG_FIELD(0x6101c, 11, 11),
-	.dp_staffing_en	= REG_FIELD(0x6101c, 12, 12),
-	.dp_sp_b_hw_en	= REG_FIELD(0x6101c, 13, 13),
-
-	.mute			= REG_FIELD(0x610c8, 0, 0),
-	.as_sdp_cc		= REG_FIELD(0x610c8, 1, 3),
-	.as_sdp_ct		= REG_FIELD(0x610c8, 4, 7),
-	.aif_db4			= REG_FIELD(0x610c8, 8, 15),
-	.frequency		= REG_FIELD(0x610c8, 16, 21),
-	.mst_index		= REG_FIELD(0x610c8, 28, 29),
-	.dptx_index		= REG_FIELD(0x610c8, 30, 31),
-
-	.soft_reset		= REG_FIELD(0x1000, 31, 31),
-	.force_reset	= REG_FIELD(0x1000, 30, 30),
-
-	.use_hw_chs		= REG_FIELD(0x61038, 0, 0),
-	.use_hw_usr		= REG_FIELD(0x61038, 1, 1),
-	.hw_chs_sel		= REG_FIELD(0x61038, 2, 4),
-	.hw_usr_sel		= REG_FIELD(0x61038, 5, 6),
-
-	.replace_vbit	= REG_FIELD(0x610c0, 0, 0),
-	.vbit_stream	= REG_FIELD(0x610c0, 1, 1),
-
-	.legacy_en		=  REG_FIELD(0x1008, 0, 0),
-	.calc_en		=  REG_FIELD(0x61034, 0, 0),
-	.lsb_bits		=  REG_FIELD(0x61048, 0, 31),
-	.msb_bits		=  REG_FIELD(0x6104c, 0, 31),
+	.intf.hdmi_intf.sstream_en		= REG_FIELD(0x6101c, 0, 0),
+	.intf.hdmi_intf.dma_sel			= REG_FIELD(0x6101c, 1, 2),
+	.intf.hdmi_intf.auto_bbit_en	= REG_FIELD(0x6101c, 3, 3),
+	.intf.hdmi_intf.layout			= REG_FIELD(0x6101c, 4, 4),
+	.intf.hdmi_intf.layout_sp		= REG_FIELD(0x6101c, 5, 8),
+	.intf.hdmi_intf.set_sp_on_en	= REG_FIELD(0x6101c, 10, 10),
+	.intf.hdmi_intf.dp_audio		= REG_FIELD(0x6101c, 11, 11),
+	.intf.hdmi_intf.dp_staffing_en	= REG_FIELD(0x6101c, 12, 12),
+	.intf.hdmi_intf.dp_sp_b_hw_en	= REG_FIELD(0x6101c, 13, 13),
+
+	.intf.hdmi_intf.mute			= REG_FIELD(0x610c8, 0, 0),
+	.intf.hdmi_intf.as_sdp_cc		= REG_FIELD(0x610c8, 1, 3),
+	.intf.hdmi_intf.as_sdp_ct		= REG_FIELD(0x610c8, 4, 7),
+	.intf.hdmi_intf.aif_db4			= REG_FIELD(0x610c8, 8, 15),
+	.intf.hdmi_intf.frequency		= REG_FIELD(0x610c8, 16, 21),
+	.intf.hdmi_intf.mst_index		= REG_FIELD(0x610c8, 28, 29),
+	.intf.hdmi_intf.dptx_index		= REG_FIELD(0x610c8, 30, 31),
+
+	.intf.hdmi_intf.soft_reset		= REG_FIELD(0x1000, 31, 31),
+	.intf.hdmi_intf.force_reset	= REG_FIELD(0x1000, 30, 30),
+
+	.intf.hdmi_intf.use_hw_chs		= REG_FIELD(0x61038, 0, 0),
+	.intf.hdmi_intf.use_hw_usr		= REG_FIELD(0x61038, 1, 1),
+	.intf.hdmi_intf.hw_chs_sel		= REG_FIELD(0x61038, 2, 4),
+	.intf.hdmi_intf.hw_usr_sel		= REG_FIELD(0x61038, 5, 6),
+
+	.intf.hdmi_intf.replace_vbit	= REG_FIELD(0x610c0, 0, 0),
+	.intf.hdmi_intf.vbit_stream	= REG_FIELD(0x610c0, 1, 1),
+
+	.intf.hdmi_intf.legacy_en		=  REG_FIELD(0x1008, 0, 0),
+	.intf.hdmi_intf.calc_en		=  REG_FIELD(0x61034, 0, 0),
+	.intf.hdmi_intf.lsb_bits		=  REG_FIELD(0x61048, 0, 31),
+	.intf.hdmi_intf.msb_bits		=  REG_FIELD(0x6104c, 0, 31),
 
 	.clk_name		= (const char*[]) {
 					"pcnoc-sway-clk",
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 3c2a64a..5d80205 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -100,22 +100,7 @@ struct lpass_data {
 	struct lpass_dp_metadata_ctl *meta_ctl;
 	struct lpass_sstream_ctl *sstream_ctl;
 };
-
-/* Vairant data per each SOC */
-struct lpass_variant {
-	u32	i2sctrl_reg_base;
-	u32	i2sctrl_reg_stride;
-	u32	i2s_ports;
-	u32	irq_reg_base;
-	u32	irq_reg_stride;
-	u32	irq_ports;
-	u32	rdma_reg_base;
-	u32	rdma_reg_stride;
-	u32	rdma_channels;
-	u32	wrdma_reg_base;
-	u32	wrdma_reg_stride;
-	u32	wrdma_channels;
-
+struct lpass_hdmi_rsrc {
 	/* HDMI specific controls */
 	u32	hdmi_tx_ctl_addr;
 	u32	hdmi_legacy_addr;
@@ -129,36 +114,6 @@ struct lpass_variant {
 	u32	hdmi_DP_addr;
 	u32	hdmi_sstream_addr;
 
-	/* I2SCTL Register fields */
-	struct reg_field loopback;
-	struct reg_field spken;
-	struct reg_field spkmode;
-	struct reg_field spkmono;
-	struct reg_field micen;
-	struct reg_field micmode;
-	struct reg_field micmono;
-	struct reg_field wssrc;
-	struct reg_field bitwidth;
-
-	/* RD_DMA Register fields */
-	struct reg_field rdma_bursten;
-	struct reg_field rdma_burst8;
-	struct reg_field rdma_burst16;
-	struct reg_field rdma_dynburst;
-	struct reg_field rdma_wpscnt;
-	struct reg_field rdma_intf;
-	struct reg_field rdma_fifowm;
-	struct reg_field rdma_enable;
-	struct reg_field rdma_dyncclk;
-
-	/* WR_DMA Register fields */
-	struct reg_field wrdma_bursten;
-	struct reg_field wrdma_wpscnt;
-	struct reg_field wrdma_intf;
-	struct reg_field wrdma_fifowm;
-	struct reg_field wrdma_enable;
-	struct reg_field wrdma_dyncclk;
-
 	/* HDMI SSTREAM CTRL fields  */
 	struct reg_field sstream_en;
 	struct reg_field dma_sel;
@@ -204,6 +159,66 @@ struct lpass_variant {
 
 	/* HDMI CH MSB */
 	struct reg_field msb_bits;
+};
+
+struct lpass_i2s_rsrc {
+	u32	i2sctrl_reg_base;
+	u32	i2sctrl_reg_stride;
+	u32	i2s_ports;
+
+	/* I2SCTL Register fields */
+	struct reg_field loopback;
+	struct reg_field spken;
+	struct reg_field spkmode;
+	struct reg_field spkmono;
+	struct reg_field micen;
+	struct reg_field micmode;
+	struct reg_field micmono;
+	struct reg_field wssrc;
+	struct reg_field bitwidth;
+};
+
+union  audio_rsrc_interface {
+	struct lpass_hdmi_rsrc hdmi_intf;
+	struct lpass_i2s_rsrc i2s_intf;
+};
+
+/* Vairant data per each SOC */
+struct lpass_variant {
+	u32	irq_reg_base;
+	u32	irq_reg_stride;
+	u32	irq_ports;
+	u32	rdma_reg_base;
+	u32	rdma_reg_stride;
+	u32	rdma_channels;
+	u32	wrdma_reg_base;
+	u32	wrdma_reg_stride;
+	u32	wrdma_channels;
+
+	/* Interface differentiation variable */
+	int id;
+
+	/* Interface related rsrc */
+	union  audio_rsrc_interface intf;
+
+	/* RD_DMA Register fields */
+	struct reg_field rdma_bursten;
+	struct reg_field rdma_burst8;
+	struct reg_field rdma_burst16;
+	struct reg_field rdma_dynburst;
+	struct reg_field rdma_wpscnt;
+	struct reg_field rdma_intf;
+	struct reg_field rdma_fifowm;
+	struct reg_field rdma_enable;
+	struct reg_field rdma_dyncclk;
+
+	/* WR_DMA Register fields */
+	struct reg_field wrdma_bursten;
+	struct reg_field wrdma_wpscnt;
+	struct reg_field wrdma_intf;
+	struct reg_field wrdma_fifowm;
+	struct reg_field wrdma_enable;
+	struct reg_field wrdma_dyncclk;
 
 	/**
 	 * on SOCs like APQ8016 the channel control bits start
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

