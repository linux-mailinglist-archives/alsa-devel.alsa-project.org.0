Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CD88A3585
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 20:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC08423E2;
	Fri, 12 Apr 2024 20:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC08423E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712946132;
	bh=p8OAbH8ik4uO7b+Ydee6KnfTe8Pqv3txAKJdlPzFN+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NvoXiBo7KLupWswDCtNQihq0fbLBkSkWfwEkD2aqdWYdEv6DXtFKeP7D10FOJKjfl
	 Gfp0RLqYXxIqpsOEAwHssSfrAzG1F10cHP7lJqWshOBlmHBTdPm34npqnc3iAw5kf4
	 9QkxnZh7REcPBPbNyP3CgTkvKp154EpDpTf9JeRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A01A5F8065D; Fri, 12 Apr 2024 17:52:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07159F8067B;
	Fri, 12 Apr 2024 17:52:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45FDEF8064C; Fri, 12 Apr 2024 17:52:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82E05F80641
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 17:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82E05F80641
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KO9P4/t2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5E27FCE3965;
	Fri, 12 Apr 2024 15:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B70AC113CC;
	Fri, 12 Apr 2024 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712937142;
	bh=p8OAbH8ik4uO7b+Ydee6KnfTe8Pqv3txAKJdlPzFN+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KO9P4/t2cDRuWl80w6gOUAPjO0AMXVxD7gC6uP2mwU8ISqAgxs6VNhHozXIZqPg4f
	 IxIfIc4IjyGe/b6QhzPnay8cP37wmaDZ88pFaCzUFOMc20t0ikqGC58OGZCV+GbyDz
	 WI93KbnDGseDAwz/NNdCUc5f/9jmB7Vx+RyIICUCQGBUzTfY6Lc75/E09y4R2RQe2v
	 XWWzyszKnIIXYWZ4k9iyjsQE/3nSlsJtdFf1/ZKtjaJr7IAxKHUFfK6JqE2B+fM4UJ
	 OZ/+WvCY1aZ1Sqg+hD4vkU9ARhl7iAtiPJbP+z/NrQJ8/kN6A/VFrOg8z4i27eJ5hK
	 Ci19pwIr5RJ6Q==
Date: Fri, 12 Apr 2024 10:52:20 -0500
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	YHCHuang@nuvoton.com, KCHSU0@nuvoton.com, CTLIN0@nuvoton.com,
	SJLIN0@nuvoton.com, scott6986@gmail.com, supercraig0719@gmail.com,
	dardar923@gmail.com, edson.drosdeck@gmail.com,
	u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: nau8821: Add delay control for ADC
Message-ID: <20240412155220.GA2918590-robh@kernel.org>
References: <20240412103554.3487290-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412103554.3487290-1-wtli@nuvoton.com>
Message-ID-Hash: F4NYR2U52B5RASGDLR67BIAZUKBJNHRO
X-Message-ID-Hash: F4NYR2U52B5RASGDLR67BIAZUKBJNHRO
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4NYR2U52B5RASGDLR67BIAZUKBJNHRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 12, 2024 at 06:35:52PM +0800, Seven Lee wrote:
> Change the original fixed delay to the assignment from the property. It
> will make it more flexible to different platforms to avoid pop noise at
> the beginning of recording.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> index 054b53954ac3..a726c5a9b067 100644
> --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> @@ -103,6 +103,13 @@ properties:
>          just limited to the left adc for design demand.
>      type: boolean
>  
> +  nuvoton,adc-delay-ms:
> +    description: Delay (in ms) to make input path stable and avoid pop noise.
> +        The default value is 125 and range between 125 to 500 ms.

No need to state constraints in prose.

> +    minimum: 125
> +    maximum: 500
> +    default: 125
> +
>    '#sound-dai-cells':
>      const: 0
>  
> @@ -136,6 +143,7 @@ examples:
>              nuvoton,jack-eject-debounce = <0>;
>              nuvoton,dmic-clk-threshold = <3072000>;
>              nuvoton,dmic-slew-rate = <0>;
> +            nuvoton,nuvoton,adc-delay-ms = <125>;
>              #sound-dai-cells = <0>;
>          };
>      };
> -- 
> 2.25.1
> 
