Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC34308B99
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 18:35:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8939C16BE;
	Fri, 29 Jan 2021 18:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8939C16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611941737;
	bh=PRefpSmAlpcBt5ftJRxb5bWhCBtteY0tJ3WuiG0h7oA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OH7L+T1l//njeyaEq9JTjlt0RJJutv218GDXs3DQlamINO0FS2NzxEZv934vpD8So
	 ckVy7b7g4h/THII5Zu4AEJ88cN5bXKRMOQKxsgmHOdBKaeTesrTSagURXzoRH2kpK8
	 AcV7CVvgfVe/ZGcB83r1rAccffa2odONM3Lw6fL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC318F804D8;
	Fri, 29 Jan 2021 18:33:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF07F804E0; Fri, 29 Jan 2021 18:33:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E65BF804C2
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 18:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E65BF804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jx7M+m1l"
Received: by mail-wm1-x330.google.com with SMTP id e15so7807233wme.0
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 09:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BgPuxMdkqPp4a6ple2m+0TbGMrlk3+s8+dfsxGz4L0w=;
 b=jx7M+m1ltlMzec+hs2KHhHvTFaBXscYkE36JNskfG61wPv1lOQX0JhP7S7WhUuSF3D
 axeHBLZE3RlL4s42xc3NDyGD7iD5MoXTqxv7Us1CilQ3U7G6ToBeBEIqtnjX1O89mCcf
 LhdL4yfPeTkkWS1VxXA9jYDGDI48LOUR1ZpyS1PsaY2Qb5Kr4dDKSHgFF3kCgHyee86h
 zyPuYwCr6LVl/Lx/z+UmyZ3qXFVCErdsb4YVgDOo+CnGiof4M7uTIicbxmtXcdB0i5ZO
 Hg8bsfk/ylG225Nyug5o3br9+Je+2qWX5pOStJSq1DOpmWVd0sp/3zKDl9zHjCuS2YGi
 31uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BgPuxMdkqPp4a6ple2m+0TbGMrlk3+s8+dfsxGz4L0w=;
 b=DAnCCYldnmnXX5xwRxN1xGBrdfKw8EOIW4DyZkv2tTzMEnsOekuBp3MAgvJ1+q3+Pl
 tUX1JL4EdsKSMK5HQKvmt/4F2ybFkN1Ba3EJIIbqd8CWLV+1DgX2mToE0pvVsCtX9NLK
 br8X2mhRQ8FELiT+2lmLPxX13v0EIlF67wC9OavnWOian6n0PvM2waM4sXq2oesO0rPT
 DZ2+lObYyjiuUOt/Cn0Mt1lDn3j5L1ZOtYBpiAUQfH9zcittKTaYjZQ7xqqkza9uKCmk
 YpEnBrWnT2rgO9TZ3RhoJkgE2QEyBhx0kkYtd7mMemdfqdGCWzZ3QbxD6NO+aBHanCxU
 fx6g==
X-Gm-Message-State: AOAM530cWIa2RK8sga+4p6NwVaDkQVJdZnSm8gCnQJL1/vDFF7BEgAnB
 c+aznrbX4GE17Fnh2iY4lfDTCg==
X-Google-Smtp-Source: ABdhPJwunDHVtKKIWJW1662rovRtgJRIw4LYLRE2viDY9P/TVEqf079r/od4QGY0Pko8UCxm9HZ2Vw==
X-Received: by 2002:a05:600c:2249:: with SMTP id
 a9mr4909751wmm.169.1611941576507; 
 Fri, 29 Jan 2021 09:32:56 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h18sm13202294wru.65.2021.01.29.09.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 09:32:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 2/6] soundwire: qcom: extract version field
Date: Fri, 29 Jan 2021 17:32:44 +0000
Message-Id: <20210129173248.5941-3-srinivas.kandagatla@linaro.org>
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

Extract version field to major, minor and step, so that we can add
dynamic version checks to read/writes.

This will help for controller versions that need specific bits
to be programmed.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 36e273795cbe..da6e0d4e9622 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -110,7 +110,9 @@ struct qcom_swrm_ctrl {
 	u8 wr_cmd_id;
 	u8 rd_cmd_id;
 	int irq;
-	unsigned int version;
+	u8 version_major;
+	u8 version_minor;
+	u8 version_step;
 	int num_din_ports;
 	int num_dout_ports;
 	int cols_index;
@@ -961,7 +963,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	prop->default_col = data->default_cols;
 	prop->default_row = data->default_rows;
 
-	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
+	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &val);
 
 	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
 					qcom_swrm_irq_handler,
@@ -985,9 +987,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_master_add;
 
+	ctrl->version_major = (val >> 24) & 0xff;
+	ctrl->version_minor = (val >> 16) & 0xff;
+	ctrl->version_step = val & 0xffff;
 	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
-		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
-		 ctrl->version & 0xffff);
+		 ctrl->version_major, ctrl->version_minor, ctrl->version_step);
 
 	return 0;
 
-- 
2.21.0

