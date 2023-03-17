Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AF96BE304
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 09:21:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E0F1F76;
	Fri, 17 Mar 2023 09:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E0F1F76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679041297;
	bh=0QPMfZArZ7rWYmRbFni+eqOM4l0z7dd+4iFim97ZmzQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MO3Gnh+Z2QvYQljeJbpQcdnLaHUtgGerbLnmez3+h9lH+c0bgVbUS/vp9UfoYU/Rm
	 CbBYoJzgS61/Ismydaw+BXkd/W2FWnkJG5Fmjx350TK4WisV+9X5WPBMfEQVFIDs+S
	 /TAvJVYIy2yn0wy641FHV8O0+DfhZ7vBdH+HJZ7s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD885F8032D;
	Fri, 17 Mar 2023 09:20:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A86EAF80423; Fri, 17 Mar 2023 09:19:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AFD4F800C9
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 09:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AFD4F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WuHwb10j
Received: by mail-ed1-x529.google.com with SMTP id fd5so17223284edb.7
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 01:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679041152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xqxJ/Errvh7wTgkyukFgXhpHkQvHOoUf0yySqdZXEc=;
        b=WuHwb10j4ZxrwbpDxJqZm1zFX4l3Ic3OXIYvg3IoG4vH8Dxg/a3knpSIJn2vjYdJ55
         zECsKris+3Wy4AosfG5m6uXFaWDmPjLH5cXynqreGAyEmy6Ho//IpEiICB3A4SgimERU
         33EHFCjKrpDzJMdgsMivryFfzJAlO8A84MfizU66pMLS/suklD8GJh3EoBI6dV9LsJEk
         9vJ9Io2Ymh0WHcHrGzzxB7QcgYshT+InI0GoIRG3ZYIREXDhiWOVKTKKyr8ikjFazVXl
         xKYJqGZp59mteUhzHTlo+73wZXERUsy/nwBvLT824vetfRU8nFFwW6NXq5ZHkcgGaEF8
         Ok4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679041152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xqxJ/Errvh7wTgkyukFgXhpHkQvHOoUf0yySqdZXEc=;
        b=r5rEirn0zvqfhPL/uVT8uNWtJna7AI3wR28g3LgRKr+sGcyFjk/JBc+GwczxJDifjq
         cUwH+uF854k4rfGawS+puTiZHU5j803AkVcE0/StLnbnid5VIg9/b2yYnOPPpwfiCFT0
         qtVA0ZQsBbZVs2bW/OI1cY4ms+VYpvkJwHEfcJ1EtpxV+ZFyX8G8Pc9N5o2bJglYNFVI
         x7mdWBC+ARIJADti/IQrvnM/T1DgvunCHW9ecGw37vVd3gVi85kdlK4RtaSg6f+03UB5
         4IyYJpD+T9jGn4n6xskqUoWokoGJhE2sPkIQJ2YZI35zvyjavVbH//K/AS5wP8bLXvZ3
         x8dg==
X-Gm-Message-State: AO0yUKVZM/Omd9niymn0eUWB8FoVHoEbXxoM1zc0PLF2t9tBVyOmfNpY
	yB6/CusXuXRKHkMNsoP7tLDo7A==
X-Google-Smtp-Source: 
 AK7set+GY5sRcdwV9p/Ih5m6RTtaxAHA+cQleoUzhIWWZQ+nikjFfQYvaJcuYuAuJa25hiouXcahzw==
X-Received: by 2002:a17:906:8393:b0:8ae:f73e:233f with SMTP id
 p19-20020a170906839300b008aef73e233fmr14594869ejx.32.1679041152263;
        Fri, 17 Mar 2023 01:19:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465?
 ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id
 x23-20020a50d617000000b004fa268da13esm722779edi.56.2023.03.17.01.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:19:10 -0700 (PDT)
Message-ID: <976e4d20-fa9a-bbdc-396a-62775eb347fc@linaro.org>
Date: Fri, 17 Mar 2023 09:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
 <87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
 <b2810924-169d-0bad-8f20-6ec2e683d170@gmail.com>
 <87a60c6z3w.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87a60c6z3w.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ISZZTA3VJSRT2HWZ42VPBE4R3HELQPIN
X-Message-ID-Hash: ISZZTA3VJSRT2HWZ42VPBE4R3HELQPIN
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISZZTA3VJSRT2HWZ42VPBE4R3HELQPIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/03/2023 00:44, Kuninori Morimoto wrote:
> 
> Hi Rafał
> 
>> Hi, this patch seems to add errors for me. Are my tools outdated or is
>> it a real issue? See below.
> (snip)
>>> +  #--------------------
>>> +  # reg/reg-names
>>> +  #--------------------
>>> +  # for Gen1
>>
>> This seems to cause:
>>
>> ./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:282:4: [error] missing starting space in comment (comments)
>> ./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:284:4: [error] missing starting space in comment (comments)
>> ./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:339:4: [error] missing starting space in comment (comments)
>> ./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:341:4: [error] missing starting space in comment (comments)
> 
> Hmm... I couldn't reproduce this
> 

It's visible on current next. I'll send a fix.

Best regards,
Krzysztof

