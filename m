Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 072047B283D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 00:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EB5CBC0;
	Fri, 29 Sep 2023 00:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EB5CBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695939244;
	bh=a+y8xbiYPy5idDNLFyX2nsxR4rx6ATSe8RjGqbv8dE0=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=h/sagH6hPY7CJ3E8yyurzH9RblVIynPEOjQHHikfSLw10ebIslfYfVPlAZl8OVVFE
	 gvkP3dC0+/1El1TADF5hiQH+iHWFPAa0y4KtN01DkHuvgPggeoa6ctZ8ncQa6xZEL+
	 KwIIRj35LQtN180j4pQt6Chv9RdlVKOiLQUM94/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C39AF80553; Fri, 29 Sep 2023 00:13:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D392BF8047D;
	Fri, 29 Sep 2023 00:13:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31717F80290; Fri, 29 Sep 2023 00:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3CA2F80166
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 00:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3CA2F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VFLJD8Na
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50308217223so21136647e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Sep 2023 15:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939176; x=1696543976;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6rklr6oFZBRP3XLshOSG7uTOA1JIwCF+2vk+UW3dq0=;
        b=VFLJD8NaGs6CGYn+xpSUtsoDE2uG7EBouEd2w1KwkUfbObQMnMSYi4u96lwYqEcBTU
         fdFC00JQO8JCp/KhRAl/oGSOKLkJiiWoaGSAzEOSVm+tsJb/ls4RGkAq57YHe4yCUVh4
         KBYFLPpuBBzssV4l8KIlOn58IWmWYQchOn8Awd9PftISC8GUxeeWzcoHabJ9c2+My9dU
         m9Su8LmXLs+3dHk/XSX1Z8jYkEX6azIyoisrS1egMyYCESV0/MAqgCIwhgP3agxR6Uy7
         cz6v17E0muK9LEzFi1M4SA0bi6ge3Qkg6Uf/Dm6kRXIxZIESrHe7TuZx43u5Uw7smezi
         oEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939176; x=1696543976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6rklr6oFZBRP3XLshOSG7uTOA1JIwCF+2vk+UW3dq0=;
        b=lcfCOGQEjMeQL7uwdZAEYhCyYeK2xdr1ZGJ3VuvlT920DjVZeiqyQI/ty2XeTtiJhQ
         mcgiG8k3FEF+T6qKzl1AIBhjCIaxNhrvt+4QNgA3Z/apqM9X1A6oN2IYiGhY+n24ugj9
         giGaDAeOYevJfWGLvovXQJfaBlourypkfpxlfzIPi2UzmLGl94HCgd49KwBlQMsygWsw
         6vKEBV0jXIO2bvfgm+THwI9VgufxFGvwLB4bZdqxC947WFBAPaWPHp1jKCUWgfUQmnMc
         LzFgmb6V78ehyLCiGkok1e5hfe84A/VXTGPDxT8qBJvn1Lsxf6pr6HyL/ja2aKJmtlxm
         uXpw==
X-Gm-Message-State: AOJu0YyuLLeSWw+s28OsGxLkYpe1ERqTJHTYmrY9y5BQl2/3CqCXrGau
	O9ew9sFEvU+kgb6gECJqH+ziyS3RNngw1lTNnKE=
X-Google-Smtp-Source: 
 AGHT+IGS4laI4UHVLnIkjLSrMRmia+rD8yaRDC1PhmkavvJYotFSmpNaF2s2LDwJ/U3xrGw2O5pC9A==
X-Received: by 2002:a05:6512:3095:b0:500:94c5:6e06 with SMTP id
 z21-20020a056512309500b0050094c56e06mr2394386lfd.56.1695939176271;
        Thu, 28 Sep 2023 15:12:56 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/4] Convert Rockchip ASoC drivers to GPIO descriptors
Date: Fri, 29 Sep 2023 00:12:53 +0200
Message-Id: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGX6FWUC/32NQQ6CMBBFr0Jm7RhaGkFX3MOwqEOBiYY2M4ZoC
 He3krh1+X7y3l9Bg3BQuBQrSFhYOc4Z7KEAmvw8BuQ+M9jSVuXZnrAPSsLpGUXRaySUSHeaOGF
 TVd4NN6rJDJD9JGHg196+dpkn1my996vFfNdftflTXQyW6I2z3tne1U3dPnj2Eo9RRui2bfsAI
 fpisMMAAAA=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: KYDH3N3KFN4A43CUSSF7BZVU2NRNLOOJ
X-Message-ID-Hash: KYDH3N3KFN4A43CUSSF7BZVU2NRNLOOJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYDH3N3KFN4A43CUSSF7BZVU2NRNLOOJ/>
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
Changes in v2:
- Make the GPIOs properly optional in the first patch, preserving the
  old semantics of the driver.
- Link to v1: https://lore.kernel.org/r/20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org

---
Linus Walleij (4):
      ASoC: rockchip: Convert RK3288 HDMI to GPIO descriptors
      ASoC: rockchip: Drop includes from RK3399
      ASoC: rockchip: Drop includes from Rockchip MAX98090
      ASoC: rockchip: Drop includes from Rockchip RT5645

 sound/soc/rockchip/rk3288_hdmi_analog.c | 46 ++++++++++-----------------------
 sound/soc/rockchip/rk3399_gru_sound.c   |  2 --
 sound/soc/rockchip/rockchip_max98090.c  |  2 --
 sound/soc/rockchip/rockchip_rt5645.c    |  2 --
 4 files changed, 14 insertions(+), 38 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230926-descriptors-asoc-rockchip-833a4fbc7c1f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

