Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F317F707AEF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33C9D83E;
	Thu, 18 May 2023 09:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33C9D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395164;
	bh=xYxu2C2nbnCatdsx3U2EwKp8dc9IRWJAjK8i3LnwSfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lCx1hmhTXSr+EI701dzKXMd7Az0VR2cU8IP2GiGoYKF+t0PfxH92GufT8wpGPwr0a
	 Qq23r5WXaDpRogSQEgaaooajW4zDZ6QHarCSZZkQ4kO79+H392BjFW9PxgaQPTEuNp
	 HC6QDSqsvjeISFKDnVITUu11Axn2iylA/z212Oug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FC45F80608; Thu, 18 May 2023 09:28:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6253F80604;
	Thu, 18 May 2023 09:28:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DDB9F805B3; Thu, 18 May 2023 09:28:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0140F80551
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0140F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SY4zlhD/
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso318871666b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394890; x=1686986890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVXk2J0zDtxw+0Qou5QUMtzlXSrHNQ48trwuAxglr6Q=;
        b=SY4zlhD/Ae3NqKWMgCYMmnInKUuz8aaW8w1LrZj140mUYU5ssSsPDI2EaABgQV9yap
         Ernl5l+MQeuF813vs5dgtI3WN3/XEiNudVVFA0hkaEZ04MQ1bZCxFSWxvUdn6kImX9+V
         IgVBEGaTPpfiGrTgAqGxD32MVO3InaXImAWE2u9wbz7HoXqOsm+0equhQfc5EpKrAtEO
         stmHcBuSxYTR4GnFSv0T6INTHLSjpLcWbXQOs/KvYprUoPnIioiimgAKeyhBOhy+brFc
         tR0btKWih37xTmEtBAEVCjy5nGMy4zD622zLbnzNYpyK4K6T85rxfEQtxaaLr7X45K6F
         9nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394890; x=1686986890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVXk2J0zDtxw+0Qou5QUMtzlXSrHNQ48trwuAxglr6Q=;
        b=fQGvGhX+wYEXrua+9Bux548J4iwcwFE1oyGdbRDP+oK4+5LdPPMySP0vz9stotl9Yn
         eoRfRljRyaId2q1KUstYjhugjyadPlokarjJL4V2h50x2x7NFjvId6I084sXwIB6WOKO
         +jWXlBWr/RD62Tyr+8cdxyWlkIII3h/ETBDL0h+QA7hfIIubBMjDextVRB2bpP4qH1YQ
         Rll7yq4xeFIBFTHB8Ks8xe9B1PyJuOCwIICey+AWnQsmIu9/C3BeJbxYZ33cF2Xcu0nv
         7u6N0STpVZnaM5lu+VCN5hZIL989q6ovh6PNwghcgcIZveAExo68xwLZwqOMDw8xqQDI
         Smrg==
X-Gm-Message-State: AC+VfDxnYf8V48hmml0xyQkkIUC5JqpVVhFWAoFUC6JIQWvJj+SmIFxL
	ayEdGZ9vPWdYhIYVru1iOfR0vQ==
X-Google-Smtp-Source: 
 ACHHUZ641f7zdyr1VGHoaOYeHSFCkkKsFuebd6A4/URfBSRepYIOCVjPIppyj2S59eXBj/0kOl+6sw==
X-Received: by 2002:a17:907:80e:b0:94e:9a73:1637 with SMTP id
 wv14-20020a170907080e00b0094e9a731637mr36831708ejb.75.1684394889884;
        Thu, 18 May 2023 00:28:09 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RESEND PATCH 11/12] ASoC: codecs: rt715: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:52 +0200
Message-Id: <20230518072753.7361-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UJBDATE7L4SBU5RCU6S7WPLRLFV6RAMU
X-Message-ID-Hash: UJBDATE7L4SBU5RCU6S7WPLRLFV6RAMU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJBDATE7L4SBU5RCU6S7WPLRLFV6RAMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver in its update status callback stores Soundwire device status in
state container but it never uses it later.  Simplify the code a bit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt715-sdw.c | 4 +---
 sound/soc/codecs/rt715.h     | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 5ffe9a00dfd8..6db87442b783 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -417,13 +417,11 @@ static int rt715_update_status(struct sdw_slave *slave,
 {
 	struct rt715_priv *rt715 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt715->status = status;
 	/*
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt715->hw_init || rt715->status != SDW_SLAVE_ATTACHED)
+	if (rt715->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
index 17a8d041c1c3..12a0ae656d09 100644
--- a/sound/soc/codecs/rt715.h
+++ b/sound/soc/codecs/rt715.h
@@ -18,7 +18,6 @@ struct rt715_priv {
 	int dbg_nid;
 	int dbg_vid;
 	int dbg_payload;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

