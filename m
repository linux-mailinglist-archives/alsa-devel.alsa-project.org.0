Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB8707ADC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:29:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACF5B200;
	Thu, 18 May 2023 09:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACF5B200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684394988;
	bh=S+h8VwZLYn+DOjiZOCNz1dmt7ow9GGOpPK+DR4ZZBy0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EP/GT9q0U4zM/R+udevDKB22uyBIboW39g6USQ7XklBMURpMy9QPez1VY3rus/glO
	 VtXuQC9Q1zCtTWrEbQTD0sLhgcDt5KCZfWkLEmWfqYKBjxIH4xB4PE8u/PMJo2NinL
	 VaX5K/oQLKjEatWXlPyRBGiA/cyDF7Xy9yA5hg8I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BD80F8056F; Thu, 18 May 2023 09:28:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9069F8053D;
	Thu, 18 May 2023 09:28:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3169BF80557; Thu, 18 May 2023 09:28:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D582DF8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D582DF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=d2ZscMnf
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-510b6a24946so3164900a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394877; x=1686986877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YaMbqKLIRk9uu0W+O1MKIWCGt/ANzy+JnOLOsBMnmMA=;
        b=d2ZscMnfBdkDvEdeZLpee450DeBX/+FfgbcS+tqZLb/sXioIryO9K9up6dSvxWvzXa
         CZIuhRQRaFzOHa7wkBZsM7i9QQigkDK4h5I1aHN/v0syOsFlWvnKXE6NSf5Vq9V7hQVY
         EP0yiGHSF7+SdRYP2djSjnZs1tEPKRvdKkKz3jMV/T5gCyeCVXZCpSFG6Xdbt0gzf1nj
         jbgZbZrwXo1/R4omcGB97d1FKqd59tCMFTkxz/Nh/j6NFPY0B7lPM8wRFqfaMfwBpm5L
         oRUjEe9EexnkW1VUwDY/DqhiAUovB3aMKgeOdH7o/SUSyDY2Uaebj0BkPQ64NAuMPESC
         qrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394877; x=1686986877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaMbqKLIRk9uu0W+O1MKIWCGt/ANzy+JnOLOsBMnmMA=;
        b=PK76MMd32CBKkzsvXuiO8HNddcU/aCOHeXoV7kmtn2xMmHhVvgSLPqwh5hKOu0IrCa
         1q6ukgdTkoFF/I2ZaN8/owOM6fi6nEFd9NSd9f7tOe4WR96qYHRP4yoVLfu9k/qy09m4
         MZbS8skmHwgE1jAZIiFvzJrcttw93cVMQZCegU/LwHw5NNK59gnfQRaj7hpRkzOAsBD+
         MsovdJ5xZZPNW7CPA1P0qKimnEPuuY3W/PulkanTV8bfeBNM38UmnZBGp9OVB0B83Muk
         f/IcGPkShmkdcgtoC/SIblD2lSz5tVFuiCUJw+w6QpoJa5j/fYANXu/jizgtTy0NXH1J
         BMMQ==
X-Gm-Message-State: AC+VfDw2oKwoPV1RUpEc9NG1EpzMP1lDshwV2/aHKbFiHJcav4XDuX/K
	EGj5AyupOB6I/m0Eeu5lJVWIzg==
X-Google-Smtp-Source: 
 ACHHUZ5SE+z7zBbyAA7sZJdfWN2AeIZzPJouJZzS41SDb9nbTXRDYA40EWH6G3vpDYL09eoqmSlZRA==
X-Received: by 2002:a17:907:3f25:b0:969:edf8:f73b with SMTP id
 hq37-20020a1709073f2500b00969edf8f73bmr32752432ejc.60.1684394876834;
        Thu, 18 May 2023 00:27:56 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:27:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 00/12] ASoC: codecs: do not store status in state
 containe
Date: Thu, 18 May 2023 09:27:41 +0200
Message-Id: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: POMSGWN6RMXIFYKDBMOFWUWDGG2J6UJL
X-Message-ID-Hash: POMSGWN6RMXIFYKDBMOFWUWDGG2J6UJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POMSGWN6RMXIFYKDBMOFWUWDGG2J6UJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Resend due to missing cover letter, so adding per-series tags was
not possible.

Added Rb tag.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  ASoC: codecs: rt1308: do not store status in state container
  ASoC: codecs: rt1316: do not store status in state container
  ASoC: codecs: rt1318: do not store status in state container
  ASoC: codecs: rt5682: do not store status in state container
  ASoC: codecs: rt700: do not store status in state container
  ASoC: codecs: rt711-sdca: do not store status in state container
  ASoC: codecs: rt711: do not store status in state container
  ASoC: codecs: rt712-sdca-dmic: do not store status in state container
  ASoC: codecs: rt712-sdca: do not store status in state container
  ASoC: codecs: rt715-sdca: do not store status in state container
  ASoC: codecs: rt715: do not store status in state container
  ASoC: codecs: rt722-sdca: do not store status in state container

 sound/soc/codecs/rt1308-sdw.c      | 5 +----
 sound/soc/codecs/rt1308-sdw.h      | 1 -
 sound/soc/codecs/rt1316-sdw.c      | 5 +----
 sound/soc/codecs/rt1316-sdw.h      | 1 -
 sound/soc/codecs/rt1318-sdw.c      | 5 +----
 sound/soc/codecs/rt1318-sdw.h      | 1 -
 sound/soc/codecs/rt5682-sdw.c      | 5 +----
 sound/soc/codecs/rt5682.h          | 1 -
 sound/soc/codecs/rt700-sdw.c       | 5 +----
 sound/soc/codecs/rt700.h           | 1 -
 sound/soc/codecs/rt711-sdca-sdw.c  | 5 +----
 sound/soc/codecs/rt711-sdca.h      | 1 -
 sound/soc/codecs/rt711-sdw.c       | 5 +----
 sound/soc/codecs/rt711.h           | 1 -
 sound/soc/codecs/rt712-sdca-dmic.c | 5 +----
 sound/soc/codecs/rt712-sdca-dmic.h | 1 -
 sound/soc/codecs/rt712-sdca-sdw.c  | 5 +----
 sound/soc/codecs/rt712-sdca.h      | 1 -
 sound/soc/codecs/rt715-sdca-sdw.c  | 5 +----
 sound/soc/codecs/rt715-sdca.h      | 1 -
 sound/soc/codecs/rt715-sdw.c       | 4 +---
 sound/soc/codecs/rt715.h           | 1 -
 sound/soc/codecs/rt722-sdca-sdw.c  | 5 +----
 sound/soc/codecs/rt722-sdca.h      | 1 -
 24 files changed, 12 insertions(+), 59 deletions(-)

-- 
2.34.1

