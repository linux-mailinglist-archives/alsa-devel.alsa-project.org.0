Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B15136E5E11
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 11:57:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C99F9E72;
	Tue, 18 Apr 2023 11:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C99F9E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681811848;
	bh=DOtMGQkk2N6lBA1ECkMdhsQzWbxGi9L5vC9oymWFves=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=psCil3xdAur8X2jN5DkQcDQs0L5XHDVLZoL+t5tkWpP4c+50lFOgweyO53WbFn1bN
	 nt6SIsiN9+xGHp+5Pazt4UiOrqVceRIa+6wiIP6genjBjVxBB10uigORV0Oo59DePd
	 BWrccHwFyr/DHcEaU27/nFyyhx0o+/Zrydm+IlFM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FC8DF80558;
	Tue, 18 Apr 2023 11:55:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DA97F80551; Tue, 18 Apr 2023 11:55:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35F2BF800AC
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 11:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35F2BF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ln6My+Mk
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5067736607fso3743143a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681811697; x=1684403697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+l+hsPSTL+SQhVcuBaXgTPwNjHvTcsPoQKEgBb2Ew0=;
        b=ln6My+MkxEs63jljAyWAnu5QhJZV/RGwfS6j6zQdaGI8RHn83oytTAiqnW159SzoSZ
         thajP+L9fSGLwYdNk8MM4iPEjn8bXfwYZmSea6oRO8mrPS/5C+QP2Mnu4PGcfUs2p0aF
         2dvKD7OxnQsa/2BaeJNr2NRrmXP/RDnQx/hOL8Q9Ui19VsOhLKxBoLQ5sD3KR/bLJCp9
         qhsPinVdQcPL18W2IbJHJH5FuxrtW/Kz06xUS+HhnfDTN/988IkG8BVb6JTDqBfrQTAU
         zvX7catb2jMr2jI1ddA99wDB9XwNqSHOwP9qkOQWJgpeN0X35K0ymGe/Z63ElYNUn6sn
         iRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681811697; x=1684403697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+l+hsPSTL+SQhVcuBaXgTPwNjHvTcsPoQKEgBb2Ew0=;
        b=SLeySGQtTUappChF3qIuVonVQWgE/d4Y9vftqXUNC1vQN8Xd9K8STzc2JcXLY0P1nJ
         XbpbhbBPua2pg9ds2gVh+wGUhRgq/lhvWmo91oSBmmzX9UGUJxnjqyqn8LKGYJrMPOoW
         YFJRQRXhwQtm7lbrS5uE0VyTrP+oMt6ZI28CKoDltghbhj211ovp0WwuUuadobXm0Jpy
         b/tJj8cqNonnJ0i2470fHhKWryu4RM6KMRcmKYkx1lOUSkmUF0KzOxkF3fqa2nL2D8nv
         2diiObA1s+HbQqO457YJFkSYcw5A69n2INdVCt5zZS49KliZk3L2+2DAzto4k+/RyHtd
         6Uug==
X-Gm-Message-State: AAQBX9ezAHk7cOQGbisoNJRNxW1BxHTrI1wZ7rsq+RDl8TyzwMvcA675
	UPl34kmUQTgnKwPiswesznp/Ag==
X-Google-Smtp-Source: 
 AKy350Z0ioOAU7o9OId/fnMKI9587p6uPbjRSQyqAn22p6OSEn7eW79KY+tClucp9eDHg5Zrg/YunA==
X-Received: by 2002:aa7:cf11:0:b0:506:955d:a732 with SMTP id
 a17-20020aa7cf11000000b00506955da732mr1722355edy.25.1681811697178;
        Tue, 18 Apr 2023 02:54:57 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a509b04000000b00504d04c939fsm7076578edi.59.2023.04.18.02.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:54:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v3 5/7] soundwire: qcom: prepare for handling different
 register layouts
Date: Tue, 18 Apr 2023 11:54:45 +0200
Message-Id: <20230418095447.577001-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
References: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NYCO4BNCHXWNAACNKRKGGO2UHGOFWPR2
X-Message-ID-Hash: NYCO4BNCHXWNAACNKRKGGO2UHGOFWPR2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYCO4BNCHXWNAACNKRKGGO2UHGOFWPR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently the driver supports Qualcomm Soundwire controller versions
from v1.3 till v1.7 which mostly have same register layout.  With
coming Qualcomm Soundwire v2.0, several registers were moved and
changed, thus a different register layout will have to be supported.

Prepare for this by:
1. Renaming few register defines to indicate v1.3 (earliest supported)
   version,
2. Add a simple table for mapping register to its offset,
3. Change the code to use the mapping table.

Since only few registers differ, this solution seems easier then
switching to regmap fields.

Reviewed-by: Srinivas Kandagagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivas Kandagagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Add tags.

Changes since v1:
1. Fix lang typo in subject.
---
 drivers/soundwire/qcom.c | 130 +++++++++++++++++++++++++++++----------
 1 file changed, 97 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index dad12e9f5478..eac566f168da 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -41,7 +41,7 @@
 #define SWRM_COMP_PARAMS_DOUT_PORTS_MASK			GENMASK(4, 0)
 #define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
 #define SWRM_COMP_MASTER_ID					0x104
-#define SWRM_INTERRUPT_STATUS					0x200
+#define SWRM_V1_3_INTERRUPT_STATUS				0x200
 #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
 #define SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ			BIT(0)
 #define SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED		BIT(1)
@@ -58,20 +58,20 @@
 #define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
 #define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
 #define SWRM_INTERRUPT_MAX					17
-#define SWRM_INTERRUPT_MASK_ADDR				0x204
-#define SWRM_INTERRUPT_CLEAR					0x208
-#define SWRM_INTERRUPT_CPU_EN					0x210
-#define SWRM_CMD_FIFO_WR_CMD					0x300
-#define SWRM_CMD_FIFO_RD_CMD					0x304
+#define SWRM_V1_3_INTERRUPT_MASK_ADDR				0x204
+#define SWRM_V1_3_INTERRUPT_CLEAR				0x208
+#define SWRM_V1_3_INTERRUPT_CPU_EN				0x210
+#define SWRM_V1_3_CMD_FIFO_WR_CMD				0x300
+#define SWRM_V1_3_CMD_FIFO_RD_CMD				0x304
 #define SWRM_CMD_FIFO_CMD					0x308
 #define SWRM_CMD_FIFO_FLUSH					0x1
-#define SWRM_CMD_FIFO_STATUS					0x30C
+#define SWRM_V1_3_CMD_FIFO_STATUS				0x30C
 #define SWRM_RD_CMD_FIFO_CNT_MASK				GENMASK(20, 16)
 #define SWRM_WR_CMD_FIFO_CNT_MASK				GENMASK(12, 8)
 #define SWRM_CMD_FIFO_CFG_ADDR					0x314
 #define SWRM_CONTINUE_EXEC_ON_CMD_IGNORE			BIT(31)
 #define SWRM_RD_WR_CMD_RETRIES					0x7
-#define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
+#define SWRM_V1_3_CMD_FIFO_RD_FIFO_ADDR				0x318
 #define SWRM_RD_FIFO_CMD_ID_MASK				GENMASK(11, 8)
 #define SWRM_ENUMERATOR_CFG_ADDR				0x500
 #define SWRM_ENUMERATOR_SLAVE_DEV_ID_1(m)		(0x530 + 0x8 * (m))
@@ -97,7 +97,7 @@
 #define SWRM_DP_BLOCK_CTRL3_BANK(n, m)	(0x1138 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_SAMPLECTRL2_BANK(n, m)	(0x113C + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DIN_DPn_PCM_PORT_CTRL(n)	(0x1054 + 0x100 * (n - 1))
-#define SWR_MSTR_MAX_REG_ADDR		(0x1740)
+#define SWR_V1_3_MSTR_MAX_REG_ADDR				0x1740
 
 #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
 #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
@@ -143,10 +143,28 @@ struct qcom_swrm_port_config {
 	u8 lane_control;
 };
 
+/*
+ * Internal IDs for different register layouts.  Only few registers differ per
+ * each variant, so the list of IDs below does not include all of registers.
+ */
+enum {
+	SWRM_REG_FRAME_GEN_ENABLED,
+	SWRM_REG_INTERRUPT_STATUS,
+	SWRM_REG_INTERRUPT_MASK_ADDR,
+	SWRM_REG_INTERRUPT_CLEAR,
+	SWRM_REG_INTERRUPT_CPU_EN,
+	SWRM_REG_CMD_FIFO_WR_CMD,
+	SWRM_REG_CMD_FIFO_RD_CMD,
+	SWRM_REG_CMD_FIFO_STATUS,
+	SWRM_REG_CMD_FIFO_RD_FIFO_ADDR,
+};
+
 struct qcom_swrm_ctrl {
 	struct sdw_bus bus;
 	struct device *dev;
 	struct regmap *regmap;
+	u32 max_reg;
+	const unsigned int *reg_layout;
 	void __iomem *mmio;
 	struct reset_control *audio_cgcr;
 #ifdef CONFIG_DEBUG_FS
@@ -187,22 +205,42 @@ struct qcom_swrm_data {
 	u32 default_cols;
 	u32 default_rows;
 	bool sw_clk_gate_required;
+	u32 max_reg;
+	const unsigned int *reg_layout;
+};
+
+static const unsigned int swrm_v1_3_reg_layout[] = {
+	[SWRM_REG_FRAME_GEN_ENABLED] = SWRM_COMP_STATUS,
+	[SWRM_REG_INTERRUPT_STATUS] = SWRM_V1_3_INTERRUPT_STATUS,
+	[SWRM_REG_INTERRUPT_MASK_ADDR] = SWRM_V1_3_INTERRUPT_MASK_ADDR,
+	[SWRM_REG_INTERRUPT_CLEAR] = SWRM_V1_3_INTERRUPT_CLEAR,
+	[SWRM_REG_INTERRUPT_CPU_EN] = SWRM_V1_3_INTERRUPT_CPU_EN,
+	[SWRM_REG_CMD_FIFO_WR_CMD] = SWRM_V1_3_CMD_FIFO_WR_CMD,
+	[SWRM_REG_CMD_FIFO_RD_CMD] = SWRM_V1_3_CMD_FIFO_RD_CMD,
+	[SWRM_REG_CMD_FIFO_STATUS] = SWRM_V1_3_CMD_FIFO_STATUS,
+	[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] = SWRM_V1_3_CMD_FIFO_RD_FIFO_ADDR,
 };
 
 static const struct qcom_swrm_data swrm_v1_3_data = {
 	.default_rows = 48,
 	.default_cols = 16,
+	.max_reg = SWR_V1_3_MSTR_MAX_REG_ADDR,
+	.reg_layout = swrm_v1_3_reg_layout,
 };
 
 static const struct qcom_swrm_data swrm_v1_5_data = {
 	.default_rows = 50,
 	.default_cols = 16,
+	.max_reg = SWR_V1_3_MSTR_MAX_REG_ADDR,
+	.reg_layout = swrm_v1_3_reg_layout,
 };
 
 static const struct qcom_swrm_data swrm_v1_6_data = {
 	.default_rows = 50,
 	.default_cols = 16,
 	.sw_clk_gate_required = true,
+	.max_reg = SWR_V1_3_MSTR_MAX_REG_ADDR,
+	.reg_layout = swrm_v1_3_reg_layout,
 };
 
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
@@ -286,7 +324,8 @@ static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *ctrl)
 
 	do {
 		/* Check for fifo underflow during read */
-		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
+		ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_STATUS],
+			       &value);
 		fifo_outstanding_data = FIELD_GET(SWRM_RD_CMD_FIFO_CNT_MASK, value);
 
 		/* Check if read data is available in read fifo */
@@ -311,7 +350,8 @@ static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *ctrl)
 
 	do {
 		/* Check for fifo overflow during write */
-		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
+		ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_STATUS],
+			       &value);
 		fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
 
 		/* Check for space in write fifo before writing */
@@ -353,7 +393,7 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
 		reinit_completion(&ctrl->broadcast);
 
 	/* Its assumed that write is okay as we do not get any status back */
-	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
+	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_WR_CMD], val);
 
 	if (ctrl->version <= SWRM_VERSION_1_3_0)
 		usleep_range(150, 155);
@@ -392,7 +432,7 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
 
 	/* wait for FIFO RD to complete to avoid overflow */
 	usleep_range(100, 105);
-	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
+	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_RD_CMD], val);
 	/* wait for FIFO RD CMD complete to avoid overflow */
 	usleep_range(250, 255);
 
@@ -400,7 +440,8 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
 		return SDW_CMD_FAIL_OTHER;
 
 	do {
-		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
+		ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR],
+			       &cmd_data);
 		rval[0] = cmd_data & 0xFF;
 		cmd_id = FIELD_GET(SWRM_RD_FIFO_CMD_ID_MASK, cmd_data);
 
@@ -410,7 +451,9 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
 				usleep_range(500, 505);
 				ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD,
 						SWRM_CMD_FIFO_FLUSH);
-				ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
+				ctrl->reg_write(ctrl,
+						ctrl->reg_layout[SWRM_REG_CMD_FIFO_RD_CMD],
+						val);
 			}
 			retry_attempt++;
 		} else {
@@ -564,7 +607,8 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	int ret = IRQ_HANDLED;
 	clk_prepare_enable(ctrl->hclk);
 
-	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &intr_sts);
+	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
+		       &intr_sts);
 	intr_sts_masked = intr_sts & ctrl->intr_mask;
 
 	do {
@@ -602,29 +646,39 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 						"%s: SWR bus clsh detected\n",
 						__func__);
 				ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
-				ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
+				ctrl->reg_write(ctrl,
+						ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+						ctrl->intr_mask);
 				break;
 			case SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW:
-				ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
+				ctrl->reg_read(ctrl,
+					       ctrl->reg_layout[SWRM_REG_CMD_FIFO_STATUS],
+					       &value);
 				dev_err_ratelimited(ctrl->dev,
 					"%s: SWR read FIFO overflow fifo status 0x%x\n",
 					__func__, value);
 				break;
 			case SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW:
-				ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
+				ctrl->reg_read(ctrl,
+					       ctrl->reg_layout[SWRM_REG_CMD_FIFO_STATUS],
+					       &value);
 				dev_err_ratelimited(ctrl->dev,
 					"%s: SWR read FIFO underflow fifo status 0x%x\n",
 					__func__, value);
 				break;
 			case SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW:
-				ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
+				ctrl->reg_read(ctrl,
+					       ctrl->reg_layout[SWRM_REG_CMD_FIFO_STATUS],
+					       &value);
 				dev_err(ctrl->dev,
 					"%s: SWR write FIFO overflow fifo status %x\n",
 					__func__, value);
 				ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
 				break;
 			case SWRM_INTERRUPT_STATUS_CMD_ERROR:
-				ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
+				ctrl->reg_read(ctrl,
+					       ctrl->reg_layout[SWRM_REG_CMD_FIFO_STATUS],
+					       &value);
 				dev_err_ratelimited(ctrl->dev,
 					"%s: SWR CMD error, fifo status 0x%x, flushing fifo\n",
 					__func__, value);
@@ -636,7 +690,8 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 						__func__);
 				ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION;
 				ctrl->reg_write(ctrl,
-					SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
+						ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+						ctrl->intr_mask);
 				break;
 			case SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH:
 				dev_err_ratelimited(ctrl->dev,
@@ -645,7 +700,8 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				ctrl->intr_mask &=
 					~SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH;
 				ctrl->reg_write(ctrl,
-					SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
+						ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+						ctrl->intr_mask);
 				break;
 			case SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED:
 				complete(&ctrl->broadcast);
@@ -664,8 +720,10 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				break;
 			}
 		}
-		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, intr_sts);
-		ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &intr_sts);
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
+				intr_sts);
+		ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
+			       &intr_sts);
 		intr_sts_masked = intr_sts & ctrl->intr_mask;
 	} while (intr_sts_masked);
 
@@ -690,7 +748,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
-	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
+	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
 			SWRM_INTERRUPT_STATUS_RMSK);
 
 	/* Configure No pings */
@@ -723,7 +781,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	/* enable CPU IRQs */
 	if (ctrl->mmio) {
-		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN,
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 				SWRM_INTERRUPT_STATUS_RMSK);
 	}
 	ctrl->slave_status = 0;
@@ -1312,7 +1370,7 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
 		return ret;
 	}
 
-	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
+	for (reg = 0; reg <= ctrl->max_reg; reg += 4) {
 		ctrl->reg_read(ctrl, reg, &reg_val);
 		seq_printf(s_file, "0x%.3x: 0x%.2x\n", reg, reg_val);
 	}
@@ -1340,6 +1398,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data = of_device_get_match_data(dev);
+	ctrl->max_reg = data->max_reg;
+	ctrl->reg_layout = data->reg_layout;
 	ctrl->rows_index = sdw_find_row_index(data->default_rows);
 	ctrl->cols_index = sdw_find_col_index(data->default_cols);
 #if IS_REACHABLE(CONFIG_SLIMBUS)
@@ -1556,12 +1616,14 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 		} else {
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
 		}
-		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR,
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
 
 		ctrl->intr_mask |= SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
-		ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
-		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
+				ctrl->intr_mask);
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+				ctrl->intr_mask);
 
 		usleep_range(100, 105);
 		if (!swrm_wait_for_frame_gen_enabled(ctrl))
@@ -1583,8 +1645,10 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 	if (!ctrl->clock_stop_not_supported) {
 		/* Mask bus clash interrupt */
 		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
-		ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
-		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
+				ctrl->intr_mask);
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+				ctrl->intr_mask);
 		/* Prepare slaves for clock stop */
 		ret = sdw_bus_prep_clk_stop(&ctrl->bus);
 		if (ret < 0 && ret != -ENODATA) {
-- 
2.34.1

