Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E7626316A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 18:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA9D1733;
	Wed,  9 Sep 2020 18:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA9D1733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599667962;
	bh=xiFOISpxOdLF9LH1B7NnrNDQ7aqFFgRXWe96Y7sbcjE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlmtE9kquj6w8025Tw3kc8nYkKkfK66Bjq7nYaL+zq1WoZxl6T8z6HMwXjEzRb1CW
	 e7wT4ER3ja3ycemrp4eq6hG4QlR8u43ErIUj5PHxEs0MCmZis5KQUljXFN36woTSGJ
	 reF4cq/SFfAgZjEwRP8XmD/pSb23FdvcuEeIppcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6446F800E9;
	Wed,  9 Sep 2020 18:09:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3020DF802DF; Wed,  9 Sep 2020 18:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E03EAF800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 18:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E03EAF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G8JNf4WQ"
Received: by mail-wr1-x443.google.com with SMTP id g4so3584423wrs.5
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRY48n4o7lqyeOMqHNi/gjEPBgAxUiFR7TIRFWcKW3c=;
 b=G8JNf4WQ/NztVBWlPjOiBhrUInzg7S3HLCwKjVB79t6IN1kv/KTDuJ7JOib17cMbeB
 F1j/eZYhusposXKnVMPoIIVHEYO1O5ScnP9VZTdWHQvvBQV6bH6xBB5spC1+azLQrbz4
 yh8mDJUodv981BuP8jff/59jVf5SNu6pLSHuiQaYutcuAtNhIn9d07271/HxvFA9fGaa
 gRXLbtW1wSxVXNG98pj4PjzTM8U66A2czIUJA+G/hhVvS+Dwiyg+7co5+zfV8dwox5jc
 A734D3jLZB0//+yl+KG+aRHR9cA2QP//KHVns451RxFLpsO28Pj5sIgh211EXji0pVpa
 78lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRY48n4o7lqyeOMqHNi/gjEPBgAxUiFR7TIRFWcKW3c=;
 b=YGM9kd2PwtPXU/4UdP5dwFcAOF/aNHiPAMhWwcICKJi9rUqFSZynyxCuS19YgzH3EU
 3xcHf/ueNeZtPKP6b01FQGLdaHCFeaN6+IKK8FopusHgrkcbZrp+c2DVowKGRDj2Sbh5
 vND757wpJGcXNhiqAqphvYkFWHOx+KmMEo/gu6N5oXcjzPbVjk4Vo/pdb1f6HAHftdX9
 CadAb6YYKfdNuLaIIYpiwWapq1YtQURcXYewZxQ2bhSPTw9GfnGTPO7dZ0OjxV9QO87k
 7usWAgYZOwjXg7VGjWeQ+D98UXfIehvD5HcSm3DLTdV77/GV7XociPuvFYv7xIlIRvaU
 tz2g==
X-Gm-Message-State: AOAM531iUZx6PM8mGYR67AvjdyZKgq+zvcUozUv1lN6ot3CCrESekBQV
 awks66gIXxkdFJZIt1onyqd5+g==
X-Google-Smtp-Source: ABdhPJzszX7vpVkDZmwOXwkOKo3BLLvvvjBzsK0OfJGSUU4rR98MFT+i0aT0tcOF+WZqRguFRNzg3w==
X-Received: by 2002:adf:db48:: with SMTP id f8mr4969370wrj.144.1599667768139; 
 Wed, 09 Sep 2020 09:09:28 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id k22sm4900824wrd.29.2020.09.09.09.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:09:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/2] soundwire: qcom: get max rows and cols info from
 compatible
Date: Wed,  9 Sep 2020 17:09:12 +0100
Message-Id: <20200909160912.3656-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200909160912.3656-1-srinivas.kandagatla@linaro.org>
References: <20200909160912.3656-1-srinivas.kandagatla@linaro.org>
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
 drivers/soundwire/qcom.c | 46 +++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 1ec0ee931f5b..03c5bc05fc6e 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -69,11 +69,6 @@
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
@@ -107,6 +102,8 @@ struct qcom_swrm_ctrl {
 	unsigned int version;
 	int num_din_ports;
 	int num_dout_ports;
+	int cols_index;
+	int rows_index;
 	unsigned long dout_port_mask;
 	unsigned long din_port_mask;
 	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
@@ -116,6 +113,21 @@ struct qcom_swrm_ctrl {
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
 };
 
+struct qcom_swrm_data {
+	int default_cols;
+	int default_rows;
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
@@ -302,8 +314,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32 val;
 
 	/* Clear Rows and Cols */
-	val = (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
-	       SWRM_MIN_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
+	val = ctrl->rows_index << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
+		ctrl->cols_index << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT;
 
 	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
 
@@ -382,8 +394,8 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
 	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
 
-	val |= (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
-		SWRM_MAX_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
+	val |= ctrl->rows_index << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
+	       ctrl->cols_index << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT;
 
 	return ctrl->reg_write(ctrl, reg, val);
 }
@@ -784,6 +796,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	struct sdw_master_prop *prop;
 	struct sdw_bus_params *params;
 	struct qcom_swrm_ctrl *ctrl;
+	const struct qcom_swrm_data *data;
 	struct resource *res;
 	int ret;
 	u32 val;
@@ -792,6 +805,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
+	data = of_device_get_match_data(dev);
+	ctrl->rows_index = sdw_find_row_index(data->default_rows);
+	ctrl->cols_index = sdw_find_col_index(data->default_cols);
 #ifdef CONFIG_SLIMBUS
 	if (dev->parent->bus == &slimbus_bus) {
 #else
@@ -844,8 +860,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
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
@@ -855,8 +871,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	prop->num_clk_gears = 0;
 	prop->num_clk_freq = MAX_FREQ_NUM;
 	prop->clk_freq = &qcom_swrm_freq_tbl[0];
-	prop->default_col = SWRM_DEFAULT_COL;
-	prop->default_row = SWRM_DEFAULT_ROWS;
+	prop->default_col = data->default_cols;
+	prop->default_row = data->default_rows;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
 
@@ -907,8 +923,8 @@ static int qcom_swrm_remove(struct platform_device *pdev)
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

