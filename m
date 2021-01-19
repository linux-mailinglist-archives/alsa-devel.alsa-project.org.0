Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A5D2FBE37
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:48:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B912C18D7;
	Tue, 19 Jan 2021 18:48:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B912C18D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611078531;
	bh=oxL+xdz8c1Aavad0prp/erG6cW/g0WByF3sWvs23Iqs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ATq2ayrRrYAVKwXWik5/E6TkT7C/NXSrCHq1ZBOEgVprrw/ogXymzHb52tI6aHD1W
	 cTAV0pcL2XS5Mg7lylKkdZ1X7s8eioVSrGMDjNFxjtFbtAimdvRJMiA6p9JrXrYeJ8
	 zTslwjkVboQ+e4nZ17Jbq6OBq4SSMiBbayvvUzmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 073AAF8026A;
	Tue, 19 Jan 2021 18:47:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35216F80257; Tue, 19 Jan 2021 18:47:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 212E0F800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 212E0F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nXJ8iO4X"
Received: by mail-wr1-x429.google.com with SMTP id 6so13313480wri.3
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SeiVO2Ijv0bDaLg32Huo5uyeo5TvfDyZ7TDlI9XT9gk=;
 b=nXJ8iO4XJrhtotFKL8TlJpkGZudq5LDPYZLc7tGKqVEWpDkhs8olnwThhBxcokVbCl
 0uaYsFTuHEn3vnqtyf4p3m1pWgmy358lhe82JxaXlvTLMe6c8btNvphU/Bm8lxhT/lPj
 4NvAgc45Ppxu9LWSWV1CGRq1rliSYETNhheAiqn+AXWNPVp9LVtS7JWxfNvPl9RZO89T
 iIz/fEk6jwnXzMQklU0I3/fdQfsQOaH29nGPlYihDzlqsstDkmjUDdSlp9EdnqJaQdsE
 xyrBFX9prwzfXhLcRvQU3hYvWMOyPbwgX1wgqeZAmR9zjwZevD8gf0vdQNBq5HRrjDgM
 Ffsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SeiVO2Ijv0bDaLg32Huo5uyeo5TvfDyZ7TDlI9XT9gk=;
 b=Qln5TvDws1GBfzakc8JSagcKGxhRBeZQDuNn59VwcPTzjIoq7DlXTMh4WAWML09HwF
 XJCqInHJ+aOMoo1FI5VbBXKpDeMQnYLGejO178Tic8fjT23KlISpwtyq15CO0EN6KS9F
 frWnqd8RFOvf0plmXGQFR+pzVLiyBNZYE2l9QSy9SVa4IwTujWz9P9EWGvQvZDE3Q7oc
 6kMSX+l2qmcWzVFMoSU95II5dyyKHbeWs/KTfUQzWAgR9BmNRkbba8EQODpxoHSeyOQB
 CqgR3DAYDFq5Sa1czszbmAjQ4tuBtNIQNWyIwtpjuTb5UYch2MMDYrfQxhiP2oYTDsLr
 72Rw==
X-Gm-Message-State: AOAM532JxoDOs6ED4ASaa524+hucqTp7IuMPVI0T7FtdamjTOLtBV6ko
 FmoFPeXlvoJ1zCrWNpXOb3lmtQ==
X-Google-Smtp-Source: ABdhPJxK7DACMPqnTzlWHHrHltlBU7vXmh8FRTMbkpaZLcKBgLEMJF+wGpLI1rKTmTh8nlg8c379mA==
X-Received: by 2002:adf:f989:: with SMTP id f9mr5338979wrr.299.1611078430836; 
 Tue, 19 Jan 2021 09:47:10 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id j59sm40176744wrj.13.2021.01.19.09.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:47:10 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: lpass-ipq806x: fix bitwidth regmap field
Date: Tue, 19 Jan 2021 17:47:00 +0000
Message-Id: <20210119174700.32639-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
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

BIT_WIDTH field in I2S_CTL register is two bits wide, however
recent regmap field conversion patch trimmed it down to one bit.
Fix this by correcting the bit range!

Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-ipq806x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index 92f98b4df47f..ef8a7984f232 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -131,7 +131,7 @@ static struct lpass_variant ipq806x_data = {
 	.micmode		= REG_FIELD_ID(0x0010, 4, 7, 5, 0x4),
 	.micmono		= REG_FIELD_ID(0x0010, 3, 3, 5, 0x4),
 	.wssrc			= REG_FIELD_ID(0x0010, 2, 2, 5, 0x4),
-	.bitwidth		= REG_FIELD_ID(0x0010, 0, 0, 5, 0x4),
+	.bitwidth		= REG_FIELD_ID(0x0010, 0, 1, 5, 0x4),
 
 	.rdma_dyncclk		= REG_FIELD_ID(0x6000, 12, 12, 4, 0x1000),
 	.rdma_bursten		= REG_FIELD_ID(0x6000, 11, 11, 4, 0x1000),
-- 
2.21.0

