Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50978786812
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:05:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60BF1839;
	Thu, 24 Aug 2023 09:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60BF1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692860718;
	bh=9NirbcNFlrQ7BmHdEEAJislSU+KO0jCMo+gsyovPAD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DRIOBA3xfRPK52/T/LTjdro3W96RW/GSxHf7xzjnijaxkdT74++R0XcgO7q+WzgGB
	 xNOtnqVxIB4RaMetxKL7Psao6Gl3eJsqaC5vQ4mv9XoLoibRBWPnHY+VnOEz2rHsar
	 1NWm4wWuDuH1IaqmAK5rf0NYQbP+bZmMYLu5SbRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C4C3F800F5; Thu, 24 Aug 2023 09:04:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA33CF800F5;
	Thu, 24 Aug 2023 09:04:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3B07F80158; Thu, 24 Aug 2023 09:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFD62F800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 09:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD62F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=J/3793hr
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99df431d4bfso832357166b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 24 Aug 2023 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692860588; x=1693465388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P45nAftBMkI9aO/uXRibti5ezjszBIQ2T+bQqiHAg7Y=;
        b=J/3793hrGTYLIQrFLs/3h4rLwByn+HYPUKOvdOVBZlRd49ONEBMKcLI2nh5WpE7pOo
         UsO/Bvg2lPXd1bP9iKhA5AWiUX6XfhUQ9I7QIgiG0uwfzuW8NctmXlwOh/F8qgAiJyKH
         nQpgGOy6tYTYHe06Z8P5v1zwdNuegaggmRC4G0ZkHv8NM7TXLgDRQzWq1L81IEoj6HgL
         p8VZmyGRCuFgu7t3pVqyL6T8NSQ95KBB+hbbbBjBHx2wMwnztJGjGSXdwmyfvG7r9p7E
         d2nJS14n/zfM5s3aoHnG3GMK8MrT1Gfh+3NFsWKnF7uuIFix3AXhtQkqZPYGyZN571kZ
         ZrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692860588; x=1693465388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P45nAftBMkI9aO/uXRibti5ezjszBIQ2T+bQqiHAg7Y=;
        b=FPJK2ikkld7IMxu8tNocu0Twbb7XPvep7eGIvdVyXofkG1dMApvt0Ca+sjChDwEnuT
         6mPWN6ZuAXZBF3sD5duknFiYRQ2I920aA3Ste3xVFmFnLdQusqtFsqqaSRvou+wIaaZk
         /dHS3iu7IpabDOzlITsRLKzQ96n1Dnoexk7k9yDWuCeo/Dvsu5W93AyY+65HQo7MKfAb
         KJmkq0MhmmnGlv6uUydtHBqTC/RZzhSN+4gRNV9LQ20nC+Y20KLeoHK1T+DaFdiSrywu
         Uxd9AdtKaQTkWhaeq1qpPLihgc+pfR0HHMWc8aEVHvWEZRcg72wnbYrtMCOrNQ3+YthC
         sTWg==
X-Gm-Message-State: AOJu0YzY55W2TlhWDOYEnvAZ8lvJ8VAoh4R/Vh1A/sFlb+0XQZhKSSf3
	BDPNvjp6SgL/m5BSubuBwDC4Ng==
X-Google-Smtp-Source: 
 AGHT+IG9k8iOK1esFA6zAJ01EbUnrxPhvANPyRf1UsmBAx7WseNQfibQsTJkl94LBBFoLMX8n0VUjQ==
X-Received: by 2002:a17:907:2c54:b0:9a2:1e03:1572 with SMTP id
 hf20-20020a1709072c5400b009a21e031572mr305572ejc.19.1692860587958;
        Thu, 24 Aug 2023 00:03:07 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id
 c8-20020a170906528800b009887f4e0291sm10559750ejm.27.2023.08.24.00.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 00:03:07 -0700 (PDT)
Message-ID: <413bb886-a734-e607-8dd3-79ee501416b2@linaro.org>
Date: Thu, 24 Aug 2023 09:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for
 "allwinner,sun20i-d1-codec-analog"
Content-Language: en-US
To: Maxim Kiselev <bigunclemax@gmail.com>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20230805180506.718364-1-bigunclemax@gmail.com>
 <20230805180506.718364-3-bigunclemax@gmail.com>
 <20230821154739.GA1720453-robh@kernel.org>
 <CALHCpMjoxV+sUh6KSVXfEcWgc_ETBHWo2a7xHMT-nKS2xBYOvQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <CALHCpMjoxV+sUh6KSVXfEcWgc_ETBHWo2a7xHMT-nKS2xBYOvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2IJYVLTU4KFUG2MZG57REN2CGV6BPCW5
X-Message-ID-Hash: 2IJYVLTU4KFUG2MZG57REN2CGV6BPCW5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IJYVLTU4KFUG2MZG57REN2CGV6BPCW5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/08/2023 18:13, Maxim Kiselev wrote:
> пн, 21 авг. 2023 г. в 19:47, Rob Herring <robh@kernel.org>:
>>
>> On Sat, Aug 05, 2023 at 09:05:02PM +0300, Maksim Kiselev wrote:
>>> Add a DT schema to describe the analog part of the Allwinner D1/T113s
>>> internal audio codec.
>>>
>>> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
>>> ---
>>>  .../allwinner,sun20i-d1-codec-analog.yaml     | 33 +++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
>>
>> Looks the same as allwinner,sun8i-a23-codec-analog.yaml. Why can't you
>> use that?
>>
> Hmm. You're right. But let me explain my decision :)
> When I added a new file, I assumed that since this is a separate driver,
> then the binding should be in a separate file.

Driver architecture of one give OS does not matter for the bindings.

Best regards,
Krzysztof

