Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D93F338C3D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:02:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD28A1711;
	Fri, 12 Mar 2021 13:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD28A1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615550540;
	bh=fruToNEJ1zkqqjA3jdR/Xxopb2tTaEdUYYkh4RKfGOc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W7vj7HoQe0CSPPvcUI0wI0EgU7Z1pS3red5basmLDBcV+dL15Lo2P9/U6iUkAZS7V
	 24kKb47MsiypCcGYy51F7GUukYBZHYxhqQpuX0XmFINNlo3E/9eVbSyvPASkqqnb9c
	 ROS41uXzwDqQoSePmpAiZpUe1kyu+TVFUC1NYJtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A798FF80430;
	Fri, 12 Mar 2021 13:00:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 983BEF8032C; Fri, 12 Mar 2021 13:00:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D3CFF8016C
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D3CFF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Nt9ZBV3n"
Received: by mail-wm1-x329.google.com with SMTP id l19so3649505wmh.1
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q5UMSCe0vmgofjLfGXC2dqndVDx3SCra42urjGkx2FI=;
 b=Nt9ZBV3nfcXevgLOhmcv3mpcPVnLP6rZ1H0C09HFJfJtby13DIfhYUYaGYGm4s6rW7
 D+ky2wsBj3cfmw8DTRi52RAOwccl6WfgDFxOjCKSghzT7xvvkYDcyCWiuuNiyvxRpj7y
 5eeMUVEkF8AU7Xe/TrlSPw1GMFtMFvc2nWTj2MWQhGsoKx/7+CwZlG6fMQf00mzFKqrr
 AkrSpa1he6GRmqssvShKBz1p4KF3Mh8TuJWdciUYh+fhu4K4QN8+HVN9O9duSje8MSLy
 oNt2CXgBch/3YXCXrvMTmKGPYvsjQFa6lTQOorWRAsDCPgPR5x8K2zhn0YiP7uQvZwdE
 Ns7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q5UMSCe0vmgofjLfGXC2dqndVDx3SCra42urjGkx2FI=;
 b=VkV6J5S9Aqj2q/4Uzc9dARofJX0UzCW8sKcwog/gf0VMhl9HMlFmesHppy5SqLsIFB
 ykRbSCK5LCjBw68HnWEgCT0qgeIU1kytCEbS3pDXKMeZPSpw2hRcnm+KYU9sM1sBAb3U
 RznN0BsPFxjE4IZ8En7wTXO3L/xpdUF75sn4/PPCHF+E1k2bHPQKthVj1MvcxXKLGG/K
 /cAq5tIYthdlgtXRhnaXA/pliAF6M4APvO6rYEl7v7oncZ9ajGXGiFIR60d2xTAugIge
 7g5NVHjS0d7IPSDoPQFqBSMPBnZhyii3AwQGdFlM+2Z36ObpnG6HNfscPK0g95Pc09TA
 +WIQ==
X-Gm-Message-State: AOAM532M9/6lprwtwSFCZ+0NcV4laTyRYW0abeA7QCcEII4J6fzI2Nho
 Zk9rt1te74TE4wPrj0YYAJTydg==
X-Google-Smtp-Source: ABdhPJwhd4bkdARLj0koN7Eu8meG+HnheqN2+Je2CxV9trNDKRbhtPFwWAZZwprkTasNyVFFUJpXhQ==
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr12918925wmf.17.1615550427439; 
 Fri, 12 Mar 2021 04:00:27 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h25sm2268315wml.32.2021.03.12.04.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:00:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v4 4/9] soundwire: qcom: start the clock during initialization
Date: Fri, 12 Mar 2021 12:00:04 +0000
Message-Id: <20210312120009.22386-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
References: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

Start the clock during initialization, doing this explicitly
will add more clarity when we are adding clock stop feature.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 43ec22a5e332..2bcb4362f0e0 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -47,6 +47,8 @@
 #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
 #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
+#define SWRM_MCP_BUS_CTRL					0x1044
+#define SWRM_MCP_BUS_CLK_START					BIT(1)
 #define SWRM_MCP_CFG_ADDR					0x1048
 #define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
 #define SWRM_DEF_CMD_NO_PINGS					0x1f
@@ -343,6 +345,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
+	ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
 	/* Configure number of retries of a read/write cmd */
 	if (ctrl->version > 0x01050001) {
 		/* Only for versions >= 1.5.1 */
-- 
2.21.0

