Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 908FF5B9B74
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4072E1A40;
	Thu, 15 Sep 2022 14:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4072E1A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663246670;
	bh=q0rxgL/NIlO3wt+Tuuy9jiZmt3JL4p1OWDjp6NPfQT8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MvGVpkRcYfhn4yzgPa3OfBM2OGTXLkoHBk5aNPrzyU7Vm5zHJRUOYOxPjKZvR9ZKF
	 Y8yV1gCD+NX84oal25tg8Enzg57BGSqFMCA4D9+h6EZcAikw8DPt15UluRRIn/9gEn
	 +JoMNrz63VZhqiQaAYrCUzB+93fbZB1CnSpulFC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4635BF80528;
	Thu, 15 Sep 2022 14:56:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B86ACF80495; Thu, 15 Sep 2022 14:56:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6994CF800B5
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6994CF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VuXecdGb"
Received: by mail-wr1-x435.google.com with SMTP id z12so12429379wrp.9
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=lGIzKCCzT9Z91pOhcVsZGKjotZcXBUNtgUUXIg8kGbo=;
 b=VuXecdGbo5H0WHk/RI9HLQXwwK1vUUhREBkhtGiX3Jl6fOuDuNBLg6iChSdEnTkLg0
 wpN4E6AlnnbShqjmEJdh3MuUsz3tYbi2QZHlhulQ+ulv40Y1oVEwYV5sqhHXq83Zi9zs
 V1ApSMiZTdrs7OAvZulaHbZGim0JP/oa9n795R1sQqHTBjb+jr08YiccC0bYxz3frWRH
 ClWncZXoh2F31AWcO/Q5BNvvBa1XeJPyZbnBdZp/KrUWTEPxwtt6AiH14ZHPEKc/naqC
 qAQqbQlhyHOaRUO13xSqkNIh4XQVkO1UG9mMEU2Bb49H2OU3RFOzSntKCXXlF6OjOLBa
 sCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lGIzKCCzT9Z91pOhcVsZGKjotZcXBUNtgUUXIg8kGbo=;
 b=DJSCjA1biRZ+dT/ofiQRKiBVmOUnWlHFST/ILBQtoocP16FC66Ura2cJshG4/JzU4c
 AVe0FI1LEYcSmFxIXDrdhGpB2dpAeChN7o2dQa+YQVkLr244xn6jQPbi+gBFvlotzxcR
 08wC8hKsjVH5wseTXPe2izC86bVSAilUe1qYIQz3+boSmU9fmwsp3D7Rm8OOTMXwql1o
 vdFaUU1zln2yaf6Bjt+sv7xbTkUXl7SQAH/Enb4pStj8fIOv8wTPdHAWBKU2FQfeThvG
 xGcAOaTQDScEyYZNXk9xKsrcxupztYOkFaMTFNrAGpcvXJtZ+8QYCadoGwa2jiQSXOEd
 KM4g==
X-Gm-Message-State: ACgBeo0PmAEDRhI/W0npiqOjtggzhL5VEv9hmCQGPz+bGMIjYMxhCFBC
 mHDtuj7OD/fNQCqlwJk8t+n9Bg==
X-Google-Smtp-Source: AA6agR5NfkgxbpXSZo002+Ikyd38sNhGJGQI6H3P46uFW0Rvglr5n1hmYSs9SZy7Ecb4Ie0qv80k7A==
X-Received: by 2002:adf:fa83:0:b0:205:c0cb:33c6 with SMTP id
 h3-20020adffa83000000b00205c0cb33c6mr25811807wrr.39.1663246580396; 
 Thu, 15 Sep 2022 05:56:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c510b00b003a845621c5bsm2764776wms.34.2022.09.15.05.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:56:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 1/4] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of
 EXPORT_SYMBOL
Date: Thu, 15 Sep 2022 13:56:08 +0100
Message-Id: <20220915125611.22473-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
References: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
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

qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c407684ce1a2..e53ad84f8ff5 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -175,6 +175,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	of_node_put(np);
 	return ret;
 }
-EXPORT_SYMBOL(qcom_snd_parse_of);
+EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
 MODULE_LICENSE("GPL v2");
-- 
2.21.0

