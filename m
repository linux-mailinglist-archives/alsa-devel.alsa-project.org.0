Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D0F853DDB
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 22:59:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6444514F7;
	Tue, 13 Feb 2024 22:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6444514F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707861579;
	bh=XCEzGiySNrzVsGywGANcAcUebyxPHAJnm9xzwLcysLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vjYBz7QwrBggi/9xR2R8Zv6xBoHlRbn738aeCbabKzShyPldZ4TYHy0RIFgBI5cnp
	 r94cJGuKw7KhJg9blXxL4CWWa70FI866CyvAV7zpfvo+ZIM7pXdp0AO/5lQTl0apE6
	 zVJ8V/CLRofnPEtp7Su8GddmnOWiWZsKPg7PeVyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16945F805D7; Tue, 13 Feb 2024 22:58:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77938F805E9;
	Tue, 13 Feb 2024 22:58:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3020F8057F; Tue, 13 Feb 2024 22:58:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F329F8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 22:58:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F329F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=vXsjsaFI
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4114e0a2978so15726705e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707861497;
 x=1708466297; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqyuBahTPLTAYF+110cUFRV0sBjf6cZZgU9lFVSbKt0=;
        b=vXsjsaFIAJ1GumewK3TBtw5ZkpzRiNlcyvOnH8hP7ohsESr9Zl9kyr8FoqUMtai/8Z
         M+ut7Qpac0mclZs7vfgcuGp0e2vOExiNCRDJH3TW4vUz4HfwDt+v/6C7iv/YEO/tAxP4
         BvvwJp4s7VI8VEbJcM0tjqIUUthC6F9RB4kcvnGP8xhBTXFwtX/+37pXTCvPqKB1cE7B
         NPE5+gjDk26qhANDFBnmBDbAUVymwWlornVJ4JtlnuhJRcLci0LDlgYCURLmtOIfk+qk
         cs3g3nRiNE5UoA3wTKfYgd2KiHv3nGQRDswLe7xVUZXlpEODAOLV6kVSFymFJGgG+VIO
         dIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861497; x=1708466297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqyuBahTPLTAYF+110cUFRV0sBjf6cZZgU9lFVSbKt0=;
        b=j09xRHx9vPoXAsY9N3+kEXwp7P9c/XnWBJzyUdT5fs5mpZHnbqAcEEavswf1ytIT+W
         JcK1RRUyDHXPucxFN4gHfhu5gvbufIo6IVaBP0pANseI0lGLWRxw5caFbErKQa0NFxAj
         3Q3CX8QXEVhL+qEguGnLfvqemrlyrsym7nh3R+YaY+paD5JXQTmmR6Cmcf7fC5w2UNwk
         CZCOey0w//tXnEVoAxoUwR7sMuOnPU+DFhqDYSVrIDgsQB4J9SZe2N48WyYrH3+0vxQY
         hEv9mM7BHldAm5pYPlcdM74xS5dZEo7aNKdbHCX1jVGfpy1I1BMOwTz04MH31YO9e9ZS
         etbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX5216p5ZLTEmnNUAlRdV0lM9nCYOiAQf1mI8JlGkOQqNzGoK9CG6y+CwYVQAOoQ3C6oyuQcpVOVi0PVm+0n54yl0mkjgX190kOmQ=
X-Gm-Message-State: AOJu0YzSZm28ijK9kX8aDZPkLzvqWE+qvu2UIpEbhOv/jomWcNL9sbWE
	ObCE5YqQf89jy3qsBcZRMQHKaPmtua+UVas40/T1S8w5OIt3SPlvXUuHZMVl7Ro=
X-Google-Smtp-Source: 
 AGHT+IFQmIg0n0GJLfQcjyAmY5aOtHbpVk0kKAcJWpMWmARHiy2H/vQt8V6epQv+QeBGgNL4tEMGfw==
X-Received: by 2002:a5d:6ac3:0:b0:33c:e2d9:ad36 with SMTP id
 u3-20020a5d6ac3000000b0033ce2d9ad36mr369591wrw.20.1707861497019;
        Tue, 13 Feb 2024 13:58:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXatIVkhfi4XEgXz5p/gNLbo1vWmEs55v5qyHuI9D0zr8zRt8TJ8ZvxAEkAOJ8a3kznQNaB9CwA0yXFBxNMvj53rHwJ036OVmcocDuLVPfg+PhWLsrC9mlRpniTJxWwH6grCm6vDtmEPJKmWES7/cqSCgpdP/SP1XUCZZN/cAwDr9J27u3hbZyUxvljt3BMCZHmzTpd0QV0bB1cqVdFgl8r1MWmfH7UPkPZq5G2SLjKlWyYV1Bny7ioTDZ9a0tYFo0aVVX3mZT8YahfGGdNcI0a2y2v5rR2Q//H/EU2oWk+rBkR2RDeq8lDwto1myB3M5HTP7it3hesDm99vHUtWHz2n2VKv4Q4O3O2jjAJiuJUqYaCCLIdo0fHDM/dFr/tAaBy30Q6tJz0fcYSUXI8mhoAxW/AWT/oJ1y9vKLuEWj5f8/2i42oUMG6NlN/UzLWMOBw3vS/ecrqYiEobhSloI9qEMgg2SNdaAJXIWgEP2QA8Ev5ZO4piJzUKTZcua59IhWs2zPvSJydJocUe7HdqVKGsdBiuUkwwPb1YyCR9TYWE9OrWora9hpg0mrQsWDgwKLvGk2X3utxRuNVkTTdirRufduCj547YWj/gaQCGXx+o44FtvU=
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:af6b:4350:776e:dcda])
        by smtp.googlemail.com with ESMTPSA id
 r3-20020adfca83000000b0033cdbe335bcsm2415244wrh.71.2024.02.13.13.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:58:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/2] ASoC: meson: aiu: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 22:58:03 +0100
Message-ID: <20240213215807.3326688-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213215807.3326688-1-jbrunet@baylibre.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O3NHRJ6LCBX665ARCQZXP2EZFV6NICPW
X-Message-ID-Hash: O3NHRJ6LCBX665ARCQZXP2EZFV6NICPW
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3NHRJ6LCBX665ARCQZXP2EZFV6NICPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clang-16 warns about casting functions to incompatible types, as is done
here to call clk_disable_unprepare:

sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  243 |                                        (void(*)(void *))clk_disable_unprepare,

The pattern of getting, enabling and setting a disable callback for a
clock can be replaced with devm_clk_get_enabled(), which also fixes
this warning.

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c | 19 ++++---------------
 sound/soc/meson/aiu.h |  1 -
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 7109b81cc3d0..5d1419ed7a62 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -212,11 +212,12 @@ static const char * const aiu_spdif_ids[] = {
 static int aiu_clk_get(struct device *dev)
 {
 	struct aiu *aiu = dev_get_drvdata(dev);
+	struct clk *pclk;
 	int ret;
 
-	aiu->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(aiu->pclk))
-		return dev_err_probe(dev, PTR_ERR(aiu->pclk), "Can't get the aiu pclk\n");
+	pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk), "Can't get the aiu pclk\n");
 
 	aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
 	if (IS_ERR(aiu->spdif_mclk))
@@ -233,18 +234,6 @@ static int aiu_clk_get(struct device *dev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
 
-	ret = clk_prepare_enable(aiu->pclk);
-	if (ret) {
-		dev_err(dev, "peripheral clock enable failed\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))clk_disable_unprepare,
-				       aiu->pclk);
-	if (ret)
-		dev_err(dev, "failed to add reset action on pclk");
-
 	return ret;
 }
 
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 393b6c2307e4..0f94c8bf6081 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -33,7 +33,6 @@ struct aiu_platform_data {
 };
 
 struct aiu {
-	struct clk *pclk;
 	struct clk *spdif_mclk;
 	struct aiu_interface i2s;
 	struct aiu_interface spdif;
-- 
2.43.0

