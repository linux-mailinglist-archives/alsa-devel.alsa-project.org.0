Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 338D57125CA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:44:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 475441F7;
	Fri, 26 May 2023 13:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 475441F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101465;
	bh=9nIp1XUsmv/uAx05IqSldEf8Y5fay0hY7jzksf7IQTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OGRHkGo5Hl6/C0TdTysCk80qfUAl7Bm0Jovtm5F0/ZrPGVr8fPmQrDzIo2p9J7FsC
	 2tfd8PrdTYF7OooMx5p74PnCnIM9vdQBCB5IqYzD3cpcS9sPV6HmCq5BlHqGFGBm8Y
	 fxS8kBi1rLqsbcwBWxucVdOJ+wSXNRvaOUMXx3sk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DB26F80557; Fri, 26 May 2023 13:42:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D69BDF80557;
	Fri, 26 May 2023 13:42:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4F89F8057C; Wed, 24 May 2023 16:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4618F80571
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 16:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4618F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=IHxSDxOc
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3095557dd99so904094f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 07:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684939613;
 x=1687531613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9Qke3iBXi7bHq6bOZpRdTikoykkN7piHbBurlNvIaA=;
        b=IHxSDxOcgTZ/KPYWpohVQG4p0ZbEiSTPcIVJB0YomCsORWeeWzEnP23G4lm4yKW3H4
         M8pWjpR3pqMS1rqjJLju/R+tua1H16uqbo32sKz9uro4i9hspQHSjFP3/Z4UIzFKnlA6
         9p0VlDcodzaicsH9Ckyd7rZ33qV2ENfP2Ke7a3h/8iPIsCGY8ULM6RIui9bJtK9ozZdM
         bcrhPYwILyuoV6Qy2aGfmD+tCnTHHY8Z/kYBfH7FG9kToWN73CDsLuSSrWItmYL7Wfat
         eoinQooIwTjvxXKYrOt4itiGM+fi+CGu9p4D7L8Yzd9NUYgIijY7yz/sEe6dyKxxKW1G
         vgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684939613; x=1687531613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9Qke3iBXi7bHq6bOZpRdTikoykkN7piHbBurlNvIaA=;
        b=bfucgPTROliRSd/leYOU+QJ1B7EQxgK4QGjT6zAEY6cExF6on1HHCDNmM1CHa7I0ai
         Yy8IlrZtrbK1O5q69L6dCb8O8/V1tb8boeFM6CFElORLWZUb2eETlmmLKbvLJR2rJzDa
         KOl4YA42Ev6TVSOstKYm2ypSbU5zQv6YOM4FAvDNAgEEmwD2ATIwBjdVLB0Je5J82wZu
         mh/4y6tA/KZQReky++wmF0lngH/7iE7oZ7XJupihZmJzwZXkfAnktLcbM7DiInhddYoc
         MH9CfgqZhpoaMy57ZWsPs1PiJKrAtOfP6b+RedXKupDGQKetBSr9Re+lrih8mrs0OyD/
         +2EQ==
X-Gm-Message-State: AC+VfDws34dDw+F9wPwOowjWjRnAsucuC5TrMsHpZ2t8DFRTF3vlK0Gg
	X8Vepe6jJUmE9ijvpYKppa9OaQ==
X-Google-Smtp-Source: 
 ACHHUZ5w6sruo9TAxLIm5fq60R7miyYwyXDbuHMJ4cdoF0aoWVmUoBqb8izRaYYGP2bjSZwq4DIzCg==
X-Received: by 2002:adf:feca:0:b0:30a:b46a:a443 with SMTP id
 q10-20020adffeca000000b0030ab46aa443mr18120wrs.51.1684939613498;
        Wed, 24 May 2023 07:46:53 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 c11-20020adfe74b000000b00306281cfa59sm14863678wrn.47.2023.05.24.07.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 07:46:52 -0700 (PDT)
Message-ID: <e7d82e49-340c-5eb1-27e3-e6cde900fcf2@baylibre.com>
Date: Wed, 24 May 2023 16:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: remove
 ADDA_BE from link-name
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-3-trevor.wu@mediatek.com>
 <cb69dbab-0966-8ecb-d9b9-017f430fd7ea@baylibre.com>
 <b9eecdf886b6496131e51e1e2f49536c782c3b67.camel@mediatek.com>
 <56b892cd-977e-5b24-55f0-df25e187308b@baylibre.com>
 <e0fb6da4974407726cdf668577fe0d40e6e6e9e2.camel@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <e0fb6da4974407726cdf668577fe0d40e6e6e9e2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: W76Y47ZSMRQH2OODSRZYEF6INDZMGN6T
X-Message-ID-Hash: W76Y47ZSMRQH2OODSRZYEF6INDZMGN6T
X-Mailman-Approved-At: Fri, 26 May 2023 11:42:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W76Y47ZSMRQH2OODSRZYEF6INDZMGN6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/05/2023 15:45, Trevor Wu (吳文良) wrote:
> On Wed, 2023-05-24 at 15:28 +0200, Alexandre Mergnat wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 24/05/2023 04:25, Trevor Wu (吳文良) wrote:
>>> On Tue, 2023-05-23 at 18:26 +0200, Alexandre Mergnat wrote:
>>>> On 23/05/2023 04:19, Trevor Wu wrote:
>>>>> ADDA_BE is used to connect to mt6359. For machine mt8188-
>>>>> mt6359,
>>>>> codec
>>>>> for ADDA_BE must be mt6359 which are configured on the machine
>>>>> driver.
>>>>> Besides, ADDA_BE is divided into two dais, UL_SRC_BE and
>>>>> DL_SRC_BE.
>>>>> As a result, remove ADDA_BE from items of link-name.
>>>>>
>>>>> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>
>>>>
>>>> I don't understand how "DL_SRC_BE" and "UL_SRC_BE" links are
>>>> done.
>>>> Why these dais don't replace "ADDA_BE" in this binding ?
>>>>
>>>> Regards,
>>>> Alexandre
>>>>
>>>
>>> Hi Alexandre,
>>>
>>> Because the sound card is mt8188-mt6359, the codec for these two
>>> links
>>> must be mt6359. Thus, I specifiy the codec in machine driver
>>> directly.
>>> If the codec is changed, there will be a new sound card and binding
>>> file. In conclusion, the codec won't be updated via dts, and that's
>>> why
>>> I don't just replace ADDA_BE in this binding.
>>>
>>> Do you suggest me add some information in the commit message?
>>
>> No it's fine, I'm just trying to understand.
>>
>> When you say "I specifiy the codec in machine driver directly", you
>> are talking about this change ?
>>
>> +               } else if (strcmp(dai_link->name, "DL_SRC_BE") == 0
>> ||
>> +                          strcmp(dai_link->name, "UL_SRC_BE") == 0)
>> {
>> +                       if (!init_mt6359) {
>> +                               dai_link->init = mt8188_mt6359_init;
>>
>> I'm asking because the equivalent was done here:
>>
>> -       [DAI_LINK_ADDA_BE] = {
>> -               .name = "ADDA_BE",
>> +       [DAI_LINK_DL_SRC_BE] = {
>> +               .name = "DL_SRC_BE",
>>                  .no_pcm = 1,
>>                  .dpcm_playback = 1,
>> -               .dpcm_capture = 1,
>> -               .init = mt8188_mt6359_init,
>> -               SND_SOC_DAILINK_REG(adda),
>> +               SND_SOC_DAILINK_REG(dl_src),
>>
>> So I'm wondering why "ADDA_BE" & "DPTX_BE" & "ETDM3_OUT_BE" are in
>> the
>> enum list of the binding since the codec is already specified in
>> machine driver too. I probably miss something but I don't know what.
>>
>>
> 
> 
> The following code snippet is cut from [PATCH v2 1/7].
> 
>   /* BE */
> -SND_SOC_DAILINK_DEFS(adda,
> -                    DAILINK_COMP_ARRAY(COMP_CPU("ADDA")),
> +SND_SOC_DAILINK_DEFS(dl_src,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("DL_SRC")),
>                       DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
>                                                     "mt6359-snd-codec-
> aif1")),
>                       DAILINK_COMP_ARRAY(COMP_EMPTY()));
> @@ -140,6 +140,12 @@ SND_SOC_DAILINK_DEFS(pcm1,
>                       DAILINK_COMP_ARRAY(COMP_DUMMY()),
>                       DAILINK_COMP_ARRAY(COMP_EMPTY()));
>   
> +SND_SOC_DAILINK_DEFS(ul_src,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC")),
> +                    DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
> +                                                  "mt6359-snd-codec-
> aif1")),
> +                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> 
> 
> This is why I talk about specifying the codec it connects in the
> machine driver.
> If you check other dai-links, you would see COMP_DUMMY() in the
> COMP_CODEC() field.

Ok thanks for the explanation. If I understand well, ADDA_BE could have 
been removed from the enum list before your serie because the codec was 
already specified for ADDA_BE.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

