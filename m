Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676B87CB22
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 11:07:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9899422A5;
	Fri, 15 Mar 2024 11:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9899422A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710497248;
	bh=GDNqvSo5A1b6QVZYerImyy1Y8dstVX31OYMYR2BPJXQ=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pmKmh8SdmC0fqtTFPQekNSEcWdVE4eJ3w4Dms/rRJGlppGWYfGLpC9L2z/QiHVCX4
	 34AodAvRPhFtUS3o5cShiv4CwevTMliJPmJXFKYmkqe5xhl2hGgSwO+RILAtL9UwEj
	 pxy5jYp6QSgNud1B+0LPPis3YcsCHlzFykMd17Cg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13710F805A0; Fri, 15 Mar 2024 11:06:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 219AEF8025F;
	Fri, 15 Mar 2024 11:06:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ECBDF8025F; Fri, 15 Mar 2024 11:06:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44431F800E4
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 11:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44431F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=h3dSIh4m
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-413eee86528so12641835e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Mar 2024 03:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710497199;
 x=1711101999; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=JSJDar4M2yUm4D8l+v7Mwxi0TV8x67pqYTNsZ2PsayQ=;
        b=h3dSIh4mHCLLSIjlZHoeiysJ3fcU2GxXDPU8+A5WgW+2sIdJHbpslF3zVLd8sevB/D
         OYhocYVQ2z4hntH7l58qpeYPyfD6d2l8OK6Jqlsihud0iP1joV4B1c5Cow1jLaI4yasw
         k5xnIENt16kYGR1AC4kaSQPKoBYl1Cf2GXbgG/vn/b/gm8pMRtuYCVab0QucpsdyKT+1
         B9cvJtSq5/6bORzaigtTx/kQNDmQyN44fPzf3i3QfX2KR+3qQNCnLfUiwNxWBnGnUosJ
         g3bxoyyhD8+huIdmKVAO1tHhEgN3QA6umNyMoloP/pRjyQ+2czzORDJYzYkvICI/ixuY
         DPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710497199; x=1711101999;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSJDar4M2yUm4D8l+v7Mwxi0TV8x67pqYTNsZ2PsayQ=;
        b=RSl5vsrUlyJKdO+apYT1P1C4uYQQ/04G2si0BLLWaLzJ7/qCkXE86YnoGf35CaP6/2
         9Izs+NxrK/brkogDgNPq8Gbn/I+qIlaqLOMd2q5jwroLvohPdy5w/F/zwoTbgKzAvdw6
         +BmIe970amZfGqTkHW2G9O2vMD96m8uip0bUTkZl7JmfvLe1LRve1AFSF+9zTfRY1MDB
         u5XK/U47zDuzoq6RnbZWFsNO2C4wVbKH4KiwC7QOJx/oil8sl8AlaPHq9tcuSomz+Yyb
         QpIfAKfcrTpEJNhXBJoWZi09a+uxeNn4eZu3EAKcy7U2GExml3gPeX21JxF3YCcYBQLE
         yR3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0enmjSCfPwC+SFBC4YoiQFZFcZTBaHjI/7NFrGcmDTayZqWzihD5SEOBox1jRZCg9Crbb1Hd42cdCTpPmzKrWVNyIJdz4UGGdLTo=
X-Gm-Message-State: AOJu0YzdRfSCiWvqz4ywSI35uw+lq/I4laL6L5wJ+q+2pzkNoZQOoBS1
	fq1PhnF8hQl1OQCs0wJVpFv9iJZHLaF0exeysP1WWi/Wf1W51BcErSQrp5bgarA=
X-Google-Smtp-Source: 
 AGHT+IFei/VwSLVdZGr+j7usNgdM6Q0VdRkbBr81xPcXXnlj2dvPsRezr8PqGBRTcMb21KM9bWZ5bQ==
X-Received: by 2002:a05:600c:4fc8:b0:412:f4b4:2717 with SMTP id
 o8-20020a05600c4fc800b00412f4b42717mr3308624wmq.26.1710497198823;
        Fri, 15 Mar 2024 03:06:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c3b0900b00413ebaf0055sm5294640wms.7.2024.03.15.03.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:06:38 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 00/25] Introduce support of audio for Amlogic A1 SoC
 family
Date: Fri, 15 Mar 2024 11:01:57 +0100
In-reply-to: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
Message-ID: <1jv85nhkr6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: SLW3HRI4TWJ3DOAA5FJNI62LL2LVAO6P
X-Message-ID-Hash: SLW3HRI4TWJ3DOAA5FJNI62LL2LVAO6P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLW3HRI4TWJ3DOAA5FJNI62LL2LVAO6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> This series includes the following:
>
>  - new audio clock and reset controller data and adaptation for it of existing
>    code (patches 0001..0004);
>
>  - adaptation of existing audio components for A1 Soc (patches 0005..0021);
>
>  - handy cosmetics for dai-link naming (patches 0022..0023);
>
>  - integration of audio devices into common trees (patch 0024);
>
>  - audio support bring up on Amlogic ad402 reference board (patch 0025). This
>    patch is not actually checked on real hardware (because all ad402 that we had
>    were burned out). This patch is based on ad402's schematics and on experience
>    with our own hardware (which is very close to reference board);
>
> Dmitry Rokosov (2):
>   ASoC: dt-bindings: meson: introduce link-name optional property
>   ASoC: meson: implement link-name optional property in meson card utils
>
> Jan Dakinevich (23):
>   clk: meson: a1: restrict an amount of 'hifi_pll' params
>   clk: meson: axg: move reset controller's code to separate module
>   dt-bindings: clock: meson: add A1 audio clock and reset controller
>     bindings
>   clk: meson: a1: add the audio clock controller driver
>   ASoC: meson: codec-glue: add support for capture stream
>   ASoC: meson: g12a-toacodec: fix "Lane Select" width
>   ASoC: meson: g12a-toacodec: rework the definition of bits
>   ASoC: dt-bindings: meson: g12a-toacodec: add support for A1 SoC family
>   ASoC: meson: g12a-toacodec: add support for A1 SoC family
>   ASoC: meson: t9015: prepare to adding new platforms
>   ASoC: dt-bindings: meson: t9015: add support for A1 SoC family
>   ASoC: meson: t9015: add support for A1 SoC family
>   ASoC: dt-bindings: meson: axg-pdm: document 'sysrate' property
>   ASoC: meson: axg-pdm: introduce 'sysrate' property
>   pinctrl/meson: fix typo in PDM's pin name
>   ASoC: dt-bindings: meson: meson-axg-audio-arb: claim support of A1 SoC
>     family
>   ASoC: dt-bindings: meson: axg-fifo: claim support of A1 SoC family
>   ASoC: dt-bindings: meson: axg-pdm: claim support of A1 SoC family
>   ASoC: dt-bindings: meson: axg-sound-card: claim support of A1 SoC
>     family
>   ASoC: dt-bindings: meson: axg-tdm-formatters: claim support of A1 SoC
>     family
>   ASoC: dt-bindings: meson: axg-tdm-iface: claim support of A1 SoC
>     family
>   arm64: dts: meson: a1: add audio devices
>   arm64: dts: ad402: enable audio

I'm sorry but a 25 patches series is just way too big, especially when
spamming multiple sub systems.

Please try to make one series per sub systems and general topic, I see
at least
* A1 audio clocks
* G12 acodec fix
* Acodec rework
* PDM
* pinctrl
* arm64

I did not review all but I think I've made enough comments to keep you
busy for a while

>
>  .../bindings/clock/amlogic,a1-audio-clkc.yaml |  83 +++
>  .../reset/amlogic,meson-axg-audio-arb.yaml    |  10 +-
>  .../bindings/sound/amlogic,axg-fifo.yaml      |   8 +
>  .../bindings/sound/amlogic,axg-pdm.yaml       |   5 +
>  .../sound/amlogic,axg-sound-card.yaml         |  12 +-
>  .../sound/amlogic,axg-tdm-formatters.yaml     |  22 +-
>  .../bindings/sound/amlogic,axg-tdm-iface.yaml |   6 +-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
>  .../bindings/sound/amlogic,gx-sound-card.yaml |   6 +
>  .../bindings/sound/amlogic,t9015.yaml         |   4 +-
>  .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 126 ++++
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 471 +++++++++++++++
>  drivers/clk/meson/Kconfig                     |  18 +
>  drivers/clk/meson/Makefile                    |   2 +
>  drivers/clk/meson/a1-audio.c                  | 556 ++++++++++++++++++
>  drivers/clk/meson/a1-audio.h                  |  58 ++
>  drivers/clk/meson/a1-pll.c                    |   8 +-
>  drivers/clk/meson/axg-audio.c                 |  95 +--
>  drivers/clk/meson/meson-audio-rstc.c          | 109 ++++
>  drivers/clk/meson/meson-audio-rstc.h          |  12 +
>  drivers/pinctrl/meson/pinctrl-meson-a1.c      |   6 +-
>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++
>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 +
>  .../dt-bindings/sound/meson-g12a-toacodec.h   |   5 +
>  sound/soc/meson/axg-pdm.c                     |  10 +-
>  sound/soc/meson/g12a-toacodec.c               | 298 ++++++++--
>  sound/soc/meson/meson-card-utils.c            |  12 +-
>  sound/soc/meson/meson-codec-glue.c            | 174 ++++--
>  sound/soc/meson/meson-codec-glue.h            |  23 +
>  sound/soc/meson/t9015.c                       | 326 +++++++++-
>  30 files changed, 2394 insertions(+), 223 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
>  create mode 100644 drivers/clk/meson/a1-audio.c
>  create mode 100644 drivers/clk/meson/a1-audio.h
>  create mode 100644 drivers/clk/meson/meson-audio-rstc.c
>  create mode 100644 drivers/clk/meson/meson-audio-rstc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h


-- 
Jerome
