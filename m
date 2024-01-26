Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C80283DC9D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 15:43:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC73E84A;
	Fri, 26 Jan 2024 15:43:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC73E84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706280215;
	bh=pZU5cerxpfnJuyuLwtQOHnp1b2colsTPucYdr9OgnOg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=moediRE8oAdJHOHqZLLNBUUUGnjWWX+DPew9clgMbwP5c4CjDxNp6ssNqnRwZ/WkD
	 VfAkH1cF5nGulb7e/waTV8tCrIPCWBxDC38aKleubLPQWmDTHpQia240UuF2Ttk13I
	 qGADm83pC3aUExOiVzdMm8Grn4XXmG9kxhTrOFz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54715F80579; Fri, 26 Jan 2024 15:43:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99A2AF80580;
	Fri, 26 Jan 2024 15:43:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A8CDF8028D; Fri, 26 Jan 2024 15:42:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E5A8F8022B
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 15:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E5A8F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mSskU5Ne
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so412509a12.2
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jan 2024 06:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706280166; x=1706884966;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P3kVk1oYE66zS3iDNGxJ8XOI7Kqo05wmoZaZQizgeiI=;
        b=mSskU5NeAFK5fhYgByJ0pgeao/2BbhyVUC26sRpRKZTrNnXqCNTQNWhVp3u/+L7uKW
         Eq3j9nn2Hsq7k6c+XsOqdVL+KoHEtt51l8etL7Av+IxHp7QNKry99pLHpawe58e/HSlV
         J0OPcTnh1berMV0Up7evH4fYyKLQKR/4i9by1u1B+dqA+de7H14GB9B7gB8yo12inXuk
         dUkl3OVqgw8bul7T9FXFImJuIhskyFhL/Um2mreEQTW5KPiT9YMR05sW/JPbxj9XvXhj
         395S+kfk4VC0gs7M4mmrZDuQqXHxLytlocpmR0GoJebUErkMtm2daIJSkIBiipSSlp+X
         uWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280166; x=1706884966;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3kVk1oYE66zS3iDNGxJ8XOI7Kqo05wmoZaZQizgeiI=;
        b=j7u1zh+ETeKU+raeGm+Op3J2c33Y4C6mJRMEKAudSucb18sXxWIgr99JtvaIbxLbQ9
         UCQkJeETt5tmRGgUcJQdt/deGbbSVb/sJl2z2QVCIw7CIhgQCwyh795uoq5nDA7eQOHO
         Xgy/1hhccqL3QzDrVdFV8cW3i20p0yzS8HATyY1WgJueQ2qAY6k79Ku5rzjGE8RLbm4B
         4UrWS7YMd680KEwgI6Hc1rNtH2GL/WkGpAAnLSckL0W8VH/PMH/oLL1INDanbI8BKN3b
         KjC9pdOCk/REucESxJf1kuTfWaQl8bBKEP+m9GMA9/toTHW5X9bEcRunynM0bWUfM56h
         KSAA==
X-Gm-Message-State: AOJu0YwWNcb28FJ2kcCtm/RPOd3ZHdMsHimOcsoU4cPGi0a9JlbOSARW
	3QqbjZzUSTiIWsIauYC5aMEABLbnUFjjt/7XTLJE1RaAT4J4MQGOpb8gP3ZNZG8=
X-Google-Smtp-Source: 
 AGHT+IH+54VGVgQVbGjjMLZWU5u/Ibwj/BPMN7C7YtaQVLFrflo+VeSw6N8Q7m9ligrRRAGBgbzH9Q==
X-Received: by 2002:a05:6402:1bcd:b0:55c:fe2b:9973 with SMTP id
 ch13-20020a0564021bcd00b0055cfe2b9973mr970017edb.13.1706280166457;
        Fri, 26 Jan 2024 06:42:46 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 ij13-20020a056402158d00b0055a451463c5sm655015edb.58.2024.01.26.06.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 06:42:45 -0800 (PST)
Message-ID: <62b6b3d1-d54a-46ab-8400-c1f48238b1db@linaro.org>
Date: Fri, 26 Jan 2024 14:42:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn
 widgets on SM8350+
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
 <4d377c8e-8cef-4da3-9b25-fc91a7dc3d49@linaro.org>
 <518642ba-56e1-4648-a253-2a841a787ee0@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <518642ba-56e1-4648-a253-2a841a787ee0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AEXV7EMBUQBQNZXICY3B2QZ2VNWDOIC3
X-Message-ID-Hash: AEXV7EMBUQBQNZXICY3B2QZ2VNWDOIC3
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEXV7EMBUQBQNZXICY3B2QZ2VNWDOIC3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 26/01/2024 13:23, Krzysztof Kozlowski wrote:
> On 26/01/2024 14:21, Srinivas Kandagatla wrote:
>>
>>
>> On 25/01/2024 15:31, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Changelog in individual patches.
>>>
>>> v1:
>>> https://lore.kernel.org/all/20230717140138.201745-1-krzysztof.kozlowski@linaro.org/
>>>
>>
>> Unfortunately this is breaking mic on X13s.
> 
> Did you update also your mixer? I was asking last time about this as well...

Updating to new mixer setting fixes the issue.

This is going to be a issue with the existing ucm which becomes broken 
with this new patches.

Are you going to send patches to fix the ucm too?


--srini
> 
> Best regards,
> Krzysztof
> 
