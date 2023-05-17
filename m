Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D6B706689
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4ECE3E8;
	Wed, 17 May 2023 13:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4ECE3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322407;
	bh=ErUVptLwjAWleKLanlVJn6PN6qQXAwVR/mzA1LzGfRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ck5T0wuau6NCA5O+EZE7d4j4/IdoOtjepoPCVOxaw3vrRtBknyPPULZFufGIAn9O+
	 pZuboblAQs12T82ijJC47miDiI+Vy5rTKJ4+UAQdsN0ZTKHgm8gCDlolBr7WE1FG4y
	 v7jzGnLfpQU2dTX1PKgGLKNXfOr7ksj68ay/PNTk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FB75F8016A; Wed, 17 May 2023 13:17:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2EDFF8025A;
	Wed, 17 May 2023 13:17:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46761F80272; Wed, 17 May 2023 13:17:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE443F802E8
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE443F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qT9Hm+vi
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-965ab8ed1fcso104502266b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322084; x=1686914084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsBtC5TfGJN3p6qkzFAO4W1v8Rx/+dqGizHb8O0Kemg=;
        b=qT9Hm+viZyjnW7qF9Tzwr3hYeysA5pkm7FIUW8J6gLL8bgZy2Q3yNgT634YhZqiWXt
         k2MqRXHxAe+PmDwkPQUqE8iTWCPWWgWZ7Wrp9BSGk5BYbqOcg/HArsgi2gSe+eokW/uP
         iQwAHoCP7iIxVJnUnRHW5XQJz542/vhvdUCwqUSrfLrEQHWEZ5BSbEvKAJPBMGE/8A6f
         Vc6MBE0s/VAxY6GIBGVXRP+JaPbiASGjXUx4NRGq4FVtjNwFwDg7H+eaoVlSN/ht3ZUJ
         qubKLdGAGqj8EOn9uTpWMtNq0g5Hruw9Bog2kjlwZ3GWxs/IvHpul99eqw1y/f+zgmr8
         Dqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322084; x=1686914084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsBtC5TfGJN3p6qkzFAO4W1v8Rx/+dqGizHb8O0Kemg=;
        b=K5SAFfzC69oKarYmcjB8Us32OFpwhJXjhgT2Nyd4MKoDBEH13bQVDWPVflNzzmvMSW
         rGfvhCCpSKRYVXsV8tIboWtNA/6GCZbFGfuM4+1DkGt9Uze++VYqk1f527dg48lkP3iQ
         C+33r0gYiYhL6Tp+NTyGzzMzbQnrCj3E0402RtXr6UpcHLIX+1AoWOsOe/85Sgyjc1iC
         GVtFjTMA2LXB63b1rzHkpXf0cZNzReP07rLKIThbMg0m3z7ipNDxMrD+eEGiSzxgBZOH
         C2ep8HlTkXnAjuL33l2ct2V3/lU7z7A6EHkuNIP2v+xISv/6393fErKVILO/t9ns1Jto
         0r7w==
X-Gm-Message-State: AC+VfDy1CBfQlqKwpHU+ILn4y7b6dQEy9TlVHFLYggx4uPGcBb6oRbtK
	YpqJBvXQQOvF8qiA9BGCmhZJAQ==
X-Google-Smtp-Source: 
 ACHHUZ7mlo6nRWUJn035zVTJntmQFAoQhlG3G9/1Y3edyg3inGAnP3I4evAsUjOZr5Yt9vQpd/Zwjg==
X-Received: by 2002:a17:907:5c7:b0:961:be96:b0e6 with SMTP id
 wg7-20020a17090705c700b00961be96b0e6mr34403065ejb.68.1684322084257;
        Wed, 17 May 2023 04:14:44 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/12] ASoC: codecs: rt711-sdca: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:10 +0200
Message-Id: <20230517111416.424420-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XJJUQU7BEYLP3RJS5WR5GAIK3J5LBFXV
X-Message-ID-Hash: XJJUQU7BEYLP3RJS5WR5GAIK3J5LBFXV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJJUQU7BEYLP3RJS5WR5GAIK3J5LBFXV/>
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
 sound/soc/codecs/rt711-sdca-sdw.c | 5 +----
 sound/soc/codecs/rt711-sdca.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 51f3335343e0..2c5eb28259dc 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -143,9 +143,6 @@ static int rt711_sdca_update_status(struct sdw_slave *slave,
 {
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt711->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt711->hw_init = false;
 
@@ -168,7 +165,7 @@ static int rt711_sdca_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt711->hw_init || rt711->status != SDW_SLAVE_ATTACHED)
+	if (rt711->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 22076f268577..11d421e8ab2b 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -19,7 +19,6 @@ struct  rt711_sdca_priv {
 	struct regmap *regmap, *mbq_regmap;
 	struct snd_soc_component *component;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

