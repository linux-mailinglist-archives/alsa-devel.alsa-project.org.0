Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E02BE8BFDB8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8635E210;
	Wed,  8 May 2024 14:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8635E210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172744;
	bh=KnIVJedJHZe3sxJyLX2GN7WsyXIrdkUeKLWLWsv/Q5w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F0ycp2canC8aOHAzQmlWYwKclqHOAnluHcXVQwoCgUOb979LBPJpijVdqUphYv7qq
	 XmQl9XeEpu0WL8fSZoD0GT1NlkqamTOJUjow4mFF5BKENPmg5ihRxG+7iSdWluZSIJ
	 8dfgpPoeSUoUwgHLe12rAmAavwFfUVVrf6NMW7Tw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76536F805D5; Wed,  8 May 2024 14:51:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42518F805C1;
	Wed,  8 May 2024 14:51:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4A72F80423; Tue,  7 May 2024 14:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E149DF8049C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 14:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E149DF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gQgGAdK+
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59cdf7cd78so556515766b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715085842; x=1715690642;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/oIRhG5AjkWY6V2xiSuojwWNRWmfLxMa4/7v40uDqE=;
        b=gQgGAdK+lo1G7i9vJSoCWhvgHIrsrdjUThBEwGGnJkGrObh83teAbyRBb4h4tw2jYb
         5Bv01M3D9aCmCiPGe6vFKv8P7eJYJU4sqpKkFHGizLsEzPavnjUSpWsV5q80a/ceyErU
         PFesb1Yqda9pEXl/TBEHMZG/h3KF6bhbWh9kJLK+0Wr9w2cvPCjDlur3rxa42IEoHFYx
         UwbyWVU/cBeBQp6TDor5+6y1zMce/xkTO0UmlhKpvWcfTQxJq/uN8hV/TDlqAHVilOIj
         bQiuPC/4T7CiEARP83vZop0zsyZXB7WN72bvvwirSUAlkbOAIPkWiftc7UhL2qUzbRdC
         ZmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715085842; x=1715690642;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/oIRhG5AjkWY6V2xiSuojwWNRWmfLxMa4/7v40uDqE=;
        b=ChWmLtNCxSxfIWGf8vQG2bRaAaDshmJjVTjMDp5cWeJdCwv6Cw7CRmJ+LRMIfAfG+Y
         HX3daLmib8jPtmzHYFdtQJIB3FY4DjoIEv4g/5KEi7ChqqGH2ptLfqJI69ibvcbduDkU
         3OS2oXFD0K07UsxVdXibA5crwy225dSE8tUDCRZjHAZuOiJtluabnof62AdLeT6fXkcl
         3H4FI3CJPAN5pSfj3ofdGaLLIXsz2R8dIVECsbE86AUZIEIhJKKlnUtBRPsMl3nSJHJl
         WlxDJVBl4FK+uIpwS5Y8/HfPZ52cfTwIOsFgHbrmQmjT0kgU8bHiBjAOcCBOxeH8G/dl
         86hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiN7OubYnELcq1HUo7a3bK9AAJ7QocfKtWo9ydZPW7bJ3DxhuQZffpFHFUBV8l1+HibbHMNqrXER2MiwSFPmYyN9Tr9YyxF2+FxTs=
X-Gm-Message-State: AOJu0Yx+fGV0WFDs4cE+ZFDJOHdFVgR7/EkqGpXpeOPin8D2jYHkVqvs
	gqbUKd6xMbwlMtRFpzrMUJk/Y6S30IS6X3+VJnJmv4Oj9bGPdzaI
X-Google-Smtp-Source: 
 AGHT+IEH520oqokwkCG16wuOPDMKOF55ptHNw2OadsqHHoYygvWVxSH9Lxsegkq6WAFM/BF8tPoVtw==
X-Received: by 2002:a17:906:6a1e:b0:a59:b8e2:a0cd with SMTP id
 qw30-20020a1709066a1e00b00a59b8e2a0cdmr5656811ejc.59.1715085842060;
        Tue, 07 May 2024 05:44:02 -0700 (PDT)
Received: from [192.168.50.244] (83.8.126.253.ipv4.supernova.orange.pl.
 [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id
 lb14-20020a170906adce00b00a59bc8c01b1sm3321340ejb.82.2024.05.07.05.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 05:44:01 -0700 (PDT)
Message-ID: <c76fa2cc-d41e-45c5-891a-b83d5d0634b1@gmail.com>
Date: Tue, 7 May 2024 14:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: samsung: exynos4212-tab3: Fix headset mic,
 add jack detection
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
 <20240503-midas-wm1811-gpio-jack-v1-3-e8cddbd67cbf@gmail.com>
 <d1007753-bdcf-4db9-bb01-b36e742cee4b@kernel.org>
Content-Language: en-US
In-Reply-To: <d1007753-bdcf-4db9-bb01-b36e742cee4b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SJ7YBUQ2IYGDWWSPK2KFYNS7NBFEV4YL
X-Message-ID-Hash: SJ7YBUQ2IYGDWWSPK2KFYNS7NBFEV4YL
X-Mailman-Approved-At: Wed, 08 May 2024 12:51:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJ7YBUQ2IYGDWWSPK2KFYNS7NBFEV4YL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6.05.2024 08:31, Krzysztof Kozlowski wrote:
> On 03/05/2024 20:55, Artur Weber wrote:
>> Add the necessary properties to the samsung,midas-audio node to allow
>> for headset jack detection, set up the mic bias regulator GPIO and fix
>> some other small issues with the sound setup.
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> ...
> 
>> +
>>   &bus_acp {
>>   	devfreq = <&bus_dmc>;
>>   	status = "okay";
>> @@ -505,12 +521,11 @@ &i2c_4 {
>>   	wm1811: audio-codec@1a {
>>   		compatible = "wlf,wm1811";
>>   		reg = <0x1a>;
>> -		clocks = <&pmu_system_controller 0>;
>> -		clock-names = "MCLK1";
>> +		clocks = <&pmu_system_controller 0>,
>> +			 <&s5m8767_osc S2MPS11_CLK_BT>;
>> +		clock-names = "MCLK1", "MCLK2";
>>   		interrupt-controller;
>>   		#interrupt-cells = <2>;
>> -		interrupt-parent = <&gpx3>;
>> -		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
> 
> Does not look related at all to the patch.

I rolled up two small changes to the wm1811 audio codec config here:

- Dropped incorrect interrupt parent - GPX3-6 is the headset key GPIO,
   and does not seem to be the interrupt parent like on Midas (downstream
   calls it GPIO_HDMI_CEC on Midas, whereas for Tab 3 it's
   GPIO_EAR_SEND_END, so they definitely serve different functions).

- Added the MCLK2 clock as specified in the schematics, to more
   accurately describe the hardware.

I included them here since the whole patch modifies properties related
to audio (this section is what "fix some other small issues with the
sound setup" in the commit message refers to), but I can split it up
into a separate commit if it's necessary.

Best regards
Artur
