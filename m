Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42743CB601
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 12:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F66B1676;
	Fri, 16 Jul 2021 12:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F66B1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626431112;
	bh=M8OCnyw2vkf8WdKQTzUIX6K9NX7wGgYzbCqnAQX+1AQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G9e9mYhG3jk5m4ahQwpmf/PVK5YmJwli/KMeWvXF46E4b2IFf9lzlvpJR3pbY/32D
	 dMP9zTFor48K6+VNdJcyTGtUQcIj8JOGFx0ZmC+NhqGtJI9epHTQSL8p2YhNy9g4rP
	 nBrRxM8BhntL2ynFGIoEjGsYXNE/n78gmfScXiZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2CAEF8026D;
	Fri, 16 Jul 2021 12:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16429F80424; Fri, 16 Jul 2021 12:22:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28A32F80254
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 12:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28A32F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xSyYife0"
Received: by mail-wr1-x42c.google.com with SMTP id f9so11451169wrq.11
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RH8cJpfI22EW3WzQFW97y0L55bfdGZoYafA5iYEI+Gs=;
 b=xSyYife0tK8Wfn1AeIqVivedOLa58eDWnp2XZ/NO8MbdLNwDv2h5WY/icWPtYUorEv
 THnhvCJFfY7DbION+eaZnVdlFIo738ELu3z8hK8jH9RXCWUgYR+QwdMIBb8qsBjl3AID
 dYx6WsO6/rcNYAtbvNOFWhUB4TLof2I2fLpplYd6Z2pMjhgEBipZ1gVN6l435fPoOyTy
 OfLIyNn28MNMJJOT343A8thpGAzWkTSshp8RvfD3OK+6la4NtmUSs9JbNjDY9uBlRcqo
 wowE1Y6vWw9i+wu7Iohh1HamHfw3xUnGcc6srf/d+35Zhht1z42oazBl3f3f3voecOar
 Vbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RH8cJpfI22EW3WzQFW97y0L55bfdGZoYafA5iYEI+Gs=;
 b=Qd/7BLxCdMc7Bpp+qtcLbhJjXvl4MIP8BLkChBlAKT5NiMkFKLl3JJAqISwuqecfjB
 FuV5ifsRIxQyGXUKaHgXJ878QV2i3pby1hjODaB/EVNbL+dzMajXYdzB0kbe+RkwhzT4
 UOd2fBdsCOpzhNRj7SBNogZSw7wY2JRBgmtOFl7xND5uJsyQf+KvYy6zLIQZ/IFVr5Pg
 41kwKCsJ3+GBRIpmziIwZ+YO0NymNhQ1+jWI0dc/Za9XP3Kun6oSzmDYQ4ZJxUmljiW+
 NaYqua9AzT3K7PgXWX8vAmKi8FfCjR366AIW6QaDvR/dHwIUWYWDWrboajCvmOGaKyLP
 g46Q==
X-Gm-Message-State: AOAM530f6XJd3MmQuCKsjqwqzJ/GtXP3711JuKKKMdg5m2mmjc8GfzT5
 nPWSto96Jv/gFIhB3mb/S4PFOg==
X-Google-Smtp-Source: ABdhPJxkdjbtScSNsWZzVR5VWqcv2L/5BW51zAQpb8zHod1cXpcF3Ss+cnsGhFs2Bqw+BOUK9cyoNA==
X-Received: by 2002:adf:e107:: with SMTP id t7mr11391576wrz.165.1626430958309; 
 Fri, 16 Jul 2021 03:22:38 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g15sm7421796wmh.44.2021.07.16.03.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:22:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: srini@kernel.org
Subject: [PATCH 3/4] slimbus: ngd: set correct device for pm
Date: Fri, 16 Jul 2021 11:21:22 +0100
Message-Id: <20210716102123.26861-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210716102123.26861-1-srinivas.kandagatla@linaro.org>
References: <20210716102123.26861-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

For some reason we ended up using wrong device in some places for pm_runtime calls.
Fix this so that NGG driver can do runtime pm correctly.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index c054e83ab636..f3ee8e036372 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -618,7 +618,7 @@ static void qcom_slim_ngd_rx(struct qcom_slim_ngd_ctrl *ctrl, u8 *buf)
 		(mc == SLIM_USR_MC_GENERIC_ACK &&
 		 mt == SLIM_MSG_MT_SRC_REFERRED_USER)) {
 		slim_msg_response(&ctrl->ctrl, &buf[4], buf[3], len - 4);
-		pm_runtime_mark_last_busy(ctrl->dev);
+		pm_runtime_mark_last_busy(ctrl->ctrl.dev);
 	}
 }
 
@@ -1257,13 +1257,14 @@ static int qcom_slim_ngd_enable(struct qcom_slim_ngd_ctrl *ctrl, bool enable)
 		}
 		/* controller state should be in sync with framework state */
 		complete(&ctrl->qmi.qmi_comp);
-		if (!pm_runtime_enabled(ctrl->dev) ||
-				!pm_runtime_suspended(ctrl->dev))
-			qcom_slim_ngd_runtime_resume(ctrl->dev);
+		if (!pm_runtime_enabled(ctrl->ctrl.dev) ||
+			 !pm_runtime_suspended(ctrl->ctrl.dev))
+			qcom_slim_ngd_runtime_resume(ctrl->ctrl.dev);
 		else
-			pm_runtime_resume(ctrl->dev);
-		pm_runtime_mark_last_busy(ctrl->dev);
-		pm_runtime_put(ctrl->dev);
+			pm_runtime_resume(ctrl->ctrl.dev);
+
+		pm_runtime_mark_last_busy(ctrl->ctrl.dev);
+		pm_runtime_put(ctrl->ctrl.dev);
 
 		ret = slim_register_controller(&ctrl->ctrl);
 		if (ret) {
@@ -1389,7 +1390,7 @@ static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
 		/* Make sure the last dma xfer is finished */
 		mutex_lock(&ctrl->tx_lock);
 		if (ctrl->state != QCOM_SLIM_NGD_CTRL_DOWN) {
-			pm_runtime_get_noresume(ctrl->dev);
+			pm_runtime_get_noresume(ctrl->ctrl.dev);
 			ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
 			qcom_slim_ngd_down(ctrl);
 			qcom_slim_ngd_exit_dma(ctrl);
-- 
2.21.0

