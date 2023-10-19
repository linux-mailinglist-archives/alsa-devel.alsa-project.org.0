Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC57CFD1D
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FD9583B;
	Thu, 19 Oct 2023 16:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FD9583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697726539;
	bh=qq6vdGDdIfC6AgMiDX2JEbTHC7R6xSmBssjPs5pv8x0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vOWq1Qzy+amWNM4d2k5kp4EjWI0yb23CF5cbdELxVZcLb6Z044XVpY5p5GR83YAzV
	 ZsKQqPMktITYgUiLR08SSxm1Tk/2G5QrXmuZzb99C5wMuFnjNwmKTegKNMuERLi3Cx
	 wblXLkPPP4C0oF9kTUCJ6WoLSecO+HWLSa9Iuh8o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 892D2F8024E; Thu, 19 Oct 2023 16:41:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00D31F8024E;
	Thu, 19 Oct 2023 16:41:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACA33F8025F; Thu, 19 Oct 2023 16:41:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B11D7F80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 16:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B11D7F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LuY/Ftog
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so24676455e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 19 Oct 2023 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697726474; x=1698331274;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3cUBjMkJC/g12UTXIKA666/KHuBThA0FV+7EScypba4=;
        b=LuY/Ftog0ILncq4axLx5mi1tLxTsUNa1oo49JI/n/auQuA7hqlGLpRWFQm/v46jmhs
         vVgfostiho0tfdupcZLi+IcTEsub9Wfo6PLZBQYQR+Kuh3CWv7JKXqYzfW16V2+NvmZB
         kjBCrTgAsbO4AexemDPFi1vs5t5Far/1YWWlPWG7nUO3UbbWLSnUbOFDtFH6Hmnmu+R3
         2CYkIZsNCtyC+8fxnjeuRRGVxFfp9NDo3D4ygzE5VM78WLnimhJ0rx80nrLv/7J4Px4i
         RAD9XMd1xoFGmSuTW7zKbpe1W6R04uxC6qgO9eaifRq1wlogn9LEtGyyaHuqLU2S+kUy
         YYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697726474; x=1698331274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cUBjMkJC/g12UTXIKA666/KHuBThA0FV+7EScypba4=;
        b=SNXeCtbqGTUqSf6bMQMpkE+OHorFB595KgzHeRbzzIBd7RZtlBRPMxnZsbKJP1y+ii
         fTZVoGSgR2YWo8mMZ502tLsfWGvbEQ6PApjBu2kEaJQRlbjlgLy9ijR1XSeIIXNtrreN
         ulDGhwokE/GLzb/ln4doexBaeZ82ThBaz/Lu4zFUb60Jmwozk/sdr6MgPX7hLpab++j5
         syXj5uIZr4iOCtrs5Q9G4SeeWvNeFZvJE/NYWFEoX9VKSM8BNgwU5xoWrq8haUkek89A
         KkFcLIUFlkMCosVrdqUW5CiGCGlyiJNLOeS+hcAhPC/aPo66XZf8WVqR9LiLPPXN/VPL
         VTGA==
X-Gm-Message-State: AOJu0YwX0WQKe8eUnjMYQGtTUw0Ek2u8Wwu3NWNjZYsYZ1IRRR34h8kO
	EsTtERqX07igx0zvTLUb4OAVsw==
X-Google-Smtp-Source: 
 AGHT+IEmDfsHc85L7p82ZauQvTVy06/R+u2RKdNGWHhKdMANg2TYxpvYzKkGaL8SdFUWt65CCdtlug==
X-Received: by 2002:adf:e605:0:b0:32d:8401:404a with SMTP id
 p5-20020adfe605000000b0032d8401404amr1925406wrm.10.1697726474187;
        Thu, 19 Oct 2023 07:41:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 b14-20020a05600c4e0e00b0040607da271asm4595657wmq.31.2023.10.19.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 07:41:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: wcd938x: use defines for entries in
 snd_soc_dai_driver array
Date: Thu, 19 Oct 2023 16:41:08 +0200
Message-Id: <20231019144108.42853-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B6HBP53AFLW2AKF4OECVRRRN3ZNXHIJF
X-Message-ID-Hash: B6HBP53AFLW2AKF4OECVRRRN3ZNXHIJF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6HBP53AFLW2AKF4OECVRRRN3ZNXHIJF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_driver array in wcd938x driver has two entries whose order
must match order of wcd938x->sdw_priv array.  The wcd938x_bind() and
wcd938x_codec_set_sdw_stream() rely on this order.  wcd938x->sdw_priv
array is indexed by enum with AIF1_PB and AIF1_CAP, so use the same
defines instead of raw numners for snd_soc_dai_driver array.
No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index a3c680661377..a162bd46ba3e 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3392,7 +3392,7 @@ static const struct snd_soc_dai_ops wcd938x_sdw_dai_ops = {
 };
 
 static struct snd_soc_dai_driver wcd938x_dais[] = {
-	[0] = {
+	[AIF1_PB] = {
 		.name = "wcd938x-sdw-rx",
 		.playback = {
 			.stream_name = "WCD AIF1 Playback",
@@ -3405,7 +3405,7 @@ static struct snd_soc_dai_driver wcd938x_dais[] = {
 		},
 		.ops = &wcd938x_sdw_dai_ops,
 	},
-	[1] = {
+	[AIF1_CAP] = {
 		.name = "wcd938x-sdw-tx",
 		.capture = {
 			.stream_name = "WCD AIF1 Capture",
-- 
2.34.1

