Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D41AE06B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 17:04:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA351669;
	Fri, 17 Apr 2020 17:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA351669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587135859;
	bh=TN9QuMfFDd+Rh3J6OWLbcgtmbYQ+wtBHg1QNWzy8xYw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+bKjM6MyetTb4rC7nrzqWLA4INATk32DVnr3nTnfbJifw9rCA99g1kQUywBp8Wb8
	 KHUsPotBhJ8Zb5oUtVz1IFve8gSmeRiVNHUTBJTi4XOU3mlkpH8hG5rLsYU8/y5C/0
	 UEMPE5EUg6bf5o3Ec8UG19Tg/YoSyRE+/D6c+uFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E720FF8025F;
	Fri, 17 Apr 2020 17:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03D0AF80245; Fri, 17 Apr 2020 17:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58F0DF800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 17:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58F0DF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch
 header.b="Co8VCB7j"
Received: by mail-wr1-x441.google.com with SMTP id j2so3394580wrs.9
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=MZOx11K7BVkb9vfDngpczKG72DuQTl/mUltDtknINYM=;
 b=Co8VCB7jRRt1O8+H04fdcxwEtJQvvJ85wW4SvxgTv/mHipUFj+ltqVgCL7M0LxDbBm
 Pb7tEFjXMUdCDK1W7VoRTpT556UNIZvUATsFGTDHXX4ngalCQfdP4rjg3fEM8Y0uLOUu
 QsIi+ueZ6e8w8tapH3hrUwyBDQ4rCmAD5wsU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=MZOx11K7BVkb9vfDngpczKG72DuQTl/mUltDtknINYM=;
 b=QSQsMiP8R1o5czHs+S1AlThJIuD2BRK7ugqtb0u3QsOXxPp0fRxdY1L66aAcJ+mYei
 +u8fViKlcuYv6j0yzSdaIleXPNDTDIqlwGTEEIdbjLgxFcE5bL8B2LwWRg3/G9PEJQQ2
 /NmcnAps3JW+EH2vbRV5DF5TjUs6wM6h86afrOR6OLOYxvs/h5pBxRRtGSTRm9KxWacj
 CzA5ygGhez2hv2qnIMwWBQQMlzrOQS1Fw12UhujSnOwNRth0noyQEX99f6BaaEHlG+Mw
 oln+RkYlV9K8q7g1fVwkspqYoc4TVBlZ/Exp5POJTcbRdTJrj5aRjiSAF20mVaaUpd/3
 boXg==
X-Gm-Message-State: AGi0PubfhULp3yTzWX894fC21zKX7BAzZ+9Mcf50lYQbeJHJozzIgKMo
 nTe8p2Vaoltr/K1KJdZfAysy+A==
X-Google-Smtp-Source: APiQypJc7M6g4SJSxadMb830ZLUuNjVyEPZxJsFHSeWGeY7zkoZSsxwQWcW79Vv6OwRGwssTlFoC0w==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr4404415wrq.14.1587135747372; 
 Fri, 17 Apr 2020 08:02:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e5sm33270104wru.92.2020.04.17.08.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:02:26 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:02:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH trivial 3/6] drm: Fix misspellings of "Analog Devices"
Message-ID: <20200417150224.GO3456981@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Stefan Popa <stefan.popa@analog.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jiri Kosina <trivial@kernel.org>,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20200416103058.15269-1-geert+renesas@glider.be>
 <20200416103058.15269-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416103058.15269-4-geert+renesas@glider.be>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jiri Kosina <trivial@kernel.org>,
 Stefan Popa <stefan.popa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 linux-iio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dmaengine@vger.kernel.org, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
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

On Thu, Apr 16, 2020 at 12:30:55PM +0200, Geert Uytterhoeven wrote:
> According to https://www.analog.com/, the company name is spelled
> "Analog Devices".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queued for 5.8 in drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/bridge/adv7511/Kconfig | 2 +-
>  drivers/gpu/drm/drm_fb_cma_helper.c    | 2 +-
>  drivers/gpu/drm/tegra/fb.c             | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/Kconfig b/drivers/gpu/drm/bridge/adv7511/Kconfig
> index 47d4eb9e845d085c..f46a5e26b5dd6406 100644
> --- a/drivers/gpu/drm/bridge/adv7511/Kconfig
> +++ b/drivers/gpu/drm/bridge/adv7511/Kconfig
> @@ -6,7 +6,7 @@ config DRM_I2C_ADV7511
>  	select REGMAP_I2C
>  	select DRM_MIPI_DSI
>  	help
> -	  Support for the Analog Device ADV7511(W)/13/33/35 HDMI encoders.
> +	  Support for the Analog Devices ADV7511(W)/13/33/35 HDMI encoders.
>  
>  config DRM_I2C_ADV7511_AUDIO
>  	bool "ADV7511 HDMI Audio driver"
> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
> index 9801c0333eca29e9..cb2349ad338d953b 100644
> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_cma_helper.c
> @@ -2,7 +2,7 @@
>  /*
>   * drm kms/fb cma (contiguous memory allocator) helper functions
>   *
> - * Copyright (C) 2012 Analog Device Inc.
> + * Copyright (C) 2012 Analog Devices Inc.
>   *   Author: Lars-Peter Clausen <lars@metafoo.de>
>   *
>   * Based on udl_fbdev.c
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index b8a328f538626e7a..2b0666ac681b8721 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -4,7 +4,7 @@
>   * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>   *
>   * Based on the KMS/FB CMA helpers
> - *   Copyright (C) 2012 Analog Device Inc.
> + *   Copyright (C) 2012 Analog Devices Inc.
>   */
>  
>  #include <linux/console.h>
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
