Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC0710D6A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 15:40:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D28B6200;
	Thu, 25 May 2023 15:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D28B6200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685022018;
	bh=a5qsMrLqbibtEwSf7GDKiy/BSeLwXY3k/n6FTIgjUsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dgBqRba3VmKwGiNKV3d2TsxENcr9ysxDWHLtLOCQNXokLtaOsMQmDzwbElwpelquF
	 xzneZZS97guIevb9LyuFn8qYYhLo/UFS1+eZREnU9MMHKn0f76xOUBcPsqo81WOgCZ
	 LrSqqr3V/DFJmYUGWHW9ZBJyYT7s3F6Io+0l/HiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33A58F80548; Thu, 25 May 2023 15:39:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BAA0F8026A;
	Thu, 25 May 2023 15:39:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3450F8053D; Thu, 25 May 2023 15:39:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D24C3F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 15:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D24C3F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=X916qYIO
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6a6b9c079so4627885e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 25 May 2023 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685021929; x=1687613929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyuLCEhn8GX5O7IyV3OsDqUmT5UuCj/vH6uAj7jFQ0U=;
        b=X916qYIOlP2m32ZpnG9P9ll3mYMCDzS1HhJHfPkU9SptQ4EpmpeTWxXEcu+VwpK4BH
         xmw5QJwQWqHyAfxhuO3CQ/nTD85vSeKKEC7fgPHvpuLh4DlrHIS7akh/A9XFK8cM1CJY
         g/JzfCtgU4HjHgPvbJbEUYinHXKsn7j+Z7rWF2N8NBCS1rq7RoiCHRBPwvd2gdvsTrn+
         Jfc5mi30sITqFdL79WFHe/SUO+2C+zHQyYxiuUhJl9tQbelV9htUipV/IMB35fCTaa+w
         DQ30OxUemA2kjVyQhUwP6sW6G5L7RcNgS5XfGN6xUhaKdnhzaWsnyh2PPpJ4oq7nujoS
         KLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685021929; x=1687613929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyuLCEhn8GX5O7IyV3OsDqUmT5UuCj/vH6uAj7jFQ0U=;
        b=METN+JMoJahhfEu/4KlnNj1HxCdYmtMHCob8H+NPP+CuCzqTAmgEOLMrd05g/6R/rJ
         Az4Zp6zbRWPze76Vg19tcudGtw5DXnUw98pk5aM6vrYtjbclzYwPLoKVGr8jFrk4ZD6T
         UpHsItlWk5gUrY2jBlQKE+IxY3B7OsTRvXgxGxcv3jjgWjiLesmfCOb8l0qSJ9PhJjqK
         ovMfcyNz/YC2YUv1l4UElm/nS3nMVi9v3Ty5TvEbRvNcy+tPUiZQNncemmRaSS/vEFcD
         IHSTItRqck7ni0ElW14fRlHgVFCNLYshCN9Bwbm5F87NDvL+cOtuhBv6ECrcxESt8Ztt
         Y7UA==
X-Gm-Message-State: AC+VfDymNDIiShu8VSlqg23PnrCA8f7XU1ELMuZM8difIZi60Sab6D/g
	P/pG6IIoklq8I7km5Em/1A6U7Q==
X-Google-Smtp-Source: 
 ACHHUZ4bTttKZxh7vwGsOqquSDQW3VpZNQJ26RqX4KKyHaCGAIXJhw0NoJTiFO4JjCyEAnFfONBeSg==
X-Received: by 2002:adf:f251:0:b0:306:31e0:958 with SMTP id
 b17-20020adff251000000b0030631e00958mr2346226wrp.15.1685021928828;
        Thu, 25 May 2023 06:38:48 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a5d6551000000b00301a351a8d6sm1803641wrv.84.2023.05.25.06.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:38:48 -0700 (PDT)
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
Subject: [PATCH v2 2/4] soundwire: qcom: wait for fifo to be empty before
 suspend
Date: Thu, 25 May 2023 14:38:10 +0100
Message-Id: <20230525133812.30841-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7WAVLBZRIY2TCSWMEPXT6VEUVLIQP5F4
X-Message-ID-Hash: 7WAVLBZRIY2TCSWMEPXT6VEUVLIQP5F4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WAVLBZRIY2TCSWMEPXT6VEUVLIQP5F4/>
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
index 9440787e924b..adf025194a31 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -404,6 +404,32 @@ static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *ctrl)
 	return 0;
 }
 
+static bool swrm_wait_for_wr_fifo_done(struct qcom_swrm_ctrl *ctrl)
+{
+	u32 fifo_outstanding_cmds, value;
+	int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
+
+	/* Check for fifo overflow during write */
+	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_STATUS], &value);
+	fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
+
+	if (fifo_outstanding_cmds) {
+		while (fifo_retry_count) {
+			usleep_range(500, 510);
+			ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_STATUS], &value);
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
 static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
 				     u8 dev_addr, u16 reg_addr)
 {
@@ -434,6 +460,7 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
 		usleep_range(150, 155);
 
 	if (cmd_id == SWR_BROADCAST_CMD_ID) {
+		swrm_wait_for_wr_fifo_done(ctrl);
 		/*
 		 * sleep for 10ms for MSM soundwire variant to allow broadcast
 		 * command to complete.
@@ -1230,6 +1257,7 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
 
+	swrm_wait_for_wr_fifo_done(ctrl);
 	sdw_release_stream(ctrl->sruntime[dai->id]);
 	ctrl->sruntime[dai->id] = NULL;
 	pm_runtime_mark_last_busy(ctrl->dev);
@@ -1688,6 +1716,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
 
+	swrm_wait_for_wr_fifo_done(ctrl);
 	if (!ctrl->clock_stop_not_supported) {
 		/* Mask bus clash interrupt */
 		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
-- 
2.21.0

