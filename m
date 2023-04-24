Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B04256ED015
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 16:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1AD2F45;
	Mon, 24 Apr 2023 16:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1AD2F45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682345556;
	bh=VhLC0RRb6TdlIZA0O3CiS5ujuOCTAxE2jPtc5kljAgc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PyP2uYbg6zVLSHC+I98++E+iCNoCM5DrYcV4bqKMkij2/3PCV8qixYN9gzPpbm2jl
	 NiIh/xpxCZNNUSug/v6rHWXZtdLWbJsgK48rS+OB+OpyiXKtg5daUIfUofskb4qt1L
	 V7kI5cxXTBIdwbeMChQulBnCPgOMGd/OermmgA2Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12EEFF80162;
	Mon, 24 Apr 2023 16:11:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15C44F8018A; Mon, 24 Apr 2023 16:11:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17FB4F800AC
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 16:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17FB4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PG9T1fl4
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94eee951c70so686230666b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 24 Apr 2023 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682345492; x=1684937492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyOmFLO2JoBn3WUaKWXU8qyDvCA1T3Gwnz4RtedevIA=;
        b=PG9T1fl49/momPqz7oKrvqcQovXddXgLi8MagEHArWynQva1DUuyjG6No0tW7MMAI2
         /Lw8u9WhLibQy4jY8ZBNevD5UjjogZEjwFp9xa0m8DMAMcDojj0DmT9p5qS3ddu6YhVE
         sagFfArUw5Rpww44UUQ67doQb3g/iq6mZDAfePFMQrpXH6cdk25Nv9e5MeNV3jjQWNgE
         DiZkKWJyZYMDmMkhhhL7q1tjISXi9IvFiakQ4zOoVxl8IgpkhfqZ1IHZ/ECtK/bkgKkc
         6Vtpr41OwTNkfZ6yElPpu7RDd0c0nwp7W7awTKnAtSRFqIFpAZa4WmKAFJvUOSTxutFT
         2mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682345492; x=1684937492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cyOmFLO2JoBn3WUaKWXU8qyDvCA1T3Gwnz4RtedevIA=;
        b=QnOnv0Dn+498dlgl6yiVUFvXUgJOcos6bagrSkO5TtKWyf48qubTOpw4R6DunM7NVT
         7OAnsB6wVX2jmM5UqjKO12g7FCAHukMEjfQRUhX7r7AjftrNefjj5gMEeyhsv92vS34X
         PnkKWBKW1V4uGDcAbNYbrtYXKXqtbWkejMsp5YcJ67WMHiY/40/a5ZEPPKp6PUtk7Tfe
         qAC1CCgSJDhAkoStlZ/rxuNULy94BHplAPiEZ6mkq3qfv8KM4Td6og91AH/1b8zVvrN7
         tdyLtLB/hOTMclDrfd+W3W37xxlx2v6UcASi3M0A1SO3bjoQMXiGNrZVPVRTtv8qHb45
         76zQ==
X-Gm-Message-State: AAQBX9eGXaPZ2vzx4bJ/a+0Llo5Vd/mpkwAMnczb/3BguboAGhJVdRGX
	f5WCtInjclx082Q1a8z1He3cPQ==
X-Google-Smtp-Source: 
 AKy350aBgtFZYTL1Ju0RY3cxLmt1xiSQKImJxRO9xYY9udVWu8lfE3sHZ3IJpLZ8MJK1oMZdRdr+KA==
X-Received: by 2002:a17:907:9554:b0:957:272d:7b2c with SMTP id
 ex20-20020a170907955400b00957272d7b2cmr8890674ejc.41.1682345491717;
        Mon, 24 Apr 2023 07:11:31 -0700 (PDT)
Received: from [10.105.146.163] ([88.128.92.195])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a1709064f8900b0094f3b18044bsm5532222eju.218.2023.04.24.07.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 07:11:31 -0700 (PDT)
Message-ID: <786adb30-1b5e-96d7-358b-0b4d3e89964c@linaro.org>
Date: Mon, 24 Apr 2023 16:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 3/7] mfd: Add support for the Lantiq PEF2256 framer
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
 <20230417171601.74656-4-herve.codina@bootlin.com>
 <20230420123946.GB996918@google.com> <20230420151551.78c1288b@bootlin.com>
 <20230420134703.GC996918@google.com> <20230421092645.56127f11@bootlin.com>
 <20230421074558.GQ996918@google.com>
 <054a384b-b0ef-2697-4a70-09868694ec6d@linaro.org>
 <20230424095200.GC8035@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230424095200.GC8035@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HWJFBN3OIKSRWTQKDFM4RQG5LC2VEGEV
X-Message-ID-Hash: HWJFBN3OIKSRWTQKDFM4RQG5LC2VEGEV
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Herve Codina <herve.codina@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWJFBN3OIKSRWTQKDFM4RQG5LC2VEGEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/04/2023 11:52, Lee Jones wrote:
>>>>>>>>  include/linux/mfd/pef2256.h |  52 ++
>>>>>>>>  5 files changed, 1269 insertions(+)
>>>>>>>>  create mode 100644 drivers/mfd/pef2256-regs.h
>>>>>>>>  create mode 100644 drivers/mfd/pef2256.c
>>>>>>>>  create mode 100644 include/linux/mfd/pef2256.h    
>>>>>>>
>>>>>>> [...]
>>>>>>>   
>>>>>>>> +static int pef2256_add_audio_devices(struct pef2256 *pef2256)
>>>>>>>> +{
>>>>>>>> +	const char *compatible = "lantiq,pef2256-codec";
>>>>>>>> +	struct mfd_cell *audio_devs;
>>>>>>>> +	struct device_node *np;
>>>>>>>> +	unsigned int count = 0;
>>>>>>>> +	unsigned int i;
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	for_each_available_child_of_node(pef2256->dev->of_node, np) {
>>>>>>>> +		if (of_device_is_compatible(np, compatible))
>>>>>>>> +			count++;
>>>>>>>> +	}    
>>>>>>>
>>>>>>> Converting Device Tree nodes into MFD cells to register with the
>>>>>>> Platform Device API is not a reasonable use-case of MFD.
>>>>>>>
>>>>>>> Have the CODEC driver match on "lantiq,pef2256-codec" and let it
>>>>>>> instantiate itself.  
>>>>>>
>>>>>> As the framer is going to used by several subsystem, I cannot instantiate
>>>>>> it in the specific ASoC subsystem.
>>>>>>   
>>>>>>>
>>>>>>> Your first version using of_platform_populate() was closer to the mark.  
>>>>>>
>>>>>> The issue was that I need MFD cells for the pinctrl part.  
>>>>>
>>>>> Why can't it be represented in DT?
>>>>
>>>> The pinctrl part has no specific compatible string.
>>>> Not sure that a compatible string for pinctrl can be accepted
>>>> as there is only one pinctrl subnode and no specific reg for this
>>>> subnode.
>>>>
>>>> The DT looks like this:
>>>>     framer@2000000 {
>>>>       compatible = "lantiq,pef2256";
>>>>       reg = <0x2000000 0x100>;
>>>>       ...
>>>>       pinctrl {
>>>>         pef2256_rpa_sypr: rpa-pins {
>>>>           pins = "RPA";
>>>>           function = "SYPR";
>>>>         };
>>>>       };
>>>>
>>>>       pef2256_codec0: codec-0 {
>>>>         compatible = "lantiq,pef2256-codec";
>>>>         #sound-dai-cells = <0>;
>>>>         sound-name-prefix = "PEF2256_0";
>>>>       };
>>>>     };
>>>>
>>>> Krzysztof, is it acceptable to have a compatible string in the pinctrl node ?
>>>
>>> Why wouldn't it be?
>>>
>>> $ git grep ".compatible" -- drivers/pinctrl/
>>>
>>>> In this case, it will looks like this:
>>>>     framer@2000000 {
>>>>       compatible = "lantiq,pef2256";
>>>>       reg = <0x2000000 0x100>;
>>>>       ...
>>>>       pinctrl {
>>>>         compatible = "lantiq,pef2256-pinctrl";
>>
>> If you do not have any resources, there is no point in having separate
>> compatible for separate device node.
> 
> That's a new rule.  Is that documented somewhere?  I'm sure we already
> have device nodes for devices whom only operate on shared resources. 

Let me clarify - no need for separate node for such case, when this is
in general one device and it's sub-block does not look re-usable. For
SoC blocks it is a bit different. For PMICs which pretty often re-use
pieces between different devices, as well.

But here there is not much benefit of separate device node for pinctrl.

Whether rule is new? Dunno, depends, I saw it from reviews from Rob
since long time, e.g.:
https://lore.kernel.org/all/20220902172808.GB52527-robh@kernel.org/

Maybe this is a bit different because of children - pinconf settings?
But I would still look at this as:
1. For a re-usable sub-block: separate device node and compatible is useful,
2. Non-reusable but having a child node only to group children like pin
configuration nodes: no need for compatible.

Best regards,
Krzysztof

