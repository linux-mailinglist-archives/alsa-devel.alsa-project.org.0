Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F79B5ECC68
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 20:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3920D86E;
	Tue, 27 Sep 2022 20:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3920D86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664304626;
	bh=lQsI9B+5SNDDFeV+SMeq9qpaQh49ePPa7xYnX0qo8vE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8/mP/byrm8Bbdt3Tv/CxmpdB2MCoSfAd9VkiFppiycHaID0o/8ExTI8xasXvm0gV
	 OaIrRPrZTkjjyedNi65R1v9HMk5GSs3f3s5ugJ5pBDmjv8jFattaWrIQx1pdo/RA1K
	 +O+FntVEBg8/O43iO2egPUKPvewUQ0XbFeG89tFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44EE6F80508;
	Tue, 27 Sep 2022 20:49:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE6CFF804D9; Tue, 27 Sep 2022 20:49:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B83CF80496
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 20:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B83CF80496
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="tfPEDsIs"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 06D0384CB6;
 Tue, 27 Sep 2022 20:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664304565;
 bh=feV92BuNRkVJBQm83sLkw5d/7kr7kGFYTiH7Oi2pDks=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tfPEDsIsPOv1bKYAG6lIsrjcm9wpiNTc9OvK+ygc7a2u/i/q+N1MDzL8XnxSkeZIf
 OnD078kEzoh8ud5t9JFsCi5XcmOlqQJdrX9gJoo24cQoj7RqlIdn+ZLWl5MEeZ270T
 aHzEjzlCLTS+MzOGP+IubHUmPSgkGKtiS+mkS7hZGfJCS4gTC6gMexta3jW/WyHOG/
 nK64QIqfYUdRon4YJvWPOj7V3CQYyC7Hr6QxB8NXjzJ6o8U5PgjT01Oy/Hm3aqPNse
 IPgh8WPfWkzLnIV9LNXCYdzlPVV/Z68mS0wetLg1QkBGQKWmtzeuVH2h3/4FcH3z2Q
 8zso7jON3vXrg==
Message-ID: <32359086-c1c5-6e61-8b80-2742def2d632@denx.de>
Date: Tue, 27 Sep 2022 20:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] ASoC: dt-bindings: Document audio OF graph
 dai-tdm-slot-num dai-tdm-slot-width props
Content-Language: en-US
To: linux-arm-kernel@lists.infradead.org
References: <20220927005436.690904-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220927005436.690904-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>
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

On 9/27/22 02:54, Marek Vasut wrote:
> Document dai-tdm-slot-num and dai-tdm-slot-width props as those are
> parsed by simple graph card and may therefore appear in audio OF graph
> node.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> To: linux-arm-kernel@lists.infradead.org
> ---
>   Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index bc46a95ed8400..c282b81632d8f 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -74,6 +74,10 @@ patternProperties:
>         convert-sample-format:
>           $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
>   
> +      dai-tdm-slot-num:
> +        $ref: "#/definitions/dai-tdm-slot-num"
> +      dai-tdm-slot-width:
> +        $ref: "#/definitions/dai-tdm-slot-width"
>         dai-tdm-slot-width-map:
>           description: Mapping of sample widths to slot widths. For hardware
>             that cannot support a fixed slot width or a slot width always

V2 is coming, please drop this patch.
