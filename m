Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F4E11E7C9
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 17:10:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D8DF1778;
	Fri, 13 Dec 2019 17:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D8DF1778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576253414;
	bh=cD1UuIWiOrymelgh8b5gbUU9sCNsMn8B1iIuw+if8H0=;
	h=From:Date:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O/xkq0PcOyyVZiuh3ThptNNED9p5EbTkyEfNrD/cybZbRgi4KPMSljlrv1yvyIyAT
	 etQw6IVDfM4W8FTNX/0TgQPxX9uqJErtptoU4dHfriDkFXbjrc9Zu6QaHpxybrF/po
	 K+BlFnz3nhhdm5FMXL3lYUvPTSdsrdVOvsdyIGPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF1CCF801F4;
	Fri, 13 Dec 2019 17:08:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A819EF801F4; Fri, 13 Dec 2019 15:39:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D16FEF80139
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 15:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D16FEF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P/EwZeZp"
Received: by mail-lj1-x243.google.com with SMTP id c19so2859848lji.11
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 06:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K0xyGvYdKE3hBTD3MTOnFGoeyVHi3fOPiFEUThBDlBc=;
 b=P/EwZeZpRKMNHl6iqV3Csl4OLoMpWGTPETioS5J07YC8v/QU6EFsXRvFFXLjZrzFV5
 J7S000cmkgJ0C+q/1/9cIRC6g8BjKfDrJ6MdYPjcICt+wW8q5ihFTiX7lrwZLXpkNPK3
 YPjwXY/UUgMwoRZXd8qDGKLjmNCrSaUtKApiqwpJGuRnk8gwBMEk7hUVgT0W8/L1kfKY
 pyD1WIERMjP8sjlbTnCJ7UU/TVxhcC/SR3uz2pz97a9xqsK9VFnjmpeO1g/l/eJsvyCM
 YilLpaqmKiiBUMQQxLNGy7HNqaS+ZFxpbfs4j5lJspMcwhQW8Owgey8ktw45m6gpOcj8
 JG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K0xyGvYdKE3hBTD3MTOnFGoeyVHi3fOPiFEUThBDlBc=;
 b=VYTG7Rcqlq5+zcXF1cBfT+ekqw3umB+DPdWzK5W7FhnP60Oz88JxEeDpCNUClavViR
 XFXoDYSRAV/21qLqnNaBvbOEsMWdDXFonVf+zMw4lEcowVqVQxHYHNevTYQ1m/IuWkPl
 mRaGX00S6KC0f1VXIteG/tEgLTz62qRgOWL8RTW7OIA2UHn1dMp8Csq8RuezGT/wH35K
 BhHmDNDOGvk/jAxYPgkaiX1A6r1itrYlPhoCaCZ3ltRjtMZpwO1P6DwsawX3qvGQ6+JJ
 xpk+q4OTGTHPp6A8IU+5naN3YlMjQFosBmGlOVJTGJTdMDPpdSMcWN+JLROBihQQzBCH
 r4nA==
X-Gm-Message-State: APjAAAXEgKHZjPxL4uzVSwssXxOs6RLdU6h42yRmOeN23KXsmvPrg7cU
 mpqGKyAbMm3o5B8PNd2v9iw=
X-Google-Smtp-Source: APXvYqwMjAne3xDaq8yHsYg1EmmlUe+MSNgEISEsa7lHDi2E+riRw+k7y+G6slqJbpccT1oYhfV0yw==
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr9972478ljj.102.1576247950504; 
 Fri, 13 Dec 2019 06:39:10 -0800 (PST)
Received: from google.com ([2620:0:1043:12:60fa:1524:8dd0:6d])
 by smtp.gmail.com with ESMTPSA id h24sm4889926ljl.80.2019.12.13.06.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 06:39:09 -0800 (PST)
From: Lionel Koenig <lionel.koenig@gmail.com>
X-Google-Original-From: Lionel Koenig <lionelk@google.com>
Date: Fri, 13 Dec 2019 15:39:08 +0100
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191213143908.GA172456@google.com>
References: <20191211155742.3213-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211155742.3213-1-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 13 Dec 2019 17:08:29 +0100
Cc: alsa-devel@alsa-project.org, Lionel Koenig <lionel.koenig@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: Avoid possible info leaks from
 PCM stream buffers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Dec 11, 2019 at 04:57:42PM +0100, Takashi Iwai wrote:
> The current PCM code doesn't initialize explicitly the buffers
> allocated for PCM streams, hence it might leak some uninitialized
> kernel data or previous stream contents by mmapping or reading the
> buffer before actually starting the stream.
> 
> Since this is a common problem, this patch simply adds the clearance
> of the buffer data at hw_params callback.  Although this does only
> zero-clear no matter which format is used, which doesn't mean the
> silence for some formats, but it should be OK because the intention is
> just to clear the previous data on the buffer.

I have tested this patch on the same way I tested the previous one and
didn't experience any leakage of data. 
Thanks for helping putting that together.

Kind regards,
Lionel

> 
> Reported-by: Lionel Koenig <lionel.koenig@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> 
> This is a revised patch of the previous one
>   20191210130219.27919-1-tiwai@suse.de
> 
>  sound/core/pcm_native.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 1fe581167b7b..d083225344a0 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -739,6 +739,10 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
>  	while (runtime->boundary * 2 <= LONG_MAX - runtime->buffer_size)
>  		runtime->boundary *= 2;
>  
> +	/* clear the buffer for avoiding possible kernel info leaks */
> +	if (runtime->dma_area && !substream->ops->copy_user)
> +		memset(runtime->dma_area, 0, runtime->dma_bytes);
> +
>  	snd_pcm_timer_resolution_change(substream);
>  	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
>  
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
