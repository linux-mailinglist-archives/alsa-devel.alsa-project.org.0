Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DAB26C075
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 11:25:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B8E91658;
	Wed, 16 Sep 2020 11:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B8E91658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600248321;
	bh=g9BA6LK6r2oHJ7EZS+mRiHrrDOqCqwGkXvQ/ysQiZVU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mfBSBIrUpS4Cypd3F2wTaDyrx7Auvuc6kmdm52WCf/jLayY1KSIr2CbwOn3P6Ff/u
	 XyVPr4tBtjTD57GHAWybM+hmSe1R0JFb1lifHsY1gLapJhI5xu8L2rnuNpH+d9CLjx
	 4VJ4qNjosDHQbl1BTzGZUrfvcoG2KJmCAEHN+7ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4926F802DD;
	Wed, 16 Sep 2020 11:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 649A5F802DB; Wed, 16 Sep 2020 11:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43A99F8015D
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 11:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43A99F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oYq1xUoz"
Received: by mail-wr1-x442.google.com with SMTP id w5so6096014wrp.8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1hJdOGE6PE2L8q7V2RDIPCnW82wr0NYOq44Om20nBE=;
 b=oYq1xUozS+JbK0qBnLdccJM1mRa1RUrIL39b7g/t6b5fmdsgyr5zv1tSgLU0WdWGAt
 i3EIFY1bmiIqz2ojzJP0tNQzubaP7aBdjLW22D6AJmSgCINKTY9wEQwBoWEBs8KbS84R
 JymAxC1t/d2f10P/1OqOE6AgtxGztV+0TfNRR2DqdeE73wvH/atPirum8UIcApRIF3GW
 t0rHPl1VvLVwQXqEEIueiJJm2xYcGk0JuOK/cfNrZ6hpNMbOJP+nzW0kwNh+/lG40RLF
 zedpxDz5aE3LARYSf4HIY97mqRbvFyH4SUJHGHlYvBmi3E1UVIW8xt6NqN8ojmw3a7Es
 UOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u1hJdOGE6PE2L8q7V2RDIPCnW82wr0NYOq44Om20nBE=;
 b=RWZIgQrYoCzBTRGlp8WqxZ2d2ahkhyYlCS26umqqJQRiDh9T6Eag5g26U+DsUkk7ND
 PY9pnetsbTkLaADurvLH/bubGeUJaMMvxSeSLrzQbkRsiDfnQwyVkvI+C3t3vslQserx
 p96pdF73c9vi8xajpRaPOGaI7v4g4bibC/EyYBDWXnwGqDERKC/iWcVUTsYfEdhxzZor
 sOosiXBWQKoAAshb0FSz1GIX42CX4qWzQndi3qcBjlNOkGhqcOm5DHY28B8n2RYgzX9N
 JgWZ9NYyAqkbgA2g1PlkIZkgUj1SIW0jJ87Pgm7ABYTeflDyLQJdhTMyuQlbjS9YiFWV
 fzZw==
X-Gm-Message-State: AOAM531sy5MXb/nvm22Bga6xB6AWdDTCbXLX1D7GjgRF5hicorOAAZ+r
 0PgEC0yIx3/yLWpdUDPeN+tPKA==
X-Google-Smtp-Source: ABdhPJzzyXLTM6CWuygfNPgQ7ZQZbT8zI3ltZq4+MuAltfjBqs5ZwlWdYNcr9AZzD8MfEcQ5VdJWcQ==
X-Received: by 2002:adf:f04c:: with SMTP id t12mr26232864wro.121.1600248113780; 
 Wed, 16 Sep 2020 02:21:53 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f6sm32181670wro.5.2020.09.16.02.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:21:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v2 3/3] soundwire: qcom: get max rows and cols info from
 compatible
Date: Wed, 16 Sep 2020 10:21:25 +0100
Message-Id: <20200916092125.30898-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
References: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

currently the max rows and cols values are hardcoded. In reality
these values depend on the IP version. So get these based on
device tree compatible strings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 50 ++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 76963a7bdaa3..1dbf33684470 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -66,11 +66,6 @@
 #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
 			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
 
-#define SWRM_MAX_ROW_VAL	0 /* Rows = 48 */
-#define SWRM_DEFAULT_ROWS	48
-#define SWRM_MIN_COL_VAL	0 /* Cols = 2 */
-#define SWRM_DEFAULT_COL	16
-#define SWRM_MAX_COL_VAL	7
 #define SWRM_SPECIAL_CMD_ID	0xF
 #define MAX_FREQ_NUM		1
 #define TIMEOUT_MS		(2 * HZ)
@@ -104,6 +99,8 @@ struct qcom_swrm_ctrl {
 	unsigned int version;
 	int num_din_ports;
 	int num_dout_ports;
+	int cols_index;
+	int rows_index;
 	unsigned long dout_port_mask;
 	unsigned long din_port_mask;
 	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
@@ -113,6 +110,21 @@ struct qcom_swrm_ctrl {
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
 };
 
+struct qcom_swrm_data {
+	u32 default_cols;
+	u32 default_rows;
+};
+
+static struct qcom_swrm_data swrm_v1_3_data = {
+	.default_rows = 48,
+	.default_cols = 16,
+};
+
+static struct qcom_swrm_data swrm_v1_5_data = {
+	.default_rows = 50,
+	.default_cols = 16,
+};
+
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
 
 static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
@@ -299,8 +311,10 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32 val;
 
 	/* Clear Rows and Cols */
-	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
-	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MIN_COL_VAL);
+	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK,
+			 ctrl->rows_index);
+	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK,
+			  ctrl->cols_index);
 
 	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
 
@@ -378,8 +392,10 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
 	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
 
-	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MAX_COL_VAL);
-	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
+	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK,
+			  ctrl->cols_index);
+	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK,
+			  ctrl->rows_index);
 
 	return ctrl->reg_write(ctrl, reg, val);
 }
@@ -780,6 +796,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	struct sdw_master_prop *prop;
 	struct sdw_bus_params *params;
 	struct qcom_swrm_ctrl *ctrl;
+	const struct qcom_swrm_data *data;
 	int ret;
 	u32 val;
 
@@ -787,6 +804,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
+	data = of_device_get_match_data(dev);
+	ctrl->rows_index = sdw_find_row_index(data->default_rows);
+	ctrl->cols_index = sdw_find_col_index(data->default_cols);
 #if IS_ENABLED(CONFIG_SLIMBUS)
 	if (dev->parent->bus == &slimbus_bus) {
 #else
@@ -836,8 +856,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	params = &ctrl->bus.params;
 	params->max_dr_freq = DEFAULT_CLK_FREQ;
 	params->curr_dr_freq = DEFAULT_CLK_FREQ;
-	params->col = SWRM_DEFAULT_COL;
-	params->row = SWRM_DEFAULT_ROWS;
+	params->col = data->default_cols;
+	params->row = data->default_rows;
 	ctrl->reg_read(ctrl, SWRM_MCP_STATUS, &val);
 	params->curr_bank = val & SWRM_MCP_STATUS_BANK_NUM_MASK;
 	params->next_bank = !params->curr_bank;
@@ -847,8 +867,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	prop->num_clk_gears = 0;
 	prop->num_clk_freq = MAX_FREQ_NUM;
 	prop->clk_freq = &qcom_swrm_freq_tbl[0];
-	prop->default_col = SWRM_DEFAULT_COL;
-	prop->default_row = SWRM_DEFAULT_ROWS;
+	prop->default_col = data->default_cols;
+	prop->default_row = data->default_rows;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
 
@@ -899,8 +919,8 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_swrm_of_match[] = {
-	{ .compatible = "qcom,soundwire-v1.3.0", },
-	{ .compatible = "qcom,soundwire-v1.5.1", },
+	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
+	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
 	{/* sentinel */},
 };
 
-- 
2.21.0

