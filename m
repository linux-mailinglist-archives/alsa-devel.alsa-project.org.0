Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C317401C4B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 15:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C21D174F;
	Mon,  6 Sep 2021 15:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C21D174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630934966;
	bh=e4RpBLG1hy3livTcAHOOKxodWkreg9cfuReCbTDPQiY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oxdGdmxMknRJ+S+IPeYsyQWUE3Yj8YTh25v6z9TgRDhPCRXee/nhU4y/JRnyuY+80
	 ovxJugNoUOtWVAQ4917NRU+GrfTPCV69a4vsSlOIWKWI1nE2aY6/0c58Mjsj072FXm
	 B37qtXzoHokCSgUXScd2XGgzw2CvR0m5DW6ZhLbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDFF4F804A9;
	Mon,  6 Sep 2021 15:28:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 787FEF802E7; Mon,  6 Sep 2021 15:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78FB8F8014D
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 15:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78FB8F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="MA7+u9tc"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630934877; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=gbdk/z9NV8rR1PUFsj2YfEYQF1fJd5KmOvl99jbC3Lg=;
 b=MA7+u9tc+rsaAarBMV8uBfMP82S3n9mBFBwyQRHpjJDvL0OsTxeKsebe+AhBKvGc0xL7pKI0
 Pv6aZvlvA4kLDxkvK/gW1CavWEvIdE3Pt4XqMJZjoDLMnS2xzdW7W0bWEDDaxJ57UEk+23oX
 37crPPYNHMjFLk7aQrjO5aIHiek=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6136175b89cdb62061fbe587 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 13:27:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CA33AC43460; Mon,  6 Sep 2021 13:27:54 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34764C4338F;
 Mon,  6 Sep 2021 13:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 34764C4338F
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
Subject: [PATCH] ASoC: dt-bindings: lpass: add binding headers for digital
 codecs
Date: Mon,  6 Sep 2021 18:57:34 +0530
Message-Id: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Add header defining for lpass internal digital codecs rx,tx and va
dai node id's.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index 7b0b80b..187af45 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -10,6 +10,11 @@
 
 #define LPASS_DP_RX	5
 
+#define LPASS_CDC_DMA_RX0 6
+#define LPASS_CDC_DMA_TX3 7
+#define LPASS_CDC_DMA_VA0 8
+#define LPASS_MAX_PORTS 9
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

