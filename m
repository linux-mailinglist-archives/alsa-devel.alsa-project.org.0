Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C180326528
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 17:01:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9AF3168D;
	Fri, 26 Feb 2021 17:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9AF3168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614355318;
	bh=q/6t6p1BVBGda8DFAhhWjaggkc22PIUzLSVEMKw+Tzs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IM2Z+IQVhOJ3EueeYYT5SLgNv5nA2mZ+EptokHiiEQcB56UOGFoSi9QWQB/iEYT/z
	 +bNo0QZYkoQsJ3Mv6q9KlBzQJohu/qQXOqLilYBV9DTd/JcaXgSiDfHMNVAlqzgWcK
	 fjcs5jZMqh0GyLbxo4kA6/wIRoedPJW5EcbCbcuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 640D5F80425;
	Fri, 26 Feb 2021 16:58:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50213F80475; Fri, 26 Feb 2021 16:58:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23514F8022B
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23514F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NCf/4swF"
Received: by mail-wm1-x335.google.com with SMTP id w7so7806856wmb.5
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eo0RtghhK3XQkEA5nZiew5OMUkgRgswthSggX+F4cGU=;
 b=NCf/4swFemd12ZlF7HRvH3sPymFF2kxN9HWlL9SuvJk7JFVhawqCOGHepDmwkWUeN9
 Djz3GdWCH4YakndTUEzsrIGyjlNXgUqCv0p5g3nh2hBeg2ogoW9lMOhoiXCgqvJqAnUm
 h5u8zTKnkyjjfze6ePdJNRyQ02WNftES5TYhLNMkOmlIsf2rQqivx+qIy7w7lp8Zyhea
 8Pe4HRXP4Qw0R0Pbtf+DqhHjKZTKvYUm8j0wDXhsrbWU2nH3Ee5KBvmHVzP6KsUhzWfp
 mdXvrm1zeiVIhEtis1gP8KzGjdHzF3LORM3bThYxmi3Wn8D1tuHWXmcCopML840z8cTc
 gTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eo0RtghhK3XQkEA5nZiew5OMUkgRgswthSggX+F4cGU=;
 b=aHWgSrp6383jv8l9YzJHstsTPpli+rShOd4Dgud8AL8z+D6iUEKnHb7UMAKqdO0a9I
 u2x4pXEf/G/u9rR7vKFKnw0QMYvWweQijWjtnJ1SrYBUvYANrdetDxOzKIRjI+H0i5z3
 Qg8hw+D6HrBayJ6AaiePKcFnpBCynSjd/xar8fudsw0LfuTLYtFT0HHYnxVCESVkm+YV
 3G6T+6n7iB7eRHuySdcKfi/iAZ8e5vvql4PSlS4HlFCi0rtVAQNyTIwkJiPoTShJKK+U
 MlY2hRE5XpQFSUBjOltDUpuNe6/kayiw1V6DX1svr/Ud4NyQ7G2CTJmWSSwX+ZM75trw
 1RdQ==
X-Gm-Message-State: AOAM530R2D9Mkl9N07KrtE7kdaV3QP9LVJ0Of66ZGgqKro/eVQ3Lv9il
 hsGJ2MRRVW3xgHIQutBRUArkkQ==
X-Google-Smtp-Source: ABdhPJzEGVHU7TYPzCT/YfZes9+225wLcSr26J2iVRNJKQxFt2hhO6L0tbdmWlNziK1zmOHoUlHwAw==
X-Received: by 2002:a7b:c4d7:: with SMTP id g23mr3543519wmk.106.1614355110455; 
 Fri, 26 Feb 2021 07:58:30 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v6sm14398945wrx.32.2021.02.26.07.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 07:58:29 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v2 3/5] soundwire: qcom: start the clock during initialization
Date: Fri, 26 Feb 2021 15:58:12 +0000
Message-Id: <20210226155814.27536-4-srinivas.kandagatla@linaro.org>
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

Start the clock during initialization, doing this explicitly
will add more clarity when we are adding clock stop feature.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 14d91b17a2ca..6a7c0acc8d89 100644
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

