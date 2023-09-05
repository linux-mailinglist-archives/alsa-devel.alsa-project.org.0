Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337879208F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB5AE825;
	Tue,  5 Sep 2023 08:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB5AE825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693895615;
	bh=GX0r5vqvY9gxgJ/yvzEOyi8DmAnBRxI0orLlqMmJexM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aTQel2GXVgCogORfK/bVhKXn/mjr1lLiLgh1J9VMkXug2FBB/Jkgq0zoKjza2MKPs
	 b+yyN0l63bbld94A3SQPlQq6nPTObQY/4ON/LqlIOrRdcLGeYiUGDbwPyZldm+Id1v
	 irpKylenDKJnnQUfRsUIPj3M1Yi66Roe2EazdikY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 136F6F80236; Tue,  5 Sep 2023 08:32:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89B86F80431;
	Tue,  5 Sep 2023 08:32:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D80BF8047D; Tue,  5 Sep 2023 08:32:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98971F80236
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 08:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98971F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PZA16ctA
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so298496866b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Sep 2023 23:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693895552; x=1694500352;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2zvcX9pHacLNf0ykPfp3m/i4l5HADAdXshgrpjJZEQ=;
        b=PZA16ctAJolriPEfLGDDY8zWO3H2nkXfg9lN8WdXecltxUSEYqKDaLxgzIOyP9ocK5
         IzrKhXB9Hbq1UqyTC9thW1sBuPyc0dsy03+lWF7Wq2GtiyrIOEOvac13utlQ49jzflxM
         mG65MUrEVc5I/73wmuntoaCiXThHUsZRYqqRNLFHugDqCZTVYnFdGH6XJQdgKtC2b7RC
         1MEf8ANFCrPJYvIlsNtteytHQZh7+4UEk3ziZdJZd2QuLOp/mpyjsxWELQoHS3rjzgjC
         /OsrXBKDqXy7Lbksfs22WCctVnAj8FHDELkAZ+WmY/IRB4o6qS+aYyER+/56G0wNLZaA
         ItRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693895552; x=1694500352;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2zvcX9pHacLNf0ykPfp3m/i4l5HADAdXshgrpjJZEQ=;
        b=Fbc9nwfuxzhK+ie62qZQrfgAfI6ajXXxxxLNgCMHzh2XYw9KT3lKv5ZpmdQQIdNqQL
         +irto5h7vaN1XnOTl0MUeLpqZjm709y76gXbZCsYXj7iM5LTlnNfy3MElz8NWQ8+XNjh
         BNQNLJJVIED4EeP9CpymD8uSXIWg16JSNqkm71jn5/Wy42gfoa/zQKKNYvaPrO6sRelO
         f0nnUfqn4EPe0fgUkQfO7B7PYbS5l8WqGIBZgdN09v+idYaNPhQj4iuzEgCQpMVK+/r/
         wwPcn2SYDmnOvAMNod/EfkbZ333P9Z+Hj3CJYk/2Pk3a2mdF+f8/Eml6jED6gXTmOY1U
         OKkg==
X-Gm-Message-State: AOJu0Ywg3jQRJAds8yjJKpazvzVqkwexBX90/ulVlZHqchcl2VoaUOei
	IJNIVespB+TzuXbGGj1QwhSH2w==
X-Google-Smtp-Source: 
 AGHT+IHO45N6+V7Ag6AL53zjf/NBrs1e+jux62HnuWPxGdyF6+qb4L+PhPB7YuMqE2GhKQWyxhm3xQ==
X-Received: by 2002:a17:906:73c7:b0:9a5:deef:886 with SMTP id
 n7-20020a17090673c700b009a5deef0886mr8787456ejl.43.1693895552487;
        Mon, 04 Sep 2023 23:32:32 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id
 i7-20020a170906444700b0099297c99314sm7148980ejp.113.2023.09.04.23.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 23:32:32 -0700 (PDT)
Message-ID: <3ff94d4b-7585-d7ed-9736-ba4c02b3fcff@linaro.org>
Date: Tue, 5 Sep 2023 08:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] ASoC: aw88395: drop undocumented and unused
 sound-channel property
Content-Language: en-US
To: wangweidong.a@awinic.com
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
 yijiangtao@awinic.com
References: <20230904125309.43350-3-krzysztof.kozlowski@linaro.org>
 <20230905024659.15071-1-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230905024659.15071-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UVAFKILUV6ZX3P7LSQPSIPROFQGTX4BX
X-Message-ID-Hash: UVAFKILUV6ZX3P7LSQPSIPROFQGTX4BX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVAFKILUV6ZX3P7LSQPSIPROFQGTX4BX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/09/2023 04:46, wangweidong.a@awinic.com wrote:
> Thank you very much for the proposed patch, but I have some 
> questions that I would like to discuss with you
> 
> On Mon, Sep 04, 2023 at 12:53 PM +0200, Krzysztof Kozlowski wrote:
>> The Devicetree sound-channel property was never accepted and is not
>> allowed by bindings.  It is not used by any upstream user, thus
>> considering that it was never documented, should be dropped.
> 
> This node property is intended for use with multiple PA, to
> load different configurations for different PA.
> Can I add this sound-channel in the "awinic,aw88395.yaml" file?

Maybe?

> 
>> Even though it does not look like from the diff, the property is not
>> actually used by the driver, because once set, it is read only in loops
>> depending on ddt_num (prof_hdr->ddt_num, cfg_hdr->ddt_num).  The
>> variable ddt_num is never set and is always 0, so the loops do not have
>> any iteration.  Dropping sound-channel and ddt_num-related loops allows
>> to drop empty functions which in turn drop quite a lot of code.  This
>> entire code was not possible to execute. 
> 
> The ddt_num variable is not always 0, this variable is defined
> in the configuration file. The "prof_hdr" variable is assigned by 
> the "cfg_hdr" variable. The "cfg_hdr" variable is assigned by "aw_cfg"
> aw_cfg is the data obtained through request_firmware.The specific 
> process is as follows:
> 
> request_firmware ---> cont->data ---> aw_cfg->data --> cfg_hdr --> prof_hdr

Hm. So you load user-space provided file and assign it directly, without
any validation (aw88395_dev_load_acf_check() checks only for magic), to
a kernel structure. Sounds bullet-proof. Why using known kernel
interfaces, better to implement some conf-file-parsing.


Best regards,
Krzysztof

