Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B4920FE79
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 23:06:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E8551607;
	Tue, 30 Jun 2020 23:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E8551607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593551194;
	bh=NHvNkYvCOo17dyL3qfjp+9tAWNTwG9+HDDBr4LnNCMg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5uGaLSwKQUAblyACwWMvGX461utOEusGKC24v3BPqdcuN1lwAKU3SGXnyxzL6FFl
	 Pc1vfUapkfTPVOgYB0X0hQA2Ufyz3bgZ+SdzLNf13f/wXNfFPL6fksZAIGUiTOCWnV
	 4fa1nFFAg+9kuf6UgVnnFTL8ZOLBVjVMAah3O0Ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42D85F801D8;
	Tue, 30 Jun 2020 23:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B528AF801F2; Tue, 30 Jun 2020 23:04:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFE82F80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 23:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFE82F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="apeVYBO1"
Received: by mail-pg1-x542.google.com with SMTP id f3so10529840pgr.2
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 14:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xNBGyQANiqILlDq1wBEsbi38cozHmh/XihUuNGYycM0=;
 b=apeVYBO1IzE4K9q8w8l/ssG5Lfbnwat+ekTKnOAvohkItLv2DT6zmG6j7IO5lU/uZh
 M5Y0zfUVbhHZdGcXd0QzwbZpGvwH/LFDaHSwd0fJC3DLpLGfsx0RFEDDJWMtUBrQIrYe
 /6FXjUxRIpNjpdkQK+tL2I8sJRzV9KSaIlPV6J/uZtGRJvXfBimGWsoS5feUqI0JfDOP
 Fj5EWmXMpOESrikQePf0W3hFYRcj/QSy4ULxQzARLKt4gDahSVvwHBboMp+be6jPWefV
 on56aQwYPeI7AmM+1VqzimoQKB6KE3asb0iN1HfIy9RBKhDw5QkzwbkEAV5V6uFuyGf2
 tUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xNBGyQANiqILlDq1wBEsbi38cozHmh/XihUuNGYycM0=;
 b=qUC++B7j3kz+l2/0GSGq8BN1JrLqQWzfGE2ohgWmizJRlt5HH4bBqOSURJf8WBs3mU
 LxqIwxh/sSYHSGXxapZ+K6UdH3+7t3oNCZLAvDszylX9BKZ5gK7dT/LPJz+CD1AcuR+7
 S3oOq9ao6ZuZhV8QGKJa3VPMgf1/Cpg+KojbNaw8TS3GNdCYo3MEj0waQi4rC4DKO0zY
 LNnaZBimSbbaHLgsxnVHc96YPjKsZchtoIqkGhc62cWdQaTahekHR7bC9qjUv2SDONGf
 F7AEMHrtqFir30ti47WHWt+T9cB1OROSXSO7w7V4pIP1k9h3lWP2ZVG8xjF8S1DGfUmk
 d4qw==
X-Gm-Message-State: AOAM530Jr+HwccxF077hyDwRPfm4MApGn+NE/FNRSu+iMd224+mh7hpf
 C0zbLvUTGa83+7lSpBXwMYo=
X-Google-Smtp-Source: ABdhPJw7UQDcd11OnB7gP5fyr6hOiKF7tfXRYP0rVvN43PiGmFgzFZN8xB7xJQUnsTns4SmS0btXSw==
X-Received: by 2002:a65:5682:: with SMTP id v2mr16489451pgs.231.1593551083729; 
 Tue, 30 Jun 2020 14:04:43 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:1000:7a00::1])
 by smtp.gmail.com with ESMTPSA id 204sm3623211pfc.18.2020.06.30.14.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 14:04:43 -0700 (PDT)
Date: Tue, 30 Jun 2020 14:04:41 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Intel: KeemBay: Fix header guard
Message-ID: <20200630210441.GA3710423@ubuntu-s3-xlarge-x86>
References: <20200617010232.23222-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617010232.23222-1-natechancellor@gmail.com>
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Sia Jee Heng <jee.heng.sia@intel.com>
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

On Tue, Jun 16, 2020 at 06:02:32PM -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>  In file included from sound/soc/intel/keembay/kmb_platform.c:14:
>  sound/soc/intel/keembay/kmb_platform.h:9:9: warning: 'KMB_PLATFORM_H_'
>  is used as a header guard here, followed by #define of a different
>  macro [-Wheader-guard]
>  #ifndef KMB_PLATFORM_H_
>          ^~~~~~~~~~~~~~~
>  sound/soc/intel/keembay/kmb_platform.h:10:9: note: 'KMB_PLATFORMP_H_'
>  is defined here; did you mean 'KMB_PLATFORM_H_'?
>  #define KMB_PLATFORMP_H_
>          ^~~~~~~~~~~~~~~~
>          KMB_PLATFORM_H_
>  1 warning generated.
> 
> Fix the typo so that the header guard works as intended.
> 
> Fixes: c5477e966728 ("ASoC: Intel: Add KeemBay platform driver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1053
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  sound/soc/intel/keembay/kmb_platform.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/keembay/kmb_platform.h b/sound/soc/intel/keembay/kmb_platform.h
> index 29600652d8f4..6bf221aa8fff 100644
> --- a/sound/soc/intel/keembay/kmb_platform.h
> +++ b/sound/soc/intel/keembay/kmb_platform.h
> @@ -7,7 +7,7 @@
>   */
>  
>  #ifndef KMB_PLATFORM_H_
> -#define KMB_PLATFORMP_H_
> +#define KMB_PLATFORM_H_
>  
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
> 
> base-commit: 27f70ec4fa0e0f419031f1b8d61b1a788244e313
> -- 
> 2.27.0
> 

Ping? This is a rather trivial patch.

Cheers,
Nathan
