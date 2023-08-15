Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926F077CE25
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 16:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 875443E8;
	Tue, 15 Aug 2023 16:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 875443E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692109995;
	bh=7ltnRjJUQNmC9X4WGuS0hAFsmEyUXei0uZE7fAJLNds=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZTdxmlH389/dCGl943J/ybVqAGFKBrRkjFO8e5mWfj2vW2lFAVYdIffzBV46FYwbK
	 5t53k0VO2D49wyqvl6Ta7MsqagSGKrH4lsincb38Btva4Fc+m9nXTy1qBReMLiLik0
	 7B9i5cnY9F3dGWiKclPq22WdsJPIAOqh+bLyvIHY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5071F80272; Tue, 15 Aug 2023 16:32:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A204F8016A;
	Tue, 15 Aug 2023 16:32:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAF38F80254; Tue, 15 Aug 2023 16:32:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97BFCF80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 16:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97BFCF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LoYhl7NX
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe1a17f983so49659415e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 15 Aug 2023 07:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692109931; x=1692714731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xamr+VMNIiHUxs+t0NwOpENr1FFmryIpP13DFeFEEWA=;
        b=LoYhl7NX/UL3BuSxqil5bfW/WK3lS/sX7oKzuSlIs3D6b8d1vrI6S1GUJ0MljNiP1a
         Nx8m5uTAxHEOQLqP5JdVxF6Ncwzl/Ivxk8W8PGkF2r77Zp7Y5764sMNyl3G2UOrjBcHM
         ltW+nhHT5rBAB3+AgdhxwHzDSrNPJ8zyzIRrzoNAo4JTncp+6EPhzoG76abqKPOa6cZO
         Q/K6+nknXLfmorIK8dwhMOZEba6mJq+LP69fKWHeSgcUYTICHb0lsMp23zJL9bXcRzJq
         e43ggn7VpP9aTCIkopUTqDCwyLWTHpEAXAaA/gO2s+7dgfHVDsp/j6DQAu2gFBNmtvo8
         AvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692109931; x=1692714731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xamr+VMNIiHUxs+t0NwOpENr1FFmryIpP13DFeFEEWA=;
        b=Og5c0Bcpne5H+5yjcKt0fXs/E0AYCRVYYejLy63fynrE/lV7+ylaS/xtAIzBdxHBa3
         /TJuXyJDoLruNKJrofsgcqiVe0UwYpmWvdn1Ok1gvKx/WaPu59emTF6tlMQR7baVVLQL
         cs+lYYP/d9VIpmgpBfYZF53YJ65wiajev0sAxmQhkosq4BUaqzDshUJ7yQHOOW6LUZW2
         y3C3ACo95YePvkYZst7yoIFikvQ8+h+dzT5glZ1ZdlrFjFvAjVCq1Ho8h7MK3emiQiH7
         RikUQ0SFcYX8f1mXF8FYMFuwEdU/PWvtqHgOTYbpXN0wICYR1sQHrdUtKl6ODCG6DpHp
         KoIw==
X-Gm-Message-State: AOJu0Yzpwy0rT3OxNEu27nwAq36mo7vrvbRPW1x5pVBSeZzuM/RbateB
	DjIv69RDNGWq4mu5QJZ2tiO8rg==
X-Google-Smtp-Source: 
 AGHT+IF1krISD3AJXDPMTk0PBHJrfPjmRe6TLvoVjuU6BZ513y89qdOLID/M+Pv483mdRwQq//j3zw==
X-Received: by 2002:a7b:cd99:0:b0:3fe:14af:ea21 with SMTP id
 y25-20020a7bcd99000000b003fe14afea21mr9607003wmj.21.1692109931122;
        Tue, 15 Aug 2023 07:32:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id
 l11-20020a05600012cb00b003177f57e79esm5851481wrx.88.2023.08.15.07.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 07:32:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND 1/3] ASoC: codecs: tlv320aic32x4: Fix
 Wvoid-pointer-to-enum-cast warning
Date: Tue, 15 Aug 2023 16:32:02 +0200
Message-Id: <20230815143204.379708-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AJXZQGF6G2ZMKFALAWO5QRLWMPPIE2OA
X-Message-ID-Hash: AJXZQGF6G2ZMKFALAWO5QRLWMPPIE2OA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJXZQGF6G2ZMKFALAWO5QRLWMPPIE2OA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'type' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  tlv320aic32x4.c:1352:18: error: cast to smaller integer type 'enum aic32x4_type' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending because thread got duplicated/messed on the lists. I also
dropped patch for aw88261 from the series, because it was fixed other
way by Arnd.
---
 sound/soc/codecs/tlv320aic32x4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index ffe1828a4b7e..6829834a412f 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1349,7 +1349,7 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		return -ENOMEM;
 
 	aic32x4->dev = dev;
-	aic32x4->type = (enum aic32x4_type)dev_get_drvdata(dev);
+	aic32x4->type = (uintptr_t)dev_get_drvdata(dev);
 
 	dev_set_drvdata(dev, aic32x4);
 
-- 
2.34.1

