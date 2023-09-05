Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9157920B8
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 09:30:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D174E825;
	Tue,  5 Sep 2023 09:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D174E825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693899052;
	bh=Lt7ofRz4swmgFAvGk3DnQJF0PgfAsgeYArdgmxhuMGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NMN3divSeX+fefbP++YAk4OJWzZfSoBjVQJHVTxkCKdKiKEAOgDXYAa3N+aoBbAdx
	 bx1Oz87Ma7nx9sM11RWHSr0vP9qAndCzfEAJXnmUXwYeazq/INEDq1P4Aa97yErPPx
	 O9USyZgY/LZd/4Xo8/UDgjZMBGvpUYsj7s8rbH50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1556EF80141; Tue,  5 Sep 2023 09:30:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40EC1F80431;
	Tue,  5 Sep 2023 09:30:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B4BBF80431; Tue,  5 Sep 2023 09:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEF22F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 09:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEF22F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r0CbywJR
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c136ee106so325948566b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Sep 2023 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693898889; x=1694503689;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/G+WsouhuVp8ZLsX8nV6kZmhtaiVnxK3WmX/+yU39RI=;
        b=r0CbywJRn+3vBRIcEOu7UpMRqBwKaEDlIKM28hZoSaXuAOxpAN4C+po7oNAfn3UTWC
         GO18xO4UqDH4kVs1mHHwICKDIPP5f9x92WrttXE/RFQ/77QGfWwpsIagCdHWC8stkfr2
         WhTQuLjZOZE82/IVNiNXIpSxPhMxqLJFErLa53hMTRCFXyH+3jabJZXv4YHsxpMI4sA7
         rbgvnypOC409zEPNzOW+4YNrvTo/Xzp9PUSQoVS709TwgRLXIwDraJvOpO8SkcMQKVyO
         37NF7gNbH7T1LpMU7J9ta2r0MmndVR/tpPiY6AEbWKq/rbH6w+T4dGSKutUtzKHOoW6f
         x3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693898889; x=1694503689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/G+WsouhuVp8ZLsX8nV6kZmhtaiVnxK3WmX/+yU39RI=;
        b=N4ftZmfk6tYaqy5ccexotlvDg/BGXSHQ4zdF5QoImr23fnKMDCtZWOMLUUEjbzGImm
         nLEBRJ+pWbMhK1nbXfpt+Qct7/nwKSG3200MY0mfsmDKp7tN5P2GaCtqwlwDOjpJ/FNe
         hAyZg9n6/+d4wSlsOTt2uWY8qeBbTjcrB0B+OW9UYBOLeCnex/AaWL+zp6F5DaR3uY1T
         ZiG2JrcFSONBAJ+8ug01jBlAPg1xzlKWm2yQY5Z6aJThhfyujkjWAJMwsUQsrx5mq44d
         xQWBavljYyVHquY64fweVmA2eJ/wL9i64gBZ9qahbch0VNRwkafXoonrjT3pNafPpBfa
         FfRw==
X-Gm-Message-State: AOJu0YzCHdA3zSmfh0sFE1yVwNcThcLM8Iu2C/rQph64mM8aLR0lq5u+
	+zBQDVHBfQBmvqGsyGviwUIHnA==
X-Google-Smtp-Source: 
 AGHT+IHeHN6TYjZB5DewP96QFYyGgLgqKs+gYOQUmcZMWK1Sdo86mfxKDCYC7ktZKmebIAyNZZA2Kg==
X-Received: by 2002:a17:907:2cee:b0:9a1:9cc5:ea5f with SMTP id
 hz14-20020a1709072cee00b009a19cc5ea5fmr9084583ejc.7.1693898889368;
        Tue, 05 Sep 2023 00:28:09 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id
 lu7-20020a170906fac700b00992e14af9b9sm7090376ejb.134.2023.09.05.00.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 00:28:08 -0700 (PDT)
Message-ID: <537821c6-df3f-6946-b7dc-07ba9db9d416@linaro.org>
Date: Tue, 5 Sep 2023 09:28:08 +0200
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
References: <3ff94d4b-7585-d7ed-9736-ba4c02b3fcff@linaro.org>
 <20230905071356.18301-1-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230905071356.18301-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Y3WM6EJ45BSEI43SC57KNYBMES7MUHQO
X-Message-ID-Hash: Y3WM6EJ45BSEI43SC57KNYBMES7MUHQO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3WM6EJ45BSEI43SC57KNYBMES7MUHQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/09/2023 09:13, wangweidong.a@awinic.com wrote:
> Thank you very much for your reply.
> 
> On 05/09/2023 15:05, krzysztof.kozlowski@linaro.org wrote:
>> On 05/09/2023 04:46, wangweidong.a@awinic.com wrote:
> 
>>>> Even though it does not look like from the diff, the property is not
>>>> actually used by the driver, because once set, it is read only in loops
>>>> depending on ddt_num (prof_hdr->ddt_num, cfg_hdr->ddt_num).  The
>>>> variable ddt_num is never set and is always 0, so the loops do not have
>>>> any iteration.  Dropping sound-channel and ddt_num-related loops allows
>>>> to drop empty functions which in turn drop quite a lot of code.  This
>>>> entire code was not possible to execute. 
>>>
>>> The ddt_num variable is not always 0, this variable is defined
>>> in the configuration file. The "prof_hdr" variable is assigned by 
>>> the "cfg_hdr" variable. The "cfg_hdr" variable is assigned by "aw_cfg"
>>> aw_cfg is the data obtained through request_firmware.The specific 
>>> process is as follows:
>>>
>>> request_firmware ---> cont->data ---> aw_cfg->data --> cfg_hdr --> prof_hdr
> 
>> Hm. So you load user-space provided file and assign it directly, without
>> any validation (aw88395_dev_load_acf_check() checks only for magic), to
>> a kernel structure. Sounds bullet-proof. Why using known kernel
>> interfaces, better to implement some conf-file-parsing.
> 
> Could you please tell me what known kernel interfaces 
> can be used to parse files? 

With exception of Audio topology and FDT, I do not think we parse
user-provided files in Linux kernel.

Best regards,
Krzysztof

