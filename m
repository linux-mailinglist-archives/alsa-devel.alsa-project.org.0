Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04C6E61A8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 14:26:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72564E75;
	Tue, 18 Apr 2023 14:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72564E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681820773;
	bh=A4ooa8EcVxPCPRMAA970Xs48db6/lMkGIRsginT0jPk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lIzhqmqa6xI262whwfZrxyk6fqFsad90Cn37OoZUYupIrM1nqkkwrymXfdpqwEFop
	 2HfNtWi93gI0fu4KI3oktMnqPiuUbX/VW2ZNx0BYbskuUppPBzYHr4ZYQoMy/cUbea
	 hzyuKIvW2W2itNDioPDFMBjC4YEb+i1H5R7HLGKY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB82F800AC;
	Tue, 18 Apr 2023 14:25:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68D79F80155; Tue, 18 Apr 2023 14:25:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 871F5F800D0
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 14:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 871F5F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dt8agR7o
Received: by mail-ej1-x633.google.com with SMTP id q23so63201499ejz.3
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681820713; x=1684412713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ev5WXTYPPIhAR/I8OdIpkj/pJQ+EM34lzeYbEC9ASSY=;
        b=dt8agR7ooelnrNDzOe7AF25AFlJM3MwAKrXaOdy4Ey9KJNUCXogUfbKpjMSPn1pcuB
         5Uv9nZRzQhygdFKEXC+jXG3NFBKjc2yT2CykBzR29oCJqOgy5TAnvSkbn1gZnp++AccP
         RI+5h1MwMjofbgIAdFtw38DAZ3rbO/ybPgyPEVsxAkMaATLt99maVNUTfaztdMnbM0EG
         MVJIdFT28y1VdNXKVrokaGOwzGTHFVpa713Mw6xLcH91X6YP6gs/8kOotNPZsz7JNCDC
         aupQp44QwVMxGwT/Sru0q4r6T+3UO8eC8I0RfM3bYb4UhcMH/04LPUo4r0JkjLPOT5PN
         NRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681820713; x=1684412713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ev5WXTYPPIhAR/I8OdIpkj/pJQ+EM34lzeYbEC9ASSY=;
        b=CcHyGFPon721aG9H2ngTZ0Be28vr1NgxDGcF+oi6eevbIliZDSNPKJJ01xNSFC75uc
         qUGBZR5N5Vc7xXmSxnu4iMUS8Bq2UeXouxCWVyCcB3UVaGcs3BNEUCZwG+usKyNgFBit
         odDfYfJYAqt+yTQI7RIvpmXJLUz1MLrYm5/3uWwiD+Q3X4QCQ6wqPMWlzulCMK0LYe9n
         vcV3Tx59X8aWj2x+gho7u0ReHzNiHLwyXmRvmGcRoLwDezwJkf50KV730DRK4I42kr2A
         bL6q6Yhi0cmip/RUsuXIt560KFmeUfZH3Y2X7azsoEC7K6kFeC2nG/P/IkQvJqAIWAtZ
         Fgmw==
X-Gm-Message-State: AAQBX9cXwdybYKPDTumnlT+WFnco9tkTQ2cX3IFRbSwnNnA8rQCGZZ0+
	N9uqmPjCxD53gVWxmjeG3Yz9sw==
X-Google-Smtp-Source: 
 AKy350Z4tmX0U06wZCE6q5FdRMkDP7l+18lb+7cM4mckgyRf2TzhX9qVRGvgKAwF8u1OYfdAGS6qVg==
X-Received: by 2002:a17:906:ae56:b0:932:1af9:7386 with SMTP id
 lf22-20020a170906ae5600b009321af97386mr10454741ejb.27.1681820713510;
        Tue, 18 Apr 2023 05:25:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77?
 ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 oz8-20020a1709077d8800b009532427b35asm577349ejc.7.2023.04.18.05.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 05:25:13 -0700 (PDT)
Message-ID: <47f27da1-8ed1-327e-74d7-ad4e3f12e3d6@linaro.org>
Date: Tue, 18 Apr 2023 14:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-8-trevor.wu@mediatek.com>
 <310e8979-de96-dda8-6c95-0e6033d8b403@linaro.org>
 <b9daeea6d823b8e84db0ca0df0e04d3716a6b944.camel@mediatek.com>
 <382bc15e-f4e3-3a9f-9dbc-4d46ac1d76d6@collabora.com>
 <3fe703c1279bf4d25a890b63c23a4bc97abd4198.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3fe703c1279bf4d25a890b63c23a4bc97abd4198.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6I7J4W2IDKGD4553WOAVFKAZ3UKPETM6
X-Message-ID-Hash: 6I7J4W2IDKGD4553WOAVFKAZ3UKPETM6
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6I7J4W2IDKGD4553WOAVFKAZ3UKPETM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/04/2023 12:23, Trevor Wu (吳文良) wrote:
>> Actually, doing that is borderline-ok... there's no devicetree for
>> MT8188
>> upstream, so that's not breaking anything at all.
>> In any case, I agree that you should generally avoid doing that but I
>> think
>> that in this specific case it's fine; I'm not a devicetree maintainer
>> though.
>>
>> P.S.: Trevor, next time please make reviewers aware of the fact that
>> no 8188
>>        devicetree is present upstream!
>>
> Got it. Thanks.
> 
> 
> Hi krzysztof,
> 
> Because there is no upstream mt8188 DTS, should I move the new clock to
> the end of clock list?

What is the reason to add them in the middle? So far there was no
argument, so always add at the end. If you have an argument, let's
discuss it.

> 
> If I move "apll1_d4" to the end of the list at binding file, when I
> upstream the devicetree node existing clocks and clock-names properties
> , should I follow the sequence defined in dt-bindings

If you do not follow the sequence of bindings, you upstream incorrect
DTS which does not follow ABI and fails the tests. Therefore yes, use
the same order as your bindings define.

> or can I have a
> new sequence based on the clock type or alphabet?

Sorry, I don't know what is the order of clock type and alphabet. If you
mean anything else than bindings, then no, because how is it supposed to
work then?

Best regards,
Krzysztof

