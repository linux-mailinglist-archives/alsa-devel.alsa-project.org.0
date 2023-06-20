Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFDA737200
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 18:46:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A72D3832;
	Tue, 20 Jun 2023 18:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A72D3832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687279589;
	bh=Y7fV2pFKAxc53wEi8ScBaO3RpXqOLX8GIPrMIVq7lRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cQtMfdlMLqe1KFadhejdmXf9wK0y987MkMJjA4yGqAy8HWiJjONANKfhPXKpR7Voe
	 /b04DffLAm+SdqFy3cyf0wW/5FzDKa62M3omevg48J4RcoWIijvoI2gsWmJYudzn+Y
	 EyInL8zYZYtJ/zIR0+yiIqUoUxEo7Usy/kAOaEP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82360F80132; Tue, 20 Jun 2023 18:45:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA31FF80132;
	Tue, 20 Jun 2023 18:45:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B918AF80141; Tue, 20 Jun 2023 18:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 309E7F80130
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 18:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 309E7F80130
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3426e9a9c3eso7408925ab.0
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Jun 2023 09:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687279524; x=1689871524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9XOGuLGXhqBdh/SPGk4WJ2DXvEFR2a4aPquV+OWA5g=;
        b=bPXRrfSA5Qvf9dlaX1hlq3+/J7yb2iM5sRJGp3RcWluClV1qUVuRaJ/3YUY/UuxzhW
         MavCn4MLEnUnFUmMpRJKJpb/cG+mTjEG8a3efgODRlxkSSYWvMtk4CaU1hRU5rFZUIt5
         B/G78jc7aSelZ/uZ0qD4n7B1rDqQT5hXXiVy7OzeNkW1lUleiQO6ORxlINKhugGxrGRY
         PyuiWGew+qpB7YhJvXRT8vuSTcSiZMFsmPw0kXzK63CDfvHrg88/8AnxbN/F5W7BUlH3
         CYrFlSgm+euBa1BmxE3wL735DSLEE/bk7tlFpPGmjg7hJ4ZFj9f5gu/G6B8VojjxB5Hk
         IxPg==
X-Gm-Message-State: AC+VfDz6x8XFtZ14876oYSiufhnLN0XySTRrgxRFSVyThO7wo+TMH1Gu
	uOdbtylV6O9wV9brNNXb7Q==
X-Google-Smtp-Source: 
 ACHHUZ7D8Y2CvB+TmCsAsGGa5dmCvpvC+FiLFquXEXmAYWDArnioL54LLdgIM2g4KsD0NTN9IaLdiw==
X-Received: by 2002:a05:6e02:152d:b0:340:7bba:85b4 with SMTP id
 i13-20020a056e02152d00b003407bba85b4mr8982202ilu.8.1687279524383;
        Tue, 20 Jun 2023 09:45:24 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 v2-20020a92c6c2000000b0033bc3a3ea39sm683618ilm.70.2023.06.20.09.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 09:45:23 -0700 (PDT)
Received: (nullmailer pid 3798817 invoked by uid 1000);
	Tue, 20 Jun 2023 16:45:21 -0000
Date: Tue, 20 Jun 2023 10:45:21 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 02/13] ASoC: dt-bindings: simple-card: Add
 additional-devs subnode
Message-ID: <20230620164521.GA3789188-robh@kernel.org>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
 <20230615152631.224529-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615152631.224529-3-herve.codina@bootlin.com>
Message-ID-Hash: YU2QYZQAJI2RUDZNSETQBHGUJQSNUWL4
X-Message-ID-Hash: YU2QYZQAJI2RUDZNSETQBHGUJQSNUWL4
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YU2QYZQAJI2RUDZNSETQBHGUJQSNUWL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 15, 2023 at 05:26:20PM +0200, Herve Codina wrote:
> The additional-devs subnode allows to declared some virtual devices
> as sound card children.
> These virtual devices can then be used by the sound card and so be
> present in the audio path.
> 
> The first virtual device supported is the audio IIO auxiliary device
> in order to support an IIO device as an audio auxiliary device.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/simple-card.yaml           | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index b05e05c81cc4..59ac2d1d1ccf 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -148,6 +148,15 @@ definitions:
>      required:
>        - sound-dai
>  
> +  additional-devs:
> +    type: object
> +    description:
> +      Additional devices used by the simple audio card.
> +    patternProperties:
> +      '^iio-aux(-.+)?$':
> +        type: object
> +        $ref: audio-iio-aux.yaml#
> +
>  properties:
>    compatible:
>      contains:
> @@ -187,6 +196,8 @@ properties:
>      $ref: "#/definitions/mclk-fs"
>    simple-audio-card,aux-devs:
>      $ref: "#/definitions/aux-devs"
> +  simple-audio-card,additional-devs:
> +    $ref: "#/definitions/additional-devs"

Why do you need this under the card node? Can't you just use the 
existing aux-devs?

>    simple-audio-card,convert-rate:
>      $ref: "#/definitions/convert-rate"
>    simple-audio-card,convert-channels:
> @@ -359,6 +370,48 @@ examples:
>          };
>      };
>  
> +# --------------------
> +# route audio to/from a codec through an amplifier
> +# designed with a potentiometer driven by IIO:
> +# --------------------
> +  - |
> +    sound {
> +        compatible = "simple-audio-card";
> +
> +        simple-audio-card,aux-devs = <&amp_in>, <&amp_out>;
> +        simple-audio-card,routing =
> +            "CODEC LEFTIN", "AMP_IN LEFT OUT",
> +            "CODEC RIGHTIN", "AMP_IN RIGHT OUT",
> +            "AMP_OUT LEFT IN", "CODEC LEFTOUT",
> +            "AMP_OUT RIGHT IN", "CODEC RIGHTOUT";
> +
> +        simple-audio-card,additional-devs {
> +            amp_out: iio-aux-out {
> +                compatible = "audio-iio-aux";
> +                io-channels = <&pot_out 0>, <&pot_out 1>;
> +                io-channel-names = "LEFT", "RIGHT";
> +                snd-control-invert-range = <1 1>;
> +                sound-name-prefix = "AMP_OUT";
> +            };
> +
> +            amp_in: iio_aux-in {
> +                compatible = "audio-iio-aux";
> +                io-channels = <&pot_in 0>, <&pot_in 1>;
> +                io-channel-names = "LEFT", "RIGHT";
> +                sound-name-prefix = "AMP_IN";
> +            };
> +        };
> +
> +        simple-audio-card,cpu {
> +            sound-dai = <&cpu>;
> +        };
> +
> +        simple-audio-card,codec {
> +            sound-dai = <&codec>;
> +            clocks = <&clocks>;
> +        };
> +    };
> +
>  # --------------------
>  # Sampling Rate Conversion
>  # --------------------
> -- 
> 2.40.1
> 
