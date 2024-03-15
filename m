Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD35E87CB33
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 11:13:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12B8222AF;
	Fri, 15 Mar 2024 11:13:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12B8222AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710497620;
	bh=+QI7pZjV5YnoIH6SZx7QJZM4F+zGSldQpGRXjDpUssA=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F1Mq/TWuEp4Nk14nTc31Ru6Wpu9QSYeeHZzc+aSxKQakQtLzJBehfS4RKpB1zhPuV
	 /K1WJKje7IeCUMxk4jvN3e21IJDHhNGJ3+UxKiuppm4FG6dxT46qNj3ZMNRIjuGY7s
	 y7WCk2a+nnPJPpXsyHTtBy+78U4gvNVpWq9ffEkE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB276F80580; Fri, 15 Mar 2024 11:13:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC9CF8057F;
	Fri, 15 Mar 2024 11:13:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6502EF8028D; Fri, 15 Mar 2024 11:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1603F800E4
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 11:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1603F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=FZYmimU1
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-413fffcc472so4554765e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Mar 2024 03:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710497576;
 x=1711102376; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=LQKgoyfzzduaJ5jov9NmJ8PCZR9rXm8iDmJsBk54NZ8=;
        b=FZYmimU1xJLpeFS1BuB9kF+UtLHcHkWAdG9j1uB4nr6Ebn+6nmwrJXruIiU30zPWBa
         8QAAdSoWNfHPoHVGSVpgHuwGhq0VTsdheDfKCd2WeW5cUzymfqiErs6Els0ribylRycD
         +CBViIY/QByPpeb40pNixapQPhlt705c5OKU44ELb9I6GDjb64jCb9gQ2IqyKpYvsM+m
         beXAGvfQ06p1iTtH4ltis+XawH+yQjnFN8QthYOFeD6CrPrSUvNKpJOGKw5c5/xuULou
         GSc5i1TflNm9b91SfnIubB056xhrpErWzNy7U2IkcE/Q8UgET7tLh1SNbw93eJ8JyAco
         B+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710497576; x=1711102376;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQKgoyfzzduaJ5jov9NmJ8PCZR9rXm8iDmJsBk54NZ8=;
        b=HprK0Yp1GXlIwawedcWiTZl+VcO/a/vrcGqzfzzp6wMnSNUddpaJp6QrRJvZv4fSoe
         Hzr/pZmDj7dOk3ceYaGgI42w7KF0cYrOGWnjptBJLCvHuFWHMBEK02rncjrTBibuvw83
         YJguVjyw8e0Od2kr4lCQlDHNlbJNldXbORh68FBkxKQ37DpPDybBvN9cKKJj7FPyg5O4
         enAb4bYXTHnQN/jQiTp9RqyILBO/1DQ75HwqqpoopQF+5ttvSvWWZwvJHJVN2MgNEy1l
         u2hHKv0Nw7mbY8hRHnh3+t96wnLDg7wisdEVimclrqrqmJtjwJyrxxBLlLI6ocVscv+b
         V5Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBXiS3gCVXNCjLrFYHjpfng5JrCATuaw2XOV2Szxu4u+hf4q17YNjxpjJHdajSceDOWEa60xJJ1wxrEPpjmtcfAUpLHFO1MRsCeBc=
X-Gm-Message-State: AOJu0YxUrT+/RCTv/jPrrLVNtG9WgAz1f3OLwBpkzOgSfBSIspkXiqtH
	WxOukedbgdhwo3Sm9JSJ8XdfBJbb16bT95ck4zHz00xADKRQk0w2wqMc5cv+Qg8=
X-Google-Smtp-Source: 
 AGHT+IGkpPwSpcUKRjM84ML2A3Du8Hq7iROZC24mk3kzA01vpaV9CKlS3GgcL5y/xRPaeZYOGOCuww==
X-Received: by 2002:a05:600c:4eca:b0:414:1e0:2afa with SMTP id
 g10-20020a05600c4eca00b0041401e02afamr788040wmq.3.1710497575919;
        Fri, 15 Mar 2024 03:12:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id
 bu27-20020a056000079b00b0033ecbfc6941sm2481373wrb.110.2024.03.15.03.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:12:55 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-20-jan.dakinevich@salutedevices.com>
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
Subject: Re: [PATCH 19/25] ASoC: dt-bindings: meson: axg-sound-card: claim
 support of A1 SoC family
Date: Fri, 15 Mar 2024 11:06:52 +0100
In-reply-to: <20240314232201.2102178-20-jan.dakinevich@salutedevices.com>
Message-ID: <1jr0gbhkgp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: TO2WIMGIVED6GY7CJUYAL73CV7ON5TRF
X-Message-ID-Hash: TO2WIMGIVED6GY7CJUYAL73CV7ON5TRF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TO2WIMGIVED6GY7CJUYAL73CV7ON5TRF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Add "amlogic,a1-sound-card" compatible string alias to
> "amlogic,axg-sound-card".
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml   | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> index 5db718e4d0e7..492b41cc8ccd 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -14,7 +14,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: amlogic,axg-sound-card
> +    oneOf:
> +      - const: amlogic,axg-sound-card
> +      - items:
> +          - const: amlogic,a1-sound-card
> +          - const: amlogic,axg-sound-card

I know the rule about SoC related name but it is different here.
This does not describe HW in the SoC. 

The axg sound card is just a name, much like simple-card or
audio-graph-card. I could have named it "amlogic,my-awesome-card"

We would not add "amlogic,a1-simple-card", would we ?

It is purely a software component, which aggregate HW ones.


>    audio-aux-devs:
>      $ref: /schemas/types.yaml#/definitions/phandle-array


-- 
Jerome
