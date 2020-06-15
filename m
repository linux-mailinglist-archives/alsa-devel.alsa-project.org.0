Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C21F9EA5
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 19:37:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 005361670;
	Mon, 15 Jun 2020 19:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 005361670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592242645;
	bh=vXGquYxK0P69MvJ2UUsi8bv6LfZSIpAfP0EzfruFDVU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qDMoO2AyR6wNkL4MRpYPMs8CITvAe2PjbZifSixKyp8h5iFgywlEILhOwmDxScbWA
	 Bv5V04EpFnfcTQF5fDtBWD0DvemCzJtiuU46gcGOd3ZTpWBxsynJa1qNPGHhqyUpEL
	 UBI4sH1Y3bLYy263+DDB8Sj8f0l5j5AdMk8et8T8=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A554F8013E;
	Mon, 15 Jun 2020 19:35:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F87F801D9; Mon, 15 Jun 2020 19:35:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53EA3F800EF
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 19:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53EA3F800EF
Received: by mail-io1-f68.google.com with SMTP id p20so18758316iop.11
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 10:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1JiCuZIwRbQkXmLhUt7LtNnEibrkpGANtdOy2K9pN/A=;
 b=iHTd+AvEkqMZTBxdZk2xXLY9pALCSZhPpWcfW/NTrukxkrQooE7VexHO6cwIA52uXx
 mI4jcyVV3XZtk1LlX9XC2ygv02CQ7WhLxsxs9qvUJ2Xq7kV/zrywB4n9ApY++F6w0d2B
 JXJ/PGVHixTbo9btgOKEpTs1azndFXfRM6C4wAzO2KEBsOaN6nNw1gmEnyh+CDReUzyN
 eEIssxwcI/aZtTeTsiEP78Wo5RbEJlWG6rS3Ufabvm48HIcPQDib60zdyAf0mSKnuF42
 /8pThcvyW8iPTeBUV6m0zJcmWzSnOXgcKxNXH/QEyIeJVGT/N1R1HK4r8NcYK/zjMIYB
 CbkA==
X-Gm-Message-State: AOAM532MERBVzIz5Ubk4P0/5OEQonHVI3pRDgh9KQdhCVqgZdxt8YWTk
 fIouL+MWAcnivzQQcDbkSw==
X-Google-Smtp-Source: ABdhPJzmcCoxavzPmy5alBS5FHSzUeC93JuwlINmuFrp1yRWunDiT9BIk4RqZaXq2VXnwXR00TbBwA==
X-Received: by 2002:a6b:39d7:: with SMTP id g206mr29016266ioa.31.1592242532219; 
 Mon, 15 Jun 2020 10:35:32 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id f22sm8284533iob.18.2020.06.15.10.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 10:35:31 -0700 (PDT)
Received: (nullmailer pid 2007945 invoked by uid 1000);
 Mon, 15 Jun 2020 17:35:30 -0000
Date: Mon, 15 Jun 2020 11:35:30 -0600
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add compatible string for MAX98360A
Message-ID: <20200615173530.GB2006513@bogus>
References: <20200605034931.107713-1-tzungbi@google.com>
 <20200605034931.107713-3-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605034931.107713-3-tzungbi@google.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Fri, Jun 05, 2020 at 11:49:31AM +0800, Tzung-Bi Shih wrote:
> Maxim MAX98360A audio amplifier is functionally identical to MAX98357A.
> Adds compatible string "maxim,max98360a" for driver reuse.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../devicetree/bindings/sound/max98357a.txt          | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/max98357a.txt b/Documentation/devicetree/bindings/sound/max98357a.txt
> index 4bce14ce806f..75db84d06240 100644
> --- a/Documentation/devicetree/bindings/sound/max98357a.txt
> +++ b/Documentation/devicetree/bindings/sound/max98357a.txt
> @@ -1,9 +1,10 @@
> -Maxim MAX98357A audio DAC
> +Maxim MAX98357A/MAX98360A audio DAC
>  
> -This node models the Maxim MAX98357A DAC.
> +This node models the Maxim MAX98357A/MAX98360A DAC.
>  
>  Required properties:
> -- compatible   : "maxim,max98357a"
> +- compatible   : "maxim,max98357a" for MAX98357A.
> +                 "maxim,max98360a" for MAX98360A.
>  
>  Optional properties:
>  - sdmode-gpios : GPIO specifier for the chip's SD_MODE pin.
> @@ -20,3 +21,8 @@ max98357a {
>  	compatible = "maxim,max98357a";
>  	sdmode-gpios = <&qcom_pinmux 25 0>;
>  };
> +
> +max98360a {
> +	compatible = "maxim,max98360a";
> +	sdmode-gpios = <&qcom_pinmux 25 0>;
> +};

Nothing new here, you don't need another example.

> -- 
> 2.27.0.278.ge193c7cf3a9-goog
> 
