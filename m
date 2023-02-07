Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DF868D6C5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 13:31:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90FD020B;
	Tue,  7 Feb 2023 13:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90FD020B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675773100;
	bh=FFwwDf+UCQzbJgF3M6gFgTEfu+yzCFegido4Rysx/Ik=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IOeRVcg5y+sdL0mvvTcxW5TaL1YTq6DbiPfWSqZakHRa21Cs67YsJPwiTMCIN6Ygc
	 zQ1drTlyxZWkUG0OS+JGIQW3qHitTfm+k+SxZE4PHQqjwzJwL3yZFFJGPgV3cbWPO1
	 HMXWMReU5CAj2XMg1NcZ69sxAhNORmHksHgI1EKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9657F800E3;
	Tue,  7 Feb 2023 13:30:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71F1DF8045D; Tue,  7 Feb 2023 13:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA1A0F80240
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 13:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA1A0F80240
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lD9EZ7RP
Received: by mail-wr1-x433.google.com with SMTP id j25so9853269wrc.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Feb 2023 04:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uo8Ualo99d53mmVi49FY+l820ilSRXIZGdKs4k2O74k=;
 b=lD9EZ7RPG6IizC5UEkDoAl2VLeg5YjRQJ9YuKzsS3PDhjFqSwmEkcfqb42JvX1M6PO
 jPwtqoYOWqmM8JxVJeAoMdRkwyLbWEWCf8iYoetSVVUw016uSm8r2XFY05mJ72meJu4b
 KLAaRI0zu3/9Slfx96CHzXB5AYW4gdj64B1X21R3beCnHSIQUsQfLV7RJB0IDWNv6wDz
 gJe+jj4fgugWXWjR5iOZMGNBsM2KDOLHH6cvvJuNQMmfcNmw1RFam2SYz8uCgWjP84Bk
 vsXdFu4q9yz6zrJ0t0507194GRN7eVBQr09dQLvVkrO0gaI53cfYu8ltm+OkSQMFA3Wc
 4PdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uo8Ualo99d53mmVi49FY+l820ilSRXIZGdKs4k2O74k=;
 b=4Eqp1oAOE9HHpQmhhMyRpmAltYDYkFRkO75Pn4GFmg36/IkRyl86BsSs13uzWbEIhp
 2G0Ygwu6toQO4KBZUrse3X1kf6ltktXrpPbk+A3sFh0wVvZ/mq/ZJCCy4DKf6boe5+eT
 k/pGxnnF5EfqVXuPxGTbAXz/xUuO/pFMkQeT8G9odFCUM0wwhjijQX2vTbs5fNAHU58a
 V20TV7pQDSqB6BK4XDrT6BoOKEYhTkHWfy6N2y/ABdPvngt7VxFfqP8Ye6gTYC3tecNP
 6HR1AwKREULCJdrf+CZL02wXgf82KuY9At6NG1/nWORB8hofhVgF+or+34Y4+phuMjgv
 p7gw==
X-Gm-Message-State: AO0yUKW2fRtxI+YXH/nlnNU2B6HReVsDZNi+kiHdTEIiWp8UEdfJfrJh
 8OAaAlpCozA1dqB1CHgXfTGDudLKUYdOASYk
X-Google-Smtp-Source: AK7set/FHB9i8kE1subd+a6lk2/Py5IpC82cHNa3nwC0OUd/lRxJYlOvxC7g0sC/El2fSuhrlQBR6A==
X-Received: by 2002:adf:f6c6:0:b0:2bf:b571:1f18 with SMTP id
 y6-20020adff6c6000000b002bfb5711f18mr3028904wrp.61.1675773027151; 
 Tue, 07 Feb 2023 04:30:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002bdda9856b5sm11214256wrz.50.2023.02.07.04.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 04:30:26 -0800 (PST)
Message-ID: <6804adf4-2fba-e4f9-36ef-a6b8bacae76d@linaro.org>
Date: Tue, 7 Feb 2023 13:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-8-jbrunet@baylibre.com>
 <a711905e-dbfb-4258-62be-250a9549a9c4@linaro.org>
 <1jbkm53jvg.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jbkm53jvg.fsf@starbuckisacylon.baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 07/02/2023 10:25, Jerome Brunet wrote:
> 
> On Mon 06 Feb 2023 at 20:21, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>>> +
>>> +  audio-routing:
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>> +    description: |
>>
>> You still have everywhere | which should be removed. Here and in almost
>> every other description when no special formatting is needed.
> 
> I'm sorry if I misunderstood your comment. I thought the problem was
> with the '-' of '|-', which I removed here.
> 
> Should I use '>' for the YAML multiline format instead ?

I asked to remove "|-". Don't add any other character - why do you need
it? Multiline descriptions don't need block scalar headers unless you
want to preserve some format.

Best regards,
Krzysztof

