Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2186A7415D8
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 17:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A193E822;
	Wed, 28 Jun 2023 17:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A193E822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687967806;
	bh=yIne9paDF1YsToVptO4bolrobAKlvvb52AAPOdsBfJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j3wi479qpzClFA3BLW/CDnFaixjsVLXkDbHISluPMW8Qfh4kRMC2w/87g9FjKooTc
	 7KI7JojYudT5gxJ1aTVjnDSHJ7o/Sf27MmsCA03FUqqqdjBtUwt/cgxOniSc+7GdlP
	 10UHz9+gfZj94DjzXgk69bdDxKGOFc7c5zlviR/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BF52F80558; Wed, 28 Jun 2023 17:55:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C46F2F80535;
	Wed, 28 Jun 2023 17:55:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D598EF80549; Wed, 28 Jun 2023 17:55:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4334F80093
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 17:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4334F80093
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-77b00bb3fd6so29798239f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 08:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687967696; x=1690559696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvM2j4MFWu2+tkWUIYPaSox/q0gO7Yl+tyqnCdAuB4I=;
        b=euoPuSHuqbG/+BJJD8Pxw1M8J9xtht/O9Ux+6JjiwALyjmwsV2OSPL2mNV5GtHxfzG
         z0PaDEGl9CrIh6G2qymbyhMyDCxCWsANXqklzApxpH28/aRG6EwJ8hnQIv0J1T8UiEAp
         la84srE1zk/OtrPlJMKMfkDXkMLI80iWhuJy97ACuENRx7969F/WqnTYRBgV8r3ZHdxB
         ldh4sRlHFYZN2Nzok/PpE2RzBPmIJYqtxKQt+h4dZNSur0/XLj7wlSqn483svqzbsrTh
         uO1gcbN7/gh3Vg0x2OBehoI2JECGvOtATeKlQ13bAAhbSFgEmKL635v+A4D0AC/kUz49
         4IBA==
X-Gm-Message-State: AC+VfDyhb9N5reBMmDPjYnJbUsR5Qq9J4wDpC9PI1H5DGr94l/PfBvUe
	BsJkcVqu7nM89CDBh3/TOQ==
X-Google-Smtp-Source: 
 ACHHUZ7vOyiGVJcVU0xLxr6GOynYLXsRfMlwVF8aoB5Ye4p2RGPwCEIj1VqWd7eoGZKz85FYYMaI6A==
X-Received: by 2002:a05:6602:418a:b0:783:4135:5b96 with SMTP id
 bx10-20020a056602418a00b0078341355b96mr1207753iob.5.1687967695956;
        Wed, 28 Jun 2023 08:54:55 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 s5-20020a02cc85000000b0042acb1ec82bsm1991384jap.112.2023.06.28.08.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 08:54:55 -0700 (PDT)
Received: (nullmailer pid 541922 invoked by uid 1000);
	Wed, 28 Jun 2023 15:54:53 -0000
Date: Wed, 28 Jun 2023 09:54:53 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
 broonie@kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: q6apm: add firmware-name bindings
Message-ID: <20230628155453.GA537917-robh@kernel.org>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628102621.15016-2-srinivas.kandagatla@linaro.org>
Message-ID-Hash: 6SPRYNIFZUQHT75PEU5JXOK4N2O5XKH4
X-Message-ID-Hash: 6SPRYNIFZUQHT75PEU5JXOK4N2O5XKH4
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SPRYNIFZUQHT75PEU5JXOK4N2O5XKH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 28, 2023 at 11:26:19AM +0100, Srinivas Kandagatla wrote:
> Add bindings to get firmare-name from DT, this will provide more flexibility
> to specify platform specific firmware file name and location. Also this brings
> tplg firmware name inline with other board specific firmware locations.

tplg?

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,q6apm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> index ef1965aca254..c783451145ef 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> @@ -31,6 +31,10 @@ properties:
>      unevaluatedProperties: false
>      description: Qualcomm DSP audio ports
>  
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string

Already has a type, so you can drop.

No default? Or pattern it should match? 

> +    description: Audio Topology Firmware name
> +
>    '#sound-dai-cells':
>      const: 0
>  
> @@ -38,6 +42,7 @@ required:
>    - compatible
>    - bedais
>    - dais
> +  - firmware-name

Causes warnings. Test you bindings.

>  
>  unevaluatedProperties: false
>  
> -- 
> 2.21.0
> 
