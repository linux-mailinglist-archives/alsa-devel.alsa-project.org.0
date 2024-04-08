Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7C89CBF9
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 20:49:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 015F123D5;
	Mon,  8 Apr 2024 20:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 015F123D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712602177;
	bh=qtrTZPVJnDWvjZ/bNpqt1kAPUsC/tYujbJUF4w+jUBw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gJ/4ma0S7mF9JHW26jmXqrYd7UsJwSUAUAjo4kPFWiCSlpxIhOfiKF9W15I010JBP
	 3jUQ3g8us7zVys7SyqVYuwwxpivzq6M9fMs27pr2w45lB74bB7NWE7MFBy7jqdpSgy
	 KeJDkiTURqdZqWMGyaMOavFKWoF97rEagfrFHpFc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B9D7F805A9; Mon,  8 Apr 2024 20:49:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5574F8057A;
	Mon,  8 Apr 2024 20:49:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81CC2F80238; Mon,  8 Apr 2024 20:49:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 238EBF8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 20:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238EBF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=IWI3cMzs
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3455ff1339dso1436307f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Apr 2024 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712602135;
 x=1713206935; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=/5O9U718NHGvhBsjamAS1sHo9zrNE6S5TEc1aVEiLaU=;
        b=IWI3cMzsNh/00sFOhRbkNWxrDht9eJguxCzsohiB6X2jvGcltJe9UAMnftFysIe5nu
         KAu519YpxbY35Y/gv1BsRZjBsQ/c+wwM4JczUSbpOI+eIw2ge89hxjsHTzVwsguCR1TW
         nkt7BvUtjqWvMIcbLiymE3e9NOsRzIQGruUXRIB86wxrlfBboJ+93Dw72/7wiJr79Ebj
         YbCGdzbTOBTyUtaz86I6ONQiBEkW1wMrE3En+9FoeXEQJxFHaShwNA9cK2ItZTDU2Pxe
         kLmc5V7fyZV1BwEmDhUspXMST8iMn7CM9yHzys/VYR0+JiW50+wbP2Deg7Mupl4CMiVu
         OAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712602135; x=1713206935;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5O9U718NHGvhBsjamAS1sHo9zrNE6S5TEc1aVEiLaU=;
        b=n7Mb7BOUx02YN6bxfXU2D9wlXbWaNEHi+XSd6tq86XRnazGen0IOW/37NVP81/uRLI
         ZsfXtdTmQTU8XF2widX3H1HHu9llVhv4QAREFAyFUfZtudRTk60Cupf2fYkv9D5gqdQ5
         5/7zHlTMkw+3zJXGMnYPwYxPir4m+Ez1dnoN3O9jSTkZuwoa46u+uFbx4J8qp1m87bc7
         3t7yGw0vL0eihlU6V8kdCD3//DzYmjjXb7AqJUqA0mjxEGzv6PrQeBJdJecFefqoc9I4
         gjOnrAwGYlWjb/w4B+1zmGb4c5cSRYAiQb8ivZ0pcAel5PBuLb3V1dHnK05HzrTsxatZ
         WgWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbArarcxkKSBKQLLlm8zHw6Jk1rrzpIUxEHQaSkBM9rk+SlCZAnzD3mAYg3OWNb2OdPS7oSPj+iMYNCY8uN3vI0xXLEwAw+OzPKHg=
X-Gm-Message-State: AOJu0YwDIZ5Sjnrpf5Q/YnvCyb02qkYSCxwxQiGYvsBjFWeEjslmT7RV
	8OYsnrRqrWY3rySCWaiLpDwM34GCAP31I6gaz91Brwwve1lbMWpDsOQ+t7I/08w=
X-Google-Smtp-Source: 
 AGHT+IG3Lg7mm8hPe5LwKDEb0DtuBWPIrOCUnl2T2Z41lBT6Pyv73n0DcdIqqnsFwOJp3c6VQ0kGmA==
X-Received: by 2002:a5d:64cf:0:b0:341:d7b5:27 with SMTP id
 f15-20020a5d64cf000000b00341d7b50027mr8950388wri.6.1712602134884;
        Mon, 08 Apr 2024 11:48:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90bc:1f0d:aae2:3c66])
        by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b00343300a4eb8sm9561770wro.49.2024.04.08.11.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 11:48:54 -0700 (PDT)
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-2-ddrokosov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, lgirdwood@gmail.com, jbrunet@baylibre.com,
 broonie@kernel.org, conor+dt@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: meson: introduce link-name
 optional property
Date: Mon, 08 Apr 2024 20:44:36 +0200
In-reply-to: <20240408164947.30717-2-ddrokosov@salutedevices.com>
Message-ID: <1jsezvofl5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: V7LZCRWW6L5EPH4FPO3UODTHZBNSK23W
X-Message-ID-Hash: V7LZCRWW6L5EPH4FPO3UODTHZBNSK23W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7LZCRWW6L5EPH4FPO3UODTHZBNSK23W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 08 Apr 2024 at 19:49, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The 'link-name' property is an optional DT property that allows for the
> customization of the name associated with the DAI link and PCM stream.
> This functionality mirrors the approach commonly utilized in Qualcomm
> audio cards, providing flexibility in DAI naming conventions for
> improved system integration and userspace experience.

As explained in patch #2, I think this change is wrong.
The names below describe a possible userspace usage of the interface,
not HW. This does not belong in DT.

The only valid name for the interface is one that helps map the PCM
interface and the kcontrols exposed in userspace.

This information is already available through dai_name, prefixes, etc.

Using DT for this is bad, in the context of these particular sound
cards at least.

>
> It allows userspace program to easy determine PCM stream purpose, e.g.:
>     ~ # cat /proc/asound/pcm
>     00-00: speaker (*) :  : playback 1
>     00-01: mics (*) :  : capture 1
>     00-02: loopback (*) :  : capture 1
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml   | 6 ++++++
>  .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml    | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> index 492b41cc8ccd..46774a3e4b1d 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -66,6 +66,11 @@ patternProperties:
>          maxItems: 1
>          description: phandle of the CPU DAI
>  
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
>      patternProperties:
>        "^dai-tdm-slot-(t|r)x-mask-[0-3]$":
>          $ref: /schemas/types.yaml#/definitions/uint32-array
> @@ -137,6 +142,7 @@ examples:
>  
>          dai-link-0 {
>              sound-dai = <&frddr_a>;
> +            link-name = "speaker";
>          };
>  
>          dai-link-1 {
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> index d4277d342e69..975c148f9712 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> @@ -52,6 +52,11 @@ patternProperties:
>          maxItems: 1
>          description: phandle of the CPU DAI
>  
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
>      patternProperties:
>        "^codec(-[0-9]+)?$":
>          type: object
> @@ -89,6 +94,7 @@ examples:
>  
>          dai-link-0 {
>                 sound-dai = <&i2s_fifo>;
> +               link-name = "speaker";
>          };
>  
>          dai-link-1 {


-- 
Jerome
