Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947A391BC07
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 11:59:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A4122AE;
	Fri, 28 Jun 2024 11:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A4122AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719568758;
	bh=ucYPMV442p30SxLxZMrLgQRWfuQy7jPceEvUT16eTtw=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IVEhLmRrNRh8QrWglK/COTL+3zdvoSGWUmarbXxYtNSKiAz2Y3mG2jyTggMumLLK5
	 wArxil70NnkrCBySU8L2vYqhN2viU1glyXJJ+P2jhWDbxTo78wagnoHJqDP32wkB+H
	 9VGT4ZKopCW3WedW3fovowzodFegENxOEEyrkTvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49DCBF80587; Fri, 28 Jun 2024 11:58:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEEF2F80587;
	Fri, 28 Jun 2024 11:58:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77062F80495; Fri, 28 Jun 2024 11:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8239DF800E4
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 11:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8239DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gk2JcjOf
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-366e70d0330so327010f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719568715; x=1720173515;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnCrcRP7t2cWM1AO0t9JWEwOXAFYL4HbHcO1KAiAVOo=;
        b=gk2JcjOfl8WnNcyszK3jPOqYarwV8kQ0kXbSH+mJ54e0T16ueYoVf8UldLpWU9kRB7
         KwyHl2w8OWpnR+Xi0ih82zvIm1q512swgPv43+/OIvBfBCN3MO3UiIKhmRDJ/qHesFIJ
         gwWBqRUwKSge1fatb5C6HxlCX3RG9nTBfwn2xJB532w+TaIWlPwuW1RFKEKK60miqVJn
         AUD/oK4y1Uujl/e+kMUpVcULZHRv8UAC6L8vx3zTzMxNI3LrjdFBvEnN6YeeSiH5c6KW
         4iza5OMoMoxBhHEXvXD60rMGFuTStDYer+AUmk+//+NngyflRQneuJpaFzeAqga6Agmz
         MQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719568715; x=1720173515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnCrcRP7t2cWM1AO0t9JWEwOXAFYL4HbHcO1KAiAVOo=;
        b=AyNr2sLrXXt8NKRJtWbamKAKI9zBhCOzsk0yss46Yyi0q4ta0NjFicg4IiJ3RUHktv
         fFRF1BDNLnDqdIco8aHUP7UNGv/KgU3E7PHb80BB6N7cVhGk7EOxJu7EjXbhzG1HKrqy
         yox0ztaYVduaqvIn86r4Aipzrd+eY7NyMrpVcNh2IrpAl7y1efBbmfRHXtSOVRRaQK9Q
         5KPOb1kIjp+3NJVd5N7HLA5AiCOys087qTrEHQSiarB+ieZ7/ec2s6IE0XZa83lJTbta
         0jvhHewHsiOQD3NVOadDcfoNPV8l7J6F6YWPCDbvJdpF1fN6eRFA/6EQnA/3/cAojRKm
         wchA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxncXEGpcF0A0m7LdFn+URTTB10i5rrVN6S5FrghloTgti2hGNwmmbSGTtavAFNj66uKG+dqv4GQjG6Xq2VVEBXsmOFdjlbiArQuc=
X-Gm-Message-State: AOJu0YyFJdoAXlSDqOw2OLlRkepu3/31ukQv+asrACMKLOVvxCO1BZc4
	X2xMy40QpOUc/iWnHlRkS4ewuCsvYLRXKk4udPRbDSaGkmvNgfl0zZ2cAKwpugQ=
X-Google-Smtp-Source: 
 AGHT+IGj5zErCya6zo4TRvSCsMgDrJeZu+46l03p6bj9wmdPmAbzwhqn1j9jubXkm8l8eNFE6EkAUA==
X-Received: by 2002:a05:6000:156a:b0:367:434f:ca9a with SMTP id
 ffacd0b85a97d-367434fcca3mr3973868f8f.0.1719568714852;
        Fri, 28 Jun 2024 02:58:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e13d4sm1760802f8f.56.2024.06.28.02.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:58:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Fix using NULL pointer in
 probe() dev_err
Date: Fri, 28 Jun 2024 11:58:30 +0200
Message-ID: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ONK6YXF5OATUQJTL2WORJOALEA7BOUHF
X-Message-ID-Hash: ONK6YXF5OATUQJTL2WORJOALEA7BOUHF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONK6YXF5OATUQJTL2WORJOALEA7BOUHF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The 'rx->dev' is assigned closer to the end of the probe() function, so
the dev_err() must not use it - it is still NULL at this point.  Instead
there is already a local 'dev' variable.

Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 08308a63d1b7..8d4a61f7debc 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3843,7 +3843,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 				rx_2_5_defaults, sizeof(rx_2_5_defaults));
 		break;
 	default:
-		dev_err(rx->dev, "Unsupported Codec version (%d)\n", rx->codec_version);
+		dev_err(dev, "Unsupported Codec version (%d)\n", rx->codec_version);
 		ret = -EINVAL;
 		goto err;
 	}
-- 
2.43.0

