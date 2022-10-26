Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856D60DF44
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 13:04:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175973F21;
	Wed, 26 Oct 2022 13:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175973F21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666782299;
	bh=+8oaY/tp0NNZdcTnQ2EbZ8P/FEWsJOH8VAWPePuOyho=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VvDarD3RhncGjLu/S2yWrYu5oJqZ8olvRl+/+888u0t8zLD1riO5K8sW3cD733pRm
	 DukpDy0N2DawPTqBJx/mgpmHo0UKp22kIPtB6thkE+5X15OV1ykyCUhrUL3JBDSGi3
	 KzawFdOyIGVgJIC9rWOrEJXofNhd6MxFH6iwA0jM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51FD4F80568;
	Wed, 26 Oct 2022 13:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB29F80557; Wed, 26 Oct 2022 13:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_NONE,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C75E6F804B4
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 13:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C75E6F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nCFoVQj1"
Received: by mail-wr1-x433.google.com with SMTP id o4so17464528wrq.6
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wv+lK711vFeOkaa3Qp58DAbyPphjfDZDE3jaNs67Gvk=;
 b=nCFoVQj1TzEu56BZ7+4z29jNcy1DdPyggeQccdQjjd4B46gWsDCDhN9iz/QOxic6lA
 k/nygJ4hASyHt5AZCV6JOveUNr3H2UNBSyveXcadxsD8gINgBi4FWkX1teanfP1nibIW
 SFQ4Vi+fbvTBB1Ge5AjaV9bQXRHqssoGl8Fyfov+2EIoRzOkdH/7jqCUuNRwddNgBtRT
 UUBM0Bx9ZsTkhhC/s36tCYQa3gIV0mADpFbUqQnPLVHOOfJ5FyreoLeiJT4YVriyLN0C
 LESJ1P062nzfBJzNRlOvZrh/cXTBDxzd0mKTaH3Ve9FmOsgcFLJNUDQhul+CIZEfV41U
 T38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wv+lK711vFeOkaa3Qp58DAbyPphjfDZDE3jaNs67Gvk=;
 b=k2awIiRSOSvc6CDnJsha/fF/+A97mGajLY602QpCdznnKcxsQNtDW92KEdiRfo6IQp
 ePoJAkNMw7uvxRvGOZV7t4g+x21DUYhyVmT+1TQDX+ix/D3T5v9U9ZCiOPIdg5g/B3Tu
 mSqZWAHPaYpoKmR+trd5t01gu0JxNAkVbxj/GTMoHTridtH4H25G6cv76G3FK3h3Ruot
 Q0vfNQrClnCMcLR2Ip7mte3lDU2y4Eo6geMj8ikMOhLcdb6XP9ZiLeUIiAD+YBBSQxX1
 nBol9EiY77syWXGtEUDiGXk/z4Nlv74Zlg5GwIFwRf5k6cKUCSZnAT6qQ1WDILbDT/lb
 ULOQ==
X-Gm-Message-State: ACrzQf2YXcMGlEh5hgVtgumVhxupq4VEGhfgtpVj3agPn5+bxVCi8/y2
 AZ9B41ZbCJdmd+w5P9FmORYVHw==
X-Google-Smtp-Source: AMsMyM5/IK0Y55jZRn1DGhW6Oe8RtJZuWJ+ACBij9XW/Sp94JeJDtzyZVdNkfNfHekrL8fZcLBSS2Q==
X-Received: by 2002:a05:6000:1687:b0:231:95e6:e9ec with SMTP id
 y7-20020a056000168700b0023195e6e9ecmr30383929wrd.275.1666782149546; 
 Wed, 26 Oct 2022 04:02:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a5d44c7000000b0023672104c24sm5237415wrr.74.2022.10.26.04.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 04:02:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 6/6] soundwire: qcom: add support for v1.7 Soundwire Controller
Date: Wed, 26 Oct 2022 12:02:10 +0100
Message-Id: <20221026110210.6575-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com
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

This patch add support for v1.7 SoundWire Controller which has
support for Multi-EE (Execution Environment), resulting in a
new register and extending field in BUS_CTRL register.

With these updates v1.7.0 is fully supported.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 54d370f4b291..335424870290 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -25,6 +25,8 @@
 
 #define SWRM_COMP_SW_RESET					0x008
 #define SWRM_COMP_STATUS					0x014
+#define SWRM_LINK_MANAGER_EE					0x018
+#define SWRM_EE_CPU						1
 #define SWRM_FRM_GEN_ENABLED					BIT(0)
 #define SWRM_COMP_HW_VERSION					0x00
 #define SWRM_COMP_CFG_ADDR					0x04
@@ -693,7 +695,14 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
-	ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
+	if (ctrl->version >= 0x01070000) {
+		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
+		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
+				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
+	} else {
+		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
+	}
+
 	/* Configure number of retries of a read/write cmd */
 	if (ctrl->version > 0x01050001) {
 		/* Only for versions >= 1.5.1 */
@@ -1518,7 +1527,13 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	} else {
 		reset_control_reset(ctrl->audio_cgcr);
 
-		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
+		if (ctrl->version >= 0x01070000) {
+			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
+			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
+					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
+		} else {
+			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
+		}
 		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR,
 			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
 
@@ -1582,6 +1597,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
 	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
 	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
+	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
 	{/* sentinel */},
 };
 
-- 
2.21.0

