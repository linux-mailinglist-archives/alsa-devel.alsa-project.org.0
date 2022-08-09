Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FF358DF2E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 20:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2040684B;
	Tue,  9 Aug 2022 20:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2040684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660070125;
	bh=7fKyph/VnwgD4gdFhbx/zyFkwIqYkCu78oepQxP2E5o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zd6h5tbfF4FVpXS90WRbd+4kwfoLXq/p6zxo/2oZR32oisV9WuWUIdNSSu8wXsEeS
	 u/xw6ton7FFWknmML7Je2olxxU90LDa07f5u5dQMoemc4shKHLhIQYMB8tXa0FzBpq
	 ZnFHElNtc2k69jrHk0N34M96XmAN8/zfVViohlZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B190F801F7;
	Tue,  9 Aug 2022 20:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2757F8016C; Tue,  9 Aug 2022 20:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE86DF80132
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 20:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE86DF80132
Received: by mail-il1-f174.google.com with SMTP id p9so5761072ilq.13
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 11:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=8ogzPNWERYDaKhNvvgajn1anoN29b7H+hifJpwoGmHM=;
 b=Kv3HK6YVt7tVP7QLb8o9lR/qjmloJBisn/4Flj5mNiEjbHS4kSz7omI+hEy9CF3oF/
 Ydd0evTVjo0QHCseGkyVFCh8xo70Dbb5woBdYOjRq/NeL+tcuwTphC0KbL/JZgGkVeH9
 mgTdXrkUqovLVn4xqrZMv9Yk32sB9AuJOQ1Ds35iJNsUpoLZgBmf6DiJfn1VgW0OJrDM
 dm3T35TBTA6jvJ0QBrCphQlm3eprisM5DygCEQSLN/gqTva5HASRv9R0E6u319LxzxY+
 cwOVW2DNKds1QOebsvrCebwYHD6EXULcrUGXpNZVz+Owyj8oPghvLtkqf9MDQo+X6jnY
 vfwQ==
X-Gm-Message-State: ACgBeo0tVolhVqfBTz2Nn0rsCn28X30S1JDsUgp/hldc9TAKk2VRVhcz
 hnLG+di28mAULxYohxM9hg==
X-Google-Smtp-Source: AA6agR4PJWlLwUSgKHl9yVe2aHvPKGPlQc+9w37Y+GpjWSGItjiB5WV6pAjqzQQreJ8yjLm/o937fQ==
X-Received: by 2002:a05:6e02:1a6f:b0:2de:b54a:1ce4 with SMTP id
 w15-20020a056e021a6f00b002deb54a1ce4mr10551590ilv.284.1660070054833; 
 Tue, 09 Aug 2022 11:34:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056602341000b00684f4b808ffsm1394696ioz.39.2022.08.09.11.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 11:34:14 -0700 (PDT)
Received: (nullmailer pid 2158221 invoked by uid 1000);
 Tue, 09 Aug 2022 18:34:12 -0000
Date: Tue, 9 Aug 2022 12:34:12 -0600
From: Rob Herring <robh@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
Message-ID: <20220809183412.GA2152771-robh@kernel.org>
References: <20220804091800.744316-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804091800.744316-1-zhuning0077@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, broonie@kernel.org,
 Zhu Ning <zhuning@everest-semi.com>, David Yang <yangxiaohua@everest-semi.com>
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

On Thu, Aug 04, 2022 at 05:17:59PM +0800, Zhu Ning wrote:
> Add device tree binding documentation for Everest ES8326
> 
> Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
> Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
> ----
> v5 tested by dtschema
> ---
>  .../bindings/sound/everest,es8326.yaml        | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/sound/everest,es8326.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8326.yaml b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
> new file mode 100755
> index 000000000000..07781408e788
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Everest ES8326 audio CODEC
> +
> +maintainers:
> +  - David Yang <yangxiaohua@everest-semi.com>
> +
> +properties:
> +  compatible:
> +    const: everest,es8326
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for master clock (MCLK)
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  everest,jack-pol:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |
> +      just the value of reg 57. Bit(3) decides whether the jack polarity is inverted.
> +      Bit(2) decides whether the button on the headset is inverted.
> +      Bit(1)/(0) decides the mic properity to be OMTP/CTIA or auto.
> +    minimum: 0x00
> +    maximum: 0x0f
> +    default: 0x0f
> +
> +  everest,mic1-src:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      the value of reg 2A when headset plugged.
> +    minimum: 0x00
> +    maximum: 0x77
> +    default: 0x22
> +
> +  everest,mic2-src:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      the value of reg 2A when headset unplugged.
> +    minimum: 0x00
> +    maximum: 0x77
> +    default: 0x44
> +
> +  everest,jack-detect-inverted:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Defined to invert the jack detection.

No response to my questions on v3?

Rob
