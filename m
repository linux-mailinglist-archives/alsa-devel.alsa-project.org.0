Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09517706670
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618B33E7;
	Wed, 17 May 2023 13:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618B33E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322201;
	bh=RvpHwH01qmPYAihvG2vJZiuCzGTzttgPxBWb44p2wLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mxGgICFmyNp+6HhdwiwyVDNqYdOAydAUsqRDAfMgYx7ILbJ8YTyovNxxhxQXAPnYE
	 ONPJOCziCZ5ysn3lhGOLvwnzkDTZ31Fy2XKuIkphvsAUi0vSDKzZ818kx9gngvWSkC
	 F0LPRqwBR8fiybfPPM58vqmL9MmGUcJbnJ7i5TJA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB34FF80579; Wed, 17 May 2023 13:15:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0E3EF8016D;
	Wed, 17 May 2023 13:15:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3270CF80548; Wed, 17 May 2023 13:14:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E2B59F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B59F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Xtqjci4X
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9661047f8b8so107440666b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322080; x=1686914080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAqmALiwc11sAnAJSge5XtvJDOci8R9bv0tfhhHhu0U=;
        b=Xtqjci4XXLDyaSfLmoL3GH9a66Wn20m9qX10IAhmV5YCbC9FqW/gSQhxvp8mMTJpNE
         OeovLhwFZuK2cGjdqe0dZkA9Ub46RgWo31XNE4W8793NsgsxRjrvggmNki0sdcC711fF
         f4VYa5bA9X8UtiOddbUZ+4s80EGBHLCOYPLlv7FjFz++siY4Rfl+xFnUnRq5tDfWMf88
         AcFqRubiMXgUBXyoKYD71Q1lzNzWT1TNX/S9RO0oqx8xKSTXTVnILq8W6YCY/mTaNHVz
         fV3YGEd2vKyHx/ryBmYY5Q105wjikO7EQ32VB9OLbL2lkz05+s6dOtVtyoXpk67lVD61
         iSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322080; x=1686914080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAqmALiwc11sAnAJSge5XtvJDOci8R9bv0tfhhHhu0U=;
        b=i04NwTa279p7D9h9H1r5/IgKc1le71MK4gGEJULNV/OKDxzJdoovWOvMOI+/v8krgJ
         Md/JEA6sNl8TGEg3E53W+oE5YudTD7QU7H+nErUMK10W715JztvChViTW33Lvwkopcnn
         ax7qISaDhOXYIGH2KnQTLejO0VetXcp2pD4Akxjsayw+e8ztuIqGphO/w3G9WxGEZIZW
         QOsqcXo4/AOnGJHVdjy1uLgR8+P/teWYxOkPGdB1GfXB2BvLYIN02SIWvWdKiJL8N78b
         LMQZhBHFeZE/KDiiZxObAz0XwKIVv0SrARo88jNcdryTqDHLGfxrmuXSpXqWknAU0mio
         tY6w==
X-Gm-Message-State: AC+VfDzskOxsSuLtX6sQw9hPe20bZ2pd9KKHxslXR2menJc8hUZAuRdS
	BRPpoBrUehGQxC4PevI/C2H8og==
X-Google-Smtp-Source: 
 ACHHUZ6HWoBfX2XrD7IXrL+hJZA8QoR0fr8+uZLTZShrjMYmoYmQnhgXL7NPlQyHhFag68Tv7SlmAQ==
X-Received: by 2002:a17:907:1614:b0:8a5:8620:575 with SMTP id
 hb20-20020a170907161400b008a586200575mr38600206ejc.3.1684322079941;
        Wed, 17 May 2023 04:14:39 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/12] ASoC: codecs: rt1316: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:06 +0200
Message-Id: <20230517111416.424420-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CCAAXSV6VCX472LGHHO7LCGPYLSO47Y2
X-Message-ID-Hash: CCAAXSV6VCX472LGHHO7LCGPYLSO47Y2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCAAXSV6VCX472LGHHO7LCGPYLSO47Y2/>
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
 sound/soc/codecs/rt1316-sdw.c | 5 +----
 sound/soc/codecs/rt1316-sdw.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 2ee5e763e345..601b76320124 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -323,9 +323,6 @@ static int rt1316_update_status(struct sdw_slave *slave,
 {
 	struct  rt1316_sdw_priv *rt1316 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt1316->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt1316->hw_init = false;
 
@@ -333,7 +330,7 @@ static int rt1316_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt1316->hw_init || rt1316->status != SDW_SLAVE_ATTACHED)
+	if (rt1316->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt1316-sdw.h b/sound/soc/codecs/rt1316-sdw.h
index e37121655bc1..dc1bfe40edd3 100644
--- a/sound/soc/codecs/rt1316-sdw.h
+++ b/sound/soc/codecs/rt1316-sdw.h
@@ -42,7 +42,6 @@ struct rt1316_sdw_priv {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
 	struct sdw_slave *sdw_slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

