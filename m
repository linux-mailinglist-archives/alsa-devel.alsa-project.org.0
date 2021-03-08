Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51BE33100A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 14:52:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4454618CD;
	Mon,  8 Mar 2021 14:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4454618CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615211566;
	bh=dgMNG27AgYfQyvjVcIqIlwROBPij1X62wPuwLzhZ+qA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a9VFEG4le3p1s9AMJtOmIKg8BCDV9BPgbdGRqb562X30BVYEI8T9CZpSQ6xy47pAo
	 2oFDs6/EGoPAduGSXpFEL1pPh0jlVKhNl6wp5WPXh0dmYMXfqArGDTbHXlpEhRwRKq
	 eDDEHTwXbqnDN3ZrEQd7x/FfrxkLEnuB6QGLvX60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52AFAF802E7;
	Mon,  8 Mar 2021 14:50:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD583F80425; Mon,  8 Mar 2021 14:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66616F8016C
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 14:50:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66616F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="R6N/KE4s"
Received: by mail-wr1-x42c.google.com with SMTP id 7so11562420wrz.0
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 05:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z5gULezL58sP0wsRShFvX5Wql1j67V0uYQzISlfsBbw=;
 b=R6N/KE4sh9d+LpUIxGfmSJSCiVnd+ls3H11acC3Uqdv1Yt/y1r9P/fKqdUiCYDeIFv
 KpaXSnrThQbxtiBuObpV8cljnguNK04m1hGgTNnhiONZ7pBuaGvSUkLdZwnTWCebSn9F
 cnmaFsvOxzj9Er2Gt35/kQ23rceD4yxwe1wPOw3XCMWJ6RC7VIOYM8Y0vkrF55U9sowo
 07bTFBpB0bDjabPPFyi78YVn0xAvdx2YuKo2aR6ne7SOl/niSWqumM/wTmdOtcbGQVbh
 gXmo7Ur5u8TXrk2x9DfQvRfUSZvPQfIszB3iW2NtAI1BaNZGJzivw5b7Ve4vTuBQZj4b
 1dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z5gULezL58sP0wsRShFvX5Wql1j67V0uYQzISlfsBbw=;
 b=baTaSa1AgWgA3eZPCGVz5cBV0jfc9xC1Xw6kUtSZWdU9V7wuzrzpohQmDiJAZLVJZK
 EHu+7iBj5FZpa8b0/JgrrfzCC6M6UkX9C7j8fi9ecuElGyspCFI3b/Tf3A2+4YABbCbi
 tpDE3VAJZsytUIMTYH0nZ+EMHXscR4vpLQIVlrqLjd4CQzBxMbcTna5P/2VZyUB+iX1G
 4Sze0vA+X4TMsuy4bGSpbPTqrqsm7MoLM0VCrFnVaU0WB12pXAt0qehFyFoiFiDuSowj
 VS20I0OLXbiUA66w3QgUgDxX/3D050NDGJBrdV7+LRCvezVtqMraXa/VKwfVKe9qdS6u
 TuvA==
X-Gm-Message-State: AOAM532YSUh3oibql+6G2vO9HrTM4b4GkAB0JsOot53QR0JevmkgS13W
 YBdt80sf1/81iw7Ot+5CaMX+kg==
X-Google-Smtp-Source: ABdhPJxCYCFRCOeIXxgmkBLAGHMI9EYpuvPj8tRs65vq3csayzLrTcykzQ1nC022pXly02zoG+Iadw==
X-Received: by 2002:adf:9261:: with SMTP id 88mr22485091wrj.270.1615211409057; 
 Mon, 08 Mar 2021 05:50:09 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h22sm19490589wmb.36.2021.03.08.05.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:50:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v3 3/9] soundwire: qcom: set continue execution flag for
 ignored commands
Date: Mon,  8 Mar 2021 13:49:51 +0000
Message-Id: <20210308134957.16024-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210308134957.16024-1-srinivas.kandagatla@linaro.org>
References: <20210308134957.16024-1-srinivas.kandagatla@linaro.org>
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
index 6c7b811eea94..076a2b1b6d6d 100644
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

