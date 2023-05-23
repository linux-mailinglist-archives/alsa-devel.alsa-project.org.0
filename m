Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19770E0DD
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 17:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B0C820;
	Tue, 23 May 2023 17:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B0C820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684856897;
	bh=w2BzP5duWeWoc6UANe8vrexOTMesxRdeRkaZhP8Dz4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WIslorOoRLI2uCmLwzxh7W3EXTfOmVbe/yUNdNqVK3AhHIgLEWuQNpV662WI/6i++
	 g+54EenLrJFoe5oMDo0aOETnoQos991d5PWer5qSOjzM17M+mL42LJ7Pc7eyyKLA8x
	 l0q89Ob93lCwzTVyvwOuJdlSkPN0m8ZMHy5+RscU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02A57F80563; Tue, 23 May 2023 17:46:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D7F5F8053D;
	Tue, 23 May 2023 17:46:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE4FBF8024E; Tue, 23 May 2023 17:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16A35F800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 17:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16A35F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qzXoE7KK
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f60e536250so4586175e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684856785; x=1687448785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY78bpvovATO4WTiWWCs/PyinwWE+HdEDWAOWfiu7IY=;
        b=qzXoE7KKxl8W7e9Ja/36EZNThJM8rZx06KxNTz3pu/jWCjkNW83xPrSo87iAGb5eod
         tYOi1jkZbAiEFgKV594n50+88hyF1C9ftpmv8HxaiYgOAr0mRStKnWG+cwq6WqGzPBy+
         OG0Fj1AxfEX3J2sgJB/WYBzgD3A3lm+Iauu5wrSl7fbwLIGt/Y8q202YcqU71xBs7rg8
         exjOndDRf3smAaxgYEkP67pAQ2MP+1JSlYAj4IJkNJWH3Fms6lP5Ntt7CNXklyrsFbPz
         x70ZRlAc4zhIbWw7zEW6a+yRuEpQJ3pvYuXGBsuieV5suQ5IyViTHuX6eTk44TSxkqVG
         vE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684856785; x=1687448785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY78bpvovATO4WTiWWCs/PyinwWE+HdEDWAOWfiu7IY=;
        b=Cd0Oru1lJX+xJkQ6AbOcJtBl9ZP8yVnbVjSr8wv4XvM9bHuZm8/67ke6FbeF9NWO98
         h9rfwlPwGfHR/DbmhSbO3mQZvfUbQGjJBxKt22X6LxKIGUhelVB5dhcSzjUlJxwNzZtr
         GfwLd3SL4sVPw8GXzEQZ8XSfyvtOTbHm0LRxBRaR5UrBoSEMPMyuts1UzOxpL3UaezVj
         sgqU/xyAhc8vgBSwJvNZquV2XsYV7vlfBqADDVqFjHmn4dVjhLq+TEHWFhbgqI59opbi
         J+mEw7d1m+tsKvWZ2eQR65jR8TOqTb8cL/ofphXSMU4vgmDk7JJfLyeqr87VVaePxiz7
         I96g==
X-Gm-Message-State: AC+VfDxlBcV+n1xp6gWljOtFeND5OiSI3N6FqCjSbElizlsXvKOE1sYl
	QyxzrX9OVQO7Uohju4i9hUSDcQ==
X-Google-Smtp-Source: 
 ACHHUZ5UPojsYEPmPMD6YBrtM2ogvSu7gGXAEL3nSBCW0XABVz487ZQkY16kEyIPnERnW6fC5GGhGQ==
X-Received: by 2002:a05:600c:3549:b0:3f5:a54:9f97 with SMTP id
 i9-20020a05600c354900b003f50a549f97mr11115515wmq.0.1684856784731;
        Tue, 23 May 2023 08:46:24 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 f4-20020a1c6a04000000b003f1978bbcd6sm3374063wmc.3.2023.05.23.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 08:46:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] ASoC: codecs: wsa881x: do not set can_multi_write flag
Date: Tue, 23 May 2023 16:46:05 +0100
Message-Id: <20230523154605.4284-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OIKBIJHKQSWLFTOW3ZMBBDE5VJ2QX7J2
X-Message-ID-Hash: OIKBIJHKQSWLFTOW3ZMBBDE5VJ2QX7J2
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIKBIJHKQSWLFTOW3ZMBBDE5VJ2QX7J2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

regmap-sdw does not support multi register writes, so there is
no point in setting this flag. This also leads to incorrect
programming of WSA codecs with regmap_multi_reg_write() call.

This invalid configuration should have been rejected by regmap-sdw.

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 4ce72a7f01b6..211b154bc514 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -645,7 +645,6 @@ static struct regmap_config wsa881x_regmap_config = {
 	.readable_reg = wsa881x_readable_register,
 	.reg_format_endian = REGMAP_ENDIAN_NATIVE,
 	.val_format_endian = REGMAP_ENDIAN_NATIVE,
-	.can_multi_write = true,
 };
 
 enum {
-- 
2.21.0

