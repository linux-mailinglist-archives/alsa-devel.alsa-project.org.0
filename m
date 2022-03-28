Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E794E8EB5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 09:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1AB1170A;
	Mon, 28 Mar 2022 09:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1AB1170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648451282;
	bh=Od98xWiyL6O260yMUyhOtW1OV9LDX9NwBH3M02xHCGA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b7rAgLPRNS0WFYg1Go4hxIFRVuxh4ffrzvRqF2g8//Bo/Ks9FNDQvDbrIV7jQkgsH
	 D+S/duXif/yd2Yo4Aii3YLCD99pjy2J6lZxZ3IVPK2XNjEKqyAhF7uYdM6YsFHnFx6
	 zW/SIuoRCDmH49mnumPDTpBBzlujDbZaFX5dm/Ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3139CF8026A;
	Mon, 28 Mar 2022 09:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0872BF800FA; Mon, 28 Mar 2022 09:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F2C3F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 09:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F2C3F800FA
Received: by mail-ed1-f42.google.com with SMTP id y10so15738872edv.7
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 00:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bWHNH/EfXpoNd6GDO+NCVI8AReob2nLGcB93Fy6VsBU=;
 b=d0FpkGStzwZQMSXqahXbD5EXNuRNJOSwNGCgt5V2jJSygkyJJd02V1aq8atkuJjm0u
 OILU43OsfpvstVVh3/8TEJDTBBwMS2I//N6xgVOSGJYRSmmdYRdTK2x5rVU6zE+r+jkD
 8RskSliLyGBvGMeu0QbofGXtAysjbjrAJkhW3MN6drIq+NF2kAyyPpQNu+4FHLZkNcCM
 Sbz02aOz2tWzgDUfhYCvqzotlc02iSwYMn0vuQaEv3SyZPZYMDaaoQPiiJHiWmXk8RA/
 L8poBzrBEryTASRF7lImO7+l8Kd06CSIG8gj3NRU2r3viX8PdXxY/yrdW1VY3CZSV/ZQ
 tiAw==
X-Gm-Message-State: AOAM532BnNh4BvEVuR+2B6ko8OXNIOMRSWqBjFeBShIYBdp0p0GEO5sP
 43BYDRUUJZb02K+9BGXRn64=
X-Google-Smtp-Source: ABdhPJyIknQbldb2sxGzz5k0GbACmYk7LHZl4P9ANNwRnBbA6fgve5eGIekXkq4wWYc5UHkwHDUhEQ==
X-Received: by 2002:a05:6402:3496:b0:419:82d5:f1d9 with SMTP id
 v22-20020a056402349600b0041982d5f1d9mr14537977edc.36.1648451208200; 
 Mon, 28 Mar 2022 00:06:48 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 k12-20020aa7c38c000000b0041939d9ccd0sm6618012edq.81.2022.03.28.00.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 00:06:47 -0700 (PDT)
Message-ID: <da414b44-1bec-5918-84f5-9dfff2009f41@kernel.org>
Date: Mon, 28 Mar 2022 09:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 3/6] ASoC: dt-bindings: Extend clock bindings of
 rt5659
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzk+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
 <1648448050-15237-4-git-send-email-spujar@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1648448050-15237-4-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

On 28/03/2022 08:14, Sameer Pujar wrote:
> The rt5658 or rt5659 CODEC system clock (SYSCLK) can be derived from
> various clock sources. For example it can be derived either from master
> clock (MCLK) or by internal PLL. The internal PLL again can take input
> clock references from bit clocks (BCLKs) and MCLK. To enable a flexible
> clocking configuration the DT binding is extended here.
> 
> It makes use of standard clock bindings and sets up the clock relation
> via DT.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Oder Chiou <oder_chiou@realtek.com>
> ---
>  .../devicetree/bindings/sound/realtek,rt5659.yaml  | 53 ++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
> index b0485b8..0c2f3cb 100644
> --- a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
> @@ -29,12 +29,28 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: Master clock (MCLK) to the CODEC
> +    description: |
> +      CODEC can receive multiple clock inputs like Master
> +      clock (MCLK), I2S bit clocks (BCLK1, BCLK2, BCLK3,
> +      BCLK4). The CODEC SYSCLK can be generated from MCLK
> +      or internal PLL. In turn PLL can reference from MCLK
> +      and BCLKs.
>  
>    clock-names:
> -    items:
> -      - const: mclk
> +    description: |
> +      The clock names can be combination of following:
> +        "mclk"        : Master clock
> +        "pll_ref"     : Reference to CODEC PLL clock
> +        "sysclk"      : CODEC SYSCLK
> +        "^bclk[1-4]$" : Bit clocks to CODEC

No, that does not look correct. You allow anything as clock input (even
20 clocks, different names, any order). That's not how DT schema should
work and that's not how hardware looks like.

Usually the clock inputs are always there which also you mentioned in
description - "multiple clock inputs". All these clocks should be
expected, unless really the wires (physical wires) can be left disconnected.

Best regards,
Krzysztof
