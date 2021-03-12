Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E23B338C48
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:03:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2AAE1716;
	Fri, 12 Mar 2021 13:02:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2AAE1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615550580;
	bh=fn+H7ng7bRwbAq/RKb2YzsdZTndwHijka7e2mNopg7w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OuZq9LjEtL8to3787lbc6LmQ1OR5C8rA2+wDbnpM6+8VNCzPfFBvObkJ59YCtYA7W
	 rFD/+kRa++syBWsuqriCQZGq88SWy5HNxNWEvIwWwU77+ZESYouf+oilD7k7br9cWY
	 KCw0s1rQ/8fpgI+RpbOR9nkwErYTUNLewBB6QzFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3846EF804AC;
	Fri, 12 Mar 2021 13:00:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FC31F8032C; Fri, 12 Mar 2021 13:00:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33830F8020D
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33830F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VPcCNNRM"
Received: by mail-wr1-x42c.google.com with SMTP id a18so4632066wrc.13
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89jJJI1ffi4hnNcNYiPeSLf8W7Z3c/bGcDU6aGLT2Ls=;
 b=VPcCNNRMNGUANJrpDhkonXZbUKAPee9KliJEUDnszC8VzRBxCddmKbpb8Bz/nUivaL
 Jq2WWzxFvckdpdX9YAo265si9aLz+xeUeawU2QRX7zIUfg9Gl5CVu4/pH5V4NChoTmgk
 /5EvxAsWGGFjC0BdoItn+GTQQ93krkt+mhi3j5llmUaCZmf0fJjOOWp6HZEgR0M42PzU
 hyH5IZi4vtwhrwuY4DNgKq8o/jC2NDYcee9pN3vU7qb09eX0ezhO9t/jWukXnve85Dcl
 VI/5UTQgK43IGKXwycgkjxnaIzAGpPFE/4Itx6QfSUh8lEZlg1aWv3dlqVSo/KL8DnTb
 1vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89jJJI1ffi4hnNcNYiPeSLf8W7Z3c/bGcDU6aGLT2Ls=;
 b=U3LSPXEvwdNrgHkN6MdB2TA3iUxzFJmADSLAp9h9Y6iWiVi4GgTEtFO+lc12tTLuGJ
 KJ3aZgWgPLiLGcR+tIVUrekDWufmkVQj6d0vePffPQvSR4pfjGjwMMgN1SiacdVCR8+a
 TcYoLED7XGhxBKwCa799AsecdwJef9nMPChSsZkkD19NZPzPGIiA4Id6MjOx2EdDP+G0
 uIfusp2i1dWNS+xONKeHAddjnSbD1eHZATAnXlHCFmdU+VC1RUDEu53rG6RghQ5XhkcD
 3ZXrTnhs/Hx6Z/2Cpy8zpV8Wo3/Z+YC9XiUjjbHxGCM8d1cyIAKnr3RnhYkAfL/567Lm
 Q59A==
X-Gm-Message-State: AOAM530S+DEainO83T6BzSe963iy0vGzERgaPel9rH53ilL3Hu+hikZj
 REu+Ej4l38+/6vD4rZBBad7f1Q==
X-Google-Smtp-Source: ABdhPJyy1DPIAzPOnCw23PeFUJnz7S0usQRvvQEg9YuafrYokKj/IgMyjiPMWnhUBOtWtr/56mjg9w==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr14297099wrt.28.1615550426535; 
 Fri, 12 Mar 2021 04:00:26 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h25sm2268315wml.32.2021.03.12.04.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:00:26 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v4 3/9] soundwire: qcom: set continue execution flag for
 ignored commands
Date: Fri, 12 Mar 2021 12:00:03 +0000
Message-Id: <20210312120009.22386-4-srinivas.kandagatla@linaro.org>
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

version 1.5.1 and higher IPs of this controller required to set
continue execution on ignored command flag. This patch sets this flag.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d05e41f68658..43ec22a5e332 100644
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

