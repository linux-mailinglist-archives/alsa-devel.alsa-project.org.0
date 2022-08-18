Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2218F5984A3
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 15:48:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC959166C;
	Thu, 18 Aug 2022 15:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC959166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660830515;
	bh=o+1ySPqvWmXCztUZ0D38jubq1U+fMDSTj0HCCl83gLM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hh05k0WkRjcdM21JWqH52jUaRQy9w0Cqd7OhDA+rcJDgbS8yM+iQCIIEkR78d+Yid
	 tjb8gRXTWhbfDQmTRyfMGXCx/rB+Vam6M+vp9lFsIujV/CHyQPG2gKaL1ybZHIf8Ew
	 itWrr+8PiYQJO3+HcYrnW7n/VYwHDqJ2/NNIVNnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A832F8052D;
	Thu, 18 Aug 2022 15:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CE17F804CB; Thu, 18 Aug 2022 15:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97C7AF800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 15:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97C7AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QNTHiKcT"
Received: by mail-wm1-x32c.google.com with SMTP id
 i129-20020a1c3b87000000b003a62f19b453so72621wma.3
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 06:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eiRe1B0ZIFE4lVaNWcauD4DXUe5vQu4l80JAQTe/0g8=;
 b=QNTHiKcTznLn5qHU+rcEotfKidl83Mg8wMWxGKO8WxsTHmnt3LhAxLdEJexf993ii0
 8axKucOALczyy8nPbONFTDwIhO3qVILywk9nBkOwkCVnZGjoKIwnvKIxjQWH6c3bbuOe
 9ds0fN2oI/zLNMZnqQ2LyByEg1iOpgMqzfvIaMPMnobCOs70h7vkAq3ULJasWqEgdmIU
 CVTrdQt5P/87pJ7WxRmrOWW5+V3cPvKYsKChN9XLTJenTelFq006k1lye2AR7UrL1p2w
 ZDOhjHeiv8XttTAmt5UxG/DgZVvRKnom8SuF7v4/T8A3JEzE8rZmOx187tmuxLycVR4+
 Dm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eiRe1B0ZIFE4lVaNWcauD4DXUe5vQu4l80JAQTe/0g8=;
 b=LiUV0ypESWeM93w16Z13pA7inrfY5gdoldLk4oX4+pBE815RFE1mpoQhUS/TIQPvO8
 vzJJy6GnZ5z5jE9j6wOB2aHASc60UM1pwFzNZr9qOtHLHSgwAGd/WIct55xd2mnufu/l
 T1mye6A5wM/CUQQin4UqwWvtflYu/vt75xtPD7rxW8LKR2317RozIb89tvtw2GQpOTiV
 qDUjuKrtaoYvO5EqnLRVk0sCAtM+23SsMwWVlUlQfntozigyCAuOa6n1jJr7PzpvkUHq
 tOY0EIqcyljnLftu1gkuOt1MbgLUJGDb7eODGi8O+Qze4EgJRoRcN2spJDo5yCE0d5Dk
 L+sg==
X-Gm-Message-State: ACgBeo05R12ojEbdxRBZxb+jv2cCWVrmB8XMvpw2cYQYMkqyHmEaM32x
 mE3o89NxKwp+qWV0CnNdXPfcrQ==
X-Google-Smtp-Source: AA6agR4Hop5Tuz+rKxdk6PKo3fj6arTtQUxSSOpAbsY3XJaCi5KcdZUkwgP/RmX2m7zqJCsUf2VjYA==
X-Received: by 2002:a1c:2783:0:b0:3a2:fd82:bf46 with SMTP id
 n125-20020a1c2783000000b003a2fd82bf46mr5152932wmn.29.1660830405973; 
 Thu, 18 Aug 2022 06:46:45 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a5d6785000000b0021e47fb24a2sm1454549wru.19.2022.08.18.06.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:46:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/6] ASoC: codecs: wsa-macro: add support for sm8450 and
 sc8280xp
Date: Thu, 18 Aug 2022 14:46:15 +0100
Message-Id: <20220818134619.3432-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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
 sound/soc/codecs/lpass-wsa-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 27da6c6c3c5a..f82c297ea3ab 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2561,6 +2561,8 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
 static const struct of_device_id wsa_macro_dt_match[] = {
 	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
 	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
+	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
+	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, wsa_macro_dt_match);
-- 
2.21.0

