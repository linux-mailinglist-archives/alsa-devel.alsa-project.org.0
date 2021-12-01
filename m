Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E691E465950
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 23:33:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AAF6266B;
	Wed,  1 Dec 2021 23:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AAF6266B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638397992;
	bh=VCggAWdn5CwvXF3xxO8qfVdxeyozx3ZirbZTIz8iW+c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0BIHxvo1wwvBpfVKX/1i6tuWLnsC6BpBo+PWoFkhivT61vo/zRp7znOjBIGw9YEk
	 /p8EC4D9Qx6tgEMZmnRgyccU5HCAw1V44ePZs5VkT4sQcOavm5q3ll5L0yD15CtzGB
	 lXxrU+avmy4RFQSIyYPlXICclvA0c9DMa2nrEXEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F184EF800EE;
	Wed,  1 Dec 2021 23:31:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE505F80246; Wed,  1 Dec 2021 23:31:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A894F800EE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 23:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A894F800EE
Received: by mail-ot1-f45.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so37353885otl.8
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 14:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T5dDFTbqoVtVfAAIqapjKcFefz1Su1Y3Jb3TmXDSfLM=;
 b=qvVWExDeKySYyJtpCmTGpJ8wCn3SZtXfDp2jU07Mazeg5rQzcFaOxfv9WejSVUE30c
 JN1EoE/QPWaDgXmfEth74rOWMH7bw42ksJidX/IOkdL4CwyI8fTMwPd9JbSSyif0iSKM
 SihJIeADEAqDZ2n1ScQAyk/o/y3BA0co7oS+AL9gnROGsZKRVlXfTmnozf+JjU0VLxPI
 qpZIVnN+yfxwGyq+JhP1EGwbEYH3r6alfXRi2d0iKm9DRCBBg4dkjufroEd2nun165R5
 4OxnBX1SFKvNIZuoFrLkEvhLJ0QmURBzbKThbPPmgWUU4UHbzAEV2HrDtDK4ySGd0nEX
 EEqQ==
X-Gm-Message-State: AOAM533r/VrAVkrosmuyYZnkTh+/a3/ZOtqEixLxWxiPq3ghEi+yL01E
 Fb+fnBqZ3Qfzmi0yKe6cDA==
X-Google-Smtp-Source: ABdhPJy8bnGR48W/xJpn01QnF07dEzkJUHFVw79LlhkqiRr6++P/Ysr9/PjH2SDv8XKQNdKBo6V6lg==
X-Received: by 2002:a05:6830:2aa7:: with SMTP id
 s39mr8424157otu.151.1638397901599; 
 Wed, 01 Dec 2021 14:31:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bi20sm592910oib.29.2021.12.01.14.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:31:40 -0800 (PST)
Received: (nullmailer pid 2899335 invoked by uid 1000);
 Wed, 01 Dec 2021 22:31:39 -0000
Date: Wed, 1 Dec 2021 16:31:39 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: stm32: i2s: allow additional
 properties.
Message-ID: <Yaf3yy3tiTOaNBDY@robh.at.kernel.org>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-3-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125144053.774-3-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Olivier Moysan <olivier.moysan@st.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, amelie.delaunay@foss.st.com,
 Mark Brown <broonie@kernel.org>, fabrice.gasnier@foss.st.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alain.volmat@foss.st.com,
 arnaud.pouliquen@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Nov 25, 2021 at 03:40:51PM +0100, Olivier Moysan wrote:
> The STM32 SPI peripheral supports both SPI and I2S protocols.
> In the SoC device tree the node describes the peripheral as an
> SPI peripheral by default. This default configuration can be
> overwritten in board device tree to use the IP as an I2S peripheral.
> In this case the address-cells and size-cells properties from
> SoC DT SPI node should not be checked against STM32 I2S bindings.
> Set additionalProperties to "true" to allow these extra properties.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> index 64b70ac539f8..33ba15363c0f 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> @@ -73,7 +73,7 @@ required:
>    - dmas
>    - dma-names
>  
> -additionalProperties: false
> +additionalProperties: true

This is only allowed for schemas that are incomplete collections of 
properties such as common bindings.

Rob
