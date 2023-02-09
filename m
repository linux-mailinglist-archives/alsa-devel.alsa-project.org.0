Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CFD6909A7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 14:15:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 744A5DF4;
	Thu,  9 Feb 2023 14:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 744A5DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675948542;
	bh=rrBHItTWM+PKFev/ycwJhvOMBsHpY53m6R9FWU66jfw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BuXSOg7UTdeAbMgPKTjtRYeXimeXKHo0dNoLMZYjY2vH6bZf4NfBbJs9ETOI78F2z
	 Kjo21ITg8jbjbsh0ntBSL3qQck6+F3Cu7ul8v83sHcrMHOz0+36sMWCNnqJW69wdbv
	 teT8Bf4madRUr7qBTB1G4aYFUrqwiLRmsDUEvU1s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D165FF80525;
	Thu,  9 Feb 2023 14:14:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A37AAF804F2; Thu,  9 Feb 2023 14:14:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B634FF800B8
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 14:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B634FF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eSuI9Zqf
Received: by mail-wm1-x32f.google.com with SMTP id bg26so1437028wmb.0
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 05:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtCm7HHmygVV89PU04X4kKxKy0d9QS0qb0ALCWzJ2AE=;
        b=eSuI9ZqfTFGJOUknn/oOE6Qc01UKQtJJwm8VLN8g1fySb9QrJk6G4Hp6FLYreiKmA8
         0CiV/M+NSOwLIvlOFBCO4kCFbkNmdhiNUkHEYUa4+yYKKPcx4Ixm2Y3/d8ZhNTYpJlPQ
         mdTKwLDVP3iLzONlcUZT9P5bT2/jVxg6HJbRiRhm3e0LsXBCkALnt9kpadjxUtx9SM5e
         dN9Run2nQ2NC0RJEXdwEcXzfWAsUNAPXeVJzYrRM8oZZ+Jm/GuoGWHFpbyBzUnw/TViC
         33RQpX9wjEPe/5l2sAsCHy+7eCHOPTipoEnzHpRfNTZO3KvAIuFmqNZ5CKwZ+9yWPfJs
         Abkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtCm7HHmygVV89PU04X4kKxKy0d9QS0qb0ALCWzJ2AE=;
        b=TcVZIUlO3MRoFqO7JVtUp9mh4EyW/HYrXkIKSpl0j/x1eRKQjXhuL386DzM1xL2mf1
         fDSntab79aXmZb9dbIPfL5QrYAjZLDeA+rFdbIib0QkAWlrKXRhi9xJD4wsE+e3o6VVR
         RuQkZsVuKRkjvXhNrKB99Cp+7uhLDfJHao0ejk36fcdfeeLXEMlZc0nDyIZ/Rt732I/k
         9QpCnw0fmtgQ4bHhKqXvPKnP4KfX7zSqS0ZmOKwD2NlQDYvoJor7yeLpErSSuPuHE0MQ
         GHEiwhre9Po0TLajCtOwoCsoCxz615B3oFJ4Br/eHd4N03IHbTqHse1/8vROP+pma1SN
         DzJg==
X-Gm-Message-State: AO0yUKWLSwpNzqKTeB+vQACOORP9+u1HsfA8KcxMN8jT0f5newv8aTXN
	9O8sxDUxsDUNxO2fV5PGwrbn+w==
X-Google-Smtp-Source: 
 AK7set/MyhWYDmBCQIobeqNcHgJIA0aF22fzJ/STfU/NfAy05+kaDxntzWIP9Kfc8s8dkxaOHTLHPg==
X-Received: by 2002:a05:600c:3198:b0:3e0:15c:3573 with SMTP id
 s24-20020a05600c319800b003e0015c3573mr9426269wmp.35.1675948430859;
        Thu, 09 Feb 2023 05:13:50 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003dc4b4dea31sm1789394wmb.27.2023.02.09.05.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:13:50 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 3/5] soundwire: qcom: wait for fifo to be empty before suspend
Date: Thu,  9 Feb 2023 13:13:34 +0000
Message-Id: <20230209131336.18252-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IAAOZMVJF3PS4IUS52WM3GV5XQLV75BB
X-Message-ID-Hash: IAAOZMVJF3PS4IUS52WM3GV5XQLV75BB
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, steev@kali.org,
 johan+linaro@kernel.org, quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAAOZMVJF3PS4IUS52WM3GV5XQLV75BB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Wait for Fifo to be empty before going to suspend or before bank
switch happens. Just to make sure that all the reads/writes are done.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b2363839624c..465b2a2ef0d5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -325,6 +325,32 @@ static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *swrm)
 	return 0;
 }
 
+static bool swrm_wait_for_wr_fifo_done(struct qcom_swrm_ctrl *swrm)
+{
+	u32 fifo_outstanding_cmds, value;
+	int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
+
+	/* Check for fifo overflow during write */
+	swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+	fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
+
+	if (fifo_outstanding_cmds) {
+		while (fifo_retry_count) {
+			usleep_range(500, 510);
+			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
+			fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
+			fifo_retry_count--;
+			if (fifo_outstanding_cmds == 0)
+				return true;
+		}
+	} else {
+		return true;
+	}
+
+
+	return false;
+}
+
 static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
 				     u8 dev_addr, u16 reg_addr)
 {
@@ -356,6 +382,7 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
 		usleep_range(150, 155);
 
 	if (cmd_id == SWR_BROADCAST_CMD_ID) {
+		swrm_wait_for_wr_fifo_done(swrm);
 		/*
 		 * sleep for 10ms for MSM soundwire variant to allow broadcast
 		 * command to complete.
@@ -1122,6 +1149,7 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
 
+	swrm_wait_for_wr_fifo_done(ctrl);
 	sdw_release_stream(ctrl->sruntime[dai->id]);
 	ctrl->sruntime[dai->id] = NULL;
 	pm_runtime_mark_last_busy(ctrl->dev);
@@ -1558,6 +1586,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
 
+	swrm_wait_for_wr_fifo_done(ctrl);
 	if (!ctrl->clock_stop_not_supported) {
 		/* Mask bus clash interrupt */
 		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
-- 
2.21.0

