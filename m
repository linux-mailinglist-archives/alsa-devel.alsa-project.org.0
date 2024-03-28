Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D28751CA
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 15:26:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43E8583B;
	Thu,  7 Mar 2024 15:26:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43E8583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709821608;
	bh=zuG49lDm461OS0LXDvrKEdM3DKMWByyShdxfkM/iKeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sXi2i5VE/UmbGzm3WyOTnsvcZtDXgqCJnumJ79Fkg4iX2trQhFBFmMhOOLltegHUp
	 ywgbYws/dcYZGJwmUH+mSJtTNIAhstAXz+G8Y2a/cuc7+1lficOjNswANi/M4rnkmO
	 HaKmeV985Pe1jTy1L01WYfiYN6FPZf8DfIXLU6Xs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16248F80578; Thu,  7 Mar 2024 15:26:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3FC7F80587;
	Thu,  7 Mar 2024 15:26:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA756F8024E; Thu,  7 Mar 2024 15:26:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B82C8F8014B
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 15:26:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B82C8F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=PIS1IorO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709821575;
	bh=zuG49lDm461OS0LXDvrKEdM3DKMWByyShdxfkM/iKeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PIS1IorOJ8seJQ91WxX7LitzHeOqiTMMCX1i0SX8RuBJWIekJxJvBaBfnO8RztfdA
	 V1O7QLfYDnyKqa5TPQL+wS7iztNrFyb4hN3IHcySPVz5uFMUJ0c6IvWBFuKR6jZKoH
	 vdMhYqsgP8jbQEaM0TmcFNmW7ehXXRVqfrH0ezl3oBIqu3Z8DgKXNbKRcg7xv5y2aQ
	 qN2Ec3YXAkLBLbzsQMSqvQZuZjXnmUjBPmMFIPwTIKiofbaxUx+ZUFyGaoFg90BqWl
	 afU31KaOJLE2qMKfbyRS+KXR1uxr0EFjbr/bOvGdFj/sfCyR66P2wxk3KHbMT1cRGP
	 RB0q8/JebPvWg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0DDB837809D0;
	Thu,  7 Mar 2024 14:26:13 +0000 (UTC)
Message-ID: <7fa3cd50-4603-4983-8396-ec8c90fd43fa@collabora.com>
Date: Thu, 7 Mar 2024 15:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/22] ASoC: dt-bindings: mt8192: Document audio-routing
 and dai-link subnode
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com,
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
 <20240227120939.290143-20-angelogioacchino.delregno@collabora.com>
 <20240304142341.GA156846-robh@kernel.org>
 <0aa3dc07-67c8-40a4-9e83-f702979765c5@collabora.com>
 <CAL_JsqLNsS_Rx5z5F1vrYbr2g+5-wGYOq6mhtfUd7Db11F0W+Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: 
 <CAL_JsqLNsS_Rx5z5F1vrYbr2g+5-wGYOq6mhtfUd7Db11F0W+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SLRY6M2T6JT6SQEUO6F3TSKXMUYFODGS
X-Message-ID-Hash: SLRY6M2T6JT6SQEUO6F3TSKXMUYFODGS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLRY6M2T6JT6SQEUO6F3TSKXMUYFODGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 07/03/24 15:03, Rob Herring ha scritto:
> On Tue, Mar 5, 2024 at 5:20 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 04/03/24 15:23, Rob Herring ha scritto:
>>> On Tue, Feb 27, 2024 at 01:09:36PM +0100, AngeloGioacchino Del Regno wrote:
>>>> Document the dai-link subnodes and the audio-routing property, allowing
>>>> to describe machine specific audio hardware and links in device tree.
>>>>
>>>> While at it, also deprecate the old properties which were previously
>>>> used with the driver's partially hardcoded configuration.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 129 ++++++++++++++++--
>>>>    1 file changed, 121 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
>>>> index 7e50f5d65c8f..78e221003750 100644
>>>> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
>>>> @@ -20,6 +20,15 @@ properties:
>>>>          - mediatek,mt8192_mt6359_rt1015p_rt5682
>>>>          - mediatek,mt8192_mt6359_rt1015p_rt5682s
>>>>
>>>> +  audio-routing:
>>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>>
>>> Already defined in sound-card-common.yaml. Add a $ref.
>>>
>>
>> Right. Done for v2.
>>
>>>> +    description:
>>>> +      A list of the connections between audio components. Each entry is a
>>>> +      pair of strings, the first being the connection's sink, the second
>>>> +      being the connection's source.
>>>> +      Valid names could be the input or output widgets of audio components,
>>>> +      power supplies, MicBias of codec and the software switch.
>>>
>>> Generally the names are defined here.
>>>
>>
>> ...but those drivers want to support multiple codecs and multiple boards, so
>> for each board we would maybe have to add (software defined) names in here
>> which don't always correspond to a HW pin name (but that's not really a problem).
>>
>> Sure a subset of the names can't change but, on the other hand, some others
>> can (as in, may be added).
>>
>> Hence the question:
>>
>> Is it mandatory to define the names in an enum here, or can that be avoided?
>> If it is, I can add them no problem.
> 
> Does the OS depend on what the names are? As-in if a name was "bar"
> and it changed to "baz" in either the DT or the kernel, would that
> break things? If yes, then yes, you need them defined here.
> 

Yes, I need them defined here, definitely.

>>
>>>> +
>>>>      mediatek,platform:
>>>>        $ref: /schemas/types.yaml#/definitions/phandle
>>>>        description: The phandle of MT8192 ASoC platform.
>>>> @@ -27,10 +36,12 @@ properties:
>>>>      mediatek,hdmi-codec:
>>>>        $ref: /schemas/types.yaml#/definitions/phandle
>>>>        description: The phandle of HDMI codec.
>>>> +    deprecated: true
>>>>
>>>>      headset-codec:
>>>>        type: object
>>>>        additionalProperties: false
>>>> +    deprecated: true
>>>>
>>>>        properties:
>>>>          sound-dai:
>>>> @@ -41,6 +52,7 @@ properties:
>>>>      speaker-codecs:
>>>>        type: object
>>>>        additionalProperties: false
>>>> +    deprecated: true
>>>>
>>>>        properties:
>>>>          sound-dai:
>>>> @@ -51,13 +63,83 @@ properties:
>>>>        required:
>>>>          - sound-dai
>>>>
>>>> +patternProperties:
>>>> +  ".*-dai-link$":
>>>> +    type: object
>>>> +    description:
>>>> +      Container for dai-link level properties and CODEC sub-nodes.
>>>> +
>>>> +    properties:
>>>> +      link-name:
>>>> +        description: Indicates dai-link name and PCM stream name
>>>> +        items:
>>>> +          enum:
>>>> +            - I2S0
>>>> +            - I2S1
>>>> +            - I2S2
>>>> +            - I2S3
>>>> +            - I2S4
>>>> +            - I2S5
>>>> +            - I2S6
>>>> +            - I2S7
>>>> +            - I2S8
>>>> +            - I2S9
>>>> +            - TDM
>>>> +
>>>> +      codec:
>>>> +        description: Holds subnode which indicates codec dai.
>>>> +        type: object
>>>> +        additionalProperties: false
>>>> +        properties:
>>>> +          sound-dai:
>>>> +            minItems: 1
>>>> +            maxItems: 2
>>>> +        required:
>>>> +          - sound-dai
>>>> +
>>>> +      dai-format:
>>>> +        description: audio format
>>>> +        items:
>>>> +          enum:
>>>> +            - i2s
>>>> +            - right_j
>>>> +            - left_j
>>>> +            - dsp_a
>>>> +            - dsp_b
>>>> +
>>>> +      mediatek,clk-provider:
>>>> +        $ref: /schemas/types.yaml#/definitions/string
>>>> +        description: Indicates dai-link clock master.
>>>> +        items:
>>>> +          enum:
>>>> +            - cpu
>>>> +            - codec
>>>> +
>>>> +    additionalProperties: false
>>>
>>> Move this before properties.
>>>
>>
>> Done for v2.
>>
>>>> +
>>>> +    required:
>>>> +      - link-name
>>>> +
>>>>    additionalProperties: false
>>>>
>>>>    required:
>>>>      - compatible
>>>>      - mediatek,platform
>>>> -  - headset-codec
>>>> -  - speaker-codecs
>>>> +
>>>> +allOf:
>>>> +  # Disallow dai-link-xxx nodes if the legacy properties are specified
>>>
>>> xxx-dai-link?
>>>
>>
>> Oh! Yes, thanks for catching this.
>>
>> That's what I initially wanted to do, but then I opted for xxx-dai-link and
>> forgot to update this comment.
>>
>> Fixed for v2.
>>
>>>> +  - if:
>>>> +      patternProperties:
>>>> +        ".*-dai-link$": false
>>>> +    then:
>>>> +      required:
>>>> +        - headset-codec
>>>> +        - speaker-codecs
>>>> +    else:
>>>> +      properties:
>>>> +        headset-codec: false
>>>> +        speaker-codecs: false
>>>> +        mediatek,hdmi-codec: false
>>>
>>> Allowing both would preserve compatibility. That's not needed? If so,
>>> say why in the commit msg.
>>>
>>
>> I'm thinking of writing:
>>
>> "Since describing machine specific audio hardware and links replaces the
>> now deprecated old logic doing the same in a driver hardcoded fashion,
>> it is not allowed to have both the old and new properties together."
> 
> What happened to that. Instead you just sent a new version with
> nothing about this.
> 

The same thing that happened to that card "model" error that shouldn't have
been there because I catched it before sending and fixed, then...

...I have ultimately sent the wrong changeset. My bad.

Anyway - since that's a bigger series, I'll wait for a few days and will
send the v3 with the names added to the audio-routing and this mentioned
in the commit description (so, that's happening next week).

>> ...but in short - both the old and the new can do exactly the same, but
>> imo it doesn't make any sense to actually rely on both as:
>>    1. It's redundant (and one set of them makes the other useless);
>>    2. I want to avoid confusion (as the other set won't be parsed);
>>    3. I'm trying to *enforce* consistency as MTK cards have different
>>       bindings for .. really, no good reason;
>>    4. I want to see custom stuff disappear completely (and/or as much as
>>       possible anyway) and use something that is (at least somewhat) common
>>       between all MTK and non-MTK or anyway as a start at least consistent
>>       between MTK cards.
>>
>> In theory, though, speaking of the driver side, there's nothing preventing
>> you from specifying both audio-routing xxx-dai-link and mediatek,hdmi-codec,
>> as the drivers' action will be, in short
>>      if (new_bindings)
>>        forget_about_old_bindings_use_the_new_ones();
>>      else
>>        use_old_hardcoded_stuff(); /* and be sad */
> 
> That works for newer kernels with this change, but existing kernels
> will only have:
> 
> use_old_hardcoded_stuff(); /* and not know it's sad */
> 
> If you want to support a new DT and old kernel, you need to populate
> both properties.
> 
>> For that, I really don't want to allow both sets of properties - please, please,
>> tell me that I don't *have to* remove this block :-)
> 
> Ultimately it is your decision as Mediatek maintainer, not mine. My
> only requirement is the commit message explain why the above
> combination is not important for these platforms.
> 
> You could leave it, but keep both in the dts files for some time
> period. That will cause warnings, but what's a few more. The ABI
> doesn't have to be a forever thing. Things evolve and there will be
> other reasons to upgrade.
> 

Thanks for explaining.

Cheers,
Angelo


