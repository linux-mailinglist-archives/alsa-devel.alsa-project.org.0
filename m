Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE39710D71
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 15:41:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 197B4D8;
	Thu, 25 May 2023 15:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 197B4D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685022071;
	bh=4AMQIxzvS4wlyYCXpZfHUVtR1jQSruFYcEBXvMpq3tQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cysawfFRrSMq1N0eccN1fFKdC+vEVaJCWboarzjflcXv3NoH72Cg2/CTpcc62feE/
	 5Hn/dcnw7WgPKrLJRzSdRc6W1yBuX33IG7iu1ATJpv5i7+xO8Dtb3qluoiD7tWdkp+
	 TXeb5lz5H7LURrSlE1i66AGUHc0xocvMai0D8c4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C57BF8057E; Thu, 25 May 2023 15:39:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A4F6F80579;
	Thu, 25 May 2023 15:39:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC7A4F80567; Thu, 25 May 2023 15:39:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 549D0F80007
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 15:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 549D0F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=enk4tTOQ
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30a8dc89c33so1421495f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 25 May 2023 06:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685021930; x=1687613930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0e4d294AXuwEBJZs4agoGK3jhgST3++yYamvsMPJTfc=;
        b=enk4tTOQPqyHhGGVUkh9wjJsA+DGP6BHKoVWWDAlaJEvZCUrr23mZ+YlG9L5sjUQjQ
         GEbt9AUjp5qgBY+RhmWKG3vK5BHzOlewlsaGRCa3wk5O5rFzoe9gn5CfCObtYlzoG9dq
         Mt0xwQH5Qa6wKEBBKGo6mrCCfEFHuGI0HUipri/Op0kJkA5JrBfnIxFtu6upGjumZ6rO
         JEXdo73k+YDPY5oQTEVGWGPllS34akWbHkst6za7pkb8f55CmRUBcWPgor7mkJEv5WVa
         mZgY1O/guESCD+AxM6rKPYsbU191IRl2aQjtVQbwqFPG+vc64TJcGKiDZ97dhvLasFSn
         0wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685021930; x=1687613930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0e4d294AXuwEBJZs4agoGK3jhgST3++yYamvsMPJTfc=;
        b=V3/SNPp1Z63NqiG8sfuOTmoo5aXnaJbYdzHvMnOQAhAbwyp3+7jBtQvTSIg9HzDiJe
         fqi6weyaYnQilHUuE8qmHy7mife/+kS+gd5iAk2b8bbpXB7GdBMe/jRyyogSJDdJBYkk
         JgpmrVSORPZrhjfNXzIUcaiebZJCyT2uxphGEAchE2ZMxSjEx0uxUiXSUdAAQxrNXjDQ
         FpBPXIfKCT0uIaGzBITRyh3/3WZGzONxEkdA6ZugiUtiTznGDeEccMm9YuW0OQFVduj+
         lP04/yZHGAz3W6VlyOyzz0FOdXce+k15B/zXy5voDzWlFEskNI8lrlWzBMO3HfN6CivO
         T3Ng==
X-Gm-Message-State: AC+VfDw/jVR8gx2xQsVtaEkLNmI8W3cvAYEU/adi3enbec5m6m9VRETk
	LADfkii4G7vXvfpFsH0VFLNEWw==
X-Google-Smtp-Source: 
 ACHHUZ4O35f2uYOCtYMctE+1Yzb4uQOY0hA9HEUzlSdXlmKszPcNeQYC9QWL6M48LVxqYKuT78K5iQ==
X-Received: by 2002:a5d:5710:0:b0:30a:bdfd:5c3c with SMTP id
 a16-20020a5d5710000000b0030abdfd5c3cmr1549534wrv.17.1685021930276;
        Thu, 25 May 2023 06:38:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a5d6551000000b00301a351a8d6sm1803641wrv.84.2023.05.25.06.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:38:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Cc: andersson@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	sanyog.r.kale@intel.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/4] soundwire: qcom: add software workaround for bus clash
 interrupt assertion
Date: Thu, 25 May 2023 14:38:11 +0100
Message-Id: <20230525133812.30841-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E2XV67JSR7JZXMQZR5OXS5TQIKHXIHHK
X-Message-ID-Hash: E2XV67JSR7JZXMQZR5OXS5TQIKHXIHHK
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2XV67JSR7JZXMQZR5OXS5TQIKHXIHHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sometimes Hard reset does not clear some of the registers,
this sometimes results in firing a bus clash interrupt.
Add workaround for this during power up sequence, as
suggested by hardware manual.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 56 ++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index adf025194a31..1d2a105cb77f 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -793,6 +793,26 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
+{
+	int retry = SWRM_LINK_STATUS_RETRY_CNT;
+	int comp_sts;
+
+	do {
+		ctrl->reg_read(ctrl, SWRM_COMP_STATUS, &comp_sts);
+
+		if (comp_sts & SWRM_FRM_GEN_ENABLED)
+			return true;
+
+		usleep_range(500, 510);
+	} while (retry--);
+
+	dev_err(ctrl->dev, "%s: link status not %s\n", __func__,
+		comp_sts & SWRM_FRM_GEN_ENABLED ? "connected" : "disconnected");
+
+	return false;
+}
+
 static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 {
 	u32 val;
@@ -841,16 +861,28 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 				SWRM_RD_WR_CMD_RETRIES);
 	}
 
+	/* COMP Enable */
+	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR, SWRM_COMP_CFG_ENABLE_MSK);
+
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
-			SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK |
-			SWRM_COMP_CFG_ENABLE_MSK);
+			SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK);
+
+	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
+			0xFFFFFFFF);
 
 	/* enable CPU IRQs */
 	if (ctrl->mmio) {
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 				SWRM_INTERRUPT_STATUS_RMSK);
 	}
+
+	/* Set IRQ to PULSE */
+	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
+			SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK |
+			SWRM_COMP_CFG_ENABLE_MSK);
+
+	swrm_wait_for_frame_gen_enabled(ctrl);
 	ctrl->slave_status = 0;
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
 	ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
@@ -1626,26 +1658,6 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
-{
-	int retry = SWRM_LINK_STATUS_RETRY_CNT;
-	int comp_sts;
-
-	do {
-		ctrl->reg_read(ctrl, SWRM_COMP_STATUS, &comp_sts);
-
-		if (comp_sts & SWRM_FRM_GEN_ENABLED)
-			return true;
-
-		usleep_range(500, 510);
-	} while (retry--);
-
-	dev_err(ctrl->dev, "%s: link status not %s\n", __func__,
-		comp_sts & SWRM_FRM_GEN_ENABLED ? "connected" : "disconnected");
-
-	return false;
-}
-
 static int __maybe_unused swrm_runtime_resume(struct device *dev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
-- 
2.21.0

