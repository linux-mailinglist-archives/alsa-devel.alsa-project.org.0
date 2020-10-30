Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B9C2A0D52
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 19:25:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BC41654;
	Fri, 30 Oct 2020 19:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BC41654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604082324;
	bh=K7/s7I4aUD2EkrblcensfyDvRRHJ6cfHwrdhsTJ8fRE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J0v2kT+p/zMwmFhFPaS1nGlgHlKz2YKOKh+eYbv+jlmRk0hKvE2eFJV9E+iMDrhBR
	 qsuXm2ECESk4QPH9JEK7/XT1sqs/a3oCvASKrABsivmRZCMK6Yf9PkeTNHrEvTwH71
	 UZdLBc3V9bY6/9aP6s2sdDZ4VOFe4Hlivz/lbVTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33349F80249;
	Fri, 30 Oct 2020 19:23:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2EE7F80212; Fri, 30 Oct 2020 19:23:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6BEAF800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 19:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6BEAF800FF
Received: by mail-oi1-f193.google.com with SMTP id u127so7566155oib.6
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 11:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2inLjJbsAMkvoGMY+1AnyOCvk2aTurr24HiDc4FcZ/8=;
 b=apNqCxp0GFi9Yg3irmTH3wkbFj5EVW8o1dbHyvfL7qWAwZrtxHPMwVLpUOWTp2O0YV
 jZk5qOn0xfkpZtu1f2eu6Ai3lyAOOsgvptgaZJFDI33iJswQ6mIeuoVerIuF4PUxCwmz
 p7dSnKoT1/4NDfIfIXSUhuu+I0tzKytbo9o8Zz2wxomX67vOE+t3rCyCEEMQb2DJF+rU
 zmlhBuekKD0UgUYiPtIPo9vjFxrwlcZw/RnuZKiIO8v+yseeFTqiE89LxXDzvYg/KH+G
 aqoMmhKWyghPviRBtA/9kCouf0yNVa6KvvCjslFkyIompcrG1u3lM2BvtAMpmhfVuNTz
 RcCA==
X-Gm-Message-State: AOAM531r1foly0DNJyu6y+754rPEHvFjbXKyZEAjgrKoHwLBVgsU8pyH
 N0VqvzW2nv7VLzenHhUSGA==
X-Google-Smtp-Source: ABdhPJzaDb2ohyIsfJyr5ytEjd3zNgm/t/ARqTbOLtJdwTgoAzDkMIVKjnk/1oZSlSF1bY7JMwpWCA==
X-Received: by 2002:aca:4f55:: with SMTP id d82mr2532939oib.172.1604082221243; 
 Fri, 30 Oct 2020 11:23:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 104sm1553996otu.81.2020.10.30.11.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 11:23:40 -0700 (PDT)
Received: (nullmailer pid 4098973 invoked by uid 1000);
 Fri, 30 Oct 2020 18:23:39 -0000
Date: Fri, 30 Oct 2020 13:23:39 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: mediatek: mt8192: add ul-delay-ms
 property
Message-ID: <20201030182339.GA4069524@bogus>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-3-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603521686-13036-3-git-send-email-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

On Sat, Oct 24, 2020 at 02:41:26PM +0800, Jiaxin Yu wrote:
> We can choose to drop any length of data from the beginning according
> accroding 'ul-delay-ms'.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/sound/mt6359.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
> index a54f466f769d4..fd2d02c97fe7c 100644
> --- a/Documentation/devicetree/bindings/sound/mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
> @@ -49,6 +49,11 @@ properties:
>      description: |
>        Specifies the type of mic type connected to adc2
>  
> +  mediatek,ul-delay-ms:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Skip first time data at the beginning of DMIC recording

What does 'ul' mean? Nothing tells me this is DMIC related in the name 
and 'ul' is not used anywhere in the description.

> +
>  additionalProperties: false
>  
>  examples:
> @@ -56,6 +61,7 @@ examples:
>      mt6359codec: mt6359codec {
>        mediatek,dmic-mode = <0>;
>        mediatek,mic-type-0 = <2>;
> +      mediatek,ul-delay-ms = <50>;
>      };
>  
>  ...
> -- 
> 2.18.0
