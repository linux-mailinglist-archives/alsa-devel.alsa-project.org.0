Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD760DF3E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 13:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F0F93F28;
	Wed, 26 Oct 2022 13:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F0F93F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666782249;
	bh=tuyNvBFZTfmfn5cg38jViWxVDcPYk3Eu0dfILf76HfE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=olHD5qP70yBOYc2l2rpw3o8AXf9NBLpByF404MQeE9aL9KXdZlpwIUer/P/Nk1K+P
	 v7xniBAQ5EPysgFYq88cMuN+POagkfFLfhsrqf2yDoMNSErJFtqQPgWXAm4EY19mGj
	 zWrfJWtRjwSvbDbaAFdeWy2A0sgOHnkWZOSkqsy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAB35F80553;
	Wed, 26 Oct 2022 13:02:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 277EBF8054A; Wed, 26 Oct 2022 13:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94A61F80494
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 13:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A61F80494
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TAx4tjE+"
Received: by mail-wm1-x32d.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso1256466wmb.5
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4sQJzVrHni1WLAuaAcAXcY4IxBG/K5oBIjFNgyTIGU=;
 b=TAx4tjE+S9rXc/zlFGGPRl0uwIS/mtGtuJhj7IGSzfeIMVzaco9BF+sU98thou5Lgj
 C0JW8r0zxjpHDi8rzTS5doOZ8Gz3TnF3Ko47ZbObPbEtOiV/XczTTpCtT5Ba2yMs4k+B
 pVNYj0RW8tOCU53hk3rl0NmNgNTk52yI7qQ9ts6Ifjz2dS5epGUYe8Act0oylQB5oh8y
 wayfnhvtZhP+CWjdF+iHl2nGWhus+jPR+QftOAj4Kjkr93LT4qw8p5NssmqKSpWWYc9f
 2xK+G3bYSycJwqnyByA0N5cIel8sF93aBKc2HqMaOr+na6uDjdvC/uMMj9ms4PKkYBBI
 zDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4sQJzVrHni1WLAuaAcAXcY4IxBG/K5oBIjFNgyTIGU=;
 b=YUkFYRJ7kel03DpGvKVj21vcQ1/YvMdRwDweBgDQrEO6Nehj3rJSKHM4dnKB9CbJFc
 gCMB+oO+uX+VH9fW+JzQa+Ie5c50cEZ3LvvJynmtXB5eQHQ8PWnIIp2epwRPJLozJW4s
 YUH9jxpz3gNdTzPt0TYid+PHYnQR0fFVVAL3AOVn/4odm3jAS0+fNTieq1iCoCdbbuFn
 buY1NtOGp4jYS9163LzfbQlmzZ7eMRX8RXk/qC4zGoqYQG4zrFNDoW8V3ZaxwAzc+ySf
 KlUpMPHtxVeK3LIGyfPYpKVlSsrvrXdcZR9zkAhY6einDx0G8+DzXAVnZ2h3K89lTgG1
 IBtQ==
X-Gm-Message-State: ACrzQf0Loq2Apj/VBOY8X2YmDsJ+qQLWWvZbYedIWAhDFzR0PuEoeifc
 ffYA5xeKKCJWoffrkpeyVbbFVw==
X-Google-Smtp-Source: AMsMyM4t3DrevQscMkmgZc4rCImgXYHUyH8qdu8R1qhL4s0qQ6jxINMjpcMiDIDbfXGoqF8UFpXVBw==
X-Received: by 2002:a05:600c:244:b0:3c6:bc2f:421b with SMTP id
 4-20020a05600c024400b003c6bc2f421bmr2040804wmj.32.1666782144503; 
 Wed, 26 Oct 2022 04:02:24 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a5d44c7000000b0023672104c24sm5237415wrr.74.2022.10.26.04.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 04:02:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/6] soundwire: qcom: check for outanding writes before doing
 a read
Date: Wed, 26 Oct 2022 12:02:06 +0100
Message-Id: <20221026110210.6575-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com
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

Reading will increase the fifo count, so check for outstanding cmd wrt.
write fifo depth to avoid overflow as read will also increase
write fifo cnt.

Fixes: a661308c34de ("soundwire: qcom: wait for fifo space to be available before read/write")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 8f1a1eb017a2..cee2b2223141 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -380,6 +380,12 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
 
 	val = swrm_get_packed_reg_val(&swrm->rcmd_id, len, dev_addr, reg_addr);
 
+	/*
+	 * Check for outstanding cmd wrt. write fifo depth to avoid
+	 * overflow as read will also increase write fifo cnt.
+	 */
+	swrm_wait_for_wr_fifo_avail(swrm);
+
 	/* wait for FIFO RD to complete to avoid overflow */
 	usleep_range(100, 105);
 	swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
-- 
2.21.0

