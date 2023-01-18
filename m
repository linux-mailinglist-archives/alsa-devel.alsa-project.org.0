Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6146718C5
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 11:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 683AB4102;
	Wed, 18 Jan 2023 11:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 683AB4102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674037040;
	bh=ACfBPvOf0eMxVif9lCVaCbeh9gRd3EswyZZcusXTL88=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ldtTVMQOH0W7YJCskvog1altK6A4EgWXgPnEnr0mdzdTVjN1c32AHYF315ZPQFZIT
	 VoTkKo/2kW6Xe/GGF+Jb1G9Gs7toRcYnPkuN7/m1bh6KWFue6188xu90x7TKzfnXp6
	 fC5utdcUjDpsPx4XRJR0dkif7Wh1XoiIaMeU3vr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E083F80083;
	Wed, 18 Jan 2023 11:15:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8CE3F8024C; Wed, 18 Jan 2023 11:15:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ABF3F8021D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 11:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ABF3F8021D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mZq+wCBj
Received: by mail-wm1-x329.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1112011wms.2
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 02:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djuiJl7bx5DRHNGTITj28NZCN8UBHbOpoHymK5Xy668=;
 b=mZq+wCBjWMn4ys2DKQ0xXZVF8e3MLqZsuhe6LIZqmNvtZVqNdlnFOXwye+qFyKabNR
 0eNJ3k+q/L1cobWT0KiCY692QLHmm6GDt9Z0VLiBMFrljI1gGieMZjlQ2Q/HVagCCMlt
 lsa4GP/fwmnoRl14bppiNU4yXZpm7G+ohNT/iQfrW54D0N/zAiYv1lE7GtwM80lK93+u
 WuXszjFi6zHUt+QsLbBmef9gdJJthddTMAwawOeawoHBpXl4J/YfTuJWaHIFKNxFNSuG
 iZue6hpChPgsvVbaRxTB+uS/8JSOK+T4LJH3g3TgU2jb1KvdUHOhA5KDdYOTmheGfMLw
 QQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djuiJl7bx5DRHNGTITj28NZCN8UBHbOpoHymK5Xy668=;
 b=iD9VoL5mvCbJUBG+q0ybR1BND9vJv0zFV+do4wtCHr5S8wWiba2/wnJzOKC4LR4pdm
 n3a9uiE2qZagU7LXR8/4fRBLjO8ghWfCtcG47UJ9qqnTlVN8EF5VCjIjJskvuFddo2Im
 VLde2XIWtbfZZIrXixFPQ2IdmZ3hU8N+B/eb1I6nmOqXclcCpeVlgnYiTCdUG7bBY0HI
 /9T1JtGd2JN5AsP7sJrOB3OwUjV7+arWrJ1xv6HZ3Ba97OEXhzpKSTPIVDxW+BkvnV+y
 uee6lAd64nfLa7+l3GxRY+SU9LRzksLiVsnK4qJW3+htP7N6siLS9fZvW3IIHfP0kJ+s
 kThg==
X-Gm-Message-State: AFqh2kpNejKFnxYmvyDfjFC0PN5w1t26fPwPTCSttW9v+Z6zX8lrR7CP
 5FqwIuAT1ZKziSLgSh2oq2gEwQ==
X-Google-Smtp-Source: AMrXdXuSuwUkqc5Qgfm+fecSkhvRSa+4v0bwmM8Aw/gpqS1HjI0hteb1WBpPIkYpvlfGlqcbh3aNVg==
X-Received: by 2002:a05:600c:1713:b0:3da:fd90:19dd with SMTP id
 c19-20020a05600c171300b003dafd9019ddmr6139660wmn.26.1674036948962; 
 Wed, 18 Jan 2023 02:15:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003db00747fdesm1529838wmo.15.2023.01.18.02.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 02:15:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: qcom: sdm845: add remark about unneeded compatibles
Date: Wed, 18 Jan 2023 11:15:42 +0100
Message-Id: <20230118101542.96705-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
References: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If all devices are the same or compatible, there is no single need to
keep growing of_device_id list with new entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patches are independent and backwards compatible. DTS fixup will be sent
separately.
---
 sound/soc/qcom/sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index d8d35563af00..02612af714a8 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -588,6 +588,7 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id sdm845_snd_device_id[]  = {
 	{ .compatible = "qcom,sdm845-sndcard" },
+	/* Do not grow the list for compatible devices */
 	{ .compatible = "qcom,db845c-sndcard" },
 	{ .compatible = "lenovo,yoga-c630-sndcard" },
 	{},
-- 
2.34.1

