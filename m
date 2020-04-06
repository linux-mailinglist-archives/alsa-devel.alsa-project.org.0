Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0881A19EEED
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 02:34:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D78A1676;
	Mon,  6 Apr 2020 02:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D78A1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586133274;
	bh=RUbTLmh08erfcKK1r1t9hTYey0RWb0SxG0uuyMvYo/E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AyQJLRNrdnk/96x6vAi8D1wTSQiHXgbAl8OTKzfaXW7mi6qMZYyQQSR7/xYKx6lkP
	 fCdR83qrNjrbEQ+HbnrTsVxjj94iIJlrdA4JJjCFm3XiXfVumLEHGRaJ70Xi9L/sCO
	 rAt1qfbxP6J+pvMYXsCVBCnk1MG68EsYnHO6LVqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A03F80121;
	Mon,  6 Apr 2020 02:32:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BE29F801D8; Mon,  6 Apr 2020 02:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD588F80121
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 02:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD588F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G8TvgV1d"
Received: by mail-pl1-x642.google.com with SMTP id x1so5232998plm.4
 for <alsa-devel@alsa-project.org>; Sun, 05 Apr 2020 17:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BmHMcZC/yhqWoXwUpcTR1X3nyLa2fdxVh+jOQWGNruk=;
 b=G8TvgV1dRjX+fRqES+PvYyblutibdQ+P/vUKP4kXMgLJ8QXvsJpCkLqY7GYhC1rHvN
 1ZrNlnzsXp2bywZsXx4NrWY5qAIbv8otScQR6P6WZa7e6za4D7bJT++2Yc8ayhgT7bBk
 acYzOcUW3F6xjxZIq+crF+l1OfBmgK/ailCCvNVncd4HVPKrGOf6ZTj/mHp7RWpkYl+s
 K4mPU6A7AUkckZHywHJhpIH3rhYUyPASo95a8BhsPGMH2ou0ViDqPD7MvgW+iceualnc
 0LjycEfoZLmfOyujZYeQdJT5rKtMQC8mRhJZH67GsgoZ3vrXwLXXw0X0UNdf9Raenjmz
 w/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BmHMcZC/yhqWoXwUpcTR1X3nyLa2fdxVh+jOQWGNruk=;
 b=mRTPm95S16lG3jtTRa9rgqAbhEk3qhE3woSOICNS8i4X3l+/y1oTy5JwnfJQsxcgyo
 KNzddu28DdRbRO7trYJnvrj7YbUj1NDgTiegmRS9ftUpINDWILmLa6PSC4yO+7PJ5sWr
 GV8wuQqLCMPCPVT4OwQ873LjSzFJQMl4rB/siOVGw6JQmRJHp8lOkT13LGTmzTrEhcNa
 IuSNx78B3vH5v3g6w09ymEkPrscAiDIeLtG3UztgvEgqWa9yE5VYoDHEMt0pbXu4O0Ng
 CMr2hK03GULhuivx9qiCTuJtSqSgjvd33FP6hUcWL7RkLEQ9e8X8e5IVsb7B3Usa1K3j
 56uQ==
X-Gm-Message-State: AGi0PuZTghwfYBmQqSstkB1irb4RbJeOtXl/cZC3krXQa4/Ga5+lBmRP
 BrD8InsGyI6/q17GLn2P9hudwQ==
X-Google-Smtp-Source: APiQypL96eZMSILPhO0ZW9MTIR6nTEF+9EUJkE883OgIqnJB3GN0SbdobCnDKKaqMYLdx9cfyr82IQ==
X-Received: by 2002:a17:902:b48b:: with SMTP id
 y11mr18041570plr.131.1586133164846; 
 Sun, 05 Apr 2020 17:32:44 -0700 (PDT)
Received: from localhost.localdomain
 (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id q91sm10685212pjb.11.2020.04.05.17.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 17:32:44 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: qcom: common: Silence duplicate parse error messages
Date: Sun,  5 Apr 2020 17:32:29 -0700
Message-Id: <20200406003229.2354631-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org,
 linux-kernel@vger.kernel.org
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

All error paths in qcom_snd_parse_of() prints more specific error
messages, so silence the one in apq8096_platform_probe() and
sdm845_snd_platform_probe() to avoid spamming the kernel log.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 sound/soc/qcom/apq8096.c | 4 +---
 sound/soc/qcom/sdm845.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index d55e3ad96716..287ad2aa27f3 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -116,10 +116,8 @@ static int apq8096_platform_probe(struct platform_device *pdev)
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	ret = qcom_snd_parse_of(card);
-	if (ret) {
-		dev_err(dev, "Error parsing OF data\n");
+	if (ret)
 		goto err;
-	}
 
 	apq8096_add_be_ops(card);
 	ret = snd_soc_register_card(card);
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index b2de65c7f95c..68e9388ff46f 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -559,10 +559,8 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	ret = qcom_snd_parse_of(card);
-	if (ret) {
-		dev_err(dev, "Error parsing OF data\n");
+	if (ret)
 		goto parse_dt_fail;
-	}
 
 	data->card = card;
 	snd_soc_card_set_drvdata(card, data);
-- 
2.24.0

