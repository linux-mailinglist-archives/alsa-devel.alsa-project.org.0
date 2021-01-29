Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D92308B9D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 18:36:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E869B16AC;
	Fri, 29 Jan 2021 18:35:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E869B16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611941786;
	bh=PDYRx95UqvLzZOcS0awa/dwoU9J9YogIGHwJEYVkVEE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i1ASQliPnZt/meImIC5UU9rt1bGsOkHGWY+03LMFZY56b/c0k68tylxpWWxbN/pfI
	 1ukX+KxXvtvTfCKmUBDQeBy/ZdTyZiky+qdky13xwCkqqhP5kswheDFN7QuSffUIlG
	 ahTHvPlarb/D8+4MXw/Lfecqc72i5q7J1EyPbxOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CADCF804E6;
	Fri, 29 Jan 2021 18:33:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7948BF804D8; Fri, 29 Jan 2021 18:33:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C982F804B4
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 18:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C982F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lFNFqvVW"
Received: by mail-wm1-x333.google.com with SMTP id u14so7801070wmq.4
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n8hpcip3PXhBpcFLltkTNxBYpR7n84DXjgnndbZ1mXc=;
 b=lFNFqvVWqV9aow8jD/7DF+uocMYN37pBLHG1Kkn/idkWqoEmdIglXcvAnWUrx/9eCI
 doV2gUyptrAzeMoiD4bHFkJKdncjFZvl8eMTsXtL/jtBGorCWoaFWcVw0gV55YNWjubN
 nHGWpxaRE42YuxcZIHKdIO0atC0o1ZAhTjPYzZAZCvdrF5i7YqE37FR3NVc+Saw18vMl
 0Q6TfuJhdpPOR/3FvufFBsaRqtEk+0IqyQPwYshaQRSvgo/9AnN9Q6xYQZ9bHONcMSof
 HuRDWmBdMQb2c7wVfuy46RdVWsWS8gHh4hKOVm3/bZPewtVyjNVYnvmzoWNJ3dCJPAjj
 2bDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n8hpcip3PXhBpcFLltkTNxBYpR7n84DXjgnndbZ1mXc=;
 b=IXr727+71UuuKu/e1WxESggrAAgRZesYdl8B/N7iKAWbihyxtf5goDAzEJ+0XJkeOP
 YAXefg9VdbuNYcUdQJEpPVmpK0DpCeL4+Vc8QRZHeVquJ1Z+dAJJ7n1++j5QYgvTdxw/
 rA0aCVbhLtmi07w4cjO+tLVFmcUNmUTLrDO9KfkmsUHfNsUe8Huz65jyxJcKlqjVHDvM
 givbVkRkUraOJBsT+is6pUbszruW1cQfoLwVqI1QopzOiiwgFFInFhojGt3w9fjVld0O
 gnjrjbNdNgcU6LFVyt9EiOqH6M+Ibk+yxh1u2twnljZDAVip9p5OD/pKGo2I7k23uBN8
 3Tjg==
X-Gm-Message-State: AOAM531idzpYGbOZvES9WXDHGUSS3ibmljDtYfNu044e/1IxeU0t73XA
 haxR+139fJKbenLY4OBK+Ebmow==
X-Google-Smtp-Source: ABdhPJw2YrZLOMzpNnJ98kK1QF7imjjFe8Fx1+ZCLaqGx4WV3G/hF6n8QrMJY5OqV1ks+mp3SvU34g==
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr4910575wmj.165.1611941578227; 
 Fri, 29 Jan 2021 09:32:58 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h18sm13202294wru.65.2021.01.29.09.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 09:32:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 3/6] soundwire: qcom: set continue execution flag for ignored
 commands
Date: Fri, 29 Jan 2021 17:32:45 +0000
Message-Id: <20210129173248.5941-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
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
continue execution on ingored command flag. This patch sets this flag.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index da6e0d4e9622..3669bac11a32 100644
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
@@ -345,7 +346,16 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
 	/* Configure number of retries of a read/write cmd */
-	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR, SWRM_RD_WR_CMD_RETRIES);
+	if (ctrl->version_major == 1 && ctrl->version_minor >= 5 &&
+	    ctrl->version_step >= 1) {
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

