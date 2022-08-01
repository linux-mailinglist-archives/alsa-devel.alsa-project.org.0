Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD83586E2E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 17:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E759E857;
	Mon,  1 Aug 2022 17:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E759E857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659369553;
	bh=rmHwKdV9lnVM+ZhQRC9IpOj7o9J1CdDw1IowlF1itGI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4LAavMCIwXqQeqb/FdXuQjs4GMl5L1lZFhKoG4BN9Q1anHcKMReeKdVUNc6ouJms
	 +dAebLgMKVWKMa0pPCW/UjORKwfwCtb9WAkMwMQQkw/XXVW89cmNdtz0DwyT93ZMph
	 RFNmH6tT4g1b+B1OaCg6EJSP6rD+d+ikqHNtyoVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50BAEF8014B;
	Mon,  1 Aug 2022 17:58:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C38C0F80246; Mon,  1 Aug 2022 17:58:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0C39F8014B
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 17:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0C39F8014B
Received: by mail-il1-f172.google.com with SMTP id b12so5046959ils.9
 for <alsa-devel@alsa-project.org>; Mon, 01 Aug 2022 08:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=hz7nXHEq1F85KPRnekV1M2XaUBYmmbucYnVIbXgpzws=;
 b=jWSrpddhjZX3h0+JLDCRW2PZxgjb+RUQlaAJbJJxYtjxCj+F3nH3BUrQInhLX9cmvH
 4FIU+4ojAuQecB/Js0O1TWkVhFfcJHBV3aJdQPupXKXnCR7DMcc1ziesz334M6H+ssET
 2cCBH5t29vNVyRekLRUzYCqsobIHhbVaU2CViZ9H5/XqLgRmC4bc1Mo73XcQbD/w6I4+
 D18RR0YIowcgeGIRSodBQDgPisd0tYZNamID1LSnDj7F4wsYqUvevAKZGvQMURUJLRP2
 ylQlduBSWruE9yM6Vhzb25Xpi8ty1lDZop+Y+XOuQNg9VHqn450FrDydB9zbtK7j4rnX
 B+YQ==
X-Gm-Message-State: AJIora9N+c0dvmW1vS0tpI/QaX7yAs0+2m16DUuAK85W/crbVGqgOgh4
 6GAUyDo6I4kooT9xbAif2A==
X-Google-Smtp-Source: AGRyM1tj25NZhfphWqwROi3f80JZ6aZpzFI1C0At4lGs4DKytgAiBXKMF13d8KsBa/cQmcDnU9zAlw==
X-Received: by 2002:a05:6e02:1aab:b0:2dd:1c2e:c495 with SMTP id
 l11-20020a056e021aab00b002dd1c2ec495mr6566304ilv.166.1659369485607; 
 Mon, 01 Aug 2022 08:58:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a92d44f000000b002de8a37ceccsm1833683ilm.70.2022.08.01.08.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 08:58:05 -0700 (PDT)
Received: (nullmailer pid 1091762 invoked by uid 1000);
 Mon, 01 Aug 2022 15:58:03 -0000
Date: Mon, 1 Aug 2022 09:58:03 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v1] ASoc: dt-bindings: tas27xx: update maximum I2C
 address and revise the format
Message-ID: <20220801155803.GA1090009-robh@kernel.org>
References: <20220728035610.158-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728035610.158-1-13691752556@139.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, kevin-lu@ti.com, broonie@kernel.org, raphael-xu@ti.com
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

On Thu, Jul 28, 2022 at 11:56:10AM +0800, Raphael-Xu wrote:
> 1.use correct maximum I2C address 2.revise the format

Same comments from v8 apply.

> 
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  .../devicetree/bindings/sound/tas27xx.yaml       | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/tas27xx.yaml b/Documentation/devicetree/bindings/sound/tas27xx.yaml
> index 66a0df8850ea..573652577462 100644
> --- a/Documentation/devicetree/bindings/sound/tas27xx.yaml
> +++ b/Documentation/devicetree/bindings/sound/tas27xx.yaml
> @@ -8,7 +8,7 @@ $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>  title: Texas Instruments TAS2764/TAS2780 Smart PA
>  
>  maintainers:
> -  - Shenghao Ding <shenghao-ding@ti.com>
> +  - Raphael Xu <raphael-xu@ti.com>
>  
>  description: |
>    The TAS2764/TAS2780 is a mono, digital input Class-D audio amplifier
> @@ -23,17 +23,19 @@ properties:
>        - ti,tas2780
>  
>    reg:
> -    maxItems: 1
>      description: |
> -       I2C address of the device can be between 0x38 to 0x45.
> +       I2C address of the device can be between 0x38 to 0x3f.
> +    minimum: 0x38
> +    maximum: 0x3f
>  
>    reset-gpios:
> -    maxItems: 1
>      description: GPIO used to reset the device.
> +    maxItems: 1
>  
>    shutdown-gpios:
> +    description: |
> +       GPIO used to control the state of the device.Only for TAS2764.
>      maxItems: 1
> -    description: GPIO used to control the state of the device.
>  
>    interrupts:
>      maxItems: 1
> @@ -41,10 +43,14 @@ properties:
>    ti,imon-slot-no:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: TDM TX current sense time slot.
> +    minimum: 0
> +    maximum: 3
>  
>    ti,vmon-slot-no:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: TDM TX voltage sense time slot.
> +    minimum: 0
> +    maximum: 3
>  
>    '#sound-dai-cells':
>      const: 1
> -- 
> 2.35.1
> 
> 
> 
