Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B2951AF7B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 22:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867C51754;
	Wed,  4 May 2022 22:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867C51754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651696808;
	bh=FcQ9gEuvYR1sQAz11EGS2hatFJFlUdNPtc2CHaxljk8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3710jOAL3XTVJLjlOVxEaln+ic0aQ6s1SWQ84PAW1w3vaWG/KwwlGq34RPkjlX2x
	 wp7GR1eVJlGRmKVelnUFNuyoEzGOCbkTlayFDfYkoI2LpmMXto9ARl+es01yAYHuxa
	 1Sr04nhwyTc4cxEnvYme0ywN97McP0Rj1JvMdfvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BD43F80166;
	Wed,  4 May 2022 22:39:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7075F80163; Wed,  4 May 2022 22:39:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D5DF800D3
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 22:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D5DF800D3
Received: by mail-oi1-f169.google.com with SMTP id q8so2358712oif.13
 for <alsa-devel@alsa-project.org>; Wed, 04 May 2022 13:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AcpEU69sAJkwiV3catvTf9Ba2Nirs+uxT6TgvfUDezQ=;
 b=eULnq6sluvfDaGdbxXxflDp6+Avnd9+lFqn7N2ykrnR1yqTZYsa5r1GsV6LeucliNj
 4dI3Y1AenP4LQqepvrtbUhR7bKwJkkzWv175DIAFs2xvSJ8KqV/0dQ936NjJXiRQg2oc
 0KIuKiBOSBVniTyh51lPbVGs6bAz+emcf1XQWUQ2i7qOqDpy2wz96rfWRrWyg40l1XTB
 SVjiil5mJAccgBYRgYArfwOCbP9oIRIUY0qt+MZ2xJnEBjIDdrxsvEI5cdSUHYvhP7Pb
 O0CENTubfW8PhPUjNNOpYRX5raeYbjAkyQ59HvCbv+xa/RI6EjAR6+Xvue5KVDFW+NF+
 n7jw==
X-Gm-Message-State: AOAM5312O2TfsHsAExl0qNojAnajsGAbX0vyYXSJYo5Bcr8wDUAHK8Yh
 Sk5SXXbHHhf514LA01LMxw==
X-Google-Smtp-Source: ABdhPJxqGL2rYGTLd4lmJ9hpkXvtgU1omEZJ82uy+vc3bVbntykS23hu/PcAgWaMqP8CbQy4JAssJw==
X-Received: by 2002:aca:545:0:b0:325:6e7:992d with SMTP id
 66-20020aca0545000000b0032506e7992dmr673969oif.244.1651696737433; 
 Wed, 04 May 2022 13:38:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dv2-20020a056870d88200b000e93d386d97sm8387005oab.31.2022.05.04.13.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:38:57 -0700 (PDT)
Received: (nullmailer pid 2187220 invoked by uid 1000);
 Wed, 04 May 2022 20:38:56 -0000
Date: Wed, 4 May 2022 15:38:56 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Message-ID: <YnLkYKmJ0TJ8uyjC@robh.at.kernel.org>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220429203039.2207848-2-nfraprado@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, Shane Chien <shane.chien@mediatek.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Fri, Apr 29, 2022 at 04:30:37PM -0400, Nícolas F. R. A. Prado wrote:
> The Mediatek AFE PCM controller for MT8192 allows sharing of an I2S bus
> between two busses. Add a pattern for these properties in the
> dt-binding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> index 7a25bc9b8060..5b03c8dbf318 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -54,6 +54,11 @@ properties:
>        - const: aud_infra_clk
>        - const: aud_infra_26m_clk
>  
> +patternProperties:
> +  "^i2s[0-35-9]-share$":
> +    description: Name of the I2S bus that is shared with this bus
> +    pattern: "^I2S[0-35-9]$"

Why not a phandle to the the other bus? That would be the DT way to do 
it. But I'm not sure I really understand who is sharing what here.

> +
>  required:
>    - compatible
>    - interrupts
> -- 
> 2.36.0
> 
> 
