Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9076990F6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:19:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78C67868;
	Thu, 16 Feb 2023 11:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78C67868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676542760;
	bh=94ggYEqhjB/StNKEBuSbFBu/zKzA/fprIeSHLvMD2pI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cVlNlNT+5jV7gXKy2QmcFeB2PKHwMivDEYYwRROQAhWnMc5FNTq4L4re7BNxinfxs
	 IlsWKLdCwjwwkeuoTraFvb33uzBko+cyPPznEw6yUuMjqlOFfZ2KXhkDuhbOcbZ4ch
	 FG5Sl3XWyxhqCVWpCjgJCQE36Cy2LigKbGjZuu4Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 236D7F800E4;
	Thu, 16 Feb 2023 11:18:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AEA1F80171; Thu, 16 Feb 2023 11:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43D23F800B6
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D23F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TmElzeXh
Received: by mail-ej1-x633.google.com with SMTP id ky6so4006365ejc.0
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 02:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xRm+/4FpVvgULsREaJ7c5e2nJTQURFW8fIUCxaU0fg=;
        b=TmElzeXhZ8MfrNoiINxw/tdWJq2JGa6TL8u+fpv007IvJnZRydkm2lddBKE1nx2BJJ
         Rfv6dGu43MeuPWiqvwnEh5bxb7+qjyc/LzEX5x1vlgxKJF3OdhBEwql+A+97nHFA0Xa4
         IvUmUVjQostyxhOlmOZzCEeqa5ffZOfSuaj69rc5UgAYg+4/XpRFek4EnZKBBOZn871u
         vwzWNyQ8O3IZDGCt4XDzFwktjB46cBdlc3a7ipg9KSBXplNap+g0l6jyltHtPU9ieZe6
         Xx8KX7HD25nSAQT8aAwjNm3bT42KF9/yH/9VsVTwqQ5QPFXssZs3867EYV2HGO4kQSeV
         AWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xRm+/4FpVvgULsREaJ7c5e2nJTQURFW8fIUCxaU0fg=;
        b=n4dQJ+lwIVQ/Z8F2QSKwA3R92b5b4ZngierVi/HhBFcqVH7lfhd7HkALjy80JWyZsG
         Ks1LPnxSSkefIqrJKpoGzzy6GkexOR5s5yiu2DrayfD/uFDUzmZjDHSUZjtwbxmUlh94
         i92/Z/OL9ygAzMiwK8QhmmPWTkQb7agNlfbZRgyDBlF0cpr6/qDXG1jwJh5/aC653c1u
         IPLikcsZKE7kP1H8CXV/WZJec4okxxA3Ps/3q4MK61yKWw2Fnqt8rFn50UiyVNH5ZsqY
         yla2lh6SevRp8pULtCuyULVVraOia7EqBwT8UIReygM0B83BovtK5Be4ETzndNIBTdD3
         K5NA==
X-Gm-Message-State: AO0yUKXPrg6JZi2mgSyp/haETQy4ZLAlJPeFYN30njz6WZS1Gvw/6dUE
	b3r7fLCQEwzGlUgkyTdTvgHfDw==
X-Google-Smtp-Source: 
 AK7set+DarsZaH/hWMGy/10viYDOBB2pRRqKtjz34oEaeF2il4rj0qe7sZICD8Ug1ebcxd/f0RjKUQ==
X-Received: by 2002:a17:906:3e56:b0:878:7f6e:38a7 with SMTP id
 t22-20020a1709063e5600b008787f6e38a7mr7620274eji.44.1676542700243;
        Thu, 16 Feb 2023 02:18:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 x17-20020a1709064a9100b008b12614ee06sm610840eju.161.2023.02.16.02.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:18:19 -0800 (PST)
Message-ID: <fd2f372f-4a1c-72c0-574d-1d5ef99dbdbc@linaro.org>
Date: Thu, 16 Feb 2023 11:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Content-Language: en-US
To: Claudiu.Beznea@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, lars@metafoo.de,
 perex@perex.cz, tiwai@suse.com, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com
References: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
 <20230214161435.1088246-3-claudiu.beznea@microchip.com>
 <485d74fe-bfb5-c55e-724f-304476624abd@linaro.org>
 <954cdf90-c41a-4e21-31e0-88a0baf26065@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <954cdf90-c41a-4e21-31e0-88a0baf26065@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WKXTQ3PZLOHABW2TCY2IQIA5D6JGU2QT
X-Message-ID-Hash: WKXTQ3PZLOHABW2TCY2IQIA5D6JGU2QT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKXTQ3PZLOHABW2TCY2IQIA5D6JGU2QT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/02/2023 11:15, Claudiu.Beznea@microchip.com wrote:
> On 16.02.2023 12:04, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 14/02/2023 17:14, Claudiu Beznea wrote:
>>> Add microchip,startup-delay-us binding to let PDMC users to specify
>>> startup delay.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>> ---
>>>  .../devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml   | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
>>> index c4cf1e5ab84b..9b40268537cb 100644
>>> --- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
>>> @@ -67,6 +67,12 @@ properties:
>>>      maxItems: 4
>>>      uniqueItems: true
>>>
>>> +  microchip,startup-delay-us:
>>> +    description: |
>>> +      Specifies the delay in microseconds that needs to be applied after
>>> +      enabling the PDMC microphones to avoid unwanted noise due to microphones
>>> +      not being ready.
>>
>> Is this some hardware delay? Or OS? If OS, why Linux specific delay is
>> put into DT?
> 
> It's the delay used in software workaround that IP needs to filter noises.

Then this sounds like OS? Linux related properties usually do not belong
to DT.

> The IP is not fully featured to do this kind of filtering on its own thus
> this software workaround. This delay may depend on used microphones thus
> for different kind of setups (PDMC + different microphones) I introduced
> this in DT.

I understand your driver needs delay and I am not questioning this. I am
questioning why this is suitable for DT?


Best regards,
Krzysztof

