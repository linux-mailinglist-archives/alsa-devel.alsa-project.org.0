Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CB92BED2
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C84210D;
	Tue,  9 Jul 2024 17:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C84210D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540368;
	bh=UWrN4K6qjuTz47KoIpXFDK4A5Ll6v6S2fwyFXTvplLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=to1LRTijWVE2X5fFhsm9U4upLyg7ZqlQ2E9kAMfNcdXvT+1R5ZF1dB3taoQEpobV8
	 6cBzRFjEv79VLJsRpAxB1PqHwjUB1N+duEN17z6t6QQ5YY1bcddsQZr96JJtOcgi47
	 mCcgJak1tQmOA4PF0qOiEaiqZmDtA+j6BJcdsMRU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 572E6F80834; Tue,  9 Jul 2024 17:49:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52733F8085A;
	Tue,  9 Jul 2024 17:49:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FC58F8025E; Wed,  3 Jul 2024 18:21:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5106F800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5106F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AzVis0v4
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7541fad560so261994566b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023685; x=1720628485;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ls7x37QW2OZP1luBkaxPMKRrBAXpPPDVacZ21UQ0RHQ=;
        b=AzVis0v4SG8/lL8cWQv2pZwdUydeoylSlLw4dX2JyzVQGyC+omX/z84nV56Psk0MBh
         xKRPPspIPV+oyBUYN2lExH77059duzLKDW/05dvBy0/YRzcIpBfGkcNMMs0WAE2n+Usb
         Z4Or1xU8YhwtaUg5RWrwUf04ctCYJkO8I3JJ+RUOCeFWLBQV3pkcLyPiy/JOVCm6P6FE
         5Nc7/ptw310Ww0zMw7zB7z/JhLLF26q+tAx3MEw2khLf1qQhQxREpZ7C4dJ0FZc6aaQt
         JBbJWCneA4rGdukXShifI90bySP8nlL1cHc34dJJUAggnENw2C1DpSRLMqrFnTvKk/F1
         NYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023685; x=1720628485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ls7x37QW2OZP1luBkaxPMKRrBAXpPPDVacZ21UQ0RHQ=;
        b=uU7YgQ+1PhuF7rO4Bw2mtQ17eHqBvWxFcCAqOS9wBaoUIv/op6eezy2etmegpfnKWV
         mN7RCIDhjAzEM3Lg3JIWqPbPsfsBvajWdjhow2mp4A1zg2KCAbTT2DS9zCANc+xJKpok
         Y+nErbDYUPL1hqjEmi/tJxik1DvtI4rPpJ7tQb9A0y//p6/sAmOxAQddihLqhtP/OdFM
         ZteICoZV84geUR4Cb7mvh8G/ugVfPHfEYqlrRu0Sa+jQsHiS5gGbjqPKAfAEnzKTVsU5
         n9Dtz94A6+tzvIXSNYVLweckU47ySNlpZZHlpy7LQ5w5JfRE8E2b6xyICjfaUAUzW1vs
         5V3A==
X-Gm-Message-State: AOJu0YxYtjZ0GbnvZDrmY7cycd+3gVIPcfZuXYNNo6boPy42N/6O9xYd
	CwoJCG2EUaqnJisSfuMe3SK6q+x9TysxIxiOhinKVyUsJKhqAoON
X-Google-Smtp-Source: 
 AGHT+IH3KtVxb1RXbdA+tF59cEFxwUxKJCQZJx1M2KXh/7MQ2cvy+B3uUMbqNlFWoBgWJfCyF+/PXw==
X-Received: by 2002:a17:907:bb8e:b0:a72:7a70:f2e3 with SMTP id
 a640c23a62f3a-a7514451af5mr739438966b.39.1720023685462;
        Wed, 03 Jul 2024 09:21:25 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:05 +0200
Subject: [PATCH 9/9] ASoC: wsa884x: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-9-2e379b0446a7@gmail.com>
References: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
In-Reply-To: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=805;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=UWrN4K6qjuTz47KoIpXFDK4A5Ll6v6S2fwyFXTvplLY=;
 b=BXiOa8yT0md+TYJMO7aeLvPGVNstnbedA/eZZmINNVk+XuhDq0zcoUBvoi/zBaEPZkZIXNv9f
 HB4xJOaaxUvB6lwjn4AqWy6yxO6MsVN7JlQK8Crm73HuJV0QvwLbjKU
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XGPMQOMDCO4AJA4WK74YJP2CX3CCDIZS
X-Message-ID-Hash: XGPMQOMDCO4AJA4WK74YJP2CX3CCDIZS
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:48:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGPMQOMDCO4AJA4WK74YJP2CX3CCDIZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`wsa884x_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/wsa884x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a6034547b4f3..d17ae17b2938 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1319,7 +1319,7 @@ static bool wsa884x_volatile_register(struct device *dev, unsigned int reg)
 	return wsa884x_readonly_register(dev, reg);
 }
 
-static struct regmap_config wsa884x_regmap_config = {
+static const struct regmap_config wsa884x_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,

-- 
2.40.1

