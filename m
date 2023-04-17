Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E16E51FE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 22:42:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4EB1BC0;
	Mon, 17 Apr 2023 22:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4EB1BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681764173;
	bh=HMCkWSqpuylw2S4qEq3rbEO9/RFuMPcxJzrOaxulA3E=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bbGrDi8bFrC5M5tjgEeb547gYNBCeybTgNHCJjaF/XrNrDFbTVYfPV78iEHStI4qk
	 WVbLWrE684vV9vh0rDeHa5yrPLbgLUq3jIFdQhdYcSkqYsy40FPiSntdG7x0WLl3Um
	 xD7ROp+OFLJsdOlYTypNA1XMy9LxQZeEh9LOcyzE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39428F8025D;
	Mon, 17 Apr 2023 22:42:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E30E5F80266; Mon, 17 Apr 2023 22:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57A4EF800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 22:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A4EF800E2
Received: by mail-ot1-f45.google.com with SMTP id
 f88-20020a9d03e1000000b006a5d944cdf2so2966690otf.5
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 13:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764112; x=1684356112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgCCOyPJlZ+8fKfWAcjeoDQzm+xsVsIU0id6khxYMRs=;
        b=c6x8NwIvsD3C6mQVHSVYKy/WcbAJt2giGZV/NrQ/cmyIhJTcTlfrbkQ7EpF5lt7DRO
         j3Pot92DTSxmcyk3+0x/Q6OUY8RULiYzIzM1mdHATs+uFXBKHgb78nIJGr4TSkY87T/l
         62v6Y/n55ROWLFw2zHjfaf+4WwoA1p0L8VcLBmJ1z9sRo7dlkGDrhxq98RAazV3QJmYo
         Hxas4lM4NI/aLpRJuzK65uymwKa6VvVzO54EzF2caOAbq31KA1wrwybWAPeAz9SMhbvU
         jKO+Lvd08LwIGS+vN/fGKkTOmUMAlm1IN5GneqnSs38MkMZHh+rgFs/XXbCqVuFJadVz
         /S4g==
X-Gm-Message-State: AAQBX9dIgl6SNSobsulswl5ggbCLEnL5uIyf8Llcxf3WzGgo52a3Q0AO
	zFolSwcbZTHnWyzX8Ve3wg==
X-Google-Smtp-Source: 
 AKy350ZAcIbUvUMqEkEj6s0RcHV75OABdvSUl6WmtBW303CKhwJhEkgKKZsF4j7q0QT8uLyV5Otqhw==
X-Received: by 2002:a05:6830:1d7a:b0:6a4:469a:1a59 with SMTP id
 l26-20020a0568301d7a00b006a4469a1a59mr5195094oti.23.1681764111870;
        Mon, 17 Apr 2023 13:41:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 i18-20020a056830011200b006a44d90de05sm3262030otp.69.2023.04.17.13.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:41:51 -0700 (PDT)
Received: (nullmailer pid 3334304 invoked by uid 1000);
	Mon, 17 Apr 2023 20:41:50 -0000
Date: Mon, 17 Apr 2023 15:41:50 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
Subject: Re: [PATCH 3/9] dt-bindings: ASoC: Add chv3-audio
Message-ID: <20230417204150.GA3328603-robh@kernel.org>
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-4-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230414140203.707729-4-pan@semihalf.com>
Message-ID-Hash: UST33CWBNREC55G7WWPNWME452FTAB6P
X-Message-ID-Hash: UST33CWBNREC55G7WWPNWME452FTAB6P
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UST33CWBNREC55G7WWPNWME452FTAB6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 14, 2023 at 04:01:57PM +0200, Paweł Anikiel wrote:
> Add binding for chv3-audio device.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  .../bindings/sound/google,chv3-audio.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-audio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml b/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml
> new file mode 100644
> index 000000000000..8b602b60eaee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/google,chv3-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Chameleon v3 audio
> +
> +maintainers:
> +  - Paweł Anikiel <pan@semihalf.com>
> +
> +properties:
> +  compatible:
> +    const: google,chv3-audio
> +
> +  google,audio-cpu0:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of controller #0
> +
> +  google,audio-codec0:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of codec #0
> +
> +  google,audio-cpu1:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of controller #1
> +
> +  google,audio-codec1:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of codec #1

Why do you need custom properties when we have standard property to 
point to these things (sound-dai). We also have bindings to handle 
multiple devices.

Rob
