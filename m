Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E7E42640B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 07:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD42166F;
	Fri,  8 Oct 2021 07:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD42166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633670598;
	bh=I3m56nLoTcXgs2Nh55CRHkiEQ14CZH/YDXIYV4c9XEA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tv1qaE/7hX1Fv8UE9TcvzUXnCU/7c1Z0GmfD1rHb5QdesYJHNvz6Maz7LYroF4PZh
	 IfEHQzjwKALiLRtgUFsxUmXrUbRB+hi8x8daeKmxXrt6DYnnWWE7qTlxUqT/SDHw4u
	 yV+SxRWqedEL6CLXdEgeIrphoOuoCB9NHvEgRdpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ED41F800F0;
	Fri,  8 Oct 2021 07:22:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABAE0F80246; Fri,  8 Oct 2021 07:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 053DCF800F0
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 07:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 053DCF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="C/2oajo2"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633670510; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=G/q7apvmEsZYM5+PuMRPf8KoeiS4gg1z/ifPbeMc0E0=;
 b=C/2oajo2L4b0g3wnOSEQ/as6taUQNvuA34BAYBYTL1MXfzVyrcL1Xgsci58g/7J1A9KKCe3T
 F0pW9NfbShKHOsnDOv9S63uMRNjYpIPasqM67ikEfnaEEsjY1/CHAtAg/NPioVHVM7NK28RI
 YbdxeYfx1dcxN3UI9qwUSAt3ovA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 615fd56ca45ca75307ce9283 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 05:21:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A78BC4360D; Fri,  8 Oct 2021 05:21:48 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 660C9C4338F;
 Fri,  8 Oct 2021 05:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 660C9C4338F
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
Subject: [PATCH v3] ASoC: dt-bindings: lpass: add binding headers for digital
 codecs
Date: Fri,  8 Oct 2021 10:51:31 +0530
Message-Id: <1633670491-27432-1-git-send-email-srivasam@codeaurora.org>
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
Changes since v2:
    -- Rebased to latest sound next and created new patch.
Changes since v1:
    -- Add missing dai node ID's

 include/dt-bindings/sound/qcom,lpass.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index 187af45..a9404c3 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -11,9 +11,35 @@
 #define LPASS_DP_RX	5
 
 #define LPASS_CDC_DMA_RX0 6
-#define LPASS_CDC_DMA_TX3 7
-#define LPASS_CDC_DMA_VA0 8
-#define LPASS_MAX_PORTS 9
+#define LPASS_CDC_DMA_RX1 7
+#define LPASS_CDC_DMA_RX2 8
+#define LPASS_CDC_DMA_RX3 9
+#define LPASS_CDC_DMA_RX4 10
+#define LPASS_CDC_DMA_RX5 11
+#define LPASS_CDC_DMA_RX6 12
+#define LPASS_CDC_DMA_RX7 13
+#define LPASS_CDC_DMA_RX8 14
+#define LPASS_CDC_DMA_RX9 15
+
+#define LPASS_CDC_DMA_TX0 16
+#define LPASS_CDC_DMA_TX1 17
+#define LPASS_CDC_DMA_TX2 18
+#define LPASS_CDC_DMA_TX3 19
+#define LPASS_CDC_DMA_TX4 20
+#define LPASS_CDC_DMA_TX5 21
+#define LPASS_CDC_DMA_TX6 22
+#define LPASS_CDC_DMA_TX7 23
+#define LPASS_CDC_DMA_TX8 24
+
+#define LPASS_CDC_DMA_VA_TX0 25
+#define LPASS_CDC_DMA_VA_TX1 26
+#define LPASS_CDC_DMA_VA_TX2 27
+#define LPASS_CDC_DMA_VA_TX3 28
+#define LPASS_CDC_DMA_VA_TX4 29
+#define LPASS_CDC_DMA_VA_TX5 30
+#define LPASS_CDC_DMA_VA_TX6 31
+#define LPASS_CDC_DMA_VA_TX7 32
+#define LPASS_CDC_DMA_VA_TX8 33
 
 #define LPASS_MCLK0	0
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

