Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF05990AE71
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 14:59:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2403BB65;
	Mon, 17 Jun 2024 14:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2403BB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629157;
	bh=/lItPURxNp+cgV/Wgl9KGudHbV4MInxrsKfiHjZnra4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T5Ze/LjCMC5tGuPreo0SP3YjuP6n+5tjEJAlYaPCWg+ivNKbfuIsPlJCe3LNy4k1X
	 otOYyPO6uYZCe6Im9ADYawj5jY+eFGaMbs9HVgvprqCqFi0dChIdCaHTAh/JZIPruG
	 Cyl2qY18bWPz7yiDZA2iwCGWGwaIalBeSuUlVe2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8669DF805AB; Mon, 17 Jun 2024 14:58:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45D9CF805AA;
	Mon, 17 Jun 2024 14:58:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F327F80266; Mon, 17 Jun 2024 14:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18C44F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 14:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18C44F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WNGI3uIY
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57c68c3f8adso5191408a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629059; x=1719233859;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wltUW9+VLrM5U01BwAIqP+6lmMQklBsMXf/514OJe+Q=;
        b=WNGI3uIYiJpucBouzA9lOgw10klZzWV4jZ0g7bi4xnGNraV9xZ7nB34Ilho4iOG2Nl
         hGsCaVja0Prxkg5vxwsJQXrsICidqyMlGazBjXKz98nmPQFmuiEaDQ0RBenN6u6BFDDb
         6I20R6RBUMBA4/OoiY9lZkQX3uZ2nCiJX+p4HVri7iNULjZ+4oCr5r/SUno36HE4/Pch
         JSDcw0PXI0VCkS60Sc+Wvmqo8eSTpCU33ZkZqQMVpWUr4uUPJfA+gepKYkcVRWnCfCOK
         OAEdJTrqwTGtkls0rvgHHPo33vnwwckICKeq8x/+9diuXr3j3MZ5qMhy8EDrVDrlizR4
         8xYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629059; x=1719233859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wltUW9+VLrM5U01BwAIqP+6lmMQklBsMXf/514OJe+Q=;
        b=W6ic2e8Ntn3IMMUMVdOznsqgV2Um1zW8eF8kaChAwhl3zrj7+GG7kD0SZz5dZp8ygy
         ZTVUrdyGBkn6MFNhmR+FK5fzyTLp3N0O55t54q8rP7RPW4k0QN1w3mlp8ZOld4CjLZlO
         NQ+xeZdLB9yxj85HIHVQqus6fHjzSp6wFjPA1x4my+tiCTd5XF5Wygh9DcNJacBgt+1n
         uWgsKcG538nMfU2Uaefdr8CpD7KCRMXsTmx9oiaa3OCnH1OiG6rUdVXbUC4S1cFWzAlj
         NgsInsJdO/QwwYgbSbZnovzVURy3igBK3PK+oDPQGI6oOkvwq3nPInz5Zi9R3LQezo7x
         ZuFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWt4r2HgglhNcKWFVoX40qn/TTIThp7Dn4dJRne+UM9G0mFKMtSKnZ4S2cL2aX4IBnc41dAaemG52VYA8E5kieypFnWUhTAmWQD1M=
X-Gm-Message-State: AOJu0YxEyCvr2vM8ZdLSiMrC1r66VRLAtWHOwBf629hFaMLETJtEL9BF
	ZI0wiPfyqW21jr4RkZCdSYvcu10pQ2yK97zfRHCQjqSb9GU6O7ueLvNFIV2zNXw=
X-Google-Smtp-Source: 
 AGHT+IHGYIv40eueTM2EmQXXq34NC5RI+q9LQWXTkgQPpugKqiNuOI0eJtyNgnoQfTPALXvl5fhCJg==
X-Received: by 2002:a05:6402:5204:b0:57c:db99:a131 with SMTP id
 4fb4d7f45d1cf-57cdb99a240mr4397657a12.29.1718629058691;
        Mon, 17 Jun 2024 05:57:38 -0700 (PDT)
Received: from krzk-bin.. ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb7439070sm6428860a12.85.2024.06.17.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:57:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] ASoC: soc-dai.h: Constify DAI ops
 auto_selectable_formats
Date: Mon, 17 Jun 2024 14:57:34 +0200
Message-ID: <20240617125735.582963-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KJ7HMNI7YDGYEQZGSVCEALR5HX65VHZ5
X-Message-ID-Hash: KJ7HMNI7YDGYEQZGSVCEALR5HX65VHZ5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJ7HMNI7YDGYEQZGSVCEALR5HX65VHZ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The core ASoC code does not modify contents of the
'auto_selectable_formats' array passed in 'struct snd_soc_dai_ops', so
make it const for code safety.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add Rb tag
---
 include/sound/soc-dai.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 15ef268c9845..279223c4ef5e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -361,7 +361,7 @@ struct snd_soc_dai_ops {
 	 * see
 	 *	snd_soc_dai_get_fmt()
 	 */
-	u64 *auto_selectable_formats;
+	const u64 *auto_selectable_formats;
 	int num_auto_selectable_formats;
 
 	/* probe ordering - for components with runtime dependencies */
-- 
2.43.0

