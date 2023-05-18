Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A8707AE0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:30:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E9582B;
	Thu, 18 May 2023 09:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E9582B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395012;
	bh=DweD3/hXISGu2olz6GU84WxSgV5Br9xBsvlyxrZPLEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TznwT/4oX/+D+LRqX9km3XcR1zoCgmVWHS/BFyjHeIns/UAYiC27LGoj8cqkzhTKn
	 FW1M1uS1xeuAk2UfbW5VcFP5ER8zfNVYD02YOMti86FKv0pKCjh3Apa03nF3O/Ak8w
	 HbzazTBFEDeuWlix/vBoi8hXhBtkX67b3R62aS4w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3566FF805AA; Thu, 18 May 2023 09:28:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A496F80580;
	Thu, 18 May 2023 09:28:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 339D5F8055A; Thu, 18 May 2023 09:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9A63F8053D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9A63F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kqlVceO0
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-965a68abfd4so309027366b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394885; x=1686986885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZcG0tmVXg695NcraCbh92aOOhRlMkU+haSPEq2t8Oc=;
        b=kqlVceO0GYGYsCRODhYZpkuyquIG9tGnV+eKMqZNHFtn5bmjaMeQNDmIEqV0/Srk4J
         qJh6FxhAkoM/SFU4Z6Vn3DviBh6qiMGUMcmO0yhXb7904wb7AsJwj9qdDcAI0sj6G7Tk
         rkz1/gHrydVt9UQsmYxqM9fnoPZzxZ2bbw77m2s1NFmbTpwIgq4C1ofrJFtY+6TD0CVY
         53l4rvZ741mvTSAubv2RZuEtlXizhMLlHnuAMUFyN6C1NxdTCB5ILVcXRhpy5B9wvhGL
         QJGpb3ruBj9ZST7urHEaiU24IU0IAFqBZbmUBZNo4+xHihGhTZ8zd8L+tJZ+mML264E7
         aP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394885; x=1686986885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZcG0tmVXg695NcraCbh92aOOhRlMkU+haSPEq2t8Oc=;
        b=Cpc9HctNfApMVBEnYjltLeb1bLJC4EGtk7Vf2QWD/Bg0728aDJRgjoQj1PVyPcEwo6
         TLKCozTLK+TgnkyC3x6Nlqy00ug4pIkPE31JQ1/216cSY897T8wAnn2s6VFvRtG26IKF
         Vnnnxptsbn3hN5gm5ZOo+MmEfN7tHjhAbsPUXie8PS4uki066Je5V8WtSoj4PphTc/Qy
         RiU1FQIisaNU84hG/JvJSRMT2vsd2QCTBWl/h73cN8vr4CeavspQ7iafAA2kM4g+N9+c
         nBj/ANkAhcdRntfqFgOsLfWGD1+WqCykW516Wj4XPy6J4ag9p83dFR9/7hqpDksveH+o
         zXTQ==
X-Gm-Message-State: AC+VfDx6lmjM/1mwkoPPLK0oF1Ec+k3HcdjIXgKi0/v6OgBlRadM0UY1
	XD3pIRa2qKaTkqELRIZ4hgpRtw==
X-Google-Smtp-Source: 
 ACHHUZ7pRjddpTaqA+rNwwqWdUkP3ix36JOQEr5MtBnN2+HAoHp+/Fm52aUqp3PwSgtFo4Tme5DiVw==
X-Received: by 2002:a17:907:9405:b0:957:12a6:a00f with SMTP id
 dk5-20020a170907940500b0095712a6a00fmr38215544ejc.21.1684394885268;
        Thu, 18 May 2023 00:28:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:04 -0700 (PDT)
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
Subject: [RESEND PATCH 07/12] ASoC: codecs: rt711: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:48 +0200
Message-Id: <20230518072753.7361-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UIANKMJIUNEEQBGUNF3EMK5DCICRB24R
X-Message-ID-Hash: UIANKMJIUNEEQBGUNF3EMK5DCICRB24R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UIANKMJIUNEEQBGUNF3EMK5DCICRB24R/>
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
 sound/soc/codecs/rt711-sdw.c | 5 +----
 sound/soc/codecs/rt711.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 4fe68bcf2a7c..b8ed3c6236d8 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -319,9 +319,6 @@ static int rt711_update_status(struct sdw_slave *slave,
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt711->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt711->hw_init = false;
 
@@ -329,7 +326,7 @@ static int rt711_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt711->hw_init || rt711->status != SDW_SLAVE_ATTACHED)
+	if (rt711->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt711.h b/sound/soc/codecs/rt711.h
index b31351f11df9..491e357191f9 100644
--- a/sound/soc/codecs/rt711.h
+++ b/sound/soc/codecs/rt711.h
@@ -15,7 +15,6 @@ struct  rt711_priv {
 	struct regmap *sdw_regmap;
 	struct snd_soc_component *component;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

