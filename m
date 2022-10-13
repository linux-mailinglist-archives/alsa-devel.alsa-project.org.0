Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7C95FD83D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 13:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D465058EF;
	Thu, 13 Oct 2022 13:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D465058EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665660230;
	bh=1ZteDVO+kTcdv/9i0FSNBOHKJGtk73vnKeXgBKerhbA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3+myjc2lhnbWd9mUrfyPvLCR9Oradnfgb296t9q3AsfFLDGWL8C7X9JIcpYCUIg0
	 ChQ0o6ztTJtorYVp9SPOvEeVbWFSonICc1NzvTdT0wDBelZBS5IgOnUA70kp9uDQKA
	 jfwGxu60M+lT6rfA4bgXy4XBf3++hkyY/pzYjIiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44248F80431;
	Thu, 13 Oct 2022 13:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B9D1F80269; Thu, 13 Oct 2022 13:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CF86F800A7
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 13:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CF86F800A7
Received: by mail-oo1-f47.google.com with SMTP id
 c13-20020a4ac30d000000b0047663e3e16bso1094974ooq.6
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 04:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j2pVn4Fvc8UPvpqqHE5JTFIcuecvDh3adTSLyFNQC4I=;
 b=OZ4WR1E3bQrJMX1ndinph2xOXKE/x0pQlnZ06anC6v/+h7i2heNR2cTzWsg3Q8pMVu
 zMkAl97l5og5YpI+Vu/k/1QhtJokJEtc8c4VSvvVOs3kYceBdxwEOmTd+cRjWQDbvie4
 SchtThNiKvNjN/8d4gjtB+pfy7ioP+p9MiLPfhAtvCOy8+zwGuY7hTfgeT9tJfia8zNh
 R9WauG8+YqVrzOyNdw3aLLLyhld25fVZq7o+PP3kCGGk2G7RkxmJpZNCYFtkrx75gsQ9
 r5mz/iXDRNR3S54hecB03FHpNNylzLAVIe0tUFhWAU5SR+Y+oFo6eGu++sWtqSC+KSHX
 p1Cg==
X-Gm-Message-State: ACrzQf3CKQapEzH2ucR4o5ptfADYDp0GLMBEntLgSfC02FRtugoaPiLs
 ToKZdO6zyXnyVw/vYxzPdg==
X-Google-Smtp-Source: AMsMyM4nNIc+oRZiG6wqfGw107MyYKxWYrQ+/jkkSqpfpMwFaFfpGJOPQSYGQzkONdcJKd36NRceMA==
X-Received: by 2002:a05:6830:2044:b0:661:8f8f:ffa2 with SMTP id
 f4-20020a056830204400b006618f8fffa2mr11109551otp.142.1665660165127; 
 Thu, 13 Oct 2022 04:22:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y1-20020a4ade01000000b0047f8ceca22bsm1951171oot.15.2022.10.13.04.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 04:22:44 -0700 (PDT)
Received: (nullmailer pid 5417 invoked by uid 1000);
 Thu, 13 Oct 2022 11:22:44 -0000
From: Rob Herring <robh@kernel.org>
To: Jeff Chang <richtek.jeff.chang@gmail.com>
In-Reply-To: <20221013080643.6509-1-richtek.jeff.chang@gmail.com>
References: <20221013080643.6509-1-richtek.jeff.chang@gmail.com>
Message-Id: <166565993196.4194034.3763255376639766451.robh@kernel.org>
Subject: Re: [PATCH] ASoC: Add Richtek RT5512 Speaker Amp Driver
Date: Thu, 13 Oct 2022 06:22:44 -0500
Cc: jeff_chang@ricthek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, tiwai@suse.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Jeff <jeff_chang@richtek.com>
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

On Thu, 13 Oct 2022 16:06:43 +0800, Jeff Chang wrote:
> From: Jeff <jeff_chang@richtek.com>
> 
> The RT5512 is a boosted class-D amplifier with V/I sensing.
> A built-in DC-DC step-up converter is used to provide efficient power for
> class-D amplifier with multi-level class-H operation. The digital audio
> interface supports I2S, left-justified, right-justified and TDM format for
> audio in with a data out used for chip information like voltage sense and
> current sense, which are able to be monitored via DATAO pin through proper
> register setting.
> 
> Signed-off-by: SHIH CHIA CHANG <jeff_chang@richtek.com>
> ---
>  .../bindings/sound/richtek,rt5512.yaml        |  50 +
>  sound/soc/codecs/Kconfig                      |  10 +
>  sound/soc/codecs/Makefile                     |   2 +
>  sound/soc/codecs/rt5512.c                     | 860 ++++++++++++++++++
>  4 files changed, 922 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt5512.yaml
>  create mode 100644 sound/soc/codecs/rt5512.c
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/richtek,rt5512.example.dtb:0:0: /example-0/i2c/rt5512@5c: failed to match any schema with compatible: ['richtek,rt5512']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

