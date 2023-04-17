Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005AC6E41BB
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 09:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E6A83E;
	Mon, 17 Apr 2023 09:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E6A83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681718182;
	bh=n4AOlOimwQVUqagaWa7omxYytiG3BDp/W3qfa2Zd8u4=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=tGC70z33t74nXw/t4UFEGJUU8yBYsrcuIrLmyOjPzJsD0sU5L/fCaHdSTBe8Fu9ox
	 8riG3zWhXreW/ll5SAnk8Lg9hO+P0sMemjtKMYzYtrPdf8DNjP8t2io1lpdvQC7mg2
	 WOf+ZQjvtmIrTfoyTMLBgnOR+qd6yoWOtbYYTlTk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 236C3F8025D;
	Mon, 17 Apr 2023 09:55:32 +0200 (CEST)
Date: Mon, 17 Apr 2023 09:55:16 +0200
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-8-trevor.wu@mediatek.com>
 <310e8979-de96-dda8-6c95-0e6033d8b403@linaro.org>
 <b9daeea6d823b8e84db0ca0df0e04d3716a6b944.camel@mediatek.com>
In-Reply-To: <b9daeea6d823b8e84db0ca0df0e04d3716a6b944.camel@mediatek.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSEXC7HR3HMWUCT4F7ATYFV2DTMO56NS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168171813110.26.9053769585425188723@mailman-core.alsa-project.org>
From: AngeloGioacchino Del Regno via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3ADFF80266; Mon, 17 Apr 2023 09:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8127AF800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 09:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8127AF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=WZEc1aIy
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 912EA6600014;
	Mon, 17 Apr 2023 08:55:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681718119;
	bh=5N232Jlo3FBfPVIuaIIjg0Kg1+Qi6wc39jlYxC2rskQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WZEc1aIy9AqxZiSJrJNoMOoh5l5pa3wEGLliWPoQlmLQcHpsq3jaa52jJeynoZXsj
	 oT6qRNm9bjhZZraMHEj4gcWCJvtE35UOi2KSK69DH/p276Av8pJn2HY5Ol0uNH7o8e
	 t80AoxtAkXawFYF+H3sQVCybt2tB/BHH0y5CP1tmzwASpg39DZ1gGG3rWhxA0/6k23
	 X1fvWuzj2/TQJpQbyeIL8SoRPX8NNEbeGKAtGjiq/3ahFrL3sxe3PrmYHZdfT5KpaP
	 ycJ+adZP1hLIAPfUi1fodh2cEWxIc6T4T2/ZMqyIPjHTcwkBxv+ZmuquQDReEYP7oP
	 wQxablvJup/ug==
Message-ID: <382bc15e-f4e3-3a9f-9dbc-4d46ac1d76d6@collabora.com>
Date: Mon, 17 Apr 2023 09:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-8-trevor.wu@mediatek.com>
 <310e8979-de96-dda8-6c95-0e6033d8b403@linaro.org>
 <b9daeea6d823b8e84db0ca0df0e04d3716a6b944.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b9daeea6d823b8e84db0ca0df0e04d3716a6b944.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YSEXC7HR3HMWUCT4F7ATYFV2DTMO56NS
X-Message-ID-Hash: YSEXC7HR3HMWUCT4F7ATYFV2DTMO56NS
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSEXC7HR3HMWUCT4F7ATYFV2DTMO56NS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 17/04/23 04:44, Trevor Wu (吳文良) ha scritto:
> On Sat, 2023-04-15 at 11:00 +0200, Krzysztof Kozlowski wrote:
>>
>> On 13/04/2023 12:47, Trevor Wu wrote:
>>> Assign top_a1sys_hp clock to 26M, and add apll1_d4 to clocks for
>>> switching
>>> the parent of top_a1sys_hp dynamically
>>> On the other hand, "mediatek,infracfg" is included for bus
>>> protection.
>>>
>>> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
>>> ---
>>>   .../bindings/sound/mediatek,mt8188-afe.yaml    | 18
>>> ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
>>> b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
>>> index 82ccb32f08f2..03301d5082f3 100644
>>> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-
>>> afe.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-
>>> afe.yaml
>>> @@ -29,6 +29,10 @@ properties:
>>>       $ref: /schemas/types.yaml#/definitions/phandle
>>>       description: The phandle of the mediatek topckgen controller
>>>
>>> +  mediatek,infracfg:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of the mediatek infracfg controller
>>> +
>>>     power-domains:
>>>       maxItems: 1
>>>
>>> @@ -37,6 +41,7 @@ properties:
>>>         - description: 26M clock
>>>         - description: audio pll1 clock
>>>         - description: audio pll2 clock
>>> +      - description: audio pll1 divide 4
>>>         - description: clock divider for i2si1_mck
>>>         - description: clock divider for i2si2_mck
>>>         - description: clock divider for i2so1_mck
>>> @@ -58,6 +63,7 @@ properties:
>>>         - const: clk26m
>>>         - const: apll1
>>>         - const: apll2
>>> +      - const: apll1_d4
>>
>> Why do you add clocks in the middle? The order is strict, so you just
>> broke all DTS.
>>
> 
> In DTS file, I only need to make sure that the order in clocks should
> be the same as clock-names, so I misunderstood that I can add the clock
> in the middle based on the clock type.
> 
> Sorry, I didn't know the order is strict. I will move the new clock to
> the last one in v2.
> 

Actually, doing that is borderline-ok... there's no devicetree for MT8188
upstream, so that's not breaking anything at all.
In any case, I agree that you should generally avoid doing that but I think
that in this specific case it's fine; I'm not a devicetree maintainer though.

P.S.: Trevor, next time please make reviewers aware of the fact that no 8188
       devicetree is present upstream!

Regards,
Angelo


