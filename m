Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D221D90588C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78270F52;
	Wed, 12 Jun 2024 18:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78270F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209296;
	bh=L7ZFNWdOudYPqFvlRankjfRpsFdGgmRFWod0+Jmn7g8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+s2Wsp3ycGUkuAUugtwalsrxqgg6PyM8ZMXtUbFSY6DsVB9kH/DrW4JAsx4MXq0y
	 IBVBkFeBpv+XhAG3vvUPIbOhMk5RqAeQMhdb6Fzn6LqslAFDyQxRfajWTTZ1y4XpL7
	 DF3R7ioksztZPsCvCGbkG58hFU5H/FGk9fPv+WjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54ECCF805F1; Wed, 12 Jun 2024 18:16:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FB96F896F9;
	Wed, 12 Jun 2024 18:16:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1843F8086C; Wed, 12 Jun 2024 18:16:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8D4FF806DE
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D4FF806DE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Qk8m+SA6
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a68b41ef3f6so9102966b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208970; x=1718813770;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIfrWBZ7ZLY2KaGKe1FyMOfZUNjl1h6UvB70qr9xbUw=;
        b=Qk8m+SA6WmRUtseTkpvMWaIzzCGkHddr+wG2OlmCG7Q4BW8ZPmwBjgfQX05jm9BrtC
         u0oTWFjB+ygFeXY5WAntHMvOv5TqviqkwoTNX1q90h8psUsAqICCKUgwV5BU41oUoix4
         x9FZWkEMSscH/ZxyFz+LN8BpGILF2Gxn7+xLswf8W3oGuMKIFYwvX+td1MFm+PLKQYEI
         M/LzAYTnOwctPGWqxFLKQjn02rjejYRxdLcdM/IsvxzniMW+0wqh0V8jfLkpO3zM3vmZ
         /5Y1VRq9/SsyHZdzuSpP3IYWNcHkSJskz8ForLH4Ko9Y9bltxMV7OZCt/+uVJJTKCf9T
         C5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208970; x=1718813770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIfrWBZ7ZLY2KaGKe1FyMOfZUNjl1h6UvB70qr9xbUw=;
        b=KstkQi9qJE6HK9/Rk4SGmRypAbUhjqBEh5y9djrltkf5IqWHSZIDZxN1Rb6LQVluS/
         byjqqH6atYmCxPZcEi9s6pOvEhQZpf6s267eJytVKl67eEKS6m2kr0rQhpzdQM2nxL1f
         1AjmreBFhjcNmhzB+QG0oEuxEkGVZTwnMeUH+bHxlj+bqXHDQHYhUDh7Z8wLUVfcdaHk
         M4ieYhjvBFknlERiV3kxzwQPF/JFT+5yRfDj6MyJYoXUAz5l8cpYuZDky0XTiDi376ge
         oJ0slICg/bV/k2ailyRIjVhVn44CYhWsimVWjPkjKIfEOuTlDeTaIY+uKpMpUDUpM4wq
         0lbQ==
X-Gm-Message-State: AOJu0YyHAKU0JIHjg52q1/Uu5+1+CBMCCE0Nr2TW+fJo4sedaHcwCQhG
	W++Ta92+XVNWWVsOtrT5oify4ZIGP4zRRaMolPCJWKWNJjWiOwigel5hNhPN3jM=
X-Google-Smtp-Source: 
 AGHT+IGSObf0l0L2zRr/AQv9YOpjrm5YjJDqPglWmuOwaiRYlRdW4JCSS3SNNzuVyfXhGmKq+JKeQw==
X-Received: by 2002:a17:906:240c:b0:a6f:f7c:5c7a with SMTP id
 a640c23a62f3a-a6f48009fcamr129872066b.67.1718208970622;
        Wed, 12 Jun 2024 09:16:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:31 +0200
Subject: [PATCH 18/23] ASoC: codecs: wcd938x: Drop unused RX/TX direction
 enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-18-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=605;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L7ZFNWdOudYPqFvlRankjfRpsFdGgmRFWod0+Jmn7g8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmnp8+JwFr9BLyBT5edp/Eaw49lg2Z4J6xVC
 SGfKz+ZVdeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJpwAKCRDBN2bmhouD
 1y43EACagGw23sHs3N4XyJvnbu2pem/kbPuMolndb3vObHn7C2gJcB4lJImAorSaETGl3R8moji
 7+UiE0M4ksdkq9A6rQOPAYl3EXd4X3QoN1IJruNg8/bLaxaNP0+MvN1oCP58DKeGgw2Iy46N/AU
 aJEAOJoyAEjkdq/d2uFGrZmljKF//Z6N7c5v5repECj1F12Ej4E9kMxnDxgsDBSU4Ki4VnoTbrk
 wefVaVxFyBh92uM63FpE8uMuTFj4I26k5vqXxbeOhgzmbMKdOssG5InJcPZRnHqnTBluKdngsbN
 ncIWO2+P9sUSwYYYF8nGUvuFcG87Frn1UQbE7K7QB9z6QMen/NACugh2jZBio9u2/3pi140/vVN
 EXu6ws+X/qu6Co+jvhGnb8Mr0ZOcNJWjYEEcJNlbjfM3RbG8qmUEBoBaYyUbkpbmBoNGiI4aPzz
 u0da8W/jNrSFqTWp4aBSrzbiGT8AtfA+ztYjbGkppEWPBTceb1IkJ7+HrLDpohpmJH89QG7Pexl
 bcs35XIj0wQ67ax4HA98ZiZOmVJKMzTljElnOsjwfLsfX+m5App7UGILUFCInTv9Tn7624Lvohm
 RVtqGqO1rZbLbeYEW/U85SRC4VtTqvLJ5cH/CHJY/0UZmWYYa1rX3na7FmuZlbKTQJzAXCpiZ6m
 y9x+UOuk1gsdjSA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: DU3TKSAJ735RTRWB3BXUBT7QTAU5DUKS
X-Message-ID-Hash: DU3TKSAJ735RTRWB3BXUBT7QTAU5DUKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DU3TKSAJ735RTRWB3BXUBT7QTAU5DUKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The enum with RX/TX soundwire direction is not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index 09e39a19fbe4..45b7de242209 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -642,10 +642,6 @@ enum wcd938x_rx_sdw_channels {
 	WCD938X_DSD_R,
 	WCD938X_DSD_L,
 };
-enum {
-	WCD938X_SDW_DIR_RX,
-	WCD938X_SDW_DIR_TX,
-};
 
 struct wcd938x_priv;
 struct wcd938x_sdw_priv {

-- 
2.43.0

