Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A55AF25EE65
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Sep 2020 16:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D6D185E;
	Sun,  6 Sep 2020 16:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D6D185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599404375;
	bh=jQbH0v81HdTlQFu0Sl71JVcVCjKdbTy8X1NnDW7bM8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gtsHC2E4o64idqSxZ9b7rd+reC5QPTwwpg6OmfY7Aj03/XWy60Cksz3EXWmZhELq4
	 cmB0JpmSYbemf9mUsd7M2L96pOR8dkiVX07ZlqNVTfhjlHuaB916GLJ1NsXkdD5QwT
	 qXfK/KAfxn8+Ugx7yYE+mPh/JAG9XSgS2Cy3sLN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97493F800B9;
	Sun,  6 Sep 2020 16:56:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F04F5F8025F; Sat,  5 Sep 2020 19:40:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 374EDF80217
 for <alsa-devel@alsa-project.org>; Sat,  5 Sep 2020 19:40:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374EDF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com
 header.i=@marek-ca.20150623.gappssmtp.com header.b="blpD3fnj"
Received: by mail-qv1-xf42.google.com with SMTP id j10so4636928qvk.11
 for <alsa-devel@alsa-project.org>; Sat, 05 Sep 2020 10:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=clxiZVTp9IbXkL/ODJWDej3rLeQuCQZfJj2JCOZ4XcQ=;
 b=blpD3fnjIVvM2UjG69yRj3YsVpySHlyRssil72WnBLEgXMyIIgE2fFoHiWmPNv5KfQ
 ZITYlMCVFWQEv1GdzHRxmoCEy/B0MTqX9yk68IsSNZqS75q6ClyWfS4otL6JK08bTcko
 XbSKbb7N3OC2PHCyYzV6wHXyNxG8XXzbON8uVjINd1sBlqg4qiqwfRX+Eg0t7FCNYqtb
 SeotVZ6KCCgexrPc6a1EFS3twfu3vAa+w/rz8OU9K82KJVXjQ4fDdMHIRx1sUinY0+OI
 IeVt0MK6rT6xu92SG7kzODJ4kWv4PfDuuHc6naWm1/eH40hkZK7LDFKi9om9i67vAmBk
 IkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=clxiZVTp9IbXkL/ODJWDej3rLeQuCQZfJj2JCOZ4XcQ=;
 b=pH+s98NelXeW/MPmK8cyk0WOMd1eQ8jXDvxWNP9OP4o62y+kqP95LHoz+iyuMUvfjX
 8UYgnk7KJslMZgfTbbLpP0QvHlEKwsjXGpE+f08BZy72YSydZiAaczrxIU5apTnoNQyB
 IBIUl7iiYCWgNWK5YWlGP6CsbFaOeWG2zew62jJIuZm8QT8byQuEBM4ZL4s+WW/aO1UB
 ot04rcroi6FG1XXDen0VRJTqGMl1+YOWgB4gvxLsnvnjHWUCcOusUCL6Gx1mLwdhpoTo
 1S96kIpgeFAHRUbPQNfuh92ye3qON9wmT2oe37ua3RJhoq8gadvGJ/+6i97im94HDJJ6
 TCWg==
X-Gm-Message-State: AOAM5320tInZPfeRqOlGm+Qh8d+WjqMkZMZh0kH7bm8i7ZSmaEWBorbl
 a+vSCKX3ueNLnpf33Z58lbXDsg==
X-Google-Smtp-Source: ABdhPJzUx2oIqqILgTzU+sFcy14bKR7Lc4YYcEuNwCsXTBdV0KZMOPD0VXj9GSfNBWcaubjZI7bJtw==
X-Received: by 2002:a0c:edaa:: with SMTP id h10mr12414932qvr.12.1599327608255; 
 Sat, 05 Sep 2020 10:40:08 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k22sm4612076qkk.13.2020.09.05.10.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:40:07 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/4] soundwire: qcom: add support for mmio soundwire master
 devices
Date: Sat,  5 Sep 2020 13:39:04 -0400
Message-Id: <20200905173905.16541-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
References: <20200905173905.16541-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Sep 2020 16:56:12 +0200
Cc: "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Adds support for qcom soundwire devices with memory mapped IO registers.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/soundwire/qcom.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6401ad451eee..ff28794868ca 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -34,6 +34,7 @@
 #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
 #define SWRM_INTERRUPT_MASK_ADDR				0x204
 #define SWRM_INTERRUPT_CLEAR					0x208
+#define SWRM_INTERRUPT_CPU_EN					0x210
 #define SWRM_CMD_FIFO_WR_CMD					0x300
 #define SWRM_CMD_FIFO_RD_CMD					0x304
 #define SWRM_CMD_FIFO_CMD					0x308
@@ -90,6 +91,7 @@ struct qcom_swrm_ctrl {
 	struct sdw_bus bus;
 	struct device *dev;
 	struct regmap *regmap;
+	void __iomem *mmio;
 	struct completion *comp;
 	struct work_struct slave_work;
 	/* read/write lock */
@@ -154,6 +156,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
 	return SDW_CMD_OK;
 }
 
+static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
+				  u32 *val)
+{
+	*val = readl(ctrl->mmio + reg);
+	return SDW_CMD_OK;
+}
+
+static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
+				   int val)
+{
+	writel(val, ctrl->mmio + reg);
+	return SDW_CMD_OK;
+}
+
 static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
 				     u8 dev_addr, u16 reg_addr)
 {
@@ -310,6 +326,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
 			SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK |
 			SWRM_COMP_CFG_ENABLE_MSK);
+
+	/* enable CPU IRQs */
+	if (ctrl->mmio) {
+		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN,
+				SWRM_INTERRUPT_STATUS_RMSK);
+	}
 	return 0;
 }
 
@@ -764,8 +786,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		if (!ctrl->regmap)
 			return -EINVAL;
 	} else {
-		/* Only WCD based SoundWire controller is supported */
-		return -ENOTSUPP;
+		ctrl->reg_read = qcom_swrm_cpu_reg_read;
+		ctrl->reg_write = qcom_swrm_cpu_reg_write;
+		ctrl->mmio = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(ctrl->mmio))
+			return PTR_ERR(ctrl->mmio);
 	}
 
 	ctrl->irq = of_irq_get(dev->of_node, 0);
-- 
2.26.1

