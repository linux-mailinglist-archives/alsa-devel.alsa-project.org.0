Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB92414900
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 14:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE9511678;
	Wed, 22 Sep 2021 14:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE9511678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632314076;
	bh=QTo3gEGSrEUxvPNt/AyUGlk4rAioT3DfQaaLEs2/WKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XgwHEQCv/AbMK7Juv84nxrJUNz1XrP4X4TNFEOCz2XDZXdZNIhI7KYZOnOL+fPKJN
	 arIyVoR0MVjcrzRfxhpgtabBp6jCsrFnVeRjC1ywGfQyhme7HKZ2Pjz2LXtgvfPAQf
	 oKr3Q5n5f5jGQ4bqS/cnjBgkZRobDL7NQj62XJPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C33CF804F1;
	Wed, 22 Sep 2021 14:32:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BD5DF804E5; Wed, 22 Sep 2021 14:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D80AF804BB
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 14:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D80AF804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="A5XWajf7"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632313932; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gd9CIAgwqWfRYTCEFH89z24s5B6k8ycDJ78NCZG0Sj8=;
 b=A5XWajf7vqkMrC8HUPCQWwvDqCoKxOkwnREkB3BbXwxlZ/HFAMT2ce3CoPFJ2k4RtERNXcvZ
 BYIoMtcmVtEVzEMzo0nXhk+lqBdQpjefe70gGC8EsWxOvL0rhwvWyTA7JUuo30Y07xoCgVO4
 1031Ab/+oLwr0ZG3WoBhueo7yM8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 614b2249bd6681d8ed0532dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 12:32:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B3787C4361C; Wed, 22 Sep 2021 12:32:08 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E53CC43635;
 Wed, 22 Sep 2021 12:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1E53CC43635
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
Subject: [PATCH v2 4/5] ASoC: codecs: tx-macro: Update tx default values
Date: Wed, 22 Sep 2021 18:01:17 +0530
Message-Id: <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
References: <agross@kernel.org; bjorn.andersson@linaro.org; lgirdwood@gmail.com;
 broonie@kernel.org; robh+dt@kernel.org; plai@codeaurora.org;
 bgoswami@codeaurora.org; perex@perex.cz; tiwai@suse.com;
 srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; swboyd@chromium.org;
 judyhsiao@chromium.org; >
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
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

Update mic control register default values to hardware reset values

Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index e980b2e..66c39fb 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -279,7 +279,7 @@ static const struct reg_default tx_defaults[] = {
 	{ CDC_TX_CLK_RST_CTRL_SWR_CONTROL, 0x00},
 	{ CDC_TX_TOP_CSR_TOP_CFG0, 0x00},
 	{ CDC_TX_TOP_CSR_ANC_CFG, 0x00},
-	{ CDC_TX_TOP_CSR_SWR_CTRL, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_CTRL, 0x60},
 	{ CDC_TX_TOP_CSR_FREQ_MCLK, 0x00},
 	{ CDC_TX_TOP_CSR_DEBUG_BUS, 0x00},
 	{ CDC_TX_TOP_CSR_DEBUG_EN, 0x00},
@@ -290,8 +290,8 @@ static const struct reg_default tx_defaults[] = {
 	{ CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0x00},
 	{ CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0x00},
 	{ CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0x00},
-	{ CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x00},
-	{ CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x0E},
+	{ CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x0E},
 	{ CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0x00},
 	{ CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0x00},
 	{ CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0x00},
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

