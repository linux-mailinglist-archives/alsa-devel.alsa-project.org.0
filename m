Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03F6868B9
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:44:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94EC4832;
	Wed,  1 Feb 2023 15:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94EC4832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675262666;
	bh=ox1Jtj6mr5fp39dnr84jCJ6WyBw6ssqSENH4udXGmdw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aSLKcV0s7RKF3J2klpBWRsKetjme5GdQmZb00O3l/bkxLJLxm/cwQlwgV7uU18CBz
	 t4DWwMpCiQeRhGXQkqp5fXLPPClc5Ll71u6YHgjnhNn+ZI+/8ViPfcuwKfh07SRYCL
	 kMyz2Zr1611WQcoBHhpcgd4bD/U3nKKIH1lZyqUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB2BF80169;
	Wed,  1 Feb 2023 15:43:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDCD8F80423; Wed,  1 Feb 2023 15:43:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE04F8032B
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 15:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE04F8032B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ibXFxt9B
Received: by mail-wr1-x433.google.com with SMTP id m7so17529116wru.8
 for <alsa-devel@alsa-project.org>; Wed, 01 Feb 2023 06:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dC2Rf+qs0P/jrCe9msdGE8AkAgDIJW5HtHWs9aRUyUM=;
 b=ibXFxt9BRYojnFB5aMpK5zHfRUr3rTuXK8gbzrbbANcmXrBoR3/gZFAibr8X/eCyvG
 nZM2qAouhLUMXlBtMMSSx22Q2Wh+QbUCfXVemidC222OvyJrgcpA2z3s6d0cGPUOooas
 KfadIZ9z7m0x69PB9tFiOVfdYU/Ynba6LssKc07/efXQ255RPM8osrkZf3G4oXwnvGyJ
 hPqhdqdZrA0LkIDPCzL+aAsGQ5LcfPAg6yvUiSx1EiXVR2TfIplLZtYvjZQgZgA2SNw9
 E4SeopzvVb5y0LGJbxCZzJvQtw6EmxbQvpnV2Je6RJhpaZj7HrcpJgIWti8ZHGNrppvk
 gd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dC2Rf+qs0P/jrCe9msdGE8AkAgDIJW5HtHWs9aRUyUM=;
 b=w5+lWw/R/nb0o8XP6cKgkc4TaxlP0rcn6gGeNNwh1DftyDiZzlnKAX8JygFe/U55kF
 iWE8l2SNTYJzDQJi9I7PJ6R79cVPeQ0vbOCkksdaPU7Nsfo8Jp/MSVdbWtBFAx0pnAeS
 sXyE0ei7oyMh8CYTryUqFoGz2dFRzuCu/+19lCjsvhy2puNuDsR3BgvKTDKYJaAwwxKV
 Y5uHWKFT+Kqr26NPeWHQgrnOnY9N1f6fjRwMaH03C9Ahs3TBHK+DPzPoO9qZM0ZvddnS
 FnCgv4pILj9TnBDsyVZhmhQgV0c5bekn02ZIJ6C1Bc0dArl2q8SqgQQkjF4zoL79B+Us
 yIDw==
X-Gm-Message-State: AO0yUKWZxPW3f/QykQe+rCUlDuz+iEjlHQP0kwI3gaDGShqCrkKq3yOp
 cpITALkXkEJModcWL92jMk+WwA==
X-Google-Smtp-Source: AK7set8PI06q3hLefAX/yzLn2ALEYmydTMRpaxfh4uUmHXpFyC9Y/mCBDAhLTB1c6A+QZNC14bxd6A==
X-Received: by 2002:adf:d1e9:0:b0:2bf:9543:2bea with SMTP id
 g9-20020adfd1e9000000b002bf95432beamr3759674wrd.35.1675262594646; 
 Wed, 01 Feb 2023 06:43:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r8-20020adfda48000000b002be25db0b7bsm17513102wrl.10.2023.02.01.06.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 06:43:14 -0800 (PST)
Message-ID: <6491d6fb-2a10-1c80-d422-8300d5a75ce4@linaro.org>
Date: Wed, 1 Feb 2023 15:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: dt-bindings: Drop broken irondevice, sma1303 binding
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230201131059.65527-1-krzysztof.kozlowski@linaro.org>
 <1bcd61d6-810f-1239-1b6e-367e0fe87370@linaro.org>
 <Y9pxGUMWyMeXQpZM@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y9pxGUMWyMeXQpZM@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kiseok Jo <kiseok.jo@irondevice.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 01/02/2023 15:03, Mark Brown wrote:
> On Wed, Feb 01, 2023 at 02:13:46PM +0100, Krzysztof Kozlowski wrote:
>> On 01/02/2023 14:10, Krzysztof Kozlowski wrote:
> 
>>> Because the binding:
>>> 1. Was never tested,
>>> 2. Was never sent to Devicetree maintainers,
>>> 3. Is entirely broken and wrong, so it would have to be almost rewritten
>>>    from scratch,
>>> 4. It does not match the driver, IOW, the binding is fake.
> 
>> I understand that in general we tend to fix, not just to revert. But the
>> poor quality of this binding and the next patch, which was suppose to
>> fix it, plus complete lack of testing, means I do not believe the author
>> will send correct binding.
> 
>> More over, fixing binding might require dropping incorrect properties,
>> thus changing the driver. I am not willing to do that, I doubt that
>> anyone has the time for it.
> 
> It is an absolutely trivial binding as is, it is utterly
> disproportionate to delete both the binding and the driver to fix
> whatever it is that the issues you're seeing are (I can't really tell
> TBH).  Undocumented properties are a separate thing but again a revert
> is obviously disproportionate here, glancing at the driver the code is
> all well enough separated and can have default values.  Looking again I
> did miss the sysclk selection which should be dropped, clocks should use
> the clock bindings.
> 
>> It's the job of submitter to work on it.
> 
> It's also not the end of the world if we have a driver that isn't
> perfect.
> 
> Please, try to keep things constructive.

I tried. I started writing patch to fix few things in this binding and
then noticed that it is entirely empty and documents nothing.

The trouble is that soon you will send it to Linus and then it becomes
the ABI even though no one ever approved or reviewed the actual ABI.

Best regards,
Krzysztof

