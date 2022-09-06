Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEA95AF182
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F58E15F2;
	Tue,  6 Sep 2022 19:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F58E15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483850;
	bh=gKx0aroXQ1x9IP9+vbxsV9gWhVEQjGZTSuFjF70ECM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b90kxrrGs3dW2LSTziPZTrywh8VuxRTm0GnDiaYnaCNF5lHqIkVWg0lFxG4y0y/q1
	 pZYlfXt/EQnmVgJF/5Cr3So9o1GMyT+Gpdwhu5Fc3FuT6GUm6TGoRCmilOBGMfhB5m
	 RIJh09Iu3ozVU57FNDLRmH6BrmGourAd1C/PRKqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ED56F800E9;
	Tue,  6 Sep 2022 19:02:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B87F80551; Tue,  6 Sep 2022 19:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F576F80535
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F576F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QHiV59qF"
Received: by mail-wm1-x335.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso7822888wmr.3
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pUJmbtWvtPwGRy1+LOJw2XaXtrhOpybks4Z6SCIljf4=;
 b=QHiV59qFluFmc2X4aluSb3cI8UBx/AvQ+3qoFk4pdJSOca0Pf+UwsjydWWNNy+qaTk
 +XF/XyHjDNitJ72UxSrOXjTo4qMk0hNSt8ERShfBL0fcv0Q0KcpBHZNeLSL6vrooYy8Q
 zdjECuThHt+98Mw8rMCcJqVPKe2ZnbZbhsN6YnlF/tZmDWzc4ovdFeXN8FqMJAiCH1Xm
 wSAyIZsF+0XTlaqfl4CFtoeVvQOCQSh0tRvs9Fhg2E/fIoNQwk0WgKo47AyPqcpCrde1
 coiFBaYo2JpZRtLar7U3mrZXlOPGmQ5yLXBTvVWD5yTPFBCdI0aF44a/HdAJnfAtxunU
 hpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pUJmbtWvtPwGRy1+LOJw2XaXtrhOpybks4Z6SCIljf4=;
 b=yC/xbPBLGIIFv++YR61YC/+EexzPY46zXaBYMO0F6kvL39q2PFry84wZt85aj+ym5T
 ythOXZxiGhHj1oA1le954cdkSxeEZPNREj8j1Sy7LSahB/rsRY1blL3rFgWXn7EGLjMP
 Zzv+feorNkQ63ZMk7E9o8TJ9aZZgDLhKjHDlcINRGSOMxOEVNaATk/snIDaSit46VmBJ
 EiwZmzOegTn6cAfjtnKNAuSO7giOLKuDCP0V9QGscz9a4gdpbqYaRPRHT0WEt6pxeruO
 0t9VmMkjkRzKBRJF1bQ5BoVRLztaFI+G2dFf+o66H91b63Q5Thp769MzhPTi+qfJytRF
 nRHw==
X-Gm-Message-State: ACgBeo1k5fXFZoblx3pnEzZUdGb40PTAJQpCQLbnr0VfK6otBEBi+ll5
 6Zoin/Bvtlf1H8gqg8jTJACcQQ==
X-Google-Smtp-Source: AA6agR60Q2Q355yXzSKnWe9Bc2WKpC+8ck642yuall8GTusB9e4f1IY3T+xuDCrcw6+igOiiVe0niw==
X-Received: by 2002:a05:600c:a4c:b0:39c:6517:1136 with SMTP id
 c12-20020a05600c0a4c00b0039c65171136mr14382172wmq.12.1662483736228; 
 Tue, 06 Sep 2022 10:02:16 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 09/12] ASoC: codecs: tx-macro: add support for sm8450 and
 sc8280xp
Date: Tue,  6 Sep 2022 18:01:09 +0100
Message-Id: <20220906170112.1984-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
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

Add compatible for sm8450 and sc8280xp.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 7f9370ed126f..ee15cf6b98bb 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1994,6 +1994,8 @@ static const struct dev_pm_ops tx_macro_pm_ops = {
 static const struct of_device_id tx_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
+	{ .compatible = "qcom,sm8450-lpass-tx-macro" },
+	{ .compatible = "qcom,sc8280xp-lpass-tx-macro" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
-- 
2.21.0

