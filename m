Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 177F55BBCF7
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Sep 2022 11:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF50A1651;
	Sun, 18 Sep 2022 11:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF50A1651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663494785;
	bh=PpeYy0xeGgtBRYHZK23k/QZ9ykJ4SDh0GTJZJ7BYWLA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qV+ZlHfrkm7HdnnnSXNa/GBKw3Wp/NJyLzVVaYU97sJG3FZI2l9AYXG24z0eHEprM
	 T3eiVHY0vgPFeTC5mHuOoVMtsQamCoiuTbzeXOQqSFLZcnp3ed8hR1a6aSZJI6QvsF
	 uMUd6ycuC7dZmHWRMlUbhnQXNlf22sFC4sPOrFfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4340FF80134;
	Sun, 18 Sep 2022 11:52:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C52AF804B3; Sun, 18 Sep 2022 11:52:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14611F80134
 for <alsa-devel@alsa-project.org>; Sun, 18 Sep 2022 11:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14611F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KbFOyRvQ"
Received: by mail-lf1-x129.google.com with SMTP id a3so30285256lfk.9
 for <alsa-devel@alsa-project.org>; Sun, 18 Sep 2022 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=QDWJzJ5lOaQpmmHjTfXtnrSgkhZoBRswnPcVPm00MkA=;
 b=KbFOyRvQj0ncFWAI//huMSQy3AYbmIwXMzjUXhQ+9/suNPuG65Ztv+nihSdZtzKMGk
 IQ54DNEe4uVVL6aADC0zr3+Pt/mDK0s6OFpmTjcHYuCUil8Gb1GdDQpZ8Ddam2KoopX7
 9IejLqPh4M1FsmETpKvkrO3C2fBOuy9GZ6oFJ236F3gcManACpaKt4xlBJOMv59c2lLi
 /zORYq7VSe0KrUkmxYsVwdDOcVlpLZNuDLJosyg+ajuLWMSLAnfjvorkC+btwzBCQa+Z
 kWXXPxQngcDpAUd/GaEt3+FSO7PL7m0cRdxE8oY8uK+6ul+4sIRQ2rGjZjh+Xp7pDz5I
 sPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QDWJzJ5lOaQpmmHjTfXtnrSgkhZoBRswnPcVPm00MkA=;
 b=rIPGMUAl+y397dWT7Oo2OxAlGY58AIdeK16KNofnCgG29Xz6nWG5QqRqhNusFHDfpL
 /LmbE6tL9sSdxvLsHbgVkqyLXpMgv6E55JSMYjm1fhwHaa2pDUzStpqRjm6hZukoXLU2
 BeSHbF4nAkstm4Sql1ihyfdJa/BwYQY66NoNAesIFVKVq4DMZqOmk+SBx2uBGkq88DXO
 ET3DIhuEWLWn+fvTllb2EPNpCM6BnQ37tSWsgoPWp5XMcu6Z1PlPEscTAOodqCySPSJ+
 vc0hUz3GTXBSsZ5RVRIvaBHuTHz7lHSsEVSjzYOQU6nlxkFIom7qw1WzHXPmjY4rD0pB
 5aXg==
X-Gm-Message-State: ACrzQf3tMcN4FOJZyfWFMbWUrl6LIvGJflEnHUpcicfK3xXOTf9YhnxV
 lV93P4SOL462ymBJ+4kWQYam5Q==
X-Google-Smtp-Source: AMsMyM7c07FRjcZpKxTq1oEq3imUr70ESSilmyj+j19JPwmumypPu6CuZ1jOc7lYzYyjNHtpCQoPtg==
X-Received: by 2002:a05:6512:2308:b0:497:a290:cef6 with SMTP id
 o8-20020a056512230800b00497a290cef6mr4563377lfu.488.1663494717767; 
 Sun, 18 Sep 2022 02:51:57 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 be32-20020a05651c172000b00261b175f9c4sm4461189ljb.37.2022.09.18.02.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 02:51:57 -0700 (PDT)
Message-ID: <cb86f0e0-700f-872a-1e58-9111a96ec5b8@linaro.org>
Date: Sun, 18 Sep 2022 10:51:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/3] dt-bindings: sound: ts3a227e: add control of
 debounce times
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dylan Reid <dgreid@chromium.org>, Rob Herring <robh+dt@kernel.org>
References: <20220915113955.22521-1-astrid.rost@axis.com>
 <20220915113955.22521-3-astrid.rost@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915113955.22521-3-astrid.rost@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Astrid Rost <astridr@axis.com>, kernel@axis.c, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 15/09/2022 12:39, Astrid Rost wrote:
> Add devicetree parameters to control the insertion, release and press
> debounce times.
> 

Thank you for your patch. There is something to discuss/improve.

> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---
>  .../devicetree/bindings/sound/ts3a227e.yaml   | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ts3a227e.yaml b/Documentation/devicetree/bindings/sound/ts3a227e.yaml
> index 3512b1f1e32b..8c27f298733a 100644
> --- a/Documentation/devicetree/bindings/sound/ts3a227e.yaml
> +++ b/Documentation/devicetree/bindings/sound/ts3a227e.yaml
> @@ -44,6 +44,35 @@ properties:
>        - 7 # 2.8 V
>      default: 2
>  
> +  ti,debounce-release-ms:
> +    description: key release debounce time in ms (datasheet section 9.6.7).
> +    enum:
> +      - 0  #  0 ms (0)
> +      - 20 # 20 ms (1)

Skip comments. The values are in ms, so they are not helping.

Same in all other places.

> +    default: 20

Except that looks ok, thanks for the changes. Appreciated!


Best regards,
Krzysztof
