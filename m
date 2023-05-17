Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF45706673
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76ABB1F7;
	Wed, 17 May 2023 13:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76ABB1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322225;
	bh=WQAEl/gZZ5NDWQLu66XAjj06GOPtDZqOY+L7Y6XaC2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j9MxSgaiVgBGh+MW2Dr+FgzgLh/+jay8ZtUdufqAc/pT2b1eykzZal2+YldNo00kL
	 TXgWiovvKKTgZrsqlCAfy/HWfPn9JRpgckUdwPKJq0JkPVVywWCFtG76EWa1J4i2+S
	 F/sMzEuoH9kAWT7OiQ09zsP4zkPUPTOA+7NHZye8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DB64F80587; Wed, 17 May 2023 13:15:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC761F80589;
	Wed, 17 May 2023 13:15:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5971EF80551; Wed, 17 May 2023 13:14:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E2AEF80431
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E2AEF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jbpNsTPc
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9659443fb56so88803066b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322083; x=1686914083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Djo3KigDLCeskb1s75wtfFqne73QM8Ssl3dvuMpTj8I=;
        b=jbpNsTPcndoFQHxB+zZE1pvWH6PB3oOk0GGSHncVFq60Pzl6/guO3elUgCzUb1JJ+Q
         PQViAH4X+DushQPeB5Y5oeEEQEDP3KD/iPA0Ba77Q1ahp2/9sa+QlD2OOprF3UBIrBJ6
         34Co2bwv+wutKc8XkhQCkHobGDC9RF38e1IxFFGN4RV19S759tGHdeMOdsqFQ1G9bmcS
         WMgKTAtKG1OC927Cy8zgj0w2ELDbAcK4InSxId+JgPETgPIQcBnlUrIIJMJ9OC+DHO8p
         SsFH+tQwFz9uLp9jUA7Jb7HwfnADeDu7jdutszLl1wIveRUC8OV4jK+Iw0uwUZ86jtUx
         Zl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322083; x=1686914083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Djo3KigDLCeskb1s75wtfFqne73QM8Ssl3dvuMpTj8I=;
        b=dQqud5ADgnfy+yL5tYD0aNzRskAHdie7JndnjyU2z/CWGErQM6p3J0sNSaICwtGIwO
         TsFzaRn1Rg5mJ856a8E90eJS6KoSXiK+rDBQTG0NM89kZ83mYDH2yx0oMf4OyIZFrfgr
         sRuw1vBBSybMQwQumuq+KfFW6ixdA6osdx0ptVpVz2cpoTDv+eWBSYJHc5/JqU/QQVD0
         hVFtuFTR0GvPtiZB2AS4UJeLBXKSkCh9hdJ70DI231oNljdiP0vSiN5wJpZ2H65uzsGs
         5oHUUBpdMMrAepZRIFoh1AxZn+xf45mTdgcD/7DW5vtBgfJhKsx7enAyi202joeicF7/
         O7Dw==
X-Gm-Message-State: AC+VfDw0BrXaHRs2a3gEWAWNEpi3hGueoOyUrrRp7j0UimoifgZ/2RAp
	4/k/jM736E2Czke9pAUjaPryLQ==
X-Google-Smtp-Source: 
 ACHHUZ5mFQSEguv8gaktTRSSdWDKj7/SzUCfiPmUxPkyuqet8SRiloCcTWaYK0ZnTY5zuXJpdG1PxQ==
X-Received: by 2002:a17:907:940e:b0:94e:e5fe:b54f with SMTP id
 dk14-20020a170907940e00b0094ee5feb54fmr36761324ejc.23.1684322083094;
        Wed, 17 May 2023 04:14:43 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/12] ASoC: codecs: rt700: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:09 +0200
Message-Id: <20230517111416.424420-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W7467CMCAKB7SZEDJKHQNXRI2ULN4OUF
X-Message-ID-Hash: W7467CMCAKB7SZEDJKHQNXRI2ULN4OUF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7467CMCAKB7SZEDJKHQNXRI2ULN4OUF/>
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
 sound/soc/codecs/rt700-sdw.c | 5 +----
 sound/soc/codecs/rt700.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 96fc5f36d0d0..ba7767bee07c 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -315,9 +315,6 @@ static int rt700_update_status(struct sdw_slave *slave,
 {
 	struct rt700_priv *rt700 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt700->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt700->hw_init = false;
 
@@ -325,7 +322,7 @@ static int rt700_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt700->hw_init || rt700->status != SDW_SLAVE_ATTACHED)
+	if (rt700->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt700.h b/sound/soc/codecs/rt700.h
index 93c44005d38c..491774d207de 100644
--- a/sound/soc/codecs/rt700.h
+++ b/sound/soc/codecs/rt700.h
@@ -15,7 +15,6 @@ struct  rt700_priv {
 	struct regmap *regmap;
 	struct regmap *sdw_regmap;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

