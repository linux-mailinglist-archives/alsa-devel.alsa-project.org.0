Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D65E7326519
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 17:00:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D4E1687;
	Fri, 26 Feb 2021 16:59:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D4E1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614355217;
	bh=QRLITxTQUij1bQ4fSAN/yBVaDFNcmWy4S8IUabavMAE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NiCWw+9I1QPmAc39TTiPUOVsWW6rz8/n/9sC3NEpFXCoOJRHyi3iK9zRTGe+MwBGX
	 7bNXg1dEfyIbM+I/D4OHyWl1N14tolVh6UpAZ5iMr3dhYtsBGnKc1rUEf9rRV21+qN
	 IMY9eDOtgR346ZUsVZ2ywxGARUl29XuyJh9WDD9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 691FFF8028D;
	Fri, 26 Feb 2021 16:58:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 821EAF80276; Fri, 26 Feb 2021 16:58:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2B7DF8012C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2B7DF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hPjEA1Ms"
Received: by mail-wm1-x32a.google.com with SMTP id u125so8212797wmg.4
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1YAKRy5fkxKacpBgIFQx0d76By/15lDXdzbFdBPsYEY=;
 b=hPjEA1Msnq4UYqlb9zLDgoFP997Ex+SPM5ZPT/wm32GQNAQSjVLqoTQuGETvwFF+y0
 NcGKZPKTzP3+YrpD3TmDwb8eH0cO3zRAVsh/8GtgpbLwWByIwq73ZAEtH3YaKAwsnNbi
 vzRtjvQEmZK5KVg58xNPvqtD+ZN4eoGAsIws7vznfrSOLLXWPa0Blh5G16vfPh5fEAyq
 d0eQWWcinZL+FSIlaEGLH7nHM6Hk4e7pOhAewZkQBhQbYle1VGvbTI4zbQnEbA26xF4l
 8G82utE+iJ6Nub/5QWs98Z9ebVCvu+4HexbSqMtQuKOdqbV9KKPlTqFW7JmaDohOxpSB
 Ieyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YAKRy5fkxKacpBgIFQx0d76By/15lDXdzbFdBPsYEY=;
 b=oFWuGoPZPoRijHHo8sH0dQKKnXDHjvP9mMROTShuGEsvyk33Pxt2tG6M1QqwlHM/BO
 3JRd4ZO8+BrImcPlho4J8zotKQAI+x0ZYOYyOTPrT9NEM6HkRfS7Wlpci25inYw4eU6a
 +vW39f3Ou2uzU42+Dc4eIVo1SfalV6qcROj09zfe9mYY7bJKhnFq1Z3TSgjTuq+iP0Ux
 CVCA0DoqHgkJ2RAgZJD0v5iClnvflrPCpNQInFUoxG2e9AcR03iIMEcXGvX/Ndyj7qvQ
 /hMXxyoqoFLsG1et61+ok15+Vkc+Gxw7Mtp63gxHSgIR/6h62gJvGNSDYuvpPWZFhI6O
 FtwQ==
X-Gm-Message-State: AOAM5335VSSwbqvODoeXxo1BhQsu2dHWKoEsQhiSV3A8bIBBcxMD5QBh
 is9cfpJKbRjX/rbxGm6PRrKATQ==
X-Google-Smtp-Source: ABdhPJy/Qghn8HSdJxrUTB4cFgfaV/sOfPH8wxvhwh6xm/3tGvKatfO0glnzZHtwT2hPR7d+v7fZug==
X-Received: by 2002:a1c:e903:: with SMTP id q3mr3549967wmc.100.1614355107687; 
 Fri, 26 Feb 2021 07:58:27 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v6sm14398945wrx.32.2021.02.26.07.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 07:58:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v2 1/5] soundwire: qcom: add support to missing transport
 params
Date: Fri, 26 Feb 2021 15:58:10 +0000
Message-Id: <20210226155814.27536-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210226155814.27536-1-srinivas.kandagatla@linaro.org>
References: <20210226155814.27536-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

Some of the transport parameters derived from device tree
are not fully parsed by the driver.

This patch adds support to parse those missing parameters.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 99 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 95 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6d22df01f354..fee7465c72c2 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -54,7 +54,13 @@
 #define SWRM_MCP_SLV_STATUS					0x1090
 #define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
 #define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DP_PORT_CTRL_2_BANK(n, m)	(0x1128 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DP_BLOCK_CTRL_1(n)		(0x112C + 0x100 * (n - 1))
+#define SWRM_DP_BLOCK_CTRL2_BANK(n, m)	(0x1130 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DP_PORT_HCTRL_BANK(n, m)	(0x1134 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_BLOCK_CTRL3_BANK(n, m)	(0x1138 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DIN_DPn_PCM_PORT_CTRL(n)	(0x1054 + 0x100 * (n - 1))
+
 #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
 #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
 #define SWRM_DP_PORT_CTRL_OFFSET1_SHFT				0x08
@@ -73,12 +79,20 @@
 #define QCOM_SDW_MAX_PORTS	14
 #define DEFAULT_CLK_FREQ	9600000
 #define SWRM_MAX_DAIS		0xF
+#define SWR_INVALID_PARAM 0xFF
+#define SWR_HSTOP_MAX_VAL 0xF
+#define SWR_HSTART_MIN_VAL 0x0
 
 struct qcom_swrm_port_config {
 	u8 si;
 	u8 off1;
 	u8 off2;
 	u8 bp_mode;
+	u8 hstart;
+	u8 hstop;
+	u8 word_length;
+	u8 blk_group_count;
+	u8 lane_control;
 };
 
 struct qcom_swrm_ctrl {
@@ -396,7 +410,13 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 				 struct sdw_port_params *p_params,
 				 unsigned int bank)
 {
-	/* TBD */
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+
+	if (p_params->bps != SWR_INVALID_PARAM)
+		return ctrl->reg_write(ctrl,
+				       SWRM_DP_BLOCK_CTRL_1(p_params->num),
+				       p_params->bps - 1);
+
 	return 0;
 }
 
@@ -415,10 +435,32 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 
 	ret = ctrl->reg_write(ctrl, reg, value);
 
-	if (!ret && params->blk_pkg_mode) {
-		reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
+	if (params->lane_ctrl != SWR_INVALID_PARAM) {
+		reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
+		value = params->lane_ctrl;
+		ret = ctrl->reg_write(ctrl, reg, value);
+	}
 
-		ret = ctrl->reg_write(ctrl, reg, 1);
+	if (params->blk_grp_ctrl != SWR_INVALID_PARAM) {
+		reg = SWRM_DP_BLOCK_CTRL2_BANK(params->port_num, bank);
+		value = params->blk_grp_ctrl;
+		ret = ctrl->reg_write(ctrl, reg, value);
+	}
+
+	if (params->hstart != SWR_INVALID_PARAM
+			&& params->hstop != SWR_INVALID_PARAM) {
+		reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
+		value = (params->hstop << 4) | params->hstart;
+		ret = ctrl->reg_write(ctrl, reg, value);
+	} else {
+		reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
+		value = (SWR_HSTOP_MAX_VAL << 4) | SWR_HSTART_MIN_VAL;
+		ret = ctrl->reg_write(ctrl, reg, value);
+	}
+
+	if (params->blk_pkg_mode != SWR_INVALID_PARAM) {
+		reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
+		ret = ctrl->reg_write(ctrl, reg, params->blk_pkg_mode);
 	}
 
 	return ret;
@@ -470,6 +512,17 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 			p_rt->transport_params.offset1 = pcfg->off1;
 			p_rt->transport_params.offset2 = pcfg->off2;
 			p_rt->transport_params.blk_pkg_mode = pcfg->bp_mode;
+			p_rt->transport_params.blk_grp_ctrl = pcfg->blk_group_count;
+			p_rt->transport_params.hstart = pcfg->hstart;
+			p_rt->transport_params.hstop = pcfg->hstop;
+			p_rt->transport_params.lane_ctrl = pcfg->lane_control;
+			if (pcfg->word_length != SWR_INVALID_PARAM) {
+				sdw_fill_port_params(&p_rt->port_params,
+					     p_rt->num,  pcfg->word_length + 1,
+					     SDW_PORT_FLOW_MODE_ISOCH,
+					     SDW_PORT_DATA_MODE_NORMAL);
+			}
+
 		}
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
@@ -481,6 +534,18 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 				p_rt->transport_params.offset1 = pcfg->off1;
 				p_rt->transport_params.offset2 = pcfg->off2;
 				p_rt->transport_params.blk_pkg_mode = pcfg->bp_mode;
+				p_rt->transport_params.blk_grp_ctrl = pcfg->blk_group_count;
+
+				p_rt->transport_params.hstart = pcfg->hstart;
+				p_rt->transport_params.hstop = pcfg->hstop;
+				p_rt->transport_params.lane_ctrl = pcfg->lane_control;
+				if (pcfg->word_length != SWR_INVALID_PARAM) {
+					sdw_fill_port_params(&p_rt->port_params,
+						     p_rt->num,
+						     pcfg->word_length + 1,
+						     SDW_PORT_FLOW_MODE_ISOCH,
+						     SDW_PORT_DATA_MODE_NORMAL);
+				}
 				i++;
 			}
 		}
@@ -728,6 +793,11 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	u8 off2[QCOM_SDW_MAX_PORTS];
 	u8 si[QCOM_SDW_MAX_PORTS];
 	u8 bp_mode[QCOM_SDW_MAX_PORTS] = { 0, };
+	u8 hstart[QCOM_SDW_MAX_PORTS];
+	u8 hstop[QCOM_SDW_MAX_PORTS];
+	u8 word_length[QCOM_SDW_MAX_PORTS];
+	u8 blk_group_count[QCOM_SDW_MAX_PORTS];
+	u8 lane_control[QCOM_SDW_MAX_PORTS];
 	int i, ret, nports, val;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
@@ -772,11 +842,32 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 
 	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
 					bp_mode, nports);
+
+	memset(hstart, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
+	of_property_read_u8_array(np, "qcom,ports-hstart", hstart, nports);
+
+	memset(hstop, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
+	of_property_read_u8_array(np, "qcom,ports-hstop", hstop, nports);
+
+	memset(word_length, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
+	of_property_read_u8_array(np, "qcom,ports-word-length", word_length, nports);
+
+	memset(blk_group_count, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
+	of_property_read_u8_array(np, "qcom,ports-block-group-count", blk_group_count, nports);
+
+	memset(lane_control, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
+	of_property_read_u8_array(np, "qcom,ports-lane-control", lane_control, nports);
+
 	for (i = 0; i < nports; i++) {
 		ctrl->pconfig[i].si = si[i];
 		ctrl->pconfig[i].off1 = off1[i];
 		ctrl->pconfig[i].off2 = off2[i];
 		ctrl->pconfig[i].bp_mode = bp_mode[i];
+		ctrl->pconfig[i].hstart = hstart[i];
+		ctrl->pconfig[i].hstop = hstop[i];
+		ctrl->pconfig[i].word_length = word_length[i];
+		ctrl->pconfig[i].blk_group_count = blk_group_count[i];
+		ctrl->pconfig[i].lane_control = lane_control[i];
 	}
 
 	return 0;
-- 
2.21.0

