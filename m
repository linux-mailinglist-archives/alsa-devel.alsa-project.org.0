Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B576460DF3C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 13:03:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1393F27;
	Wed, 26 Oct 2022 13:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1393F27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666782227;
	bh=MJ8wiOwZlQVZnWMJC2QH6sjBHyxrrpYC1HFZujfkgow=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPxVcesXZ7Szed4AhQGlrC+cZ+vJhSB0wRFAgaZKbJOn2tgsW5gDQy84Bt/S/6pmx
	 dRFp/t8a6WzOC95nMKH44mk8ckdHxqqzkSt51M+ZbPsfEQYjBP9VXUkOu/Rr2csc+O
	 V6IG/oN9VS7xXBM7EkCcsPS67ATkylxSjR6K1G28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DBBEF80552;
	Wed, 26 Oct 2022 13:02:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 702FEF80551; Wed, 26 Oct 2022 13:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C2C0F800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 13:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C2C0F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kkr8je1+"
Received: by mail-wm1-x32a.google.com with SMTP id
 r6-20020a1c4406000000b003cf4d389c41so231969wma.3
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iq+UTjOWMyquGHaqNGU9bVUM+RbHUdDoO13dPtnzSfU=;
 b=kkr8je1+7h37yq2UCQzx7bziwp9BgRGHNSqBb7MHWFDsWbjGPduEr3Jl4E1yYfBt0Q
 2rH15nIYWCvOOnIr8WyHRKxRHoqQFq1ctID5UQJJ27i0gf4/9mbP647SAxtQEEd70ciO
 xE+gccJPfzpgshvNKQIhRcfy0mF3ECaew3cgZz7OeL8zh2jlodY2AeFhDGYLNK4BCj7i
 LfgT8ODc6dk9tcQcKjJzUIq2h3A515ZhcAmRFDopXRHNoNPCnbKneJOUv34RYE1KLypw
 r3Ro1TF5ufrWemVsjdkN3Q9NoZsxph7y2TBCpZvSpDmSaREstiDlBhBjg5zlNyYtWRTZ
 zlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iq+UTjOWMyquGHaqNGU9bVUM+RbHUdDoO13dPtnzSfU=;
 b=L18BIDo7IY11pdoGsCz4c9Dxxs+fzfPebqsTuTd6uNDT4SMGdARD9GyCzdZo86hF4b
 lkYAB7+JKdWMUU9OqpevuoJfej1hvAuDI4FCUywIpqce6XDr503BJsII7UHkLqDYz5og
 b/yFIMflKRNn/+xGiKsAtKligQ0IThxFDGWW6sIwi8ifmFvkFMygDpxM0WkLmRCAGI/h
 f5R9xW6eIX9m56C6NFTHOVmwERq8fIjTXmgk/x6anjvIrcyh7NSGDCbgheRdAd/lsEsv
 8Po/KAZrkL+fKL7lFxVk/XFEVgmuv/7SDQPqvWXaAy7RbOBp50qx92MHf8Nhdo2xg305
 knRA==
X-Gm-Message-State: ACrzQf1HkioH7jDrmYKkoBXApU9adJX5J1zGY4BYtc2nVGtCE3XtZk9F
 loD/xe670yuY9fJu/xJdevEmRw==
X-Google-Smtp-Source: AMsMyM5ZSYi57o1Z5QN7tWgoVXorQQMv/TaZXk+ZadlHoHTu14idvd4TR9hgJSmpkJHVthLxM8k9cg==
X-Received: by 2002:a05:600c:3585:b0:3c7:9f:5f87 with SMTP id
 p5-20020a05600c358500b003c7009f5f87mr2101249wmq.76.1666782143122; 
 Wed, 26 Oct 2022 04:02:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a5d44c7000000b0023672104c24sm5237415wrr.74.2022.10.26.04.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 04:02:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/6] soundwire: qcom: reinit broadcast completion
Date: Wed, 26 Oct 2022 12:02:05 +0100
Message-Id: <20221026110210.6575-2-srinivas.kandagatla@linaro.org>
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

For some reason we never reinit the broadcast completion, there is a
danger that broadcast commands could be treated as completed by driver
from previous complete status.
Fix this by reinitializing the completion before sending a broadcast command.

Fixes: ddea6cf7b619 ("soundwire: qcom: update register read/write routine")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b33d5db494a5..8f1a1eb017a2 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -344,6 +344,9 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
 	if (swrm_wait_for_wr_fifo_avail(swrm))
 		return SDW_CMD_FAIL_OTHER;
 
+	if (cmd_id == SWR_BROADCAST_CMD_ID)
+		reinit_completion(&swrm->broadcast);
+
 	/* Its assumed that write is okay as we do not get any status back */
 	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
 
-- 
2.21.0

