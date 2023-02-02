Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E816877C3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 09:45:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2B5C1E7;
	Thu,  2 Feb 2023 09:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2B5C1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675327554;
	bh=SHN8hkKh2Y6mJ5aaoJj44MgzsJcoy8/W8C5bStDmeh0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fKqd0B/a4cgE/xegQEMRA79fqMgrU7eV+UFtQ0Sdfpsk25z+LJxVVzy7tKw++vkV9
	 9WSqlMp1OBsLnMWnA7q6Sd4VAk4ETLUYhmyXPkYvXn+BYKq9Raf7AQg5fwGzuwI6g5
	 HPu+PBI+JuOPQcCnhRVYX8V2vQxVfCxD3qza6M2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97F58F800ED;
	Thu,  2 Feb 2023 09:44:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDA1CF804C2; Thu,  2 Feb 2023 09:44:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C01DCF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 09:44:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01DCF800ED
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VWNE8vJl
Received: by mail-wm1-x330.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso746178wms.4
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 00:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zSdGfZDhD9SG6czAcftql0hcyxrwJGaxYjADtCqEBXo=;
 b=VWNE8vJlCbaY2J05+r4g+pR+CFHynx4X0NHo7DRKjSu1AXREUATK5Muf8MRTaT3p0t
 4ffWkkwDFQqkDKOMZ0BfeYlv6u1M8Y4xwKVn3OV5GLa6G5L6ge6acJY6Nnz43xfpIEdf
 KXzNQSbn1Q3yIIGMZ5vBTeANx9DwSVVv/VQZhtK0fjcTnRBJaoqc9yTsl3gOqu5mPtI3
 mvurJwtfheuqCKSfDu/DOSdqlrXn8jxeS2BpzhdD25+nQFFhtf4cgfG83GjNNkR03aIL
 vtY9c67oCapbUCE4IWBFGEKwftr25UGRd+NZYDhVCRTIJ+N1NKfn8pzLsRhPcptzkBwA
 2c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zSdGfZDhD9SG6czAcftql0hcyxrwJGaxYjADtCqEBXo=;
 b=pi/kK+M1lau1cThAFY98dUkholWW2BaSGav7jxCKTcAKB/KbQs+ZhMMYNkZFbejQ+Q
 vZo62POGGO/LdY5L7+FXoEdKLzvuyYLjrTkwP7li9GO8fesv+FQ0r2Y6blJpyAZW+d4b
 7pG3s2m5mbbyTNWQgacBX+kQ5qVHpk63rJXLB5h//IwmymrwzftLSbCMIMMQPA+ruI2p
 1CQ3mHla6R9UBOEuXV2WhY4X51Bmp/O4w59BfCnLZJKIE/IOg/w/X6+46blo9fpcT0vU
 3sO6q+u1UJYpmQtbXQTleunVmI/x9mdI/7jbAf5F1KkjVQ3Ep1hnGJR6itlcMClA4AMD
 WSkQ==
X-Gm-Message-State: AO0yUKWU89k/+RJ4SWLHWx4JqtfMOcGGkd+KZa86uxa/ka8XxkYG30Lm
 327LQPu6Na+Y5yd4nu9tjklOfw==
X-Google-Smtp-Source: AK7set9WwxqLeD78t9sZUqS6ql4d1ZeQ8t6LBkKAYoDpz6+6y5ykC46oY5UyQz2yTcokR5gG8zah7w==
X-Received: by 2002:a05:600c:3d8c:b0:3dd:62fe:9914 with SMTP id
 bi12-20020a05600c3d8c00b003dd62fe9914mr5018345wmb.18.1675327478086; 
 Thu, 02 Feb 2023 00:44:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003dee8c5d814sm4021173wmo.24.2023.02.02.00.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 00:44:37 -0800 (PST)
Message-ID: <6439a587-0b65-a037-1013-b697e19000a4@linaro.org>
Date: Thu, 2 Feb 2023 09:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: dt-bindings: Drop broken irondevice, sma1303 binding
To: Ki-Seok Jo <kiseok.jo@irondevice.com>, Mark Brown <broonie@kernel.org>
References: <20230201131059.65527-1-krzysztof.kozlowski@linaro.org>
 <1bcd61d6-810f-1239-1b6e-367e0fe87370@linaro.org>
 <Y9pxGUMWyMeXQpZM@sirena.org.uk>
 <6491d6fb-2a10-1c80-d422-8300d5a75ce4@linaro.org>
 <Y9p+p6wt8WugDBuH@sirena.org.uk>
 <SLXP216MB00776F066D70DB2F3F77B09E8CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <SLXP216MB0077228B6071F62B183F4D648CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SLXP216MB0077228B6071F62B183F4D648CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 02/02/2023 06:28, Ki-Seok Jo wrote:
>>>> I tried. I started writing patch to fix few things in this binding
>>>> and then noticed that it is entirely empty and documents nothing.
>>>
>>> I really don't see an empty binding as a major problem in and of
>>> itself, we can always add properties later.  Again, I can't tell what
>>> the problems you're seeing are.
>>>
>>>> The trouble is that soon you will send it to Linus and then it
>>>> becomes the ABI even though no one ever approved or reviewed the
>> actual ABI.
>>>
>>> So send a patch to delete the property parsing code then, like I say
>>> removing the entire driver is very much an overraction.  The
>>> properties are all optional in the code.
>>
>> Ok. I'm sorry for not checking correctly.
>> I only reviewed using the full source build and checkpatch.pl.
>> But I missed the config setting...
>>
>> So, could I get the information how to test the binding files?
>> From what I've checked now, using make dt_binding_check, right?
>>
>> I'll try to read again like submitting-patches.rst and writing-
>> bindings.rst.
>> And then re-write the patch. I'm sorry again for not checking properly.
>>
>>
>> Thanks Mark and Krzysztof to feedback.
>>
>> Best Regards,
>> Kiseok Jo
> 
> So, was the entire thing dropped, or was only the binding dropped?
> If they are not also, can I just patch in the current state?
> 
> And I tested the rewritten file with the following command.
> 
>   make dt_binding_check DT_SCHEMA_FILES=irondevice,sma1303.yaml

Yes.

> 
> Is there anything else I should do?

Correct the binding:
1. Add all properties - just open example-schema and your file and
document everything
2. Fix non-existing reference (there is no such file as name-prefix.yaml)
3. i2c_bus -> i2c


> 
> Thanks to your help, I think I am becoming a better developer.
> I'll try harder. Thanks so much!
> 
> Best regards,
> Kiseok Jo

Best regards,
Krzysztof

