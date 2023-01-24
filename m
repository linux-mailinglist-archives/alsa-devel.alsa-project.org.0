Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9B67981F
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 13:32:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809E1DEF;
	Tue, 24 Jan 2023 13:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809E1DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674563522;
	bh=93UDvXbqt/vJl2G2msHIdMzAj+WqUuLA9xOrxdcY3PI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iZ78vx1s66xwDEFQqbECkYVjVu6VP26rZMOO6Dpl1s9EdEs4FW7Kuqmsac07hwsnc
	 VH6x1XboihCq+MNBjs/p6AJR8KcvOYinNCHYRj9Ky7bWAgOsWQbZFILQjBWfUzbcg9
	 jnu2AdTZtj7vHYdBodi0YwOekAAbHXIyFeCD0UUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0D49F800FB;
	Tue, 24 Jan 2023 13:31:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A201F8027D; Tue, 24 Jan 2023 13:31:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4529FF801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 13:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4529FF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SwP1b453
Received: by mail-wr1-x432.google.com with SMTP id d14so10034745wrr.9
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 04:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/edt5p2gptX1Yr8iTGEIPIaPkWv+29GnkFExbVNe7+Q=;
 b=SwP1b453lPpB8Bk2UiqxslsCzhUb7NEApaNdDthpaijuJwAiREKdtBQ3nle2qbSIYl
 nvPE/Vc/BRQxVivmhzJ4aTkBgahNfC6WxSFsBj1p/EFDf6+QIYvcyaXkOav6uoCpJy+m
 qDvZF94+bCBVS+nvXXp9cEzretOSETfN5QyZvT6pJ0466/Yg8N7dpRISbjkBMhtQ6SFo
 jl5Iz1AMoQtb2KrpNfKiu6NeIFfWHf2vid7gWxv2ZioSWdGlcfYmxE0khSlbCiUFAs+9
 RuBZcWFM2fW4rSaV0DSPSzTkrJEbUGJqxLrgcG9wkbXclNiSVZMAsZSffwqyZfajMXpH
 TI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/edt5p2gptX1Yr8iTGEIPIaPkWv+29GnkFExbVNe7+Q=;
 b=KfBoDjFnga4GlgyvfTvtQ0J4ewBLmK2BlmY3K6cX464HMnMDcsY4CHdyIXmb97TI9o
 kBtDoJb22bGjBCZAuIA8UacyzzkPhMWSmVcoRnIse4SrkB7morWoMsOf8/XBy+MOPt7O
 uXOCCWr7ENUozhr+GvAaJI0CtYsdwLeK+/KSrAGamJHrJXd3Whg6Uino2dLVAB84ln2y
 ORgaJgx4xRqB2Ab8mTb4Hf9Wis24GZAY14HNk+sAoPatzMDUAkAY7YZVafTWNEUUfEZ8
 nh9E8s1HCTlqsaVfuVupq06+JsCr7hILE8DoLAaxsmF9GXC/w82FE21B3bgoDjjM/UmW
 S1Ow==
X-Gm-Message-State: AFqh2kqIyrjfBYnQ2om7o/WOVtKCJU+ifjurj4UgD7WWqgm7qm/Xhm+E
 ZmbZ7pkOVoyWk2Pi5Fz1ISYfcw==
X-Google-Smtp-Source: AMrXdXsyPMQsKO5fS3S0xgCOvOH6nAUs+ZJsTXIY7pPzkFIz3d/QKi9ld/O97coP9iIoK+1NM33cQg==
X-Received: by 2002:a5d:5f06:0:b0:2bd:d1be:ec99 with SMTP id
 cl6-20020a5d5f06000000b002bdd1beec99mr18750958wrb.66.1674563452973; 
 Tue, 24 Jan 2023 04:30:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 f9-20020a5d4dc9000000b002ba2646fd30sm2127613wru.36.2023.01.24.04.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:30:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wsa883x: correct playback min/max rates
Date: Tue, 24 Jan 2023 13:30:49 +0100
Message-Id: <20230124123049.285395-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Correct reversed values used in min/max rates, leading to incorrect
playback constraints.

Cc: <stable@vger.kernel.org>
Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 8d69ed340e83..be211422d38f 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1359,8 +1359,8 @@ static struct snd_soc_dai_driver wsa883x_dais[] = {
 			.stream_name = "SPKR Playback",
 			.rates = WSA883X_RATES | WSA883X_FRAC_RATES,
 			.formats = WSA883X_FORMATS,
-			.rate_max = 8000,
-			.rate_min = 352800,
+			.rate_min = 8000,
+			.rate_max = 352800,
 			.channels_min = 1,
 			.channels_max = 1,
 		},
-- 
2.34.1

