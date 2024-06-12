Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ADA905891
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:21:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 535B6E82;
	Wed, 12 Jun 2024 18:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 535B6E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209315;
	bh=kdpxzyNuweZKr0aRSDH2rz6ZRs35AU6E2D86EkplPOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r6YAB7D8FKYRhvUkWmM/SqUOLvPU/OI9huy3kQZDKmdmUI9k3kNkAODnxfhtmHQJB
	 tXm+KgaVBoupvfn543aVu6EolckPLcQmgsALxTjgqXGyFXgVfLLuJoLfmjVD7GFN06
	 /L7yUKjE2h3FcT9z3U9YW/YfnxT5RRRvdemmYG1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68CA0F8971A; Wed, 12 Jun 2024 18:16:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C85EF805E1;
	Wed, 12 Jun 2024 18:16:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B32F8085B; Wed, 12 Jun 2024 18:16:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9441F8075A
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9441F8075A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NGbCljC7
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6f0c3d0792so5777566b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208977; x=1718813777;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZaOcybsRppKpT5g6NO45LPBfW4VWvjoUX43728185g=;
        b=NGbCljC7qgMGPP3jEl/cTk2824xx+WEHCRyvSoNsmD4qIldgoMl0NMNHbb1NoLXcr/
         5Kar0krw/ZxBsg+b7c3Pq9kRwcrgtES/uS1uaxBvhjQyH9BIK9YW5LnOhLQhRil8qutZ
         +4eALfeSjv43CCxMV6FlwRU47B+xI2IT02mScoanwjIZ/8lLO6J2/oiTEvPx0dyGVONS
         SaGv4g1DaWvP4fWr8kIQ+tjh9rxfEmu9k4VcbWX4jRSNb6SbeTbP4RZ41shUYpDSIisI
         tYqfbiV2funAhchj8nEDcH8OaYtYRoxxQumcC2ciYlrAdWSfWClSsmOXLXxTEkyoaqrw
         kbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208977; x=1718813777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZaOcybsRppKpT5g6NO45LPBfW4VWvjoUX43728185g=;
        b=B/rCBv/kbZHHfBFtlgaxveMrYjMmYVAr07k4swN3diHS27m0MDqJBUimyhzYAnKZHz
         02C/Y/AHSXimuDvokOpgUAWu8B/FKBf3rVXrEenSbTv2/ErkXpVlPZhl7iKWH2LOHSzj
         UjRMMgK4LBN/44uzpY4sNHhbG9efcET/OANxE5wAjJIGIez7HulEN8MUcyFXigkjGMFm
         W/s9T+QBhZmDAroQp3dd+lHc821pWk7wbHxsYixKQjM/ILxCjwTQGD+BgEe6APUwQ3jS
         Nyp8WkuClevuEsarpVPZnmjEwMKpUX5aOe4fFYQi1OxCIF4sHy8Rm+vG8Z9JeveYpKtm
         FKuA==
X-Gm-Message-State: AOJu0YwAIzvnzgnfhK6l8hScQ178IyQMw8EKHF1bubGyXENOyxMtI63W
	eoTPSG2TQp56r01EyhrmU7BOpwvGYI97tdjo8r9lIdiBr/TGVA5+6/SbJPkB/h4=
X-Google-Smtp-Source: 
 AGHT+IGBStgBwHDaeCOJIdElnx3jY9hewrQLo1+/oRczrEHocXLAooxE3WopQIuwsEkaMPbx5CZtUw==
X-Received: by 2002:a17:906:1ccf:b0:a6e:d339:c095 with SMTP id
 a640c23a62f3a-a6f47d56e10mr143448266b.47.1718208976945;
        Wed, 12 Jun 2024 09:16:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:35 +0200
Subject: [PATCH 22/23] ASoC: codecs: wcd939x: Drop unused RX/TX direction
 enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-22-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=623;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kdpxzyNuweZKr0aRSDH2rz6ZRs35AU6E2D86EkplPOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmqTiI7/MPDpOR/QPOCYLLqnTtbJ9lWR7mV2
 wJ7BGfzhXeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJqgAKCRDBN2bmhouD
 13e4D/0ZkltMoAyKX0mzksxtBOvUUWkNcgLlpCvNqdmlMIhR/r8kKBSwdJQOS7fvCxRSbJXVPjC
 m/7fMpyDfcF5VUMWPlZzObRfzr8W/odYj0k1t0TmXbAEUE5AG+/XqjQfv5VSJnlz9AlEFemViYR
 THjQKv2vWpVBVtWPfcQktJBaM56Tg+uN4uix+o4fccx2ZgmtV2fTn83UkubIbS7zRqQLIw0n21b
 qg77mcw7AdaW2uhqZjeo/NdlzsdyQxAR4gGfSmGIhq+OwP6xSd1CGDCknjPwVuWjK9XBso3qpdr
 NaTolQ9xCwPFpHERkFINSC+klwCJwlz25ESPB5SWzAFXC+W6ZvM3RNYjA5Tu1ZbhHXYDT0M/Qfs
 OhbPOuGRRUljpD1Z5pfwRR6kJhl/Toaj+UTz/VD4uGwnvUeFbnCgL3ftsmdOqJjG3hLwKoGJmSM
 RtRQCqxWIv/WvcOyG9c3qD2HnBsg6JYn/zIM539PqLbXzq2sui7zNaPY8NnzYwBZVdBAqCY6ity
 ceczjgqxXDBIbm7Cd+DUHClBXhgurZiEeRRHTzzlh3Gvk4/Rc9X3wD7MtBrk5/bsBNo+9ue5zfS
 NHK5FKcXGJlddS0XtxjxoSaXHaAbQwSHpGCsFyQnas6U36X3Wv0C2vARmWWXlEQEYT1q5DGBTgv
 KRWlakkVEDkoy2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: BUMHUU7PHOV5HKNYYF4GRAPKKY7UQEBK
X-Message-ID-Hash: BUMHUU7PHOV5HKNYYF4GRAPKKY7UQEBK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUMHUU7PHOV5HKNYYF4GRAPKKY7UQEBK/>
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
 sound/soc/codecs/wcd939x.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index a6c9c6cee056..0aa4d9d542c6 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -903,11 +903,6 @@ enum wcd939x_rx_sdw_channels {
 	WCD939X_HIFI_PCM_R,
 };
 
-enum {
-	WCD939X_SDW_DIR_RX,
-	WCD939X_SDW_DIR_TX,
-};
-
 struct wcd939x_priv;
 struct wcd939x_sdw_priv {
 	struct sdw_slave *sdev;

-- 
2.43.0

