Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F869F6EF
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 15:45:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35F9FE82;
	Wed, 22 Feb 2023 15:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35F9FE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677077116;
	bh=TxO9aov8Hjf3TApeWy/MmCaJa+uTNF1/b4Z//SNAoKU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tkQ+I2a9lWMpTf2d+JvJufoJ54hzVaSKkLzuMhH0F+bsr+FjxO/KHinY7xGU+X51O
	 1TEyWcyKHghtSoBL2N/oHckKshxF8oClWlxpD50fumwxJ98AtRnKKFPmOVU3aEFK9Y
	 VGop/G+0ww3e+sOz1158/xhoRmRkMStpSMhiyNZw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60928F8025A;
	Wed, 22 Feb 2023 15:44:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24ADBF802DB; Wed, 22 Feb 2023 15:44:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8F8FF80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 15:44:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F8FF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mm5b3EYo
Received: by mail-wm1-x32d.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso6543121wmq.0
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 06:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5xj+mM0ucKmHJT5sr91ZY2NlPnqIfjLGto59YBLJZG8=;
        b=mm5b3EYoWyTwISYAKMHJjmQ1XpiKWHTk60XFv+YfAB9oXmIOOCtYX9ASecKqG016Fb
         6Lk3KnzVwiBJPBUhkm491tFqodYPr6uLamG0ltgktPH7tKTO0ILx8xsPwtn1WTWynjrY
         MdjtiDOv0fyIJasjRno29dnT4NmEOt06VNIapvCLFzk2nrhu8Fl34MB4J/W4lX0MEa2h
         0t+dXK00KRKOc/eS+0Vfg/Jm9BO0z/kCPD7C4YBEtgfCzVBTDU1SA1KXtertIZ99j333
         Qw9AALaKTioiqN5ztjFf4cPUPNX4gH+8dwUgd6Ur4bMfd5wl/rTU/bGhcyf8uUzowDEP
         9VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xj+mM0ucKmHJT5sr91ZY2NlPnqIfjLGto59YBLJZG8=;
        b=x/BKH2RqDhHmlJuj9xGBMQUZF3MQfCl4oEvuDKzLLlVXwlP82LAAsaGp2ES0Uz3CDG
         17OoAEy2qQe4MAG4dfE+7SsRMDGMgwDA8E/EIvLueSRJM4tOzbO5zV1/goo9oRqQJTQM
         O115IrCJWECCij1jI0ad3+REvuumf/5YIjW5ROt1bpep7KMonMyTGnY+3QSOEz0EzUPV
         oHMtPwigxknau4ZpFe1kel1GlE5tlp/L6IOU61JvVQ6RL0CQGNfwQ9yMmvv+QoIfwwIR
         OGc0onzqvU9qELq2kY2tBChP4/AYL1LNQlupbFszCJYZgBg7Tb9XWYWUmp5Ou1quj7uW
         NcGw==
X-Gm-Message-State: AO0yUKXlqmhl6U32t7uM/0ep3Uqt1T6F5zfbWGDepSYbhZxPS26fpOT7
	lFVLfcNsI8/Qq9uynoiY9cs8rv3O+ZGnVmtJ
X-Google-Smtp-Source: 
 AK7set9zWsGzEIloEL18ZmWsS6kdw9oFWQlNYXiZz/tMZy+rFWGdGw5nFWdWC/pAkubjXOw8zCoktA==
X-Received: by 2002:a05:600c:5112:b0:3e2:201a:5bce with SMTP id
 o18-20020a05600c511200b003e2201a5bcemr2199872wms.40.1677077055983;
        Wed, 22 Feb 2023 06:44:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003e7c89b3514sm5059776wmc.23.2023.02.22.06.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:44:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soundwire: qcom: define hardcoded version magic numbers
Date: Wed, 22 Feb 2023 15:44:11 +0100
Message-Id: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BOFLCK77XC4EJD3ZAROH6VR7J7U27L2X
X-Message-ID-Hash: BOFLCK77XC4EJD3ZAROH6VR7J7U27L2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOFLCK77XC4EJD3ZAROH6VR7J7U27L2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use a define instead of hard-coded register values for Soundwire
hardware version number, because it is a bit easier to read and allows
to drop explaining comment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index ba502129150d..79bebcecde6d 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -28,6 +28,9 @@
 #define SWRM_LINK_MANAGER_EE					0x018
 #define SWRM_EE_CPU						1
 #define SWRM_FRM_GEN_ENABLED					BIT(0)
+#define SWRM_VERSION_1_3_0					0x01030000
+#define SWRM_VERSION_1_5_1					0x01050001
+#define SWRM_VERSION_1_7_0					0x01070000
 #define SWRM_COMP_HW_VERSION					0x00
 #define SWRM_COMP_CFG_ADDR					0x04
 #define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
@@ -351,8 +354,7 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
 	/* Its assumed that write is okay as we do not get any status back */
 	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
 
-	/* version 1.3 or less */
-	if (swrm->version <= 0x01030000)
+	if (swrm->version <= SWRM_VERSION_1_3_0)
 		usleep_range(150, 155);
 
 	if (cmd_id == SWR_BROADCAST_CMD_ID) {
@@ -695,7 +697,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
-	if (ctrl->version >= 0x01070000) {
+	if (ctrl->version >= SWRM_VERSION_1_7_0) {
 		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
 				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
@@ -704,8 +706,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	}
 
 	/* Configure number of retries of a read/write cmd */
-	if (ctrl->version >= 0x01050001) {
-		/* Only for versions >= 1.5.1 */
+	if (ctrl->version >= SWRM_VERSION_1_5_1) {
 		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
 				SWRM_RD_WR_CMD_RETRIES |
 				SWRM_CONTINUE_EXEC_ON_CMD_IGNORE);
@@ -1239,7 +1240,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
 					bp_mode, nports);
 	if (ret) {
-		if (ctrl->version <= 0x01030000)
+		if (ctrl->version <= SWRM_VERSION_1_3_0)
 			memset(bp_mode, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
 		else
 			return ret;
@@ -1442,7 +1443,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	/* Clk stop is not supported on WSA Soundwire masters */
-	if (ctrl->version <= 0x01030000) {
+	if (ctrl->version <= SWRM_VERSION_1_3_0) {
 		ctrl->clock_stop_not_supported = true;
 	} else {
 		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
@@ -1527,7 +1528,7 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	} else {
 		reset_control_reset(ctrl->audio_cgcr);
 
-		if (ctrl->version >= 0x01070000) {
+		if (ctrl->version >= SWRM_VERSION_1_7_0) {
 			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
 					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
-- 
2.34.1

