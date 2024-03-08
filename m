Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C23EE875FA3
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 09:36:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8CDD741;
	Fri,  8 Mar 2024 09:35:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8CDD741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709886956;
	bh=Pzu0gaWkTDesifP6Q2YOgfjmau3I8TTI4fcSFW4LqO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rR8ekCXsiB78dZ+yQBzHhj9UIDAlPSTMHbRsXtGfnYhsn7okYvbVnBZ0/r6StthPo
	 3S2p4d6O4LDEfbThk4GtcsdxS5PVPYrWqWrCNJJQNvzJU1xRDlC1f2mvnqnKwsnHoJ
	 l+/HLjAgVM457RTTFkHMGYkQIha3KltJD8JDByxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C1A8F80589; Fri,  8 Mar 2024 09:35:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B5AF80589;
	Fri,  8 Mar 2024 09:35:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D2FCF8024E; Fri,  8 Mar 2024 09:35:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 181BEF80087
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 09:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 181BEF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Rvngq1IG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709886907;
	bh=Pzu0gaWkTDesifP6Q2YOgfjmau3I8TTI4fcSFW4LqO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rvngq1IGeh+RcP8rkLUgR3vxThFsprDzFgDjGcGG+mms1y5TwzyBtcrHJT4hIJN21
	 fTDOqY8Dlovk1QHdUIBtd/Lw4XKmIIXPSOF0GTBMOlMoRJLKlNCOcsaK2+H3xCPLlW
	 V+lrASTtZ0n3k9r8Ts5VUFjAXbb2LH83Q+jFapF2QW9Yr9LP3d0FUeTPRn1cNjPEJi
	 g/5PElyi1RT47FWOMr8baVeb6i2xiuPdYby/IQ6ov7DH5FL+ExA48uMk+nou7wwoH+
	 BzCIUPnzk9fc6GtHSudp5mnaPUK49lmkEQlS/VD6m5XcGPsjfcRy1X9srcrb5eUMUc
	 VTSIBPn03Xh/A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9DFD737813CA;
	Fri,  8 Mar 2024 08:35:05 +0000 (UTC)
Message-ID: <25a93c67-35d8-4ce6-86f0-780559d58e96@collabora.com>
Date: Fri, 8 Mar 2024 09:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/22] ASoC: dt-bindings: mt8192: Document
 audio-routing and dai-link subnode
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
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
 <20240307114445.196981-20-angelogioacchino.delregno@collabora.com>
 <20240307141228.GA2491015-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240307141228.GA2491015-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EV4SGSMJ6CRUFKLRGGFTU72653XBTTFY
X-Message-ID-Hash: EV4SGSMJ6CRUFKLRGGFTU72653XBTTFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EV4SGSMJ6CRUFKLRGGFTU72653XBTTFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 07/03/24 15:12, Rob Herring ha scritto:
> On Thu, Mar 07, 2024 at 12:44:42PM +0100, AngeloGioacchino Del Regno wrote:
>> Document the dai-link subnodes and the audio-routing property, allowing
>> to describe machine specific audio hardware and links in device tree.
>>
>> While at it, also deprecate the old properties which were previously
>> used with the driver's partially hardcoded configuration.
>>
> 
> I replied on v1, but one more thing here.
> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 124 ++++++++++++++++--
>>   1 file changed, 115 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
>> index 7e50f5d65c8f..449454c50dcc 100644
>> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
>> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
>> @@ -13,6 +13,9 @@ maintainers:
>>   description:
>>     This binding describes the MT8192 sound card.
>>   
>> +allOf:
>> +  - $ref: sound-card-common.yaml#
>> +
>>   properties:
>>     compatible:
>>       enum:
>> @@ -20,6 +23,14 @@ properties:
>>         - mediatek,mt8192_mt6359_rt1015p_rt5682
>>         - mediatek,mt8192_mt6359_rt1015p_rt5682s
>>   
>> +  audio-routing:
>> +    description:
>> +      A list of the connections between audio components. Each entry is a
>> +      pair of strings, the first being the connection's sink, the second
>> +      being the connection's source.
>> +      Valid names could be the input or output widgets of audio components,
>> +      power supplies, MicBias of codec and the software switch.
>> +
>>     mediatek,platform:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>>       description: The phandle of MT8192 ASoC platform.
>> @@ -27,10 +38,12 @@ properties:
>>     mediatek,hdmi-codec:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>>       description: The phandle of HDMI codec.
>> +    deprecated: true
> 
> The deprecated keyword doesn't do anything at the moment, but my plan
> there is to add a mode to the tools which disables all deprecated
> properties. That will give you want you want in terms of disallowing
> these properties.

That would definitely be awesome - looking forward to it!

> 
> That would require dropping them from "required" which I'm fine with you
> doing. (Though technically that's still an ABI change)
> 

Then instead of waiting for you to add that mode and then remove stuff later,
I'll just omit the `else: required:` block on v3, so that we avoid commit
noise and all the warnings when the deprecated check gets released.

I guess that's fine, right?

Cheers,
Angelo
