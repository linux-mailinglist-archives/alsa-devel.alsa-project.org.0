Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4C390AEA1
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 15:05:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CA9F84D;
	Mon, 17 Jun 2024 15:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CA9F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629503;
	bh=uc8wdHZiLzWn8eJSKz2w46aTnoymKmEOQTD+XqijcNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tbgOYPybRR2Yjp/pFdHHT/N+bzlEhD7+YrnY6wIgXaxXGY3mlKT1Gb1gMeis/Vjni
	 7KvkkYK5LV9CJ3n/HBdfbl2iO+/xy3TwItNgiHrknjEaB6+nkmoxU89x9qC/IuB6ay
	 YIXX44UTZVtqjvMizxK4HydQ40BlfK6O9vjB6mUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31FF2F80154; Mon, 17 Jun 2024 15:04:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C5CF805D5;
	Mon, 17 Jun 2024 15:04:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93517F804F2; Mon, 17 Jun 2024 15:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 566FAF8016E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 15:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 566FAF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FFySYTii
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57c60b13a56so5133287a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629415; x=1719234215;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu6ddlV0v3h5uXrvH+gS9VZsH+jfrjvNQ9t7e1CssRA=;
        b=FFySYTiiAd76e+Aqz29bzh67WfkHMmS2/Ff57/yB795bARo/WDXMAvX2/hW6voIGSL
         vdrxAnX3D9lKh+RcVk9UfRPnFYN3RHYfyiPjvjrkjZK5TunioHdsjRNFCN7kyJyBPJXG
         x5ZjRF8QAzvTGGzc8Q2A7QgNvTCVdna6EamUvvAIlnpK92PLjROPxMDLZIONr3t0eXWm
         OMutPkYYPrvQOON0I2mDYGm1pMk3gLE4lx1RpXeJfumCTEhaejdMQBwlhLjy8TV8NJ8o
         KU5JjWdjrciuNpMWpXvuqH1mg+k3FByWo/kmWTMPudeSTHmKHIHBVVNINQNTLXTsoI4w
         v0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629415; x=1719234215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iu6ddlV0v3h5uXrvH+gS9VZsH+jfrjvNQ9t7e1CssRA=;
        b=Nu1G9RWV64ueRUzGGgO1wUmi1hm0zfH4D9BPI51HzRQgXmJc3JrOMfRrkKtKovJeAF
         dE3qt38fa7jkKXzIQTOqw9QAGOeCJSsnEelS74LmqMriapa+DUZYxvamUNkO3FNaYM3M
         i/a9INbdmQyvexsE9ESukGpXQCDsAvI5MLsK369HAfmKcWLG7MubEGMCupYqPCivebYh
         9MU/8ORGeZoIWpOLQe/xsCCCRPosaJX2Aeeaga1qcxXZ+YDq+YyiLrpRT8ZmflrHi8H3
         OwySBMrDBOC+61fZlXZwsVql9g2AS10R5iugzjU+z7kKYIRyBE8uwkfUf1N0Ealnx3Kk
         ogZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAU1P1266cp4CFllLykYJBChi+SWFhmeNkHl+8Zbkw9w8BBImGASA3IbNATvZw+8bm6YjaqwVBp8hLHNUEmlcWXUAwUcKnH17vInY=
X-Gm-Message-State: AOJu0YxgzSDBxM9wbAqHugcvph+23N346BvXaEcgCzgW0rispPL9FIet
	C5vulU1KatodbgJvOtRptCKILLmZBlkgkBfFqwdLca8YkVp+Et9WGg2IQcrtkk4=
X-Google-Smtp-Source: 
 AGHT+IHUNni8AOLm/9P2UblMUUEc9IpqI2ijdEam/5ZmmPsfGDtdOofoplS92A83e6uVXMfUnxfkog==
X-Received: by 2002:a50:cc88:0:b0:57c:6a71:e62e with SMTP id
 4fb4d7f45d1cf-57cbd67f3cemr6395349a12.23.1718629415088;
        Mon, 17 Jun 2024 06:03:35 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:19 +0200
Subject: [PATCH 1/6] ASoC: Constify of_phandle_args in snd_soc_dai_driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-1-8004f346ee38@linaro.org>
References: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
In-Reply-To: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=883;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uc8wdHZiLzWn8eJSKz2w46aTnoymKmEOQTD+XqijcNc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQfFrlQ7abVRm3aNe8Kkl9L6AnbPjX6Y+7s7
 DYZjCHDS7iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0HwAKCRDBN2bmhouD
 10OYEACBZaQnC3nQIQco5nBJ8EikBNDkW/UcZU1og4FTRcbp49NVM6dFadb/k3/UZiat/5ZpaEq
 zsS2SII+bSFc0pkj1KCS2/ExC1+YCJ8MQdraBAWAOjH+oLOzomr5AoJi0EHVUnwna4KAkDmOqJ6
 sZJlvKBFT5RO7JARzHJcQF5PbYZqNHdhjylzgGpMpbU004tward7+b8CIIIxfZQ0CEgRlZNYDxq
 GrxNQNuGYku2ZCEVD19+BVieHkWapsKKBb/i4VLf3ubPG4ajioK4HW/LOpCWazXHWf8fQUkm+wG
 oN4fspmO64ts3Z/UMSj8MC9d9Gp2gV2Vh7pwPk60392PqJAhckFIxFSb7jSA23axzglAaL2POiu
 +0nVAPDeMRMDusjP+eC4YTWgz2vOlGNOCEOzhsK5ZWHiLhdLGthsPQPGrDc7Vappth96fI+XBmI
 Y3weq2AWK7tLyDaeqoVF8eVJXL79LNq1JKnhDthxIeoCZ/3uZz5uU3bTrMLh113Kmpt33DO3t44
 fSt6jsKQ2uMJEYxDJiRH1fQACXqQUpeM1ItArx6Cwc4SPje6WIiRbmPOReOyLrgtss1x5/LnrXJ
 3gpAibBpSPjAg9thRJuMKNw9M+RfdYyQN6axgpnAZvd0cZjwE5xavkzExTwqawMW12HMJTPXVJb
 cxilbMW0MQ12miA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: WRCGFAXBFBBVLW4XTATWMA4RQKPZUDU3
X-Message-ID-Hash: WRCGFAXBFBBVLW4XTATWMA4RQKPZUDU3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRCGFAXBFBBVLW4XTATWMA4RQKPZUDU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC core code does not modify contents of 'of_phandle_args' in 'struct
snd_soc_dai_driver', so the pointer can be made as a pointer to const.
This makes code safer, serves as clear annotation of core's intentions
and allows putting pointed structures in rodata (if ever applicable).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dai.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 279223c4ef5e..8b2ae7b71965 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -413,7 +413,7 @@ struct snd_soc_dai_driver {
 	unsigned int id;
 	unsigned int base;
 	struct snd_soc_dobj dobj;
-	struct of_phandle_args *dai_args;
+	const struct of_phandle_args *dai_args;
 
 	/* ops */
 	const struct snd_soc_dai_ops *ops;

-- 
2.43.0

