Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5359234C25
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 22:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CA31696;
	Fri, 31 Jul 2020 22:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CA31696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596226940;
	bh=b6Kd7W7qIcd9HCB+grl80x+iMKiqdTkxM3biZ3nm8mA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tpi/R3hihmKeso5zZPh7cvFsDFkpzpoOsH3Ej2i4yVP4mMgurUpC6OMOYktUVp7wx
	 sc2R9NvGK/qRNdHI8FVVbl3SZeVogne/hIO89D9MpgGRBVHZ6Tf1sWmjy9D25ifGa4
	 uQYv89vQTftLDmGAOHGxoY2vrt0U4eGF3Wvu2iUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70946F80161;
	Fri, 31 Jul 2020 22:20:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 618CCF80171; Fri, 31 Jul 2020 22:20:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 464F8F8011C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 22:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 464F8F8011C
Received: by mail-il1-f194.google.com with SMTP id z3so16151458ilh.3
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 13:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=14cFHIH+5pcNnYf7nGiGjtZ3STT/BgFgufhbpVb8w2E=;
 b=dI+uVZ5tmK7NnUyFk8JFwaFZIagl9OcqyH5SxGZGE903OfPbzEfgtsdGG3FHVQNlUR
 pL8aL4lYYHHd+gsAYLE3AD0oI/NrXU7yVRcDh1HeoPeBKI6aNf13pusnRMZHEnpZI2YZ
 XaLMEjKwU1RL9mom9FBL6E2fIvF3hOfVyHQPtNAiyh5sdsWUNoisDmvD1deRC8bv9ptI
 NSyWu1TGOfQSxeib9hH7Wc03bawJ6y38fbYwBmZV+eHE05Bbam/xG1zXK1bIRpb8pPH2
 m3uhQZuaybTOm90l1JzznaDx6jVZ9zsiotNqJ6raX81Oe5Rfh28T62PXR2z+7jSxRdj0
 ATJg==
X-Gm-Message-State: AOAM5338o14MDm6cNHYeowYLVBtB+8TsqFZg9dpno3nHimGQIgSRropI
 OVFyiiTSHo57Ly+FjLrZkQ==
X-Google-Smtp-Source: ABdhPJwH+8TRsy44CdLoDhMeudbSS0ZxxndP4/x3ZTsHVWfrjyI+20UP81e+sp4iuHC9D9Xz17JjSw==
X-Received: by 2002:a05:6e02:134e:: with SMTP id
 k14mr2532291ilr.152.1596226829165; 
 Fri, 31 Jul 2020 13:20:29 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id a18sm4415112ilp.52.2020.07.31.13.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 13:20:28 -0700 (PDT)
Received: (nullmailer pid 713904 invoked by uid 1000);
 Fri, 31 Jul 2020 20:20:25 -0000
Date: Fri, 31 Jul 2020 14:20:25 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/7] ASoC: dt-bindings: Add a new compatible for the A64
 codec
Message-ID: <20200731202025.GA713768@bogus>
References: <20200726012557.38282-1-samuel@sholland.org>
 <20200726012557.38282-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726012557.38282-2-samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Ondrej Jirman <megous@megous.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
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

On Sat, 25 Jul 2020 20:25:51 -0500, Samuel Holland wrote:
> The audio codecs in the A33 and A64 are both integrated variants of the
> X-Powers AC100 codec. However, there are some differences between them
> that merit having a separate compatible:
>  - The A64 has a second DRC block, not present in the AC100 or A33.
>  - The A33 has some extra muxing options for AIF1/2/3 in the
>    AIF3_SGP_CTRL register, which are not present in the AC100 or A64.
>  - The A33 is missing registers providing jack detection functionality.
>  - The A33 is claimed to invert LRCK, but this is not seen on A64.
> 
> Since the driver will continue to work on the A64 using the A33
> compatible, albeit without jack detection functionality and with
> possibly inverted channels, as it does now, allow the A33 compatible
> to be used as a fallback.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../bindings/sound/allwinner,sun8i-a33-codec.yaml           | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
