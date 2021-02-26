Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBAF326520
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 17:00:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 215101689;
	Fri, 26 Feb 2021 17:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 215101689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614355256;
	bh=+okWFxZT2hrjJMBxBcWj8EeiMIB4YK7HfMJYlA0YAmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l44bmaVhwe2XLhQCGXptv4AWpgz62sCZuibQ4l9Od+KlpkZ5PgRkWpnY49RD/nvWO
	 VNxp89x7kgCZnDzICgRbHMBXvEox5OD+LTD370yJ1uRUyBnCpivgKcVhapguvRwFa+
	 1rgC5/8q7uNF4MsJhQTg6Uo/yX8dCimx0BrQNjpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB05FF802CA;
	Fri, 26 Feb 2021 16:58:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BBB8F80161; Fri, 26 Feb 2021 16:58:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF53DF80161
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF53DF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lJa+LWz+"
Received: by mail-wr1-x431.google.com with SMTP id b18so2569829wrn.6
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 07:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6iwwfKMWIFDQ+43ejDw0yyTPC7nDGOHpb1YvTLMM+pY=;
 b=lJa+LWz+nhevlCFIXZG2vl/SixnJIpkAtAaYFZiqA/BrQJV4yl/KGuTozzfwVGPZDd
 lEFLfkTP9mxY3gjwPao8hLdZmfRj8rbN5YYan0FErtusm5MgmD7MxCA2Pt1UfJ7Hd8yW
 x24LNGWTMgc4Qanh4PX/ePSkwXi4QKA5tOKwIZunJGDZyIzDfecvCbGS06hk3sT/IL/E
 FaqxXjwCWXq0qcBxaXusIjbgzIK35xeknJjZ/znTIIPoY6tzVMHAhhRbGjl8h4SNwfxJ
 cu7n2C+l2EJQTCOkMnVQ76qaN2b3jpKA/yGf6rDYKke4cVkfH3TnadhIjQkrC4KHPoES
 kD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6iwwfKMWIFDQ+43ejDw0yyTPC7nDGOHpb1YvTLMM+pY=;
 b=QU+9Wy7rgXEH5UH1Fx07BIMyQ/Ba/Q10vjosWmpQ23jmdV/Q7cogXyI/M3T4oEmneF
 kPymsE1jjv/+5dl2qeRAgWbSyflTOj8YmeFM3YoFppszcWAiRwp3IwXh5+6dS5IoxGQ0
 ZqHj7bJf8oxe8e5ybjrpzBZNiegFIrZDeFuPysYATVInyY7eeMh6nwG9g9exmpxMn27r
 JDxMhPieyat0/u3OlpQfDwkD8yhjry4PwaFxgAh9S79KuV0Xa1ZFQ39efnsk6b/FtUXl
 8cjrmVq/yA7SXXNujKcZWE7yofAkQ6XmSE9eALxyk/JVp/sh5/7fc87wuh31pHx+sK+x
 IY/A==
X-Gm-Message-State: AOAM53131PDRNR1CUs/M9fCnTOyDkihv1KPmRQJiRM7A72YEOHnPc6J1
 DZqFJ1gX1KaC7Ma81Yh3TH9DvQ==
X-Google-Smtp-Source: ABdhPJx5LO07gjkW8d+WPCDupqSj2jdBvY3WVv67VqqAVj3NztPy5CMrcO8ETo7QUkAmsZHtoUH6Yg==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr3922281wrd.126.1614355108943; 
 Fri, 26 Feb 2021 07:58:28 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v6sm14398945wrx.32.2021.02.26.07.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 07:58:28 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v2 2/5] soundwire: qcom: set continue execution flag for
 ignored commands
Date: Fri, 26 Feb 2021 15:58:11 +0000
Message-Id: <20210226155814.27536-3-srinivas.kandagatla@linaro.org>
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

version 1.5.1 and higher IPs of this controller required to set
continue execution on ignored command flag. This patch sets this flag.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index fee7465c72c2..14d91b17a2ca 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -40,6 +40,7 @@
 #define SWRM_CMD_FIFO_CMD					0x308
 #define SWRM_CMD_FIFO_STATUS					0x30C
 #define SWRM_CMD_FIFO_CFG_ADDR					0x314
+#define SWRM_CONTINUE_EXEC_ON_CMD_IGNORE			BIT(31)
 #define SWRM_RD_WR_CMD_RETRIES					0x7
 #define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
 #define SWRM_ENUMERATOR_CFG_ADDR				0x500
@@ -343,7 +344,15 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
 	/* Configure number of retries of a read/write cmd */
-	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR, SWRM_RD_WR_CMD_RETRIES);
+	if (ctrl->version > 0x01050001) {
+		/* Only for versions >= 1.5.1 */
+		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
+				SWRM_RD_WR_CMD_RETRIES |
+				SWRM_CONTINUE_EXEC_ON_CMD_IGNORE);
+	} else {
+		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
+				SWRM_RD_WR_CMD_RETRIES);
+	}
 
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
-- 
2.21.0

