Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85E26C070
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 11:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93EFC16A0;
	Wed, 16 Sep 2020 11:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93EFC16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600248276;
	bh=msscQpqw+/OtH84jf84XfxvF0YvZPKPe+xa5CAJn1F4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rU8LCNM6uR8ydw5QEAbii1W1QrAa7AGVtWFYvdhW+iW0JacgSHViYIywUlsM6WOr9
	 jqzpdExk1DaMS4hGyjvuiOJotLLqS3Ti821A8uMT6vVl2MdvvXoIFWcwSR5XMLngQN
	 0xt26AHPl50kb8xsUOPKlt1uY1rI/gefiqxZXRWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8867CF802C3;
	Wed, 16 Sep 2020 11:22:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C49DF802C4; Wed, 16 Sep 2020 11:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6091F800E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 11:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6091F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="w5xzwJ7D"
Received: by mail-wr1-x441.google.com with SMTP id j2so6100682wrx.7
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c2gVxrCi9glLMLKPFqRHtDRqN+v92yDNp7cQSvfaLDs=;
 b=w5xzwJ7DEAAVAV+qbGoXJ6NjZjrZ6PgJlINE91hIc/LkQBKQD/vSESjvFvHK/rIwZZ
 SRnlEsoJb73EUj3Bvr7QesMw2Kuv+Mm7mC2P36u8np53qUMnHDQVW2asJP7tMKeEIqQG
 GW/HFYKGTVg0cD1RJ4U9WNfxd6ajeHCVn93GNrMo9hDftXdcvE2hibJb1O1LhKePT/9n
 31rw1dg77mBJz+bXwT2jJ4Y3Avso6SHljzemA3MV4K3l32i1ax6mWjwJPeG29adaG8n2
 jfOo5/9FryA/mmglJdLRc4QrvZ8MjCgJBm2N/sbAl/wiUGYQ/PNJ5dH8TO00959krWQX
 D/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2gVxrCi9glLMLKPFqRHtDRqN+v92yDNp7cQSvfaLDs=;
 b=UIOVuRpSfhkDcAmqLZrOrr6/Bembr8bDSLBOXRIOcn7EV50poTsSIFoNq2NceI449z
 Dk/yIJAzC9bqSziqMvxaT3lyXGD2eSAtYvkyDPHF17U/i0Zs9sHwRh7gyujNryIKiegH
 T3SzXY4XEyYTbXU92AiINYoWVAc+K9NPpSDqJLl+Rn13BHnR7eva7Cg9+Lpw2ehPIyfn
 Fb030XDsnVENAh+PXg82edYFvtv8Z4Yjkp8JeKrKg3EIMWI+9my9Cd29iO2t6/nuP3+/
 xXLHTxqspGth+S/lO23Y1balbf9pFQ6my11N//gR5mtLmwerAljxcl2VahEu/DdnpqiF
 sqOQ==
X-Gm-Message-State: AOAM530L/rVLaY1CLwNJvZPMIS//PnheDPu7MWLM8pR3lQMSpuv/Sk4s
 ohWYKd0rDPfWCKsM3ZVS8TY7Ig==
X-Google-Smtp-Source: ABdhPJzpE2u5fAA8akBuiUTzr9BhpJMZooLP80YXNif8VNm8muuwqItlwE86ob4OsL4witjZHhwE/A==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr16476022wrl.54.1600248112307; 
 Wed, 16 Sep 2020 02:21:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f6sm32181670wro.5.2020.09.16.02.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:21:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v2 2/3] soundwire: qcom: add support to block packing mode
Date: Wed, 16 Sep 2020 10:21:24 +0100
Message-Id: <20200916092125.30898-3-srinivas.kandagatla@linaro.org>
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

This patch adds support to block pack mode, which is required
on Qcom soundwire controllers v1.5.x on few ports!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 5d26361ab4f6..76963a7bdaa3 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -54,6 +54,7 @@
 #define SWRM_MCP_SLV_STATUS					0x1090
 #define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
 #define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DP_BLOCK_CTRL3_BANK(n, m)	(0x1138 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
 #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
 #define SWRM_DP_PORT_CTRL_OFFSET1_SHFT				0x08
@@ -82,6 +83,7 @@ struct qcom_swrm_port_config {
 	u8 si;
 	u8 off1;
 	u8 off2;
+	u8 bp_mode;
 };
 
 struct qcom_swrm_ctrl {
@@ -396,14 +398,22 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 {
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 value;
+	int reg = SWRM_DP_PORT_CTRL_BANK((params->port_num), bank);
+	int ret;
 
 	value = params->offset1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
 	value |= params->offset2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
 	value |= params->sample_interval - 1;
 
-	return ctrl->reg_write(ctrl,
-			       SWRM_DP_PORT_CTRL_BANK((params->port_num), bank),
-			       value);
+	ret = ctrl->reg_write(ctrl, reg, value);
+
+	if (!ret && params->blk_pkg_mode) {
+		reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
+
+		ret = ctrl->reg_write(ctrl, reg, 1);
+	}
+
+	return ret;
 }
 
 static int qcom_swrm_port_enable(struct sdw_bus *bus,
@@ -451,6 +461,7 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 			p_rt->transport_params.sample_interval = pcfg->si + 1;
 			p_rt->transport_params.offset1 = pcfg->off1;
 			p_rt->transport_params.offset2 = pcfg->off2;
+			p_rt->transport_params.blk_pkg_mode = pcfg->bp_mode;
 		}
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
@@ -461,6 +472,7 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 					pcfg->si + 1;
 				p_rt->transport_params.offset1 = pcfg->off1;
 				p_rt->transport_params.offset2 = pcfg->off2;
+				p_rt->transport_params.blk_pkg_mode = pcfg->bp_mode;
 				i++;
 			}
 		}
@@ -707,6 +719,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	u8 off1[QCOM_SDW_MAX_PORTS];
 	u8 off2[QCOM_SDW_MAX_PORTS];
 	u8 si[QCOM_SDW_MAX_PORTS];
+	u8 bp_mode[QCOM_SDW_MAX_PORTS] = { 0, };
 	int i, ret, nports, val;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
@@ -749,10 +762,13 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	if (ret)
 		return ret;
 
+	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
+					bp_mode, nports);
 	for (i = 0; i < nports; i++) {
 		ctrl->pconfig[i].si = si[i];
 		ctrl->pconfig[i].off1 = off1[i];
 		ctrl->pconfig[i].off2 = off2[i];
+		ctrl->pconfig[i].bp_mode = bp_mode[i];
 	}
 
 	return 0;
-- 
2.21.0

