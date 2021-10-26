Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3E43AD77
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 09:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721FE16D7;
	Tue, 26 Oct 2021 09:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721FE16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635234327;
	bh=0LBMnYQNRpnV8xasoiE+rbwbrLH5y2gcI7BSbtdxd5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HWWTP9mRg9/8m7qXTbjg5vFOnJSEq74L7hGTsOQsxz6xzpzZORBcDO0ZFS3xDAydF
	 f2OiXlFDkNI02yYwWtZV1+nz0m1jCuhb//twDRS+urhDiOZcE7jiGFqGZTGxHaYlN1
	 YP/omuq95CAgGys08jjtabJAR16Lu9FNqaziWTXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85681F80269;
	Tue, 26 Oct 2021 09:43:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B444F8010A; Tue, 26 Oct 2021 09:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37FC2F8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 09:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37FC2F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="flVD2J1f"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635234222; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yem2NXhbW8s1O08Anivuo63xWML7D3l99wRsqypL9HM=;
 b=flVD2J1fodBEVYnwQcvvPkHnviVE5Xk1AdCrZLAW1rHEDF5l+f6QhKdYuZvI77r+uMhip24c
 AO1G/qD/JxntCy+NerM1aBsDej3yEawq6eGOBi/KJJ0QKg9hRWhUShyEPpRDk0IrFEJxhK8P
 0FM8FpSbGhHuyGX8OVdSlUfhe/o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6177b1a3b03398c06cc76961 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 07:43:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1EF7FC43460; Tue, 26 Oct 2021 07:43:31 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E8FB5C43618;
 Tue, 26 Oct 2021 07:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E8FB5C43618
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
Subject: [PATCH v4 1/5] ASoC: qcom: Add compatible names in va, wsa, rx,
 tx codec drivers for sc7280
Date: Tue, 26 Oct 2021 13:13:04 +0530
Message-Id: <1635234188-7746-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
References: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
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

Add compatible names for sc7280 based targets in digital codec drivers
va,wsa,rx and tx.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c  | 1 +
 sound/soc/codecs/lpass-tx-macro.c  | 1 +
 sound/soc/codecs/lpass-va-macro.c  | 1 +
 sound/soc/codecs/lpass-wsa-macro.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 196b068..c2b9333 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3577,6 +3577,7 @@ static int rx_macro_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rx_macro_dt_match[] = {
+	{ .compatible = "qcom,sc7280-lpass-rx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
 	{ }
 };
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 27a0d5d..5dcae73 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1843,6 +1843,7 @@ static int tx_macro_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tx_macro_dt_match[] = {
+	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
 	{ }
 };
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 56c93f4..70f09b4 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1472,6 +1472,7 @@ static int va_macro_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id va_macro_dt_match[] = {
+	{ .compatible = "qcom,sc7280-lpass-va-macro" },
 	{ .compatible = "qcom,sm8250-lpass-va-macro" },
 	{}
 };
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index d3ac318..75baf8e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2445,6 +2445,7 @@ static int wsa_macro_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id wsa_macro_dt_match[] = {
+	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
 	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
 	{}
 };
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

