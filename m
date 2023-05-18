Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39485707AEA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88EEE7F4;
	Thu, 18 May 2023 09:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88EEE7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395107;
	bh=Vu09X0qw5LIqSG3SsUGg6W4knv1eorf2cYkNr0qLpFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PYp+jPgT9+VDTXcCIvXU39UN5tDWdD4kLc5VWYyaY+lI7eOANRF9InBkkuKnTOeCA
	 /vdNL+MK52WNMUQlJG+a1dI0IUAdN2hf4H44MJtOF/PhgqfmlMzT66kbYwctjY+sYv
	 Lv8j5Sfh4RnYHojXGRSHk97zEBBBIisjPWGoaLEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 837ABF805E5; Thu, 18 May 2023 09:28:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E8C7F805E2;
	Thu, 18 May 2023 09:28:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 795E3F805A9; Thu, 18 May 2023 09:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09434F8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09434F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TznhBWZE
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-953343581a4so250395966b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394889; x=1686986889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSuhjZFmCIUit+haslyLLFjLlYcrxcE4KHcrJzAwJBY=;
        b=TznhBWZE03vv3t6BYxwUACwueYgrs1Ep3am2yskk4mEYGRjuema9R0bhklB/A4EYwq
         xq/kh/yu/4rwL9VhJPMfJS0lEVnKKv1az7+D9EicsrG+MicaTGHQFqn3+JEg2DI/X7Fb
         C+qzU/kJAFGbXFHTHMMYV8g6qAusfkex407LywnkHKTONWMAX7lqCi/piOOmH3amTtuS
         ZkOf57RBU9nd12mJzy1DZpOD7RQvNhZOxMq2r4452BSN7mjw+j28ELcvKSNmmtTT+nPg
         hMxwfQIAv5NlxIp8w+yqPqay10dOLP70vMRa5pncT+r8uYjN7/mf8UfaB6m5XfjjjKTE
         vriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394889; x=1686986889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSuhjZFmCIUit+haslyLLFjLlYcrxcE4KHcrJzAwJBY=;
        b=hE8I0x0W0uIFTTknfdtBhlCb3LVL5ODTgI6MnpH6RD62+08/vJAlwiaSg8Z17KvulT
         4u3o9jrmWvj3b08i6rFO/4a1/2OwHsYO5Tuose0qv7XruoWUM7WZgB/SYA+epsrg7xsK
         Pk2nf3G+0FC/GgDV2pJwDVtI5dxAG1Z6HtxMLgWTlB0iJRA/bSzo4VyFig0DlFPEMb8k
         kpD29ZKp+csDqEaxIhqRX73P3zh9uw8WA/9l0BQtjqXJqRIMnho1SiXsx4hEO3UNX7L6
         3kBwhYXaOHitF8VpJYpwsNni+kxgyCfVEJYYHz/RMEfHzlXvUS0EZT4sm9wEQGquCyFa
         g2jw==
X-Gm-Message-State: AC+VfDyTkq5jPw1zOd01Z6NqvL6l/NWcGfldpsBq1ARB+r/cnDaoy1ZS
	jcMYTJNYMqCfEeK3v6BiEWDl1dW1H1JBAKNxNfhxOA==
X-Google-Smtp-Source: 
 ACHHUZ4McNgf/1YlCyZhja1AYOncpGaPhNUPxjBOY/NlnHGibDpAgAupegzUKCoSeRkDzpsEpb9d9g==
X-Received: by 2002:a17:907:7293:b0:969:dda1:38a4 with SMTP id
 dt19-20020a170907729300b00969dda138a4mr32698956ejc.38.1684394888689;
        Thu, 18 May 2023 00:28:08 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:08 -0700 (PDT)
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
Subject: [RESEND PATCH 10/12] ASoC: codecs: rt715-sdca: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:51 +0200
Message-Id: <20230518072753.7361-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GIVUE4JTSHVH5NRFGNWLC56652TF7DKC
X-Message-ID-Hash: GIVUE4JTSHVH5NRFGNWLC56652TF7DKC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIVUE4JTSHVH5NRFGNWLC56652TF7DKC/>
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
 sound/soc/codecs/rt715-sdca-sdw.c | 5 +----
 sound/soc/codecs/rt715-sdca.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 38a82e4e2f95..7e5ddce8097d 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -121,14 +121,11 @@ static int rt715_sdca_update_status(struct sdw_slave *slave,
 {
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt715->status = status;
-
 	/*
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt715->hw_init || rt715->status != SDW_SLAVE_ATTACHED)
+	if (rt715->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt715-sdca.h b/sound/soc/codecs/rt715-sdca.h
index 7577f3151934..e5d6928ecaba 100644
--- a/sound/soc/codecs/rt715-sdca.h
+++ b/sound/soc/codecs/rt715-sdca.h
@@ -24,7 +24,6 @@ struct rt715_sdca_priv {
 	int dbg_nid;
 	int dbg_vid;
 	int dbg_payload;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

