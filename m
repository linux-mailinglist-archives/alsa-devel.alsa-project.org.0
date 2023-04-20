Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E61946E9459
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 14:32:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07DA7EDC;
	Thu, 20 Apr 2023 14:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07DA7EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681993920;
	bh=ryussU7HDvaSIJDw61KH1yGmewcho7z6so3MJiuSbFg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qEm1XlnksHN1kaWHwhWATdV8FWYJCSsI4/1xtbjs4xMhY5BxUvfbvJSOmS4EQWYjb
	 ypKSBCXH9iBqBUQygHsjJj487Ji1QGhB8V/oP+y7Q8tb0tNsQtRIbcNoRqVQm1E1lj
	 TC9hUsuExM4ktptFlMkbJSRg4tb2fDSwqmM0WbJs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E46CFF804FC;
	Thu, 20 Apr 2023 14:30:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0D94F80510; Thu, 20 Apr 2023 14:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0E35F80212
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 14:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E35F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lfm2Ps5v
Received: by mail-ej1-x636.google.com with SMTP id a5so5982040ejb.6
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681993819; x=1684585819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AH3tKKTTbR7ydKTmk89P7HY1g6F2kMXmEFuZQTvaqAE=;
        b=lfm2Ps5voBZpRWSgtp1JnnrKXApYgIzvhki/Gi1i1/YZAzamhfj9P6lDcLEuTym4ew
         ZyXvL66Dn9GaQu+V6LQISR3t+iE8PSXWllVaL+5hrGA66tT883KxlXIIJMqg9pcBAuJJ
         Zzz5ndepDFnw1M4TR3nJUiqsHqOtBSkpeb+8hR60ILutQR8XqU5xF3FHt38hMkEwwEsi
         OKEiDXau/yf2EyrROmqUYyEd/gcVf6ngyeGbd0Gkl/xhbKAMI5D0L8WJ9YXWswoyMcxC
         h3MAXulvmDrg+ZI8ulk9DdNGwgHxRDOeAVVEAW1UrtHXhNvF96NBaJUR1DEU8Jlv9hZx
         zghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681993819; x=1684585819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AH3tKKTTbR7ydKTmk89P7HY1g6F2kMXmEFuZQTvaqAE=;
        b=bmbcXbNklFVi/cMNO4pay2fSgpwiJq18mzV5AnOn/N9EmE6QavN+0QUdjXtgb2qkEc
         fcSMv7vtjrARZHq+g6gye/Zl6sqLIuPGtPwK7EYhDANRmRUNUqEahJN9COpdA2orcf4W
         SnIFuFMGUQTIJip8GyFe+FvWxNBmuwJhRleBRcUYVcnJI7DDPTAx9gtPBM6ck4Y/Ih4y
         Gih9JorJmwO7IxwifTO3Dkn5ya4f66l4Zau2+4XvND0N6OY5xFCjMBjYmAtAP3DGRVOt
         dmZIZmthwMHDIFKhcClNlCi1PCfcopxhG6SqHrbWSSgXj6bwM5D8EFsQNIhaOyD2icHC
         5i8A==
X-Gm-Message-State: AAQBX9c3p706hhBmTLSuUTcXXgDR3cVnS9f77C97H2fkGVrnWC++YJ7b
	kKZ0EeSKzl98WDVxlL3MEnuQvzeU885VsIuf/2ByqA==
X-Google-Smtp-Source: 
 AKy350Y2xDKZe/gbJvtstCxeETEqBiQ9MDJOoV3vTS92ppsMpVgAHyLVPr3IWjXlLvuSyvoV/tvBWQ==
X-Received: by 2002:a17:906:f8d2:b0:94f:705e:d9e4 with SMTP id
 lh18-20020a170906f8d200b0094f705ed9e4mr1349881ejb.31.1681993818974;
        Thu, 20 Apr 2023 05:30:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771?
 ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 ce17-20020a170906b25100b009532427b35asm691504ejb.7.2023.04.20.05.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 05:30:18 -0700 (PDT)
Message-ID: <fe6202ee-2552-8b5c-c2d5-f2f7042b901d@linaro.org>
Date: Thu, 20 Apr 2023 14:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/6] ASoC: wcd938x: switch to using gpiod API
To: Mark Brown <broonie@kernel.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
 <6b355201-a957-4fca-a513-d5fa0742fb40@sirena.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6b355201-a957-4fca-a513-d5fa0742fb40@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JWCNYKXTOU5QHBY2TJEYALBK7ENDVW4O
X-Message-ID-Hash: JWCNYKXTOU5QHBY2TJEYALBK7ENDVW4O
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWCNYKXTOU5QHBY2TJEYALBK7ENDVW4O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/04/2023 13:58, Mark Brown wrote:
> On Thu, Apr 20, 2023 at 12:16:12PM +0200, Krzysztof Kozlowski wrote:
> 
>> -	gpio_direction_output(wcd938x->reset_gpio, 0);
>> -	/* 20us sleep required after pulling the reset gpio to LOW */
>> +	gpiod_set_value_cansleep(wcd938x->reset_gpio, 1);
>> +	/* 20us sleep required after asserting the reset gpio */
> 
> This is inverting the sense of the GPIO in the API from active low to
> active high which will mean we're introducing a new reliance on having
> the signal described as active low in DT.  That's an ABI concern.

It's bringing it to the correct level. Old code was not respecting the
DTS thus if such DTS came with inverted design, the driver would not work.

We were already fixing the upstream DTS users and I thought all of them
are fixed since long time (half a year) or even correct from the
beginning. Now I found one more case with incorrect level, which I will fix.

> 
> I remain deeply unconvinced that remapping active low outputs like this
> in the GPIO API is helping.

The code is mapping them to correct state. The previous state was
incorrect and did not allow to handle active high (which can happen).
This is the effort to make code correct - driver and DTS.

Best regards,
Krzysztof

