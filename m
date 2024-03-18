Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA91087E7CD
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 11:57:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CB53238A;
	Mon, 18 Mar 2024 11:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CB53238A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710759425;
	bh=ktqhDBsasebif64PIWUFmzzdHaGOsLDzz8vPPDymlSQ=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sMePtIE0Ai6c93coCa7wS6Qa81Aks/RVPy/jZnxTtLdsNPFsCdHy7pTpwic4XjnfO
	 BKIf17NPS7wdxPg4B5ptfdB0mKZhTRceH1JrYPISrLq51W1xaxzs6qmrfJOfUwnNIv
	 AkiXajCQ94pEHzr9Y3J8aMguNWNpbnOl2qG7QXnE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02D72F80580; Mon, 18 Mar 2024 11:56:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AA64F805AA;
	Mon, 18 Mar 2024 11:56:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B2CBF802DB; Mon, 18 Mar 2024 11:56:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A97AF804E7
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 11:56:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A97AF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=T83ILZnh
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d29aad15a5so51151091fa.3
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Mar 2024 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710759383;
 x=1711364183; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=F3i97oXHe0eAhEUjD88GKSO+6DE7eLwPQSdXhNfZFbQ=;
        b=T83ILZnhigHhLT/X2WOVh+ypOGB2/xg7/Os4jIBmMBiKdctqn3PMOCSbAoQ2CvSr10
         wH1C41zV0GpE+WAb59tP7vm0uTKw9t13zf/3AQ9iOili0OkaoFnAtT8jj2vRUlF0qylC
         F3SHst7rBGPRBjnlEN/ec3kIdWNj1ZkQS4ZqSMnaUwwAVXU16XmMek09ZcaQ/5sjePp0
         +qLXjUFkrkdN1qQtTZx2chvIPuhfV1X523WWpC2M5eunKJSe337x+Zp3/Ln6nQcyuenp
         CLbVdWPuIJ/Q4nel04/BNnxn2HLAuvFTqMuFzSbgTIP6DiedQJYRVHBLTBXo6tpQBGSk
         R8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759383; x=1711364183;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3i97oXHe0eAhEUjD88GKSO+6DE7eLwPQSdXhNfZFbQ=;
        b=jMQrzoh+2ofAEOnxXIj3b4mblTq6J0muQUkT4W8ujLj79E4Ukv7LRJkxNrn4Lq3G56
         4Tp37WTW1iz+sEvPs0fP82tyfZ5EWDWojpi3NMMIksUOzjT4GwLbKBx2fvpP6UhbgABM
         1eMJ/mnVjFPy47YHewZzAJons5ot5Lg8X0ucwNuu96kk6Lt3v49rKqKbxhl4zw1V3CDp
         JKb9zJzVcWxfmF5xV96RjIac08CUscIAoOknV+hz/6mlLt8yImUM3xmJJk1QG6yPPxVi
         snCvBLBsdbIftOMbQOZGaNvDkOHjq9a5b5v9Jvk2Lk0I3VquAjnLAQet/Mdw+V9wdVbE
         AdAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZJENdI3whu1dOpWI3UQDpUMWM1MVELycEuOGZth1PC9rlsDHxLsHMaTxOe/MmdA+zd8/Tv/nKz0w8Or0nnU7gzqWZoiHZAecqcqs=
X-Gm-Message-State: AOJu0YwijEjhQ5h290TF8OMPiCMcGhykX3Eh6W2UtaYSIh27lAPePVTM
	Z9qtWlTX8V6/BLZys1JBguUmP/Rh0MmNnkUfPkr6/HKNd7IizPasR73LjJ9kZrw=
X-Google-Smtp-Source: 
 AGHT+IF2t1NObGaOQ+IPe7s03JmYlEbsyaNF+u7Gb3UFP+mZEEcwim7+2sDBYhdUxYtGEoaRHjxYsg==
X-Received: by 2002:a19:8c0f:0:b0:513:9da7:3792 with SMTP id
 o15-20020a198c0f000000b005139da73792mr7100240lfd.19.1710759382830;
        Mon, 18 Mar 2024 03:56:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c3b9200b0041407100b3csm7809350wms.30.2024.03.18.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:56:22 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
 <1jil1nhjwd.fsf@starbuckisacylon.baylibre.com>
 <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
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
Date: Mon, 18 Mar 2024 11:55:35 +0100
In-reply-to: <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
Message-ID: <1j1q87hkq2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: CA76ECDRBQENXZLYMFVTLFDLNGGCED26
X-Message-ID-Hash: CA76ECDRBQENXZLYMFVTLFDLNGGCED26
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CA76ECDRBQENXZLYMFVTLFDLNGGCED26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sun 17 Mar 2024 at 18:52, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/15/24 13:22, Jerome Brunet wrote:
>> 
>> On Fri 15 Mar 2024 at 11:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> 
>>> On 15/03/2024 00:21, Jan Dakinevich wrote:
>>>> This option allow to redefine the rate of DSP system clock.
>>>
>>> And why is it suitable for bindings? Describe the hardware, not what you
>>> want to do in the driver.
>>>
>>>>
>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>> index df21dd72fc65..d2f23a59a6b6 100644
>>>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>> @@ -40,6 +40,10 @@ properties:
>>>>    resets:
>>>>      maxItems: 1
>>>>  
>>>> +  sysrate:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: redefine rate of DSP system clock
>>>
>>> No vendor prefix, so is it a generic property? Also, missing unit
>>> suffix, but more importantly I don't understand why this is a property
>>> of hardware.
>> 
>> +1.
>> 
>> The appropriate way to set rate of the clock before the driver take over
>> is 'assigned-rate', if you need to customize this for different
>> platform.
>> 
>
> It would be great, but it doesn't work. Below, is what I want to see:
>
> 	assigned-clocks =
> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_SEL>,
> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_DIV>;
> 	assigned-clock-parents =
> 		<&clkc_pll CLKID_FCLK_DIV3>,
> 		<0>;
> 	assigned-clock-rates =
> 		<0>,
> 		<256000000>;
>
> But regardles of this declaration, PDM's driver unconditionally sets
> sysclk'rate to 250MHz and throws away everything that was configured
> before, reparents audio2_pdm_sysclk_mux to hifi_pll and changes
> hifi_pll's rate.
>
> This value 250MHz is declared here:
>
> static const struct axg_pdm_cfg axg_pdm_config = {
> 	.filters = &axg_default_filters,
> 	.sys_rate = 250000000,
> };
>
> The property 'sysrate' is intended to redefine hardcoded 'sys_rate'
> value in 'axg_pdm_config'.

What is stopping you from removing that from the driver and adding
assigned-rate to 250M is the existing platform ?

>
>> Then you don't have to deal with it in the device driver.
>> 
>>>
>>> Best regards,
>>> Krzysztof
>> 
>> 


-- 
Jerome
