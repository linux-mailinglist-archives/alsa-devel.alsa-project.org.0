Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4925286C493
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 10:11:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0F81839;
	Thu, 29 Feb 2024 10:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0F81839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709197912;
	bh=tMoK6FUDrp+xEG8MXayhffSTRD7uxqUF1bkVnmBImMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s3/1iw6EgxWWyfYXhN+PzqYeUtFWsXqSG8nqlt/4/xXsBfA/6E4k4QR8x3c+1hX5w
	 GCX+tbqyllL9rFWx8LkItR/+EmHj+CbSArgQRqg6aoKD0Ivbn7DaXez/IYqbc5s+9F
	 +uN0Thn8hZZ+i5UnQuWrYmu7DTH3e5Nwfotl+1mI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 992D7F80589; Thu, 29 Feb 2024 10:11:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA1D1F8059F;
	Thu, 29 Feb 2024 10:11:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00737F801C0; Thu, 29 Feb 2024 10:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D254F80104
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 10:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D254F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=KtDTxq4V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709197854;
	bh=tMoK6FUDrp+xEG8MXayhffSTRD7uxqUF1bkVnmBImMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KtDTxq4V3x/7beEZJLQtt9sgmRHBSvg/iHZy67n6EW9QHLdWyqz81tEjnaKTyzSZV
	 5WX3+Ap8ApXEP73J+CLua4FBE+2PbaZkEb3oVvx5CDWVWuDC7EFVGbrTESfNhSNnup
	 a7cMbtqfDTELG+px0dKfZ1jqSgl0uBKjlqfEz8yOsbAaIXS5nhFxaU+nc3ETL6uc0c
	 L4r6N4ONHDMOxQhGcj+hBK2CTYFLUSOsHTmj3W2h8o3vS8Ut5bBwwy00iRNUApmRhz
	 tIXsllfe4sETzKGc6dgkUyCYFCzFQQeI+qeteGp4EO3AJ1lMPuL40wE55DsGC6+knB
	 cXmIUlEmkuPVw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 764DB3780F7F;
	Thu, 29 Feb 2024 09:10:52 +0000 (UTC)
Message-ID: <37181fc1-a485-427c-b3d2-2fcfb192e6e9@collabora.com>
Date: Thu, 29 Feb 2024 10:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/22] ASoC: dt-bindings: mt8195: Document audio-routing
 and dai-link subnode
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
 <20240227120939.290143-19-angelogioacchino.delregno@collabora.com>
 <32ff2f66-7a94-41ed-b77b-f78da2e57446@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <32ff2f66-7a94-41ed-b77b-f78da2e57446@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GEKEYUT4JMNNE632G2P25NEOYLJRU7YM
X-Message-ID-Hash: GEKEYUT4JMNNE632G2P25NEOYLJRU7YM
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEKEYUT4JMNNE632G2P25NEOYLJRU7YM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 29/02/24 09:25, Krzysztof Kozlowski ha scritto:
> On 27/02/2024 13:09, AngeloGioacchino Del Regno wrote:
>> Document the dai-link subnodes and the audio-routing property, allowing
>> to describe machine specific audio hardware and links in device tree.
>>
>> While at it, also deprecate the old properties which were previously
>> used with driver hardcoded configuration.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> 
>>   
>>     mediatek,adsp:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>> @@ -45,12 +56,75 @@ properties:
>>         A list of the desired dai-links in the sound card. Each entry is a
>>         name defined in the machine driver.
>>   
>> +patternProperties:
>> +  ".*-dai-link$":
>> +    type: object
>> +    description:
>> +      Container for dai-link level properties and CODEC sub-nodes.
>> +
>> +    properties:
>> +      link-name:
>> +        description: Indicates dai-link name and PCM stream name
>> +        items:
> 
> That's not a list, but just enum.
> 

Ok! Will change for v2.

>> +          enum:
>> +            - DPTX_BE
>> +            - ETDM1_IN_BE
>> +            - ETDM2_IN_BE
>> +            - ETDM1_OUT_BE
>> +            - ETDM2_OUT_BE
>> +            - ETDM3_OUT_BE
>> +            - PCM1_BE
>> +
>> +      codec:
>> +        description: Holds subnode which indicates codec dai.
>> +        type: object
>> +        additionalProperties: false
>> +        properties:
>> +          sound-dai:
>> +            minItems: 1
>> +            maxItems: 2
>> +        required:
>> +          - sound-dai
>> +
>> +      dai-format:
>> +        description: audio format
>> +        items:
> 
> Ditto
> 
>> +          enum:
>> +            - i2s
>> +            - right_j
>> +            - left_j
>> +            - dsp_a
>> +            - dsp_b
>> +
>> +      mediatek,clk-provider:
>> +        $ref: /schemas/types.yaml#/definitions/string
>> +        description: Indicates dai-link clock master.
>> +        items:
> 
> Ditto
> 
>> +          enum:
>> +            - cpu
>> +            - codec
>> +
>> +    additionalProperties: false
> 
> This goes either to the top of the section (after type:object) for
> readability or after required: block below.
> 

I think I actually saw this in some other binding, that's why it's there... or
maybe I am confusing something else - whatever.

I'll move it, anyway - thanks

>> +
>> +    required:
>> +      - link-name
>> +
>>   additionalProperties: false
> 
>>   
>>   required:
>>     - compatible
>>     - mediatek,platform
>>   
>> +# Disallow legacy properties if dai-link-xxx nodes are specified
>> +if:
>> +  not:
> 
> I don't think this works. To test if node is present or node, you would
> need to use required.
> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/devicetree/bindings/net/qcom,ipa.yaml#L174
> 
> Are you sure this if:then: works as expected?
> 

Honestly, coming up with something that worked took me almost a full hour.
I was going a bit crazy over this one :-)

btw - Yes, it does work.

If you wanna give it a shot too, patch 21 and 22 are introducing the audio-routing
and (x)-dai-link nodes in (respectively) mt8195-cherry.dtsi and mt8186-corsola.dtsi
devicetrees - and those do validate just fine both with and without those patches.

I also tested this by adding the forbidden dptx-codec/hdmi-codec properties along
with the dai-link nodes in the example of this yaml file, and I've verified that
adding those makes the validation fail as expected.

Exactly, this is what I want and also what I've tested with dtbs/dt_binding_check:

fmt: (test nodes/properties) <- (result)

x-dai-link { ... }; mediatek,dptx-codec = <...>; <- FAIL (OK)
x-dai-link { ... }; mediatek,hdmi-codec = <...>; <- FAIL (OK)
x-dai-link { ... }; mediatek,dptx-codec = ..; mediatek,hdmi-codec .. <- FAIL (OK)

x-dai-link { ... }; (none of those two) <- PASS (OK)

(NO x-dai-link) mediatek,dptx-codec = <...> <- PASS (OK)
(NO x-dai-link) mediatek,hdmi-codec = <...> <- PASS (OK)
(NO x-dai-link) mediatek,dptx-codec = <...> mediatek,hdmi-codec = <...> <- PASS(OK)

...and of course, also tested the easy part
dai-link-x { ... }; <- FAIL (OK)    :-)

Cheers,
Angelo

> 
>> +    patternProperties:
>> +      ".*-dai-link$": false
>> +then:
>> +  properties:
>> +    mediatek,dptx-codec: false
>> +    mediatek,hdmi-codec: false
>> +
>>   examples:
>>     - |
>>   
> 
> 
> Best regards,
> Krzysztof
> 



