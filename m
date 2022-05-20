Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7688C52EAEB
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:35:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16EC5172B;
	Fri, 20 May 2022 13:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16EC5172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653046546;
	bh=CNgfM/30shPI1StPs55NAYC7fhxZ5gB88QTO6b5fhR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMNb7zenYuw/64yHE9irc6gtfBSxRLIkLPpsOvVrRXcinkVdF8ItcP8F9wOMRN6yg
	 YNW2nne5a5y20zK5BnUTjVIBpb7tbGY/BeaLJUc0H5oFntUwUn6GlUlead/da6KhKP
	 S7DCGcN2d8apWuNqImAMko+eznzg6Ebx9ExyJaoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B229DF80528;
	Fri, 20 May 2022 13:33:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3F8AF8019D; Fri, 20 May 2022 13:31:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8789AF800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 13:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8789AF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.b="re4Sm8tW"
Received: by mail-ej1-x631.google.com with SMTP id kq17so15077796ejb.4
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0NvptFqrj7j0InVdvvMmgqzBzN84J9LRB794rQxkFdY=;
 b=re4Sm8tWAvFHp6bKgAYMf09Z79Kgi3OEdhOIiBZ7/Rn2QXbgu5Ly14y4/nQN7Y/aTo
 VlgbB9yG7Rlr2cuoabCyBxc2bGDLVKK0lXBLnASl6zsHCcOeA+1KzIBeqFsR+y75i5XZ
 XvFFiPa9GJ2QyyaAdSmJuFi5RyYukwsFD78F77Gu/KxBhoXO8QeL/xhxXqgh8n2pVQ16
 5uSsdoWXuRrwj+2ip8smJzRExeR9DRqgQ7nZOdTto/19ei6AXbORk/Mx4Jr1TH0FheIZ
 Rjk53cTk2OReyJUGfCv97XHsZ5d+q5q5c0jA2xxlOnKUomCD8mRuslxc9zsWStq2ZrCv
 ptCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0NvptFqrj7j0InVdvvMmgqzBzN84J9LRB794rQxkFdY=;
 b=SwgKNpNO1/XjpvHBo5WQ0uQuSEUBfYO99SDSxL8+p0MAacH9Lo9Th0LzzioApFm/0B
 wCKnziQ/h2W+kY4b6IIiDA1JE6q4c3Eq7OXbttIyEvU3d9kV7wx34iK/BjhlYfZrakq+
 5oQrz31hSBzyVafW35RgAFBF2jHIPaBxvbC5szPPbqjojvvptGNuohp0kMDWXLQ0xRDd
 aSPpRgMZ2WBLfEINbuI0Tjvs/1XQSxWgntbiqZlL6LJoVKN2BzMi+FHWAvOG4OwYpd9H
 h6DW6GwuxiGpY2GOzcHNu9DA3oelR/ri+aKY4QRFQUDJkgxpRjAbaVlD6e5N4ebxctJL
 llSw==
X-Gm-Message-State: AOAM533ijjTrmZb6dATKnXsDn37Z2A8DPj/bqt2cHdJ4EMQwiC20GJa0
 PuHfEstIW7KO3p2iK93oOCzXImsi08HZk2V+rtJFTA==
X-Google-Smtp-Source: ABdhPJyAADo7d4aXCmDNCVnTVXprJXf99iw8JPsCwtJN6tP2yH5Av5Yx22hVAD/QFIma8grUrwXZC/mCf6Av3T8PJbw=
X-Received: by 2002:a17:907:6eab:b0:6fe:b5e2:7b0e with SMTP id
 sh43-20020a1709076eab00b006feb5e27b0emr1053811ejc.736.1653046309443; Fri, 20
 May 2022 04:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220519211411.2200720-1-robh@kernel.org>
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 May 2022 13:31:38 +0200
Message-ID: <CAMRc=McjvTE27BMbN-_W+Fdd7CJcswZQYsB-4N8cj=WfAQ9QOQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 May 2022 13:33:12 +0200
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, chrome-platform@lists.linux.dev,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-serial@vger.kernel.org,
 Linux Input <linux-input@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, May 19, 2022 at 11:14 PM Rob Herring <robh@kernel.org> wrote:
>
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
>
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../arm/hisilicon/controller/hip04-bootwrapper.yaml       | 5 +++--
>  .../bindings/display/bridge/toshiba,tc358768.yaml         | 1 +
>  .../devicetree/bindings/display/panel/panel-timing.yaml   | 5 +++++
>  .../bindings/display/panel/raydium,rm67191.yaml           | 1 +
>  .../bindings/display/panel/samsung,s6e8aa0.yaml           | 1 +
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml       | 1 +
>  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 1 +
>  .../devicetree/bindings/input/matrix-keymap.yaml          | 4 ++++
>  Documentation/devicetree/bindings/media/i2c/adv7604.yaml  | 3 ++-
>  Documentation/devicetree/bindings/mux/reg-mux.yaml        | 8 ++++++--
>  Documentation/devicetree/bindings/net/cdns,macb.yaml      | 1 +
>  Documentation/devicetree/bindings/net/ingenic,mac.yaml    | 1 +
>  .../devicetree/bindings/net/ti,davinci-mdio.yaml          | 1 +
>  .../devicetree/bindings/net/wireless/ti,wlcore.yaml       | 2 ++
>  .../devicetree/bindings/pci/snps,dw-pcie-ep.yaml          | 6 ++++--
>  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml   | 2 ++
>  .../devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml    | 2 ++
>  Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml | 1 +
>  .../devicetree/bindings/power/supply/battery.yaml         | 7 ++++++-
>  .../devicetree/bindings/power/supply/charger-manager.yaml | 1 +
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml   | 1 +
>  Documentation/devicetree/bindings/serial/8250.yaml        | 1 +
>  .../devicetree/bindings/sound/audio-graph-card2.yaml      | 3 +++
>  .../devicetree/bindings/sound/imx-audio-hdmi.yaml         | 3 +++
>  Documentation/devicetree/bindings/usb/smsc,usb3503.yaml   | 1 +
>  25 files changed, 55 insertions(+), 8 deletions(-)
>

For GPIO:

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
