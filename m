Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042E59090FE
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 19:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C092A845;
	Fri, 14 Jun 2024 19:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C092A845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718384790;
	bh=8KzlyxUtiQH9n4+dt2WeZEnMMpuBU8HGGEn+yCT/YA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SuztwH3mJPw6A4f/TRJWGbKDj+sQ4irkLlYKwuNGfitQEVQkgPsAUuHN+ksvjjy+P
	 qqfu4EjBnWRKBIN0I8GjgCNANE1KUR5/sGDccnUfeeRUDdXskemhRtx+AdFCPfKPjO
	 5ue1XkUh1UQdbRNYfXL8Lpf70OaJLcMHXnRkqwDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A7CEF805B3; Fri, 14 Jun 2024 19:05:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA55F805AD;
	Fri, 14 Jun 2024 19:05:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6986F80448; Fri, 14 Jun 2024 19:05:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 348C6F800ED
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 19:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 348C6F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qNZVGKdC
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-35f225ac23bso2343569f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718384746;
 x=1718989546; darn=alsa-project.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU9Tq2gv3Xr+OOG2Lgc2duprsrRaO/sCpRyvLtLfjWU=;
        b=qNZVGKdClVnv9YJFqhyMgavOE3suEgznBX5cn1AwnptUEAzxG8L1z+g7Hirz5gW2Vs
         NqAWuWYA7TR4mqd4efXrOA7CAVr46Di51DutavJcGbI4cDmYKBgOQl/GmdXvrytQD1tn
         saAzVoAgUvnOrxMcotXmLi5DymA25VwlWrT4dvCZdIE7glTnTetEA7G1/gtJCza2h1kR
         DAbdklIAQnGmz8sP9buVJfQoGFI6ZE4Gaw9ZKujnmpMLKkXfHcxGEeXAMRGg3fmbm0oc
         ciFcuFoHyaX39CCaljYKNTxny6j2CLXXzWXXxPCmGGNMft7nPsjB7IbKjNyj1JZTetDB
         8xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718384746; x=1718989546;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU9Tq2gv3Xr+OOG2Lgc2duprsrRaO/sCpRyvLtLfjWU=;
        b=SApvjbSvvVndj3Db2FlfcG5RtnpvfH0Rb3ubd5O1aoyYCUQW2Q6lOEhjzoPjsKY4Fo
         hXfl1OHyt7Yt5/hPAKZwf+5zBfHSFFDVhwc7S+txdqxxc9ytcRvIkWyzw5dd5xDz+G0c
         O4PxPHD38GpDoPqCriGtMgSXKEGBWKxvTsmqj1rwrtAkJE74ln/54HN/2PvWrVoY8+zz
         478wO3T5Irz2OHPl22uc0X/iUJt4KOepK0OIMPIWNVEEsw74ZT2Wm+K/Ln1e8CPb7XX+
         I2XIkyVwRtly8IbjdOeujXPUO74cnLZoy9psdiHWRi6xEL4omJ3KMJTtpnLShoLdT/5o
         Makw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsVY7bR6nTHWYqkJglRxTSmsupWZiyfMJaqphRHNroJ7mOO8ORXujzZpT//OT6VQuEppFWLHcddCPAm+sEoxTI/eTQz8WBwyqVpLY=
X-Gm-Message-State: AOJu0YzQd41MiNQ9xDcCgZlk0IUXt9dG41dQ25KQkcgdS9c/2lqbk4U+
	TfhiDesPVVu0ICy6ITPc4r+VOTK4pvPzYSfSHgONOf7YfyQtVhbrnFP3RCD39GQ=
X-Google-Smtp-Source: 
 AGHT+IEiODVYEmrk+Rx+CKhFGkqkyheheemcrZvIKgkrbQLv/Jnn/OxMF175J3qFIGVvLOazoNSL1w==
X-Received: by 2002:adf:e2d1:0:b0:360:7c17:5936 with SMTP id
 ffacd0b85a97d-3607c175a00mr2323310f8f.58.1718384745808;
        Fri, 14 Jun 2024 10:05:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5374:7bd2:13de:845])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f0d71sm4896045f8f.86.2024.06.14.10.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 10:05:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] ASoC: dt-bindings: amlogic,axg-sound-card:
 document clocks and clock-names
In-Reply-To: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-1-9f57d9e01834@linaro.org>
	(Neil Armstrong's message of "Fri, 14 Jun 2024 18:24:01 +0200")
References: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
	<20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-1-9f57d9e01834@linaro.org>
Date: Fri, 14 Jun 2024 19:05:44 +0200
Message-ID: <1j7cerihef.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 66ONS2OU33RJQ5V7USUFURYTL6K4T7ZV
X-Message-ID-Hash: 66ONS2OU33RJQ5V7USUFURYTL6K4T7ZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66ONS2OU33RJQ5V7USUFURYTL6K4T7ZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri 14 Jun 2024 at 18:24, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> The sound card design is based on 3 reference PLL frequencies that
> are the root of all clock rates calculations.
>
> Today, those 3 frequencies are specified in DT via assigned-clocks,
> because they correspond to the basic audio use-case.
>
> It makes no sense to setup clock rates for a sound card without
> referencing the clocks for the sound card, mainly because at
> some point more complex audio use cases will be supported
> and those root rates would need to change.
>
> To solve this situation, let's legitimize the presence of assigned-clocks
> in the sound card by documenting those clocks, as it describes a true
> dependency of the sound card and paths the way of more complex
> audio uses-cases involving those root frequencies.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> index 5db718e4d0e7..676ff2731b86 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -26,6 +26,18 @@ properties:
>        A list off component DAPM widget. Each entry is a pair of strings,
>        the first being the widget type, the second being the widget name
>  
> +  clocks:
> +    maxItems: 3
> +    description:
> +      Base PLL clocks of audio susbsytem, used to configure base clock
> +      frequencies for different audio use-cases.
> +
> +  clock-names:
> +    items:
> +      - const: mpll0
> +      - const: mpll1
> +      - const: mpll2
> +

Thanks a lot for this series. This is going in the right direction
but requiring 3 clocks or naming them (whatever the name) is not
appropriate.

The purpose is for the sound card to get the necessary base rates it
needs for its operation.

So far it has always been 3 clocks because of the 3 usual family rates
and enough PLLs are available. But this is not required. There could be
none (very unlikely but possible if fixed clocks are or with slave setups),
one (probable on a1 from what I can tell), or even more than 3, if one
needs supports for unusual rates.

Also the PLLs are not necessarily the mplls, HiFi PLL is used on some
device. It could even be the GP0 or external slave clocks which is why
putting a limit the number of clocks would be arbitrary.

I think the following would better describe the HW:

clocks: true
assigned-clocks: true
assigned-clock-parents: true
assigned-clock-rates: true

Maybe just 'clocks: true' is enough since the presence of would allow
'assigned-clocks'

For sure, clock-names is not useful, for axg of gx compatible card at least.
All inputs are equal to the card, so index are enough if the card needed
to change rates are runtime (but it is very unlikely to happen, the
whole axg or gx system are meant to operate with fixed PLLs so it would
not be compatible)

>  patternProperties:
>    "^dai-link-[0-9]+$":
>      type: object

PS: I just noticed that my reply to your previous series was private.
    It was not meant to be. Sorry about that.

-- 
Jerome
