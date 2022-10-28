Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C16E8611B1B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 21:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 582D5AEA;
	Fri, 28 Oct 2022 21:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 582D5AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666986410;
	bh=kP+1I//RTjvASPlBioXjy8us9fuvJxov/TP/Ffn2VLY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d8wS3oXPfiylczjKeZucO139OWZJKO6zAeGlGpM6F+VUA2RiDwai+lSmoOLe97i7Q
	 CwqE3MGydP136biw1SF5xW8Aq/0GRjgvXFR+2yJhbepmNRMSCnXM935v0FYSwl5oQR
	 lQ97/w2JHpeFjbHOBTJ7WsSxXXC5heiis5wcORnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFA0AF804BD;
	Fri, 28 Oct 2022 21:45:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C1B9F8025A; Fri, 28 Oct 2022 21:45:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4323F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 21:45:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4323F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GMbLCwoE"
Received: by mail-qk1-x731.google.com with SMTP id i9so1362314qki.10
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K7ksD5OAGesupj2q/XJlihyrsrRV0FXKxDbYSlmixcY=;
 b=GMbLCwoELVulpoDUfdY2c5Oidtr0Q2mDZYzsKsi0Mb50lPciaEKXt/dwa0PMQcaP6V
 /uf7Ih55/qvFVQLLUHEboG0EcbvwJa3erb+DHdmqr42gMdUhmZRiDkF45RiCcYXdkBNN
 vyGHwkNLBcqovgezhsQvBTd6qggJVBiRCis96q5uGvUkXfuYiVj+zcyIB+upe6luzoUV
 2VPZuXMHwICL2dyurHHVuvpzeEYWc/Hkhk6GJNVYf7O+p1xfxth6eSMOFbo80062bd2n
 TkEFCcpFEkGKCGF50gPn9TOrAwdfe0ZEk7ymN8CP8sD3Ds83pgttoTjfKlmkgVmS+N9L
 nPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K7ksD5OAGesupj2q/XJlihyrsrRV0FXKxDbYSlmixcY=;
 b=OYKXUCNm8SWjX50hOJkosd7V5bHcggsLH3u/0bZafw8ITLnujNwvuXs/iiinqh5SUD
 qESUJAWMDNGJ8bM2CZmZ6J0T+M4rqqFN42p+h90PT134CSJMWxKw5KWh+BunbcKD16mj
 g9rEu/IjZjbE0ub++vp13zH0xmHUyQPAPahO25N6pA0uu+8OP42eY4O89wlBkEQJgQh7
 e/mIshL9WKngH2tBMJs62Vai/NlJOb5X5Llj8UxsEBr/UUKj5e5XzrzAZa4XuW9jxcyk
 4iBYJUTJbyrciNUDJzpAAFoAmgFKk2p/5zZcpMqFi9LetO6yYhRQ8b02sXzTyQzk9T+I
 5bJQ==
X-Gm-Message-State: ACrzQf3IEbIjKXPjt2z80c9QkrdKFZ6J7wTJ/nWYcceK5CObxAqdjrxK
 D4sW5vvbDfSb9tQLUV16VF9iMA==
X-Google-Smtp-Source: AMsMyM55GEMVMF1srCOUQORSp0UYryYV3Ubolr2dJzAddzVtL+bSj3gMTzd1NTTw+XMQunZCATLOdQ==
X-Received: by 2002:a05:620a:6ca:b0:6ec:553a:cf33 with SMTP id
 10-20020a05620a06ca00b006ec553acf33mr756670qky.132.1666986349347; 
 Fri, 28 Oct 2022 12:45:49 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05622a010600b0039cc64bcb53sm2802673qtw.27.2022.10.28.12.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:45:48 -0700 (PDT)
Message-ID: <89a32ecf-2d9e-c50d-4da1-eb24e8f26d2f@linaro.org>
Date: Fri, 28 Oct 2022 15:45:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
 <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
 <628ac98c-0755-e6f6-e010-f1e772c4b71a@linaro.org>
 <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On 28/10/2022 14:26, Ajye Huang wrote:
> On Sat, Oct 29, 2022 at 1:58 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
> 
>>>
>>> +  dmic-gpios:
>>> +    maxItems: 1
>>> +    description: GPIO for switching between DMICs
>>
>> Switching how? Enabling? What is the meaning of each GPIO pin value?
>>
> I think I should add more like an example,
>   description: dmic-gpios optional prop for switching between two DMICs.
>                     Ex, the GPIO can control a MUX HW component to
>                     select dmic clk and data form a Front or Rear dmic.
> 
> Do you agree with that or have other suggestions? If do, I will send
> the v3 patch for you to check, thanks

Sounds better.

Best regards,
Krzysztof

