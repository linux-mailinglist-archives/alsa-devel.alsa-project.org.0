Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293CF3A8BED
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 00:39:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 916C21689;
	Wed, 16 Jun 2021 00:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 916C21689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623796740;
	bh=H7Df+8Z7vYD2zeOqFo3Nggc6As76u2Yjpj2+iM0U1V0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bZodpiYep0IR0hnnjPK09daiG15/pch89OIdEJmpK30dQ5r281a/LpygzZFdqz454
	 jQTDSrcwRrKwPj18qlt5+N3S9NUGFbdR/QIav3zlS/RZZVyloGyc/ciYKx/+mqrTnY
	 8lFg4HsYhJOZAqJ8jlTthgEiKxILjKX5I8tZ1u9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3EE2F8016C;
	Wed, 16 Jun 2021 00:37:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0597F80171; Wed, 16 Jun 2021 00:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76713F80113
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 00:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76713F80113
Received: by mail-io1-f43.google.com with SMTP id h5so916051iok.5
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 15:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=AapX0dNT59T/SI8VAeevcD55A+AFG5MSeNuhN4FA4aE=;
 b=Nkm8tCBhFQCA0iii+kKRn9VK7YfBjTAizoKmnPhm+uoBx7v2DTkZ6VFl5PLBIm1f8m
 70IadioJZ2H33FGVy6WIOriW+fbWVZ+svROluTg7aSmyYrPrGb7wu1KCNUDgYFSi0MZd
 5aP7MXXaWONoMT4tWh6/QH0FH9fhMNcz0g6JjctRGbJOPOKCZFl4u6c0Zt89MFuFqNjG
 JyvnG+9HXx9rpx7Cz5tgC8wv0TvZZIVD98h+7mrf0jmO8Cb5tpRyQjuFY8LyOOE2x/UZ
 +wQFNI2gkm6G3lNPNMy/a1qo9NWF/gDdIeIfNfwMnODGgYneCIrxqngcv5Ma1DenMwms
 tFvg==
X-Gm-Message-State: AOAM5329aSGb1kahmdwNeFzDzy61rHtxXlbIAby8fbdrlDXHGWjrV212
 shbkjDB3jLXpkDezIpYG+Q==
X-Google-Smtp-Source: ABdhPJzuul7DIME4umceda7UcrTrdVy5BGMY2MljyjNdecdHBWYZbkGdJhgM9V3oTSLQxsk8AGq6aA==
X-Received: by 2002:a05:6638:2583:: with SMTP id
 s3mr1244891jat.92.1623796640213; 
 Tue, 15 Jun 2021 15:37:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id h6sm215234ilj.53.2021.06.15.15.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 15:37:19 -0700 (PDT)
Received: (nullmailer pid 1415996 invoked by uid 1000);
 Tue, 15 Jun 2021 22:37:15 -0000
From: Rob Herring <robh@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>
In-Reply-To: <20210615130737.2098-1-fengzheng923@gmail.com>
References: <20210615130737.2098-1-fengzheng923@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Tue, 15 Jun 2021 16:37:15 -0600
Message-Id: <1623796635.726367.1415995.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, lgirdwood@gmail.com,
 wens@csie.org, robh+dt@kernel.org, jernej.skrabec@gmail.com,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Tue, 15 Jun 2021 21:07:37 +0800, Ban Tao wrote:
> The Allwinner SoCs feature an I2S controller across multiple SoC
> generations.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> ---
>  .../sound/allwinner,sun50i-h6-dmic.yaml       | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.example.dts:23.28-29 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1492163

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

