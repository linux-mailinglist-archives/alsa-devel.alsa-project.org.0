Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3432706677
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2319F828;
	Wed, 17 May 2023 13:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2319F828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322261;
	bh=gqqToe5R3xNC5wyr0vNW9VJjDx9NkWZdFijLc2DGSNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lNg8fbU0jHrY9KmhrSFa/yj2BMk0a1YSgHacq+m3xTS+25vgyr0tIdn/KqA4YrdAW
	 EVxSJlpFr97uGZ4ntZJH5uI8jEkTRqcqGBDuwv7MmaoqcD6GUUsY2UUno6fjkNfGLb
	 LNNCtCQf1LEPFjZ6QVhSp04EZw79EY5TeHnKMajc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C66A9F805C2; Wed, 17 May 2023 13:15:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF3AF805BA;
	Wed, 17 May 2023 13:15:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4EBAF8056F; Wed, 17 May 2023 13:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66023F80542
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66023F80542
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QqGyQVcP
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-96adcb66f37so113368566b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322088; x=1686914088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg++FY7yhGIzwZILizitxUpO+7bfMUehzjto7GaiR9Q=;
        b=QqGyQVcP+weCBDwAlfPGPZeH7eur+A3XKLVELVFzsWtZeDa7EsfvnyemqYCx8tfCso
         zOrofL/zOLGID7x8MwR30/XR59YqTg6r/In4AqWvuGtx74kLRZUPGQmL5hE7w4SPgqYJ
         0GUTOUkDk82Bb29FXqsk8pfyiH19q8+t5AhX17sBgZe1yZrr4CIrdBj1eN+XHUyYRDBE
         d4Xh9182yu35iRsGleQ97I/W2rPAftQCyoUARli+pbGhkOf1Ur3sk44FNy+kTqB4tEDj
         SpE+jAq8Y9nUdeVZqMOafAEPfIociyC8A8fp9Ms6a6Zb47kbcL+bF0yJw9fpE4q+6mD/
         nWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322088; x=1686914088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hg++FY7yhGIzwZILizitxUpO+7bfMUehzjto7GaiR9Q=;
        b=BNDdMk2HR5wB5PztHyrd/Ou0P3Sw56ylX94NequM4x/IIhO0NErsqyxm5KDF9IxJxF
         5drZZWy8AHLxmFjTaIDDH00JWWQuYHYvsGjIGyuatsCVPXfzUqwmw2DWOSjLHCYy+CFZ
         PMTJI7CcmJvh2cRez/qhHw0G8+twmjj2UaztwETfWZJKBnZe5ozwSvdHlfxjgaCt9X5a
         maqwB2X/iXteJbE8QV/XyjB4DjVrfn7xl2WlTEpm9ZZU3MtqBI0JEWKrT5OW10X4NKL9
         WDcATCdp4GJcRdVw6tFTVK27dx/jXJPUTFPOkZBBUM3uh8S8Q6Bkf/lJ6LCwAXRxYZat
         DGJg==
X-Gm-Message-State: AC+VfDzDcak11HWGKdVKTHLaRm1kw8sfgrW0kplfzqf6UIWqAPGlGova
	RuT5FSykRlsSyAnvf5VkTX9Fk2xHtAlfxDH5Zns=
X-Google-Smtp-Source: 
 ACHHUZ6agdt+8cNAIrQlXTt4TZimiL3AU9u8hB11RhwhOm4cME5bRrbuGTkjGC1nNc9gCeh7XqrNVw==
X-Received: by 2002:a17:907:9496:b0:96a:ff7f:692 with SMTP id
 dm22-20020a170907949600b0096aff7f0692mr10101998ejc.68.1684322088601;
        Wed, 17 May 2023 04:14:48 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/12] ASoC: codecs: rt715-sdca: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:14 +0200
Message-Id: <20230517111416.424420-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3VRYRGHNPRORD4CEPNLQLWRM7ZQZ6GXT
X-Message-ID-Hash: 3VRYRGHNPRORD4CEPNLQLWRM7ZQZ6GXT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VRYRGHNPRORD4CEPNLQLWRM7ZQZ6GXT/>
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

