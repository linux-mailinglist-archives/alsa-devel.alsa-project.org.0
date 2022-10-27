Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B06102AD
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 22:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A46C29DB;
	Thu, 27 Oct 2022 22:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A46C29DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666902392;
	bh=J4G+4cH15eWr7JaUvwqGIjiu8+J5NYaZMDBtQH0NLW8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KtFTckZQE+M/zqW1TeQCzT68Dz33LyNqTuxBBzHuhnchgJKfKJuvSGfK2x+YogGaE
	 HO7WswMjFwFQap6vASgQOhmCVzPnTnaRgcXGFE5nYVt/GmzgoRu+IQGwAOlVqH993D
	 wsRX/oO8Jy1wGIm1PHX5omzdrDVNkpYbuQawTrRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD91FF80496;
	Thu, 27 Oct 2022 22:25:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6EF5F8025E; Thu, 27 Oct 2022 22:25:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DCACF80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 22:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DCACF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="NXlPpV4j"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1A20F85074;
 Thu, 27 Oct 2022 22:25:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666902329;
 bh=2d0+/YY+OOPiTlhhJZqrO6myC7a4dKzxvQ/nKAofY8E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NXlPpV4jICmi5HsWTLePIBIkuCzXaqWzsUNJ8C8dQsxTJ29UW8nP3BEbyh4OgOy8D
 GktiqNAFPYf3ueY9u8HtN2X4YVuafMgZpYaPZ/OSZbdgVY2b0umdL/ZJ0xJowHPVSj
 Nvn0ggAMR93f5nM470emKDT0ZXxBvc1sp5XxaCKLYzG9QDPP6+PBzUz+CJhNLyq9yl
 EjERLS2hpKonjvNZq7WXeWFR5iSlWQMJJe9+ru16HzL4LhIdUBsy1fU1yioYTot6SQ
 06aqgcGhg+srzjhzvgSyqRulsFLqXj2B+qtOICmdftuwdR5MHSamQtfAzwECMs0ZLS
 elFqVH5o9qkDA==
Message-ID: <5164f1c3-12f3-7c6a-8f50-84e81dc7ce78@denx.de>
Date: Thu, 27 Oct 2022 22:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] ASoC: dt-bindings: Document audio OF graph
 dai-tdm-slot-num dai-tdm-slot-width props
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20220927185359.294322-1-marex@denx.de>
 <4a25e348-c6d4-ceeb-ff08-1fca4132d5a7@linaro.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4a25e348-c6d4-ceeb-ff08-1fca4132d5a7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
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

On 10/14/22 01:34, Krzysztof Kozlowski wrote:
> On 27/09/2022 14:53, Marek Vasut wrote:
>> Document dai-tdm-slot-num and dai-tdm-slot-width props as those are
>> parsed by simple graph card and may therefore appear in audio OF graph
>> node.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: alsa-devel@alsa-project.org
>> To: linux-arm-kernel@lists.infradead.org
>> ---
>> V2: Drop the definition refs and just fill in type and description
>> ---
>>   .../devicetree/bindings/sound/audio-graph-port.yaml         | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
>> index bc46a95ed8400..64654ceef2089 100644
>> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
>> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
>> @@ -74,6 +74,12 @@ patternProperties:
>>         convert-sample-format:
>>           $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
>>   
>> +      dai-tdm-slot-num:
>> +        description: Number of slots in use.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +      dai-tdm-slot-width:
>> +        description: Width in bits for each slot.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
> 
> Isn't the slot width already part of dai-tdm-slot-width-map? Number of
> slots maybe as well can be deducted from number of tuples in
> dai-tdm-slot-width-map?

It seems to me per commit:
26e5366dd3056 ("ASoC: dt-bindings: audio-graph-port: Add 
dai-tdm-slot-width-map")
that "dai-tdm-slot-width-map" was meant to address some sort of hardware 
special case, or rather limitation, where the hardware was unable to be 
configured in arbitrary manner, hence the list of available usable 
configurations.

However, there seem to be no users of such a list in tree:
next$ git grep -l dai-tdm-slot-width-map
Documentation/devicetree/bindings/sound/audio-graph-port.yaml
sound/soc/generic/simple-card-utils.c

There are users of the dai-tdm-slot-width however:
next$ git grep -l dai-tdm-slot-width arch
arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
arch/arm64/boot/dts/freescale/imx8mq-evk.dts

As far as I can tell, the dai-tdm-slot-width describes generic hardware 
without limitations, which can be configured in an arbitrary manner, so 
this is the preferred DT property (over the map one).

Also, sorry for the late reply.

>>         dai-tdm-slot-width-map:
>>           description: Mapping of sample widths to slot widths. For hardware
>>             that cannot support a fixed slot width or a slot width always
[...]

