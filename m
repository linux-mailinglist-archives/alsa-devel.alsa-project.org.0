Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1164706E56
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 18:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B431C200;
	Wed, 17 May 2023 18:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B431C200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684341573;
	bh=NNGCx11a0kZFjUsYsaABV0PBZ8AkwIxZVPltka7FSug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=STJO6+M0o8SBlv6eyui6nugr4wLswYfhYh7Q2AyFf/sOsBLywNKD0VU819ZSZdkUG
	 PGWUSoykUio+VQDHv5GBYnHylwI1Nv5MKjjxCvLglzMjlEhDypk7BVH1Mg/pADcRdL
	 f/UdIWCkf5tZ4tOjKixXpVCtzxvmPgF1Jawp8tcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F0CFF80578; Wed, 17 May 2023 18:38:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B91D0F80578;
	Wed, 17 May 2023 18:38:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9A2CF8055C; Wed, 17 May 2023 18:37:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A712CF80551
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 18:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A712CF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZlTl28Xa
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-510db954476so585899a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684341474; x=1686933474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxFHTRCKX1b6ZPvp5Tbzp6uL023q77o/sho/DiHZlF0=;
        b=ZlTl28XaVoUXtK1R34OnJkyaUON8lN7ZqEl9xlLeb2F1+VNKzXQlqUBUy3hYRe4+Xi
         ybUetVhyCtCPth5UUo3OCKa6R+YiCxy1IwqvcrwWikT73tdqJ49b672dd7+Z8F4UM9g7
         +794RuU2affLlGgyft4JZzow4imJSjLkSG2szqvX5pIw69/0w6ygLxEhAr+YTxUBwRe2
         Ug9i/gcRmusm2cYeUth3Vp9EBacAnars4fWV+8HIUk2j2Vh8nuWVObwz34XOlD7n2pLa
         +M+i4hpBfOIvxZ/z9Ty72PK3C0UgnGdUASeQYcjc7NBSmxP9IyfyF6qNMiD+noYB8xQc
         ufYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684341474; x=1686933474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxFHTRCKX1b6ZPvp5Tbzp6uL023q77o/sho/DiHZlF0=;
        b=YqWdYVoQhDSBkVspB3PN6g7YLCtl+Nfea8+J4mljznFwsehT+bjF2gHvzWXJWqIIRg
         UYHLmMnPyISTJP5wgiu3SL93Tib3gEopJXg9+Sotm5CDwqxJqKjLVmMUNWormfLqmAx+
         MecoSdGN1Lv/YqtlXkGzQydisaggwl2Xyg6mo9M7PgK/sdnjWhU/ngD5gn6pq3hue6uO
         J7Tza/0sFKm+wnLwnS0Meqqk3ct9qiOQ0ghZZugj7p10qOCH4vPLaIb34iEjZ+s19mQ+
         5BIBTJaeFQPx7FhK9LerYBYlkFdTW6nAL0ZhJlJ25is5Mga3cvsNQkyrbZv1Z9Zs0hW1
         zqzw==
X-Gm-Message-State: AC+VfDzKAtk4Uj7NxsAE9gWgTYS316IhPb+JJvosM8rKnDFPOK/gYEQD
	WZIqnCOr5uIcGIvnx4bdgDOc+g==
X-Google-Smtp-Source: 
 ACHHUZ4v5X5Nl45QaqZ4wy3xZQPUxWAVDqcRKxfdhsGdP1MRZG40xfitQgvgVmpnf2IMERFZMSdA6w==
X-Received: by 2002:a05:6402:1209:b0:50b:d26d:c57e with SMTP id
 c9-20020a056402120900b0050bd26dc57emr2431904edw.12.1684341473752;
        Wed, 17 May 2023 09:37:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 t21-20020aa7d715000000b0050bc041d2a8sm9284827edq.15.2023.05.17.09.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:37:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] soundwire: debugfs: fix unbalanced pm_runtime_put()
Date: Wed, 17 May 2023 18:37:50 +0200
Message-Id: <20230517163750.997629-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517163750.997629-1-krzysztof.kozlowski@linaro.org>
References: <20230517163750.997629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MSVIPJITO76SOXMJF6XOXFWML62OQH2V
X-Message-ID-Hash: MSVIPJITO76SOXMJF6XOXFWML62OQH2V
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSVIPJITO76SOXMJF6XOXFWML62OQH2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If pm_runtime_resume_and_get() failed with -EACCES, the driver continued
execution and finally called pm_runtime_put_autosuspend().  Since
pm_runtime_resume_and_get() drops the usage counter on every error, this
lead to double decrement of that counter.

Fixes: b275bf45ba1d ("soundwire: debugfs: Switch to sdw_read_no_pm")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index dea782e0edc4..c3a1a359ee5c 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -56,8 +56,9 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
 	if (!buf)
 		return -ENOMEM;
 
-	ret = pm_runtime_resume_and_get(&slave->dev);
+	ret = pm_runtime_get_sync(&slave->dev);
 	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(&slave->dev);
 		kfree(buf);
 		return ret;
 	}
-- 
2.34.1

