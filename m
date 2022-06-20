Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D551551362
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 10:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E9F4192A;
	Mon, 20 Jun 2022 10:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E9F4192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655715187;
	bh=ydGuVuAAZ+kigXis6thd6FFwmw3s0WhqsTE07hL1B8U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOo11bcs2fUTJJxGoknbuEJ/0V58c5gSFIohBnVU325KIEed/V0XKC/FA2VSuAlCe
	 lSsZlxPRqJVCh+eIoc7a27y4dlgUcD6MrGTL88H0/EbcjkobSi4XKbvCBVABltf+9S
	 ZideLVw9IFt1f7yC3xB93S0vzvd+dd6jTxXaQEtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80965F804D8;
	Mon, 20 Jun 2022 10:52:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E607F800CB; Mon, 20 Jun 2022 10:52:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF64F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 10:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF64F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="C3NCc0tF"
Received: by mail-ej1-x634.google.com with SMTP id hj18so19091136ejb.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rvDozfpUth1u46mvzNNqlITVPQfdrkhSHQIaeMfchFw=;
 b=C3NCc0tF7vEHhwoLV0fuSwQQIdJuEh+/1DuVypXeKHJnwkCcSHrmhXUgIbDi/L9BLi
 8Orf+wD6b2kDhmDd9Nx4V2N6lIibh6/j96lUI/QRAYTmmnA+ouosoTOPn3KBFbMgXlfE
 XLC8aHRK8eGaWHD3rzsEYVpnB0K0vQ5WEQZkaL3Xk/0/2QwFJnsZFAHCvg4uWUMWK1WY
 dMrBZ0Q8zegFPHU+iguKm6Zl2sREi1gowFLvAHmsBBpeMJJwPizzSETXOKDjHsvSozKV
 5l5gDPUqzvCLt66o1728YU9XUBBUN0SX5eZk9pkk/NbjN68tygMCwaPF0mTY4OhK37Uw
 PVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rvDozfpUth1u46mvzNNqlITVPQfdrkhSHQIaeMfchFw=;
 b=ZNCLbSgFKBU/+48+9yODwmehYGt4cKW8Ll65hJmlUyt/bjOewJ8nhJ6W0IqBD7lIAc
 cPfCdultmUHGJIAre8zpwYZU7aVbG11+FlCgtrHQWxAUZkzjFlSW3mV4miHGDCGemUK+
 V9L3hlWky9DEasZ6/6VfPQUFs/lKA4S4K+MDrVRRvx7EOhI8J6HPJaTltcaVHUSHmPNo
 X/Rni/NnvaIPf6Q99aX3qexJ0H4rm0WYYX1nyYufhkXMTP7KFotjnyrSOLdKlU51YoYt
 JBuFSj0s7MXu4hE09+svZh49RFws89eJWMJ05b0SA2KnnEptr93HwuOL1MgkVhqA9LeB
 51Ew==
X-Gm-Message-State: AJIora9oH58RzQVjEn9qRtl5R91MLlIBvLT+IgHJ/yKb2s2qFxFaTBrb
 qnNlmeqwZ1VyIpwtaLBaBoBS3w==
X-Google-Smtp-Source: AGRyM1vosA5HJnj8GWCVoK53xdzGqpfYGN+DOWudxrPO+Dwn2p+1IKeZuKxi1oeqArmKrujW/Cs3og==
X-Received: by 2002:a17:906:d550:b0:704:ae79:7db1 with SMTP id
 cr16-20020a170906d55000b00704ae797db1mr19958640ejc.478.1655715117980; 
 Mon, 20 Jun 2022 01:51:57 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 a24-20020aa7cf18000000b004356c18b2b9sm5577856edy.44.2022.06.20.01.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 01:51:57 -0700 (PDT)
Message-ID: <3830efc5-298d-7887-5718-2cb2a7ad4895@linaro.org>
Date: Mon, 20 Jun 2022 10:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/4] dt-bindings: dsp: mediatek: Use meaningful names
 for mbox
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
 <20220616073042.13229-2-tinghan.shen@mediatek.com>
 <629e761b-e3ad-0861-1937-ad660a8a900b@linaro.org>
 <af32751dd7013a96dac5d165c35e132fda87f2ac.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <af32751dd7013a96dac5d165c35e132fda87f2ac.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20/06/2022 08:40, Tinghan Shen wrote:
> Hi Krzysztof,
> 
> On Thu, 2022-06-16 at 06:55 -0700, Krzysztof Kozlowski wrote:
>> On 16/06/2022 00:30, Tinghan Shen wrote:
>>> Rename mbox according to actions instead of 'mbox0' and 'mbox1'.
>>>
>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>> ---
>>>  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml   | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>> b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>> index b7e68b0dfa13..ca8d8661f872 100644
>>> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>> @@ -50,13 +50,13 @@ properties:
>>>  
>>>    mboxes:
>>>      items:
>>> -      - description: ipc reply between host and audio DSP.
>>> -      - description: ipc request between host and audio DSP.
>>> +      - description: mailbox for receiving audio DSP requests.
>>> +      - description: mailbox for transmitting requests to audio DSP.
>>>  
>>>    mbox-names:
>>>      items:
>>> -      - const: mbox0
>>> -      - const: mbox1
>>> +      - const: rx
>>> +      - const: tx
>>>  
>>
>> Commit msg lacks important piece - do you break any users with this? Do
>> you have any users of this binding?
>>
>>
>> Best regards,
>> Krzysztof
> 
> The 8195 dsp node, which uses this binding, has not yet been added to the 8195 devicetree.

Could you mention it in the commit msg? Such one sentence is enough.

With commit msg extended:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
