Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D63613DA6
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 19:47:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73439166C;
	Mon, 31 Oct 2022 19:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73439166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667242030;
	bh=P7AmbVXemjGinJuv99c0tqtgeMXygKCvgL3LLQ//4/M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=udV9gS3pB2FLUQXMsHMkxN0cb5J/jBX/uv4Lm2kArzgzLbWGtSN9DMukiPR2Nm1vC
	 zIc9XoLQqvFLTYTC/MkAwlZjwUhND65NTdYCqSeNOJUwzNjByPL/pMuBsj3vNWtxGo
	 qtlRnyZNEg3WZFx2Fv1AgzfnJncR25nov1kcd3/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C87EBF800E1;
	Mon, 31 Oct 2022 19:46:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A326F80163; Mon, 31 Oct 2022 19:46:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF4D0F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 19:46:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF4D0F800E1
Received: by mail-oi1-f173.google.com with SMTP id n83so13656818oif.11
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dO8H5QCa3hgSieHYwlmpZX3yqBydAVWKuwLGmWit0To=;
 b=7NVh9HQAttVFKWb0C1zTKUd8n4T2+0gKCqo1DHJYQrIDMbq9CcRr9I6bjj3UUqCuGB
 ylf3riFhWxse8Eg6JeqI9O08CrTsTP0PG+5KI1oY71pSMUNHtgX0SBw6US0uUXh4CUk8
 QfQMWO5llWQc7golyK08BeuGRwWAkxA1DpTrxaTuYMDhi9SCezMTM0jQ1kGpMw0XWTcG
 VzrjN6mP3R7+2geRoTTGNuENWA+HZ6ayTi1zkKgmzphWZBI8xEJAJ1fqbgkzzG9MFmQI
 Io5M2gbmo0oTdwhYSwe568F2Vk+0NuQBOurgzLGcaKent4uCAuvoLSSOixCHMYLxaQaA
 j4SA==
X-Gm-Message-State: ACrzQf396NPnGLIzbt1Qz4hWfq2DVyxKiZeNmCtnAv/mDzH4KAeoz/m1
 07qSp/195zC3KmE2Rni7yw==
X-Google-Smtp-Source: AMsMyM4/HGxczmxjs3nTZ13LSdLRb4M+o0ANIbSNLMj9l7t2fMP1wLJjAEWQ6t6bZdK7j9LmlV6xDw==
X-Received: by 2002:a05:6808:254:b0:359:f10b:5469 with SMTP id
 m20-20020a056808025400b00359f10b5469mr5693509oie.248.1667241968993; 
 Mon, 31 Oct 2022 11:46:08 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056820016c00b0049a96a62a3bsm1742279ood.48.2022.10.31.11.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 11:46:08 -0700 (PDT)
Received: (nullmailer pid 3242738 invoked by uid 1000);
 Mon, 31 Oct 2022 18:46:10 -0000
Date: Mon, 31 Oct 2022 13:46:10 -0500
From: Rob Herring <robh@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: ingenic,aic: Remove unnecessary
 clocks from schema
Message-ID: <166724196894.3242676.3402578757445878857.robh@kernel.org>
References: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
 <20221028103418.17578-2-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028103418.17578-2-aidanmacdonald.0x0@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 tsbogend@alpha.franken.de, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, tiwai@suse.com, linux-mips@vger.kernel.org,
 paul@crapouillou.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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


On Fri, 28 Oct 2022 11:34:16 +0100, Aidan MacDonald wrote:
> The AIC needs only the first two clocks: "aic" is a gate that's used
> for gating the I2S controller when it's suspended, and "i2s" is the
> system clock, from which the bit and frame clocks are derived. Both
> clocks are therefore reasonably part of the AIC and should be passed
> to the OS.
> 
> But the "ext" and "pll half" clocks are a little more questionable.
> It appears these bindings were introduced when the schema was first
> converted to YAML, but weren't present in the original .txt binding.
> They are intended to be the possible parent clocks of "i2s".
> 
> The JZ4770 actually has three parents for its "i2s" clock, named
> "ext", "pll0", and "pll1" in the Linux driver. The JZ4780 has two
> parents but it doesn't have a "pll half" clock, instead it has an
> "i2s_pll" clock which behaves much differently to the actual
> "pll half" clock found on the JZ4740 & JZ4760. And there are other
> Ingenic SoCs that share the JZ4780's clock layout, eg, the X1000.
> 
> Therefore, the bindings aren't really adequate for the JZ4770 and
> a bit misleading for the JZ4780. Either we should fix the bindings,
> or remove them entirely.
> 
> This patch opts to remove the bindings. There is a good case to be
> made that "ext" and "pll half" don't belong here because they aren't
> directly used by the AIC. They are only used to set the parent of
> the "i2s" clock; they have no other effect on the AIC.
> 
> A good way to think of it is in terms of how the AIC constrains
> clocks. The AIC can only generate the bit & frame clocks from the
> system clock in certain ratios. Setting the sample rate effectively
> constrains the frame clock, which, because of the clock dividers
> controlled by the AIC, translates to constraints on the "i2s" clock.
> Nothing in the AIC imposes a direct constraint on the parents of
> the "i2s" clock, and the AIC does not need to enable or disable
> the parents directly, so in principle the AIC doesn't need to be
> aware of the parent clocks at all.
> 
> The choice of parent clock is still important, but the AIC doesn't
> have enough information to apply such constraints itself. The sound
> card does have that information because it knows how the AIC is
> connected to other components. We need to use other DT mechanisms
> to communicate those constraints at the sound card level, instead
> of passing the clocks through to the AIC, and inventing ad-hoc ways
> to plumb the constraints around behind the scenes.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  .../devicetree/bindings/sound/ingenic,aic.yaml         | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
