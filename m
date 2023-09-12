Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE2579D496
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 17:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F3F4E;
	Tue, 12 Sep 2023 17:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F3F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694531813;
	bh=OG76LHlfGJHYkxKaHllr4SLoZMBHB960bsox/kYXmQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mpIfG4MmUjAZ1JxIELBoIqZiuksFdrNihKbwXdnW+upqc5SYo8fJrPplreEqyP5JQ
	 njuIBnBfANGU4jpKZPlMhvcivlqLJogaiyPECjxUnMvhjRvcxu/0RjngiddPvS1vhx
	 9t7g6FnpCSF/H9UgMCZxymt0egW1+GIpoGDt87ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F229F80552; Tue, 12 Sep 2023 17:15:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB38F80246;
	Tue, 12 Sep 2023 17:15:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24276F80425; Tue, 12 Sep 2023 17:15:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BF1EF80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 17:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BF1EF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Oo+6QA32
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D9F36B81E2E;
	Tue, 12 Sep 2023 15:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA55C433C7;
	Tue, 12 Sep 2023 15:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694531737;
	bh=OG76LHlfGJHYkxKaHllr4SLoZMBHB960bsox/kYXmQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oo+6QA32tcA7Rmixlq1ZvNMqSHv0isoNpqQxy0GgmprY4fbhbLrRgt8ivlBvhAxAU
	 8IxOb8YTUm3dF83yoL4BRsbMd6Oo5o7cgCzx/z1+X9yiQeW4VEmC0LGXLp8WEhQIrd
	 xpEZrCq8cQ6AsyhmEHJreKu+jBAaTxCWPw+UNdr9bCjofTpyuD02HNgyCs941vrpHd
	 Fotvc546EVqSP6hZHZnOsr82LMl1s2a01zSj7xUS2bO8VCRqjf7gzzBn1l8oqQf5WL
	 LmfagrNExrgb5aBz4J5A19Xq1BewVm3hJ1+3woCMwkhmXyhBgJ2fR2fbio+bs44XHH
	 uqk3mQX+JlxAw==
Received: (nullmailer pid 814342 invoked by uid 1000);
	Tue, 12 Sep 2023 15:15:35 -0000
Date: Tue, 12 Sep 2023 10:15:35 -0500
From: Rob Herring <robh@kernel.org>
To: Joerg Schambacher <joerg.hifiberry@gmail.com>
Cc: a-krasser@ti.com, joerg@hifiberry.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: pcm512x: Adds bindings for TAS575x devices
Message-ID: <20230912151535.GA812148-robh@kernel.org>
References: <20230907160851.14241-1-joerg.hifiberry@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907160851.14241-1-joerg.hifiberry@gmail.com>
Message-ID-Hash: 7JW5ZNZWFWAU7PMY4YMRY7UQPW26WVNW
X-Message-ID-Hash: 7JW5ZNZWFWAU7PMY4YMRY7UQPW26WVNW
X-MailFrom: SRS0=xM+6=E4=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JW5ZNZWFWAU7PMY4YMRY7UQPW26WVNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 07, 2023 at 06:08:51PM +0200, Joerg Schambacher wrote:
> The TAS5754/6 power amplifiers use the same pcm512x driver with
> only minor restictions described in the bindings document.
> 
> Signed-off-by: Joerg Schambacher <joerg.hifiberry@gmail.com>
> ---
>  .../devicetree/bindings/sound/pcm512x.txt     | 22 +++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/pcm512x.txt b/Documentation/devicetree/bindings/sound/pcm512x.txt
> index 3aae3b41bd8e..b16cd0463695 100644
> --- a/Documentation/devicetree/bindings/sound/pcm512x.txt
> +++ b/Documentation/devicetree/bindings/sound/pcm512x.txt
> @@ -1,12 +1,12 @@
> -PCM512x audio CODECs
> +PCM512x and TAS575x audio CODECs/amplifiers
>  
>  These devices support both I2C and SPI (configured with pin strapping
> -on the board).
> +on the board). The TAS575x devices only support I2C.
>  
>  Required properties:
>  
> -  - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141" or
> -                 "ti,pcm5142"
> +  - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141",
> +                 "ti,pcm5142", "ti,tas5754" or "ti,tas5756"
>  
>    - reg : the I2C address of the device for I2C, the chip select
>            number for SPI.
> @@ -25,6 +25,7 @@ Optional properties:
>      through <6>.  The device will be configured for clock input on the
>      given pll-in pin and PLL output on the given pll-out pin.  An
>      external connection from the pll-out pin to the SCLK pin is assumed.
> +    Caution: the TAS-desvices only support gpios 1,2 and 3
>  
>  Examples:
>  
> @@ -50,3 +51,16 @@ Examples:
>  		pll-in = <3>;
>  		pll-out = <6>;
>  	};
> +
> +	tas5756: tas5756@4f {
> +		compatible = "ti,tas5756";

Is there anything new here? Just a different compatible doesn't justify 
another example.

With that dropped,

Reviewed-by: Rob Herring <robh@kernel.org>
