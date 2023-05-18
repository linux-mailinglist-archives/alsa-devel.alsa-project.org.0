Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2CD707B23
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681761FE;
	Thu, 18 May 2023 09:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681761FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395450;
	bh=aqtetW2bil/iQDeUQEmtH4Atb7R4jzFfT5IiCdg1mqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ttJumMa3faPQN5pUN0xqRBv5DWImOHgHVXiJjq4f6zgTnO/8J1hHOrH6+pefA7wPW
	 OKldlaNjIRhmjZe/6dw2fVu1S5JDkhlOMJt29F0szTSNyhAfdNA4YWxZWBYx0XGlQf
	 s5bHIactB/lnC8VI73ngV8cF9C0DTjzft333VT3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBF53F8025A; Thu, 18 May 2023 09:36:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A9EF8025A;
	Thu, 18 May 2023 09:36:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E992DF80272; Thu, 18 May 2023 09:36:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE31DF8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE31DF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QzEJZhz7
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso320190566b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684395388; x=1686987388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ste+hA3hVZg/wcPWyWKj67qIkpodPoS4fVaLQiPlcds=;
        b=QzEJZhz79HlFdtViq9eqLPahBfKlyYWEPsxmRT26/MAU5o3QQIjH8Rq1P+lhoJtFTo
         K7aGW6ybsrTfEAlzUo7FNjomb8FGMjKQTQIpClTc4kN0zaXiQqqPOCI2trT/LieP5sdm
         mX/nJel5naiIN/6j4qOqyOgxkONRJ1RmkgvxAUIJ8CQBc48TKaxztvuWmoKHDxZ0cGY1
         UB10jhv4eOMwfPdwhfwR+6z6SRyI8qNHBzHQYJUvvlkhkegcjP6rlK2HLglrdc9QEZgr
         h5+66G87iwjuqGnsiH73SRiEFVg6Dtgp2m3+PY4hKiOvWfzdF5Tni6RKCBc2fBYrxeh8
         VGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684395388; x=1686987388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ste+hA3hVZg/wcPWyWKj67qIkpodPoS4fVaLQiPlcds=;
        b=YyGa0aoj4VeEb0DxawDZpmPZySniyO6WvtMILZX2cd94HNMofGYA5WWh5qx1fNpn6S
         7nsqV0EsXnOIOzYQjRZH9Swnab5wiWoGs9/Nx7HuwqWnJVCrhhMNqebpkBrvLShIJ5dy
         /0OHP99RX5UJzqaUp6R9NrF+mcfqGqXDc5FxK2Ja1rlou+ju4KwbjGcmqdgKIBu0QpKx
         Z7y1i6yp1KGKwVaD//MmAmMhoMiPMw4zzbW9OK7ZXbn6PvKSNSaw1nW4wT1o1GK4xztG
         RBLAhNqBn+Y0LVll+KXMCkpHVgjTSB65393DDXv4sn240/GW6ebMDp/XTtHaVzC3r5zL
         Srzg==
X-Gm-Message-State: AC+VfDzxTHLr8s5VY4kswSAY9fJyzCsEtHvOB75qUab9PT3Cnh52xknW
	4uZttx6yaIksGK1tHkat/4zQGA==
X-Google-Smtp-Source: 
 ACHHUZ7Vh4OMaRUBvmALYQnHYbI1fQ7eSxuoQNeQi0X2/Sih20ahC1IIfU/tohj31CS190ZY2Niurg==
X-Received: by 2002:a17:906:ef0d:b0:94e:e9c1:1932 with SMTP id
 f13-20020a170906ef0d00b0094ee9c11932mr42996168ejs.43.1684395388608;
        Thu, 18 May 2023 00:36:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a2b:c408:5834:f48e?
 ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 l7-20020a170906938700b00947ed087a2csm593598ejx.154.2023.05.18.00.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 00:36:28 -0700 (PDT)
Message-ID: <d1a04735-d80d-d1d8-01fe-d6772d50b43b@linaro.org>
Date: Thu, 18 May 2023 09:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: update
 properties
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-6-trevor.wu@mediatek.com>
 <9359c081-cd36-3e5b-a113-7600b4ba435e@linaro.org>
 <d207670232288181171473d47536173a7aa47c75.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d207670232288181171473d47536173a7aa47c75.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SIBSY3WE2I37DGGG5XZW6GKW4HYOEABT
X-Message-ID-Hash: SIBSY3WE2I37DGGG5XZW6GKW4HYOEABT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIBSY3WE2I37DGGG5XZW6GKW4HYOEABT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/05/2023 04:37, Trevor Wu (吳文良) wrote:
> On Wed, 2023-05-17 at 16:43 +0200, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 17/05/2023 13:15, Trevor Wu wrote:
>>> Add compatible string "mediatek,mt8188-nau8825" to support new
>>> board
>>> with nau8825 codec.
>>
>> Subject: everything can be update of properties. Rephrase to focus on
>> actual change, e.g. on adding NAU8825.
>>
> OK. I will rename the topic in v2.
> 
>>>
>>> ADDA_BE is used to connect to mt6359. For the machine, it must be
>>> fixed to the same codec and configured on the machine driver.
>>> Remove
>>> ADDA_BE from items of link-name.
>>
>> I don't understand the justification for this. If this is not a
>> correct
>> link name for MT6359 setup, then it should be removed in its own
>> patch.
>> If this is removed because of adding NAU8825, then why does it affect
>> MT6359?
>>
> 
> In the patch series, [PATCH 1/5] divides ADDA_BE into UL_SRC_BE and
> DL_SRC_BE. I was going to replace the link name, but I found it
> shouldn't be configured for the machine, because mt6359 is the only
> codec for ADDA_BE and it's hardcoded in the machine driver. As a
> result, I decided to remove it.
> 
> I will separate it from the patch, and put the new patch after [PATCH
> 1/5].

Yes, please.

Best regards,
Krzysztof

