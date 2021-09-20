Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C1411053
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 09:39:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4B81689;
	Mon, 20 Sep 2021 09:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4B81689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632123597;
	bh=6E+4PW1uiRDV3lHIuIQ6QwCwtroNlxteZW1uVSDTHc8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L8gd5typfI/9wsKFVKnWOrCSgVdfV0/S9zehNHl6E0geeFHVDtzjG5PQph7YlFd/r
	 ewG0R2H7ZlCqzojYQEQn0o/Dumz79Bv80wTBxbK/HwtK0bJ15txctJa+hiIyH0VQ4n
	 jCY806RidilyxUiAfl58PWOyrWvu9IbJjMHim8DI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59382F80515;
	Mon, 20 Sep 2021 09:37:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF007F80515; Mon, 20 Sep 2021 09:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61701F80510
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 09:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61701F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="xTmt41s8"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632123419; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=DlZnHGCDJOpKEs7/UbxZ3jG6Fo3UEfNqEU7n/+MVkH8=;
 b=xTmt41s8Jm5idjCdN7aqs6PbwMLKugZAsrrSP0XDS2IDx4Edoi+aTO2GomLb4DJb1FEWmVF6
 6vhP0Q9zjuitWgZrHFYoS+9r26gCInNIyUTZuC7VTYsbpgMoB9eQWCL4+YeasW6OmxaRxkAB
 6TQVd/YEXEWGCmHxPcRw350Nw7w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61483a0db585cc7d24d5724f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:36:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CFC03C4361A; Mon, 20 Sep 2021 07:36:44 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CD57AC4361A;
 Mon, 20 Sep 2021 07:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CD57AC4361A
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
Subject: [PATCH 7/7] ASoC: codecs: lpass-va-macro: set mclk clock rate
 correctly
Date: Mon, 20 Sep 2021 13:05:31 +0530
Message-Id: <1632123331-2425-8-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
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

Update mclk clock frequency from 9.6MHz to 19.2MHz.

Fixes: 908e6b1df26e (ASoC: codecs: lpass-va-macro: Add support to VA Macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-va-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 0ea39ae..f2ab09b 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1353,7 +1353,7 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
 					      struct va_macro *va)
 {
 	u32 div_factor;
-	u32 mclk_rate = VA_MACRO_MCLK_FREQ;
+	u32 mclk_rate = 2 * VA_MACRO_MCLK_FREQ;
 
 	if (!dmic_sample_rate || mclk_rate % dmic_sample_rate != 0)
 		goto undefined_rate;
@@ -1432,7 +1432,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	}
 
 	/* mclk rate */
-	clk_set_rate(va->mclk, VA_MACRO_MCLK_FREQ);
+	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
 
 	clk_prepare_enable(va->mclk);
 	clk_prepare_enable(va->macro);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

