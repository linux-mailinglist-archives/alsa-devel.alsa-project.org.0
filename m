Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A32EA7B0F1E
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 00:51:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9CE2DF0;
	Thu, 28 Sep 2023 00:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9CE2DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695855074;
	bh=T3q9QLabZEYd0hmVe8qpe5pzEaN/xwj2bJFEP461rzg=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Topk0H7rHfGkFVb/A4JHTGiNcoxhbEtU7gdcoLJt/w8FnF00BRl/NlfzyR1/3ft76
	 0sdpOtBf75AQG1NJeXbTqnR0/GfsVfkZWvFNLU4E1cKMYMMtLdBXbz/+pS6Zrd/qBW
	 bUAniiXVo3PbH3KgUx+MP071/n+nThcbkId8Z8E0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11CC4F8057D; Thu, 28 Sep 2023 00:49:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD323F8056F;
	Thu, 28 Sep 2023 00:49:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDE8DF801D5; Thu, 28 Sep 2023 00:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61A85F800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 00:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61A85F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BNU5/kGd
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50435a9f800so18780633e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854835; x=1696459635;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dCKjjzeijbdTSPrO4ZzfLQv8741SuwD/1oOGQ2gAfc=;
        b=BNU5/kGdagSHqnm9G21qUcVd8gWpUpTsedu1Lq45yxuJBHqZo4DN4Tj+Ae3rLh/UVN
         WMXGzaE7rSM500pesH526m+uYaLs0dKuPkXuzpUoL17eMy77OGPWzXdwTgbaF3lHvp61
         txTTpoCOHZzcxiHr1UNZ7tSR+tACdL3CVwOakXDJEQ6ZDVjJrpEyWEBbKMPEnkWVVW6Q
         ZinbvexekFNTv+gedqwr5OvhFoQ1j2XBXonQj1ysxKQN9D/hxtXa5Mys0KZOUf0kfJ8Q
         KDeZHFgpFn9YdkTW7YoAjc3o2OSOIrEaxT5sGvqcqU4PdD3KazI3lUNeBO3ksI2xivzq
         G8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854835; x=1696459635;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dCKjjzeijbdTSPrO4ZzfLQv8741SuwD/1oOGQ2gAfc=;
        b=qTrmyh1z7GHl4KqAUTkiqyG85OeCGMxJpaY9leSuCaOSz0sUNKh0TI6aDkGwwFK9Yw
         qMqkKtzIfQL6hLCvNPft0BV5MOaUjU+irXk2mVlFcuQ0Ozyn860ualGZzDA9jatuR2ee
         53TNprNd6UlCkf6vCMiU9YAqonIxeFSJR3q8HwwmI2aGKHuNcaguoO6ORfltdEmnWEDM
         90sE4eLs8oL/u+v82zIM9bChz7lKHpeZX1NKdM9w+R8AOt3NshA91N5mDZWRFrm1uKxx
         YF3NMde7+uaYSGZhT5aHL1E4q4KQae2e+MI8MJXRFys5wTGYv7Uh8TpkpTADPb7/yjCJ
         op1A==
X-Gm-Message-State: AOJu0Yy68086+t08TRD9RaUa6va3N0J8iH2Kzpk6H+C3AzMgSAbvHGfO
	J2WcYbd6BARR6ULJ4YsXsfoIxw==
X-Google-Smtp-Source: 
 AGHT+IGhFAuBK5ertcQ4xkq/eaYTwDXePJsXKH8GWiwuuhP409Sx4xS0GQOcgVKOghVztPKWhY3JxQ==
X-Received: by 2002:a05:6512:3c88:b0:500:8f66:5941 with SMTP id
 h8-20020a0565123c8800b005008f665941mr3683799lfv.50.1695854835087;
        Wed, 27 Sep 2023 15:47:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] Convert Rockchip ASoC drivers to GPIO descriptors
Date: Thu, 28 Sep 2023 00:47:13 +0200
Message-Id: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPGwFGUC/x3MTQqEMAxA4atI1hPQVpyfqwyzqDHVINiSyCAU7
 25x+S3eK2CswgafpoDyX0zSVtE9GqAlbDOjTNXgWufbtxtwYiOVvCc1DJYINdFKi2R8eR/6ONK
 Tugi1z8pRjvv9/Z3nBWpkjGZrAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: YRM7FQ3Q3R6IKNRZAAHPFKHHRXCNC5OJ
X-Message-ID-Hash: YRM7FQ3Q3R6IKNRZAAHPFKHHRXCNC5OJ
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRM7FQ3Q3R6IKNRZAAHPFKHHRXCNC5OJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Rockchip drivers are pretty straight-forward to convert
over to using GPIO descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (4):
      ASoC: rockchip: Convert RK3288 HDMI to GPIO descriptors
      ASoC: rockchip: Drop includes from RK3399
      ASoC: rockchip: Drop includes from Rockchip MAX98090
      ASoC: rockchip: Drop includes from Rockchip RT5645

 sound/soc/rockchip/rk3288_hdmi_analog.c | 54 +++++++++++----------------------
 sound/soc/rockchip/rk3399_gru_sound.c   |  2 --
 sound/soc/rockchip/rockchip_max98090.c  |  2 --
 sound/soc/rockchip/rockchip_rt5645.c    |  2 --
 4 files changed, 17 insertions(+), 43 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230926-descriptors-asoc-rockchip-833a4fbc7c1f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

