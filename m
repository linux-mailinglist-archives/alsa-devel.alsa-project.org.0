Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB781311C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 14:16:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E2EEA4D;
	Thu, 14 Dec 2023 14:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E2EEA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702559779;
	bh=LK4dghZv/mOj1FuH8khGYnPJP1wF+IxeSt3nRujTvM8=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rRXDVhFtnI0dIFu1aRrIsX2OlRNzZa4mv6hhXnNRtEPFYn17zsR4H1uZQliqu0Kw+
	 NodbjBVXRCneqTAsPfjnYYNYFmhCLtI3tnCOJRKU2uAPI0e673AQEvEiqggV5FbltR
	 Na9BL335sTPSa3MVMOScXoxfvmEX3qrAm4EWaFtE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59100F80587; Thu, 14 Dec 2023 14:15:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C9AF80563;
	Thu, 14 Dec 2023 14:15:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 839D5F8025F; Thu, 14 Dec 2023 14:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C89EF8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 14:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C89EF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ju++uvy1
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cc4029dc6eso13081441fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 05:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559743; x=1703164543;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hsy3l+28Wlzo8cXaOBVgUpQ+5XTYvjbT3bX9woEdBdk=;
        b=ju++uvy1tR1Z6gpsRHQ8BuHhZcLkAVY6hTBT9vHfGczUzvfXdgvIoXDmFcIIFYmrMc
         TjMSpGEONyMb72cSxs1U2yqAJGi6rxF3q6xYse2GF1tJSrxNlSTxlWIDuW4wr2EUaGJC
         t5BckwzQB5OmaLLPsb6korKpB4TdIO41GiqnylTnPHULynvOFvaA2RrnZnYPp8Q8TPok
         rhZzW4lole9Ur19qgVs2TR+lFyW6D3vnxsOFRTqYOtiwVSnkoGeSoNHND5WwSF5nlNEY
         NSWM9XgQuUxuw/mRgigD1FUvAqQobEVTdlHZfiQh5v35x6k2JODF8rrDhLUo++tIESFq
         t7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559743; x=1703164543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hsy3l+28Wlzo8cXaOBVgUpQ+5XTYvjbT3bX9woEdBdk=;
        b=hFEe+6pzc7v+dmG8DbQeqIkFf40hlnc71oL+MA1WmxiI13R0JRgpBowOWdZvfhflQr
         k9HubVh5mmpaLZFHqlsd6LbB/jBQIDG2Qj5uLO/zQtNb/sBPZy7M70On3dehgL2Lq9cv
         6P49pX9/FcnPRrGXWmtSieiz/spLlbuQ5liaaYZ3+n63EVbVyJWNv3DGvcZCA3ScYMbv
         m2UmQ8p7aWI8LeZf/gBvQytoaMOrvc/MiU+AkNN/H0L5jJm5NJI7QU2Bnm9SmgKoqE8m
         qaQxZFur5Lx+1w1CHP+/Awcks/y8NJKOVjfoAV4Zjvh9Mfc8hq03oljDLyLjEo71zN/L
         5RiA==
X-Gm-Message-State: AOJu0YzNjOQIgI6PHJQF+UWjWh2TFsvzBPMbxg8ZxCMnQtrJg1b8RSsA
	6dypxrokiGBpkL/VLCjej4/k3Q==
X-Google-Smtp-Source: 
 AGHT+IGG2eNJ8YdSSOtikRyhfKzL54YiZt8kpDvWZmOdjaLZ+i16vshFSugATB9RNQ2q9+lT0N5dlA==
X-Received: by 2002:a2e:8447:0:b0:2ca:31a:4e8 with SMTP id
 u7-20020a2e8447000000b002ca031a04e8mr4281616ljh.72.1702559743254;
        Thu, 14 Dec 2023 05:15:43 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 p23-20020a2e93d7000000b002ca02ceae84sm2080478ljh.83.2023.12.14.05.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:15:42 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] GPIO inclusion fixes to misc sound drivers
Date: Thu, 14 Dec 2023 14:15:41 +0100
Message-Id: 
 <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP3/emUC/x3MwQqDMAwA0F+RnA0slQ3Zr4gHbdMuh7UlURHEf
 1/Z8V3eBcYqbPDuLlA+xKTkBuo78J8lJ0YJzeAebiBHDlOVgoHNq9StqKGVPQf8inkcV08vGp4
 jR4I2VOUo53+f5vv+ASS6OIxtAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: XRQS6ZL3JZDDLFHIRSYY6LD235YRQJ5J
X-Message-ID-Hash: XRQS6ZL3JZDDLFHIRSYY6LD235YRQJ5J
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRQS6ZL3JZDDLFHIRSYY6LD235YRQJ5J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mostly dropping unused headers, and a single driver rewrite.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (4):
      ASoC: hisilicon: Drop GPIO include
      ASoC: qcom: sc7180: Drop GPIO include
      ASoC: simple-card-utils: Drop GPIO include
      ASoC: tegra: tegra20_ac97: Convert to use GPIO descriptors

 arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi |  2 +-
 sound/soc/generic/audio-graph-card.c          |  1 -
 sound/soc/generic/audio-graph-card2.c         |  1 -
 sound/soc/generic/simple-card-utils.c         |  1 -
 sound/soc/hisilicon/hi6210-i2s.c              |  1 -
 sound/soc/qcom/sc7180.c                       |  1 -
 sound/soc/tegra/tegra20_ac97.c                | 55 +++++++++++++--------------
 sound/soc/tegra/tegra20_ac97.h                |  4 +-
 8 files changed, 29 insertions(+), 37 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231212-gpio-descriptors-sound-misc-8bc161358ef1

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

