Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B793387E96E
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 13:37:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAD6021B3;
	Mon, 18 Mar 2024 13:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAD6021B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710765475;
	bh=ffVSz7DOuhkOHsp+hZtUJyFaeYyOmG7SnEA1gJweHr8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g1KEhuFKTLCKJPaWn5r0FnsKMeHc8jDlTYsbYyy61JHMTEQgMZBtvscwZvmgX3KUA
	 4/heUiBGnSVmuPWb8K3KB3nYggCJyi7nNE9gzQpXHbWliYjk9p5E+hKk79XlLk0/0l
	 XQGDmT239AnF73bzW7Oi0i7vh/EtaBU66NIbmtvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EB49F80564; Mon, 18 Mar 2024 13:37:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA4A2F8058C;
	Mon, 18 Mar 2024 13:37:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40D17F804E7; Mon, 18 Mar 2024 13:37:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF002F80093
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 13:37:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF002F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=bwHek9m/
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso2673651f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Mar 2024 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710765427;
 x=1711370227; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=rOOelAXYkB/aiK2SaiRN9v1LrZq2BMclSsiRMOgV+hM=;
        b=bwHek9m/rwIMptKMQR1RgQvX+haev0b+VWuttXZqJkXgIc4PxA8lLPeqOn8n+hklZu
         RlzFL4VyIcxoWdz96tnfK9AjNor2NlTk2H38tjgWspCs1jTk+Fy11PkaXne/Q4jc2Fzv
         AQFQiZAe59L9gSwATQKOl0Ss5sVItfTvAmcVjUrmpdpGkdPg9d8vwPBUxpcBH7ykQkIz
         CeUHIH4izQZT8NarsYbLPdzjO+GlE9sr3g6rzAwg2YftNoph0y4OJYKUVlfu9cxadZFB
         0qKZtcjoRTrhHaI6d5vhcxl6CeFdl+A80Run4XiwQRLBylSd4zqZ1vXLVhB5ePY6+mR2
         vjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710765427; x=1711370227;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOOelAXYkB/aiK2SaiRN9v1LrZq2BMclSsiRMOgV+hM=;
        b=ewIYw+NBueI9DlO7AAoxNs63o1c2avcKOznPxK74XvpX5xwd2LOAqZ0j4ba6MyXj2m
         XBcCCgfSMxSUwtHtMet0xVpkymxYBuTIdx9ojmD3u1WmCA2QsvCthVHNIiue72pdMgBc
         DXR33QBx2Ij/R6VwIAA+ScoCpt+z8YFdzYnz3dds6sHV/VI9dvHQD99idOPzfEWzQKfY
         AefaCNYw8jqwH3qtU/rEnRtRQAe7FMBnsTUGRdzl5OM8w/VaSMTLrU4XYgrR726JC71W
         M5A9mH524QAxVqGJBTk7DuNGyBpjGWu0oC9v/5wqqPN5g88D0Y9suJTNpq60wXEr9jWE
         C0dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFA5F+ISpecT7u4byDEzLBRwQrZ34kiaKXgjjbBidKaWJw04AU5ooLumJkhru6CoIaV0/Y4aGFwgkDZFAY+J8rGA54V6eox79+m/E=
X-Gm-Message-State: AOJu0Yy43TSIJHtNiCP0XP0de2pXlB+coT9PT1vxLXSRAmn+g1AYNSuv
	XzsCSqKpvkT1i6Q6BpZFs3o8a8K/ebfwbyr54KyX9n7+3jW0UFSC1QABF/Eh9Kc=
X-Google-Smtp-Source: 
 AGHT+IGH3TE2GhAXJz1wHAYIWwW1VoL15oPzUDNMTpeZ23Nb9XboEbKTQoGyB/c9i7ijddIXELni7w==
X-Received: by 2002:a5d:404a:0:b0:33e:6a81:d8b9 with SMTP id
 w10-20020a5d404a000000b0033e6a81d8b9mr10519425wrp.20.1710765426924;
        Mon, 18 Mar 2024 05:37:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b0033e79eca6dfsm9665379wrm.50.2024.03.18.05.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 05:37:06 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
 <1jil1nhjwd.fsf@starbuckisacylon.baylibre.com>
 <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
 <1j1q87hkq2.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
  Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
  Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 13/25] ASoC: dt-bindings: meson: axg-pdm: document
 'sysrate' property
Date: Mon, 18 Mar 2024 13:19:28 +0100
In-reply-to: <1j1q87hkq2.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jwmpzg1hq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: VKLVYMBYO6DBBK5GBVVBRZFR66RHM4FA
X-Message-ID-Hash: VKLVYMBYO6DBBK5GBVVBRZFR66RHM4FA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKLVYMBYO6DBBK5GBVVBRZFR66RHM4FA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 18 Mar 2024 at 11:55, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Sun 17 Mar 2024 at 18:52, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>
>> On 3/15/24 13:22, Jerome Brunet wrote:
>>> 
>>> On Fri 15 Mar 2024 at 11:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>> 
>>>> On 15/03/2024 00:21, Jan Dakinevich wrote:
>>>>> This option allow to redefine the rate of DSP system clock.
>>>>
>>>> And why is it suitable for bindings? Describe the hardware, not what you
>>>> want to do in the driver.
>>>>
>>>>>
>>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>>> index df21dd72fc65..d2f23a59a6b6 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>>> @@ -40,6 +40,10 @@ properties:
>>>>>    resets:
>>>>>      maxItems: 1
>>>>>  
>>>>> +  sysrate:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description: redefine rate of DSP system clock
>>>>
>>>> No vendor prefix, so is it a generic property? Also, missing unit
>>>> suffix, but more importantly I don't understand why this is a property
>>>> of hardware.
>>> 
>>> +1.
>>> 
>>> The appropriate way to set rate of the clock before the driver take over
>>> is 'assigned-rate', if you need to customize this for different
>>> platform.
>>> 
>>
>> It would be great, but it doesn't work. Below, is what I want to see:
>>
>> 	assigned-clocks =
>> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_SEL>,
>> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_DIV>;
>> 	assigned-clock-parents =
>> 		<&clkc_pll CLKID_FCLK_DIV3>,
>> 		<0>;
>> 	assigned-clock-rates =
>> 		<0>,
>> 		<256000000>;
>>
>> But regardles of this declaration, PDM's driver unconditionally sets
>> sysclk'rate to 250MHz and throws away everything that was configured
>> before, reparents audio2_pdm_sysclk_mux to hifi_pll and changes
>> hifi_pll's rate.
>>
>> This value 250MHz is declared here:
>>
>> static const struct axg_pdm_cfg axg_pdm_config = {
>> 	.filters = &axg_default_filters,
>> 	.sys_rate = 250000000,
>> };
>>
>> The property 'sysrate' is intended to redefine hardcoded 'sys_rate'
>> value in 'axg_pdm_config'.
>
> What is stopping you from removing that from the driver and adding
> assigned-rate to 250M is the existing platform ?

... Also, considering how PDM does work, I'm not sure I get the point of
the doing all this to go from 250MHz to 256Mhz.

PDM value is sampled at ~75% of the half period. That clock basically
feeds a counter and the threshold is adjusted based on the clock rate.

So there is no need to change the rate. Changing it is only necessary
when the captured audio rate is extremely slow (<8kHz) and the counter
may overflow. The driver already adjust this automatically.

So changing the input rate from 250MHz to 256MHz should not make any
difference.

>
>>
>>> Then you don't have to deal with it in the device driver.
>>> 
>>>>
>>>> Best regards,
>>>> Krzysztof
>>> 
>>> 


-- 
Jerome
