Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF1996BB16
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 13:44:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED92EB70;
	Wed,  4 Sep 2024 13:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED92EB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725450272;
	bh=TcvvGUzUyW7y66QoYl9NDBgaKlbsu4UGU0sFU9wFjBw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NKSFfgydPG8Emm2EyAiCaNVPKph5N+Pen/Ju48JQaMHpj9amMmUsJpcngX96BtIGB
	 K7vOEsTdrigd9hN4M4kBixkQBpRIaw3AbUTxi+Y/6x/ticm23ujtL9XvHycffHPqcH
	 KLlyIzrskHjeRku/9AjB0DZw5zjNHNzfSOcTJxAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC119F805B2; Wed,  4 Sep 2024 13:44:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6ABAF80536;
	Wed,  4 Sep 2024 13:43:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC9A0F80199; Wed,  4 Sep 2024 13:43:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06A3EF80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 13:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A3EF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vKKCIRl3
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a86a69bfcdaso37163866b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Sep 2024 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725450233; x=1726055033;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/59KpQl/ENj5YnZpXPnbSALUPXSSb5VrZ9vlG/9vrBQ=;
        b=vKKCIRl37HISxoNryyCfpjzy5PiJgjRm0LtJDhtQ4kB9rn//Ii2BF/zs+3ZJt9B8nq
         kyo8LSRZMdbMVHvd1O+gEF5ygXeRiigahSYHga4imd4GhxjpHfQk40KNwPgPONen5e77
         uzHnvAO2KYfFhFKfesy979M9FNl4b0GRsOK0VyOUbZQZ38veqRgNoahYbtSrYNqZXZDE
         TNSP22/DpLlkXWn3VVn0bNbcEPiX/sy/0blzPtptTbby5RfzIh34xepa6TIANGma3mLJ
         LIxiveJoiB7UavCq7jo6vvndb/tL9ZoblUJ7iPyPqpsxGwRGt7Ok3IANcJeABA4VR4jO
         h6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725450233; x=1726055033;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/59KpQl/ENj5YnZpXPnbSALUPXSSb5VrZ9vlG/9vrBQ=;
        b=ehjtaNcv1tdGCFckRWwp/0JP7DDcJ7D5uVBaJPe6N7L7f6Zmd9hu1Zz+W01rgMW2kS
         L0aN4JKa7VF2VkM+dCP8wIF/aEBUUWDdXPHPEFZApXB0iT+x6NSKZY4DYZ/1g2YHIYkr
         +hreRfBw5kLiSGT8/oZP60ZRW5t0PYpXxtjMu8zTtw1QuG+vzRVNA7XXy0PV7R1/HWsH
         Che3eRk1HjCRPR+jWDqGan9XluBE0sVd1VQHDHrH9oEALeQEhwO/shu7UJiI2YOgb8JC
         yXNrPTWLC7/hoVjEgq5QkIfWvKe9rd+NEacsw6rmTzGHdsVPyxaPeYQNDW2VG9w+Qsps
         Amlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoszvvaeqDlcdrb+RGkrNNf9ON7g+A0YPQN6PXTbo+SJOjK0Xver/Bb7/B7KuDxZ1EurGx0esP7+ly@alsa-project.org
X-Gm-Message-State: AOJu0YwrytmiLAGgCAkaVx/T5uFL1snPtGRjEXHnnANikcU/nDlpncEx
	zD7y+8HGGP+wsVKLhHQQKuzE0wDvX4p0tLXoccil60XCXGGXJVQFo6q+oyO9qxs=
X-Google-Smtp-Source: 
 AGHT+IGaWHDAbUbWROpXtvL3TzWtVqhkdhe/CfKY06N3Rz/z/TeQIlpyigCEhXFcyZnadufk631/bg==
X-Received: by 2002:a17:907:eac:b0:a79:a1b8:257b with SMTP id
 a640c23a62f3a-a89a3958e1dmr522577966b.10.1725450232555;
        Wed, 04 Sep 2024 04:43:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a1900d4fcsm266703266b.144.2024.09.04.04.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 04:43:51 -0700 (PDT)
Message-ID: <acec443c-f9ab-4c1d-b1ab-b8620dfef77f@linaro.org>
Date: Wed, 4 Sep 2024 13:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
To: "Liao, Bard" <bard.liao@intel.com>,
 "Liao, Bard" <yung-chuan.liao@linux.intel.com>, Vinod Koul
 <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
 Shreyas NC <shreyas.nc@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
 <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
 <ZqngD56bXkx6vGma@matsya>
 <b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com>
 <f5110f23-6d73-45b5-87a3-380bb70b9ac8@linaro.org>
 <SJ2PR11MB84242BC3EAED16BEE6B46F85FF932@SJ2PR11MB8424.namprd11.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <SJ2PR11MB84242BC3EAED16BEE6B46F85FF932@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KPACZ3UA2GAJUZJLR5EX5FUISM4MMA3Z
X-Message-ID-Hash: KPACZ3UA2GAJUZJLR5EX5FUISM4MMA3Z
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPACZ3UA2GAJUZJLR5EX5FUISM4MMA3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/09/2024 17:17, Liao, Bard wrote:

>>>
>>> then dpn_prop[0].num = 1 and dpn_prop[1].num = 3. And we need to go
>>>
>>> throuth dpn_prop[0] and dpn_prop[1] instead of dpn_prop[1] and
>> dpn_prop[3].
>>>
>>
>> What are the source or sink ports in your case? Maybe you just generate
>> wrong mask?
> 
> I checked my mask is 0xa when I do aplay and it matches the sink_ports of
> the rt722 codec.
> 
>>
>> It's not only my patch which uses for_each_set_bit(). sysfs_slave_dpn
>> does the same.
> 
> What sysfs_slave_dpn does is 
>         i = 0;                          
>         for_each_set_bit(bit, &mask, 32) {
>                 if (bit == N) {
>                         return sprintf(buf, format_string,
>                                        dpn[i].field);
>                 }
>                 i++;
>         }                         
> It uses a variable "i" to represent the array index of dpn[i].
> But, it is for_each_set_bit(i, &mask, 32) in your patch and the variable "i"
> which represents each bit of the mask is used as the index of dpn_prop[i].
> 
> Again, the point is that the bits of mask is not the index of the dpn_prop[]
> array.

Yes, you are right. I think I cannot achieve my initial goal of using
same dpn array with different indices. My patch should be reverted, I
believe.

I'll send a revert, sorry for the mess.

Best regards,
Krzysztof

