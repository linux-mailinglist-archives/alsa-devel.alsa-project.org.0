Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4236AB9D9
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 10:28:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889F910CF;
	Mon,  6 Mar 2023 10:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889F910CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678094926;
	bh=dOjYoh6eH8qbRC9TAJgH0Dap24r+3oCzcicHcUt6YQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PfDLAmnyM32qxGkxyLklTvT1Ck4mXGjtbklomiZWZWc1+OBWZcQILMoLPDbVCka/B
	 0F1fWJ02pwJ6qNpdYltPQQGTlvnStQk+o3+kTKWBznQJhgXS3RhGb6DvhUoCCa99/a
	 9A40meAiMyGsIdfCkkTxMikQEo+lIKVovPV+/hco=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D73DEF804B1;
	Mon,  6 Mar 2023 10:27:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B767F804FE; Mon,  6 Mar 2023 10:27:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5602F80482
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 10:27:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5602F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4t56tDC/
Received: by mail-ua1-x936.google.com with SMTP id bx14so5994448uab.0
        for <alsa-devel@alsa-project.org>;
 Mon, 06 Mar 2023 01:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678094826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhS37jgP1oSKDQocHToehtxxyITsXcT+owYbmJ0INPU=;
        b=4t56tDC/G+oovfdiW5rxFZCyYsIfw/WmqyS1QgC9FKLy44l3wGWvPNPrKaEI6mAvIe
         ELD4XcqhLxDYPapof54et2VAMu4KrZDT7kUwAj9Hrs6wS7u5XxJjEWAUEaYcKiG/Zn39
         LbYGMfhwfIZ4JLhat+2hMudxk6CM3YJdkOXGSLSfaulwOvc6XpKpqL1F+6VUjzq55xQy
         y2JSmDTTT0sTDy7JHDzT8MfLrGyiRKAqCmO15rXFhnzLrphpS2zddGj0+LqedgxxL0hV
         0N2PQS1jMZSutIFgUay8tQ8K/XSrnWtb4nxvfgnG2GPyXj9/IYPjvJKK9fj6DB19DqZ2
         l4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhS37jgP1oSKDQocHToehtxxyITsXcT+owYbmJ0INPU=;
        b=Le9g6dO3QGfB+aRs4J3shbxwaVKCqRK72Toj6vt9hp2IHs2EGjXxNnMPstdchvXVLG
         RBgcgCEso7/gwHxv4+yzp9i9nVUJNyKps1A2FwH/5XHXzR6XysbSfVCUv/xHx9Lr9ZO1
         4BQZhbYbh9kj5UmhNVEBS2t/5KGmRFmJOt4jjMHRqxnyfMo3f598tdt5thDiDKiomMMl
         sJ+IdDCwfYURuMUnBbCuF94qIh5TG2/EZKreZ+PNdKnTbzpf/kcqFvQemGpL/hCdBp4H
         E399uJ9At+FnN4w7ymAQ23NJftM4S04/hqd519JQPA72ZUBfSMVOgsSdesMiT+LuI2lO
         r2Ag==
X-Gm-Message-State: AO0yUKWV8nITxAbhVGkxFU/BsN+py8Z2eqPuyRtBzbNAa2VZw0mAiszT
	ggHbb5v+4l+8/2CKRmK2+dfV4M2xDLYXL3luY9uD1w==
X-Google-Smtp-Source: 
 AK7set+CHskqiSsm+6Cmi6WHgSSwP4myqJ1YcVc2LU1gm2fnO90Xr69irT8NxRARr/yjxDC8cjTLGID26SceOFHbVxE=
X-Received: by 2002:a9f:3104:0:b0:687:afc8:ffb9 with SMTP id
 m4-20020a9f3104000000b00687afc8ffb9mr6636458uab.2.1678094826467; Mon, 06 Mar
 2023 01:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20230228215433.3944508-1-robh@kernel.org>
In-Reply-To: <20230228215433.3944508-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Mar 2023 10:26:55 +0100
Message-ID: 
 <CAMRc=Mfouay5Z6M6VYnBX7Pe+ahTVfvfQsJ+kToWAwZJxZWJZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GWABGJIJOIN24YHDBO4SGJJ3CRKDXMGS
X-Message-ID-Hash: GWABGJIJOIN24YHDBO4SGJJ3CRKDXMGS
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Kalle Valo <kvalo@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWABGJIJOIN24YHDBO4SGJJ3CRKDXMGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 28, 2023 at 10:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> SPI and I2C bus node names are expected to be "spi" or "i2c",
> respectively, with nothing else, a unit-address, or a '-N' index. A
> pattern of 'spi0' or 'i2c0' or similar has crept in. Fix all these
> cases. Mostly scripted with the following commands:
>
> git grep -l '\si2c[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's=
/i2c[0-9] {/i2c {/'
> git grep -l '\sspi[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's=
/spi[0-9] {/spi {/'
>
> With this, a few errors in examples were exposed and fixed.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-can@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-usb@vger.kernel.org
> ---
>  .../bindings/auxdisplay/holtek,ht16k33.yaml       |  2 +-
>  .../bindings/chrome/google,cros-ec-typec.yaml     |  2 +-
>  .../chrome/google,cros-kbd-led-backlight.yaml     |  2 +-
>  .../devicetree/bindings/clock/ti,lmk04832.yaml    |  2 +-
>  .../bindings/display/bridge/analogix,anx7625.yaml |  2 +-
>  .../bindings/display/bridge/anx6345.yaml          |  2 +-
>  .../bindings/display/bridge/lontium,lt8912b.yaml  |  2 +-
>  .../bindings/display/bridge/nxp,ptn3460.yaml      |  2 +-
>  .../bindings/display/bridge/ps8640.yaml           |  2 +-
>  .../bindings/display/bridge/sil,sii9234.yaml      |  2 +-
>  .../bindings/display/bridge/ti,dlpc3433.yaml      |  2 +-
>  .../bindings/display/bridge/toshiba,tc358762.yaml |  2 +-
>  .../bindings/display/bridge/toshiba,tc358768.yaml |  2 +-
>  .../bindings/display/panel/nec,nl8048hl11.yaml    |  2 +-
>  .../bindings/display/solomon,ssd1307fb.yaml       |  4 ++--
>  .../devicetree/bindings/eeprom/at25.yaml          |  2 +-
>  .../bindings/extcon/extcon-usbc-cros-ec.yaml      |  2 +-
>  .../bindings/extcon/extcon-usbc-tusb320.yaml      |  2 +-
>  .../devicetree/bindings/gpio/gpio-pca9570.yaml    |  2 +-
>  .../devicetree/bindings/gpio/gpio-pca95xx.yaml    |  8 ++++----

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
