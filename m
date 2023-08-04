Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A53576FDCE
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4633E73;
	Fri,  4 Aug 2023 11:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4633E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142565;
	bh=19QlO83gYWJSVzpzr8NXwiJttX4b5VQFqK2k1yceP6s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Z7TzQBTE+Zwn1yEYtoH11DxCTNJWoj0qBWGLjQzylV+tYic50zPLtCSu6XXMMXuT9
	 ADt+n0NQZfT98ObC04BW663xn5VtcaO1qERH8HBYcH/RAgqeZLjsT04FQPTIwbRXKQ
	 i//o/RI+9zWUEZFY9csy81ygaz4aqmwLqCMw7jFk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A22B8F80578; Fri,  4 Aug 2023 11:45:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FD5AF805B0;
	Fri,  4 Aug 2023 11:45:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CE3FF805B3; Fri,  4 Aug 2023 11:45:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB1EAF80587
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 11:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB1EAF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FLyAljQ1
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5230ac6dbc5so2281744a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 02:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691142335; x=1691747135;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1xPeMw/tdJ7IioEcDvwAyboMLZ4pz6UEfuXX/4uGyxA=;
        b=FLyAljQ1t8b3Xk/pCIKYZrMFdYexo+hFibSNEUp2p3wd64yBa2ddbVuCdDrlswKKlx
         +tSS4CUQ1j8xWfs/JLtTG0hZmgDZOoJcRz/AvsNvA8uA4o7Ubo9dEDD5yrYtIOn20Qj0
         gbelwu6DcDfbQRUyKbYb6Iio0eb2WVn4o0WSswkPqcnGMmYZumCBnFZj+cAP+Trxdjpf
         We1i0/GrNkkIfZmIt1B6hrEr0Z+Fl/QiC2l9ZxPJQVc/oYLW6VQF+ZKYZEV2nKnq4T2k
         QvdENM2dG5mzNO61iE2XdVwJY950YBmDWnP5uB8XQS/mdCP38qao1kbUIk6TXDAXvY8e
         T1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142335; x=1691747135;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xPeMw/tdJ7IioEcDvwAyboMLZ4pz6UEfuXX/4uGyxA=;
        b=dPl8/YT+kox311qAKqCHmw/Kgmo1TQDRacxSMKpcw4fXKN9IhTm35MnUChiVuSn07E
         xfUpQzAeVBCrdO/TSoNoIClYzvrTJTKnSlSjqMad+a2H5s4oWf/ySuIAWE8vXqD6szV5
         3t/+niB7IQqCAh1OGNLw89451M8ZnEUEtmsCzUjIq7MIy0q6CerFE9u0yKEXMl5SWiEZ
         EuLyKSl/hdB3Vwgm/99keFjC26MrLHg215U7UeBITHcdXy4DNktxMnJU3y55k/Vo/crD
         tQVCt1rZhkPlJ18qxnZVFNMTb35qQj9b5yAxnD7iYyW1RSyFutbUlsUG3OruMIwzvI95
         DYbw==
X-Gm-Message-State: AOJu0YwBFqldgkIfNa/5Rtldnr5pU8pUu8KDFX1ojmWkFnLiazSR8las
	dVWoJ6Rfyk2k5pWuXxqmBewVrA==
X-Google-Smtp-Source: 
 AGHT+IEKy6dK//8+SePubKh4DJRoYWXex01cl/WJEu49hdwZPoBKQhqGx2/J5yCGkCRtvETRm0rtUw==
X-Received: by 2002:aa7:c783:0:b0:522:bae5:282a with SMTP id
 n3-20020aa7c783000000b00522bae5282amr1270942eds.1.1691142334837;
        Fri, 04 Aug 2023 02:45:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id
 bc5-20020a056402204500b005230f06de15sm1016539edb.78.2023.08.04.02.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 02:45:34 -0700 (PDT)
Message-ID: <c2cb5781-f2da-eef8-50db-6bfbaaed685e@linaro.org>
Date: Fri, 4 Aug 2023 11:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio
 afe document
Content-Language: en-US
To: =?UTF-8?B?TWFzbyBIdWFuZyAo6buD5Yqg56u5KQ==?= <Maso.Huang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chenxiangrui@huaqin.corp-partner.google.com"
 <chenxiangrui@huaqin.corp-partner.google.com>,
 =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "arnd@arndb.de" <arnd@arndb.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-7-maso.huang@mediatek.com>
 <a4f071a0-9e41-4de1-6721-f8d47475f41e@linaro.org>
 <5d005f518d974b7912c832101b5cfbde77f57270.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5d005f518d974b7912c832101b5cfbde77f57270.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SJ62URT4YCU5MOXAVWLAK7EOI52UOMJN
X-Message-ID-Hash: SJ62URT4YCU5MOXAVWLAK7EOI52UOMJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJ62URT4YCU5MOXAVWLAK7EOI52UOMJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/08/2023 10:25, Maso Huang (黃加竹) wrote:
> On Fri, 2023-07-28 at 14:51 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 28/07/2023 11:08, Maso Huang wrote:
>>> Add mt7986 audio afe document.
>>>
>>> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>>> +  - assigned-clocks
>>> +  - assigned-clock-parents
>>
>> You should constrain your clocks per variants. I doubt that they are
>> really so flexible/optional on each SoC... or maybe missing clocks
>> are
>> result of unimplemented parts in the driver? But then this should not
>> really affect bindings. Bindings still should require such clocks.
>> Your
>> DTS can always provide a <0>, if needed.
>>
>>
> 
> Hi Krzysztof,
> 
> After internal check, assigned-clocks and assigned-clock-parents are
> not required on this SoC. 
> Maybe we can just drop these two options?

It's separate issue, but yes - why requiring them?

I wrote about missing constraints for your clocks in the bindings.

Best regards,
Krzysztof

