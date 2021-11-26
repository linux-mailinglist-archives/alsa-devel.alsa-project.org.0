Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E409945ED60
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 13:06:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7E691915;
	Fri, 26 Nov 2021 13:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7E691915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637928414;
	bh=lzcGcWkkC2ZNgh28j583LlIUFbL/XbUzWWi+TqpIrNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J16bO/0AyJV0NjE/p3pgEOssMmLyt09Ugs0FgR0+brWWc/87WVd7BMX+WQbjhl4QN
	 F7neKik1FQIAsedHMzEgsG25KqwpZFQczMKiZ0rL9DZhxf4C0bk/s5NqIIdwz0ypXC
	 MGK8nawpliXcu4+YtG847Tmlv0YOFyIKVbSJFqyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D52FDF804AD;
	Fri, 26 Nov 2021 13:05:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E652F8032D; Fri, 26 Nov 2021 13:05:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05260F80087
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 13:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05260F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="wcClmqp5"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637928313; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=edWHYXGr50jPzCVqXVbW33yJrYwUY66JMJiRnCtZ2C4=;
 b=wcClmqp5e3LXNLAxlr6h7zhwn44qZ2iZPrkgOhiAx8ABS+KCKt7HWBu6VlUi8EqSE9pzYLUK
 uz6AVaClzjXlsbfOSQUTNv1EO2Ya3Uujhb8PxEbKAz173naQkfnXgqQpEIA21Pvq0BKw/lvK
 Xolate7fomebYCPluNbE48l7+dg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61a0cd721abc6f02d0efb9a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 12:05:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 59E4EC43619; Fri, 26 Nov 2021 12:05:06 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CC091C43616;
 Fri, 26 Nov 2021 12:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CC091C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH v6 01/10] ASoC: qcom: Move lpass_pcm_data structure to lpass
 header
Date: Fri, 26 Nov 2021 17:34:33 +0530
Message-Id: <1637928282-2819-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Declare lpass_pcm_data structure in lpass header file instead of
platform source file to make common use of it by other drivers

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-platform.c | 5 -----
 sound/soc/qcom/lpass.h          | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index a59e9d2..a44162c 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -18,11 +18,6 @@
 
 #define DRV_NAME "lpass-platform"
 
-struct lpass_pcm_data {
-	int dma_ch;
-	int i2s_port;
-};
-
 #define LPASS_PLATFORM_BUFFER_SIZE	(24 *  2 * 1024)
 #define LPASS_PLATFORM_PERIODS		2
 
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 67ef497..63aaa6f 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -256,6 +256,11 @@ struct lpass_variant {
 	int num_clks;
 };
 
+struct lpass_pcm_data {
+	int dma_ch;
+	int i2s_port;
+};
+
 /* register the platform driver from the CPU DAI driver */
 int asoc_qcom_lpass_platform_register(struct platform_device *);
 int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

