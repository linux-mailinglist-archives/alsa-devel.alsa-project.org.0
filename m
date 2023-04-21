Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189DB6EA550
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 09:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6103AE82;
	Fri, 21 Apr 2023 09:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6103AE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682063631;
	bh=DzDg1WR7sbViWk98Z1zegOScNK3iguhx+MR0/6IfcZw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O/PPCLMgaajKE8KHgMtBkpJNLH7+mH10eZFa8RMEYVWGF0hSQRghM4/8+RpRAu2RK
	 PvMfa4tF4cfa9nlXgEhxK5Ia2KW5UH2PHutEbp7f678UxTwRRBLSSBv4xdzbws3GAQ
	 F+9kwrNODEEtuYJ9UnKRDr9lgcOl9aOLaKqX2rRw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB6BF80149;
	Fri, 21 Apr 2023 09:53:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31E06F80155; Fri, 21 Apr 2023 09:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59F06F800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 09:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F06F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HZ7YH2uD
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94f109b1808so216096566b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682063565; x=1684655565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jyQvtkjr7ktOwnMvKFvNnF+GYCbKmPXGYqdPfrCCx0=;
        b=HZ7YH2uD3n7M1DYcAgjkiaCpV8J4YreupSN55YXHb8wdXMPQOTA86GGZu0g5EUyRqU
         U00W1VXUhKADBcaLcHJ84osfZCjnhoCWMmmB2Uh3nclRsHiACYsi7pMY1lm6Hgbp2YLz
         IfuZb5AbCNs3VSISX/PFB+k+Pqe1uqmRDThkZ4k8UXzc+bCOx9CJIpSbwO2PE9qZ0Chz
         54s+YL4CuqWekzRrzOc/9oVcUeb2heZMC8FsqGdsG7PBIBVPlNkZEODqOiA5VM/ZP9Jd
         o6/vQfWeecEkNPKYLVYlRwAGct19Ns6hf579+LzS/SBxwLKlQNrU0+kNdrf45d33J8xa
         wJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682063565; x=1684655565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jyQvtkjr7ktOwnMvKFvNnF+GYCbKmPXGYqdPfrCCx0=;
        b=blJz7NJsVP3SYjfTYbUKFJqu71g2DHcXu7V2I9ZF5GXeQ1f3R+GDG5Zs9kQxn/tDBu
         u8BAh5PQvU1k/k0iPnJ2Qz9prNhYivRtYFSuTCc2NBM3KGPZwCyf1in7PoTXSIJDu3Xq
         fm3kzd0BCSiXPz/2O2k5rB7UKj8VJdwLHJ8wXnzzSo9S7OKGHvAQcXRb777GKwYEH26w
         OtJUZ2C3b7kOS1Iz5LrydY7/YnUw2/Scc7WjFbOKssQdbBpZIlWCI/Ry1xqw6ujO/QhX
         Ah91jR8kZGMrKZALQW20jSI2FJXx1qvAN5+RVJd/4T2qv4o6ci5wLDv9yv2ObeEmSnP+
         +BQA==
X-Gm-Message-State: AAQBX9dx4/ooQN22tcJXRvdxl4idWtLqXZQn4AkyRpdC1oJvekSY7AED
	mQ+h/TniOyev8irTQns9uppQog==
X-Google-Smtp-Source: 
 AKy350ZBEewCEid1fXIGiqjdiiCmdX9Fux2UjvhL2POTMz2155hb0ctMfZVbcn4nm2URI0g5MdQa/Q==
X-Received: by 2002:a17:906:b354:b0:953:3e29:f35c with SMTP id
 cd20-20020a170906b35400b009533e29f35cmr1473060ejb.45.1682063565612;
        Fri, 21 Apr 2023 00:52:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:668b:1e57:3caa:4d06?
 ([2a02:810d:15c0:828:668b:1e57:3caa:4d06])
        by smtp.gmail.com with ESMTPSA id
 o23-20020a170906769700b0094e9f87c6d4sm1685207ejm.192.2023.04.21.00.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 00:52:44 -0700 (PDT)
Message-ID: <054a384b-b0ef-2697-4a70-09868694ec6d@linaro.org>
Date: Fri, 21 Apr 2023 09:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 3/7] mfd: Add support for the Lantiq PEF2256 framer
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, Herve Codina <herve.codina@bootlin.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
 <20230417171601.74656-4-herve.codina@bootlin.com>
 <20230420123946.GB996918@google.com> <20230420151551.78c1288b@bootlin.com>
 <20230420134703.GC996918@google.com> <20230421092645.56127f11@bootlin.com>
 <20230421074558.GQ996918@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421074558.GQ996918@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3X23VP3DTLACNYJYO45YDL3VM27WTUSV
X-Message-ID-Hash: 3X23VP3DTLACNYJYO45YDL3VM27WTUSV
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3X23VP3DTLACNYJYO45YDL3VM27WTUSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/04/2023 09:45, Lee Jones wrote:
> On Fri, 21 Apr 2023, Herve Codina wrote:
> 
>> Hi Lee, Krzysztof,
>>
>> On Thu, 20 Apr 2023 14:47:03 +0100
>> Lee Jones <lee@kernel.org> wrote:
>>
>>> On Thu, 20 Apr 2023, Herve Codina wrote:
>>>
>>>> On Thu, 20 Apr 2023 13:39:46 +0100
>>>> Lee Jones <lee@kernel.org> wrote:
>>>>   
>>>>> On Mon, 17 Apr 2023, Herve Codina wrote:
>>>>>   
>>>>>> The Lantiq PEF2256 is a framer and line interface component designed to
>>>>>> fulfill all required interfacing between an analog E1/T1/J1 line and the
>>>>>> digital PCM system highway/H.100 bus.
>>>>>>
>>>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>>>>> ---
>>>>>>  drivers/mfd/Kconfig         |  16 +
>>>>>>  drivers/mfd/Makefile        |   1 +
>>>>>>  drivers/mfd/pef2256-regs.h  | 250 ++++++++++
>>>>>>  drivers/mfd/pef2256.c       | 950 ++++++++++++++++++++++++++++++++++++    
>>>>>
>>>>> 95% of this driver needs to be moved somewhere else.
>>>>>
>>>>> What is a Framer?  Perhaps sound/ is a good candidate?  
>>>>
>>>> The pef2256 framer is a device that transfers data to/from a TDM (time-slots
>>>> data) from/to quite old telecommunication lines (E1 in my case).
>>>> Several subsystem can set/get data to/from the TDM. Each device using their
>>>> own time-slots set.
>>>>
>>>> On my use-case, I have some audio consumer and a not yet upstreamed HDLC
>>>> consumer. Both of them uses the framer to know the E1 link state.
>>>> The framer needs to be initialized 'globally' and not by a specific consumer
>>>> as several consumers can use the framer.  
>>>
>>> I can't think of a good place for this.
>>>
>>> If all else fails, it's drivers/misc
>>>
>>>>>>  include/linux/mfd/pef2256.h |  52 ++
>>>>>>  5 files changed, 1269 insertions(+)
>>>>>>  create mode 100644 drivers/mfd/pef2256-regs.h
>>>>>>  create mode 100644 drivers/mfd/pef2256.c
>>>>>>  create mode 100644 include/linux/mfd/pef2256.h    
>>>>>
>>>>> [...]
>>>>>   
>>>>>> +static int pef2256_add_audio_devices(struct pef2256 *pef2256)
>>>>>> +{
>>>>>> +	const char *compatible = "lantiq,pef2256-codec";
>>>>>> +	struct mfd_cell *audio_devs;
>>>>>> +	struct device_node *np;
>>>>>> +	unsigned int count = 0;
>>>>>> +	unsigned int i;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	for_each_available_child_of_node(pef2256->dev->of_node, np) {
>>>>>> +		if (of_device_is_compatible(np, compatible))
>>>>>> +			count++;
>>>>>> +	}    
>>>>>
>>>>> Converting Device Tree nodes into MFD cells to register with the
>>>>> Platform Device API is not a reasonable use-case of MFD.
>>>>>
>>>>> Have the CODEC driver match on "lantiq,pef2256-codec" and let it
>>>>> instantiate itself.  
>>>>
>>>> As the framer is going to used by several subsystem, I cannot instantiate
>>>> it in the specific ASoC subsystem.
>>>>   
>>>>>
>>>>> Your first version using of_platform_populate() was closer to the mark.  
>>>>
>>>> The issue was that I need MFD cells for the pinctrl part.  
>>>
>>> Why can't it be represented in DT?
>>
>> The pinctrl part has no specific compatible string.
>> Not sure that a compatible string for pinctrl can be accepted
>> as there is only one pinctrl subnode and no specific reg for this
>> subnode.
>>
>> The DT looks like this:
>>     framer@2000000 {
>>       compatible = "lantiq,pef2256";
>>       reg = <0x2000000 0x100>;
>>       ...
>>       pinctrl {
>>         pef2256_rpa_sypr: rpa-pins {
>>           pins = "RPA";
>>           function = "SYPR";
>>         };
>>       };
>>
>>       pef2256_codec0: codec-0 {
>>         compatible = "lantiq,pef2256-codec";
>>         #sound-dai-cells = <0>;
>>         sound-name-prefix = "PEF2256_0";
>>       };
>>     };
>>
>> Krzysztof, is it acceptable to have a compatible string in the pinctrl node ?
> 
> Why wouldn't it be?
> 
> $ git grep ".compatible" -- drivers/pinctrl/
> 
>> In this case, it will looks like this:
>>     framer@2000000 {
>>       compatible = "lantiq,pef2256";
>>       reg = <0x2000000 0x100>;
>>       ...
>>       pinctrl {
>>         compatible = "lantiq,pef2256-pinctrl";

If you do not have any resources, there is no point in having separate
compatible for separate device node.

Anyway this discussions should not be about DT. How Linux drivers are
implementing DT is not really a guide how to write DT. Since these
series were brought there were some DT decisions made based how you want
to write the driver. No, please don't. I also do not see any problems in
handling more-or-less complex driver structures without poking the DT.
We have already many such device families.

Best regards,
Krzysztof

