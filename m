Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707D551B9A9
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 10:09:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 065C717C9;
	Thu,  5 May 2022 10:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 065C717C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651738173;
	bh=Sx0JTutas4/a5URHaHdUEVftBTpjpG3kAugSQyvFlOk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMLZfxVqREWwulYKqmLr1TNtvwYERd2wfHfODK4mIl3f8nV1cMFmFjcaLNjVVLWpD
	 aCxBYj1aBEY+u9OQNpZmKARpzmO9JlVVzuo6KlrSbI026a7CrMR8zaKyS8KSELWmPi
	 S1BUcvbyOPzqFJwXVjYQblGJWtipbew1msu+Pd44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0DD2F8049C;
	Thu,  5 May 2022 10:08:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F3A1F8016B; Thu,  5 May 2022 10:08:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB9FFF800D3
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 10:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB9FFF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="LQP40dxF"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E73021F44D6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651738103;
 bh=Sx0JTutas4/a5URHaHdUEVftBTpjpG3kAugSQyvFlOk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LQP40dxFDRXce8lfztccxf30KUdLwEI7Biw7WJFTVQgsdDbNckjKld2YhLoBNGUFK
 6oiSh0nR9Xfnfbzk/jr6ze4TO3H0+DqXEUSKRQPakdjJeaG4ckhTKy9NBwbOVYL7Rz
 75B5Sarx4ocMBfhtUMYwULroMzHxA1GU5xiW71rPLvmdS8+Nb3IVHiMdvyuR1N54lA
 8CKd8fB/xfvNwcgZqG6z1VjuSIdQFmHsVfj3TRNZlUY4/F4ra07cYNlwfAXCukg8J5
 X4Obi7f66sRUcI/xgAb4Y3SaJM2Yu8CnQ9wkG3c5C6d0oOM60j5N3/znbWeNql2KFQ
 K5ftZZVV6WFrw==
Message-ID: <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
Date: Thu, 5 May 2022 10:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220429203039.2207848-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, Shane Chien <shane.chien@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
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

Il 29/04/22 22:30, Nícolas F. R. A. Prado ha scritto:
> The Mediatek AFE PCM controller for MT8192 allows sharing of an I2S bus
> between two busses. Add a pattern for these properties in the
> dt-binding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>   Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> index 7a25bc9b8060..5b03c8dbf318 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -54,6 +54,11 @@ properties:
>         - const: aud_infra_clk
>         - const: aud_infra_26m_clk
>   
> +patternProperties:
> +  "^i2s[0-35-9]-share$":
> +    description: Name of the I2S bus that is shared with this bus
> +    pattern: "^I2S[0-35-9]$"
> +
>   required:
>     - compatible
>     - interrupts
> 

The only other way of doing this would be to complicate this in the driver
so that we can do something like

"i2s-share = <0 2>";  instead of  i2s0-share = "I2S2";

...and I don't think that this would be any more straightforward than the
provided way.

There's an improvement that we can do to that pattern description though,
which would be explaining that declaring 'i2s0-share = "I2S2"' means that
I2S2's data pin will be used as DATA-OUT, while i2s0 is DATA-IN.

Another thing that comes to mind here is that this is a MediaTek specific
property and *not* a generic one, which means that both the driver and
this binding should be fixed to get a "mediatek," prefix, so, this property
should - in reality - be "mediatek,i2s[0-35-9]-share" instead.

I think that everyone agrees about that, but let's see what the others say.

Cheers,
Angelo
