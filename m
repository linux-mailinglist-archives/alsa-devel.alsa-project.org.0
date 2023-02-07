Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D0F68D4A6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 11:43:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CA16100;
	Tue,  7 Feb 2023 11:42:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CA16100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675766608;
	bh=g+4xhmQwUPeZbLtJGPIo1PtBXjyelUbEewpfe+8SedM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U4u0W6TjX6TYGQvWZIZnZvAY1tGMoAq8CYhnaR7Ktqga2fnxsBbDpkQ4OVmv42v6C
	 QWS8qE5R3Dh2lEsBl+DYrgxawA66osBi/xVLxTiSMLfCoTQ+Kp6lGDEQrXDTVt+Ojq
	 Hn+6zayw91bIETx7AweTEs/99MnEiBz6aFCbee48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98378F800E3;
	Tue,  7 Feb 2023 11:42:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D78D1F8045D; Tue,  7 Feb 2023 11:42:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61B25F8014E
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 11:42:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B25F8014E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UHX61DtM
Received: by mail-wr1-x434.google.com with SMTP id d14so13074441wrr.9
 for <alsa-devel@alsa-project.org>; Tue, 07 Feb 2023 02:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AjQX5toyVmZyFFEDPSoSrTaqoGSIHeRpLwxYhtU6050=;
 b=UHX61DtMSMsDlTukE3lUUsvg7WmUUbdO41vBdM7YAVGyZyrIhDBvj3ZRGpgDwnN7CR
 ZAQc19T3RgcgNoKKVQDtKdtQ2wc4VM0SWJzjgTfFMq9T10FhyOcG09vbME5Xd/rgHDHD
 3HvNY+WFXm1YcmXykLH8Ztod4TkZYUcSuMW7sNoP9Sh591xJpRmFYJsPQr/1ciYdW8NI
 YDebVX59G7VmmV6PK9n/Wq1WBTxLY2VGqZbvMFjPIP+zpWto4bGIWgtytwyxwryHjT1R
 Pqwi6c1G7+HALb70TkQ2EaLZfd+VFoXehvx0ObbA0+iLcET6WR78ylGkf9m/8gg6PNFU
 ynJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AjQX5toyVmZyFFEDPSoSrTaqoGSIHeRpLwxYhtU6050=;
 b=LXIgKAp5DMbe8N/VFn/fBFDi+cWEFjHhBvd36ePy2jFrxuDk0z7JZ8ifQ0lafBAbJk
 9g4mQMwIOjpqBlDp1TXX3XQYTWQGBvHtqOtJqiANgXAnG6w4d8AcFNgXR2ASwijkSB5I
 e+vhZT290StpLr0TaeQa+z9HqO0zvx9x3xrYoqicrTcybe86KWkaJJlNN9r8nvrN41fH
 RnGCtlosptjM6bZqEKxOHdZrWlAes3sn54t74USXU9LN7dTTY3UJe5OLTRhdFDHpAUgK
 J5PRhKJj0c/mr/o6NHaFVEN7IxxFUXA8qAATYvgzuSmp8OPtBvTXsobMVhmbPXojErTb
 LJvQ==
X-Gm-Message-State: AO0yUKUkKhwKD/eES1O9K5XSTI3E2M07uZWiPWOthMd7PV2tj7dJjSVX
 cWE5cdpSGRWllocIcEC04oY0AQ==
X-Google-Smtp-Source: AK7set8cj+1hsFTMCBGD6WhztYFclKHDVzs8N4JlHw+lhZTiXnlFlFe+TW8Mnp0zjORJwHU2fazPkQ==
X-Received: by 2002:a05:6000:985:b0:2c3:be89:7c38 with SMTP id
 by5-20020a056000098500b002c3be897c38mr11888335wrb.27.1675766541488; 
 Tue, 07 Feb 2023 02:42:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d408d000000b002c3f42f3687sm1307866wrp.72.2023.02.07.02.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 02:42:21 -0800 (PST)
Message-ID: <44faeca1-94c9-4423-d87a-03d80e286812@linaro.org>
Date: Tue, 7 Feb 2023 11:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] Documentation: cs35l41: Shared boost properties
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230207104021.2842-1-lucas.tanure@collabora.com>
 <20230207104021.2842-3-lucas.tanure@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207104021.2842-3-lucas.tanure@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 07/02/2023 11:40, Lucas Tanure wrote:
> Describe the properties used for shared boost
> configuration.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> 
> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
> ---
>  .../devicetree/bindings/sound/cirrus,cs35l41.yaml     | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
> index 18fb471aa891..6f5f01bec6f1 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
> @@ -85,11 +85,20 @@ properties:
>        boost-cap-microfarad.
>        External Boost must have GPIO1 as GPIO output. GPIO1 will be set high to
>        enable boost voltage.
> +      Shared boost allows two amplifiers to share a single boost circuit by
> +      communicating on the MDSYNC bus. The passive amplifier does not control
> +      the boost and receives data from the active amplifier. GPIO1 should be
> +      configured for Sync when shared boost is used. Shared boost is not
> +      compatible with External boost. Active amplifier requires
> +      boost-peak-milliamp, boost-ind-nanohenry and boost-cap-microfarad.
>        0 = Internal Boost
>        1 = External Boost
> +      2 = Reserved

How binding can be reserved? For what and why? Drop. 2 is shared active,
3 is shared passive.

Best regards,
Krzysztof

