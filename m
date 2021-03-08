Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0433100D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 14:53:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9849E18BB;
	Mon,  8 Mar 2021 14:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9849E18BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615211614;
	bh=kZCUJ/1FcwfhNgfqoA1jG3zHPjjj+UXOBhk0Hj/IYs0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kRZCcbO6F4vJmtmQbZxIDl+HbfuXfoRlPXuHOCW1Qdp6LfqsspPi+hyDrObLfVViC
	 A0d/yxNxFiMGbp0wySUPuPYRDHBLX376S7ujS4vRYv7cf+eXiLalWb7PkRnr64wDeF
	 9gAPZOGxoJegwaYTqY/vfdf6k+ZGdEXm6wXC/tVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C80F804AF;
	Mon,  8 Mar 2021 14:50:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3BC1F802E7; Mon,  8 Mar 2021 14:50:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35023F800ED
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 14:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35023F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kE+OM2aB"
Received: by mail-wm1-x32e.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso3844761wmq.1
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 05:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9XrbiDhvP0gxPijEAUSSoalvOl5K//POj60zxztmUAs=;
 b=kE+OM2aBjpltfWtltwjlP+6iR+/LPf5s0WhqnXFlZ35c1q7cwW0SWIAtN3aknukLu+
 EB4XCMYwcQWbNAN6VlWw1iMG3GNAw+RFh7xzYJlg2tlwuNNh6nMmp5xMDhCZ8qndZCt+
 fN911dWcm/3aiLpFAM/9zXIp4ltH4u+NKxc1KC0LgydXEbzJq+dnn/UrGzdH+uEl6NfV
 Ox+PqDSnXL0omJDXNjRhxJFBAVwPF3J+s8gnclto/AXKyBAIB+OGBT4AhzbyiYZFD0kq
 nBcvPkobdN74K2CDdMTcfuCBte/dJ1zrVi7p0VX7IyWJK8izHN4o3stR1GdUslnnI5Tr
 UN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9XrbiDhvP0gxPijEAUSSoalvOl5K//POj60zxztmUAs=;
 b=Zqe3FaMXxLQN5YgBWjDS25rSaY+MjZue8U3MK6DdfLau8Wlim8yQ4XOFQDqRmuzfMN
 snfAWkTtFpfXsglsCuObokxCsXWgwdWuYFYbdSX5XAefRdD3G+YrbfNJ68fvhYq4ChvF
 RPEvBaDEzQ8AJycmfoRyOVxXuu27294ePCwoPl4yuKDWxNcjd0OzgH6uwEBGvExurrsn
 8XSQSWekn1JGqqOGpwPBO0sC89B/9TkJom58XwqZ2hHcTzlOax/c5oFJ3GWNO8K0EzDQ
 JjyPKJHgwXfbWDkc+Em+hkg9KKCSUvyBx3hKlitXDbTC+pyerpb+ONBA9AFu1Ia3QWf+
 gMbQ==
X-Gm-Message-State: AOAM5329tmvkYklmEUHrBjdDHhWYoOXa8J3by0wRNWLq+mfqvl70zL1C
 J1SlZh+hy8Vl96rRZOLMV4N2yQ==
X-Google-Smtp-Source: ABdhPJxR3Rp7cA8Clm97GPcGoTTceotc9jg1rSAdJAiMJxxE/KWYenduMGDrgX2kqrvx7yTS8EiyPA==
X-Received: by 2002:a05:600c:284:: with SMTP id
 4mr22672574wmk.24.1615211410097; 
 Mon, 08 Mar 2021 05:50:10 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h22sm19490589wmb.36.2021.03.08.05.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:50:09 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v3 4/9] soundwire: qcom: start the clock during initialization
Date: Mon,  8 Mar 2021 13:49:52 +0000
Message-Id: <20210308134957.16024-5-srinivas.kandagatla@linaro.org>
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

Start the clock during initialization, doing this explicitly
will add more clarity when we are adding clock stop feature.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 076a2b1b6d6d..071d05d3a971 100644
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

