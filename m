Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E2E25550F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FF1182E;
	Fri, 28 Aug 2020 09:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FF1182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598599547;
	bh=SCBinwwUvcRl1ivI2Bf/Ks6zxur2RllsD2sIxoMrICE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r/W8RzjmsmorBBtTGoTx7vprzHYHtus4QJgohjPkMQWs4SQk0Ofvu2lmqsRPtFvDf
	 FmgBEosZH2iwxs7+ov1pWJ9WVjuZcHIb2FqzYgNub92JYeKNSQv7q0r+kccADB1IBx
	 cFMLdJYg8kw+cQ8zxhr4dZl7GNvB04BRx3+G0Jeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC5AF802E7;
	Fri, 28 Aug 2020 09:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8852F802D2; Fri, 28 Aug 2020 09:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55A3CF80264
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A3CF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YAeFZ+wS"
Received: from localhost.localdomain (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84E8320DD4;
 Fri, 28 Aug 2020 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598599288;
 bh=SCBinwwUvcRl1ivI2Bf/Ks6zxur2RllsD2sIxoMrICE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YAeFZ+wSoQVVSbSR7V1vzLnlraTtczK3MTsJ3K6evRZbc6Z56/D6AhWMOx51FbYcn
 FhQoZ/I/uni+ga1ewzcqgHluFsfvktI504BRDFD7eODLRHZR3df7PE4OfxfObvlhb2
 d+ffquJWAR7u7oABNAEylPzAlUuQyXConbgjaz7c=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/9] soundwire: qcom : use FIELD_{GET|PREP}
Date: Fri, 28 Aug 2020 12:50:57 +0530
Message-Id: <20200828072101.3781956-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828072101.3781956-1-vkoul@kernel.org>
References: <20200828072101.3781956-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

use FIELD_{GET|PREP} in qcom driver to get/set field values instead of
open coding masks and shift operations.
Also, remove now unused register shift defines

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/qcom.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 915c2cf0c274..dafa3f3dd1ab 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -43,13 +43,10 @@
 #define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
 #define SWRM_ENUMERATOR_CFG_ADDR				0x500
 #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
-#define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT			3
 #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
 #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
-#define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT			0
 #define SWRM_MCP_CFG_ADDR					0x1048
 #define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
-#define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT		0x11
 #define SWRM_DEF_CMD_NO_PINGS					0x1f
 #define SWRM_MCP_STATUS						0x104C
 #define SWRM_MCP_STATUS_BANK_NUM_MASK				BIT(0)
@@ -284,8 +281,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32 val;
 
 	/* Clear Rows and Cols */
-	val = (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
-	       SWRM_MIN_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
+	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
+	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MIN_COL_VAL);
 
 	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
 
@@ -298,9 +295,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	/* Configure No pings */
 	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
-	val &= ~SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK;
-	val |= (SWRM_DEF_CMD_NO_PINGS <<
-		SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT);
+	val |= FIELD_PREP(SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK, SWRM_DEF_CMD_NO_PINGS);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
 	/* Configure number of retries of a read/write cmd */
@@ -355,11 +350,8 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 
 	ctrl->reg_read(ctrl, reg, &val);
 
-	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
-	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
-
-	val |= (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
-		SWRM_MAX_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
+	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MAX_COL_VAL);
+	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
 
 	return ctrl->reg_write(ctrl, reg, val);
 }
@@ -693,8 +685,8 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
 
-	ctrl->num_dout_ports = val & SWRM_COMP_PARAMS_DOUT_PORTS_MASK;
-	ctrl->num_din_ports = (val & SWRM_COMP_PARAMS_DIN_PORTS_MASK) >> 5;
+	ctrl->num_dout_ports = FIELD_GET(SWRM_COMP_PARAMS_DOUT_PORTS_MASK, val);
+	ctrl->num_din_ports = FIELD_GET(SWRM_COMP_PARAMS_DIN_PORTS_MASK, val);
 
 	ret = of_property_read_u32(np, "qcom,din-ports", &val);
 	if (ret)
-- 
2.26.2

