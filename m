Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55640706676
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:17:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD1B209;
	Wed, 17 May 2023 13:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD1B209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322250;
	bh=WgUdedY/WH5OwU74JtzaexaFbol08w3Rp/bgU1G8p4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GxOgPS9jm9vk/pMqNNyz/ug9V8vjgg7ghdMBbkEY4QD+YiEvWX2ggusukMH1GyMQo
	 4uzNWw/t3nJAUldJA65Zv0TlWXsKW37TVeRCsSUGTfq8IGoEPjkFXNy+3Ywl9K9kaf
	 xavuIULbyQICO0wLocIiwYJ02Jb+HqmuWC8nhNp0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A240F805AD; Wed, 17 May 2023 13:15:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35E87F805AE;
	Wed, 17 May 2023 13:15:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1175FF80272; Wed, 17 May 2023 13:14:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6190FF80272
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6190FF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Q18UZ1h8
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-96b0235c10bso104904566b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322087; x=1686914087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XA3XbezCgMB9jc3ic4kluul6uNj+0DU/xxzeFgKHBE=;
        b=Q18UZ1h8k0fFvwih1EOsNVJXAjQsdHXNFlqphn0hwbg48vgVEor0zN78LCEayppAZf
         ODLE6k/+kOXM86OJ7nPnn6kgKgT3iAVFA/CrP4Ss+joOCpD2pmqp78mGWJ/8Xf8pSCa+
         uGZKeHASaKnoKcS+giX3EI1tr2Uj6i15udXE9GApmffv9qgpfeoBg4AZKgU0xbwdRFq0
         Cw9uMa+TyjssV2P1Ua1UuJps5Uelyr8p5kM1kTaB8KjBkwyvUlQ7XG0yQUTXHCTLIU3h
         QxQB0lrj058pFXy6HUFeEHjxwqJE5T6EonVtsO7nM/I1lSYV8orCpoVgQtVisN5rQnI8
         JopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322087; x=1686914087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XA3XbezCgMB9jc3ic4kluul6uNj+0DU/xxzeFgKHBE=;
        b=Nq7EFQvJl7TiCpAMcC1WF5Gbn6N9Qc/jpSJlOYChjDY0FeO57hCX2jY56vUAHZp1Ev
         nZRkn+lU4YIydRSCF3U1P43a7yAFq0ZAI9DGwu4P85t/3VE3qy3fCeaH8DEIIGmzriyY
         vp4P4FxiK0+KTp2rA9Eo07XeD+tE2Dh7UqPfAeG3jrg8iusux5FrEhZv57l+byOKP5J6
         JvQ5j1MHHJb4UhZMcXiRPcV2AQ3OJAWn/juJZfcDtl4QWndcRbhvi2VSu9DsZ72i9Vbu
         ehKa++k6dg73x62TpNOSxhXAVvNq+1Vfc9c1709xCIgoyeXankjC54EC90H+yz4OWf4n
         A4sA==
X-Gm-Message-State: AC+VfDytUBRuNr39KXePwMBPjBtuod7qbXUsaWeyx7b8DfnSIsdWumX9
	+b8d7lqc4F74fy26ZEReCykqFA==
X-Google-Smtp-Source: 
 ACHHUZ68BtJy2sMkNQIbg/Wtsj1k/B1TxsFqCJyZxOarUMUtFl7IHdShMhfk+H0m0bLuqGRG3za2DA==
X-Received: by 2002:a17:907:72c7:b0:969:f677:11c8 with SMTP id
 du7-20020a17090772c700b00969f67711c8mr25495472ejc.45.1684322087476;
        Wed, 17 May 2023 04:14:47 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/12] ASoC: codecs: rt712-sdca: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:13 +0200
Message-Id: <20230517111416.424420-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3R22N72MAS5ELYC23UH6SQVLK6IPTNRI
X-Message-ID-Hash: 3R22N72MAS5ELYC23UH6SQVLK6IPTNRI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3R22N72MAS5ELYC23UH6SQVLK6IPTNRI/>
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
---
 sound/soc/codecs/rt712-sdca-sdw.c | 5 +----
 sound/soc/codecs/rt712-sdca.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 3f319459dfec..8f65516e7562 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -140,9 +140,6 @@ static int rt712_sdca_update_status(struct sdw_slave *slave,
 {
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt712->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt712->hw_init = false;
 
@@ -165,7 +162,7 @@ static int rt712_sdca_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt712->hw_init || rt712->status != SDW_SLAVE_ATTACHED)
+	if (rt712->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
index c6a94a23f46e..ff79e03118ce 100644
--- a/sound/soc/codecs/rt712-sdca.h
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -20,7 +20,6 @@ struct  rt712_sdca_priv {
 	struct regmap *mbq_regmap;
 	struct snd_soc_component *component;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

