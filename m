Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C2D7B6C45
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 16:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21ED884B;
	Tue,  3 Oct 2023 16:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21ED884B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696344762;
	bh=4BCkttYSm3qnyD/46rujqTGR8YdzNX+IqUfFVChFQYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dhfNaq5EUCIci7JoYxbwcD67z+g34mu6S0jTk0pp1xzlrKdKwhofj0NrDkriZM6Mg
	 11HWWyCfnBOccX7pFGMGkh9wb0Y1wca5U6zNnxsmWS1C8qgrXvatUA7TpehKfu4N6m
	 TzlnIKsm9BvTU2zzic4+yOOqN7dPqgekntwKxFFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7CD5F80130; Tue,  3 Oct 2023 16:51:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38F7BF80310;
	Tue,  3 Oct 2023 16:51:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B5E6F8047D; Tue,  3 Oct 2023 16:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62B6CF801EB
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 16:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62B6CF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jiKpRvXn
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-405497850dbso10120565e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Oct 2023 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344700;
 x=1696949500; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbI1RQ5tA31jmForDpjaNDHFXNvHWaIh5Ez7RFreokA=;
        b=jiKpRvXniHNXItYLlcu10PH9NirA03IbBtgS59wb7iPyL54c0Zyr2AlUP+2GPjOYBR
         7i4Yxlk5vXkeiFlwI3BuZEzjdlA6YYvWWF1ROMlz8HsqSF1p7S679qL7+lNda3TYWBCU
         a9+UiGQIBnw+YDaHctgA9MgiTCOMc2oQDXUOxRkP3g6ocYcH/nnknf41r8WIvBQFq6Vg
         3zXRt/nLUnAFRv6zuNfscv2I79p4HGK5Vz8XCeaSXi4ymuDou/fqfYqZPQxhJjnrmZpx
         M4VFo0gJ/nkzOMQBsZZX9nC4bCk24HoTLAnVtrSDLm/HM4L2uID0IlMEUL0Iu43K9+T7
         N9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344700; x=1696949500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbI1RQ5tA31jmForDpjaNDHFXNvHWaIh5Ez7RFreokA=;
        b=ulEdEROU012hBfrhdZN7dwB3UWjw76Ysj0vmIMcst1LKhwTuXNiUp9/wBQlLQfA6cW
         MAwE+v78TfzWSyXNJWk9qc7MftIRn+NP2voqdTqpcFtETDgrdapO00B8Hao8uxj9AJo9
         CSvKFECQGDPoUfIqfq9kYYYtTyFCT1ps80uNO8OON5WiULrXmjLOPBUhLDYRihmnT4pP
         oR6tVPkIp0uwfMXFbXIx0S1p1X5aWrOUJblRWnUjqCZRf0fz+mdHPhBeQyltIFCkW98R
         ZD/H08aInP2PsFZRdFoJSNsJ2r5dDZsu75Ok5MK60FgE6LHWVHKraPorgZ35v4H6foT5
         Pw3A==
X-Gm-Message-State: AOJu0YwhtyyE1ory+U18Rn4l+Bu2IqKDcOi79lTjz/ozArVvhVycwkqR
	2sO9Jq4jqZ5vwDB/F3ODtMCMLw==
X-Google-Smtp-Source: 
 AGHT+IGDe8qyl3H7tHp7/i95Dcbrmv2tEdTDIgA+Gz7COGg95rm2oNQU9BoqqS4J9fllDu6b//glNA==
X-Received: by 2002:a1c:f709:0:b0:3fe:1cac:37d5 with SMTP id
 v9-20020a1cf709000000b003fe1cac37d5mr13510551wmh.4.1696344699849;
        Tue, 03 Oct 2023 07:51:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id
 c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
Subject: [PATCH 21/36] pinctrl: cirrus: use new pinctrl GPIO helpers
Date: Tue,  3 Oct 2023 16:50:59 +0200
Message-Id: <20231003145114.21637-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IDYYIXBNRV4AO4N4ZA3I2567E3VUE7E7
X-Message-ID-Hash: IDYYIXBNRV4AO4N4ZA3I2567E3VUE7E7
X-MailFrom: brgl@bgdev.pl
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDYYIXBNRV4AO4N4ZA3I2567E3VUE7E7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c   | 4 ++--
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index c09646318419..097e4dcdda36 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -508,7 +508,7 @@ static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 
 static int cs42l43_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
@@ -516,7 +516,7 @@ static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
 {
 	cs42l43_gpio_set(chip, offset, value);
 
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int cs42l43_gpio_add_pin_ranges(struct gpio_chip *chip)
diff --git a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
index 0b78cf611afe..f3c8a8c14e14 100644
--- a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
+++ b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
@@ -1098,7 +1098,7 @@ static int lochnagar_gpio_direction_out(struct gpio_chip *chip,
 {
 	lochnagar_gpio_set(chip, offset, value);
 
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int lochnagar_fill_func_groups(struct lochnagar_pin_priv *priv)
-- 
2.39.2

