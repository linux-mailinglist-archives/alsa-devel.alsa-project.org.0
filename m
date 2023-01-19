Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C429D673E72
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 17:19:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A3E4818C;
	Thu, 19 Jan 2023 17:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A3E4818C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674145142;
	bh=GYi8Bi4t/ZI7zXyAEEkPisiiYt35ZMSnaPxght6gbY0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eZcLmcB1RfwdEG1jW9augRfj05N6VT55YbBgjHlRneCGhn00iM9PyNGHYYArMOjsa
	 HIM0xbYqlojbLVJRigt9j2RVSe0JWXsslUN7MbFbOhyaWDPBm2UZaq+ZkRE3dFSpPS
	 6vmelpKaLSp70/gZHP/tc7dyvO6sJSACJV2TC4zU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6868F800F0;
	Thu, 19 Jan 2023 17:18:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0598CF8047B; Thu, 19 Jan 2023 17:18:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41D57F8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 17:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41D57F8024D
Received: by mail-oi1-f170.google.com with SMTP id i5so2065120oih.11
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 08:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/53TQZW6r1zwjASQ4lZJdhbvckS1KV0aS6PofzSPkk=;
 b=TGfjWKgQxsp1/gReP8Q1eg3aAfx/MPb13TZttyFIVuEBx+t0Ljuq6fqll+5KvWWkpU
 ZeUGmkbSZZje2VYt7PaOaQB95cJrdC+W3uqqnV1oWDIqPHElQsbrA97b3bF/wMEoHiwU
 HVxSH5EOhalu8YB+MhJycE5l8TYl5eVyUyMgyvQYuQHB9w+snvydf22U5hMRoz4F6mtb
 +QfNsYyrakQxVXxRwmvTqODyafI/wdCoXEgfszZxQdZ88gQZIGkjAj+G4bPIWnl+6DRb
 F/IqfXdC2v8gUiixv8RDxC80/1CGTTAWryqkZlI3EJz9gMOcQZx3oYt1F75ZRY5gxWBR
 BILA==
X-Gm-Message-State: AFqh2kpGIrqPxpdrC7MONPZt9ZQWHi0TSY0wjnC+KDT7L3el5W1HqeT3
 ut+8QQG8E8aDLcoTM+ycnA==
X-Google-Smtp-Source: AMrXdXt1/e8p21lDMD81LUtAdmC9sW2dgNdOlCMjCvqrbAlT/E0IC+wziF1ov3qWxFpRUOB6UMdX6g==
X-Received: by 2002:aca:f2d7:0:b0:364:de8b:dddc with SMTP id
 q206-20020acaf2d7000000b00364de8bdddcmr3754167oih.29.1674145079100; 
 Thu, 19 Jan 2023 08:17:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a14-20020a9d3e0e000000b00670523bf1cfsm4203541otd.47.2023.01.19.08.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 08:17:58 -0800 (PST)
Received: (nullmailer pid 1976357 invoked by uid 1000);
 Thu, 19 Jan 2023 16:17:57 -0000
Date: Thu, 19 Jan 2023 10:17:57 -0600
From: Rob Herring <robh@kernel.org>
To: Astrid Rost <astrid.rost@axis.com>
Subject: Re: [PATCH v1 4/4] ASoC: dt-bindings: simple-card: create jack for
 aux_devs
Message-ID: <20230119161757.GA1969308-robh@kernel.org>
References: <20230118125226.333214-1-astrid.rost@axis.com>
 <20230118125226.333214-5-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118125226.333214-5-astrid.rost@axis.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, kernel@axis.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 18, 2023 at 01:52:26PM +0100, Astrid Rost wrote:
> Add simple-card,aux-jack-types:
> Array of snd_jack_type to create jack-input-event for jack devices in
> aux-devs. If the setting is 0, the supported type of the device is used.
> A device which has the functions set_jack and get_jack_supported_type
> counts as jack device.
> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---
>  .../bindings/sound/simple-card.yaml           | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index ed19899bc94b..2635b1c04fc9 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -199,6 +199,13 @@ properties:
>      maxItems: 1
>    simple-audio-card,mic-det-gpio:
>      maxItems: 1
> +  simple-audio-card,aux-jack-types:

Drop 'simple-audio-card,'. That way we can reuse this for the 
not-simple cases.

I'm pretty sure we have some vendor specific properties for this 
already. Use those for inspiration and to create something which could 
replace them.

> +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +    description: |
> +      Array of snd_jack_type to create jack-input-event for jack
> +      devices in aux-devs. If the setting is 0, the supported
> +      type of the device is used. A device which has the functions
> +      set_jack and get_jack_supported_type counts as jack device.

Sounds like Linux details. How does BSD use this property?

Rob
