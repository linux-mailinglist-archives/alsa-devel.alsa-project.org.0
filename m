Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2424D58EB34
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 13:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB2BAEA;
	Wed, 10 Aug 2022 13:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB2BAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660130613;
	bh=1YzrPl+tFIqjHe2Oo07or+JX2Uojj8AUTQGq3WgkgpE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ajuin7AOLrh1Bfv/vdO27eoFoul6XC2YDSp9dYYzE/5OxTpC3Ey+AlOt/OgQuqCtr
	 y+qOQflN+igAgYVP8IxeYhn/AJYPxgstnoxqhXbV/cUre4Dx9ZmJ55tir8+uF6fFP8
	 xWMjZ0DJcAmIcfD8fi2pD2JiCAma6pWXew2KfiuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA919F80240;
	Wed, 10 Aug 2022 13:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97178F801F5; Wed, 10 Aug 2022 13:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4269EF8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 13:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4269EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Wc6xwPj1"
Received: by mail-lf1-x129.google.com with SMTP id z6so13335225lfu.9
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 04:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=KJVvJs/hdcnNTEwCF+Y2HOBUXT3s0+UCv0dsySn/kTc=;
 b=Wc6xwPj14r6834HGH06kBOKr+qJOUEjLLLFWPKNrfoTPN8zWQS2+uRj1SPdiGIof0z
 s64Fqt86/H8ud+6jATOixEykMP5zx4babwJaLYHxvxOjOz1pGnMiVFuAUwdrNsvWIPoI
 tlerqScsK+OTQy52wmGf6Zp48yDF29XG4dCPb4zUOEt0/L+Z9lfN4x2x0K1+36JCe6/M
 qlVFDwlPllTgTSxO8ft/gctYqGJ2xJeiktkCEliPjW2O+5WYwHsP4SUS6qqxv2fB2oiM
 rqjFES6VXDuYcgTmSafmFIX8ovwakhhEAlic102vVpYtp6bFSbgpFLjf5IJ1kX5pB2uw
 DiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=KJVvJs/hdcnNTEwCF+Y2HOBUXT3s0+UCv0dsySn/kTc=;
 b=ADnwEQ8ELJxLoNcR3tpXfVtK5tHGoT2UEI9Dxy0P1+qGo83vh82LItPt0pNrNi7DMR
 PJ/sPu2u4dcBoU0oor0GRC/XlXRrc+Tg9Hk8R6EIc2fPao6ITz7t6RrtzHp03V/N5b/A
 ebTgHf+I2l5ITu5jHhDsuvIo96DYSjhZ2W8FdilDfZfMSMvtVXDl8y/u9xmg5a7CC2yN
 VcigDQU65EQhqpHeNYLjFcakPztB3v+7bqjxFpmUw7vdPzExihmjaU/yABqTy4Q4qKk/
 rgvqcYwpWbRwpQXESa2hvtEWDPVegPvDtV64L9mrmmis8IT2CrbrWqzfXF3z1AqB0ezW
 RfOA==
X-Gm-Message-State: ACgBeo1jGqEa9FkSdL7RiFKXkffdYitVwPzQEwck6oMjUdkECamjFikU
 t/FCbEXtoE8TqbsQQ3UQYdP7uA==
X-Google-Smtp-Source: AA6agR5sBpeeQBdFjzS2wtiHcwYuXfYhIEICyKLtIACFba5DjV5ePna+qqSY3kuQDsfF0uLZsjdGdg==
X-Received: by 2002:a05:6512:c13:b0:48b:3b30:637d with SMTP id
 z19-20020a0565120c1300b0048b3b30637dmr8195257lfu.447.1660130543208; 
 Wed, 10 Aug 2022 04:22:23 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 u18-20020ac258d2000000b0048af464559esm299979lfo.293.2022.08.10.04.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 04:22:22 -0700 (PDT)
Message-ID: <f69bf678-0188-7178-7542-9773c15c1463@linaro.org>
Date: Wed, 10 Aug 2022 14:22:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/5] dt-bindings: Drop Robert Jones
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
References: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
 <20220809162752.10186-5-krzysztof.kozlowski@linaro.org>
 <YvOP9qr2CR9n1FCe@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YvOP9qr2CR9n1FCe@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 Tim Harvey <tharvey@gateworks.com>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrew Davis <afd@ti.com>, Mark Brown <broonie@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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

On 10/08/2022 14:01, Lee Jones wrote:
> On Tue, 09 Aug 2022, Krzysztof Kozlowski wrote:
> 
>> Emails to Robert Jones bounce ("550 5.2.1 The email account that you
>> tried to reach is disabled").
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>
>> ---
>>
>> For maintainers entry see:
>> https://lore.kernel.org/all/20220808111113.71890-1-krzysztof.kozlowski@linaro.org/
>> ---
>>  Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml | 2 +-
>>  Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml    | 1 -
> 
> Any reason to submit these as one patch?

Less work for me, less work for maintainer applying and sending fixes. I
think this could go via Rob's tree as fixes for current cycle.

Best regards,
Krzysztof
