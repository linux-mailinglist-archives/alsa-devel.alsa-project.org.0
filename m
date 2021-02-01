Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0D30A8C3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 14:31:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12788176A;
	Mon,  1 Feb 2021 14:31:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12788176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612186315;
	bh=P+iFbR3CN7kGxiJ3MPBqckD+AmqoUJiNncXT6gudIsw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VNXhoTHuTw72GnWrX+xPdf54OihFOxjRD/4RItPI05FdtGqU6V0ZYz1wtqxIS6+Yz
	 z2nsixcaOREUdj7vQB8bJVBjuH/+KBqBZFOsbea2jLohfF23g8PgEETh9XjxMQSR+9
	 ErZkvGRcKEhJyGwY/Ezivm8ieQUQyw4XGwLY3DGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BF3F80151;
	Mon,  1 Feb 2021 14:30:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE656F80153; Mon,  1 Feb 2021 14:30:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC901F80151
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 14:30:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC901F80151
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LH/NniJT"
Received: by mail-pl1-x634.google.com with SMTP id d13so9992162plg.0
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 05:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UunwnYvb1lF7mySNBNzXUcuQr0Ir112LxW+Tsv/iCkQ=;
 b=LH/NniJTv5/eRCkCwigS3uw95k3+L4GVSIsJKg3nTEQztORSv16FUm4e0x59beFQzN
 SQwYsCL5ILaquwHp1Vh3JyDdGJsErEECVmlU/Fr8LvksjoL8Nujlvtx0+aIUQLjXIlMB
 OUmo4AW7Mk76EYTZhhGv88GYAptjWRQ/w8Lc9BYQsvT/8bxNWKfp02WI+0A7DqUMQ4k/
 AtK0IyffgLi8tAVTmW347oaXx8jrvGlKKrqMX+2x/9CleMEOqBuhuW4iNuMNoa0Ahfev
 nr89JYAE2cNmHS+gjPQEwv7Z9MmY8wLeIGGPAQ4ZsaCYYGFc2mqKNRneBdEIyXcS5280
 FqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UunwnYvb1lF7mySNBNzXUcuQr0Ir112LxW+Tsv/iCkQ=;
 b=Wzl3iwaWQudq/7UGHfZS+cEJ0RV9UfEjHZSAdhybvzZ+B81qc8hE7AjBIfpYKRA2Zt
 lOrzKzDvMXwC03JEbPI9XrKBWIoli0iMG8VTCMTjFIjIJfTwSG+Ut/U/4FEyyfbLQdKl
 Vgwl+7AJ/z6uABDguR83VArKA7lejggoUhDnq5vt5IslM3cNLuKnRH6cD9/excOBio7H
 gQhJ+UK7lTzOz9U67k3ITW3BiaVG2qgY0kgkRecuWyYLufx8Mfyw43s8BsaYQn2iMlEK
 yDJWkjfzNSUoONNro9wUsIDQXdFJhqwTJMGx68aqLjIghd3CQan7RuqITttu1xXurlvM
 rFMg==
X-Gm-Message-State: AOAM5310D5Xv3UcSZgY0YuxxtByLIkCoKzhVyy52zSXnNAhkDF5qRCnZ
 wfhXsPFoqIOb5MmNbv+p4H4/Kg==
X-Google-Smtp-Source: ABdhPJxAv5oeCS2c3pqCuz9iSeCAIg4C7wkv8HTqqqKCBHTuTkArkrHJfyWE/bqw/Qe+QyCZT4/zwQ==
X-Received: by 2002:a17:90a:d58c:: with SMTP id
 v12mr17746192pju.37.1612186190532; 
 Mon, 01 Feb 2021 05:29:50 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com.
 [66.175.222.153])
 by smtp.gmail.com with ESMTPSA id s23sm18517444pgj.29.2021.02.01.05.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 05:29:49 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
To: broonie@kernel.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH v2] ASoC: qcom: lpass: Fix i2s ctl register bit map
Date: Mon,  1 Feb 2021 21:29:41 +0800
Message-Id: <20210201132941.460360-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jun Nie <jun.nie@linaro.org>, plai@codeaurora.org, bgoswami@codeaurora.org,
 alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>
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

Fix bitwidth mapping in i2s ctl register per APQ8016 document.
Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and
dmactl registers")

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 8507ef8f6679..3efa133d1c64 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -250,7 +250,7 @@ static struct lpass_variant apq8016_data = {
 	.micmode		= REG_FIELD_ID(0x1000, 4, 7, 4, 0x1000),
 	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 4, 0x1000),
 	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 4, 0x1000),
-	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 4, 0x1000),
+	.bitwidth		= REG_FIELD_ID(0x1000, 0, 1, 4, 0x1000),
 
 	.rdma_dyncclk		= REG_FIELD_ID(0x8400, 12, 12, 2, 0x1000),
 	.rdma_bursten		= REG_FIELD_ID(0x8400, 11, 11, 2, 0x1000),
-- 
2.25.1

