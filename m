Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8EC331010
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 14:54:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2A6A18D3;
	Mon,  8 Mar 2021 14:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2A6A18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615211662;
	bh=tde7FK0e/Q7zB/pCiB65Dd6ODA2qsIVS6rczw/wdSAM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mO+4lTLcCY4Scb9fAU+HmJZY+zmev5crIxfX6UiL4s3Y2Hv4ScHcX55ruqJBQO4qH
	 HcxHMFJ7FMPWqDxWLrMjzAKnTY8Kd3G13qaWY+qBpUxrs3WTYvkUFgk4IsVKOkKoVP
	 R0tWfKhRl7hOpEEButQu0FxVF6ipczslGaY3Gg+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FFF4F804D1;
	Mon,  8 Mar 2021 14:50:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9285CF804AE; Mon,  8 Mar 2021 14:50:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CE89F80424
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 14:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CE89F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Rd1zk2w9"
Received: by mail-wr1-x434.google.com with SMTP id v15so11532019wrx.4
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 05:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bXsQNCXUapXF20IWHIenhBSQ480XBxLPcOx8iPsHvUs=;
 b=Rd1zk2w9YzhMPxyi8nCdwEy1T1l1/k/MW2duY8f0HkMU7dz3vG0wu0amZs4x3SEoRp
 pwVBGeiWabU00t9Dvj0Z0KW6O2tBKwPGPLfuadP0p7Mg/taqWOj9P3Xu2s+j93lwnvcw
 KrkDTOL5Cv3litLwdv+MM4uJ8YR9dknPGefO7GJyq5lvC4VLtexdT2qS8fkt7w0+9IEj
 kWNWAkgNOglXIAlLc34LjRsfThYx4bX27bM8xVLghL3k3UCvs0lAnOdQvy7pc3Ow6Kgc
 eWDnJr5MTcmLVAp1pD/0y4EZoyU2mBDCRd1rm1gQS2L9ptOTt0iw4Jk4E0X60KhoreFQ
 OmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bXsQNCXUapXF20IWHIenhBSQ480XBxLPcOx8iPsHvUs=;
 b=KGemtlYZW77J3GamQjWGWGWBHVlie8SFZAQ9IMehB+P2LYEU5CbsQK8wrpd9KM3vXX
 d31aff5Cm+/ST2v//uEMve247QxTHuDEnoo7aMW2+QG0tq1d+J7rCk5sAV9OFMSj9+fP
 P+ETXWzVZY7chJ1gCBm6pjO+O+x4SytfZDb4QLtmKoIjsxCdT582nOymWW0pdX+Exnv/
 zYOKv0fIFNsxnyhBW7hTG/DrzMZ9ohRWrtobiUymwYiFtwRfS5frC+n72MJZoKl7Wkn3
 tgoBa3Vw9zTHWzHSxUcdssO56jh+ocIIO2SLpeMCWxkXvJtP7Tv3ozTd/JLd2Qh29sJR
 t6iw==
X-Gm-Message-State: AOAM531T9XglhJTYCYdeEjruU0vKiKuAELuK18vSIjHQOCyTOjeUNnV5
 /3Hw1TPwiYOMcN7tRC7v0tei7A==
X-Google-Smtp-Source: ABdhPJyGmakQk7A4faicPCFfSQQku7sOUvCrhMttiO6Hw9GvFWY6gs6QEikQEs2SdWNTke9zcRKQhw==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr22312853wrt.426.1615211415041; 
 Mon, 08 Mar 2021 05:50:15 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h22sm19490589wmb.36.2021.03.08.05.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:50:14 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v3 9/9] soundwire: qcom: wait for enumeration to be complete
 in probe
Date: Mon,  8 Mar 2021 13:49:57 +0000
Message-Id: <20210308134957.16024-10-srinivas.kandagatla@linaro.org>
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3109ec6c33ac..578a392bfbee 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -123,6 +123,7 @@ struct qcom_swrm_ctrl {
 	struct regmap *regmap;
 	void __iomem *mmio;
 	struct completion broadcast;
+	struct completion enumeration;
 	struct work_struct slave_work;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
@@ -415,6 +416,7 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 			sdw_slave_add(bus, &id, NULL);
 	}
 
+	complete(&ctrl->enumeration);
 	return 0;
 }
 
@@ -1134,6 +1136,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
 	init_completion(&ctrl->broadcast);
+	init_completion(&ctrl->enumeration);
 
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
@@ -1180,6 +1183,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	}
 
 	qcom_swrm_init(ctrl);
+	wait_for_completion_timeout(&ctrl->enumeration,
+				    msecs_to_jiffies(TIMEOUT_MS));
 	ret = qcom_swrm_register_dais(ctrl);
 	if (ret)
 		goto err_master_add;
-- 
2.21.0

