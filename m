Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF34D41138D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 13:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73DDA1698;
	Mon, 20 Sep 2021 13:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73DDA1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632137429;
	bh=4Ai77Nj/Er6KlHz4HJkwobiR80m5nWn59Wnl+j+83CU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fUNNLMnZDYiecocTnMbk0bNHO+QBBi96u7T5CwyldaMn9ZolI3LDOzeq0kHxzzW4r
	 8fL39pOPGnx8ZcA2RNUPXO4ElF5XzGwvaqMcXqJ1uCDYVxkeHb6qzRbH5FGT9snApW
	 WLnF6pfELSMuXK1xCv1P4zuXrW90912QDNCbZOss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE33F80129;
	Mon, 20 Sep 2021 13:29:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9952EF80129; Mon, 20 Sep 2021 13:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F02CF80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 13:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F02CF80129
Received: by mail-wr1-f46.google.com with SMTP id d21so28596782wra.12
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 04:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PhCyR5e+0u30KO96xN+OUpH445jhTB3K3MWPDPmPJ/8=;
 b=JheC1YY5+GKrXlm2RQSFp5Svel7nTjV5or+wSSPmOf6KBNreYXd/97SFxfOl3ju2PK
 Z64ZS7ziciAHPyGqSFeyiiVj+O0Tvc9eCzBvkSadTk27j6PZxOn7aP0CvSdluRJgwTn+
 kT2GarwDfUDO6EWV27VL3a8+Tb3b17MM+BtmT5jgXiUs43CRHQVadlOpKFVwYbmeZJTr
 99ZQUyz6LAaIg+Gmjy8q67WLWSUdzn0rnj+xM9o3vu49Bqzg0IwWuBuY7G1f3fCYTBc5
 PEbroor36D8sqO0fcOmI4w4SyIIZW66PcKrgHSl7Pp//XmuxxEp/Cw43HrnvjT/CvcdC
 AVew==
X-Gm-Message-State: AOAM532arbrgmx7EQZqjtNZGMaI2hcIuz/WAKMOYaOafEG47hfR6ixUU
 Gkbglr11tZR+2Tucstlo9/8=
X-Google-Smtp-Source: ABdhPJx1sstBHm2/iORXzKQu8BkHFkUpI6G6zkHr+cqiPxPUjScEjja1FOqUIK1RZO1WRSwUZ9JwMA==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr27672908wrs.190.1632137339311; 
 Mon, 20 Sep 2021 04:28:59 -0700 (PDT)
Received: from [192.168.2.20] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.googlemail.com with ESMTPSA id l19sm15869941wrc.16.2021.09.20.04.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 04:28:58 -0700 (PDT)
Subject: Re: [PATCH RESEND v2 2/2] ASoC: dt-bindings: rt5682s: add bindings
 for rt5682s
To: derek.fang@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20210907120557.1593-1-derek.fang@realtek.com>
 <20210907120557.1593-2-derek.fang@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <b4eb2486-f9ff-3a8b-911a-0791e012bc03@kernel.org>
Date: Mon, 20 Sep 2021 13:28:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907120557.1593-2-derek.fang@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 albertchen@realtek.com, Rob Herring <robh+dt@kernel.org>, shumingf@realtek.com,
 albertwang@realtek.com, flove@realtek.com
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

On 07/09/2021 14:05, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Realtek ALC5682I-VS codec is a ALC5682I-VD variant which supports I2C only.
> 
> Signed-off-by: Derek Fang <derek.fang@realtek.com>
> ---
>  .../bindings/sound/realtek,rt5682s.yaml       | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> new file mode 100644
> index 000000000000..fbf23696f1a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek rt5682s codec devicetree bindings
> +
> +maintainers:
> +  - Derek Fang <derek.fang@realtek.com>
> +
> +description: |
> +  Rt5682s(ALC5682I-VS) is a rt5682i variant which supports I2C only.
> +
> +properties:
> +  compatible:
> +    const: realtek,rt5682s
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.
> +
> +  interrupts:
> +    description: The CODEC's interrupt output.
> +
> +  realtek,dmic1-data-pin:
> +    enum:
> +      - 0 # dmic1 data is not used
> +      - 1 # using GPIO2 pin as dmic1 data pin
> +      - 2 # using GPIO5 pin as dmic1 data pin
> +

+Cc devicetree and Rob,

Guys,

This is really poor. The patch was never sent to devicetree maintainers
and does not build at all!

There are several errors here. I fixed few of them:
https://lore.kernel.org/lkml/20210920112106.140918-1-krzysztof.kozlowski@canonical.com/

but still you need to fix missing description for vendor fields.

Derek,
Your duty is to use get_maintainers.pl script to Cc all relevant
maintainers and mailing lists. Second duty is to test it. This was not
tested.

Best regards,
Krzysztof
